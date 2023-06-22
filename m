Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5524DC001DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:08:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10946.1687439335311385643
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D05FC1042;
	Thu, 22 Jun 2023 06:09:38 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F50B3F64C;
	Thu, 22 Jun 2023 06:08:54 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 8/8] arm-bsp/trusted-firmware-a: corstone1000: Fix Trusted-Firmware-A version for corstone1000
Date: Thu, 22 Jun 2023 14:08:36 +0100
Message-Id: <20230622130836.11346-9-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230622130836.11346-1-emekcan.aras@arm.com>
References: <20230622130836.11346-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 13:08:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4824

From: Emekcan Aras <emekcan.aras@arm.com>

TF-A version 2.8.6 hangs on boot for corstone1000 non-deterministically.
This sets TF-A version to v2.8.0 which is a tested working version for
corstone1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-corstone1000.inc    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
index 00810346..3a5be11f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -9,6 +9,10 @@ SRC_URI:append = " \
     file://0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch \
     "
 
+#Sets TF-A version to 2.8.0
+SRCREV_tfa = "9881bb93a3bc0a3ea37e9f093e09ab4b360a9e48"
+PV = "2.8.0"
+
 TFA_DEBUG = "1"
 TFA_UBOOT ?= "1"
 TFA_MBEDTLS = "1"
-- 
2.17.1


