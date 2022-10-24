Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F244EECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 13:33:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.19165.1666618429561517161
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 06:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89ADCED1;
	Mon, 24 Oct 2022 06:33:55 -0700 (PDT)
Received: from e126544.cambridge.arm.com (e126544.cambridge.arm.com [10.1.199.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E4263F7B4;
	Mon, 24 Oct 2022 06:33:48 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 4/4] arm-bsp/trusted-service: corstone1000: esrt support
Date: Mon, 24 Oct 2022 14:33:30 +0100
Message-Id: <20221024133330.10542-5-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024133330.10542-1-mohamed.omarasaker@arm.com>
References: <20221024133330.10542-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 13:33:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4020

From: Satish Kumar <satish.kumar01@arm.com>

Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 .../0020-FMP-Support-in-Corstone1000.patch    | 417 ++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |   1 +
 2 files changed, 418 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0020-FMP-Support-in-Corstone1000.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0020-FMP-Support-in-Corstone1000.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/corstone1000/0020-FMP-Support-in-Corstone1000.patch
new file mode 100644
index 00000000..79429c77
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0020-FM=
P-Support-in-Corstone1000.patch
@@ -0,0 +1,417 @@
+From 6430bf31a25a1ef67e9141f85dbd070feb0d1a1e Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Fri, 8 Jul 2022 09:48:06 +0100
+Subject: [PATCH] FMP Support in Corstone1000.
+
+The FMP support is used by u-boot to pupolate ESRT information
+for the kernel.
+
+The solution is platform specific and needs to be revisted.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+Upstream-Status: Inappropriate [The solution is platform specific and ne=
eds to be revisted]
+---
+ .../provider/capsule_update_provider.c        |   5 +
+ .../capsule_update/provider/component.cmake   |   1 +
+ .../provider/corstone1000_fmp_service.c       | 307 ++++++++++++++++++
+ .../provider/corstone1000_fmp_service.h       |  26 ++
+ 4 files changed, 339 insertions(+)
+ create mode 100644 components/service/capsule_update/provider/corstone1=
000_fmp_service.c
+ create mode 100644 components/service/capsule_update/provider/corstone1=
000_fmp_service.h
+
+diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
+index 9bbd7abc..871d6bcf 100644
+--- a/components/service/capsule_update/provider/capsule_update_provider=
.c
++++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
+@@ -11,6 +11,7 @@
+ #include <protocols/service/capsule_update/capsule_update_proto.h>
+ #include <protocols/rpc/common/packed-c/status.h>
+ #include "capsule_update_provider.h"
++#include "corstone1000_fmp_service.h"
+=20
+=20
+ #define CAPSULE_UPDATE_REQUEST (0x1)
+@@ -47,6 +48,8 @@ struct rpc_interface *capsule_update_provider_init(
+ 		rpc_interface =3D service_provider_get_rpc_interface(&context->base_p=
rovider);
+ 	}
+=20
++	provision_fmp_variables_metadata(context->client.caller);
++
+ 	return rpc_interface;
+ }
+=20
+@@ -85,6 +88,7 @@ static rpc_status_t event_handler(uint32_t opcode, str=
uct rpc_caller *caller)
+ 		}
+ 		psa_call(caller,handle, PSA_IPC_CALL,
+ 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
++		set_fmp_image_info(caller, handle);
+ 		break;
+=20
+ 		case KERNEL_STARTED_EVENT:
+@@ -99,6 +103,7 @@ static rpc_status_t event_handler(uint32_t opcode, st=
ruct rpc_caller *caller)
+ 		}
+ 		psa_call(caller,handle, PSA_IPC_CALL,
+ 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
++		set_fmp_image_info(caller, handle);
+ 		break;
+ 		default:
+ 			EMSG("%s unsupported opcode", __func__);
+diff --git a/components/service/capsule_update/provider/component.cmake =
b/components/service/capsule_update/provider/component.cmake
+index 1d412eb2..6b060149 100644
+--- a/components/service/capsule_update/provider/component.cmake
++++ b/components/service/capsule_update/provider/component.cmake
+@@ -10,4 +10,5 @@ endif()
+=20
+ target_sources(${TGT} PRIVATE
+ 	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
++	"${CMAKE_CURRENT_LIST_DIR}/corstone1000_fmp_service.c"
+ 	)
+diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
+new file mode 100644
+index 00000000..6a7a47a7
+--- /dev/null
++++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
+@@ -0,0 +1,307 @@
++/*
++ * Copyright (c) 2022, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include "corstone1000_fmp_service.h"
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <psa/storage_common.h>
++#include <trace.h>
++
++#include <service/smm_variable/backend/variable_index.h>
++
++#define VARIABLE_INDEX_STORAGE_UID			(0x787)
++
++/**
++ * Variable attributes
++ */
++#define	EFI_VARIABLE_NON_VOLATILE				(0x00000001)
++#define	EFI_VARIABLE_BOOTSERVICE_ACCESS				(0x00000002)
++#define	EFI_VARIABLE_RUNTIME_ACCESS				(0x00000004)
++#define	EFI_VARIABLE_HARDWARE_ERROR_RECORD			(0x00000008)
++#define	EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS			(0x00000010)
++#define	EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS	(0x00000020)
++#define	EFI_VARIABLE_APPEND_WRITE				(0x00000040)
++#define	EFI_VARIABLE_MASK \
++	(EFI_VARIABLE_NON_VOLATILE | \
++	 EFI_VARIABLE_BOOTSERVICE_ACCESS | \
++	 EFI_VARIABLE_RUNTIME_ACCESS | \
++	 EFI_VARIABLE_HARDWARE_ERROR_RECORD | \
++	 EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS | \
++	 EFI_VARIABLE_APPEND_WRITE)
++
++#define FMP_VARIABLES_COUNT	6
++
++static struct variable_metadata fmp_variables_metadata[FMP_VARIABLES_CO=
UNT] =3D {
++    {
++	{ 0x86c77a67, 0x0b97, 0x4633, \
++		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
++	/* name size =3D (variable_name + \0) * sizeof(u16) */
++	.name_size =3D 42, { 'F', 'm', 'p', 'D', 'e', 's', 'c', 'r', 'i', 'p',=
 't', 'o', 'r', 'V', 'e', 'r', 's', 'i', 'o', 'n' },
++	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
++    },
++    {
++	{ 0x86c77a67, 0x0b97, 0x4633, \
++		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
++	/* name size =3D (variable_name + \0) * sizeof(u16) */
++	.name_size =3D 34, { 'F', 'm', 'p', 'I', 'm', 'a', 'g', 'e', 'I', 'n',=
 'f', 'o', 'S', 'i', 'z', 'e' },
++	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
++    },
++    {
++	{ 0x86c77a67, 0x0b97, 0x4633, \
++		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
++	/* name size =3D (variable_name + \0) * sizeof(u16) */
++	.name_size =3D 38, { 'F', 'm', 'p', 'D', 'e', 's', 'c', 'r', 'i', 'p',=
 't', 'o', 'r', 'C', 'o', 'u', 'n', 't' },
++	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
++    },
++    {
++	{ 0x86c77a67, 0x0b97, 0x4633, \
++		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
++	/* name size =3D (variable_name + \0) * sizeof(u16) */
++	.name_size =3D 26, { 'F', 'm', 'p', 'I', 'm', 'a', 'g', 'e', 'I', 'n',=
 'f', 'o' },
++	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
++    },
++    {
++	{ 0x86c77a67, 0x0b97, 0x4633, \
++		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
++	/* name size =3D (variable_name + \0) * sizeof(u16) */
++	.name_size =3D 28, { 'F', 'm', 'p', 'I', 'm', 'a', 'g', 'e', 'N', 'a',=
 'm', 'e', '1' },
++	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
++    },
++    {
++	{ 0x86c77a67, 0x0b97, 0x4633, \
++		{ 0xa1, 0x87, 0x49, 0x10, 0x4d, 0x06, 0x85, 0xc7} },
++	/* name size =3D (variable_name + \0) * sizeof(u16) */
++	.name_size =3D 32, { 'F', 'm', 'p', 'V', 'e', 'r', 's', 'i', 'o', 'n',=
  'N', 'a', 'm', 'e', '1' },
++	.attributes =3D EFI_VARIABLE_NON_VOLATILE, .uid =3D 0
++    },
++};
++
++static psa_status_t protected_storage_set(struct rpc_caller *caller,
++	psa_storage_uid_t uid, size_t data_length, const void *p_data)
++{
++	psa_status_t psa_status;
++	psa_storage_create_flags_t create_flags =3D PSA_STORAGE_FLAG_NONE;
++
++	struct psa_invec in_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
++		{ .base =3D psa_ptr_const_to_u32(p_data), .len =3D data_length },
++		{ .base =3D psa_ptr_to_u32(&create_flags), .len =3D sizeof(create_fla=
gs) },
++	};
++
++	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE, =
TFM_PS_ITS_SET,
++			      in_vec, IOVEC_LEN(in_vec), NULL, 0);
++	if (psa_status < 0)
++		EMSG("ipc_set: psa_call failed: %d", psa_status);
++
++	return psa_status;
++}
++
++static psa_status_t protected_storage_get(struct rpc_caller *caller,
++	psa_storage_uid_t uid, size_t data_size, void *p_data)
++{
++	psa_status_t psa_status;
++	uint32_t offset =3D 0;
++
++	struct psa_invec in_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
++		{ .base =3D psa_ptr_to_u32(&offset), .len =3D sizeof(offset) },
++	};
++
++	struct psa_outvec out_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(p_data), .len =3D data_size },
++	};
++
++	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
++			      TFM_PS_ITS_GET, in_vec, IOVEC_LEN(in_vec),
++			      out_vec, IOVEC_LEN(out_vec));
++
++	if (psa_status =3D=3D PSA_SUCCESS && out_vec[0].len !=3D data_size) {
++	    EMSG("Return size does not match with expected size.");
++	    return PSA_ERROR_BUFFER_TOO_SMALL;
++	}
++
++	return psa_status;
++}=09
++
++static uint64_t name_hash(EFI_GUID *guid, size_t name_size,
++	const int16_t *name)
++{
++	/* Using djb2 hash by Dan Bernstein */
++	uint64_t hash =3D 5381;
++
++	/* Calculate hash over GUID */
++	hash =3D ((hash << 5) + hash) + guid->Data1;
++	hash =3D ((hash << 5) + hash) + guid->Data2;
++	hash =3D ((hash << 5) + hash) + guid->Data3;
++
++	for (int i =3D 0; i < 8; ++i) {
++
++		hash =3D ((hash << 5) + hash) + guid->Data4[i];
++	}  =20
++
++	/* Extend to cover name up to but not including null terminator */
++	for (int i =3D 0; i < name_size / sizeof(int16_t); ++i) {
++
++		if (!name[i]) break;
++		hash =3D ((hash << 5) + hash) + name[i];
++	}
++
++	return hash;
++}
++
++
++static void initialize_metadata(void)
++{
++    for (int i =3D 0; i < FMP_VARIABLES_COUNT; i++) {
++
++	fmp_variables_metadata[i].uid =3D name_hash(
++					&fmp_variables_metadata[i].guid,
++					fmp_variables_metadata[i].name_size,
++					fmp_variables_metadata[i].name);
++    }
++}
++
++
++void provision_fmp_variables_metadata(struct rpc_caller *caller)
++{
++    struct variable_metadata metadata;
++    psa_status_t status;
++    uint32_t dummy_values =3D 0xDEAD;
++
++    EMSG("Provisioning FMP metadata.");
++
++    initialize_metadata();
++
++    status =3D protected_storage_get(caller, VARIABLE_INDEX_STORAGE_UID=
,
++		sizeof(struct variable_metadata), &metadata);
++
++    if (status =3D=3D PSA_SUCCESS) {
++	EMSG("UEFI variables store is already provisioned.");
++	return;
++    }
++
++    /* Provision FMP variables with dummy values. */
++    for (int i =3D 0; i < FMP_VARIABLES_COUNT; i++) {
++	protected_storage_set(caller, fmp_variables_metadata[i].uid,
++				sizeof(dummy_values), &dummy_values);
++    }
++
++    status =3D protected_storage_set(caller, VARIABLE_INDEX_STORAGE_UID=
,
++		    sizeof(struct variable_metadata) * FMP_VARIABLES_COUNT,
++		    fmp_variables_metadata);
++
++    if (status !=3D EFI_SUCCESS) {
++	return;
++    }
++
++    EMSG("FMP metadata is provisioned");
++}
++
++typedef struct {
++    void *base;
++    int len;
++} variable_data_t;
++
++static variable_data_t fmp_variables_data[FMP_VARIABLES_COUNT];
++
++#define IMAGE_INFO_BUFFER_SIZE	256
++static char image_info_buffer[IMAGE_INFO_BUFFER_SIZE];
++#define IOCTL_CORSTONE1000_FMP_IMAGE_INFO	2
++
++static psa_status_t unpack_image_info(void *buffer, uint32_t size)
++{
++    typedef struct __attribute__ ((__packed__)) {
++	uint32_t variable_count;
++	uint32_t variable_size[FMP_VARIABLES_COUNT];
++	uint8_t variable[];
++    } packed_buffer_t;
++
++    packed_buffer_t *packed_buffer =3D buffer;
++    int runner =3D 0;
++
++    if (packed_buffer->variable_count !=3D FMP_VARIABLES_COUNT) {
++	EMSG("Expected fmp varaibles =3D %u, but received =3D %u",
++		FMP_VARIABLES_COUNT, packed_buffer->variable_count);
++	return PSA_ERROR_PROGRAMMER_ERROR;
++    }
++
++    for (int i =3D 0; i < packed_buffer->variable_count; i++) {
++	EMSG("FMP variable %d : size %u", i, packed_buffer->variable_size[i]);
++	fmp_variables_data[i].base =3D &packed_buffer->variable[runner];
++	fmp_variables_data[i].len=3D packed_buffer->variable_size[i];
++	runner +=3D packed_buffer->variable_size[i];
++    }
++
++    return PSA_SUCCESS;
++}
++
++static psa_status_t get_image_info(struct rpc_caller *caller,
++			   psa_handle_t platform_service_handle)
++{
++    psa_status_t status;
++    psa_handle_t handle;
++    uint32_t ioctl_id =3D IOCTL_CORSTONE1000_FMP_IMAGE_INFO;
++
++    struct psa_invec in_vec[] =3D {
++	{ .base =3D &ioctl_id, .len =3D sizeof(ioctl_id) },
++    };
++
++    struct psa_outvec out_vec[] =3D {
++	{ .base =3D image_info_buffer, .len =3D IMAGE_INFO_BUFFER_SIZE },
++    };
++
++    memset(image_info_buffer, 0, IMAGE_INFO_BUFFER_SIZE);
++
++    psa_call(caller, platform_service_handle, PSA_IPC_CALL,
++	     in_vec, IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++    status =3D unpack_image_info(image_info_buffer, IMAGE_INFO_BUFFER_S=
IZE);
++    if (status !=3D PSA_SUCCESS) {
++	return status;
++    }
++
++    return PSA_SUCCESS;
++}
++
++static psa_status_t set_image_info(struct rpc_caller *caller)
++{
++    psa_status_t status;
++
++    for (int i =3D 0; i < FMP_VARIABLES_COUNT; i++) {
++=09
++	status =3D protected_storage_set(caller,
++			fmp_variables_metadata[i].uid,
++			fmp_variables_data[i].len, fmp_variables_data[i].base);
++
++	if (status !=3D PSA_SUCCESS) {
++
++            EMSG("FMP variable %d set unsuccessful", i);
++	    return status;
++	}
++
++        EMSG("FMP variable %d set success", i);
++    }
++
++    return PSA_SUCCESS;
++}
++
++void set_fmp_image_info(struct rpc_caller *caller,
++			psa_handle_t platform_service_handle)
++{
++    psa_status_t status;
++
++    status =3D get_image_info(caller, platform_service_handle);
++    if (status !=3D PSA_SUCCESS) {
++	return;
++    }
++
++    status =3D set_image_info(caller);
++    if (status !=3D PSA_SUCCESS) {
++	return;
++    }
++
++    return;
++}
+diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.h b/components/service/capsule_update/provider/corstone1000_fmp_=
service.h
+new file mode 100644
+index 00000000..95fba2a0
+--- /dev/null
++++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
+@@ -0,0 +1,26 @@
++/*
++ * Copyright (c) 2022, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CORSTONE1000_FMP_SERVICE_H
++#define CORSTONE1000_FMP_SERVICE_H
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#include <rpc_caller.h>
++#include <psa/client.h>
++
++void provision_fmp_variables_metadata(struct rpc_caller *caller);
++
++void set_fmp_image_info(struct rpc_caller *caller,
++		psa_handle_t platform_service_handle);
++
++#ifdef __cplusplus
++} /* extern "C" */
++#endif
++
++#endif /* CORSTONE1000_FMP_SERVICE_H */
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone10=
00.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.i=
nc
index aa8f271d..03f7dff2 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -20,6 +20,7 @@ SRC_URI:append =3D " \
     file://0017-Fix-update-psa_set_key_usage_flags-definition-to-the.pat=
ch \
     file://0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch \
     file://0019-plat-corstone1000-change-default-smm-values.patch \
+    file://0020-FMP-Support-in-Corstone1000.patch \
     "
=20
=20
--=20
2.25.1


