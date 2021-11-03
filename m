Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B584C433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:16:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12435.1636035404118142710
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Nov 2021 07:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF8CB113E
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Nov 2021 07:16:13 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A28D63F7D7
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Nov 2021 07:16:13 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] CI: remove target from testimage yml file
Date: Wed,  3 Nov 2021 14:36:19 -0400
Message-Id: <20211103183620.15870-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211103183620.15870-1-jon.mason@arm.com>
References: <20211103183620.15870-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Nov 2021 14:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2341

Since we are using TESTIMAGE_AUTO, providing the target field in the
testimage yml file is no longer necessary.  This allows for multiple
payloads to be built, while still allowing for testing.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/testimage.yml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/ci/testimage.yml b/ci/testimage.yml
index 70a08e0..2f7b8e9 100644
--- a/ci/testimage.yml
+++ b/ci/testimage.yml
@@ -11,7 +11,3 @@ local_conf_header:
     QEMU_USE_SLIRP = "1"
   packages: |
     IMAGE_FEATURES:append = " ssh-server-dropbear"
-
-# Multiple targets are available, put it down to just one
-target:
-  - core-image-base
-- 
2.17.1


