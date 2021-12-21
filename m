Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CBEC43219
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 18:53:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9542.1640112814372724227
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Dec 2021 10:53:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC6D7D6E;
	Tue, 21 Dec 2021 10:53:33 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43A8F3F718;
	Tue, 21 Dec 2021 10:53:33 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 2/2] arm-bsp/secure-partitions: Add error cases to
 setVariable() and getNextVariableName()
Date: Tue, 21 Dec 2021 18:53:24 +0000
Message-Id: <20211221185324.3890-3-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221185324.3890-1-xueliang.zhong@arm.com>
References: <20211221185324.3890-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Dec 2021 18:53:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2753

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This patch fixes the SCT errors seen for setVariable() and
getNextVariableName() functions. The existing implementation of these
functions does not cover certain error conditions which are listed in
the uefi specification. This patch adds these changes.

Change-Id: Idcddc799588339de6729b73c0ceada5c2018dd4b
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...-Add-missing-features-to-setVariable.patch | 76 +++++++++++++++++++
 ...rameter-check-in-getNextVariableName.patch | 58 ++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  2 +
 3 files changed, 136 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0030-Add-missing-features-to-setVariable.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0031-Add-invalid-parameter-check-in-getNextVariableName.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0030-Add-missing-features-to-setVariable.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0030-Add-missing-features-to-setVariable.patch
new file mode 100644
index 0000000..a5828ca
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0030-Add-missing-features-to-setVariable.patch
@@ -0,0 +1,76 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 2ba5fa76a886e0ef59656fe96666f2582e8ffc72 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Mon, 20 Dec 2021 19:56:30 +0000
+Subject: [PATCH 2/3] Add missing features to setVariable()
+
+This patch resolves the failing tests in SCT related to
+setVariable() function. The existing implementation is
+missing few cases where error codes are returned when called
+with certain paramters. These conditions are implemented in
+this patch based on the explanation provided in uefi spec.
+
+%% original patch: 0030-Add-missing-features-to-setVariable.patch
+---
+ .../backend/uefi_variable_store.c             | 29 ++++++++++++++++---
+ 1 file changed, 25 insertions(+), 4 deletions(-)
+
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
+index 1bb869a..a167107 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/smm_variable/backend/uefi_variable_store.c
+@@ -161,6 +161,17 @@ efi_status_t uefi_variable_store_set_variable(
+ 	bool should_sync_index = false;
+ 
+ 	if (status != EFI_SUCCESS) return status;
++	
++	/*
++	* Runtime access to a data variable implies boot service access. Attributes that have
++	* EFI_VARIABLE_RUNTIME_ACCESS set must also have EFI_VARIABLE_BOOTSERVICE_ACCESS set.
++	* The caller is responsible for following this rule.
++	*/
++	if((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS))
++	{
++			if((var->Attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS) != EFI_VARIABLE_BOOTSERVICE_ACCESS )
++			return EFI_INVALID_PARAMETER;
++	}
+ 
+ 	/* Find in index */
+ 	const struct variable_info *info = variable_index_find(
+@@ -221,6 +232,13 @@ efi_status_t uefi_variable_store_set_variable(
+ 		if (!info) status = EFI_OUT_OF_RESOURCES;
+ 		should_sync_index = info && (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE);
+ 	}
++	else 
++    {
++		/* Return EFI_NOT_FOUND when a remove operation is performed
++		 * on variable that is not existing.
++		*/
++        status = EFI_NOT_FOUND;
++    }
+ 
+ 	/* The order of these operations is important. For an update
+ 	 * or create operation, The variable index is always synchronized
+@@ -555,10 +573,13 @@ static efi_status_t check_access_permitted_on_set(
+ 	if ((status == EFI_SUCCESS) && var->DataSize) {
+ 
+ 		/* Restrict which attributes can be modified for an existing variable */
+-		if ((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=
+-			(info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) {
+-
+-			/* Don't permit change of storage class */
++        if (((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=
++            (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) ||
++            ((var->Attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS) !=
++            (info->metadata.attributes & EFI_VARIABLE_BOOTSERVICE_ACCESS)) ||
++            ((var->Attributes & EFI_VARIABLE_RUNTIME_ACCESS) !=
++            (info->metadata.attributes & EFI_VARIABLE_RUNTIME_ACCESS))) {
++			/* Don't permit change of attributes */
+ 			status = EFI_INVALID_PARAMETER;
+ 		}
+ 	}
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0031-Add-invalid-parameter-check-in-getNextVariableName.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0031-Add-invalid-parameter-check-in-getNextVariableName.patch
new file mode 100644
index 0000000..63a45a0
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0031-Add-invalid-parameter-check-in-getNextVariableName.patch
@@ -0,0 +1,58 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 8a2a47d360e43004d277c00ed06cbc59ccfb721e Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Mon, 20 Dec 2021 20:01:10 +0000
+Subject: [PATCH 3/3] Add invalid parameter check in getNextVariableName()
+
+This patch resolves the failing tests in SCT related to
+getNextVariableName() function. The existing implementation is
+missing few cases where error codes are returned when called
+with certain paramters. These conditions are implemented in
+this patch based on the explanation provided in uefi spec.
+
+%% original patch: 0031-Add-invalid-parameter-check-in-getNextVariableName.patch
+---
+ .../smm_variable/backend/uefi_variable_store.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
+index a167107..a57b334 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/smm_variable/backend/uefi_variable_store.c
+@@ -161,7 +161,7 @@ efi_status_t uefi_variable_store_set_variable(
+ 	bool should_sync_index = false;
+ 
+ 	if (status != EFI_SUCCESS) return status;
+-	
++
+ 	/*
+ 	* Runtime access to a data variable implies boot service access. Attributes that have
+ 	* EFI_VARIABLE_RUNTIME_ACCESS set must also have EFI_VARIABLE_BOOTSERVICE_ACCESS set.
+@@ -310,6 +310,22 @@ efi_status_t uefi_variable_store_get_next_variable_name(
+ 	status = EFI_NOT_FOUND;
+ 	*total_length = 0;
+ 
++	/*
++	 *	If input values of VariableName and VendorGuid are not a name and GUID of an 
++	 *	existing variable, EFI_INVALID_PARAMETER is returned.	
++	 */
++	if (cur->NameSize >= sizeof(int16_t)) {
++		/*
++		* Name must be at least one character long to accommodate
++		* the mandatory null terminator.
++		*/
++		if (cur->Name[0] != 0) {
++			const struct variable_info *var_info = variable_index_find(&context->variable_index,&cur->Guid,cur->NameSize,cur->Name);
++			if(var_info == NULL)
++					return EFI_INVALID_PARAMETER;
++		}
++	}
++
+ 	const struct variable_info *info = variable_index_find_next(
+ 		&context->variable_index,
+ 		&cur->Guid,
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 55f5a27..e3cd29f 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -40,6 +40,8 @@ SRC_URI:append = " \
                   file://0027-Configure-storage-size.patch \
                   file://0028-Revert-Add-uefi-variable-append-write-support.patch \
                   file://0029-Change-UID-of-variable-index-in-SMM.patch \
+                  file://0030-Add-missing-features-to-setVariable.patch \
+                  file://0031-Add-invalid-parameter-check-in-getNextVariableName.patch \
                   "
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-- 
2.17.1


