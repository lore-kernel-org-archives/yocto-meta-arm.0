Return-Path: <tudor.cretu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17795C433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 10:48:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10061.1636022896176652314
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Nov 2021 03:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: tudor.cretu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7C341063;
	Thu,  4 Nov 2021 03:48:14 -0700 (PDT)
Received: from tc-wfh-tudcre01.stack02.eu01.mi.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21A943F7B4;
	Thu,  4 Nov 2021 03:48:14 -0700 (PDT)
From: Tudor Cretu <tudor.cretu@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Tudor Cretu <tudor.cretu@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-a: Add FWU support for TC
Date: Thu,  4 Nov 2021 10:48:11 +0000
Message-Id: <20211104104811.26988-1-tudor.cretu@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Nov 2021 10:48:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2338

Add recipe to generate GPT with FIP and metadata.
Add Python script to generate the FWU metadata.

Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
Change-Id: Icfe3d1491442af17aa5300d8ff8654ac65ae30aa
---
 ...01-plat-tc-Increase-maximum-BL2-size.patch | 34 +++++++
 .../files/generate_metadata.py                | 63 +++++++++++++
 .../trusted-firmware-a-tc.inc                 | 91 ++++++++++++++++++-
 3 files changed, 186 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-plat-tc-Increase-maximum-BL2-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/generate_metadata.py

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-plat-tc-Increase-maximum-BL2-size.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-plat-tc-Increase-maximum-BL2-size.patch
new file mode 100644
index 0000000..22d3257
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-plat-tc-Increase-maximum-BL2-size.patch
@@ -0,0 +1,34 @@
+From 923deccc1de17b05826143e476b840253bb2bb7b Mon Sep 17 00:00:00 2001
+From: Tudor Cretu <tudor.cretu@arm.com>
+Date: Fri, 21 May 2021 14:56:37 +0000
+Subject: [PATCH] plat: tc: Increase maximum BL2 size.
+
+BL2 size gets increased due to the firmware update changes.
+Increase the MAX_BL2_SIZE by 8Kb.
+
+Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
+Change-Id: I1cb28b0eb7f834426873ff9f4c40bd496413806f
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ plat/arm/board/tc/include/platform_def.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plat/arm/board/tc/include/platform_def.h b/plat/arm/board/tc/include/platform_def.h
+index ccabced9e..f45457b9f 100644
+--- a/plat/arm/board/tc/include/platform_def.h
++++ b/plat/arm/board/tc/include/platform_def.h
+@@ -120,9 +120,9 @@
+  * little space for growth.
+  */
+ #if TRUSTED_BOARD_BOOT
+-# define PLAT_ARM_MAX_BL2_SIZE		0x20000
++# define PLAT_ARM_MAX_BL2_SIZE		0x22000
+ #else
+-# define PLAT_ARM_MAX_BL2_SIZE		0x14000
++# define PLAT_ARM_MAX_BL2_SIZE		0x16000
+ #endif
+ 
+ /*
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/generate_metadata.py b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/generate_metadata.py
new file mode 100644
index 0000000..f3670ce
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/generate_metadata.py
@@ -0,0 +1,63 @@
+#!/usr/bin/env python3
+# Copyright (c) 2021, Arm Limited. All rights reserved.
+#
+# SPDX-License-Identifier: BSD-3-Clause
+
+import argparse
+import uuid
+import zlib
+
+def main(metadata_file, img_type_uuids, location_uuids, img_uuids):
+    def add_field_to_metadata(value):
+        # Write the integer values to file in little endian representation
+        with open(metadata_file, "ab") as fp:
+            fp.write(value.to_bytes(4, byteorder='little'))
+
+    def add_uuid_to_metadata(uuid_str):
+        # Validate UUID string and write to file in little endian representation
+        uuid_val = uuid.UUID(uuid_str)
+        with open(metadata_file, "ab") as fp:
+            fp.write(uuid_val.bytes_le)
+
+    # Fill metadata preamble
+    add_field_to_metadata(1) #version=1
+    add_field_to_metadata(0) #active_index=0
+    add_field_to_metadata(0) #previous_active_index=0
+
+    for img_type_uuid, location_uuid in zip(img_type_uuids, location_uuids):
+        # Fill metadata image entry
+        add_uuid_to_metadata(img_type_uuid) # img_type_uuid
+        add_uuid_to_metadata(location_uuid) # location_uuid
+
+        for img_uuid in img_uuids:
+            # Fill metadata bank image info
+            add_uuid_to_metadata(img_uuid) # image unique bank_uuid
+            add_field_to_metadata(1)       # accepted=1
+            add_field_to_metadata(0)       # reserved (MBZ)
+
+    # Prepend CRC32
+    with open(metadata_file, 'rb+') as fp:
+        content = fp.read()
+        crc = zlib.crc32(content)
+        fp.seek(0)
+        fp.write(crc.to_bytes(4, byteorder='little') + content)
+
+if __name__ == "__main__":
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--metadata_file', required=True,
+                        help='Output binary file to store the metadata')
+    parser.add_argument('--img_type_uuids', type=str, nargs='+', required=True,
+                        help='A list of UUIDs identifying the image types')
+    parser.add_argument('--location_uuids', type=str, nargs='+', required=True,
+                        help='A list of UUIDs of the storage volumes where the images are located. '
+                             'Must have the same length as img_type_uuids.')
+    parser.add_argument('--img_uuids', type=str, nargs='+', required=True,
+                        help='A list UUIDs of the images in a firmware bank')
+
+    args = parser.parse_args()
+
+    if len(args.img_type_uuids) != len(args.location_uuids):
+        parser.print_help()
+        raise argparse.ArgumentError(None, 'Arguments img_type_uuids and location_uuids must have the same length.')
+
+    main(args.metadata_file, args.img_type_uuids, args.location_uuids, args.img_uuids)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
index 298eef3..1074d14 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
@@ -1,11 +1,16 @@
 # TC0 specific TFA configuration
 
 # Intermediate SHA with 2.5 baseline version
-SRCREV_tfa = "ae5cfc5fe01e2629ff3663a42fb2c585b4d3e7cc"
+SRCREV_tfa = "34a87d74d9fbbe8037431ea5101110a9f1cf30e1"
 PV = "2.5+git${SRCPV}"
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
 
-DEPENDS += "scp-firmware"
+DEPENDS += "scp-firmware util-linux-native gptfdisk-native"
+
+SRC_URI:append = " \
+    file://0001-plat-tc-Increase-maximum-BL2-size.patch \
+    file://generate_metadata.py \
+    "
 
 COMPATIBLE_MACHINE = "(tc?)"
 
@@ -33,3 +38,85 @@ TFA_ARM_SPMC_MANIFEST_DTS = "plat/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dt
 EXTRA_OEMAKE += "SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
 EXTRA_OEMAKE += "TRUSTED_BOARD_BOOT=1 GENERATE_COT=1 ARM_ROTPK_LOCATION=devel_rsa \
                      ROT_KEY=plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
+EXTRA_OEMAKE += "PSA_FWU_SUPPORT=1 ARM_GPT_SUPPORT=1"
+
+do_generate_gpt() {
+    gpt_image="${BUILD_DIR}/fip_gpt.bin"
+    fip_bin="${BUILD_DIR}/fip.bin"
+    # the FIP partition type is not standardized, so generate one
+    fip_type_uuid=`uuidgen --sha1 --namespace @dns --name "fip_type_uuid"`
+    # metadata partition type UUID, specified by the document:
+    # Platform Security Firmware Update for the A-profile Arm Architecture
+    # version: 1.0BET0
+    metadata_type_uuid="8a7a84a0-8387-40f6-ab41-a8b9a5a60d23"
+    location_uuid=`uuidgen`
+    FIP_A_uuid=`uuidgen`
+    FIP_B_uuid=`uuidgen`
+
+    # maximum FIP size 4MB. This is the current size of the FIP rounded up to an integer number of MB.
+    fip_max_size=4194304
+    fip_bin_size=$(stat -c %s $fip_bin)
+    if [ $fip_max_size -lt $fip_bin_size ]; then
+        bberror "FIP binary ($fip_bin_size bytes) is larger than the GPT partition ($fip_max_size bytes)"
+    fi
+
+    # maximum metadata size 512B. This is the current size of the metadata rounded up to an integer number of sectors.
+    metadata_max_size=512
+    metadata_file="${BUILD_DIR}/metadata.bin"
+    python3 ${WORKDIR}/generate_metadata.py --metadata_file $metadata_file \
+                                            --img_type_uuids $fip_type_uuid \
+                                            --location_uuids $location_uuid \
+                                            --img_uuids $FIP_A_uuid $FIP_B_uuid
+
+    # create GPT image. The GPT contains 2 FIP partitions: FIP_A and FIP_B, and 2 metadata partitions: FWU-Metadata and Bkup-FWU-Metadata.
+    # the GPT layout is the following:
+    # -----------------------
+    # Protective MBR
+    # -----------------------
+    # Primary GPT Header
+    # -----------------------
+    # FIP_A
+    # -----------------------
+    # FIP_B
+    # -----------------------
+    # FWU-Metadata
+    # -----------------------
+    # Bkup-FWU-Metadata
+    # -----------------------
+    # Secondary GPT Header
+    # -----------------------
+
+    sector_size=512
+    gpt_header_size=33 # valid only for 512-byte sectors
+    num_sectors_fip=`expr $fip_max_size / $sector_size`
+    num_sectors_metadata=`expr $metadata_max_size / $sector_size`
+    start_sector_1=`expr 1 + $gpt_header_size` # size of MBR is 1 sector
+    start_sector_2=`expr $start_sector_1 + $num_sectors_fip`
+    start_sector_3=`expr $start_sector_2 + $num_sectors_fip`
+    start_sector_4=`expr $start_sector_3 + $num_sectors_metadata`
+    num_sectors_gpt=`expr $start_sector_4 + $num_sectors_metadata + $gpt_header_size`
+    gpt_size=`expr $num_sectors_gpt \* $sector_size`
+
+    # create raw image
+    dd if=/dev/zero of=$gpt_image bs=$gpt_size count=1
+
+    # create the GPT layout
+    sgdisk -a 1 -U $location_uuid \
+           -n 1:$start_sector_1:+$num_sectors_fip -c 1:FIP_A -t 1:$fip_type_uuid -u 1:$FIP_A_uuid \
+           -n 2:$start_sector_2:+$num_sectors_fip -c 2:FIP_B -t 2:$fip_type_uuid -u 2:$FIP_B_uuid \
+           -n 3:$start_sector_3:+$num_sectors_metadata -c 3:FWU-Metadata -t 3:$metadata_type_uuid \
+           -n 4:$start_sector_4:+$num_sectors_metadata -c 4:Bkup-FWU-Metadata -t 4:$metadata_type_uuid $gpt_image
+
+    # populate the GPT partitions
+    dd if=$fip_bin of=$gpt_image bs=$sector_size seek=$start_sector_1 count=$num_sectors_fip conv=notrunc
+    dd if=$fip_bin of=$gpt_image bs=$sector_size seek=$start_sector_2 count=$num_sectors_fip conv=notrunc
+    dd if=$metadata_file of=$gpt_image bs=$sector_size seek=$start_sector_3 count=$num_sectors_metadata conv=notrunc
+    dd if=$metadata_file of=$gpt_image bs=$sector_size seek=$start_sector_4 count=$num_sectors_metadata conv=notrunc
+}
+
+addtask do_generate_gpt after do_compile before do_install
+
+do_install:append() {
+    install -m 0644 ${BUILD_DIR}/fip_gpt.bin ${D}/firmware/fip_gpt-tc.bin
+    ln -sf fip_gpt-tc.bin ${D}/firmware/fip_gpt.bin
+}
-- 
2.17.1


