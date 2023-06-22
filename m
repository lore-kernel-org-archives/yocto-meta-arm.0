Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3369AC0015E
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:08:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10845.1687439334280429165
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 06:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAFF8C14;
	Thu, 22 Jun 2023 06:09:37 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 22BA23F64C;
	Thu, 22 Jun 2023 06:08:53 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 7/8] arm-bsp/trusted-services: corstone1000: Fix Capsule Update
Date: Thu, 22 Jun 2023 14:08:35 +0100
Message-Id: <20230622130836.11346-8-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230622130836.11346-1-emekcan.aras@arm.com>
References: <20230622130836.11346-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 13:08:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4823

From: Emekcan Aras <emekcan.aras@arm.com>

Adds missing update service definitions for using stateless platform
services and initializes the capsule udpate provider in se-proxy-sp
for corstone1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...0-Use-the-stateless-platform-service.patch | 141 ++++++++++++++++++
 ...0-Initialize-capsule-update-provider.patch |  78 ++++++++++
 .../trusted-services/ts-arm-platforms.inc     |   2 +
 3 files changed, 221 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-plat-corstone1000-Use-the-stateless-platform-service.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-plat-corstone1000-Initialize-capsule-update-provider.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-plat-corstone1000-Use-the-stateless-platform-service.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-plat-corstone1000-Use-the-stateless-platform-service.patch
new file mode 100644
index 00000000..4e9d5c2e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-plat-corstone1000-Use-the-stateless-platform-service.patch
@@ -0,0 +1,141 @@
+From a71e99045996c57a4f80509ae8b770aa4f73f6c0 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Sun, 18 Jun 2023 14:38:42 +0100
+Subject: [PATCH] plat: corstone1000: Use the stateless platform service calls
+ Calls to psa_connect is not needed and psa_call can be called directly with a
+ pre defined handle.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+
+Upstream-Status: Inappropriate [Design is to revisted]
+---
+ .../provider/capsule_update_provider.c        | 24 ++++---------------
+ .../provider/corstone1000_fmp_service.c       | 10 ++++----
+ .../provider/corstone1000_fmp_service.h       |  3 +--
+ components/service/common/include/psa/sid.h   |  7 ++++++
+ 4 files changed, 17 insertions(+), 27 deletions(-)
+
+diff --git a/components/service/capsule_update/provider/capsule_update_provider.c b/components/service/capsule_update/provider/capsule_update_provider.c
+index 991a2235..6809249f 100644
+--- a/components/service/capsule_update/provider/capsule_update_provider.c
++++ b/components/service/capsule_update/provider/capsule_update_provider.c
+@@ -61,7 +61,6 @@ void capsule_update_provider_deinit(struct capsule_update_provider *context)
+ static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller *caller)
+ {
+ 	uint32_t ioctl_id;
+-	psa_handle_t handle;
+ 	rpc_status_t rpc_status = TS_RPC_CALL_ACCEPTED;
+ 
+ 	struct psa_invec in_vec[] = {
+@@ -79,31 +78,18 @@ static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller *caller)
+ 		case CAPSULE_UPDATE_REQUEST:
+ 		/* Openamp call with IOCTL for firmware update*/
+ 		ioctl_id = IOCTL_CORSTONE1000_FWU_FLASH_IMAGES;
+-		handle = psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
+-				TFM_SP_PLATFORM_IOCTL_VERSION);
+-		if (handle <= 0) {
+-			EMSG("%s Invalid handle", __func__);
+-			rpc_status = TS_RPC_ERROR_INVALID_PARAMETER;
+-			return rpc_status;
+-		}
+-		psa_call(caller,handle, PSA_IPC_CALL,
++		psa_call(caller,TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCTL,
+ 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
+-		set_fmp_image_info(caller, handle);
++		set_fmp_image_info(caller);
+ 		break;
+ 
+ 		case KERNEL_STARTED_EVENT:
+ 		ioctl_id = IOCTL_CORSTONE1000_FWU_HOST_ACK;
+ 		/*openamp call with IOCTL for kernel start*/
+-		handle = psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
+-				TFM_SP_PLATFORM_IOCTL_VERSION);
+-		if (handle <= 0) {
+-			EMSG("%s Invalid handle", __func__);
+-			rpc_status = TS_RPC_ERROR_INVALID_PARAMETER;
+-			return rpc_status;
+-		}
+-		psa_call(caller,handle, PSA_IPC_CALL,
++		
++		psa_call(caller,TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCTL,
+ 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
+-		set_fmp_image_info(caller, handle);
++		set_fmp_image_info(caller);
+ 		break;
+ 		default:
+ 			EMSG("%s unsupported opcode", __func__);
+diff --git a/components/service/capsule_update/provider/corstone1000_fmp_service.c b/components/service/capsule_update/provider/corstone1000_fmp_service.c
+index 6a7a47a7..d811af9f 100644
+--- a/components/service/capsule_update/provider/corstone1000_fmp_service.c
++++ b/components/service/capsule_update/provider/corstone1000_fmp_service.c
+@@ -238,8 +238,7 @@ static psa_status_t unpack_image_info(void *buffer, uint32_t size)
+     return PSA_SUCCESS;
+ }
+ 
+-static psa_status_t get_image_info(struct rpc_caller *caller,
+-			   psa_handle_t platform_service_handle)
++static psa_status_t get_image_info(struct rpc_caller *caller)
+ {
+     psa_status_t status;
+     psa_handle_t handle;
+@@ -255,7 +254,7 @@ static psa_status_t get_image_info(struct rpc_caller *caller,
+ 
+     memset(image_info_buffer, 0, IMAGE_INFO_BUFFER_SIZE);
+ 
+-    psa_call(caller, platform_service_handle, PSA_IPC_CALL,
++    psa_call(caller, TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCTL,
+ 	     in_vec, IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
+ 
+     status = unpack_image_info(image_info_buffer, IMAGE_INFO_BUFFER_SIZE);
+@@ -288,12 +287,11 @@ static psa_status_t set_image_info(struct rpc_caller *caller)
+     return PSA_SUCCESS;
+ }
+ 
+-void set_fmp_image_info(struct rpc_caller *caller,
+-			psa_handle_t platform_service_handle)
++void set_fmp_image_info(struct rpc_caller *caller)
+ {
+     psa_status_t status;
+ 
+-    status = get_image_info(caller, platform_service_handle);
++    status = get_image_info(caller);
+     if (status != PSA_SUCCESS) {
+ 	return;
+     }
+diff --git a/components/service/capsule_update/provider/corstone1000_fmp_service.h b/components/service/capsule_update/provider/corstone1000_fmp_service.h
+index 95fba2a0..963223e8 100644
+--- a/components/service/capsule_update/provider/corstone1000_fmp_service.h
++++ b/components/service/capsule_update/provider/corstone1000_fmp_service.h
+@@ -16,8 +16,7 @@ extern "C" {
+ 
+ void provision_fmp_variables_metadata(struct rpc_caller *caller);
+ 
+-void set_fmp_image_info(struct rpc_caller *caller,
+-		psa_handle_t platform_service_handle);
++void set_fmp_image_info(struct rpc_caller *caller);
+ 
+ #ifdef __cplusplus
+ } /* extern "C" */
+diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
+index 5aaa659d..fc3a4fb0 100644
+--- a/components/service/common/include/psa/sid.h
++++ b/components/service/common/include/psa/sid.h
+@@ -40,6 +40,13 @@ extern "C" {
+ #define TFM_CRYPTO_VERSION                                         (1U)
+ #define TFM_CRYPTO_HANDLE                                          (0x40000100U)
+ 
++/******** TFM_PLATFORM_SERVICE *******/
++#define TFM_PLATFORM_API_ID_IOCTL         (1013)
++#define TFM_PLATFORM_SERVICE_HANDLE       (0x40000105U)
++
++/**
++ * \brief Define a progressive numerical value for each SID which can be used
++ *        when dispatching the requests to the service
+ /******** TFM_SP_PLATFORM ********/
+ #define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x00000040U)
+ #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-plat-corstone1000-Initialize-capsule-update-provider.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-plat-corstone1000-Initialize-capsule-update-provider.patch
new file mode 100644
index 00000000..3e6f606c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-plat-corstone1000-Initialize-capsule-update-provider.patch
@@ -0,0 +1,78 @@
+From b5b31064959665f4cc616733be3d989ae4356636 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Sun, 18 Jun 2023 16:05:27 +0100
+Subject: [PATCH] plat: corstone1000: Initialize capsule update provider
+
+Initializes the capsule update service provider in se-proxy-sp.c deployment
+for corstone1000.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Inappropriate [Design is to revisted]
+
+---
+ deployments/se-proxy/env/commonsp/se_proxy_sp.c |  3 +++
+ .../infra/corstone1000/service_proxy_factory.c  | 17 +++++++++++++++++
+ .../se-proxy/infra/service_proxy_factory.h      |  1 +
+ 3 files changed, 21 insertions(+)
+
+diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
+index 45fcb385..dc2a9d49 100644
+--- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
++++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
+@@ -77,6 +77,9 @@ void __noreturn sp_main(struct ffa_init_info *init_info)
+ 	}
+ 	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_ATTEST, rpc_iface);
+ 
++	rpc_iface = capsule_update_proxy_create();
++	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_CAPSULE_UPDATE, rpc_iface);
++
+ 	/* End of boot phase */
+ 	result = sp_msg_wait(&req_msg);
+ 	if (result != SP_RESULT_OK) {
+diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+index bacab1de..32d88c97 100644
+--- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
++++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+@@ -14,6 +14,7 @@
+ #include <service/crypto/factory/crypto_provider_factory.h>
+ #include <service/secure_storage/frontend/secure_storage_provider/secure_storage_provider.h>
+ #include <trace.h>
++#include <service/capsule_update/provider/capsule_update_provider.h>
+ 
+ /* backends */
+ #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
+@@ -94,3 +95,19 @@ struct rpc_interface *its_proxy_create(void)
+ 
+ 	return secure_storage_provider_init(&its_provider, backend);
+ }
++
++struct rpc_interface *capsule_update_proxy_create(void)
++{
++	static struct capsule_update_provider capsule_update_provider;
++	static struct rpc_caller *capsule_update_caller;
++
++	capsule_update_caller = psa_ipc_caller_init(&psa_ipc);
++
++	if (!capsule_update_caller)
++	return NULL;
++
++	capsule_update_provider.client.caller = capsule_update_caller;
++
++	return capsule_update_provider_init(&capsule_update_provider);
++}
++
+diff --git a/deployments/se-proxy/infra/service_proxy_factory.h b/deployments/se-proxy/infra/service_proxy_factory.h
+index 298d407a..02aa7fe2 100644
+--- a/deployments/se-proxy/infra/service_proxy_factory.h
++++ b/deployments/se-proxy/infra/service_proxy_factory.h
+@@ -17,6 +17,7 @@ struct rpc_interface *attest_proxy_create(void);
+ struct rpc_interface *crypto_proxy_create(void);
+ struct rpc_interface *ps_proxy_create(void);
+ struct rpc_interface *its_proxy_create(void);
++struct rpc_interface *capsule_update_proxy_create(void);
+ 
+ #ifdef __cplusplus
+ }
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
index baf4dbdb..3535ddb6 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -7,6 +7,8 @@ SRC_URI:append:corstone1000  = " \
     file://0003-FMP-Support-in-Corstone1000.patch;patchdir=../trusted-services \
     file://0004-GetNextVariableName-Fix.patch;patchdir=../trusted-services     \
     file://0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch;patchdir=../trusted-services \
+    file://0006-plat-corstone1000-Use-the-stateless-platform-service.patch;patchdir=../trusted-services \
+    file://0007-plat-corstone1000-Initialize-capsule-update-provider.patch;patchdir=../trusted-services \
     "
 
 
-- 
2.17.1


