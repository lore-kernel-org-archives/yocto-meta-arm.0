Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840CFC54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 11:24:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38618.1675077871021420426
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 03:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF5616F3
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 03:25:12 -0800 (PST)
Received: from jdm-VirtualBox.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EBEBB3F71E
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 03:24:29 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/juno: update to use u-boot v2023.01
Date: Mon, 30 Jan 2023 06:24:23 -0500
Message-Id: <20230130112425.784450-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 11:24:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4339

Update the compressed kernel patch and drop the unnecessary custom
bootcmd patch.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf           |  1 -
 ...tom-bootcmd-to-autoboot-from-uEnv.tx.patch | 50 -------------------
 ...-modify-to-boot-compressed-initramfs.patch | 27 ++++++++++
 ...-modify-to-boot-compressed-initramfs.patch | 41 ---------------
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  4 +-
 5 files changed, 28 insertions(+), 95 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-arm-=
juno-add-custom-bootcmd-to-autoboot-from-uEnv.tx.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-conf=
igs-vexpress-modify-to-boot-compressed-initramfs.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0002-conf=
igs-vexpress-modify-to-boot-compressed-initramfs.patch

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/mach=
ine/juno.conf
index 4a86d4e2..43d6b3e3 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -18,7 +18,6 @@ IMAGE_FSTYPES +=3D "tar.bz2 ext4 cpio.gz"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_u-boot ?=3D "2022.04"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a virtual/bootloader firmware-=
image-juno"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-arm-juno-ad=
d-custom-bootcmd-to-autoboot-from-uEnv.tx.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/juno/0001-arm-juno-add-custom-bootcmd-to-autoboot-from-uE=
nv.tx.patch
deleted file mode 100644
index a6838390..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-arm-juno-add-custo=
m-bootcmd-to-autoboot-from-uEnv.tx.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 13dde05efae99c5261ed213108087d0f7ac9581e Mon Sep 17 00:00:00 2001
-From: Damodar Santhapuri <damodar.santhapuri@arm.com>
-Date: Thu, 5 Nov 2020 22:40:48 +0530
-Subject: [PATCH] arm: juno: add custom bootcmd to autoboot from uEnv.txt=
 file
-
-enable autoboot support with custom bootcmd loads uEnv.txt
-from NOR to DRAM and import.
-
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
-Upstream-Status: Pending
----
- include/configs/vexpress_aemv8.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index f0c5ceb3849a..cd7f6c1b9ba0 100644
---- a/include/configs/vexpress_aemv8.h
-+++ b/include/configs/vexpress_aemv8.h
-@@ -137,13 +137,13 @@
- 		"  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
- 		"fi ; "\
- 		"fdt addr ${fdt_addr_r}; fdt resize; " \
--		"if afs load  ${ramdisk_name} ${ramdisk_addr_r} ; "\
-+		"if afs load  ${initrd_name} ${initrd_addr_r} ; "\
- 		"then "\
--		"  setenv ramdisk_param ${ramdisk_addr_r}; "\
-+		"  setenv initrd_param ${initrd_addr_r}; "\
- 		"else "\
--		"  setenv ramdisk_param -; "\
-+		"  setenv initrd_param -; "\
- 		"fi ; " \
--		"booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}\0"
-+		"booti ${kernel_addr_r} ${initrd_param} ${fdt_addr_r}"
- #define BOOTENV_DEV_NAME_AFS(devtypeu, devtypel, instance) "afs "
-=20
- #define BOOT_TARGET_DEVICES(func)	\
-@@ -164,8 +164,8 @@
- 				"kernel_name=3Dnorkern\0"	\
- 				"kernel_alt_name=3DImage\0"	\
- 				"kernel_addr_r=3D0x80080000\0" \
--				"ramdisk_name=3Dramdisk.img\0"	\
--				"ramdisk_addr_r=3D0x88000000\0"	\
-+				"initrd_name=3Dramdisk.img\0"	\
-+				"initrd_addr_r=3D0x88000000\0"	\
- 				"fdtfile=3Dboard.dtb\0" \
- 				"fdt_alt_name=3Djuno\0" \
- 				"fdt_addr_r=3D0x80000000\0" \
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vex=
press-modify-to-boot-compressed-initramfs.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/juno/0001-configs-vexpress-modify-to-boot-compressed-init=
ramfs.patch
new file mode 100644
index 00000000..0967df76
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vexpress-m=
odify-to-boot-compressed-initramfs.patch
@@ -0,0 +1,27 @@
+From 726f8b4dbd3c5b1873aad531d5e26af3acd9b9ca Mon Sep 17 00:00:00 2001
+From: Jon Mason <jdmason@kudzu.us>
+Date: Mon, 19 Dec 2022 11:36:04 -0500
+Subject: [PATCH] configs: vexpress: modify to boot compressed initramfs
+
+Signed-off-by: Jon Mason <jdmason@kudzu.us>
+Upstream-Status: Inappropriate
+---
+ include/configs/vexpress_aemv8.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
+index 0c11b6b3331e..4ba4bebfbbae 100644
+--- a/include/configs/vexpress_aemv8.h
++++ b/include/configs/vexpress_aemv8.h
+@@ -192,8 +192,10 @@
+ #define VEXPRESS_RAMDISK_ADDR		0x8fe00000
+=20
+ #define EXTRA_ENV_NAMES							\
++	        "kernel_comp_addr_r=3D0x90000000\0"			\
++		"kernel_comp_size=3D0x3000000\0"				\
+ 		"kernel_name=3Dnorkern\0"					\
+-		"kernel_alt_name=3DImage\0"				\
++		"kernel_alt_name=3DImage.gz\0"				\
+ 		"ramdisk_name=3Dramdisk.img\0"				\
+ 		"fdtfile=3Dboard.dtb\0"					\
+ 		"fdt_alt_name=3Djuno\0"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0002-configs-vex=
press-modify-to-boot-compressed-initramfs.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/juno/0002-configs-vexpress-modify-to-boot-compressed-init=
ramfs.patch
deleted file mode 100644
index 2bf68fe6..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0002-configs-vexpress-m=
odify-to-boot-compressed-initramfs.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 097a43223da4fa42335944295903ede2755e2dfd Mon Sep 17 00:00:00 2001
-From: Jon Mason <jdmason@kudzu.us>
-Date: Mon, 19 Dec 2022 11:36:04 -0500
-Subject: [PATCH] configs: vexpress: modify to boot compressed initramfs
-
-Signed-off-by: Jon Mason <jdmason@kudzu.us>
-Upstream-Status: Inappropriate
-
----
- configs/vexpress_aemv8a_juno_defconfig | 1 +
- include/configs/vexpress_aemv8.h       | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/configs/vexpress_aemv8a_juno_defconfig b/configs/vexpress_a=
emv8a_juno_defconfig
-index e02124cc7f54..6ffe8f5fe67e 100644
---- a/configs/vexpress_aemv8a_juno_defconfig
-+++ b/configs/vexpress_aemv8a_juno_defconfig
-@@ -16,6 +16,7 @@ CONFIG_SYS_LOAD_ADDR=3D0x90000000
- CONFIG_BOOTDELAY=3D1
- CONFIG_USE_BOOTARGS=3Dy
- CONFIG_BOOTARGS=3D"console=3DttyAMA0,115200n8 root=3D/dev/sda2 rw rootw=
ait earlycon=3Dpl011,0x7ff80000 debug user_debug=3D31 androidboot.hardwar=
e=3Djuno loglevel=3D9"
-+CONFIG_BOOTCOMMAND=3D"echo running default boot command; afs load ${ker=
nel_name} ${kernel_addr_r} ; if test $? -eq 1; then   echo Loading ${kern=
el_alt_name} instead of ${kernel_name};   afs load ${kernel_alt_name} ${k=
ernel_addr_r};fi ; afs load  ${fdtfile} ${fdt_addr_r} ; if test $? -eq 1;=
 then   echo Loading ${fdt_alt_name} instead of ${fdtfile};   afs load ${=
fdt_alt_name} ${fdt_addr_r}; fi ; fdt addr ${fdt_addr_r}; fdt resize; if =
afs load  ${initrd_name} ${initrd_addr_r} ; then   setenv initrd_param ${=
initrd_addr_r};   else setenv initrd_param -; fi ; booti ${kernel_addr_r}=
 ${initrd_param} ${fdt_addr_r}"
- # CONFIG_DISPLAY_CPUINFO is not set
- # CONFIG_DISPLAY_BOARDINFO is not set
- CONFIG_SYS_PROMPT=3D"VExpress64# "
-diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index cd7f6c1b9ba0..c2f5eb302076 100644
---- a/include/configs/vexpress_aemv8.h
-+++ b/include/configs/vexpress_aemv8.h
-@@ -164,6 +164,8 @@
- 				"kernel_name=3Dnorkern\0"	\
- 				"kernel_alt_name=3DImage\0"	\
- 				"kernel_addr_r=3D0x80080000\0" \
-+				"kernel_comp_addr_r=3D0x90000000\0" \
-+				"kernel_comp_size=3D0x3000000\0" \
- 				"initrd_name=3Dramdisk.img\0"	\
- 				"initrd_addr_r=3D0x88000000\0"	\
- 				"fdtfile=3Dboard.dtb\0" \
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index f26ab4a6..b89ea872 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -77,9 +77,7 @@ SRC_URI:append:fvp-baser-aemv8r64 =3D " \
 #
 # Juno Machines
 #
-SRC_URI:append:juno =3D " file://0001-arm-juno-add-custom-bootcmd-to-aut=
oboot-from-uEnv.tx.patch \
-                        file://0002-configs-vexpress-modify-to-boot-comp=
ressed-initramfs.patch \
-                      "
+SRC_URI:append:juno =3D " file://0001-configs-vexpress-modify-to-boot-co=
mpressed-initramfs.patch"
=20
=20
 #
--=20
2.25.1


