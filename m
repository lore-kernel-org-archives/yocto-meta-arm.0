Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA757C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 19:22:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.111630.1674847325172911826
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 11:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C99BE2B;
	Fri, 27 Jan 2023 11:22:46 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.11.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B75073F71E;
	Fri, 27 Jan 2023 11:22:03 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 3/3] arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000 platform
Date: Fri, 27 Jan 2023 19:21:22 +0000
Message-Id: <20230127192122.19338-4-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
References: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 19:22:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4336

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

Inherits the UEFI capsule generation class and configures the capsule
variables for the wic.nopt image

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
index 76a7126b..b0a71bca 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
@@ -7,10 +7,17 @@ COMPATIBLE_MACHINE = "corstone1000"
 
 inherit image
 inherit wic_nopt tfm_sign_image
+inherit  uefi_capsule
 
 PACKAGE_INSTALL = ""
 
-IMAGE_FSTYPES += "wic wic.nopt"
+IMAGE_FSTYPES += "wic wic.nopt uefi_capsule"
+
+UEFI_FIRMWARE_BINARY = "corstone1000-image-${MACHINE}.wic.nopt"
+UEFI_FIRMWARE_VERSION = "5"
+UEFI_FIRMWARE_LSV = "0"
+UEFI_FIRMWARE_GUID = "e2bb9c06-70e9-4b14-97a3-5a7913176e3f"
+UEFI_FIRMWARE_UPDATE_INDEX = "0"
 
 do_sign_images() {
     # Sign TF-A BL2
-- 
2.17.1


