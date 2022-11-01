Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E7BC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:25:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.734.1667348741871498275
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 17:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 374F41FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Nov 2022 17:25:47 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C98FE3F534
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Nov 2022 17:25:40 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/opencsd: update to version 1.3.1
Date: Tue,  1 Nov 2022 09:15:35 -0400
Message-Id: <20221101131536.29976-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Nov 2022 00:25:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4072

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.2.0.bb => opencsd_1.3.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.2.0.bb => opencsd_1.3.1.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.2.0.bb b/meta-arm/recipes-devtools/opencsd/opencsd_1.3.1.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.2.0.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.3.1.bb
index 0ff4b172..1c1abaa7 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.2.0.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
 
 SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https;branch=master"
-SRCREV = "dac554d62d514b202174506995afc0e109ef3fea"
+SRCREV = "8dab50c35c8d181fc3ed6ad46e156398447d753f"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


