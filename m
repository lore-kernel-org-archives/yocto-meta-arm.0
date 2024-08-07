Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B661EC52D7C
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:31:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31104.1723030283515406585
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 04:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5AA11063;
	Wed,  7 Aug 2024 04:31:48 -0700 (PDT)
Received: from e126523.budapest.arm.com (e126523.budapest.arm.com [10.45.26.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DAFB3F5A1;
	Wed,  7 Aug 2024 04:31:22 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-services: corstone1000: align PSA crypto structs with TF-M
Date: Wed,  7 Aug 2024 13:31:07 +0200
Message-Id: <20240807113108.58898-3-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807113108.58898-1-bence.balogh@arm.com>
References: <20240807113108.58898-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Aug 2024 11:31:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5955

From: Bence Balogh <bence.balogh@arm.com>

The TF-M was upgraded to v2.1.0 for the Corstone-1000. The TS had to be
aligned with it, to keep the Secure Enclave Proxy Secure Partition
compatible with TF-M.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...ign-PSA-Crypto-structs-with-TF-Mv2.1.patch | 300 ++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |   1 +
 2 files changed, 301 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0019-Align-PSA-Crypto-structs-with-TF-Mv2.1.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0019-Align-PSA-Crypto-structs-with-TF-Mv2.1.patch b/meta-arm-bsp/recipes-=
security/trusted-services/corstone1000/0019-Align-PSA-Crypto-structs-with=
-TF-Mv2.1.patch
new file mode 100644
index 00000000..f02c7ea3
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-Al=
ign-PSA-Crypto-structs-with-TF-Mv2.1.patch
@@ -0,0 +1,300 @@
+From 3bb579379bcfe32ae0b81f721b370afcb58e9693 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 10 Jul 2024 11:07:09 +0200
+Subject: [PATCH] Align PSA Crypto structs with TF-Mv2.1
+
+The files were updated using the TF-Mv2.1 release (0c4c99b) commit.
+
+* crypto_sid.h
+This is derived from TF-M's tfm_crypto_defs.h file. The crypto function
+ID definitions were reworked. This change had to be done on the TS
+side too to keep the compatibility.
+
+* crypto_ipc_backend.h
+This file is also derived from the tfm_crypto_defs.h file. The
+tfm_crypto_pack_iovec struct changed in TF-M so the
+psa_ipc_crypto_pack_iovec struct had to be updated in TS to
+keep the compatibility.
+
+* crypto_client_struct.h
+The psa_client_key_attributes_s struct had to be aligned with the
+psa_key_attributes_s struct in TF-M. (psa_crypto.c)
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending
+---
+ .../service/common/include/psa/crypto_sid.h   | 168 +++++-------------
+ .../backend/psa_ipc/crypto_ipc_backend.h      |   9 +-
+ .../crypto/include/psa/crypto_client_struct.h |   4 +-
+ 3 files changed, 55 insertions(+), 126 deletions(-)
+
+diff --git a/components/service/common/include/psa/crypto_sid.h b/compon=
ents/service/common/include/psa/crypto_sid.h
+index 5b05f46d7..fe057ce40 100644
+--- a/components/service/common/include/psa/crypto_sid.h
++++ b/components/service/common/include/psa/crypto_sid.h
+@@ -18,22 +18,24 @@ extern "C" {
+  *        nine groups (Random, Key management, Hash, MAC, Cipher, AEAD,
+  *        Asym sign, Asym encrypt, Key derivation).
+  */
+-enum tfm_crypto_group_id {
+-    TFM_CRYPTO_GROUP_ID_RANDOM =3D 0x0,
+-    TFM_CRYPTO_GROUP_ID_KEY_MANAGEMENT,
+-    TFM_CRYPTO_GROUP_ID_HASH,
+-    TFM_CRYPTO_GROUP_ID_MAC,
+-    TFM_CRYPTO_GROUP_ID_CIPHER,
+-    TFM_CRYPTO_GROUP_ID_AEAD,
+-    TFM_CRYPTO_GROUP_ID_ASYM_SIGN,
+-    TFM_CRYPTO_GROUP_ID_ASYM_ENCRYPT,
+-    TFM_CRYPTO_GROUP_ID_KEY_DERIVATION,
++enum tfm_crypto_group_id_t {
++    TFM_CRYPTO_GROUP_ID_RANDOM          =3D UINT8_C(1),
++    TFM_CRYPTO_GROUP_ID_KEY_MANAGEMENT  =3D UINT8_C(2),
++    TFM_CRYPTO_GROUP_ID_HASH            =3D UINT8_C(3),
++    TFM_CRYPTO_GROUP_ID_MAC             =3D UINT8_C(4),
++    TFM_CRYPTO_GROUP_ID_CIPHER          =3D UINT8_C(5),
++    TFM_CRYPTO_GROUP_ID_AEAD            =3D UINT8_C(6),
++    TFM_CRYPTO_GROUP_ID_ASYM_SIGN       =3D UINT8_C(7),
++    TFM_CRYPTO_GROUP_ID_ASYM_ENCRYPT    =3D UINT8_C(8),
++    TFM_CRYPTO_GROUP_ID_KEY_DERIVATION  =3D UINT8_C(9)
+ };
+=20
+-/* X macro describing each of the available PSA Crypto APIs */
++/* Set of X macros describing each of the available PSA Crypto APIs */
++#define RANDOM_FUNCS                               \
++    X(TFM_CRYPTO_GENERATE_RANDOM)
++
+ #define KEY_MANAGEMENT_FUNCS                       \
+     X(TFM_CRYPTO_GET_KEY_ATTRIBUTES)               \
+-    X(TFM_CRYPTO_RESET_KEY_ATTRIBUTES)             \
+     X(TFM_CRYPTO_OPEN_KEY)                         \
+     X(TFM_CRYPTO_CLOSE_KEY)                        \
+     X(TFM_CRYPTO_IMPORT_KEY)                       \
+@@ -89,13 +91,13 @@ enum tfm_crypto_group_id {
+     X(TFM_CRYPTO_AEAD_VERIFY)                      \
+     X(TFM_CRYPTO_AEAD_ABORT)
+=20
+-#define ASYMMETRIC_SIGN_FUNCS                      \
++#define ASYM_SIGN_FUNCS                            \
+     X(TFM_CRYPTO_ASYMMETRIC_SIGN_MESSAGE)          \
+     X(TFM_CRYPTO_ASYMMETRIC_VERIFY_MESSAGE)        \
+     X(TFM_CRYPTO_ASYMMETRIC_SIGN_HASH)             \
+     X(TFM_CRYPTO_ASYMMETRIC_VERIFY_HASH)
+=20
+-#define AYSMMETRIC_ENCRYPT_FUNCS                   \
++#define ASYM_ENCRYPT_FUNCS                         \
+     X(TFM_CRYPTO_ASYMMETRIC_ENCRYPT)               \
+     X(TFM_CRYPTO_ASYMMETRIC_DECRYPT)
+=20
+@@ -106,133 +108,55 @@ enum tfm_crypto_group_id {
+     X(TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY)      \
+     X(TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES)       \
+     X(TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY)         \
++    X(TFM_CRYPTO_KEY_DERIVATION_INPUT_INTEGER)     \
+     X(TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT)     \
+     X(TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES)      \
+     X(TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY)        \
+     X(TFM_CRYPTO_KEY_DERIVATION_ABORT)
+=20
+-#define RANDOM_FUNCS                               \
+-    X(TFM_CRYPTO_GENERATE_RANDOM)
+-
+-/*
+- * Define function IDs in each group. The function ID will be encoded i=
nto
+- * tfm_crypto_func_sid below.
+- * Each group is defined as a dedicated enum in case the total number o=
f
+- * PSA Crypto APIs exceeds 256.
+- */
+-#define X(func_id)    func_id,
+-enum tfm_crypto_key_management_func_id {
+-    KEY_MANAGEMENT_FUNCS
+-};
+-enum tfm_crypto_hash_func_id {
+-    HASH_FUNCS
+-};
+-enum tfm_crypto_mac_func_id {
+-    MAC_FUNCS
+-};
+-enum tfm_crypto_cipher_func_id {
+-    CIPHER_FUNCS
+-};
+-enum tfm_crypto_aead_func_id {
+-    AEAD_FUNCS
+-};
+-enum tfm_crypto_asym_sign_func_id {
+-    ASYMMETRIC_SIGN_FUNCS
+-};
+-enum tfm_crypto_asym_encrypt_func_id {
+-    AYSMMETRIC_ENCRYPT_FUNCS
+-};
+-enum tfm_crypto_key_derivation_func_id {
+-    KEY_DERIVATION_FUNCS
+-};
+-enum tfm_crypto_random_func_id {
+-    RANDOM_FUNCS
+-};
+-#undef X
+-
+-#define FUNC_ID(func_id)    (((func_id) & 0xFF) << 8)
++#define BASE__VALUE(x) ((uint16_t)((((uint16_t)(x)) << 8) & 0xFF00))
+=20
+-/*
+- * Numerical progressive value identifying a function API exposed throu=
gh
+- * the interfaces (S or NS). It's used to dispatch the requests from S/=
NS
+- * to the corresponding API implementation in the Crypto service backen=
d.
++/**
++ * \brief This type defines numerical progressive values identifying a =
function API
++ *        exposed through the interfaces (S or NS). It's used to dispat=
ch the requests
++ *        from S/NS to the corresponding API implementation in the Cryp=
to service backend.
++ *
++ * \note Each function SID is encoded as uint16_t.
++ *        +------------+------------+
++ *        |  Group ID  |  Func ID   |
++ *        +------------+------------+
++ *   (MSB)15         8 7          0(LSB)
+  *
+- * Each function SID is encoded as uint16_t.
+- *     |  Func ID  |  Group ID |
+- *     15         8 7          0
+- * Func ID is defined in each group func_id enum above
+- * Group ID is defined in tfm_crypto_group_id.
+  */
+-enum tfm_crypto_func_sid {
+-
+-#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
+-                                   (TFM_CRYPTO_GROUP_ID_KEY_MANAGEMENT =
& 0xFF)),
+-
++enum tfm_crypto_func_sid_t {
++#define X(FUNCTION_NAME) FUNCTION_NAME ## _SID,
++    BASE__RANDOM         =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_RANDOM) - =
1,
++    RANDOM_FUNCS
++    BASE__KEY_MANAGEMENT =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_KEY_MANAGE=
MENT) - 1,
+     KEY_MANAGEMENT_FUNCS
+-
+-#undef X
+-#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
+-                                            (TFM_CRYPTO_GROUP_ID_HASH &=
 0xFF)),
++    BASE__HASH           =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_HASH) - 1,
+     HASH_FUNCS
+-
+-#undef X
+-#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
+-                                            (TFM_CRYPTO_GROUP_ID_MAC & =
0xFF)),
++    BASE__MAC            =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_MAC) - 1,
+     MAC_FUNCS
+-
+-#undef X
+-#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
+-                                           (TFM_CRYPTO_GROUP_ID_CIPHER =
& 0xFF)),
++    BASE__CIPHER         =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_CIPHER) - =
1,
+     CIPHER_FUNCS
+-
+-#undef X
+-#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
+-                                             (TFM_CRYPTO_GROUP_ID_AEAD =
& 0xFF)),
++    BASE__AEAD           =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_AEAD) - 1,
+     AEAD_FUNCS
+-
+-#undef X
+-#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
+-                                        (TFM_CRYPTO_GROUP_ID_ASYM_SIGN =
& 0xFF)),
+-    ASYMMETRIC_SIGN_FUNCS
+-
+-#undef X
+-#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
+-                                     (TFM_CRYPTO_GROUP_ID_ASYM_ENCRYPT =
& 0xFF)),
+-    AYSMMETRIC_ENCRYPT_FUNCS
+-
+-#undef X
+-#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
+-                                   (TFM_CRYPTO_GROUP_ID_KEY_DERIVATION =
& 0xFF)),
++    BASE__ASYM_SIGN      =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_ASYM_SIGN)=
 - 1,
++    ASYM_SIGN_FUNCS
++    BASE__ASYM_ENCRYPT   =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_ASYM_ENCRY=
PT) - 1,
++    ASYM_ENCRYPT_FUNCS
++    BASE__KEY_DERIVATION =3D BASE__VALUE(TFM_CRYPTO_GROUP_ID_KEY_DERIVA=
TION) - 1,
+     KEY_DERIVATION_FUNCS
+-
+ #undef X
+-#define X(func_id)      func_id ## _SID =3D (uint16_t)((FUNC_ID(func_id=
)) | \
+-                                           (TFM_CRYPTO_GROUP_ID_RANDOM =
& 0xFF)),
+-    RANDOM_FUNCS
+-
+ };
+-#undef X
+=20
+ /**
+- * \brief Define an invalid value for an SID
+- *
++ * \brief This macro is used to extract the group_id from an encoded fu=
nction id
++ *        by accessing the upper 8 bits. A \a _function_id is uint16_t =
type
+  */
+-#define TFM_CRYPTO_SID_INVALID (~0x0u)
+-
+-/**
+- * \brief This value is used to mark an handle as invalid.
+- *
+- */
+-#define TFM_CRYPTO_INVALID_HANDLE (0x0u)
+-
+-/**
+- * \brief Define miscellaneous literal constants that are used in the s=
ervice
+- *
+- */
+-enum {
+-    TFM_CRYPTO_NOT_IN_USE =3D 0,
+-    TFM_CRYPTO_IN_USE =3D 1
+-};
++#define TFM_CRYPTO_GET_GROUP_ID(_function_id) \
++    ((enum tfm_crypto_group_id_t)(((uint16_t)(_function_id) >> 8) & 0xF=
F))
+=20
+ #ifdef __cplusplus
+ }
+diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
+index 27ac59837..d7e733b89 100644
+--- a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
++++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
+@@ -30,10 +30,9 @@ struct psa_ipc_crypto_aead_pack_input {
+ struct psa_ipc_crypto_pack_iovec {
+     psa_key_id_t key_id;     /*!< Key id */
+     psa_algorithm_t alg;     /*!< Algorithm */
+-    uint32_t op_handle;      /*!< Frontend context handle associated to=
 a
++    uint32_t op_handle;      /*!< Client context handle associated to a
+                               *   multipart operation
+                               */
+-    uint32_t capacity;         /*!< Key derivation capacity */
+     uint32_t ad_length;        /*!< Additional Data length for multipar=
t AEAD */
+     uint32_t plaintext_length; /*!< Plaintext length for multipart AEAD=
 */
+=20
+@@ -44,7 +43,11 @@ struct psa_ipc_crypto_pack_iovec {
+                               *   See tfm_crypto_func_sid for detail
+                               */
+     uint16_t step;           /*!< Key derivation step */
+-}__packed;
++    union {
++        size_t capacity;     /*!< Key derivation capacity */
++        uint64_t value;      /*!< Key derivation integer for update*/
++    };
++};
+=20
+ #define iov_size sizeof(struct psa_ipc_crypto_pack_iovec)
+=20
+diff --git a/components/service/crypto/include/psa/crypto_client_struct.=
h b/components/service/crypto/include/psa/crypto_client_struct.h
+index 1f68aba21..ebc400811 100644
+--- a/components/service/crypto/include/psa/crypto_client_struct.h
++++ b/components/service/crypto/include/psa/crypto_client_struct.h
+@@ -34,9 +34,11 @@ struct psa_client_key_attributes_s
+     uint16_t type;
+     uint16_t bits;
+     uint32_t lifetime;
+-    psa_key_id_t id;
+     uint32_t usage;
+     uint32_t alg;
++    uint32_t alg2;
++    uint32_t id;
++    int32_t owner_id;
+ };
+=20
+ #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0, 0, 0, 0, 0, 0}
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index f67d5f62..2c34229e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -20,6 +20,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0016-Isolate-common-uefi-variable-authentication-steps.patch =
\
     file://0017-Implement-Private-Authenticated-Variable-verificatio.pat=
ch \
     file://0018-Change-RSS_COMMS-cmake-variables-to-cahce-vars.patch \
+    file://0019-Align-PSA-Crypto-structs-with-TF-Mv2.1.patch \
     "
=20
 # The patches above introduce errors with GCC 14.1, silence them for now
--=20
2.25.1


