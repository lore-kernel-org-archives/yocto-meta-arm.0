Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B829C433FE
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:09:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24290.1639480179487584928
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AC416D;
	Tue, 14 Dec 2021 03:09:39 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 081143F5A1;
	Tue, 14 Dec 2021 03:09:37 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH honister 3/9] arm-bsp/secure-partitions: corstone1000: Add psa
 ipc attestation to se proxy
Date: Tue, 14 Dec 2021 11:09:19 +0000
Message-Id: <20211214110925.9936-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214110925.9936-1-abdellatif.elkhlifi@arm.com>
References: <20211214110925.9936-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:09:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2691

From: Satish Kumar <satish.kumar01@arm.com>

Implement attestation client API as psa ipc and include it to
se proxy deployment.

Change-Id: I0a1130d2013717c6499da5bb2cd6cd11a752bcce
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 ...-Add-psa-ipc-attestation-to-se-proxy.patch | 268 ++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |   1 +
 2 files changed, 269 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0021-Add-psa-ipc-attestation-to-se-proxy.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0021-Add-psa-ipc-attestation-to-se-proxy.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0021-Add-psa-ipc-attestation-to-se-proxy.patch
new file mode 100644
index 0000000..23b38da
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0021-Add-psa-ipc-attestation-to-se-proxy.patch
@@ -0,0 +1,268 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
+From 20bab8442387480d77cf5d7c8271758acf9ed181 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 7 Dec 2021 11:50:00 +0000
+Subject: [PATCH 3/5] Add psa ipc attestation to se proxy
+
+Implement attestation client API as psa ipc and include it to
+se proxy deployment.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../client/psa_ipc/component.cmake            | 13 +++
+ .../client/psa_ipc/iat_ipc_client.c           | 86 +++++++++++++++++++
+ .../reporter/psa_ipc/component.cmake          | 13 +++
+ .../reporter/psa_ipc/psa_ipc_attest_report.c  | 45 ++++++++++
+ components/service/common/include/psa/sid.h   |  4 +
+ deployments/se-proxy/opteesp/CMakeLists.txt   |  3 +-
+ .../se-proxy/opteesp/service_proxy_factory.c  |  6 ++
+ 7 files changed, 169 insertions(+), 1 deletion(-)
+ create mode 100644 components/service/attestation/client/psa_ipc/component.cmake
+ create mode 100644 components/service/attestation/client/psa_ipc/iat_ipc_client.c
+ create mode 100644 components/service/attestation/reporter/psa_ipc/component.cmake
+ create mode 100644 components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c
+
+diff --git a/components/service/attestation/client/psa_ipc/component.cmake b/components/service/attestation/client/psa_ipc/component.cmake
+new file mode 100644
+index 0000000..a5bc6b4
+--- /dev/null
++++ b/components/service/attestation/client/psa_ipc/component.cmake
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
++	"${CMAKE_CURRENT_LIST_DIR}/iat_ipc_client.c"
++	)
+diff --git a/components/service/attestation/client/psa_ipc/iat_ipc_client.c b/components/service/attestation/client/psa_ipc/iat_ipc_client.c
+new file mode 100644
+index 0000000..30bd0a1
+--- /dev/null
++++ b/components/service/attestation/client/psa_ipc/iat_ipc_client.c
+@@ -0,0 +1,86 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <stddef.h>
++#include <string.h>
++
++#include "../psa/iat_client.h"
++#include <protocols/rpc/common/packed-c/status.h>
++#include <psa/initial_attestation.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++
++/**
++ * @brief      The singleton psa_iat_client instance
++ *
++ * The psa attestation C API assumes a single backend service provider.
++ */
++static struct service_client instance;
++
++
++psa_status_t psa_iat_client_init(struct rpc_caller *caller)
++{
++	return service_client_init(&instance, caller);
++}
++
++void psa_iat_client_deinit(void)
++{
++	service_client_deinit(&instance);
++}
++
++int psa_iat_client_rpc_status(void)
++{
++	return instance.rpc_status;
++}
++
++psa_status_t psa_initial_attest_get_token(const uint8_t *auth_challenge,
++					  size_t challenge_size,
++					  uint8_t *token_buf,
++					  size_t token_buf_size,
++					  size_t *token_size)
++{
++	psa_status_t status = PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller *caller = instance.caller;
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_const_to_u32(auth_challenge), .len = challenge_size},
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(token_buf), .len = token_buf_size},
++	};
++
++	if (!token_buf || !token_buf_size)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	status = psa_call(caller, TFM_ATTESTATION_SERVICE_HANDLE,
++			  TFM_ATTEST_GET_TOKEN, in_vec, IOVEC_LEN(in_vec),
++			  out_vec, IOVEC_LEN(out_vec));
++	if (status == PSA_SUCCESS) {
++		*token_size = out_vec[0].len;
++	}
++
++	return status;
++}
++
++psa_status_t psa_initial_attest_get_token_size(size_t challenge_size,
++						size_t *token_size)
++{
++	struct rpc_caller *caller = instance.caller;
++	psa_status_t status;
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&challenge_size), .len = sizeof(uint32_t)}
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(token_size), .len = sizeof(uint32_t)}
++	};
++
++	status = psa_call(caller, TFM_ATTESTATION_SERVICE_HANDLE,
++			  TFM_ATTEST_GET_TOKEN_SIZE,
++			  in_vec, IOVEC_LEN(in_vec),
++			  out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
+diff --git a/components/service/attestation/reporter/psa_ipc/component.cmake b/components/service/attestation/reporter/psa_ipc/component.cmake
+new file mode 100644
+index 0000000..b37830c
+--- /dev/null
++++ b/components/service/attestation/reporter/psa_ipc/component.cmake
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
++	"${CMAKE_CURRENT_LIST_DIR}/psa_ipc_attest_report.c"
++	)
+diff --git a/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c b/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c
+new file mode 100644
+index 0000000..15805e8
+--- /dev/null
++++ b/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c
+@@ -0,0 +1,45 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++/**
++ * A attestation reporter for psa ipc
++ */
++
++#include <stddef.h>
++#include <psa/error.h>
++#include <service/attestation/reporter/attest_report.h>
++#include <psa/initial_attestation.h>
++
++#define TOKEN_BUF_SIZE	1024
++
++static uint8_t token_buf[TOKEN_BUF_SIZE];
++
++int attest_report_create(int32_t client_id, const uint8_t *auth_challenge_data,
++			 size_t auth_challenge_len, const uint8_t **report,
++			 size_t *report_len)
++{
++	*report = token_buf;
++	psa_status_t ret;
++	size_t token_size = 0;
++
++	ret = psa_initial_attest_get_token(auth_challenge_data,
++					   auth_challenge_len, token_buf,
++					   TOKEN_BUF_SIZE, &token_size);
++	if (ret != PSA_SUCCESS) {
++		*report = NULL;
++		*report_len = 0;
++		return ret;
++	}
++
++	*report_len = token_size;
++
++	return PSA_SUCCESS;
++}
++
++void attest_report_destroy(const uint8_t *report)
++{
++	(void)report;
++}
+diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
+index aaa973c..833f503 100644
+--- a/components/service/common/include/psa/sid.h
++++ b/components/service/common/include/psa/sid.h
+@@ -50,6 +50,10 @@ extern "C" {
+ #define TFM_ATTESTATION_SERVICE_VERSION                            (1U)
+ #define TFM_ATTESTATION_SERVICE_HANDLE                             (0x40000103U)
+ 
++/* Initial Attestation message types that distinguish Attest services. */
++#define TFM_ATTEST_GET_TOKEN       1001
++#define TFM_ATTEST_GET_TOKEN_SIZE  1002
++
+ /******** TFM_SP_FWU ********/
+ #define TFM_FWU_WRITE_SID                                          (0x000000A0U)
+ #define TFM_FWU_WRITE_VERSION                                      (1U)
+diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
+index 663177b..af2225e 100644
+--- a/deployments/se-proxy/opteesp/CMakeLists.txt
++++ b/deployments/se-proxy/opteesp/CMakeLists.txt
+@@ -77,12 +77,13 @@ add_components(TARGET "se-proxy"
+ 		"components/service/attestation/include"
+ 		"components/service/attestation/provider"
+ 		"components/service/attestation/provider/serializer/packed-c"
++		"components/service/attestation/reporter/psa_ipc"
++		"components/service/attestation/client/psa_ipc"
+ 		"components/rpc/openamp/caller/sp"
+ 
+ 		# Stub service provider backends
+ 		"components/rpc/dummy"
+ 		"components/rpc/common/caller"
+-		"components/service/attestation/reporter/stub"
+ 		"components/service/attestation/key_mngr/stub"
+ 		"components/service/crypto/backend/stub"
+ 		"components/service/crypto/client/psa"
+diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/deployments/se-proxy/opteesp/service_proxy_factory.c
+index 5729005..4b8ccec 100644
+--- a/deployments/se-proxy/opteesp/service_proxy_factory.c
++++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
+@@ -23,12 +23,18 @@ struct openamp_caller openamp;
+ struct rpc_interface *attest_proxy_create(void)
+ {
+ 	struct rpc_interface *attest_iface;
++	struct rpc_caller *attest_caller;
+ 
+ 	/* Static objects for proxy instance */
+ 	static struct attest_provider attest_provider;
+ 
++	attest_caller = openamp_caller_init(&openamp);
++	if (!attest_caller)
++		return NULL;
++
+ 	/* Initialize the service provider */
+ 	attest_iface = attest_provider_init(&attest_provider);
++	psa_iat_client_init(&openamp.rpc_caller);
+ 
+ 	attest_provider_register_serializer(&attest_provider,
+ 		TS_RPC_ENCODING_PACKED_C, packedc_attest_provider_serializer_instance());
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 6858986..4bfb6b7 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -31,6 +31,7 @@ SRC_URI:append = " \
                   file://0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch \
                   file://0019-Run-psa-arch-test.patch \
                   file://0020-Use-address-instead-of-pointers.patch \
+                  file://0021-Add-psa-ipc-attestation-to-se-proxy.patch \
                   "
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-- 
2.17.1


