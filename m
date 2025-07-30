Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AD3C87FD4
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.33473.1753876436695492286
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 444BA2573;
	Wed, 30 Jul 2025 04:53:48 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53AC73F66E;
	Wed, 30 Jul 2025 04:53:55 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 06/13] arm/uefi_capsule: Switch Capsule generation tool from U-Boot to EDK2
Date: Wed, 30 Jul 2025 12:53:20 +0100
Message-Id: <20250730115327.3671160-7-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6643

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

This commit updates the uefi_capsule.bbclass to use the EDK2
GenerateCapsule tool instead of the mkeficapsule utility from U-Boot.

The switch was necessary because the mkeficapsule utility from U-Boot
does not support generating capsules with multiple payloads, whereas
the EDK2 GenerateCapsule tool provides native support for multi-image
capsule creation.

These changes allow building UEFI capsules with multiple firmware
binaries in one step, making the firmware update process
more flexible.

- Switching dependency from u-boot-tools-native to
  edk2-basetools-native
- Updating the actual capsule creation command to GenerateCapsule
  with the appropriate flags (including hardware instance, lowest
  supported version, and monotonic count)
    * CAPSULE_HARDWARE_INSTANCE defines which hardware instance
      the capsule update is intended for. This can be set
          to "1" or "0" indicating the first hardware module or SoC.
          For systems with multiple modules, subsequent instances
          could be numbered 2, 3, etc.
    * CAPSULE_LOWEST_SUPPORTED_VERSION enables roll-back protection
      by specifying the minimum firmware version that the platform
      accepts. Any firmware update below this version will be
      rejected.It should be set 0, 1, 2, etc according to your
      firmware security and versioning requirements.
- Combining certificates into the private key file as required
  by GenerateCapsule

- Add support for multiple firmware payloads
  This update refactors the capsule generation process to support
  multiple firmware binaries instead of a single payload.
  Key changes include:

- Integration of a JSON generator script to define multiple payloads
- Add default path for JSON config generator and prepare
  test infrastructure.
- Introduction of new variables
    * CAPSULE_ALL_COMPONENTS:  of all available components
    to be included in the capsule generation process.
    * CAPSULE_SELECTED_COMPONENTS: Subset of components from
    CAPSULE_ALL_COMPONENTS that should actually be included
    in the final capsule image.
- Replacement of direct GenerateCapsule arguments with JSON input
- Allow passing custom arguments to GenerateCapsule via
  `CAPSULE_EXTRA_ARGS` variable
- Cleanup of temporary files used in the capsule generation process

These changes align with EDK2's flexible capsule format and enable
component level filtering for more advanced firmware update scenarios.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 meta-arm/classes/uefi_capsule.bbclass         |  93 +++++++++---
 meta-arm/conf/layer.conf                      |   3 +
 .../scripts/generate_capsule_json_multiple.py | 142 ++++++++++++++++++
 3 files changed, 213 insertions(+), 25 deletions(-)
 create mode 100644 meta-arm/scripts/generate_capsule_json_multiple.py

diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uef=
i_capsule.bbclass
index a0709c0f..9d98959d 100644
--- a/meta-arm/classes/uefi_capsule.bbclass
+++ b/meta-arm/classes/uefi_capsule.bbclass
@@ -1,51 +1,94 @@
 # This class generates UEFI capsules
-# The current class supports generating a capsule with single firmware b=
inary
+# The current class supports generating a capsule with multiple firmware=
 binaries
=20
 IMAGE_TYPES +=3D "uefi_capsule"
=20
-# u-boot-tools should be installed in the native sysroot directory
-do_image_uefi_capsule[depends] +=3D "u-boot-tools-native:do_populate_sys=
root"
+# edk2-basetools should be installed in the native sysroot directory
+do_image_uefi_capsule[depends] +=3D "edk2-basetools-native:do_populate_s=
ysroot"
=20
 # By default the wic image is used to create a capsule
 CAPSULE_IMGTYPE ?=3D "wic"
=20
 # IMGDEPLOYDIR is used as the default location of firmware binary for wh=
ich the capsule needs to be created
-CAPSULE_IMGLOCATION ?=3D "${IMGDEPLOYDIR}"
+CAPSULE_IMG_LOCATION ?=3D "${IMGDEPLOYDIR}"
=20
 # The generated capsule by default has uefi.capsule extension
 CAPSULE_EXTENSION ?=3D "uefi.capsule"
=20
 # The generated capsule's name by default is the same as UEFI_FIRMWARE_B=
INARY
-CAPSULE_NAME ?=3D "${UEFI_FIRMWARE_BINARY}"
+CAPSULE_NAME ??=3D "${UEFI_FIRMWARE_BINARY}"
+
+# The generated capsule configuration file extension
+CAPSULE_CONFIG_FILE_EXTENSION ?=3D "json"
+
+# The generated capsule configuration file
+CAPSULE_CONFIG_FILE ?=3D "${IMGDEPLOYDIR}/${CAPSULE_NAME}.${CAPSULE_CONF=
IG_FILE_EXTENSION}"
+
+# Path to the script that generates the UEFI capsule payloads JSON
+UEFI_CAPSULE_CONFIG_GENERATOR_SCRIPT ?=3D "${META_ARM_LAYER_DIR}/scripts=
/generate_capsule_json_multiple.py"
+
+# Additional variables for capsule component filtering
+CAPSULE_ALL_COMPONENTS ?=3D ""
+CAPSULE_SELECTED_COMPONENTS ??=3D ""
+
+# Variables required by the EDK2 GenerateCapsule tool.
+CAPSULE_CERTIFICATE_PATHS ?=3D ""
+CAPSULE_FW_VERSIONS ?=3D ""
+CAPSULE_GUIDS ?=3D ""
+CAPSULE_INDEXES ?=3D ""
+CAPSULE_HARDWARE_INSTANCES ?=3D ""
+CAPSULE_LOWEST_SUPPORTED_VERSIONS ?=3D ""
+CAPSULE_MONOTONIC_COUNTS ?=3D ""
+CAPSULE_PRIVATE_KEY_PATHS ?=3D ""
+UEFI_FIRMWARE_BINARIES ?=3D ""
+PAYLOAD_CERTIFICATE_PATH ?=3D ""
+PAYLOAD_PRIVATE_KEY_PATH ?=3D ""
=20
-# The following variables must be set to be able to generate a capsule u=
pdate
-CAPSULE_CERTIFICATE_PATH ?=3D ""
-CAPSULE_FW_VERSION ?=3D ""
-CAPSULE_GUID ?=3D ""
-CAPSULE_INDEX ?=3D ""
-CAPSULE_MONOTONIC_COUNT ?=3D ""
-CAPSULE_PRIVATE_KEY_PATH ?=3D ""
-UEFI_FIRMWARE_BINARY ?=3D ""
=20
 # Check if the required variables are set
 python() {
-    for var in ["CAPSULE_CERTIFICATE_PATH", "CAPSULE_FW_VERSION", \
-                "CAPSULE_GUID", "CAPSULE_INDEX", \
-                "CAPSULE_MONOTONIC_COUNT", "CAPSULE_PRIVATE_KEY_PATH", \
-                "UEFI_FIRMWARE_BINARY"]:
+    for var in ["CAPSULE_CERTIFICATE_PATHS", "CAPSULE_FW_VERSIONS", \
+                "CAPSULE_GUIDS", "CAPSULE_INDEXES", \
+                "CAPSULE_HARDWARE_INSTANCES", \
+                "CAPSULE_LOWEST_SUPPORTED_VERSIONS", \
+                "CAPSULE_MONOTONIC_COUNTS", "CAPSULE_PRIVATE_KEY_PATHS",=
 \
+                "UEFI_FIRMWARE_BINARIES", \
+                "UEFI_CAPSULE_CONFIG_GENERATOR_SCRIPT", \
+                "CAPSULE_ALL_COMPONENTS", \
+                "CAPSULE_SELECTED_COMPONENTS", \
+                "PAYLOAD_CERTIFICATE_PATH", \
+                "PAYLOAD_PRIVATE_KEY_PATH"]:
         if not d.getVar(var):
             raise bb.parse.SkipRecipe(f"{var} not set")
 }
=20
 IMAGE_CMD:uefi_capsule(){
-    mkeficapsule --certificate ${CAPSULE_CERTIFICATE_PATH} \
-                 --fw-version ${CAPSULE_FW_VERSION} \
-                 --guid ${CAPSULE_GUID} \
-                 --index ${CAPSULE_INDEX} \
-                 --monotonic-count ${CAPSULE_MONOTONIC_COUNT} \
-                 --private-key ${CAPSULE_PRIVATE_KEY_PATH} \
-                 ${UEFI_FIRMWARE_BINARY} \
-                 ${CAPSULE_IMGLOCATION}/${CAPSULE_NAME}.${CAPSULE_EXTENS=
ION}
+    # Generates the UEFI capsule payloads JSON
+    ${PYTHON} ${UEFI_CAPSULE_CONFIG_GENERATOR_SCRIPT} \
+             --selected_components ${CAPSULE_SELECTED_COMPONENTS}\
+             --components ${CAPSULE_ALL_COMPONENTS}\
+             --fw_versions ${CAPSULE_FW_VERSIONS} \
+             --guids ${CAPSULE_GUIDS} \
+             --hardware_instances ${CAPSULE_HARDWARE_INSTANCES} \
+             --lowest_supported_versions ${CAPSULE_LOWEST_SUPPORTED_VERS=
IONS} \
+             --monotonic_counts ${CAPSULE_MONOTONIC_COUNTS} \
+             --payloads ${UEFI_FIRMWARE_BINARIES} \
+             --update_image_indexes ${CAPSULE_INDEXES} \
+             --private_keys ${CAPSULE_PRIVATE_KEY_PATHS} \
+             --certificates ${CAPSULE_CERTIFICATE_PATHS} \
+             --output ${CAPSULE_CONFIG_FILE}
+
+    # Force the GenerateCapsule script to use python3
+    export PYTHON_COMMAND=3D${PYTHON}
+
+    # Append the certificate to the private key to create a PEM bundle c=
ompatible with EDK2 tools
+    cat ${PAYLOAD_CERTIFICATE_PATH} >> ${PAYLOAD_PRIVATE_KEY_PATH}
+
+    # Generate the UEFI capsule image using the EDK2 GenerateCapsule too=
l
+    ${STAGING_BINDIR_NATIVE}/edk2-BaseTools/BinWrappers/PosixLike/Genera=
teCapsule \
+             -e -j ${CAPSULE_CONFIG_FILE} \
+             ${CAPSULE_EXTRA_ARGS} \
+             -o ${CAPSULE_IMG_LOCATION}/${CAPSULE_NAME}.${CAPSULE_EXTENS=
ION}
 }
=20
 # The firmware binary should be created before generating the capsule
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 753f5259..8f7e1a43 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -21,3 +21,6 @@ HOSTTOOLS_NONFATAL +=3D "telnet"
 addpylib ${LAYERDIR}/lib oeqa
=20
 WARN_QA:append:layer-meta-arm =3D " patch-status"
+
+# Define base directory for meta-arm
+META_ARM_LAYER_DIR :=3D "${LAYERDIR}"
diff --git a/meta-arm/scripts/generate_capsule_json_multiple.py b/meta-ar=
m/scripts/generate_capsule_json_multiple.py
new file mode 100644
index 00000000..13425748
--- /dev/null
+++ b/meta-arm/scripts/generate_capsule_json_multiple.py
@@ -0,0 +1,142 @@
+# SPDX-FileCopyrightText: <text>Copyright 2025 Arm Limited and/or its
+# affiliates <open-source-office@arm.com></text>
+#
+# SPDX-License-Identifier: MIT
+
+"""
+Capsule Payload JSON Generator
+
+This script creates a JSON file that defines multiple capsule payloads.
+Each payload is constructed using command-line input and includes key
+metadata like firmware version, GUID, hardware instance, and more.
+
+Usage:
+    python generate_capsule_json_multiple.py \
+        --fw_versions 1 1 2 \
+        --guids guid1 guid2 guid3 \
+        --hardware_instances 1 1 1 \
+        --lowest_supported_versions 0 0 0 \
+        --monotonic_counts 1 1 1 \
+        --payloads bl2.bin initramfs.bin tfm_s.bin \
+        --update_image_indexes 1 4 2 \
+        --private_keys key.key key.key key.key \
+        --certificates cert.crt cert.crt cert.crt \
+        --components bl2 initramfs tfm_s \
+        --selected_components bl2 \
+        --output capsule_generation_config.json
+"""
+
+import json
+import argparse
+from typing import List
+
+
+def parse_arguments() -> argparse.Namespace:
+    """Parses command-line arguments."""
+    parser =3D argparse.ArgumentParser(
+        description=3D"Generate a JSON file for multiple Capsule Payload=
s."
+    )
+
+    parser.add_argument(
+        "--selected_components", default=3D[], nargs=3D"*", required=3DF=
alse,
+        help=3D(
+            "Filters the payloads to include only those for the selected=
 "
+            "components (e.g., bl2, initramfs)."
+            "All components are included when not specified."
+        )
+    )
+
+    parser.add_argument(
+        "--output", default=3D"capsule_payloads.json", help=3D"Output JS=
ON file name"
+    )
+
+    # Required arguments for each payload entry
+    required_args =3D {
+        "components": "List of components",
+        "fw_versions": "List of firmware versions",
+        "guids": "List of GUIDs",
+        "hardware_instances": "List of hardware instances",
+        "lowest_supported_versions": "List of lowest supported firmware =
versions",
+        "monotonic_counts": "List of monotonic counts",
+        "payloads": "List of payload file paths",
+        "update_image_indexes": "List of update image indexes",
+        "private_keys": "List of private key file paths",
+        "certificates": "List of certificate file paths",
+    }
+
+    for arg, desc in required_args.items():
+        parser.add_argument(f"--{arg}", nargs=3D"+", required=3DTrue, he=
lp=3Ddesc)
+
+    return parser.parse_args()
+
+
+def validate_input_lengths(args: argparse.Namespace) -> None:
+    """Ensures all required input lists have the same length (excluding =
output and selected_components)."""
+    list_lengths =3D {
+        attr: len(getattr(args, attr))
+        for attr in vars(args)
+        if attr not in {"output", "selected_components"}  # Ignore optio=
nal fields
+    }
+
+    for attr, length in list_lengths.items():
+        if length =3D=3D 0:
+            raise ValueError(f"Input list '{attr}' cannot be empty!")
+
+    if len(set(list_lengths.values())) !=3D 1:
+        raise ValueError("All input lists must have the same length!")
+
+def create_payloads(args: argparse.Namespace) -> List[dict]:
+    """Generates the list of payload dictionaries to include in the fina=
l JSON."""
+    num_payloads =3D len(args.components)
+    selected_payloads =3D []
+
+    for i in range(num_payloads):
+
+        # If filtering is enabled, skip if not in the allowed components=
 list
+        if  args.components[i] not in args.selected_components:
+            continue
+
+        payload =3D {
+            "Component": args.components[i],
+            "FwVersion": args.fw_versions[i],
+            "Guid": args.guids[i],
+            "HardwareInstance": args.hardware_instances[i],
+            "LowestSupportedVersion": args.lowest_supported_versions[i],
+            "MonotonicCount": args.monotonic_counts[i],
+            "Payload": args.payloads[i],
+            "UpdateImageIndex": args.update_image_indexes[i],
+            "OpenSslSignerPrivateCertFile": args.private_keys[i],
+            "OpenSslTrustedPublicCertFile": args.certificates[i],
+            "OpenSslOtherPublicCertFile": args.certificates[i],
+        }
+
+        selected_payloads.append(payload)
+
+    if not selected_payloads:
+        raise ValueError("None of the provided components match the sele=
cted_components list!")
+
+    return selected_payloads
+
+
+def write_json_file(output_path: str, payloads: List[dict]) -> None:
+    """Writes the list of payloads to a JSON file with basic error handl=
ing."""
+    try:
+        with open(output_path, "w", encoding=3D"utf-8") as file:
+            json.dump({"Payloads": payloads}, file, indent=3D4)
+        print(f"JSON file created: {output_path}")
+    except (OSError) as e:
+        print(f"Failed to write JSON file to {output_path}: {e}")
+    except TypeError as e:
+        print(f"Invalid data format in payloads: {e}")
+
+
+def main() -> None:
+    """Main script entry point."""
+    args =3D parse_arguments()
+    validate_input_lengths(args)
+    payloads =3D create_payloads(args)
+    write_json_file(args.output, payloads)
+
+
+if __name__ =3D=3D "__main__":
+    main()

