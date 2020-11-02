Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web08.869.1604331230551949686
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 07:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57BEE30E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 020733F66E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:51 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] arm/optee: consolidate common variables
Date: Mon,  2 Nov 2020 15:33:41 +0000
Message-Id: <20201102153341.2844482-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102153341.2844482-1-ross.burton@arm.com>
References: <20201102153341.2844482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move a number of shared varibles into optee.inc so that they don't have
to be duplicated repeatedly.

Change-Id: Ie2565dfa66cbd61aad199224a4cdc7b2e1af0c5d
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/optee/optee-examples.inc | 17 +++------------
 meta-arm/recipes-security/optee/optee-os.inc  | 14 +------------
 .../recipes-security/optee/optee-test.inc     | 16 +++-----------
 meta-arm/recipes-security/optee/optee.inc     | 21 +++++++++++++++++++
 4 files changed, 28 insertions(+), 40 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-ar=
m/recipes-security/optee/optee-examples.inc
index 73193f5..851043b 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -15,26 +15,15 @@ SRC_URI =3D "git://github.com/linaro-swg/optee_exampl=
es.git \
            file://0001-make-Pass-ldflags-during-link.patch \
           "
=20
-OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
-                 OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
-                 TEEC_EXPORT=3D${TEEC_EXPORT} \
-                 HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \
-                 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} =
\
-                 COMPILER=3D${OPTEE_COMPILER} \
-                 TA_CROSS_COMPILE=3D${TARGET_PREFIX} \
-                 V=3D1 \
+EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
+                 HOST_CROSS_COMPILE=3D${HOST_PREFIX} \
+                 TA_CROSS_COMPILE=3D${HOST_PREFIX} \
                  OUTPUT_DIR=3D${B} \
                "
=20
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
-OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
-
 do_compile() {
     oe_runmake -C ${S}
 }
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index e513fcc..ea6c496 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -17,25 +17,13 @@ SRC_URI =3D "git://github.com/OP-TEE/optee_os.git"
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
-OPTEEMACHINE ?=3D "${MACHINE}"
-OPTEEMACHINE_aarch64_qemuall ?=3D "vexpress-qemu_armv8a"
-OPTEE_ARCH =3D "null"
-OPTEE_ARCH_armv7a =3D "arm32"
-OPTEE_ARCH_aarch64 =3D "arm64"
-OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
-OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-
-EXTRA_OEMAKE =3D " \
+EXTRA_OEMAKE +=3D " \
     PLATFORM=3D${OPTEEMACHINE} \
     CFG_${OPTEE_CORE}_core=3Dy \
     CROSS_COMPILE_core=3D${HOST_PREFIX} \
     CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \
     NOWERROR=3D1 \
-    V=3D1 \
     ta-targets=3Dta_${OPTEE_ARCH} \
-    LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \
-    COMPILER=3D${OPTEE_COMPILER} \
     O=3D${B} \
 "
=20
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index 95ed311..467e687 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -19,19 +19,9 @@ SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
-OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT         =3D "${STAGING_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR      =3D "${STAGING_INCDIR}/optee/export-user_ta"
-OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
-                 OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
-                 TEEC_EXPORT=3D${TEEC_EXPORT} \
-                 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} =
\
-                 COMPILER=3D${OPTEE_COMPILER} \
-                 CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \
-                 CROSS_COMPILE_TA=3D${TARGET_PREFIX} \
-                 V=3D1 \
+EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
+                 CROSS_COMPILE_HOST=3D${HOST_PREFIX} \
+                 CROSS_COMPILE_TA=3D${HOST_PREFIX} \
                  O=3D${B} \
                "
=20
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes=
-security/optee/optee.inc
index 4bf87fe..8aaf616 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -1,3 +1,24 @@
 COMPATIBLE_MACHINE ?=3D "invalid"
 COMPATIBLE_MACHINE_qemuarm64 ?=3D "qemuarm64"
 # Please add supported machines below or set it in .bbappend or .conf
+
+OPTEEMACHINE ?=3D "${MACHINE}"
+OPTEEMACHINE_aarch64_qemuall ?=3D "vexpress-qemu_armv8a"
+
+OPTEE_ARCH =3D "null"
+OPTEE_ARCH_armv7a =3D "arm32"
+OPTEE_ARCH_aarch64 =3D "arm64"
+OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
+
+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
+
+# Set here but not passed to EXTRA_OEMAKE by default as that breaks
+# the optee-os build
+TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
+
+EXTRA_OEMAKE +=3D "V=3D1 \
+                 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} =
\
+                 COMPILER=3D${OPTEE_COMPILER} \
+                 OPTEE_CLIENT_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
+                 TEEC_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
+                "
--=20
2.25.1

