Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02331C61DA3
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 15:35:41 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com [217.140.106.54])
 by mx.groups.io with SMTP id smtpd.web10.105036.1674833739521102965
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 07:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.106.54, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 30RFZa4U019280;
	Fri, 27 Jan 2023 15:35:36 GMT
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH] arm/kernel: Update ARM-FFA kernel drivers
Date: Fri, 27 Jan 2023 15:35:29 +0000
Message-Id: <20230127153529.734629-1-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 15:35:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4325

 New arm-ffa-tee and arm-ffa-user drivers are compatible with 5.* and 6.1 kernels.

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .../{arm-ffa-tee_1.1.1.bb => arm-ffa-tee_1.1.2.bb}            | 4 ++--
 .../{arm-ffa-user_5.0.0.bb => arm-ffa-user_5.0.1.bb}          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-kernel/arm-ffa-tee/{arm-ffa-tee_1.1.1.bb => arm-ffa-tee_1.1.2.bb} (89%)
 rename meta-arm/recipes-kernel/arm-ffa-user/{arm-ffa-user_5.0.0.bb => arm-ffa-user_5.0.1.bb} (92%)

diff --git a/meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.1.bb b/meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.2.bb
similarity index 89%
rename from meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.1.bb
rename to meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.2.bb
index 9e997de1..5790d00f 100644
--- a/meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.1.bb
+++ b/meta-arm/recipes-kernel/arm-ffa-tee/arm-ffa-tee_1.1.2.bb
@@ -10,8 +10,8 @@ SRC_URI = "git://gitlab.arm.com/linux-arm/linux-trusted-services;protocol=https;
           "
 S = "${WORKDIR}/git"
 
-# Tag tee-v1.1
-SRCREV = "3b543b7591505b715f332c972248a3ea41604d83"
+# Tag tee-v1.1.2
+SRCREV = "8a81f5d2406f146b15a705d49b256efaa5fa3ba9"
 
 COMPATIBLE_HOST = "(arm|aarch64).*-linux"
 KERNEL_MODULE_AUTOLOAD += "arm-ffa-tee"
diff --git a/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.0.bb b/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.1.bb
similarity index 92%
rename from meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.0.bb
rename to meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.1.bb
index 8d86197d..1261fa41 100644
--- a/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.0.bb
+++ b/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.1.bb
@@ -11,8 +11,8 @@ SRC_URI = "git://gitlab.arm.com/linux-arm/linux-trusted-services;protocol=https;
           "
 S = "${WORKDIR}/git"
 
-# Tag 5.0.0.
-SRCREV = "6ec4196a59db8204ed670ef3b78f24a8234b85a6"
+# Tag debugfs-v5.0.1
+SRCREV = "18e3be71f65a405dfb5d97603ae71b3c11759861"
 
 COMPATIBLE_HOST = "(arm|aarch64).*-linux"
 KERNEL_MODULE_AUTOLOAD += "arm-ffa-user"
-- 
2.25.1


