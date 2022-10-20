Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293A1ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 13:48:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.19330.1666619320164790266
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 06:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D66BFED1
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 06:48:45 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E6A23F792
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 06:48:39 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: Remove host bitbake variables
Date: Thu, 20 Oct 2022 10:09:38 -0400
Message-Id: <20221020140938.7171-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 13:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4021

Bitbake variables were being set in KAS for the unique Gitlab CI
configuration being used internally.  While this should not have been
significantly detrimental for other setups, this shouldn't be necessary
with proper runner setup.  Removing them here to all for a more generic
CI experience.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/ci/base.yml b/ci/base.yml
index 3619b8f2..0c211e4a 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -26,13 +26,7 @@ env:
 
 local_conf_header:
   base: |
-    BB_SERVER_TIMEOUT = "60"
     CONF_VERSION = "2"
-    BB_NUMBER_THREADS = "16"
-    PARALLEL_MAKE = "-j16"
-    XZ_MEMLIMIT = "25%"
-    XZ_THREADS = "16"
-    ZSTD_THREADS = "16"
     LICENSE_FLAGS_ACCEPTED += "Arm-FVP-EULA"
   setup: |
     PACKAGE_CLASSES = "package_ipk"
-- 
2.17.1


