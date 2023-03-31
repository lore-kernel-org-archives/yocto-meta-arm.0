Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CD5C761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 16:37:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.60106.1680280641484536681
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 09:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C88516F2;
	Fri, 31 Mar 2023 09:38:05 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7344B3F6C4;
	Fri, 31 Mar 2023 09:37:20 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp-board-firmware: update to newer SHA
Date: Fri, 31 Mar 2023 16:37:13 +0000
Message-Id: <20230331163713.28364-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230331163713.28364-1-xueliang.zhong@arm.com>
References: <20230331163713.28364-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 16:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4525

From: Xueliang Zhong <xueliang.zhong@arm.com>

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 .../recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb
index ef7a4fca..6a27f02e 100644
--- a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb
+++ b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb
@@ -13,7 +13,8 @@ COMPATIBLE_MACHINE = "n1sdp"
 
 SRC_URI = "git://git.gitlab.arm.com/arm-reference-solutions/board-firmware.git;protocol=https;branch=n1sdp"
 
-SRCREV = "6d5253584a9c2fdc2edbdc39bf6f2436215d1382"
+SRCREV = "70ba494265eee76747faff38264860c19e214540"
+PV .= "+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


