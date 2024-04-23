Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CA1C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 16:33:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23276.1713890024230611087
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 09:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 986A3339;
	Tue, 23 Apr 2024 09:34:11 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.21.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF1D63F7BD;
	Tue, 23 Apr 2024 09:33:42 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 9/9] arm-bsp/trusted-services:cs1000: fix deployments
Date: Tue, 23 Apr 2024 18:32:05 +0200
Message-ID: <20240423163205.5885-9-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240423163205.5885-1-gyorgy.szing@arm.com>
References: <20240423163205.5885-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 16:33:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5594

From: Bence Balogh <bence.balogh@arm.com>

- The Secure Enclave Proxy Secure Partition fails at psa_call()
because wrong parameter was passed.
- The SMM Gateway initialization failed because a malloc()
returned a NULL pointer. The SMM_GATEWAY_MAX_UEFI_VARIABLES
had to be decreased to avoid this.
- Increase shared memory buffer size and add buildtime check
- Use __packed for the variable_metadata struct

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...rease-SMM_GATEWAY_MAX_UEFI_VARIABLES.patch |  30 ++++
 .../0011-Fix-psa_ipc-service-s-psa_call.patch |  37 +++++
 ...session-SHM-size-build-time-configur.patch |  52 +++++++
 ...ession-SHM-size-for-Corstone-1000-SM.patch | 144 ++++++++++++++++++
 ...ked-for-the-variable_metadata-struct.patch |  34 +++++
 .../trusted-services/ts-arm-platforms.inc     |   5 +
 6 files changed, 302 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0010-Decrease-SMM_GATEWAY_MAX_UEFI_VARIABLES.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0011-Fix-psa_ipc-service-s-psa_call.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Make-RPC-caller-session-SHM-size-build-time-configur.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Set-RPC-caller-session-SHM-size-for-Corstone-1000-SM.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-Use-__packed-for-the-variable_metadata-struct.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0010-Decrease-SMM_GATEWAY_MAX_UEFI_VARIABLES.patch b/meta-arm-bsp/recipes=
-security/trusted-services/corstone1000/0010-Decrease-SMM_GATEWAY_MAX_UEF=
I_VARIABLES.patch
new file mode 100644
index 00000000..e302b74b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-De=
crease-SMM_GATEWAY_MAX_UEFI_VARIABLES.patch
@@ -0,0 +1,30 @@
+From e1ef7c537c09972d981e09d4dbcc98e50c7d2b04 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Tue, 28 Nov 2023 15:32:39 +0100
+Subject: [PATCH 8/9] Decrease SMM_GATEWAY_MAX_UEFI_VARIABLES
+
+This fixes the SMM gateway initialization error that was caused
+by a malloc fault in Corstone-1000.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27857]
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+---
+ platform/providers/arm/corstone1000/platform.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index ff044ed7..d16cde3f 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -11,7 +11,7 @@ include(${TS_ROOT}/platform/drivers/arm/mhu_driver/com=
ponent.cmake)
+=20
+ target_compile_definitions(${TGT} PRIVATE
+ 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
+-	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D100
++	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D80
+ )
+=20
+ add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0011-Fix-psa_ipc-service-s-psa_call.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/0011-Fix-psa_ipc-service-s-psa_call.patch
new file mode 100644
index 00000000..25e272f8
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Fi=
x-psa_ipc-service-s-psa_call.patch
@@ -0,0 +1,37 @@
+From b216cb0740b6e0107509145cadd0671fda62e89c Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Tue, 28 Nov 2023 15:33:12 +0100
+Subject: [PATCH 9/9] Fix psa_ipc service's psa_call
+
+The wrong parameter was passed to the psa_ipc_phys_to_virt()
+function which resulted in faulty behavior.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27858]
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+---
+ components/rpc/psa_ipc/service_psa_ipc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/components/rpc/psa_ipc/service_psa_ipc.c b/components/rpc/p=
sa_ipc/service_psa_ipc.c
+index 36c8e367..4bf86716 100644
+--- a/components/rpc/psa_ipc/service_psa_ipc.c
++++ b/components/rpc/psa_ipc/service_psa_ipc.c
+@@ -176,13 +176,13 @@ static psa_status_t __psa_call(struct rpc_caller_i=
nterface *caller, psa_handle_t
+ 	if (!resp_msg || !out_len || resp_msg->reply !=3D PSA_SUCCESS)
+ 		goto caller_end;
+=20
+-	out_vec_param =3D (struct psa_outvec *)psa_ipc_phys_to_virt(caller,
++	out_vec_param =3D (struct psa_outvec *)psa_ipc_phys_to_virt(caller->co=
ntext,
+ 				psa_u32_to_ptr(resp_msg->params.out_vec));
+=20
+ 	for (i =3D 0; i < resp_msg->params.out_len; i++) {
+ 		out_vec[i].len =3D out_vec_param[i].len;
+ 		unaligned_memcpy(psa_u32_to_ptr(out_vec[i].base),
+-				 psa_ipc_phys_to_virt(caller,
++				 psa_ipc_phys_to_virt(caller->context,
+ 				      psa_u32_to_ptr(out_vec_param[i].base)),
+ 				 out_vec[i].len);
+ 	}
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0012-Make-RPC-caller-session-SHM-size-build-time-configur.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0012-Make-RPC-caller=
-session-SHM-size-build-time-configur.patch
new file mode 100644
index 00000000..7eb7814a
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-Ma=
ke-RPC-caller-session-SHM-size-build-time-configur.patch
@@ -0,0 +1,52 @@
+From 40e6b48971bbbd37edf693a8a70b76e4551fda82 Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Wed, 21 Feb 2024 14:24:43 +0100
+Subject: [PATCH 03/12] Make RPC caller session SHM size build-time
+ configurable
+
+Introduce RPC_CALLER_SESSION_SHARED_MEMORY_SIZE macro allow setting the
+RPC caller session shared memory size from the build system. This only
+affects RPC caller sessions created by spffa_service_context.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27864]
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+---
+ .../service/locator/sp/ffa/spffa_service_context.c       | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/components/service/locator/sp/ffa/spffa_service_context.c b=
/components/service/locator/sp/ffa/spffa_service_context.c
+index 0c1616fc..4ddc53af 100644
+--- a/components/service/locator/sp/ffa/spffa_service_context.c
++++ b/components/service/locator/sp/ffa/spffa_service_context.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2021-2024, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -10,6 +10,10 @@
+ #include <stdlib.h>
+ #include <string.h>
+=20
++#ifndef RPC_CALLER_SESSION_SHARED_MEMORY_SIZE
++#define RPC_CALLER_SESSION_SHARED_MEMORY_SIZE	(4096)
++#endif /* RPC_CALLER_SESSION_SHARED_MEMORY_SIZE */
++
+ /* Concrete service_context methods */
+ static struct rpc_caller_session *sp_ts_service_context_open(void *cont=
ext);
+ static void sp_ts_service_context_close(void *context, struct rpc_calle=
r_session *session);
+@@ -52,7 +56,8 @@ static struct rpc_caller_session *sp_ts_service_contex=
t_open(void *context)
+ 		return NULL;
+=20
+ 	rpc_status =3D rpc_caller_session_find_and_open(session, &this_context=
->caller,
+-						      &this_context->service_uuid, 4096);
++						      &this_context->service_uuid,
++						      RPC_CALLER_SESSION_SHARED_MEMORY_SIZE);
+ 	if (rpc_status !=3D RPC_SUCCESS) {
+ 		free(session);
+ 		return NULL;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0013-Set-RPC-caller-session-SHM-size-for-Corstone-1000-SM.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0013-Set-RPC-caller-=
session-SHM-size-for-Corstone-1000-SM.patch
new file mode 100644
index 00000000..1510246f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Se=
t-RPC-caller-session-SHM-size-for-Corstone-1000-SM.patch
@@ -0,0 +1,144 @@
+From ca3a9e31a560d630cf20286eb30d63ddafc0a05a Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Mon, 26 Feb 2024 14:47:25 +0100
+Subject: [PATCH] Set RPC caller session SHM size for Corstone 1000 SMMGW
+
+Set RPC caller session shared memory size so it fits the UEFI variable
+index. Validate if SMM_GATEWAY_MAX_UEFI_VARIABLES * [descriptor size]
+would fit into the shared memory size. Also align the heap size
+accordingly.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27865]
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+---
+ .../config/default-opteesp/CMakeLists.txt     | 32 +++++++++++++++----
+ .../config/default-sp/CMakeLists.txt          | 31 ++++++++++++++----
+ .../providers/arm/corstone1000/platform.cmake |  4 ++-
+ 3 files changed, 52 insertions(+), 15 deletions(-)
+
+diff --git a/deployments/smm-gateway/config/default-opteesp/CMakeLists.t=
xt b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
+index 7becb3999..897a8dabd 100644
+--- a/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
++++ b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2021-2023, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2021-2024, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -24,7 +24,30 @@ set(SP_BIN_UUID_CANON "ed32d533-99e6-4209-9cc0-2d72cd=
d998a7")
+ set(SP_FFA_UUID_CANON "${SP_BIN_UUID_CANON}")
+ set(SP_BOOT_ORDER "8")
+=20
+-set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
++#----------------------------------------------------------------------=
---------
++#  Set target platform to provide drivers needed by the deployment
++#
++#----------------------------------------------------------------------=
---------
++add_platform(TARGET "smm-gateway")
++
++# SMM variable and RPC caller settings
++set(SMM_GATEWAY_MAX_UEFI_VARIABLES 40 CACHE STRING "Maximum UEFI variab=
le count")
++set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 8192 CACHE STRING "RPC ca=
ller buffer size in SMMGW")
++
++# Validating settings
++# The UEFI variable index entry size is 168 bytes
++math(EXPR SHM_MIN "${SMM_GATEWAY_MAX_UEFI_VARIABLES} * 168")
++
++if (${SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE} LESS ${SHM_MIN})
++	message(FATAL_ERROR "The RPC SHM size must be at least 168 * [max UEFI=
 variable count]")
++endif()
++
++target_compile_definitions("smm-gateway" PRIVATE
++	RPC_CALLER_SESSION_SHARED_MEMORY_SIZE=3D${SMM_RPC_CALLER_SESSION_SHARE=
D_MEMORY_SIZE}
++	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D${SMM_GATEWAY_MAX_UEFI_VARIABLES}
++)
++
++set(SP_HEAP_SIZE "16 * 1024 + ${SMM_GATEWAY_MAX_UEFI_VARIABLES} * 168 +=
 ${SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE}" CACHE STRING "SP heap size=
 in bytes")
+ set(TRACE_PREFIX "SMMGW" CACHE STRING "Trace prefix")
+=20
+ # Setting the MM communication buffer parameters
+@@ -50,11 +73,6 @@ include(../../env/commonsp/smm_gateway_sp.cmake REQUI=
RED)
+ include(../../infra/psa-varstore.cmake REQUIRED)
+ include(../../smm-gateway.cmake REQUIRED)
+=20
+-#----------------------------------------------------------------------=
---------
+-#  Set target platform to provide drivers needed by the deployment
+-#
+-#----------------------------------------------------------------------=
---------
+-add_platform(TARGET "smm-gateway")
+=20
+ #----------------------------------------------------------------------=
---------
+ #  Deployment specific build options
+diff --git a/deployments/smm-gateway/config/default-sp/CMakeLists.txt b/=
deployments/smm-gateway/config/default-sp/CMakeLists.txt
+index e56a8559d..d3a96b0c6 100644
+--- a/deployments/smm-gateway/config/default-sp/CMakeLists.txt
++++ b/deployments/smm-gateway/config/default-sp/CMakeLists.txt
+@@ -29,7 +29,30 @@ set(TRACE_PREFIX "SMMGW" CACHE STRING "Trace prefix")
+ set(SP_STACK_SIZE "64 * 1024" CACHE STRING "Stack size")
+ set(SP_BOOT_ORDER "8")
+=20
+-set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "Heap size")
++#----------------------------------------------------------------------=
---------
++#  Set target platform to provide drivers needed by the deployment
++#
++#----------------------------------------------------------------------=
---------
++add_platform(TARGET "smm-gateway")
++
++# SMM variable and RPC caller settings
++set(SMM_GATEWAY_MAX_UEFI_VARIABLES 40 CACHE STRING "Maximum UEFI variab=
le count")
++set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 8192 CACHE STRING "RPC ca=
ller buffer size in SMMGW")
++
++# Validating settings
++# The UEFI variable index entry size is 168 bytes
++math(EXPR SHM_MIN "${SMM_GATEWAY_MAX_UEFI_VARIABLES} * 168")
++
++if (${SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE} LESS ${SHM_MIN})
++	message(FATAL_ERROR "The RPC SHM size must be at least 168 * [max UEFI=
 variable count]")
++endif()
++
++target_compile_definitions("smm-gateway" PRIVATE
++	RPC_CALLER_SESSION_SHARED_MEMORY_SIZE=3D${SMM_RPC_CALLER_SESSION_SHARE=
D_MEMORY_SIZE}
++	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D${SMM_GATEWAY_MAX_UEFI_VARIABLES}
++)
++
++set(SP_HEAP_SIZE "16 * 1024 + ${SMM_GATEWAY_MAX_UEFI_VARIABLES} * 168 +=
 ${SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE}" CACHE STRING "SP heap size=
 in bytes")
+=20
+ # Setting the MM communication buffer parameters
+ set(MM_COMM_BUFFER_ADDRESS "0x00000008 0x81000000" CACHE STRING "Addres=
s of MM communicte buffer in 64 bit DTS format")
+@@ -49,12 +72,6 @@ include(../../env/commonsp/smm_gateway_sp.cmake REQUI=
RED)
+ include(../../infra/psa-varstore.cmake REQUIRED)
+ include(../../smm-gateway.cmake REQUIRED)
+=20
+-#----------------------------------------------------------------------=
---------
+-#  Set target platform to provide drivers needed by the deployment
+-#
+-#----------------------------------------------------------------------=
---------
+-add_platform(TARGET "smm-gateway")
+-
+ #----------------------------------------------------------------------=
---------
+ #  Deployment specific build options
+ #----------------------------------------------------------------------=
---------
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index d16cde3f4..fd93d6f7e 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -9,9 +9,11 @@
+ # include MHU driver
+ include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
+=20
++set(SMM_GATEWAY_MAX_UEFI_VARIABLES 80 CACHE STRING "Maximum UEFI variab=
le count")
++set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 16384 CACHE STRING "RPC c=
aller buffer size in SMMGW")
++
+ target_compile_definitions(${TGT} PRIVATE
+ 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
+-	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D80
+ )
+=20
+ add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
+--=20
+2.25.1
+
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0014-Use-__packed-for-the-variable_metadata-struct.patch b/meta-arm-bsp/r=
ecipes-security/trusted-services/corstone1000/0014-Use-__packed-for-the-v=
ariable_metadata-struct.patch
new file mode 100644
index 00000000..019b54a9
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Us=
e-__packed-for-the-variable_metadata-struct.patch
@@ -0,0 +1,34 @@
+From 8290755eb2b6aaa857b2dca74494290c64d46fb3 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Mon, 26 Feb 2024 16:41:03 +0100
+Subject: [PATCH] Use __packed for the variable_metadata struct
+
+This is only a temporary fix so the buffer limit in TF-M
+doesn't need to be changed. With the __packed attribute, the
+struct's size is 100 bytes instead of 104 bytes.
+The struct will be changed in later upstream commits so this
+change won't be needed, and the RSS_COMMS implementation
+will be able to handle that.
+
+Upstream-Status: Inappropriate
+[Won't be needed after newer upstream version]
+---
+ components/service/smm_variable/backend/variable_index.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/components/service/smm_variable/backend/variable_index.h b/=
components/service/smm_variable/backend/variable_index.h
+index 2f0197da..e82039ac 100644
+--- a/components/service/smm_variable/backend/variable_index.h
++++ b/components/service/smm_variable/backend/variable_index.h
+@@ -29,7 +29,7 @@ extern "C" {
+  *
+  * Holds metadata associated with stored variable.
+  */
+-struct variable_metadata
++struct __packed variable_metadata
+ {
+ 	EFI_GUID	guid;
+ 	size_t		name_size;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 36f7c9b9..9bace889 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -11,6 +11,11 @@ SRC_URI:append:corstone1000  =3D " \
     file://0007-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
     file://0008-platform-corstone1000-fix-synchronization-issue.patch \
     file://0009-plat-corstone1000-fmp-client-id.patch \
+    file://0010-Decrease-SMM_GATEWAY_MAX_UEFI_VARIABLES.patch \
+    file://0011-Fix-psa_ipc-service-s-psa_call.patch \
+    file://0012-Make-RPC-caller-session-SHM-size-build-time-configur.pat=
ch \
+    file://0013-Set-RPC-caller-session-SHM-size-for-Corstone-1000-SM.pat=
ch \
+    file://0014-Use-__packed-for-the-variable_metadata-struct.patch \
     "
=20
=20
--=20
2.43.1


