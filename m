Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649BCC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 19:26:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12539.1646767562705886757
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 11:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDBFC1650
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Mar 2022 11:26:01 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B28993FA45
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Mar 2022 11:26:01 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/fvp-corstone1000: fix model location
Date: Tue,  8 Mar 2022 14:25:57 -0500
Message-Id: <20220308192557.25405-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Mar 2022 19:26:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3136

FVP is located at Linux64_GCC-9.3, not Linux64_GCC-9.4

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
index 0e56526..dcb6b7d 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb
@@ -10,5 +10,5 @@ SRC_URI[sha256sum] = "00ccb72d02c90e2424d24a625d275cabf8ea8dc024713985208f618bb8
 LIC_FILES_CHKSUM = "file://license_terms/license_agreement.txt;md5=1a33828e132ba71861c11688dbb0bd16 \
                     file://license_terms/third_party_licenses.txt;md5=41029e71051b1c786bae3112a29905a7"
 
-FVP_ARCH = "Linux64_GCC-9.4"
+FVP_ARCH = "Linux64_GCC-9.3"
 
-- 
2.17.1


