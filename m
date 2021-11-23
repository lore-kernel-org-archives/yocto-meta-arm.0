Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE46C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 15:59:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13249.1637683183020533708
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 07:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3B641FB;
	Tue, 23 Nov 2021 07:59:41 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E009F3F5A1;
	Tue, 23 Nov 2021 07:59:39 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	vishnu.banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][honister 02/19] arm-bsp/trusted-firmware-a: remove TARGET_FPU
 build argument
Date: Tue, 23 Nov 2021 15:59:09 +0000
Message-Id: <20211123155926.31743-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
References: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 15:59:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2431

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

TARGET_FPU passed to TF-A Makefile but is not used in TF-A source code.

Change-Id: I7c275711ed1e9fb9ee4e4df2b9c1606cacc4138c
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index ef1b744..1fd99e7 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -143,7 +143,6 @@ EXTRA_OEMAKE += "OPENSSL_DIR=${STAGING_DIR_NATIVE}/${prefix_native}"
 
 # Runtime variables
 EXTRA_OEMAKE += "RUNTIME_SYSROOT=${STAGING_DIR_HOST}"
-EXTRA_OEMAKE += "TARGET_FPU=${TARGET_FPU}"
 
 BUILD_DIR = "${B}/${TFA_PLATFORM}"
 BUILD_DIR .= "${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
-- 
2.17.1


