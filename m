Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D96EC41513
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:30:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20464.1714494611432743043
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C5F52F4;
	Tue, 30 Apr 2024 09:30:37 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.29.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E6F33F73F;
	Tue, 30 Apr 2024 09:30:10 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 4/6] arm-bsp: corstone1000: Make ESP partition available to Corstone-1000
Date: Tue, 30 Apr 2024 17:29:55 +0100
Message-Id: <20240430162957.94499-5-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430162957.94499-1-emekcan.aras@arm.com>
References: <20240430162957.94499-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5669

From: Drew Reed <Drew.Reed@arm.com>

The SystemReady IR ACS test suite require that there is a valid ESP
partition available to the system.  This change creates a new image that
only contains a ESP partition and ensures it's mounted on the second MMC
card so it's available when the SystemReady tests run.
The diagnostic level of the 2 MMC cards have also been lowered to
improve the ACS test duration.
Corrected a spelling mistake in the corstone1000-flash-firmware-image.bb
file.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 .../conf/machine/corstone1000-fvp.conf        |  5 ++--
 .../conf/machine/include/corstone1000.inc     |  4 ++-
 .../images/corstone1000-esp-image.bb          | 25 +++++++++++++++++++
 .../corstone1000-flash-firmware-image.bb      |  2 +-
 meta-arm-bsp/wic/efi-disk-esp-only.wks.in     |  9 +++++++
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in      |  4 +--
 6 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-esp-imag=
e.bb
 create mode 100644 meta-arm-bsp/wic/efi-disk-esp-only.wks.in

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index c567058c..2c724bfe 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -52,7 +52,7 @@ FVP_TERMINALS[extsys0.extsys_terminal] ?=3D "Cortex M3"
 # MMC card configuration
 FVP_CONFIG[board.msd_mmc.card_type] ?=3D "SDHC"
 FVP_CONFIG[board.msd_mmc.p_fast_access] ?=3D "0"
-FVP_CONFIG[board.msd_mmc.diagnostics] ?=3D "2"
+FVP_CONFIG[board.msd_mmc.diagnostics] ?=3D "0"
 FVP_CONFIG[board.msd_mmc.p_max_block_count] ?=3D "0xFFFF"
 FVP_CONFIG[board.msd_config.pl180_fifo_depth] ?=3D "16"
 FVP_CONFIG[board.msd_mmc.support_unpadded_images] ?=3D "true"
@@ -61,10 +61,11 @@ FVP_CONFIG[board.msd_mmc.p_mmc_file] ?=3D "${IMAGE_NA=
ME}.wic"
 # MMC2 card configuration
 FVP_CONFIG[board.msd_mmc_2.card_type] ?=3D "SDHC"
 FVP_CONFIG[board.msd_mmc_2.p_fast_access] ?=3D "0"
-FVP_CONFIG[board.msd_mmc_2.diagnostics] ?=3D "2"
+FVP_CONFIG[board.msd_mmc_2.diagnostics] ?=3D "0"
 FVP_CONFIG[board.msd_mmc_2.p_max_block_count] ?=3D "0xFFFF"
 FVP_CONFIG[board.msd_config_2.pl180_fifo_depth] ?=3D "16"
 FVP_CONFIG[board.msd_mmc_2.support_unpadded_images] ?=3D "true"
+FVP_CONFIG[board.msd_mmc_2.p_mmc_file] ?=3D "corstone1000-esp-image-${MA=
CHINE}.wic"
=20
 # Virtio-Net configuration
 FVP_CONFIG[board.virtio_net.enabled] ?=3D "1"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 3b8dcb79..c78cc061 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -59,5 +59,7 @@ FIRMWARE_DEPLOYMENT ?=3D "firmware-deploy-image"
 FIRMWARE_DEPLOYMENT:firmware ?=3D ""
 EXTRA_IMAGEDEPENDS +=3D "${FIRMWARE_DEPLOYMENT}"
=20
-ARM_SYSTEMREADY_FIRMWARE =3D "${FIRMWARE_DEPLOYMENT}:do_deploy"
+ARM_SYSTEMREADY_FIRMWARE =3D "${FIRMWARE_DEPLOYMENT}:do_deploy \
+                            corstone1000-esp-image:do_image_complete \
+                           "
 ARM_SYSTEMREADY_ACS_CONSOLE ?=3D "default"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-esp-image.bb b/=
meta-arm-bsp/recipes-bsp/images/corstone1000-esp-image.bb
new file mode 100644
index 00000000..bd1a206a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-esp-image.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "Corstone1000 platform esp Image"
+DESCRIPTION =3D "This builds a simple image file that only contains an e=
sp \
+               partition for use when running the SystemReady IR ACS tes=
ts."
+LICENSE =3D "MIT"
+
+COMPATIBLE_MACHINE =3D "corstone1000"
+
+# IMAGE_FSTYPES must be set before 'inherit image'
+# https://docs.yoctoproject.org/ref-manual/variables.html#term-IMAGE_FST=
YPES
+IMAGE_FSTYPES =3D "wic"
+
+inherit image
+
+IMAGE_FEATURES =3D ""
+IMAGE_LINGUAS =3D ""
+
+PACKAGE_INSTALL =3D ""
+
+# This builds a very specific image so we can ignore any customization
+WKS_FILE =3D "efi-disk-esp-only.wks.in"
+WKS_FILE:firmware =3D "efi-disk-esp-only.wks.in"
+
+EXTRA_IMAGEDEPENDS =3D ""
+# Don't write an fvp configuration file for this image as it can't run
+IMAGE_POSTPROCESS_COMMAND:remove =3D "do_write_fvpboot_conf;"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-=
image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-im=
age.bb
index 73fc1766..fee640a8 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
@@ -1,4 +1,4 @@
-SUMARY =3D "Corstone1000 platform Image"
+SUMMARY =3D "Corstone1000 platform Image"
 DESCRIPTION =3D "This is the main image which is the container of all th=
e binaries \
                generated for the Corstone1000 platform."
 LICENSE =3D "MIT"
diff --git a/meta-arm-bsp/wic/efi-disk-esp-only.wks.in b/meta-arm-bsp/wic=
/efi-disk-esp-only.wks.in
new file mode 100644
index 00000000..739cc5a4
--- /dev/null
+++ b/meta-arm-bsp/wic/efi-disk-esp-only.wks.in
@@ -0,0 +1,9 @@
+# short-description: Create an EFI disk image with only an ESP partition
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media.  This image only contains an ESP
+# partition that can be used by the SystemReady ACS test to store
+# EFI data and process capsule updates.
+
+part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --label boot --active --align 1024 --use-uuid --part-name=3D"ESP" --p=
art-type=3DC12A7328-F81F-11D2-BA4B-00A0C93EC93B --fixed-size 256M
+
+bootloader --ptable gpt --timeout=3D1 --append=3D"${GRUB_LINUX_APPEND}"
diff --git a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in b/meta-arm-bsp/wic/=
efi-disk-no-swap.wks.in
index 61902dfd..6ae7ad9d 100644
--- a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
+++ b/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
@@ -3,8 +3,8 @@
 # can directly dd to boot media.  This image will not contain a swap
 # partition but will contain custom machine specific grub arguments.
=20
-part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --label boot --active --align 1024 --use-uuid
+part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --label boot --active --align 1024 --use-uuid --part-name=3D"ESP" --p=
art-type=3DC12A7328-F81F-11D2-BA4B-00A0C93EC93B --fixed-size 256M
=20
-part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
+part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid --exclude-path boot/
=20
 bootloader --ptable gpt --timeout=3D1 --append=3D"${GRUB_LINUX_APPEND}"
--=20
2.25.1


