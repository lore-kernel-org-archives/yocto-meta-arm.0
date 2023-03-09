Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472ACC6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 16:23:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23741.1678465400175723500
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Mar 2023 08:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1980B139F
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 08:24:03 -0800 (PST)
Received: from jdm-VirtualBox.lan044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 764CD3F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 08:23:19 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/optee: optee-os include cleanup
Date: Thu,  9 Mar 2023 16:15:20 -0500
Message-Id: <20230309211521.496531-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230309211521.496531-1-jon.mason@arm.com>
References: <20230309211521.496531-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Mar 2023 16:23:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4484

optee-os-3_19.inc duplicates optee-os.inc.  Remove that and cleanup
the fallout.  Also, remove unused 3.19 bbappend

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-os_3.19.0.bbappend            |  6 --
 .../recipes-security/optee/optee-os-3_19.inc  | 82 -------------------
 .../optee/optee-os-tadevkit_3.18.0.bb         |  1 -
 .../recipes-security/optee/optee-os_3.18.0.bb |  2 +-
 .../recipes-security/optee/optee-os_3.19.0.bb |  9 +-
 5 files changed, 6 insertions(+), 94 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.19.0.b=
bappend
 delete mode 100644 meta-arm/recipes-security/optee/optee-os-3_19.inc

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.19.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-os_3.19.0.bbappend
deleted file mode 100644
index f80e09f8..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.19.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_OS_REQUIRE ?=3D ""
-MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
-
-require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm/recipes-security/optee/optee-os-3_19.inc b/meta-arm=
/recipes-security/optee/optee-os-3_19.inc
deleted file mode 100644
index 61475dcf..00000000
--- a/meta-arm/recipes-security/optee/optee-os-3_19.inc
+++ /dev/null
@@ -1,82 +0,0 @@
-SUMMARY =3D "OP-TEE Trusted OS"
-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Trusted s=
ide of the TEE"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee55ec=
173"
-
-inherit deploy python3native
-require optee.inc
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.19.0:"
-
-CVE_PRODUCT =3D "linaro:op-tee op-tee:op-tee_os"
-
-DEPENDS =3D "python3-pyelftools-native python3-cryptography-native"
-
-DEPENDS:append:toolchain-clang =3D " compiler-rt"
-
-SRC_URI =3D "git://github.com/OP-TEE/optee_os.git;branch=3Dmaster;protoc=
ol=3Dhttps"
-
-SRC_URI:append =3D " \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0007-allow-setting-sysroot-for-clang.patch \
-    file://0008-no-warn-rwx-segments.patch \
-   "
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-EXTRA_OEMAKE +=3D " \
-    PLATFORM=3D${OPTEEMACHINE} \
-    CFG_${OPTEE_CORE}_core=3Dy \
-    CROSS_COMPILE_core=3D${HOST_PREFIX} \
-    CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \
-    NOWERROR=3D1 \
-    ta-targets=3Dta_${OPTEE_ARCH} \
-    O=3D${B} \
-"
-EXTRA_OEMAKE +=3D " HOST_PREFIX=3D${HOST_PREFIX}"
-EXTRA_OEMAKE +=3D " CROSS_COMPILE64=3D${HOST_PREFIX}"
-
-CFLAGS[unexport] =3D "1"
-LDFLAGS[unexport] =3D "1"
-CPPFLAGS[unexport] =3D "1"
-AS[unexport] =3D "1"
-LD[unexport] =3D "1"
-
-do_compile:prepend() {
-	PLAT_LIBGCC_PATH=3D$(${CC} -print-libgcc-file-name)
-}
-
-do_compile() {
-    oe_runmake -C ${S} all
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install() {
-    #install core in firmware
-    install -d ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_=
libdir}/firmware/
-}
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-do_deploy() {
-    install -d ${DEPLOYDIR}/${MLPREFIX}optee
-    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/${=
MLPREFIX}optee
-}
-
-addtask deploy before do_build after do_install
-
-SYSROOT_DIRS +=3D "${nonarch_base_libdir}/firmware"
-
-FILES:${PN} =3D "${nonarch_base_libdir}/firmware/"
-
-# note: "textrel" is not triggered on all archs
-INSANE_SKIP:${PN} =3D "textrel"
-# Build paths are currently embedded
-INSANE_SKIP:${PN} +=3D "buildpaths"
-INSANE_SKIP:${PN}-dev =3D "staticdev"
-INHIBIT_PACKAGE_STRIP =3D "1"
-
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.18.0.bb =
b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
index 0982df3d..ff0baf8c 100644
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
@@ -1,4 +1,3 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os:"
 require optee-os_3.18.0.bb
=20
 SUMMARY =3D "OP-TEE Trusted OS TA devkit"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.18.0.bb
index 31da5ded..c51d4568 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
@@ -2,7 +2,7 @@ require optee-os.inc
=20
 DEPENDS +=3D "dtc-native"
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-3.18.0:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.18.0:"
=20
 SRCREV =3D "1ee647035939e073a2e8dddb727c0f019cc035f1"
 SRC_URI:append =3D " \
diff --git a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.19.0.bb
index 656a0974..c08faf6b 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
@@ -1,9 +1,10 @@
-require optee-os-3_19.inc
+require optee-os.inc
=20
 DEPENDS +=3D "dtc-native"
=20
-SRCREV =3D "afacf356f9593a7f83cae9f96026824ec242ff52"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.19.0:"
=20
+SRCREV =3D "afacf356f9593a7f83cae9f96026824ec242ff52"
 SRC_URI:append =3D " \
-    file://0001-core-Define-section-attributes-for-clang.patch \=20
-    "
+    file://0001-core-Define-section-attributes-for-clang.patch \
+   "
--=20
2.25.1


