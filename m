Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CBBC77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:46:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6929.1681994807719696418
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 05:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EBCA152B
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 05:47:31 -0700 (PDT)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4605D3F587
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 05:46:47 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/tc1: Add FVP support
Date: Thu, 20 Apr 2023 08:46:42 -0400
Message-Id: <20230420124642.662700-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420124642.662700-1-jon.mason@arm.com>
References: <20230420124642.662700-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 12:46:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4592

Add tc1 ecosystem FVP and bits to enable in the tc1 machine config file
Also, do some hacks to speed things up.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  3 +++
 ci/fvps.yml                                   |  5 ++--
 ci/tc1.yml                                    |  3 ++-
 meta-arm-bsp/conf/machine/include/tc.inc      |  5 ++++
 meta-arm-bsp/conf/machine/tc1.conf            | 24 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot/tc/bootargs.cfg |  3 ++-
 meta-arm/recipes-devtools/fvp/fvp-tc1.bb      | 11 +++++++++
 7 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-tc1.bb

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8204eaf0..df1f0f5a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -219,6 +219,9 @@ sgi575:
=20
 tc1:
   extends: .build
+  parallel:
+    matrix:
+      - TESTING: testimage
   tags:
     - x86_64
=20
diff --git a/ci/fvps.yml b/ci/fvps.yml
index e3bc5fe5..58c29d53 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -13,7 +13,8 @@ local_conf_header:
=20
 target:
   - nativesdk-fvp-base-a-aem
-  - nativesdk-fvp-n1-edge
-  - nativesdk-fvp-sgi575
   - nativesdk-fvp-corstone500
   - nativesdk-fvp-corstone1000
+  - nativesdk-fvp-n1-edge
+  - nativesdk-fvp-sgi575
+  - nativesdk-fvp-tc1
diff --git a/ci/tc1.yml b/ci/tc1.yml
index fd9acbd2..c1aceead 100644
--- a/ci/tc1.yml
+++ b/ci/tc1.yml
@@ -2,8 +2,9 @@ header:
   version: 11
   includes:
     - ci/base.yml
+    - ci/fvp.yml
=20
 machine: tc1
=20
 target:
-  - tc-artifacts-image
+  - core-image-minimal
diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index 59a11b27..f84d55c2 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -39,3 +39,8 @@ IMAGE_FSTYPES +=3D "cpio.gz"
 INITRAMFS_IMAGE ?=3D "core-image-minimal"
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
+
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a optee-os"
+# FIXME - there is signed image dependency/race with testimage.
+# This should be fixed in oe-core
+TESTIMAGEDEPENDS:append =3D " virtual/kernel:do_deploy"
diff --git a/meta-arm-bsp/conf/machine/tc1.conf b/meta-arm-bsp/conf/machi=
ne/tc1.conf
index 42c5d8d5..f99bfd2b 100644
--- a/meta-arm-bsp/conf/machine/tc1.conf
+++ b/meta-arm-bsp/conf/machine/tc1.conf
@@ -5,3 +5,27 @@
 #@DESCRIPTION: Machine configuration for TC1
=20
 require conf/machine/include/tc.inc
+
+TEST_TARGET =3D "OEFVPSerialTarget"
+TEST_SUITES =3D "linuxboot"
+
+# FVP Config
+FVP_PROVIDER ?=3D "fvp-tc1-native"
+FVP_EXE ?=3D "FVP_TC1"
+
+# FVP Parameters
+FVP_CONFIG[css.scp.ROMloader.fname] ?=3D "${DEPLOY_DIR_IMAGE}/scp_romfw.=
bin"
+FVP_CONFIG[css.trustedBootROMloader.fname] ?=3D "${DEPLOY_DIR_IMAGE}/bl1=
-tc.bin"
+FVP_CONFIG[board.flashloader0.fname] ?=3D "${DEPLOY_DIR_IMAGE}/fip_gpt-t=
c.bin"
+
+#FVP_CONFIG[board.hostbridge.userNetworking] ?=3D "true"
+#FVP_CONFIG[board.hostbridge.userNetPorts] ?=3D "8022=3D22"
+#smsc ethernet takes a very long time to come up.  disable now to preven=
t testimage timeout
+#FVP_CONFIG[board.smsc_91c111.enabled] ?=3D "1"
+
+FVP_CONSOLE =3D "terminal_s1"
+FVP_TERMINALS[soc.terminal_s0] ?=3D "Secure Console"
+FVP_TERMINALS[soc.terminal_s1] ?=3D "Console"
+
+# Boot image
+FVP_DATA ?=3D "board.dram=3D${DEPLOY_DIR_IMAGE}/fitImage-core-image-mini=
mal-tc1-tc1@0x20000000"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/bootargs.cfg b/met=
a-arm-bsp/recipes-bsp/u-boot/u-boot/tc/bootargs.cfg
index 8c316024..a06c44ff 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/bootargs.cfg
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/bootargs.cfg
@@ -1,2 +1,3 @@
 CONFIG_USE_BOOTARGS=3Dy
-CONFIG_BOOTARGS=3D"console=3DttyAMA0 debug user_debug=3D31 earlycon=3Dpl=
011,0x7ff80000 loglevel=3D9 androidboot.hardware=3Dtotal_compute androidb=
oot.boot_devices=3D1c050000.mmci ip=3Ddhcp androidboot.selinux=3Dpermissi=
ve allow_mismatched_32bit_el0"
+CONFIG_BOOTARGS=3D"console=3DttyAMA0 debug user_debug=3D31 earlycon=3Dpl=
011,0x7ff80000 loglevel=3D9 androidboot.hardware=3Dtotal_compute androidb=
oot.boot_devices=3D1c050000.mmci androidboot.selinux=3Dpermissive allow_m=
ismatched_32bit_el0"
+CONFIG_BOOTDELAY=3D0
diff --git a/meta-arm/recipes-devtools/fvp/fvp-tc1.bb b/meta-arm/recipes-=
devtools/fvp/fvp-tc1.bb
new file mode 100644
index 00000000..4a1295cd
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-tc1.bb
@@ -0,0 +1,11 @@
+require fvp-ecosystem.inc
+
+MODEL =3D "TC1"
+MODEL_CODE =3D "FVP_TC1"
+PV =3D "11.18.28_Linux64"
+
+SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/TotalCompute/Total%20Compute%20Update%202022/${MODEL=
_CODE}_${PV_URL}.tgz;subdir=3D${BP}"
+SRC_URI[sha256sum] =3D "3a2b32ecf34dc9581482d6fc682a9378ba6ed151ea9b6891=
4b4ebad39fb5cacf"
+
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3Da=
50d186fffa51ed55599183aad911298 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411"
--=20
2.25.1


