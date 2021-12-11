Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C78C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 10:08:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.20027.1639217338930180934
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 02:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81722113E;
	Sat, 11 Dec 2021 02:08:58 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 974B63F73D;
	Sat, 11 Dec 2021 02:08:57 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH][HONISTER 7/9] arm-bsp/secure-partitions: add common service
 component to ipc support
Date: Sat, 11 Dec 2021 10:08:35 +0000
Message-Id: <20211211100837.19703-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
References: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 11 Dec 2021 10:08:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2632

From: Vishnu Banavath <vishnu.banavath@arm.com>

Add support for inter processor communication for PSA
including, the openamp client side structures lib.

Change-Id: Icb86045b7915c4b04d2ec73b88ed40a3d65be4af
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...mon-service-component-to-ipc-support.patch | 287 ++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |   1 +
 2 files changed, 288 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0011-Add-common-service-component-to-ipc-support.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0011-Add-common-service-component-to-ipc-support.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0011-Add-common-service-component-to-ipc-support.patch
new file mode 100644
index 0000000..7627840
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0011-Add-common-service-component-to-ipc-support.patch
@@ -0,0 +1,287 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 13c7fa7bcc93f82cbc1e8a6f561b33133777a3a9 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 19:13:03 +0000
+Subject: [PATCH] Add common service component to ipc support
+
+Add support for inter processor communication for PSA
+including, the openamp client side structures lib.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+
+diff --git a/components/service/common/psa_ipc/component.cmake b/components/service/common/psa_ipc/component.cmake
+new file mode 100644
+index 0000000..5a1c9e6
+--- /dev/null
++++ b/components/service/common/psa_ipc/component.cmake
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
++	"${CMAKE_CURRENT_LIST_DIR}/service_psa_ipc.c"
++	)
+diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
+new file mode 100644
+index 0000000..e8093c2
+--- /dev/null
++++ b/components/service/common/psa_ipc/service_psa_ipc.c
+@@ -0,0 +1,97 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <stddef.h>
++#include <stdint.h>
++#include <string.h>
++#include <trace.h>
++
++#include <protocols/rpc/common/packed-c/status.h>
++#include <psa/error.h>
++#include <rpc_caller.h>
++
++#include <psa/client.h>
++#include "service_psa_ipc_openamp_lib.h"
++
++psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
++			 uint32_t version)
++{
++	psa_status_t psa_status = PSA_SUCCESS;
++	struct s_openamp_msg *resp_msg = NULL;
++	struct ns_openamp_msg *req_msg;
++	rpc_call_handle rpc_handle;
++	size_t resp_len;
++	uint8_t *resp;
++	uint8_t *req;
++	int ret;
++
++	rpc_handle = rpc_caller_begin(caller, &req,
++				      sizeof(struct ns_openamp_msg));
++	if (!rpc_handle) {
++		EMSG("psa_connect: could not get handle");
++		return PSA_ERROR_GENERIC_ERROR;
++	}
++
++	req_msg = (struct ns_openamp_msg *)req;
++
++	req_msg->call_type = OPENAMP_PSA_CONNECT;
++	req_msg->params.psa_connect_params.sid = sid;
++	req_msg->params.psa_connect_params.version = version;
++
++	ret = rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
++				&resp_len);
++	if (ret != TS_RPC_CALL_ACCEPTED) {
++		EMSG("psa_connect: invoke failed: %d", ret);
++		return PSA_ERROR_GENERIC_ERROR;
++	}
++
++	if (psa_status == PSA_SUCCESS)
++		resp_msg = (struct s_openamp_msg *)resp;
++
++	rpc_caller_end(caller, rpc_handle);
++
++	return resp_msg ? (psa_handle_t)resp_msg->reply : PSA_NULL_HANDLE;
++}
++
++psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
++		      int32_t type, const struct psa_invec *in_vec,
++		      size_t in_len, struct psa_outvec *out_vec, size_t out_len)
++{
++
++}
++
++void psa_close(struct rpc_caller *caller, psa_handle_t handle)
++{
++	psa_status_t psa_status = PSA_SUCCESS;
++	struct s_openamp_msg *resp_msg = NULL;
++	struct ns_openamp_msg *req_msg;
++	rpc_call_handle rpc_handle;
++	size_t resp_len;
++	uint8_t *resp;
++	uint8_t *req;
++	int ret;
++
++	rpc_handle = rpc_caller_begin(caller, &req,
++				      sizeof(struct ns_openamp_msg));
++	if (!rpc_handle) {
++		EMSG("psa_close: could not get handle");
++		return;
++	}
++
++	req_msg = (struct ns_openamp_msg *)req;
++
++	req_msg->call_type = OPENAMP_PSA_CLOSE;
++	req_msg->params.psa_close_params.handle = handle;
++
++	ret = rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
++				&resp_len);
++	if (ret != TS_RPC_CALL_ACCEPTED) {
++		EMSG("psa_close: invoke failed: %d", ret);
++		return;
++	}
++
++	rpc_caller_end(caller, rpc_handle);
++}
+diff --git a/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
+new file mode 100644
+index 0000000..c637dfa
+--- /dev/null
++++ b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
+@@ -0,0 +1,131 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef SERVICE_PSA_IPC_OPENAMP_LIB_H
++#define SERVICE_PSA_IPC_OPENAMP_LIB_H
++
++#include <stddef.h>
++#include <stdint.h>
++
++#include <compiler.h>
++#include <psa/error.h>
++
++#include <stdint.h>
++#include <psa/client.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/* PSA client call type value */
++#define OPENAMP_PSA_FRAMEWORK_VERSION       (0x1)
++#define OPENAMP_PSA_VERSION                 (0x2)
++#define OPENAMP_PSA_CONNECT                 (0x3)
++#define OPENAMP_PSA_CALL                    (0x4)
++#define OPENAMP_PSA_CLOSE                   (0x5)
++
++/* Return code of openamp APIs */
++#define OPENAMP_SUCCESS                     (0)
++#define OPENAMP_MAP_FULL                    (INT32_MIN + 1)
++#define OPENAMP_MAP_ERROR                   (INT32_MIN + 2)
++#define OPENAMP_INVAL_PARAMS                (INT32_MIN + 3)
++#define OPENAMP_NO_PERMS                    (INT32_MIN + 4)
++#define OPENAMP_NO_PEND_EVENT               (INT32_MIN + 5)
++#define OPENAMP_CHAN_BUSY                   (INT32_MIN + 6)
++#define OPENAMP_CALLBACK_REG_ERROR          (INT32_MIN + 7)
++#define OPENAMP_INIT_ERROR                  (INT32_MIN + 8)
++
++#define HOLD_INPUT_BUFFER (1) /* IF true, TF-M Library will hold the openamp
++			       * buffer so that openamp shared memory buffer
++			       * does not get freed.
++			       */
++
++/*
++ * This structure holds the parameters used in a PSA client call.
++ */
++typedef struct __packed psa_client_in_params {
++	union {
++		struct __packed {
++			uint32_t        sid;
++		} psa_version_params;
++
++		struct __packed {
++			uint32_t        sid;
++			uint32_t        version;
++		} psa_connect_params;
++
++		struct __packed {
++			psa_handle_t     handle;
++			int32_t          type;
++			uint32_t         in_vec;
++			uint32_t         in_len;
++			uint32_t         out_vec;
++			uint32_t         out_len;
++		} psa_call_params;
++
++		struct __packed {
++			psa_handle_t    handle;
++		} psa_close_params;
++	};
++} psa_client_in_params_t;
++
++/* Openamp message passed from NSPE to SPE to deliver a PSA client call */
++struct __packed ns_openamp_msg {
++	uint32_t                      call_type;   /* PSA client call type */
++	struct psa_client_in_params   params;      /* Contain parameters used in PSA
++						  * client call
++						  */
++
++	int32_t                     client_id;   /* Optional client ID of the
++						  * non-secure caller.
++						  * It is required to identify the
++						  * non-secure task when NSPE OS
++						  * enforces non-secure task
++						  * isolation
++						  */
++	int32_t                     request_id;  /* This is the unique ID for a
++						  * request send to TF-M by the
++						  * non-secure core. TF-M forward
++						  * the ID back to non-secure on the
++						  * reply to a given request. Using
++						  * this id, the non-secure library
++						  * can identify the request for
++						  * which the reply has received.
++						  */
++};
++
++/*
++ * This structure holds the location of the out data of the PSA client call.
++ */
++struct __packed psa_client_out_params {
++	uint32_t              out_vec;
++	uint32_t              out_len;
++};
++
++
++/* Openamp message from SPE to NSPE delivering the reply back for a PSA client
++ * call.
++ */
++struct __packed s_openamp_msg {
++	int32_t                     request_id;  /* Using this id, the non-secure
++						  * library identifies the request.
++						  * TF-M forwards the same
++						  * request-id received on the
++						  * initial request.
++						  */
++	int32_t                     reply;       /* Reply of the PSA client call */
++	struct psa_client_out_params     params;      /* Contain out data result of the
++						       * PSA client call.
++						       */
++};
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* SERVICE_PSA_IPC_OPENAMP_LIB_H */
++
++
+diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
+index b8b01c4..3b5dd1d 100644
+--- a/deployments/se-proxy/opteesp/CMakeLists.txt
++++ b/deployments/se-proxy/opteesp/CMakeLists.txt
+@@ -51,6 +51,7 @@ add_components(TARGET "se-proxy"
+ 		"components/service/common/include"
+ 		"components/service/common/serializer/protobuf"
+ 		"components/service/common/client"
++		"components/service/common/psa_ipc"
+ 		"components/service/common/provider"
+ 		"components/service/discovery/provider"
+ 		"components/service/discovery/provider/serializer/packed-c"
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index bf8c696..f917fbd 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -21,6 +21,7 @@ SRC_URI:append = " \
                   file://0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch \
                   file://0009-Add-openamp-rpc-caller.patch \
                   file://0010-add-psa-client-definitions-for-ff-m.patch \
+                  file://0011-Add-common-service-component-to-ipc-support.patch \
                   "
 
 SRCREV_ts = "882a2db4f9181fc6ddb505b82262f82e5a0c2fd5"
-- 
2.17.1


