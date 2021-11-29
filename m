Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59485C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 17:58:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.64659.1638208691270810224
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 09:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE22812FC;
	Mon, 29 Nov 2021 09:58:10 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1C233F5A1;
	Mon, 29 Nov 2021 09:58:09 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH][HONISTER 06/10] arm/optee-test: use precise BSD license
Date: Mon, 29 Nov 2021 17:57:45 +0000
Message-Id: <20211129175749.10391-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
References: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 17:58:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2486

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-test.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
index 0a8e56c..c0f35b3 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -2,7 +2,7 @@ SUMMARY = "OP-TEE sanity testsuite"
 DESCRIPTION = "Open Portable Trusted Execution Environment - Test suite"
 HOMEPAGE = "https://www.op-tee.org/"
 
-LICENSE = "BSD & GPLv2"
+LICENSE = "BSD-2-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
 
 inherit python3native ptest
-- 
2.17.1


