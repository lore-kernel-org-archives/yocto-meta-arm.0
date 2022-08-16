Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86638C28B2B
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 13:14:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15221.1660655686334814765
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Aug 2022 06:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDB5E14BF;
	Tue, 16 Aug 2022 06:14:46 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47F213F66F;
	Tue, 16 Aug 2022 06:14:45 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm/optee: update optee-client to v3.18
Date: Tue, 16 Aug 2022 14:14:34 +0100
Message-Id: <20220816131434.26265-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220816131434.26265-1-vishnu.banavath@arm.com>
References: <20220816131434.26265-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Aug 2022 13:14:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3694

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to update optee-client to v3.18

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 meta-arm/recipes-security/optee/optee-client_3.17.0.bb | 3 ---
 meta-arm/recipes-security/optee/optee-client_3.18.0.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.17.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-client_3.18.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-client_3.17.0.bb b/meta-arm/recipes-security/optee/optee-client_3.17.0.bb
deleted file mode 100644
index 5de16e7a..00000000
--- a/meta-arm/recipes-security/optee/optee-client_3.17.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-client.inc
-
-SRCREV = "9a337049c52495e5e16b4a94decaa3e58fce793e"
diff --git a/meta-arm/recipes-security/optee/optee-client_3.18.0.bb b/meta-arm/recipes-security/optee/optee-client_3.18.0.bb
new file mode 100644
index 00000000..0c831db2
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_3.18.0.bb
@@ -0,0 +1,3 @@
+require optee-client.inc
+
+SRCREV = "e7cba71cc6e2ecd02f412c7e9ee104f0a5dffc6f"
-- 
2.17.1


