Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740D4C63697
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10433.1650643760795888791
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 09:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47CF21FB;
	Fri, 22 Apr 2022 09:09:19 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.95.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 567B73F5A1;
	Fri, 22 Apr 2022 09:09:18 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/6] arm/fvp-base-r-aem: Automatically download FVP tarball
Date: Fri, 22 Apr 2022 17:08:55 +0100
Message-Id: <20220422160900.1861031-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3286

From: Peter Hoyes <Peter.Hoyes@arm.com>

The FVP_Base_AEMv8R tarball is now available to download directly from
developer.arm.com without logging in. Therefore, remove the
FVP_BASE_R_AEM_TARBALL_URI env var (and references in the documentation)
and update the SRC_URI in the recipe.

Move fvpboot and userNetPorts to the machine conf, now that the
FVP configuration is no longer dependent on an external tarball.

Clarify the currently supported FVP version in the documentation.

Put the current PV in the recipe filename.

Issue-Id: SCM-4304
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I776277c690bf4466445ca2df17eedb202f172f58
---
 kas/fvp-baser-aemv8r64-bsp.yml                |  3 ---
 .../conf/machine/fvp-baser-aemv8r64.conf      |  2 ++
 .../documentation/fvp-baser-aemv8r64.md       | 20 +++++--------------
 .../recipes-devtools/fvp/fvp-base-r-aem.bb    | 17 ----------------
 .../fvp/fvp-base-r-aem_11.17.21.bb            | 10 ++++++++++
 5 files changed, 17 insertions(+), 35 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
 create mode 100644 meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.17.21=
.bb

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.=
yml
index 6871201..43ca36a 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -25,7 +25,6 @@ repos:
       meta-poky:
=20
 env:
-  FVP_BASE_R_AEM_TARBALL_URI: ""
   FVP_BASE_R_ARM_EULA_ACCEPT: "False"
=20
 local_conf_header:
@@ -34,8 +33,6 @@ local_conf_header:
     PACKAGE_CLASSES =3D "package_ipk"
     PACKAGECONFIG:remove:pn-qemu-system-native =3D "gtk+ sdl"
     EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks ssh-server-openssh"
-    FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
-    IMAGE_CLASSES:append =3D " ${@oe.utils.ifelse(d.getVar('FVP_BASE_R_A=
EM_TARBALL_URI'), 'fvpboot', '')}"
     LICENSE_FLAGS_ACCEPTED:append =3D " ${@oe.utils.vartrue('FVP_BASE_R_=
ARM_EULA_ACCEPT', 'Arm-FVP-EULA', '', d)}"
=20
 target:
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index db8c4fe..8646bdf 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -19,6 +19,7 @@ UBOOT_MACHINE ?=3D "vexpress_aemv8r_defconfig"
=20
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
+IMAGE_CLASSES:append =3D " fvpboot"
 IMAGE_FSTYPES +=3D "wic"
 WKS_FILE ?=3D "efi-disk.wks.in"
 EFI_PROVIDER ?=3D "grub-efi"
@@ -61,6 +62,7 @@ FVP_CONFIG[gic_distributor.has-two-security-states] ?=3D=
 "0"
 FVP_CONFIG[pctl.startup] ?=3D "0.0.0.*"
 FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
 FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
 FVP_CONFIG[bp.virtio_rng.enabled] ?=3D "1"
 FVP_CONFIG[bp.vis.rate_limit-enable] ?=3D "0"
 FVP_CONFIG[bp.refcounter.use_real_time] ?=3D "1"
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index eeeb4fa..0b34d7f 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -27,6 +27,7 @@ The fvp-baser-aemv8r64 Yocto MACHINE supports the follo=
wing BSP components,
 where either a standard or Real-Time Linux kernel (PREEMPT\_RT) can be b=
uilt
 and run:
=20
+ - FVP_Base_AEMv8R: v11.17.21
  - boot-wrapper-aarch64: provides PSCI support
  - U-Boot: v2022.01 - provides UEFI services
  - Linux kernel: linux-yocto-5.15
@@ -104,20 +105,11 @@ is 3.0, install it like so:
=20
 For more details on kas, see https://kas.readthedocs.io/.
=20
-To build the images for fvp-base machine, you also need to:
+To build the images for the fvp-baser-aemv8r64 machine, you also need to=
 accept
+the EULA at
+https://developer.arm.com/tools-and-software/simulation-models/fixed-vir=
tual-platforms/end-user-license-agreement-for-fixed-virtual-platforms
+by setting the following environment variable:
=20
- - download the ``FVP_Base_AEMv8R_11.17_21.tgz`` image AEM V8-R FVP Inst=
aller
-  (Linux) package from Arm's website:
-  https://silver.arm.com/download/download.tm?pv=3D4865959&p=3D4029857. =
You need
-   to have an account and be logged in to be able to download it
- - set absolute path to the ``FVP_Base_AEMv8R_11.17_21.tgz`` downloaded
-   package in ``FVP_BASE_R_AEM_TARBALL_URI``
- - accept EULA in ``FVP_BASE_R_ARM_EULA_ACCEPT``
-
-
-The variables should be set like so:
-
-    FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Base_AEMv=
8R_11.17_21.tgz"
     FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
=20
 **Note:** The host machine should have at least 50 GBytes of free disk s=
pace
@@ -142,14 +134,12 @@ Fetch the meta-arm repository into a build director=
y:
 Building with the standard Linux kernel:
=20
     cd ~/fvp-baser-aemv8r64-build
-    export FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Ba=
se_AEMv8R_11.17_21.tgz"
     export FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
     kas build meta-arm/kas/fvp-baser-aemv8r64-bsp.yml
=20
 Building with the Real-Time Linux kernel (PREEMPT\_RT):
=20
     cd ~/fvp-baser-aemv8r64-build
-    export FVP_BASE_R_AEM_TARBALL_URI=3D"file:///absolute/path/to/FVP_Ba=
se_AEMv8R_11.17_21.tgz"
     export FVP_BASE_R_ARM_EULA_ACCEPT=3D"True"
     kas build meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml
=20
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb b/meta-arm/r=
ecipes-devtools/fvp/fvp-base-r-aem.bb
deleted file mode 100644
index f21ccae..0000000
--- a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require fvp-envelope.inc
-
-SUMMARY =3D "Arm Fixed Virtual Platform - Armv8-R Base Architecture Enve=
lope Model FVP"
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
-
-# This FVP cannot be downloaded directly, so download the Armv8-R Base A=
EM FVP
-# yourself from the homepage and set FVP_BASE_R_AEM_TARBALL_URI appropri=
ately
-# (for example, file:///home/user/FVP_Base_AEMv8R_11.17_21.tgz).
-FVP_BASE_R_AEM_TARBALL_URI ?=3D ""
-PV =3D "11.17.21"
-
-SRC_URI =3D "${FVP_BASE_R_AEM_TARBALL_URI};subdir=3D${BP}"
-python() {
-    if not d.getVar("FVP_BASE_R_AEM_TARBALL_URI"):
-        raise bb.parse.SkipRecipe("FVP_BASE_R_AEM_TARBALL_URI not set")
-}
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.17.21.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.17.21.bb
new file mode 100644
index 0000000..06bc370
--- /dev/null
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-r-aem_11.17.21.bb
@@ -0,0 +1,10 @@
+require fvp-envelope.inc
+
+SUMMARY =3D "Arm Fixed Virtual Platform - Armv8-R Base Architecture Enve=
lope Model FVP"
+LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
+                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
+
+SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}.tgz;subdir=3D${BP}"
+SRC_URI[sha256sum] =3D "483ec3c2c6569e3e7e0c4c46329662c0d19475dee8e8947c=
24fa3de4b00da488"
+
+MODEL_CODE =3D "FVP_Base_AEMv8R"
--=20
2.25.1


