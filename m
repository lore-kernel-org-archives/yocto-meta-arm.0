Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFF8C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 13:36:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5018.1652880990105458536
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 06:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D6A3106F
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 06:36:29 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4EF823F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 06:36:29 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm-autonomy: remove README
Date: Wed, 18 May 2022 09:36:23 -0400
Message-Id: <20220518133624.24874-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220518133624.24874-1-jon.mason@arm.com>
References: <20220518133624.24874-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 13:36:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3438

meta-arm-autonomy has been EOLed for a release now.  Remove the README
and directory.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-autonomy/README.md | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-arm-autonomy/README.md

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
deleted file mode 100644
index 2e02a7f2..00000000
--- a/meta-arm-autonomy/README.md
+++ /dev/null
@@ -1,23 +0,0 @@
-meta-arm-autonomy Yocto Layer
-=============================
-
-The meta-arm-autonomy layer is being deprecated from master, with bug fixes
-only being applied to the following branches. Additionally, all support and
-maintenance of meta-arm-autonomy will stop as per the schedule below.
-
-    honister: End-of-life scheduled to June 2022
-    hardknot: End-of-life scheduled to December 2021
-    gatesgarth: End-of-life scheduled to October 2021
-    dunfell: End-of-life scheduled to October 2021
-    master: End-of-life scheduled to October 2021 and code removed
-
-
-Contributing
-------------
-This project has not put in place a process for contributions currently. If you
-would like to contribute, please contact the maintainers
-
-
-Maintainer(s)
--------------
-* Diego Sueiro <diego.sueiro@arm.com>
-- 
2.17.1


