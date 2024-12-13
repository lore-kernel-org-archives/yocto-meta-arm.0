Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABC3E7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 15:56:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19156.1734105372268742048
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 07:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B85991480
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 07:56:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5129C3F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 07:56:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/linux-yocto: fix Juno build with linux 6.12
Date: Fri, 13 Dec 2024 15:56:07 +0000
Message-ID: <20241213155608.726466-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Dec 2024 15:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6288

The DesignWare platform driver is hidden behind a DesignWare Core option
now, so enable that too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../arm-platforms-kmeta/bsp/arm-platforms/juno/juno-i2c.cfg      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno/juno-i2c.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pla=
tforms-kmeta/bsp/arm-platforms/juno/juno-i2c.cfg
index 97f80c43..9a341fda 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-i2c.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-i2c.cfg
@@ -1,2 +1,3 @@
 CONFIG_I2C=3Dy
+CONFIG_I2C_DESIGNWARE_CORE=3Dy
 CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
--=20
2.43.0


