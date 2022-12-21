Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BF6C4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:33:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17550.1671625994710580703
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 04:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6E32F4;
	Wed, 21 Dec 2022 04:33:55 -0800 (PST)
Received: from e126544.arm.com (unknown [10.57.74.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 650553F703;
	Wed, 21 Dec 2022 04:33:12 -0800 (PST)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 1/5] arm-bsp/trusted-services: corstone1000: Use the stateless platform service calls
Date: Wed, 21 Dec 2022 12:32:32 +0000
Message-Id: <20221221123236.342413-2-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221123236.342413-1-mohamed.omarasaker@arm.com>
References: <20221221123236.342413-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 12:33:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4210

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

Apply patch to use the stateless platform service calls

Calls to psa_connect is not needed and psa_call can be called
directly with a pre defined handle.

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 ...3-Use-the-stateless-platform-service.patch | 140 ++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0023-Use-the-stateless-platform-service.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0023-Use-the-stateless-platform-service.patch b/meta-arm-bsp/recipes-secu=
rity/trusted-services/corstone1000/0023-Use-the-stateless-platform-servic=
e.patch
new file mode 100644
index 00000000..824196c1
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0023-Us=
e-the-stateless-platform-service.patch
@@ -0,0 +1,140 @@
+From 956b8a8e1dd5702b9c1657f4ec27a7aeddb0758e Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Mon, 21 Nov 2022 00:08:20 +0000
+Subject: [PATCH] Use the stateless platform service calls
+
+Calls to psa_connect is not needed and psa_call can be called
+directly with a pre defined handle.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Inappropriate [Design is to revisted]
+
+---
+ .../provider/capsule_update_provider.c        | 24 ++++---------------
+ .../provider/corstone1000_fmp_service.c       | 10 ++++----
+ .../provider/corstone1000_fmp_service.h       |  3 +--
+ components/service/common/include/psa/sid.h   |  6 +++++
+ 4 files changed, 16 insertions(+), 27 deletions(-)
+
+diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
+index 991a2235..6809249f 100644
+--- a/components/service/capsule_update/provider/capsule_update_provider=
.c
++++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
+@@ -61,7 +61,6 @@ void capsule_update_provider_deinit(struct capsule_upd=
ate_provider *context)
+ static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller *c=
aller)
+ {
+ 	uint32_t ioctl_id;
+-	psa_handle_t handle;
+ 	rpc_status_t rpc_status =3D TS_RPC_CALL_ACCEPTED;
+=20
+ 	struct psa_invec in_vec[] =3D {
+@@ -79,31 +78,18 @@ static rpc_status_t event_handler(uint32_t opcode, s=
truct rpc_caller *caller)
+ 		case CAPSULE_UPDATE_REQUEST:
+ 		/* Openamp call with IOCTL for firmware update*/
+ 		ioctl_id =3D IOCTL_CORSTONE1000_FWU_FLASH_IMAGES;
+-		handle =3D psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
+-				TFM_SP_PLATFORM_IOCTL_VERSION);
+-		if (handle <=3D 0) {
+-			EMSG("%s Invalid handle", __func__);
+-			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
+-			return rpc_status;
+-		}
+-		psa_call(caller,handle, PSA_IPC_CALL,
++		psa_call(caller,TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCT=
L,
+ 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
+-		set_fmp_image_info(caller, handle);
++		set_fmp_image_info(caller);
+ 		break;
+=20
+ 		case KERNEL_STARTED_EVENT:
+ 		ioctl_id =3D IOCTL_CORSTONE1000_FWU_HOST_ACK;
+ 		/*openamp call with IOCTL for kernel start*/
+-		handle =3D psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
+-				TFM_SP_PLATFORM_IOCTL_VERSION);
+-		if (handle <=3D 0) {
+-			EMSG("%s Invalid handle", __func__);
+-			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
+-			return rpc_status;
+-		}
+-		psa_call(caller,handle, PSA_IPC_CALL,
++	=09
++		psa_call(caller,TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCT=
L,
+ 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
+-		set_fmp_image_info(caller, handle);
++		set_fmp_image_info(caller);
+ 		break;
+ 		default:
+ 			EMSG("%s unsupported opcode", __func__);
+diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
+index 6a7a47a7..d811af9f 100644
+--- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
++++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
+@@ -238,8 +238,7 @@ static psa_status_t unpack_image_info(void *buffer, =
uint32_t size)
+     return PSA_SUCCESS;
+ }
+=20
+-static psa_status_t get_image_info(struct rpc_caller *caller,
+-			   psa_handle_t platform_service_handle)
++static psa_status_t get_image_info(struct rpc_caller *caller)
+ {
+     psa_status_t status;
+     psa_handle_t handle;
+@@ -255,7 +254,7 @@ static psa_status_t get_image_info(struct rpc_caller=
 *caller,
+=20
+     memset(image_info_buffer, 0, IMAGE_INFO_BUFFER_SIZE);
+=20
+-    psa_call(caller, platform_service_handle, PSA_IPC_CALL,
++    psa_call(caller, TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_I=
OCTL,
+ 	     in_vec, IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
+=20
+     status =3D unpack_image_info(image_info_buffer, IMAGE_INFO_BUFFER_S=
IZE);
+@@ -288,12 +287,11 @@ static psa_status_t set_image_info(struct rpc_call=
er *caller)
+     return PSA_SUCCESS;
+ }
+=20
+-void set_fmp_image_info(struct rpc_caller *caller,
+-			psa_handle_t platform_service_handle)
++void set_fmp_image_info(struct rpc_caller *caller)
+ {
+     psa_status_t status;
+=20
+-    status =3D get_image_info(caller, platform_service_handle);
++    status =3D get_image_info(caller);
+     if (status !=3D PSA_SUCCESS) {
+ 	return;
+     }
+diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.h b/components/service/capsule_update/provider/corstone1000_fmp_=
service.h
+index 95fba2a0..963223e8 100644
+--- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
++++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
+@@ -16,8 +16,7 @@ extern "C" {
+=20
+ void provision_fmp_variables_metadata(struct rpc_caller *caller);
+=20
+-void set_fmp_image_info(struct rpc_caller *caller,
+-		psa_handle_t platform_service_handle);
++void set_fmp_image_info(struct rpc_caller *caller);
+=20
+ #ifdef __cplusplus
+ } /* extern "C" */
+diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
+index 7a29cc25..8103a9af 100644
+--- a/components/service/common/include/psa/sid.h
++++ b/components/service/common/include/psa/sid.h
+@@ -37,6 +37,12 @@ extern "C" {
+ #define TFM_CRYPTO_VERSION                                         (1U)
+ #define TFM_CRYPTO_HANDLE                                          (0x4=
0000100U)
+=20
++
++/******** TFM_PLATFORM_SERVICE *******/
++#define TFM_PLATFORM_API_ID_IOCTL         (1013)
++#define TFM_PLATFORM_SERVICE_HANDLE       (0x40000105U)
++
++
+ /**
+  * \brief Define a progressive numerical value for each SID which can b=
e used
+  *        when dispatching the requests to the service
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 2d90fe57..59009555 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -24,6 +24,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0020-FMP-Support-in-Corstone1000.patch;patchdir=3D../trusted-=
services \
     file://0021-smm_gateway-add-checks-for-null-attributes.patch;patchdi=
r=3D../trusted-services \
     file://0022-GetNextVariableName-Fix.patch;patchdir=3D../trusted-serv=
ices \
+    file://0023-Use-the-stateless-platform-service.patch;patchdir=3D../t=
rusted-services \
     "
=20
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
--=20
2.25.1


