Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F036CA5FDD
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 14:04:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12450.1769004243497990780
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 06:04:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ED421517;
	Wed, 21 Jan 2026 06:03:56 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.80.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CFA03F694;
	Wed, 21 Jan 2026 06:04:02 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 1/3] arm/arm-bsp: optee: add version 4.9.0
Date: Wed, 21 Jan 2026 14:03:34 +0000
Message-ID: <20260121140356.16818-2-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260121140356.16818-1-hugues.kambampiana@arm.com>
References: <20260121140356.16818-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Jan 2026 14:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6861

OP-TEE version 4.9.0 has been released on 2026-01-16 [1].

Add OP-TEE recipes to point to version 4.9.0

Link: [1]: https://github.com/OP-TEE/optee_os/blob/master/CHANGELOG.md#op=
-tee---version-490-2026-01-16

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../optee-ftpm/optee-ftpm_4.9.0.bb            | 94 +++++++++++++++++++
 .../optee/optee-client_4.9.0.bb               |  4 +
 .../optee/optee-examples_4.9.0.bb             |  4 +
 .../optee/optee-os-tadevkit_4.9.0.bb          | 30 ++++++
 .../recipes-security/optee/optee-os_4.9.0.bb  |  8 ++
 .../optee/optee-test_4.9.0.bb                 | 14 +++
 6 files changed, 154 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0=
.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-client_4.9.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-examples_4.9.0.=
bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.9=
.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os_4.9.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_4.9.0.bb

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb b/m=
eta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb
new file mode 100644
index 00000000..5dfc88c6
--- /dev/null
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb
@@ -0,0 +1,94 @@
+SUMMARY =3D "OPTEE fTPM Microsoft TA"
+DESCRIPTION =3D "TCG reference implementation of the TPM 2.0 Specificati=
on."
+HOMEPAGE =3D "https://github.com/microsoft/ms-tpm-20-ref/"
+
+COMPATIBLE_MACHINE ?=3D "invalid"
+COMPATIBLE_MACHINE:genericarm64 =3D "genericarm64"
+COMPATIBLE_MACHINE:qemuarm64 =3D "qemuarm64"
+COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64"
+COMPATIBLE_MACHINE:qemuarm-secureboot =3D "qemuarm"
+
+inherit deploy python3native
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5a3925ece0806073ae9ebbb08ff6f=
11e"
+LIC_FILES_CHKSUM +=3D "file://optee-ta/LICENSE;md5=3D5a3925ece0806073ae9=
ebbb08ff6f11e"
+
+DEPENDS =3D "python3-pyelftools-native optee-os-tadevkit python3-cryptog=
raphy-native"
+DEPENDS:append:toolchain-clang =3D " lld-native"
+
+FTPM_UUID =3D "bc50d971-d4c9-42c4-82cb-343fb7f37896"
+
+SRC_URI_ms-tpm   ?=3D "gitsm://github.com/Microsoft/ms-tpm-20-ref;protoc=
ol=3Dhttps"
+SRC_URI_optee-ta ?=3D "gitsm://github.com/OP-TEE/optee_ftpm.git;protocol=
=3Dhttps"
+
+SRCBRANCH_ms-tpm    =3D "main"
+SRCBRANCH_optee-ta  =3D "master"
+
+SRC_URI =3D "\
+    ${SRC_URI_ms-tpm};branch=3D${SRCBRANCH_ms-tpm};name=3Dms-tpm;destsuf=
fix=3Dms-tpm \
+    ${SRC_URI_optee-ta};branch=3D${SRCBRANCH_optee-ta};name=3Doptee-ta;d=
estsuffix=3Dms-tpm/optee-ta \
+"
+
+# As per optee-ftpm TA documentation, we have to use this SHA of MS TPM =
reference
+SRCREV_ms-tpm   ?=3D "98b60a44aba79b15fcce1c0d1e46cf5918400f6a"
+
+# v4.9.0
+SRCREV_optee-ta ?=3D "a09269b15de635e1816fe832e26adfbfb44c5455"
+
+SRCREV_FORMAT    =3D "ms-tpm_optee-ta"
+
+UPSTREAM_CHECK_COMMITS =3D "1"
+
+S =3D "${UNPACKDIR}/ms-tpm"
+
+OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
+TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
+TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
+
+EXTRA_OEMAKE +=3D '\
+    COMPILER=3D${TOOLCHAIN} \
+    TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
+    CROSS_COMPILE=3D${TARGET_PREFIX} \
+    CFG_MS_TPM_20_REF=3D"${S}" \
+    CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_HOST}" \
+'
+
+EXTRA_OEMAKE:append:aarch64:qemuall =3D "\
+    CFG_ARM64_ta_arm64=3Dy \
+"
+
+CFLAGS:append:toolchain-clang =3D " -Wno-unknown-warning-option"
+
+# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
+# right path until this is relocated automatically.
+export OPENSSL_MODULES =3D "${STAGING_LIBDIR_NATIVE}/ossl-modules"
+
+PARALLEL_MAKE =3D ""
+
+do_compile() {
+    cd ${S}/optee-ta
+    oe_runmake
+}
+
+do_install () {
+    mkdir -p ${D}/${nonarch_base_libdir}/optee_armtz
+    install -D -p -m 0644 ${S}/optee-ta/${FTPM_UUID}.ta ${D}/${nonarch_b=
ase_libdir}/optee_armtz/
+    install -D -p -m 0644 ${S}/optee-ta/${FTPM_UUID}.stripped.elf ${D}/$=
{nonarch_base_libdir}/optee_armtz/
+}
+
+do_deploy () {
+    install -d ${DEPLOYDIR}/optee
+    install -D -p -m 0644 ${S}/optee-ta/${FTPM_UUID}.stripped.elf ${DEPL=
OYDIR}/optee/
+}
+
+addtask deploy before do_build after do_install
+
+FILES:${PN} +=3D " \
+               ${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.ta \
+               ${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.stripped.=
elf \
+               "
+
+# Imports machine specific configs from staging to build
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+INSANE_SKIP:${PN} +=3D "ldflags"
diff --git a/meta-arm/recipes-security/optee/optee-client_4.9.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.9.0.bb
new file mode 100644
index 00000000..b5c3f0a2
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_4.9.0.bb
@@ -0,0 +1,4 @@
+require recipes-security/optee/optee-client.inc
+
+# v4.9.0
+SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.9.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.9.0.bb
new file mode 100644
index 00000000..7c9bd972
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_4.9.0.bb
@@ -0,0 +1,4 @@
+require recipes-security/optee/optee-examples.inc
+
+# v4.9.0
+SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.bb
new file mode 100644
index 00000000..cca9f62a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.9.0.bb
@@ -0,0 +1,30 @@
+require recipes-security/optee/optee-os_${PV}.bb
+
+SUMMARY =3D "OP-TEE Trusted OS TA devkit"
+DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+DEPENDS +=3D "python3-pycryptodome-native"
+DEPENDS:append:toolchain-clang =3D " lld-native"
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
diff --git a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.9.0.bb
new file mode 100644
index 00000000..8e64a636
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_4.9.0.bb
@@ -0,0 +1,8 @@
+require recipes-security/optee/optee-os.inc
+
+DEPENDS +=3D "dtc-native"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+
+# 4.9.0
+SRCREV =3D "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
diff --git a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.9.0.bb
new file mode 100644
index 00000000..ddb574fc
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_4.9.0.bb
@@ -0,0 +1,14 @@
+require recipes-security/optee/optee-test.inc
+
+# v4.9.0
+SRCREV =3D "b27648ea8472cceceb8dda368a965c709066f7aa"
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

