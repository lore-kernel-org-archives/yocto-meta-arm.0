Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D534ECCD1A4
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 15:09:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21330.1760972967966911203
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 08:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C10B51063
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:09:19 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F4593F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:09:27 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm/optee-ftpm: enable clang compilation
Date: Mon, 20 Oct 2025 16:09:22 +0100
Message-ID: <20251020150924.84223-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020150924.84223-1-jon.mason@arm.com>
References: <20251020150924.84223-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Oct 2025 15:09:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6741

Remove the forcing of GCC in the recipe, and make the changes necessary
to get clang working.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb b/m=
eta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb
index 756aeec6d6a1..9164f31bbc91 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb
@@ -8,16 +8,14 @@ COMPATIBLE_MACHINE:qemuarm64 =3D "qemuarm64"
 COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64"
 COMPATIBLE_MACHINE:qemuarm-secureboot =3D "qemuarm"
=20
-#FIXME - doesn't currently work with clang
-TOOLCHAIN =3D "gcc"
-
 inherit deploy python3native
=20
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5a3925ece0806073ae9ebbb08ff6f=
11e"
 LIC_FILES_CHKSUM +=3D "file://optee-ta/LICENSE;md5=3D5a3925ece0806073ae9=
ebbb08ff6f11e"
=20
-DEPENDS =3D "python3-pyelftools-native optee-os-tadevkit python3-cryptog=
raphy-native "
+DEPENDS =3D "python3-pyelftools-native optee-os-tadevkit python3-cryptog=
raphy-native"
+DEPENDS:append:toolchain-clang =3D " lld-native"
=20
 FTPM_UUID =3D "bc50d971-d4c9-42c4-82cb-343fb7f37896"
=20
@@ -49,6 +47,7 @@ TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
 TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
=20
 EXTRA_OEMAKE +=3D '\
+    COMPILER=3D${TOOLCHAIN} \
     TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
     CROSS_COMPILE=3D${TARGET_PREFIX} \
     CFG_MS_TPM_20_REF=3D"${S}" \
@@ -59,6 +58,8 @@ EXTRA_OEMAKE:append:aarch64:qemuall =3D "\
     CFG_ARM64_ta_arm64=3Dy \
 "
=20
+CFLAGS:append:toolchain-clang =3D " -Wno-unknown-warning-option"
+
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
 # right path until this is relocated automatically.
 export OPENSSL_MODULES =3D "${STAGING_LIBDIR_NATIVE}/ossl-modules"
--=20
2.50.1 (Apple Git-155)


