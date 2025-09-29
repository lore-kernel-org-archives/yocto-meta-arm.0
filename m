Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A1CCAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 16:46:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3247.1759164358491325898
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Sep 2025 09:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED3051758
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Sep 2025 09:45:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 980A43F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Sep 2025 09:45:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/optee: clean up OPTEE_COMPILER assignment
Date: Mon, 29 Sep 2025 17:45:52 +0100
Message-ID: <20250929164552.2107331-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929164552.2107331-1-ross.burton@arm.com>
References: <20250929164552.2107331-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Sep 2025 16:46:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6719

Now that clang is part of oe-core we can't use meta-clang being present
as an indicator of clang being available.

This does mean we can clean up the logic and just use TOOLCHAIN, as that
is always set now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes=
-security/optee/optee.inc
index a7d64af56a..4dc241543e 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -16,15 +16,13 @@ OPTEE_ARCH:arm =3D "arm32"
 OPTEE_ARCH:aarch64 =3D "arm64"
 OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
=20
-OPTEE_TOOLCHAIN =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-OPTEE_COMPILER =3D "${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-la=
yer", "${OPTEE_TOOLCHAIN}", "gcc", d)}"
-
 # Set here but not passed to EXTRA_OEMAKE by default as that breaks
 # the optee-os build
 TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
=20
+# Assume that our TOOLCHAIN matches OP-TEE's COMPILER
 EXTRA_OEMAKE +=3D "V=3D1 \
-                 COMPILER=3D${OPTEE_COMPILER} \
+                 COMPILER=3D${TOOLCHAIN} \
                  OPTEE_CLIENT_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
                  TEEC_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
                 "
--=20
2.43.0


