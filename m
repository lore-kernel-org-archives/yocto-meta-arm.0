Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7C6C41513
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 15:27:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24443.1714404423461854561
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 08:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3A462F4;
	Mon, 29 Apr 2024 08:27:29 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.2.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4BCF23F793;
	Mon, 29 Apr 2024 08:27:02 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 4/5] arm-bsp/trusted-services:  rebase corstone1000 patches
Date: Mon, 29 Apr 2024 17:26:53 +0200
Message-ID: <20240429152654.94534-4-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240429152654.94534-1-gyorgy.szing@arm.com>
References: <20240429152654.94534-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 15:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5624

From: Bence Balogh <bence.balogh@arm.com>

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...ub-capsule-update-service-components.patch |  22 +--
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch |  23 ++-
 .../0003-FMP-Support-in-Corstone1000.patch    |  14 +-
 .../0004-GetNextVariableName-Fix.patch        |  43 ------
 ...-smm_gateway-GetNextVariableName-Fix.patch |  45 ++++++
 ...0-add-compile-definitions-for-ECP_DP.patch |  18 +--
 ...0-Use-the-stateless-platform-service.patch |  12 +-
 ...0-Initialize-capsule-update-provider.patch |  19 ++-
 ...e1000-add-client_id-for-FMP-service.patch} |   5 +-
 ...rstone1000-fix-synchronization-issue.patch | 107 -------------
 .../0009-Remove-Werror-flag.patch             |  84 ++++++++++
 ...rease-SMM_GATEWAY_MAX_UEFI_VARIABLES.patch |  30 ----
 .../0011-Fix-psa_ipc-service-s-psa_call.patch |  37 -----
 ...session-SHM-size-build-time-configur.patch |  52 -------
 ...ession-SHM-size-for-Corstone-1000-SM.patch | 144 ------------------
 ...ked-for-the-variable_metadata-struct.patch |  34 -----
 .../trusted-services/ts-arm-platforms.inc     |  11 +-
 17 files changed, 186 insertions(+), 514 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0004-GetNextVariableName-Fix.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0004-smm_gateway-GetNextVariableName-Fix.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0009=
-plat-corstone1000-fmp-client-id.patch =3D> 0008-plat-corstone1000-add-cl=
ient_id-for-FMP-service.patch} (93%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-platform-corstone1000-fix-synchronization-issue.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0009-Remove-Werror-flag.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0010-Decrease-SMM_GATEWAY_MAX_UEFI_VARIABLES.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0011-Fix-psa_ipc-service-s-psa_call.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Make-RPC-caller-session-SHM-size-build-time-configur.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Set-RPC-caller-session-SHM-size-for-Corstone-1000-SM.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-Use-__packed-for-the-variable_metadata-struct.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0001-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp/reci=
pes-security/trusted-services/corstone1000/0001-Add-stub-capsule-update-s=
ervice-components.patch
index 05999444..0f6fab81 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-stub-capsule-update-service-components.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-stub-capsule-update-service-components.patch
@@ -1,7 +1,7 @@
-From e44a317a5ae283207926311cc71b18c117899c4a Mon Sep 17 00:00:00 2001
+From 1ba2a22575c1b73b5ab09e040a00f370eca4b758 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Tue, 12 Oct 2021 15:45:41 +0100
-Subject: [PATCH] Add stub capsule update service components
+Subject: [PATCH 1/8] Add stub capsule update service components
=20
 To facilitate development of a capsule update service provider,
 stub components are added to provide a starting point for an
@@ -34,7 +34,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
=20
 diff --git a/components/service/capsule_update/backend/capsule_update_ba=
ckend.h b/components/service/capsule_update/backend/capsule_update_backen=
d.h
 new file mode 100644
-index 00000000..f3144ff1
+index 000000000..f3144ff1d
 --- /dev/null
 +++ b/components/service/capsule_update/backend/capsule_update_backend.h
 @@ -0,0 +1,24 @@
@@ -64,7 +64,7 @@ index 00000000..f3144ff1
 +#endif /* CAPSULE_UPDATE_BACKEND_H */
 diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
 new file mode 100644
-index 00000000..f35c272d
+index 000000000..f35c272d2
 --- /dev/null
 +++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
 @@ -0,0 +1,135 @@
@@ -205,7 +205,7 @@ index 00000000..f35c272d
 +}
 diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.h b/components/service/capsule_update/provider/capsule_update_pro=
vider.h
 new file mode 100644
-index 00000000..71131417
+index 000000000..5dc5535d6
 --- /dev/null
 +++ b/components/service/capsule_update/provider/capsule_update_provider=
.h
 @@ -0,0 +1,51 @@
@@ -262,7 +262,7 @@ index 00000000..71131417
 +#endif /* CAPSULE_UPDATE_PROVIDER_H */
 diff --git a/components/service/capsule_update/provider/component.cmake =
b/components/service/capsule_update/provider/component.cmake
 new file mode 100644
-index 00000000..1d412eb2
+index 000000000..1d412eb23
 --- /dev/null
 +++ b/components/service/capsule_update/provider/component.cmake
 @@ -0,0 +1,13 @@
@@ -280,7 +280,7 @@ index 00000000..1d412eb2
 +	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
 +	)
 diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
-index 4e7e2bd5..e60b5400 100644
+index a52a1b711..4658c9662 100644
 --- a/deployments/se-proxy/infra/corstone1000/infra.cmake
 +++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
 @@ -21,6 +21,7 @@ add_components(TARGET "se-proxy"
@@ -292,7 +292,7 @@ index 4e7e2bd5..e60b5400 100644
  )
 =20
 diff --git a/deployments/se-proxy/se_proxy_interfaces.h b/deployments/se=
-proxy/se_proxy_interfaces.h
-index 48908f84..3d4a7c20 100644
+index 48908f846..3d4a7c204 100644
 --- a/deployments/se-proxy/se_proxy_interfaces.h
 +++ b/deployments/se-proxy/se_proxy_interfaces.h
 @@ -8,9 +8,10 @@
@@ -312,7 +312,7 @@ index 48908f84..3d4a7c20 100644
  #endif /* SE_PROXY_INTERFACES_H */
 diff --git a/protocols/service/capsule_update/capsule_update_proto.h b/p=
rotocols/service/capsule_update/capsule_update_proto.h
 new file mode 100644
-index 00000000..8f326cd3
+index 000000000..8f326cd38
 --- /dev/null
 +++ b/protocols/service/capsule_update/capsule_update_proto.h
 @@ -0,0 +1,13 @@
@@ -331,7 +331,7 @@ index 00000000..8f326cd3
 +#endif /* CAPSULE_UPDATE_PROTO_H */
 diff --git a/protocols/service/capsule_update/opcodes.h b/protocols/serv=
ice/capsule_update/opcodes.h
 new file mode 100644
-index 00000000..8185a090
+index 000000000..8185a0902
 --- /dev/null
 +++ b/protocols/service/capsule_update/opcodes.h
 @@ -0,0 +1,17 @@
@@ -354,7 +354,7 @@ index 00000000..8185a090
 +#endif /* CAPSULE_UPDATE_OPCODES_H */
 diff --git a/protocols/service/capsule_update/parameters.h b/protocols/s=
ervice/capsule_update/parameters.h
 new file mode 100644
-index 00000000..285d9241
+index 000000000..285d92418
 --- /dev/null
 +++ b/protocols/service/capsule_update/parameters.h
 @@ -0,0 +1,15 @@
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0002-Fixes-in-AEAD-for-psa-arch=
-test-54-and-58.patch
index 7a2c796e..524d6f7a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Fi=
xes-in-AEAD-for-psa-arch-test-54-and-58.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Fi=
xes-in-AEAD-for-psa-arch-test-54-and-58.patch
@@ -1,7 +1,7 @@
-From 1ab4f9dda5d3f6a4828dc3154cf5bf71d6d744d4 Mon Sep 17 00:00:00 2001
+From 1923e1f4dbd8f912701c2870822fa4b61eb6082d Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Mon, 14 Feb 2022 08:22:25 +0000
-Subject: [PATCH 2/6] Fixes in AEAD for psa-arch test 54 and 58.
+Subject: [PATCH 2/8] Fixes in AEAD for psa-arch test 54 and 58.
=20
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
@@ -17,7 +17,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  6 files changed, 12 insertions(+), 3 deletions(-)
=20
 diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_aead.h b/components/service/crypto/client/caller/packed-c/crypto_call=
er_aead.h
-index bf39762b..27ffbc66 100644
+index bf39762b0..27ffbc66e 100644
 --- a/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
 +++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
 @@ -314,6 +314,7 @@ static inline psa_status_t crypto_caller_aead_update=
(struct service_client *cont
@@ -29,7 +29,7 @@ index bf39762b..27ffbc66 100644
 =20
  	/* Mandatory input data parameter */
 diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/comp=
onents/service/crypto/include/psa/crypto_sizes.h
-index 30aa102d..130d2729 100644
+index 30aa102da..130d27295 100644
 --- a/components/service/crypto/include/psa/crypto_sizes.h
 +++ b/components/service/crypto/include/psa/crypto_sizes.h
 @@ -351,7 +351,7 @@
@@ -42,10 +42,10 @@ index 30aa102d..130d2729 100644
  /** A sufficient output buffer size for psa_aead_update().
   *
 diff --git a/components/service/crypto/provider/extension/aead/aead_prov=
ider.c b/components/service/crypto/provider/extension/aead/aead_provider.=
c
-index 696474e8..66aee9e4 100644
+index b73d88d32..6a0f96c3c 100644
 --- a/components/service/crypto/provider/extension/aead/aead_provider.c
 +++ b/components/service/crypto/provider/extension/aead/aead_provider.c
-@@ -280,10 +280,11 @@ static rpc_status_t aead_update_handler(void *cont=
ext, struct rpc_request *req)
+@@ -283,10 +283,11 @@ static rpc_status_t aead_update_handler(void *cont=
ext, struct rpc_request *req)
  	uint32_t op_handle;
  	const uint8_t *input;
  	size_t input_len;
@@ -58,7 +58,7 @@ index 696474e8..66aee9e4 100644
 =20
  	if (rpc_status =3D=3D RPC_SUCCESS) {
 =20
-@@ -297,9 +298,12 @@ static rpc_status_t aead_update_handler(void *conte=
xt, struct rpc_request *req)
+@@ -300,9 +301,12 @@ static rpc_status_t aead_update_handler(void *conte=
xt, struct rpc_request *req)
  		if (crypto_context) {
 =20
  			size_t output_len =3D 0;
@@ -73,7 +73,7 @@ index 696474e8..66aee9e4 100644
 =20
  				psa_status =3D psa_aead_update(&crypto_context->op.aead,
 diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/aead_provider_serializer.h b/components/service/crypto/provider/extensi=
on/aead/serializer/aead_provider_serializer.h
-index 2bf7a015..733d2e75 100644
+index be76d2bc6..590973048 100644
 --- a/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
 +++ b/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
 @@ -51,6 +51,7 @@ struct aead_provider_serializer {
@@ -85,7 +85,7 @@ index 2bf7a015..733d2e75 100644
 =20
  	rpc_status_t (*serialize_aead_update_resp)(struct rpc_buffer *resp_buf=
,
 diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/packed-c/packedc_aead_provider_serializer.c b/components/service/crypto=
/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serial=
izer.c
-index 738d5f23..9440a084 100644
+index 8f8c3c7f2..922a7b651 100644
 --- a/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
 +++ b/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
 @@ -192,6 +192,7 @@ static rpc_status_t deserialize_aead_update_ad_req(c=
onst struct rpc_buffer *req_
@@ -105,7 +105,7 @@ index 738d5f23..9440a084 100644
  		tlv_const_iterator_begin(&req_iter,
  			(uint8_t*)req_buf->data + expected_fixed_len,
 diff --git a/protocols/service/crypto/packed-c/aead.h b/protocols/servic=
e/crypto/packed-c/aead.h
-index 0be266b5..435fd3b5 100644
+index 0be266b52..435fd3b52 100644
 --- a/protocols/service/crypto/packed-c/aead.h
 +++ b/protocols/service/crypto/packed-c/aead.h
 @@ -98,6 +98,7 @@ enum
@@ -119,6 +119,3 @@ index 0be266b5..435fd3b5 100644
 --=20
 2.25.1
=20
-
-
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0003-FMP-Support-in-Corstone1000.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/corstone1000/0003-FMP-Support-in-Corstone1000.patch
index 5218d068..dff9b7ff 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-FM=
P-Support-in-Corstone1000.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-FM=
P-Support-in-Corstone1000.patch
@@ -1,7 +1,7 @@
-From 33dae70ae2786cf12070d063ff74cfe0df1f4f50 Mon Sep 17 00:00:00 2001
+From ef6b4fef7b7a740d6df8dab12aa7c73d06bb9f3b Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Fri, 8 Jul 2022 09:48:06 +0100
-Subject: [PATCH] FMP Support in Corstone1000.
+Subject: [PATCH 3/8] FMP Support in Corstone1000.
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
-index f35c272d..bfeb7301 100644
+index f35c272d2..bfeb7301a 100644
 --- a/components/service/capsule_update/provider/capsule_update_provider=
.c
 +++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
 @@ -11,6 +11,7 @@
@@ -59,7 +59,7 @@ index f35c272d..bfeb7301 100644
  		default:
  			EMSG("%s unsupported opcode", __func__);
 diff --git a/components/service/capsule_update/provider/component.cmake =
b/components/service/capsule_update/provider/component.cmake
-index 1d412eb2..6b060149 100644
+index 1d412eb23..6b0601494 100644
 --- a/components/service/capsule_update/provider/component.cmake
 +++ b/components/service/capsule_update/provider/component.cmake
 @@ -10,4 +10,5 @@ endif()
@@ -70,7 +70,7 @@ index 1d412eb2..6b060149 100644
  	)
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
 new file mode 100644
-index 00000000..56ce3857
+index 000000000..56ce38579
 --- /dev/null
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 @@ -0,0 +1,307 @@
@@ -86,7 +86,7 @@ index 00000000..56ce3857
 +#include <psa/storage_common.h>
 +#include <trace.h>
 +
-+#include <service/smm_variable/backend/variable_index.h>
++#include <service/uefi/smm_variable/backend/variable_index.h>
 +
 +#define VARIABLE_INDEX_STORAGE_UID			(0x787)
 +
@@ -383,7 +383,7 @@ index 00000000..56ce3857
 +}
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.h b/components/service/capsule_update/provider/corstone1000_fmp_=
service.h
 new file mode 100644
-index 00000000..d0023dc0
+index 000000000..d0023dc07
 --- /dev/null
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
 @@ -0,0 +1,26 @@
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0004-GetNextVariableName-Fix.patch b/meta-arm-bsp/recipes-security/truste=
d-services/corstone1000/0004-GetNextVariableName-Fix.patch
deleted file mode 100644
index a8e7f7c9..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-Ge=
tNextVariableName-Fix.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a0056ea1d994f1ec4da8ccae45abab2d2461f0a2 Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <Gyorgy.Szing@arm.com>
-Date: Thu, 16 Nov 2023 18:14:46 +0000
-Subject: [PATCH 1/1] smm_gateway: GetNextVariableName Fix
-
-GetNextVariableName() should return EFI_BUFFER_TOO_SMALL
-when requested NameSize is smaller than the actual. It
-currently returns EFI_BUFFER_OUT_OF_RESOURCES due to setting
-max_name_len incorrectly. This change fixes the error by
-using clamping the maximum size to the NameSize requested by
-the client.
-
-Upstream-Status: Pending
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
----
- .../service/smm_variable/provider/smm_variable_provider.c     | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/components/service/smm_variable/provider/smm_variable_provi=
der.c b/components/service/smm_variable/provider/smm_variable_provider.c
-index f1c3c712..7ec49af5 100644
---- a/components/service/smm_variable/provider/smm_variable_provider.c
-+++ b/components/service/smm_variable/provider/smm_variable_provider.c
-@@ -190,15 +190,13 @@ static rpc_status_t get_next_variable_name_handler=
(void *context, struct rpc_req
- 		if (resp_buf->size >=3D param_len) {
-=20
- 			struct rpc_buffer *req_buf =3D &req->request;
--			size_t max_name_len =3D resp_buf->size -
--				SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_NAME_OFFSET;
-=20
- 			memmove(resp_buf->data, req_buf->data, param_len);
-=20
- 			efi_status =3D uefi_variable_store_get_next_variable_name(
- 				&this_instance->variable_store,
- 				(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data,
--				max_name_len,
-+				((SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data)-=
>NameSize,
- 				&resp_buf->data_length);
- 		}
- 		else {
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0004-smm_gateway-GetNextVariableName-Fix.patch b/meta-arm-bsp/recipes-sec=
urity/trusted-services/corstone1000/0004-smm_gateway-GetNextVariableName-=
Fix.patch
new file mode 100644
index 00000000..51337b2f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-sm=
m_gateway-GetNextVariableName-Fix.patch
@@ -0,0 +1,45 @@
+From 660658e9f974126fae15d9d8839415a76e8d6663 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 10 Apr 2024 09:16:47 +0200
+Subject: [PATCH 4/9] smm_gateway: GetNextVariableName Fix
+
+GetNextVariableName() should return EFI_BUFFER_TOO_SMALL
+when requested NameSize is smaller than the actual. It
+currently returns EFI_BUFFER_OUT_OF_RESOURCES due to setting
+max_name_len incorrectly. This change fixes the error by
+using clamping the maximum size to the NameSize requested by
+the client.
+
+Upstream-Status: Pending
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+---
+ .../uefi/smm_variable/provider/smm_variable_provider.c      | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/components/service/uefi/smm_variable/provider/smm_variable_=
provider.c b/components/service/uefi/smm_variable/provider/smm_variable_p=
rovider.c
+index 1875397..ca3f7e5 100644
+--- a/components/service/uefi/smm_variable/provider/smm_variable_provide=
r.c
++++ b/components/service/uefi/smm_variable/provider/smm_variable_provide=
r.c
+@@ -176,16 +176,14 @@ static rpc_status_t get_next_variable_name_handler=
(void *context, struct rpc_req
+=20
+ 		if (resp_buf->size >=3D param_len) {
+ 			struct rpc_buffer *req_buf =3D &req->request;
+-			size_t max_name_len =3D
+-				resp_buf->size -
+-				SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_NAME_OFFSET;
+=20
+ 			memmove(resp_buf->data, req_buf->data, param_len);
+=20
+ 			efi_status =3D uefi_variable_store_get_next_variable_name(
+ 				&this_instance->variable_store,
+ 				(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *)resp_buf->data,
+-				max_name_len, &resp_buf->data_length);
++				((SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data)-=
>NameSize,
++				&resp_buf->data_length);
+ 		} else {
+ 			/* Reponse buffer not big enough */
+ 			efi_status =3D EFI_BAD_BUFFER_SIZE;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0005-plat-corstone10=
00-add-compile-definitions-for-ECP_DP.patch
index 3e37ba87..e1166905 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-pl=
at-corstone1000-add-compile-definitions-for-ECP_DP.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-pl=
at-corstone1000-add-compile-definitions-for-ECP_DP.patch
@@ -1,7 +1,7 @@
-From 4816a705e7917ee58d3972fefe163189eb412d36 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Fri, 16 Jun 2023 10:47:48 +0100
-Subject: [PATCH] plat: corstone1000: add compile definitions for
+From a7818585e1113aabf310a94eea802ff79234b0db Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 10 Apr 2024 09:17:39 +0200
+Subject: [PATCH 5/8] plat: corstone1000: add compile definitions for=20
  ECP_DP_SECP512R1
=20
 Corstone1000 runs PSA-API tests which requires this ECC algorithm.
@@ -14,13 +14,13 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+)
=20
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index a3c4209b..ff044ed7 100644
+index 663226740..83350f788 100644
 --- a/platform/providers/arm/corstone1000/platform.cmake
 +++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -13,3 +13,5 @@ target_compile_definitions(${TGT} PRIVATE
- 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
- 	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D100
- )
+@@ -26,3 +26,5 @@ get_property(_platform_driver_dependencies TARGET ${TG=
T}
+ if ("mhu" IN_LIST _platform_driver_dependencies)
+ 	include(${TS_ROOT}/platform/drivers/arm/mhu_driver/mhu_v2_x/driver.cma=
ke)
+ endif()
 +
 +add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
 --=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0006-plat-corstone1000-Use-the-stateless-platform-service.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0006-plat-corstone10=
00-Use-the-stateless-platform-service.patch
index 4381f75e..44e2dd85 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-pl=
at-corstone1000-Use-the-stateless-platform-service.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-pl=
at-corstone1000-Use-the-stateless-platform-service.patch
@@ -1,7 +1,7 @@
-From b07d29440b5ca8d1f3b9a4f03786bb3127930a64 Mon Sep 17 00:00:00 2001
+From c2edcd8bd3d8817765f280708eae894d6cd8d974 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Sun, 18 Jun 2023 14:38:42 +0100
-Subject: [PATCH] plat: corstone1000: Use the stateless platform service
+Subject: [PATCH 6/8] plat: corstone1000: Use the stateless platform serv=
ice
  calls Calls to psa_connect is not needed and psa_call can be called dir=
ectly
  with a pre defined handle.
=20
@@ -18,7 +18,7 @@ Upstream-Status: Inappropriate [Design is to revisted]
  4 files changed, 17 insertions(+), 27 deletions(-)
=20
 diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
-index bfeb7301..12c552da 100644
+index bfeb7301a..12c552dae 100644
 --- a/components/service/capsule_update/provider/capsule_update_provider=
.c
 +++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
 @@ -63,7 +63,6 @@ void capsule_update_provider_deinit(struct capsule_upd=
ate_provider *context)
@@ -67,7 +67,7 @@ index bfeb7301..12c552da 100644
  		default:
  			EMSG("%s unsupported opcode", __func__);
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
-index 56ce3857..bebdf859 100644
+index 56ce38579..bebdf859f 100644
 --- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 @@ -238,8 +238,7 @@ static psa_status_t unpack_image_info(void *buffer, =
uint32_t size)
@@ -105,7 +105,7 @@ index 56ce3857..bebdf859 100644
  	return;
      }
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.h b/components/service/capsule_update/provider/corstone1000_fmp_=
service.h
-index d0023dc0..486fa10b 100644
+index d0023dc07..486fa10b4 100644
 --- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
 @@ -16,8 +16,7 @@ extern "C" {
@@ -119,7 +119,7 @@ index d0023dc0..486fa10b 100644
  #ifdef __cplusplus
  } /* extern "C" */
 diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 5aaa659d..fc3a4fb0 100644
+index 5aaa659d4..fc3a4fb06 100644
 --- a/components/service/common/include/psa/sid.h
 +++ b/components/service/common/include/psa/sid.h
 @@ -40,6 +40,13 @@ extern "C" {
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0007-plat-corstone1000-Initialize-capsule-update-provider.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0007-plat-corstone10=
00-Initialize-capsule-update-provider.patch
index 5f06cb51..738b5af0 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-pl=
at-corstone1000-Initialize-capsule-update-provider.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-pl=
at-corstone1000-Initialize-capsule-update-provider.patch
@@ -1,14 +1,13 @@
-From c304d5b2e4319542b33abbd43b06a694d6895628 Mon Sep 17 00:00:00 2001
+From 925a07093fa571ee1d2f2e59affcd2c52f1d5b54 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Wed, 29 Nov 2023 15:40:21 +0100
-Subject: [PATCH] plat: corstone1000: Initialize capsule update provider
+Subject: [PATCH 7/8] plat: corstone1000: Initialize capsule update provi=
der
=20
 Initializes the capsule update service provider in se-proxy-sp.c deploym=
ent
 for corstone1000.
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Upstream-Status: Inappropriate [Design is to revisted]
-
 ---
  .../se-proxy/env/commonsp/se_proxy_sp.c       | 14 +++++++++-
  .../corstone1000/service_proxy_factory.c      | 28 +++++++++++++++++++
@@ -16,7 +15,7 @@ Upstream-Status: Inappropriate [Design is to revisted]
  3 files changed, 42 insertions(+), 1 deletion(-)
=20
 diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
-index 155e9486..a0eb03b6 100644
+index 155e94863..a0eb03b6f 100644
 --- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
 +++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
 @@ -39,7 +39,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
@@ -48,11 +47,11 @@ index 155e9486..a0eb03b6 100644
  	result =3D sp_msg_wait(&req_msg);
  	if (result !=3D SP_RESULT_OK) {
 diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index 6885f928..bbab80e5 100644
+index b3b93cfd6..fc179b3c1 100644
 --- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
 +++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
 @@ -11,6 +11,7 @@
- #include <rpc/psa_ipc/caller/sp/psa_ipc_caller.h>
+ #include <rpc/rss_comms/caller/sp/rss_comms_caller.h>
  #include <service/attestation/provider/attest_provider.h>
  #include <service/attestation/provider/serializer/packed-c/packedc_atte=
st_provider_serializer.h>
 +#include <service/capsule_update/provider/capsule_update_provider.h>
@@ -71,14 +70,14 @@ index 6885f928..bbab80e5 100644
 +	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
 +
 +	/* Static objects for proxy instance */
-+	static struct rpc_caller_interface psa_ipc =3D { 0 };
++	static struct rpc_caller_interface rss_comms =3D { 0 };
 +	static struct rpc_caller_session rpc_session =3D { 0 };
 +
-+	rpc_status =3D psa_ipc_caller_init(&psa_ipc);
++	rpc_status =3D rss_comms_caller_init(&rss_comms);
 +	if (rpc_status !=3D RPC_SUCCESS)
 +		return NULL;
 +
-+	rpc_status =3D rpc_caller_session_open(&rpc_session, &psa_ipc, &dummy_=
uuid, 0, 0);
++	rpc_status =3D rpc_caller_session_open(&rpc_session, &rss_comms, &dumm=
y_uuid, 0, 0);
 +	if (rpc_status !=3D RPC_SUCCESS)
 +		return NULL;
 +
@@ -91,7 +90,7 @@ index 6885f928..bbab80e5 100644
 +	return capsule_update_provider_init(&capsule_update_provider);
 +}
 diff --git a/deployments/se-proxy/infra/service_proxy_factory.h b/deploy=
ments/se-proxy/infra/service_proxy_factory.h
-index caaea79e..b981754b 100644
+index caaea79ed..b981754b7 100644
 --- a/deployments/se-proxy/infra/service_proxy_factory.h
 +++ b/deployments/se-proxy/infra/service_proxy_factory.h
 @@ -17,6 +17,7 @@ struct rpc_service_interface *attest_proxy_create(void=
);
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-plat-corstone1000-fmp-client-id.patch b/meta-arm-bsp/recipes-securit=
y/trusted-services/corstone1000/0008-plat-corstone1000-add-client_id-for-=
FMP-service.patch
similarity index 93%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
009-plat-corstone1000-fmp-client-id.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
8-plat-corstone1000-add-client_id-for-FMP-service.patch
index 837fcd85..3e927000 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-pl=
at-corstone1000-fmp-client-id.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-pl=
at-corstone1000-add-client_id-for-FMP-service.patch
@@ -1,7 +1,7 @@
-From 8aef83efaa03f92b35ab68bc6da2bd26722eedfd Mon Sep 17 00:00:00 2001
+From f6ed75939f0b57e6b0e50ab11cdc3304098456dd Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Fri, 5 Apr 2024 17:31:03 +0200
-Subject: [PATCH] plat: corstone1000: add client_id for FMP service
+Subject: [PATCH 8/8] plat: corstone1000: add client_id for FMP service
=20
 Corstone1000 uses trusted-firmware-m as secure enclave software componen=
t. Due
 to the changes in TF-M 2.0, psa services requires a seperate client_id n=
ow.
@@ -47,4 +47,3 @@ index bebdf859f..1b4813d62 100644
 --=20
 2.25.1
=20
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0008-platform-corstone1000-fix-synchronization-issue.patch b/meta-arm-bsp=
/recipes-security/trusted-services/corstone1000/0008-platform-corstone100=
0-fix-synchronization-issue.patch
deleted file mode 100644
index 7df00974..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-pl=
atform-corstone1000-fix-synchronization-issue.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From e8f0a013acc02c82c9193f6ab7970e80fb0f961e Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Tue, 14 Nov 2023 14:43:44 +0000
-Subject: [PATCH] plat: corstone1000: fix synchronization issue on openam=
p
- notification
-
-This fixes a race that is observed rarely in the FVP. It occurs in FVP
-when Secure Enclave sends the notication ack in openamp, and then reset =
the access
-request which resets the mhu registers before received by the SE-proxy-s=
p in the
-host processort. This solution introduces polling on the status register=
 of
-mhu until the notificaiton is read by the host processor. (Inspired by
-signal_and_wait_for_signal function in mhu_wrapper_v2_x.c in trusted-fir=
mware-m
-https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git/tree/platfor=
m/ext/target/arm/rss/common/native_drivers/mhu_wrapper_v2_x.c#n61)
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- components/messaging/openamp/sp/openamp_mhu.c |  9 ++++++++-
- platform/drivers/arm/mhu_driver/mhu_v2.h      | 18 ++++++++++++++++++
- platform/drivers/arm/mhu_driver/mhu_v2_x.c    | 17 +++++++++++++++++
- 3 files changed, 43 insertions(+), 1 deletion(-)
-
-diff --git a/components/messaging/openamp/sp/openamp_mhu.c b/components/=
messaging/openamp/sp/openamp_mhu.c
-index bafba3e37..e96de6059 100644
---- a/components/messaging/openamp/sp/openamp_mhu.c
-+++ b/components/messaging/openamp/sp/openamp_mhu.c
-@@ -85,7 +85,7 @@ int openamp_mhu_notify_peer(struct openamp_messenger *=
openamp)
- 	struct mhu_v2_x_dev_t *tx_dev;
- 	enum mhu_v2_x_error_t ret;
- 	struct openamp_mhu *mhu;
--	uint32_t access_ready;
-+	uint32_t access_ready,val;
-=20
- 	if (!openamp->transport) {
- 		EMSG("openamp: mhu: notify transport not initialized");
-@@ -116,6 +116,13 @@ int openamp_mhu_notify_peer(struct openamp_messenge=
r *openamp)
- 		return -EPROTO;
- 	}
-=20
-+	do {
-+		ret =3D mhu_v2_x_channel_poll(tx_dev, MHU_V_2_NOTIFY_CHANNEL, &val);
-+		if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+			break;
-+		}
-+	} while (val !=3D 0);
-+
- 	ret =3D mhu_v2_x_reset_access_request(tx_dev);
- 	if (ret !=3D MHU_V_2_X_ERR_NONE) {
- 		EMSG("openamp: mhu: failed reset access request");
-diff --git a/platform/drivers/arm/mhu_driver/mhu_v2.h b/platform/drivers=
/arm/mhu_driver/mhu_v2.h
-index 26b3a5d63..2b4d6fcb6 100644
---- a/platform/drivers/arm/mhu_driver/mhu_v2.h
-+++ b/platform/drivers/arm/mhu_driver/mhu_v2.h
-@@ -384,6 +384,24 @@ enum mhu_v2_x_error_t mhu_v2_x_interrupt_clear(
- enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num(
-      const struct mhu_v2_x_dev_t *dev, uint32_t *channel);
-=20
-+
-+/**
-+ * \brief Polls sender channel status.
-+ *
-+ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in]  channel     Channel to poll the status of.
-+ * \param[out] value       Pointer to variable that will store the valu=
e.
-+ *
-+ * Polls sender channel status.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_poll(const struct mhu_v2_x_dev_t=
 *dev,
-+     uint32_t channel, uint32_t *value);
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/platform/drivers/arm/mhu_driver/mhu_v2_x.c b/platform/drive=
rs/arm/mhu_driver/mhu_v2_x.c
-index d7e70efaa..022e287a1 100644
---- a/platform/drivers/arm/mhu_driver/mhu_v2_x.c
-+++ b/platform/drivers/arm/mhu_driver/mhu_v2_x.c
-@@ -600,3 +600,20 @@ enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num=
(
-=20
-     return MHU_V_2_X_ERR_GENERAL;
- }
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_poll(const struct mhu_v2_x_dev_t=
 *dev,
-+     uint32_t channel, uint32_t *value)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        *value =3D (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_st;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
---=20
-2.25.1
-
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-Remove-Werror-flag.patch b/meta-arm-bsp/recipes-security/trusted-ser=
vices/corstone1000/0009-Remove-Werror-flag.patch
new file mode 100644
index 00000000..d08ebe9f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Re=
move-Werror-flag.patch
@@ -0,0 +1,84 @@
+From 6d140b21c22dda58f596bb513a1cd6bc08e914eb Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Wed, 3 Apr 2024 10:18:16 +0100
+Subject: [PATCH] Remove Werror flag
+
+Remove Werror flag due to compilation issues for TS in yocto
+
+Upstream-Status: Inappropriate [Only for meta-arm]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ deployments/smm-gateway/config/default-opteesp/CMakeLists.txt | 1 -
+ deployments/smm-gateway/config/default-sp/CMakeLists.txt      | 1 -
+ environments/arm-linux/default_toolchain_file.cmake           | 2 +-
+ environments/linux-pc/default_toolchain_file.cmake            | 2 +-
+ environments/opteesp/default_toolchain_file.cmake             | 2 +-
+ 5 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/deployments/smm-gateway/config/default-opteesp/CMakeLists.t=
xt b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
+index 5521467..88048a2 100644
+--- a/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
++++ b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
+@@ -99,7 +99,6 @@ target_compile_definitions(smm-gateway PRIVATE
+ if(CMAKE_C_COMPILER_ID STREQUAL "GNU")
+ 	target_compile_options(smm-gateway PRIVATE
+ 		-std=3Dc11
+-		-Werror
+ 	)
+=20
+ endif()
+diff --git a/deployments/smm-gateway/config/default-sp/CMakeLists.txt b/=
deployments/smm-gateway/config/default-sp/CMakeLists.txt
+index ca563c0..4b43653 100644
+--- a/deployments/smm-gateway/config/default-sp/CMakeLists.txt
++++ b/deployments/smm-gateway/config/default-sp/CMakeLists.txt
+@@ -97,7 +97,6 @@ target_compile_definitions(smm-gateway PRIVATE
+ if(CMAKE_C_COMPILER_ID STREQUAL "GNU")
+ 	target_compile_options(smm-gateway PRIVATE
+ 		-std=3Dc11
+-		-Werror
+ 	)
+=20
+ endif()
+diff --git a/environments/arm-linux/default_toolchain_file.cmake b/envir=
onments/arm-linux/default_toolchain_file.cmake
+index 1da144e..6909db6 100644
+--- a/environments/arm-linux/default_toolchain_file.cmake
++++ b/environments/arm-linux/default_toolchain_file.cmake
+@@ -19,7 +19,7 @@ set(CMAKE_SYSTEM_PROCESSOR arm)
+=20
+ set(TS_DEBUG_INFO_FLAGS "-fdiagnostics-show-option -gdwarf-2" CACHE STR=
ING "Compiler flags to add debug information.")
+ set(TS_MANDATORY_AARCH_FLAGS "-mstrict-align -march=3Darmv8-a+crc -DARM=
64=3D1" CACHE STRING "Compiler flags configuring architecture specific ")
+-set(TS_WARNING_FLAGS "-Wall -Werror" CACHE STRING "Compiler flags affec=
ting generating warning messages.")
++set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
+ set(TS_MANDATORY_LINKER_FLAGS "" CACHE STRING "Linker flags needed for =
correct builds.")
+=20
+ # Set flags affecting all build types
+diff --git a/environments/linux-pc/default_toolchain_file.cmake b/enviro=
nments/linux-pc/default_toolchain_file.cmake
+index 58f29bc..e23bb79 100644
+--- a/environments/linux-pc/default_toolchain_file.cmake
++++ b/environments/linux-pc/default_toolchain_file.cmake
+@@ -11,7 +11,7 @@ include_guard(GLOBAL)
+=20
+ set(TS_DEBUG_INFO_FLAGS "-fdiagnostics-show-option -gdwarf-2" CACHE STR=
ING "Compiler flags to add debug information.")
+ set(TS_MANDATORY_AARCH_FLAGS "" CACHE STRING "Compiler flags configurin=
g architecture specific ")
+-set(TS_WARNING_FLAGS "-Wall -Werror" CACHE STRING "Compiler flags affec=
ting generating warning messages.")
++set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
+ set(TS_MANDATORY_LINKER_FLAGS "" CACHE STRING "Linker flags needed for =
correct builds.")
+=20
+ # Set flags affecting all build types
+diff --git a/environments/opteesp/default_toolchain_file.cmake b/environ=
ments/opteesp/default_toolchain_file.cmake
+index 43c19c5..90a9418 100644
+--- a/environments/opteesp/default_toolchain_file.cmake
++++ b/environments/opteesp/default_toolchain_file.cmake
+@@ -21,7 +21,7 @@ set(CMAKE_POSITION_INDEPENDENT_CODE True)
+=20
+ set(TS_DEBUG_INFO_FLAGS "-fdiagnostics-show-option -gdwarf-2" CACHE STR=
ING "Compiler flags to add debug information.")
+ set(TS_MANDATORY_AARCH_FLAGS "-fpic -mstrict-align -march=3Darmv8-a+crc=
" CACHE STRING "Compiler flags configuring architecture specific ")
+-set(TS_WARNING_FLAGS "-Wall -Werror" CACHE STRING "Compiler flags affec=
ting generating warning messages.")
++set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
+ set(TS_MANDATORY_LINKER_FLAGS "-pie -Wl,--as-needed -Wl,--sort-section=3D=
alignment -zmax-page-size=3D4096"
+ 	CACHE STRING "Linker flags needed for correct builds.")
+=20
+--=20
+2.25.1
+
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0010-Decrease-SMM_GATEWAY_MAX_UEFI_VARIABLES.patch b/meta-arm-bsp/recipes=
-security/trusted-services/corstone1000/0010-Decrease-SMM_GATEWAY_MAX_UEF=
I_VARIABLES.patch
deleted file mode 100644
index e302b74b..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-De=
crease-SMM_GATEWAY_MAX_UEFI_VARIABLES.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e1ef7c537c09972d981e09d4dbcc98e50c7d2b04 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Tue, 28 Nov 2023 15:32:39 +0100
-Subject: [PATCH 8/9] Decrease SMM_GATEWAY_MAX_UEFI_VARIABLES
-
-This fixes the SMM gateway initialization error that was caused
-by a malloc fault in Corstone-1000.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27857]
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
----
- platform/providers/arm/corstone1000/platform.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index ff044ed7..d16cde3f 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -11,7 +11,7 @@ include(${TS_ROOT}/platform/drivers/arm/mhu_driver/com=
ponent.cmake)
-=20
- target_compile_definitions(${TGT} PRIVATE
- 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
--	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D100
-+	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D80
- )
-=20
- add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0011-Fix-psa_ipc-service-s-psa_call.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/0011-Fix-psa_ipc-service-s-psa_call.patch
deleted file mode 100644
index 25e272f8..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Fi=
x-psa_ipc-service-s-psa_call.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b216cb0740b6e0107509145cadd0671fda62e89c Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Tue, 28 Nov 2023 15:33:12 +0100
-Subject: [PATCH 9/9] Fix psa_ipc service's psa_call
-
-The wrong parameter was passed to the psa_ipc_phys_to_virt()
-function which resulted in faulty behavior.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27858]
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
----
- components/rpc/psa_ipc/service_psa_ipc.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/components/rpc/psa_ipc/service_psa_ipc.c b/components/rpc/p=
sa_ipc/service_psa_ipc.c
-index 36c8e367..4bf86716 100644
---- a/components/rpc/psa_ipc/service_psa_ipc.c
-+++ b/components/rpc/psa_ipc/service_psa_ipc.c
-@@ -176,13 +176,13 @@ static psa_status_t __psa_call(struct rpc_caller_i=
nterface *caller, psa_handle_t
- 	if (!resp_msg || !out_len || resp_msg->reply !=3D PSA_SUCCESS)
- 		goto caller_end;
-=20
--	out_vec_param =3D (struct psa_outvec *)psa_ipc_phys_to_virt(caller,
-+	out_vec_param =3D (struct psa_outvec *)psa_ipc_phys_to_virt(caller->co=
ntext,
- 				psa_u32_to_ptr(resp_msg->params.out_vec));
-=20
- 	for (i =3D 0; i < resp_msg->params.out_len; i++) {
- 		out_vec[i].len =3D out_vec_param[i].len;
- 		unaligned_memcpy(psa_u32_to_ptr(out_vec[i].base),
--				 psa_ipc_phys_to_virt(caller,
-+				 psa_ipc_phys_to_virt(caller->context,
- 				      psa_u32_to_ptr(out_vec_param[i].base)),
- 				 out_vec[i].len);
- 	}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0012-Make-RPC-caller-session-SHM-size-build-time-configur.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0012-Make-RPC-caller=
-session-SHM-size-build-time-configur.patch
deleted file mode 100644
index 7eb7814a..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-Ma=
ke-RPC-caller-session-SHM-size-build-time-configur.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 40e6b48971bbbd37edf693a8a70b76e4551fda82 Mon Sep 17 00:00:00 2001
-From: Imre Kis <imre.kis@arm.com>
-Date: Wed, 21 Feb 2024 14:24:43 +0100
-Subject: [PATCH 03/12] Make RPC caller session SHM size build-time
- configurable
-
-Introduce RPC_CALLER_SESSION_SHARED_MEMORY_SIZE macro allow setting the
-RPC caller session shared memory size from the build system. This only
-affects RPC caller sessions created by spffa_service_context.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27864]
-Signed-off-by: Imre Kis <imre.kis@arm.com>
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
----
- .../service/locator/sp/ffa/spffa_service_context.c       | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/components/service/locator/sp/ffa/spffa_service_context.c b=
/components/service/locator/sp/ffa/spffa_service_context.c
-index 0c1616fc..4ddc53af 100644
---- a/components/service/locator/sp/ffa/spffa_service_context.c
-+++ b/components/service/locator/sp/ffa/spffa_service_context.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2021-2024, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -10,6 +10,10 @@
- #include <stdlib.h>
- #include <string.h>
-=20
-+#ifndef RPC_CALLER_SESSION_SHARED_MEMORY_SIZE
-+#define RPC_CALLER_SESSION_SHARED_MEMORY_SIZE	(4096)
-+#endif /* RPC_CALLER_SESSION_SHARED_MEMORY_SIZE */
-+
- /* Concrete service_context methods */
- static struct rpc_caller_session *sp_ts_service_context_open(void *cont=
ext);
- static void sp_ts_service_context_close(void *context, struct rpc_calle=
r_session *session);
-@@ -52,7 +56,8 @@ static struct rpc_caller_session *sp_ts_service_contex=
t_open(void *context)
- 		return NULL;
-=20
- 	rpc_status =3D rpc_caller_session_find_and_open(session, &this_context=
->caller,
--						      &this_context->service_uuid, 4096);
-+						      &this_context->service_uuid,
-+						      RPC_CALLER_SESSION_SHARED_MEMORY_SIZE);
- 	if (rpc_status !=3D RPC_SUCCESS) {
- 		free(session);
- 		return NULL;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0013-Set-RPC-caller-session-SHM-size-for-Corstone-1000-SM.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0013-Set-RPC-caller-=
session-SHM-size-for-Corstone-1000-SM.patch
deleted file mode 100644
index 1510246f..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Se=
t-RPC-caller-session-SHM-size-for-Corstone-1000-SM.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From ca3a9e31a560d630cf20286eb30d63ddafc0a05a Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Mon, 26 Feb 2024 14:47:25 +0100
-Subject: [PATCH] Set RPC caller session SHM size for Corstone 1000 SMMGW
-
-Set RPC caller session shared memory size so it fits the UEFI variable
-index. Validate if SMM_GATEWAY_MAX_UEFI_VARIABLES * [descriptor size]
-would fit into the shared memory size. Also align the heap size
-accordingly.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27865]
-Signed-off-by: Imre Kis <imre.kis@arm.com>
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
----
- .../config/default-opteesp/CMakeLists.txt     | 32 +++++++++++++++----
- .../config/default-sp/CMakeLists.txt          | 31 ++++++++++++++----
- .../providers/arm/corstone1000/platform.cmake |  4 ++-
- 3 files changed, 52 insertions(+), 15 deletions(-)
-
-diff --git a/deployments/smm-gateway/config/default-opteesp/CMakeLists.t=
xt b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
-index 7becb3999..897a8dabd 100644
---- a/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
-+++ b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2021-2023, Arm Limited and Contributors. All rights res=
erved.
-+# Copyright (c) 2021-2024, Arm Limited and Contributors. All rights res=
erved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -24,7 +24,30 @@ set(SP_BIN_UUID_CANON "ed32d533-99e6-4209-9cc0-2d72cd=
d998a7")
- set(SP_FFA_UUID_CANON "${SP_BIN_UUID_CANON}")
- set(SP_BOOT_ORDER "8")
-=20
--set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "SP heap size in bytes")
-+#----------------------------------------------------------------------=
---------
-+#  Set target platform to provide drivers needed by the deployment
-+#
-+#----------------------------------------------------------------------=
---------
-+add_platform(TARGET "smm-gateway")
-+
-+# SMM variable and RPC caller settings
-+set(SMM_GATEWAY_MAX_UEFI_VARIABLES 40 CACHE STRING "Maximum UEFI variab=
le count")
-+set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 8192 CACHE STRING "RPC ca=
ller buffer size in SMMGW")
-+
-+# Validating settings
-+# The UEFI variable index entry size is 168 bytes
-+math(EXPR SHM_MIN "${SMM_GATEWAY_MAX_UEFI_VARIABLES} * 168")
-+
-+if (${SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE} LESS ${SHM_MIN})
-+	message(FATAL_ERROR "The RPC SHM size must be at least 168 * [max UEFI=
 variable count]")
-+endif()
-+
-+target_compile_definitions("smm-gateway" PRIVATE
-+	RPC_CALLER_SESSION_SHARED_MEMORY_SIZE=3D${SMM_RPC_CALLER_SESSION_SHARE=
D_MEMORY_SIZE}
-+	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D${SMM_GATEWAY_MAX_UEFI_VARIABLES}
-+)
-+
-+set(SP_HEAP_SIZE "16 * 1024 + ${SMM_GATEWAY_MAX_UEFI_VARIABLES} * 168 +=
 ${SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE}" CACHE STRING "SP heap size=
 in bytes")
- set(TRACE_PREFIX "SMMGW" CACHE STRING "Trace prefix")
-=20
- # Setting the MM communication buffer parameters
-@@ -50,11 +73,6 @@ include(../../env/commonsp/smm_gateway_sp.cmake REQUI=
RED)
- include(../../infra/psa-varstore.cmake REQUIRED)
- include(../../smm-gateway.cmake REQUIRED)
-=20
--#----------------------------------------------------------------------=
---------
--#  Set target platform to provide drivers needed by the deployment
--#
--#----------------------------------------------------------------------=
---------
--add_platform(TARGET "smm-gateway")
-=20
- #----------------------------------------------------------------------=
---------
- #  Deployment specific build options
-diff --git a/deployments/smm-gateway/config/default-sp/CMakeLists.txt b/=
deployments/smm-gateway/config/default-sp/CMakeLists.txt
-index e56a8559d..d3a96b0c6 100644
---- a/deployments/smm-gateway/config/default-sp/CMakeLists.txt
-+++ b/deployments/smm-gateway/config/default-sp/CMakeLists.txt
-@@ -29,7 +29,30 @@ set(TRACE_PREFIX "SMMGW" CACHE STRING "Trace prefix")
- set(SP_STACK_SIZE "64 * 1024" CACHE STRING "Stack size")
- set(SP_BOOT_ORDER "8")
-=20
--set(SP_HEAP_SIZE "32 * 1024" CACHE STRING "Heap size")
-+#----------------------------------------------------------------------=
---------
-+#  Set target platform to provide drivers needed by the deployment
-+#
-+#----------------------------------------------------------------------=
---------
-+add_platform(TARGET "smm-gateway")
-+
-+# SMM variable and RPC caller settings
-+set(SMM_GATEWAY_MAX_UEFI_VARIABLES 40 CACHE STRING "Maximum UEFI variab=
le count")
-+set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 8192 CACHE STRING "RPC ca=
ller buffer size in SMMGW")
-+
-+# Validating settings
-+# The UEFI variable index entry size is 168 bytes
-+math(EXPR SHM_MIN "${SMM_GATEWAY_MAX_UEFI_VARIABLES} * 168")
-+
-+if (${SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE} LESS ${SHM_MIN})
-+	message(FATAL_ERROR "The RPC SHM size must be at least 168 * [max UEFI=
 variable count]")
-+endif()
-+
-+target_compile_definitions("smm-gateway" PRIVATE
-+	RPC_CALLER_SESSION_SHARED_MEMORY_SIZE=3D${SMM_RPC_CALLER_SESSION_SHARE=
D_MEMORY_SIZE}
-+	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D${SMM_GATEWAY_MAX_UEFI_VARIABLES}
-+)
-+
-+set(SP_HEAP_SIZE "16 * 1024 + ${SMM_GATEWAY_MAX_UEFI_VARIABLES} * 168 +=
 ${SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE}" CACHE STRING "SP heap size=
 in bytes")
-=20
- # Setting the MM communication buffer parameters
- set(MM_COMM_BUFFER_ADDRESS "0x00000008 0x81000000" CACHE STRING "Addres=
s of MM communicte buffer in 64 bit DTS format")
-@@ -49,12 +72,6 @@ include(../../env/commonsp/smm_gateway_sp.cmake REQUI=
RED)
- include(../../infra/psa-varstore.cmake REQUIRED)
- include(../../smm-gateway.cmake REQUIRED)
-=20
--#----------------------------------------------------------------------=
---------
--#  Set target platform to provide drivers needed by the deployment
--#
--#----------------------------------------------------------------------=
---------
--add_platform(TARGET "smm-gateway")
--
- #----------------------------------------------------------------------=
---------
- #  Deployment specific build options
- #----------------------------------------------------------------------=
---------
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index d16cde3f4..fd93d6f7e 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -9,9 +9,11 @@
- # include MHU driver
- include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
-=20
-+set(SMM_GATEWAY_MAX_UEFI_VARIABLES 80 CACHE STRING "Maximum UEFI variab=
le count")
-+set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 16384 CACHE STRING "RPC c=
aller buffer size in SMMGW")
-+
- target_compile_definitions(${TGT} PRIVATE
- 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
--	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D80
- )
-=20
- add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
---=20
-2.25.1
-
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0014-Use-__packed-for-the-variable_metadata-struct.patch b/meta-arm-bsp/r=
ecipes-security/trusted-services/corstone1000/0014-Use-__packed-for-the-v=
ariable_metadata-struct.patch
deleted file mode 100644
index 019b54a9..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Us=
e-__packed-for-the-variable_metadata-struct.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 8290755eb2b6aaa857b2dca74494290c64d46fb3 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Mon, 26 Feb 2024 16:41:03 +0100
-Subject: [PATCH] Use __packed for the variable_metadata struct
-
-This is only a temporary fix so the buffer limit in TF-M
-doesn't need to be changed. With the __packed attribute, the
-struct's size is 100 bytes instead of 104 bytes.
-The struct will be changed in later upstream commits so this
-change won't be needed, and the RSS_COMMS implementation
-will be able to handle that.
-
-Upstream-Status: Inappropriate
-[Won't be needed after newer upstream version]
----
- components/service/smm_variable/backend/variable_index.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/components/service/smm_variable/backend/variable_index.h b/=
components/service/smm_variable/backend/variable_index.h
-index 2f0197da..e82039ac 100644
---- a/components/service/smm_variable/backend/variable_index.h
-+++ b/components/service/smm_variable/backend/variable_index.h
-@@ -29,7 +29,7 @@ extern "C" {
-  *
-  * Holds metadata associated with stored variable.
-  */
--struct variable_metadata
-+struct __packed variable_metadata
- {
- 	EFI_GUID	guid;
- 	size_t		name_size;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 9bace889..64d65714 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -5,17 +5,12 @@ SRC_URI:append:corstone1000  =3D " \
     file://0001-Add-stub-capsule-update-service-components.patch \
     file://0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch \
     file://0003-FMP-Support-in-Corstone1000.patch \
-    file://0004-GetNextVariableName-Fix.patch     \
+    file://0004-smm_gateway-GetNextVariableName-Fix.patch     \
     file://0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.pat=
ch \
     file://0006-plat-corstone1000-Use-the-stateless-platform-service.pat=
ch \
     file://0007-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
-    file://0008-platform-corstone1000-fix-synchronization-issue.patch \
-    file://0009-plat-corstone1000-fmp-client-id.patch \
-    file://0010-Decrease-SMM_GATEWAY_MAX_UEFI_VARIABLES.patch \
-    file://0011-Fix-psa_ipc-service-s-psa_call.patch \
-    file://0012-Make-RPC-caller-session-SHM-size-build-time-configur.pat=
ch \
-    file://0013-Set-RPC-caller-session-SHM-size-for-Corstone-1000-SM.pat=
ch \
-    file://0014-Use-__packed-for-the-variable_metadata-struct.patch \
+    file://0008-plat-corstone1000-add-client_id-for-FMP-service.patch \
+    file://0009-Remove-Werror-flag.patch \
     "
=20
=20
--=20
2.43.1


