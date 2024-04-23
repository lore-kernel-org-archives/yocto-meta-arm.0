Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B0CC04FFE
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 16:33:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23392.1713890021488525654
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 09:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01826339;
	Tue, 23 Apr 2024 09:34:09 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.21.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 376133F7BD;
	Tue, 23 Apr 2024 09:33:40 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>,
	Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 8/9] arm-bsp/trusted-services: rebase corstone1000 patches
Date: Tue, 23 Apr 2024 18:32:04 +0200
Message-ID: <20240423163205.5885-8-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240423163205.5885-1-gyorgy.szing@arm.com>
References: <20240423163205.5885-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 16:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5593

From: Gyorgy Szing <Gyorgy.Szing@arm.com>

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...ub-capsule-update-service-components.patch | 72 +++++++-------
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch | 39 ++++----
 .../0003-FMP-Support-in-Corstone1000.patch    | 48 ++++-----
 .../0004-GetNextVariableName-Fix.patch        | 38 +++++---
 ...0-add-compile-definitions-for-ECP_DP.patch |  9 +-
 ...0-Use-the-stateless-platform-service.patch | 40 ++++----
 ...0-Initialize-capsule-update-provider.patch | 97 ++++++++++++-------
 ...rstone1000-fix-synchronization-issue.patch | 42 ++++----
 ...0009-plat-corstone1000-fmp-client-id.patch | 19 ++--
 9 files changed, 227 insertions(+), 177 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0001-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp/reci=
pes-security/trusted-services/corstone1000/0001-Add-stub-capsule-update-s=
ervice-components.patch
index c1775b79..05999444 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-stub-capsule-update-service-components.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-stub-capsule-update-service-components.patch
@@ -1,7 +1,7 @@
-From a965129153a0cca340535fe2cf99dbfef9b557da Mon Sep 17 00:00:00 2001
+From e44a317a5ae283207926311cc71b18c117899c4a Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Tue, 12 Oct 2021 15:45:41 +0100
-Subject: [PATCH 1/6] Add stub capsule update service components
+Subject: [PATCH] Add stub capsule update service components
=20
 To facilitate development of a capsule update service provider,
 stub components are added to provide a starting point for an
@@ -15,7 +15,7 @@ Change-Id: I0d4049bb4de5af7ca80806403301692507085d28
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  .../backend/capsule_update_backend.h          |  24 ++++
- .../provider/capsule_update_provider.c        | 133 ++++++++++++++++++
+ .../provider/capsule_update_provider.c        | 135 ++++++++++++++++++
  .../provider/capsule_update_provider.h        |  51 +++++++
  .../capsule_update/provider/component.cmake   |  13 ++
  .../se-proxy/infra/corstone1000/infra.cmake   |   1 +
@@ -23,7 +23,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  .../capsule_update/capsule_update_proto.h     |  13 ++
  protocols/service/capsule_update/opcodes.h    |  17 +++
  protocols/service/capsule_update/parameters.h |  15 ++
- 9 files changed, 272 insertions(+), 4 deletions(-)
+ 9 files changed, 274 insertions(+), 4 deletions(-)
  create mode 100644 components/service/capsule_update/backend/capsule_up=
date_backend.h
  create mode 100644 components/service/capsule_update/provider/capsule_u=
pdate_provider.c
  create mode 100644 components/service/capsule_update/provider/capsule_u=
pdate_provider.h
@@ -34,7 +34,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
=20
 diff --git a/components/service/capsule_update/backend/capsule_update_ba=
ckend.h b/components/service/capsule_update/backend/capsule_update_backen=
d.h
 new file mode 100644
-index 000000000000..f3144ff1d7d5
+index 00000000..f3144ff1
 --- /dev/null
 +++ b/components/service/capsule_update/backend/capsule_update_backend.h
 @@ -0,0 +1,24 @@
@@ -64,10 +64,10 @@ index 000000000000..f3144ff1d7d5
 +#endif /* CAPSULE_UPDATE_BACKEND_H */
 diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
 new file mode 100644
-index 000000000000..e133753f8560
+index 00000000..f35c272d
 --- /dev/null
 +++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
-@@ -0,0 +1,133 @@
+@@ -0,0 +1,135 @@
 +/*
 + * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
 + *
@@ -92,8 +92,8 @@ index 000000000000..e133753f8560
 +};
 +
 +/* Service request handlers */
-+static rpc_status_t update_capsule_handler(void *context, struct call_r=
eq *req);
-+static rpc_status_t boot_confirmed_handler(void *context, struct call_r=
eq *req);
++static rpc_status_t update_capsule_handler(void *context, struct rpc_re=
quest *req);
++static rpc_status_t boot_confirmed_handler(void *context, struct rpc_re=
quest *req);
 +
 +/* Handler mapping table for service */
 +static const struct service_handler handler_table[] =3D {
@@ -101,21 +101,23 @@ index 000000000000..e133753f8560
 +	{CAPSULE_UPDATE_OPCODE_BOOT_CONFIRMED,			boot_confirmed_handler}
 +};
 +
-+struct rpc_interface *capsule_update_provider_init(
++struct rpc_service_interface *capsule_update_provider_init(
 +	struct capsule_update_provider *context)
 +{
-+	struct rpc_interface *rpc_interface =3D NULL;
++	struct rpc_service_interface *rpc_interface =3D NULL;
++	const struct rpc_uuid dummy_uuid =3D { .uuid =3D { 0 }};
++	if (!context)
++		return NULL;
 +
-+	if (context) {
++	service_provider_init(
++		&context->base_provider,
++		context,
++		&dummy_uuid,
++		handler_table,
++		sizeof(handler_table)/sizeof(struct service_handler));
 +
-+		service_provider_init(
-+			&context->base_provider,
-+			context,
-+			handler_table,
-+			sizeof(handler_table)/sizeof(struct service_handler));
++	rpc_interface =3D service_provider_get_rpc_interface(&context->base_pr=
ovider);
 +
-+		rpc_interface =3D service_provider_get_rpc_interface(&context->base_p=
rovider);
-+	}
 +
 +	return rpc_interface;
 +}
@@ -125,7 +127,7 @@ index 000000000000..e133753f8560
 +	(void)context;
 +}
 +
-+static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller *c=
aller)
++static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller_in=
terface *caller)
 +{
 +	uint32_t ioctl_id;
 +	psa_handle_t handle;
@@ -179,10 +181,10 @@ index 000000000000..e133753f8560
 +
 +}
 +
-+static rpc_status_t update_capsule_handler(void *context, struct call_r=
eq *req)
++static rpc_status_t update_capsule_handler(void *context, struct rpc_re=
quest *req)
 +{
 +	struct capsule_update_provider *this_instance =3D (struct capsule_upda=
te_provider*)context;
-+	struct rpc_caller *caller =3D this_instance->client.caller;
++	struct rpc_caller_interface *caller =3D this_instance->client.session-=
>caller;
 +	uint32_t opcode =3D req->opcode;
 +	rpc_status_t rpc_status =3D TS_RPC_ERROR_NOT_READY;
 +
@@ -190,10 +192,10 @@ index 000000000000..e133753f8560
 +	return rpc_status;
 +}
 +
-+static rpc_status_t boot_confirmed_handler(void *context, struct call_r=
eq *req)
++static rpc_status_t boot_confirmed_handler(void *context, struct rpc_re=
quest *req)
 +{
 +	struct capsule_update_provider *this_instance =3D (struct capsule_upda=
te_provider*)context;
-+	struct rpc_caller *caller =3D this_instance->client.caller;
++	struct rpc_caller_interface *caller =3D this_instance->client.session-=
>caller;
 +	uint32_t opcode =3D req->opcode;
 +	rpc_status_t rpc_status =3D TS_RPC_ERROR_NOT_READY;
 +
@@ -203,7 +205,7 @@ index 000000000000..e133753f8560
 +}
 diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.h b/components/service/capsule_update/provider/capsule_update_pro=
vider.h
 new file mode 100644
-index 000000000000..3de49854ea90
+index 00000000..71131417
 --- /dev/null
 +++ b/components/service/capsule_update/provider/capsule_update_provider=
.h
 @@ -0,0 +1,51 @@
@@ -216,7 +218,7 @@ index 000000000000..3de49854ea90
 +#ifndef CAPSULE_UPDATE_PROVIDER_H
 +#define CAPSULE_UPDATE_PROVIDER_H
 +
-+#include <rpc/common/endpoint/rpc_interface.h>
++#include <rpc/common/endpoint/rpc_service_interface.h>
 +#include <service/common/provider/service_provider.h>
 +#include <service/common/client/service_client.h>
 +#include <service/capsule_update/backend/capsule_update_backend.h>
@@ -240,9 +242,9 @@ index 000000000000..3de49854ea90
 + *
 + * @param[in] context The instance to initialize
 + *
-+ * \return An rpc_interface or NULL on failure
++ * \return An rpc_service_interface or NULL on failure
 + */
-+struct rpc_interface *capsule_update_provider_init(
++struct rpc_service_interface *capsule_update_provider_init(
 +	struct capsule_update_provider *context);
 +
 +/**
@@ -260,7 +262,7 @@ index 000000000000..3de49854ea90
 +#endif /* CAPSULE_UPDATE_PROVIDER_H */
 diff --git a/components/service/capsule_update/provider/component.cmake =
b/components/service/capsule_update/provider/component.cmake
 new file mode 100644
-index 000000000000..1d412eb234d9
+index 00000000..1d412eb2
 --- /dev/null
 +++ b/components/service/capsule_update/provider/component.cmake
 @@ -0,0 +1,13 @@
@@ -278,7 +280,7 @@ index 000000000000..1d412eb234d9
 +	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
 +	)
 diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
-index 4e7e2bd58028..e60b5400617f 100644
+index 4e7e2bd5..e60b5400 100644
 --- a/deployments/se-proxy/infra/corstone1000/infra.cmake
 +++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
 @@ -21,6 +21,7 @@ add_components(TARGET "se-proxy"
@@ -290,7 +292,7 @@ index 4e7e2bd58028..e60b5400617f 100644
  )
 =20
 diff --git a/deployments/se-proxy/se_proxy_interfaces.h b/deployments/se=
-proxy/se_proxy_interfaces.h
-index 48908f846990..3d4a7c204785 100644
+index 48908f84..3d4a7c20 100644
 --- a/deployments/se-proxy/se_proxy_interfaces.h
 +++ b/deployments/se-proxy/se_proxy_interfaces.h
 @@ -8,9 +8,10 @@
@@ -310,7 +312,7 @@ index 48908f846990..3d4a7c204785 100644
  #endif /* SE_PROXY_INTERFACES_H */
 diff --git a/protocols/service/capsule_update/capsule_update_proto.h b/p=
rotocols/service/capsule_update/capsule_update_proto.h
 new file mode 100644
-index 000000000000..8f326cd387fb
+index 00000000..8f326cd3
 --- /dev/null
 +++ b/protocols/service/capsule_update/capsule_update_proto.h
 @@ -0,0 +1,13 @@
@@ -329,7 +331,7 @@ index 000000000000..8f326cd387fb
 +#endif /* CAPSULE_UPDATE_PROTO_H */
 diff --git a/protocols/service/capsule_update/opcodes.h b/protocols/serv=
ice/capsule_update/opcodes.h
 new file mode 100644
-index 000000000000..8185a0902378
+index 00000000..8185a090
 --- /dev/null
 +++ b/protocols/service/capsule_update/opcodes.h
 @@ -0,0 +1,17 @@
@@ -352,7 +354,7 @@ index 000000000000..8185a0902378
 +#endif /* CAPSULE_UPDATE_OPCODES_H */
 diff --git a/protocols/service/capsule_update/parameters.h b/protocols/s=
ervice/capsule_update/parameters.h
 new file mode 100644
-index 000000000000..285d924186be
+index 00000000..285d9241
 --- /dev/null
 +++ b/protocols/service/capsule_update/parameters.h
 @@ -0,0 +1,15 @@
@@ -372,5 +374,5 @@ index 000000000000..285d924186be
 +
 +#endif /* CAPSULE_UPDATE_PARAMETERS_H */
 --=20
-2.40.0
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0002-Fixes-in-AEAD-for-psa-arch=
-test-54-and-58.patch
index 3f3800ce..7a2c796e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Fi=
xes-in-AEAD-for-psa-arch-test-54-and-58.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Fi=
xes-in-AEAD-for-psa-arch-test-54-and-58.patch
@@ -1,4 +1,4 @@
-From 51a7024967187644011c5043ef0f733cf81b26be Mon Sep 17 00:00:00 2001
+From 1ab4f9dda5d3f6a4828dc3154cf5bf71d6d744d4 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Mon, 14 Feb 2022 08:22:25 +0000
 Subject: [PATCH 2/6] Fixes in AEAD for psa-arch test 54 and 58.
@@ -17,10 +17,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  6 files changed, 12 insertions(+), 3 deletions(-)
=20
 diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_aead.h b/components/service/crypto/client/caller/packed-c/crypto_call=
er_aead.h
-index c4ffb20cf7f8..a91f66c14008 100644
+index bf39762b..27ffbc66 100644
 --- a/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
 +++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
-@@ -309,6 +309,7 @@ static inline psa_status_t crypto_caller_aead_update=
(struct service_client *cont
+@@ -314,6 +314,7 @@ static inline psa_status_t crypto_caller_aead_update=
(struct service_client *cont
  	size_t req_len =3D req_fixed_len;
 =20
  	*output_length =3D 0;
@@ -29,7 +29,7 @@ index c4ffb20cf7f8..a91f66c14008 100644
 =20
  	/* Mandatory input data parameter */
 diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/comp=
onents/service/crypto/include/psa/crypto_sizes.h
-index 30aa102da581..130d27295878 100644
+index 30aa102d..130d2729 100644
 --- a/components/service/crypto/include/psa/crypto_sizes.h
 +++ b/components/service/crypto/include/psa/crypto_sizes.h
 @@ -351,7 +351,7 @@
@@ -42,10 +42,10 @@ index 30aa102da581..130d27295878 100644
  /** A sufficient output buffer size for psa_aead_update().
   *
 diff --git a/components/service/crypto/provider/extension/aead/aead_prov=
ider.c b/components/service/crypto/provider/extension/aead/aead_provider.=
c
-index 14a25436b3f6..6b144db821de 100644
+index 696474e8..66aee9e4 100644
 --- a/components/service/crypto/provider/extension/aead/aead_provider.c
 +++ b/components/service/crypto/provider/extension/aead/aead_provider.c
-@@ -283,10 +283,11 @@ static rpc_status_t aead_update_handler(void *cont=
ext, struct call_req *req)
+@@ -280,10 +280,11 @@ static rpc_status_t aead_update_handler(void *cont=
ext, struct rpc_request *req)
  	uint32_t op_handle;
  	const uint8_t *input;
  	size_t input_len;
@@ -56,9 +56,9 @@ index 14a25436b3f6..6b144db821de 100644
 -			&input, &input_len);
 +			&recv_output_size, &input, &input_len);
 =20
- 	if (rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) {
+ 	if (rpc_status =3D=3D RPC_SUCCESS) {
 =20
-@@ -300,9 +301,12 @@ static rpc_status_t aead_update_handler(void *conte=
xt, struct call_req *req)
+@@ -297,9 +298,12 @@ static rpc_status_t aead_update_handler(void *conte=
xt, struct rpc_request *req)
  		if (crypto_context) {
 =20
  			size_t output_len =3D 0;
@@ -73,30 +73,30 @@ index 14a25436b3f6..6b144db821de 100644
 =20
  				psa_status =3D psa_aead_update(&crypto_context->op.aead,
 diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/aead_provider_serializer.h b/components/service/crypto/provider/extensi=
on/aead/serializer/aead_provider_serializer.h
-index bb1a2a97e4b7..0156aaba3fe3 100644
+index 2bf7a015..733d2e75 100644
 --- a/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
 +++ b/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
 @@ -51,6 +51,7 @@ struct aead_provider_serializer {
  	/* Operation: aead_update */
- 	rpc_status_t (*deserialize_aead_update_req)(const struct call_param_bu=
f *req_buf,
+ 	rpc_status_t (*deserialize_aead_update_req)(const struct rpc_buffer *r=
eq_buf,
  		uint32_t *op_handle,
 +                uint32_t *output_size,
  		const uint8_t **input, size_t *input_len);
 =20
- 	rpc_status_t (*serialize_aead_update_resp)(struct call_param_buf *resp=
_buf,
+ 	rpc_status_t (*serialize_aead_update_resp)(struct rpc_buffer *resp_buf=
,
 diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/packed-c/packedc_aead_provider_serializer.c b/components/service/crypto=
/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serial=
izer.c
-index 6f00b3e3f6f1..45c739abcbb4 100644
+index 738d5f23..9440a084 100644
 --- a/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
 +++ b/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
-@@ -192,6 +192,7 @@ static rpc_status_t deserialize_aead_update_ad_req(c=
onst struct call_param_buf *
+@@ -192,6 +192,7 @@ static rpc_status_t deserialize_aead_update_ad_req(c=
onst struct rpc_buffer *req_
  /* Operation: aead_update */
- static rpc_status_t deserialize_aead_update_req(const struct call_param=
_buf *req_buf,
+ static rpc_status_t deserialize_aead_update_req(const struct rpc_buffer=
 *req_buf,
  	uint32_t *op_handle,
 +        uint32_t *output_size,
  	const uint8_t **input, size_t *input_len)
  {
- 	rpc_status_t rpc_status =3D TS_RPC_ERROR_INVALID_REQ_BODY;
-@@ -208,6 +209,7 @@ static rpc_status_t deserialize_aead_update_req(cons=
t struct call_param_buf *req
+ 	rpc_status_t rpc_status =3D RPC_ERROR_INVALID_REQUEST_BODY;
+@@ -208,6 +209,7 @@ static rpc_status_t deserialize_aead_update_req(cons=
t struct rpc_buffer *req_buf
  		memcpy(&recv_msg, req_buf->data, expected_fixed_len);
 =20
  		*op_handle =3D recv_msg.op_handle;
@@ -105,7 +105,7 @@ index 6f00b3e3f6f1..45c739abcbb4 100644
  		tlv_const_iterator_begin(&req_iter,
  			(uint8_t*)req_buf->data + expected_fixed_len,
 diff --git a/protocols/service/crypto/packed-c/aead.h b/protocols/servic=
e/crypto/packed-c/aead.h
-index 0be266b52403..435fd3b523ce 100644
+index 0be266b5..435fd3b5 100644
 --- a/protocols/service/crypto/packed-c/aead.h
 +++ b/protocols/service/crypto/packed-c/aead.h
 @@ -98,6 +98,7 @@ enum
@@ -117,5 +117,8 @@ index 0be266b52403..435fd3b523ce 100644
 =20
  /* Variable length input parameter tags */
 --=20
-2.40.0
+2.25.1
+
+
+
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0003-FMP-Support-in-Corstone1000.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/corstone1000/0003-FMP-Support-in-Corstone1000.patch
index 3d743d28..5218d068 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-FM=
P-Support-in-Corstone1000.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-FM=
P-Support-in-Corstone1000.patch
@@ -1,7 +1,7 @@
-From 5c8ac10337ac853d8a82992fb6e1d91b122b99d2 Mon Sep 17 00:00:00 2001
+From 33dae70ae2786cf12070d063ff74cfe0df1f4f50 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Fri, 8 Jul 2022 09:48:06 +0100
-Subject: [PATCH 3/6] FMP Support in Corstone1000.
+Subject: [PATCH] FMP Support in Corstone1000.
=20
 The FMP support is used by u-boot to pupolate ESRT information
 for the kernel.
@@ -22,7 +22,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 components/service/capsule_update/provider/corstone1=
000_fmp_service.h
=20
 diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
-index e133753f8560..991a2235cd73 100644
+index f35c272d..bfeb7301 100644
 --- a/components/service/capsule_update/provider/capsule_update_provider=
.c
 +++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
 @@ -11,6 +11,7 @@
@@ -33,16 +33,16 @@ index e133753f8560..991a2235cd73 100644
 =20
 =20
  #define CAPSULE_UPDATE_REQUEST (0x1)
-@@ -47,6 +48,8 @@ struct rpc_interface *capsule_update_provider_init(
- 		rpc_interface =3D service_provider_get_rpc_interface(&context->base_p=
rovider);
- 	}
+@@ -49,6 +50,8 @@ struct rpc_service_interface *capsule_update_provider_=
init(
+ 	rpc_interface =3D service_provider_get_rpc_interface(&context->base_pr=
ovider);
 =20
-+	provision_fmp_variables_metadata(context->client.caller);
+=20
++	provision_fmp_variables_metadata(context->client.session->caller);
 +
  	return rpc_interface;
  }
 =20
-@@ -85,6 +88,7 @@ static rpc_status_t event_handler(uint32_t opcode, str=
uct rpc_caller *caller)
+@@ -87,6 +90,7 @@ static rpc_status_t event_handler(uint32_t opcode, str=
uct rpc_caller_interface *
  		}
  		psa_call(caller,handle, PSA_IPC_CALL,
  			in_vec,IOVEC_LEN(in_vec), NULL, 0);
@@ -50,7 +50,7 @@ index e133753f8560..991a2235cd73 100644
  		break;
 =20
  		case KERNEL_STARTED_EVENT:
-@@ -99,6 +103,7 @@ static rpc_status_t event_handler(uint32_t opcode, st=
ruct rpc_caller *caller)
+@@ -101,6 +105,7 @@ static rpc_status_t event_handler(uint32_t opcode, s=
truct rpc_caller_interface *
  		}
  		psa_call(caller,handle, PSA_IPC_CALL,
  			in_vec,IOVEC_LEN(in_vec), NULL, 0);
@@ -59,7 +59,7 @@ index e133753f8560..991a2235cd73 100644
  		default:
  			EMSG("%s unsupported opcode", __func__);
 diff --git a/components/service/capsule_update/provider/component.cmake =
b/components/service/capsule_update/provider/component.cmake
-index 1d412eb234d9..6b0601494938 100644
+index 1d412eb2..6b060149 100644
 --- a/components/service/capsule_update/provider/component.cmake
 +++ b/components/service/capsule_update/provider/component.cmake
 @@ -10,4 +10,5 @@ endif()
@@ -70,7 +70,7 @@ index 1d412eb234d9..6b0601494938 100644
  	)
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
 new file mode 100644
-index 000000000000..6a7a47a7ed99
+index 00000000..56ce3857
 --- /dev/null
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 @@ -0,0 +1,307 @@
@@ -155,7 +155,7 @@ index 000000000000..6a7a47a7ed99
 +    },
 +};
 +
-+static psa_status_t protected_storage_set(struct rpc_caller *caller,
++static psa_status_t protected_storage_set(struct rpc_caller_interface *=
caller,
 +	psa_storage_uid_t uid, size_t data_length, const void *p_data)
 +{
 +	psa_status_t psa_status;
@@ -175,7 +175,7 @@ index 000000000000..6a7a47a7ed99
 +	return psa_status;
 +}
 +
-+static psa_status_t protected_storage_get(struct rpc_caller *caller,
++static psa_status_t protected_storage_get(struct rpc_caller_interface *=
caller,
 +	psa_storage_uid_t uid, size_t data_size, void *p_data)
 +{
 +	psa_status_t psa_status;
@@ -200,7 +200,7 @@ index 000000000000..6a7a47a7ed99
 +	}
 +
 +	return psa_status;
-+}=09
++}
 +
 +static uint64_t name_hash(EFI_GUID *guid, size_t name_size,
 +	const int16_t *name)
@@ -216,7 +216,7 @@ index 000000000000..6a7a47a7ed99
 +	for (int i =3D 0; i < 8; ++i) {
 +
 +		hash =3D ((hash << 5) + hash) + guid->Data4[i];
-+	}  =20
++	}
 +
 +	/* Extend to cover name up to but not including null terminator */
 +	for (int i =3D 0; i < name_size / sizeof(int16_t); ++i) {
@@ -241,7 +241,7 @@ index 000000000000..6a7a47a7ed99
 +}
 +
 +
-+void provision_fmp_variables_metadata(struct rpc_caller *caller)
++void provision_fmp_variables_metadata(struct rpc_caller_interface *call=
er)
 +{
 +    struct variable_metadata metadata;
 +    psa_status_t status;
@@ -314,7 +314,7 @@ index 000000000000..6a7a47a7ed99
 +    return PSA_SUCCESS;
 +}
 +
-+static psa_status_t get_image_info(struct rpc_caller *caller,
++static psa_status_t get_image_info(struct rpc_caller_interface *caller,
 +			   psa_handle_t platform_service_handle)
 +{
 +    psa_status_t status;
@@ -342,12 +342,12 @@ index 000000000000..6a7a47a7ed99
 +    return PSA_SUCCESS;
 +}
 +
-+static psa_status_t set_image_info(struct rpc_caller *caller)
++static psa_status_t set_image_info(struct rpc_caller_interface *caller)
 +{
 +    psa_status_t status;
 +
 +    for (int i =3D 0; i < FMP_VARIABLES_COUNT; i++) {
-+=09
++
 +	status =3D protected_storage_set(caller,
 +			fmp_variables_metadata[i].uid,
 +			fmp_variables_data[i].len, fmp_variables_data[i].base);
@@ -364,7 +364,7 @@ index 000000000000..6a7a47a7ed99
 +    return PSA_SUCCESS;
 +}
 +
-+void set_fmp_image_info(struct rpc_caller *caller,
++void set_fmp_image_info(struct rpc_caller_interface *caller,
 +			psa_handle_t platform_service_handle)
 +{
 +    psa_status_t status;
@@ -383,7 +383,7 @@ index 000000000000..6a7a47a7ed99
 +}
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.h b/components/service/capsule_update/provider/corstone1000_fmp_=
service.h
 new file mode 100644
-index 000000000000..95fba2a04d5c
+index 00000000..d0023dc0
 --- /dev/null
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
 @@ -0,0 +1,26 @@
@@ -403,9 +403,9 @@ index 000000000000..95fba2a04d5c
 +#include <rpc_caller.h>
 +#include <psa/client.h>
 +
-+void provision_fmp_variables_metadata(struct rpc_caller *caller);
++void provision_fmp_variables_metadata(struct rpc_caller_interface *call=
er);
 +
-+void set_fmp_image_info(struct rpc_caller *caller,
++void set_fmp_image_info(struct rpc_caller_interface *caller,
 +		psa_handle_t platform_service_handle);
 +
 +#ifdef __cplusplus
@@ -414,5 +414,5 @@ index 000000000000..95fba2a04d5c
 +
 +#endif /* CORSTONE1000_FMP_SERVICE_H */
 --=20
-2.40.0
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0004-GetNextVariableName-Fix.patch b/meta-arm-bsp/recipes-security/truste=
d-services/corstone1000/0004-GetNextVariableName-Fix.patch
index ed4e6e27..a8e7f7c9 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-Ge=
tNextVariableName-Fix.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-Ge=
tNextVariableName-Fix.patch
@@ -1,33 +1,43 @@
-From 2aa665ad2cb13bc79b645db41686449a47593aab Mon Sep 17 00:00:00 2001
-From: Emekcan <emekcan.aras@arm.com>
-Date: Thu, 3 Nov 2022 17:43:40 +0000
-Subject: [PATCH] smm_gateway: GetNextVariableName Fix
+From a0056ea1d994f1ec4da8ccae45abab2d2461f0a2 Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Date: Thu, 16 Nov 2023 18:14:46 +0000
+Subject: [PATCH 1/1] smm_gateway: GetNextVariableName Fix
=20
-GetNextVariableName() should return EFI_BUFFER_TOO_SMALL=20
-when NameSize is smaller than the actual NameSize. It=20
+GetNextVariableName() should return EFI_BUFFER_TOO_SMALL
+when requested NameSize is smaller than the actual. It
 currently returns EFI_BUFFER_OUT_OF_RESOURCES due to setting
-max_name_len incorrectly. This fixes max_name_len error by
-replacing it with actual NameSize request by u-boot.
+max_name_len incorrectly. This change fixes the error by
+using clamping the maximum size to the NameSize requested by
+the client.
=20
 Upstream-Status: Pending
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
 ---
- .../service/smm_variable/provider/smm_variable_provider.c       | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ .../service/smm_variable/provider/smm_variable_provider.c     | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
=20
 diff --git a/components/service/smm_variable/provider/smm_variable_provi=
der.c b/components/service/smm_variable/provider/smm_variable_provider.c
-index a9679b7e..6a4b6fa7 100644
+index f1c3c712..7ec49af5 100644
 --- a/components/service/smm_variable/provider/smm_variable_provider.c
 +++ b/components/service/smm_variable/provider/smm_variable_provider.c
-@@ -197,7 +197,7 @@ static rpc_status_t get_next_variable_name_handler(v=
oid *context, struct call_re
+@@ -190,15 +190,13 @@ static rpc_status_t get_next_variable_name_handler=
(void *context, struct rpc_req
+ 		if (resp_buf->size >=3D param_len) {
+=20
+ 			struct rpc_buffer *req_buf =3D &req->request;
+-			size_t max_name_len =3D resp_buf->size -
+-				SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_NAME_OFFSET;
+=20
+ 			memmove(resp_buf->data, req_buf->data, param_len);
+=20
  			efi_status =3D uefi_variable_store_get_next_variable_name(
  				&this_instance->variable_store,
  				(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data,
 -				max_name_len,
 +				((SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data)-=
>NameSize,
- 				&resp_buf->data_len);
+ 				&resp_buf->data_length);
  		}
  		else {
 --=20
-2.17.1
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0005-plat-corstone10=
00-add-compile-definitions-for-ECP_DP.patch
index 5d7ab5f5..3e37ba87 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-pl=
at-corstone1000-add-compile-definitions-for-ECP_DP.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-pl=
at-corstone1000-add-compile-definitions-for-ECP_DP.patch
@@ -1,4 +1,4 @@
-From 041d30bb9cc6857f5ef26ded154ff7126dafaa20 Mon Sep 17 00:00:00 2001
+From 4816a705e7917ee58d3972fefe163189eb412d36 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Fri, 16 Jun 2023 10:47:48 +0100
 Subject: [PATCH] plat: corstone1000: add compile definitions for
@@ -9,21 +9,20 @@ Without setting this, corstone1000 fails psa-api-crypto=
-test no 243.
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Upstream-Status: Pending
-
 ---
  platform/providers/arm/corstone1000/platform.cmake | 2 ++
  1 file changed, 2 insertions(+)
=20
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index dbdf1097..e7a295dd 100644
+index a3c4209b..ff044ed7 100644
 --- a/platform/providers/arm/corstone1000/platform.cmake
 +++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -14,3 +14,5 @@ target_compile_definitions(${TGT} PRIVATE
+@@ -13,3 +13,5 @@ target_compile_definitions(${TGT} PRIVATE
  	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
  	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D100
  )
 +
 +add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
 --=20
-2.17.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0006-plat-corstone1000-Use-the-stateless-platform-service.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0006-plat-corstone10=
00-Use-the-stateless-platform-service.patch
index 4e9d5c2e..4381f75e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-pl=
at-corstone1000-Use-the-stateless-platform-service.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-pl=
at-corstone1000-Use-the-stateless-platform-service.patch
@@ -1,9 +1,9 @@
-From a71e99045996c57a4f80509ae8b770aa4f73f6c0 Mon Sep 17 00:00:00 2001
+From b07d29440b5ca8d1f3b9a4f03786bb3127930a64 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Sun, 18 Jun 2023 14:38:42 +0100
-Subject: [PATCH] plat: corstone1000: Use the stateless platform service =
calls
- Calls to psa_connect is not needed and psa_call can be called directly =
with a
- pre defined handle.
+Subject: [PATCH] plat: corstone1000: Use the stateless platform service
+ calls Calls to psa_connect is not needed and psa_call can be called dir=
ectly
+ with a pre defined handle.
=20
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
 Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
@@ -18,18 +18,18 @@ Upstream-Status: Inappropriate [Design is to revisted=
]
  4 files changed, 17 insertions(+), 27 deletions(-)
=20
 diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
-index 991a2235..6809249f 100644
+index bfeb7301..12c552da 100644
 --- a/components/service/capsule_update/provider/capsule_update_provider=
.c
 +++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
-@@ -61,7 +61,6 @@ void capsule_update_provider_deinit(struct capsule_upd=
ate_provider *context)
- static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller *c=
aller)
+@@ -63,7 +63,6 @@ void capsule_update_provider_deinit(struct capsule_upd=
ate_provider *context)
+ static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller_in=
terface *caller)
  {
  	uint32_t ioctl_id;
 -	psa_handle_t handle;
  	rpc_status_t rpc_status =3D TS_RPC_CALL_ACCEPTED;
 =20
  	struct psa_invec in_vec[] =3D {
-@@ -79,31 +78,18 @@ static rpc_status_t event_handler(uint32_t opcode, s=
truct rpc_caller *caller)
+@@ -81,31 +80,18 @@ static rpc_status_t event_handler(uint32_t opcode, s=
truct rpc_caller_interface *
  		case CAPSULE_UPDATE_REQUEST:
  		/* Openamp call with IOCTL for firmware update*/
  		ioctl_id =3D IOCTL_CORSTONE1000_FWU_FLASH_IMAGES;
@@ -67,20 +67,20 @@ index 991a2235..6809249f 100644
  		default:
  			EMSG("%s unsupported opcode", __func__);
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
-index 6a7a47a7..d811af9f 100644
+index 56ce3857..bebdf859 100644
 --- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 @@ -238,8 +238,7 @@ static psa_status_t unpack_image_info(void *buffer, =
uint32_t size)
      return PSA_SUCCESS;
  }
 =20
--static psa_status_t get_image_info(struct rpc_caller *caller,
+-static psa_status_t get_image_info(struct rpc_caller_interface *caller,
 -			   psa_handle_t platform_service_handle)
-+static psa_status_t get_image_info(struct rpc_caller *caller)
++static psa_status_t get_image_info(struct rpc_caller_interface *caller)
  {
      psa_status_t status;
      psa_handle_t handle;
-@@ -255,7 +254,7 @@ static psa_status_t get_image_info(struct rpc_caller=
 *caller,
+@@ -255,7 +254,7 @@ static psa_status_t get_image_info(struct rpc_caller=
_interface *caller,
 =20
      memset(image_info_buffer, 0, IMAGE_INFO_BUFFER_SIZE);
 =20
@@ -89,13 +89,13 @@ index 6a7a47a7..d811af9f 100644
  	     in_vec, IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
 =20
      status =3D unpack_image_info(image_info_buffer, IMAGE_INFO_BUFFER_S=
IZE);
-@@ -288,12 +287,11 @@ static psa_status_t set_image_info(struct rpc_call=
er *caller)
+@@ -288,12 +287,11 @@ static psa_status_t set_image_info(struct rpc_call=
er_interface *caller)
      return PSA_SUCCESS;
  }
 =20
--void set_fmp_image_info(struct rpc_caller *caller,
+-void set_fmp_image_info(struct rpc_caller_interface *caller,
 -			psa_handle_t platform_service_handle)
-+void set_fmp_image_info(struct rpc_caller *caller)
++void set_fmp_image_info(struct rpc_caller_interface *caller)
  {
      psa_status_t status;
 =20
@@ -105,16 +105,16 @@ index 6a7a47a7..d811af9f 100644
  	return;
      }
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.h b/components/service/capsule_update/provider/corstone1000_fmp_=
service.h
-index 95fba2a0..963223e8 100644
+index d0023dc0..486fa10b 100644
 --- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
 @@ -16,8 +16,7 @@ extern "C" {
 =20
- void provision_fmp_variables_metadata(struct rpc_caller *caller);
+ void provision_fmp_variables_metadata(struct rpc_caller_interface *call=
er);
 =20
--void set_fmp_image_info(struct rpc_caller *caller,
+-void set_fmp_image_info(struct rpc_caller_interface *caller,
 -		psa_handle_t platform_service_handle);
-+void set_fmp_image_info(struct rpc_caller *caller);
++void set_fmp_image_info(struct rpc_caller_interface *caller);
 =20
  #ifdef __cplusplus
  } /* extern "C" */
@@ -137,5 +137,5 @@ index 5aaa659d..fc3a4fb0 100644
  #define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x0=
0000040U)
  #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
 --=20
-2.17.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0007-plat-corstone1000-Initialize-capsule-update-provider.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0007-plat-corstone10=
00-Initialize-capsule-update-provider.patch
index 3e6f606c..5f06cb51 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-pl=
at-corstone1000-Initialize-capsule-update-provider.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-pl=
at-corstone1000-Initialize-capsule-update-provider.patch
@@ -1,6 +1,6 @@
-From b5b31064959665f4cc616733be3d989ae4356636 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Sun, 18 Jun 2023 16:05:27 +0100
+From c304d5b2e4319542b33abbd43b06a694d6895628 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 29 Nov 2023 15:40:21 +0100
 Subject: [PATCH] plat: corstone1000: Initialize capsule update provider
=20
 Initializes the capsule update service provider in se-proxy-sp.c deploym=
ent
@@ -10,69 +10,98 @@ Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Upstream-Status: Inappropriate [Design is to revisted]
=20
 ---
- deployments/se-proxy/env/commonsp/se_proxy_sp.c |  3 +++
- .../infra/corstone1000/service_proxy_factory.c  | 17 +++++++++++++++++
- .../se-proxy/infra/service_proxy_factory.h      |  1 +
- 3 files changed, 21 insertions(+)
+ .../se-proxy/env/commonsp/se_proxy_sp.c       | 14 +++++++++-
+ .../corstone1000/service_proxy_factory.c      | 28 +++++++++++++++++++
+ .../se-proxy/infra/service_proxy_factory.h    |  1 +
+ 3 files changed, 42 insertions(+), 1 deletion(-)
=20
 diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
-index 45fcb385..dc2a9d49 100644
+index 155e9486..a0eb03b6 100644
 --- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
 +++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
-@@ -77,6 +77,9 @@ void __noreturn sp_main(struct ffa_init_info *init_inf=
o)
+@@ -39,7 +39,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
+ 		goto fatal_error;
+ 	}
+=20
+-	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 4, 16);
++	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 5, 16);
+ 	if (rpc_status !=3D RPC_SUCCESS) {
+ 		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
+ 		goto fatal_error;
+@@ -94,6 +94,18 @@ void __noreturn sp_main(union ffa_boot_info *boot_inf=
o)
+ 		goto fatal_error;
  	}
- 	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_ATTEST, rpc_iface);
 =20
 +	rpc_iface =3D capsule_update_proxy_create();
-+	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_CAPSULE_UPDATE, rpc=
_iface);
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
 +
  	/* End of boot phase */
  	result =3D sp_msg_wait(&req_msg);
  	if (result !=3D SP_RESULT_OK) {
 diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index bacab1de..32d88c97 100644
+index 6885f928..bbab80e5 100644
 --- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
 +++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-@@ -14,6 +14,7 @@
+@@ -11,6 +11,7 @@
+ #include <rpc/psa_ipc/caller/sp/psa_ipc_caller.h>
+ #include <service/attestation/provider/attest_provider.h>
+ #include <service/attestation/provider/serializer/packed-c/packedc_atte=
st_provider_serializer.h>
++#include <service/capsule_update/provider/capsule_update_provider.h>
  #include <service/crypto/factory/crypto_provider_factory.h>
  #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
- #include <trace.h>
-+#include <service/capsule_update/provider/capsule_update_provider.h>
+ #include "service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_uuid.h"
+@@ -129,3 +130,30 @@ struct rpc_service_interface *its_proxy_create(void=
)
 =20
- /* backends */
- #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-@@ -94,3 +95,19 @@ struct rpc_interface *its_proxy_create(void)
-=20
- 	return secure_storage_provider_init(&its_provider, backend);
+ 	return secure_storage_provider_init(&its_provider, backend, &its_uuid)=
;
  }
 +
-+struct rpc_interface *capsule_update_proxy_create(void)
++struct rpc_service_interface *capsule_update_proxy_create(void)
 +{
 +	static struct capsule_update_provider capsule_update_provider;
-+	static struct rpc_caller *capsule_update_caller;
++	static struct secure_storage_ipc capsule_update_backend;
++	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
++
++	/* Static objects for proxy instance */
++	static struct rpc_caller_interface psa_ipc =3D { 0 };
++	static struct rpc_caller_session rpc_session =3D { 0 };
 +
-+	capsule_update_caller =3D psa_ipc_caller_init(&psa_ipc);
++	rpc_status =3D psa_ipc_caller_init(&psa_ipc);
++	if (rpc_status !=3D RPC_SUCCESS)
++		return NULL;
 +
-+	if (!capsule_update_caller)
-+	return NULL;
++	rpc_status =3D rpc_caller_session_open(&rpc_session, &psa_ipc, &dummy_=
uuid, 0, 0);
++	if (rpc_status !=3D RPC_SUCCESS)
++		return NULL;
 +
-+	capsule_update_provider.client.caller =3D capsule_update_caller;
++
++	capsule_update_provider.client.session =3D &rpc_session;
++	capsule_update_provider.client.rpc_status =3D RPC_SUCCESS;
++	capsule_update_provider.client.service_info.supported_encodings =3D 0;
++	capsule_update_provider.client.service_info.max_payload =3D 4096;
 +
 +	return capsule_update_provider_init(&capsule_update_provider);
 +}
-+
 diff --git a/deployments/se-proxy/infra/service_proxy_factory.h b/deploy=
ments/se-proxy/infra/service_proxy_factory.h
-index 298d407a..02aa7fe2 100644
+index caaea79e..b981754b 100644
 --- a/deployments/se-proxy/infra/service_proxy_factory.h
 +++ b/deployments/se-proxy/infra/service_proxy_factory.h
-@@ -17,6 +17,7 @@ struct rpc_interface *attest_proxy_create(void);
- struct rpc_interface *crypto_proxy_create(void);
- struct rpc_interface *ps_proxy_create(void);
- struct rpc_interface *its_proxy_create(void);
-+struct rpc_interface *capsule_update_proxy_create(void);
+@@ -17,6 +17,7 @@ struct rpc_service_interface *attest_proxy_create(void=
);
+ struct rpc_service_interface *crypto_proxy_create(void);
+ struct rpc_service_interface *ps_proxy_create(void);
+ struct rpc_service_interface *its_proxy_create(void);
++struct rpc_service_interface *capsule_update_proxy_create(void);
 =20
  #ifdef __cplusplus
  }
 --=20
-2.17.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0008-platform-corstone1000-fix-synchronization-issue.patch b/meta-arm-bsp=
/recipes-security/trusted-services/corstone1000/0008-platform-corstone100=
0-fix-synchronization-issue.patch
index 5d8f7318..7df00974 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-pl=
atform-corstone1000-fix-synchronization-issue.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-pl=
atform-corstone1000-fix-synchronization-issue.patch
@@ -1,7 +1,8 @@
-From 06c3e612cb0927d783f115077d83ed97841c5668 Mon Sep 17 00:00:00 2001
+From e8f0a013acc02c82c9193f6ab7970e80fb0f961e Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Tue, 14 Nov 2023 14:43:44 +0000
-Subject: [PATCH] plat: corstone1000: fix synchronization issue on openam=
p notification
+Subject: [PATCH] plat: corstone1000: fix synchronization issue on openam=
p
+ notification
=20
 This fixes a race that is observed rarely in the FVP. It occurs in FVP
 when Secure Enclave sends the notication ack in openamp, and then reset =
the access
@@ -20,22 +21,22 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  3 files changed, 43 insertions(+), 1 deletion(-)
=20
 diff --git a/components/messaging/openamp/sp/openamp_mhu.c b/components/=
messaging/openamp/sp/openamp_mhu.c
-index bafba3e3..0700b8b9 100644
+index bafba3e37..e96de6059 100644
 --- a/components/messaging/openamp/sp/openamp_mhu.c
 +++ b/components/messaging/openamp/sp/openamp_mhu.c
 @@ -85,7 +85,7 @@ int openamp_mhu_notify_peer(struct openamp_messenger *=
openamp)
-	struct mhu_v2_x_dev_t *tx_dev;
-	enum mhu_v2_x_error_t ret;
-	struct openamp_mhu *mhu;
+ 	struct mhu_v2_x_dev_t *tx_dev;
+ 	enum mhu_v2_x_error_t ret;
+ 	struct openamp_mhu *mhu;
 -	uint32_t access_ready;
 +	uint32_t access_ready,val;
-
-	if (!openamp->transport) {
-		EMSG("openamp: mhu: notify transport not initialized");
+=20
+ 	if (!openamp->transport) {
+ 		EMSG("openamp: mhu: notify transport not initialized");
 @@ -116,6 +116,13 @@ int openamp_mhu_notify_peer(struct openamp_messenge=
r *openamp)
-		return -EPROTO;
-	}
-
+ 		return -EPROTO;
+ 	}
+=20
 +	do {
 +		ret =3D mhu_v2_x_channel_poll(tx_dev, MHU_V_2_NOTIFY_CHANNEL, &val);
 +		if (ret !=3D MHU_V_2_X_ERR_NONE) {
@@ -43,17 +44,17 @@ index bafba3e3..0700b8b9 100644
 +		}
 +	} while (val !=3D 0);
 +
-	ret =3D mhu_v2_x_reset_access_request(tx_dev);
-	if (ret !=3D MHU_V_2_X_ERR_NONE) {
-		EMSG("openamp: mhu: failed reset access request");
+ 	ret =3D mhu_v2_x_reset_access_request(tx_dev);
+ 	if (ret !=3D MHU_V_2_X_ERR_NONE) {
+ 		EMSG("openamp: mhu: failed reset access request");
 diff --git a/platform/drivers/arm/mhu_driver/mhu_v2.h b/platform/drivers=
/arm/mhu_driver/mhu_v2.h
-index 26b3a5d6..2b4d6fcb 100644
+index 26b3a5d63..2b4d6fcb6 100644
 --- a/platform/drivers/arm/mhu_driver/mhu_v2.h
 +++ b/platform/drivers/arm/mhu_driver/mhu_v2.h
 @@ -384,6 +384,24 @@ enum mhu_v2_x_error_t mhu_v2_x_interrupt_clear(
  enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num(
       const struct mhu_v2_x_dev_t *dev, uint32_t *channel);
-
+=20
 +
 +/**
 + * \brief Polls sender channel status.
@@ -76,11 +77,11 @@ index 26b3a5d6..2b4d6fcb 100644
  }
  #endif
 diff --git a/platform/drivers/arm/mhu_driver/mhu_v2_x.c b/platform/drive=
rs/arm/mhu_driver/mhu_v2_x.c
-index d7e70efa..022e287a 100644
+index d7e70efaa..022e287a1 100644
 --- a/platform/drivers/arm/mhu_driver/mhu_v2_x.c
 +++ b/platform/drivers/arm/mhu_driver/mhu_v2_x.c
 @@ -600,3 +600,20 @@ enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num=
(
-
+=20
      return MHU_V_2_X_ERR_GENERAL;
  }
 +
@@ -100,6 +101,7 @@ index d7e70efa..022e287a 100644
 +        return MHU_V_2_X_ERR_INVALID_ARG;
 +    }
 +}
---
+--=20
 2.25.1
=20
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-plat-corstone1000-fmp-client-id.patch b/meta-arm-bsp/recipes-securit=
y/trusted-services/corstone1000/0009-plat-corstone1000-fmp-client-id.patc=
h
index 2fb91f62..837fcd85 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-pl=
at-corstone1000-fmp-client-id.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-pl=
at-corstone1000-fmp-client-id.patch
@@ -1,6 +1,6 @@
-From 52d962239207bd06827c18d0ed21abdc2002337f Mon Sep 17 00:00:00 2001
-From: emeara01 <emekcan.aras@arm.com>
-Date: Thu, 7 Mar 2024 10:24:42 +0000
+From 8aef83efaa03f92b35ab68bc6da2bd26722eedfd Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Fri, 5 Apr 2024 17:31:03 +0200
 Subject: [PATCH] plat: corstone1000: add client_id for FMP service
=20
 Corstone1000 uses trusted-firmware-m as secure enclave software componen=
t. Due
@@ -11,11 +11,11 @@ accessed by u-boot via smm-gateway-sp.
 Signed-off-by: emeara01 <emekcan.aras@arm.com>
 Upstream-Status: Inappropriate [Design is to revisted]
 ---
- .../capsule_update/provider/corstone1000_fmp_service.c     | 5 ++++---
+ .../capsule_update/provider/corstone1000_fmp_service.c       | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
-index d811af9f..354d025f 100644
+index bebdf859f..1b4813d62 100644
 --- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 @@ -33,6 +33,7 @@
@@ -26,7 +26,7 @@ index d811af9f..354d025f 100644
 =20
  static struct variable_metadata fmp_variables_metadata[FMP_VARIABLES_CO=
UNT] =3D {
      {
-@@ -91,7 +92,7 @@ static psa_status_t protected_storage_set(struct rpc_c=
aller *caller,
+@@ -91,7 +92,7 @@ static psa_status_t protected_storage_set(struct rpc_c=
aller_interface *caller,
  		{ .base =3D psa_ptr_to_u32(&create_flags), .len =3D sizeof(create_fla=
gs) },
  	};
 =20
@@ -35,7 +35,7 @@ index d811af9f..354d025f 100644
  			      in_vec, IOVEC_LEN(in_vec), NULL, 0);
  	if (psa_status < 0)
  		EMSG("ipc_set: psa_call failed: %d", psa_status);
-@@ -114,7 +115,7 @@ static psa_status_t protected_storage_get(struct rpc=
_caller *caller,
+@@ -114,7 +115,7 @@ static psa_status_t protected_storage_get(struct rpc=
_caller_interface *caller,
  		{ .base =3D psa_ptr_to_u32(p_data), .len =3D data_size },
  	};
 =20
@@ -43,3 +43,8 @@ index d811af9f..354d025f 100644
 +	psa_status =3D psa_call_client_id(caller, TFM_PROTECTED_STORAGE_SERVIC=
E_HANDLE, SMM_GW_SP_ID,
  			      TFM_PS_ITS_GET, in_vec, IOVEC_LEN(in_vec),
  			      out_vec, IOVEC_LEN(out_vec));
+=20
+--=20
+2.25.1
+
+
--=20
2.43.1


