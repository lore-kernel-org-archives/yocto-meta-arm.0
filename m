Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18394C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 13:59:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12451.1638971959868098554
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EA45D6E;
	Wed,  8 Dec 2021 05:59:19 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42A803F73B;
	Wed,  8 Dec 2021 05:59:18 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 6/8] arm/secure-partitions: pass TS_PLATFORM in the configure
 task
Date: Wed,  8 Dec 2021 13:58:58 +0000
Message-Id: <20211208135900.683-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
References: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Dec 2021 13:59:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2567

From: Vishnu Banavath <vishnu.banavath@arm.com>

This commit passes the platform name to CMake through the
configure task.

Change-Id: I7aaf10e3709507c65dd81c31e0301df57bbdf4fc
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../recipes-security/trusted-services/secure-partitions_git.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
index ca7ff81..b8b02e0 100644
--- a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
+++ b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
@@ -56,6 +56,7 @@ do_configure() {
           -DCMAKE_INSTALL_PREFIX=${D}/firmware/sp \
           -DSP_DEV_KIT_DIR=${SP_DEV_KIT_DIR} \
           -DSP_PACKAGING_METHOD=${SP_PACKAGING_METHOD} \
+	  -DTS_PLATFORM="${TS_PLATFORM}" \
           -S ${S}/$TS_DEPLOYMENT -B "${B}/$TS_DEPLOYMENT"
     done
 }
-- 
2.17.1


