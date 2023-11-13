Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14ED5C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 17:50:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1967.1699897809024228978
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 09:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C18CE1007;
	Mon, 13 Nov 2023 09:50:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C59643F6C4;
	Mon, 13 Nov 2023 09:50:07 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm-bsp/fvp-base: upgrade tune to v8.4
Date: Mon, 13 Nov 2023 17:50:04 +0000
Message-Id: <20231113175005.174725-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231113175005.174725-1-ross.burton@arm.com>
References: <20231113175005.174725-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 17:50:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5239

From: Ross Burton <ross.burton@arm.com>

We already tell the FVP to be v8.4 cores, so tell the compiler to
tune for that instruction set too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 43f2a8d7..39ef38be 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -4,9 +4,7 @@
 #@NAME: Armv8-A Base Platform FVP machine
 #@DESCRIPTION: Machine configuration for Armv8-A Base Platform FVP model
=20
-require conf/machine/include/arm/arch-armv8a.inc
-
-TUNE_FEATURES =3D "aarch64"
+require conf/machine/include/arm/arch-armv8-4a.inc
=20
 ARM_SYSTEMREADY_FIRMWARE =3D "trusted-firmware-a:do_deploy"
 ARM_SYSTEMREADY_ACS_CONSOLE =3D "default"
--=20
2.34.1


