Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4F5C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 16:40:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14624.1642696808077976657
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Jan 2022 08:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7AEEED1
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 08:40:06 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 83CEF3F73D
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 08:40:06 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Revert "ci: ignore distutil warnings"
Date: Thu, 20 Jan 2022 11:32:09 -0500
Message-Id: <20220120163209.30603-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 16:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2880

This reverts commit 63cb70be72f48fcf25fff9738536d2251ff4cafd.
---
 ci/check-warnings | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ci/check-warnings b/ci/check-warnings
index 721f198..89ae955 100755
--- a/ci/check-warnings
+++ b/ci/check-warnings
@@ -7,8 +7,7 @@ set -e -u
 
 LOGFILE=$1
 
-LINES=$(grep --invert-match -e "attempting MIRRORS if available" -e "distutils-common-base.bbclass is deprecated" -e "distutils3.bbclass is deprecated" $LOGFILE | wc -l)
-
+LINES=$(grep --invert-match "attempting MIRRORS if available" $LOGFILE | wc -l)
 if test "$LINES" -ne 0; then
     echo ==============================
     echo The build had warnings/errors:
-- 
2.17.1


