Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A3AC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:36:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9395.1646919371951238340
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 05:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FAF01691
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 05:36:11 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64ADB3FA27
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 05:36:11 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Revert "CI: use kas:latest, needed for the latest bitbake"
Date: Thu, 10 Mar 2022 08:36:05 -0500
Message-Id: <20220310133605.7883-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 13:36:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3146

This reverts commit a2b945c75ebb671403d61ecbee08efbfc92ae845.
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2a450ea..1319593 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: ghcr.io/siemens/kas/kas:latest
+image: ghcr.io/siemens/kas/kas:latest-release
 
 stages:
   - prep
-- 
2.17.1


