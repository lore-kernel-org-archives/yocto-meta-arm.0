Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A658C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 17:23:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9987.1641317037365012780
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 09:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E2AE13A1;
	Tue,  4 Jan 2022 09:23:57 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.35.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA7A23F774;
	Tue,  4 Jan 2022 09:23:55 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 1/1] arm-bsp/secure-partitions: add check for null
 attribute field
Date: Tue,  4 Jan 2022 17:23:45 +0000
Message-Id: <20220104172345.22414-2-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220104172345.22414-1-gowtham.sureshkumar@arm.com>
References: <20220104172345.22414-1-gowtham.sureshkumar@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 17:23:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2789

From: Vishnu Banavath <vishnu.banavath@arm.com>

UEFI spec says that if 0 is passed in the attributes filed in
setVariable() API, it means that it's a delete variable call.
Currently smm gateway doesn't handle this case. This change
is to add above mentioned check.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Change-Id: Id3a54601d403102da5c5617d7b4da8ec51029200
---
 ...teway-add-checks-for-null-attributes.patch | 79 +++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0032-smm_gateway-add-checks-for-null-attributes.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0032-smm_gateway-add-checks-for-null-attributes.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0032-smm_gateway-add-checks-for-null-attributes.patch
new file mode 100644
index 0000000..31f86f1
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0032-smm_gateway-add-checks-for-null-attributes.patch
@@ -0,0 +1,79 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From c88937f3fb2d1259b1abb1a6926e869bf2f5d69e Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 24 Dec 2021 19:17:17 +0000
+Subject: [PATCH] smm_gateway: add checks for null attributes
+
+As par EDK-2 and EDK-2 test code, when a user issue's
+setVariable() with 0 in attributes field, it means a variable
+delete request. Currently, smm gatway doesn't handle this scenario.
+This change is to add that support
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
+index a57b334..e8771c2 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/smm_variable/backend/uefi_variable_store.c
+@@ -167,7 +167,9 @@ efi_status_t uefi_variable_store_set_variable(
+ 	* EFI_VARIABLE_RUNTIME_ACCESS set must also have EFI_VARIABLE_BOOTSERVICE_ACCESS set.
+ 	* The caller is responsible for following this rule.
+ 	*/
+-	if((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS))
++	if (!var->Attributes)
++		EMSG("It might be a delete variable request\n");
++	else if((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS))
+ 	{
+ 			if((var->Attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS) != EFI_VARIABLE_BOOTSERVICE_ACCESS )
+ 			return EFI_INVALID_PARAMETER;
+@@ -191,7 +193,7 @@ efi_status_t uefi_variable_store_set_variable(
+ 				(var->Attributes & EFI_VARIABLE_NON_VOLATILE) ||
+ 				(info->is_variable_set && (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE));
+ 
+-			if (var->DataSize) {
++			if (var->DataSize && var->Attributes) {
+ 
+ 				/* It's a set rather than a remove operation */
+ 				variable_index_update_variable(
+@@ -206,7 +208,9 @@ efi_status_t uefi_variable_store_set_variable(
+ 				 * that it's never possible for an object to exist within
+ 				 * the storage backend without a corresponding index entry.
+ 				 */
+-				remove_variable_data(context, info);
++				EMSG("  deleting variable %s \n",var->Name);
++				if (remove_variable_data(context, info) != PSA_SUCCESS)
++					EMSG("  deleting variable %s FAILED\n",var->Name);
+ 				variable_index_remove_variable(&context->variable_index, info);
+ 
+ 				/* Variable info no longer valid */
+@@ -587,14 +591,18 @@ static efi_status_t check_access_permitted_on_set(
+ 	}
+ 
+ 	if ((status == EFI_SUCCESS) && var->DataSize) {
+-
++		/* Delete the variable with Attributes is 0 */
++		if (!var->Attributes) {
++			EMSG("Null attributes, may be a delete variable request\n");
++			status = EFI_SUCCESS;
++		}
+ 		/* Restrict which attributes can be modified for an existing variable */
+-        if (((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=
+-            (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) ||
+-            ((var->Attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS) !=
+-            (info->metadata.attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS)) ||
+-            ((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS) !=
+-            (info->metadata.attributes & EFI_VARIABLE_RUNTIME_ACCESS))) {
++		else if (((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=
++			(info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) ||
++			((var->Attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS) !=
++			(info->metadata.attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS)) ||
++			((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS) !=
++			(info->metadata.attributes & EFI_VARIABLE_RUNTIME_ACCESS))) {
+ 			/* Don't permit change of attributes */
+ 			status = EFI_INVALID_PARAMETER;
+ 		}
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index e3cd29f..499dc31 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -42,6 +42,7 @@ SRC_URI:append = " \
                   file://0029-Change-UID-of-variable-index-in-SMM.patch \
                   file://0030-Add-missing-features-to-setVariable.patch \
                   file://0031-Add-invalid-parameter-check-in-getNextVariableName.patch \
+                  file://0032-smm_gateway-add-checks-for-null-attributes.patch \
                   "
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-- 
2.17.1


