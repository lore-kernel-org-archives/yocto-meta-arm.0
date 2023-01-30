Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BFCC61DA4
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 11:24:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.38540.1675077871608110677
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 03:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3293E1713
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 03:25:13 -0800 (PST)
Received: from jdm-VirtualBox.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6A8A3F71E
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 03:24:30 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/fvp-base: update kernel config to remove warning
Date: Mon, 30 Jan 2023 06:24:25 -0500
Message-Id: <20230130112425.784450-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130112425.784450-1-jon.mason@arm.com>
References: <20230130112425.784450-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 11:24:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4340

With the 6.1 kernel, fvp-base logs the warning:
    [NOTE]: 'CONFIG_ARM_CPUIDLE' last val (y) and .config val (n) do not =
match

This is because the kernel idle configs have changed.  Remove this
entry, as it is no longer necessary.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-board.cfg      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp/fvp-board.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pla=
tforms-kmeta/bsp/arm-platforms/fvp/fvp-board.cfg
index 2fd0264a..a9ee80e1 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp/fvp-board.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp/fvp-board.cfg
@@ -8,4 +8,3 @@ CONFIG_REGULATOR=3Dy
 CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
=20
 CONFIG_CPU_IDLE=3Dy
-CONFIG_ARM_CPUIDLE=3Dy
--=20
2.25.1


