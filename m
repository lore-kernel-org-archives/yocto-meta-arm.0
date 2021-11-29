Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5933CC43219
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 17:58:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.64660.1638208692826511339
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 09:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CC7812FC;
	Mon, 29 Nov 2021 09:58:12 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39EFC3F5A1;
	Mon, 29 Nov 2021 09:58:11 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH][HONISTER 07/10] arm/optee-test: change DEPENDS to
 optee-os-tadevkit
Date: Mon, 29 Nov 2021 17:57:46 +0000
Message-Id: <20211129175749.10391-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
References: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 17:58:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2487

From: Ross Burton <ross.burton@arm.com>

Now that the TA devkit has been split out of optee-os, the build
dependencies of optee-test need to be updated too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-test.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
index c0f35b3..f10c048 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
 inherit python3native ptest
 require optee.inc
 
-DEPENDS = "optee-client optee-os python3-pycryptodome-native"
+DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
 
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
            file://run-ptest \
-- 
2.17.1


