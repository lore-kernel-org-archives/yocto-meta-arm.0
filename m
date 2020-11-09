Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9199.1604914531917769047
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 01:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8D361042
	for <meta-arm@lists.yoctoproject.org>; Mon,  9 Nov 2020 01:35:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 636513F718
	for <meta-arm@lists.yoctoproject.org>; Mon,  9 Nov 2020 01:35:30 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/n1sdp-board-firmware: rewrite recipe
Date: Mon,  9 Nov 2020 09:35:27 +0000
Message-Id: <20201109093527.3951337-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Any recipe that needs to use RM_WORK_EXCLUDE is either being very clever
or is breaking expectations.  This recipe is doing several things in
non-idiomatic ways that breaks other tools, for example the source
doesn't exist in do_unpack.

Rename from board-firmware-n1sdp to n1sdp-board-firmware to match the
repository name.

As this recipe simply ships some precompiled binary, set
INHIBIT_DEFAULT_DEPS to avoid depending on the toolchain to reduce how
often it needs to be rebuilt.

Unpack normally and promptly delete the large SOFTWARE/ directory that
we don't care about, instead of unpacking in do_install.

Ensure deploy is scheduled appropriately.

Remove LICENSE_FLAGS, this is for licenses which need to be opted-in.
Setting LICENSE_FLAGS and then enabling it by default makes no sense.

Change-Id: I1fe906634977d323086de6f6c67a9c45aeb7585e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 -
 .../images/board-firmware-n1sdp_2020.07.27.bb | 53 -------------------
 .../images/n1sdp-board-firmware_2020.07.27.bb | 34 ++++++++++++
 .../images/sdcard-image-n1sdp_0.1.bb          |  2 +-
 4 files changed, 35 insertions(+), 56 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_=
2020.07.27.bb
 create mode 100644 meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_=
2020.07.27.bb

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 3d31c4c..8cadf44 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -39,6 +39,4 @@ EFI_PROVIDER ?=3D "grub-efi"
 MACHINE_FEATURES +=3D "efi"
=20
 # SD-Card firmware
-# Board firmware prebuilts are shared under custom license
-LICENSE_FLAGS_WHITELIST +=3D "stm-sla0044"
 EXTRA_IMAGEDEPENDS +=3D "sdcard-image-n1sdp"
diff --git a/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07=
.27.bb b/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.=
bb
deleted file mode 100644
index 8f7b6c1..0000000
--- a/meta-arm-bsp/recipes-bsp/images/board-firmware-n1sdp_2020.07.27.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-DESCRIPTION =3D "Board Firmware binaries for N1SDP"
-
-# Board-firmware-n1sdp custom license is whitelisted in n1sdp.conf file.
-# Uncomment, or copy this line to your local.conf to build board firmwar=
e,
-# if you are using custom n1sdp.conf file.
-# Please make sure to check the applicable license beforehand!
-#LICENSE_FLAGS_WHITELIST =3D "stm-sla0044"
-
-LICENSE =3D "STM-SLA0044-Rev5"
-LICENSE_FLAGS =3D "stm-sla0044"
-
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSES/STM.TXT;md5=3D4b8dab81d0bfc0a=
5f63c9a983402705b"
-
-SECTION =3D "firmware"
-
-inherit deploy
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE =3D "n1sdp"
-RM_WORK_EXCLUDE +=3D "${PN}"
-
-PV =3D "2020.07.27"
-TAG =3D "N1SDP-${PV}"
-FIRMWARE_TARBALL =3D "n1sdp-board-firmware-${TAG}"
-UNPACK_DIR =3D "n1sdp-board-firmware_source"
-S =3D "${WORKDIR}/${UNPACK_DIR}"
-
-SRC_URI =3D "https://git.linaro.org/landing-teams/working/arm/n1sdp-boar=
d-firmware.git/snapshot/${FIRMWARE_TARBALL}.tar.gz;unpack=3D0"
-SRC_URI[md5sum] =3D "8ba3807ff8f222201154861f11524b14"
-SRC_URI[sha256sum] =3D "57feba404026f2d6d49c167d63e0e84653ad8b808b13e224=
4b81fea9e0d58d66"
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-
-do_install() {
-    cd ${WORKDIR}
-    tar -xvaf ${WORKDIR}/${FIRMWARE_TARBALL}.tar.gz --exclude=3D${FIRMWA=
RE_TARBALL}/SOFTWARE/*
-    mv -v ${WORKDIR}/${FIRMWARE_TARBALL}/* ${S}
-
-    cp -R --no-dereference --preserve=3Dmode,links -v ${S} ${D}
-}
-do_install[dirs] +=3D "${S}"
-do_install[cleandirs] +=3D "${S}"
-
-FILES_${PN} =3D "/${UNPACK_DIR}/*"
-SYSROOT_DIRS +=3D "/${UNPACK_DIR}"
-addtask install after do_unpack before do_populate_lic
-
-do_deploy() {
-    cp -av ${S} ${DEPLOYDIR}
-}
-addtask deploy after do_install
diff --git a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07=
.27.bb b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.=
bb
new file mode 100644
index 0000000..1551ac9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
@@ -0,0 +1,34 @@
+SUMMARY =3D "Board Firmware binaries for N1SDP"
+SECTION =3D "firmware"
+
+LICENSE =3D "STM-SLA0044-Rev5"
+LIC_FILES_CHKSUM =3D "file://LICENSES/STM.TXT;md5=3D4b8dab81d0bfc0a5f63c=
9a983402705b"
+
+inherit deploy
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE =3D "n1sdp"
+
+SRC_URI =3D "https://git.linaro.org/landing-teams/working/arm/n1sdp-boar=
d-firmware.git/snapshot/${BPN}-N1SDP-${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "57feba404026f2d6d49c167d63e0e84653ad8b808b13e224=
4b81fea9e0d58d66"
+
+S =3D "${WORKDIR}/${BPN}-N1SDP-${PV}"
+
+INSTALL_DIR =3D "/n1sdp-board-firmware_source"
+
+do_install() {
+    rm -rf ${S}/SOFTWARE
+    install -d ${D}${INSTALL_DIR}
+    cp -Rp --no-preserve=3Downership ${S}/* ${D}${INSTALL_DIR}
+}
+
+FILES_${PN} =3D "${INSTALL_DIR}"
+SYSROOT_DIRS +=3D "${INSTALL_DIR}"
+
+do_deploy() {
+    install -d ${DEPLOYDIR}${INSTALL_DIR}
+    cp -Rp --no-preserve=3Downership ${S}/* ${DEPLOYDIR}${INSTALL_DIR}
+}
+addtask deploy after do_install before do_build
diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/=
meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
index 68b13eb..13fa560 100644
--- a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
+++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
@@ -4,7 +4,7 @@ inherit deploy nopackages
=20
 DEPENDS =3D "virtual/uefi-firmware \
            virtual/control-processor-firmware \
-           board-firmware-n1sdp"
+           n1sdp-board-firmware"
=20
 LICENSE =3D "MIT"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
--=20
2.25.1

