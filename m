Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D93CC7EE2D
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23146.1684495474234784881
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA3121FB;
	Fri, 19 May 2023 04:25:18 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 455B33F762;
	Fri, 19 May 2023 04:24:33 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 12/16] arm-bsp/trusted-services: remove merged patches for corstone1000
Date: Fri, 19 May 2023 13:23:56 +0200
Message-Id: <20230519112400.340-12-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4676

From: Rui Miguel Silva <rui.silva@linaro.org>

Patch related with the changes to support the in/out_vec modifications
in TF-M v1.7 was merged in upstream trusted-services integration branch.
So, drop this 3 out of tree patches not needed to be applied any more.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 ...v1.7-alignment-Align-PSA-Crypto-SIDs.patch | 407 -----------
 ...gnment-Align-crypto-iovec-definition.patch | 656 ------------------
 ...ignment-PSA-crypto-client-in-out_vec.patch | 118 ----
 .../trusted-services/ts-arm-platforms.inc     |   3 -
 4 files changed, 1184 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0004-TF-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-TF-Mv1.7-alignment-Align-crypto-iovec-definition.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0006-TF-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0004-TF-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/corstone1000/0004-TF-Mv1.7-alignment-Align-PS=
A-Crypto-SIDs.patch
deleted file mode 100644
index 628d8682..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-TF=
-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch
+++ /dev/null
@@ -1,407 +0,0 @@
-From c294197b17358b20c75757b9a06d628f43cd7884 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Thu, 9 Feb 2023 00:22:40 +0000
-Subject: [PATCH 4/6] TF-Mv1.7 alignment: Align PSA Crypto SIDs
-
-This patch is to change the PSA Crypto SIDs to match the values of the
-PSA Crypto SID definitions in TF-M v1.7 running on the secure enclave
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../service/common/include/psa/crypto_sid.h   | 241 ++++++++++++++++++
- components/service/common/include/psa/sid.h   |  76 +-----
- .../caller/psa_ipc/crypto_caller_sign_hash.h  |   4 +-
- .../psa_ipc/crypto_caller_verify_hash.h       |   4 +-
- 4 files changed, 248 insertions(+), 77 deletions(-)
- create mode 100644 components/service/common/include/psa/crypto_sid.h
-
-diff --git a/components/service/common/include/psa/crypto_sid.h b/compon=
ents/service/common/include/psa/crypto_sid.h
-new file mode 100644
-index 000000000000..5b05f46d7d72
---- /dev/null
-+++ b/components/service/common/include/psa/crypto_sid.h
-@@ -0,0 +1,241 @@
-+/*
-+ * Copyright (c) 2023, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __PSA_CRYPTO_SID_H__
-+#define __PSA_CRYPTO_SID_H__
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+#include <stdint.h>
-+
-+/**
-+ * \brief Type associated to the group of a function encoding. There ca=
n be
-+ *        nine groups (Random, Key management, Hash, MAC, Cipher, AEAD,
-+ *        Asym sign, Asym encrypt, Key derivation).
-+ */
-+enum tfm_crypto_group_id {
-+    TFM_CRYPTO_GROUP_ID_RANDOM =3D 0x0,
-+    TFM_CRYPTO_GROUP_ID_KEY_MANAGEMENT,
-+    TFM_CRYPTO_GROUP_ID_HASH,
-+    TFM_CRYPTO_GROUP_ID_MAC,
-+    TFM_CRYPTO_GROUP_ID_CIPHER,
-+    TFM_CRYPTO_GROUP_ID_AEAD,
-+    TFM_CRYPTO_GROUP_ID_ASYM_SIGN,
-+    TFM_CRYPTO_GROUP_ID_ASYM_ENCRYPT,
-+    TFM_CRYPTO_GROUP_ID_KEY_DERIVATION,
-+};
-+
-+/* X macro describing each of the available PSA Crypto APIs */
-+#define KEY_MANAGEMENT_FUNCS                       \
-+    X(TFM_CRYPTO_GET_KEY_ATTRIBUTES)               \
-+    X(TFM_CRYPTO_RESET_KEY_ATTRIBUTES)             \
-+    X(TFM_CRYPTO_OPEN_KEY)                         \
-+    X(TFM_CRYPTO_CLOSE_KEY)                        \
-+    X(TFM_CRYPTO_IMPORT_KEY)                       \
-+    X(TFM_CRYPTO_DESTROY_KEY)                      \
-+    X(TFM_CRYPTO_EXPORT_KEY)                       \
-+    X(TFM_CRYPTO_EXPORT_PUBLIC_KEY)                \
-+    X(TFM_CRYPTO_PURGE_KEY)                        \
-+    X(TFM_CRYPTO_COPY_KEY)                         \
-+    X(TFM_CRYPTO_GENERATE_KEY)
-+
-+#define HASH_FUNCS                                 \
-+    X(TFM_CRYPTO_HASH_COMPUTE)                     \
-+    X(TFM_CRYPTO_HASH_COMPARE)                     \
-+    X(TFM_CRYPTO_HASH_SETUP)                       \
-+    X(TFM_CRYPTO_HASH_UPDATE)                      \
-+    X(TFM_CRYPTO_HASH_CLONE)                       \
-+    X(TFM_CRYPTO_HASH_FINISH)                      \
-+    X(TFM_CRYPTO_HASH_VERIFY)                      \
-+    X(TFM_CRYPTO_HASH_ABORT)
-+
-+#define MAC_FUNCS                                  \
-+    X(TFM_CRYPTO_MAC_COMPUTE)                      \
-+    X(TFM_CRYPTO_MAC_VERIFY)                       \
-+    X(TFM_CRYPTO_MAC_SIGN_SETUP)                   \
-+    X(TFM_CRYPTO_MAC_VERIFY_SETUP)                 \
-+    X(TFM_CRYPTO_MAC_UPDATE)                       \
-+    X(TFM_CRYPTO_MAC_SIGN_FINISH)                  \
-+    X(TFM_CRYPTO_MAC_VERIFY_FINISH)                \
-+    X(TFM_CRYPTO_MAC_ABORT)
-+
-+#define CIPHER_FUNCS                               \
-+    X(TFM_CRYPTO_CIPHER_ENCRYPT)                   \
-+    X(TFM_CRYPTO_CIPHER_DECRYPT)                   \
-+    X(TFM_CRYPTO_CIPHER_ENCRYPT_SETUP)             \
-+    X(TFM_CRYPTO_CIPHER_DECRYPT_SETUP)             \
-+    X(TFM_CRYPTO_CIPHER_GENERATE_IV)               \
-+    X(TFM_CRYPTO_CIPHER_SET_IV)                    \
-+    X(TFM_CRYPTO_CIPHER_UPDATE)                    \
-+    X(TFM_CRYPTO_CIPHER_FINISH)                    \
-+    X(TFM_CRYPTO_CIPHER_ABORT)
-+
-+#define AEAD_FUNCS                                 \
-+    X(TFM_CRYPTO_AEAD_ENCRYPT)                     \
-+    X(TFM_CRYPTO_AEAD_DECRYPT)                     \
-+    X(TFM_CRYPTO_AEAD_ENCRYPT_SETUP)               \
-+    X(TFM_CRYPTO_AEAD_DECRYPT_SETUP)               \
-+    X(TFM_CRYPTO_AEAD_GENERATE_NONCE)              \
-+    X(TFM_CRYPTO_AEAD_SET_NONCE)                   \
-+    X(TFM_CRYPTO_AEAD_SET_LENGTHS)                 \
-+    X(TFM_CRYPTO_AEAD_UPDATE_AD)                   \
-+    X(TFM_CRYPTO_AEAD_UPDATE)                      \
-+    X(TFM_CRYPTO_AEAD_FINISH)                      \
-+    X(TFM_CRYPTO_AEAD_VERIFY)                      \
-+    X(TFM_CRYPTO_AEAD_ABORT)
-+
-+#define ASYMMETRIC_SIGN_FUNCS                      \
-+    X(TFM_CRYPTO_ASYMMETRIC_SIGN_MESSAGE)          \
-+    X(TFM_CRYPTO_ASYMMETRIC_VERIFY_MESSAGE)        \
-+    X(TFM_CRYPTO_ASYMMETRIC_SIGN_HASH)             \
-+    X(TFM_CRYPTO_ASYMMETRIC_VERIFY_HASH)
-+
-+#define AYSMMETRIC_ENCRYPT_FUNCS                   \
-+    X(TFM_CRYPTO_ASYMMETRIC_ENCRYPT)               \
-+    X(TFM_CRYPTO_ASYMMETRIC_DECRYPT)
-+
-+#define KEY_DERIVATION_FUNCS                       \
-+    X(TFM_CRYPTO_RAW_KEY_AGREEMENT)                \
-+    X(TFM_CRYPTO_KEY_DERIVATION_SETUP)             \
-+    X(TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY)      \
-+    X(TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY)      \
-+    X(TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES)       \
-+    X(TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY)         \
-+    X(TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT)     \
-+    X(TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES)      \
-+    X(TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY)        \
-+    X(TFM_CRYPTO_KEY_DERIVATION_ABORT)
-+
-+#define RANDOM_FUNCS                               \
-+    X(TFM_CRYPTO_GENERATE_RANDOM)
-+
-+/*
-+ * Define function IDs in each group. The function ID will be encoded i=
nto
-+ * tfm_crypto_func_sid below.
-+ * Each group is defined as a dedicated enum in case the total number o=
f
-+ * PSA Crypto APIs exceeds 256.
-+ */
-+#define X(func_id)    func_id,
-+enum tfm_crypto_key_management_func_id {
-+    KEY_MANAGEMENT_FUNCS
-+};
-+enum tfm_crypto_hash_func_id {
-+    HASH_FUNCS
-+};
-+enum tfm_crypto_mac_func_id {
-+    MAC_FUNCS
-+};
-+enum tfm_crypto_cipher_func_id {
-+    CIPHER_FUNCS
-+};
-+enum tfm_crypto_aead_func_id {
-+    AEAD_FUNCS
-+};
-+enum tfm_crypto_asym_sign_func_id {
-+    ASYMMETRIC_SIGN_FUNCS
-+};
-+enum tfm_crypto_asym_encrypt_func_id {
-+    AYSMMETRIC_ENCRYPT_FUNCS
-+};
-+enum tfm_crypto_key_derivation_func_id {
-+    KEY_DERIVATION_FUNCS
-+};
-+enum tfm_crypto_random_func_id {
-+    RANDOM_FUNCS
-+};
-+#undef X
-+
-+#define FUNC_ID(func_id)    (((func_id) & 0xFF) << 8)
-+
-+/*
-+ * Numerical progressive value identifying a function API exposed throu=
gh
-+ * the interfaces (S or NS). It's used to dispatch the requests from S/=
NS
-+ * to the corresponding API implementation in the Crypto service backen=
d.
-+ *
-+ * Each function SID is encoded as uint16_t.
-+ *     |  Func ID  |  Group ID |
-+ *     15         8 7          0
-+ * Func ID is defined in each group func_id enum above
-+ * Group ID is defined in tfm_crypto_group_id.
-+ */
-+enum tfm_crypto_func_sid {
-+
-+#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
-+                                   (TFM_CRYPTO_GROUP_ID_KEY_MANAGEMENT =
& 0xFF)),
-+
-+    KEY_MANAGEMENT_FUNCS
-+
-+#undef X
-+#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
-+                                            (TFM_CRYPTO_GROUP_ID_HASH &=
 0xFF)),
-+    HASH_FUNCS
-+
-+#undef X
-+#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
-+                                            (TFM_CRYPTO_GROUP_ID_MAC & =
0xFF)),
-+    MAC_FUNCS
-+
-+#undef X
-+#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
-+                                           (TFM_CRYPTO_GROUP_ID_CIPHER =
& 0xFF)),
-+    CIPHER_FUNCS
-+
-+#undef X
-+#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
-+                                             (TFM_CRYPTO_GROUP_ID_AEAD =
& 0xFF)),
-+    AEAD_FUNCS
-+
-+#undef X
-+#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
-+                                        (TFM_CRYPTO_GROUP_ID_ASYM_SIGN =
& 0xFF)),
-+    ASYMMETRIC_SIGN_FUNCS
-+
-+#undef X
-+#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
-+                                     (TFM_CRYPTO_GROUP_ID_ASYM_ENCRYPT =
& 0xFF)),
-+    AYSMMETRIC_ENCRYPT_FUNCS
-+
-+#undef X
-+#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
-+                                   (TFM_CRYPTO_GROUP_ID_KEY_DERIVATION =
& 0xFF)),
-+    KEY_DERIVATION_FUNCS
-+
-+#undef X
-+#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
-+                                           (TFM_CRYPTO_GROUP_ID_RANDOM =
& 0xFF)),
-+    RANDOM_FUNCS
-+
-+};
-+#undef X
-+
-+/**
-+ * \brief Define an invalid value for an SID
-+ *
-+ */
-+#define TFM_CRYPTO_SID_INVALID (~0x0u)
-+
-+/**
-+ * \brief This value is used to mark an handle as invalid.
-+ *
-+ */
-+#define TFM_CRYPTO_INVALID_HANDLE (0x0u)
-+
-+/**
-+ * \brief Define miscellaneous literal constants that are used in the s=
ervice
-+ *
-+ */
-+enum {
-+    TFM_CRYPTO_NOT_IN_USE =3D 0,
-+    TFM_CRYPTO_IN_USE =3D 1
-+};
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __PSA_CRYPTO_SID_H__ */
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 8e2c6bdf2919..5aaa659d49a0 100644
---- a/components/service/common/include/psa/sid.h
-+++ b/components/service/common/include/psa/sid.h
-@@ -12,6 +12,9 @@
- extern "C" {
- #endif
-=20
-+/******** PSA Crypto SIDs ********/
-+#include "crypto_sid.h"
-+
- /******** TFM_SP_PS ********/
- #define TFM_PROTECTED_STORAGE_SERVICE_SID                          (0x0=
0000060U)
- #define TFM_PROTECTED_STORAGE_SERVICE_VERSION                      (1U)
-@@ -37,79 +40,6 @@ extern "C" {
- #define TFM_CRYPTO_VERSION                                         (1U)
- #define TFM_CRYPTO_HANDLE                                          (0x4=
0000100U)
-=20
--/**
-- * \brief Define a progressive numerical value for each SID which can b=
e used
-- *        when dispatching the requests to the service
-- */
--enum {
--    TFM_CRYPTO_GET_KEY_ATTRIBUTES_SID =3D (0u),
--    TFM_CRYPTO_RESET_KEY_ATTRIBUTES_SID,
--    TFM_CRYPTO_OPEN_KEY_SID,
--    TFM_CRYPTO_CLOSE_KEY_SID,
--    TFM_CRYPTO_IMPORT_KEY_SID,
--    TFM_CRYPTO_DESTROY_KEY_SID,
--    TFM_CRYPTO_EXPORT_KEY_SID,
--    TFM_CRYPTO_EXPORT_PUBLIC_KEY_SID,
--    TFM_CRYPTO_PURGE_KEY_SID,
--    TFM_CRYPTO_COPY_KEY_SID,
--    TFM_CRYPTO_HASH_COMPUTE_SID,
--    TFM_CRYPTO_HASH_COMPARE_SID,
--    TFM_CRYPTO_HASH_SETUP_SID,
--    TFM_CRYPTO_HASH_UPDATE_SID,
--    TFM_CRYPTO_HASH_FINISH_SID,
--    TFM_CRYPTO_HASH_VERIFY_SID,
--    TFM_CRYPTO_HASH_ABORT_SID,
--    TFM_CRYPTO_HASH_CLONE_SID,
--    TFM_CRYPTO_MAC_COMPUTE_SID,
--    TFM_CRYPTO_MAC_VERIFY_SID,
--    TFM_CRYPTO_MAC_SIGN_SETUP_SID,
--    TFM_CRYPTO_MAC_VERIFY_SETUP_SID,
--    TFM_CRYPTO_MAC_UPDATE_SID,
--    TFM_CRYPTO_MAC_SIGN_FINISH_SID,
--    TFM_CRYPTO_MAC_VERIFY_FINISH_SID,
--    TFM_CRYPTO_MAC_ABORT_SID,
--    TFM_CRYPTO_CIPHER_ENCRYPT_SID,
--    TFM_CRYPTO_CIPHER_DECRYPT_SID,
--    TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID,
--    TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID,
--    TFM_CRYPTO_CIPHER_GENERATE_IV_SID,
--    TFM_CRYPTO_CIPHER_SET_IV_SID,
--    TFM_CRYPTO_CIPHER_UPDATE_SID,
--    TFM_CRYPTO_CIPHER_FINISH_SID,
--    TFM_CRYPTO_CIPHER_ABORT_SID,
--    TFM_CRYPTO_AEAD_ENCRYPT_SID,
--    TFM_CRYPTO_AEAD_DECRYPT_SID,
--    TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
--    TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
--    TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
--    TFM_CRYPTO_AEAD_SET_NONCE_SID,
--    TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
--    TFM_CRYPTO_AEAD_UPDATE_AD_SID,
--    TFM_CRYPTO_AEAD_UPDATE_SID,
--    TFM_CRYPTO_AEAD_FINISH_SID,
--    TFM_CRYPTO_AEAD_VERIFY_SID,
--    TFM_CRYPTO_AEAD_ABORT_SID,
--    TFM_CRYPTO_SIGN_MESSAGE_SID,
--    TFM_CRYPTO_VERIFY_MESSAGE_SID,
--    TFM_CRYPTO_SIGN_HASH_SID,
--    TFM_CRYPTO_VERIFY_HASH_SID,
--    TFM_CRYPTO_ASYMMETRIC_ENCRYPT_SID,
--    TFM_CRYPTO_ASYMMETRIC_DECRYPT_SID,
--    TFM_CRYPTO_KEY_DERIVATION_SETUP_SID,
--    TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY_SID,
--    TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY_SID,
--    TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES_SID,
--    TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY_SID,
--    TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT_SID,
--    TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES_SID,
--    TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY_SID,
--    TFM_CRYPTO_KEY_DERIVATION_ABORT_SID,
--    TFM_CRYPTO_RAW_KEY_AGREEMENT_SID,
--    TFM_CRYPTO_GENERATE_RANDOM_SID,
--    TFM_CRYPTO_GENERATE_KEY_SID,
--    TFM_CRYPTO_SID_MAX,
--};
--
- /******** TFM_SP_PLATFORM ********/
- #define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x0=
0000040U)
- #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_sign_hash.h
-index 29bd56e60708..bebfe05c7c49 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
-@@ -37,7 +37,7 @@ static inline psa_status_t crypto_caller_sign_hash(str=
uct service_client *contex
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_SIGN_HASH_SID,
-+		.sfn_id =3D TFM_CRYPTO_ASYMMETRIC_SIGN_HASH_SID,
- 		.key_id =3D id,
- 		.alg =3D alg,
- 	};
-@@ -70,7 +70,7 @@ static inline psa_status_t crypto_caller_sign_message(=
struct service_client *con
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_SIGN_MESSAGE_SID,
-+		.sfn_id =3D TFM_CRYPTO_ASYMMETRIC_SIGN_MESSAGE_SID,
- 		.key_id =3D id,
- 		.alg =3D alg,
- 	};
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_verify_hash.h
-index 66281d588626..d0a3850678cb 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
-@@ -63,7 +63,7 @@ static inline psa_status_t crypto_caller_verify_hash(s=
truct service_client *cont
- {
-=20
- 	return crypto_caller_common(context,id,alg,hash,hash_length,
--			signature,signature_length, TFM_CRYPTO_VERIFY_HASH_SID);
-+			signature,signature_length, TFM_CRYPTO_ASYMMETRIC_VERIFY_HASH_SID);
- }
-=20
- static inline psa_status_t crypto_caller_verify_message(struct service_=
client *context,
-@@ -76,7 +76,7 @@ static inline psa_status_t crypto_caller_verify_messag=
e(struct service_client *c
- {
-=20
- 	return crypto_caller_common(context,id,alg,hash,hash_length,
--			signature,signature_length, TFM_CRYPTO_VERIFY_MESSAGE_SID);
-+			signature,signature_length, TFM_CRYPTO_ASYMMETRIC_VERIFY_MESSAGE_SID=
);
- }
-=20
- #ifdef __cplusplus
---=20
-2.40.0
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0005-TF-Mv1.7-alignment-Align-crypto-iovec-definition.patch b/meta-arm-bs=
p/recipes-security/trusted-services/corstone1000/0005-TF-Mv1.7-alignment-=
Align-crypto-iovec-definition.patch
deleted file mode 100644
index 5ed36faf..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-TF=
-Mv1.7-alignment-Align-crypto-iovec-definition.patch
+++ /dev/null
@@ -1,656 +0,0 @@
-From 355e9e1425bbe1d4f27eadf81b91ad047d7b42b5 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Thu, 9 Feb 2023 00:01:06 +0000
-Subject: [PATCH 5/6] TF-Mv1.7 alignment: Align crypto iovec definition
-
-This patch is to align psa_ipc_crypto_pack_iovec with TF-M v1.7
-And propagate changes accross psa_ipc functions
-More accuratly change sfn_id to function_id
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../backend/psa_ipc/crypto_ipc_backend.h      | 34 +++++++++----------
- .../caller/psa_ipc/crypto_caller_aead.h       | 24 ++++++-------
- .../crypto_caller_asymmetric_decrypt.h        |  2 +-
- .../crypto_caller_asymmetric_encrypt.h        |  2 +-
- .../caller/psa_ipc/crypto_caller_cipher.h     | 14 ++++----
- .../caller/psa_ipc/crypto_caller_copy_key.h   |  2 +-
- .../psa_ipc/crypto_caller_destroy_key.h       |  2 +-
- .../caller/psa_ipc/crypto_caller_export_key.h |  2 +-
- .../psa_ipc/crypto_caller_export_public_key.h |  2 +-
- .../psa_ipc/crypto_caller_generate_key.h      |  2 +-
- .../psa_ipc/crypto_caller_generate_random.h   |  2 +-
- .../crypto_caller_get_key_attributes.h        |  2 +-
- .../caller/psa_ipc/crypto_caller_hash.h       | 12 +++----
- .../caller/psa_ipc/crypto_caller_import_key.h |  2 +-
- .../psa_ipc/crypto_caller_key_derivation.h    | 20 +++++------
- .../client/caller/psa_ipc/crypto_caller_mac.h | 12 +++----
- .../caller/psa_ipc/crypto_caller_purge_key.h  |  2 +-
- .../caller/psa_ipc/crypto_caller_sign_hash.h  |  4 +--
- .../psa_ipc/crypto_caller_verify_hash.h       |  4 +--
- 19 files changed, 73 insertions(+), 73 deletions(-)
-
-diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-index 678a35810d71..47243648a99f 100644
---- a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-+++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-@@ -28,23 +28,23 @@ struct psa_ipc_crypto_aead_pack_input {
- };
-=20
- struct psa_ipc_crypto_pack_iovec {
--	uint32_t sfn_id;             /*!< Secure function ID used to dispatch =
the
--				      *   request
--				      */
--	uint16_t step;               /*!< Key derivation step */
--	psa_key_id_t key_id;         /*!< Key id */
--	psa_algorithm_t alg;         /*!< Algorithm */
--	uint32_t op_handle;          /*!< Frontend context handle associated t=
o a
--				      *   multipart operation
--				      */
--	uint32_t capacity;             /*!< Key derivation capacity */
--	uint32_t ad_length;            /*!< Additional Data length for multipa=
rt AEAD */
--	uint32_t plaintext_length;     /*!< Plaintext length for multipart AEA=
D */
--	struct psa_ipc_crypto_aead_pack_input aead_in; /*!< FixMe: Temporarily=
 used for
--							    *   AEAD until the API is
--							    *   restructured
--							    */
--};
-+    psa_key_id_t key_id;     /*!< Key id */
-+    psa_algorithm_t alg;     /*!< Algorithm */
-+    uint32_t op_handle;      /*!< Frontend context handle associated to=
 a
-+                              *   multipart operation
-+                              */
-+    uint32_t capacity;         /*!< Key derivation capacity */
-+    uint32_t ad_length;        /*!< Additional Data length for multipar=
t AEAD */
-+    uint32_t plaintext_length; /*!< Plaintext length for multipart AEAD=
 */
-+
-+    struct psa_ipc_crypto_aead_pack_input aead_in; /*!< Packs AEAD-rela=
ted inputs */
-+
-+    uint16_t function_id;    /*!< Used to identify the function in the
-+                              *   API dispatcher to the service backend
-+                              *   See tfm_crypto_func_sid for detail
-+                              */
-+    uint16_t step;           /*!< Key derivation step */
-+}__packed;
-=20
- #define iov_size sizeof(struct psa_ipc_crypto_pack_iovec)
-=20
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_aead.h
-index 66a2bc958687..f63996a8aad3 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-@@ -44,7 +44,7 @@ static inline psa_status_t crypto_caller_aead_encrypt(
- 	size_t in_len;
- 	int i;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SID,
- 		.key_id =3D key,
- 		.alg =3D alg,
- 		.aead_in =3D { .nonce =3D {0}, .nonce_length =3D nonce_length },
-@@ -105,7 +105,7 @@ static inline psa_status_t crypto_caller_aead_decryp=
t(
- 	size_t in_len;
- 	int i;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_DECRYPT_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_DECRYPT_SID,
- 		.key_id =3D key,
- 		.alg =3D alg,
- 		.aead_in =3D { .nonce =3D {0}, .nonce_length =3D nonce_length },
-@@ -156,7 +156,7 @@ static inline psa_status_t crypto_caller_aead_encryp=
t_setup(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
- 		.key_id =3D key,
- 		.alg =3D alg,
- 		.op_handle =3D (*op_handle),
-@@ -186,7 +186,7 @@ static inline psa_status_t crypto_caller_aead_decryp=
t_setup(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
- 		.key_id =3D key,
- 		.alg =3D alg,
- 		.op_handle =3D (*op_handle),
-@@ -217,7 +217,7 @@ static inline psa_status_t crypto_caller_aead_genera=
te_nonce(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
- 		.op_handle =3D op_handle,
- 	};
-=20
-@@ -248,7 +248,7 @@ static inline psa_status_t crypto_caller_aead_set_no=
nce(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_SET_NONCE_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_SET_NONCE_SID,
- 		.op_handle =3D op_handle,
- 	};
-=20
-@@ -277,7 +277,7 @@ static inline psa_status_t crypto_caller_aead_set_le=
ngths(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
- 		.ad_length =3D ad_length,
- 		.plaintext_length =3D plaintext_length,
- 		.op_handle =3D op_handle,
-@@ -307,7 +307,7 @@ static inline psa_status_t crypto_caller_aead_update=
_ad(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_AD_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_UPDATE_AD_SID,
- 		.op_handle =3D op_handle,
- 	};
-=20
-@@ -349,7 +349,7 @@ static inline psa_status_t crypto_caller_aead_update=
(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_UPDATE_SID,
- 		.op_handle =3D op_handle,
- 	};
-=20
-@@ -395,7 +395,7 @@ static inline psa_status_t crypto_caller_aead_finish=
(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_FINISH_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_FINISH_SID,
- 		.op_handle =3D op_handle,
- 	};
-=20
-@@ -448,7 +448,7 @@ static inline psa_status_t crypto_caller_aead_verify=
(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_VERIFY_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_VERIFY_SID,
- 		.op_handle =3D op_handle,
- 	};
-=20
-@@ -494,7 +494,7 @@ static inline psa_status_t crypto_caller_aead_abort(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_AEAD_ABORT_SID,
-+		.function_id =3D TFM_CRYPTO_AEAD_ABORT_SID,
- 		.op_handle =3D op_handle,
- 	};
-=20
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_asymmetric_decrypt.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_asymmetric_decrypt.h
-index d3e43b25f7e5..03682e7cdaa0 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_decrypt.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_decrypt.h
-@@ -38,7 +38,7 @@ static inline psa_status_t crypto_caller_asymmetric_de=
crypt(
- 	psa_status_t status;
- 	size_t in_len;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_ASYMMETRIC_DECRYPT_SID,
-+		.function_id =3D TFM_CRYPTO_ASYMMETRIC_DECRYPT_SID,
- 		.key_id =3D id,
- 		.alg =3D alg,
- 	};
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_asymmetric_encrypt.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_asymmetric_encrypt.h
-index 124b088f94d8..60f5770e3a1e 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_encrypt.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_encrypt.h
-@@ -38,7 +38,7 @@ static inline psa_status_t crypto_caller_asymmetric_en=
crypt(
- 	psa_status_t status;
- 	size_t in_len;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_ASYMMETRIC_ENCRYPT_SID,
-+		.function_id =3D TFM_CRYPTO_ASYMMETRIC_ENCRYPT_SID,
- 		.key_id =3D id,
- 		.alg =3D alg,
- 	};
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h b/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h
-index 8d906aeef2a0..4f885f3445ab 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_ciph=
er.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_ciph=
er.h
-@@ -34,7 +34,7 @@ static inline psa_status_t crypto_caller_cipher_encryp=
t_setup(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID,
-+		.function_id =3D TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID,
- 		.key_id =3D key,
- 		.alg =3D alg,
- 		.op_handle =3D *op_handle,
-@@ -62,7 +62,7 @@ static inline psa_status_t crypto_caller_cipher_decryp=
t_setup(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID,
-+		.function_id =3D TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID,
- 		.key_id =3D key,
- 		.alg =3D alg,
- 		.op_handle =3D *op_handle,
-@@ -91,7 +91,7 @@ static inline psa_status_t crypto_caller_cipher_genera=
te_iv(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_CIPHER_GENERATE_IV_SID,
-+		.function_id =3D TFM_CRYPTO_CIPHER_GENERATE_IV_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -120,7 +120,7 @@ static inline psa_status_t crypto_caller_cipher_set_=
iv(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_CIPHER_SET_IV_SID,
-+		.function_id =3D TFM_CRYPTO_CIPHER_SET_IV_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -150,7 +150,7 @@ static inline psa_status_t crypto_caller_cipher_upda=
te(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_CIPHER_UPDATE_SID,
-+		.function_id =3D TFM_CRYPTO_CIPHER_UPDATE_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -181,7 +181,7 @@ static inline psa_status_t crypto_caller_cipher_fini=
sh(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_CIPHER_FINISH_SID,
-+		.function_id =3D TFM_CRYPTO_CIPHER_FINISH_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -208,7 +208,7 @@ static inline psa_status_t crypto_caller_cipher_abor=
t(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_CIPHER_ABORT_SID,
-+		.function_id =3D TFM_CRYPTO_CIPHER_ABORT_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_copy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_ca=
ller_copy_key.h
-index b2e57e1e7255..71cf4381dfe5 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy=
_key.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy=
_key.h
-@@ -33,7 +33,7 @@ static inline psa_status_t crypto_caller_copy_key(stru=
ct service_client *context
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_COPY_KEY_SID,
-+		.function_id =3D TFM_CRYPTO_COPY_KEY_SID,
- 		.key_id =3D source_key,
- 	};
- 	struct psa_invec in_vec[] =3D {
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_destroy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_destroy_key.h
-index 94a01580b482..85bd2b4cde97 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_dest=
roy_key.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_dest=
roy_key.h
-@@ -31,7 +31,7 @@ static inline psa_status_t crypto_caller_destroy_key(s=
truct service_client *cont
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_DESTROY_KEY_SID,
-+		.function_id =3D TFM_CRYPTO_DESTROY_KEY_SID,
- 		.key_id =3D id,
- 	};
- 	struct psa_invec in_vec[] =3D {
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_export_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_=
caller_export_key.h
-index b6dfda38bc23..5e9543085139 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_key.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_key.h
-@@ -34,7 +34,7 @@ static inline psa_status_t crypto_caller_export_key(st=
ruct service_client *conte
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_EXPORT_KEY_SID,
-+		.function_id =3D TFM_CRYPTO_EXPORT_KEY_SID,
- 		.key_id =3D id,
- 	};
- 	struct psa_invec in_vec[] =3D {
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_export_public_key.h b/components/service/crypto/client/caller/psa_ipc/=
crypto_caller_export_public_key.h
-index d154db89bf0b..349dc6cb949c 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_public_key.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_public_key.h
-@@ -34,7 +34,7 @@ static inline psa_status_t crypto_caller_export_public=
_key(struct service_client
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_EXPORT_PUBLIC_KEY_SID,
-+		.function_id =3D TFM_CRYPTO_EXPORT_PUBLIC_KEY_SID,
- 		.key_id =3D id,
- 	};
- 	struct psa_invec in_vec[] =3D {
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_generate_key.h b/components/service/crypto/client/caller/psa_ipc/crypt=
o_caller_generate_key.h
-index 41dc3a1806ec..31c6901ab88a 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_key.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_key.h
-@@ -32,7 +32,7 @@ static inline psa_status_t crypto_caller_generate_key(=
struct service_client *con
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_GENERATE_KEY_SID,
-+		.function_id =3D TFM_CRYPTO_GENERATE_KEY_SID,
- 	};
- 	struct psa_invec in_vec[] =3D {
- 		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_generate_random.h b/components/service/crypto/client/caller/psa_ipc/cr=
ypto_caller_generate_random.h
-index 50437327ec2a..ce51ded30b1f 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_random.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_random.h
-@@ -32,7 +32,7 @@ static inline psa_status_t crypto_caller_generate_rand=
om(struct service_client *
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_GENERATE_RANDOM_SID,
-+		.function_id =3D TFM_CRYPTO_GENERATE_RANDOM_SID,
- 	};
- 	struct psa_invec in_vec[] =3D {
- 		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_get_key_attributes.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_get_key_attributes.h
-index 3531bd06147f..ea90af7df782 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_=
key_attributes.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_=
key_attributes.h
-@@ -33,7 +33,7 @@ static inline psa_status_t crypto_caller_get_key_attri=
butes(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_GET_KEY_ATTRIBUTES_SID,
-+		.function_id =3D TFM_CRYPTO_GET_KEY_ATTRIBUTES_SID,
- 		.key_id =3D key,
- 	};
- 	struct psa_invec in_vec[] =3D {
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_hash.h
-index f63e9812af6c..f7ffaf38c7d0 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash=
.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash=
.h
-@@ -33,7 +33,7 @@ static inline psa_status_t crypto_caller_hash_setup(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_HASH_SETUP_SID,
-+		.function_id =3D TFM_CRYPTO_HASH_SETUP_SID,
- 		.alg =3D alg,
- 		.op_handle =3D *op_handle,
- 	};
-@@ -60,7 +60,7 @@ static inline psa_status_t crypto_caller_hash_update(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_HASH_UPDATE_SID,
-+		.function_id =3D TFM_CRYPTO_HASH_UPDATE_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -88,7 +88,7 @@ static inline psa_status_t crypto_caller_hash_finish(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_HASH_FINISH_SID,
-+		.function_id =3D TFM_CRYPTO_HASH_FINISH_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -115,7 +115,7 @@ static inline psa_status_t crypto_caller_hash_abort(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_HASH_ABORT_SID,
-+		.function_id =3D TFM_CRYPTO_HASH_ABORT_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -141,7 +141,7 @@ static inline psa_status_t crypto_caller_hash_verify=
(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_HASH_VERIFY_SID,
-+		.function_id =3D TFM_CRYPTO_HASH_VERIFY_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -167,7 +167,7 @@ static inline psa_status_t crypto_caller_hash_clone(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_HASH_CLONE_SID,
-+		.function_id =3D TFM_CRYPTO_HASH_CLONE_SID,
- 		.op_handle =3D source_op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_import_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_=
caller_import_key.h
-index 72a43c428adf..0c946a25488f 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_impo=
rt_key.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_impo=
rt_key.h
-@@ -33,7 +33,7 @@ static inline psa_status_t crypto_caller_import_key(st=
ruct service_client *conte
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_IMPORT_KEY_SID,
-+		.function_id =3D TFM_CRYPTO_IMPORT_KEY_SID,
- 	};
- 	struct psa_invec in_vec[] =3D {
- 		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_key_derivation.h b/components/service/crypto/client/caller/psa_ipc/cry=
pto_caller_key_derivation.h
-index cacadf09d2c4..8bc32977535d 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_=
derivation.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_=
derivation.h
-@@ -33,7 +33,7 @@ static inline psa_status_t crypto_caller_key_derivatio=
n_setup(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_SETUP_SID,
-+		.function_id =3D TFM_CRYPTO_KEY_DERIVATION_SETUP_SID,
- 		.alg =3D alg,
- 		.op_handle =3D *op_handle,
- 	};
-@@ -59,7 +59,7 @@ static inline psa_status_t crypto_caller_key_derivatio=
n_get_capacity(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY_SID,
-+		.function_id =3D TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -84,7 +84,7 @@ static inline psa_status_t crypto_caller_key_derivatio=
n_set_capacity(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY_SID,
-+		.function_id =3D TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY_SID,
- 		.capacity =3D capacity,
- 		.op_handle =3D op_handle,
- 	};
-@@ -109,7 +109,7 @@ static inline psa_status_t crypto_caller_key_derivat=
ion_input_bytes(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES_SID,
-+		.function_id =3D TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES_SID,
- 		.step =3D step,
- 		.op_handle =3D op_handle,
- 	};
-@@ -134,7 +134,7 @@ static inline psa_status_t crypto_caller_key_derivat=
ion_input_key(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY_SID,
-+		.function_id =3D TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY_SID,
- 		.key_id =3D key,
- 		.step =3D step,
- 		.op_handle =3D op_handle,
-@@ -159,7 +159,7 @@ static inline psa_status_t crypto_caller_key_derivat=
ion_output_bytes(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES_SID,
-+		.function_id =3D TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -185,7 +185,7 @@ static inline psa_status_t crypto_caller_key_derivat=
ion_output_key(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY_SID,
-+		.function_id =3D TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -211,7 +211,7 @@ static inline psa_status_t crypto_caller_key_derivat=
ion_abort(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_ABORT_SID,
-+		.function_id =3D TFM_CRYPTO_KEY_DERIVATION_ABORT_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -239,7 +239,7 @@ static inline psa_status_t crypto_caller_key_derivat=
ion_key_agreement(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT_SID,
-+		.function_id =3D TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT_SID,
- 		.key_id =3D private_key,
- 		.step =3D step,
- 		.op_handle =3D op_handle,
-@@ -270,7 +270,7 @@ static inline psa_status_t crypto_caller_raw_key_agr=
eement(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_RAW_KEY_AGREEMENT_SID,
-+		.function_id =3D TFM_CRYPTO_RAW_KEY_AGREEMENT_SID,
- 		.alg =3D alg,
- 		.key_id =3D private_key,
- 	};
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_mac.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_=
mac.h
-index a0092bfd94e7..596923387596 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.=
h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.=
h
-@@ -34,7 +34,7 @@ static inline psa_status_t crypto_caller_mac_sign_setu=
p(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_MAC_SIGN_SETUP_SID,
-+		.function_id =3D TFM_CRYPTO_MAC_SIGN_SETUP_SID,
- 		.key_id =3D key,
- 		.alg =3D alg,
- 		.op_handle =3D *op_handle,
-@@ -62,7 +62,7 @@ static inline psa_status_t crypto_caller_mac_verify_se=
tup(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_MAC_VERIFY_SETUP_SID,
-+		.function_id =3D TFM_CRYPTO_MAC_VERIFY_SETUP_SID,
- 		.key_id =3D key,
- 		.alg =3D alg,
- 		.op_handle =3D *op_handle,
-@@ -90,7 +90,7 @@ static inline psa_status_t crypto_caller_mac_update(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_MAC_UPDATE_SID,
-+		.function_id =3D TFM_CRYPTO_MAC_UPDATE_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -118,7 +118,7 @@ static inline psa_status_t crypto_caller_mac_sign_fi=
nish(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_MAC_SIGN_FINISH_SID,
-+		.function_id =3D TFM_CRYPTO_MAC_SIGN_FINISH_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -147,7 +147,7 @@ static inline psa_status_t crypto_caller_mac_verify_=
finish(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_MAC_VERIFY_FINISH_SID,
-+		.function_id =3D TFM_CRYPTO_MAC_VERIFY_FINISH_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-@@ -172,7 +172,7 @@ static inline psa_status_t crypto_caller_mac_abort(
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_MAC_ABORT_SID,
-+		.function_id =3D TFM_CRYPTO_MAC_ABORT_SID,
- 		.op_handle =3D op_handle,
- 	};
- 	struct psa_invec in_vec[] =3D {
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_purge_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_purge_key.h
-index 36a01765b1a3..b5894e06d1ff 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_purg=
e_key.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_purg=
e_key.h
-@@ -31,7 +31,7 @@ static inline psa_status_t crypto_caller_purge_key(str=
uct service_client *contex
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_PURGE_KEY_SID,
-+		.function_id =3D TFM_CRYPTO_PURGE_KEY_SID,
- 		.key_id =3D id,
- 	};
- 	struct psa_invec in_vec[] =3D {
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_sign_hash.h
-index bebfe05c7c49..254ee5a90d89 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
-@@ -37,7 +37,7 @@ static inline psa_status_t crypto_caller_sign_hash(str=
uct service_client *contex
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_ASYMMETRIC_SIGN_HASH_SID,
-+		.function_id =3D TFM_CRYPTO_ASYMMETRIC_SIGN_HASH_SID,
- 		.key_id =3D id,
- 		.alg =3D alg,
- 	};
-@@ -70,7 +70,7 @@ static inline psa_status_t crypto_caller_sign_message(=
struct service_client *con
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_ASYMMETRIC_SIGN_MESSAGE_SID,
-+		.function_id =3D TFM_CRYPTO_ASYMMETRIC_SIGN_MESSAGE_SID,
- 		.key_id =3D id,
- 		.alg =3D alg,
- 	};
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_verify_hash.h
-index d0a3850678cb..515f2a8da39f 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
-@@ -31,13 +31,13 @@ static inline psa_status_t crypto_caller_common(stru=
ct service_client *context,
- 						     size_t hash_length,
- 						     const uint8_t *signature,
- 						     size_t signature_length,
--						     uint32_t sfn_id)
-+						     uint32_t function_id)
- {
- 	struct service_client *ipc =3D context;
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D sfn_id,
-+		.function_id =3D function_id,
- 		.key_id =3D id,
- 		.alg =3D alg,
- 	};
---=20
-2.40.0
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0006-TF-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch b/meta-arm-bsp=
/recipes-security/trusted-services/corstone1000/0006-TF-Mv1.7-alignment-P=
SA-crypto-client-in-out_vec.patch
deleted file mode 100644
index 7a9bee6d..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-TF=
-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 507008e501c4f5bea0841547a052b3dffd86eb20 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Thu, 9 Feb 2023 00:34:23 +0000
-Subject: [PATCH 6/6] TF-Mv1.7 alignment: PSA crypto client in/out_vec
-
-Few psa crypto operations have different in/out_vec expectations
-This patch is fixing the differences between psa crypto client in TS
-and psa crypto service in TF-M running on the secure enclave
-
-operations:
-- aead_generate_nonce: TFM service doesn't expect op_handle in in_vec
-- aead_update: TFM service doesn't expect op_handle in in_vec
-- cipher_generate_iv: TFM service doesn't expect op_handle in in_vec
-- cipher_update: TFM service doesn't expect op_handle in in_vec
-- hash_clone: TFM service expects target_op_handle in the in_vec
-              rationale is target_op_handle according to the spec
-              must be initialized and not active. and since hash_clone
-              manipulates it. hence, target_op_handle should be passed
-              as input and output.
-
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Pending [Not submitted yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../crypto/client/caller/psa_ipc/crypto_caller_aead.h       | 6 ++----
- .../crypto/client/caller/psa_ipc/crypto_caller_cipher.h     | 6 ++----
- .../crypto/client/caller/psa_ipc/crypto_caller_hash.h       | 2 ++
- 3 files changed, 6 insertions(+), 8 deletions(-)
-
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_aead.h
-index f63996a8aad3..393ba447663a 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-@@ -226,14 +226,13 @@ static inline psa_status_t crypto_caller_aead_gene=
rate_nonce(
- 			.len =3D sizeof(struct psa_ipc_crypto_pack_iovec) },
- 	};
- 	struct psa_outvec out_vec[] =3D {
--		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
- 		{ .base =3D psa_ptr_to_u32(nonce), .len =3D nonce_size },
- 	};
-=20
- 	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
- 			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-=20
--	*nonce_length =3D out_vec[1].len;
-+	*nonce_length =3D out_vec[0].len;
-=20
- 	return status;
- }
-@@ -364,7 +363,6 @@ static inline psa_status_t crypto_caller_aead_update=
(
- 		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
- 	};
- 	struct psa_outvec out_vec[] =3D {
--		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
- 		{ .base =3D psa_ptr_const_to_u32(output), .len =3D output_size },
- 	};
-=20
-@@ -376,7 +374,7 @@ static inline psa_status_t crypto_caller_aead_update=
(
- 	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
- 			  in_len, out_vec, IOVEC_LEN(out_vec));
-=20
--	*output_length =3D out_vec[1].len;
-+	*output_length =3D out_vec[0].len;
-=20
- 	return status;
- }
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h b/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h
-index 4f885f3445ab..0d32444b6bbf 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_ciph=
er.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_ciph=
er.h
-@@ -98,14 +98,13 @@ static inline psa_status_t crypto_caller_cipher_gene=
rate_iv(
- 		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
- 	};
- 	struct psa_outvec out_vec[] =3D {
--		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
- 		{ .base =3D psa_ptr_to_u32(iv), .len =3D iv_size },
- 	};
-=20
- 	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
- 			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-=20
--	*iv_length =3D out_vec[1].len;
-+	*iv_length =3D out_vec[0].len;
-=20
- 	return status;
- }
-@@ -158,14 +157,13 @@ static inline psa_status_t crypto_caller_cipher_up=
date(
- 		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
- 	};
- 	struct psa_outvec out_vec[] =3D {
--		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
- 		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
- 	};
-=20
- 	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
- 			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-=20
--	*output_length =3D out_vec[1].len;
-+	*output_length =3D out_vec[0].len;
-=20
- 	return status;
- }
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_hash.h
-index f7ffaf38c7d0..77ef4ead1d03 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash=
.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash=
.h
-@@ -172,6 +172,8 @@ static inline psa_status_t crypto_caller_hash_clone(
- 	};
- 	struct psa_invec in_vec[] =3D {
- 		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_to_u32(target_op_handle),
-+			.len =3D sizeof(uint32_t) },
- 	};
- 	struct psa_outvec out_vec[] =3D {
- 		{ .base =3D psa_ptr_to_u32(target_op_handle),
---=20
-2.40.0
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 17c957e2..e601539a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -5,9 +5,6 @@ SRC_URI:append:corstone1000  =3D " \
     file://0001-Add-stub-capsule-update-service-components.patch;patchdi=
r=3D../trusted-services \
     file://0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch;patchdir=
=3D../trusted-services \
     file://0003-FMP-Support-in-Corstone1000.patch;patchdir=3D../trusted-=
services \
-    file://0004-TF-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch;patchdir=3D=
../trusted-services \
-    file://0005-TF-Mv1.7-alignment-Align-crypto-iovec-definition.patch;p=
atchdir=3D../trusted-services \
-    file://0006-TF-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch;pa=
tchdir=3D../trusted-services \
     "
=20
=20
--=20
2.39.1.windows.1


