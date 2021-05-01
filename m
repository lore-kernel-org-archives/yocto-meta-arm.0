Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6112.1619869751580535713
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 01 May 2021 04:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B8C411D4
	for <meta-arm@lists.yoctoproject.org>; Sat,  1 May 2021 04:49:01 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF0003F70D
	for <meta-arm@lists.yoctoproject.org>; Sat,  1 May 2021 04:49:00 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] CI: use public KAS image
Date: Sat,  1 May 2021 07:48:53 -0400
Message-Id: <20210501114854.1800-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501114854.1800-1-jon.mason@arm.com>
References: <20210501114854.1800-1-jon.mason@arm.com>

Use the KAS docker image provided by the KAs project for Gitlab CI.
This allows for the external (non-Arm Corp) users/developers to run
Gitlab CI.

Change-Id: I9fee9a0d571e3fd60862d4ccd36176f9e583fc91
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f0e844f..dcf13b0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,5 +1,4 @@
-# Use our custom Crops-derived image
-image: $CI_REGISTRY/$CI_PROJECT_NAMESPACE/yocto-builder:master
+image: ghcr.io/siemens/kas/kas
 
   # First do a common bootstrap, and then build all the targets
 stages:
-- 
2.17.1

