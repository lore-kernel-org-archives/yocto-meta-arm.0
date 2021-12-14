Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C469C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:07:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.24666.1639480074372211103
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B30B06D;
	Tue, 14 Dec 2021 03:07:53 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9128C3F5A1;
	Tue, 14 Dec 2021 03:07:52 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 9/9] arm-bsp/secure-partitions: add capsule update interface
 to SE proxy SP
Date: Tue, 14 Dec 2021 11:07:31 +0000
Message-Id: <20211214110731.9081-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
References: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2687

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to add capsule update interface to SE proxy SP.
This interface sends following events to secure enclave
* firmware update request - SE will read the capsule and will flash the
image to flash to previous active bank
* kernel boot event - SE will delete timer on reciption of this event and
marks all the images as accepted if in trial state

Change-Id: I7cf9b729128d1e07e891253661fcd891191e8024
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...ub-capsule-update-service-components.patch | 416 ++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |   1 +
 2 files changed, 417 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0025-Add-stub-capsule-update-service-components.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0025-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0025-Add-stub-capsule-update-service-components.patch
new file mode 100644
index 0000000..949729c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0025-Add-stub-capsule-update-service-components.patch
@@ -0,0 +1,416 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 57d310a83190705d63bf77f29dd0d15956ec28b1 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Tue, 12 Oct 2021 15:45:41 +0100
+Subject: [PATCH] Add stub capsule update service components
+
+To facilitate development of a capsule update service provider,
+stub components are added to provide a starting point for an
+implementation. The capsule update service provider is integrated
+into the se-proxy/opteesp deployment.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: I0d4049bb4de5af7ca80806403301692507085d28
+
+diff --git a/components/service/capsule_update/backend/capsule_update_backend.h b/components/service/capsule_update/backend/capsule_update_backend.h
+new file mode 100644
+index 0000000..f3144ff
+--- /dev/null
++++ b/components/service/capsule_update/backend/capsule_update_backend.h
+@@ -0,0 +1,24 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CAPSULE_UPDATE_BACKEND_H
++#define CAPSULE_UPDATE_BACKEND_H
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * Defines the common capsule update backend interface.  Concrete backends
++ * implement this interface for different types of platform.
++ */
++
++
++#ifdef __cplusplus
++} /* extern "C" */
++#endif
++
++#endif /* CAPSULE_UPDATE_BACKEND_H */
+diff --git a/components/service/capsule_update/provider/capsule_update_provider.c b/components/service/capsule_update/provider/capsule_update_provider.c
+new file mode 100644
+index 0000000..9bbd7ab
+--- /dev/null
++++ b/components/service/capsule_update/provider/capsule_update_provider.c
+@@ -0,0 +1,133 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <trace.h>
++
++#include <protocols/service/capsule_update/capsule_update_proto.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include "capsule_update_provider.h"
++
++
++#define CAPSULE_UPDATE_REQUEST (0x1)
++#define KERNEL_STARTED_EVENT   (0x2)
++
++enum corstone1000_ioctl_id_t {
++	IOCTL_CORSTONE1000_FWU_FLASH_IMAGES = 0,
++	IOCTL_CORSTONE1000_FWU_HOST_ACK,
++};
++
++/* Service request handlers */
++static rpc_status_t update_capsule_handler(void *context, struct call_req *req);
++static rpc_status_t boot_confirmed_handler(void *context, struct call_req *req);
++
++/* Handler mapping table for service */
++static const struct service_handler handler_table[] = {
++	{CAPSULE_UPDATE_OPCODE_UPDATE_CAPSULE,			update_capsule_handler},
++	{CAPSULE_UPDATE_OPCODE_BOOT_CONFIRMED,			boot_confirmed_handler}
++};
++
++struct rpc_interface *capsule_update_provider_init(
++	struct capsule_update_provider *context)
++{
++	struct rpc_interface *rpc_interface = NULL;
++
++	if (context) {
++
++		service_provider_init(
++			&context->base_provider,
++			context,
++			handler_table,
++			sizeof(handler_table)/sizeof(struct service_handler));
++
++		rpc_interface = service_provider_get_rpc_interface(&context->base_provider);
++	}
++
++	return rpc_interface;
++}
++
++void capsule_update_provider_deinit(struct capsule_update_provider *context)
++{
++	(void)context;
++}
++
++static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller *caller)
++{
++	uint32_t ioctl_id;
++	psa_handle_t handle;
++	rpc_status_t rpc_status = TS_RPC_CALL_ACCEPTED;
++
++	struct psa_invec in_vec[] = {
++			{ .base = &ioctl_id, .len = sizeof(ioctl_id) }
++	};
++
++	if(!caller) {
++		EMSG("event_handler rpc_caller is NULL");
++		rpc_status = TS_RPC_ERROR_RESOURCE_FAILURE;
++		return rpc_status;
++	}
++
++	MSG("event handler opcode %x", opcode);
++	switch(opcode) {
++		case CAPSULE_UPDATE_REQUEST:
++		/* Openamp call with IOCTL for firmware update*/
++		ioctl_id = IOCTL_CORSTONE1000_FWU_FLASH_IMAGES;
++		handle = psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
++				TFM_SP_PLATFORM_IOCTL_VERSION);
++		if (handle <= 0) {
++			EMSG("%s Invalid handle", __func__);
++			rpc_status = TS_RPC_ERROR_INVALID_PARAMETER;
++			return rpc_status;
++		}
++		psa_call(caller,handle, PSA_IPC_CALL,
++			in_vec,IOVEC_LEN(in_vec), NULL, 0);
++		break;
++
++		case KERNEL_STARTED_EVENT:
++		ioctl_id = IOCTL_CORSTONE1000_FWU_HOST_ACK;
++		/*openamp call with IOCTL for kernel start*/
++		handle = psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
++				TFM_SP_PLATFORM_IOCTL_VERSION);
++		if (handle <= 0) {
++			EMSG("%s Invalid handle", __func__);
++			rpc_status = TS_RPC_ERROR_INVALID_PARAMETER;
++			return rpc_status;
++		}
++		psa_call(caller,handle, PSA_IPC_CALL,
++			in_vec,IOVEC_LEN(in_vec), NULL, 0);
++		break;
++		default:
++			EMSG("%s unsupported opcode", __func__);
++			rpc_status = TS_RPC_ERROR_INVALID_PARAMETER;
++			return rpc_status;
++	}
++	return rpc_status;
++
++}
++
++static rpc_status_t update_capsule_handler(void *context, struct call_req *req)
++{
++	struct capsule_update_provider *this_instance = (struct capsule_update_provider*)context;
++	struct rpc_caller *caller = this_instance->client.caller;
++	uint32_t opcode = req->opcode;
++	rpc_status_t rpc_status = TS_RPC_ERROR_NOT_READY;
++
++	rpc_status = event_handler(opcode, caller);
++	return rpc_status;
++}
++
++static rpc_status_t boot_confirmed_handler(void *context, struct call_req *req)
++{
++	struct capsule_update_provider *this_instance = (struct capsule_update_provider*)context;
++	struct rpc_caller *caller = this_instance->client.caller;
++	uint32_t opcode = req->opcode;
++	rpc_status_t rpc_status = TS_RPC_ERROR_NOT_READY;
++
++	rpc_status = event_handler(opcode, caller);
++
++	return rpc_status;
++}
+diff --git a/components/service/capsule_update/provider/capsule_update_provider.h b/components/service/capsule_update/provider/capsule_update_provider.h
+new file mode 100644
+index 0000000..3de4985
+--- /dev/null
++++ b/components/service/capsule_update/provider/capsule_update_provider.h
+@@ -0,0 +1,51 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CAPSULE_UPDATE_PROVIDER_H
++#define CAPSULE_UPDATE_PROVIDER_H
++
++#include <rpc/common/endpoint/rpc_interface.h>
++#include <service/common/provider/service_provider.h>
++#include <service/common/client/service_client.h>
++#include <service/capsule_update/backend/capsule_update_backend.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * The capsule_update_provider is a service provider that accepts update capsule
++ * requests and delegates them to a suitable backend that applies the update.
++ */
++struct capsule_update_provider
++{
++	struct service_provider base_provider;
++	struct service_client client;
++};
++
++/**
++ * \brief Initialize an instance of the capsule update service provider
++ *
++ * @param[in] context The instance to initialize
++ *
++ * \return An rpc_interface or NULL on failure
++ */
++struct rpc_interface *capsule_update_provider_init(
++	struct capsule_update_provider *context);
++
++/**
++ * \brief Cleans up when the instance is no longer needed
++ *
++ * \param[in] context   The instance to de-initialize
++ */
++void capsule_update_provider_deinit(
++	struct capsule_update_provider *context);
++
++#ifdef __cplusplus
++} /* extern "C" */
++#endif
++
++#endif /* CAPSULE_UPDATE_PROVIDER_H */
+diff --git a/components/service/capsule_update/provider/component.cmake b/components/service/capsule_update/provider/component.cmake
+new file mode 100644
+index 0000000..1d412eb
+--- /dev/null
++++ b/components/service/capsule_update/provider/component.cmake
+@@ -0,0 +1,13 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++if (NOT DEFINED TGT)
++	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
++endif()
++
++target_sources(${TGT} PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
++	)
+diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
+index 2190428..953bb71 100644
+--- a/deployments/se-proxy/opteesp/CMakeLists.txt
++++ b/deployments/se-proxy/opteesp/CMakeLists.txt
+@@ -80,6 +80,7 @@ add_components(TARGET "se-proxy"
+ 		"components/service/attestation/reporter/psa_ipc"
+ 		"components/service/attestation/client/psa_ipc"
+ 		"components/rpc/openamp/caller/sp"
++		"components/service/capsule_update/provider"
+ 
+ 		# Stub service provider backends
+ 		"components/rpc/dummy"
+diff --git a/deployments/se-proxy/opteesp/se_proxy_sp.c b/deployments/se-proxy/opteesp/se_proxy_sp.c
+index ef90d9e..11b014b 100644
+--- a/deployments/se-proxy/opteesp/se_proxy_sp.c
++++ b/deployments/se-proxy/opteesp/se_proxy_sp.c
+@@ -48,6 +48,9 @@ void __noreturn sp_main(struct ffa_init_info *init_info)
+ 	rpc_iface = attest_proxy_create();
+ 	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_ATTEST, rpc_iface);
+ 
++	rpc_iface = capsule_update_proxy_create();
++	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_CAPSULE_UPDATE, rpc_iface);
++
+ 	/* End of boot phase */
+ 	sp_msg_wait(&req_msg);
+ 
+diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/deployments/se-proxy/opteesp/service_proxy_factory.c
+index 7edeef8..591cc9e 100644
+--- a/deployments/se-proxy/opteesp/service_proxy_factory.c
++++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
+@@ -13,6 +13,7 @@
+ #include <service/crypto/factory/crypto_provider_factory.h>
+ #include <service/secure_storage/frontend/secure_storage_provider/secure_storage_provider.h>
+ #include <trace.h>
++#include <service/capsule_update/provider/capsule_update_provider.h>
+ 
+ /* Stub backends */
+ #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
+@@ -93,3 +94,18 @@ struct rpc_interface *its_proxy_create(void)
+  
+         return secure_storage_provider_init(&its_provider, backend);
+ }
++
++struct rpc_interface *capsule_update_proxy_create(void)
++{
++	static struct capsule_update_provider capsule_update_provider;
++	static struct rpc_caller *capsule_update_caller;
++
++	capsule_update_caller = openamp_caller_init(&openamp);
++
++	if (!capsule_update_caller)
++	return NULL;
++
++	capsule_update_provider.client.caller = capsule_update_caller;
++
++	return capsule_update_provider_init(&capsule_update_provider);
++}
+diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.h b/deployments/se-proxy/opteesp/service_proxy_factory.h
+index 298d407..02aa7fe 100644
+--- a/deployments/se-proxy/opteesp/service_proxy_factory.h
++++ b/deployments/se-proxy/opteesp/service_proxy_factory.h
+@@ -17,6 +17,7 @@ struct rpc_interface *attest_proxy_create(void);
+ struct rpc_interface *crypto_proxy_create(void);
+ struct rpc_interface *ps_proxy_create(void);
+ struct rpc_interface *its_proxy_create(void);
++struct rpc_interface *capsule_update_proxy_create(void);
+ 
+ #ifdef __cplusplus
+ }
+diff --git a/deployments/se-proxy/se_proxy_interfaces.h b/deployments/se-proxy/se_proxy_interfaces.h
+index 48908f8..3d4a7c2 100644
+--- a/deployments/se-proxy/se_proxy_interfaces.h
++++ b/deployments/se-proxy/se_proxy_interfaces.h
+@@ -8,9 +8,10 @@
+ #define SE_PROXY_INTERFACES_H
+ 
+ /* Interface IDs from service endpoints available from an se-proxy deployment */
+-#define SE_PROXY_INTERFACE_ID_ITS			(0)
+-#define SE_PROXY_INTERFACE_ID_PS			(1)
+-#define SE_PROXY_INTERFACE_ID_CRYPTO		(2)
+-#define SE_PROXY_INTERFACE_ID_ATTEST		(3)
++#define SE_PROXY_INTERFACE_ID_ITS			    (0)
++#define SE_PROXY_INTERFACE_ID_PS			    (1)
++#define SE_PROXY_INTERFACE_ID_CRYPTO		    (2)
++#define SE_PROXY_INTERFACE_ID_ATTEST		    (3)
++#define SE_PROXY_INTERFACE_ID_CAPSULE_UPDATE    (4)
+ 
+ #endif /* SE_PROXY_INTERFACES_H */
+diff --git a/protocols/service/capsule_update/capsule_update_proto.h b/protocols/service/capsule_update/capsule_update_proto.h
+new file mode 100644
+index 0000000..8f326cd
+--- /dev/null
++++ b/protocols/service/capsule_update/capsule_update_proto.h
+@@ -0,0 +1,13 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CAPSULE_UPDATE_PROTO_H
++#define CAPSULE_UPDATE_PROTO_H
++
++#include <protocols/service/capsule_update/opcodes.h>
++#include <protocols/service/capsule_update/parameters.h>
++
++#endif /* CAPSULE_UPDATE_PROTO_H */
+diff --git a/protocols/service/capsule_update/opcodes.h b/protocols/service/capsule_update/opcodes.h
+new file mode 100644
+index 0000000..8185a09
+--- /dev/null
++++ b/protocols/service/capsule_update/opcodes.h
+@@ -0,0 +1,17 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CAPSULE_UPDATE_OPCODES_H
++#define CAPSULE_UPDATE_OPCODES_H
++
++/**
++ * Opcode definitions for the capsule update service
++ */
++
++#define CAPSULE_UPDATE_OPCODE_UPDATE_CAPSULE		1
++#define CAPSULE_UPDATE_OPCODE_BOOT_CONFIRMED		2
++
++#endif /* CAPSULE_UPDATE_OPCODES_H */
+diff --git a/protocols/service/capsule_update/parameters.h b/protocols/service/capsule_update/parameters.h
+new file mode 100644
+index 0000000..285d924
+--- /dev/null
++++ b/protocols/service/capsule_update/parameters.h
+@@ -0,0 +1,15 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CAPSULE_UPDATE_PARAMETERS_H
++#define CAPSULE_UPDATE_PARAMETERS_H
++
++/**
++ * Operation parameter definitions for the capsule update service access protocol.
++ */
++
++
++#endif /* CAPSULE_UPDATE_PARAMETERS_H */
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 5afb131..bb34f54 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -35,6 +35,7 @@ SRC_URI:append = " \
                   file://0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch \
                   file://0023-add-psa-ipc-crypto-backend.patch \
                   file://0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch \
+                  file://0025-Add-stub-capsule-update-service-components.patch \
                   "
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-- 
2.17.1


