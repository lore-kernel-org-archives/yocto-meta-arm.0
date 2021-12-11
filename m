Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCADC433FE
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 10:08:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.20037.1639217335920613171
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 02:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F2DA106F;
	Sat, 11 Dec 2021 02:08:55 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 533733F73D;
	Sat, 11 Dec 2021 02:08:54 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH][HONISTER 5/9] arm-bsp/optee-os: add openamp-virtio
Date: Sat, 11 Dec 2021 10:08:33 +0000
Message-Id: <20211211100837.19703-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
References: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 11 Dec 2021 10:08:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2630

From: Vishnu Banavath <vishnu.banavath@arm.com>

Adding openamp-virtio node to the SP manifest

Change-Id: I1123eab65f2f05d00433b7d940b74766457ac7cf
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../files/optee-os/corstone1000/sp_manifest_combined_se.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
index 0be1c81..b09018e 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
@@ -31,6 +31,12 @@
 			pages-count = <16>;
 			attributes = <0x3>; /* read-write */
 		};
+		openamp-virtio {
+			/* Armv8 A Foundation Platform values */
+			base-address = <0x00000000 0x88000000>;
+			pages-count = <256>;
+			attributes = <0x3>; /* read-write */
+		};
 	};
     };
     smm-gateway{
-- 
2.17.1


