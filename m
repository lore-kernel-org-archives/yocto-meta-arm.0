Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5A4CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:00:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.585.1758034821627054562
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 08:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BAB62ED2;
	Tue, 16 Sep 2025 08:00:13 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.80.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A63A73F694;
	Tue, 16 Sep 2025 08:00:20 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 3/4] arm-bsp/ts:corstone1000: Remove obsolete patches
Date: Tue, 16 Sep 2025 16:00:12 +0100
Message-ID: <20250916150013.30666-4-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916150013.30666-1-hugues.kambampiana@arm.com>
References: <20250916150013.30666-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Sep 2025 15:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6713

The Corstone-1000 Trusted Services patches removed in this change are no
longer required following the upgrade to Trusted Services v1.2.0.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 ...01-Fix-in-AEAD-for-psa-arch-test-254.patch | 129 ------
 .../0002-Fix-psa-api-crypto-test-no-243.patch |  31 --
 ...-sizes-compile-time-definitions-user.patch |  40 --
 .../0006-Align-PSA-Crypto-with-TF-Mv2.1.patch | 298 ------------
 .../0008-se-proxy-protobuf-change.patch       |  71 ---
 ...-FWU-IPC-framework-for-Corstone-1000.patch | 436 ------------------
 ...mage-state-in-PSA-FWU-M-update-agent.patch | 188 --------
 ...fine-PSA-FWU-image-mapping-structure.patch | 128 -----
 ...orm-corstone1000-Enable-ESRT-support.patch | 129 ------
 ...n-PSA-Crypto-structs-with-TF-Mv2.1.1.patch |  29 --
 10 files changed, 1479 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0001-Fix-in-AEAD-for-psa-arch-test-254.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0002-Fix-psa-api-crypto-test-no-243.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0006-Align-PSA-Crypto-with-TF-Mv2.1.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-se-proxy-protobuf-change.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0010-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0011-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-Corstone1000-Define-PSA-FWU-image-mapping-structure.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0015-platform-corstone1000-Enable-ESRT-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0001-Fix-in-AEAD-for-psa-arch-test-254.patch b/meta-arm-bsp/recipes-secur=
ity/trusted-services/corstone1000/0001-Fix-in-AEAD-for-psa-arch-test-254.=
patch
deleted file mode 100644
index a2e72b79..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Fi=
x-in-AEAD-for-psa-arch-test-254.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 74a07ccbb4eb573269672a0c1f61b9165a592b44 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Mon, 14 Feb 2022 08:22:25 +0000
-Subject: [PATCH 02/12] Fix in AEAD for psa-arch test 254
-
-PSA crypto test 254 fails at checkpoint 6.
-Fix output arguments in various crypto AEAD functions
-to match crypto service implementation in TF-M. AEAD API's
-in TF-M start expecting output size as an argument.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31176]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- .../crypto/client/caller/packed-c/crypto_caller_aead.h |  1 +
- components/service/crypto/include/psa/crypto_sizes.h   |  2 +-
- .../crypto/provider/extension/aead/aead_provider.c     | 10 ++++++++--
- .../aead/serializer/aead_provider_serializer.h         |  1 +
- .../packed-c/packedc_aead_provider_serializer.c        |  2 ++
- protocols/service/crypto/packed-c/aead.h               |  1 +
- 6 files changed, 14 insertions(+), 3 deletions(-)
-
-diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_aead.h b/components/service/crypto/client/caller/packed-c/crypto_call=
er_aead.h
-index 417189e87..236d3e258 100644
---- a/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
-+++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
-@@ -314,6 +314,7 @@ static inline psa_status_t crypto_caller_aead_update=
(struct service_client *cont
- 	size_t req_len =3D req_fixed_len;
-=20
- 	*output_length =3D 0;
-+        req_msg.output_size =3D output_size;
- 	req_msg.op_handle =3D op_handle;
-=20
- 	/* Mandatory input data parameter */
-diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/comp=
onents/service/crypto/include/psa/crypto_sizes.h
-index 30aa102da..130d27295 100644
---- a/components/service/crypto/include/psa/crypto_sizes.h
-+++ b/components/service/crypto/include/psa/crypto_sizes.h
-@@ -351,7 +351,7 @@
-  *       just the largest size that may be generated by
-  *       #psa_aead_generate_nonce().
-  */
--#define PSA_AEAD_NONCE_MAX_SIZE 12
-+#define PSA_AEAD_NONCE_MAX_SIZE 16
-=20
- /** A sufficient output buffer size for psa_aead_update().
-  *
-diff --git a/components/service/crypto/provider/extension/aead/aead_prov=
ider.c b/components/service/crypto/provider/extension/aead/aead_provider.=
c
-index b73d88d32..510cffa34 100644
---- a/components/service/crypto/provider/extension/aead/aead_provider.c
-+++ b/components/service/crypto/provider/extension/aead/aead_provider.c
-@@ -283,10 +283,11 @@ static rpc_status_t aead_update_handler(void *cont=
ext, struct rpc_request *req)
- 	uint32_t op_handle;
- 	const uint8_t *input;
- 	size_t input_len;
-+        uint32_t recv_output_size;
-=20
- 	if (serializer)
- 		rpc_status =3D serializer->deserialize_aead_update_req(req_buf, &op_h=
andle,
--			&input, &input_len);
-+			&recv_output_size, &input, &input_len);
-=20
- 	if (rpc_status =3D=3D RPC_SUCCESS) {
-=20
-@@ -300,9 +301,14 @@ static rpc_status_t aead_update_handler(void *conte=
xt, struct rpc_request *req)
- 		if (crypto_context) {
-=20
- 			size_t output_len =3D 0;
--			size_t output_size =3D PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(input_len);
-+			size_t output_size =3D PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(24);
-+			/* Always allocate maximum size to be more robust to implementations=
 of psa_aead_update() */
- 			uint8_t *output =3D malloc(output_size);
-=20
-+                        if (recv_output_size < output_size) {
-+                            output_size =3D recv_output_size;
-+                        }
-+
- 			if (output) {
-=20
- 				psa_status =3D psa_aead_update(&crypto_context->op.aead,
-diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/aead_provider_serializer.h b/components/service/crypto/provider/extensi=
on/aead/serializer/aead_provider_serializer.h
-index be76d2bc6..590973048 100644
---- a/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
-+++ b/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
-@@ -51,6 +51,7 @@ struct aead_provider_serializer {
- 	/* Operation: aead_update */
- 	rpc_status_t (*deserialize_aead_update_req)(const struct rpc_buffer *r=
eq_buf,
- 		uint32_t *op_handle,
-+                uint32_t *output_size,
- 		const uint8_t **input, size_t *input_len);
-=20
- 	rpc_status_t (*serialize_aead_update_resp)(struct rpc_buffer *resp_buf=
,
-diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/packed-c/packedc_aead_provider_serializer.c b/components/service/crypto=
/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serial=
izer.c
-index 8f8c3c7f2..922a7b651 100644
---- a/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
-+++ b/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
-@@ -192,6 +192,7 @@ static rpc_status_t deserialize_aead_update_ad_req(c=
onst struct rpc_buffer *req_
- /* Operation: aead_update */
- static rpc_status_t deserialize_aead_update_req(const struct rpc_buffer=
 *req_buf,
- 	uint32_t *op_handle,
-+        uint32_t *output_size,
- 	const uint8_t **input, size_t *input_len)
- {
- 	rpc_status_t rpc_status =3D RPC_ERROR_INVALID_REQUEST_BODY;
-@@ -208,6 +209,7 @@ static rpc_status_t deserialize_aead_update_req(cons=
t struct rpc_buffer *req_buf
- 		memcpy(&recv_msg, req_buf->data, expected_fixed_len);
-=20
- 		*op_handle =3D recv_msg.op_handle;
-+                *output_size =3D recv_msg.output_size;
-=20
- 		tlv_const_iterator_begin(&req_iter,
- 			(uint8_t*)req_buf->data + expected_fixed_len,
-diff --git a/protocols/service/crypto/packed-c/aead.h b/protocols/servic=
e/crypto/packed-c/aead.h
-index 0be266b52..435fd3b52 100644
---- a/protocols/service/crypto/packed-c/aead.h
-+++ b/protocols/service/crypto/packed-c/aead.h
-@@ -98,6 +98,7 @@ enum
- struct __attribute__ ((__packed__)) ts_crypto_aead_update_in
- {
-   uint32_t op_handle;
-+  uint32_t output_size;
- };
-=20
- /* Variable length input parameter tags */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0002-Fix-psa-api-crypto-test-no-243.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/0002-Fix-psa-api-crypto-test-no-243.patch
deleted file mode 100644
index 9253d8ec..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Fi=
x-psa-api-crypto-test-no-243.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c74d0d62fede8ef0207a909fb4157dbbb4830dc9 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 10 Apr 2024 09:17:39 +0200
-Subject: [PATCH 04/12] Fix psa-api-crypto-test no 243
-
-Enable MbedTLS ECP DP SECP521R1 ECC algorithm to pass
-PSA-API tests's `psa-api-crypto-test` number 243 as it is
-required for Corstone-1000.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31177/1]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- platform/providers/arm/corstone1000/platform.cmake | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index d39b79033..0c7c51b6e 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -14,6 +14,7 @@ target_compile_definitions(${TGT} PRIVATE
- 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
- 	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D0x2080
- 	COMMS_MHU_MSG_SIZE=3D0x3500
-+	MBEDTLS_ECP_DP_SECP521R1_ENABLED
- )
-=20
- get_property(_platform_driver_dependencies TARGET ${TGT}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0005-Make-RSS-and-MHU-sizes-compile-time-definitions-user.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0005-Make-RSS-and-MH=
U-sizes-compile-time-definitions-user.patch
deleted file mode 100644
index 90dadc6c..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Ma=
ke-RSS-and-MHU-sizes-compile-time-definitions-user.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 1c8b1d017cbdd26c9b75580936017eecd2b1f70c Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <gyorgy.szing@arm.com>
-Date: Fri, 18 Oct 2024 12:08:21 +0000
-Subject: [PATCH 10/12] Make RSE and MHU sizes compile-time definitions
- user-configurable
-
-Replace the hardcoded RSE and MHU compile definitions values with CMake
-cache variables that users can configure to change the size of the RSE
-communication payload and the MHU message.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31178/1]
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- platform/providers/arm/corstone1000/platform.cmake | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index 0c7c51b6e..66a55ab85 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -9,11 +9,13 @@
- set(SMM_GATEWAY_MAX_UEFI_VARIABLES 80 CACHE STRING "Maximum UEFI variab=
le count")
- set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 4*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
- set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway SP heap size")
-+set(PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE 0x43C0 CACHE STRING "Size of the RS=
E_COMMS_PAYLOAD buffer")
-+set(COMMS_MHU_MSG_SIZE 0x4500 CACHE STRING "Max message size that can b=
e transfered via MHU")
-=20
- target_compile_definitions(${TGT} PRIVATE
- 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
--	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D0x2080
--	COMMS_MHU_MSG_SIZE=3D0x3500
-+	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE}
-+ 	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
- 	MBEDTLS_ECP_DP_SECP521R1_ENABLED
- )
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0006-Align-PSA-Crypto-with-TF-Mv2.1.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/0006-Align-PSA-Crypto-with-TF-Mv2.1.patch
deleted file mode 100644
index 906a27d2..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Al=
ign-PSA-Crypto-with-TF-Mv2.1.patch
+++ /dev/null
@@ -1,298 +0,0 @@
-From 111c15d7bf79e023bfb8bdcf631dfa95503f5f4e Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <gyorgy.szing@arm.com>
-Date: Fri, 18 Oct 2024 11:40:29 +0000
-Subject: [PATCH 11/12] Align PSA Crypto with TF-Mv2.1
-
-Update following files using the TF-Mv2.1 release (0c4c99b) commit.
-
-* crypto_sid.h
-This is derived from TF-M's tfm_crypto_defs.h file. The crypto function
-ID definitions were reworked. This change had to be done on the TS
-side too to keep the compatibility.
-
-* crypto_ipc_backend.h
-This file is also derived from the tfm_crypto_defs.h file. The
-tfm_crypto_pack_iovec struct changed in TF-M so the
-psa_ipc_crypto_pack_iovec struct had to be updated in TS to
-keep the compatibility.
-
-* crypto_client_struct.h
-The psa_client_key_attributes_s struct had to be aligned with the
-psa_key_attributes_s struct in TF-M. (psa_crypto.c)
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/31179/1]
----
- .../service/common/include/psa/crypto_sid.h   | 166 +++++-------------
- .../backend/psa_ipc/crypto_ipc_backend.h      |   9 +-
- .../crypto/include/psa/crypto_client_struct.h |   4 +-
- 3 files changed, 54 insertions(+), 125 deletions(-)
-
-diff --git a/components/service/common/include/psa/crypto_sid.h b/compon=
ents/service/common/include/psa/crypto_sid.h
-index 5b05f46d7..e1fbb15e2 100644
---- a/components/service/common/include/psa/crypto_sid.h
-+++ b/components/service/common/include/psa/crypto_sid.h
-@@ -19,21 +19,23 @@ extern "C" {
-  *        Asym sign, Asym encrypt, Key derivation).
-  */
- enum tfm_crypto_group_id {
--    TFM_CRYPTO_GROUP_ID_RANDOM =3D 0x0,
--    TFM_CRYPTO_GROUP_ID_KEY_MANAGEMENT,
--    TFM_CRYPTO_GROUP_ID_HASH,
--    TFM_CRYPTO_GROUP_ID_MAC,
--    TFM_CRYPTO_GROUP_ID_CIPHER,
--    TFM_CRYPTO_GROUP_ID_AEAD,
--    TFM_CRYPTO_GROUP_ID_ASYM_SIGN,
--    TFM_CRYPTO_GROUP_ID_ASYM_ENCRYPT,
--    TFM_CRYPTO_GROUP_ID_KEY_DERIVATION,
-+    TFM_CRYPTO_GROUP_ID_RANDOM          =3D UINT8_C(1),
-+    TFM_CRYPTO_GROUP_ID_KEY_MANAGEMENT  =3D UINT8_C(2),
-+    TFM_CRYPTO_GROUP_ID_HASH            =3D UINT8_C(3),
-+    TFM_CRYPTO_GROUP_ID_MAC             =3D UINT8_C(4),
-+    TFM_CRYPTO_GROUP_ID_CIPHER          =3D UINT8_C(5),
-+    TFM_CRYPTO_GROUP_ID_AEAD            =3D UINT8_C(6),
-+    TFM_CRYPTO_GROUP_ID_ASYM_SIGN       =3D UINT8_C(7),
-+    TFM_CRYPTO_GROUP_ID_ASYM_ENCRYPT    =3D UINT8_C(8),
-+    TFM_CRYPTO_GROUP_ID_KEY_DERIVATION  =3D UINT8_C(9)
- };
-=20
--/* X macro describing each of the available PSA Crypto APIs */
-+/* Set of X macros describing each of the available PSA Crypto APIs */
-+#define RANDOM_FUNCS                               \
-+    X(TFM_CRYPTO_GENERATE_RANDOM)
-+
- #define KEY_MANAGEMENT_FUNCS                       \
-     X(TFM_CRYPTO_GET_KEY_ATTRIBUTES)               \
--    X(TFM_CRYPTO_RESET_KEY_ATTRIBUTES)             \
-     X(TFM_CRYPTO_OPEN_KEY)                         \
-     X(TFM_CRYPTO_CLOSE_KEY)                        \
-     X(TFM_CRYPTO_IMPORT_KEY)                       \
-@@ -89,13 +91,13 @@ enum tfm_crypto_group_id {
-     X(TFM_CRYPTO_AEAD_VERIFY)                      \
-     X(TFM_CRYPTO_AEAD_ABORT)
-=20
--#define ASYMMETRIC_SIGN_FUNCS                      \
-+#define ASYM_SIGN_FUNCS                      \
-     X(TFM_CRYPTO_ASYMMETRIC_SIGN_MESSAGE)          \
-     X(TFM_CRYPTO_ASYMMETRIC_VERIFY_MESSAGE)        \
-     X(TFM_CRYPTO_ASYMMETRIC_SIGN_HASH)             \
-     X(TFM_CRYPTO_ASYMMETRIC_VERIFY_HASH)
-=20
--#define AYSMMETRIC_ENCRYPT_FUNCS                   \
-+#define ASYM_ENCRYPT_FUNCS                   \
-     X(TFM_CRYPTO_ASYMMETRIC_ENCRYPT)               \
-     X(TFM_CRYPTO_ASYMMETRIC_DECRYPT)
-=20
-@@ -106,133 +108,55 @@ enum tfm_crypto_group_id {
-     X(TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY)      \
-     X(TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES)       \
-     X(TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY)         \
-+    X(TFM_CRYPTO_KEY_DERIVATION_INPUT_INTEGER)     \
-     X(TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT)     \
-     X(TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES)      \
-     X(TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY)        \
-     X(TFM_CRYPTO_KEY_DERIVATION_ABORT)
-=20
--#define RANDOM_FUNCS                               \
--    X(TFM_CRYPTO_GENERATE_RANDOM)
--
--/*
-- * Define function IDs in each group. The function ID will be encoded i=
nto
-- * tfm_crypto_func_sid below.
-- * Each group is defined as a dedicated enum in case the total number o=
f
-- * PSA Crypto APIs exceeds 256.
-- */
--#define X(func_id)    func_id,
--enum tfm_crypto_key_management_func_id {
--    KEY_MANAGEMENT_FUNCS
--};
--enum tfm_crypto_hash_func_id {
--    HASH_FUNCS
--};
--enum tfm_crypto_mac_func_id {
--    MAC_FUNCS
--};
--enum tfm_crypto_cipher_func_id {
--    CIPHER_FUNCS
--};
--enum tfm_crypto_aead_func_id {
--    AEAD_FUNCS
--};
--enum tfm_crypto_asym_sign_func_id {
--    ASYMMETRIC_SIGN_FUNCS
--};
--enum tfm_crypto_asym_encrypt_func_id {
--    AYSMMETRIC_ENCRYPT_FUNCS
--};
--enum tfm_crypto_key_derivation_func_id {
--    KEY_DERIVATION_FUNCS
--};
--enum tfm_crypto_random_func_id {
--    RANDOM_FUNCS
--};
--#undef X
--
--#define FUNC_ID(func_id)    (((func_id) & 0xFF) << 8)
-+#define BASE__VALUE(x) ((uint16_t)((((uint16_t)(x)) << 8) & 0xFF00))
-=20
--/*
-- * Numerical progressive value identifying a function API exposed throu=
gh
-- * the interfaces (S or NS). It's used to dispatch the requests from S/=
NS
-- * to the corresponding API implementation in the Crypto service backen=
d.
-+/**
-+ * \brief This type defines numerical progressive values identifying a =
function API
-+ *        exposed through the interfaces (S or NS). It's used to dispat=
ch the requests
-+ *        from S/NS to the corresponding API implementation in the Cryp=
to service backend.
-+ *
-+ * \note Each function SID is encoded as uint16_t.
-+ *        +------------+------------+
-+ *        |  Group ID  |  Func ID   |
-+ *        +------------+------------+
-+ *   (MSB)15         8 7          0(LSB)
-  *
-- * Each function SID is encoded as uint16_t.
-- *     |  Func ID  |  Group ID |
-- *     15         8 7          0
-- * Func ID is defined in each group func_id enum above
-- * Group ID is defined in tfm_crypto_group_id.
-  */
--enum tfm_crypto_func_sid {
--
--#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
--                                   (TFM_CRYPTO_GROUP_ID_KEY_MANAGEMENT =
& 0xFF)),
--
-+enum tfm_crypto_func_sid_t {
-+#define X(FUNCTION_NAME) FUNCTION_NAME ## _SID,
-+    BASE__RANDOM         =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_RANDOM) - =
1,
-+    RANDOM_FUNCS
-+    BASE__KEY_MANAGEMENT =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_KEY_MANAGE=
MENT) - 1,
-     KEY_MANAGEMENT_FUNCS
--
--#undef X
--#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
--                                            (TFM_CRYPTO_GROUP_ID_HASH &=
 0xFF)),
-+    BASE__HASH           =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_HASH) - 1,
-     HASH_FUNCS
--
--#undef X
--#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
--                                            (TFM_CRYPTO_GROUP_ID_MAC & =
0xFF)),
-+    BASE__MAC            =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_MAC) - 1,
-     MAC_FUNCS
--
--#undef X
--#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
--                                           (TFM_CRYPTO_GROUP_ID_CIPHER =
& 0xFF)),
-+    BASE__CIPHER         =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_CIPHER) - =
1,
-     CIPHER_FUNCS
--
--#undef X
--#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
--                                             (TFM_CRYPTO_GROUP_ID_AEAD =
& 0xFF)),
-+    BASE__AEAD           =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_AEAD) - 1,
-     AEAD_FUNCS
--
--#undef X
--#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
--                                        (TFM_CRYPTO_GROUP_ID_ASYM_SIGN =
& 0xFF)),
--    ASYMMETRIC_SIGN_FUNCS
--
--#undef X
--#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
--                                     (TFM_CRYPTO_GROUP_ID_ASYM_ENCRYPT =
& 0xFF)),
--    AYSMMETRIC_ENCRYPT_FUNCS
--
--#undef X
--#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
--                                   (TFM_CRYPTO_GROUP_ID_KEY_DERIVATION =
& 0xFF)),
-+    BASE__ASYM_SIGN      =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_ASYM_SIGN)=
 - 1,
-+    ASYM_SIGN_FUNCS
-+    BASE__ASYM_ENCRYPT   =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_ASYM_ENCRY=
PT) - 1,
-+    ASYM_ENCRYPT_FUNCS
-+    BASE__KEY_DERIVATION =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_KEY_DERIVA=
TION) - 1,
-     KEY_DERIVATION_FUNCS
--
- #undef X
--#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
--                                           (TFM_CRYPTO_GROUP_ID_RANDOM =
& 0xFF)),
--    RANDOM_FUNCS
--
- };
--#undef X
-=20
- /**
-- * \brief Define an invalid value for an SID
-- *
-+ * \brief This macro is used to extract the group_id from an encoded fu=
nction id
-+ *        by accessing the upper 8 bits. A \a _function_id is uint16_t =
type
-  */
--#define TFM_CRYPTO_SID_INVALID (~0x0u)
--
--/**
-- * \brief This value is used to mark an handle as invalid.
-- *
-- */
--#define TFM_CRYPTO_INVALID_HANDLE (0x0u)
--
--/**
-- * \brief Define miscellaneous literal constants that are used in the s=
ervice
-- *
-- */
--enum {
--    TFM_CRYPTO_NOT_IN_USE =3D 0,
--    TFM_CRYPTO_IN_USE =3D 1
--};
-+#define TFM_CRYPTO_GET_GROUP_ID(_function_id) \
-+    ((enum tfm_crypto_group_id_t)(((uint16_t)(_function_id) >> 8) & 0xF=
F))
-=20
- #ifdef __cplusplus
- }
-diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-index f9bbf84d6..27fe3496a 100644
---- a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-+++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-@@ -30,10 +30,9 @@ struct psa_ipc_crypto_aead_pack_input {
- struct psa_ipc_crypto_pack_iovec {
-     psa_key_id_t key_id;     /*!< Key id */
-     psa_algorithm_t alg;     /*!< Algorithm */
--    uint32_t op_handle;      /*!< Frontend context handle associated to=
 a
-+    uint32_t op_handle;      /*!< Client context handle associated to a
-                               *   multipart operation
-                               */
--    uint32_t capacity;         /*!< Key derivation capacity */
-     uint32_t ad_length;        /*!< Additional Data length for multipar=
t AEAD */
-     uint32_t plaintext_length; /*!< Plaintext length for multipart AEAD=
 */
-=20
-@@ -44,7 +43,11 @@ struct psa_ipc_crypto_pack_iovec {
-                               *   See tfm_crypto_func_sid for detail
-                               */
-     uint16_t step;           /*!< Key derivation step */
--} __attribute__((__packed__));
-+    union {
-+        size_t capacity;     /*!< Key derivation capacity */
-+        uint64_t value;      /*!< Key derivation integer for update*/
-+    };
-+};
-=20
- #define iov_size sizeof(struct psa_ipc_crypto_pack_iovec)
-=20
-diff --git a/components/service/crypto/include/psa/crypto_client_struct.=
h b/components/service/crypto/include/psa/crypto_client_struct.h
-index 1f68aba21..ebc400811 100644
---- a/components/service/crypto/include/psa/crypto_client_struct.h
-+++ b/components/service/crypto/include/psa/crypto_client_struct.h
-@@ -34,9 +34,11 @@ struct psa_client_key_attributes_s
-     uint16_t type;
-     uint16_t bits;
-     uint32_t lifetime;
--    psa_key_id_t id;
-     uint32_t usage;
-     uint32_t alg;
-+    uint32_t alg2;
-+    uint32_t id;
-+    int32_t owner_id;
- };
-=20
- #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0, 0, 0, 0, 0, 0}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0008-se-proxy-protobuf-change.patch b/meta-arm-bsp/recipes-security/trust=
ed-services/corstone1000/0008-se-proxy-protobuf-change.patch
deleted file mode 100644
index c7ac1614..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-se=
-proxy-protobuf-change.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 77dbb98428b0661f0ceee54208d226fc7fb27130 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Sun, 1 Jun 2025 11:06:00 +0000
-Subject: [PATCH 02/11] se proxy protobuf change
-
-Upstream-Status: Pending (not yet submitted to upstream)
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- .../se-proxy/env/commonsp/se_proxy_sp.c       | 24 ++++++++++++++++++-
- 1 file changed, 23 insertions(+), 1 deletion(-)
-
-diff --git a/deployments/se-proxy/env/commonsp/se_proxy_sp.c b/deploymen=
ts/se-proxy/env/commonsp/se_proxy_sp.c
-index 485d7649..9f94092b 100644
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
-@@ -25,6 +26,8 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
- 	uint16_t own_id =3D 0;
- 	sp_result result =3D SP_RESULT_INTERNAL_ERROR;
- 	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
-+       struct rpc_service_interface *crypto_iface_protobuf =3D NULL;
-+       struct crypto_provider *crypto_protobuf_provider =3D NULL;
-=20
- 	/* Boot phase */
- 	if (!sp_init(&own_id)) {
-@@ -39,7 +42,7 @@ void __noreturn sp_main(union ffa_boot_info *boot_info=
)
- 		goto fatal_error;
- 	}
-=20
--	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 5, 16);
-+	rpc_status =3D ts_rpc_endpoint_sp_init(&rpc_endpoint, 6, 16);
- 	if (rpc_status !=3D RPC_SUCCESS) {
- 		EMSG("Failed to initialize RPC endpoint: %d", rpc_status);
- 		goto fatal_error;
-@@ -106,6 +109,25 @@ void __noreturn sp_main(union ffa_boot_info *boot_i=
nfo)
- 		goto fatal_error;
- 	}
-=20
-+       crypto_protobuf_provider =3D crypto_protobuf_provider_factory_cr=
eate();
-+       if (!crypto_protobuf_provider) {
-+               EMSG("Failed to create crypto protobuf provider factory"=
);
-+               goto fatal_error;
-+       }
-+
-+       crypto_iface_protobuf =3D service_provider_get_rpc_interface(
-+               &crypto_protobuf_provider->base_provider);
-+       if (!crypto_iface_protobuf) {
-+               EMSG("Failed to create service provider RPC interface");
-+               goto fatal_error;
-+       }
-+
-+       rpc_status =3D ts_rpc_endpoint_sp_add_service(&rpc_endpoint, cry=
pto_iface_protobuf);
-+       if (rpc_status !=3D RPC_SUCCESS) {
-+               EMSG("Failed to add service to RPC endpoint: %d", rpc_st=
atus);
-+               goto fatal_error;
-+       }
-+
- 	/* End of boot phase */
- 	result =3D sp_msg_wait(&req_msg);
- 	if (result !=3D SP_RESULT_OK) {
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0010-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch b/meta-arm-b=
sp/recipes-security/trusted-services/corstone1000/0010-Integrate-PSA-FWU-=
IPC-framework-for-Corstone-1000.patch
deleted file mode 100644
index 4a80e6b3..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-In=
tegrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch
+++ /dev/null
@@ -1,436 +0,0 @@
-From f385ddacc8cc62842f7c9c91622d59959c41e718 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 28 Nov 2024 12:02:28 +0000
-Subject: [PATCH 04/11] Integrate PSA FWU IPC framework for Corstone-1000
-
-Integrate IPC framework for PSA FWU calls between Cortex-A side and Cort=
ex-M subsystems.
-
-IPC framework is required to bridge the PSA FWU calls for the platforms =
which have
-both Cortex-A and Cortex-M subsystems. Corstone-1000 falls under this ca=
tegory of
-platforms. In these platforms, the PSA FWU client and PSA FWU provider e=
xist on
-Cortex-A and all the PSA FWU services are implemented on Cortex-M side. =
This IPC
-framework forwards the PSA FWU calls from Cortex-A to Cortex-M subsystem=
.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/33826]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- components/service/common/include/psa/sid.h   |   6 +-
- .../interface/psa_ipc/component.cmake         |  13 +
- .../psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c | 253 ++++++++++++++++++
- .../psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h |  49 ++++
- .../se-proxy/infra/corstone1000/infra.cmake   |   2 +-
- .../corstone1000/service_proxy_factory.c      |  16 ++
- 6 files changed, 337 insertions(+), 2 deletions(-)
- create mode 100644 components/service/fwu/psa_fwu_m/interface/psa_ipc/c=
omponent.cmake
- create mode 100644 components/service/fwu/psa_fwu_m/interface/psa_ipc/p=
sa_fwu_ipc.c
- create mode 100644 components/service/fwu/psa_fwu_m/interface/psa_ipc/p=
sa_fwu_ipc.h
-
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 5aaa659d..0235764d 100644
---- a/components/service/common/include/psa/sid.h
-+++ b/components/service/common/include/psa/sid.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2019-2023, Arm Limited. All rights reserved.
-+ * Copyright (c) 2019-2024, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -58,6 +58,10 @@ extern "C" {
- #define TFM_ATTEST_GET_TOKEN_SIZE  1002
-=20
- /******** TFM_SP_FWU ********/
-+#define TFM_FIRMWARE_UPDATE_SERVICE_SID                            (0x0=
00000A0U)
-+#define TFM_FIRMWARE_UPDATE_SERVICE_VERSION                        (1U)
-+#define TFM_FIRMWARE_UPDATE_SERVICE_HANDLE                         (0x4=
0000104U)
-+
- #define TFM_FWU_WRITE_SID                                          (0x0=
00000A0U)
- #define TFM_FWU_WRITE_VERSION                                      (1U)
- #define TFM_FWU_INSTALL_SID                                        (0x0=
00000A1U)
-diff --git a/components/service/fwu/psa_fwu_m/interface/psa_ipc/componen=
t.cmake b/components/service/fwu/psa_fwu_m/interface/psa_ipc/component.cm=
ake
-new file mode 100644
-index 00000000..cdc653a6
---- /dev/null
-+++ b/components/service/fwu/psa_fwu_m/interface/psa_ipc/component.cmake
-@@ -0,0 +1,13 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2024, Arm Limited and Contributors. All rights reserved=
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
-+	"${CMAKE_CURRENT_LIST_DIR}/psa_fwu_ipc.c"
-+)
-diff --git a/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_=
ipc.c b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c
-new file mode 100644
-index 00000000..a47ae539
---- /dev/null
-+++ b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.c
-@@ -0,0 +1,253 @@
-+/*
-+ * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <stddef.h>
-+#include <string.h>
-+#include <trace.h>
-+
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include "service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h"
-+#include "service/fwu/psa_fwu_m/interface/tfm_fwu_defs.h"
-+#include "service/fwu/psa_fwu_m/interface/update.h"
-+
-+/**
-+ * @brief      The singleton psa_fwu_ipc instance
-+ *
-+ * The psa attestation C API assumes a single backend service provider.
-+ */
-+static struct service_client instance;
-+
-+psa_status_t psa_fwu_ipc_init(struct rpc_caller_session *session)
-+{
-+	return service_client_init(&instance, session);
-+}
-+
-+void psa_fwu_ipc_deinit(void)
-+{
-+	service_client_deinit(&instance);
-+}
-+
-+int psa_fwu_rpc_status(void)
-+{
-+	return instance.rpc_status;
-+}
-+
-+psa_status_t psa_fwu_query(psa_fwu_component_t component,
-+			   psa_fwu_component_info_t *info)
-+{
-+	if (!instance.session)
-+		return PSA_ERROR_BAD_STATE;
-+	if (!info)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller_interface *caller =3D instance.session->caller;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(info), .len =3D sizeof(*info) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
-+			  TFM_FWU_QUERY, in_vec, IOVEC_LEN(in_vec),
-+			  out_vec, IOVEC_LEN(out_vec));
-+	if (status !=3D PSA_SUCCESS)
-+		EMSG("failed to psa_call: %d", status);
-+
-+	return status;
-+}
-+
-+psa_status_t psa_fwu_start(psa_fwu_component_t component,
-+			   const void *manifest,
-+			   size_t manifest_size)
-+{
-+	if(manifest_size > UINT32_MAX)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+	if (!instance.session)
-+		return PSA_ERROR_BAD_STATE;
-+
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller_interface *caller =3D instance.session->caller;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
-+		{ .base =3D psa_ptr_const_to_u32(manifest), .len =3D manifest_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
-+			  TFM_FWU_START, in_vec, IOVEC_LEN(in_vec),
-+			  NULL, 0);
-+	if (status !=3D PSA_SUCCESS)
-+		EMSG("failed to psa_call: %d", status);
-+
-+	return status;
-+}
-+
-+psa_status_t psa_fwu_write(psa_fwu_component_t component,
-+			   size_t image_offset,
-+			   const void *block,
-+			   size_t block_size)
-+{
-+	if (!instance.session)
-+		return PSA_ERROR_BAD_STATE;
-+	if (!block || !block_size)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+	if((image_offset > UINT32_MAX) || (block_size > UINT32_MAX))
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller_interface *caller =3D instance.session->caller;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
-+		{ .base =3D psa_ptr_to_u32(&image_offset), .len =3D sizeof(uint32_t) =
},
-+		{ .base =3D psa_ptr_const_to_u32(block), .len =3D block_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
-+			  TFM_FWU_WRITE, in_vec, IOVEC_LEN(in_vec),
-+			  NULL, 0);
-+	if (status !=3D PSA_SUCCESS)
-+		EMSG("failed to psa_call: %d", status);
-+
-+	return status;
-+}
-+
-+psa_status_t psa_fwu_finish(psa_fwu_component_t component)
-+{
-+	if (!instance.session)
-+		return PSA_ERROR_BAD_STATE;
-+
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller_interface *caller =3D instance.session->caller;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
-+			  TFM_FWU_FINISH, in_vec, IOVEC_LEN(in_vec),
-+			  NULL, 0);
-+	if (status !=3D PSA_SUCCESS)
-+		EMSG("failed to psa_call: %d", status);
-+
-+	return status;
-+}
-+
-+psa_status_t psa_fwu_cancel(psa_fwu_component_t component)
-+{
-+	if (!instance.session)
-+		return PSA_ERROR_BAD_STATE;
-+
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller_interface *caller =3D instance.session->caller;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
-+			  TFM_FWU_CANCEL, in_vec, IOVEC_LEN(in_vec),
-+			  NULL, 0);
-+	if (status !=3D PSA_SUCCESS)
-+		EMSG("failed to psa_call: %d", status);
-+
-+	return status;
-+}
-+
-+psa_status_t psa_fwu_clean(psa_fwu_component_t component)
-+{
-+	if (!instance.session)
-+		return PSA_ERROR_BAD_STATE;
-+
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller_interface *caller =3D instance.session->caller;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&component), .len =3D sizeof(component) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
-+			  TFM_FWU_CLEAN, in_vec, IOVEC_LEN(in_vec),
-+			  NULL, 0);
-+	if (status !=3D PSA_SUCCESS)
-+		EMSG("failed to psa_call: %d", status);
-+
-+	return status;
-+}
-+
-+psa_status_t psa_fwu_install(void)
-+{
-+	if (!instance.session)
-+		return PSA_ERROR_BAD_STATE;
-+
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller_interface *caller =3D instance.session->caller;
-+	struct psa_invec in_vec[] =3D {};
-+
-+	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
-+			  TFM_FWU_INSTALL, in_vec, 0,
-+			  NULL, 0);
-+	if (status !=3D PSA_SUCCESS)
-+		EMSG("failed to psa_call: %d", status);
-+
-+	return status;
-+}
-+
-+psa_status_t psa_fwu_request_reboot(void)
-+{
-+	if (!instance.session)
-+		return PSA_ERROR_BAD_STATE;
-+
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller_interface *caller =3D instance.session->caller;
-+	struct psa_invec in_vec[] =3D {};
-+
-+	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
-+			  TFM_FWU_REQUEST_REBOOT, in_vec, 0,
-+			  NULL, 0);
-+	if (status !=3D PSA_SUCCESS)
-+		EMSG("failed to psa_call: %d", status);
-+
-+	return status;
-+}
-+
-+psa_status_t psa_fwu_reject(psa_status_t error)
-+{
-+	if (!instance.session)
-+		return PSA_ERROR_BAD_STATE;
-+
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller_interface *caller =3D instance.session->caller;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&error), .len =3D sizeof(error) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
-+			  TFM_FWU_REJECT, in_vec, IOVEC_LEN(in_vec),
-+			  NULL, 0);
-+	if (status !=3D PSA_SUCCESS)
-+		EMSG("failed to psa_call: %d", status);
-+
-+	return status;
-+}
-+
-+psa_status_t psa_fwu_accept(void)
-+{
-+	if (!instance.session)
-+		return PSA_ERROR_BAD_STATE;
-+
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller_interface *caller =3D instance.session->caller;
-+	struct psa_invec in_vec[] =3D {};
-+
-+	status =3D psa_call(caller, TFM_FIRMWARE_UPDATE_SERVICE_HANDLE,
-+			  TFM_FWU_ACCEPT, in_vec, 0,
-+			  NULL, 0);
-+	if (status !=3D PSA_SUCCESS)
-+		EMSG("failed to psa_call: %d", status);
-+
-+	return status;
-+}
-diff --git a/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_=
ipc.h b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h
-new file mode 100644
-index 00000000..867a1c9c
---- /dev/null
-+++ b/components/service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h
-@@ -0,0 +1,49 @@
-+/*
-+ * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_FWU_IPC_H
-+#define PSA_FWU_IPC_H
-+
-+#include <psa/error.h>
-+#include "rpc_caller_session.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * @brief      Initialize a PSA FWU ipc client
-+ *
-+ * A PSA FWU ipc client makes RPC calls to a remote FWU service.
-+ *
-+ * @param[in]  rpc_caller RPC caller instance
-+ *
-+ * @return     A status indicating the success/failure of the operation
-+ */
-+psa_status_t psa_fwu_ipc_init(struct rpc_caller_session *session);
-+
-+/**
-+ * @brief      Deinitialize a PSA FWU ipc client
-+ *
-+ */
-+void psa_fwu_ipc_deinit(void);
-+
-+/**
-+ * @brief      Return the most recent RPC status
-+ *
-+ * May be used to obtain information about an RPC error that resulted
-+ * in an API operation failure
-+ *
-+ * @return     Most recent RPC operation status
-+ */
-+int psa_fwu_rpc_status(void);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_FWU_IPC_H */
-+
-diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
-index 3830f9d6..2bf6b36e 100644
---- a/deployments/se-proxy/infra/corstone1000/infra.cmake
-+++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
-@@ -26,7 +26,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/fwu/provider"
- 		"components/service/fwu/provider/serializer"
- 		"components/service/fwu/psa_fwu_m/agent"
--		"components/service/fwu/psa_fwu_m/interface/stub"
-+		"components/service/fwu/psa_fwu_m/interface/psa_ipc"
- 		"components/service/secure_storage/backend/secure_storage_ipc"
- )
-=20
-diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index 759983b4..547e84bc 100644
---- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-+++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-@@ -14,6 +14,7 @@
- #include <service/crypto/factory/crypto_provider_factory.h>
- #include "service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.h"
- #include "service/fwu/provider/fwu_provider.h"
-+#include "service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h"
- #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
- #include "service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_uuid.h"
- #include <trace.h>
-@@ -134,10 +135,25 @@ struct rpc_service_interface *its_proxy_create(voi=
d)
-=20
- struct rpc_service_interface *fwu_proxy_create(void)
- {
-+	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
- 	static struct update_agent *agent;
- 	static struct fwu_provider fwu_provider =3D { 0 };
-=20
-+	/* Static objects for proxy instance */
-+	static struct rpc_caller_interface rss_comms =3D { 0 };
-+	static struct rpc_caller_session rpc_session =3D { 0 };
-+
-+	rpc_status =3D rss_comms_caller_init(&rss_comms);
-+	if (rpc_status !=3D RPC_SUCCESS)
-+		return NULL;
-+
-+	rpc_status =3D rpc_caller_session_open(&rpc_session, &rss_comms, &dumm=
y_uuid, 0, 0);
-+	if (rpc_status !=3D RPC_SUCCESS)
-+		return NULL;
-+
- 	agent =3D psa_fwu_m_update_agent_init(NULL, 0, 4096);
-+	if (psa_fwu_ipc_init(&rpc_session) !=3D PSA_SUCCESS)
-+		return NULL;
-=20
- 	return fwu_provider_init(&fwu_provider, agent);
- }
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0011-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0011-Load-initial-imag=
e-state-in-PSA-FWU-M-update-agent.patch
deleted file mode 100644
index 2f43369f..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Lo=
ad-initial-image-state-in-PSA-FWU-M-update-agent.patch
+++ /dev/null
@@ -1,188 +0,0 @@
-From 6fb3bead9e0eea3640ad1209347691c2b40512a2 Mon Sep 17 00:00:00 2001
-From: Imre Kis <imre.kis@arm.com>
-Date: Wed, 5 Feb 2025 14:27:45 +0100
-Subject: [PATCH 2/8] Load initial image state in PSA FWU M update agent
-
-Set initial image state based on the image state returned by
-psa_fwu_query. This way the update agent has the correct view of images
-after reboot and it can accept or reject them.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/35155]
-Signed-off-by: Imre Kis <imre.kis@arm.com>
-Change-Id: I150e4fdb4584c8d07f5f1f642ee88197f9cff49b
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- .../psa_fwu_m/agent/psa_fwu_m_update_agent.c  | 23 +++++++--
- .../test/test_psa_fwu_m_update_agent.cpp      | 49 ++++++++++++++++++-
- docs/services/fwu/psa-fwu-m.rst               | 14 +++++-
- 3 files changed, 80 insertions(+), 6 deletions(-)
-
-diff --git a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_age=
nt.c b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
-index 6de9ba71..48b86f6e 100644
---- a/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
-+++ b/components/service/fwu/psa_fwu_m/agent/psa_fwu_m_update_agent.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2024, Arm Limited. All rights reserved.
-+ * Copyright (c) 2024-2025, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -609,8 +609,11 @@ struct update_agent *psa_fwu_m_update_agent_init(
- 	const struct psa_fwu_m_image_mapping image_mapping[], size_t image_cou=
nt,
- 	uint32_t max_payload_size)
- {
-+	psa_status_t psa_status =3D PSA_ERROR_GENERIC_ERROR;
- 	struct psa_fwu_m_update_agent *context =3D NULL;
-+	struct psa_fwu_component_info_t info =3D { 0 };
- 	struct psa_fwu_m_image *images =3D NULL;
-+	enum psa_fwu_m_state state =3D regular;
- 	struct update_agent *agent =3D NULL;
- 	size_t i =3D 0;
-=20
-@@ -637,9 +640,23 @@ struct update_agent *psa_fwu_m_update_agent_init(
- 	}
-=20
- 	for (i =3D 0; i < image_count; i++) {
-+		psa_status =3D psa_fwu_query(image_mapping[i].component, &info);
-+		if (psa_status !=3D PSA_SUCCESS) {
-+			free(images);
-+			free(context);
-+			free(agent);
-+			return NULL;
-+		}
-+
- 		images[i].uuid =3D image_mapping[i].uuid;
- 		images[i].component =3D image_mapping[i].component;
--		images[i].selected_for_staging =3D false;
-+		if (info.state =3D=3D PSA_FWU_TRIAL) {
-+			images[i].selected_for_staging =3D true;
-+			state =3D trial;
-+		} else {
-+			images[i].selected_for_staging =3D false;
-+		}
-+
- 		images[i].read =3D NULL; /* Cannot read images */
- 		images[i].write =3D image_write;
- 	}
-@@ -654,7 +671,7 @@ struct update_agent *psa_fwu_m_update_agent_init(
- 	context->images =3D images;
- 	context->image_count =3D image_count + 1;
- 	context->max_payload_size =3D max_payload_size;
--	context->state =3D regular;
-+	context->state =3D state;
-=20
- 	agent->context =3D context;
- 	agent->interface =3D &interface;
-diff --git a/components/service/fwu/psa_fwu_m/agent/test/test_psa_fwu_m_=
update_agent.cpp b/components/service/fwu/psa_fwu_m/agent/test/test_psa_f=
wu_m_update_agent.cpp
-index de289fff..3805d182 100644
---- a/components/service/fwu/psa_fwu_m/agent/test/test_psa_fwu_m_update_=
agent.cpp
-+++ b/components/service/fwu/psa_fwu_m/agent/test/test_psa_fwu_m_update_=
agent.cpp
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2024, Arm Limited. All rights reserved.
-+ * Copyright (c) 2024-2025, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -14,6 +14,9 @@
-=20
- TEST_GROUP(psa_fwu_m_update_agent) {
- 	TEST_SETUP() {
-+		psa_fwu_component_info_t info =3D {0};
-+		expect_mock_psa_fwu_query(mapping[0].component, &info, PSA_SUCCESS);
-+		expect_mock_psa_fwu_query(mapping[1].component, &info, PSA_SUCCESS);
- 		agent =3D psa_fwu_m_update_agent_init(mapping, 2, 4096);
- 		handle =3D 0;
- 		progress =3D 0;
-@@ -667,4 +670,46 @@ TEST(psa_fwu_m_update_agent, select_previous)
-=20
- 	expect_mock_psa_fwu_reject(0, PSA_SUCCESS);
- 	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_select_previous(agent));
--}
-\ No newline at end of file
-+}
-+
-+TEST(psa_fwu_m_update_agent, boot_in_trial_mode_query_fail) {
-+	psa_fwu_component_info_t info =3D {0};
-+
-+	expect_mock_psa_fwu_query(mapping[0].component, &info, PSA_ERROR_GENER=
IC_ERROR);
-+	POINTERS_EQUAL(NULL, psa_fwu_m_update_agent_init(mapping, 2, 4096));
-+}
-+
-+TEST(psa_fwu_m_update_agent, boot_in_trial_mode_select_previous) {
-+	psa_fwu_component_info_t info0 =3D {0};
-+	psa_fwu_component_info_t info1 =3D {0};
-+
-+	info1.state =3D PSA_FWU_TRIAL;
-+
-+	expect_mock_psa_fwu_query(mapping[0].component, &info0, PSA_SUCCESS);
-+	expect_mock_psa_fwu_query(mapping[1].component, &info1, PSA_SUCCESS);
-+
-+	update_agent *agent =3D psa_fwu_m_update_agent_init(mapping, 2, 4096);
-+
-+	expect_mock_psa_fwu_reject(0, PSA_SUCCESS);
-+	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_select_previous(agent));
-+
-+	psa_fwu_m_update_agent_deinit(agent);
-+}
-+
-+TEST(psa_fwu_m_update_agent, boot_in_trial_mode_accept) {
-+	psa_fwu_component_info_t info0 =3D {0};
-+	psa_fwu_component_info_t info1 =3D {0};
-+
-+	info1.state =3D PSA_FWU_TRIAL;
-+
-+	expect_mock_psa_fwu_query(mapping[0].component, &info0, PSA_SUCCESS);
-+	expect_mock_psa_fwu_query(mapping[1].component, &info1, PSA_SUCCESS);
-+
-+	update_agent *agent =3D psa_fwu_m_update_agent_init(mapping, 2, 4096);
-+
-+	expect_mock_psa_fwu_accept(PSA_SUCCESS);
-+	LONGS_EQUAL(FWU_STATUS_DENIED, update_agent_accept_image(agent, &mappi=
ng[0].uuid));
-+	LONGS_EQUAL(FWU_STATUS_SUCCESS, update_agent_accept_image(agent, &mapp=
ing[1].uuid));
-+
-+	psa_fwu_m_update_agent_deinit(agent);
-+}
-diff --git a/docs/services/fwu/psa-fwu-m.rst b/docs/services/fwu/psa-fwu=
-m.rst
-index 26ffed09..1358015f 100644
---- a/docs/services/fwu/psa-fwu-m.rst
-+++ b/docs/services/fwu/psa-fwu-m.rst
-@@ -44,6 +44,11 @@ The solutions to these differences:
- * Convert the image query result returned by FWU-M to FWU-A format. The=
re are similar field, but this imposes some
-   limitations.
-=20
-+Initialization
-+```````````````
-+
-+The initial image and agent state is determined based on the image stat=
e returned by ``psa_fwu_query()``.
-+
-=20
- ``fwu_discover()``
- ``````````````````
-@@ -71,6 +76,10 @@ agent switches to trial state, so the client can vali=
date the new set of images
-=20
- On calling ``fwu_end_staging()`` the agent calls ``psa_fwu_finish()`` o=
n each selected image, then calls
- ``psa_fwu_install()``. If all images have been accepted (see ``fwu_comm=
it()``) it also calls ``psa_fwu_accept()``.
-+The implementation treats ``PSA_SUCCESS_REBOOT`` and ``PSA_SUCCESS_REST=
ART`` status values as error. In an A+M system the M
-+class side shouldn't restart the system, so calling ``psa_fwu_request_r=
eboot()`` does not fit the system. There's also no
-+PSA FWU A return code for inidicating the restart request to the normal=
 world. If the normal world has to restart the
-+system after ending the staging phase, it has to do it in an implementa=
tion defined way.
-=20
- .. uml:: ../uml/psa_fwu_m_update_agent/fwu_end_staging.puml
-=20
-@@ -136,7 +145,10 @@ calls ``psa_fwu_accept()`` when all images have bee=
n accepted. This results in a
- `````````````````````````
-=20
- Selects previous working state (i.e. rejects the firmware update) and t=
ransitions back to regular state after calling
--``psa_fwu_reject()``.
-+``psa_fwu_reject()``. The implementation treats ``PSA_SUCCESS_REBOOT`` =
and ``PSA_SUCCESS_RESTART`` status values as error.
-+In an A+M system the M class side shouldn't restart the system, so call=
ing ``psa_fwu_request_reboot()`` does not fit the
-+system. There's also no PSA FWU A return code for inidicating the resta=
rt request to the normal world. If the normal
-+world has to restart the system when rejecting the installed firmware, =
it has to do it in an implementation defined way.
-=20
- .. uml:: ../uml/psa_fwu_m_update_agent/fwu_select_previous.puml
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0012-Corstone1000-Define-PSA-FWU-image-mapping-structure.patch b/meta-arm=
-bsp/recipes-security/trusted-services/corstone1000/0012-Corstone1000-Def=
ine-PSA-FWU-image-mapping-structure.patch
deleted file mode 100644
index 17b1f87e..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-Co=
rstone1000-Define-PSA-FWU-image-mapping-structure.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 5344d7d0580ca7f2f2569f388dd6e3cd17a372f2 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 6 Feb 2025 10:26:04 +0000
-Subject: [PATCH 3/8] Corstone1000: Define PSA FWU image mapping structur=
e
-
-This commit involves following changes
-
-1. Define PSA FWU image mapping structure for Corstone-1000.
-This structure is responsible to map specific image guid with
-component number.
-To enable platform-specific handling, service_proxy_factory.c now
-conditionally selects the appropriate image mapping
-based on PLATFORM_IS_FVP. This ensures that both FVP and MPS3
-platforms use the correct GUID and firmware update configuration.
-
-2. Rename RSS to RSE
-
-Upstream-Status: Pending
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
----
- .../infra/corstone1000/corstone1000_config.h  | 28 +++++++++++++++++++
- .../corstone1000/service_proxy_factory.c      | 25 +++++++++++++----
- 2 files changed, 48 insertions(+), 5 deletions(-)
- create mode 100644 deployments/se-proxy/infra/corstone1000/corstone1000=
_config.h
-
-diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_config=
.h b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
-new file mode 100644
-index 00000000..319401f3
---- /dev/null
-+++ b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
-@@ -0,0 +1,28 @@
-+/*
-+ * Copyright (c) 2025, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef CORSTONE1000_CONFIG_H
-+#define CORSTONE1000_CONFIG_H
-+
-+#define FWU_IMAGE_COUNT 1
-+
-+/* Maximum payload size to be transferred at once to Secure Enclave */
-+#define MAX_PAYLOAD_SIZE 4096
-+
-+#define CORSTONE1000_FVP_FULL_CAPSULE_UUID  \
-+{ 0x4e, 0x3a, 0x9f, 0x98, 0xe0, 0x46, 0xd0, 0x4c, 0x98, 0x77, 0xa2, 0x5=
c, 0x70, 0xc0, 0x13, 0x29, }
-+
-+#define CORSTONE1000_MPS3_FULL_CAPSULE_UUID  \
-+{ 0xd1, 0x65, 0x18, 0xdf, 0xfb, 0x90, 0x59, 0x4d, 0x9c, 0x38, 0xc9, 0xf=
2, 0xc1, 0xbb, 0xa8, 0xcc, }
-+
-+/* Image indexes in the UEFI capsule */
-+enum fwu_image_index
-+{
-+	FWU_IMAGE_INDEX_FULL_CAPSULE =3D 1,
-+};
-+
-+#endif /* CORSTONE1000_CONFIG_H */
-diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index ef91efe0..6e5f1221 100644
---- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-+++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021-2024, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2021-2025, Arm Limited and Contributors. All rights re=
served.
-  * Copyright (c) 2021-2023, Linaro Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-@@ -19,6 +19,7 @@
- #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
- #include "service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_uuid.h"
- #include <trace.h>
-+#include "corstone1000_config.h"
-=20
- /* backends */
- #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-@@ -27,6 +28,20 @@
-=20
- static const struct rpc_uuid dummy_uuid =3D { 0 };
-=20
-+static const struct psa_fwu_m_image_mapping img_mapping[FWU_IMAGE_COUNT=
] =3D {
-+#if PLATFORM_IS_FVP
-+	{
-+		.uuid =3D CORSTONE1000_FVP_FULL_CAPSULE_UUID,
-+		.component =3D FWU_IMAGE_INDEX_FULL_CAPSULE
-+	},
-+#else
-+	{
-+		.uuid =3D CORSTONE1000_MPS3_FULL_CAPSULE_UUID,
-+		.component =3D FWU_IMAGE_INDEX_FULL_CAPSULE
-+	},
-+#endif
-+};
-+
- struct rpc_service_interface *attest_proxy_create(void)
- {
- 	struct rpc_service_interface *attest_iface =3D NULL;
-@@ -141,20 +156,20 @@ struct rpc_service_interface *fwu_proxy_create(voi=
d)
- 	static struct fwu_provider fwu_provider =3D { 0 };
-=20
- 	/* Static objects for proxy instance */
--	static struct rpc_caller_interface rss_comms =3D { 0 };
-+	static struct rpc_caller_interface rse_comms =3D { 0 };
- 	static struct rpc_caller_session rpc_session =3D { 0 };
-=20
--	rpc_status =3D rss_comms_caller_init(&rss_comms);
-+	rpc_status =3D rse_comms_caller_init(&rse_comms);
- 	if (rpc_status !=3D RPC_SUCCESS)
- 		return NULL;
-=20
--	rpc_status =3D rpc_caller_session_open(&rpc_session, &rss_comms, &dumm=
y_uuid, 0, 0);
-+	rpc_status =3D rpc_caller_session_open(&rpc_session, &rse_comms, &dumm=
y_uuid, 0, 0);
- 	if (rpc_status !=3D RPC_SUCCESS)
- 		return NULL;
-=20
--	agent =3D psa_fwu_m_update_agent_init(NULL, 0, 4096);
- 	if (psa_fwu_ipc_init(&rpc_session) !=3D PSA_SUCCESS)
- 		return NULL;
-+	agent =3D psa_fwu_m_update_agent_init(img_mapping, FWU_IMAGE_COUNT, MA=
X_PAYLOAD_SIZE);
-=20
- 	return fwu_provider_init(&fwu_provider, agent);
- }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0015-platform-corstone1000-Enable-ESRT-support.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0015-platform-corstone1000-Enab=
le-ESRT-support.patch
deleted file mode 100644
index 18581440..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-pl=
atform-corstone1000-Enable-ESRT-support.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 27d3ce79128478cd163a2db113326c873bda8d08 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Fri, 28 Feb 2025 21:12:56 +0000
-Subject: [PATCH 6/8] platform: corstone1000: Enable ESRT support
-
-Enable ESRT support for Corstone-1000.
-Introduce ESRT image UUID and its component number and
-set TFM_FWU_MAX_DIGEST_SIZE to ESRT data size.
-
-Upstream-Status: Pending
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- .../infra/corstone1000/corstone1000_config.h  |  3 +--
- .../corstone1000/service_proxy_factory.c      | 22 +++++++++++++++++--
- .../providers/arm/corstone1000/platform.cmake |  9 ++++++++
- 3 files changed, 30 insertions(+), 4 deletions(-)
-
-diff --git a/deployments/se-proxy/infra/corstone1000/corstone1000_config=
.h b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
-index 319401f3..4a68c2fa 100644
---- a/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
-+++ b/deployments/se-proxy/infra/corstone1000/corstone1000_config.h
-@@ -8,8 +8,6 @@
- #ifndef CORSTONE1000_CONFIG_H
- #define CORSTONE1000_CONFIG_H
-=20
--#define FWU_IMAGE_COUNT 1
--
- /* Maximum payload size to be transferred at once to Secure Enclave */
- #define MAX_PAYLOAD_SIZE 4096
-=20
-@@ -23,6 +21,7 @@
- enum fwu_image_index
- {
- 	FWU_IMAGE_INDEX_FULL_CAPSULE =3D 1,
-+	FWU_IMAGE_INDEX_ESRT,
- };
-=20
- #endif /* CORSTONE1000_CONFIG_H */
-diff --git a/deployments/se-proxy/infra/corstone1000/service_proxy_facto=
ry.c b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-index 6e5f1221..f0a4853e 100644
---- a/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-+++ b/deployments/se-proxy/infra/corstone1000/service_proxy_factory.c
-@@ -18,6 +18,7 @@
- #include "service/fwu/psa_fwu_m/interface/psa_ipc/psa_fwu_ipc.h"
- #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
- #include "service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_uuid.h"
-+#include <protocols/service/fwu/fwu_proto.h>
- #include <trace.h>
- #include "corstone1000_config.h"
-=20
-@@ -26,9 +27,17 @@
- #include <service/secure_storage/backend/secure_storage_ipc/secure_stor=
age_ipc.h>
- #include <service/attestation/client/psa/iat_client.h>
-=20
-+/* IMAGE_MAPPING_ELEMENT_COUNT includes the number of images to be upda=
ted and ESRT image */
-+#define IMAGE_MAPPING_ELEMENT_COUNT (FWU_IMAGE_CAPSULE_COUNT + 1)
-+
-+/* The index to access the ESRT image in the psa_fwu_m_image_mapping st=
ructure
-+ * collection. The ESRT image is always accessed at the end of the coll=
ection.
-+ */
-+#define IMAGE_MAPPING_ESRT_INDEX (IMAGE_MAPPING_ELEMENT_COUNT - 1)
-+
- static const struct rpc_uuid dummy_uuid =3D { 0 };
-=20
--static const struct psa_fwu_m_image_mapping img_mapping[FWU_IMAGE_COUNT=
] =3D {
-+static struct psa_fwu_m_image_mapping img_mapping[IMAGE_MAPPING_ELEMENT=
_COUNT] =3D {
- #if PLATFORM_IS_FVP
- 	{
- 		.uuid =3D CORSTONE1000_FVP_FULL_CAPSULE_UUID,
-@@ -42,6 +51,13 @@ static const struct psa_fwu_m_image_mapping img_mappi=
ng[FWU_IMAGE_COUNT] =3D {
- #endif
- };
-=20
-+/* Every platform needs to define esrt image mapping, if ESRT image UUI=
D is to be used to extract ESRT data */
-+static void define_esrt_image_mapping()
-+{
-+	uuid_octets_from_canonical(&img_mapping[IMAGE_MAPPING_ESRT_INDEX].uuid=
, EFI_SYSTEM_RESOURCE_TABLE_CANONICAL_UUID);
-+	img_mapping[IMAGE_MAPPING_ESRT_INDEX].component =3D FWU_IMAGE_INDEX_ES=
RT;
-+}
-+
- struct rpc_service_interface *attest_proxy_create(void)
- {
- 	struct rpc_service_interface *attest_iface =3D NULL;
-@@ -169,7 +185,9 @@ struct rpc_service_interface *fwu_proxy_create(void)
-=20
- 	if (psa_fwu_ipc_init(&rpc_session) !=3D PSA_SUCCESS)
- 		return NULL;
--	agent =3D psa_fwu_m_update_agent_init(img_mapping, FWU_IMAGE_COUNT, MA=
X_PAYLOAD_SIZE);
-+
-+	define_esrt_image_mapping();
-+	agent =3D psa_fwu_m_update_agent_init(img_mapping, IMAGE_MAPPING_ELEME=
NT_COUNT, MAX_PAYLOAD_SIZE);
-=20
- 	return fwu_provider_init(&fwu_provider, agent);
- }
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index 60bc208b..db1e9743 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -6,11 +6,18 @@
- # Platform definition for the Corstone-1000 platform.
- #----------------------------------------------------------------------=
---------
-=20
-+# For ESRT v1 details : https://uefi.org/specs/UEFI/2.9_A/23_Firmware_U=
pdate_and_Reporting.html#efi-system-resource-table
-+set(FWU_IMAGE_CAPSULE_COUNT 4 CACHE STRING "Maximum number of FWU Image=
s in a capsule to be updated")
-+set(ESRT_IMAGE_ENTRY_SIZE 40 CACHE STRING "Size of one ESRT v1 Image en=
try structure object")
-+set(ESRT_REMAINING_FIELDS_SIZE 16 CACHE STRING "Size of remaining field=
s of ESRT v1 table structure")
-+math(EXPR TOTAL_ESRT_SIZE "${FWU_IMAGE_CAPSULE_COUNT} * ${ESRT_IMAGE_EN=
TRY_SIZE} + ${ESRT_REMAINING_FIELDS_SIZE}" OUTPUT_FORMAT DECIMAL)
-+
- set(SMM_GATEWAY_MAX_UEFI_VARIABLES 80 CACHE STRING "Maximum UEFI variab=
le count")
- set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 4*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
- set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway SP heap size")
- set(PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE 0x43C0 CACHE STRING "Size of the RS=
E_COMMS_PAYLOAD buffer")
- set(COMMS_MHU_MSG_SIZE 0x4500 CACHE STRING "Max message size that can b=
e transfered via MHU")
-+set(TFM_FWU_MAX_DIGEST_SIZE ${TOTAL_ESRT_SIZE} CACHE STRING "Maximum si=
ze of ESRT entries of all the images in a bank")
-=20
- target_compile_definitions(${TGT} PRIVATE
- 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
-@@ -18,6 +25,8 @@ target_compile_definitions(${TGT} PRIVATE
-  	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
- 	MBEDTLS_ECP_DP_SECP521R1_ENABLED
- 	PLATFORM_IS_FVP=3D${PLATFORM_IS_FVP}
-+	TFM_FWU_MAX_DIGEST_SIZE=3D${TFM_FWU_MAX_DIGEST_SIZE}
-+	FWU_IMAGE_CAPSULE_COUNT=3D${FWU_IMAGE_CAPSULE_COUNT}
- )
-=20
- get_property(_platform_driver_dependencies TARGET ${TGT}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/corstone1000/0021-Align-PSA-Crypto-structs-wi=
th-TF-Mv2.1.1.patch
deleted file mode 100644
index 238037cd..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-Al=
ign-PSA-Crypto-structs-with-TF-Mv2.1.1.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 71da6c0384fb241cadf052968e8dce9c357e4a33 Mon Sep 17 00:00:00 2001
-From: Ali Can Ozaslan <ali.oezaslan@arm.com>
-Date: Tue, 29 Apr 2025 07:52:14 +0000
-Subject: [PATCH] Align PSA Crypto structs with TF-Mv2.1.1
-
-The psa_client_key_attributes_s struct had to be aligned with the
-psa_key_attributes_s struct in TF-M.
-
-Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
-Upstream-Status: Backport [Included in version v1.2.0]
----
- components/service/crypto/include/psa/crypto_client_struct.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/components/service/crypto/include/psa/crypto_client_struct.=
h b/components/service/crypto/include/psa/crypto_client_struct.h
-index ebc4008..f0c8cad 100644
---- a/components/service/crypto/include/psa/crypto_client_struct.h
-+++ b/components/service/crypto/include/psa/crypto_client_struct.h
-@@ -38,7 +38,6 @@ struct psa_client_key_attributes_s
-     uint32_t alg;
-     uint32_t alg2;
-     uint32_t id;
--    int32_t owner_id;
- };
-=20
- #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0, 0, 0, 0, 0, 0}
---=20
-2.34.1
-

