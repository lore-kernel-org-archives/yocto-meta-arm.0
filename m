Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D101C433FE
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 19:19:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.16388.1639077595330166018
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 11:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0675611B3;
	Thu,  9 Dec 2021 11:19:55 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF3FD3F73B;
	Thu,  9 Dec 2021 11:19:53 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 6/9] arm-bsp/secure-partitions: Add psa client definitions for
 ff-m
Date: Thu,  9 Dec 2021 19:19:32 +0000
Message-Id: <20211209191935.26017-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209191935.26017-1-abdellatif.elkhlifi@arm.com>
References: <20211209191935.26017-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 19:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2595

From: Vishnu Banavath <vishnu.banavath@arm.com>

Add PSA client definitions in common include to add future
ff-m support.

Change-Id: I0860fa347fd882d6e99da136a4273a0ef5d7d684
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...-add-psa-client-definitions-for-ff-m.patch | 294 ++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |   1 +
 2 files changed, 295 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0010-add-psa-client-definitions-for-ff-m.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0010-add-psa-client-definitions-for-ff-m.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0010-add-psa-client-definitions-for-ff-m.patch
new file mode 100644
index 0000000..6cb33ce
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0010-add-psa-client-definitions-for-ff-m.patch
@@ -0,0 +1,294 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From f37bd875d3f9cd4cc029b8a52aa0571da7ebd201 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 19:05:18 +0000
+Subject: [PATCH] add psa client definitions for ff-m
+
+Add PSA client definitions in common include to add future
+ff-m support.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/components/service/common/include/psa/client.h b/components/service/common/include/psa/client.h
+new file mode 100644
+index 0000000..bd2aac8
+--- /dev/null
++++ b/components/service/common/include/psa/client.h
+@@ -0,0 +1,194 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef SERVICE_PSA_IPC_H
++#define SERVICE_PSA_IPC_H
++
++#include <stddef.h>
++#include <stdint.h>
++
++#include <rpc_caller.h>
++#include <psa/error.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#ifndef IOVEC_LEN
++#define IOVEC_LEN(arr) ((uint32_t)(sizeof(arr)/sizeof(arr[0])))
++#endif
++
++/*********************** PSA Client Macros and Types *************************/
++
++typedef int32_t psa_handle_t;
++
++/**
++ * The version of the PSA Framework API that is being used to build the calling
++ * firmware. Only part of features of FF-M v1.1 have been implemented. FF-M v1.1
++ * is compatible with v1.0.
++ */
++#define PSA_FRAMEWORK_VERSION       (0x0101u)
++
++/**
++ * Return value from psa_version() if the requested RoT Service is not present
++ * in the system.
++ */
++#define PSA_VERSION_NONE            (0u)
++
++/**
++ * The zero-value null handle can be assigned to variables used in clients and
++ * RoT Services, indicating that there is no current connection or message.
++ */
++#define PSA_NULL_HANDLE             ((psa_handle_t)0)
++
++/**
++ * Tests whether a handle value returned by psa_connect() is valid.
++ */
++#define PSA_HANDLE_IS_VALID(handle) ((psa_handle_t)(handle) > 0)
++
++/**
++ * Converts the handle value returned from a failed call psa_connect() into
++ * an error code.
++ */
++#define PSA_HANDLE_TO_ERROR(handle) ((psa_status_t)(handle))
++
++/**
++ * Maximum number of input and output vectors for a request to psa_call().
++ */
++#define PSA_MAX_IOVEC               (4u)
++
++/**
++ * An IPC message type that indicates a generic client request.
++ */
++#define PSA_IPC_CALL                (0)
++
++/**
++ * A read-only input memory region provided to an RoT Service.
++ */
++struct __attribute__ ((__packed__)) psa_invec {
++    uint32_t base;           /*!< the start address of the memory buffer */
++    uint32_t len;                 /*!< the size in bytes                      */
++};
++
++/**
++ * A writable output memory region provided to an RoT Service.
++ */
++struct __attribute__ ((__packed__)) psa_outvec {
++    uint32_t base;                 /*!< the start address of the memory buffer */
++    uint32_t len;                 /*!< the size in bytes                      */
++};
++
++/*************************** PSA Client API **********************************/
++
++/**
++ * \brief Retrieve the version of the PSA Framework API that is implemented.
++ *
++ * \param[in] rpc_caller        RPC caller to use
++ * \return version              The version of the PSA Framework implementation
++ *                              that is providing the runtime services to the
++ *                              caller. The major and minor version are encoded
++ *                              as follows:
++ * \arg                           version[15:8] -- major version number.
++ * \arg                           version[7:0]  -- minor version number.
++ */
++uint32_t psa_framework_version(struct rpc_caller *caller);
++
++/**
++ * \brief Retrieve the version of an RoT Service or indicate that it is not
++ *        present on this system.
++ *
++ * \param[in] rpc_caller        RPC caller to use
++ * \param[in] sid               ID of the RoT Service to query.
++ *
++ * \retval PSA_VERSION_NONE     The RoT Service is not implemented, or the
++ *                              caller is not permitted to access the service.
++ * \retval > 0                  The version of the implemented RoT Service.
++ */
++uint32_t psa_version(struct rpc_caller *caller, uint32_t sid);
++
++/**
++ * \brief Connect to an RoT Service by its SID.
++ *
++ * \param[in] rpc_caller        RPC caller to use
++ * \param[in] sid               ID of the RoT Service to connect to.
++ * \param[in] version           Requested version of the RoT Service.
++ *
++ * \retval > 0                  A handle for the connection.
++ * \retval PSA_ERROR_CONNECTION_REFUSED The SPM or RoT Service has refused the
++ *                              connection.
++ * \retval PSA_ERROR_CONNECTION_BUSY The SPM or RoT Service cannot make the
++ *                              connection at the moment.
++ * \retval "PROGRAMMER ERROR"   The call is a PROGRAMMER ERROR if one or more
++ *                              of the following are true:
++ * \arg                           The RoT Service ID is not present.
++ * \arg                           The RoT Service version is not supported.
++ * \arg                           The caller is not allowed to access the RoT
++ *                                service.
++ */
++psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
++			 uint32_t version);
++
++/**
++ * \brief Call an RoT Service on an established connection.
++ *
++ * \note  FF-M 1.0 proposes 6 parameters for psa_call but the secure gateway ABI
++ *        support at most 4 parameters. TF-M chooses to encode 'in_len',
++ *        'out_len', and 'type' into a 32-bit integer to improve efficiency.
++ *        Compared with struct-based encoding, this method saves extra memory
++ *        check and memory copy operation. The disadvantage is that the 'type'
++ *        range has to be reduced into a 16-bit integer. So with this encoding,
++ *        the valid range for 'type' is 0-32767.
++ *
++ * \param[in] rpc_caller        RPC caller to use
++ * \param[in] handle            A handle to an established connection.
++ * \param[in] type              The request type.
++ *                              Must be zero( \ref PSA_IPC_CALL) or positive.
++ * \param[in] in_vec            Array of input \ref psa_invec structures.
++ * \param[in] in_len            Number of input \ref psa_invec structures.
++ * \param[in,out] out_vec       Array of output \ref psa_outvec structures.
++ * \param[in] out_len           Number of output \ref psa_outvec structures.
++ *
++ * \retval >=0                  RoT Service-specific status value.
++ * \retval <0                   RoT Service-specific error code.
++ * \retval PSA_ERROR_PROGRAMMER_ERROR The connection has been terminated by the
++ *                              RoT Service. The call is a PROGRAMMER ERROR if
++ *                              one or more of the following are true:
++ * \arg                           An invalid handle was passed.
++ * \arg                           The connection is already handling a request.
++ * \arg                           type < 0.
++ * \arg                           An invalid memory reference was provided.
++ * \arg                           in_len + out_len > PSA_MAX_IOVEC.
++ * \arg                           The message is unrecognized by the RoT
++ *                                Service or incorrectly formatted.
++ */
++psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
++		      int32_t type, const struct psa_invec *in_vec,
++		      size_t in_len, struct psa_outvec *out_vec, size_t out_len);
++
++/**
++ * \brief Close a connection to an RoT Service.
++ *
++ * \param[in] rpc_caller        RPC caller to use
++ * \param[in] handle            A handle to an established connection, or the
++ *                              null handle.
++ *
++ * \retval void                 Success.
++ * \retval "PROGRAMMER ERROR"   The call is a PROGRAMMER ERROR if one or more
++ *                              of the following are true:
++ * \arg                           An invalid handle was provided that is not
++ *                                the null handle.
++ * \arg                           The connection is currently handling a
++ *                                request.
++ */
++void psa_close(struct rpc_caller *caller, psa_handle_t handle);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* SERVICE_PSA_IPC_H */
++
++
+diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
+new file mode 100644
+index 0000000..aaa973c
+--- /dev/null
++++ b/components/service/common/include/psa/sid.h
+@@ -0,0 +1,71 @@
++/*
++ * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __PSA_MANIFEST_SID_H__
++#define __PSA_MANIFEST_SID_H__
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/******** TFM_SP_PS ********/
++#define TFM_PROTECTED_STORAGE_SERVICE_SID                          (0x00000060U)
++#define TFM_PROTECTED_STORAGE_SERVICE_VERSION                      (1U)
++#define TFM_PROTECTED_STORAGE_SERVICE_HANDLE                       (0x40000101U)
++
++/* Invalid UID */
++#define TFM_PS_INVALID_UID 0
++
++/* PS message types that distinguish PS services. */
++#define TFM_PS_SET                1001
++#define TFM_PS_GET                1002
++#define TFM_PS_GET_INFO           1003
++#define TFM_PS_REMOVE             1004
++#define TFM_PS_GET_SUPPORT        1005
++
++/******** TFM_SP_ITS ********/
++#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_SID                   (0x00000070U)
++#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_VERSION               (1U)
++#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_HANDLE                (0x40000102U)
++
++/******** TFM_SP_CRYPTO ********/
++#define TFM_CRYPTO_SID                                             (0x00000080U)
++#define TFM_CRYPTO_VERSION                                         (1U)
++#define TFM_CRYPTO_HANDLE                                          (0x40000100U)
++
++/******** TFM_SP_PLATFORM ********/
++#define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x00000040U)
++#define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
++#define TFM_SP_PLATFORM_IOCTL_SID                                  (0x00000041U)
++#define TFM_SP_PLATFORM_IOCTL_VERSION                              (1U)
++#define TFM_SP_PLATFORM_NV_COUNTER_SID                             (0x00000042U)
++#define TFM_SP_PLATFORM_NV_COUNTER_VERSION                         (1U)
++
++/******** TFM_SP_INITIAL_ATTESTATION ********/
++#define TFM_ATTESTATION_SERVICE_SID                                (0x00000020U)
++#define TFM_ATTESTATION_SERVICE_VERSION                            (1U)
++#define TFM_ATTESTATION_SERVICE_HANDLE                             (0x40000103U)
++
++/******** TFM_SP_FWU ********/
++#define TFM_FWU_WRITE_SID                                          (0x000000A0U)
++#define TFM_FWU_WRITE_VERSION                                      (1U)
++#define TFM_FWU_INSTALL_SID                                        (0x000000A1U)
++#define TFM_FWU_INSTALL_VERSION                                    (1U)
++#define TFM_FWU_ABORT_SID                                          (0x000000A2U)
++#define TFM_FWU_ABORT_VERSION                                      (1U)
++#define TFM_FWU_QUERY_SID                                          (0x000000A3U)
++#define TFM_FWU_QUERY_VERSION                                      (1U)
++#define TFM_FWU_REQUEST_REBOOT_SID                                 (0x000000A4U)
++#define TFM_FWU_REQUEST_REBOOT_VERSION                             (1U)
++#define TFM_FWU_ACCEPT_SID                                         (0x000000A5U)
++#define TFM_FWU_ACCEPT_VERSION                                     (1U)
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __PSA_MANIFEST_SID_H__ */
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 4d55027..bf8c696 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -20,6 +20,7 @@ SRC_URI:append = " \
                   file://0007-Add-openamp-to-SE-proxy-deployment.patch \
                   file://0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch \
                   file://0009-Add-openamp-rpc-caller.patch \
+                  file://0010-add-psa-client-definitions-for-ff-m.patch \
                   "
 
 SRCREV_ts = "882a2db4f9181fc6ddb505b82262f82e5a0c2fd5"
-- 
2.17.1


