Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620D1C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.62.1664802074312533045
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B1D916F8;
	Mon,  3 Oct 2022 06:01:20 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D2F23F73B;
	Mon,  3 Oct 2022 06:01:12 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 04/12] arm-bsp/optee-spdevkit: corstone1000: drop the support
Date: Mon,  3 Oct 2022 14:00:43 +0100
Message-Id: <20221003130051.28934-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3898

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

optee-spdevkit no longer used. It has been replaced with newlib

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../recipes-security/optee/optee-spdevkit-corstone1000.inc       | 1 -
 .../recipes-security/optee/optee-spdevkit_3.10.0.bbappend        | 1 -
 2 files changed, 2 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-spdevkit-corstone1000.inc

diff --git a/meta-arm-bsp/recipes-security/optee/optee-spdevkit-corstone1000.inc b/meta-arm-bsp/recipes-security/optee/optee-spdevkit-corstone1000.inc
deleted file mode 100644
index db85ed8e..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-spdevkit-corstone1000.inc
+++ /dev/null
@@ -1 +0,0 @@
-require optee-os-corstone1000-common.inc
diff --git a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_3.10.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_3.10.0.bbappend
index 5f74ae45..cfc3023f 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_3.10.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_3.10.0.bbappend
@@ -1,6 +1,5 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_SPDEVKIT_REQUIRE ?= ""
-MACHINE_OPTEE_SPDEVKIT_REQUIRE:corstone1000 = "optee-spdevkit-corstone1000.inc"
 
 require ${MACHINE_OPTEE_SPDEVKIT_REQUIRE}
-- 
2.17.1


