Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637B6CA0EC2
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 17:19:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4936.1754414351666591173
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Aug 2025 10:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34278150C
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 10:19:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5F5F3F673
	for <meta-arm@lists.yoctoproject.org>; Tue,  5 Aug 2025 10:19:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/6] arm/optee-so: fix typo in EXTRA_OEMAKE
Date: Tue,  5 Aug 2025 18:19:03 +0100
Message-ID: <20250805171903.277422-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805171903.277422-1-ross.burton@arm.com>
References: <20250805171903.277422-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Aug 2025 17:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6661

This recipe was using EXTREA_OEMAKE to enable BTI, fix the typo.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index 973a421666..68bb1226b2 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -31,7 +31,7 @@ EXTRA_OEMAKE +=3D " HOST_PREFIX=3D${HOST_PREFIX}"
 EXTRA_OEMAKE +=3D " CROSS_COMPILE64=3D${HOST_PREFIX}"
=20
 # Enable BTI in optee
-EXTREA_OEMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-branch=
-protection', ' CFG_CORE_BTI=3D1 CFG_TA_BTI=3D1 CFG_CORE_PAUTH=3Dy CFG_TA=
_PAUTH=3Dy', '', d)}"
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-branch-=
protection', ' CFG_CORE_BTI=3D1 CFG_TA_BTI=3D1 CFG_CORE_PAUTH=3Dy CFG_TA_=
PAUTH=3Dy', '', d)}"
=20
 LDFLAGS[unexport] =3D "1"
 CPPFLAGS[unexport] =3D "1"
--=20
2.43.0


