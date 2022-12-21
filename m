Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C274C10F1B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 14:39:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20083.1671633591461060195
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 06:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19C3CAD7;
	Wed, 21 Dec 2022 06:40:32 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48B3E3F71E;
	Wed, 21 Dec 2022 06:39:50 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 3/5] arm-bsp/optee-os: Adds 3.19 bbappend
Date: Wed, 21 Dec 2022 14:39:40 +0000
Message-Id: <20221221143942.15196-4-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221221143942.15196-1-emekcan.aras@arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 14:39:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4218

From: Emekcan Aras <emekcan.aras@arm.com>

From: Emekcan <emekcan.aras@arm.com>

This commit adds bbappend file for new optee-os 3.19 version.

Signed-off-by: Emekcan <emekcan.aras@arm.com>
---
 .../recipes-security/optee/optee-os_3.19.0.bbappend         | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.19.0.bbappend

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.19.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.19.0.bbappend
new file mode 100644
index 00000000..f80e09f8
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.19.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_REQUIRE ?= ""
+MACHINE_OPTEE_OS_REQUIRE:n1sdp = "optee-os-n1sdp.inc"
+
+require ${MACHINE_OPTEE_OS_REQUIRE}
-- 
2.17.1


