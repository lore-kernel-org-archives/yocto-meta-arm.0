Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897D6D3C928
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 16:33:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.215.1765384415140262853
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Dec 2025 08:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B8631762
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Dec 2025 08:33:27 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7840F3F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Dec 2025 08:33:34 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp: add git recipe versions
Date: Wed, 10 Dec 2025 11:33:32 -0500
Message-ID: <20251210163332.66571-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210163332.66571-1-jon.mason@arm.com>
References: <20251210163332.66571-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Dec 2025 16:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6794

Add git recipe versions that track the latest git versions of u-boot and
the various OP-TEE recipes.  This, in combination with the previously
existing trusted firmware a and m recipes, allows for using the latest
code in platform development and testing (as part of CI).

For CI usage, a KAS yml file has been created to allow for those recipes
to be used, and an entry for fvp-base has been added to the gitlab CI
yml file.

NOTE: the wildcard for corstone1000 u-boot PREFERRED_VERSION was causing
it to pick-up the newest version (and failing to apply the patches).
The wildcard is unnecessary, since it is using a layer supplied package.
So, remove it and everyone is happy.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  3 ++
 ci/latest-revisions.yml                       | 15 +++++++++
 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../recipes-bsp/u-boot/u-boot-fvp-base.inc    |  6 ++++
 ....bbappend =3D> optee-os-tadevkit_%.bbappend} |  0
 ...ee-os_4.%.bbappend =3D> optee-os_%.bbappend} |  0
 ...est_4.%.bbappend =3D> optee-test_%.bbappend} |  0
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  6 ++++
 .../recipes-security/optee/optee-client.inc   |  5 ++-
 .../optee/optee-client_4.7.0.bb               |  4 ---
 .../optee/optee-client_git.bb                 | 11 +++++++
 .../optee/optee-examples_git.bb               |  8 +++++
 .../optee/optee-os-tadevkit_git.bb            | 32 +++++++++++++++++++
 ...ee-os_4.%.bbappend =3D> optee-os_%.bbappend} |  0
 .../recipes-security/optee/optee-os_git.bb    | 10 ++++++
 .../recipes-security/optee/optee-test_git.bb  | 20 ++++++++++++
 16 files changed, 116 insertions(+), 6 deletions(-)
 create mode 100644 ci/latest-revisions.yml
 rename meta-arm-bsp/recipes-security/optee/{optee-os-tadevkit_4.%.bbappe=
nd =3D> optee-os-tadevkit_%.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-os_4.%.bbappend =3D> o=
ptee-os_%.bbappend} (100%)
 rename meta-arm-bsp/recipes-security/optee/{optee-test_4.%.bbappend =3D>=
 optee-test_%.bbappend} (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-client_git.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_git.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_git=
.bb
 rename meta-arm/recipes-security/optee/{optee-os_4.%.bbappend =3D> optee=
-os_%.bbappend} (100%)
 create mode 100644 meta-arm/recipes-security/optee/optee-os_git.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_git.bb

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4e1dc0e3f91c..095a1addc21b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -209,6 +209,9 @@ fvp-base:
       - FIRMWARE: [u-boot, edk2]
         TESTING: testimage
       - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
+      - KERNEL: linux-yocto-dev
+        LATEST: latest-revisions
+        TESTING: testimage
=20
 fvps:
   extends: .build
diff --git a/ci/latest-revisions.yml b/ci/latest-revisions.yml
new file mode 100644
index 000000000000..94d6bc2eadc0
--- /dev/null
+++ b/ci/latest-revisions.yml
@@ -0,0 +1,15 @@
+# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
+
+header:
+  version: 14
+
+local_conf_header:
+  latest_revisions: |
+    PREFERRED_VERSION_trusted-firmware-a ?=3D "git"
+    PREFERRED_VERSION_trusted-firmware-m ?=3D "git"
+    PREFERRED_VERSION_optee-client ?=3D "git"
+    PREFERRED_VERSION_optee-examples ?=3D "git"
+    PREFERRED_VERSION_optee-os-tadevkit ?=3D "git"
+    PREFERRED_VERSION_optee-os ?=3D "git"
+    PREFERRED_VERSION_optee-test ?=3D "git"
+    PREFERRED_PROVIDER_u-boot =3D "u-boot:class-devupstream"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 09468c7c0fa4..6f5127b67855 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -26,7 +26,7 @@ TS_SP_SE_PROXY_CONFIG =3D "corstone1000"
 MACHINE_FEATURES +=3D "ts-smm-gateway ts-se-proxy"
=20
 # U-Boot
-PREFERRED_VERSION_u-boot ?=3D "2025.04%"
+PREFERRED_VERSION_u-boot ?=3D "2025.04"
 MACHINE_FEATURES +=3D "efi"
 EFI_PROVIDER ?=3D "grub-efi"
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
index e7f2287797b6..44b98f8fca7e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -6,3 +6,9 @@ SRC_URI:append =3D " \
     file://0002-arm-vexpress64-Enable-SYSRESET-and-SYSRESET_PSCI.patch \
     file://0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch \
     "
+
+# Remove backported patches from latest version
+SRC_URI:remove:class-devupstream =3D " \
+    file://0001-vexpress64-Set-the-DM_RNG-property.patch \
+    file://0002-arm-vexpress64-Enable-SYSRESET-and-SYSRESET_PSCI.patch \
+    "
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bb=
append b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bba=
ppend
rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappen=
d
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend b/=
meta-arm-bsp/recipes-security/optee/optee-os_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-os_%.bbappend
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend =
b/meta-arm-bsp/recipes-security/optee/optee-test_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend
rename to meta-arm-bsp/recipes-security/optee/optee-test_%.bbappend
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm/rec=
ipes-bsp/u-boot/u-boot_%.bbappend
index 8542ccfc9084..8ddc53619560 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -4,3 +4,9 @@ SRC_URI:append:qemuarm64-secureboot =3D " file://qemuarm6=
4.cfg"
 SRC_URI:append:qemuarm-secureboot =3D " file://qemuarm.cfg"
=20
 require ${@bb.utils.contains('MACHINE_FEATURES', 'uefi-secureboot', 'u-b=
oot-uefi-secureboot.inc', '', d)}
+
+# Work some magic here for devupstream
+BBCLASSEXTEND =3D "devupstream:target"
+SRC_URI:class-devupstream =3D "git://source.denx.de/u-boot/u-boot.git;pr=
otocol=3Dhttps;branch=3Dmaster"
+# tag: v2026.01-rc2
+SRCREV:class-devupstream =3D "365a7079fb918643da0f0709660a7d8ea76dd6f3"
diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/=
recipes-security/optee/optee-client.inc
index 0c3aefbb6c36..4d3d83da4521 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -5,7 +5,10 @@ HOMEPAGE =3D "https://www.op-tee.org/"
 LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D69663ab153298557a59c67a60a743=
e5b"
=20
-inherit systemd update-rc.d cmake useradd
+inherit systemd update-rc.d cmake useradd pkgconfig
+
+DEPENDS +=3D "util-linux"
+EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
=20
 SRC_URI =3D " \
     git://github.com/OP-TEE/optee_client.git;branch=3Dmaster;protocol=3D=
https \
diff --git a/meta-arm/recipes-security/optee/optee-client_4.7.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.7.0.bb
index 00f829e18bfb..2fb157dfec81 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.7.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.7.0.bb
@@ -3,7 +3,3 @@ require recipes-security/optee/optee-client.inc
 # v4.7.0
 SRCREV =3D "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
 SRC_URI +=3D "file://0001-tee-supplicant-update-udev-systemd-install-cod=
e.patch"
-
-inherit pkgconfig
-DEPENDS +=3D "util-linux"
-EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-a=
rm/recipes-security/optee/optee-client_git.bb
new file mode 100644
index 000000000000..9c1c622fb82f
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_git.bb
@@ -0,0 +1,11 @@
+require recipes-security/optee/optee-client.inc
+
+# v4.8.0
+SRCREV =3D "9d6f69844ff60ec0966cf3659abcc38eda8b31ea"
+PV .=3D "+git"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+SRC_URI +=3D "file://0001-tee-supplicant-update-udev-systemd-install-cod=
e.patch"
+
+# Not a release recipe, try our hardest to not pull this in implicitly
+DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta=
-arm/recipes-security/optee/optee-examples_git.bb
new file mode 100644
index 000000000000..e0c85660a8a3
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
@@ -0,0 +1,8 @@
+require recipes-security/optee/optee-examples.inc
+
+# v4.8.0
+SRCREV =3D "3ef17eb1f309def91113637f95f67613b1d89119"
+PV .=3D "+git"
+
+# Not a release recipe, try our hardest to not pull this in implicitly
+DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_git.bb b/m=
eta-arm/recipes-security/optee/optee-os-tadevkit_git.bb
new file mode 100644
index 000000000000..78588b8111f4
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_git.bb
@@ -0,0 +1,32 @@
+require recipes-security/optee/optee-os_${PV}.bb
+
+SUMMARY =3D "OP-TEE Trusted OS TA devkit"
+DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+DEPENDS +=3D "python3-pycryptodome-native"
+
+do_install() {
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
+    done
+}
+
+do_deploy() {
+	echo "Do not inherit do_deploy from optee-os."
+}
+
+FILES:${PN} =3D "${includedir}/optee/"
+
+# Build paths are currently embedded
+INSANE_SKIP:${PN}-dev +=3D "buildpaths"
+
+# Include extra headers needed by SPMC tests to TA DEVKIT.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
+                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
+
+# Not a release recipe, try our hardest to not pull this in implicitly
+DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-arm/recipes-security/optee/optee-os_4.%.bbappend b/meta=
-arm/recipes-security/optee/optee-os_%.bbappend
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os_4.%.bbappend
rename to meta-arm/recipes-security/optee/optee-os_%.bbappend
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/r=
ecipes-security/optee/optee-os_git.bb
new file mode 100644
index 000000000000..244ff9b71877
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -0,0 +1,10 @@
+require recipes-security/optee/optee-os.inc
+
+DEPENDS +=3D "dtc-native"
+
+# v4.8.0
+SRCREV =3D "86660925433a8d4d1b19cfa5fe940081d77b34b4"
+PV .=3D "+git"
+
+# Not a release recipe, try our hardest to not pull this in implicitly
+DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm=
/recipes-security/optee/optee-test_git.bb
new file mode 100644
index 000000000000..d29333905865
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_git.bb
@@ -0,0 +1,20 @@
+require recipes-security/optee/optee-test.inc
+
+# v4.8.0
+SRCREV =3D "6569cd7b13e1b37b37069e090d592adca7d3926d"
+PV .=3D "+git"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560"
+
+# Include ffa_spmc test group if the SPMC test is enabled.
+# Supported after op-tee v3.20
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
+                                        ' CFG_SPMC_TESTS=3Dy CFG_SECURE_=
PARTITION=3Dy', '' , d)}"
+
+RDEPENDS:${PN} +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
+                                              ' arm-ffa-user', '' , d)}"
+
+# Not a release recipe, try our hardest to not pull this in implicitly
+DEFAULT_PREFERENCE =3D "-1"
+
+CFLAGS +=3D "-Wno-error=3Dunterminated-string-initialization"
--=20
2.50.1 (Apple Git-155)


