Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785ECC4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:07:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24308.1639480063616663350
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E30D6D;
	Tue, 14 Dec 2021 03:07:43 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4B553F5A1;
	Tue, 14 Dec 2021 03:07:41 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 2/9] arm-bsp/secure-partitions: corstone1000: Use address
 instead of pointers
Date: Tue, 14 Dec 2021 11:07:24 +0000
Message-Id: <20211214110731.9081-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
References: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:07:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2680

From: Satish Kumar <satish.kumar01@arm.com>

Since secure enclave is 32bit and we 64bit there is an issue
in the protocol communication design that force us to handle
on our side the manipulation of address and pointers to make
this work.

Change-Id: Icb29fdec6928dba6da7e845b3a13d8a3560c5fe1
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 ...0020-Use-address-instead-of-pointers.patch | 170 ++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |   1 +
 2 files changed, 171 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0020-Use-address-instead-of-pointers.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0020-Use-address-instead-of-pointers.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0020-Use-address-instead-of-pointers.patch
new file mode 100644
index 0000000..92d39c5
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0020-Use-address-instead-of-pointers.patch
@@ -0,0 +1,170 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 1974cdc2a0a4f3395131570d4080ffc1ddde4990 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sun, 12 Dec 2021 10:57:17 +0000
+Subject: [PATCH 2/5] Use address instead of pointers
+
+Since secure enclave is 32bit and we 64bit there is an issue
+in the protocol communication design that force us to handle
+on our side the manipulation of address and pointers to make
+this work.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../service/common/include/psa/client.h       | 15 ++++++++++++++
+ .../service/common/psa_ipc/service_psa_ipc.c  | 20 ++++++++++++-------
+ .../secure_storage_ipc/secure_storage_ipc.c   | 20 +++++++++----------
+ 3 files changed, 38 insertions(+), 17 deletions(-)
+
+diff --git a/components/service/common/include/psa/client.h b/components/service/common/include/psa/client.h
+index 69ccf14..12dcd68 100644
+--- a/components/service/common/include/psa/client.h
++++ b/components/service/common/include/psa/client.h
+@@ -81,6 +81,21 @@ struct __attribute__ ((__packed__)) psa_outvec {
+     uint32_t len;                 /*!< the size in bytes                      */
+ };
+ 
++static void *psa_u32_to_ptr(uint32_t addr)
++{
++	return (void *)(uintptr_t)addr;
++}
++
++static uint32_t psa_ptr_to_u32(void *ptr)
++{
++	return (uintptr_t)ptr;
++}
++
++static uint32_t psa_ptr_const_to_u32(const void *ptr)
++{
++	return (uintptr_t)ptr;
++}
++
+ /*************************** PSA Client API **********************************/
+ 
+ /**
+diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
+index 5e5815d..435c6c0 100644
+--- a/components/service/common/psa_ipc/service_psa_ipc.c
++++ b/components/service/common/psa_ipc/service_psa_ipc.c
+@@ -62,6 +62,11 @@ static size_t psa_call_out_vec_len(const struct psa_outvec *out_vec, size_t out_
+ 	return resp_len;
+ }
+ 
++static uint32_t psa_virt_to_phys_u32(struct rpc_caller *caller, void *va)
++{
++	return (uintptr_t)rpc_caller_virt_to_phys(caller, va);
++}
++
+ psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
+ 			 uint32_t version)
+ {
+@@ -147,20 +152,20 @@ psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t psa_handle,
+ 	req_msg->params.psa_call_params.handle = psa_handle;
+ 	req_msg->params.psa_call_params.type = type;
+ 	req_msg->params.psa_call_params.in_len = in_len;
+-	req_msg->params.psa_call_params.in_vec = rpc_caller_virt_to_phys(caller, in_vec_param);
++	req_msg->params.psa_call_params.in_vec = psa_virt_to_phys_u32(caller, in_vec_param);
+ 	req_msg->params.psa_call_params.out_len = out_len;
+-	req_msg->params.psa_call_params.out_vec = rpc_caller_virt_to_phys(caller, out_vec_param);
++	req_msg->params.psa_call_params.out_vec = psa_virt_to_phys_u32(caller, out_vec_param);
+ 
+ 	for (i = 0; i < in_len; i++) {
+-		in_vec_param[i].base = rpc_caller_virt_to_phys(caller, payload);
++		in_vec_param[i].base = psa_virt_to_phys_u32(caller, payload);
+ 		in_vec_param[i].len = in_vec[i].len;
+ 
+-		memcpy(payload, in_vec[i].base, in_vec[i].len);
++		memcpy(payload, psa_u32_to_ptr(in_vec[i].base), in_vec[i].len);
+ 		payload += in_vec[i].len;
+ 	}
+ 
+ 	for (i = 0; i < out_len; i++) {
+-		out_vec_param[i].base = NULL;
++		out_vec_param[i].base = 0;
+ 		out_vec_param[i].len = out_vec[i].len;
+ 	}
+ 
+@@ -182,11 +187,12 @@ psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t psa_handle,
+ 		goto caller_end;
+ 
+ 	out_vec_param = (struct psa_outvec *)rpc_caller_phys_to_virt(caller,
+-						     resp_msg->params.out_vec);
++				psa_u32_to_ptr(resp_msg->params.out_vec));
+ 
+ 	for (i = 0; i < resp_msg->params.out_len; i++) {
+                 out_vec[i].len = out_vec_param[i].len;
+-		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param[i].base),
++		memcpy(psa_u32_to_ptr(out_vec[i].base),
++		       rpc_caller_phys_to_virt(caller,	psa_u32_to_ptr(out_vec_param[i].base)),
+ 		       out_vec[i].len);
+ 	}
+ 
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+index a1f369d..bda442a 100644
+--- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
++++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+@@ -22,9 +22,9 @@ static psa_status_t secure_storage_ipc_set(void *context, uint32_t client_id,
+ 	psa_handle_t psa_handle;
+ 	psa_status_t psa_status;
+ 	struct psa_invec in_vec[] = {
+-		{ .base = &uid, .len = sizeof(uid) },
+-		{ .base = p_data, .len = data_length },
+-		{ .base = &create_flags, .len = sizeof(create_flags) },
++		{ .base = psa_ptr_to_u32(&uid), .len = sizeof(uid) },
++		{ .base = psa_ptr_const_to_u32(p_data), .len = data_length },
++		{ .base = psa_ptr_to_u32(&create_flags), .len = sizeof(create_flags) },
+ 	};
+ 
+ 	(void)client_id;
+@@ -53,11 +53,11 @@ static psa_status_t secure_storage_ipc_get(void *context,
+ 	psa_status_t psa_status;
+ 	uint32_t offset = (uint32_t)data_offset;
+ 	struct psa_invec in_vec[] = {
+-		{ .base = &uid, .len = sizeof(uid) },
+-		{ .base = &offset, .len = sizeof(offset) },
++		{ .base = psa_ptr_to_u32(&uid), .len = sizeof(uid) },
++		{ .base = psa_ptr_to_u32(&offset), .len = sizeof(offset) },
+ 	};
+ 	struct psa_outvec out_vec[] = {
+-		{ .base = p_data, .len = data_size },
++		{ .base = psa_ptr_to_u32(p_data), .len = data_size },
+ 	};
+ 
+ 	if (!p_data_length) {
+@@ -84,10 +84,10 @@ static psa_status_t secure_storage_ipc_get_info(void *context,
+ 	psa_handle_t psa_handle;
+ 	psa_status_t psa_status;
+ 	struct psa_invec in_vec[] = {
+-		{ .base = &uid, .len = sizeof(uid) },
++		{ .base = psa_ptr_to_u32(&uid), .len = sizeof(uid) },
+ 	};
+ 	struct psa_outvec out_vec[] = {
+-		{ .base = p_info, .len = sizeof(*p_info) },
++		{ .base = psa_ptr_to_u32(p_info), .len = sizeof(*p_info) },
+ 	};
+ 
+ 	(void)client_id;
+@@ -110,7 +110,7 @@ static psa_status_t secure_storage_ipc_remove(void *context,
+ 	psa_handle_t psa_handle;
+ 	psa_status_t psa_status;
+ 	struct psa_invec in_vec[] = {
+-		{ .base = &uid, .len = sizeof(uid) },
++		{ .base = psa_ptr_to_u32(&uid), .len = sizeof(uid) },
+ 	};
+ 
+ 	(void)client_id;
+@@ -164,7 +164,7 @@ static uint32_t secure_storage_get_support(void *context, uint32_t client_id)
+ 	psa_status_t psa_status;
+ 	uint32_t support_flags;
+ 	struct psa_outvec out_vec[] = {
+-		{ .base = &support_flags, .len =  sizeof(support_flags) },
++		{ .base = psa_ptr_to_u32(&support_flags), .len =  sizeof(support_flags) },
+ 	};
+ 
+ 	(void)client_id;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 80cc8dc..6858986 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -30,6 +30,7 @@ SRC_URI:append = " \
                   file://0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch \
                   file://0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch \
                   file://0019-Run-psa-arch-test.patch \
+                  file://0020-Use-address-instead-of-pointers.patch \
                   "
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-- 
2.17.1


