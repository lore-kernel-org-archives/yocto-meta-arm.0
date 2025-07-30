Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C5CC87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.33475.1753876438590313520
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EC6A2573;
	Wed, 30 Jul 2025 04:53:50 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1B4C3F66E;
	Wed, 30 Jul 2025 04:53:57 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 08/13] arm-bsp/trusted-services: corstone-1000: Remove old capsule update implementation
Date: Wed, 30 Jul 2025 12:53:22 +0100
Message-Id: <20250730115327.3671160-9-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6645

This change removes the obsolete out-of-tree patches and legacy support r=
elated
to the old capsule update mechanism for the Corstone-1000 platform.
The Trusted-Services components are now aligned with the upstream impleme=
ntation,
and outdated patches have been dropped or rebased as necessary.

- Removed deprecated patches targeting old capsule update logic
- Rebasing of remaining patches to ensure compatibility with updated TS i=
nterface

This prepares the platform for the new PSA FWU-based capsule update path =
and
reduces technical debt in Trusted-Services integration.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...ub-capsule-update-service-components.patch | 378 ---------
 ...1-Fix-in-AEAD-for-psa-arch-test-254.patch} |   0
 ...0002-Fix-psa-api-crypto-test-no-243.patch} |   0
 .../0003-FMP-Support-in-Corstone1000.patch    | 418 ----------
 ...ag.patch =3D> 0003-Remove-Werror-flag.patch} |   0
 ..._HAS_ATTEST_PK-define-from-IAT-test.patch} |   0
 ...sizes-compile-time-definitions-user.patch} |   0
 ...0-Use-the-stateless-platform-service.patch | 141 ----
 ...0006-Align-PSA-Crypto-with-TF-Mv2.1.patch} |   0
 ...0-Initialize-capsule-update-provider.patch | 106 ---
 ...store-UEFI-variable-index-in-chunks.patch} | 140 ++--
 ...ne1000-add-client_id-for-FMP-service.patch |  49 --
 .../0008-se-proxy-protobuf-change.patch       |  71 ++
 ...1000-Add-PLATFORM_IS_FVP-toggle-for.patch} |   0
 ...FWU-IPC-framework-for-Corstone-1000.patch} |  20 +-
 ...age-state-in-PSA-FWU-M-update-agent.patch} |   0
 ...ine-PSA-FWU-image-mapping-structure.patch} |   0
 ...able-index-usage-robust-with-redunda.patch | 716 ------------------
 ...-psa_fwu_install-return-value-check.patch} |   0
 ...traints-of-NV-UEFI-variables-persist.patch | 387 ----------
 ...=3D> 0014-fwu-Add-EFI-ESRT-v1-support.patch} |   0
 ...rm-corstone1000-Enable-ESRT-support.patch} |   0
 .../0015-se-proxy-protobuf-change.patch       |  64 --
 ...rstone1000-Add-event-provider-proxy.patch} |  53 +-
 ...e1000-Define-GUID-for-each-payloads.patch} |   0
 ...e-com-buffer-address-and-page-count.patch} |  27 +-
 .../trusted-services/ts-arm-platforms.inc     |  43 +-
 27 files changed, 232 insertions(+), 2381 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0001-Add-stub-capsule-update-service-components.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0002=
-Fix-in-AEAD-for-psa-arch-test-254.patch =3D> 0001-Fix-in-AEAD-for-psa-ar=
ch-test-254.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0004=
-Fix-psa-api-crypto-test-no-243.patch =3D> 0002-Fix-psa-api-crypto-test-n=
o-243.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0003-FMP-Support-in-Corstone1000.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0008=
-Remove-Werror-flag.patch =3D> 0003-Remove-Werror-flag.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0009=
-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch =3D> 0004-Remov=
e-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0010=
-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch =3D> 0005-Mak=
e-RSS-and-MHU-sizes-compile-time-definitions-user.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-plat-corstone1000-Use-the-stateless-platform-service.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0011=
-Align-PSA-Crypto-with-TF-Mv2.1.patch =3D> 0006-Align-PSA-Crypto-with-TF-=
Mv2.1.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0006-plat-corstone1000-Initialize-capsule-update-provider.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0013=
-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch =3D> 0007-Reve=
rt-Load-and-store-UEFI-variable-index-in-chunks.patch} (74%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0007-plat-corstone1000-add-client_id-for-FMP-service.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-se-proxy-protobuf-change.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0017=
-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch =3D> 0009-Pla=
tform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0018=
-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch =3D> 0010-Integr=
ate-PSA-FWU-IPC-framework-for-Corstone-1000.patch} (97%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0019=
-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch =3D> 0011-Load-=
initial-image-state-in-PSA-FWU-M-update-agent.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0020=
-Corstone1000-Define-PSA-FWU-image-mapping-structure.patch =3D> 0012-Cors=
tone1000-Define-PSA-FWU-image-mapping-structure.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Revert-Make-variable-index-usage-robust-with-redunda.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0021=
-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch =3D> 0013-Fix-P=
SA-FWU-IPC-psa_fwu_install-return-value-check.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-Revert-Make-constraints-of-NV-UEFI-variables-persist.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0022=
-fwu-Add-EFI-ESRT-v1-support.patch =3D> 0014-fwu-Add-EFI-ESRT-v1-support.=
patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0023=
-platform-corstone1000-Enable-ESRT-support.patch =3D> 0015-platform-corst=
one1000-Enable-ESRT-support.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0015-se-proxy-protobuf-change.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0024=
-platform-corstone1000-Add-event-provider-proxy.patch =3D> 0016-platform-=
corstone1000-Add-event-provider-proxy.patch} (82%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0025=
-platform-corstone1000-Define-GUID-for-each-payloads.patch =3D> 0017-plat=
form-corstone1000-Define-GUID-for-each-payloads.patch} (100%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0016=
-Add-the-com-buffer-address-and-page-count.patch =3D> 0018-Add-the-com-bu=
ffer-address-and-page-count.patch} (60%)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0001-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp/reci=
pes-security/trusted-services/corstone1000/0001-Add-stub-capsule-update-s=
ervice-components.patch
deleted file mode 100644
index 8910364a..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-stub-capsule-update-service-components.patch
+++ /dev/null
@@ -1,378 +0,0 @@
-From fd171007b073a4cff7c3deabfdff233c0a9ed507 Mon Sep 17 00:00:00 2001
-From: Julian Hall <julian.hall@arm.com>
-Date: Tue, 12 Oct 2021 15:45:41 +0100
-Subject: [PATCH 01/12] Add stub capsule update service components
-
-To facilitate development of a capsule update service provider,
-stub components are added to provide a starting point for an
-implementation. The capsule update service provider is integrated
-into the se-proxy/common deployment.
-
-Upstream-Status: Inappropriate [Trusted-Services Design needs to be foll=
owed]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Julian Hall <julian.hall@arm.com>
-Change-Id: I0d4049bb4de5af7ca80806403301692507085d28
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../backend/capsule_update_backend.h          |  24 ++++
- .../provider/capsule_update_provider.c        | 135 ++++++++++++++++++
- .../provider/capsule_update_provider.h        |  51 +++++++
- .../capsule_update/provider/component.cmake   |  13 ++
- .../se-proxy/infra/corstone1000/infra.cmake   |   1 +
- deployments/se-proxy/se_proxy_interfaces.h    |   9 +-
- .../capsule_update/capsule_update_proto.h     |  13 ++
- protocols/service/capsule_update/opcodes.h    |  17 +++
- protocols/service/capsule_update/parameters.h |  15 ++
- 9 files changed, 274 insertions(+), 4 deletions(-)
- create mode 100644 components/service/capsule_update/backend/capsule_up=
date_backend.h
- create mode 100644 components/service/capsule_update/provider/capsule_u=
pdate_provider.c
- create mode 100644 components/service/capsule_update/provider/capsule_u=
pdate_provider.h
- create mode 100644 components/service/capsule_update/provider/component=
.cmake
- create mode 100644 protocols/service/capsule_update/capsule_update_prot=
o.h
- create mode 100644 protocols/service/capsule_update/opcodes.h
- create mode 100644 protocols/service/capsule_update/parameters.h
-
-diff --git a/components/service/capsule_update/backend/capsule_update_ba=
ckend.h b/components/service/capsule_update/backend/capsule_update_backen=
d.h
-new file mode 100644
-index 000000000..f3144ff1d
---- /dev/null
-+++ b/components/service/capsule_update/backend/capsule_update_backend.h
-@@ -0,0 +1,24 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CAPSULE_UPDATE_BACKEND_H
-+#define CAPSULE_UPDATE_BACKEND_H
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * Defines the common capsule update backend interface.  Concrete backe=
nds
-+ * implement this interface for different types of platform.
-+ */
-+
-+
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
-+
-+#endif /* CAPSULE_UPDATE_BACKEND_H */
-diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
-new file mode 100644
-index 000000000..f35c272d2
---- /dev/null
-+++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
-@@ -0,0 +1,135 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <trace.h>
-+
-+#include <protocols/service/capsule_update/capsule_update_proto.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include "capsule_update_provider.h"
-+
-+
-+#define CAPSULE_UPDATE_REQUEST (0x1)
-+#define KERNEL_STARTED_EVENT   (0x2)
-+
-+enum corstone1000_ioctl_id_t {
-+	IOCTL_CORSTONE1000_FWU_FLASH_IMAGES =3D 0,
-+	IOCTL_CORSTONE1000_FWU_HOST_ACK,
-+};
-+
-+/* Service request handlers */
-+static rpc_status_t update_capsule_handler(void *context, struct rpc_re=
quest *req);
-+static rpc_status_t boot_confirmed_handler(void *context, struct rpc_re=
quest *req);
-+
-+/* Handler mapping table for service */
-+static const struct service_handler handler_table[] =3D {
-+	{CAPSULE_UPDATE_OPCODE_UPDATE_CAPSULE,			update_capsule_handler},
-+	{CAPSULE_UPDATE_OPCODE_BOOT_CONFIRMED,			boot_confirmed_handler}
-+};
-+
-+struct rpc_service_interface *capsule_update_provider_init(
-+	struct capsule_update_provider *context)
-+{
-+	struct rpc_service_interface *rpc_interface =3D NULL;
-+	const struct rpc_uuid dummy_uuid =3D { .uuid =3D { 0 }};
-+	if (!context)
-+		return NULL;
-+
-+	service_provider_init(
-+		&context->base_provider,
-+		context,
-+		&dummy_uuid,
-+		handler_table,
-+		sizeof(handler_table)/sizeof(struct service_handler));
-+
-+	rpc_interface =3D service_provider_get_rpc_interface(&context->base_pr=
ovider);
-+
-+
-+	return rpc_interface;
-+}
-+
-+void capsule_update_provider_deinit(struct capsule_update_provider *con=
text)
-+{
-+	(void)context;
-+}
-+
-+static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller_in=
terface *caller)
-+{
-+	uint32_t ioctl_id;
-+	psa_handle_t handle;
-+	rpc_status_t rpc_status =3D TS_RPC_CALL_ACCEPTED;
-+
-+	struct psa_invec in_vec[] =3D {
-+			{ .base =3D &ioctl_id, .len =3D sizeof(ioctl_id) }
-+	};
-+
-+	if(!caller) {
-+		EMSG("event_handler rpc_caller is NULL");
-+		rpc_status =3D TS_RPC_ERROR_RESOURCE_FAILURE;
-+		return rpc_status;
-+	}
-+
-+	IMSG("event handler opcode %x", opcode);
-+	switch(opcode) {
-+		case CAPSULE_UPDATE_REQUEST:
-+		/* Openamp call with IOCTL for firmware update*/
-+		ioctl_id =3D IOCTL_CORSTONE1000_FWU_FLASH_IMAGES;
-+		handle =3D psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
-+				TFM_SP_PLATFORM_IOCTL_VERSION);
-+		if (handle <=3D 0) {
-+			EMSG("%s Invalid handle", __func__);
-+			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
-+			return rpc_status;
-+		}
-+		psa_call(caller,handle, PSA_IPC_CALL,
-+			in_vec,IOVEC_LEN(in_vec), NULL, 0);
-+		break;
-+
-+		case KERNEL_STARTED_EVENT:
-+		ioctl_id =3D IOCTL_CORSTONE1000_FWU_HOST_ACK;
-+		/*openamp call with IOCTL for kernel start*/
-+		handle =3D psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
-+				TFM_SP_PLATFORM_IOCTL_VERSION);
-+		if (handle <=3D 0) {
-+			EMSG("%s Invalid handle", __func__);
-+			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
-+			return rpc_status;
-+		}
-+		psa_call(caller,handle, PSA_IPC_CALL,
-+			in_vec,IOVEC_LEN(in_vec), NULL, 0);
-+		break;
-+		default:
-+			EMSG("%s unsupported opcode", __func__);
-+			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
-+			return rpc_status;
-+	}
-+	return rpc_status;
-+
-+}
-+
-+static rpc_status_t update_capsule_handler(void *context, struct rpc_re=
quest *req)
-+{
-+	struct capsule_update_provider *this_instance =3D (struct capsule_upda=
te_provider*)context;
-+	struct rpc_caller_interface *caller =3D this_instance->client.session-=
>caller;
-+	uint32_t opcode =3D req->opcode;
-+	rpc_status_t rpc_status =3D TS_RPC_ERROR_NOT_READY;
-+
-+	rpc_status =3D event_handler(opcode, caller);
-+	return rpc_status;
-+}
-+
-+static rpc_status_t boot_confirmed_handler(void *context, struct rpc_re=
quest *req)
-+{
-+	struct capsule_update_provider *this_instance =3D (struct capsule_upda=
te_provider*)context;
-+	struct rpc_caller_interface *caller =3D this_instance->client.session-=
>caller;
-+	uint32_t opcode =3D req->opcode;
-+	rpc_status_t rpc_status =3D TS_RPC_ERROR_NOT_READY;
-+
-+	rpc_status =3D event_handler(opcode, caller);
-+
-+	return rpc_status;
-+}
-diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.h b/components/service/capsule_update/provider/capsule_update_pro=
vider.h
-new file mode 100644
-index 000000000..5dc5535d6
---- /dev/null
-+++ b/components/service/capsule_update/provider/capsule_update_provider=
.h
-@@ -0,0 +1,51 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CAPSULE_UPDATE_PROVIDER_H
-+#define CAPSULE_UPDATE_PROVIDER_H
-+
-+#include <rpc/common/endpoint/rpc_service_interface.h>
-+#include <service/common/provider/service_provider.h>
-+#include <service/common/client/service_client.h>
-+#include <service/capsule_update/backend/capsule_update_backend.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * The capsule_update_provider is a service provider that accepts updat=
e capsule
-+ * requests and delegates them to a suitable backend that applies the u=
pdate.
-+ */
-+struct capsule_update_provider
-+{
-+	struct service_provider base_provider;
-+	struct service_client client;
-+};
-+
-+/**
-+ * \brief Initialize an instance of the capsule update service provider
-+ *
-+ * @param[in] context The instance to initialize
-+ *
-+ * \return An rpc_service_interface or NULL on failure
-+ */
-+struct rpc_service_interface *capsule_update_provider_init(
-+	struct capsule_update_provider *context);
-+
-+/**
-+ * \brief Cleans up when the instance is no longer needed
-+ *
-+ * \param[in] context   The instance to de-initialize
-+ */
-+void capsule_update_provider_deinit(
-+	struct capsule_update_provider *context);
-+
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
-+
-+#endif /* CAPSULE_UPDATE_PROVIDER_H */
-diff --git a/components/service/capsule_update/provider/component.cmake =
b/components/service/capsule_update/provider/component.cmake
-new file mode 100644
-index 000000000..1d412eb23
---- /dev/null
-+++ b/components/service/capsule_update/provider/component.cmake
-@@ -0,0 +1,13 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
-+	)
-diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
-index 3830f9d61..27af8a333 100644
---- a/deployments/se-proxy/infra/corstone1000/infra.cmake
-+++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
-@@ -27,6 +27,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/fwu/provider/serializer"
- 		"components/service/fwu/psa_fwu_m/agent"
- 		"components/service/fwu/psa_fwu_m/interface/stub"
-+		"components/service/capsule_update/provider"
- 		"components/service/secure_storage/backend/secure_storage_ipc"
- )
-=20
-diff --git a/deployments/se-proxy/se_proxy_interfaces.h b/deployments/se=
-proxy/se_proxy_interfaces.h
-index 48908f846..3d4a7c204 100644
---- a/deployments/se-proxy/se_proxy_interfaces.h
-+++ b/deployments/se-proxy/se_proxy_interfaces.h
-@@ -8,9 +8,10 @@
- #define SE_PROXY_INTERFACES_H
-=20
- /* Interface IDs from service endpoints available from an se-proxy depl=
oyment */
--#define SE_PROXY_INTERFACE_ID_ITS			(0)
--#define SE_PROXY_INTERFACE_ID_PS			(1)
--#define SE_PROXY_INTERFACE_ID_CRYPTO		(2)
--#define SE_PROXY_INTERFACE_ID_ATTEST		(3)
-+#define SE_PROXY_INTERFACE_ID_ITS			    (0)
-+#define SE_PROXY_INTERFACE_ID_PS			    (1)
-+#define SE_PROXY_INTERFACE_ID_CRYPTO		    (2)
-+#define SE_PROXY_INTERFACE_ID_ATTEST		    (3)
-+#define SE_PROXY_INTERFACE_ID_CAPSULE_UPDATE    (4)
-=20
- #endif /* SE_PROXY_INTERFACES_H */
-diff --git a/protocols/service/capsule_update/capsule_update_proto.h b/p=
rotocols/service/capsule_update/capsule_update_proto.h
-new file mode 100644
-index 000000000..8f326cd38
---- /dev/null
-+++ b/protocols/service/capsule_update/capsule_update_proto.h
-@@ -0,0 +1,13 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CAPSULE_UPDATE_PROTO_H
-+#define CAPSULE_UPDATE_PROTO_H
-+
-+#include <protocols/service/capsule_update/opcodes.h>
-+#include <protocols/service/capsule_update/parameters.h>
-+
-+#endif /* CAPSULE_UPDATE_PROTO_H */
-diff --git a/protocols/service/capsule_update/opcodes.h b/protocols/serv=
ice/capsule_update/opcodes.h
-new file mode 100644
-index 000000000..8185a0902
---- /dev/null
-+++ b/protocols/service/capsule_update/opcodes.h
-@@ -0,0 +1,17 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CAPSULE_UPDATE_OPCODES_H
-+#define CAPSULE_UPDATE_OPCODES_H
-+
-+/**
-+ * Opcode definitions for the capsule update service
-+ */
-+
-+#define CAPSULE_UPDATE_OPCODE_UPDATE_CAPSULE		1
-+#define CAPSULE_UPDATE_OPCODE_BOOT_CONFIRMED		2
-+
-+#endif /* CAPSULE_UPDATE_OPCODES_H */
-diff --git a/protocols/service/capsule_update/parameters.h b/protocols/s=
ervice/capsule_update/parameters.h
-new file mode 100644
-index 000000000..285d92418
---- /dev/null
-+++ b/protocols/service/capsule_update/parameters.h
-@@ -0,0 +1,15 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CAPSULE_UPDATE_PARAMETERS_H
-+#define CAPSULE_UPDATE_PARAMETERS_H
-+
-+/**
-+ * Operation parameter definitions for the capsule update service acces=
s protocol.
-+ */
-+
-+
-+#endif /* CAPSULE_UPDATE_PARAMETERS_H */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0002-Fix-in-AEAD-for-psa-arch-test-254.patch b/meta-arm-bsp/recipes-secur=
ity/trusted-services/corstone1000/0001-Fix-in-AEAD-for-psa-arch-test-254.=
patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
002-Fix-in-AEAD-for-psa-arch-test-254.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
1-Fix-in-AEAD-for-psa-arch-test-254.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0004-Fix-psa-api-crypto-test-no-243.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/0002-Fix-psa-api-crypto-test-no-243.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
004-Fix-psa-api-crypto-test-no-243.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
2-Fix-psa-api-crypto-test-no-243.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0003-FMP-Support-in-Corstone1000.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/corstone1000/0003-FMP-Support-in-Corstone1000.patch
deleted file mode 100644
index cd2cf5fc..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-FM=
P-Support-in-Corstone1000.patch
+++ /dev/null
@@ -1,418 +0,0 @@
-From fea499f48d07638417511f194c2977133fd75b4d Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Fri, 8 Jul 2022 09:48:06 +0100
-Subject: [PATCH 03/12] FMP Support in Corstone1000.
-
-The FMP support is used by u-boot to pupolate ESRT information
-for the kernel.
-
-The solution is platform specific and needs to be revisted.
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-Upstream-Status: Inappropriate [The solution is platform specific and ne=
eds to be revisted]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../provider/capsule_update_provider.c        |   5 +
- .../capsule_update/provider/component.cmake   |   1 +
- .../provider/corstone1000_fmp_service.c       | 307 ++++++++++++++++++
- .../provider/corstone1000_fmp_service.h       |  26 ++
- 4 files changed, 339 insertions(+)
- create mode 100644 components/service/capsule_update/provider/corstone1=
000_fmp_service.c
- create mode 100644 components/service/capsule_update/provider/corstone1=
000_fmp_service.h
-
-diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
-index f35c272d2..bfeb7301a 100644
---- a/components/service/capsule_update/provider/capsule_update_provider=
.c
-+++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
-@@ -11,6 +11,7 @@
- #include <protocols/service/capsule_update/capsule_update_proto.h>
- #include <protocols/rpc/common/packed-c/status.h>
- #include "capsule_update_provider.h"
-+#include "corstone1000_fmp_service.h"
-=20
-=20
- #define CAPSULE_UPDATE_REQUEST (0x1)
-@@ -49,6 +50,8 @@ struct rpc_service_interface *capsule_update_provider_=
init(
- 	rpc_interface =3D service_provider_get_rpc_interface(&context->base_pr=
ovider);
-=20
-=20
-+	provision_fmp_variables_metadata(context->client.session->caller);
-+
- 	return rpc_interface;
- }
-=20
-@@ -87,6 +90,7 @@ static rpc_status_t event_handler(uint32_t opcode, str=
uct rpc_caller_interface *
- 		}
- 		psa_call(caller,handle, PSA_IPC_CALL,
- 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
-+		set_fmp_image_info(caller, handle);
- 		break;
-=20
- 		case KERNEL_STARTED_EVENT:
-@@ -101,6 +105,7 @@ static rpc_status_t event_handler(uint32_t opcode, s=
truct rpc_caller_interface *
- 		}
- 		psa_call(caller,handle, PSA_IPC_CALL,
- 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
-+		set_fmp_image_info(caller, handle);
- 		break;
- 		default:
- 			EMSG("%s unsupported opcode", __func__);
-diff --git a/components/service/capsule_update/provider/component.cmake =
b/components/service/capsule_update/provider/component.cmake
-index 1d412eb23..6b0601494 100644
---- a/components/service/capsule_update/provider/component.cmake
-+++ b/components/service/capsule_update/provider/component.cmake
-@@ -10,4 +10,5 @@ endif()
-=20
- target_sources(${TGT} PRIVATE
- 	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
-+	"${CMAKE_CURRENT_LIST_DIR}/corstone1000_fmp_service.c"
- 	)
-diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
-new file mode 100644
-index 000000000..2222251a7
---- /dev/null
-+++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
-@@ -0,0 +1,307 @@
-+/*
-+ * Copyright (c) 2022, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include "corstone1000_fmp_service.h"
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <psa/storage_common.h>
-+#include <trace.h>
-+
-+#include <service/uefi/smm_variable/backend/variable_index.h>
-+
-+#define VARIABLE_INDEX_STORAGE_UID			(0x787)
-+
-+/**
-+ * Variable attributes
-+ */
-+#define	EFI_VARIABLE_NON_VOLATILE				(0x00000001)
-+#define	EFI_VARIABLE_BOOTSERVICE_ACCESS				(0x00000002)
-+#define	EFI_VARIABLE_RUNTIME_ACCESS				(0x00000004)
-+#define	EFI_VARIABLE_HARDWARE_ERROR_RECORD			(0x00000008)
-+#define	EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS			(0x00000010)
-+#define	EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS	(0x00000020)
-+#define	EFI_VARIABLE_APPEND_WRITE				(0x00000040)
-+#define	EFI_VARIABLE_MASK \
-+	(EFI_VARIABLE_NON_VOLATILE | \
-+	 EFI_VARIABLE_BOOTSERVICE_ACCESS | \
-+	 EFI_VARIABLE_RUNTIME_ACCESS | \
-+	 EFI_VARIABLE_HARDWARE_ERROR_RECORD | \
-+	 EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS | \
-+	 EFI_VARIABLE_APPEND_WRITE)
-+
-+#define FMP_VARIABLES_COUNT	6
-+
-+static struct variable_metadata fmp_variables_metadata[FMP_VARIABLES_CO=
UNT] =3D {
-+    {
-+	{ 0x86c77a67, 0x0b97, 0x4633, \
-+		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
-+	/* name size =3D (variable_name + \0) * sizeof(u16) */
-+	.name_size =3D 42, { 'F', 'm', 'p', 'D', 'e', 's', 'c', 'r', 'i', 'p',=
 't', 'o', 'r', 'V', 'e', 'r', 's', 'i', 'o', 'n' },
-+	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
-+    },
-+    {
-+	{ 0x86c77a67, 0x0b97, 0x4633, \
-+		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
-+	/* name size =3D (variable_name + \0) * sizeof(u16) */
-+	.name_size =3D 34, { 'F', 'm', 'p', 'I', 'm', 'a', 'g', 'e', 'I', 'n',=
 'f', 'o', 'S', 'i', 'z', 'e' },
-+	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
-+    },
-+    {
-+	{ 0x86c77a67, 0x0b97, 0x4633, \
-+		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
-+	/* name size =3D (variable_name + \0) * sizeof(u16) */
-+	.name_size =3D 38, { 'F', 'm', 'p', 'D', 'e', 's', 'c', 'r', 'i', 'p',=
 't', 'o', 'r', 'C', 'o', 'u', 'n', 't' },
-+	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
-+    },
-+    {
-+	{ 0x86c77a67, 0x0b97, 0x4633, \
-+		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
-+	/* name size =3D (variable_name + \0) * sizeof(u16) */
-+	.name_size =3D 26, { 'F', 'm', 'p', 'I', 'm', 'a', 'g', 'e', 'I', 'n',=
 'f', 'o' },
-+	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
-+    },
-+    {
-+	{ 0x86c77a67, 0x0b97, 0x4633, \
-+		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
-+	/* name size =3D (variable_name + \0) * sizeof(u16) */
-+	.name_size =3D 28, { 'F', 'm', 'p', 'I', 'm', 'a', 'g', 'e', 'N', 'a',=
 'm', 'e', '1' },
-+	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
-+    },
-+    {
-+	{ 0x86c77a67, 0x0b97, 0x4633, \
-+		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
-+	/* name size =3D (variable_name + \0) * sizeof(u16) */
-+	.name_size =3D 32, { 'F', 'm', 'p', 'V', 'e', 'r', 's', 'i', 'o', 'n',=
  'N', 'a', 'm', 'e', '1' },
-+	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
-+    },
-+};
-+
-+static psa_status_t protected_storage_set(struct rpc_caller_interface *=
caller,
-+	psa_storage_uid_t uid, size_t data_length, const void *p_data)
-+{
-+	psa_status_t psa_status;
-+	psa_storage_create_flags_t create_flags =3D PSA_STORAGE_FLAG_NONE;
-+
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
-+		{ .base =3D psa_ptr_const_to_u32(p_data), .len =3D data_length },
-+		{ .base =3D psa_ptr_to_u32(&create_flags), .len =3D sizeof(create_fla=
gs) },
-+	};
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE, =
TFM_PS_ITS_SET,
-+			      in_vec, IOVEC_LEN(in_vec), NULL, 0);
-+	if (psa_status < 0)
-+		EMSG("ipc_set: psa_call failed: %d", psa_status);
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t protected_storage_get(struct rpc_caller_interface *=
caller,
-+	psa_storage_uid_t uid, size_t data_size, void *p_data)
-+{
-+	psa_status_t psa_status;
-+	uint32_t offset =3D 0;
-+
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
-+		{ .base =3D psa_ptr_to_u32(&offset), .len =3D sizeof(offset) },
-+	};
-+
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(p_data), .len =3D data_size },
-+	};
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_ITS_GET, in_vec, IOVEC_LEN(in_vec),
-+			      out_vec, IOVEC_LEN(out_vec));
-+
-+	if (psa_status =3D=3D PSA_SUCCESS && out_vec[0].len !=3D data_size) {
-+	    EMSG("Return size does not match with expected size.");
-+	    return PSA_ERROR_BUFFER_TOO_SMALL;
-+	}
-+
-+	return psa_status;
-+}
-+
-+static uint64_t name_hash(EFI_GUID *guid, size_t name_size,
-+	const int16_t *name)
-+{
-+	/* Using djb2 hash by Dan Bernstein */
-+	uint64_t hash =3D 5381;
-+
-+	/* Calculate hash over GUID */
-+	hash =3D ((hash << 5) + hash) + guid->Data1;
-+	hash =3D ((hash << 5) + hash) + guid->Data2;
-+	hash =3D ((hash << 5) + hash) + guid->Data3;
-+
-+	for (int i =3D 0; i < 8; ++i) {
-+
-+		hash =3D ((hash << 5) + hash) + guid->Data4[i];
-+	}
-+
-+	/* Extend to cover name up to but not including null terminator */
-+	for (int i =3D 0; i < name_size / sizeof(int16_t); ++i) {
-+
-+		if (!name[i]) break;
-+		hash =3D ((hash << 5) + hash) + name[i];
-+	}
-+
-+	return hash;
-+}
-+
-+
-+static void initialize_metadata(void)
-+{
-+    for (int i =3D 0; i < FMP_VARIABLES_COUNT; i++) {
-+
-+	fmp_variables_metadata[i].uid =3D name_hash(
-+					&fmp_variables_metadata[i].guid,
-+					fmp_variables_metadata[i].name_size,
-+					fmp_variables_metadata[i].name);
-+    }
-+}
-+
-+
-+void provision_fmp_variables_metadata(struct rpc_caller_interface *call=
er)
-+{
-+    struct variable_metadata metadata;
-+    psa_status_t status;
-+    uint32_t dummy_values =3D 0xDEAD;
-+
-+    EMSG("Provisioning FMP metadata.");
-+
-+    initialize_metadata();
-+
-+    status =3D protected_storage_get(caller, VARIABLE_INDEX_STORAGE_UID=
,
-+		sizeof(struct variable_metadata), &metadata);
-+
-+    if (status =3D=3D PSA_SUCCESS) {
-+	EMSG("UEFI variables store is already provisioned.");
-+	return;
-+    }
-+
-+    /* Provision FMP variables with dummy values. */
-+    for (int i =3D 0; i < FMP_VARIABLES_COUNT; i++) {
-+	protected_storage_set(caller, fmp_variables_metadata[i].uid,
-+				sizeof(dummy_values), &dummy_values);
-+    }
-+
-+    status =3D protected_storage_set(caller, VARIABLE_INDEX_STORAGE_UID=
,
-+		    sizeof(struct variable_metadata) * FMP_VARIABLES_COUNT,
-+		    fmp_variables_metadata);
-+
-+    if (status !=3D EFI_SUCCESS) {
-+	return;
-+    }
-+
-+    EMSG("FMP metadata is provisioned");
-+}
-+
-+typedef struct {
-+    void *base;
-+    int len;
-+} variable_data_t;
-+
-+static variable_data_t fmp_variables_data[FMP_VARIABLES_COUNT];
-+
-+#define IMAGE_INFO_BUFFER_SIZE	256
-+static char image_info_buffer[IMAGE_INFO_BUFFER_SIZE];
-+#define IOCTL_CORSTONE1000_FMP_IMAGE_INFO	2
-+
-+static psa_status_t unpack_image_info(void *buffer, uint32_t size)
-+{
-+    typedef struct __attribute__ ((__packed__)) {
-+	uint32_t variable_count;
-+	uint32_t variable_size[FMP_VARIABLES_COUNT];
-+	uint8_t variable[];
-+    } packed_buffer_t;
-+
-+    packed_buffer_t *packed_buffer =3D buffer;
-+    int runner =3D 0;
-+
-+    if (packed_buffer->variable_count !=3D FMP_VARIABLES_COUNT) {
-+	EMSG("Expected fmp varaibles =3D %u, but received =3D %u",
-+		FMP_VARIABLES_COUNT, packed_buffer->variable_count);
-+	return PSA_ERROR_PROGRAMMER_ERROR;
-+    }
-+
-+    for (int i =3D 0; i < packed_buffer->variable_count; i++) {
-+	EMSG("FMP variable %d : size %u", i, packed_buffer->variable_size[i]);
-+	fmp_variables_data[i].base =3D &packed_buffer->variable[runner];
-+	fmp_variables_data[i].len=3D packed_buffer->variable_size[i];
-+	runner +=3D packed_buffer->variable_size[i];
-+    }
-+
-+    return PSA_SUCCESS;
-+}
-+
-+static psa_status_t get_image_info(struct rpc_caller_interface *caller,
-+			   psa_handle_t platform_service_handle)
-+{
-+    psa_status_t status;
-+    psa_handle_t handle;
-+    uint32_t ioctl_id =3D IOCTL_CORSTONE1000_FMP_IMAGE_INFO;
-+
-+    struct psa_invec in_vec[] =3D {
-+	{ .base =3D &ioctl_id, .len =3D sizeof(ioctl_id) },
-+    };
-+
-+    struct psa_outvec out_vec[] =3D {
-+	{ .base =3D image_info_buffer, .len =3D IMAGE_INFO_BUFFER_SIZE },
-+    };
-+
-+    memset(image_info_buffer, 0, IMAGE_INFO_BUFFER_SIZE);
-+
-+    psa_call(caller, platform_service_handle, PSA_IPC_CALL,
-+	     in_vec, IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+    status =3D unpack_image_info(image_info_buffer, IMAGE_INFO_BUFFER_S=
IZE);
-+    if (status !=3D PSA_SUCCESS) {
-+	return status;
-+    }
-+
-+    return PSA_SUCCESS;
-+}
-+
-+static psa_status_t set_image_info(struct rpc_caller_interface *caller)
-+{
-+    psa_status_t status;
-+
-+    for (int i =3D 0; i < FMP_VARIABLES_COUNT; i++) {
-+
-+	status =3D protected_storage_set(caller,
-+			fmp_variables_metadata[i].uid,
-+			fmp_variables_data[i].len, fmp_variables_data[i].base);
-+
-+	if (status !=3D PSA_SUCCESS) {
-+
-+            EMSG("FMP variable %d set unsuccessful", i);
-+	    return status;
-+	}
-+
-+        EMSG("FMP variable %d set success", i);
-+    }
-+
-+    return PSA_SUCCESS;
-+}
-+
-+void set_fmp_image_info(struct rpc_caller_interface *caller,
-+			psa_handle_t platform_service_handle)
-+{
-+    psa_status_t status;
-+
-+    status =3D get_image_info(caller, platform_service_handle);
-+    if (status !=3D PSA_SUCCESS) {
-+	return;
-+    }
-+
-+    status =3D set_image_info(caller);
-+    if (status !=3D PSA_SUCCESS) {
-+	return;
-+    }
-+
-+    return;
-+}
-diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.h b/components/service/capsule_update/provider/corstone1000_fmp_=
service.h
-new file mode 100644
-index 000000000..d0023dc07
---- /dev/null
-+++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
-@@ -0,0 +1,26 @@
-+/*
-+ * Copyright (c) 2022, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CORSTONE1000_FMP_SERVICE_H
-+#define CORSTONE1000_FMP_SERVICE_H
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+#include <rpc_caller.h>
-+#include <psa/client.h>
-+
-+void provision_fmp_variables_metadata(struct rpc_caller_interface *call=
er);
-+
-+void set_fmp_image_info(struct rpc_caller_interface *caller,
-+		psa_handle_t platform_service_handle);
-+
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
-+
-+#endif /* CORSTONE1000_FMP_SERVICE_H */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0008-Remove-Werror-flag.patch b/meta-arm-bsp/recipes-security/trusted-ser=
vices/corstone1000/0003-Remove-Werror-flag.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
008-Remove-Werror-flag.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
3-Remove-Werror-flag.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0004-Remove-PLATFORM_H=
AS_ATTEST_PK-define-from-IAT-test.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
009-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
4-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0010-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0005-Make-RSS-and-MH=
U-sizes-compile-time-definitions-user.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
010-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
5-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0005-plat-corstone1000-Use-the-stateless-platform-service.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0005-plat-corstone10=
00-Use-the-stateless-platform-service.patch
deleted file mode 100644
index 8324e9e0..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-pl=
at-corstone1000-Use-the-stateless-platform-service.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 81d1dbe3f04195c0ad26790e127d61149e4f5b78 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Sun, 18 Jun 2023 14:38:42 +0100
-Subject: [PATCH 05/12] plat: corstone1000: Use the stateless platform se=
rvice
- calls Calls to psa_connect is not needed and psa_call can be called dir=
ectly
- with a pre defined handle.
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-
-Upstream-Status: Inappropriate [Design is to revisted]
----
- .../provider/capsule_update_provider.c        | 24 ++++---------------
- .../provider/corstone1000_fmp_service.c       | 10 ++++----
- .../provider/corstone1000_fmp_service.h       |  3 +--
- components/service/common/include/psa/sid.h   |  7 ++++++
- 4 files changed, 17 insertions(+), 27 deletions(-)
-
-diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
-index bfeb7301a..12c552dae 100644
---- a/components/service/capsule_update/provider/capsule_update_provider=
.c
-+++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
-@@ -63,7 +63,6 @@ void capsule_update_provider_deinit(struct capsule_upd=
ate_provider *context)
- static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller_in=
terface *caller)
- {
- 	uint32_t ioctl_id;
--	psa_handle_t handle;
- 	rpc_status_t rpc_status =3D TS_RPC_CALL_ACCEPTED;
-=20
- 	struct psa_invec in_vec[] =3D {
-@@ -81,31 +80,18 @@ static rpc_status_t event_handler(uint32_t opcode, s=
truct rpc_caller_interface *
- 		case CAPSULE_UPDATE_REQUEST:
- 		/* Openamp call with IOCTL for firmware update*/
- 		ioctl_id =3D IOCTL_CORSTONE1000_FWU_FLASH_IMAGES;
--		handle =3D psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
--				TFM_SP_PLATFORM_IOCTL_VERSION);
--		if (handle <=3D 0) {
--			EMSG("%s Invalid handle", __func__);
--			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
--			return rpc_status;
--		}
--		psa_call(caller,handle, PSA_IPC_CALL,
-+		psa_call(caller,TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCT=
L,
- 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
--		set_fmp_image_info(caller, handle);
-+		set_fmp_image_info(caller);
- 		break;
-=20
- 		case KERNEL_STARTED_EVENT:
- 		ioctl_id =3D IOCTL_CORSTONE1000_FWU_HOST_ACK;
- 		/*openamp call with IOCTL for kernel start*/
--		handle =3D psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
--				TFM_SP_PLATFORM_IOCTL_VERSION);
--		if (handle <=3D 0) {
--			EMSG("%s Invalid handle", __func__);
--			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
--			return rpc_status;
--		}
--		psa_call(caller,handle, PSA_IPC_CALL,
-+	=09
-+		psa_call(caller,TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCT=
L,
- 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
--		set_fmp_image_info(caller, handle);
-+		set_fmp_image_info(caller);
- 		break;
- 		default:
- 			EMSG("%s unsupported opcode", __func__);
-diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
-index 2222251a7..2ed0f33c5 100644
---- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
-+++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
-@@ -238,8 +238,7 @@ static psa_status_t unpack_image_info(void *buffer, =
uint32_t size)
-     return PSA_SUCCESS;
- }
-=20
--static psa_status_t get_image_info(struct rpc_caller_interface *caller,
--			   psa_handle_t platform_service_handle)
-+static psa_status_t get_image_info(struct rpc_caller_interface *caller)
- {
-     psa_status_t status;
-     psa_handle_t handle;
-@@ -255,7 +254,7 @@ static psa_status_t get_image_info(struct rpc_caller=
_interface *caller,
-=20
-     memset(image_info_buffer, 0, IMAGE_INFO_BUFFER_SIZE);
-=20
--    psa_call(caller, platform_service_handle, PSA_IPC_CALL,
-+    psa_call(caller, TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_I=
OCTL,
- 	     in_vec, IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-=20
-     status =3D unpack_image_info(image_info_buffer, IMAGE_INFO_BUFFER_S=
IZE);
-@@ -288,12 +287,11 @@ static psa_status_t set_image_info(struct rpc_call=
er_interface *caller)
-     return PSA_SUCCESS;
- }
-=20
--void set_fmp_image_info(struct rpc_caller_interface *caller,
--			psa_handle_t platform_service_handle)
-+void set_fmp_image_info(struct rpc_caller_interface *caller)
- {
-     psa_status_t status;
-=20
--    status =3D get_image_info(caller, platform_service_handle);
-+    status =3D get_image_info(caller);
-     if (status !=3D PSA_SUCCESS) {
- 	return;
-     }
-diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.h b/components/service/capsule_update/provider/corstone1000_fmp_=
service.h
-index d0023dc07..486fa10b4 100644
---- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
-+++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
-@@ -16,8 +16,7 @@ extern "C" {
-=20
- void provision_fmp_variables_metadata(struct rpc_caller_interface *call=
er);
-=20
--void set_fmp_image_info(struct rpc_caller_interface *caller,
--		psa_handle_t platform_service_handle);
-+void set_fmp_image_info(struct rpc_caller_interface *caller);
-=20
- #ifdef __cplusplus
- } /* extern "C" */
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 5aaa659d4..fc3a4fb06 100644
---- a/components/service/common/include/psa/sid.h
-+++ b/components/service/common/include/psa/sid.h
-@@ -40,6 +40,13 @@ extern "C" {
- #define TFM_CRYPTO_VERSION                                         (1U)
- #define TFM_CRYPTO_HANDLE                                          (0x4=
0000100U)
-=20
-+/******** TFM_PLATFORM_SERVICE *******/
-+#define TFM_PLATFORM_API_ID_IOCTL         (1013)
-+#define TFM_PLATFORM_SERVICE_HANDLE       (0x40000105U)
-+
-+/**
-+ * \brief Define a progressive numerical value for each SID which can b=
e used
-+ *        when dispatching the requests to the service
- /******** TFM_SP_PLATFORM ********/
- #define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x0=
0000040U)
- #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0011-Align-PSA-Crypto-with-TF-Mv2.1.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/0006-Align-PSA-Crypto-with-TF-Mv2.1.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
011-Align-PSA-Crypto-with-TF-Mv2.1.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
6-Align-PSA-Crypto-with-TF-Mv2.1.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0006-plat-corstone1000-Initialize-capsule-update-provider.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0006-plat-corstone10=
00-Initialize-capsule-update-provider.patch
deleted file mode 100644
index 8b1e44ba..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-pl=
at-corstone1000-Initialize-capsule-update-provider.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 8a6542231613d5f1b60bc209a7ad8f8cf72bc95a Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 29 Nov 2023 15:40:21 +0100
-Subject: [PATCH 06/12] plat: corstone1000: Initialize capsule update pro=
vider
-
-Initializes the capsule update service provider in se-proxy-sp.c deploym=
ent
-for corstone1000.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Inappropriate [Design is to revisted]
----
- .../se-proxy/env/commonsp/se_proxy_sp.c       | 14 +++++++++-
- .../corstone1000/service_proxy_factory.c      | 28 +++++++++++++++++++
- .../se-proxy/infra/service_proxy_factory.h    |  1 +
- 3 files changed, 42 insertions(+), 1 deletion(-)
-
-diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
-index 485d76493..88e4cf17e 100644
---- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
-+++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
-@@ -39,7 +39,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
- 		goto fatal_error;
- 	}
-=20
--	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 5, 16);
-+	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 6, 16);
- 	if (rpc_status !=3D RPC_SUCCESS) {
- 		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
- 		goto fatal_error;
-@@ -94,6 +94,18 @@ void __noreturn sp_main(union ffa_boot_info *boot_inf=
o)
- 		goto fatal_error;
- 	}
-=20
-+	rpc_iface =3D capsule_update_proxy_create();
-+	if (!rpc_iface) {
-+		EMSG("Failed to create Capsule Update proxy");
-+		goto fatal_error;
-+	}
-+
-+	rpc_status =3D ts_rpc_endpoint_sp_add_service(&rpc_endpoint, rpc_iface=
);
-+	if (rpc_status !=3D RPC_SUCCESS) {
-+		EMSG("Failed to add service to RPC endpoint: %d", rpc_status);
-+		goto fatal_error;
-+	}
-+
- 	rpc_iface =3D fwu_proxy_create();
- 	if (!rpc_iface) {
- 		EMSG("Failed to create FWU proxy");
-diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index 759983b46..185a6cd97 100644
---- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-+++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-@@ -11,6 +11,7 @@
- #include <rpc/rse_comms/caller/sp/rse_comms_caller.h>
- #include <service/attestation/provider/attest_provider.h>
- #include <service/attestation/provider/serializer/packed-c/packedc_atte=
st_provider_serializer.h>
-+#include <service/capsule_update/provider/capsule_update_provider.h>
- #include <service/crypto/factory/crypto_provider_factory.h>
- #include "service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h"
- #include "service/fwu/provider/fwu_provider.h"
-@@ -141,3 +142,30 @@ struct rpc_service_interface *fwu_proxy_create(void=
)
-=20
- 	return fwu_provider_init(&fwu_provider, agent);
- }
-+
-+struct rpc_service_interface *capsule_update_proxy_create(void)
-+{
-+	static struct capsule_update_provider capsule_update_provider;
-+	static struct secure_storage_ipc capsule_update_backend;
-+	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
-+
-+	/* Static objects for proxy instance */
-+	static struct rpc_caller_interface rse_comms =3D { 0 };
-+	static struct rpc_caller_session rpc_session =3D { 0 };
-+
-+	rpc_status =3D rse_comms_caller_init(&rse_comms);
-+	if (rpc_status !=3D RPC_SUCCESS)
-+		return NULL;
-+
-+	rpc_status =3D rpc_caller_session_open(&rpc_session, &rse_comms, &dumm=
y_uuid, 0, 0);
-+	if (rpc_status !=3D RPC_SUCCESS)
-+		return NULL;
-+
-+
-+	capsule_update_provider.client.session =3D &rpc_session;
-+	capsule_update_provider.client.rpc_status =3D RPC_SUCCESS;
-+	capsule_update_provider.client.service_info.supported_encodings =3D 0;
-+	capsule_update_provider.client.service_info.max_payload =3D 4096;
-+
-+	return capsule_update_provider_init(&capsule_update_provider);
-+}
-diff --git a/deployments/se-proxy/infra/service_proxy_factory.h b/deploy=
ments/se-proxy/infra/service_proxy_factory.h
-index be83319b8..88b377063 100644
---- a/deployments/se-proxy/infra/service_proxy_factory.h
-+++ b/deployments/se-proxy/infra/service_proxy_factory.h
-@@ -18,6 +18,7 @@ struct rpc_service_interface *crypto_proxy_create(void=
);
- struct rpc_service_interface *ps_proxy_create(void);
- struct rpc_service_interface *its_proxy_create(void);
- struct rpc_service_interface *fwu_proxy_create(void);
-+struct rpc_service_interface *capsule_update_proxy_create(void);
-=20
- #ifdef __cplusplus
- }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0013-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0007-Revert-Load-and-=
store-UEFI-variable-index-in-chunks.patch
similarity index 74%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
013-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
7-Revert-Load-and-store-UEFI-variable-index-in-chunks.patch
index 09fa94fc..176900b5 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Re=
vert-Load-and-store-UEFI-variable-index-in-chunks.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Re=
vert-Load-and-store-UEFI-variable-index-in-chunks.patch
@@ -1,28 +1,29 @@
-From c490956e50e721c8f2db5934ae5af365ba92e55a Mon Sep 17 00:00:00 2001
+From a986e751f6d4ef34bdc3847cfb02e6f24fbb0702 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Mon, 25 Nov 2024 22:13:15 +0100
-Subject: [PATCH 2/3] Revert "Load and store UEFI variable index in chunk=
s"
+Subject: [PATCH 01/12] Revert "Load and store UEFI variable index in chu=
nks"
=20
 This reverts commit a0a08571084238af2a24d4e6e580308f86ab59a2.
 The PSA IPC backend for the Protected Storage doesn't support the option=
al
-create() and set_extended() APIs. This feature has to be reverted becaus=
e=20
+create() and set_extended() APIs. This feature has to be reverted becaus=
e
 of this.
-Keep this inappropriate patch until the usage of create() and set_extend=
ed()=20
+Keep this inappropriate patch until the usage of create() and set_extend=
ed()
 APIs are not optional in the SMM-Gateway.
=20
 Upstream-Status: Inappropriate [To be redesigned]
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
- .../backend/test/variable_store_tests.cpp     | 100 +-----------------
- .../backend/uefi_variable_store.c             |  84 +++------------
+ .../backend/test/variable_store_tests.cpp     | 100 +--------------
+ .../backend/uefi_variable_store.c             | 115 ++++--------------
  deployments/smm-gateway/common/smm_gateway.c  |   4 +
- 3 files changed, 22 insertions(+), 166 deletions(-)
+ 3 files changed, 28 insertions(+), 191 deletions(-)
=20
 diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
store_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_store_tests.cpp
-index e0f21f77a..2a8c8eb94 100644
+index 0f962f20..7c7435fb 100644
 --- a/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
 +++ b/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
-@@ -56,12 +56,6 @@ TEST_GROUP(UefiVariableStoreTests)
+@@ -57,12 +57,6 @@ TEST_GROUP(UefiVariableStoreTests)
  		return var_name;
  	}
 =20
@@ -35,7 +36,7 @@ index e0f21f77a..2a8c8eb94 100644
  	size_t string_get_size_in_bytes(const std::u16string &string)
  	{
  		return string.size() * sizeof(uint16_t);
-@@ -266,9 +260,9 @@ TEST_GROUP(UefiVariableStoreTests)
+@@ -267,9 +261,9 @@ TEST_GROUP(UefiVariableStoreTests)
  						       MAX_VARIABLE_SIZE);
  	}
 =20
@@ -44,14 +45,13 @@ index e0f21f77a..2a8c8eb94 100644
  	static const size_t MAX_VARIABLE_SIZE =3D 3000;
 -	static const size_t STORE_CAPACITY =3D MAX_VARIABLES * MAX_VARIABLE_SI=
ZE;
 +	static const size_t STORE_CAPACITY =3D 10000;
-=20
- 	static const uint32_t OWNER_ID =3D 100;
- 	/*
-@@ -773,93 +767,3 @@ TEST(UefiVariableStoreTests, noRemoveCheck)
- 			      EFI_VARIABLE_NON_VOLATILE);
+ 	static const size_t VARIABLE_INDEX_MAX_SIZE =3D
+ 		sizeof(uint32_t) +
+ 		MAX_VARIABLES * (sizeof(struct variable_metadata) +
+@@ -784,96 +778,6 @@ TEST(UefiVariableStoreTests, noRemoveCheck)
  	UNSIGNED_LONGLONGS_EQUAL(EFI_INVALID_PARAMETER, status);
  }
--
+=20
 -TEST(UefiVariableStoreTests, fillStore)
 -{
 -	efi_status_t status =3D EFI_SUCCESS;
@@ -141,50 +141,77 @@ index e0f21f77a..2a8c8eb94 100644
 -		LONGS_EQUAL(0, input_data.compare(output_data));
 -	}
 -}
+-
+ TEST(UefiVariableStoreTests, variableIndexCounterOverflow)
+ {
+ 	efi_status_t efi_status =3D EFI_SUCCESS;
 diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
-index 459ca4566..e5fc32864 100644
+index 48b81ff3..e90ed172 100644
 --- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-@@ -615,41 +615,26 @@ static efi_status_t load_variable_index(struct uef=
i_variable_store *context)
+@@ -716,59 +716,29 @@ static psa_status_t get_active_variable_uid(struct=
 uefi_variable_store *context,
+ static efi_status_t load_variable_index(struct uefi_variable_store *con=
text)
+ {
+ 	struct storage_backend *persistent_store =3D context->persistent_store=
.storage_backend;
+-	psa_status_t psa_status =3D PSA_SUCCESS;
 =20
  	if (persistent_store) {
  		size_t data_len =3D 0;
 -		size_t data_offset =3D 0;
+-		struct psa_storage_info_t variable_index_info =3D { 0 };
+-
+-		psa_status =3D get_active_variable_uid(context, &context->active_vari=
able_index_uid,
+-						     &context->variable_index.counter);
+-		switch (psa_status) {
+-		case PSA_SUCCESS:
+-			break;
 =20
--		do {
--			psa_status_t psa_status =3D persistent_store->interface->get(
--				persistent_store->context, context->owner_id,
--				SMM_VARIABLE_INDEX_STORAGE_UID, data_offset,
--				RPC_CALLER_SESSION_SHARED_MEMORY_SIZE,
--				context->index_sync_buffer + data_offset, &data_len);
+-		case PSA_ERROR_DOES_NOT_EXIST:
+-			IMSG("Variable index does not exist in NV store, continuing with emp=
ty index");
+-			return EFI_SUCCESS;
 +		psa_status_t psa_status =3D persistent_store->interface->get(
 +			persistent_store->context, context->owner_id,
 +			SMM_VARIABLE_INDEX_STORAGE_UID, 0, context->index_sync_buffer_size,
 +			context->index_sync_buffer, &data_len);
 =20
--			switch (psa_status) {
-+		switch(psa_status) {
- 			case PSA_SUCCESS:
--				data_offset +=3D data_len;
+-		default:
+-			EMSG("Loading variable index failed: %d", psa_status);
+-			return EFI_LOAD_ERROR;
+-		}
 -
--				if (data_offset > context->index_sync_buffer_size) {
--					EMSG("Variable index cannot fit the sync buffer");
--					return EFI_LOAD_ERROR;
--				}
+-		/* Make sure the variable index fits the buffer */
+-		persistent_store->interface->get_info(persistent_store->context, cont=
ext->owner_id,
+-						      context->active_variable_index_uid,
+-						      &variable_index_info);
 -
+-		if (variable_index_info.size > context->index_sync_buffer_size) {
+-			EMSG("Variable index cannot fit the sync buffer");
+-			return EFI_LOAD_ERROR;
+-		}
++		switch(psa_status) {
++			case PSA_SUCCESS:
 +				(void) variable_index_restore(&context->variable_index, data_len,
 +							      context->index_sync_buffer);
- 				break;
++				break;
 =20
- 			case PSA_ERROR_DOES_NOT_EXIST:
- 				IMSG("Index variable does not exist in NV store, continuing with em=
pty index");
--				return EFI_SUCCESS;
+-		do {
+-			psa_status =3D persistent_store->interface->get(
+-				persistent_store->context, context->owner_id,
+-				context->active_variable_index_uid, data_offset,
+-				RPC_CALLER_SESSION_SHARED_MEMORY_SIZE,
+-				context->index_sync_buffer + data_offset, &data_len);
++			case PSA_ERROR_DOES_NOT_EXIST:
++				IMSG("Index variable does not exist in NV store, continuing with em=
pty index");
 +				break;
 =20
- 			default:
+-			if (psa_status !=3D PSA_SUCCESS) {
++			default:
  				EMSG("Loading variable index failed: %d", psa_status);
  				return EFI_LOAD_ERROR;
 -			}
+-
+-			data_offset +=3D data_len;
+-
 -		} while (data_len =3D=3D RPC_CALLER_SESSION_SHARED_MEMORY_SIZE);
 -
 -		variable_index_restore(&context->variable_index, data_offset,
@@ -196,8 +223,8 @@ index 459ca4566..e5fc32864 100644
  	}
 =20
  	return EFI_SUCCESS;
-@@ -658,14 +643,13 @@ static efi_status_t load_variable_index(struct uef=
i_variable_store *context)
- static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context)
+@@ -777,14 +747,13 @@ static efi_status_t load_variable_index(struct uef=
i_variable_store *context)
+ static efi_status_t sync_variable_index(struct uefi_variable_store *con=
text)
  {
  	efi_status_t status =3D EFI_SUCCESS;
 -	psa_status_t psa_status =3D PSA_SUCCESS;
@@ -213,27 +240,29 @@ index 459ca4566..e5fc32864 100644
  	if (status !=3D EFI_SUCCESS)
  		return status;
 =20
-@@ -674,52 +658,16 @@ static efi_status_t sync_variable_index(const stru=
ct uefi_variable_store *contex
+@@ -793,56 +762,16 @@ static efi_status_t sync_variable_index(struct uef=
i_variable_store *context)
  			context->persistent_store.storage_backend;
 =20
  		if (persistent_store) {
 -			size_t data_offset =3D 0;
+-			uint64_t next_index_uid =3D 0;
+-
+-			/* Write the older one */
+-			next_index_uid =3D (context->active_variable_index_uid =3D=3D
+-							  SMM_VARIABLE_INDEX_STORAGE_A_UID ?
+-						  SMM_VARIABLE_INDEX_STORAGE_B_UID :
+-						  SMM_VARIABLE_INDEX_STORAGE_A_UID);
 -
 -			psa_status =3D persistent_store->interface->remove(
-+			psa_status_t psa_status =3D persistent_store->interface->set(
- 				persistent_store->context, context->owner_id,
--				SMM_VARIABLE_INDEX_STORAGE_UID);
+-				persistent_store->context, context->owner_id, next_index_uid);
 -
 -			if (psa_status !=3D PSA_SUCCESS && psa_status !=3D PSA_ERROR_DOES_NO=
T_EXIST)
 -				goto end;
-+				SMM_VARIABLE_INDEX_STORAGE_UID, data_len,
-+				context->index_sync_buffer, PSA_STORAGE_FLAG_NONE);
-=20
+-
 -			/* Check if the index exists and create if not yet */
 -			psa_status =3D persistent_store->interface->create(
--				persistent_store->context, context->owner_id,
--				SMM_VARIABLE_INDEX_STORAGE_UID, remaining_data_len,
--				PSA_STORAGE_FLAG_NONE);
+-				persistent_store->context, context->owner_id, next_index_uid,
+-				remaining_data_len, PSA_STORAGE_FLAG_NONE);
 -
 -			if (psa_status !=3D PSA_SUCCESS)
 -				goto end;
@@ -244,8 +273,7 @@ index 459ca4566..e5fc32864 100644
 -
 -				psa_status =3D persistent_store->interface->set_extended(
 -					persistent_store->context, context->owner_id,
--					SMM_VARIABLE_INDEX_STORAGE_UID, data_offset,
--					data_of_this_iteration,
+-					next_index_uid, data_offset, data_of_this_iteration,
 -					context->index_sync_buffer + data_offset);
 -
 -				if (psa_status !=3D PSA_SUCCESS)
@@ -255,7 +283,11 @@ index 459ca4566..e5fc32864 100644
 -				remaining_data_len -=3D data_of_this_iteration;
 -
 -			} while (remaining_data_len);
--
++			psa_status_t psa_status =3D persistent_store->interface->set(
++				persistent_store->context, context->owner_id,
++				SMM_VARIABLE_INDEX_STORAGE_UID, data_len,
++				context->index_sync_buffer, PSA_STORAGE_FLAG_NONE);
+=20
 -			variable_index_confirm_write(&context->variable_index);
 -			context->active_variable_index_uid =3D next_index_uid;
 -		} else {
@@ -272,7 +304,7 @@ index 459ca4566..e5fc32864 100644
 =20
  /* Check attribute usage rules */
 diff --git a/deployments/smm-gateway/common/smm_gateway.c b/deployments/=
smm-gateway/common/smm_gateway.c
-index 3ab45ccf5..eaa861370 100644
+index 3ab45ccf..eaa86137 100644
 --- a/deployments/smm-gateway/common/smm_gateway.c
 +++ b/deployments/smm-gateway/common/smm_gateway.c
 @@ -40,6 +40,10 @@
@@ -287,5 +319,5 @@ index 3ab45ccf5..eaa861370 100644
   * The SP heap must be large enough for storing the UEFI variable index=
, the RPC shared memory and
   * ~16kB of miscellaneous data.
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0007-plat-corstone1000-add-client_id-for-FMP-service.patch b/meta-arm-bsp=
/recipes-security/trusted-services/corstone1000/0007-plat-corstone1000-ad=
d-client_id-for-FMP-service.patch
deleted file mode 100644
index f56c3578..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-pl=
at-corstone1000-add-client_id-for-FMP-service.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From eddadb001463495307fb33f99e8cb41b9722ace1 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Fri, 5 Apr 2024 17:31:03 +0200
-Subject: [PATCH 07/12] plat: corstone1000: add client_id for FMP service
-
-Corstone1000 uses trusted-firmware-m as secure enclave software componen=
t. Due
-to the changes in TF-M 2.0, psa services requires a seperate client_id n=
ow.
-This commit adds smm-gateway-sp client id to the FMP services since FMP =
structure
-accessed by u-boot via smm-gateway-sp.
-
-Signed-off-by: emeara01 <emekcan.aras@arm.com>
-Upstream-Status: Inappropriate [Design is to revisted]
----
- .../capsule_update/provider/corstone1000_fmp_service.c       | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
-index 2ed0f33c5..58c2cceaf 100644
---- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
-+++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
-@@ -33,6 +33,7 @@
- 	 EFI_VARIABLE_APPEND_WRITE)
-=20
- #define FMP_VARIABLES_COUNT	6
-+#define SMM_GW_SP_ID		0x8003
-=20
- static struct variable_metadata fmp_variables_metadata[FMP_VARIABLES_CO=
UNT] =3D {
-     {
-@@ -91,7 +92,7 @@ static psa_status_t protected_storage_set(struct rpc_c=
aller_interface *caller,
- 		{ .base =3D psa_ptr_to_u32(&create_flags), .len =3D sizeof(create_fla=
gs) },
- 	};
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE, =
TFM_PS_ITS_SET,
-+	psa_status =3D psa_call_client_id(caller, TFM_PROTECTED_STORAGE_SERVIC=
E_HANDLE, SMM_GW_SP_ID,TFM_PS_ITS_SET,
- 			      in_vec, IOVEC_LEN(in_vec), NULL, 0);
- 	if (psa_status < 0)
- 		EMSG("ipc_set: psa_call failed: %d", psa_status);
-@@ -114,7 +115,7 @@ static psa_status_t protected_storage_get(struct rpc=
_caller_interface *caller,
- 		{ .base =3D psa_ptr_to_u32(p_data), .len =3D data_size },
- 	};
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+	psa_status =3D psa_call_client_id(caller, TFM_PROTECTED_STORAGE_SERVIC=
E_HANDLE, SMM_GW_SP_ID,
- 			      TFM_PS_ITS_GET, in_vec, IOVEC_LEN(in_vec),
- 			      out_vec, IOVEC_LEN(out_vec));
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0008-se-proxy-protobuf-change.patch b/meta-arm-bsp/recipes-security/trust=
ed-services/corstone1000/0008-se-proxy-protobuf-change.patch
new file mode 100644
index 00000000..c7ac1614
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-se=
-proxy-protobuf-change.patch
@@ -0,0 +1,71 @@
+From 77dbb98428b0661f0ceee54208d226fc7fb27130 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Sun, 1 Jun 2025 11:06:00 +0000
+Subject: [PATCH 02/11] se proxy protobuf change
+
+Upstream-Status: Pending (not yet submitted to upstream)
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../se-proxy/env/commonsp/se_proxy_sp.c       | 24 ++++++++++++++++++-
+ 1 file changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
+index 485d7649..9f94092b 100644
+--- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
++++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
+@@ -13,6 +13,7 @@
+ #include "trace.h"
+ #include "deployments/se-proxy/infra/service_proxy_factory.h"
+ #include "deployments/se-proxy/se_proxy_interfaces.h"
++#include <service/crypto/factory/crypto_provider_factory.h>
+=20
+ static bool sp_init(uint16_t *own_sp_id);
+=20
+@@ -25,6 +26,8 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
+ 	uint16_t own_id =3D 0;
+ 	sp_result result =3D SP_RESULT_INTERNAL_ERROR;
+ 	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
++       struct rpc_service_interface *crypto_iface_protobuf =3D NULL;
++       struct crypto_provider *crypto_protobuf_provider =3D NULL;
+=20
+ 	/* Boot phase */
+ 	if (!sp_init(&own_id)) {
+@@ -39,7 +42,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
+ 		goto fatal_error;
+ 	}
+=20
+-	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 5, 16);
++	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 6, 16);
+ 	if (rpc_status !=3D RPC_SUCCESS) {
+ 		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
+ 		goto fatal_error;
+@@ -106,6 +109,25 @@ void __noreturn sp_main(union ffa_boot_info *boot_i=
nfo)
+ 		goto fatal_error;
+ 	}
+=20
++       crypto_protobuf_provider =3D crypto_protobuf_provider_factory_cr=
eate();
++       if (!crypto_protobuf_provider) {
++               EMSG("Failed to create crypto protobuf provider factory"=
);
++               goto fatal_error;
++       }
++
++       crypto_iface_protobuf =3D service_provider_get_rpc_interface(
++               &crypto_protobuf_provider->base_provider);
++       if (!crypto_iface_protobuf) {
++               EMSG("Failed to create service provider RPC interface");
++               goto fatal_error;
++       }
++
++       rpc_status =3D ts_rpc_endpoint_sp_add_service(&rpc_endpoint, cry=
pto_iface_protobuf);
++       if (rpc_status !=3D RPC_SUCCESS) {
++               EMSG("Failed to add service to RPC endpoint: %d", rpc_st=
atus);
++               goto fatal_error;
++       }
++
+ 	/* End of boot phase */
+ 	result =3D sp_msg_wait(&req_msg);
+ 	if (result !=3D SP_RESULT_OK) {
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0017-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0009-Platform-Corsto=
ne1000-Add-PLATFORM_IS_FVP-toggle-for.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
017-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
9-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0018-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch b/meta-arm-b=
sp/recipes-security/trusted-services/corstone1000/0010-Integrate-PSA-FWU-=
IPC-framework-for-Corstone-1000.patch
similarity index 97%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
018-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
0-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch
index 2c2bb428..4a80e6b3 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-In=
tegrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-In=
tegrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch
@@ -1,7 +1,7 @@
-From fcc7701baf4246e5ceebe4d50db223cb70a0c00f Mon Sep 17 00:00:00 2001
+From f385ddacc8cc62842f7c9c91622d59959c41e718 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 28 Nov 2024 12:02:28 +0000
-Subject: [PATCH 1/8] Integrate PSA FWU IPC framework for Corstone-1000
+Subject: [PATCH 04/11] Integrate PSA FWU IPC framework for Corstone-1000
=20
 Integrate IPC framework for PSA FWU calls between Cortex-A side and Cort=
ex-M subsystems.
=20
@@ -26,7 +26,7 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  create mode 100644 components/service/fwu/psa_fwu_m/interface/psa_ipc/p=
sa_fwu_ipc.h
=20
 diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index fc3a4fb0..4830f438 100644
+index 5aaa659d..0235764d 100644
 --- a/components/service/common/include/psa/sid.h
 +++ b/components/service/common/include/psa/sid.h
 @@ -1,5 +1,5 @@
@@ -36,7 +36,7 @@ index fc3a4fb0..4830f438 100644
   *
   * SPDX-License-Identifier: BSD-3-Clause
   *
-@@ -65,6 +65,10 @@ extern "C" {
+@@ -58,6 +58,10 @@ extern "C" {
  #define TFM_ATTEST_GET_TOKEN_SIZE  1002
 =20
  /******** TFM_SP_FWU ********/
@@ -381,7 +381,7 @@ index 00000000..867a1c9c
 +#endif /* PSA_FWU_IPC_H */
 +
 diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
-index 27af8a33..0b04149a 100644
+index 3830f9d6..2bf6b36e 100644
 --- a/deployments/se-proxy/infra/corstone1000/infra.cmake
 +++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
 @@ -26,7 +26,7 @@ add_components(TARGET "se-proxy"
@@ -390,14 +390,14 @@ index 27af8a33..0b04149a 100644
  		"components/service/fwu/psa_fwu_m/agent"
 -		"components/service/fwu/psa_fwu_m/interface/stub"
 +		"components/service/fwu/psa_fwu_m/interface/psa_ipc"
- 		"components/service/capsule_update/provider"
  		"components/service/secure_storage/backend/secure_storage_ipc"
  )
+=20
 diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index 8872abcb..ef91efe0 100644
+index 759983b4..547e84bc 100644
 --- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
 +++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-@@ -15,6 +15,7 @@
+@@ -14,6 +14,7 @@
  #include <service/crypto/factory/crypto_provider_factory.h>
  #include "service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h"
  #include "service/fwu/provider/fwu_provider.h"
@@ -405,7 +405,7 @@ index 8872abcb..ef91efe0 100644
  #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
  #include "service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_uuid.h"
  #include <trace.h>
-@@ -135,10 +136,25 @@ struct rpc_service_interface *its_proxy_create(voi=
d)
+@@ -134,10 +135,25 @@ struct rpc_service_interface *its_proxy_create(voi=
d)
 =20
  struct rpc_service_interface *fwu_proxy_create(void)
  {
@@ -432,5 +432,5 @@ index 8872abcb..ef91efe0 100644
  	return fwu_provider_init(&fwu_provider, agent);
  }
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0019-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0011-Load-initial-imag=
e-state-in-PSA-FWU-M-update-agent.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
019-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
1-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0020-Corstone1000-Define-PSA-FWU-image-mapping-structure.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0012-Corstone1000-Def=
ine-PSA-FWU-image-mapping-structure.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
020-Corstone1000-Define-PSA-FWU-image-mapping-structure.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
2-Corstone1000-Define-PSA-FWU-image-mapping-structure.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0012-Revert-Make-variable-index-usage-robust-with-redunda.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0012-Revert-Make-var=
iable-index-usage-robust-with-redunda.patch
deleted file mode 100644
index 8b5f062f..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-Re=
vert-Make-variable-index-usage-robust-with-redunda.patch
+++ /dev/null
@@ -1,716 +0,0 @@
-From f0c1c15fc8886349f7aeb04e1328472894b674d7 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Mon, 25 Nov 2024 22:11:33 +0100
-Subject: [PATCH 1/3] Revert "Make variable index usage robust with redun=
dancy"
-
-This reverts commit 8e394bbfae1dccf86a6a5428471e1b10fdaa74ec.
-This revert is needed because the FMP support added for Corstone-1000 on=
ly=20
-works if the SMM_VARIABLE_INDEX_STORAGE_UID is 0x787. See the implementa=
tion=20
-in the 0003-FMP-Support-in-Corstone1000.patch file.
-
-The 0003-FMP-Support-in-Corstone1000.patch is also inappropriate and wil=
l be
-redesigned. Instead of fixing that patch, revert this redundancy feature=
 until
-the FMP support is redesigned.
-
-Upstream-Status: Inappropriate [To be removed after new FWU design]
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
----
- .../backend/test/variable_index_tests.cpp     |  50 ++---
- .../backend/test/variable_store_tests.cpp     | 166 ----------------
- .../backend/uefi_variable_store.c             | 181 +++---------------
- .../backend/uefi_variable_store.h             |   1 -
- .../smm_variable/backend/variable_index.c     |  29 +--
- .../smm_variable/backend/variable_index.h     |   3 +-
- 6 files changed, 46 insertions(+), 384 deletions(-)
-
-diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
index_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_index_tests.cpp
-index cf0f6a12e..a52cfbf76 100644
---- a/components/service/uefi/smm_variable/backend/test/variable_index_t=
ests.cpp
-+++ b/components/service/uefi/smm_variable/backend/test/variable_index_t=
ests.cpp
-@@ -208,8 +208,7 @@ TEST(UefiVariableIndexTests, enumerateStore)
-=20
- TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
- {
--	uint8_t buffer[sizeof(uint32_t) +
--		       MAX_VARIABLES * (sizeof(struct variable_metadata) + sizeof(boo=
l))];
-+	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
-=20
- 	create_variables();
-=20
-@@ -223,13 +222,7 @@ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
-=20
- 	CHECK_TRUE(is_dirty);
- 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
--	/*
--	 * Variable index counter is at the beginning, which is followed by me=
tadata and
--	 * constraint status byte of both NV variables
--	 */
--	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t) +
--				     ((sizeof(struct variable_metadata) + sizeof(bool)) * 2),
--			     dump_len);
-+	UNSIGNED_LONGS_EQUAL(((sizeof(struct variable_metadata) + sizeof(bool)=
) * 2), dump_len);
-=20
- 	/* Expect no records to be dirty when the dump is repeated */
- 	dump_len =3D 0;
-@@ -238,9 +231,7 @@ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
-=20
- 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
- 	CHECK_FALSE(is_dirty);
--	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t) +
--				     ((sizeof(struct variable_metadata) + sizeof(bool)) * 2),
--			     dump_len);
-+	UNSIGNED_LONGS_EQUAL(((sizeof(struct variable_metadata) + sizeof(bool)=
) * 2), dump_len);
-=20
- 	/* Tear down and reinitialize to simulate a reboot */
- 	variable_index_deinit(&m_variable_index);
-@@ -279,8 +270,7 @@ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
-=20
- TEST(UefiVariableIndexTests, dumpLoadConstrainedVariable)
- {
--	uint8_t buffer[sizeof(uint32_t) +
--		       MAX_VARIABLES * (sizeof(struct variable_metadata) + sizeof(boo=
l))];
-+	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
-=20
- 	create_variables();
-=20
-@@ -314,13 +304,8 @@ TEST(UefiVariableIndexTests, dumpLoadConstrainedVar=
iable)
- 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
- 	CHECK_TRUE(is_dirty);
-=20
--	/*
--	 * Variable index counter is at the beginning, which is followed by me=
tadata and
--	 * constraint status byte of both NV variables, but only one of them h=
as
--	 * constraints
--	 */
--	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t) +
--				     (sizeof(struct variable_metadata) + sizeof(bool)) * 2 +
-+	/* metadata and constraint status byte are stored for both NV variable=
s, but only one of them has constraints */
-+	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) + sizeof(bool))=
 * 2 +
- 				     sizeof(struct variable_constraints),
- 			     dump_len);
-=20
-@@ -331,11 +316,7 @@ TEST(UefiVariableIndexTests, dumpLoadConstrainedVar=
iable)
-=20
- TEST(UefiVariableIndexTests, dumpBufferTooSmall)
- {
--	/*
--	 * Enough to fit the variable index counter and the metadata and const=
raint
--	 * status of a single variable
--	 */
--	uint8_t buffer[sizeof(uint32_t) + sizeof(struct variable_metadata) + s=
izeof(bool)];
-+	uint8_t buffer[1 * sizeof(struct variable_metadata) + 1];
-=20
- 	create_variables();
-=20
-@@ -357,8 +338,7 @@ TEST(UefiVariableIndexTests, dumpBufferTooSmall)
-=20
- TEST(UefiVariableIndexTests, removeVariable)
- {
--	uint8_t buffer[sizeof(uint32_t) +
--		       MAX_VARIABLES * (sizeof(struct variable_metadata) + sizeof(boo=
l))];
-+	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
- 	struct variable_info *info =3D NULL;
-=20
- 	create_variables();
-@@ -378,12 +358,7 @@ TEST(UefiVariableIndexTests, removeVariable)
-=20
- 	CHECK_TRUE(is_dirty);
- 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
--	/*
--	 * Dump to now contains the variable index counter and metadata,
--	 * constraint status data of a variable
--	 */
--	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t) + sizeof(struct variable_metadat=
a) + sizeof(bool),
--			     dump_len);
-+	UNSIGNED_LONGS_EQUAL(sizeof(struct variable_metadata) + sizeof(bool), =
dump_len);
-=20
- 	/* Remove the volatile variable */
- 	info =3D variable_index_find(&m_variable_index, &guid_1, string_get_si=
ze_in_bytes(name_1),
-@@ -398,8 +373,7 @@ TEST(UefiVariableIndexTests, removeVariable)
-=20
- 	CHECK_FALSE(is_dirty);
- 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
--	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t) + sizeof(struct variable_metadat=
a) + sizeof(bool),
--			     dump_len);
-+	UNSIGNED_LONGS_EQUAL(sizeof(struct variable_metadata) + sizeof(bool), =
dump_len);
-=20
- 	/* Remove the remaining NV variable */
- 	info =3D variable_index_find(&m_variable_index, &guid_1, string_get_si=
ze_in_bytes(name_3),
-@@ -407,14 +381,14 @@ TEST(UefiVariableIndexTests, removeVariable)
-=20
- 	variable_index_clear_variable(&m_variable_index, info);
-=20
--	/* Expect index to be dirty and dump to now contains only the variable=
 index counter */
-+	/* Expect index to be dirty and dump to now be empty */
- 	dump_len =3D 0;
- 	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
- 				     &is_dirty);
-=20
- 	CHECK_TRUE(is_dirty);
- 	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
--	UNSIGNED_LONGS_EQUAL(sizeof(uint32_t), dump_len);
-+	UNSIGNED_LONGS_EQUAL(0, dump_len);
-=20
- 	/* Enumerate and now expect an empty index */
- 	info =3D NULL;
-diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
store_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_store_tests.cpp
-index 0f962f206..e0f21f77a 100644
---- a/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
-+++ b/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
-@@ -5,7 +5,6 @@
-  */
-=20
- #include <CppUTest/TestHarness.h>
--#include <limits>
- #include <service/secure_storage/backend/mock_store/mock_store.h>
- #include <service/uefi/smm_variable/backend/uefi_variable_store.h>
- #include <string.h>
-@@ -270,17 +269,8 @@ TEST_GROUP(UefiVariableStoreTests)
- 	static const size_t MAX_VARIABLES =3D 5;
- 	static const size_t MAX_VARIABLE_SIZE =3D 3000;
- 	static const size_t STORE_CAPACITY =3D MAX_VARIABLES * MAX_VARIABLE_SI=
ZE;
--	static const size_t VARIABLE_INDEX_MAX_SIZE =3D
--		sizeof(uint32_t) +
--		MAX_VARIABLES * (sizeof(struct variable_metadata) +
--				 sizeof(struct variable_constraints) + sizeof(bool));
-=20
- 	static const uint32_t OWNER_ID =3D 100;
--
--	/* Synchronize these with the variables with the store */
--	uint64_t DEFAULT_VARIABLE_INDEX_STORAGE_A_UID =3D 0x8000000000000001;
--	uint64_t DEFAULT_VARIABLE_INDEX_STORAGE_B_UID =3D 0x8000000000000002;
--
- 	/*
- 	 * Make sure the variable buffer in the test is way above the limit
- 	 * so the buffer problems will be handled by the component
-@@ -873,159 +863,3 @@ TEST(UefiVariableStoreTests, fillIndex)
- 		LONGS_EQUAL(0, input_data.compare(output_data));
- 	}
- }
--
--TEST(UefiVariableStoreTests, variableIndexCounterOverflow)
--{
--	efi_status_t efi_status =3D EFI_SUCCESS;
--	psa_status_t psa_status =3D PSA_SUCCESS;
--	std::u16string var_name =3D u"var";
--	std::string input_data =3D "a";
--	uint32_t attributes =3D EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTS=
ERVICE_ACCESS |
--			      EFI_VARIABLE_RUNTIME_ACCESS;
--	/* There are no variables set in the index, only the counter is there =
*/
--	uint8_t buffer[sizeof(uint32_t)] =3D { 0 };
--
--	mock_store_reset(&m_persistent_store);
--
--	/* Counter of index A is 0 */
--	psa_status =3D m_persistent_store.backend.interface->set(
--		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_A_UID,
--		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
--	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, psa_status);
--
--	/* Set max counter value */
--	buffer[0] =3D 0xFF;
--	buffer[1] =3D 0xFF;
--	buffer[2] =3D 0xFF;
--	buffer[3] =3D 0xFF;
--
--	/* Counter of index B is max value */
--	psa_status =3D m_persistent_store.backend.interface->set(
--		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_B_UID,
--		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
--	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, psa_status);
--
--	/* At next initialization of the store index A should be the latest in=
dex with counter value 0 */
--	uefi_variable_store_deinit(&m_uefi_variable_store);
--
--	efi_status =3D uefi_variable_store_init(&m_uefi_variable_store, OWNER_=
ID, MAX_VARIABLES,
--					      m_persistent_backend, m_volatile_backend);
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
--
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
--				 DEFAULT_VARIABLE_INDEX_STORAGE_A_UID);
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 0);
--
--	/* After setting a variable to trigger sync and rebooting index B shou=
ld be the latest index with counter value 1*/
--	efi_status =3D set_variable(var_name, input_data, attributes);
--	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
--
--	power_cycle();
--
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
--				 DEFAULT_VARIABLE_INDEX_STORAGE_B_UID);
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 1);
--}
--
--TEST(UefiVariableStoreTests, oneEmptyVariableIndexExists)
--{
--	psa_status_t status =3D PSA_SUCCESS;
--
--	/* Only, variable index A exists, but it is empty */
--	mock_store_reset(&m_persistent_store);
--
--	status =3D m_persistent_store.backend.interface->create(m_persistent_s=
tore.backend.context,
--							      OWNER_ID,
--							      DEFAULT_VARIABLE_INDEX_STORAGE_A_UID,
--							      100, PSA_STORAGE_FLAG_NONE);
--	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, status);
--
--	power_cycle();
--
--	/* Empty index is considered non-existing so default index (A) is sele=
cted */
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
--				 DEFAULT_VARIABLE_INDEX_STORAGE_A_UID);
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 0);
--
--	/* Only, variable index B exists, but it is empty*/
--	mock_store_reset(&m_persistent_store);
--
--	status =3D m_persistent_store.backend.interface->create(m_persistent_s=
tore.backend.context,
--							      OWNER_ID,
--							      DEFAULT_VARIABLE_INDEX_STORAGE_B_UID,
--							      100, PSA_STORAGE_FLAG_NONE);
--	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, status);
--
--	power_cycle();
--
--	/* Empty index is considered non-existing so default index (A) is sele=
cted */
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
--				 DEFAULT_VARIABLE_INDEX_STORAGE_A_UID);
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 0);
--}
--
--TEST(UefiVariableStoreTests, oneVariableIndexAlreadySet)
--{
--	efi_status_t status =3D EFI_SUCCESS;
--	/* Empty variable index with zero counter value */
--	uint8_t buffer[VARIABLE_INDEX_MAX_SIZE] =3D { 0 };
--
--	/* Set index A in the store with some data, so it will be found as the=
 currently active index */
--	mock_store_reset(&m_persistent_store);
--
--	status =3D m_persistent_store.backend.interface->set(
--		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_A_UID,
--		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
--	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, status);
--
--	power_cycle();
--
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
--				 DEFAULT_VARIABLE_INDEX_STORAGE_A_UID);
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 0);
--
--	/* Set index B in the store with some data, so it will be found as the=
 currently active index */
--	mock_store_reset(&m_persistent_store);
--
--	status =3D m_persistent_store.backend.interface->set(
--		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_B_UID,
--		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
--	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, status);
--
--	power_cycle();
--
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.active_variable_index_u=
id,
--				 DEFAULT_VARIABLE_INDEX_STORAGE_B_UID);
--	UNSIGNED_LONGLONGS_EQUAL(m_uefi_variable_store.variable_index.counter,=
 0);
--}
--
--TEST(UefiVariableStoreTests, variableIndexesWithSameData)
--{
--	psa_status_t psa_status =3D PSA_SUCCESS;
--	efi_status_t efi_status =3D EFI_SUCCESS;
--	/* Empty variable index with zero counter value */
--	uint8_t buffer[VARIABLE_INDEX_MAX_SIZE] =3D { 0 };
--
--	/* Set both indexes to the same data and counter value */
--	mock_store_reset(&m_persistent_store);
--
--	psa_status =3D m_persistent_store.backend.interface->set(
--		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_A_UID,
--		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
--	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, psa_status);
--
--	psa_status =3D m_persistent_store.backend.interface->set(
--		m_persistent_store.backend.context, OWNER_ID, DEFAULT_VARIABLE_INDEX_=
STORAGE_B_UID,
--		sizeof(buffer), &buffer, PSA_STORAGE_FLAG_NONE);
--	UNSIGNED_LONGLONGS_EQUAL(PSA_SUCCESS, psa_status);
--
--	/*
--	 * Initializing the store should fail, because if there are two indexe=
s with the same counter it cannot be decided
--	 * which has the valid data.
--	 */
--	uefi_variable_store_deinit(&m_uefi_variable_store);
--
--	efi_status =3D uefi_variable_store_init(&m_uefi_variable_store, OWNER_=
ID, MAX_VARIABLES,
--					      m_persistent_backend, m_volatile_backend);
--	UNSIGNED_LONGLONGS_EQUAL(EFI_LOAD_ERROR, efi_status);
--}
-diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
-index 48b81ff37..459ca4566 100644
---- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-@@ -28,12 +28,9 @@
- #include "service/crypto/client/psa/crypto_client.h"
- #endif
-=20
--static psa_status_t get_active_variable_uid(struct uefi_variable_store =
*context,
--					    uint64_t *active_index_uid, uint32_t *counter);
--
- static efi_status_t load_variable_index(struct uefi_variable_store *con=
text);
-=20
--static efi_status_t sync_variable_index(struct uefi_variable_store *con=
text);
-+static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context);
-=20
- static efi_status_t check_capabilities(const SMM_VARIABLE_COMMUNICATE_A=
CCESS_VARIABLE *var);
-=20
-@@ -138,14 +135,6 @@ static bool compare_name_to_key_store_name(const in=
t16_t *name1, size_t size1,
- 					   const uint16_t *name2, size_t size2);
- #endif
-=20
--/* Private UID for storing the variable index */
--#define SMM_VARIABLE_INDEX_STORAGE_A_UID UINT64_C(0x8000000000000001)
--#define SMM_VARIABLE_INDEX_STORAGE_B_UID UINT64_C(0x8000000000000002)
--
--_Static_assert(SMM_VARIABLE_INDEX_STORAGE_A_UID !=3D SMM_VARIABLE_INDEX=
_STORAGE_B_UID,
--	       "SMM_VARIABLE_INDEX_STORAGE_A_UID must not be the same value as=
 "
--	       "SMM_VARIABLE_INDEX_STORAGE_B_UID");
--
- /* Default maximum variable size -
-  * may be overridden using uefi_variable_store_set_storage_limits()
-  */
-@@ -398,7 +387,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
- 		 * index entry.
- 		 */
- 		if (should_sync_index)
--			status =3D sync_variable_index((struct uefi_variable_store *)context=
);
-+			status =3D sync_variable_index(context);
-=20
- 		/* Store any variable data to the storage backend with the updated me=
tadata */
- 		if (info->is_variable_set && (status =3D=3D EFI_SUCCESS)) {
-@@ -620,148 +609,40 @@ efi_status_t uefi_variable_store_get_var_check_pr=
operty(
- 	return status;
- }
-=20
--/* Checks which index contains the latest data, which shall be loaded *=
/
--static psa_status_t get_active_variable_uid(struct uefi_variable_store =
*context,
--					    uint64_t *active_index_uid, uint32_t *counter)
--{
--	uint32_t counter_A =3D 0;
--	uint32_t counter_B =3D 0;
--	size_t data_len =3D 0;
--	psa_status_t psa_status_A =3D PSA_SUCCESS;
--	psa_status_t psa_status_B =3D PSA_SUCCESS;
--	struct storage_backend *persistent_store =3D context->persistent_store=
.storage_backend;
--
--	/* Set default value for the case when the index does not exist yet */
--	*active_index_uid =3D SMM_VARIABLE_INDEX_STORAGE_A_UID;
--	*counter =3D 0;
--
--	if (persistent_store) {
--		psa_status_A =3D persistent_store->interface->get(persistent_store->c=
ontext,
--								context->owner_id,
--								SMM_VARIABLE_INDEX_STORAGE_A_UID, 0,
--								sizeof(counter_A), &counter_A,
--								&data_len);
--
--		if (psa_status_A =3D=3D PSA_SUCCESS && data_len =3D=3D 0) {
--			psa_status_A =3D persistent_store->interface->remove(
--				persistent_store->context, context->owner_id,
--				SMM_VARIABLE_INDEX_STORAGE_A_UID);
--
--			if (psa_status_A =3D=3D PSA_SUCCESS)
--				psa_status_A =3D PSA_ERROR_DOES_NOT_EXIST;
--			else {
--				EMSG("Erronous state of variable index");
--				return PSA_ERROR_STORAGE_FAILURE;
--			}
--		}
--
--		psa_status_B =3D persistent_store->interface->get(persistent_store->c=
ontext,
--								context->owner_id,
--								SMM_VARIABLE_INDEX_STORAGE_B_UID, 0,
--								sizeof(counter_B), &counter_B,
--								&data_len);
--
--		if (psa_status_B =3D=3D PSA_SUCCESS && data_len =3D=3D 0) {
--			psa_status_B =3D persistent_store->interface->remove(
--				persistent_store->context, context->owner_id,
--				SMM_VARIABLE_INDEX_STORAGE_B_UID);
--
--			if (psa_status_B =3D=3D PSA_SUCCESS)
--				psa_status_B =3D PSA_ERROR_DOES_NOT_EXIST;
--			else {
--				EMSG("Erronous state of variable index");
--				return PSA_ERROR_STORAGE_FAILURE;
--			}
--		}
--
--		if ((psa_status_A !=3D PSA_SUCCESS && psa_status_A !=3D PSA_ERROR_DOE=
S_NOT_EXIST) ||
--		    (psa_status_B !=3D PSA_SUCCESS && psa_status_B !=3D PSA_ERROR_DOE=
S_NOT_EXIST))
--			return PSA_ERROR_STORAGE_FAILURE;
--
--		if (psa_status_A =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
--			if (psa_status_B =3D=3D PSA_ERROR_DOES_NOT_EXIST)
--				return PSA_ERROR_DOES_NOT_EXIST;
--
--			*active_index_uid =3D SMM_VARIABLE_INDEX_STORAGE_B_UID;
--			*counter =3D counter_B;
--
--			return PSA_SUCCESS;
--		} else if (psa_status_B =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
--			*active_index_uid =3D SMM_VARIABLE_INDEX_STORAGE_A_UID;
--			*counter =3D counter_A;
--
--			return PSA_SUCCESS;
--		}
--
--		if (counter_A + 1 =3D=3D counter_B) {
--			*active_index_uid =3D SMM_VARIABLE_INDEX_STORAGE_B_UID;
--			*counter =3D counter_B;
--			return PSA_SUCCESS;
--		} else if (counter_B + 1 =3D=3D counter_A) {
--			*active_index_uid =3D SMM_VARIABLE_INDEX_STORAGE_A_UID;
--			*counter =3D counter_A;
--			return PSA_SUCCESS;
--		} else {
--			EMSG("UEFI metadata variable index is invalid.");
--			return PSA_ERROR_STORAGE_FAILURE;
--		}
--	} else {
--		EMSG("Store backend is not accessible");
--		return PSA_ERROR_STORAGE_FAILURE;
--	}
--
--	return PSA_ERROR_STORAGE_FAILURE;
--}
--
- static efi_status_t load_variable_index(struct uefi_variable_store *con=
text)
- {
- 	struct storage_backend *persistent_store =3D context->persistent_store=
.storage_backend;
--	psa_status_t psa_status =3D PSA_SUCCESS;
-=20
- 	if (persistent_store) {
- 		size_t data_len =3D 0;
- 		size_t data_offset =3D 0;
--		struct psa_storage_info_t variable_index_info =3D { 0 };
--
--		psa_status =3D get_active_variable_uid(context, &context->active_vari=
able_index_uid,
--						     &context->variable_index.counter);
--		switch (psa_status) {
--		case PSA_SUCCESS:
--			break;
--
--		case PSA_ERROR_DOES_NOT_EXIST:
--			IMSG("Variable index does not exist in NV store, continuing with emp=
ty index");
--			return EFI_SUCCESS;
--
--		default:
--			EMSG("Loading variable index failed: %d", psa_status);
--			return EFI_LOAD_ERROR;
--		}
--
--		/* Make sure the variable index fits the buffer */
--		persistent_store->interface->get_info(persistent_store->context, cont=
ext->owner_id,
--						      context->active_variable_index_uid,
--						      &variable_index_info);
--
--		if (variable_index_info.size > context->index_sync_buffer_size) {
--			EMSG("Variable index cannot fit the sync buffer");
--			return EFI_LOAD_ERROR;
--		}
-=20
- 		do {
--			psa_status =3D persistent_store->interface->get(
-+			psa_status_t psa_status =3D persistent_store->interface->get(
- 				persistent_store->context, context->owner_id,
--				context->active_variable_index_uid, data_offset,
-+				SMM_VARIABLE_INDEX_STORAGE_UID, data_offset,
- 				RPC_CALLER_SESSION_SHARED_MEMORY_SIZE,
- 				context->index_sync_buffer + data_offset, &data_len);
-=20
--			if (psa_status !=3D PSA_SUCCESS) {
-+			switch (psa_status) {
-+			case PSA_SUCCESS:
-+				data_offset +=3D data_len;
-+
-+				if (data_offset > context->index_sync_buffer_size) {
-+					EMSG("Variable index cannot fit the sync buffer");
-+					return EFI_LOAD_ERROR;
-+				}
-+
-+				break;
-+
-+			case PSA_ERROR_DOES_NOT_EXIST:
-+				IMSG("Index variable does not exist in NV store, continuing with em=
pty index");
-+				return EFI_SUCCESS;
-+
-+			default:
- 				EMSG("Loading variable index failed: %d", psa_status);
- 				return EFI_LOAD_ERROR;
- 			}
--
--			data_offset +=3D data_len;
--
- 		} while (data_len =3D=3D RPC_CALLER_SESSION_SHARED_MEMORY_SIZE);
-=20
- 		variable_index_restore(&context->variable_index, data_offset,
-@@ -774,7 +655,7 @@ static efi_status_t load_variable_index(struct uefi_=
variable_store *context)
- 	return EFI_SUCCESS;
- }
-=20
--static efi_status_t sync_variable_index(struct uefi_variable_store *con=
text)
-+static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context)
- {
- 	efi_status_t status =3D EFI_SUCCESS;
- 	psa_status_t psa_status =3D PSA_SUCCESS;
-@@ -794,24 +675,19 @@ static efi_status_t sync_variable_index(struct uef=
i_variable_store *context)
-=20
- 		if (persistent_store) {
- 			size_t data_offset =3D 0;
--			uint64_t next_index_uid =3D 0;
--
--			/* Write the older one */
--			next_index_uid =3D (context->active_variable_index_uid =3D=3D
--							  SMM_VARIABLE_INDEX_STORAGE_A_UID ?
--						  SMM_VARIABLE_INDEX_STORAGE_B_UID :
--						  SMM_VARIABLE_INDEX_STORAGE_A_UID);
-=20
- 			psa_status =3D persistent_store->interface->remove(
--				persistent_store->context, context->owner_id, next_index_uid);
-+				persistent_store->context, context->owner_id,
-+				SMM_VARIABLE_INDEX_STORAGE_UID);
-=20
- 			if (psa_status !=3D PSA_SUCCESS && psa_status !=3D PSA_ERROR_DOES_NO=
T_EXIST)
- 				goto end;
-=20
- 			/* Check if the index exists and create if not yet */
- 			psa_status =3D persistent_store->interface->create(
--				persistent_store->context, context->owner_id, next_index_uid,
--				remaining_data_len, PSA_STORAGE_FLAG_NONE);
-+				persistent_store->context, context->owner_id,
-+				SMM_VARIABLE_INDEX_STORAGE_UID, remaining_data_len,
-+				PSA_STORAGE_FLAG_NONE);
-=20
- 			if (psa_status !=3D PSA_SUCCESS)
- 				goto end;
-@@ -822,7 +698,8 @@ static efi_status_t sync_variable_index(struct uefi_=
variable_store *context)
-=20
- 				psa_status =3D persistent_store->interface->set_extended(
- 					persistent_store->context, context->owner_id,
--					next_index_uid, data_offset, data_of_this_iteration,
-+					SMM_VARIABLE_INDEX_STORAGE_UID, data_offset,
-+					data_of_this_iteration,
- 					context->index_sync_buffer + data_offset);
-=20
- 				if (psa_status !=3D PSA_SUCCESS)
-@@ -1827,7 +1704,7 @@ static void purge_orphan_index_entries(const struc=
t uefi_variable_store *context
- 	}
-=20
- 	if (any_orphans)
--		sync_variable_index((struct uefi_variable_store *)context);
-+		sync_variable_index(context);
- }
-=20
- static struct delegate_variable_store *
-diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.h b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.h
-index 9f2c4a00c..2493ff6b4 100644
---- a/components/service/uefi/smm_variable/backend/uefi_variable_store.h
-+++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.h
-@@ -52,7 +52,6 @@ struct uefi_variable_store {
- 	uint32_t owner_id;
- 	uint8_t *index_sync_buffer;
- 	size_t index_sync_buffer_size;
--	uint64_t active_variable_index_uid;
- 	struct variable_index variable_index;
- 	struct delegate_variable_store persistent_store;
- 	struct delegate_variable_store volatile_store;
-diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.c b/components/service/uefi/smm_variable/backend/variable_index.c
-index 90230426f..5fb6d08c5 100644
---- a/components/service/uefi/smm_variable/backend/variable_index.c
-+++ b/components/service/uefi/smm_variable/backend/variable_index.c
-@@ -91,7 +91,6 @@ static struct variable_entry *containing_entry(const s=
truct variable_info *info)
- efi_status_t variable_index_init(struct variable_index *context, size_t=
 max_variables)
- {
- 	context->max_variables =3D max_variables;
--	context->counter =3D 0;
- 	context->entries =3D
- 		(struct variable_entry *)malloc(sizeof(struct variable_entry) * max_v=
ariables);
-=20
-@@ -109,9 +108,9 @@ void variable_index_deinit(struct variable_index *co=
ntext)
-=20
- size_t variable_index_max_dump_size(struct variable_index *context)
- {
--	return sizeof(context->counter) + (sizeof(struct variable_metadata) + =
sizeof(bool) +
--					   sizeof(struct variable_constraints)) *
--						  context->max_variables;
-+	return (sizeof(struct variable_metadata) + sizeof(bool) +
-+		sizeof(struct variable_constraints)) *
-+	       context->max_variables;
- }
-=20
- struct variable_info *variable_index_find(const struct variable_index *=
context,
-@@ -288,16 +287,6 @@ efi_status_t variable_index_dump(const struct varia=
ble_index *context, size_t bu
- 	*data_len =3D 0;
- 	*any_dirty =3D false;
-=20
--	/*
--	 * Intentionally letting the counter overflow.
--	 * The buffer (index_sync_buffer) is provided by malloc, which allocat=
es memory to a boundary
--	 * suitable for any default data type of the system (e.g uint32_t)
--	 */
--	*((uint32_t *)dump_pos) =3D context->counter + 1;
--	bytes_dumped +=3D sizeof(context->counter);
--	dump_pos +=3D sizeof(context->counter);
--
--	/* Store variables */
- 	for (size_t pos =3D 0; pos < context->max_variables; pos++) {
- 		struct variable_entry *entry =3D &context->entries[pos];
- 		struct variable_metadata *metadata =3D &entry->info.metadata;
-@@ -344,24 +333,14 @@ efi_status_t variable_index_dump(const struct vari=
able_index *context, size_t bu
- 	return EFI_SUCCESS;
- }
-=20
--void variable_index_confirm_write(struct variable_index *context)
--{
--	context->counter++;
--}
-=20
--size_t variable_index_restore(struct variable_index *context, size_t da=
ta_len,
-+size_t variable_index_restore(const struct variable_index *context, siz=
e_t data_len,
- 			      const uint8_t *buffer)
- {
- 	size_t bytes_loaded =3D 0;
- 	const uint8_t *load_pos =3D buffer;
- 	int pos =3D 0;
-=20
--	if (data_len >=3D sizeof(context->counter)) {
--		context->counter =3D *((uint32_t *)load_pos);
--		bytes_loaded +=3D sizeof(context->counter);
--		load_pos +=3D sizeof(context->counter);
--	}
--
- 	while (bytes_loaded < data_len) {
- 		struct variable_entry *entry =3D &context->entries[pos];
-=20
-diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.h b/components/service/uefi/smm_variable/backend/variable_index.h
-index 592dddc83..0151d636a 100644
---- a/components/service/uefi/smm_variable/backend/variable_index.h
-+++ b/components/service/uefi/smm_variable/backend/variable_index.h
-@@ -75,7 +75,6 @@ struct variable_entry {
-  */
- struct variable_index {
- 	size_t max_variables;
--	uint32_t counter;
- 	struct variable_entry *entries;
- };
-=20
-@@ -229,7 +228,7 @@ void variable_index_confirm_write(struct variable_in=
dex *context);
-  *
-  * @return     Number of bytes loaded
-  */
--size_t variable_index_restore(struct variable_index *context, size_t da=
ta_len,
-+size_t variable_index_restore(const struct variable_index *context, siz=
e_t data_len,
- 			      const uint8_t *buffer);
-=20
- #ifdef __cplusplus
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0021-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0013-Fix-PSA-FWU-IPC-p=
sa_fwu_install-return-value-check.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
021-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
3-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0014-Revert-Make-constraints-of-NV-UEFI-variables-persist.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0014-Revert-Make-con=
straints-of-NV-UEFI-variables-persist.patch
deleted file mode 100644
index 3f0ae436..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Re=
vert-Make-constraints-of-NV-UEFI-variables-persist.patch
+++ /dev/null
@@ -1,387 +0,0 @@
-From c0ffa57e7628f23747d7ee947358f8a538fa5d4c Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Mon, 25 Nov 2024 22:17:51 +0100
-Subject: [PATCH 3/3] Revert "Make constraints of NV UEFI variables persi=
stent"
-
-This reverts commit 64bbde5d9950413cf724ffb792d4d1637892fa8b.
-The FMP support didn't work with this commit. See the implementation in =
the
-0003-FMP-Support-in-Corstone1000.patch file. The=20
-0003-FMP-Support-in-Corstone1000.patch will be redesigned but until that=
, this=20
-commit has to be reverted.
-
-Upstream-Status: Inappropriate [To be removed after new FWU design]
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
----
- .../backend/test/variable_index_tests.cpp     | 93 +++----------------
- .../backend/uefi_variable_store.c             | 12 +--
- .../smm_variable/backend/variable_index.c     | 90 +++---------------
- .../smm_variable/backend/variable_index.h     |  7 +-
- 4 files changed, 36 insertions(+), 166 deletions(-)
-
-diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
index_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_index_tests.cpp
-index a52cfbf76..1b7a6b879 100644
---- a/components/service/uefi/smm_variable/backend/test/variable_index_t=
ests.cpp
-+++ b/components/service/uefi/smm_variable/backend/test/variable_index_t=
ests.cpp
-@@ -214,28 +214,21 @@ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
-=20
- 	/* Expect the info for two NV variables to have been dumped */
- 	size_t dump_len =3D 0;
--	bool is_dirty =3D false;
--	efi_status_t status =3D EFI_SUCCESS;
--
--	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
--				     &is_dirty);
-+	bool is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer=
), buffer, &dump_len);
-=20
- 	CHECK_TRUE(is_dirty);
--	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
--	UNSIGNED_LONGS_EQUAL(((sizeof(struct variable_metadata) + sizeof(bool)=
) * 2), dump_len);
-+	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) * 2), dump_len)=
;
-=20
- 	/* Expect no records to be dirty when the dump is repeated */
- 	dump_len =3D 0;
--	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
--				     &is_dirty);
-+	is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer), bu=
ffer, &dump_len);
-=20
--	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
- 	CHECK_FALSE(is_dirty);
--	UNSIGNED_LONGS_EQUAL(((sizeof(struct variable_metadata) + sizeof(bool)=
) * 2), dump_len);
-+	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) * 2), dump_len)=
;
-=20
- 	/* Tear down and reinitialize to simulate a reboot */
- 	variable_index_deinit(&m_variable_index);
--	status =3D variable_index_init(&m_variable_index, MAX_VARIABLES);
-+	efi_status_t status =3D variable_index_init(&m_variable_index, MAX_VAR=
IABLES);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
-=20
- 	/* Load the dumped contents */
-@@ -268,52 +261,6 @@ TEST(UefiVariableIndexTests, dumpLoadRoadtrip)
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_NOT_FOUND, status);
- }
-=20
--TEST(UefiVariableIndexTests, dumpLoadConstrainedVariable)
--{
--	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
--
--	create_variables();
--
--	struct variable_constraints constraints;
--	constraints.revision =3D 10;
--	constraints.property =3D VAR_CHECK_VARIABLE_PROPERTY_READ_ONLY;
--	constraints.attributes =3D 0;
--	constraints.min_size =3D 1;
--	constraints.max_size =3D 100;
--
--	/* Set check constraints on one of the variables */
--	struct variable_info *info =3D variable_index_find(&m_variable_index, =
&guid_2,
--							 string_get_size_in_bytes(name_2),
--							 (const int16_t *)name_2.data());
--
--	CHECK_TRUE(info);
--	CHECK_TRUE(info->is_variable_set);
--	CHECK_FALSE(info->is_constraints_set);
--
--	variable_index_set_constraints(info, &constraints);
--
--	CHECK_TRUE(info->is_constraints_set);
--	CHECK_TRUE(info->is_variable_set);
--
--	size_t dump_len =3D 0;
--	bool is_dirty =3D false;
--	efi_status_t status =3D EFI_SUCCESS;
--	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
--				     &is_dirty);
--
--	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
--	CHECK_TRUE(is_dirty);
--
--	/* metadata and constraint status byte are stored for both NV variable=
s, but only one of them has constraints */
--	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) + sizeof(bool))=
 * 2 +
--				     sizeof(struct variable_constraints),
--			     dump_len);
--
--	/* Load the dumped contents */
--	size_t load_len =3D variable_index_restore(&m_variable_index, dump_len=
, buffer);
--	UNSIGNED_LONGS_EQUAL(dump_len, load_len);
--}
--
- TEST(UefiVariableIndexTests, dumpBufferTooSmall)
- {
- 	uint8_t buffer[1 * sizeof(struct variable_metadata) + 1];
-@@ -325,15 +272,10 @@ TEST(UefiVariableIndexTests, dumpBufferTooSmall)
- 	 * exceed the length of the buffer.
- 	 */
- 	size_t dump_len =3D 0;
--	bool is_dirty =3D false;
--	efi_status_t status =3D EFI_SUCCESS;
--
--	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
--				     &is_dirty);
-+	bool is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer=
), buffer, &dump_len);
-=20
- 	CHECK_TRUE(is_dirty);
--	UNSIGNED_LONGS_EQUAL(EFI_BUFFER_TOO_SMALL, status);
--	UNSIGNED_LONGS_EQUAL(0, dump_len);
-+	UNSIGNED_LONGS_EQUAL(sizeof(struct variable_metadata) * 1, dump_len);
- }
-=20
- TEST(UefiVariableIndexTests, removeVariable)
-@@ -351,14 +293,10 @@ TEST(UefiVariableIndexTests, removeVariable)
-=20
- 	/* Expect index to be dirty and for only one NV variable to be left */
- 	size_t dump_len =3D 0;
--	bool is_dirty =3D false;
--	efi_status_t status =3D EFI_SUCCESS;
--	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
--				     &is_dirty);
-+	bool is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer=
), buffer, &dump_len);
-=20
- 	CHECK_TRUE(is_dirty);
--	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
--	UNSIGNED_LONGS_EQUAL(sizeof(struct variable_metadata) + sizeof(bool), =
dump_len);
-+	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) * 1), dump_len)=
;
-=20
- 	/* Remove the volatile variable */
- 	info =3D variable_index_find(&m_variable_index, &guid_1, string_get_si=
ze_in_bytes(name_1),
-@@ -368,12 +306,10 @@ TEST(UefiVariableIndexTests, removeVariable)
-=20
- 	/* Expect index not to be dirty because there was no change to any NV =
variable */
- 	dump_len =3D 0;
--	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
--				     &is_dirty);
-+	is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer), bu=
ffer, &dump_len);
-=20
- 	CHECK_FALSE(is_dirty);
--	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
--	UNSIGNED_LONGS_EQUAL(sizeof(struct variable_metadata) + sizeof(bool), =
dump_len);
-+	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) * 1), dump_len)=
;
-=20
- 	/* Remove the remaining NV variable */
- 	info =3D variable_index_find(&m_variable_index, &guid_1, string_get_si=
ze_in_bytes(name_3),
-@@ -383,15 +319,14 @@ TEST(UefiVariableIndexTests, removeVariable)
-=20
- 	/* Expect index to be dirty and dump to now be empty */
- 	dump_len =3D 0;
--	status =3D variable_index_dump(&m_variable_index, sizeof(buffer), buff=
er, &dump_len,
--				     &is_dirty);
-+	is_dirty =3D variable_index_dump(&m_variable_index, sizeof(buffer), bu=
ffer, &dump_len);
-=20
- 	CHECK_TRUE(is_dirty);
--	UNSIGNED_LONGS_EQUAL(EFI_SUCCESS, status);
--	UNSIGNED_LONGS_EQUAL(0, dump_len);
-+	UNSIGNED_LONGS_EQUAL((sizeof(struct variable_metadata) * 0), dump_len)=
;
-=20
- 	/* Enumerate and now expect an empty index */
- 	info =3D NULL;
-+	efi_status_t status =3D EFI_SUCCESS;
-=20
- 	info =3D variable_index_find_next(&m_variable_index, &guid_1,
- 					string_get_size_in_bytes(null_name),  (const int16_t *) null_name.=
data(),
-diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
-index e5fc32864..7da2d1e71 100644
---- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-@@ -575,10 +575,8 @@ efi_status_t uefi_variable_store_set_var_check_prop=
erty(
- 	status =3D variable_checker_set_constraints(&constraints, info->is_con=
straints_set,
- 						  &property->VariableProperty);
-=20
--	if (status =3D=3D EFI_SUCCESS) {
-+	if (status =3D=3D EFI_SUCCESS)
- 		variable_index_set_constraints(info, &constraints);
--		status =3D sync_variable_index(context);
--	}
-=20
- 	variable_index_remove_unused_entry(&context->variable_index, info);
-=20
-@@ -643,15 +641,13 @@ static efi_status_t load_variable_index(struct uef=
i_variable_store *context)
- static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context)
- {
- 	efi_status_t status =3D EFI_SUCCESS;
--	bool is_dirty =3D false;
-=20
- 	/* Sync the variable index to storage if anything is dirty */
- 	size_t data_len =3D 0;
-=20
--	status =3D variable_index_dump(&context->variable_index, context->inde=
x_sync_buffer_size,
--				     context->index_sync_buffer, &data_len, &is_dirty);
--	if (status !=3D EFI_SUCCESS)
--		return status;
-+	bool is_dirty =3D variable_index_dump(&context->variable_index,
-+					    context->index_sync_buffer_size,
-+					    context->index_sync_buffer, &data_len);
-=20
- 	if (is_dirty) {
- 		struct storage_backend *persistent_store =3D
-diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.c b/components/service/uefi/smm_variable/backend/variable_index.c
-index 5fb6d08c5..c39f7394b 100644
---- a/components/service/uefi/smm_variable/backend/variable_index.c
-+++ b/components/service/uefi/smm_variable/backend/variable_index.c
-@@ -108,9 +108,7 @@ void variable_index_deinit(struct variable_index *co=
ntext)
-=20
- size_t variable_index_max_dump_size(struct variable_index *context)
- {
--	return (sizeof(struct variable_metadata) + sizeof(bool) +
--		sizeof(struct variable_constraints)) *
--	       context->max_variables;
-+	return sizeof(struct variable_metadata) * context->max_variables;
- }
-=20
- struct variable_info *variable_index_find(const struct variable_index *=
context,
-@@ -269,68 +267,37 @@ void variable_index_set_constraints(struct variabl=
e_info *info,
- 				    const struct variable_constraints *constraints)
- {
- 	if (info) {
--		struct variable_entry *entry =3D containing_entry(info);
--
- 		info->check_constraints =3D *constraints;
- 		info->is_constraints_set =3D true;
--
--		mark_dirty(entry);
- 	}
- }
-=20
--efi_status_t variable_index_dump(const struct variable_index *context, =
size_t buffer_size,
--				 uint8_t *buffer, size_t *data_len, bool *any_dirty)
-+bool variable_index_dump(const struct variable_index *context, size_t b=
uffer_size, uint8_t *buffer,
-+			 size_t *data_len)
- {
-+	bool any_dirty =3D false;
- 	uint8_t *dump_pos =3D buffer;
- 	size_t bytes_dumped =3D 0;
-=20
--	*data_len =3D 0;
--	*any_dirty =3D false;
--
- 	for (size_t pos =3D 0; pos < context->max_variables; pos++) {
- 		struct variable_entry *entry =3D &context->entries[pos];
- 		struct variable_metadata *metadata =3D &entry->info.metadata;
--		struct variable_constraints *constraints =3D &entry->info.check_const=
raints;
-=20
- 		if (entry->in_use && entry->info.is_variable_set &&
--		    (metadata->attributes & EFI_VARIABLE_NON_VOLATILE)) {
--			/* Store metadata */
--			if (bytes_dumped + sizeof(struct variable_metadata) > buffer_size)
--				return EFI_BUFFER_TOO_SMALL;
--
-+		    (metadata->attributes & EFI_VARIABLE_NON_VOLATILE) &&
-+		    ((bytes_dumped + sizeof(struct variable_metadata)) <=3D buffer_si=
ze)) {
- 			memcpy(dump_pos, metadata, sizeof(struct variable_metadata));
- 			bytes_dumped +=3D sizeof(struct variable_metadata);
- 			dump_pos +=3D sizeof(struct variable_metadata);
--
--			/* Store constraints' status */
--			if (bytes_dumped + sizeof(entry->info.is_constraints_set) > buffer_s=
ize)
--				return EFI_BUFFER_TOO_SMALL;
--
--			memcpy(dump_pos, &entry->info.is_constraints_set,
--			       sizeof(entry->info.is_constraints_set));
--			bytes_dumped +=3D sizeof(entry->info.is_constraints_set);
--			dump_pos +=3D sizeof(entry->info.is_constraints_set);
--
--			/* Store constraints, if they are set */
--			if (entry->info.is_constraints_set) {
--				if (bytes_dumped + sizeof(entry->info.check_constraints) >
--				    buffer_size)
--					return EFI_BUFFER_TOO_SMALL;
--
--				memcpy(dump_pos, constraints,
--				       sizeof(entry->info.check_constraints));
--				bytes_dumped +=3D sizeof(entry->info.check_constraints);
--				dump_pos +=3D sizeof(entry->info.check_constraints);
--			}
- 		}
-=20
--		*any_dirty |=3D entry->dirty;
-+		any_dirty |=3D entry->dirty;
- 		entry->dirty =3D false;
- 	}
-=20
- 	*data_len =3D bytes_dumped;
-=20
--	return EFI_SUCCESS;
-+	return any_dirty;
- }
-=20
-=20
-@@ -342,50 +309,23 @@ size_t variable_index_restore(const struct variabl=
e_index *context, size_t data_
- 	int pos =3D 0;
-=20
- 	while (bytes_loaded < data_len) {
--		struct variable_entry *entry =3D &context->entries[pos];
--
- 		if ((data_len - bytes_loaded) >=3D sizeof(struct variable_metadata)) =
{
-+			struct variable_entry *entry =3D &context->entries[pos];
- 			struct variable_metadata *metadata =3D &entry->info.metadata;
-=20
--			/* Load metadata */
- 			memcpy(metadata, load_pos, sizeof(struct variable_metadata));
-+
-+			entry->info.is_variable_set =3D true;
-+			entry->in_use =3D true;
-+
- 			bytes_loaded +=3D sizeof(struct variable_metadata);
- 			load_pos +=3D sizeof(struct variable_metadata);
--		} else {
--			/* Not a whole number of variable_metadata structs! */
--			break;
--		}
-=20
--		if ((data_len - bytes_loaded) >=3D sizeof(entry->info.is_constraints_=
set)) {
--			/* Load constraints' status */
--			memcpy(&entry->info.is_constraints_set, load_pos,
--			       sizeof(entry->info.is_constraints_set));
--			bytes_loaded +=3D sizeof(entry->info.is_constraints_set);
--			load_pos +=3D sizeof(entry->info.is_constraints_set);
-+			++pos;
- 		} else {
--			/* Not enough space for constraints' status! */
-+			/* Not a whole number of variable_metadata structs! */
- 			break;
- 		}
--
--		if (entry->info.is_constraints_set) {
--			if ((data_len - bytes_loaded) >=3D sizeof(struct variable_constraint=
s)) {
--				struct variable_constraints *constraints =3D
--					&entry->info.check_constraints;
--
--				/* Load constraints if they are set */
--				memcpy(constraints, load_pos, sizeof(struct variable_constraints));
--				bytes_loaded +=3D sizeof(struct variable_constraints);
--				load_pos +=3D sizeof(struct variable_constraints);
--			} else {
--				/* Not a whole number of variable_constraints structs! */
--				break;
--			}
--		}
--
--		entry->info.is_variable_set =3D true;
--		entry->in_use =3D true;
--
--		++pos;
- 	}
-=20
- 	return bytes_loaded;
-diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.h b/components/service/uefi/smm_variable/backend/variable_index.h
-index 0151d636a..da6ed2476 100644
---- a/components/service/uefi/smm_variable/backend/variable_index.h
-+++ b/components/service/uefi/smm_variable/backend/variable_index.h
-@@ -201,12 +201,11 @@ void variable_index_set_constraints(struct variabl=
e_info *info,
-  * @param[in]  buffer_size Size of destination buffer
-  * @param[in]  buffer Dump to this buffer
-  * @param[out] data_len Length of serialized data
-- * @param[out] any_dirty True if there is unsaved data
-  *
-- * @return     EFI_SUCCESS if all the changes are dumped successfully
-+ * @return     True if there is unsaved data
-  */
--efi_status_t variable_index_dump(const struct variable_index *context, =
size_t buffer_size,
--				 uint8_t *buffer, size_t *data_len, bool *any_dirty);
-+bool variable_index_dump(const struct variable_index *context, size_t b=
uffer_size, uint8_t *buffer,
-+			 size_t *data_len);
-=20
- /**
-  * @brief     Confirms the successful write of the variable index into =
the storage
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0022-fwu-Add-EFI-ESRT-v1-support.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/corstone1000/0014-fwu-Add-EFI-ESRT-v1-support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
022-fwu-Add-EFI-ESRT-v1-support.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
4-fwu-Add-EFI-ESRT-v1-support.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0023-platform-corstone1000-Enable-ESRT-support.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0015-platform-corstone1000-Enab=
le-ESRT-support.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
023-platform-corstone1000-Enable-ESRT-support.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
5-platform-corstone1000-Enable-ESRT-support.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0015-se-proxy-protobuf-change.patch b/meta-arm-bsp/recipes-security/trust=
ed-services/corstone1000/0015-se-proxy-protobuf-change.patch
deleted file mode 100644
index 11896556..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-se=
-proxy-protobuf-change.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From dd9a51bde0608989e01de5369eaa0eef2bab7c43 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 22 Jan 2025 00:54:30 +0000
-Subject: [PATCH] protobuf fix
-
-Upstream-Status: Pending (not yet submitted to upstream)
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
----
- .../se-proxy/env/commonsp/se_proxy_sp.c       | 25 ++++++++++++++++++-
- 1 file changed, 24 insertions(+), 1 deletion(-)
-
-diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
-index 88e4cf17e..7da489ca8 100644
---- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
-+++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
-@@ -13,6 +13,7 @@
- #include "trace.h"
- #include "deployments/se-proxy/infra/service_proxy_factory.h"
- #include "deployments/se-proxy/se_proxy_interfaces.h"
-+#include <service/crypto/factory/crypto_provider_factory.h>
-=20
- static bool sp_init(uint16_t *own_sp_id);
-=20
-@@ -39,7 +40,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
- 		goto fatal_error;
- 	}
-=20
--	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 6, 16);
-+	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 7, 16);
- 	if (rpc_status !=3D RPC_SUCCESS) {
- 		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
- 		goto fatal_error;
-@@ -118,6 +119,28 @@ void __noreturn sp_main(union ffa_boot_info *boot_i=
nfo)
- 		goto fatal_error;
- 	}
-=20
-+	struct rpc_service_interface *crypto_iface_protobuf =3D NULL;
-+	struct crypto_provider *crypto_protobuf_provider =3D NULL;
-+
-+	crypto_protobuf_provider =3D crypto_protobuf_provider_factory_create()=
;
-+	if (!crypto_protobuf_provider) {
-+		EMSG("Failed to create crypto protobuf provider factory");
-+		goto fatal_error;
-+	}
-+
-+	crypto_iface_protobuf =3D service_provider_get_rpc_interface(
-+		&crypto_protobuf_provider->base_provider);
-+	if (!crypto_iface_protobuf) {
-+		EMSG("Failed to create service provider RPC interface");
-+		goto fatal_error;
-+	}
-+
-+	rpc_status =3D ts_rpc_endpoint_sp_add_service(&rpc_endpoint, crypto_if=
ace_protobuf);
-+	if (rpc_status !=3D RPC_SUCCESS) {
-+		EMSG("Failed to add service to RPC endpoint: %d", rpc_status);
-+		goto fatal_error;
-+	}
-+
- 	/* End of boot phase */
- 	result =3D sp_msg_wait(&req_msg);
- 	if (result !=3D SP_RESULT_OK) {
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0024-platform-corstone1000-Add-event-provider-proxy.patch b/meta-arm-bsp/=
recipes-security/trusted-services/corstone1000/0016-platform-corstone1000=
-Add-event-provider-proxy.patch
similarity index 82%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
024-platform-corstone1000-Add-event-provider-proxy.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
6-platform-corstone1000-Add-event-provider-proxy.patch
index 8de9f081..e92b80ef 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0024-pl=
atform-corstone1000-Add-event-provider-proxy.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-pl=
atform-corstone1000-Add-event-provider-proxy.patch
@@ -1,7 +1,7 @@
-From dde0ca3260ae3b7e7c3390ef03f9f484e9189626 Mon Sep 17 00:00:00 2001
+From 7953806fd3fdb743c40b76e363b917fac786c636 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Tue, 11 Mar 2025 13:33:36 +0000
-Subject: [PATCH 7/8] platform: corstone1000: Add event provider proxy
+Subject: [PATCH 10/11] platform: corstone1000: Add event provider proxy
=20
 Normal world needs to send boot confirmation event
 to Secure Enclave and Trusted-Services is responsible
@@ -14,17 +14,38 @@ This change is introduced for Corstone-1000
 Upstream-Status: Pending
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
+ components/service/common/include/psa/sid.h   |  9 ++
  .../se-proxy/env/commonsp/se_proxy_sp.c       | 16 +++-
  .../corstone1000_event_handling.c             | 91 +++++++++++++++++++
  .../corstone1000_event_handling.h             | 42 +++++++++
  .../se-proxy/infra/corstone1000/infra.cmake   |  1 +
  .../corstone1000/service_proxy_factory.c      | 27 ++++++
- 5 files changed, 175 insertions(+), 2 deletions(-)
+ 6 files changed, 184 insertions(+), 2 deletions(-)
  create mode 100644 deployments/se-proxy/infra/corstone1000/corstone1000=
_event_handling.c
  create mode 100644 deployments/se-proxy/infra/corstone1000/corstone1000=
_event_handling.h
=20
+diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
+index 0235764d..9f5ea05e 100644
+--- a/components/service/common/include/psa/sid.h
++++ b/components/service/common/include/psa/sid.h
+@@ -40,6 +40,15 @@ extern "C" {
+ #define TFM_CRYPTO_VERSION                                         (1U)
+ #define TFM_CRYPTO_HANDLE                                          (0x4=
0000100U)
+=20
++/******** TFM_PLATFORM_SERVICE *******/
++#define TFM_PLATFORM_API_ID_IOCTL         (1013)
++#define TFM_PLATFORM_SERVICE_HANDLE       (0x40000105U)
++
++/**
++ * \brief Define a progressive numerical value for each SID which can b=
e used
++ *        when dispatching the requests to the service
++*/
++
+ /******** TFM_SP_PLATFORM ********/
+ #define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x0=
0000040U)
+ #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
 diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
-index 7da489ca..7d2ade5e 100644
+index 9f94092b..ce1410b2 100644
 --- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
 +++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
 @@ -1,6 +1,6 @@
@@ -35,16 +56,16 @@ index 7da489ca..7d2ade5e 100644
   */
 =20
  #include "components/rpc/common/endpoint/rpc_service_interface.h"
-@@ -40,7 +40,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
+@@ -42,7 +42,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
  		goto fatal_error;
  	}
 =20
--	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 7, 16);
-+	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 8, 16);
+-	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 6, 16);
++	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 7, 16);
  	if (rpc_status !=3D RPC_SUCCESS) {
  		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
  		goto fatal_error;
-@@ -95,6 +95,18 @@ void __noreturn sp_main(union ffa_boot_info *boot_inf=
o)
+@@ -97,6 +97,18 @@ void __noreturn sp_main(union ffa_boot_info *boot_inf=
o)
  		goto fatal_error;
  	}
 =20
@@ -60,9 +81,9 @@ index 7da489ca..7d2ade5e 100644
 +		goto fatal_error;
 +	}
 +
- 	rpc_iface =3D capsule_update_proxy_create();
+ 	rpc_iface =3D fwu_proxy_create();
  	if (!rpc_iface) {
- 		EMSG("Failed to create Capsule Update proxy");
+ 		EMSG("Failed to create FWU proxy");
 diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_event_=
handling.c b/deployments/se-proxy/infra/corstone1000/corstone1000_event_h=
andling.c
 new file mode 100644
 index 00000000..faf450f2
@@ -209,20 +230,20 @@ index 00000000..e8e60dae
 +
 +#endif /* CORSTONE1000_EVENT_HANDLING_H */
 diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
-index 0b04149a..b95801de 100644
+index 2bf6b36e..1ec43700 100644
 --- a/deployments/se-proxy/infra/corstone1000/infra.cmake
 +++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
-@@ -34,4 +34,5 @@ add_components(TARGET "se-proxy"
+@@ -33,4 +33,5 @@ add_components(TARGET "se-proxy"
  target_sources(se-proxy PRIVATE
 =20
  	${CMAKE_CURRENT_LIST_DIR}/service_proxy_factory.c
 +	${CMAKE_CURRENT_LIST_DIR}/corstone1000_event_handling.c
  )
 diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index f0a4853e..ed42e2cb 100644
+index a754ace7..6d8c3855 100644
 --- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
 +++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-@@ -21,6 +21,7 @@
+@@ -20,6 +20,7 @@
  #include <protocols/service/fwu/fwu_proto.h>
  #include <trace.h>
  #include "corstone1000_config.h"
@@ -230,7 +251,7 @@ index f0a4853e..ed42e2cb 100644
 =20
  /* backends */
  #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-@@ -165,6 +166,32 @@ struct rpc_service_interface *its_proxy_create(void=
)
+@@ -164,6 +165,32 @@ struct rpc_service_interface *its_proxy_create(void=
)
  	return secure_storage_provider_init(&its_provider, backend, &its_uuid)=
;
  }
 =20
@@ -264,5 +285,5 @@ index f0a4853e..ed42e2cb 100644
  {
  	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
 --=20
-2.25.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0025-platform-corstone1000-Define-GUID-for-each-payloads.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0017-platform-corston=
e1000-Define-GUID-for-each-payloads.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
025-platform-corstone1000-Define-GUID-for-each-payloads.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
7-platform-corstone1000-Define-GUID-for-each-payloads.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0016-Add-the-com-buffer-address-and-page-count.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0018-Add-the-com-buffer-address=
-and-page-count.patch
similarity index 60%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
016-Add-the-com-buffer-address-and-page-count.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
8-Add-the-com-buffer-address-and-page-count.patch
index 77efb6bc..ffca2adb 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Ad=
d-the-com-buffer-address-and-page-count.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Ad=
d-the-com-buffer-address-and-page-count.patch
@@ -1,38 +1,31 @@
-From 0423349ec142bd1c4a6cc452eed9a0f5e43c8539 Mon Sep 17 00:00:00 2001
-From: Michael Safwat <michael.safwat@arm.com>
-Date: Mon, 23 Jun 2025 13:06:10 +0000
+From 2eef8097c6411fb54b2d0203159e120d192315c7 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 24 Jul 2025 10:33:41 +0000
 Subject: [PATCH] Plat: Corstone-1000: Add MM communication buffer config=
s to
  CMake
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/40893]
=20
 Two variables are added into the Corstone-1000 platform
 CMake file so the MM communication buffer address and
 the page count can be configured.
=20
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/40893]
 Change-Id: I6bbdc90231b0417d4318d6709568113ab1f2c8ce
 Signed-off-by: Michael Safwat <michael.safwat@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
- platform/providers/arm/corstone1000/platform.cmake | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
+ platform/providers/arm/corstone1000/platform.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
=20
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index 2afcdea8..37c6accf 100644
+index db1e9743..88113c9d 100644
 --- a/platform/providers/arm/corstone1000/platform.cmake
 +++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2021-2024, Arm Limited and Contributors. All rights res=
erved.
-+# Copyright (c) 2021-2025, Arm Limited and Contributors. All rights res=
erved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -11,6 +11,9 @@ set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 4*4096 C=
ACHE STRING "RPC caller bu
- set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway SP heap size")
+@@ -18,6 +18,8 @@ set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway=
 SP heap size")
  set(PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE 0x43C0 CACHE STRING "Size of the RS=
E_COMMS_PAYLOAD buffer")
  set(COMMS_MHU_MSG_SIZE 0x4500 CACHE STRING "Max message size that can b=
e transfered via MHU")
+ set(TFM_FWU_MAX_DIGEST_SIZE ${TOTAL_ESRT_SIZE} CACHE STRING "Maximum si=
ze of ESRT entries of all the images in a bank")
 +set(MM_COMM_BUFFER_ADDRESS "0x00000000 0x81FFF000" CACHE STRING "MM Com=
munication buffer start address")
 +set(MM_COMM_BUFFER_PAGE_COUNT 0x1 CACHE STRING "MM Communication buffer=
 page count")
-+
 =20
  target_compile_definitions(${TGT} PRIVATE
  	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 060725f1..a17beeee 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -2,32 +2,25 @@ FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/c=
orstone1000:"
=20
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRC_URI:append:corstone1000  =3D " \
-    file://0001-Add-stub-capsule-update-service-components.patch \
-    file://0002-Fix-in-AEAD-for-psa-arch-test-254.patch \
-    file://0003-FMP-Support-in-Corstone1000.patch \
-    file://0004-Fix-psa-api-crypto-test-no-243.patch \
-    file://0005-plat-corstone1000-Use-the-stateless-platform-service.pat=
ch \
-    file://0006-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
-    file://0007-plat-corstone1000-add-client_id-for-FMP-service.patch \
-    file://0008-Remove-Werror-flag.patch \
-    file://0009-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
-    file://0010-Make-RSS-and-MHU-sizes-compile-time-definitions-user.pat=
ch \
-    file://0011-Align-PSA-Crypto-with-TF-Mv2.1.patch \
-    file://0012-Revert-Make-variable-index-usage-robust-with-redunda.pat=
ch \
-    file://0013-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
-    file://0014-Revert-Make-constraints-of-NV-UEFI-variables-persist.pat=
ch \
-    file://0015-se-proxy-protobuf-change.patch \
+    file://0001-Fix-in-AEAD-for-psa-arch-test-254.patch \
+    file://0002-Fix-psa-api-crypto-test-no-243.patch \
+    file://0003-Remove-Werror-flag.patch \
+    file://0004-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
+    file://0005-Make-RSS-and-MHU-sizes-compile-time-definitions-user.pat=
ch \
+    file://0006-Align-PSA-Crypto-with-TF-Mv2.1.patch \
+    file://0007-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
+    file://0008-se-proxy-protobuf-change.patch \
+    file://0009-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.pat=
ch \
+    file://0010-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch =
\
+    file://0011-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch=
 \
+    file://0012-Corstone1000-Define-PSA-FWU-image-mapping-structure.patc=
h \
+    file://0013-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch=
 \
+    file://0014-fwu-Add-EFI-ESRT-v1-support.patch \
+    file://0015-platform-corstone1000-Enable-ESRT-support.patch \
+    file://0016-platform-corstone1000-Add-event-provider-proxy.patch \
+    file://0017-platform-corstone1000-Define-GUID-for-each-payloads.patc=
h \
+    file://0018-Add-the-com-buffer-address-and-page-count.patch \
     file://0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch \
-    file://0016-Add-the-com-buffer-address-and-page-count.patch \
-    file://0017-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.pat=
ch \
-    file://0018-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch =
\
-    file://0019-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch=
 \
-    file://0020-Corstone1000-Define-PSA-FWU-image-mapping-structure.patc=
h \
-    file://0021-Fix-PSA-FWU-IPC-psa_fwu_install-return-value-check.patch=
 \
-    file://0022-fwu-Add-EFI-ESRT-v1-support.patch \
-    file://0023-platform-corstone1000-Enable-ESRT-support.patch \
-    file://0024-platform-corstone1000-Add-event-provider-proxy.patch \
-    file://0025-platform-corstone1000-Define-GUID-for-each-payloads.patc=
h \
     "
 # The patches above introduce errors with GCC 14.1, silence them for now
 CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -Wno-implicit-funct=
ion-declaration"

