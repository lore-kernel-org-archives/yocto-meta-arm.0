Return-Path: <gianluca.andreotti@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960AAC79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11052.1788957751844566725
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 05:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=d6xJReY1;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gianluca.andreotti@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C9621576;
	Wed,  9 Sep 2026 05:42:27 -0700 (PDT)
Received: from e142472.cambridge.arm.com (e142472.arm.com [10.2.210.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBE823F7B4;
	Wed,  9 Sep 2026 05:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788957751; bh=JPUGY9ebivKRnU4Cev4TYw1BperexqZfwcq5z7hNml0=;
	h=From:To:Cc:Subject:Date:From;
	b=d6xJReY14GTIjf5sCun89odkUEBE77Da8BJG8/XnyVDa83OZwwfrsyQsECSEqvz0Q
	 JijRe/1l3ToV48b/SI6nJf7hq7q3k/yH1jt/4Q5s1mU0pJBZyiR9xFlS0B+xQVIDdp
	 wnOwnl5O8oVjgXE92PtNV9V5Nig8v2kt2eG2YfKs=
From: Gianluca Andreotti <gianluca.andreotti@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gianluca Andreotti <gianluca.andreotti@arm.com>
Subject: [PATCH] arm/uefi_capsule: Generate signing PEMs in WORKDIR
Date: Wed,  9 Sep 2026 13:42:09 +0100
Message-ID: <20260909124209.197731-1-gianluca.andreotti@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Sep 2026 12:42:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7161

GenerateCapsule expects a PEM that contains both the private key and the
matching certificate. The current capsule flow appends the certificate
to PAYLOAD_PRIVATE_KEY_PATH in place, which mutates the deployed key
file and adds another certificate block every time do_image_uefi_capsule
runs.

Prepare per-component signing PEMs under WORKDIR instead and pass those
files to the capsule JSON generator. This keeps the configured private
key unchanged, makes repeated capsule builds idempotent, and provides
GenerateCapsule with the combined key and certificate input it requires.

Rename the helper's primary signing input from --private_keys to
--signing_pems to reflect the actual input format, while keeping
--private_keys as a compatibility alias.

Generating the signing PEMs per component also allows each capsule
payload to use its own private key and matching certificate instead of
relying on a single mutated key file.

Use expr for the signing PEM counter because the BitBake shell parser
does not support arithmetic expansion.

Signed-off-by: Gianluca Andreotti <gianluca.andreotti@arm.com>
---
 meta-arm/classes/uefi_capsule.bbclass         | 36 +++++++++++++++----
 .../scripts/generate_capsule_json_multiple.py | 18 +++++++---
 2 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uef=
i_capsule.bbclass
index 9d98959d..c353c691 100644
--- a/meta-arm/classes/uefi_capsule.bbclass
+++ b/meta-arm/classes/uefi_capsule.bbclass
@@ -55,14 +55,39 @@ python() {
                 "UEFI_FIRMWARE_BINARIES", \
                 "UEFI_CAPSULE_CONFIG_GENERATOR_SCRIPT", \
                 "CAPSULE_ALL_COMPONENTS", \
-                "CAPSULE_SELECTED_COMPONENTS", \
-                "PAYLOAD_CERTIFICATE_PATH", \
-                "PAYLOAD_PRIVATE_KEY_PATH"]:
+                "CAPSULE_SELECTED_COMPONENTS"]:
         if not d.getVar(var):
             raise bb.parse.SkipRecipe(f"{var} not set")
 }
=20
 IMAGE_CMD:uefi_capsule(){
+    signing_pem_dir=3D"${WORKDIR}/uefi-capsule-signing-pems"
+    rm -rf "$signing_pem_dir"
+    install -d -m 0700 "$signing_pem_dir"
+
+    set -- ${CAPSULE_CERTIFICATE_PATHS}
+    signing_pem_paths=3D""
+    signing_pem_index=3D0
+    for private_key_path in ${CAPSULE_PRIVATE_KEY_PATHS}; do
+        if [ "$#" -eq 0 ]; then
+            bbfatal "CAPSULE_PRIVATE_KEY_PATHS has more entries than CAP=
SULE_CERTIFICATE_PATHS"
+        fi
+
+        certificate_path=3D"$1"
+        shift
+
+        signing_pem_path=3D"$signing_pem_dir/$signing_pem_index.pem"
+        install -m 0600 "$private_key_path" "$signing_pem_path"
+        cat "$certificate_path" >> "$signing_pem_path"
+
+        signing_pem_paths=3D"$signing_pem_paths $signing_pem_path"
+        signing_pem_index=3D"$(expr "$signing_pem_index" + 1)"
+    done
+
+    if [ "$#" -ne 0 ]; then
+        bbfatal "CAPSULE_CERTIFICATE_PATHS has more entries than CAPSULE=
_PRIVATE_KEY_PATHS"
+    fi
+
     # Generates the UEFI capsule payloads JSON
     ${PYTHON} ${UEFI_CAPSULE_CONFIG_GENERATOR_SCRIPT} \
              --selected_components ${CAPSULE_SELECTED_COMPONENTS}\
@@ -74,16 +99,13 @@ IMAGE_CMD:uefi_capsule(){
              --monotonic_counts ${CAPSULE_MONOTONIC_COUNTS} \
              --payloads ${UEFI_FIRMWARE_BINARIES} \
              --update_image_indexes ${CAPSULE_INDEXES} \
-             --private_keys ${CAPSULE_PRIVATE_KEY_PATHS} \
+             --signing_pems $signing_pem_paths \
              --certificates ${CAPSULE_CERTIFICATE_PATHS} \
              --output ${CAPSULE_CONFIG_FILE}
=20
     # Force the GenerateCapsule script to use python3
     export PYTHON_COMMAND=3D${PYTHON}
=20
-    # Append the certificate to the private key to create a PEM bundle c=
ompatible with EDK2 tools
-    cat ${PAYLOAD_CERTIFICATE_PATH} >> ${PAYLOAD_PRIVATE_KEY_PATH}
-
     # Generate the UEFI capsule image using the EDK2 GenerateCapsule too=
l
     ${STAGING_BINDIR_NATIVE}/edk2-BaseTools/BinWrappers/PosixLike/Genera=
teCapsule \
              -e -j ${CAPSULE_CONFIG_FILE} \
diff --git a/meta-arm/scripts/generate_capsule_json_multiple.py b/meta-ar=
m/scripts/generate_capsule_json_multiple.py
index 55c4b351..6c9d8798 100644
--- a/meta-arm/scripts/generate_capsule_json_multiple.py
+++ b/meta-arm/scripts/generate_capsule_json_multiple.py
@@ -1,4 +1,4 @@
-# SPDX-FileCopyrightText: <text>Copyright 2025 Arm Limited and/or its
+# SPDX-FileCopyrightText: <text>Copyright 2025-2026 Arm Limited and/or i=
ts
 # affiliates <open-source-office@arm.com></text>
 #
 # SPDX-License-Identifier: MIT
@@ -19,7 +19,7 @@ Usage:
         --monotonic_counts 1 1 1 \
         --payloads bl2.bin initramfs.bin tfm_s.bin \
         --update_image_indexes 1 4 2 \
-        --private_keys key.key key.key key.key \
+        --signing_pems signing.pem signing.pem signing.pem \
         --certificates cert.crt cert.crt cert.crt \
         --components bl2 initramfs tfm_s \
         --selected_components bl2 \
@@ -50,6 +50,17 @@ def parse_arguments() -> argparse.Namespace:
         "--output", default=3D"capsule_payloads.json", help=3D"Output JS=
ON file name"
     )
=20
+    parser.add_argument(
+        "--signing_pems", "--private_keys",
+        dest=3D"signing_pems",
+        nargs=3D"+",
+        required=3DTrue,
+        help=3D(
+            "List of signing PEM file paths (private key and certificate=
). "
+            "--private_keys is kept as a compatibility alias."
+        ),
+    )
+
     # Required arguments for each payload entry
     required_args =3D {
         "components": "List of components",
@@ -60,7 +71,6 @@ def parse_arguments() -> argparse.Namespace:
         "monotonic_counts": "List of monotonic counts",
         "payloads": "List of payload file paths",
         "update_image_indexes": "List of update image indexes",
-        "private_keys": "List of private key file paths",
         "certificates": "List of certificate file paths",
     }
=20
@@ -105,7 +115,7 @@ def create_payloads(args: argparse.Namespace) -> List=
[dict]:
             "MonotonicCount": args.monotonic_counts[i],
             "Payload": args.payloads[i],
             "UpdateImageIndex": args.update_image_indexes[i],
-            "OpenSslSignerPrivateCertFile": args.private_keys[i],
+            "OpenSslSignerPrivateCertFile": args.signing_pems[i],
             "OpenSslTrustedPublicCertFile": args.certificates[i],
             "OpenSslOtherPublicCertFile": args.certificates[i],
         }

