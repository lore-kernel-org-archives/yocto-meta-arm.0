Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E23FFA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:36:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.151.1666370182573955855
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 09:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6782B1477;
	Fri, 21 Oct 2022 09:36:28 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FBFB3F792;
	Fri, 21 Oct 2022 09:36:21 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] runfvp: corstone1000: add mmc card configuration
Date: Fri, 21 Oct 2022 17:36:12 +0100
Message-Id: <20221021163612.27717-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021163612.27717-1-vishnu.banavath@arm.com>
References: <20221021163612.27717-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 16:36:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4002

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to pass appropriate MMC card configuration to
corstone1000 FVP.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
index 4433f8bd..991a5bac 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -42,3 +42,7 @@ FVP_TERMINALS[host.host_terminal_1] ?= "Secure World Console"
 FVP_TERMINALS[se.secenc_terminal] ?= "Secure Enclave Console"
 FVP_TERMINALS[extsys0.extsys_terminal] ?= "Cortex M3"
 
+# MMC card configuration
+FVP_CONFIG[board.msd_mmc.card_type] ?= "SDHC"
+FVP_CONFIG[board.msd_mmc.p_fast_access] ?= "0"
+FVP_CONFIG[board.msd_mmc.diagnostics] ?= "2"
-- 
2.17.1


