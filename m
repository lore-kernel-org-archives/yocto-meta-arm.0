Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B5FC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 17:58:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.64261.1638208697015119335
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 09:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5CD01063;
	Mon, 29 Nov 2021 09:58:16 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83CAD3F5A1;
	Mon, 29 Nov 2021 09:58:15 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH][HONISTER 10/10] CI: build optee-spdevkit for qemuarm64
Date: Mon, 29 Nov 2021 17:57:49 +0000
Message-Id: <20211129175749.10391-11-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
References: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 17:58:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2490

From: Ross Burton <ross.burton@arm.com>

To ensure that optee-spdevkit works in all configurations, but it in the
CI for qemuarm64 not just corstone1000.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/qemuarm64-secureboot.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index 6ea2064..31f195d 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -15,3 +15,5 @@ target:
   - perf
   - optee-examples
   - optee-test
+  - optee-spdevkit
+  - optee-os-tadevkit
\ No newline at end of file
-- 
2.17.1


