Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE24C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 16:56:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.95699.1677516982542918272
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 08:56:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C2EAC14;
	Mon, 27 Feb 2023 08:57:05 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.52.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 220123F881;
	Mon, 27 Feb 2023 08:56:20 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 1/1] arm/uefi_capsule: Move UEFI capsule to IMGDEPLOYDIR
Date: Mon, 27 Feb 2023 16:56:11 +0000
Message-Id: <20230227165611.1337-2-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230227165611.1337-1-gowtham.sureshkumar@arm.com>
References: <20230227165611.1337-1-gowtham.sureshkumar@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Feb 2023 16:56:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4456

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The UEFI capsule generated is in the incorrect build directory.
This patch copies it to IMGDEPLOYDIR.

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 meta-arm/classes/uefi_capsule.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uefi_capsule.bbclass
index cf708412..690e7af4 100644
--- a/meta-arm/classes/uefi_capsule.bbclass
+++ b/meta-arm/classes/uefi_capsule.bbclass
@@ -43,7 +43,7 @@ IMAGE_CMD:uefi_capsule(){
     envsubst < ${UEFI_CAPSULE_CONFIG} > ./${MACHINE}-capsule-update-image.json
 
     ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/GenerateCapsule \
-    -e -o ${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} -j \
+    -e -o ${IMGDEPLOYDIR}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} -j \
     ${MACHINE}-capsule-update-image.json
 
     # Remove the firmware to avoid contamination of IMGDEPLOYDIR
-- 
2.17.1


