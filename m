Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522E8CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 16:46:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3096.1759164357933495805
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Sep 2025 09:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 509BB150C
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Sep 2025 09:45:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F00A93F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Sep 2025 09:45:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/optee: remove redundant libgcc flags
Date: Mon, 29 Sep 2025 17:45:51 +0100
Message-ID: <20250929164552.2107331-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Sep 2025 16:46:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6718

Upstream appear to have resolved the libgcc linkage issues as these
variables are not used in upstream nor our patches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 4 ----
 meta-arm/recipes-security/optee/optee.inc    | 1 -
 2 files changed, 5 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index 3065f71f6e..41eb6d1f32 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -38,10 +38,6 @@ CPPFLAGS[unexport] =3D "1"
 AS[unexport] =3D "1"
 LD[unexport] =3D "1"
=20
-do_compile:prepend() {
-	PLAT_LIBGCC_PATH=3D$(${CC} -print-libgcc-file-name)
-}
-
 do_compile() {
     oe_runmake -C ${S} all
 }
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes=
-security/optee/optee.inc
index 5f01570fcf..a7d64af56a 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -24,7 +24,6 @@ OPTEE_COMPILER =3D "${@bb.utils.contains("BBFILE_COLLEC=
TIONS", "clang-layer", "${O
 TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
=20
 EXTRA_OEMAKE +=3D "V=3D1 \
-                 LIBGCC_LOCATE_CFLAGS=3D'${HOST_CC_ARCH}${TOOLCHAIN_OPTI=
ONS}' \
                  COMPILER=3D${OPTEE_COMPILER} \
                  OPTEE_CLIENT_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
                  TEEC_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
--=20
2.43.0


