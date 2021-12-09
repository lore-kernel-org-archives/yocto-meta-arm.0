Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E70C433FE
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 19:23:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.16069.1639077802239764927
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 11:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECD50D6E;
	Thu,  9 Dec 2021 11:23:21 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30743F73B;
	Thu,  9 Dec 2021 11:23:20 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH][HONISTER 8/8] arm-bsp/optee-os: add MHU device regions in the
 SP manifest
Date: Thu,  9 Dec 2021 19:23:00 +0000
Message-Id: <20211209192300.29211-9-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209192300.29211-1-abdellatif.elkhlifi@arm.com>
References: <20211209192300.29211-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 19:23:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2607

From: Vishnu Banavath <vishnu.banavath@arm.com>

Declaring the MHU device regions nodes.

Change-Id: Idc9faf570b8b97193f69ed32fa71a4a3ca359409
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../corstone1000/sp_manifest_combined_se.dts    | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
index c11a8e6..0be1c81 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
@@ -17,6 +17,21 @@
         execution-state = <0>; /* AArch64 */
         xlat-granule = <0>; /* 4KiB */
         messaging-method = <0>; /* Direct messaging only */
+	device-regions {
+		compatible = "arm,ffa-manifest-device-regions";
+		mhu-sender {
+			/* Armv8 A Foundation Platform values */
+			base-address = <0x00000000 0x1b820000>;
+			pages-count = <16>;
+			attributes = <0x3>; /* read-write */
+		};
+		mhu-receiver {
+			/* Armv8 A Foundation Platform values */
+			base-address = <0x00000000 0x1b830000>;
+			pages-count = <16>;
+			attributes = <0x3>; /* read-write */
+		};
+	};
     };
     smm-gateway{
         compatible = "arm,ffa-manifest-1.0";
@@ -38,4 +53,4 @@
               };
 		};
     };
-};
\ No newline at end of file
+};
-- 
2.17.1


