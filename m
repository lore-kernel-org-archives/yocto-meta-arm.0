Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7588FC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 19:19:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16241.1639077593724514351
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 11:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6796C11B3;
	Thu,  9 Dec 2021 11:19:53 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BFE53F73B;
	Thu,  9 Dec 2021 11:19:52 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 5/9] arm-bsp/optee-os: add openamp-virtio
Date: Thu,  9 Dec 2021 19:19:31 +0000
Message-Id: <20211209191935.26017-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209191935.26017-1-abdellatif.elkhlifi@arm.com>
References: <20211209191935.26017-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 19:19:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2593

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


