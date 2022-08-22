Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711ACC32789
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 16:55:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.20644.1661187308662372202
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Aug 2022 09:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6360811FB;
	Mon, 22 Aug 2022 09:55:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98A2C3F70D;
	Mon, 22 Aug 2022 09:55:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm/trusted-firmware-a: remove redundant patches
Date: Mon, 22 Aug 2022 17:55:03 +0100
Message-Id: <20220822165505.3603138-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Aug 2022 16:55:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3708

These were integrated into the 2.7.0 release, but were not removed when
the recipe was upgraded.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...uild-deps-upgrade-to-mbed-TLS-2.28.0.patch | 72 -------------------
 .../trusted-firmware-a/files/ssl.patch        | 52 --------------
 2 files changed, 124 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/build-d=
eps-upgrade-to-mbed-TLS-2.28.0.patch
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.pat=
ch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upg=
rade-to-mbed-TLS-2.28.0.patch b/meta-arm/recipes-bsp/trusted-firmware-a/f=
iles/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
deleted file mode 100644
index 058423c6..00000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to=
-mbed-TLS-2.28.0.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-
-From a93084be95634b66b917f1c8baf403067dc75c5d Mon Sep 17 00:00:00 2001
-From: Sandrine Bailleux <sandrine.bailleux@arm.com>
-Date: Thu, 21 Apr 2022 10:21:29 +0200
-Subject: [PATCH] build(deps): upgrade to mbed TLS 2.28.0
-
-Upgrade to the latest and greatest 2.x release of Mbed TLS library
-(i.e. v2.28.0) to take advantage of their bug fixes.
-
-Note that the Mbed TLS project published version 3.x some time
-ago. However, as this is a major release with API breakages, upgrading
-to 3.x might require some more involved changes in TF-A, which we are
-not ready to do. We shall upgrade to mbed TLS 3.x after the v2.7
-release of TF-A.
-
-Actually, the upgrade this time simply boils down to including the new
-source code module 'constant_time.c' into the firmware.
-
-To quote mbed TLS v2.28.0 release notes [1]:
-
-  The mbedcrypto library includes a new source code module
-  constant_time.c, containing various functions meant to resist timing
-  side channel attacks. This module does not have a separate
-  configuration option, and functions from this module will be
-  included in the build as required.
-
-As a matter of fact, if one is attempting to link TF-A against mbed
-TLS v2.28.0 without the present patch, one gets some linker errors
-due to missing symbols from this new module.
-
-Apart from this, none of the items listed in mbed TLS release
-notes [1] directly affect TF-A. Special note on the following one:
-
-  Fix a bug in mbedtls_gcm_starts() when the bit length of the iv
-  exceeds 2^32.
-
-In TF-A, we do use mbedtls_gcm_starts() when the firmware decryption
-feature is enabled with AES-GCM as the authenticated decryption
-algorithm (DECRYPTION_SUPPORT=3Daes_gcm). However, the iv_len variable
-which gets passed to mbedtls_gcm_starts() is an unsigned int, i.e. a
-32-bit value which by definition is always less than 2**32. Therefore,
-we are immune to this bug.
-
-With this upgrade, the size of BL1 and BL2 binaries does not appear to
-change on a standard sample test build (with trusted boot and measured
-boot enabled).
-
-[1] https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.0
-
-Change-Id: Icd5dbf527395e9e22c8fd6b77427188bd7237fd6
-Signed-off-by: Sandrine Bailleux <sandrine.bailleux@arm.com>
----
- drivers/auth/mbedtls/mbedtls_common.mk | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drivers/auth/mbedtls/mbedtls_common.mk b/drivers/auth/mbedt=
ls/mbedtls_common.mk
-index 0a4775d00..3eb41617f 100644
---- a/drivers/auth/mbedtls/mbedtls_common.mk
-+++ b/drivers/auth/mbedtls/mbedtls_common.mk
-@@ -48,6 +48,7 @@ LIBMBEDTLS_SRCS		:=3D $(addprefix ${MBEDTLS_DIR}/libra=
ry/,	\
- 					rsa_internal.c				\
- 					x509.c 					\
- 					x509_crt.c 				\
-+					constant_time.c 			\
- 					)
-=20
- # The platform may define the variable 'TF_MBEDTLS_KEY_ALG' to select t=
he key
---=20
-2.25.1
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch b/me=
ta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
deleted file mode 100644
index cdabd1b7..00000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-fiptool: respect OPENSSL_DIR
-
-fiptool links to libcrypto, so as with the other tools it should respect
-OPENSSL_DIR for include/library paths.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/Makefile b/Makefile
-index ec6f88585..2d3b9fc26 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1388,7 +1388,7 @@ fwu_fip: ${BUILD_PLAT}/${FWU_FIP_NAME}
-=20
- ${FIPTOOL}: FORCE
- ifdef UNIX_MK
--	${Q}${MAKE} CPPFLAGS=3D"-DVERSION=3D'\"${VERSION_STRING}\"'" FIPTOOL=3D=
${FIPTOOL} --no-print-directory -C ${FIPTOOLPATH}
-+	${Q}${MAKE} CPPFLAGS=3D"-DVERSION=3D'\"${VERSION_STRING}\"'" FIPTOOL=3D=
${FIPTOOL} OPENSSL_DIR=3D${OPENSSL_DIR} --no-print-directory -C ${FIPTOOL=
PATH}
- else
- # Clear the MAKEFLAGS as we do not want
- # to pass the gnumake flags to nmake.
-diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
-index 11d2e7b0b..7c2a08379 100644
---- a/tools/fiptool/Makefile
-+++ b/tools/fiptool/Makefile
-@@ -12,6 +12,8 @@ FIPTOOL ?=3D fiptool${BIN_EXT}
- PROJECT :=3D $(notdir ${FIPTOOL})
- OBJECTS :=3D fiptool.o tbbr_config.o
- V ?=3D 0
-+OPENSSL_DIR :=3D /usr
-+
-=20
- override CPPFLAGS +=3D -D_GNU_SOURCE -D_XOPEN_SOURCE=3D700
- HOSTCCFLAGS :=3D -Wall -Werror -pedantic -std=3Dc99
-@@ -20,7 +22,7 @@ ifeq (${DEBUG},1)
- else
-   HOSTCCFLAGS +=3D -O2
- endif
--LDLIBS :=3D -lcrypto
-+LDLIBS :=3D -L${OPENSSL_DIR}/lib -lcrypto
-=20
- ifeq (${V},0)
-   Q :=3D @
-@@ -28,7 +30,7 @@ else
-   Q :=3D
- endif
-=20
--INCLUDE_PATHS :=3D -I../../include/tools_share
-+INCLUDE_PATHS :=3D -I../../include/tools_share  -I${OPENSSL_DIR}/includ=
e
-=20
- HOSTCC ?=3D gcc
-=20
--=20
2.34.1


