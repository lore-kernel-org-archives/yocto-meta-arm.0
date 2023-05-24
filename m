Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0CFC7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:08:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9827.1684937307127223021
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 07:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4C381042;
	Wed, 24 May 2023 07:09:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4DFB83F762;
	Wed, 24 May 2023 07:08:26 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-bsp/fvp-base: remove u-boot version pinning
Date: Wed, 24 May 2023 15:08:23 +0100
Message-Id: <20230524140823.3624031-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524140823.3624031-1-ross.burton@arm.com>
References: <20230524140823.3624031-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 14:08:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4691

From: Ross Burton <ross.burton@arm.com>

The fvp-base machine only has minimal patches, so should be good to
always track the latest release of u-boot.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index bc29e888..39d6e68b 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -9,8 +9,6 @@ require conf/machine/include/arm/arch-armv8a.inc
=20
 TUNE_FEATURES =3D "aarch64"
=20
-PREFERRED_VERSION_u-boot ?=3D "2023.01"
-
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
=20
--=20
2.34.1


