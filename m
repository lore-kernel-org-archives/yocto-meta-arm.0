Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1810C4167B
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 16:59:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.32703.1699635550678869522
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Nov 2023 08:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4301D1692;
	Fri, 10 Nov 2023 08:59:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0AAB23F6C4;
	Fri, 10 Nov 2023 08:59:08 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm-bsp/fvp-base: upgrade tune to v8.4
Date: Fri, 10 Nov 2023 16:59:03 +0000
Message-Id: <20231110165904.1349985-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110165904.1349985-1-ross.burton@arm.com>
References: <20231110165904.1349985-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Nov 2023 16:59:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5228

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


