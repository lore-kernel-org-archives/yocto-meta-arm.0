Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6924.1624451299033877409
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Jun 2021 05:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B76F1063
	for <meta-arm@lists.yoctoproject.org>; Wed, 23 Jun 2021 05:28:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 266673F718
	for <meta-arm@lists.yoctoproject.org>; Wed, 23 Jun 2021 05:28:17 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][hardknott 2/3] arm-bsp/linux: guard FILESEXTRAPATHS changes in overrides
Date: Wed, 23 Jun 2021 13:28:13 +0100
Message-Id: <20210623122814.1467189-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623122814.1467189-1-ross.burton@arm.com>
References: <20210623122814.1467189-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross@burtonini.com>

Because of how the kernel class searches for files any changes to
FILESEXTRAPATHS should be done in an override so it doesn't potentially
impact unrelated builds.

Issue spotted by running yocto-check-layer.

Change-Id: Id3b741d184a024d0cc6d2d5031e150a8f0ae4b0d
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-kernel/linux/linux-arm-platforms.inc     | 12 +++++++++++-
 .../recipes-kernel/linux/linux-yocto-corstone700.inc |  2 +-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 1737a05..17a036e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -5,7 +5,11 @@
 # in this file. Update SRC_URI and do_patch for building images with cus=
tom dts
 #
=20
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}:${THISDIR}/files:"
+# We can't set FILESEXTRAPATHS once because of how the kernel classes se=
arch for
+# config fragments. Discussion is ongoing as to whether this is the corr=
ect
+# solution, or a workaround.
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14154
+ARMBSPFILESPATHS :=3D "${THISDIR}:${THISDIR}/files:"
=20
 # Arm platforms kmeta
 SRC_URI_KMETA =3D "file://arm-platforms-kmeta;type=3Dkmeta;name=3Darm-pl=
atforms-kmeta;destsuffix=3Darm-platforms-kmeta"
@@ -26,6 +30,7 @@ COMPATIBLE_MACHINE_corstone500 =3D "corstone500"
 #
 COMPATIBLE_MACHINE_fvp-base =3D "fvp-base"
 KMACHINE_fvp-base =3D "fvp"
+FILESEXTRAPATHS_prepend_fvp-base :=3D "${ARMBSPFILESPATHS}"
 SRC_URI_append_fvp-base =3D " file://fvp-base-dts.patch"
=20
 #
@@ -33,6 +38,7 @@ SRC_URI_append_fvp-base =3D " file://fvp-base-dts.patch=
"
 #
 COMPATIBLE_MACHINE_fvp-base-arm32 =3D "fvp-base-arm32"
 KMACHINE_fvp-base-arm32 =3D "fvp-arm32"
+FILESEXTRAPATHS_prepend_fvp-base-arm32 :=3D "${ARMBSPFILESPATHS}"
 SRC_URI_append_fvp-base-arm32 =3D " file://fvp-base-arm32-dts.patch \
                                   file://0001-ARM-vexpress-enable-GICv3.=
patch"
=20
@@ -43,6 +49,7 @@ COMPATIBLE_MACHINE_juno =3D "juno"
 KMACHINE_juno =3D "juno"
 KBUILD_DEFCONFIG_juno =3D "defconfig"
 KCONFIG_MODE_juno =3D "--alldefconfig"
+FILESEXTRAPATHS_prepend_juno :=3D "${ARMBSPFILESPATHS}"
 SRC_URI_append_juno =3D " \
     file://0001-mailbox-add-support-for-doorbell-signal-mode-control.pat=
ch \
     file://0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.pat=
ch \
@@ -68,6 +75,7 @@ KCONFIG_MODE_sgi575 =3D "--alldefconfig"
 COMPATIBLE_MACHINE_tc0 =3D "tc0"
 KMACHINE_tc0 =3D "tc0"
 KCONFIG_MODE_tc0 =3D "--alldefconfig"
+FILESEXTRAPATHS_prepend_tc0 :=3D "${ARMBSPFILESPATHS}"
 SRC_URI_append_tc0 =3D " \
     file://defconfig \
     file://0001-drm-Add-component-aware-simple-encoder.patch \
@@ -94,6 +102,7 @@ FILESEXTRAPATHS_prepend_n1sdp :=3D "${THISDIR}/linux-y=
octo-5.10/n1sdp:"
 COMPATIBLE_MACHINE_n1sdp =3D "n1sdp"
 KBUILD_DEFCONFIG_n1sdp =3D "defconfig"
 KCONFIG_MODE_n1sdp =3D "--alldefconfig"
+FILESEXTRAPATHS_prepend_n1sdp :=3D "${ARMBSPFILESPATHS}"
 SRC_URI_append_n1sdp =3D " \
     file://0001-pci_quirk-add-acs-override-for-PCI-devices.patch \
     file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch=
 \
@@ -119,4 +128,5 @@ COMPATIBLE_MACHINE_musca-s1 =3D "(^$)"
 # FVP BaseR AEMv8r64 Machine
 #
 COMPATIBLE_MACHINE_fvp-baser-aemv8r64 =3D "fvp-baser-aemv8r64"
+FILESEXTRAPATHS_prepend_fvp-baser-aemv8r64 :=3D "${ARMBSPFILESPATHS}"
 SRC_URI_append_fvp-baser-aemv8r64 =3D " file://fvp-baser-aemv8r64.dts;su=
bdir=3Dgit/arch/arm64/boot/dts/arm"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.in=
c b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
index f2a9a54..eb584e5 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files/corstone700:"
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}:${THISDIR}/files:"
=20
 COMPATIBLE_MACHINE =3D "${MACHINE}"
=20
--=20
2.25.1

