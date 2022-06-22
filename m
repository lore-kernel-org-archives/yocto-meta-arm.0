Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2722C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 13:36:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7272.1655904991673718048
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 06:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68FCD1477;
	Wed, 22 Jun 2022 06:36:31 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.85.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03F793F534;
	Wed, 22 Jun 2022 06:36:29 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	jiamei.xie@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/3] arm/fvp-base-r-aem: Upgrade to version 11.18.16
Date: Wed, 22 Jun 2022 14:36:18 +0100
Message-Id: <20220622133620.1524265-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 13:36:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3525

From: Peter Hoyes <Peter.Hoyes@arm.com>

The new FVP includes the arch in the download filename, so refactor
FVP_ARCH in fvp-common.inc to make "Linux64" available in the recipe
file.

Update version and EULA URL in documentation.

Issue-Id: SCM-4388
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I3ddc29cd444b78634086f2aefe4f52799eb937b1
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md      |  4 ++--
 .../recipes-devtools/fvp/fvp-base-r-aem_11.17.21.bb   | 10 ----------
 .../recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb   | 11 +++++++++++
 meta-arm/recipes-devtools/fvp/fvp-common.inc          |  6 ++++--
 4 files changed, 17 insertions(+), 14 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.17.21=
.bb
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16=
.bb

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 4e98e42..26024aa 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -27,7 +27,7 @@ The fvp-baser-aemv8r64 Yocto MACHINE supports the follo=
wing BSP components,
 where either a standard or Real-Time Linux kernel (PREEMPT\_RT) can be b=
uilt
 and run:
=20
- - FVP_Base_AEMv8R: v11.17.21
+ - FVP_Base_AEMv8R: v11.18.16
  - boot-wrapper-aarch64: provides PSCI support
  - U-Boot: v2022.01 - provides UEFI services
  - Linux kernel: linux-yocto-5.15
@@ -107,7 +107,7 @@ For more details on kas, see https://kas.readthedocs.=
io/.
=20
 To build the images for the fvp-baser-aemv8r64 machine, you also need to=
 accept
 the EULA at
-https://developer.arm.com/tools-and-software/simulation-models/fixed-vir=
tual-platforms/end-user-license-agreement-for-fixed-virtual-platforms
+https://developer.arm.com/downloads/-/arm-ecosystem-fvps/eula
 by setting the following environment variable:
=20
     FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.17.21.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.17.21.bb
deleted file mode 100644
index 06bc370..0000000
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.17.21.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require fvp-envelope.inc
-
-SUMMARY =3D "Arm Fixed Virtual Platform - Armv8-R Base Architecture Enve=
lope Model FVP"
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
-
-SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}.tgz;subdir=3D${BP}"
-SRC_URI[sha256sum] =3D "483ec3c2c6569e3e7e0c4c46329662c0d19475dee8e8947c=
24fa3de4b00da488"
-
-MODEL_CODE =3D "FVP_Base_AEMv8R"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb
new file mode 100644
index 0000000..8885189
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.18.16.bb
@@ -0,0 +1,11 @@
+require fvp-envelope.inc
+
+SUMMARY =3D "Arm Fixed Virtual Platform - Armv8-R Base Architecture Enve=
lope Model FVP"
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411 \
+                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D2e53bda6ff2db4c35d6=
9944b93926c9f"
+
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP}"
+SRC_URI[sha256sum] =3D "a7a5ee0b7f3b84a2e98e136a6f3ab648e4b6b5ad365186a3=
97595f3f7c69f558"
+
+MODEL_CODE =3D "FVP_Base_AEMv8R"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index f7cdca8..12c933d 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -8,8 +8,10 @@ LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 & GPL=
-3.0-with-GCC-exception &
=20
 COMPATIBLE_HOST =3D '(x86_64|i.86).*-linux'
=20
+# The architecture-specific download filename suffix
+FVP_ARCH =3D "Linux64"
 # The architecture-specific directory the binaries are installed under
-FVP_ARCH =3D "Linux64_GCC-*"
+FVP_ARCH_DIR =3D "${FVP_ARCH}_GCC-*"
=20
 def get_real_pv(d):
     # FVP versions are like 11.12_43
@@ -26,7 +28,7 @@ FVPDIR =3D "${libdir}/fvp/${BPN}"
=20
 # Used in do_install to create symlinks in $bindir to $FVPDIR
 fvp_link_binaries() {
-    DIR=3D"${D}${FVPDIR}/models/${FVP_ARCH}"
+    DIR=3D"${D}${FVPDIR}/models/${FVP_ARCH_DIR}"
=20
     stat $DIR/FVP_* >/dev/null 2>&1 || bbfatal Cannot find FVP binaries =
in $DIR
=20
--=20
2.25.1


