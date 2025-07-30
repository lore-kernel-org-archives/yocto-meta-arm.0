Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D4DC87FD5
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.33473.1753876435424064067
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04D9E2573;
	Wed, 30 Jul 2025 04:53:47 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02EF53F66E;
	Wed, 30 Jul 2025 04:53:53 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>,
	Ali Can Ozaslan <ali.oezaslan@arm.com>,
	Imre Kis <imre.kis@arm.com>
Subject: [PATCH 05/13] arm-bsp/trusted-services: corstone1000: PSA FWU implementation
Date: Wed, 30 Jul 2025 12:53:19 +0100
Message-Id: <20250730115327.3671160-6-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6642

This commit implement the required changes in Trusted-Services in order
to incorporate PSA FWU implementation. It involves the following changes:

1. Integrate IPC framework for PSA FWU calls between Cortex-A and Cortex-=
M subsystems.
IPC framework is required to bridge the PSA FWU calls for the platforms w=
hich have
both Cortex-A and Cortex-M subsystems. Corstone-1000 falls under this cat=
egory of
platforms. In these platforms, the PSA FWU client and PSA FWU provider ex=
ist on
Cortex-A and all the PSA FWU services are implemented on Cortex-M side. T=
his IPC
framework forwards the PSA FWU calls from Cortex-A to Cortex-M subsystem.

2. Load initial image state in PSA FWU M update agent
Set initial image state based on the image state returned by
psa_fwu_query. This way the update agent has the correct view of images
after reboot and it can accept or reject them.

3. Define PSA FWU image mapping structure.
Define PSA FWU image mapping structure for Corstone-1000.
This structure is responsible to map specific image guid with
component number.
To enable platform-specific handling, service_proxy_factory.c now
conditionally selects the appropriate image mapping
based on PLATFORM_IS_FVP. This ensures that both FVP and MPS3
platforms use the correct GUID and firmware update configuration.

4. Fix PSA FWU IPC psa_fwu_install() return value check
This change adds support to validate if the return type in psa_fwu_instal=
l()
is either PSA_SUCCESS or PSA_SUCCESS_REBOOT. Both the return values are e=
xpected.
Earlier, only PSA_SUCCESS is validated.

5. Add ESRT support
Add ESRT support for PSA FWU M agent.
ESRT functionality is implemented using unique image dedicated
for ESRT data having its own UUID. In PSA FWU M agent's context,
this image has read only attributes. The ESRT data can be read
using image_read_directory by using ESRT image UUID handle. The
ESRT data is queried from Secure Enclave using psa_fwu_query()
and ESRT data can be read from psa_fwu_impl_info_t structure
object defined in psa_fwu_component_info_t.

This commit includes the following changes:
1. Declare ESRT data structures.
2. Modify image_directory_read() to include ESRT data read support
3. Modify psa_fwu_m_update_agent_init to initialize ESRT image
attributes

6. Enable ESRT support
Enable ESRT support for Corstone-1000.
Introduce ESRT image UUID and its component number and
set TFM_FWU_MAX_DIGEST_SIZE to ESRT data size.

7. Add event provider proxy
Normal world needs to send boot confirmation event
to Secure Enclave and Trusted-Services is responsible
to transfer the event to Secure Enclave.
This commit implements the event handling framework in
SE-proxy-SP and develops event provider proxy which
forwards the event to Secure Enclave via psa calls.
This change is introduced for Corstone-1000

8. Define GUID for each payloads
Define GUID's for all the 4 payloads for FVP and
MPS3.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
Signed-off-by: Imre Kis <imre.kis@arm.com>
---
 ...-FWU-IPC-framework-for-Corstone-1000.patch | 436 ++++++++++++++++++
 ...mage-state-in-PSA-FWU-M-update-agent.patch | 188 ++++++++
 ...fine-PSA-FWU-image-mapping-structure.patch | 128 +++++
 ...C-psa_fwu_install-return-value-check.patch |  31 ++
 .../0022-fwu-Add-EFI-ESRT-v1-support.patch    | 178 +++++++
 ...orm-corstone1000-Enable-ESRT-support.patch | 129 ++++++
 ...orstone1000-Add-event-provider-proxy.patch | 268 +++++++++++
 ...ne1000-Define-GUID-for-each-payloads.patch | 141 ++++++
 .../trusted-services/ts-arm-platforms.inc     |   8 +
 9 files changed, 1507 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0018-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0019-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0020-Corstone1000-Define-PSA-FWU-image-mapping-structure.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0021-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0022-fwu-Add-EFI-ESRT-v1-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0023-platform-corstone1000-Enable-ESRT-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0024-platform-corstone1000-Add-event-provider-proxy.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0025-platform-corstone1000-Define-GUID-for-each-payloads.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0018-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch b/meta-arm-b=
sp/recipes-security/trusted-services/corstone1000/0018-Integrate-PSA-FWU-=
IPC-framework-for-Corstone-1000.patch
new file mode 100644
index 00000000..2c2bb428
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-In=
tegrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch
@@ -0,0 +1,436 @@
+From fcc7701baf4246e5ceebe4d50db223cb70a0c00f Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 28 Nov 2024 12:02:28 +0000
+Subject: [PATCH 1/8] Integrate PSA FWU IPC framework for Corstone-1000
+
+Integrate IPC framework for PSA FWU calls between Cortex-A side and Cort=
ex-M subsystems.
+
+IPC framework is required to bridge the PSA FWU calls for the platforms =
which have
+both Cortex-A and Cortex-M subsystems. Corstone-1000 falls under this ca=
tegory of
+platforms. In these platforms, the PSA FWU client and PSA FWU provider e=
xist on
+Cortex-A and all the PSA FWU services are implemented on Cortex-M side. =
This IPC
+framework forwards the PSA FWU calls from Cortex-A to Cortex-M subsystem=
.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/33826]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ components/service/common/include/psa/sid.h   |   6 +-
+ .../interface/psa_ipc/component.cmake         |  13 +
+ .../psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c | 253 ++++++++++++++++++
+ .../psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h |  49 ++++
+ .../se-proxy/infra/corstone1000/infra.cmake   |   2 +-
+ .../corstone1000/service_proxy_factory.c      |  16 ++
+ 6 files changed, 337 insertions(+), 2 deletions(-)
+ create mode 100644 components/service/fwu/psa_fwu_m/interface/psa_ipc/c=
omponent.cmake
+ create mode 100644 components/service/fwu/psa_fwu_m/interface/psa_ipc/p=
sa_fwu_ipc.c
+ create mode 100644 components/service/fwu/psa_fwu_m/interface/psa_ipc/p=
sa_fwu_ipc.h
+
+diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
+index fc3a4fb0..4830f438 100644
+--- a/components/service/common/include/psa/sid.h
++++ b/components/service/common/include/psa/sid.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2019-2023, Arm Limited. All rights reserved.
++ * Copyright (c) 2019-2024, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -65,6 +65,10 @@ extern "C" {
+ #define TFM_ATTEST_GET_TOKEN_SIZE  1002
+=20
+ /******** TFM_SP_FWU ********/
++#define TFM_FIRMWARE_UPDATE_SERVICE_SID                            (0x0=
00000A0U)
++#define TFM_FIRMWARE_UPDATE_SERVICE_VERSION                        (1U)
++#define TFM_FIRMWARE_UPDATE_SERVICE_HANDLE                         (0x4=
0000104U)
++
+ #define TFM_FWU_WRITE_SID                                          (0x0=
00000A0U)
+ #define TFM_FWU_WRITE_VERSION                                      (1U)
+ #define TFM_FWU_INSTALL_SID                                        (0x0=
00000A1U)
+diff --git a/components/service/fwu/psa_fwu_m/interface/psa_ipc/componen=
t.cmake b/components/service/fwu/psa_fwu_m/interface/psa_ipc/component.cm=
ake
+new file mode 100644
+index 00000000..cdc653a6
+--- /dev/null
++++ b/components/service/fwu/psa_fwu_m/interface/psa_ipc/component.cmake
+@@ -0,0 +1,13 @@
++#----------------------------------------------------------------------=
---------
++# Copyright (c) 2024, Arm Limited and Contributors. All rights reserved=
.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++if (NOT DEFINED TGT)
++	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
++endif()
++
++target_sources(${TGT} PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/psa_fwu_ipc.c"
++)
+diff --git a/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_=
ipc.c b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c
+new file mode 100644
+index 00000000..a47ae539
+--- /dev/null
++++ b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c
+@@ -0,0 +1,253 @@
++/*
++ * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <stddef.h>
++#include <string.h>
++#include <trace.h>
++
++#include <protocols/rpc/common/packed-c/status.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include "service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h"
++#include "service/fwu/psa_fwu_m/interface/tfm_fwu_defs.h"
++#include "service/fwu/psa_fwu_m/interface/update.h"
++
++/**
++ * @brief      The singleton psa_fwu_ipc instance
++ *
++ * The psa attestation C API assumes a single backend service provider.
++ */
++static struct service_client instance;
++
++psa_status_t psa_fwu_ipc_init(struct rpc_caller_session *session)
++{
++	return service_client_init(&instance, session);
++}
++
++void psa_fwu_ipc_deinit(void)
++{
++	service_client_deinit(&instance);
++}
++
++int psa_fwu_rpc_status(void)
++{
++	return instance.rpc_status;
++}
++
++psa_status_t psa_fwu_query(psa_fwu_component_t component,
++			   psa_fwu_component_info_t *info)
++{
++	if (!instance.session)
++		return PSA_ERROR_BAD_STATE;
++	if (!info)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller_interface *caller =3D instance.session->caller;
++	struct psa_invec in_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
++	};
++	struct psa_outvec out_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(info), .len =3D sizeof(*info) },
++	};
++
++	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
++			  TFM_FWU_QUERY, in_vec, IOVEC_LEN(in_vec),
++			  out_vec, IOVEC_LEN(out_vec));
++	if (status !=3D PSA_SUCCESS)
++		EMSG("failed to psa_call: %d", status);
++
++	return status;
++}
++
++psa_status_t psa_fwu_start(psa_fwu_component_t component,
++			   const void *manifest,
++			   size_t manifest_size)
++{
++	if(manifest_size > UINT32_MAX)
++		return PSA_ERROR_INVALID_ARGUMENT;
++	if (!instance.session)
++		return PSA_ERROR_BAD_STATE;
++
++	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller_interface *caller =3D instance.session->caller;
++	struct psa_invec in_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
++		{ .base =3D psa_ptr_const_to_u32(manifest), .len =3D manifest_size },
++	};
++
++	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
++			  TFM_FWU_START, in_vec, IOVEC_LEN(in_vec),
++			  NULL, 0);
++	if (status !=3D PSA_SUCCESS)
++		EMSG("failed to psa_call: %d", status);
++
++	return status;
++}
++
++psa_status_t psa_fwu_write(psa_fwu_component_t component,
++			   size_t image_offset,
++			   const void *block,
++			   size_t block_size)
++{
++	if (!instance.session)
++		return PSA_ERROR_BAD_STATE;
++	if (!block || !block_size)
++		return PSA_ERROR_INVALID_ARGUMENT;
++	if((image_offset > UINT32_MAX) || (block_size > UINT32_MAX))
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller_interface *caller =3D instance.session->caller;
++	struct psa_invec in_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
++		{ .base =3D psa_ptr_to_u32(&image_offset), .len =3D sizeof(uint32_t) =
},
++		{ .base =3D psa_ptr_const_to_u32(block), .len =3D block_size },
++	};
++
++	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
++			  TFM_FWU_WRITE, in_vec, IOVEC_LEN(in_vec),
++			  NULL, 0);
++	if (status !=3D PSA_SUCCESS)
++		EMSG("failed to psa_call: %d", status);
++
++	return status;
++}
++
++psa_status_t psa_fwu_finish(psa_fwu_component_t component)
++{
++	if (!instance.session)
++		return PSA_ERROR_BAD_STATE;
++
++	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller_interface *caller =3D instance.session->caller;
++	struct psa_invec in_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
++	};
++
++	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
++			  TFM_FWU_FINISH, in_vec, IOVEC_LEN(in_vec),
++			  NULL, 0);
++	if (status !=3D PSA_SUCCESS)
++		EMSG("failed to psa_call: %d", status);
++
++	return status;
++}
++
++psa_status_t psa_fwu_cancel(psa_fwu_component_t component)
++{
++	if (!instance.session)
++		return PSA_ERROR_BAD_STATE;
++
++	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller_interface *caller =3D instance.session->caller;
++	struct psa_invec in_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
++	};
++
++	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
++			  TFM_FWU_CANCEL, in_vec, IOVEC_LEN(in_vec),
++			  NULL, 0);
++	if (status !=3D PSA_SUCCESS)
++		EMSG("failed to psa_call: %d", status);
++
++	return status;
++}
++
++psa_status_t psa_fwu_clean(psa_fwu_component_t component)
++{
++	if (!instance.session)
++		return PSA_ERROR_BAD_STATE;
++
++	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller_interface *caller =3D instance.session->caller;
++	struct psa_invec in_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
++	};
++
++	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
++			  TFM_FWU_CLEAN, in_vec, IOVEC_LEN(in_vec),
++			  NULL, 0);
++	if (status !=3D PSA_SUCCESS)
++		EMSG("failed to psa_call: %d", status);
++
++	return status;
++}
++
++psa_status_t psa_fwu_install(void)
++{
++	if (!instance.session)
++		return PSA_ERROR_BAD_STATE;
++
++	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller_interface *caller =3D instance.session->caller;
++	struct psa_invec in_vec[] =3D {};
++
++	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
++			  TFM_FWU_INSTALL, in_vec, 0,
++			  NULL, 0);
++	if (status !=3D PSA_SUCCESS)
++		EMSG("failed to psa_call: %d", status);
++
++	return status;
++}
++
++psa_status_t psa_fwu_request_reboot(void)
++{
++	if (!instance.session)
++		return PSA_ERROR_BAD_STATE;
++
++	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller_interface *caller =3D instance.session->caller;
++	struct psa_invec in_vec[] =3D {};
++
++	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
++			  TFM_FWU_REQUEST_REBOOT, in_vec, 0,
++			  NULL, 0);
++	if (status !=3D PSA_SUCCESS)
++		EMSG("failed to psa_call: %d", status);
++
++	return status;
++}
++
++psa_status_t psa_fwu_reject(psa_status_t error)
++{
++	if (!instance.session)
++		return PSA_ERROR_BAD_STATE;
++
++	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller_interface *caller =3D instance.session->caller;
++	struct psa_invec in_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(&error), .len =3D sizeof(error) },
++	};
++
++	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
++			  TFM_FWU_REJECT, in_vec, IOVEC_LEN(in_vec),
++			  NULL, 0);
++	if (status !=3D PSA_SUCCESS)
++		EMSG("failed to psa_call: %d", status);
++
++	return status;
++}
++
++psa_status_t psa_fwu_accept(void)
++{
++	if (!instance.session)
++		return PSA_ERROR_BAD_STATE;
++
++	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller_interface *caller =3D instance.session->caller;
++	struct psa_invec in_vec[] =3D {};
++
++	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
++			  TFM_FWU_ACCEPT, in_vec, 0,
++			  NULL, 0);
++	if (status !=3D PSA_SUCCESS)
++		EMSG("failed to psa_call: %d", status);
++
++	return status;
++}
+diff --git a/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_=
ipc.h b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h
+new file mode 100644
+index 00000000..867a1c9c
+--- /dev/null
++++ b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h
+@@ -0,0 +1,49 @@
++/*
++ * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_FWU_IPC_H
++#define PSA_FWU_IPC_H
++
++#include <psa/error.h>
++#include "rpc_caller_session.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * @brief      Initialize a PSA FWU ipc client
++ *
++ * A PSA FWU ipc client makes RPC calls to a remote FWU service.
++ *
++ * @param[in]  rpc_caller RPC caller instance
++ *
++ * @return     A status indicating the success/failure of the operation
++ */
++psa_status_t psa_fwu_ipc_init(struct rpc_caller_session *session);
++
++/**
++ * @brief      Deinitialize a PSA FWU ipc client
++ *
++ */
++void psa_fwu_ipc_deinit(void);
++
++/**
++ * @brief      Return the most recent RPC status
++ *
++ * May be used to obtain information about an RPC error that resulted
++ * in an API operation failure
++ *
++ * @return     Most recent RPC operation status
++ */
++int psa_fwu_rpc_status(void);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_FWU_IPC_H */
++
+diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
+index 27af8a33..0b04149a 100644
+--- a/deployments/se-proxy/infra/corstone1000/infra.cmake
++++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
+@@ -26,7 +26,7 @@ add_components(TARGET "se-proxy"
+ 		"components/service/fwu/provider"
+ 		"components/service/fwu/provider/serializer"
+ 		"components/service/fwu/psa_fwu_m/agent"
+-		"components/service/fwu/psa_fwu_m/interface/stub"
++		"components/service/fwu/psa_fwu_m/interface/psa_ipc"
+ 		"components/service/capsule_update/provider"
+ 		"components/service/secure_storage/backend/secure_storage_ipc"
+ )
+diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+index 8872abcb..ef91efe0 100644
+--- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
++++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+@@ -15,6 +15,7 @@
+ #include <service/crypto/factory/crypto_provider_factory.h>
+ #include "service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h"
+ #include "service/fwu/provider/fwu_provider.h"
++#include "service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h"
+ #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
+ #include "service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_uuid.h"
+ #include <trace.h>
+@@ -135,10 +136,25 @@ struct rpc_service_interface *its_proxy_create(voi=
d)
+=20
+ struct rpc_service_interface *fwu_proxy_create(void)
+ {
++	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
+ 	static struct update_agent *agent;
+ 	static struct fwu_provider fwu_provider =3D { 0 };
+=20
++	/* Static objects for proxy instance */
++	static struct rpc_caller_interface rss_comms =3D { 0 };
++	static struct rpc_caller_session rpc_session =3D { 0 };
++
++	rpc_status =3D rss_comms_caller_init(&rss_comms);
++	if (rpc_status !=3D RPC_SUCCESS)
++		return NULL;
++
++	rpc_status =3D rpc_caller_session_open(&rpc_session, &rss_comms, &dumm=
y_uuid, 0, 0);
++	if (rpc_status !=3D RPC_SUCCESS)
++		return NULL;
++
+ 	agent =3D psa_fwu_m_update_agent_init(NULL, 0, 4096);
++	if (psa_fwu_ipc_init(&rpc_session) !=3D PSA_SUCCESS)
++		return NULL;
+=20
+ 	return fwu_provider_init(&fwu_provider, agent);
+ }
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0019-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0019-Load-initial-imag=
e-state-in-PSA-FWU-M-update-agent.patch
new file mode 100644
index 00000000..2f43369f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-Lo=
ad-initial-image-state-in-PSA-FWU-M-update-agent.patch
@@ -0,0 +1,188 @@
+From 6fb3bead9e0eea3640ad1209347691c2b40512a2 Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Wed, 5 Feb 2025 14:27:45 +0100
+Subject: [PATCH 2/8] Load initial image state in PSA FWU M update agent
+
+Set initial image state based on the image state returned by
+psa_fwu_query. This way the update agent has the correct view of images
+after reboot and it can accept or reject them.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/35155]
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: I150e4fdb4584c8d07f5f1f642ee88197f9cff49b
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../psa_fwu_m/agent/psa_fwu_m_update_agent.c  | 23 +++++++--
+ .../test/test_psa_fwu_m_update_agent.cpp      | 49 ++++++++++++++++++-
+ docs/services/fwu/psa-fwu-m.rst               | 14 +++++-
+ 3 files changed, 80 insertions(+), 6 deletions(-)
+
+diff --git a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_age=
nt.c b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
+index 6de9ba71..48b86f6e 100644
+--- a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
++++ b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2024, Arm Limited. All rights reserved.
++ * Copyright (c) 2024-2025, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -609,8 +609,11 @@ struct update_agent *psa_fwu_m_update_agent_init(
+ 	const struct psa_fwu_m_image_mapping image_mapping[], size_t image_cou=
nt,
+ 	uint32_t max_payload_size)
+ {
++	psa_status_t psa_status =3D PSA_ERROR_GENERIC_ERROR;
+ 	struct psa_fwu_m_update_agent *context =3D NULL;
++	struct psa_fwu_component_info_t info =3D { 0 };
+ 	struct psa_fwu_m_image *images =3D NULL;
++	enum psa_fwu_m_state state =3D regular;
+ 	struct update_agent *agent =3D NULL;
+ 	size_t i =3D 0;
+=20
+@@ -637,9 +640,23 @@ struct update_agent *psa_fwu_m_update_agent_init(
+ 	}
+=20
+ 	for (i =3D 0; i < image_count; i++) {
++		psa_status =3D psa_fwu_query(image_mapping[i].component, &info);
++		if (psa_status !=3D PSA_SUCCESS) {
++			free(images);
++			free(context);
++			free(agent);
++			return NULL;
++		}
++
+ 		images[i].uuid =3D image_mapping[i].uuid;
+ 		images[i].component =3D image_mapping[i].component;
+-		images[i].selected_for_staging =3D false;
++		if (info.state =3D=3D PSA_FWU_TRIAL) {
++			images[i].selected_for_staging =3D true;
++			state =3D trial;
++		} else {
++			images[i].selected_for_staging =3D false;
++		}
++
+ 		images[i].read =3D NULL; /* Cannot read images */
+ 		images[i].write =3D image_write;
+ 	}
+@@ -654,7 +671,7 @@ struct update_agent *psa_fwu_m_update_agent_init(
+ 	context->images =3D images;
+ 	context->image_count =3D image_count + 1;
+ 	context->max_payload_size =3D max_payload_size;
+-	context->state =3D regular;
++	context->state =3D state;
+=20
+ 	agent->context =3D context;
+ 	agent->interface =3D &interface;
+diff --git a/components/service/fwu/psa_fwu_m/agent/test/test_psa_fwu_m_=
update_agent.cpp b/components/service/fwu/psa_fwu_m/agent/test/test_psa_f=
wu_m_update_agent.cpp
+index de289fff..3805d182 100644
+--- a/components/service/fwu/psa_fwu_m/agent/test/test_psa_fwu_m_update_=
agent.cpp
++++ b/components/service/fwu/psa_fwu_m/agent/test/test_psa_fwu_m_update_=
agent.cpp
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2024, Arm Limited. All rights reserved.
++ * Copyright (c) 2024-2025, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -14,6 +14,9 @@
+=20
+ TEST_GROUP(psa_fwu_m_update_agent) {
+ 	TEST_SETUP() {
++		psa_fwu_component_info_t info =3D {0};
++		expect_mock_psa_fwu_query(mapping[0].component, &info, PSA_SUCCESS);
++		expect_mock_psa_fwu_query(mapping[1].component, &info, PSA_SUCCESS);
+ 		agent =3D psa_fwu_m_update_agent_init(mapping, 2, 4096);
+ 		handle =3D 0;
+ 		progress =3D 0;
+@@ -667,4 +670,46 @@ TEST(psa_fwu_m_update_agent, select_previous)
+=20
+ 	expect_mock_psa_fwu_reject(0, PSA_SUCCESS);
+ 	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_select_previous(agent));
+-}
+\ No newline at end of file
++}
++
++TEST(psa_fwu_m_update_agent, boot_in_trial_mode_query_fail) {
++	psa_fwu_component_info_t info =3D {0};
++
++	expect_mock_psa_fwu_query(mapping[0].component, &info, PSA_ERROR_GENER=
IC_ERROR);
++	POINTERS_EQUAL(NULL, psa_fwu_m_update_agent_init(mapping, 2, 4096));
++}
++
++TEST(psa_fwu_m_update_agent, boot_in_trial_mode_select_previous) {
++	psa_fwu_component_info_t info0 =3D {0};
++	psa_fwu_component_info_t info1 =3D {0};
++
++	info1.state =3D PSA_FWU_TRIAL;
++
++	expect_mock_psa_fwu_query(mapping[0].component, &info0, PSA_SUCCESS);
++	expect_mock_psa_fwu_query(mapping[1].component, &info1, PSA_SUCCESS);
++
++	update_agent *agent =3D psa_fwu_m_update_agent_init(mapping, 2, 4096);
++
++	expect_mock_psa_fwu_reject(0, PSA_SUCCESS);
++	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_select_previous(agent));
++
++	psa_fwu_m_update_agent_deinit(agent);
++}
++
++TEST(psa_fwu_m_update_agent, boot_in_trial_mode_accept) {
++	psa_fwu_component_info_t info0 =3D {0};
++	psa_fwu_component_info_t info1 =3D {0};
++
++	info1.state =3D PSA_FWU_TRIAL;
++
++	expect_mock_psa_fwu_query(mapping[0].component, &info0, PSA_SUCCESS);
++	expect_mock_psa_fwu_query(mapping[1].component, &info1, PSA_SUCCESS);
++
++	update_agent *agent =3D psa_fwu_m_update_agent_init(mapping, 2, 4096);
++
++	expect_mock_psa_fwu_accept(PSA_SUCCESS);
++	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_accept_image(agent, &mappi=
ng[0].uuid));
++	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing[1].uuid));
++
++	psa_fwu_m_update_agent_deinit(agent);
++}
+diff --git a/docs/services/fwu/psa-fwu-m.rst b/docs/services/fwu/psa-fwu=
-m.rst
+index 26ffed09..1358015f 100644
+--- a/docs/services/fwu/psa-fwu-m.rst
++++ b/docs/services/fwu/psa-fwu-m.rst
+@@ -44,6 +44,11 @@ The solutions to these differences:
+ * Convert the image query result returned by FWU-M to FWU-A format. The=
re are similar field, but this imposes some
+   limitations.
+=20
++Initialization
++```````````````
++
++The initial image and agent state is determined based on the image stat=
e returned by ``psa_fwu_query()``.
++
+=20
+ ``fwu_discover()``
+ ``````````````````
+@@ -71,6 +76,10 @@ agent switches to trial state, so the client can vali=
date the new set of images
+=20
+ On calling ``fwu_end_staging()`` the agent calls ``psa_fwu_finish()`` o=
n each selected image, then calls
+ ``psa_fwu_install()``. If all images have been accepted (see ``fwu_comm=
it()``) it also calls ``psa_fwu_accept()``.
++The implementation treats ``PSA_SUCCESS_REBOOT`` and ``PSA_SUCCESS_REST=
ART`` status values as error. In an A+M system the M
++class side shouldn't restart the system, so calling ``psa_fwu_request_r=
eboot()`` does not fit the system. There's also no
++PSA FWU A return code for inidicating the restart request to the normal=
 world. If the normal world has to restart the
++system after ending the staging phase, it has to do it in an implementa=
tion defined way.
+=20
+ .. uml:: ../uml/psa_fwu_m_update_agent/fwu_end_staging.puml
+=20
+@@ -136,7 +145,10 @@ calls ``psa_fwu_accept()`` when all images have bee=
n accepted. This results in a
+ `````````````````````````
+=20
+ Selects previous working state (i.e. rejects the firmware update) and t=
ransitions back to regular state after calling
+-``psa_fwu_reject()``.
++``psa_fwu_reject()``. The implementation treats ``PSA_SUCCESS_REBOOT`` =
and ``PSA_SUCCESS_RESTART`` status values as error.
++In an A+M system the M class side shouldn't restart the system, so call=
ing ``psa_fwu_request_reboot()`` does not fit the
++system. There's also no PSA FWU A return code for inidicating the resta=
rt request to the normal world. If the normal
++world has to restart the system when rejecting the installed firmware, =
it has to do it in an implementation defined way.
+=20
+ .. uml:: ../uml/psa_fwu_m_update_agent/fwu_select_previous.puml
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0020-Corstone1000-Define-PSA-FWU-image-mapping-structure.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0020-Corstone1000-Def=
ine-PSA-FWU-image-mapping-structure.patch
new file mode 100644
index 00000000..17b1f87e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0020-Co=
rstone1000-Define-PSA-FWU-image-mapping-structure.patch
@@ -0,0 +1,128 @@
+From 5344d7d0580ca7f2f2569f388dd6e3cd17a372f2 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 6 Feb 2025 10:26:04 +0000
+Subject: [PATCH 3/8] Corstone1000: Define PSA FWU image mapping structur=
e
+
+This commit involves following changes
+
+1. Define PSA FWU image mapping structure for Corstone-1000.
+This structure is responsible to map specific image guid with
+component number.
+To enable platform-specific handling, service_proxy_factory.c now
+conditionally selects the appropriate image mapping
+based on PLATFORM_IS_FVP. This ensures that both FVP and MPS3
+platforms use the correct GUID and firmware update configuration.
+
+2. Rename RSS to RSE
+
+Upstream-Status: Pending
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+---
+ .../infra/corstone1000/corstone1000_config.h  | 28 +++++++++++++++++++
+ .../corstone1000/service_proxy_factory.c      | 25 +++++++++++++----
+ 2 files changed, 48 insertions(+), 5 deletions(-)
+ create mode 100644 deployments/se-proxy/infra/corstone1000/corstone1000=
_config.h
+
+diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_config=
.h b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
+new file mode 100644
+index 00000000..319401f3
+--- /dev/null
++++ b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
+@@ -0,0 +1,28 @@
++/*
++ * Copyright (c) 2025, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef CORSTONE1000_CONFIG_H
++#define CORSTONE1000_CONFIG_H
++
++#define FWU_IMAGE_COUNT 1
++
++/* Maximum payload size to be transferred at once to Secure Enclave */
++#define MAX_PAYLOAD_SIZE 4096
++
++#define CORSTONE1000_FVP_FULL_CAPSULE_UUID  \
++{ 0x4e, 0x3a, 0x9f, 0x98, 0xe0, 0x46, 0xd0, 0x4c, 0x98, 0x77, 0xa2, 0x5=
c, 0x70, 0xc0, 0x13, 0x29, }
++
++#define CORSTONE1000_MPS3_FULL_CAPSULE_UUID  \
++{ 0xd1, 0x65, 0x18, 0xdf, 0xfb, 0x90, 0x59, 0x4d, 0x9c, 0x38, 0xc9, 0xf=
2, 0xc1, 0xbb, 0xa8, 0xcc, }
++
++/* Image indexes in the UEFI capsule */
++enum fwu_image_index
++{
++	FWU_IMAGE_INDEX_FULL_CAPSULE =3D 1,
++};
++
++#endif /* CORSTONE1000_CONFIG_H */
+diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+index ef91efe0..6e5f1221 100644
+--- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
++++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021-2024, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2021-2025, Arm Limited and Contributors. All rights re=
served.
+  * Copyright (c) 2021-2023, Linaro Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+@@ -19,6 +19,7 @@
+ #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
+ #include "service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_uuid.h"
+ #include <trace.h>
++#include "corstone1000_config.h"
+=20
+ /* backends */
+ #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
+@@ -27,6 +28,20 @@
+=20
+ static const struct rpc_uuid dummy_uuid =3D { 0 };
+=20
++static const struct psa_fwu_m_image_mapping img_mapping[FWU_IMAGE_COUNT=
] =3D {
++#if PLATFORM_IS_FVP
++	{
++		.uuid =3D CORSTONE1000_FVP_FULL_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_FULL_CAPSULE
++	},
++#else
++	{
++		.uuid =3D CORSTONE1000_MPS3_FULL_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_FULL_CAPSULE
++	},
++#endif
++};
++
+ struct rpc_service_interface *attest_proxy_create(void)
+ {
+ 	struct rpc_service_interface *attest_iface =3D NULL;
+@@ -141,20 +156,20 @@ struct rpc_service_interface *fwu_proxy_create(voi=
d)
+ 	static struct fwu_provider fwu_provider =3D { 0 };
+=20
+ 	/* Static objects for proxy instance */
+-	static struct rpc_caller_interface rss_comms =3D { 0 };
++	static struct rpc_caller_interface rse_comms =3D { 0 };
+ 	static struct rpc_caller_session rpc_session =3D { 0 };
+=20
+-	rpc_status =3D rss_comms_caller_init(&rss_comms);
++	rpc_status =3D rse_comms_caller_init(&rse_comms);
+ 	if (rpc_status !=3D RPC_SUCCESS)
+ 		return NULL;
+=20
+-	rpc_status =3D rpc_caller_session_open(&rpc_session, &rss_comms, &dumm=
y_uuid, 0, 0);
++	rpc_status =3D rpc_caller_session_open(&rpc_session, &rse_comms, &dumm=
y_uuid, 0, 0);
+ 	if (rpc_status !=3D RPC_SUCCESS)
+ 		return NULL;
+=20
+-	agent =3D psa_fwu_m_update_agent_init(NULL, 0, 4096);
+ 	if (psa_fwu_ipc_init(&rpc_session) !=3D PSA_SUCCESS)
+ 		return NULL;
++	agent =3D psa_fwu_m_update_agent_init(img_mapping, FWU_IMAGE_COUNT, MA=
X_PAYLOAD_SIZE);
+=20
+ 	return fwu_provider_init(&fwu_provider, agent);
+ }
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0021-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0021-Fix-PSA-FWU-IPC-p=
sa_fwu_install-return-value-check.patch
new file mode 100644
index 00000000..da948bd0
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-Fi=
x-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch
@@ -0,0 +1,31 @@
+From d43ec82f7e419e6f1e9f5bd002c324b788ee901f Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 6 Feb 2025 11:32:04 +0000
+Subject: [PATCH 4/8] Fix PSA FWU IPC psa_fwu_install() return value chec=
k
+
+This change adds support to validate if the return type in psa_fwu_insta=
ll()
+is either PSA_SUCCESS or PSA_SUCCESS_REBOOT. Both the return values are =
expected.
+Earlier, only PSA_SUCCESS is validated.
+
+Upstream-Status: Pending
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c       | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_=
ipc.c b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c
+index a47ae539..3947a809 100644
+--- a/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c
++++ b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c
+@@ -190,7 +190,7 @@ psa_status_t psa_fwu_install(void)
+ 	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
+ 			  TFM_FWU_INSTALL, in_vec, 0,
+ 			  NULL, 0);
+-	if (status !=3D PSA_SUCCESS)
++	if (status !=3D PSA_SUCCESS && status !=3D PSA_SUCCESS_REBOOT)
+ 		EMSG("failed to psa_call: %d", status);
+=20
+ 	return status;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0022-fwu-Add-EFI-ESRT-v1-support.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/corstone1000/0022-fwu-Add-EFI-ESRT-v1-support.patch
new file mode 100644
index 00000000..ce810a35
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0022-fw=
u-Add-EFI-ESRT-v1-support.patch
@@ -0,0 +1,178 @@
+From 740359ba2a73f5ce0015c9023cc1aa69506f99bf Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Fri, 28 Feb 2025 21:12:25 +0000
+Subject: [PATCH 5/8] fwu: Add EFI ESRT v1 support
+
+Add EFI ESRT v1 support for PSA FWU M agent.
+ESRT functionality is implemented using unique image dedicated
+for ESRT data having its own UUID. In PSA FWU M agent's context,
+this image has read only attributes. The ESRT data can be read
+using image_read_directory by using ESRT image UUID handle. The
+ESRT data is queried from Secure Enclave using psa_fwu_query()
+and ESRT data can be read from psa_fwu_impl_info_t structure
+object defined in psa_fwu_component_info_t.
+
+This commit includes the following changes:
+1. Declare EFI ESRT v1 data structures.
+2. Modify image_directory_read() to include EFI ESRT data read support
+3. Modify psa_fwu_m_update_agent_init to initialize ESRT image
+attributes
+
+The ESRT v1 details can be found here :
+https://uefi.org/specs/UEFI/2.9_A/23_Firmware_Update_and_Reporting.html#=
efi-system-resource-table
+
+Upstream-Status: Pending
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../psa_fwu_m/agent/psa_fwu_m_update_agent.c  | 50 +++++++++++++++++--
+ protocols/service/fwu/fwu_proto.h             | 29 +++++++++--
+ 2 files changed, 71 insertions(+), 8 deletions(-)
+
+diff --git a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_age=
nt.c b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
+index 48b86f6e..d0464bf5 100644
+--- a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
++++ b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
+@@ -115,13 +115,22 @@ uint32_t image_version_to_uint(psa_fwu_image_versi=
on_t version)
+ 	return result;
+ }
+=20
++/* image_directory_read
++ * This function is used for two purposes:
++ * -> Send the details of firmware images to update client when read re=
quest is made for FWU_DIRECTORY_CANONICAL_UUID
++ * -> Send ESRT data to update client when read request is made for EFI=
_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID
++ */
+ int image_directory_read(struct psa_fwu_m_update_agent *agent, struct p=
sa_fwu_m_image *image,
+ 			 uint8_t *buf, size_t buf_size, size_t *read_len, size_t *total_len)
+ {
+ 	psa_status_t psa_status =3D PSA_ERROR_GENERIC_ERROR;
+ 	psa_fwu_component_info_t component_info =3D { 0 };
+ 	struct fwu_image_directory *directory =3D NULL;
+-	size_t image_count =3D agent->image_count - 1; /* Do not return Image =
directory */
++	uint8_t esrt_image_uuid[OSF_UUID_OCTET_LEN];
++	size_t image_count =3D agent->image_count - 1; /* Do not return Image =
directory
++						      * If update client uses ESRT UUID for ESRT data, then ESRT =
image UUID
++						      * is considered as a separate image included in this count
++						      */
+ 	size_t image_info_size =3D 0;
+ 	size_t i =3D 0;
+=20
+@@ -136,12 +145,36 @@ int image_directory_read(struct psa_fwu_m_update_a=
gent *agent, struct psa_fwu_m_
+ 		return FWU_STATUS_DENIED; /* LCOV_EXCL_LINE */
+=20
+ 	/*
+-	 * If the directory structure doesn't fit into the buffer return SUCCE=
SS with total_len set
++	 * If the data to be read doesn't fit into the buffer return SUCCESS w=
ith total_len set
+ 	 * and read_len =3D 0.
+ 	 */
+ 	if (*total_len > buf_size)
+ 		return FWU_STATUS_SUCCESS;
+=20
++	/* Query ESRT data from Secure Enclave and Copy the ESRT entries from =
component_info.impl.candidate_digest
++	 * to buf in case of ESRT image UUID.
++	 * This is needed because Secure Enclave fills component_info.impl.can=
didate_digest with ESRT data
++	 * which needs to be transferred to normal world buffer
++	 */
++	uuid_octets_from_canonical((struct uuid_octets *)&esrt_image_uuid, EFI=
_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID);
++	if (!memcmp(&esrt_image_uuid, &image->uuid, sizeof(esrt_image_uuid))) =
{
++		/* Query ESRT data */
++		psa_status =3D psa_fwu_query(image->component, &component_info);
++		if (psa_status !=3D PSA_SUCCESS)
++			return psa_status_to_fwu_status(psa_status);
++
++		struct efi_system_resource_table *esrt =3D (struct efi_system_resourc=
e_table *)component_info.impl.candidate_digest;
++		size_t esrt_size_recv =3D (esrt->fw_resource_count * sizeof(struct ef=
i_system_resource_entry) ) + sizeof(struct efi_system_resource_table);
++		if(esrt_size_recv > TFM_FWU_MAX_DIGEST_SIZE)
++			return FWU_STATUS_OUT_OF_BOUNDS;
++
++		/* Copy the ESRT entries to the buf */
++		memcpy(buf, &component_info.impl.candidate_digest, esrt_size_recv);
++		*total_len =3D esrt_size_recv;
++		*read_len =3D *total_len;
++		return FWU_STATUS_SUCCESS;
++	}
++
+ 	directory =3D (struct fwu_image_directory *)buf;
+ 	directory->directory_version =3D FWU_IMAGE_DIRECTORY_VERSION;
+ 	directory->img_info_offset =3D offsetof(struct fwu_image_directory, im=
g_info_entry);
+@@ -615,6 +648,7 @@ struct update_agent *psa_fwu_m_update_agent_init(
+ 	struct psa_fwu_m_image *images =3D NULL;
+ 	enum psa_fwu_m_state state =3D regular;
+ 	struct update_agent *agent =3D NULL;
++	uint8_t esrt_image_uuid[OSF_UUID_OCTET_LEN];
+ 	size_t i =3D 0;
+=20
+ 	/* Allocate +1 image for the Image directory */
+@@ -657,8 +691,16 @@ struct update_agent *psa_fwu_m_update_agent_init(
+ 			images[i].selected_for_staging =3D false;
+ 		}
+=20
+-		images[i].read =3D NULL; /* Cannot read images */
+-		images[i].write =3D image_write;
++		uuid_octets_from_canonical((struct uuid_octets *)&esrt_image_uuid, EF=
I_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID);
++		if (!memcmp(&esrt_image_uuid, &images[i].uuid, sizeof(esrt_image_uuid=
))) {
++			images[i].read =3D image_directory_read;
++			images[i].write =3D NULL;
++			images[i].selected_for_staging =3D false;
++		}
++		else {
++			images[i].read =3D NULL; /* Cannot read images */
++			images[i].write =3D image_write;
++		}
+ 	}
+=20
+ 	/* Insert Image directory as the last image */
+diff --git a/protocols/service/fwu/fwu_proto.h b/protocols/service/fwu/f=
wu_proto.h
+index 4bcacb1f..aa5d2561 100644
+--- a/protocols/service/fwu/fwu_proto.h
++++ b/protocols/service/fwu/fwu_proto.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2022-2024, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2022-2025, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -28,9 +28,10 @@
+ /**
+  * Protocol GUIDs defined in FWU-A specification
+  */
+-#define FWU_UPDATE_AGENT_CANONICAL_UUID "6823a838-1b06-470e-9774-0cce8b=
fb53fd"
+-#define FWU_DIRECTORY_CANONICAL_UUID	"deee58d9-5147-4ad3-a290-77666e234=
1a5"
+-#define FWU_METADATA_CANONICAL_UUID	"8a7a84a0-8387-40f6-ab41-a8b9a5a60d=
23"
++#define FWU_UPDATE_AGENT_CANONICAL_UUID 		"6823a838-1b06-470e-9774-0cce=
8bfb53fd"
++#define FWU_DIRECTORY_CANONICAL_UUID			"deee58d9-5147-4ad3-a290-77666e2=
341a5"
++#define FWU_METADATA_CANONICAL_UUID			"8a7a84a0-8387-40f6-ab41-a8b9a5a6=
0d23"
++#define EFI_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID	"63a222b1-6136-684f-99=
29-78f8b0d62180"
+=20
+ #define FWU_OPEN_OP_TYPE_READ  (0)
+ #define FWU_OPEN_OP_TYPE_WRITE (1)
+@@ -40,6 +41,26 @@
+  */
+ #define FWU_IMAGE_DIRECTORY_VERSION	(2)
+=20
++/**
++ * @brief Information about the ESRT v1.
++ */
++struct __attribute__((__packed__)) efi_system_resource_entry {
++        uint8_t fw_class[OSF_UUID_OCTET_LEN];
++        uint32_t fw_type;
++        uint32_t fw_version;
++        uint32_t lowest_supported_fw_version;
++        uint32_t capsule_flags;
++        uint32_t last_attempt_version;
++        uint32_t last_attempt_status;
++};
++
++struct __attribute__((__packed__)) efi_system_resource_table {
++	uint32_t fw_resource_count;
++	uint32_t fw_resource_count_max;
++	uint64_t fw_resource_version;
++	struct efi_system_resource_entry entries[];
++};
++
+ struct __attribute__((__packed__)) fwu_image_info_entry {
+ 	uint8_t img_type_uuid[OSF_UUID_OCTET_LEN];
+ 	uint32_t client_permissions;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0023-platform-corstone1000-Enable-ESRT-support.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0023-platform-corstone1000-Enab=
le-ESRT-support.patch
new file mode 100644
index 00000000..18581440
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0023-pl=
atform-corstone1000-Enable-ESRT-support.patch
@@ -0,0 +1,129 @@
+From 27d3ce79128478cd163a2db113326c873bda8d08 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Fri, 28 Feb 2025 21:12:56 +0000
+Subject: [PATCH 6/8] platform: corstone1000: Enable ESRT support
+
+Enable ESRT support for Corstone-1000.
+Introduce ESRT image UUID and its component number and
+set TFM_FWU_MAX_DIGEST_SIZE to ESRT data size.
+
+Upstream-Status: Pending
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../infra/corstone1000/corstone1000_config.h  |  3 +--
+ .../corstone1000/service_proxy_factory.c      | 22 +++++++++++++++++--
+ .../providers/arm/corstone1000/platform.cmake |  9 ++++++++
+ 3 files changed, 30 insertions(+), 4 deletions(-)
+
+diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_config=
.h b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
+index 319401f3..4a68c2fa 100644
+--- a/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
++++ b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
+@@ -8,8 +8,6 @@
+ #ifndef CORSTONE1000_CONFIG_H
+ #define CORSTONE1000_CONFIG_H
+=20
+-#define FWU_IMAGE_COUNT 1
+-
+ /* Maximum payload size to be transferred at once to Secure Enclave */
+ #define MAX_PAYLOAD_SIZE 4096
+=20
+@@ -23,6 +21,7 @@
+ enum fwu_image_index
+ {
+ 	FWU_IMAGE_INDEX_FULL_CAPSULE =3D 1,
++	FWU_IMAGE_INDEX_ESRT,
+ };
+=20
+ #endif /* CORSTONE1000_CONFIG_H */
+diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+index 6e5f1221..f0a4853e 100644
+--- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
++++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+@@ -18,6 +18,7 @@
+ #include "service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h"
+ #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
+ #include "service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_uuid.h"
++#include <protocols/service/fwu/fwu_proto.h>
+ #include <trace.h>
+ #include "corstone1000_config.h"
+=20
+@@ -26,9 +27,17 @@
+ #include <service/secure_storage/backend/secure_storage_ipc/secure_stor=
age_ipc.h>
+ #include <service/attestation/client/psa/iat_client.h>
+=20
++/* IMAGE_MAPPING_ELEMENT_COUNT includes the number of images to be upda=
ted and ESRT image */
++#define IMAGE_MAPPING_ELEMENT_COUNT (FWU_IMAGE_CAPSULE_COUNT + 1)
++
++/* The index to access the ESRT image in the psa_fwu_m_image_mapping st=
ructure
++ * collection. The ESRT image is always accessed at the end of the coll=
ection.
++ */
++#define IMAGE_MAPPING_ESRT_INDEX (IMAGE_MAPPING_ELEMENT_COUNT - 1)
++
+ static const struct rpc_uuid dummy_uuid =3D { 0 };
+=20
+-static const struct psa_fwu_m_image_mapping img_mapping[FWU_IMAGE_COUNT=
] =3D {
++static struct psa_fwu_m_image_mapping img_mapping[IMAGE_MAPPING_ELEMENT=
_COUNT] =3D {
+ #if PLATFORM_IS_FVP
+ 	{
+ 		.uuid =3D CORSTONE1000_FVP_FULL_CAPSULE_UUID,
+@@ -42,6 +51,13 @@ static const struct psa_fwu_m_image_mapping img_mappi=
ng[FWU_IMAGE_COUNT] =3D {
+ #endif
+ };
+=20
++/* Every platform needs to define esrt image mapping, if ESRT image UUI=
D is to be used to extract ESRT data */
++static void define_esrt_image_mapping()
++{
++	uuid_octets_from_canonical(&img_mapping[IMAGE_MAPPING_ESRT_INDEX].uuid=
, EFI_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID);
++	img_mapping[IMAGE_MAPPING_ESRT_INDEX].component =3D FWU_IMAGE_INDEX_ES=
RT;
++}
++
+ struct rpc_service_interface *attest_proxy_create(void)
+ {
+ 	struct rpc_service_interface *attest_iface =3D NULL;
+@@ -169,7 +185,9 @@ struct rpc_service_interface *fwu_proxy_create(void)
+=20
+ 	if (psa_fwu_ipc_init(&rpc_session) !=3D PSA_SUCCESS)
+ 		return NULL;
+-	agent =3D psa_fwu_m_update_agent_init(img_mapping, FWU_IMAGE_COUNT, MA=
X_PAYLOAD_SIZE);
++
++	define_esrt_image_mapping();
++	agent =3D psa_fwu_m_update_agent_init(img_mapping, IMAGE_MAPPING_ELEME=
NT_COUNT, MAX_PAYLOAD_SIZE);
+=20
+ 	return fwu_provider_init(&fwu_provider, agent);
+ }
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index 60bc208b..db1e9743 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -6,11 +6,18 @@
+ # Platform definition for the Corstone-1000 platform.
+ #----------------------------------------------------------------------=
---------
+=20
++# For ESRT v1 details : https://uefi.org/specs/UEFI/2.9_A/23_Firmware_U=
pdate_and_Reporting.html#efi-system-resource-table
++set(FWU_IMAGE_CAPSULE_COUNT 4 CACHE STRING "Maximum number of FWU Image=
s in a capsule to be updated")
++set(ESRT_IMAGE_ENTRY_SIZE 40 CACHE STRING "Size of one ESRT v1 Image en=
try structure object")
++set(ESRT_REMAINING_FIELDS_SIZE 16 CACHE STRING "Size of remaining field=
s of ESRT v1 table structure")
++math(EXPR TOTAL_ESRT_SIZE "${FWU_IMAGE_CAPSULE_COUNT} * ${ESRT_IMAGE_EN=
TRY_SIZE} + ${ESRT_REMAINING_FIELDS_SIZE}" OUTPUT_FORMAT DECIMAL)
++
+ set(SMM_GATEWAY_MAX_UEFI_VARIABLES 80 CACHE STRING "Maximum UEFI variab=
le count")
+ set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 4*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
+ set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway SP heap size")
+ set(PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE 0x43C0 CACHE STRING "Size of the RS=
E_COMMS_PAYLOAD buffer")
+ set(COMMS_MHU_MSG_SIZE 0x4500 CACHE STRING "Max message size that can b=
e transfered via MHU")
++set(TFM_FWU_MAX_DIGEST_SIZE ${TOTAL_ESRT_SIZE} CACHE STRING "Maximum si=
ze of ESRT entries of all the images in a bank")
+=20
+ target_compile_definitions(${TGT} PRIVATE
+ 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
+@@ -18,6 +25,8 @@ target_compile_definitions(${TGT} PRIVATE
+  	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
+ 	MBEDTLS_ECP_DP_SECP521R1_ENABLED
+ 	PLATFORM_IS_FVP=3D${PLATFORM_IS_FVP}
++	TFM_FWU_MAX_DIGEST_SIZE=3D${TFM_FWU_MAX_DIGEST_SIZE}
++	FWU_IMAGE_CAPSULE_COUNT=3D${FWU_IMAGE_CAPSULE_COUNT}
+ )
+=20
+ get_property(_platform_driver_dependencies TARGET ${TGT}
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0024-platform-corstone1000-Add-event-provider-proxy.patch b/meta-arm-bsp/=
recipes-security/trusted-services/corstone1000/0024-platform-corstone1000=
-Add-event-provider-proxy.patch
new file mode 100644
index 00000000..8de9f081
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0024-pl=
atform-corstone1000-Add-event-provider-proxy.patch
@@ -0,0 +1,268 @@
+From dde0ca3260ae3b7e7c3390ef03f9f484e9189626 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Tue, 11 Mar 2025 13:33:36 +0000
+Subject: [PATCH 7/8] platform: corstone1000: Add event provider proxy
+
+Normal world needs to send boot confirmation event
+to Secure Enclave and Trusted-Services is responsible
+to transfer the event to Secure Enclave.
+This commit implements the event handling framework in
+SE-proxy-SP and develops event provider proxy which
+forwards the event to Secure Enclave via psa calls.
+This change is introduced for Corstone-1000
+
+Upstream-Status: Pending
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../se-proxy/env/commonsp/se_proxy_sp.c       | 16 +++-
+ .../corstone1000_event_handling.c             | 91 +++++++++++++++++++
+ .../corstone1000_event_handling.h             | 42 +++++++++
+ .../se-proxy/infra/corstone1000/infra.cmake   |  1 +
+ .../corstone1000/service_proxy_factory.c      | 27 ++++++
+ 5 files changed, 175 insertions(+), 2 deletions(-)
+ create mode 100644 deployments/se-proxy/infra/corstone1000/corstone1000=
_event_handling.c
+ create mode 100644 deployments/se-proxy/infra/corstone1000/corstone1000=
_event_handling.h
+
+diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
+index 7da489ca..7d2ade5e 100644
+--- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
++++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: BSD-3-Clause
+ /*
+- * Copyright (c) 2021-2024, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2021-2025, Arm Limited and Contributors. All rights re=
served.
+  */
+=20
+ #include "components/rpc/common/endpoint/rpc_service_interface.h"
+@@ -40,7 +40,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
+ 		goto fatal_error;
+ 	}
+=20
+-	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 7, 16);
++	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 8, 16);
+ 	if (rpc_status !=3D RPC_SUCCESS) {
+ 		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
+ 		goto fatal_error;
+@@ -95,6 +95,18 @@ void __noreturn sp_main(union ffa_boot_info *boot_inf=
o)
+ 		goto fatal_error;
+ 	}
+=20
++	rpc_iface =3D event_handler_proxy_create();
++	if (!rpc_iface) {
++		EMSG("Failed to create Capsule Update proxy");
++		goto fatal_error;
++	}
++
++	rpc_status =3D ts_rpc_endpoint_sp_add_service(&rpc_endpoint, rpc_iface=
);
++	if (rpc_status !=3D RPC_SUCCESS) {
++		EMSG("Failed to add service to RPC endpoint: %d", rpc_status);
++		goto fatal_error;
++	}
++
+ 	rpc_iface =3D capsule_update_proxy_create();
+ 	if (!rpc_iface) {
+ 		EMSG("Failed to create Capsule Update proxy");
+diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_event_=
handling.c b/deployments/se-proxy/infra/corstone1000/corstone1000_event_h=
andling.c
+new file mode 100644
+index 00000000..faf450f2
+--- /dev/null
++++ b/deployments/se-proxy/infra/corstone1000/corstone1000_event_handlin=
g.c
+@@ -0,0 +1,91 @@
++/*
++ * Copyright (c) 2025, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <trace.h>
++
++#include <protocols/rpc/common/packed-c/status.h>
++#include "corstone1000_event_handling.h"
++
++#define BOOT_CONFIRMED_EVENT   (0x3)
++#define OPCODE_BOOT_CONFIRMED  BOOT_CONFIRMED_EVENT
++
++enum corstone1000_ioctl_id {
++	IOCTL_CORSTONE1000_FWU_HOST_ACK =3D 1,
++};
++
++/* Service request handlers */
++static rpc_status_t boot_confirmed_handler(void *context, struct rpc_re=
quest *req);
++
++/* Handler mapping table for service */
++static const struct service_handler handler_table[] =3D {
++	{OPCODE_BOOT_CONFIRMED,			boot_confirmed_handler}
++};
++
++struct rpc_service_interface *corstone1000_event_provider_init(
++	struct event_provider *context)
++{
++	struct rpc_service_interface *rpc_interface =3D NULL;
++	const struct rpc_uuid dummy_uuid =3D { .uuid =3D { 0 }};
++	if (!context)
++		return NULL;
++
++	service_provider_init(
++		&context->base_provider,
++		context,
++		&dummy_uuid,
++		handler_table,
++		sizeof(handler_table)/sizeof(struct service_handler));
++
++	rpc_interface =3D service_provider_get_rpc_interface(&context->base_pr=
ovider);
++
++	return rpc_interface;
++}
++
++static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller_in=
terface *caller)
++{
++	uint32_t ioctl_id;
++	rpc_status_t rpc_status =3D TS_RPC_CALL_ACCEPTED;
++
++	struct psa_invec in_vec[] =3D {
++			{ .base =3D &ioctl_id, .len =3D sizeof(ioctl_id) }
++	};
++
++	if(!caller) {
++		EMSG("event_handler rpc_caller is NULL");
++		rpc_status =3D TS_RPC_ERROR_RESOURCE_FAILURE;
++		return rpc_status;
++	}
++
++	IMSG("event handler opcode %x", opcode);
++	switch(opcode) {
++		case OPCODE_BOOT_CONFIRMED:
++		ioctl_id =3D IOCTL_CORSTONE1000_FWU_HOST_ACK;
++		/* Boot Confirmed event from Normal World  */
++	=09
++		psa_call(caller,TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCT=
L,
++			in_vec,IOVEC_LEN(in_vec), NULL, 0);
++		break;
++		default:
++			EMSG("%s unsupported opcode", __func__);
++			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
++	}
++	return rpc_status;
++
++}
++
++static rpc_status_t boot_confirmed_handler(void *context, struct rpc_re=
quest *req)
++{
++	struct event_provider *this_instance =3D (struct event_provider*)conte=
xt;
++	struct rpc_caller_interface *caller =3D this_instance->client.session-=
>caller;
++	uint32_t opcode =3D req->opcode;
++	rpc_status_t rpc_status;
++
++	rpc_status =3D event_handler(opcode, caller);
++
++	return rpc_status;
++}
+diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_event_=
handling.h b/deployments/se-proxy/infra/corstone1000/corstone1000_event_h=
andling.h
+new file mode 100644
+index 00000000..e8e60dae
+--- /dev/null
++++ b/deployments/se-proxy/infra/corstone1000/corstone1000_event_handlin=
g.h
+@@ -0,0 +1,42 @@
++/*
++ * Copyright (c) 2025, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CORSTONE1000_EVENT_HANDLING_H
++#define CORSTONE1000_EVENT_HANDLING_H
++
++#include <rpc/common/endpoint/rpc_service_interface.h>
++#include <service/common/provider/service_provider.h>
++#include <service/common/client/service_client.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * The event_provider is a service provider that accepts events
++ * and delegates them to a suitable backend.
++ */
++struct event_provider
++{
++	struct service_provider base_provider;
++	struct service_client client;
++};
++
++/**
++ * \brief Initialize an instance of the event handler
++ *
++ * @param[in] context The instance to initialize
++ *
++ * \return An rpc_service_interface or NULL on failure
++ */
++struct rpc_service_interface *corstone1000_event_provider_init(
++	struct event_provider *context);
++
++#ifdef __cplusplus
++} /* extern "C" */
++#endif
++
++#endif /* CORSTONE1000_EVENT_HANDLING_H */
+diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
+index 0b04149a..b95801de 100644
+--- a/deployments/se-proxy/infra/corstone1000/infra.cmake
++++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
+@@ -34,4 +34,5 @@ add_components(TARGET "se-proxy"
+ target_sources(se-proxy PRIVATE
+=20
+ 	${CMAKE_CURRENT_LIST_DIR}/service_proxy_factory.c
++	${CMAKE_CURRENT_LIST_DIR}/corstone1000_event_handling.c
+ )
+diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+index f0a4853e..ed42e2cb 100644
+--- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
++++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+@@ -21,6 +21,7 @@
+ #include <protocols/service/fwu/fwu_proto.h>
+ #include <trace.h>
+ #include "corstone1000_config.h"
++#include "corstone1000_event_handling.h"
+=20
+ /* backends */
+ #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
+@@ -165,6 +166,32 @@ struct rpc_service_interface *its_proxy_create(void=
)
+ 	return secure_storage_provider_init(&its_provider, backend, &its_uuid)=
;
+ }
+=20
++struct rpc_service_interface *event_handler_proxy_create(void)
++{
++	static struct event_provider event_provider =3D {0};
++	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
++
++	/* Static objects for proxy instance */
++	static struct rpc_caller_interface rse_comms =3D { 0 };
++	static struct rpc_caller_session rpc_session =3D { 0 };
++
++	rpc_status =3D rse_comms_caller_init(&rse_comms);
++	if (rpc_status !=3D RPC_SUCCESS)
++		return NULL;
++
++	rpc_status =3D rpc_caller_session_open(&rpc_session, &rse_comms, &dumm=
y_uuid, 0, 0);
++	if (rpc_status !=3D RPC_SUCCESS)
++		return NULL;
++
++
++	event_provider.client.session =3D &rpc_session;
++	event_provider.client.rpc_status =3D RPC_SUCCESS;
++	event_provider.client.service_info.supported_encodings =3D 0;
++	event_provider.client.service_info.max_payload =3D 4096;
++
++	return corstone1000_event_provider_init(&event_provider);
++}
++
+ struct rpc_service_interface *fwu_proxy_create(void)
+ {
+ 	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0025-platform-corstone1000-Define-GUID-for-each-payloads.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0025-platform-corston=
e1000-Define-GUID-for-each-payloads.patch
new file mode 100644
index 00000000..61ab4680
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0025-pl=
atform-corstone1000-Define-GUID-for-each-payloads.patch
@@ -0,0 +1,141 @@
+From 6a26d67c0b531af07537aefcbe7a46fc71471d4f Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Thu, 27 Mar 2025 13:42:03 +0000
+Subject: [PATCH 8/8] platform: corstone1000: Define GUID for FWU payload=
s
+
+Specify the Global Unique Identifiers (GUIDs) for firmware update (FWU)
+payloads, which include BL2, TFM_S, FIP, and INITRAMFS.
+Note that the GUIDs differ between FVP and MPS3 platforms.
+
+Upstream-Status: Pending
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../infra/corstone1000/corstone1000_config.h  | 43 ++++++++++++++++---
+ .../corstone1000/service_proxy_factory.c      | 41 +++++++++++++++---
+ 2 files changed, 73 insertions(+), 11 deletions(-)
+
+diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_config=
.h b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
+index 4a68c2fa..c4bd9c2c 100644
+--- a/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
++++ b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
+@@ -11,17 +11,48 @@
+ /* Maximum payload size to be transferred at once to Secure Enclave */
+ #define MAX_PAYLOAD_SIZE 4096
+=20
+-#define CORSTONE1000_FVP_FULL_CAPSULE_UUID  \
+-{ 0x4e, 0x3a, 0x9f, 0x98, 0xe0, 0x46, 0xd0, 0x4c, 0x98, 0x77, 0xa2, 0x5=
c, 0x70, 0xc0, 0x13, 0x29, }
++/*
++ * GUIDs for capsule updatable firmware images
++ *
++ * The GUIDs are generated with the UUIDv5 format with the following co=
nfigurations:
++ * Namespace (for FVP GUIDs): 989f3a4e-46e0-4cd0-9877-a25c70c01329
++ * Namespace (for MPS3 GUIDs): df1865d1-90fb-4d59-9c38-c9f2c1bba8cc
++ * Names: in the `fw_name` field: `BL2`, `TFM_S`, `FIP`, `INITRAMFS`
++ * Note: Using the same namespace and `fw_name` values should generate =
the same GUIDs.
++ */
++
++#define FWU_FVP_BL2_CAPSULE_UUID  \
++{ 0xf9, 0x83, 0xd8, 0xf1, 0xeb, 0xdf, 0x63, 0x53, 0x98, 0xd8, 0x68, 0x6=
e, 0xe3, 0xb6, 0x9f, 0x4f, }
++
++#define FWU_FVP_TFM_S_CAPSULE_UUID  \
++{ 0x0e, 0x47, 0xad, 0x7f, 0xc5, 0x5e, 0x03, 0x5c, 0xa2, 0xc1, 0x47, 0x5=
6, 0xb4, 0x95, 0xde, 0x61, }
++
++#define FWU_FVP_FIP_CAPSULE_UUID  \
++{ 0x75, 0x36, 0x93, 0xf1, 0x8c, 0x5a, 0x6d, 0x5b, 0x9e, 0xf4, 0x84, 0x6=
7, 0x39, 0xe8, 0x9b, 0xc8, }
++
++#define FWU_FVP_INITRAMFS_CAPSULE_UUID  \
++{ 0xf9, 0xaf, 0x71, 0xf7, 0xe9, 0xc7, 0x99, 0x5f, 0x9e, 0xda, 0x23, 0x6=
9, 0xdd, 0x69, 0x4f, 0x61, }
++
++#define FWU_MPS3_BL2_CAPSULE_UUID  \
++{ 0xaa, 0xef, 0xfb, 0xfb, 0x56, 0x0a, 0xd5, 0x50, 0xb6, 0x51, 0x74, 0x0=
9, 0x1d, 0x3d, 0x62, 0xcf, }
++
++#define FWU_MPS3_TFM_S_CAPSULE_UUID  \
++{ 0xad, 0xc7, 0x4c, 0xaf, 0x2e, 0xee, 0x39, 0x5a, 0xaa, 0xd5, 0xfa, 0xc=
8, 0xa1, 0xe6, 0x17, 0x3c, }
++
++#define FWU_MPS3_FIP_CAPSULE_UUID  \
++{ 0x96, 0x2f, 0x30, 0x55, 0xf0, 0xc4, 0xf9, 0x5c, 0x86, 0x24, 0xe7, 0xc=
c, 0x38, 0x8f, 0x2b, 0x68, }
+=20
+-#define CORSTONE1000_MPS3_FULL_CAPSULE_UUID  \
+-{ 0xd1, 0x65, 0x18, 0xdf, 0xfb, 0x90, 0x59, 0x4d, 0x9c, 0x38, 0xc9, 0xf=
2, 0xc1, 0xbb, 0xa8, 0xcc, }
++#define FWU_MPS3_INITRAMFS_CAPSULE_UUID  \
++{ 0x72, 0xc9, 0x8a, 0x3e, 0x3c, 0xc3, 0xc9, 0x5c, 0x90, 0xa0, 0xcd, 0xd=
3, 0x15, 0x96, 0x83, 0xea, }
+=20
+ /* Image indexes in the UEFI capsule */
+ enum fwu_image_index
+ {
+-	FWU_IMAGE_INDEX_FULL_CAPSULE =3D 1,
+-	FWU_IMAGE_INDEX_ESRT,
++	FWU_IMAGE_INDEX_CAPSULE_BL2 =3D 1,
++	FWU_IMAGE_INDEX_CAPSULE_TFM_S,
++	FWU_IMAGE_INDEX_CAPSULE_FIP,
++	FWU_IMAGE_INDEX_CAPSULE_INITRAMFS,
++	FWU_IMAGE_INDEX_ESRT ,
+ };
+=20
+ #endif /* CORSTONE1000_CONFIG_H */
+diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+index ed42e2cb..43a9ac37 100644
+--- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
++++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
+@@ -28,7 +28,14 @@
+ #include <service/secure_storage/backend/secure_storage_ipc/secure_stor=
age_ipc.h>
+ #include <service/attestation/client/psa/iat_client.h>
+=20
+-/* IMAGE_MAPPING_ELEMENT_COUNT includes the number of images to be upda=
ted and ESRT image */
++/* IMAGE_MAPPING_ELEMENT_COUNT includes the number of images to be upda=
ted and ESRT image.
++ * It includes:
++ * - BL2
++ * - TFM_S
++ * - FIP
++ * - INITRAMFS
++ * - ESRT
++ */
+ #define IMAGE_MAPPING_ELEMENT_COUNT (FWU_IMAGE_CAPSULE_COUNT + 1)
+=20
+ /* The index to access the ESRT image in the psa_fwu_m_image_mapping st=
ructure
+@@ -41,13 +48,37 @@ static const struct rpc_uuid dummy_uuid =3D { 0 };
+ static struct psa_fwu_m_image_mapping img_mapping[IMAGE_MAPPING_ELEMENT=
_COUNT] =3D {
+ #if PLATFORM_IS_FVP
+ 	{
+-		.uuid =3D CORSTONE1000_FVP_FULL_CAPSULE_UUID,
+-		.component =3D FWU_IMAGE_INDEX_FULL_CAPSULE
++		.uuid =3D FWU_FVP_BL2_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_BL2
++	},
++	{
++		.uuid =3D FWU_FVP_TFM_S_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_TFM_S
++	},
++	{
++		.uuid =3D FWU_FVP_FIP_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_FIP
++	},
++	{
++		.uuid =3D FWU_FVP_INITRAMFS_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_INITRAMFS
+ 	},
+ #else
+ 	{
+-		.uuid =3D CORSTONE1000_MPS3_FULL_CAPSULE_UUID,
+-		.component =3D FWU_IMAGE_INDEX_FULL_CAPSULE
++		.uuid =3D FWU_MPS3_BL2_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_BL2
++	},
++	{
++		.uuid =3D FWU_MPS3_TFM_S_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_TFM_S
++	},
++	{
++		.uuid =3D FWU_MPS3_FIP_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_FIP
++	},
++	{
++		.uuid =3D FWU_MPS3_INITRAMFS_CAPSULE_UUID,
++		.component =3D FWU_IMAGE_INDEX_CAPSULE_INITRAMFS
+ 	},
+ #endif
+ };
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index ed40ca7f..060725f1 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -20,6 +20,14 @@ SRC_URI:append:corstone1000  =3D " \
     file://0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch \
     file://0016-Add-the-com-buffer-address-and-page-count.patch \
     file://0017-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.pat=
ch \
+    file://0018-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch =
\
+    file://0019-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch=
 \
+    file://0020-Corstone1000-Define-PSA-FWU-image-mapping-structure.patc=
h \
+    file://0021-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch=
 \
+    file://0022-fwu-Add-EFI-ESRT-v1-support.patch \
+    file://0023-platform-corstone1000-Enable-ESRT-support.patch \
+    file://0024-platform-corstone1000-Add-event-provider-proxy.patch \
+    file://0025-platform-corstone1000-Define-GUID-for-each-payloads.patc=
h \
     "
 # The patches above introduce errors with GCC 14.1, silence them for now
 CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -Wno-implicit-funct=
ion-declaration"

