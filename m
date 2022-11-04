Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62006C43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 15:05:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12222.1667574297225583249
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 08:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB19223A;
	Fri,  4 Nov 2022 08:05:02 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C52CE3F703;
	Fri,  4 Nov 2022 08:04:55 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH langdale 1/2] arm-bsp/trusted-services: add checks for null attributes in smm gateway
Date: Fri,  4 Nov 2022 15:04:48 +0000
Message-Id: <20221104150449.26930-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221104150449.26930-1-emekcan.aras@arm.com>
References: <20221104150449.26930-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Nov 2022 15:05:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4089

From: Emekcan <emekcan.aras@arm.com>

As in EDK-2 and EDK-2 test code, setVariable() with 0
attributes means a delete variable requiest. Currently,
smm gateway doesn't handle this scenario. This commit
adds that support

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...teway-add-checks-for-null-attributes.patch | 35 +++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-smm_gateway-add-checks-for-null-attributes.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-smm_gateway-add-checks-for-null-attributes.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-smm_gateway-add-checks-for-null-attributes.patch
new file mode 100644
index 00000000..87c053fc
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-smm_gateway-add-checks-for-null-attributes.patch
@@ -0,0 +1,35 @@
+From 6d3cac6f3a6e977e9330c9c06514a372ade170a2 Mon Sep 17 00:00:00 2001
+From: Emekcan <emekcan.aras@arm.com>
+Date: Wed, 2 Nov 2022 09:58:27 +0000
+Subject: [PATCH] smm_gateway: add checks for null attributes
+
+As par EDK-2 and EDK-2 test code, setVariable() with 0 
+attributes means a delete variable request. Currently, 
+smm gatway doesn't handle this scenario. This commit adds
+that support.
+
+Upstream-Status: Pending
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ components/service/smm_variable/backend/uefi_variable_store.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
+index 6c3b9ed8..a691dc5d 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/smm_variable/backend/uefi_variable_store.c
+@@ -202,9 +202,9 @@ efi_status_t uefi_variable_store_set_variable(
+ 		if (info->is_variable_set) {
+ 
+ 			/* It's a request to update to an existing variable */
+-			if (!(var->Attributes &
++			if (!(var->Attributes) || (!(var->Attributes &
+ 				(EFI_VARIABLE_APPEND_WRITE | EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS_MASK)) &&
+-				!var->DataSize) {
++				!var->DataSize)) {
+ 
+ 				/* It's a remove operation - for a remove, the variable
+ 				 * data must be removed from the storage backend before
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 0d856bc5..d56a4a9a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -21,4 +21,5 @@ SRC_URI:append:corstone1000  = " \
     file://0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch;patchdir=../trusted-services \
     file://0019-plat-corstone1000-change-default-smm-values.patch;patchdir=../trusted-services \
     file://0020-FMP-Support-in-Corstone1000.patch;patchdir=../trusted-services \
+    file://0021-smm_gateway-add-checks-for-null-attributes.patch;patchdir=../trusted-services \
     "
-- 
2.17.1


