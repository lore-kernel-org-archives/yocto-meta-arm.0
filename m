Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6C2E81A36
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 15:30:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22128.1771255816630314851
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 07:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FADB1576;
	Mon, 16 Feb 2026 07:30:09 -0800 (PST)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 511023F632;
	Mon, 16 Feb 2026 07:30:15 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] arm-bsp/linux-yocto: corstone1000: Update to v6.18
Date: Mon, 16 Feb 2026 15:30:12 +0000
Message-ID: <20260216153012.82720-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 Feb 2026 15:30:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6911

* Set Linux kernel preferred version for Corstone-1000 to 6.18
* Update Corstone-1000 user guide.
* Recent kernel versions removed the deprecated CONFIG_LIBCRC32C
  Kconfig symbol as part of the CRC library cleanup.
  Replace CONFIG_LIBCRC32C with CONFIG_CRC32, which provides the
  generic CRC32/CRC32C library support used by in-kernel consumers.
* The ext3 driver was removed historically and ext4 carries
  compatibility for ext3 on-disk format.
* Amend External System patch to adhere to Kernel v6.18 RemoteProc
  API.
* Add #address-cells and #size-cells parameters to ethosu dts node

No functional change intended.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc            | 2 +-
 meta-arm-bsp/documentation/corstone1000/user-guide.rst        | 2 +-
 .../0039-corstone1000-Add-Cortex-A320-support-on-FVP.patch    | 4 +++-
 .../0001-remoteproc-Add-Arm-remoteproc-driver.patch           | 2 +-
 .../recipes-kernel/linux/files/corstone1000/defconfig         | 3 +--
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 470a6647..ebc8f7a6 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -37,7 +37,7 @@ IMAGE_CMD:wic[vardeps] +=3D "GRUB_LINUX_APPEND"
=20
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "6.12.%"
+PREFERRED_VERSION_linux-yocto ?=3D "6.18.%"
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_IMAGETYPE:firmware =3D "Image.gz"
 # add FF-A support in the kernel
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 18f4f835..95dd60b7 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -157,7 +157,7 @@ The provided distribution is based on `BusyBox <https=
://www.busybox.net/>`__ and
 +-----------+-----------------------------------------------------------=
-------------------------------------+
 | bbappend  | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-kernel/linux/=
linux-yocto_%.bbappend``             |
 +-----------+-----------------------------------------------------------=
-------------------------------------+
-| Recipe    | ``${WORKSPACE}/core/meta/recipes-kernel/linux/linux-yocto_=
6.12.bb``                            |
+| Recipe    | ``${WORKSPACE}/core/meta/recipes-kernel/linux/linux-yocto_=
6.18.bb``                            |
 +-----------+-----------------------------------------------------------=
-------------------------------------+
 | defconfig | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-kernel/linux/=
files/corstone1000/defconfig``       |
 +-----------+-----------------------------------------------------------=
-------------------------------------+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-Add-Cortex-A320-support-on-FVP.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0039-corstone1000-Add-Cortex-A320-support-on-=
FVP.patch
index bace9571..af4215a4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-Add-Cortex-A320-support-on-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-Add-Cortex-A320-support-on-FVP.patch
@@ -122,7 +122,7 @@ index b29ac74217e..7f75eae48cc 100644
  &{/soc} {
  	extsys0: remoteproc@1a010310 {
  		compatible =3D "arm,corstone1000-extsys";
-@@ -37,3 +46,70 @@
+@@ -37,3 +46,72 @@
  		firmware-name =3D "es_flashfw.elf";
  	};
  };
@@ -144,6 +144,8 @@ index b29ac74217e..7f75eae48cc 100644
 +/ {
 +	ethosu: ethosu@1A050000 {
 +		compatible =3D "arm,ethosu-direct";
++		#address-cells =3D <1>;
++		#size-cells =3D <1>;
 +
 +		// Base address and size of NPU registers
 +		reg =3D <0x1A050000 0x4000>;
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-re=
moteproc-Add-Arm-remoteproc-driver.patch b/meta-arm-bsp/recipes-kernel/li=
nux/files/corstone1000/0001-remoteproc-Add-Arm-remoteproc-driver.patch
index c99be74a..4b7b6fcc 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-remotepro=
c-Add-Arm-remoteproc-driver.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-remotepro=
c-Add-Arm-remoteproc-driver.patch
@@ -472,7 +472,7 @@ index 000000000000..6afa78ae7ad3
 +
 +static struct platform_driver arm_rproc_driver =3D {
 +	.probe =3D arm_rproc_probe,
-+	.remove_new =3D arm_rproc_remove,
++	.remove =3D arm_rproc_remove,
 +	.driver =3D {
 +		.name =3D "arm-rproc",
 +		.of_match_table =3D arm_rproc_of_match,
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconf=
ig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
index bf4be697..21f185f8 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -85,7 +85,7 @@ CONFIG_NLS_CODEPAGE_860=3Dy
 CONFIG_NLS_ISO8859_1=3Dy
 CONFIG_NLS_ISO8859_15=3Dy
 CONFIG_NLS_UTF8=3Dy
-CONFIG_LIBCRC32C=3Dy
+CONFIG_CRC32=3Dy
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_DEBUG_FS=3Dy
 CONFIG_PANIC_TIMEOUT=3D5
@@ -117,7 +117,6 @@ CONFIG_MMC_ARMMMCI=3Dy
 # CONFIG_MMC_MTK is not set
 CONFIG_EXT2_FS=3Dy
 # CONFIG_EXT2_FS_XATTR is not set
-CONFIG_EXT3_FS=3Dy
 CONFIG_EXT4_FS=3Dy
 # CONFIG_EXT4_FS_POSIX_ACL is not set
 # CONFIG_EXT4_FS_SECURITY is not set

