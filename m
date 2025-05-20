Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF59C54E92
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:28:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26831.1747762092981213420
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 10:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A97C1F91;
	Tue, 20 May 2025 10:27:59 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9749D3F5A1;
	Tue, 20 May 2025 10:28:11 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>,
	Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 7/9] arm-bsp/trusted-services: corstone1000: rebase patches
Date: Tue, 20 May 2025 19:27:45 +0200
Message-ID: <20250520172748.3439803-7-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520172748.3439803-1-gyorgy.szing@arm.com>
References: <20250520172748.3439803-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 17:28:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6514

The patches needed rebasing to the latest Trusted Services version so
they can be applied cleanly.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...ub-capsule-update-service-components.patch |  14 +-
 ...02-Fix-in-AEAD-for-psa-arch-test-254.patch |  18 +-
 .../0003-FMP-Support-in-Corstone1000.patch    |   6 +-
 ...0004-Fix-psa-api-crypto-test-no-243.patch} |   8 +-
 ...-smm_gateway-GetNextVariableName-Fix.patch |  45 --
 ...-Use-the-stateless-platform-service.patch} |   6 +-
 ...-Initialize-capsule-update-provider.patch} |  40 +-
 ...e1000-add-client_id-for-FMP-service.patch} |   6 +-
 ...ag.patch =3D> 0008-Remove-Werror-flag.patch} |  25 +-
 ..._HAS_ATTEST_PK-define-from-IAT-test.patch} |   6 +-
 ...sizes-compile-time-definitions-user.patch} |  22 +-
 ...0011-Align-PSA-Crypto-with-TF-Mv2.1.patch} |  28 +-
 ...-Fix-Avoid-redefinition-of-variables.patch |  28 -
 ...x-GetNextVariableName-NameSize-input.patch | 495 ------------
 ...r-handling-of-variable-index-loading.patch |  82 --
 ...pi-to-create-uefi-priv-var-fingerpri.patch | 758 ------------------
 ...estamp-validation-for-uefi-variables.patch | 146 ----
 ...ch =3D> 0015-se-proxy-protobuf-change.patch} |  21 +-
 ...n-uefi-variable-authentication-steps.patch | 282 -------
 ...e-Authenticated-Variable-verificatio.patch | 292 -------
 .../trusted-services/ts-arm-platforms.inc     |  27 +-
 21 files changed, 107 insertions(+), 2248 deletions(-)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0005=
-Fix-psa-api-crypto-test-no-243.patch =3D> 0004-Fix-psa-api-crypto-test-n=
o-243.patch} (83%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0004-smm_gateway-GetNextVariableName-Fix.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0006=
-plat-corstone1000-Use-the-stateless-platform-service.patch =3D> 0005-pla=
t-corstone1000-Use-the-stateless-platform-service.patch} (97%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0007=
-plat-corstone1000-Initialize-capsule-update-provider.patch =3D> 0006-pla=
t-corstone1000-Initialize-capsule-update-provider.patch} (74%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0008=
-plat-corstone1000-add-client_id-for-FMP-service.patch =3D> 0007-plat-cor=
stone1000-add-client_id-for-FMP-service.patch} (92%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0009=
-Remove-Werror-flag.patch =3D> 0008-Remove-Werror-flag.patch} (87%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0010=
-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch =3D> 0009-Remov=
e-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch} (86%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0018=
-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch =3D> 0010-Mak=
e-RSS-and-MHU-sizes-compile-time-definitions-user.patch} (68%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0019=
-Align-PSA-Crypto-with-TF-Mv2.1.patch =3D> 0011-Align-PSA-Crypto-with-TF-=
Mv2.1.patch} (94%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0011-Fix-Avoid-redefinition-of-variables.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Fix-GetNextVariableName-NameSize-input.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Fix-error-handling-of-variable-index-loading.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-Provide-crypto-api-to-create-uefi-priv-var-fingerpri.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0015-Add-timestamp-validation-for-uefi-variables.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0020=
-se-proxy-protobuf-change.patch =3D> 0015-se-proxy-protobuf-change.patch}=
 (81%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0016-Isolate-common-uefi-variable-authentication-steps.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0017-Implement-Private-Authenticated-Variable-verificatio.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0001-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp/reci=
pes-security/trusted-services/corstone1000/0001-Add-stub-capsule-update-s=
ervice-components.patch
index fa33f78c..8910364a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-stub-capsule-update-service-components.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-stub-capsule-update-service-components.patch
@@ -1,7 +1,7 @@
-From 1ba2a22575c1b73b5ab09e040a00f370eca4b758 Mon Sep 17 00:00:00 2001
+From fd171007b073a4cff7c3deabfdff233c0a9ed507 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Tue, 12 Oct 2021 15:45:41 +0100
-Subject: [PATCH 1/8] Add stub capsule update service components
+Subject: [PATCH 01/12] Add stub capsule update service components
=20
 To facilitate development of a capsule update service provider,
 stub components are added to provide a starting point for an
@@ -280,13 +280,13 @@ index 000000000..1d412eb23
 +	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
 +	)
 diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
-index a52a1b711..4658c9662 100644
+index 3830f9d61..27af8a333 100644
 --- a/deployments/se-proxy/infra/corstone1000/infra.cmake
 +++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
-@@ -21,6 +21,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/attestation/key_mngr/local"
- 		"components/service/attestation/reporter/psa_ipc"
- 		"components/service/crypto/backend/psa_ipc"
+@@ -27,6 +27,7 @@ add_components(TARGET "se-proxy"
+ 		"components/service/fwu/provider/serializer"
+ 		"components/service/fwu/psa_fwu_m/agent"
+ 		"components/service/fwu/psa_fwu_m/interface/stub"
 +		"components/service/capsule_update/provider"
  		"components/service/secure_storage/backend/secure_storage_ipc"
  )
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0002-Fix-in-AEAD-for-psa-arch-test-254.patch b/meta-arm-bsp/recipes-secur=
ity/trusted-services/corstone1000/0002-Fix-in-AEAD-for-psa-arch-test-254.=
patch
index 02c9c668..a2e72b79 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Fi=
x-in-AEAD-for-psa-arch-test-254.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Fi=
x-in-AEAD-for-psa-arch-test-254.patch
@@ -1,14 +1,14 @@
-From 834d5184902341414eb147204eeda8b0ff01f38c Mon Sep 17 00:00:00 2001
+From 74a07ccbb4eb573269672a0c1f61b9165a592b44 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Mon, 14 Feb 2022 08:22:25 +0000
-Subject: [PATCH 2/8] Fix in AEAD for psa-arch test 254
+Subject: [PATCH 02/12] Fix in AEAD for psa-arch test 254
=20
 PSA crypto test 254 fails at checkpoint 6.
 Fix output arguments in various crypto AEAD functions
 to match crypto service implementation in TF-M. AEAD API's
 in TF-M start expecting output size as an argument.
=20
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31176]=20
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31176]
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
@@ -23,7 +23,7 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  6 files changed, 14 insertions(+), 3 deletions(-)
=20
 diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_aead.h b/components/service/crypto/client/caller/packed-c/crypto_call=
er_aead.h
-index 417189e..236d3e2 100644
+index 417189e87..236d3e258 100644
 --- a/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
 +++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
 @@ -314,6 +314,7 @@ static inline psa_status_t crypto_caller_aead_update=
(struct service_client *cont
@@ -35,7 +35,7 @@ index 417189e..236d3e2 100644
 =20
  	/* Mandatory input data parameter */
 diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/comp=
onents/service/crypto/include/psa/crypto_sizes.h
-index 30aa102..130d272 100644
+index 30aa102da..130d27295 100644
 --- a/components/service/crypto/include/psa/crypto_sizes.h
 +++ b/components/service/crypto/include/psa/crypto_sizes.h
 @@ -351,7 +351,7 @@
@@ -48,7 +48,7 @@ index 30aa102..130d272 100644
  /** A sufficient output buffer size for psa_aead_update().
   *
 diff --git a/components/service/crypto/provider/extension/aead/aead_prov=
ider.c b/components/service/crypto/provider/extension/aead/aead_provider.=
c
-index b73d88d..510cffa 100644
+index b73d88d32..510cffa34 100644
 --- a/components/service/crypto/provider/extension/aead/aead_provider.c
 +++ b/components/service/crypto/provider/extension/aead/aead_provider.c
 @@ -283,10 +283,11 @@ static rpc_status_t aead_update_handler(void *cont=
ext, struct rpc_request *req)
@@ -81,7 +81,7 @@ index b73d88d..510cffa 100644
 =20
  				psa_status =3D psa_aead_update(&crypto_context->op.aead,
 diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/aead_provider_serializer.h b/components/service/crypto/provider/extensi=
on/aead/serializer/aead_provider_serializer.h
-index be76d2b..5909730 100644
+index be76d2bc6..590973048 100644
 --- a/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
 +++ b/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
 @@ -51,6 +51,7 @@ struct aead_provider_serializer {
@@ -93,7 +93,7 @@ index be76d2b..5909730 100644
 =20
  	rpc_status_t (*serialize_aead_update_resp)(struct rpc_buffer *resp_buf=
,
 diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/packed-c/packedc_aead_provider_serializer.c b/components/service/crypto=
/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serial=
izer.c
-index 8f8c3c7..922a7b6 100644
+index 8f8c3c7f2..922a7b651 100644
 --- a/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
 +++ b/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
 @@ -192,6 +192,7 @@ static rpc_status_t deserialize_aead_update_ad_req(c=
onst struct rpc_buffer *req_
@@ -113,7 +113,7 @@ index 8f8c3c7..922a7b6 100644
  		tlv_const_iterator_begin(&req_iter,
  			(uint8_t*)req_buf->data + expected_fixed_len,
 diff --git a/protocols/service/crypto/packed-c/aead.h b/protocols/servic=
e/crypto/packed-c/aead.h
-index 0be266b..435fd3b 100644
+index 0be266b52..435fd3b52 100644
 --- a/protocols/service/crypto/packed-c/aead.h
 +++ b/protocols/service/crypto/packed-c/aead.h
 @@ -98,6 +98,7 @@ enum
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0003-FMP-Support-in-Corstone1000.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/corstone1000/0003-FMP-Support-in-Corstone1000.patch
index dff9b7ff..cd2cf5fc 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-FM=
P-Support-in-Corstone1000.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-FM=
P-Support-in-Corstone1000.patch
@@ -1,7 +1,7 @@
-From ef6b4fef7b7a740d6df8dab12aa7c73d06bb9f3b Mon Sep 17 00:00:00 2001
+From fea499f48d07638417511f194c2977133fd75b4d Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Fri, 8 Jul 2022 09:48:06 +0100
-Subject: [PATCH 3/8] FMP Support in Corstone1000.
+Subject: [PATCH 03/12] FMP Support in Corstone1000.
=20
 The FMP support is used by u-boot to pupolate ESRT information
 for the kernel.
@@ -70,7 +70,7 @@ index 1d412eb23..6b0601494 100644
  	)
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
 new file mode 100644
-index 000000000..56ce38579
+index 000000000..2222251a7
 --- /dev/null
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 @@ -0,0 +1,307 @@
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0005-Fix-psa-api-crypto-test-no-243.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/0004-Fix-psa-api-crypto-test-no-243.patch
similarity index 83%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
005-Fix-psa-api-crypto-test-no-243.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
4-Fix-psa-api-crypto-test-no-243.patch
index bb30a766..9253d8ec 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Fi=
x-psa-api-crypto-test-no-243.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-Fi=
x-psa-api-crypto-test-no-243.patch
@@ -1,7 +1,7 @@
-From 372d6e9e5827486841ffe15a1b050569fff762b6 Mon Sep 17 00:00:00 2001
+From c74d0d62fede8ef0207a909fb4157dbbb4830dc9 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Wed, 10 Apr 2024 09:17:39 +0200
-Subject: [PATCH 5/8] Fix psa-api-crypto-test no 243
+Subject: [PATCH 04/12] Fix psa-api-crypto-test no 243
=20
 Enable MbedTLS ECP DP SECP521R1 ECC algorithm to pass
 PSA-API tests's `psa-api-crypto-test` number 243 as it is
@@ -15,12 +15,12 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh=
.tungal@arm.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index d944acf..e811c25 100644
+index d39b79033..0c7c51b6e 100644
 --- a/platform/providers/arm/corstone1000/platform.cmake
 +++ b/platform/providers/arm/corstone1000/platform.cmake
 @@ -14,6 +14,7 @@ target_compile_definitions(${TGT} PRIVATE
  	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
- 	PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE=3D0x2080
+ 	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D0x2080
  	COMMS_MHU_MSG_SIZE=3D0x3500
 +	MBEDTLS_ECP_DP_SECP521R1_ENABLED
  )
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0004-smm_gateway-GetNextVariableName-Fix.patch b/meta-arm-bsp/recipes-sec=
urity/trusted-services/corstone1000/0004-smm_gateway-GetNextVariableName-=
Fix.patch
deleted file mode 100644
index 51337b2f..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-sm=
m_gateway-GetNextVariableName-Fix.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 660658e9f974126fae15d9d8839415a76e8d6663 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 10 Apr 2024 09:16:47 +0200
-Subject: [PATCH 4/9] smm_gateway: GetNextVariableName Fix
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
- .../uefi/smm_variable/provider/smm_variable_provider.c      | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/components/service/uefi/smm_variable/provider/smm_variable_=
provider.c b/components/service/uefi/smm_variable/provider/smm_variable_p=
rovider.c
-index 1875397..ca3f7e5 100644
---- a/components/service/uefi/smm_variable/provider/smm_variable_provide=
r.c
-+++ b/components/service/uefi/smm_variable/provider/smm_variable_provide=
r.c
-@@ -176,16 +176,14 @@ static rpc_status_t get_next_variable_name_handler=
(void *context, struct rpc_req
-=20
- 		if (resp_buf->size >=3D param_len) {
- 			struct rpc_buffer *req_buf =3D &req->request;
--			size_t max_name_len =3D
--				resp_buf->size -
--				SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_NAME_OFFSET;
-=20
- 			memmove(resp_buf->data, req_buf->data, param_len);
-=20
- 			efi_status =3D uefi_variable_store_get_next_variable_name(
- 				&this_instance->variable_store,
- 				(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *)resp_buf->data,
--				max_name_len, &resp_buf->data_length);
-+				((SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data)-=
>NameSize,
-+				&resp_buf->data_length);
- 		} else {
- 			/* Reponse buffer not big enough */
- 			efi_status =3D EFI_BAD_BUFFER_SIZE;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0006-plat-corstone1000-Use-the-stateless-platform-service.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0005-plat-corstone10=
00-Use-the-stateless-platform-service.patch
similarity index 97%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
006-plat-corstone1000-Use-the-stateless-platform-service.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
5-plat-corstone1000-Use-the-stateless-platform-service.patch
index 44e2dd85..8324e9e0 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-pl=
at-corstone1000-Use-the-stateless-platform-service.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-pl=
at-corstone1000-Use-the-stateless-platform-service.patch
@@ -1,7 +1,7 @@
-From c2edcd8bd3d8817765f280708eae894d6cd8d974 Mon Sep 17 00:00:00 2001
+From 81d1dbe3f04195c0ad26790e127d61149e4f5b78 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Sun, 18 Jun 2023 14:38:42 +0100
-Subject: [PATCH 6/8] plat: corstone1000: Use the stateless platform serv=
ice
+Subject: [PATCH 05/12] plat: corstone1000: Use the stateless platform se=
rvice
  calls Calls to psa_connect is not needed and psa_call can be called dir=
ectly
  with a pre defined handle.
=20
@@ -67,7 +67,7 @@ index bfeb7301a..12c552dae 100644
  		default:
  			EMSG("%s unsupported opcode", __func__);
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
-index 56ce38579..bebdf859f 100644
+index 2222251a7..2ed0f33c5 100644
 --- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 @@ -238,8 +238,7 @@ static psa_status_t unpack_image_info(void *buffer, =
uint32_t size)
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0007-plat-corstone1000-Initialize-capsule-update-provider.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0006-plat-corstone10=
00-Initialize-capsule-update-provider.patch
similarity index 74%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
007-plat-corstone1000-Initialize-capsule-update-provider.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
6-plat-corstone1000-Initialize-capsule-update-provider.patch
index 738b5af0..8b1e44ba 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-pl=
at-corstone1000-Initialize-capsule-update-provider.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-pl=
at-corstone1000-Initialize-capsule-update-provider.patch
@@ -1,7 +1,7 @@
-From 925a07093fa571ee1d2f2e59affcd2c52f1d5b54 Mon Sep 17 00:00:00 2001
+From 8a6542231613d5f1b60bc209a7ad8f8cf72bc95a Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Wed, 29 Nov 2023 15:40:21 +0100
-Subject: [PATCH 7/8] plat: corstone1000: Initialize capsule update provi=
der
+Subject: [PATCH 06/12] plat: corstone1000: Initialize capsule update pro=
vider
=20
 Initializes the capsule update service provider in se-proxy-sp.c deploym=
ent
 for corstone1000.
@@ -15,15 +15,15 @@ Upstream-Status: Inappropriate [Design is to revisted=
]
  3 files changed, 42 insertions(+), 1 deletion(-)
=20
 diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
-index 155e94863..a0eb03b6f 100644
+index 485d76493..88e4cf17e 100644
 --- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
 +++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
 @@ -39,7 +39,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
  		goto fatal_error;
  	}
 =20
--	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 4, 16);
-+	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 5, 16);
+-	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 5, 16);
++	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 6, 16);
  	if (rpc_status !=3D RPC_SUCCESS) {
  		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
  		goto fatal_error;
@@ -43,24 +43,24 @@ index 155e94863..a0eb03b6f 100644
 +		goto fatal_error;
 +	}
 +
- 	/* End of boot phase */
- 	result =3D sp_msg_wait(&req_msg);
- 	if (result !=3D SP_RESULT_OK) {
+ 	rpc_iface =3D fwu_proxy_create();
+ 	if (!rpc_iface) {
+ 		EMSG("Failed to create FWU proxy");
 diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index b3b93cfd6..fc179b3c1 100644
+index 759983b46..185a6cd97 100644
 --- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
 +++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
 @@ -11,6 +11,7 @@
- #include <rpc/rss_comms/caller/sp/rss_comms_caller.h>
+ #include <rpc/rse_comms/caller/sp/rse_comms_caller.h>
  #include <service/attestation/provider/attest_provider.h>
  #include <service/attestation/provider/serializer/packed-c/packedc_atte=
st_provider_serializer.h>
 +#include <service/capsule_update/provider/capsule_update_provider.h>
  #include <service/crypto/factory/crypto_provider_factory.h>
- #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
- #include "service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_uuid.h"
-@@ -129,3 +130,30 @@ struct rpc_service_interface *its_proxy_create(void=
)
+ #include "service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h"
+ #include "service/fwu/provider/fwu_provider.h"
+@@ -141,3 +142,30 @@ struct rpc_service_interface *fwu_proxy_create(void=
)
 =20
- 	return secure_storage_provider_init(&its_provider, backend, &its_uuid)=
;
+ 	return fwu_provider_init(&fwu_provider, agent);
  }
 +
 +struct rpc_service_interface *capsule_update_proxy_create(void)
@@ -70,14 +70,14 @@ index b3b93cfd6..fc179b3c1 100644
 +	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
 +
 +	/* Static objects for proxy instance */
-+	static struct rpc_caller_interface rss_comms =3D { 0 };
++	static struct rpc_caller_interface rse_comms =3D { 0 };
 +	static struct rpc_caller_session rpc_session =3D { 0 };
 +
-+	rpc_status =3D rss_comms_caller_init(&rss_comms);
++	rpc_status =3D rse_comms_caller_init(&rse_comms);
 +	if (rpc_status !=3D RPC_SUCCESS)
 +		return NULL;
 +
-+	rpc_status =3D rpc_caller_session_open(&rpc_session, &rss_comms, &dumm=
y_uuid, 0, 0);
++	rpc_status =3D rpc_caller_session_open(&rpc_session, &rse_comms, &dumm=
y_uuid, 0, 0);
 +	if (rpc_status !=3D RPC_SUCCESS)
 +		return NULL;
 +
@@ -90,13 +90,13 @@ index b3b93cfd6..fc179b3c1 100644
 +	return capsule_update_provider_init(&capsule_update_provider);
 +}
 diff --git a/deployments/se-proxy/infra/service_proxy_factory.h b/deploy=
ments/se-proxy/infra/service_proxy_factory.h
-index caaea79ed..b981754b7 100644
+index be83319b8..88b377063 100644
 --- a/deployments/se-proxy/infra/service_proxy_factory.h
 +++ b/deployments/se-proxy/infra/service_proxy_factory.h
-@@ -17,6 +17,7 @@ struct rpc_service_interface *attest_proxy_create(void=
);
- struct rpc_service_interface *crypto_proxy_create(void);
+@@ -18,6 +18,7 @@ struct rpc_service_interface *crypto_proxy_create(void=
);
  struct rpc_service_interface *ps_proxy_create(void);
  struct rpc_service_interface *its_proxy_create(void);
+ struct rpc_service_interface *fwu_proxy_create(void);
 +struct rpc_service_interface *capsule_update_proxy_create(void);
 =20
  #ifdef __cplusplus
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0008-plat-corstone1000-add-client_id-for-FMP-service.patch b/meta-arm-bsp=
/recipes-security/trusted-services/corstone1000/0007-plat-corstone1000-ad=
d-client_id-for-FMP-service.patch
similarity index 92%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
008-plat-corstone1000-add-client_id-for-FMP-service.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
7-plat-corstone1000-add-client_id-for-FMP-service.patch
index 3e927000..f56c3578 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-pl=
at-corstone1000-add-client_id-for-FMP-service.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-pl=
at-corstone1000-add-client_id-for-FMP-service.patch
@@ -1,7 +1,7 @@
-From f6ed75939f0b57e6b0e50ab11cdc3304098456dd Mon Sep 17 00:00:00 2001
+From eddadb001463495307fb33f99e8cb41b9722ace1 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Fri, 5 Apr 2024 17:31:03 +0200
-Subject: [PATCH 8/8] plat: corstone1000: add client_id for FMP service
+Subject: [PATCH 07/12] plat: corstone1000: add client_id for FMP service
=20
 Corstone1000 uses trusted-firmware-m as secure enclave software componen=
t. Due
 to the changes in TF-M 2.0, psa services requires a seperate client_id n=
ow.
@@ -15,7 +15,7 @@ Upstream-Status: Inappropriate [Design is to revisted]
  1 file changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
-index bebdf859f..1b4813d62 100644
+index 2ed0f33c5..58c2cceaf 100644
 --- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
 @@ -33,6 +33,7 @@
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-Remove-Werror-flag.patch b/meta-arm-bsp/recipes-security/trusted-ser=
vices/corstone1000/0008-Remove-Werror-flag.patch
similarity index 87%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
009-Remove-Werror-flag.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
8-Remove-Werror-flag.patch
index d08ebe9f..cbb9780c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Re=
move-Werror-flag.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Re=
move-Werror-flag.patch
@@ -1,7 +1,7 @@
-From 6d140b21c22dda58f596bb513a1cd6bc08e914eb Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Wed, 3 Apr 2024 10:18:16 +0100
-Subject: [PATCH] Remove Werror flag
+From 5456cf76e45fc4b06d67b31b53f66a96833c67d9 Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <gyorgy.szing@arm.com>
+Date: Fri, 18 Oct 2024 11:50:32 +0000
+Subject: [PATCH 08/12] Remove Werror flag
=20
 Remove Werror flag due to compilation issues for TS in yocto
=20
@@ -16,10 +16,10 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh=
.tungal@arm.com>
  5 files changed, 3 insertions(+), 5 deletions(-)
=20
 diff --git a/deployments/smm-gateway/config/default-opteesp/CMakeLists.t=
xt b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
-index 5521467..88048a2 100644
+index 94ff14c2c..42385635d 100644
 --- a/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
 +++ b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
-@@ -99,7 +99,6 @@ target_compile_definitions(smm-gateway PRIVATE
+@@ -92,7 +92,6 @@ target_compile_definitions(smm-gateway PRIVATE
  if(CMAKE_C_COMPILER_ID STREQUAL "GNU")
  	target_compile_options(smm-gateway PRIVATE
  		-std=3Dc11
@@ -28,10 +28,10 @@ index 5521467..88048a2 100644
 =20
  endif()
 diff --git a/deployments/smm-gateway/config/default-sp/CMakeLists.txt b/=
deployments/smm-gateway/config/default-sp/CMakeLists.txt
-index ca563c0..4b43653 100644
+index e92f16384..578027163 100644
 --- a/deployments/smm-gateway/config/default-sp/CMakeLists.txt
 +++ b/deployments/smm-gateway/config/default-sp/CMakeLists.txt
-@@ -97,7 +97,6 @@ target_compile_definitions(smm-gateway PRIVATE
+@@ -89,7 +89,6 @@ target_compile_definitions(smm-gateway PRIVATE
  if(CMAKE_C_COMPILER_ID STREQUAL "GNU")
  	target_compile_options(smm-gateway PRIVATE
  		-std=3Dc11
@@ -40,7 +40,7 @@ index ca563c0..4b43653 100644
 =20
  endif()
 diff --git a/environments/arm-linux/default_toolchain_file.cmake b/envir=
onments/arm-linux/default_toolchain_file.cmake
-index 1da144e..6909db6 100644
+index 7e565dd20..ad11248b3 100644
 --- a/environments/arm-linux/default_toolchain_file.cmake
 +++ b/environments/arm-linux/default_toolchain_file.cmake
 @@ -19,7 +19,7 @@ set(CMAKE_SYSTEM_PROCESSOR arm)
@@ -51,9 +51,9 @@ index 1da144e..6909db6 100644
 +set(TS_WARNING_FLAGS "-Wall" CACHE STRING "Compiler flags affecting gen=
erating warning messages.")
  set(TS_MANDATORY_LINKER_FLAGS "" CACHE STRING "Linker flags needed for =
correct builds.")
 =20
- # Set flags affecting all build types
+ # branch-protection enables bti/pac while compile force-bti tells the l=
inker to
 diff --git a/environments/linux-pc/default_toolchain_file.cmake b/enviro=
nments/linux-pc/default_toolchain_file.cmake
-index 58f29bc..e23bb79 100644
+index 2215d6b5d..74d8b6806 100644
 --- a/environments/linux-pc/default_toolchain_file.cmake
 +++ b/environments/linux-pc/default_toolchain_file.cmake
 @@ -11,7 +11,7 @@ include_guard(GLOBAL)
@@ -66,7 +66,7 @@ index 58f29bc..e23bb79 100644
 =20
  # Set flags affecting all build types
 diff --git a/environments/opteesp/default_toolchain_file.cmake b/environ=
ments/opteesp/default_toolchain_file.cmake
-index 43c19c5..90a9418 100644
+index b150b8528..297b5f886 100644
 --- a/environments/opteesp/default_toolchain_file.cmake
 +++ b/environments/opteesp/default_toolchain_file.cmake
 @@ -21,7 +21,7 @@ set(CMAKE_POSITION_INDEPENDENT_CODE True)
@@ -81,4 +81,3 @@ index 43c19c5..90a9418 100644
 --=20
 2.25.1
=20
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0010-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0009-Remove-PLATFORM_H=
AS_ATTEST_PK-define-from-IAT-test.patch
similarity index 86%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
010-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
9-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
index addf879f..e95fe821 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Re=
move-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Re=
move-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
@@ -1,7 +1,7 @@
-From a94bcd8af80c42adf99a7114174afea4000e6647 Mon Sep 17 00:00:00 2001
+From cee283641224d2a6660cde0ad83e59bdddbc2f37 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Tue, 14 May 2024 15:58:15 +0200
-Subject: [PATCH] Remove PLATFORM_HAS_ATTEST_PK define from IAT test
+Subject: [PATCH 09/12] Remove PLATFORM_HAS_ATTEST_PK define from IAT tes=
t
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
 Upstream-Status: Inappropriate [Should remove the flag only for CS1000]
@@ -10,7 +10,7 @@ Upstream-Status: Inappropriate [Should remove the flag =
only for CS1000]
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/deployments/psa-api-test/initial_attestation/iat-api-test.c=
make b/deployments/psa-api-test/initial_attestation/iat-api-test.cmake
-index 4d1d2b1a9..eb4db223c 100644
+index 807faf67a..c1b2ba6ed 100644
 --- a/deployments/psa-api-test/initial_attestation/iat-api-test.cmake
 +++ b/deployments/psa-api-test/initial_attestation/iat-api-test.cmake
 @@ -15,7 +15,7 @@ set(TS_ARCH_TEST_SUITE INITIAL_ATTESTATION CACHE STRIN=
G "Arch test suite")
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0018-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0010-Make-RSS-and-MH=
U-sizes-compile-time-definitions-user.patch
similarity index 68%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
018-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
0-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch
index e503efe5..90dadc6c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Ma=
ke-RSS-and-MHU-sizes-compile-time-definitions-user.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Ma=
ke-RSS-and-MHU-sizes-compile-time-definitions-user.patch
@@ -1,11 +1,11 @@
-From 6e7e3f2f1cb96eb1c895e8573fae8c141e9b64c8 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Fri, 17 May 2024 13:21:07 +0200
-Subject: [PATCH] Make RSS and MHU sizes compile-time definitions
+From 1c8b1d017cbdd26c9b75580936017eecd2b1f70c Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <gyorgy.szing@arm.com>
+Date: Fri, 18 Oct 2024 12:08:21 +0000
+Subject: [PATCH 10/12] Make RSE and MHU sizes compile-time definitions
  user-configurable
=20
-Replace the hardcoded RSS and MHU compile definitions values with CMake
-cache variables that users can configure to change the size of the RSS
+Replace the hardcoded RSE and MHU compile definitions values with CMake
+cache variables that users can configure to change the size of the RSE
 communication payload and the MHU message.
=20
 Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31178/1]
@@ -16,22 +16,22 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh=
.tungal@arm.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index e811c25..8997155 100644
+index 0c7c51b6e..66a55ab85 100644
 --- a/platform/providers/arm/corstone1000/platform.cmake
 +++ b/platform/providers/arm/corstone1000/platform.cmake
 @@ -9,11 +9,13 @@
  set(SMM_GATEWAY_MAX_UEFI_VARIABLES 80 CACHE STRING "Maximum UEFI variab=
le count")
  set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 4*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
  set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway SP heap size")
-+set(PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE 0x43C0 CACHE STRING "Size of the RS=
S_COMMS_PAYLOAD buffer")
++set(PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE 0x43C0 CACHE STRING "Size of the RS=
E_COMMS_PAYLOAD buffer")
 +set(COMMS_MHU_MSG_SIZE 0x4500 CACHE STRING "Max message size that can b=
e transfered via MHU")
 =20
  target_compile_definitions(${TGT} PRIVATE
  	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
--	PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE=3D0x2080
+-	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D0x2080
 -	COMMS_MHU_MSG_SIZE=3D0x3500
-+	PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSS_COMMS_PAYLOAD_MAX_SIZE}
-+	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
++	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE}
++ 	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
  	MBEDTLS_ECP_DP_SECP521R1_ENABLED
  )
 =20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0019-Align-PSA-Crypto-with-TF-Mv2.1.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/0011-Align-PSA-Crypto-with-TF-Mv2.1.patch
similarity index 94%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
019-Align-PSA-Crypto-with-TF-Mv2.1.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
1-Align-PSA-Crypto-with-TF-Mv2.1.patch
index 88413dd3..906a27d2 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-Al=
ign-PSA-Crypto-with-TF-Mv2.1.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Al=
ign-PSA-Crypto-with-TF-Mv2.1.patch
@@ -1,7 +1,7 @@
-From 3bb579379bcfe32ae0b81f721b370afcb58e9693 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 10 Jul 2024 11:07:09 +0200
-Subject: [PATCH] Align PSA Crypto with TF-Mv2.1
+From 111c15d7bf79e023bfb8bdcf631dfa95503f5f4e Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <gyorgy.szing@arm.com>
+Date: Fri, 18 Oct 2024 11:40:29 +0000
+Subject: [PATCH 11/12] Align PSA Crypto with TF-Mv2.1
=20
 Update following files using the TF-Mv2.1 release (0c4c99b) commit.
=20
@@ -23,20 +23,19 @@ psa_key_attributes_s struct in TF-M. (psa_crypto.c)
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
 Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31179/1]
 ---
- .../service/common/include/psa/crypto_sid.h   | 168 +++++-------------
+ .../service/common/include/psa/crypto_sid.h   | 166 +++++-------------
  .../backend/psa_ipc/crypto_ipc_backend.h      |   9 +-
  .../crypto/include/psa/crypto_client_struct.h |   4 +-
- 3 files changed, 55 insertions(+), 126 deletions(-)
+ 3 files changed, 54 insertions(+), 125 deletions(-)
=20
 diff --git a/components/service/common/include/psa/crypto_sid.h b/compon=
ents/service/common/include/psa/crypto_sid.h
-index 5b05f46d7..fe057ce40 100644
+index 5b05f46d7..e1fbb15e2 100644
 --- a/components/service/common/include/psa/crypto_sid.h
 +++ b/components/service/common/include/psa/crypto_sid.h
-@@ -18,22 +18,24 @@ extern "C" {
-  *        nine groups (Random, Key management, Hash, MAC, Cipher, AEAD,
+@@ -19,21 +19,23 @@ extern "C" {
   *        Asym sign, Asym encrypt, Key derivation).
   */
--enum tfm_crypto_group_id {
+ enum tfm_crypto_group_id {
 -    TFM_CRYPTO_GROUP_ID_RANDOM =3D 0x0,
 -    TFM_CRYPTO_GROUP_ID_KEY_MANAGEMENT,
 -    TFM_CRYPTO_GROUP_ID_HASH,
@@ -46,7 +45,6 @@ index 5b05f46d7..fe057ce40 100644
 -    TFM_CRYPTO_GROUP_ID_ASYM_SIGN,
 -    TFM_CRYPTO_GROUP_ID_ASYM_ENCRYPT,
 -    TFM_CRYPTO_GROUP_ID_KEY_DERIVATION,
-+enum tfm_crypto_group_id_t {
 +    TFM_CRYPTO_GROUP_ID_RANDOM          =3D UINT8_C(1),
 +    TFM_CRYPTO_GROUP_ID_KEY_MANAGEMENT  =3D UINT8_C(2),
 +    TFM_CRYPTO_GROUP_ID_HASH            =3D UINT8_C(3),
@@ -74,14 +72,14 @@ index 5b05f46d7..fe057ce40 100644
      X(TFM_CRYPTO_AEAD_ABORT)
 =20
 -#define ASYMMETRIC_SIGN_FUNCS                      \
-+#define ASYM_SIGN_FUNCS                            \
++#define ASYM_SIGN_FUNCS                      \
      X(TFM_CRYPTO_ASYMMETRIC_SIGN_MESSAGE)          \
      X(TFM_CRYPTO_ASYMMETRIC_VERIFY_MESSAGE)        \
      X(TFM_CRYPTO_ASYMMETRIC_SIGN_HASH)             \
      X(TFM_CRYPTO_ASYMMETRIC_VERIFY_HASH)
 =20
 -#define AYSMMETRIC_ENCRYPT_FUNCS                   \
-+#define ASYM_ENCRYPT_FUNCS                         \
++#define ASYM_ENCRYPT_FUNCS                   \
      X(TFM_CRYPTO_ASYMMETRIC_ENCRYPT)               \
      X(TFM_CRYPTO_ASYMMETRIC_DECRYPT)
 =20
@@ -250,7 +248,7 @@ index 5b05f46d7..fe057ce40 100644
  #ifdef __cplusplus
  }
 diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-index 27ac59837..d7e733b89 100644
+index f9bbf84d6..27fe3496a 100644
 --- a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
 +++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
 @@ -30,10 +30,9 @@ struct psa_ipc_crypto_aead_pack_input {
@@ -269,7 +267,7 @@ index 27ac59837..d7e733b89 100644
                                *   See tfm_crypto_func_sid for detail
                                */
      uint16_t step;           /*!< Key derivation step */
--}__packed;
+-} __attribute__((__packed__));
 +    union {
 +        size_t capacity;     /*!< Key derivation capacity */
 +        uint64_t value;      /*!< Key derivation integer for update*/
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0011-Fix-Avoid-redefinition-of-variables.patch b/meta-arm-bsp/recipes-sec=
urity/trusted-services/corstone1000/0011-Fix-Avoid-redefinition-of-variab=
les.patch
deleted file mode 100644
index d5c43bd5..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Fi=
x-Avoid-redefinition-of-variables.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c7f2861e5c5ee209373a8dba15a608f78a97078b Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Wed, 10 Apr 2024 11:17:50 +0200
-Subject: [PATCH 1/3] Fix: Avoid redefinition of variables
-
-Remove variable redefinition which shadows the original one.
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27954]
----
- .../service/uefi/smm_variable/client/cpp/smm_variable_client.cpp | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/components/service/uefi/smm_variable/client/cpp/smm_variabl=
e_client.cpp b/components/service/uefi/smm_variable/client/cpp/smm_variab=
le_client.cpp
-index f71d0c864..d39448900 100644
---- a/components/service/uefi/smm_variable/client/cpp/smm_variable_clien=
t.cpp
-+++ b/components/service/uefi/smm_variable/client/cpp/smm_variable_clien=
t.cpp
-@@ -166,7 +166,6 @@ efi_status_t smm_variable_client::get_variable(const=
 EFI_GUID &guid, const std::
-=20
- 	if (call_handle) {
- 		uint8_t *resp_buf;
--		size_t resp_len;
- 		service_status_t service_status;
-=20
- 		SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *access_var =3D
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0012-Fix-GetNextVariableName-NameSize-input.patch b/meta-arm-bsp/recipes-=
security/trusted-services/corstone1000/0012-Fix-GetNextVariableName-NameS=
ize-input.patch
deleted file mode 100644
index 06efbb0e..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-Fi=
x-GetNextVariableName-NameSize-input.patch
+++ /dev/null
@@ -1,495 +0,0 @@
-From cc4cc9f3f5f02f713cf4da1854f3085bf31e71cf Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Sat, 13 Apr 2024 14:52:23 +0200
-Subject: [PATCH 2/3] Fix GetNextVariableName NameSize input
-
-Based on the specification the NameSize shall be set to the available
-buffer size at the first call instead of the NameSize of the
-provided variable.
-Change smm-gateway and the tests according this. Also remove
-sanitize_get_next_var_name_param utility function, which is not
-compilant with this solution.
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/28022]
----
- .../backend/test/variable_store_tests.cpp     | 48 +++++++--------
- .../backend/uefi_variable_store.c             | 60 ++++++++++++-------
- .../backend/uefi_variable_store.h             |  5 +-
- .../smm_variable/backend/variable_index.c     |  3 +
- .../provider/smm_variable_provider.c          | 59 +++++-------------
- .../service/smm_variable_attack_tests.cpp     | 29 ++++-----
- .../service/smm_variable_service_tests.cpp    |  7 ++-
- 7 files changed, 98 insertions(+), 113 deletions(-)
-
-diff --git a/components/service/uefi/smm_variable/backend/test/variable_=
store_tests.cpp b/components/service/uefi/smm_variable/backend/test/varia=
ble_store_tests.cpp
-index fd48f13fb..72772821c 100644
---- a/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
-+++ b/components/service/uefi/smm_variable/backend/test/variable_store_t=
ests.cpp
-@@ -501,15 +501,13 @@ TEST(UefiVariableStoreTests, bootServiceAccess)
- 	std::vector<uint8_t> msg_buffer(VARIABLE_BUFFER_SIZE);
- 	SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *next_name =3D
- 		(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *) msg_buffer.data()=
;
--	size_t max_name_len =3D
--		VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_NAME_=
OFFSET;
-=20
- 	size_t total_len =3D 0;
--	next_name->NameSize =3D sizeof(int16_t);
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	next_name->Name[0] =3D 0;
-=20
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    max_name_len, &total_len);
-+							    &total_len);
-=20
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_NOT_FOUND, status);
- }
-@@ -574,47 +572,48 @@ TEST(UefiVariableStoreTests, enumerateStoreContent=
s)
- 	std::vector<uint8_t> msg_buffer(VARIABLE_BUFFER_SIZE);
- 	SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *next_name =3D
- 		(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *) msg_buffer.data()=
;
--	size_t max_name_len =3D
--		VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_NAME_=
OFFSET;
-=20
- 	/* First check handling of invalid variable name */
- 	std::u16string bogus_name =3D to_variable_name(u"bogus_variable");
- 	size_t bogus_name_size =3D string_get_size_in_bytes(bogus_name);
- 	next_name->Guid =3D m_common_guid;
--	next_name->NameSize =3D bogus_name_size;
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	memcpy(next_name->Name, bogus_name.data(), bogus_name_size);
-=20
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    max_name_len, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_INVALID_PARAMETER, status);
-=20
- 	/* Enumerate store contents */
- 	next_name->NameSize =3D sizeof(int16_t);
- 	next_name->Name[0] =3D 0;
--	/* Check if the correct NameSize is returned if max_name_len is too sm=
all */
-+	/* Check if the correct NameSize is returned if namesize is too small =
*/
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    0, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_BUFFER_TOO_SMALL, status);
- 	UNSIGNED_LONGLONGS_EQUAL(sizeof(var_name_1), next_name->NameSize);
-=20
--	/* And then used the previously received next_name->NameSize as max_na=
me_len */
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    next_name->NameSize, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
- 	CHECK_TRUE(compare_variable_name(var_name_1, next_name->Name, next_nam=
e->NameSize));
-=20
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    max_name_len, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
- 	CHECK_TRUE(compare_variable_name(var_name_2, next_name->Name, next_nam=
e->NameSize));
-=20
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    max_name_len, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
- 	CHECK_TRUE(compare_variable_name(var_name_3, next_name->Name, next_nam=
e->NameSize));
-=20
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    max_name_len, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_NOT_FOUND, status);
-=20
- 	power_cycle();
-@@ -622,21 +621,23 @@ TEST(UefiVariableStoreTests, enumerateStoreContent=
s)
- 	/* Enumerate again - should be left with just NV variables.
- 	 * Use a different but equally valid null name.
- 	 */
--	next_name->NameSize =3D 10 * sizeof(int16_t);
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	memset(next_name->Name, 0, next_name->NameSize);
-=20
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    max_name_len, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
- 	CHECK_TRUE(compare_variable_name(var_name_1, next_name->Name, next_nam=
e->NameSize));
-=20
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    max_name_len, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
- 	CHECK_TRUE(compare_variable_name(var_name_3, next_name->Name, next_nam=
e->NameSize));
-=20
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    max_name_len, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_NOT_FOUND, status);
- }
-=20
-@@ -672,21 +673,20 @@ TEST(UefiVariableStoreTests, failedNvSet)
- 	std::vector<uint8_t> msg_buffer(VARIABLE_BUFFER_SIZE);
- 	SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *next_name =3D
- 		(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *) msg_buffer.data()=
;
--	size_t max_name_len =3D
--		VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_NAME_=
OFFSET;
-=20
- 	/* Enumerate store contents */
- 	size_t total_len =3D 0;
--	next_name->NameSize =3D sizeof(int16_t);
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	next_name->Name[0] =3D 0;
-=20
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    max_name_len, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
- 	CHECK_TRUE(compare_variable_name(var_name_1, next_name->Name, next_nam=
e->NameSize));
-=20
-+	next_name->NameSize =3D VARIABLE_BUFFER_SIZE - SMM_VARIABLE_COMMUNICAT=
E_ACCESS_VARIABLE_NAME_OFFSET;
- 	status =3D uefi_variable_store_get_next_variable_name(&m_uefi_variable=
_store, next_name,
--							    max_name_len, &total_len);
-+							    &total_len);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_NOT_FOUND, status);
- }
-=20
-diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
-index 5b46c1371..caf6698aa 100644
---- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-@@ -404,9 +404,27 @@ efi_status_t uefi_variable_store_get_variable(const=
 struct uefi_variable_store *
- efi_status_t
- uefi_variable_store_get_next_variable_name(const struct uefi_variable_s=
tore *context,
- 					   SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *cur,
--					   size_t max_name_len, size_t *total_length)
-+					   size_t *total_length)
- {
--	efi_status_t status =3D check_name_terminator(cur->Name, cur->NameSize=
);
-+	efi_status_t status =3D EFI_SUCCESS;
-+	size_t buffer_size =3D 0;
-+
-+	if (!cur)
-+		return EFI_INVALID_PARAMETER;
-+	/*
-+	 * NameSize is set to the buffer size to store the names,
-+	 * let's calculate the size actually being used.
-+	 */
-+	buffer_size =3D cur->NameSize;
-+	for (int i =3D 0; i < buffer_size / sizeof(int16_t); i++) {
-+		if (cur->Name[i] =3D=3D 0) {
-+			/* With null terminator */
-+			cur->NameSize =3D 2*(i+1);
-+			break;
-+		}
-+	}
-+
-+	status =3D check_name_terminator(cur->Name, cur->NameSize);
-=20
- 	if (status !=3D EFI_SUCCESS)
- 		return status;
-@@ -418,21 +436,11 @@ uefi_variable_store_get_next_variable_name(const s=
truct uefi_variable_store *con
- 			&context->variable_index, &cur->Guid, cur->NameSize, cur->Name, &sta=
tus);
-=20
- 		if (info && (status =3D=3D EFI_SUCCESS)) {
--			/* The NameSize has to be set in every case according to the UEFI sp=
ecs.
--			 * In case of EFI_BUFFER_TOO_SMALL it has to reflect the size of buf=
fer
--			 * needed.
--			 */
--			cur->NameSize =3D info->metadata.name_size;
--			*total_length =3D sizeof(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_=
NAME);
--
--			if (info->metadata.name_size <=3D max_name_len) {
-+			if (info->metadata.name_size <=3D buffer_size) {
- 				cur->Guid =3D info->metadata.guid;
-+				cur->NameSize =3D info->metadata.name_size;
- 				memcpy(cur->Name, info->metadata.name, info->metadata.name_size);
-=20
--				*total_length =3D
--					SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_TOTAL_SIZE(
--						cur);
--
- 				/*
- 				 * Check if variable is accessible (e.g boot variable is not
- 				 * accessible at runtime)
-@@ -442,6 +450,10 @@ uefi_variable_store_get_next_variable_name(const st=
ruct uefi_variable_store *con
- 				if (status =3D=3D EFI_SUCCESS)
- 					break;
- 			} else {
-+				/* The VariableNameSize is updated to reflect the size of buffer ne=
eded */
-+				cur->NameSize =3D info->metadata.name_size;
-+				memset(cur->Name, 0, buffer_size);
-+				memset(&cur->Guid, 0, sizeof(EFI_GUID));
- 				status =3D EFI_BUFFER_TOO_SMALL;
- 				break;
- 			}
-@@ -450,18 +462,24 @@ uefi_variable_store_get_next_variable_name(const s=
truct uefi_variable_store *con
- 			/* Do not hide original error if there is any */
- 			if (status =3D=3D EFI_SUCCESS)
- 				status =3D EFI_NOT_FOUND;
-+
-+			memset(cur->Name, 0, buffer_size);
-+			memset(&cur->Guid, 0, sizeof(EFI_GUID));
-+			cur->NameSize =3D 0;
- 			break;
- 		}
- 	}
-=20
--	/* If we found no accessible variable clear the fields for security */
--	if (status !=3D EFI_SUCCESS) {
--		memset(cur->Name, 0, max_name_len);
--		memset(&cur->Guid, 0, sizeof(EFI_GUID));
--		if (status !=3D EFI_BUFFER_TOO_SMALL)
--			cur->NameSize =3D 0;
-+	if (status =3D=3D EFI_SUCCESS) {
-+		/* Store everything including the name */
-+		*total_length =3D
-+			SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_TOTAL_SIZE(
-+				cur);
-+	} else {
-+		/* Do not store the name, only the size */
-+		*total_length =3D
-+			SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_NAME_OFFSET;
- 	}
--
- 	return status;
- }
-=20
-diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.h b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.h
-index 8be5f36e6..2493ff6b4 100644
---- a/components/service/uefi/smm_variable/backend/uefi_variable_store.h
-+++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.h
-@@ -134,8 +134,7 @@ efi_status_t uefi_variable_store_get_variable(const =
struct uefi_variable_store *
-  * Used for enumerating the store contents
-  *
-  * @param[in]  context uefi_variable_store instance
-- * @param[out] cur Current variable name
-- * @param[in]  max_name_len The maximum variable name length
-+ * @param[inout] cur The size of the VariableName buffer
-  * @param[out] total_len The total length of the output
-  *
-  * @return     EFI_SUCCESS if successful
-@@ -143,7 +142,7 @@ efi_status_t uefi_variable_store_get_variable(const =
struct uefi_variable_store *
- efi_status_t
- uefi_variable_store_get_next_variable_name(const struct uefi_variable_s=
tore *context,
- 					   SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *cur,
--					   size_t max_name_len, size_t *total_length);
-+					   size_t *total_length);
-=20
- /**
-  * @brief      Query for variable info
-diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.c b/components/service/uefi/smm_variable/backend/variable_index.c
-index d850dbe18..e2fe6dd38 100644
---- a/components/service/uefi/smm_variable/backend/variable_index.c
-+++ b/components/service/uefi/smm_variable/backend/variable_index.c
-@@ -27,6 +27,9 @@ static uint64_t name_hash(const EFI_GUID *guid, size_t=
 name_size, const int16_t
-=20
- 	/* Extend to cover name up to but not including null terminator */
- 	for (size_t i =3D 0; i < (name_size - sizeof(int16_t)) / sizeof(int16_=
t); ++i) {
-+		/* Only hash till the first null terminator */
-+		if (name[i] =3D=3D 0)
-+			break;
- 		hash =3D ((hash << 5) + hash) + name[i];
- 	}
-=20
-diff --git a/components/service/uefi/smm_variable/provider/smm_variable_=
provider.c b/components/service/uefi/smm_variable/provider/smm_variable_p=
rovider.c
-index ca3f7e5e5..1a5269338 100644
---- a/components/service/uefi/smm_variable/provider/smm_variable_provide=
r.c
-+++ b/components/service/uefi/smm_variable/provider/smm_variable_provide=
r.c
-@@ -81,30 +81,6 @@ static efi_status_t sanitize_access_variable_param(st=
ruct rpc_request *req, size
- 	return efi_status;
- }
-=20
--static efi_status_t sanitize_get_next_var_name_param(struct rpc_request=
 *req, size_t *param_len)
--{
--	efi_status_t efi_status =3D EFI_INVALID_PARAMETER;
--	*param_len =3D 0;
--	const struct rpc_buffer *req_buf =3D &req->request;
--
--	if (req_buf->data_length >=3D SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIAB=
LE_NAME_NAME_OFFSET) {
--		const SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *param =3D
--			(const SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *)req_buf->da=
ta;
--
--		size_t max_space_for_name =3D
--			req_buf->data_length -
--			SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_NAME_OFFSET;
--
--		if (param->NameSize <=3D max_space_for_name) {
--			*param_len =3D
--				SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME_TOTAL_SIZE(param);
--			efi_status =3D EFI_SUCCESS;
--		}
--	}
--
--	return efi_status;
--}
--
- static efi_status_t sanitize_var_check_property_param(struct rpc_reques=
t *req, size_t *param_len)
- {
- 	efi_status_t efi_status =3D EFI_INVALID_PARAMETER;
-@@ -146,7 +122,7 @@ static rpc_status_t get_variable_handler(void *conte=
xt, struct rpc_request *req)
- 			struct rpc_buffer *req_buf =3D &req->request;
- 			size_t max_data_len =3D resp_buf->size - param_len;
-=20
--			memmove(resp_buf->data, req_buf->data, param_len);
-+			memcpy(resp_buf->data, req_buf->data, param_len);
-=20
- 			efi_status =3D uefi_variable_store_get_variable(
- 				&this_instance->variable_store,
-@@ -167,28 +143,21 @@ static rpc_status_t get_next_variable_name_handler=
(void *context, struct rpc_req
- {
- 	struct smm_variable_provider *this_instance =3D (struct smm_variable_p=
rovider *)context;
-=20
--	size_t param_len =3D 0;
--	efi_status_t efi_status =3D sanitize_get_next_var_name_param(req, &par=
am_len);
-+	efi_status_t efi_status =3D EFI_SUCCESS;
-+	size_t variable_size =3D 0;
-=20
--	if (efi_status =3D=3D EFI_SUCCESS) {
--		/* Valid get next variable name header */
--		struct rpc_buffer *resp_buf =3D &req->response;
-+	/* Valid get next variable name header */
-+	struct rpc_buffer *resp_buf =3D &req->response;
-+	struct rpc_buffer *req_buf =3D &req->request;
-=20
--		if (resp_buf->size >=3D param_len) {
--			struct rpc_buffer *req_buf =3D &req->request;
-+	memcpy(resp_buf->data, req_buf->data, req_buf->data_length);
-=20
--			memmove(resp_buf->data, req_buf->data, param_len);
-+	efi_status =3D uefi_variable_store_get_next_variable_name(
-+		&this_instance->variable_store,
-+		(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *)resp_buf->data,
-+		&variable_size);
-=20
--			efi_status =3D uefi_variable_store_get_next_variable_name(
--				&this_instance->variable_store,
--				(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME *)resp_buf->data,
--				((SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data)-=
>NameSize,
--				&resp_buf->data_length);
--		} else {
--			/* Reponse buffer not big enough */
--			efi_status =3D EFI_BAD_BUFFER_SIZE;
--		}
--	}
-+	resp_buf->data_length =3D variable_size;
-=20
- 	req->service_status =3D efi_status;
-=20
-@@ -240,7 +209,7 @@ static rpc_status_t query_variable_info_handler(void=
 *context, struct rpc_reques
- 		struct rpc_buffer *resp_buf =3D &req->response;
-=20
- 		if (resp_buf->size >=3D req_buf->data_length) {
--			memmove(resp_buf->data, req_buf->data, req_buf->data_length);
-+			memcpy(resp_buf->data, req_buf->data, req_buf->data_length);
-=20
- 			efi_status =3D uefi_variable_store_query_variable_info(
- 				&this_instance->variable_store,
-@@ -308,7 +277,7 @@ static rpc_status_t get_var_check_property_handler(v=
oid *context, struct rpc_req
-=20
- 		if (resp_buf->size >=3D param_len) {
- 			struct rpc_buffer *req_buf =3D &req->request;
--			memmove(resp_buf->data, req_buf->data, param_len);
-+			memcpy(resp_buf->data, req_buf->data, param_len);
- 			resp_buf->data_length =3D param_len;
-=20
- 			efi_status =3D uefi_variable_store_get_var_check_property(
-diff --git a/components/service/uefi/smm_variable/test/service/smm_varia=
ble_attack_tests.cpp b/components/service/uefi/smm_variable/test/service/=
smm_variable_attack_tests.cpp
-index 76b62fd35..98e61fec0 100644
---- a/components/service/uefi/smm_variable/test/service/smm_variable_att=
ack_tests.cpp
-+++ b/components/service/uefi/smm_variable/test/service/smm_variable_att=
ack_tests.cpp
-@@ -176,19 +176,6 @@ TEST(SmmVariableAttackTests, setAndGetWithSizeMaxNa=
meSize)
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
- }
-=20
--TEST(SmmVariableAttackTests, enumerateWithOversizeName)
--{
--	efi_status_t efi_status =3D EFI_SUCCESS;
--	std::u16string var_name =3D null_name;
--	EFI_GUID guid;
--	memset(&guid, 0, sizeof(guid));
--
--	efi_status =3D m_client->get_next_variable_name(guid, var_name,
--						      (var_name.size() + 1) * sizeof(int16_t) + 1);
--
--	UNSIGNED_LONGLONGS_EQUAL(EFI_INVALID_PARAMETER, efi_status);
--}
--
- TEST(SmmVariableAttackTests, enumerateWithSizeMaxNameSize)
- {
- 	efi_status_t efi_status =3D EFI_SUCCESS;
-@@ -202,17 +189,23 @@ TEST(SmmVariableAttackTests, enumerateWithSizeMaxN=
ameSize)
-=20
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-=20
--	/* Initial iteration uses good name length */
--	efi_status =3D m_client->get_next_variable_name(guid, var_name);
-+	/* Initial iteration uses good name length for next variable */
-+	efi_status =3D m_client->get_next_variable_name(guid, var_name, std::n=
umeric_limits<size_t>::max());
-=20
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-=20
--	/* Next iteration uses invalid name length */
--	efi_status =3D m_client->get_next_variable_name(guid, var_name,
--						      std::numeric_limits<size_t>::max());
-+	/* Next iteration uses invalid name length, so a null terminator can n=
ot fit */
-+	var_name =3D null_name;
-+	efi_status =3D m_client->get_next_variable_name(guid, var_name, 1);
-=20
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_INVALID_PARAMETER, efi_status);
-=20
-+	/* Next iteration uses invalid name length, so a null terminator can n=
ot fit */
-+	var_name =3D null_name;
-+	efi_status =3D m_client->get_next_variable_name(guid, var_name, 2);
-+
-+	UNSIGNED_LONGLONGS_EQUAL(EFI_BUFFER_TOO_SMALL, efi_status);
-+
- 	/* Expect to be able to remove the variable */
- 	efi_status =3D m_client->remove_variable(m_common_guid, var_name_1);
- 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
-diff --git a/components/service/uefi/smm_variable/test/service/smm_varia=
ble_service_tests.cpp b/components/service/uefi/smm_variable/test/service=
/smm_variable_service_tests.cpp
-index e82a90c37..8fa4f8077 100644
---- a/components/service/uefi/smm_variable/test/service/smm_variable_ser=
vice_tests.cpp
-+++ b/components/service/uefi/smm_variable/test/service/smm_variable_ser=
vice_tests.cpp
-@@ -9,6 +9,7 @@
- #include <cstring>
- #include <locale>
- #include <sstream>
-+#include <limits>
-=20
- #include "util.h"
-=20
-@@ -154,7 +155,7 @@ TEST_GROUP(SmmVariableServiceTests)
- #endif
-=20
- 		do {
--			status =3D m_client->get_next_variable_name(guid, var_name);
-+			status =3D m_client->get_next_variable_name(guid, var_name, max_vari=
able_size);
-=20
- 			/* There are no more variables in the persistent store */
- 			if (status =3D=3D EFI_NOT_FOUND) {
-@@ -223,6 +224,8 @@ TEST_GROUP(SmmVariableServiceTests)
- 	std::u16string m_ro_variable =3D to_variable_name(u"ro_variable");
- 	std::u16string m_boot_finished_var_name =3D to_variable_name(u"finishe=
d");
-=20
-+	uint32_t max_variable_size =3D 4096;
-+
- 	/* Cleanup skips these variables */
- 	std::vector<std::u16string *> m_non_rm_vars{ &m_ro_variable, &m_boot_f=
inished_var_name };
-=20
-@@ -654,7 +657,7 @@ TEST(SmmVariableServiceTests, enumerateStoreContents=
)
- 	std::u16string *expected_variables[] =3D { &var_name_1, &var_name_2, &=
var_name_3 };
-=20
- 	do {
--		efi_status =3D m_client->get_next_variable_name(guid, var_name);
-+		efi_status =3D m_client->get_next_variable_name(guid, var_name, max_v=
ariable_size);
- 		if (efi_status !=3D EFI_SUCCESS)
- 			break;
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0013-Fix-error-handling-of-variable-index-loading.patch b/meta-arm-bsp/re=
cipes-security/trusted-services/corstone1000/0013-Fix-error-handling-of-v=
ariable-index-loading.patch
deleted file mode 100644
index 978f2e52..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Fi=
x-error-handling-of-variable-index-loading.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From c62e728bb86981219984c8b39819fb8926a41e10 Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Fri, 19 Apr 2024 18:25:23 +0200
-Subject: [PATCH 3/3] Fix error handling of variable index loading
-
-If loading of the variable index from Protected Storage fails, SmmGW
-will silently continue with empty variable store. This is a serious
-fault and a potential security risk.
-Change the code to produce a log output when this happens and stop
-loading the SP.
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/28300]
----
- .../backend/uefi_variable_store.c             | 28 ++++++++++++++-----
- 1 file changed, 21 insertions(+), 7 deletions(-)
-
-diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
-index caf6698aa..c1691dc8f 100644
---- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-@@ -27,7 +27,7 @@
- #include "service/crypto/client/psa/crypto_client.h"
- #endif
-=20
--static void load_variable_index(struct uefi_variable_store *context);
-+static efi_status_t load_variable_index(struct uefi_variable_store *con=
text);
-=20
- static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context);
-=20
-@@ -165,8 +165,10 @@ efi_status_t uefi_variable_store_init(struct uefi_v=
ariable_store *context, uint3
-=20
- 		/* Load the variable index with NV variable info from the persistent =
store */
- 		if (context->index_sync_buffer) {
--			load_variable_index(context);
--			purge_orphan_index_entries(context);
-+			status =3D load_variable_index(context);
-+
-+			if (status =3D=3D EFI_SUCCESS)
-+				purge_orphan_index_entries(context);
- 		}
- 	}
-=20
-@@ -571,7 +573,7 @@ efi_status_t uefi_variable_store_get_var_check_prope=
rty(
- 	return status;
- }
-=20
--static void load_variable_index(struct uefi_variable_store *context)
-+static efi_status_t load_variable_index(struct uefi_variable_store *con=
text)
- {
- 	struct storage_backend *persistent_store =3D context->persistent_store=
.storage_backend;
-=20
-@@ -583,11 +585,23 @@ static void load_variable_index(struct uefi_variab=
le_store *context)
- 			SMM_VARIABLE_INDEX_STORAGE_UID, 0, context->index_sync_buffer_size,
- 			context->index_sync_buffer, &data_len);
-=20
--		if (psa_status =3D=3D PSA_SUCCESS) {
--			variable_index_restore(&context->variable_index, data_len,
--					       context->index_sync_buffer);
-+		switch(psa_status) {
-+			case PSA_SUCCESS:
-+				(void) variable_index_restore(&context->variable_index, data_len,
-+							      context->index_sync_buffer);
-+				break;
-+
-+			case PSA_ERROR_DOES_NOT_EXIST:
-+				IMSG("Index variable does not exist in NV store, continuing with em=
pty index");
-+				break;
-+
-+			default:
-+				EMSG("Loading variable index failed: %d", psa_status);
-+				return EFI_LOAD_ERROR;
- 		}
- 	}
-+
-+	return EFI_SUCCESS;
- }
-=20
- static efi_status_t sync_variable_index(const struct uefi_variable_stor=
e *context)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0014-Provide-crypto-api-to-create-uefi-priv-var-fingerpri.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0014-Provide-crypto-=
api-to-create-uefi-priv-var-fingerpri.patch
deleted file mode 100644
index ae9a53fa..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Pr=
ovide-crypto-api-to-create-uefi-priv-var-fingerpri.patch
+++ /dev/null
@@ -1,758 +0,0 @@
-From 370811420cfa1c14146f45de308bbccf70408eb8 Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Fri, 5 Apr 2024 11:19:37 +0200
-Subject: [PATCH] Provide crypto api to create uefi priv var fingerprint
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Add new call to the crypto backend to calculate a hash of the common
-name of the signing certificate=E2=80=99s Subject and the tbsCertificate
-of the top-level issuer certificate.
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27953]
----
- .../client/caller/packed-c/crypto_caller.h    |   1 +
- ...aller_get_uefi_priv_auth_var_fingerprint.h |  90 ++++++++
- .../packed-c/packedc_crypto_client.cpp        |   8 +
- .../protocol/packed-c/packedc_crypto_client.h |   4 +
- .../service/crypto/client/psa/component.cmake |   1 +
- .../service/crypto/client/psa/crypto_client.h |   5 +
- .../psa/get_uefi_priv_auth_var_fingerprint.c  |  21 ++
- .../service/crypto/provider/crypto_provider.c | 212 +++++++++++++++---
- .../serializer/crypto_provider_serializer.h   |   8 +
- .../packedc_crypto_provider_serializer.c      |  54 +++++
- .../backend/direct/uefi_direct_backend.c      |  90 ++++++++
- deployments/smm-gateway/smm-gateway.cmake     |   5 +
- .../get_uefi_priv_auth_var_fingerprint.h      |  21 ++
- protocols/service/crypto/packed-c/opcodes.h   |   1 +
- 14 files changed, 488 insertions(+), 33 deletions(-)
- create mode 100644 components/service/crypto/client/caller/packed-c/cry=
pto_caller_get_uefi_priv_auth_var_fingerprint.h
- create mode 100644 components/service/crypto/client/psa/get_uefi_priv_a=
uth_var_fingerprint.c
- create mode 100644 protocols/service/crypto/packed-c/get_uefi_priv_auth=
_var_fingerprint.h
-
-diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler.h b/components/service/crypto/client/caller/packed-c/crypto_caller.h
-index d834bc207..d5dd0f70d 100644
---- a/components/service/crypto/client/caller/packed-c/crypto_caller.h
-+++ b/components/service/crypto/client/caller/packed-c/crypto_caller.h
-@@ -31,5 +31,6 @@
- #include "crypto_caller_sign_hash.h"
- #include "crypto_caller_verify_hash.h"
- #include "crypto_caller_verify_pkcs7_signature.h"
-+#include "crypto_caller_get_uefi_priv_auth_var_fingerprint.h"
-=20
- #endif /* PACKEDC_CRYPTO_CALLER_H */
-diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_get_uefi_priv_auth_var_fingerprint.h b/components/service/crypto/clie=
nt/caller/packed-c/crypto_caller_get_uefi_priv_auth_var_fingerprint.h
-new file mode 100644
-index 000000000..d3446e445
---- /dev/null
-+++ b/components/service/crypto/client/caller/packed-c/crypto_caller_get=
_uefi_priv_auth_var_fingerprint.h
-@@ -0,0 +1,90 @@
-+/*
-+ * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PACKEDC_CRYPTO_CALLER_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H
-+#define PACKEDC_CRYPTO_CALLER_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H
-+
-+#include <common/tlv/tlv.h>
-+#include <protocols/common/efi/efi_status.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/get_uefi_priv_auth_var_fing=
erprint.h>
-+#include <service/common/client/service_client.h>
-+#include <stdlib.h>
-+#include <string.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline int crypto_caller_get_uefi_priv_auth_var_fingerprint(stru=
ct service_client *context,
-+						       const uint8_t *signature_cert,
-+						       uint64_t signature_cert_len,
-+						       uint8_t *output)
-+{
-+	efi_status_t efi_status =3D EFI_SUCCESS;
-+	size_t req_len =3D 0;
-+
-+	if (signature_cert_len > UINT16_MAX)
-+		return RPC_ERROR_INVALID_VALUE;
-+
-+	struct tlv_record signature_record =3D {
-+		.tag =3D TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_IN_TAG_SIGNATUR=
E,
-+		.length =3D (uint16_t)signature_cert_len,
-+		.value =3D signature_cert
-+	};
-+
-+	req_len +=3D tlv_required_space(signature_record.length);
-+
-+	rpc_call_handle call_handle;
-+	uint8_t *req_buf;
-+
-+	call_handle =3D rpc_caller_session_begin(context->session, &req_buf, r=
eq_len, 0);
-+
-+	if (call_handle) {
-+		uint8_t *resp_buf;
-+		size_t resp_len;
-+		service_status_t service_status;
-+		struct tlv_iterator req_iter;
-+
-+		tlv_iterator_begin(&req_iter, req_buf, req_len);
-+		tlv_encode(&req_iter, &signature_record);
-+
-+		context->rpc_status =3D rpc_caller_session_invoke(
-+			call_handle, TS_CRYPTO_OPCODE_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT, &r=
esp_buf, &resp_len,
-+			&service_status);
-+
-+		if (context->rpc_status =3D=3D RPC_SUCCESS) {
-+
-+			if (service_status =3D=3D EFI_SUCCESS) {
-+
-+				struct tlv_const_iterator resp_iter;
-+				struct tlv_record decoded_record;
-+				tlv_const_iterator_begin(&resp_iter, resp_buf, resp_len);
-+
-+				if (tlv_find_decode(&resp_iter,
-+							TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_OUT_TAG_IDENTIFIER,=
 &decoded_record)) {
-+
-+					memcpy(output, decoded_record.value, PSA_HASH_MAX_SIZE);
-+				}
-+				else {
-+					/* Mandatory response parameter missing */
-+					efi_status =3D EFI_INVALID_PARAMETER;
-+				}
-+			}
-+		}
-+
-+		rpc_caller_session_end(call_handle);
-+	}
-+
-+	return efi_status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PACKEDC_CRYPTO_CALLER_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H */
-diff --git a/components/service/crypto/client/cpp/protocol/packed-c/pack=
edc_crypto_client.cpp b/components/service/crypto/client/cpp/protocol/pac=
ked-c/packedc_crypto_client.cpp
-index aaa71f0c8..e0f6a15a8 100644
---- a/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.cpp
-+++ b/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.cpp
-@@ -428,3 +428,11 @@ int packedc_crypto_client::verify_pkcs7_signature(c=
onst uint8_t *signature_cert,
- 						    hash, hash_len, public_key_cert,
- 						    public_key_cert_len);
- }
-+
-+int packedc_crypto_client::get_uefi_priv_auth_var_fingerprint(const uin=
t8_t *signature_cert,
-+						  uint64_t signature_cert_len,
-+						  uint8_t *output)
-+{
-+	return crypto_caller_get_uefi_priv_auth_var_fingerprint(&m_client, sig=
nature_cert, signature_cert_len,
-+						    output);
-+}
-diff --git a/components/service/crypto/client/cpp/protocol/packed-c/pack=
edc_crypto_client.h b/components/service/crypto/client/cpp/protocol/packe=
d-c/packedc_crypto_client.h
-index 8d4f60cf9..ec6c51c7f 100644
---- a/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.h
-+++ b/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.h
-@@ -236,6 +236,10 @@ public:
- 	int verify_pkcs7_signature(const uint8_t *signature_cert, uint64_t sig=
nature_cert_len,
- 				   const uint8_t *hash, uint64_t hash_len,
- 				   const uint8_t *public_key_cert, uint64_t public_key_cert_len);
-+
-+	int get_uefi_priv_auth_var_fingerprint(const uint8_t *signature_cert,
-+				    uint64_t signature_cert_len,
-+				    uint8_t *output);
- };
-=20
- #endif /* PACKEDC_CRYPTO_CLIENT_H */
-diff --git a/components/service/crypto/client/psa/component.cmake b/comp=
onents/service/crypto/client/psa/component.cmake
-index 359db3b4a..5bee0c652 100644
---- a/components/service/crypto/client/psa/component.cmake
-+++ b/components/service/crypto/client/psa/component.cmake
-@@ -32,4 +32,5 @@ target_sources(${TGT} PRIVATE
- 	"${CMAKE_CURRENT_LIST_DIR}/psa_sign_message.c"
- 	"${CMAKE_CURRENT_LIST_DIR}/psa_verify_message.c"
- 	"${CMAKE_CURRENT_LIST_DIR}/verify_pkcs7_signature.c"
-+	"${CMAKE_CURRENT_LIST_DIR}/get_uefi_priv_auth_var_fingerprint.c"
- 	)
-diff --git a/components/service/crypto/client/psa/crypto_client.h b/comp=
onents/service/crypto/client/psa/crypto_client.h
-index 4b59bbe32..af04df11e 100644
---- a/components/service/crypto/client/psa/crypto_client.h
-+++ b/components/service/crypto/client/psa/crypto_client.h
-@@ -7,10 +7,15 @@
- #ifndef CRYPTO_CLIENT_H
- #define CRYPTO_CLIENT_H
-=20
-+#include <stddef.h>
- #include <stdint.h>
-=20
- int verify_pkcs7_signature(const uint8_t *signature_cert, uint64_t sign=
ature_cert_len,
- 			   const uint8_t *hash, uint64_t hash_len, const uint8_t *public_key=
_cert,
- 			   uint64_t public_key_cert_len);
-=20
-+int get_uefi_priv_auth_var_fingerprint_handler(const uint8_t *signature=
_cert,
-+				    uint64_t signature_cert_len,
-+				    uint8_t *output);
-+
- #endif /* CRYPTO_CLIENT_H */
-diff --git a/components/service/crypto/client/psa/get_uefi_priv_auth_var=
_fingerprint.c b/components/service/crypto/client/psa/get_uefi_priv_auth_=
var_fingerprint.c
-new file mode 100644
-index 000000000..702aaa0c4
---- /dev/null
-+++ b/components/service/crypto/client/psa/get_uefi_priv_auth_var_finger=
print.c
-@@ -0,0 +1,21 @@
-+/*
-+ * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include "crypto_caller_selector.h"
-+#include "crypto_client.h"
-+#include "psa_crypto_client.h"
-+
-+int get_uefi_priv_auth_var_fingerprint_handler(const uint8_t *signature=
_cert,
-+				    uint64_t signature_cert_len,
-+				    uint8_t *output)
-+{
-+	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
-+		return psa_crypto_client_instance.init_status;
-+
-+	return crypto_caller_get_uefi_priv_auth_var_fingerprint(&psa_crypto_cl=
ient_instance.base,
-+						    signature_cert, signature_cert_len,
-+						    output);
-+}
-diff --git a/components/service/crypto/provider/crypto_provider.c b/comp=
onents/service/crypto/provider/crypto_provider.c
-index 9cd520859..4535d6dbe 100644
---- a/components/service/crypto/provider/crypto_provider.c
-+++ b/components/service/crypto/provider/crypto_provider.c
-@@ -3,12 +3,15 @@
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-+#include <protocols/common/efi/efi_status.h>
- #include <protocols/rpc/common/packed-c/status.h>
- #include <protocols/service/crypto/packed-c/opcodes.h>
- #include <service/crypto/backend/crypto_backend.h>
- #include <service/crypto/provider/crypto_provider.h>
-+#include <compiler.h>
- #include <stdint.h>
- #include <stdlib.h>
-+#include <string.h>
-=20
- #include "crypto_partition.h"
- #include "crypto_uuid.h"
-@@ -28,25 +31,27 @@ static rpc_status_t copy_key_handler(void *context, =
struct rpc_request *req);
- static rpc_status_t purge_key_handler(void *context, struct rpc_request=
 *req);
- static rpc_status_t get_key_attributes_handler(void *context, struct rp=
c_request *req);
- static rpc_status_t verify_pkcs7_signature_handler(void *context, struc=
t rpc_request *req);
-+static rpc_status_t get_uefi_priv_auth_var_fingerprint_handler(void *co=
ntext, struct rpc_request *req);
-=20
- /* Handler mapping table for service */
- static const struct service_handler handler_table[] =3D {
--	{ TS_CRYPTO_OPCODE_GENERATE_KEY,           generate_key_handler },
--	{ TS_CRYPTO_OPCODE_DESTROY_KEY,            destroy_key_handler },
--	{ TS_CRYPTO_OPCODE_EXPORT_KEY,             export_key_handler },
--	{ TS_CRYPTO_OPCODE_EXPORT_PUBLIC_KEY,      export_public_key_handler }=
,
--	{ TS_CRYPTO_OPCODE_IMPORT_KEY,             import_key_handler },
--	{ TS_CRYPTO_OPCODE_SIGN_HASH,              asymmetric_sign_handler },
--	{ TS_CRYPTO_OPCODE_VERIFY_HASH,            asymmetric_verify_handler }=
,
--	{ TS_CRYPTO_OPCODE_ASYMMETRIC_DECRYPT,     asymmetric_decrypt_handler =
},
--	{ TS_CRYPTO_OPCODE_ASYMMETRIC_ENCRYPT,     asymmetric_encrypt_handler =
},
--	{ TS_CRYPTO_OPCODE_GENERATE_RANDOM,        generate_random_handler },
--	{ TS_CRYPTO_OPCODE_COPY_KEY,               copy_key_handler },
--	{ TS_CRYPTO_OPCODE_PURGE_KEY,              purge_key_handler },
--	{ TS_CRYPTO_OPCODE_GET_KEY_ATTRIBUTES,     get_key_attributes_handler =
},
--	{ TS_CRYPTO_OPCODE_SIGN_MESSAGE,           asymmetric_sign_handler },
--	{ TS_CRYPTO_OPCODE_VERIFY_MESSAGE,         asymmetric_verify_handler }=
,
--	{ TS_CRYPTO_OPCODE_VERIFY_PKCS7_SIGNATURE, verify_pkcs7_signature_hand=
ler },
-+	{ TS_CRYPTO_OPCODE_GENERATE_KEY,            generate_key_handler },
-+	{ TS_CRYPTO_OPCODE_DESTROY_KEY,             destroy_key_handler },
-+	{ TS_CRYPTO_OPCODE_EXPORT_KEY,              export_key_handler },
-+	{ TS_CRYPTO_OPCODE_EXPORT_PUBLIC_KEY,       export_public_key_handler =
},
-+	{ TS_CRYPTO_OPCODE_IMPORT_KEY,              import_key_handler },
-+	{ TS_CRYPTO_OPCODE_SIGN_HASH,               asymmetric_sign_handler },
-+	{ TS_CRYPTO_OPCODE_VERIFY_HASH,             asymmetric_verify_handler =
},
-+	{ TS_CRYPTO_OPCODE_ASYMMETRIC_DECRYPT,      asymmetric_decrypt_handler=
 },
-+	{ TS_CRYPTO_OPCODE_ASYMMETRIC_ENCRYPT,      asymmetric_encrypt_handler=
 },
-+	{ TS_CRYPTO_OPCODE_GENERATE_RANDOM,         generate_random_handler },
-+	{ TS_CRYPTO_OPCODE_COPY_KEY,                copy_key_handler },
-+	{ TS_CRYPTO_OPCODE_PURGE_KEY,               purge_key_handler },
-+	{ TS_CRYPTO_OPCODE_GET_KEY_ATTRIBUTES,      get_key_attributes_handler=
 },
-+	{ TS_CRYPTO_OPCODE_SIGN_MESSAGE,            asymmetric_sign_handler },
-+	{ TS_CRYPTO_OPCODE_VERIFY_MESSAGE,          asymmetric_verify_handler =
},
-+	{ TS_CRYPTO_OPCODE_VERIFY_PKCS7_SIGNATURE,  verify_pkcs7_signature_han=
dler },
-+	{ TS_CRYPTO_OPCODE_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT, get_uefi_priv_a=
uth_var_fingerprint_handler },
- };
-=20
- struct rpc_service_interface *
-@@ -664,33 +669,44 @@ static rpc_status_t verify_pkcs7_signature_handler=
(void *context, struct rpc_req
- 	}
-=20
- 	if (rpc_status =3D=3D RPC_SUCCESS) {
--		/* Parse the public key certificate */
--		mbedtls_x509_crt signer_certificate;
-+		/* Parse the PKCS#7 DER encoded signature block */
-+		mbedtls_pkcs7 pkcs7_structure;
-=20
--		mbedtls_x509_crt_init(&signer_certificate);
-+		mbedtls_pkcs7_init(&pkcs7_structure);
-=20
--		mbedtls_status =3D mbedtls_x509_crt_parse_der(&signer_certificate, pu=
blic_key_cert,
--							    public_key_cert_len);
-+		mbedtls_status =3D mbedtls_pkcs7_parse_der(&pkcs7_structure, signatur=
e_cert,
-+								signature_cert_len);
-=20
--		if (mbedtls_status =3D=3D 0) {
--			/* Parse the PKCS#7 DER encoded signature block */
--			mbedtls_pkcs7 pkcs7_structure;
-+		if (mbedtls_status =3D=3D MBEDTLS_PKCS7_SIGNED_DATA) {
-=20
--			mbedtls_pkcs7_init(&pkcs7_structure);
-+			/*
-+			 * If a separate public key is provided, verify the signature with i=
t,
-+			 * else use the key from the pkcs7 signature structure, because it i=
s
-+			 * a self-signed certificate.
-+			 */
-+			if(public_key_cert_len) {
-+				/* Parse the public key certificate */
-+				mbedtls_x509_crt signer_certificate;
-=20
--			mbedtls_status =3D mbedtls_pkcs7_parse_der(&pkcs7_structure, signatu=
re_cert,
--								 signature_cert_len);
-+				mbedtls_x509_crt_init(&signer_certificate);
-=20
--			if (mbedtls_status =3D=3D MBEDTLS_PKCS7_SIGNED_DATA) {
--				/* Verify hash against signed hash */
-+				mbedtls_status =3D mbedtls_x509_crt_parse_der(&signer_certificate, =
public_key_cert,
-+									public_key_cert_len);
-+
-+				if (mbedtls_status =3D=3D 0) {
-+					/* Verify hash against signed hash */
-+					mbedtls_status =3D mbedtls_pkcs7_signed_hash_verify(
-+						&pkcs7_structure, &signer_certificate, hash, hash_len);
-+				}
-+
-+				mbedtls_x509_crt_free(&signer_certificate);
-+			} else {
- 				mbedtls_status =3D mbedtls_pkcs7_signed_hash_verify(
--					&pkcs7_structure, &signer_certificate, hash, hash_len);
-+					&pkcs7_structure, &pkcs7_structure.private_signed_data.private_cer=
ts, hash, hash_len);
- 			}
--
--			mbedtls_pkcs7_free(&pkcs7_structure);
- 		}
-=20
--		mbedtls_x509_crt_free(&signer_certificate);
-+		mbedtls_pkcs7_free(&pkcs7_structure);
- 	}
-=20
- 	free(signature_cert);
-@@ -702,6 +718,128 @@ static rpc_status_t verify_pkcs7_signature_handler=
(void *context, struct rpc_req
-=20
- 	return rpc_status;
- }
-+
-+/*
-+ * Official value: http://www.oid-info.com/get/2.5.4.3
-+ * Hex converter: https://misc.daniel-marschall.de/asn.1/oid-converter/=
online.php
-+ */
-+static const mbedtls_asn1_buf* findCommonName(const mbedtls_x509_name *=
name)
-+{
-+	uint8_t CN_oid_tag =3D 0x06;
-+	uint8_t CN_oid_len =3D 0x03;
-+	uint8_t CN_oid_val[3] =3D {0x55, 0x04, 0x03};
-+
-+	while (name)
-+	{
-+		if (name->oid.tag =3D=3D CN_oid_tag && name->oid.len =3D=3D CN_oid_le=
n) {
-+			if (name->oid.p !=3D NULL) {
-+				if (!memcmp(name->oid.p, CN_oid_val, CN_oid_len))
-+					return &name->val;
-+			}
-+		}
-+
-+		name =3D name->next;
-+	}
-+
-+	return NULL;
-+}
-+
-+static rpc_status_t get_uefi_priv_auth_var_fingerprint_handler(void *co=
ntext, struct rpc_request *req)
-+{
-+	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
-+	struct rpc_buffer *req_buf =3D &req->request;
-+	const struct crypto_provider_serializer *serializer =3D get_crypto_ser=
ializer(context, req);
-+
-+	int mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+
-+	uint8_t *signature_cert =3D NULL;
-+	uint64_t signature_cert_len =3D 0;
-+
-+	if (serializer) {
-+		/* First collect the lengths of the field */
-+		rpc_status =3D serializer->deserialize_get_uefi_priv_auth_var_fingerp=
rint_req(
-+			req_buf, NULL, &signature_cert_len);
-+
-+		if (rpc_status =3D=3D RPC_SUCCESS) {
-+			/* Allocate the needed space and get the data */
-+			signature_cert =3D (uint8_t *)malloc(signature_cert_len);
-+
-+			if (signature_cert) {
-+				rpc_status =3D serializer->deserialize_get_uefi_priv_auth_var_finge=
rprint_req(
-+					req_buf, signature_cert, &signature_cert_len);
-+			} else {
-+				rpc_status =3D RPC_ERROR_RESOURCE_FAILURE;
-+			}
-+		}
-+	}
-+
-+	if (rpc_status =3D=3D RPC_SUCCESS) {
-+		/* Parse the PKCS#7 DER encoded signature block */
-+		mbedtls_pkcs7 pkcs7_structure;
-+
-+		mbedtls_pkcs7_init(&pkcs7_structure);
-+
-+		mbedtls_status =3D mbedtls_pkcs7_parse_der(&pkcs7_structure, signatur=
e_cert,
-+								signature_cert_len);
-+
-+		if (mbedtls_status =3D=3D MBEDTLS_PKCS7_SIGNED_DATA) {
-+
-+			uint8_t output_buffer[PSA_HASH_MAX_SIZE] =3D  { 0 };
-+			size_t __maybe_unused output_size =3D 0;
-+			const mbedtls_asn1_buf *signerCertCN =3D NULL;
-+			const mbedtls_x509_crt *topLevelCert =3D &pkcs7_structure.private_si=
gned_data.private_certs;
-+			const mbedtls_x509_buf *toplevelCertTbs =3D NULL;
-+			struct rpc_buffer *resp_buf =3D &req->response;;
-+			psa_hash_operation_t op =3D PSA_HASH_OPERATION_INIT;
-+
-+			/* Find common name field of the signing certificate, which is the f=
irst in the chain */
-+			signerCertCN =3D findCommonName(&topLevelCert->subject);
-+			if (!signerCertCN)
-+				mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+
-+			/* Get the TopLevel certificate which is the last in the chain */
-+			while(topLevelCert->next)
-+				topLevelCert =3D topLevelCert->next;
-+			toplevelCertTbs =3D &topLevelCert->tbs;
-+
-+			/* Hash the data to create the fingerprint */
-+			op =3D psa_hash_operation_init();
-+
-+			if (psa_hash_setup(&op, PSA_ALG_SHA_256) !=3D PSA_SUCCESS)
-+				mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+
-+			if (psa_hash_update(&op, signerCertCN->p, signerCertCN->len)) {
-+				psa_hash_abort(&op);
-+				mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+			}
-+
-+			if (psa_hash_update(&op, toplevelCertTbs->p, toplevelCertTbs->len)) =
{
-+				psa_hash_abort(&op);
-+				mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+			}
-+
-+			if (psa_hash_finish(&op, (uint8_t*)&output_buffer, PSA_HASH_MAX_SIZE=
, &output_size)) {
-+				psa_hash_abort(&op);
-+				mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+			}
-+
-+			/* Clear the remaining part of the buffer for consistency */
-+			memset(&output_buffer[output_size], 0, PSA_HASH_MAX_SIZE - output_si=
ze);
-+
-+			rpc_status =3D serializer->serialize_get_uefi_priv_auth_var_fingerpr=
int_resp(
-+				resp_buf, (uint8_t*)&output_buffer);
-+		}
-+
-+		mbedtls_pkcs7_free(&pkcs7_structure);
-+	}
-+
-+	free(signature_cert);
-+
-+	/* Provide the result of the verification */
-+	req->service_status =3D (mbedtls_status =3D=3D MBEDTLS_PKCS7_SIGNED_DA=
TA) ? EFI_SUCCESS : EFI_COMPROMISED_DATA;
-+
-+	return rpc_status;
-+}
- #else
- static rpc_status_t verify_pkcs7_signature_handler(void *context, struc=
t rpc_request *req)
- {
-@@ -710,4 +848,12 @@ static rpc_status_t verify_pkcs7_signature_handler(=
void *context, struct rpc_req
-=20
- 	return RPC_ERROR_INTERNAL;
- }
-+
-+static rpc_status_t get_uefi_priv_auth_var_fingerprint_handler(void *co=
ntext, struct rpc_request *req)
-+{
-+	(void)context;
-+	(void)req;
-+
-+	return RPC_ERROR_INTERNAL;
-+}
- #endif
-diff --git a/components/service/crypto/provider/serializer/crypto_provid=
er_serializer.h b/components/service/crypto/provider/serializer/crypto_pr=
ovider_serializer.h
-index bd5336c3d..2b965afdb 100644
---- a/components/service/crypto/provider/serializer/crypto_provider_seri=
alizer.h
-+++ b/components/service/crypto/provider/serializer/crypto_provider_seri=
alizer.h
-@@ -126,6 +126,14 @@ struct crypto_provider_serializer {
- 							       uint8_t *hash, uint64_t *hash_len,
- 							       uint8_t *public_key_cert,
- 							       uint64_t *public_key_cert_len);
-+
-+	/* Operation: get_uefi_priv_auth_var_fingerprintentifier */
-+	rpc_status_t (*deserialize_get_uefi_priv_auth_var_fingerprint_req)(con=
st struct rpc_buffer *req_buf,
-+								uint8_t *signed_data,
-+								uint64_t *signed_data_len);
-+
-+	rpc_status_t (*serialize_get_uefi_priv_auth_var_fingerprint_resp)(stru=
ct rpc_buffer *resp_buf,
-+							       const uint8_t *output);
- };
-=20
- #endif /* CRYPTO_PROVIDER_SERIALIZER_H */
-diff --git a/components/service/crypto/provider/serializer/packed-c/pack=
edc_crypto_provider_serializer.c b/components/service/crypto/provider/ser=
ializer/packed-c/packedc_crypto_provider_serializer.c
-index 050ef2f7d..89e07e2c8 100644
---- a/components/service/crypto/provider/serializer/packed-c/packedc_cry=
pto_provider_serializer.c
-+++ b/components/service/crypto/provider/serializer/packed-c/packedc_cry=
pto_provider_serializer.c
-@@ -22,6 +22,7 @@
- #include <protocols/service/crypto/packed-c/sign_hash.h>
- #include <protocols/service/crypto/packed-c/verify_hash.h>
- #include <protocols/service/crypto/packed-c/verify_pkcs7_signature.h>
-+#include <protocols/service/crypto/packed-c/get_uefi_priv_auth_var_fing=
erprint.h>
- #include <service/crypto/backend/crypto_backend.h>
- #include <stdlib.h>
- #include <string.h>
-@@ -675,6 +676,57 @@ static rpc_status_t deserialize_verify_pkcs7_signat=
ure_req(
- 	return rpc_status;
- }
-=20
-+/* Operation: get_uefi_priv_auth_var_fingerprintentifier */
-+static rpc_status_t deserialize_get_uefi_priv_auth_var_fingerprint_req(=
const struct rpc_buffer *req_buf,
-+							uint8_t *signed_data,
-+							uint64_t *signed_data_len)
-+{
-+	rpc_status_t rpc_status =3D RPC_ERROR_INVALID_REQUEST_BODY;
-+
-+	if (req_buf->data_length) {
-+		struct tlv_const_iterator req_iter;
-+		struct tlv_record decoded_record;
-+
-+		rpc_status =3D RPC_SUCCESS;
-+
-+		tlv_const_iterator_begin(&req_iter, (uint8_t *)req_buf->data, req_buf=
->data_length);
-+
-+		if (tlv_find_decode(&req_iter, TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGE=
RPRINT_IN_TAG_SIGNATURE,
-+				    &decoded_record)) {
-+			*signed_data_len =3D decoded_record.length;
-+
-+			if (signed_data)
-+				memcpy(signed_data, decoded_record.value, decoded_record.length);
-+		} else {
-+			/* Default to a zero length */
-+			*signed_data_len =3D 0;
-+		}
-+	}
-+
-+	return rpc_status;
-+}
-+
-+static rpc_status_t serialize_get_uefi_priv_auth_var_fingerprint_resp(s=
truct rpc_buffer *resp_buf,
-+							const uint8_t *output)
-+{
-+	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
-+	struct tlv_iterator resp_iter;
-+	struct tlv_record out_record;
-+
-+	out_record.tag =3D TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_OUT_TA=
G_IDENTIFIER;
-+	out_record.length =3D PSA_HASH_MAX_SIZE;
-+	out_record.value =3D output;
-+
-+	tlv_iterator_begin(&resp_iter, resp_buf->data, resp_buf->size);
-+
-+	if (tlv_encode(&resp_iter, &out_record)) {
-+		resp_buf->data_length =3D tlv_required_space(PSA_HASH_MAX_SIZE);
-+		rpc_status =3D RPC_SUCCESS;
-+	}
-+
-+	return rpc_status;
-+}
-+
- /* Singleton method to provide access to the serializer instance */
- const struct crypto_provider_serializer *packedc_crypto_provider_serial=
izer_instance(void)
- {
-@@ -704,6 +756,8 @@ const struct crypto_provider_serializer *packedc_cry=
pto_provider_serializer_inst
- 		deserialize_generate_random_req,
- 		serialize_generate_random_resp,
- 		deserialize_verify_pkcs7_signature_req,
-+		deserialize_get_uefi_priv_auth_var_fingerprint_req,
-+		serialize_get_uefi_priv_auth_var_fingerprint_resp
- 	};
-=20
- 	return &instance;
-diff --git a/components/service/uefi/smm_variable/backend/direct/uefi_di=
rect_backend.c b/components/service/uefi/smm_variable/backend/direct/uefi=
_direct_backend.c
-index bf978c5dd..c7ca07254 100644
---- a/components/service/uefi/smm_variable/backend/direct/uefi_direct_ba=
ckend.c
-+++ b/components/service/uefi/smm_variable/backend/direct/uefi_direct_ba=
ckend.c
-@@ -9,6 +9,8 @@
- #include <mbedtls/pkcs7.h>
- #include <mbedtls/x509_crt.h>
- #include <stdint.h>
-+#include <string.h>
-+#include <compiler.h>
-=20
- int verify_pkcs7_signature(const uint8_t *signature_cert, uint64_t sign=
ature_cert_len,
- 			   const uint8_t *hash, uint64_t hash_len, const uint8_t *public_key=
_cert,
-@@ -46,3 +48,91 @@ int verify_pkcs7_signature(const uint8_t *signature_c=
ert, uint64_t signature_cer
-=20
- 	return mbedtls_status;
- }
-+
-+/*
-+ * Official value: http://www.oid-info.com/get/2.5.4.3
-+ * Hex converter: https://misc.daniel-marschall.de/asn.1/oid-converter/=
online.php
-+ */
-+static const mbedtls_asn1_buf* findCommonName(const mbedtls_x509_name *=
name)
-+{
-+	uint8_t CN_oid_tag =3D 0x06;
-+	uint8_t CN_oid_len =3D 0x03;
-+	uint8_t CN_oid_val[3] =3D {0x55, 0x04, 0x03};
-+
-+	while (name)
-+	{
-+		if (name->oid.tag =3D=3D CN_oid_tag && name->oid.len =3D=3D CN_oid_le=
n) {
-+			if (name->oid.p !=3D NULL) {
-+				if (!memcmp(name->oid.p, CN_oid_val, CN_oid_len))
-+					return &name->val;
-+			}
-+		}
-+
-+		name =3D name->next;
-+	}
-+
-+	return NULL;
-+}
-+
-+int get_uefi_priv_auth_var_fingerprint_handler(const uint8_t *signature=
_cert,
-+				    uint64_t signature_cert_len,
-+				    uint8_t *output)
-+{
-+	int mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+
-+	/* Parse the PKCS#7 DER encoded signature block */
-+	mbedtls_pkcs7 pkcs7_structure;
-+
-+	mbedtls_pkcs7_init(&pkcs7_structure);
-+
-+	mbedtls_status =3D mbedtls_pkcs7_parse_der(&pkcs7_structure, signature=
_cert,
-+							signature_cert_len);
-+
-+	if (mbedtls_status =3D=3D MBEDTLS_PKCS7_SIGNED_DATA) {
-+
-+		uint8_t output_buffer[PSA_HASH_MAX_SIZE] =3D  { 0 };
-+		size_t __maybe_unused output_size =3D 0;
-+		const mbedtls_asn1_buf *signerCertCN =3D NULL;
-+		const mbedtls_x509_crt *topLevelCert =3D &pkcs7_structure.private_sig=
ned_data.private_certs;
-+		const mbedtls_x509_buf *toplevelCertTbs =3D NULL;
-+		psa_hash_operation_t op =3D PSA_HASH_OPERATION_INIT;
-+
-+		/* Find common name field of the signing certificate, which is the fi=
rst in the chain */
-+		signerCertCN =3D findCommonName(&topLevelCert->subject);
-+		if (!signerCertCN)
-+			mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+
-+		/* Get the TopLevel certificate which is the last in the chain */
-+		while(topLevelCert->next)
-+			topLevelCert =3D topLevelCert->next;
-+		toplevelCertTbs =3D &topLevelCert->tbs;
-+
-+		/* Hash the data to create the fingerprint */
-+		op =3D psa_hash_operation_init();
-+
-+		if (psa_hash_setup(&op, PSA_ALG_SHA_256) !=3D PSA_SUCCESS)
-+			mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+
-+		if (psa_hash_update(&op, signerCertCN->p, signerCertCN->len)) {
-+			psa_hash_abort(&op);
-+			mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+		}
-+
-+		if (psa_hash_update(&op, toplevelCertTbs->p, toplevelCertTbs->len)) {
-+			psa_hash_abort(&op);
-+			mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+		}
-+
-+		if (psa_hash_finish(&op, (uint8_t*)&output_buffer, PSA_HASH_MAX_SIZE,=
 &output_size)) {
-+			psa_hash_abort(&op);
-+			mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
-+		}
-+
-+		/* Clear the remaining part of the buffer for consistency */
-+		memset(&output_buffer[output_size], 0, PSA_HASH_MAX_SIZE - output_siz=
e);
-+	}
-+
-+	mbedtls_pkcs7_free(&pkcs7_structure);
-+
-+	return mbedtls_status;
-+}
-diff --git a/deployments/smm-gateway/smm-gateway.cmake b/deployments/smm=
-gateway/smm-gateway.cmake
-index e5ee03b60..de519892d 100644
---- a/deployments/smm-gateway/smm-gateway.cmake
-+++ b/deployments/smm-gateway/smm-gateway.cmake
-@@ -17,6 +17,11 @@ include(${TS_ROOT}/external/MbedTLS/MbedTLS.cmake)
- target_link_libraries(smm-gateway PRIVATE MbedTLS::mbedcrypto)
- target_link_libraries(smm-gateway PRIVATE MbedTLS::mbedx509)
-=20
-+# Pass the location of the mbedtls config file to C preprocessor.
-+target_compile_definitions(smm-gateway PRIVATE
-+		MBEDTLS_USER_CONFIG_FILE=3D"${MBEDTLS_USER_CONFIG_FILE}"
-+)
-+
- target_compile_definitions(smm-gateway PRIVATE
- 	-DUEFI_INTERNAL_CRYPTO
- )
-diff --git a/protocols/service/crypto/packed-c/get_uefi_priv_auth_var_fi=
ngerprint.h b/protocols/service/crypto/packed-c/get_uefi_priv_auth_var_fi=
ngerprint.h
-new file mode 100644
-index 000000000..29964b33c
---- /dev/null
-+++ b/protocols/service/crypto/packed-c/get_uefi_priv_auth_var_fingerpri=
nt.h
-@@ -0,0 +1,21 @@
-+/*
-+ * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H
-+#define TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H
-+
-+#include <stdint.h>
-+
-+/* Variable length output parameter tags */
-+enum {
-+	TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_OUT_TAG_IDENTIFIER =3D 1,
-+};
-+
-+/* Variable length input parameter tags */
-+enum {
-+	TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_IN_TAG_SIGNATURE =3D 1,
-+};
-+
-+#endif /* TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H */
-diff --git a/protocols/service/crypto/packed-c/opcodes.h b/protocols/ser=
vice/crypto/packed-c/opcodes.h
-index 35b81599b..8bc2b49b0 100644
---- a/protocols/service/crypto/packed-c/opcodes.h
-+++ b/protocols/service/crypto/packed-c/opcodes.h
-@@ -28,6 +28,7 @@
- #define TS_CRYPTO_OPCODE_SIGN_MESSAGE           (TS_CRYPTO_OPCODE_BASE =
+ 16)
- #define TS_CRYPTO_OPCODE_VERIFY_MESSAGE         (TS_CRYPTO_OPCODE_BASE =
+ 17)
- #define TS_CRYPTO_OPCODE_VERIFY_PKCS7_SIGNATURE (TS_CRYPTO_OPCODE_BASE =
+ 18)
-+#define TS_CRYPTO_OPCODE_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT (TS_CRYPTO_=
OPCODE_BASE + 19)
-=20
- /* Hash operations */
- #define TS_CRYPTO_OPCODE_HASH_BASE              (0x0200)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0015-Add-timestamp-validation-for-uefi-variables.patch b/meta-arm-bsp/rec=
ipes-security/trusted-services/corstone1000/0015-Add-timestamp-validation=
-for-uefi-variables.patch
deleted file mode 100644
index 26e7df5f..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Ad=
d-timestamp-validation-for-uefi-variables.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From 5b418e141aadcb6604406f75e156317bd143d898 Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Fri, 5 Apr 2024 11:27:15 +0200
-Subject: [PATCH 1/3] Add timestamp validation for uefi variables
-
-Return failure if uefi variable creation or update is not
-requested with newer timestamp.
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27955]
----
- .../backend/uefi_variable_store.c             | 35 +++++++++++++++----
- .../smm_variable/backend/variable_index.c     |  1 +
- .../smm_variable/backend/variable_index.h     |  1 +
- 3 files changed, 30 insertions(+), 7 deletions(-)
-
-diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
-index c1691dc8f..1b624f0c9 100644
---- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-@@ -76,6 +76,7 @@ static efi_status_t verify_var_by_key_var(const efi_da=
ta_map *new_var,
- 					  const uint8_t *hash_buffer, size_t hash_len);
-=20
- static efi_status_t authenticate_variable(const struct uefi_variable_st=
ore *context,
-+					  EFI_TIME *timestamp,
- 					  SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var);
- #endif
-=20
-@@ -197,6 +198,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
- 					      const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
- {
- 	bool should_sync_index =3D false;
-+	EFI_TIME timestamp =3D { 0 };
-=20
- 	/* Validate incoming request */
- 	efi_status_t status =3D check_name_terminator(var->Name, var->NameSize=
);
-@@ -225,6 +227,9 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
- 			return EFI_OUT_OF_RESOURCES;
- 	}
-=20
-+	/* Save the timestamp into a buffer, which can be overwritten by the a=
uthentication function */
-+	memcpy(&timestamp, &info->metadata.timestamp, sizeof(EFI_TIME));
-+
- 	/* Control access */
- 	status =3D check_access_permitted_on_set(context, info, var);
-=20
-@@ -240,7 +245,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
- 			if (info->metadata.attributes &
- 			    EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS) {
- 				status =3D authenticate_variable(
--					context, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)var);
-+					context, &timestamp, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)v=
ar);
-=20
- 				if (status !=3D EFI_SUCCESS)
- 					return status;
-@@ -326,7 +331,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
- 			 */
- 			if (var->Attributes & EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_AC=
CESS) {
- 				status =3D authenticate_variable(
--					context, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)var);
-+					context, &timestamp, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)v=
ar);
-=20
- 				if (status !=3D EFI_SUCCESS)
- 					return status;
-@@ -358,9 +363,11 @@ efi_status_t uefi_variable_store_set_variable(const=
 struct uefi_variable_store *
- 		if (should_sync_index)
- 			status =3D sync_variable_index(context);
-=20
--		/* Store any variable data to the storage backend */
--		if (info->is_variable_set && (status =3D=3D EFI_SUCCESS))
-+		/* Store any variable data to the storage backend with the updated me=
tadata */
-+		if (info->is_variable_set && (status =3D=3D EFI_SUCCESS)) {
-+			memcpy(&info->metadata.timestamp, &timestamp, sizeof(EFI_TIME));
- 			status =3D store_variable_data(context, info, var);
-+		}
- 	}
-=20
- 	variable_index_remove_unused_entry(&context->variable_index, info);
-@@ -1106,6 +1113,7 @@ static efi_status_t verify_var_by_key_var(const ef=
i_data_map *new_var,
-  * then verifies it.
-  */
- static efi_status_t authenticate_variable(const struct uefi_variable_st=
ore *context,
-+					  EFI_TIME *timestamp,
- 					  SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
- {
- 	efi_status_t status =3D EFI_SUCCESS;
-@@ -1223,9 +1231,7 @@ static efi_status_t authenticate_variable(const st=
ruct uefi_variable_store *cont
- 	 *
- 	 * UEFI: Page 253
- 	 * 2. Verify that Pad1, Nanosecond, TimeZone, Daylight and Pad2 compon=
ents
--	 * of the TimeStamp value are set to zero. Unless the EFI_VARIABLE_APP=
END_WRITE
--	 * attribute is set, verify that the TimeStamp value is later than the=
 current
--	 * timestamp value associated with the variable
-+	 * of the TimeStamp value are set to zero.
- 	 */
- 	if ((var_map.efi_auth_descriptor->TimeStamp.Pad1 !=3D 0) ||
- 	    (var_map.efi_auth_descriptor->TimeStamp.Pad2 !=3D 0) ||
-@@ -1235,6 +1241,21 @@ static efi_status_t authenticate_variable(const s=
truct uefi_variable_store *cont
- 		return EFI_SECURITY_VIOLATION;
- 	}
-=20
-+	/**
-+	 * UEFI: Page 253
-+	 * Unless the EFI_VARIABLE_APPEND_WRITE attribute is set, verify
-+	 * that the TimeStamp value is later than the current
-+	 * timestamp value associated with the variable
-+	 */
-+	if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
-+		if (memcmp(&var_map.efi_auth_descriptor->TimeStamp, timestamp, sizeof=
(EFI_GUID)) <=3D 0) {
-+			EMSG("Timestamp violation");
-+			return EFI_SECURITY_VIOLATION;
-+		}
-+
-+		/* Save new timestamp */
-+		memcpy(timestamp, &var_map.efi_auth_descriptor->TimeStamp, sizeof(EFI=
_TIME));
-+	}
- 	/* Calculate hash for the variable only once */
- 	hash_result =3D calc_variable_hash(&var_map, (uint8_t *)&hash_buffer, =
sizeof(hash_buffer),
- 					 &hash_len);
-diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.c b/components/service/uefi/smm_variable/backend/variable_index.c
-index e2fe6dd38..f4194d2d3 100644
---- a/components/service/uefi/smm_variable/backend/variable_index.c
-+++ b/components/service/uefi/smm_variable/backend/variable_index.c
-@@ -198,6 +198,7 @@ static struct variable_entry *add_entry(const struct=
 variable_index *context, co
- 			/* Initialize metadata */
- 			info->metadata.uid =3D generate_uid(context, guid, name_size, name);
- 			info->metadata.guid =3D *guid;
-+			memset(&info->metadata.timestamp, 0, sizeof(EFI_TIME));
- 			info->metadata.attributes =3D 0;
- 			info->metadata.name_size =3D name_size;
- 			memcpy(info->metadata.name, name, name_size);
-diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.h b/components/service/uefi/smm_variable/backend/variable_index.h
-index 5d3b7a7c6..7eef7b86b 100644
---- a/components/service/uefi/smm_variable/backend/variable_index.h
-+++ b/components/service/uefi/smm_variable/backend/variable_index.h
-@@ -32,6 +32,7 @@ extern "C" {
-  */
- struct variable_metadata {
- 	EFI_GUID guid;
-+	EFI_TIME timestamp;
- 	size_t name_size;
- 	int16_t name[VARIABLE_INDEX_MAX_NAME_SIZE];
- 	uint32_t attributes;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0020-se-proxy-protobuf-change.patch b/meta-arm-bsp/recipes-security/trust=
ed-services/corstone1000/0015-se-proxy-protobuf-change.patch
similarity index 81%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
020-se-proxy-protobuf-change.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/001=
5-se-proxy-protobuf-change.patch
index cfe0e693..11896556 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0020-se=
-proxy-protobuf-change.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-se=
-proxy-protobuf-change.patch
@@ -1,6 +1,6 @@
-From e5a4487e2b757d0063148691c7d06ae1c7e15b9a Mon Sep 17 00:00:00 2001
+From dd9a51bde0608989e01de5369eaa0eef2bab7c43 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Tue, 18 Jun 2024 11:52:43 +0100
+Date: Wed, 22 Jan 2025 00:54:30 +0000
 Subject: [PATCH] protobuf fix
=20
 Upstream-Status: Pending (not yet submitted to upstream)
@@ -10,7 +10,7 @@ Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
  1 file changed, 24 insertions(+), 1 deletion(-)
=20
 diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
-index a0eb03b6f..e2774c135 100644
+index 88e4cf17e..7da489ca8 100644
 --- a/deployments/se-proxy/env/commonsp/se_proxy_sp.c
 +++ b/deployments/se-proxy/env/commonsp/se_proxy_sp.c
 @@ -13,6 +13,7 @@
@@ -25,12 +25,12 @@ index a0eb03b6f..e2774c135 100644
  		goto fatal_error;
  	}
 =20
--	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 5, 16);
-+	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 6, 16);
+-	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 6, 16);
++	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 7, 16);
  	if (rpc_status !=3D RPC_SUCCESS) {
  		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
  		goto fatal_error;
-@@ -129,6 +130,28 @@ void __noreturn sp_main(union ffa_boot_info *boot_i=
nfo)
+@@ -118,6 +119,28 @@ void __noreturn sp_main(union ffa_boot_info *boot_i=
nfo)
  		goto fatal_error;
  	}
 =20
@@ -56,10 +56,9 @@ index a0eb03b6f..e2774c135 100644
 +		goto fatal_error;
 +	}
 +
-	while (1) {
-		ts_rpc_endpoint_sp_receive(&rpc_endpoint, &req_msg, &resp_msg);
-
+ 	/* End of boot phase */
+ 	result =3D sp_msg_wait(&req_msg);
+ 	if (result !=3D SP_RESULT_OK) {
 --=20
-2.25.1
-
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0016-Isolate-common-uefi-variable-authentication-steps.patch b/meta-arm-b=
sp/recipes-security/trusted-services/corstone1000/0016-Isolate-common-uef=
i-variable-authentication-steps.patch
deleted file mode 100644
index 16ca63b3..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Is=
olate-common-uefi-variable-authentication-steps.patch
+++ /dev/null
@@ -1,282 +0,0 @@
-From 19e79008e0fa3193b54bf6499516dc75cb10f6ec Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Thu, 11 Apr 2024 13:42:03 +0200
-Subject: [PATCH 2/3] Isolate common uefi variable authentication steps
-
-Currently all auth variables are authenticated with the secure boot
-keys. To introduce corrent check for Private Authenticated Variables
-first separate the common steps from the secure boot related steps.
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27956]
----
- .../backend/uefi_variable_store.c             | 191 ++++++++++--------
- 1 file changed, 103 insertions(+), 88 deletions(-)
-
-diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
-index 1b624f0c9..1384d0def 100644
---- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-@@ -78,6 +78,12 @@ static efi_status_t verify_var_by_key_var(const efi_d=
ata_map *new_var,
- static efi_status_t authenticate_variable(const struct uefi_variable_st=
ore *context,
- 					  EFI_TIME *timestamp,
- 					  SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var);
-+
-+static efi_status_t authenticate_secure_boot_variable(const struct uefi=
_variable_store *context,
-+						      efi_data_map* var_map,
-+						      uint8_t* hash_buffer,
-+						      size_t hash_len,
-+						      uint64_t max_variable_size);
- #endif
-=20
- static efi_status_t store_variable_data(const struct uefi_variable_stor=
e *context,
-@@ -1118,30 +1124,109 @@ static efi_status_t authenticate_variable(const=
 struct uefi_variable_store *cont
- {
- 	efi_status_t status =3D EFI_SUCCESS;
- 	EFI_GUID pkcs7_guid =3D EFI_CERT_TYPE_PKCS7_GUID;
--	EFI_GUID global_variable_guid =3D EFI_GLOBAL_VARIABLE;
--	EFI_GUID security_database_guid =3D EFI_IMAGE_SECURITY_DATABASE_GUID;
- 	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO variable_info =3D { 0, 0,=
 0, 0 };
--	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *pk_variable =3D NULL;
--	size_t pk_payload_size =3D 0;
- 	efi_data_map var_map =3D { NULL, NULL, NULL, 0, 0, NULL, 0, NULL };
- 	uint8_t hash_buffer[PSA_HASH_MAX_SIZE];
- 	size_t hash_len =3D 0;
--	bool hash_result =3D false;
-=20
- 	/* Create a map of the fields of the new variable including the auth h=
eader */
- 	if (!init_efi_data_map(var, true, &var_map))
- 		return EFI_SECURITY_VIOLATION;
-=20
--	/* database variables can be verified by either PK or KEK while images
--	 * should be checked by db and dbx so the length of two will be enough=
.
--	 */
--	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *allowed_key_store_variables[=
] =3D { NULL, NULL };
--
- 	/* Find the maximal size of variables for the GetVariable operation */
- 	status =3D uefi_variable_store_query_variable_info(context, &variable_=
info);
- 	if (status !=3D EFI_SUCCESS)
- 		return EFI_SECURITY_VIOLATION;
-=20
-+	/**
-+	 * UEFI: Page 246
-+	 * If the EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS attribute=
 is set in a
-+	 * SetVariable() call, and firmware does not support signature type of=
 the certificate
-+	 * included in the EFI_VARIABLE_AUTHENTICATION_2 descriptor, then the =
SetVariable() call
-+	 * shall return EFI_INVALID_PARAMETER. The list of signature types sup=
ported by the
-+	 * firmware is defined by the SignatureSupport variable. Signature typ=
e of the certificate
-+	 * is defined by its digest and encryption algorithms.
-+	 */
-+	/* TODO: Should support WIN_CERT_TYPE_PKCS_SIGNED_DATA and WIN_CERT_TY=
PE_EFI_PKCS115 */
-+	if (var_map.efi_auth_descriptor->AuthInfo.Hdr.wCertificateType !=3D WI=
N_CERT_TYPE_EFI_GUID)
-+		return EFI_INVALID_PARAMETER;
-+
-+	/* Only a CertType of EFI_CERT_TYPE_PKCS7_GUID is accepted */
-+	if (!compare_guid(&var_map.efi_auth_descriptor->AuthInfo.CertType, &pk=
cs7_guid))
-+		return EFI_SECURITY_VIOLATION;
-+
-+	/**
-+	 * Time associated with the authentication descriptor. For the TimeSta=
mp value,
-+	 * components Pad1, Nanosecond, TimeZone, Daylight and Pad2 shall be s=
et to 0.
-+	 * This means that the time shall always be expressed in GMT.
-+	 *
-+	 * UEFI: Page 253
-+	 * 2. Verify that Pad1, Nanosecond, TimeZone, Daylight and Pad2 compon=
ents
-+	 * of the TimeStamp value are set to zero.
-+	 */
-+	if ((var_map.efi_auth_descriptor->TimeStamp.Pad1 !=3D 0) ||
-+	    (var_map.efi_auth_descriptor->TimeStamp.Pad2 !=3D 0) ||
-+	    (var_map.efi_auth_descriptor->TimeStamp.Nanosecond !=3D 0) ||
-+	    (var_map.efi_auth_descriptor->TimeStamp.TimeZone !=3D 0) ||
-+	    (var_map.efi_auth_descriptor->TimeStamp.Daylight !=3D 0)) {
-+		return EFI_SECURITY_VIOLATION;
-+	}
-+
-+	/**
-+	 * UEFI: Page 253
-+	 * Unless the EFI_VARIABLE_APPEND_WRITE attribute is set, verify
-+	 * that the TimeStamp value is later than the current
-+	 * timestamp value associated with the variable
-+	 */
-+	if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
-+		if (memcmp(&var_map.efi_auth_descriptor->TimeStamp, timestamp, sizeof=
(EFI_GUID)) <=3D 0) {
-+			EMSG("Timestamp violation");
-+			return EFI_SECURITY_VIOLATION;
-+		}
-+
-+		/* Save new timestamp */
-+		memcpy(timestamp, &var_map.efi_auth_descriptor->TimeStamp, sizeof(EFI=
_TIME));
-+	}
-+	/* Calculate hash for the variable only once */
-+	if (calc_variable_hash(&var_map, (uint8_t *)&hash_buffer, sizeof(hash_=
buffer), &hash_len) =3D=3D 0) {
-+		status =3D EFI_SECURITY_VIOLATION;
-+	}
-+
-+	/* Run Secure Boot related authentication steps */
-+	status =3D authenticate_secure_boot_variable(context, &var_map, (uint8=
_t*) &hash_buffer, hash_len, variable_info.MaximumVariableSize);
-+
-+	/* Remove the authentication header from the variable if the authentic=
ation is successful */
-+	if (status =3D=3D EFI_SUCCESS) {
-+		uint8_t *smm_payload =3D
-+			(uint8_t *)var + SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSE=
T(var);
-+
-+		memmove(smm_payload, var_map.payload, var_map.payload_len);
-+		memset((uint8_t *)smm_payload + var_map.payload_len, 0,
-+		       var_map.efi_auth_descriptor_len);
-+
-+		var->DataSize -=3D var_map.efi_auth_descriptor_len;
-+	}
-+
-+	return status;
-+}
-+
-+static efi_status_t authenticate_secure_boot_variable(const struct uefi=
_variable_store *context,
-+						      efi_data_map* var_map,
-+						      uint8_t* hash_buffer,
-+						      size_t hash_len,
-+						      uint64_t max_variable_size)
-+{
-+	efi_status_t status =3D EFI_SUCCESS;
-+	EFI_GUID global_variable_guid =3D EFI_GLOBAL_VARIABLE;
-+	EFI_GUID security_database_guid =3D EFI_IMAGE_SECURITY_DATABASE_GUID;
-+	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *pk_variable =3D NULL;
-+	size_t pk_payload_size =3D 0;
-+
-+	/* database variables can be verified by either PK or KEK while images
-+	 * should be checked by db and dbx so the length of two will be enough=
.
-+	 */
-+	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *allowed_key_store_variables[=
] =3D { NULL, NULL };
-+
- 	/**
- 	 * UEFI: Page 253
- 	 * 3. If the variable SetupMode=3D=3D1, and the variable is a secure
-@@ -1166,14 +1251,14 @@ static efi_status_t authenticate_variable(const =
struct uefi_variable_store *cont
- 	 * Platform Key is checked to enable or disable authentication.
- 	 */
- 	create_smm_variable(&pk_variable, sizeof(EFI_PLATFORM_KEY_NAME),
--			    variable_info.MaximumVariableSize, (uint8_t *)EFI_PLATFORM_KEY_N=
AME,
-+			    max_variable_size, (uint8_t *)EFI_PLATFORM_KEY_NAME,
- 			    &global_variable_guid);
-=20
- 	if (!pk_variable)
- 		return EFI_OUT_OF_RESOURCES;
-=20
- 	status =3D uefi_variable_store_get_variable(
--		context, pk_variable, variable_info.MaximumVariableSize, &pk_payload_=
size);
-+		context, pk_variable, max_variable_size, &pk_payload_size);
-=20
- 	/* If PK does not exist authentication is disabled */
- 	if (status !=3D EFI_SUCCESS) {
-@@ -1207,66 +1292,8 @@ static efi_status_t authenticate_variable(const s=
truct uefi_variable_store *cont
- 		goto end;
- 	}
-=20
--	/**
--	 * UEFI: Page 246
--	 * If the EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS attribute=
 is set in a
--	 * SetVariable() call, and firmware does not support signature type of=
 the certificate
--	 * included in the EFI_VARIABLE_AUTHENTICATION_2 descriptor, then the =
SetVariable() call
--	 * shall return EFI_INVALID_PARAMETER. The list of signature types sup=
ported by the
--	 * firmware is defined by the SignatureSupport variable. Signature typ=
e of the certificate
--	 * is defined by its digest and encryption algorithms.
--	 */
--	/* TODO: Should support WIN_CERT_TYPE_PKCS_SIGNED_DATA and WIN_CERT_TY=
PE_EFI_PKCS115 */
--	if (var_map.efi_auth_descriptor->AuthInfo.Hdr.wCertificateType !=3D WI=
N_CERT_TYPE_EFI_GUID)
--		return EFI_INVALID_PARAMETER;
--
--	/* Only a CertType of EFI_CERT_TYPE_PKCS7_GUID is accepted */
--	if (!compare_guid(&var_map.efi_auth_descriptor->AuthInfo.CertType, &pk=
cs7_guid))
--		return EFI_SECURITY_VIOLATION;
--
--	/**
--	 * Time associated with the authentication descriptor. For the TimeSta=
mp value,
--	 * components Pad1, Nanosecond, TimeZone, Daylight and Pad2 shall be s=
et to 0.
--	 * This means that the time shall always be expressed in GMT.
--	 *
--	 * UEFI: Page 253
--	 * 2. Verify that Pad1, Nanosecond, TimeZone, Daylight and Pad2 compon=
ents
--	 * of the TimeStamp value are set to zero.
--	 */
--	if ((var_map.efi_auth_descriptor->TimeStamp.Pad1 !=3D 0) ||
--	    (var_map.efi_auth_descriptor->TimeStamp.Pad2 !=3D 0) ||
--	    (var_map.efi_auth_descriptor->TimeStamp.Nanosecond !=3D 0) ||
--	    (var_map.efi_auth_descriptor->TimeStamp.TimeZone !=3D 0) ||
--	    (var_map.efi_auth_descriptor->TimeStamp.Daylight !=3D 0)) {
--		return EFI_SECURITY_VIOLATION;
--	}
--
--	/**
--	 * UEFI: Page 253
--	 * Unless the EFI_VARIABLE_APPEND_WRITE attribute is set, verify
--	 * that the TimeStamp value is later than the current
--	 * timestamp value associated with the variable
--	 */
--	if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
--		if (memcmp(&var_map.efi_auth_descriptor->TimeStamp, timestamp, sizeof=
(EFI_GUID)) <=3D 0) {
--			EMSG("Timestamp violation");
--			return EFI_SECURITY_VIOLATION;
--		}
--
--		/* Save new timestamp */
--		memcpy(timestamp, &var_map.efi_auth_descriptor->TimeStamp, sizeof(EFI=
_TIME));
--	}
--	/* Calculate hash for the variable only once */
--	hash_result =3D calc_variable_hash(&var_map, (uint8_t *)&hash_buffer, =
sizeof(hash_buffer),
--					 &hash_len);
--
--	if (!hash_result) {
--		status =3D EFI_SECURITY_VIOLATION;
--		goto end;
--	}
--
--	status =3D select_verification_keys(var_map, global_variable_guid, sec=
urity_database_guid,
--					  variable_info.MaximumVariableSize,
-+	status =3D select_verification_keys(*var_map, global_variable_guid, se=
curity_database_guid,
-+					  max_variable_size,
- 					  &allowed_key_store_variables[0]);
-=20
- 	if (status !=3D EFI_SUCCESS)
-@@ -1280,8 +1307,8 @@ static efi_status_t authenticate_variable(const st=
ruct uefi_variable_store *cont
- 			continue;
-=20
- 		status =3D uefi_variable_store_get_variable(context, allowed_key_stor=
e_variables[i],
--							  variable_info.MaximumVariableSize,
--							  &actual_variable_length);
-+							max_variable_size,
-+							&actual_variable_length);
-=20
- 		if (status) {
- 			/* When the parent does not exist it is considered verification fail=
ure */
-@@ -1297,8 +1324,8 @@ static efi_status_t authenticate_variable(const st=
ruct uefi_variable_store *cont
- 			goto end;
- 		}
-=20
--		status =3D verify_var_by_key_var(&var_map, &allowed_key_store_var_map=
,
--					       (uint8_t *)&hash_buffer, hash_len);
-+		status =3D verify_var_by_key_var(var_map, &allowed_key_store_var_map,
-+					hash_buffer, hash_len);
-=20
- 		if (status =3D=3D EFI_SUCCESS)
- 			goto end;
-@@ -1311,18 +1338,6 @@ end:
- 			free(allowed_key_store_variables[i]);
- 	}
-=20
--	/* Remove the authentication header from the variable if the authentic=
ation is successful */
--	if (status =3D=3D EFI_SUCCESS) {
--		uint8_t *smm_payload =3D
--			(uint8_t *)var + SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSE=
T(var);
--
--		memmove(smm_payload, var_map.payload, var_map.payload_len);
--		memset((uint8_t *)smm_payload + var_map.payload_len, 0,
--		       var_map.efi_auth_descriptor_len);
--
--		var->DataSize -=3D var_map.efi_auth_descriptor_len;
--	}
--
- 	return status;
- }
- #endif
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0017-Implement-Private-Authenticated-Variable-verificatio.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0017-Implement-Priva=
te-Authenticated-Variable-verificatio.patch
deleted file mode 100644
index eb7852f0..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Im=
plement-Private-Authenticated-Variable-verificatio.patch
+++ /dev/null
@@ -1,292 +0,0 @@
-From a172c6e8269915db1b25e2749bae06dc0220cfb8 Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Thu, 11 Apr 2024 13:48:14 +0200
-Subject: [PATCH 3/3] Implement Private Authenticated Variable verificati=
on
-
-Refactor the implementation to only use the PK, KEK, DB authentication
-chain for boot variables, and implement the self authentication for
-private authenticated variables.
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27957]
----
- .../backend/uefi_variable_store.c             | 126 +++++++++++++++---
- .../smm_variable/backend/variable_index.c     |   1 +
- .../smm_variable/backend/variable_index.h     |   2 +
- .../config/default-opteesp/CMakeLists.txt     |   2 +-
- .../config/default-sp/CMakeLists.txt          |   2 +-
- 5 files changed, 112 insertions(+), 21 deletions(-)
-
-diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
-index 1384d0def..97c43dc74 100644
---- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
-@@ -75,15 +75,25 @@ static efi_status_t verify_var_by_key_var(const efi_=
data_map *new_var,
- 					  const efi_data_map *key_store_var,
- 					  const uint8_t *hash_buffer, size_t hash_len);
-=20
-+static bool isPrivateAuthVar(SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *=
var);
-+
- static efi_status_t authenticate_variable(const struct uefi_variable_st=
ore *context,
--					  EFI_TIME *timestamp,
--					  SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var);
-+					  EFI_TIME *timestamp, uint8_t (*fingerprint)[FINGERPRINT_SIZE],
-+					  bool new_variable, SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var=
);
-=20
- static efi_status_t authenticate_secure_boot_variable(const struct uefi=
_variable_store *context,
- 						      efi_data_map* var_map,
- 						      uint8_t* hash_buffer,
- 						      size_t hash_len,
- 						      uint64_t max_variable_size);
-+
-+static efi_status_t authenticate_private_variable(const struct uefi_var=
iable_store *context,
-+						  efi_data_map* var_map,
-+						  uint8_t* hash_buffer,
-+						  size_t hash_len,
-+						  uint64_t max_variable_size,
-+						  bool new_variable,
-+						  uint8_t (*fingerprint)[FINGERPRINT_SIZE]);
- #endif
-=20
- static efi_status_t store_variable_data(const struct uefi_variable_stor=
e *context,
-@@ -205,6 +215,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
- {
- 	bool should_sync_index =3D false;
- 	EFI_TIME timestamp =3D { 0 };
-+	uint8_t fingerprint[FINGERPRINT_SIZE] =3D { 0 };
-=20
- 	/* Validate incoming request */
- 	efi_status_t status =3D check_name_terminator(var->Name, var->NameSize=
);
-@@ -233,8 +244,9 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
- 			return EFI_OUT_OF_RESOURCES;
- 	}
-=20
--	/* Save the timestamp into a buffer, which can be overwritten by the a=
uthentication function */
-+	/* Save the timestamp and fingerprints into a buffer, which can be ove=
rwritten by the authentication function */
- 	memcpy(&timestamp, &info->metadata.timestamp, sizeof(EFI_TIME));
-+	memcpy(&fingerprint, &info->metadata.fingerprint, FINGERPRINT_SIZE);
-=20
- 	/* Control access */
- 	status =3D check_access_permitted_on_set(context, info, var);
-@@ -251,7 +263,8 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
- 			if (info->metadata.attributes &
- 			    EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS) {
- 				status =3D authenticate_variable(
--					context, &timestamp, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)v=
ar);
-+					context, &timestamp, &fingerprint, false,
-+					(SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)var);
-=20
- 				if (status !=3D EFI_SUCCESS)
- 					return status;
-@@ -337,7 +350,8 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
- 			 */
- 			if (var->Attributes & EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_AC=
CESS) {
- 				status =3D authenticate_variable(
--					context, &timestamp, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)v=
ar);
-+					context, &timestamp, &fingerprint, true,
-+					(SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)var);
-=20
- 				if (status !=3D EFI_SUCCESS)
- 					return status;
-@@ -372,6 +386,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
- 		/* Store any variable data to the storage backend with the updated me=
tadata */
- 		if (info->is_variable_set && (status =3D=3D EFI_SUCCESS)) {
- 			memcpy(&info->metadata.timestamp, &timestamp, sizeof(EFI_TIME));
-+			memcpy(&info->metadata.fingerprint, &fingerprint, FINGERPRINT_SIZE);
- 			status =3D store_variable_data(context, info, var);
- 		}
- 	}
-@@ -1030,15 +1045,6 @@ select_verification_keys(const efi_data_map new_v=
ar, EFI_GUID global_variable_gu
- 		create_smm_variable(&(allowed_key_store_variables[1]),
- 				    sizeof(EFI_KEY_EXCHANGE_KEY_NAME), maximum_variable_size,
- 				    (uint8_t *)EFI_KEY_EXCHANGE_KEY_NAME, &global_variable_guid);
--	} else {
--		/*
--		 * Any other variable is considered Private Authenticated Variable.
--		 * These are verified by db
--		 */
--		create_smm_variable(&(allowed_key_store_variables[0]),
--				    sizeof(EFI_IMAGE_SECURITY_DATABASE), maximum_variable_size,
--				    (uint8_t *)EFI_IMAGE_SECURITY_DATABASE,
--				    &security_database_guid);
- 	}
-=20
- 	return EFI_SUCCESS;
-@@ -1114,13 +1120,39 @@ static efi_status_t verify_var_by_key_var(const =
efi_data_map *new_var,
- 	return EFI_SECURITY_VIOLATION;
- }
-=20
--/* Basic verification of the authentication header of the new variable.
-+static bool isPrivateAuthVar(SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *=
var)
-+{
-+	if (compare_name_to_key_store_name(var->Name,
-+					   var->NameSize, EFI_PLATFORM_KEY_NAME,
-+					   sizeof(EFI_PLATFORM_KEY_NAME)) ||
-+		 compare_name_to_key_store_name(
-+			   var->Name, var->NameSize,
-+			   EFI_KEY_EXCHANGE_KEY_NAME, sizeof(EFI_KEY_EXCHANGE_KEY_NAME)) ||
-+		 compare_name_to_key_store_name(
-+			 var->Name, var->NameSize,
-+			 EFI_IMAGE_SECURITY_DATABASE, sizeof(EFI_IMAGE_SECURITY_DATABASE)) |=
|
-+		 compare_name_to_key_store_name(
-+			 var->Name, var->NameSize,
-+			 EFI_IMAGE_SECURITY_DATABASE1, sizeof(EFI_IMAGE_SECURITY_DATABASE1))=
 ||
-+		 compare_name_to_key_store_name(
-+			 var->Name, var->NameSize,
-+			 EFI_IMAGE_SECURITY_DATABASE2, sizeof(EFI_IMAGE_SECURITY_DATABASE2))=
 ||
-+		 compare_name_to_key_store_name(
-+			 var->Name, var->NameSize,
-+			 EFI_IMAGE_SECURITY_DATABASE3, sizeof(EFI_IMAGE_SECURITY_DATABASE3))=
)
-+		return false;
-+
-+	return true;
-+}
-+
-+/*
-+ * Basic verification of the authentication header of the new variable.
-  * First finds the key variable responsible for the authentication of t=
he new variable,
-  * then verifies it.
-  */
- static efi_status_t authenticate_variable(const struct uefi_variable_st=
ore *context,
--					  EFI_TIME *timestamp,
--					  SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
-+					  EFI_TIME *timestamp, uint8_t (*fingerprint)[FINGERPRINT_SIZE],
-+					  bool new_variable, SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var=
)
- {
- 	efi_status_t status =3D EFI_SUCCESS;
- 	EFI_GUID pkcs7_guid =3D EFI_CERT_TYPE_PKCS7_GUID;
-@@ -1192,8 +1224,13 @@ static efi_status_t authenticate_variable(const s=
truct uefi_variable_store *cont
- 		status =3D EFI_SECURITY_VIOLATION;
- 	}
-=20
--	/* Run Secure Boot related authentication steps */
--	status =3D authenticate_secure_boot_variable(context, &var_map, (uint8=
_t*) &hash_buffer, hash_len, variable_info.MaximumVariableSize);
-+	if (isPrivateAuthVar(var)) {
-+		/* Run Private Authenticated Variable related authentication steps */
-+		status =3D authenticate_private_variable(context, &var_map, (uint8_t*=
) &hash_buffer, hash_len, variable_info.MaximumVariableSize, new_variable=
, fingerprint);
-+	} else {
-+		/* Run Secure Boot related authentication steps */
-+		status =3D authenticate_secure_boot_variable(context, &var_map, (uint=
8_t*) &hash_buffer, hash_len, variable_info.MaximumVariableSize);
-+	}
-=20
- 	/* Remove the authentication header from the variable if the authentic=
ation is successful */
- 	if (status =3D=3D EFI_SUCCESS) {
-@@ -1340,6 +1377,57 @@ end:
-=20
- 	return status;
- }
-+
-+static efi_status_t authenticate_private_variable(const struct uefi_var=
iable_store *context,
-+						  efi_data_map* var_map,
-+						  uint8_t* hash_buffer,
-+						  size_t hash_len,
-+						  uint64_t max_variable_size,
-+						  bool new_variable,
-+						  uint8_t (*fingerprint)[FINGERPRINT_SIZE])
-+{
-+	efi_status_t status =3D EFI_SUCCESS;
-+	uint8_t new_fingerprint[PSA_HASH_MAX_SIZE] =3D { 0 };
-+
-+	/* Verify the signature of the variable */
-+	if (verify_pkcs7_signature(
-+		var_map->efi_auth_descriptor->AuthInfo.CertData,
-+		var_map->efi_auth_descriptor_certdata_len, hash_buffer,
-+		hash_len, NULL, 0) =3D=3D 0)
-+		status =3D EFI_SUCCESS;
-+	else
-+		return EFI_SECURITY_VIOLATION;
-+
-+	/**
-+	 * UEFI: Page 254
-+	 * CN of the signing certificate=E2=80=99s Subject and the hash of the=
 tbsCertificate of the top-level issuer certificate
-+	 * (or the signing certificate itself if no other certificates are pre=
sent or the certificate chain is of length 1)
-+	 * in SignedData.certificates is registered for use in subsequent veri=
fications of this variable. Implementations
-+	 * may store just a single hash of these two elements to reduce storag=
e requirements.
-+	 */
-+	if (get_uefi_priv_auth_var_fingerprint_handler(var_map->efi_auth_descr=
iptor->AuthInfo.CertData,
-+						       var_map->efi_auth_descriptor_certdata_len,
-+						       (uint8_t*)&new_fingerprint)) {
-+		EMSG("Failed to querry variable fingerprint input");
-+		return EFI_SECURITY_VIOLATION;
-+	}
-+
-+	/*
-+	 * The hash is SHA256 so only 32 bytes contain non zero values.
-+	 * Use only that part to decrease metadata size.
-+	 */
-+	if (!new_variable) {
-+		if (memcmp(&new_fingerprint, fingerprint, FINGERPRINT_SIZE)) {
-+			EMSG("Fingerprint verification failed");
-+			return EFI_SECURITY_VIOLATION;
-+		}
-+	} else {
-+		/* Save fingerprint */
-+		memcpy(fingerprint, &new_fingerprint, FINGERPRINT_SIZE);
-+	}
-+
-+	return status;
-+}
- #endif
-=20
- static efi_status_t store_variable_data(const struct uefi_variable_stor=
e *context,
-diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.c b/components/service/uefi/smm_variable/backend/variable_index.c
-index f4194d2d3..7f2fbe0ba 100644
---- a/components/service/uefi/smm_variable/backend/variable_index.c
-+++ b/components/service/uefi/smm_variable/backend/variable_index.c
-@@ -199,6 +199,7 @@ static struct variable_entry *add_entry(const struct=
 variable_index *context, co
- 			info->metadata.uid =3D generate_uid(context, guid, name_size, name);
- 			info->metadata.guid =3D *guid;
- 			memset(&info->metadata.timestamp, 0, sizeof(EFI_TIME));
-+			memset(&info->metadata.fingerprint, 0, sizeof(FINGERPRINT_SIZE));
- 			info->metadata.attributes =3D 0;
- 			info->metadata.name_size =3D name_size;
- 			memcpy(info->metadata.name, name, name_size);
-diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.h b/components/service/uefi/smm_variable/backend/variable_index.h
-index 7eef7b86b..726bc985a 100644
---- a/components/service/uefi/smm_variable/backend/variable_index.h
-+++ b/components/service/uefi/smm_variable/backend/variable_index.h
-@@ -24,6 +24,7 @@ extern "C" {
-  * Implementation limits
-  */
- #define VARIABLE_INDEX_MAX_NAME_SIZE (64)
-+#define FINGERPRINT_SIZE             (32)
-=20
- /**
-  * \brief variable_metadata structure definition
-@@ -33,6 +34,7 @@ extern "C" {
- struct variable_metadata {
- 	EFI_GUID guid;
- 	EFI_TIME timestamp;
-+	uint8_t fingerprint[FINGERPRINT_SIZE];
- 	size_t name_size;
- 	int16_t name[VARIABLE_INDEX_MAX_NAME_SIZE];
- 	uint32_t attributes;
-diff --git a/deployments/smm-gateway/config/default-opteesp/CMakeLists.t=
xt b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
-index 0e281a377..d3df61ded 100644
---- a/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
-+++ b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
-@@ -42,7 +42,7 @@ set(SP_BOOT_ORDER "8" CACHE STRING "Boot order of the =
SP")
- add_platform(TARGET "smm-gateway")
-=20
- # SMM variable and RPC caller settings
--set(SMM_GATEWAY_MAX_UEFI_VARIABLES 40 CACHE STRING "Maximum UEFI variab=
le count")
-+set(SMM_GATEWAY_MAX_UEFI_VARIABLES 35 CACHE STRING "Maximum UEFI variab=
le count")
- set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 2*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
- if (UEFI_AUTH_VAR)
- set(SMM_SP_HEAP_SIZE 64*1024 CACHE STRING "SMM gateway SP heap size")
-diff --git a/deployments/smm-gateway/config/default-sp/CMakeLists.txt b/=
deployments/smm-gateway/config/default-sp/CMakeLists.txt
-index 8df9256e4..bb97cf8e3 100644
---- a/deployments/smm-gateway/config/default-sp/CMakeLists.txt
-+++ b/deployments/smm-gateway/config/default-sp/CMakeLists.txt
-@@ -47,7 +47,7 @@ set(SP_BOOT_ORDER "8" CACHE STRING "Boot order of the =
SP")
- add_platform(TARGET "smm-gateway")
-=20
- # SMM variable and RPC caller settings
--set(SMM_GATEWAY_MAX_UEFI_VARIABLES 40 CACHE STRING "Maximum UEFI variab=
le count")
-+set(SMM_GATEWAY_MAX_UEFI_VARIABLES 35 CACHE STRING "Maximum UEFI variab=
le count")
- set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 2*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
- if (UEFI_AUTH_VAR)
- set(SMM_SP_HEAP_SIZE 64*1024 CACHE STRING "SMM gateway SP heap size")
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 84f4c07f..89362ead 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -5,24 +5,15 @@ SRC_URI:append:corstone1000  =3D " \
     file://0001-Add-stub-capsule-update-service-components.patch \
     file://0002-Fix-in-AEAD-for-psa-arch-test-254.patch \
     file://0003-FMP-Support-in-Corstone1000.patch \
-    file://0004-smm_gateway-GetNextVariableName-Fix.patch     \
-    file://0005-Fix-psa-api-crypto-test-no-243.patch \
-    file://0006-plat-corstone1000-Use-the-stateless-platform-service.pat=
ch \
-    file://0007-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
-    file://0008-plat-corstone1000-add-client_id-for-FMP-service.patch \
-    file://0009-Remove-Werror-flag.patch \
-    file://0010-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
-    file://0011-Fix-Avoid-redefinition-of-variables.patch \
-    file://0012-Fix-GetNextVariableName-NameSize-input.patch \
-    file://0013-Fix-error-handling-of-variable-index-loading.patch \
-    file://0014-Provide-crypto-api-to-create-uefi-priv-var-fingerpri.pat=
ch \
-    file://0015-Add-timestamp-validation-for-uefi-variables.patch \
-    file://0016-Isolate-common-uefi-variable-authentication-steps.patch =
\
-    file://0017-Implement-Private-Authenticated-Variable-verificatio.pat=
ch \
-    file://0018-Make-RSS-and-MHU-sizes-compile-time-definitions-user.pat=
ch \
-    file://0019-Align-PSA-Crypto-with-TF-Mv2.1.patch \
-    file://0020-se-proxy-protobuf-change.patch \
-    file://0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch \
+    file://0004-Fix-psa-api-crypto-test-no-243.patch \
+    file://0005-plat-corstone1000-Use-the-stateless-platform-service.pat=
ch \
+    file://0006-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
+    file://0007-plat-corstone1000-add-client_id-for-FMP-service.patch \
+    file://0008-Remove-Werror-flag.patch \
+    file://0009-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
+    file://0010-Make-RSS-and-MHU-sizes-compile-time-definitions-user.pat=
ch \
+    file://0011-Align-PSA-Crypto-with-TF-Mv2.1.patch \
+    file://0015-se-proxy-protobuf-change.patch \
     "
=20
 # The patches above introduce errors with GCC 14.1, silence them for now
--=20
2.43.0


