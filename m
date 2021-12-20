Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78DAC433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 14:25:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5778.1640010315343151660
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 06:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB5E5ED1;
	Mon, 20 Dec 2021 06:25:14 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB7473F718;
	Mon, 20 Dec 2021 06:25:13 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH honister 1/4] arm-bsp/secure-partitions: corstone1000:
 Configure storage in SMM gateway
Date: Mon, 20 Dec 2021 14:25:02 +0000
Message-Id: <20211220142505.30331-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211220142505.30331-1-xueliang.zhong@arm.com>
References: <20211220142505.30331-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 14:25:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2738

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This patch will add a macro to configure the volatile and
non volatile storage in SMM gateway. Few useful logs are
also added to the secure world.

Change-Id: Ifdb405a09a9a72718df8b335b9f42509dd8c850c
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...-logs-to-functions-in-SMM-gateway-SP.patch | 251 ++++++++++++++++++
 .../0027-Configure-storage-size.patch         |  43 +++
 .../trusted-services/ts-corstone1000.inc      |   2 +
 3 files changed, 296 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0027-Configure-storage-size.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
new file mode 100644
index 0000000..1f46586
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
@@ -0,0 +1,251 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 9dc09450180d2d35b61359399c1313a97016ad07 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Thu, 16 Dec 2021 13:29:58 +0000
+Subject: [PATCH] Add logs to functions in SMM gateway SP
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+%% original patch: 0026-Logging.patch
+---
+ .../backend/uefi_variable_store.c             | 29 +++++++++++++++++--
+ .../provider/smm_variable_provider.c          |  7 +++--
+ 2 files changed, 32 insertions(+), 4 deletions(-)
+
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
+index ed50eaf..0c371e9 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/smm_variable/backend/uefi_variable_store.c
+@@ -11,6 +11,7 @@
+ #include "uefi_variable_store.h"
+ #include "variable_index_iterator.h"
+ #include "variable_checker.h"
++#include <trace.h>
+ 
+ /* Private functions */
+ static void load_variable_index(
+@@ -151,12 +152,15 @@ void uefi_variable_store_set_storage_limits(
+ 	size_t total_capacity,
+ 	size_t max_variable_size)
+ {
++	EMSG("In func %s\n", __func__);
+ 	struct delegate_variable_store *delegate_store = select_delegate_store(
+ 		context,
+ 		attributes);
+ 
+ 	delegate_store->total_capacity = total_capacity;
+ 	delegate_store->max_variable_size = max_variable_size;
++	EMSG("In func %s total_capacity is %d\n", __func__, total_capacity);
++	EMSG("In func %s max_variable_size is %d\n", __func__, max_variable_size);
+ }
+ 
+ efi_status_t uefi_variable_store_set_variable(
+@@ -265,6 +269,7 @@ efi_status_t uefi_variable_store_get_variable(
+ 	size_t max_data_len,
+ 	size_t *total_length)
+ {
++	EMSG("In func %s\n", __func__);
+ 	efi_status_t status = check_name_terminator(var->Name, var->NameSize);
+ 	if (status != EFI_SUCCESS) return status;
+ 
+@@ -299,6 +304,7 @@ efi_status_t uefi_variable_store_get_next_variable_name(
+ 	size_t max_name_len,
+ 	size_t *total_length)
+ {
++	EMSG("In func %s\n", __func__);
+ 	efi_status_t status = check_name_terminator(cur->Name, cur->NameSize);
+ 	if (status != EFI_SUCCESS) return status;
+ 
+@@ -329,6 +335,8 @@ efi_status_t uefi_variable_store_query_variable_info(
+ 	struct uefi_variable_store *context,
+ 	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *var_info)
+ {
++
++	EMSG("In func %s\n", __func__);
+ 	struct delegate_variable_store *delegate_store = select_delegate_store(
+ 		context,
+ 		var_info->Attributes);
+@@ -337,13 +345,15 @@ efi_status_t uefi_variable_store_query_variable_info(
+ 		context,
+ 		var_info->Attributes,
+ 		delegate_store->storage_backend);
+-
++	EMSG("In func %s total_used is %d\n", __func__, total_used);
+ 	var_info->MaximumVariableSize = delegate_store->max_variable_size;
+ 	var_info->MaximumVariableStorageSize = delegate_store->total_capacity;
+ 	var_info->RemainingVariableStorageSize = (total_used < delegate_store->total_capacity) ?
+ 		delegate_store->total_capacity - total_used :
+ 		0;
+-
++	EMSG("In func %s var_info->MaximumVariableSize is %d\n", __func__, var_info->MaximumVariableSize);
++	EMSG("In func %s var_info->MaximumVariableStorageSize is %d\n", __func__, var_info->MaximumVariableStorageSize);
++	EMSG("In func %s var_info->RemainingVariableStorageSize is %d\n", __func__, var_info->RemainingVariableStorageSize);
+ 	return EFI_SUCCESS;
+ }
+ 
+@@ -358,6 +368,7 @@ efi_status_t uefi_variable_store_set_var_check_property(
+ 	struct uefi_variable_store *context,
+ 	const SMM_VARIABLE_COMMUNICATE_VAR_CHECK_VARIABLE_PROPERTY *property)
+ {
++	EMSG("In func %s\n", __func__);
+ 	efi_status_t status = check_name_terminator(property->Name, property->NameSize);
+ 	if (status != EFI_SUCCESS) return status;
+ 
+@@ -404,6 +415,7 @@ efi_status_t uefi_variable_store_get_var_check_property(
+ 	struct uefi_variable_store *context,
+ 	SMM_VARIABLE_COMMUNICATE_VAR_CHECK_VARIABLE_PROPERTY *property)
+ {
++	EMSG("In func %s\n", __func__);
+ 	efi_status_t status = check_name_terminator(property->Name, property->NameSize);
+ 	if (status != EFI_SUCCESS) return status;
+ 
+@@ -430,6 +442,7 @@ efi_status_t uefi_variable_store_get_var_check_property(
+ static void load_variable_index(
+ 	struct uefi_variable_store *context)
+ {
++	EMSG("In func %s\n", __func__);
+ 	struct storage_backend *persistent_store = context->persistent_store.storage_backend;
+ 
+ 	if (persistent_store) {
+@@ -444,6 +457,7 @@ static void load_variable_index(
+ 			context->index_sync_buffer_size,
+ 			context->index_sync_buffer,
+ 			&data_len);
++		EMSG("In func %s get status is %d\n", __func__, psa_status);
+ 
+ 		if (psa_status == PSA_SUCCESS) {
+ 
+@@ -455,6 +469,7 @@ static void load_variable_index(
+ static efi_status_t sync_variable_index(
+ 	struct uefi_variable_store *context)
+ {
++	EMSG("In func %s\n", __func__);
+ 	efi_status_t status = EFI_SUCCESS;
+ 
+ 	/* Sync the varibale index to storage if anything is dirty */
+@@ -479,6 +494,7 @@ static efi_status_t sync_variable_index(
+ 				data_len,
+ 				context->index_sync_buffer,
+ 				PSA_STORAGE_FLAG_NONE);
++			EMSG("In func %s set status is %d\n", __func__, psa_status);
+ 
+ 			status = psa_to_efi_storage_status(psa_status);
+ 		}
+@@ -490,6 +506,7 @@ static efi_status_t sync_variable_index(
+ static efi_status_t check_capabilities(
+ 	const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
+ {
++	EMSG("In func %s\n", __func__);
+ 	efi_status_t status = EFI_SUCCESS;
+ 
+ 	/* Check if any unsupported variable attributes have been requested */
+@@ -551,6 +568,7 @@ static efi_status_t store_variable_data(
+ 	const struct variable_info *info,
+ 	const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
+ {
++	EMSG("In func %s\n", __func__);
+ 	psa_status_t psa_status = PSA_SUCCESS;
+ 	size_t data_len = var->DataSize;
+ 	const uint8_t *data = (const uint8_t*)var +
+@@ -599,6 +617,7 @@ static efi_status_t remove_variable_data(
+ 	struct uefi_variable_store *context,
+ 	const struct variable_info *info)
+ {
++	EMSG("In func %s\n", __func__);
+ 	psa_status_t psa_status = PSA_SUCCESS;
+ 
+ 	if (info->is_variable_set) {
+@@ -613,6 +632,7 @@ static efi_status_t remove_variable_data(
+ 				delegate_store->storage_backend->context,
+ 				context->owner_id,
+ 				info->metadata.uid);
++			EMSG("In func %s status is %d\n", __func__, psa_status);
+ 		}
+ 	}
+ 
+@@ -625,6 +645,7 @@ static efi_status_t load_variable_data(
+ 	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var,
+ 	size_t max_data_len)
+ {
++	EMSG("In func %s\n", __func__);
+ 	psa_status_t psa_status = PSA_SUCCESS;
+ 	size_t data_len = 0;
+ 	uint8_t *data = (uint8_t*)var +
+@@ -644,6 +665,7 @@ static efi_status_t load_variable_data(
+ 			max_data_len,
+ 			data,
+ 			&data_len);
++		EMSG("In func %s get status is %d\n", __func__, psa_status);
+ 
+ 		var->DataSize = data_len;
+ 	}
+@@ -771,6 +793,7 @@ static void purge_orphan_index_entries(
+ 				context->owner_id,
+ 				info->metadata.uid,
+ 				&storage_info);
++			EMSG("In func %s get status is %d\n", __func__, psa_status);
+ 
+ 			if (psa_status != PSA_SUCCESS) {
+ 
+@@ -802,6 +825,7 @@ static size_t space_used(
+ 	uint32_t attributes,
+ 	struct storage_backend *storage_backend)
+ {
++	EMSG("In func %s\n", __func__);
+ 	if (!storage_backend) return 0;
+ 
+ 	size_t total_used = 0;
+@@ -823,6 +847,7 @@ static size_t space_used(
+ 				context->owner_id,
+ 				info->metadata.uid,
+ 				&storage_info);
++			EMSG("In func %s get status is %d\n", __func__, psa_status);
+ 
+ 			if (psa_status == PSA_SUCCESS) total_used += storage_info.size;
+ 		}
+diff --git a/components/service/smm_variable/provider/smm_variable_provider.c b/components/service/smm_variable/provider/smm_variable_provider.c
+index 52e68d0..1f362c1 100644
+--- a/components/service/smm_variable/provider/smm_variable_provider.c
++++ b/components/service/smm_variable/provider/smm_variable_provider.c
+@@ -9,6 +9,7 @@
+ #include <protocols/service/smm_variable/smm_variable_proto.h>
+ #include <protocols/rpc/common/packed-c/status.h>
+ #include "smm_variable_provider.h"
++#include <trace.h>
+ 
+ /* Service request handlers */
+ static rpc_status_t get_variable_handler(void *context, struct call_req *req);
+@@ -252,17 +253,18 @@ static rpc_status_t set_variable_handler(void *context, struct call_req* req)
+ 
+ static rpc_status_t query_variable_info_handler(void *context, struct call_req* req)
+ {
++	EMSG("In func %s \n", __func__);
+ 	efi_status_t efi_status = EFI_INVALID_PARAMETER;
+ 	struct smm_variable_provider *this_instance = (struct smm_variable_provider*)context;
+ 
+ 	const struct call_param_buf *req_buf = call_req_get_req_buf(req);
+-
++	EMSG("In func %s sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO) is %d\n", __func__, sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO));
+ 	if (req_buf->data_len >= sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO)) {
+ 
+ 		struct call_param_buf *resp_buf = call_req_get_resp_buf(req);
+ 
+ 		if (resp_buf->size >= req_buf->data_len) {
+-
++			
+ 			memmove(resp_buf->data, req_buf->data, req_buf->data_len);
+ 
+ 			efi_status = uefi_variable_store_query_variable_info(
+@@ -272,6 +274,7 @@ static rpc_status_t query_variable_info_handler(void *context, struct call_req*
+ 			if (efi_status == EFI_SUCCESS) {
+ 
+ 				resp_buf->data_len = sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO);
++				EMSG("In func %s resp_buf->data_len is %d\n", __func__, resp_buf->data_len);
+ 			}
+ 		}
+ 		else {
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0027-Configure-storage-size.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0027-Configure-storage-size.patch
new file mode 100644
index 0000000..764cfe6
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0027-Configure-storage-size.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 02746a26472f6aa7d57cfd5388823b0ec3c8a945 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Thu, 16 Dec 2021 21:31:40 +0000
+Subject: [PATCH] Configure storage size
+
+---
+ .../service/smm_variable/backend/uefi_variable_store.c       | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
+index 0c371e9..b7cfff4 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/smm_variable/backend/uefi_variable_store.c
+@@ -87,6 +87,7 @@ static efi_status_t check_name_terminator(
+  * may be overridden using uefi_variable_store_set_storage_limits()
+  */
+ #define DEFAULT_MAX_VARIABLE_SIZE			(2048)
++#define CONFIGURE_STORAGE_SIZE			    (50)
+ 
+ efi_status_t uefi_variable_store_init(
+ 	struct uefi_variable_store *context,
+@@ -100,13 +101,13 @@ efi_status_t uefi_variable_store_init(
+ 	/* Initialise persistent store defaults */
+ 	context->persistent_store.is_nv = true;
+ 	context->persistent_store.max_variable_size = DEFAULT_MAX_VARIABLE_SIZE;
+-	context->persistent_store.total_capacity = DEFAULT_MAX_VARIABLE_SIZE * max_variables;
++	context->persistent_store.total_capacity = CONFIGURE_STORAGE_SIZE * max_variables;
+ 	context->persistent_store.storage_backend = persistent_store;
+ 
+ 	/* Initialise volatile store defaults */
+ 	context->volatile_store.is_nv = false;
+ 	context->volatile_store.max_variable_size = DEFAULT_MAX_VARIABLE_SIZE;
+-	context->volatile_store.total_capacity = DEFAULT_MAX_VARIABLE_SIZE * max_variables;
++	context->volatile_store.total_capacity = CONFIGURE_STORAGE_SIZE * max_variables;
+ 	context->volatile_store.storage_backend = volatile_store;
+ 
+ 	context->owner_id = owner_id;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index bb34f54..4a18586 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -36,6 +36,8 @@ SRC_URI:append = " \
                   file://0023-add-psa-ipc-crypto-backend.patch \
                   file://0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch \
                   file://0025-Add-stub-capsule-update-service-components.patch \
+                  file://0026-Add-logs-to-functions-in-SMM-gateway-SP.patch \
+                  file://0027-Configure-storage-size.patch \
                   "
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-- 
2.17.1


