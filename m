Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66F5C001DC
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:20:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19756.1686838799677897591
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EFB31FB;
	Thu, 15 Jun 2023 07:20:43 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.33.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 635673F663;
	Thu, 15 Jun 2023 07:19:58 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH mickledore 17/17] optee-os: do not explicitly set CFG_MAP_EXT_DT_SECURE=y
Date: Thu, 15 Jun 2023 16:19:30 +0200
Message-Id: <20230615141930.2407-17-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
References: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:20:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4800

From: Denys Dmytriyenko <denis@denix.org>

CFG_MAP_EXT_DT_SECURE=3Dy should be set per platform, as it requires CFG_=
DT=3Dy
to also be set, which is not the case for all the platforms out there usi=
ng
optee-os. Moreover CFG_MAP_EXT_DT_SECURE is already being set conditional=
ly
in optee-os-ts.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-security/optee/optee-os_3.20.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.20.0.bb
index 2d4d6d6d..2fdfbb5a 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
@@ -12,4 +12,3 @@ SRC_URI:append =3D " \
     file://0007-core-spmc-handle-non-secure-interrupts.patch \
     file://0008-core-spmc-configure-SP-s-NS-interrupt-action-based-o.pat=
ch \
    "
-EXTRA_OEMAKE +=3D " CFG_MAP_EXT_DT_SECURE=3Dy"
--=20
2.39.1.windows.1


