Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3512AC25B0E
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 21:38:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8480.1660599523765589309
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 14:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17472113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 14:38:44 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F80B3F67D
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 14:38:43 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/fvp: use image-artifact-names as an image class
Date: Mon, 15 Aug 2022 09:39:46 -0400
Message-Id: <20220815133948.26528-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 21:38:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3687

Per upstream commit, image-artifact-names must be used as an image
class

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/classes/fvpboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.bbclass
index ec9d4f5b..fbdfa965 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -26,7 +26,7 @@ FVP_EXTRA_ARGS ?= ""
 
 EXTRA_IMAGEDEPENDS += "${FVP_PROVIDER}"
 
-inherit image-artifact-names
+IMAGE_CLASSES += "image-artifact-names"
 
 IMAGE_POSTPROCESS_COMMAND += "do_write_fvpboot_conf;"
 python do_write_fvpboot_conf() {
-- 
2.17.1


