Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730B0C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:07:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24311.1639480072642925690
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4138E106F;
	Tue, 14 Dec 2021 03:07:52 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 379A13F5A1;
	Tue, 14 Dec 2021 03:07:51 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 8/9] arm-bsp/secure-partitions: corstone1000: Increase SMM
 Gateway variable handling capacity
Date: Tue, 14 Dec 2021 11:07:30 +0000
Message-Id: <20211214110731.9081-9-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
References: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:07:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2686

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The maximum number of UEFI variables that can be supported by SMM
gateway is currently 40. When more than 40 variables are written,
or read SMM gateway returns error code. Currently this value is
increased to 100 to support more UEFI variables.

Change-Id: I3ebef8052fd01c5b1c19cdfe71ab3c02447a005b
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...MM-gateway-UEFI-variable-macro-value.patch | 35 +++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
new file mode 100644
index 0000000..00f80ef
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 9b9261f73f93a5ac7ad823da376858b56560a08b Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Sun, 12 Dec 2021 17:07:03 +0000
+Subject: [PATCH] Increase SMM gateway UEFI variable macro value
+
+The maximum number of UEFI variables that be supported by SMM
+gateway is currently 40. When more than 40 variables are written,
+or read SMM gateway returns error code. Currently this value is
+increased to 100 to support more UEFI variables.
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+---
+ deployments/smm-gateway/smm_gateway.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/deployments/smm-gateway/smm_gateway.c b/deployments/smm-gateway/smm_gateway.c
+index 7828b3a..7e6729e 100644
+--- a/deployments/smm-gateway/smm_gateway.c
++++ b/deployments/smm-gateway/smm_gateway.c
+@@ -20,6 +20,9 @@
+ #define SMM_GATEWAY_NV_STORE_SN		"sn:ffa:751bf801-3dde-4768-a514-0f10aeed1790:0"
+ #endif
+ 
++/* Maximum number of UEFI variables set to 100 */
++#define SMM_GATEWAY_MAX_UEFI_VARIABLES		(100)
++
+ /* Default maximum number of UEFI variables */
+ #ifndef SMM_GATEWAY_MAX_UEFI_VARIABLES
+ #define SMM_GATEWAY_MAX_UEFI_VARIABLES		(40)
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 5be9be7..5afb131 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -34,6 +34,7 @@ SRC_URI:append = " \
                   file://0021-Add-psa-ipc-attestation-to-se-proxy.patch \
                   file://0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch \
                   file://0023-add-psa-ipc-crypto-backend.patch \
+                  file://0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch \
                   "
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-- 
2.17.1


