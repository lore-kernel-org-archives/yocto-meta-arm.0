Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEE3EE49AB
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:58:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.681.1692633531227607538
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 08:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7B5C2F4;
	Mon, 21 Aug 2023 08:59:31 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E3A963F64C;
	Mon, 21 Aug 2023 08:58:49 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 3/8] arm-bsp/trusted-services: corstone1000: GetNextVariableName Fix
Date: Mon, 21 Aug 2023 16:58:35 +0100
Message-Id: <20230821155840.9899-5-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230821155840.9899-1-emekcan.aras@arm.com>
References: <20230821155840.9899-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 15:58:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4979

From: Emekcan Aras <emekcan.aras@arm.com>

This patch is required to handle one of the corner cases of the
GetNextVariableName EFI service as specified in the UEFI spec.

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 .../0004-GetNextVariableName-Fix.patch        | 33 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-GetNextVariableName-Fix.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-GetNextVariableName-Fix.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-GetNextVariableName-Fix.patch
new file mode 100644
index 00000000..ed4e6e27
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-GetNextVariableName-Fix.patch
@@ -0,0 +1,33 @@
+From 2aa665ad2cb13bc79b645db41686449a47593aab Mon Sep 17 00:00:00 2001
+From: Emekcan <emekcan.aras@arm.com>
+Date: Thu, 3 Nov 2022 17:43:40 +0000
+Subject: [PATCH] smm_gateway: GetNextVariableName Fix
+
+GetNextVariableName() should return EFI_BUFFER_TOO_SMALL 
+when NameSize is smaller than the actual NameSize. It 
+currently returns EFI_BUFFER_OUT_OF_RESOURCES due to setting
+max_name_len incorrectly. This fixes max_name_len error by
+replacing it with actual NameSize request by u-boot.
+
+Upstream-Status: Pending
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ .../service/smm_variable/provider/smm_variable_provider.c       | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/components/service/smm_variable/provider/smm_variable_provider.c b/components/service/smm_variable/provider/smm_variable_provider.c
+index a9679b7e..6a4b6fa7 100644
+--- a/components/service/smm_variable/provider/smm_variable_provider.c
++++ b/components/service/smm_variable/provider/smm_variable_provider.c
+@@ -197,7 +197,7 @@ static rpc_status_t get_next_variable_name_handler(void *context, struct call_re
+ 			efi_status = uefi_variable_store_get_next_variable_name(
+ 				&this_instance->variable_store,
+ 				(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data,
+-				max_name_len,
++				((SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data)->NameSize,
+ 				&resp_buf->data_len);
+ 		}
+ 		else {
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
index e601539a..8b7776c9 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -5,6 +5,7 @@ SRC_URI:append:corstone1000  = " \
     file://0001-Add-stub-capsule-update-service-components.patch;patchdir=../trusted-services \
     file://0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch;patchdir=../trusted-services \
     file://0003-FMP-Support-in-Corstone1000.patch;patchdir=../trusted-services \
+    file://0004-GetNextVariableName-Fix.patch;patchdir=../trusted-services     \
     "
 
 
-- 
2.17.1


