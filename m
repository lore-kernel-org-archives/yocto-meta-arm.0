Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79831C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:07:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.24663.1639480066497356469
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3756A6D;
	Tue, 14 Dec 2021 03:07:46 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 033B23F5A1;
	Tue, 14 Dec 2021 03:07:44 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 4/9] arm-bsp/secure-partitions: corstone1000: Setup its
 backend
Date: Tue, 14 Dec 2021 11:07:26 +0000
Message-Id: <20211214110731.9081-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
References: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2682

From: Satish Kumar <satish.kumar01@arm.com>

Setup its backend as openamp rpc using secure storage ipc
implementation.

Change-Id: I0329c87d11de7a721b3eaf004935befa6e7389c8
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 ...d-as-openamp-rpc-using-secure-storag.patch | 165 ++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
new file mode 100644
index 0000000..b715169
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
@@ -0,0 +1,165 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 53d5b73b84deb7feb4f87f2792f50fc8018ac0d5 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Thu, 9 Dec 2021 14:11:06 +0000
+Subject: [PATCH 4/5] Setup its backend as openamp rpc using secure storage ipc
+ implementation.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ components/service/common/include/psa/sid.h   | 12 +++++-----
+ .../secure_storage_ipc/secure_storage_ipc.c   | 20 ++++++++---------
+ .../secure_storage_ipc/secure_storage_ipc.h   |  1 +
+ .../se-proxy/opteesp/service_proxy_factory.c  | 22 +++++++++++++------
+ 4 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
+index 833f503..4a951d4 100644
+--- a/components/service/common/include/psa/sid.h
++++ b/components/service/common/include/psa/sid.h
+@@ -20,12 +20,12 @@ extern "C" {
+ /* Invalid UID */
+ #define TFM_PS_INVALID_UID 0
+ 
+-/* PS message types that distinguish PS services. */
+-#define TFM_PS_SET                1001
+-#define TFM_PS_GET                1002
+-#define TFM_PS_GET_INFO           1003
+-#define TFM_PS_REMOVE             1004
+-#define TFM_PS_GET_SUPPORT        1005
++/* PS / ITS message types that distinguish PS services. */
++#define TFM_PS_ITS_SET                1001
++#define TFM_PS_ITS_GET                1002
++#define TFM_PS_ITS_GET_INFO           1003
++#define TFM_PS_ITS_REMOVE             1004
++#define TFM_PS_ITS_GET_SUPPORT        1005
+ 
+ /******** TFM_SP_ITS ********/
+ #define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_SID                   (0x00000070U)
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+index bda442a..0e1b48c 100644
+--- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
++++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+@@ -31,8 +31,8 @@ static psa_status_t secure_storage_ipc_set(void *context, uint32_t client_id,
+ 
+ 	ipc->client.rpc_status = TS_RPC_CALL_ACCEPTED;
+ 
+-	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+-			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
++	psa_status = psa_call(caller, ipc->service_handle, TFM_PS_ITS_SET,
++			      in_vec, IOVEC_LEN(in_vec), NULL, 0);
+ 	if (psa_status < 0)
+ 		EMSG("ipc_set: psa_call failed: %d", psa_status);
+ 
+@@ -65,8 +65,8 @@ static psa_status_t secure_storage_ipc_get(void *context,
+ 		return PSA_ERROR_INVALID_ARGUMENT;
+ 	}
+ 
+-	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+-			      TFM_PS_GET, in_vec, IOVEC_LEN(in_vec),
++	psa_status = psa_call(caller, ipc->service_handle,
++			      TFM_PS_ITS_GET, in_vec, IOVEC_LEN(in_vec),
+ 			      out_vec, IOVEC_LEN(out_vec));
+ 	if (psa_status == PSA_SUCCESS)
+ 		*p_data_length = out_vec[0].len;
+@@ -92,8 +92,8 @@ static psa_status_t secure_storage_ipc_get_info(void *context,
+ 
+ 	(void)client_id;
+ 
+-	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+-			      TFM_PS_GET_INFO, in_vec,
++	psa_status = psa_call(caller, ipc->service_handle,
++			      TFM_PS_ITS_GET_INFO, in_vec,
+ 			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
+ 	if (psa_status != PSA_SUCCESS)
+ 		EMSG("ipc_get_info: failed to psa_call: %d", psa_status);
+@@ -115,8 +115,8 @@ static psa_status_t secure_storage_ipc_remove(void *context,
+ 
+ 	(void)client_id;
+ 
+-	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+-			      TFM_PS_REMOVE, in_vec,
++	psa_status = psa_call(caller, ipc->service_handle,
++			      TFM_PS_ITS_REMOVE, in_vec,
+ 			      IOVEC_LEN(in_vec), NULL, 0);
+ 	if (psa_status != PSA_SUCCESS)
+ 		EMSG("ipc_remove: failed to psa_call: %d", psa_status);
+@@ -169,8 +169,8 @@ static uint32_t secure_storage_get_support(void *context, uint32_t client_id)
+ 
+ 	(void)client_id;
+ 
+-	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+-			      TFM_PS_GET_SUPPORT, NULL, 0,
++	psa_status = psa_call(caller, ipc->service_handle,
++			      TFM_PS_ITS_GET_SUPPORT, NULL, 0,
+ 			      out_vec, IOVEC_LEN(out_vec));
+ 	if (psa_status != PSA_SUCCESS)
+ 		EMSG("ipc_get_support: failed to psa_call: %d", psa_status);
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
+index e8c1e8f..d9949f6 100644
+--- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
++++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
+@@ -21,6 +21,7 @@ struct secure_storage_ipc
+ {
+     struct storage_backend backend;
+     struct service_client client;
++    int32_t service_handle;
+ };
+ 
+ /**
+diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/deployments/se-proxy/opteesp/service_proxy_factory.c
+index 4b8ccec..1110ac4 100644
+--- a/deployments/se-proxy/opteesp/service_proxy_factory.c
++++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
+@@ -5,6 +5,7 @@
+  */
+ 
+ #include <stddef.h>
++#include <psa/sid.h>
+ #include <rpc/common/endpoint/rpc_interface.h>
+ #include <rpc/openamp/caller/sp/openamp_caller.h>
+ #include <service/attestation/provider/attest_provider.h>
+@@ -60,23 +61,30 @@ struct rpc_interface *ps_proxy_create(void)
+ {
+ 	static struct secure_storage_provider ps_provider;
+ 	static struct secure_storage_ipc ps_backend;
+-	static struct rpc_caller *storage_caller;
++	struct rpc_caller *storage_caller;
+ 	struct storage_backend *backend;
+ 
+ 	storage_caller = openamp_caller_init(&openamp);
+ 	if (!storage_caller)
+ 		return NULL;
+ 	backend = secure_storage_ipc_init(&ps_backend, &openamp.rpc_caller);
++	ps_backend.service_handle = TFM_PROTECTED_STORAGE_SERVICE_HANDLE;
+ 
+ 	return secure_storage_provider_init(&ps_provider, backend);
+ }
+ 
+ struct rpc_interface *its_proxy_create(void)
+ {
+-	static struct mock_store its_backend;
+-	static struct secure_storage_provider its_provider;
+-
+-	struct storage_backend *backend = mock_store_init(&its_backend);
+-
+-	return secure_storage_provider_init(&its_provider, backend);
++        static struct secure_storage_provider its_provider;
++        static struct secure_storage_ipc its_backend;
++        struct rpc_caller *storage_caller;
++        struct storage_backend *backend;
++ 
++        storage_caller = openamp_caller_init(&openamp);
++        if (!storage_caller)
++        	return NULL;
++        backend = secure_storage_ipc_init(&its_backend, &openamp.rpc_caller);
++        its_backend.service_handle = TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_HANDLE;
++ 
++        return secure_storage_provider_init(&its_provider, backend);
+ }
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 4bfb6b7..7134143 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -32,6 +32,7 @@ SRC_URI:append = " \
                   file://0019-Run-psa-arch-test.patch \
                   file://0020-Use-address-instead-of-pointers.patch \
                   file://0021-Add-psa-ipc-attestation-to-se-proxy.patch \
+                  file://0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch \
                   "
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-- 
2.17.1


