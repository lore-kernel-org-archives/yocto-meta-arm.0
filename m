Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13216.1607608649011908036
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 05:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69F6F1FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 05:57:28 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A5313F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 05:57:28 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp: Fix FVP kernel warning
Date: Thu, 10 Dec 2020 08:57:21 -0500
Message-Id: <20201210135721.29575-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210135721.29575-1-jon.mason@arm.com>
References: <20201210135721.29575-1-jon.mason@arm.com>

ARM_TIMER_SP804 config entry is not being found.  Add COMPILE_TEST to
allow for it to show up.

Change-Id: Ie10dc80dfe32334549680d7154c5c62fee9ef492
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg
index 144977f..b33c65c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg
@@ -1,3 +1,4 @@
 # Dual timer module
+CONFIG_COMPILE_TEST=y
 CONFIG_ARM_TIMER_SP804=y
 CONFIG_CLK_SP810=y
-- 
2.17.1

