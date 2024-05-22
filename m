Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F0AC25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 16:04:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1267.1716393856034926314
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 May 2024 09:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 916AE339;
	Wed, 22 May 2024 09:04:39 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.84.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 987F43F766;
	Wed, 22 May 2024 09:04:14 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 2/5] arm-bsp/trusted-services: corstone1000: add fixes for private auth vars
Date: Wed, 22 May 2024 18:03:51 +0200
Message-Id: <20240522160354.67342-3-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240522160354.67342-1-bence.balogh@arm.com>
References: <20240522160354.67342-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 May 2024 16:04:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5751

From: Bence Balogh <bence.balogh@arm.com>

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...pi-to-create-uefi-priv-var-fingerpri.patch | 758 ++++++++++++++++++
 ...estamp-validation-for-uefi-variables.patch | 146 ++++
 ...n-uefi-variable-authentication-steps.patch | 282 +++++++
 ...e-Authenticated-Variable-verificatio.patch | 292 +++++++
 .../trusted-services/ts-arm-platforms.inc     |   4 +
 .../ts-sp-smm-gateway_%.bbappend              |   1 +
 6 files changed, 1483 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-Provide-crypto-api-to-create-uefi-priv-var-fingerpri.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0015-Add-timestamp-validation-for-uefi-variables.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0016-Isolate-common-uefi-variable-authentication-steps.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0017-Implement-Private-Authenticated-Variable-verificatio.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0014-Provide-crypto-api-to-create-uefi-priv-var-fingerpri.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0014-Provide-crypto-=
api-to-create-uefi-priv-var-fingerpri.patch
new file mode 100644
index 00000000..ae9a53fa
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Pr=
ovide-crypto-api-to-create-uefi-priv-var-fingerpri.patch
@@ -0,0 +1,758 @@
+From 370811420cfa1c14146f45de308bbccf70408eb8 Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Fri, 5 Apr 2024 11:19:37 +0200
+Subject: [PATCH] Provide crypto api to create uefi priv var fingerprint
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Add new call to the crypto backend to calculate a hash of the common
+name of the signing certificate=E2=80=99s Subject and the tbsCertificate
+of the top-level issuer certificate.
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27953]
+---
+ .../client/caller/packed-c/crypto_caller.h    |   1 +
+ ...aller_get_uefi_priv_auth_var_fingerprint.h |  90 ++++++++
+ .../packed-c/packedc_crypto_client.cpp        |   8 +
+ .../protocol/packed-c/packedc_crypto_client.h |   4 +
+ .../service/crypto/client/psa/component.cmake |   1 +
+ .../service/crypto/client/psa/crypto_client.h |   5 +
+ .../psa/get_uefi_priv_auth_var_fingerprint.c  |  21 ++
+ .../service/crypto/provider/crypto_provider.c | 212 +++++++++++++++---
+ .../serializer/crypto_provider_serializer.h   |   8 +
+ .../packedc_crypto_provider_serializer.c      |  54 +++++
+ .../backend/direct/uefi_direct_backend.c      |  90 ++++++++
+ deployments/smm-gateway/smm-gateway.cmake     |   5 +
+ .../get_uefi_priv_auth_var_fingerprint.h      |  21 ++
+ protocols/service/crypto/packed-c/opcodes.h   |   1 +
+ 14 files changed, 488 insertions(+), 33 deletions(-)
+ create mode 100644 components/service/crypto/client/caller/packed-c/cry=
pto_caller_get_uefi_priv_auth_var_fingerprint.h
+ create mode 100644 components/service/crypto/client/psa/get_uefi_priv_a=
uth_var_fingerprint.c
+ create mode 100644 protocols/service/crypto/packed-c/get_uefi_priv_auth=
_var_fingerprint.h
+
+diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler.h b/components/service/crypto/client/caller/packed-c/crypto_caller.h
+index d834bc207..d5dd0f70d 100644
+--- a/components/service/crypto/client/caller/packed-c/crypto_caller.h
++++ b/components/service/crypto/client/caller/packed-c/crypto_caller.h
+@@ -31,5 +31,6 @@
+ #include "crypto_caller_sign_hash.h"
+ #include "crypto_caller_verify_hash.h"
+ #include "crypto_caller_verify_pkcs7_signature.h"
++#include "crypto_caller_get_uefi_priv_auth_var_fingerprint.h"
+=20
+ #endif /* PACKEDC_CRYPTO_CALLER_H */
+diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_get_uefi_priv_auth_var_fingerprint.h b/components/service/crypto/clie=
nt/caller/packed-c/crypto_caller_get_uefi_priv_auth_var_fingerprint.h
+new file mode 100644
+index 000000000..d3446e445
+--- /dev/null
++++ b/components/service/crypto/client/caller/packed-c/crypto_caller_get=
_uefi_priv_auth_var_fingerprint.h
+@@ -0,0 +1,90 @@
++/*
++ * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PACKEDC_CRYPTO_CALLER_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H
++#define PACKEDC_CRYPTO_CALLER_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H
++
++#include <common/tlv/tlv.h>
++#include <protocols/common/efi/efi_status.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/get_uefi_priv_auth_var_fing=
erprint.h>
++#include <service/common/client/service_client.h>
++#include <stdlib.h>
++#include <string.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline int crypto_caller_get_uefi_priv_auth_var_fingerprint(stru=
ct service_client *context,
++						       const uint8_t *signature_cert,
++						       uint64_t signature_cert_len,
++						       uint8_t *output)
++{
++	efi_status_t efi_status =3D EFI_SUCCESS;
++	size_t req_len =3D 0;
++
++	if (signature_cert_len > UINT16_MAX)
++		return RPC_ERROR_INVALID_VALUE;
++
++	struct tlv_record signature_record =3D {
++		.tag =3D TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_IN_TAG_SIGNATUR=
E,
++		.length =3D (uint16_t)signature_cert_len,
++		.value =3D signature_cert
++	};
++
++	req_len +=3D tlv_required_space(signature_record.length);
++
++	rpc_call_handle call_handle;
++	uint8_t *req_buf;
++
++	call_handle =3D rpc_caller_session_begin(context->session, &req_buf, r=
eq_len, 0);
++
++	if (call_handle) {
++		uint8_t *resp_buf;
++		size_t resp_len;
++		service_status_t service_status;
++		struct tlv_iterator req_iter;
++
++		tlv_iterator_begin(&req_iter, req_buf, req_len);
++		tlv_encode(&req_iter, &signature_record);
++
++		context->rpc_status =3D rpc_caller_session_invoke(
++			call_handle, TS_CRYPTO_OPCODE_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT, &r=
esp_buf, &resp_len,
++			&service_status);
++
++		if (context->rpc_status =3D=3D RPC_SUCCESS) {
++
++			if (service_status =3D=3D EFI_SUCCESS) {
++
++				struct tlv_const_iterator resp_iter;
++				struct tlv_record decoded_record;
++				tlv_const_iterator_begin(&resp_iter, resp_buf, resp_len);
++
++				if (tlv_find_decode(&resp_iter,
++							TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_OUT_TAG_IDENTIFIER,=
 &decoded_record)) {
++
++					memcpy(output, decoded_record.value, PSA_HASH_MAX_SIZE);
++				}
++				else {
++					/* Mandatory response parameter missing */
++					efi_status =3D EFI_INVALID_PARAMETER;
++				}
++			}
++		}
++
++		rpc_caller_session_end(call_handle);
++	}
++
++	return efi_status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PACKEDC_CRYPTO_CALLER_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H */
+diff --git a/components/service/crypto/client/cpp/protocol/packed-c/pack=
edc_crypto_client.cpp b/components/service/crypto/client/cpp/protocol/pac=
ked-c/packedc_crypto_client.cpp
+index aaa71f0c8..e0f6a15a8 100644
+--- a/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.cpp
++++ b/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.cpp
+@@ -428,3 +428,11 @@ int packedc_crypto_client::verify_pkcs7_signature(c=
onst uint8_t *signature_cert,
+ 						    hash, hash_len, public_key_cert,
+ 						    public_key_cert_len);
+ }
++
++int packedc_crypto_client::get_uefi_priv_auth_var_fingerprint(const uin=
t8_t *signature_cert,
++						  uint64_t signature_cert_len,
++						  uint8_t *output)
++{
++	return crypto_caller_get_uefi_priv_auth_var_fingerprint(&m_client, sig=
nature_cert, signature_cert_len,
++						    output);
++}
+diff --git a/components/service/crypto/client/cpp/protocol/packed-c/pack=
edc_crypto_client.h b/components/service/crypto/client/cpp/protocol/packe=
d-c/packedc_crypto_client.h
+index 8d4f60cf9..ec6c51c7f 100644
+--- a/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.h
++++ b/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.h
+@@ -236,6 +236,10 @@ public:
+ 	int verify_pkcs7_signature(const uint8_t *signature_cert, uint64_t sig=
nature_cert_len,
+ 				   const uint8_t *hash, uint64_t hash_len,
+ 				   const uint8_t *public_key_cert, uint64_t public_key_cert_len);
++
++	int get_uefi_priv_auth_var_fingerprint(const uint8_t *signature_cert,
++				    uint64_t signature_cert_len,
++				    uint8_t *output);
+ };
+=20
+ #endif /* PACKEDC_CRYPTO_CLIENT_H */
+diff --git a/components/service/crypto/client/psa/component.cmake b/comp=
onents/service/crypto/client/psa/component.cmake
+index 359db3b4a..5bee0c652 100644
+--- a/components/service/crypto/client/psa/component.cmake
++++ b/components/service/crypto/client/psa/component.cmake
+@@ -32,4 +32,5 @@ target_sources(${TGT} PRIVATE
+ 	"${CMAKE_CURRENT_LIST_DIR}/psa_sign_message.c"
+ 	"${CMAKE_CURRENT_LIST_DIR}/psa_verify_message.c"
+ 	"${CMAKE_CURRENT_LIST_DIR}/verify_pkcs7_signature.c"
++	"${CMAKE_CURRENT_LIST_DIR}/get_uefi_priv_auth_var_fingerprint.c"
+ 	)
+diff --git a/components/service/crypto/client/psa/crypto_client.h b/comp=
onents/service/crypto/client/psa/crypto_client.h
+index 4b59bbe32..af04df11e 100644
+--- a/components/service/crypto/client/psa/crypto_client.h
++++ b/components/service/crypto/client/psa/crypto_client.h
+@@ -7,10 +7,15 @@
+ #ifndef CRYPTO_CLIENT_H
+ #define CRYPTO_CLIENT_H
+=20
++#include <stddef.h>
+ #include <stdint.h>
+=20
+ int verify_pkcs7_signature(const uint8_t *signature_cert, uint64_t sign=
ature_cert_len,
+ 			   const uint8_t *hash, uint64_t hash_len, const uint8_t *public_key=
_cert,
+ 			   uint64_t public_key_cert_len);
+=20
++int get_uefi_priv_auth_var_fingerprint_handler(const uint8_t *signature=
_cert,
++				    uint64_t signature_cert_len,
++				    uint8_t *output);
++
+ #endif /* CRYPTO_CLIENT_H */
+diff --git a/components/service/crypto/client/psa/get_uefi_priv_auth_var=
_fingerprint.c b/components/service/crypto/client/psa/get_uefi_priv_auth_=
var_fingerprint.c
+new file mode 100644
+index 000000000..702aaa0c4
+--- /dev/null
++++ b/components/service/crypto/client/psa/get_uefi_priv_auth_var_finger=
print.c
+@@ -0,0 +1,21 @@
++/*
++ * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include "crypto_caller_selector.h"
++#include "crypto_client.h"
++#include "psa_crypto_client.h"
++
++int get_uefi_priv_auth_var_fingerprint_handler(const uint8_t *signature=
_cert,
++				    uint64_t signature_cert_len,
++				    uint8_t *output)
++{
++	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
++		return psa_crypto_client_instance.init_status;
++
++	return crypto_caller_get_uefi_priv_auth_var_fingerprint(&psa_crypto_cl=
ient_instance.base,
++						    signature_cert, signature_cert_len,
++						    output);
++}
+diff --git a/components/service/crypto/provider/crypto_provider.c b/comp=
onents/service/crypto/provider/crypto_provider.c
+index 9cd520859..4535d6dbe 100644
+--- a/components/service/crypto/provider/crypto_provider.c
++++ b/components/service/crypto/provider/crypto_provider.c
+@@ -3,12 +3,15 @@
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
++#include <protocols/common/efi/efi_status.h>
+ #include <protocols/rpc/common/packed-c/status.h>
+ #include <protocols/service/crypto/packed-c/opcodes.h>
+ #include <service/crypto/backend/crypto_backend.h>
+ #include <service/crypto/provider/crypto_provider.h>
++#include <compiler.h>
+ #include <stdint.h>
+ #include <stdlib.h>
++#include <string.h>
+=20
+ #include "crypto_partition.h"
+ #include "crypto_uuid.h"
+@@ -28,25 +31,27 @@ static rpc_status_t copy_key_handler(void *context, =
struct rpc_request *req);
+ static rpc_status_t purge_key_handler(void *context, struct rpc_request=
 *req);
+ static rpc_status_t get_key_attributes_handler(void *context, struct rp=
c_request *req);
+ static rpc_status_t verify_pkcs7_signature_handler(void *context, struc=
t rpc_request *req);
++static rpc_status_t get_uefi_priv_auth_var_fingerprint_handler(void *co=
ntext, struct rpc_request *req);
+=20
+ /* Handler mapping table for service */
+ static const struct service_handler handler_table[] =3D {
+-	{ TS_CRYPTO_OPCODE_GENERATE_KEY,           generate_key_handler },
+-	{ TS_CRYPTO_OPCODE_DESTROY_KEY,            destroy_key_handler },
+-	{ TS_CRYPTO_OPCODE_EXPORT_KEY,             export_key_handler },
+-	{ TS_CRYPTO_OPCODE_EXPORT_PUBLIC_KEY,      export_public_key_handler }=
,
+-	{ TS_CRYPTO_OPCODE_IMPORT_KEY,             import_key_handler },
+-	{ TS_CRYPTO_OPCODE_SIGN_HASH,              asymmetric_sign_handler },
+-	{ TS_CRYPTO_OPCODE_VERIFY_HASH,            asymmetric_verify_handler }=
,
+-	{ TS_CRYPTO_OPCODE_ASYMMETRIC_DECRYPT,     asymmetric_decrypt_handler =
},
+-	{ TS_CRYPTO_OPCODE_ASYMMETRIC_ENCRYPT,     asymmetric_encrypt_handler =
},
+-	{ TS_CRYPTO_OPCODE_GENERATE_RANDOM,        generate_random_handler },
+-	{ TS_CRYPTO_OPCODE_COPY_KEY,               copy_key_handler },
+-	{ TS_CRYPTO_OPCODE_PURGE_KEY,              purge_key_handler },
+-	{ TS_CRYPTO_OPCODE_GET_KEY_ATTRIBUTES,     get_key_attributes_handler =
},
+-	{ TS_CRYPTO_OPCODE_SIGN_MESSAGE,           asymmetric_sign_handler },
+-	{ TS_CRYPTO_OPCODE_VERIFY_MESSAGE,         asymmetric_verify_handler }=
,
+-	{ TS_CRYPTO_OPCODE_VERIFY_PKCS7_SIGNATURE, verify_pkcs7_signature_hand=
ler },
++	{ TS_CRYPTO_OPCODE_GENERATE_KEY,            generate_key_handler },
++	{ TS_CRYPTO_OPCODE_DESTROY_KEY,             destroy_key_handler },
++	{ TS_CRYPTO_OPCODE_EXPORT_KEY,              export_key_handler },
++	{ TS_CRYPTO_OPCODE_EXPORT_PUBLIC_KEY,       export_public_key_handler =
},
++	{ TS_CRYPTO_OPCODE_IMPORT_KEY,              import_key_handler },
++	{ TS_CRYPTO_OPCODE_SIGN_HASH,               asymmetric_sign_handler },
++	{ TS_CRYPTO_OPCODE_VERIFY_HASH,             asymmetric_verify_handler =
},
++	{ TS_CRYPTO_OPCODE_ASYMMETRIC_DECRYPT,      asymmetric_decrypt_handler=
 },
++	{ TS_CRYPTO_OPCODE_ASYMMETRIC_ENCRYPT,      asymmetric_encrypt_handler=
 },
++	{ TS_CRYPTO_OPCODE_GENERATE_RANDOM,         generate_random_handler },
++	{ TS_CRYPTO_OPCODE_COPY_KEY,                copy_key_handler },
++	{ TS_CRYPTO_OPCODE_PURGE_KEY,               purge_key_handler },
++	{ TS_CRYPTO_OPCODE_GET_KEY_ATTRIBUTES,      get_key_attributes_handler=
 },
++	{ TS_CRYPTO_OPCODE_SIGN_MESSAGE,            asymmetric_sign_handler },
++	{ TS_CRYPTO_OPCODE_VERIFY_MESSAGE,          asymmetric_verify_handler =
},
++	{ TS_CRYPTO_OPCODE_VERIFY_PKCS7_SIGNATURE,  verify_pkcs7_signature_han=
dler },
++	{ TS_CRYPTO_OPCODE_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT, get_uefi_priv_a=
uth_var_fingerprint_handler },
+ };
+=20
+ struct rpc_service_interface *
+@@ -664,33 +669,44 @@ static rpc_status_t verify_pkcs7_signature_handler=
(void *context, struct rpc_req
+ 	}
+=20
+ 	if (rpc_status =3D=3D RPC_SUCCESS) {
+-		/* Parse the public key certificate */
+-		mbedtls_x509_crt signer_certificate;
++		/* Parse the PKCS#7 DER encoded signature block */
++		mbedtls_pkcs7 pkcs7_structure;
+=20
+-		mbedtls_x509_crt_init(&signer_certificate);
++		mbedtls_pkcs7_init(&pkcs7_structure);
+=20
+-		mbedtls_status =3D mbedtls_x509_crt_parse_der(&signer_certificate, pu=
blic_key_cert,
+-							    public_key_cert_len);
++		mbedtls_status =3D mbedtls_pkcs7_parse_der(&pkcs7_structure, signatur=
e_cert,
++								signature_cert_len);
+=20
+-		if (mbedtls_status =3D=3D 0) {
+-			/* Parse the PKCS#7 DER encoded signature block */
+-			mbedtls_pkcs7 pkcs7_structure;
++		if (mbedtls_status =3D=3D MBEDTLS_PKCS7_SIGNED_DATA) {
+=20
+-			mbedtls_pkcs7_init(&pkcs7_structure);
++			/*
++			 * If a separate public key is provided, verify the signature with i=
t,
++			 * else use the key from the pkcs7 signature structure, because it i=
s
++			 * a self-signed certificate.
++			 */
++			if(public_key_cert_len) {
++				/* Parse the public key certificate */
++				mbedtls_x509_crt signer_certificate;
+=20
+-			mbedtls_status =3D mbedtls_pkcs7_parse_der(&pkcs7_structure, signatu=
re_cert,
+-								 signature_cert_len);
++				mbedtls_x509_crt_init(&signer_certificate);
+=20
+-			if (mbedtls_status =3D=3D MBEDTLS_PKCS7_SIGNED_DATA) {
+-				/* Verify hash against signed hash */
++				mbedtls_status =3D mbedtls_x509_crt_parse_der(&signer_certificate, =
public_key_cert,
++									public_key_cert_len);
++
++				if (mbedtls_status =3D=3D 0) {
++					/* Verify hash against signed hash */
++					mbedtls_status =3D mbedtls_pkcs7_signed_hash_verify(
++						&pkcs7_structure, &signer_certificate, hash, hash_len);
++				}
++
++				mbedtls_x509_crt_free(&signer_certificate);
++			} else {
+ 				mbedtls_status =3D mbedtls_pkcs7_signed_hash_verify(
+-					&pkcs7_structure, &signer_certificate, hash, hash_len);
++					&pkcs7_structure, &pkcs7_structure.private_signed_data.private_cer=
ts, hash, hash_len);
+ 			}
+-
+-			mbedtls_pkcs7_free(&pkcs7_structure);
+ 		}
+=20
+-		mbedtls_x509_crt_free(&signer_certificate);
++		mbedtls_pkcs7_free(&pkcs7_structure);
+ 	}
+=20
+ 	free(signature_cert);
+@@ -702,6 +718,128 @@ static rpc_status_t verify_pkcs7_signature_handler=
(void *context, struct rpc_req
+=20
+ 	return rpc_status;
+ }
++
++/*
++ * Official value: http://www.oid-info.com/get/2.5.4.3
++ * Hex converter: https://misc.daniel-marschall.de/asn.1/oid-converter/=
online.php
++ */
++static const mbedtls_asn1_buf* findCommonName(const mbedtls_x509_name *=
name)
++{
++	uint8_t CN_oid_tag =3D 0x06;
++	uint8_t CN_oid_len =3D 0x03;
++	uint8_t CN_oid_val[3] =3D {0x55, 0x04, 0x03};
++
++	while (name)
++	{
++		if (name->oid.tag =3D=3D CN_oid_tag && name->oid.len =3D=3D CN_oid_le=
n) {
++			if (name->oid.p !=3D NULL) {
++				if (!memcmp(name->oid.p, CN_oid_val, CN_oid_len))
++					return &name->val;
++			}
++		}
++
++		name =3D name->next;
++	}
++
++	return NULL;
++}
++
++static rpc_status_t get_uefi_priv_auth_var_fingerprint_handler(void *co=
ntext, struct rpc_request *req)
++{
++	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
++	struct rpc_buffer *req_buf =3D &req->request;
++	const struct crypto_provider_serializer *serializer =3D get_crypto_ser=
ializer(context, req);
++
++	int mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++
++	uint8_t *signature_cert =3D NULL;
++	uint64_t signature_cert_len =3D 0;
++
++	if (serializer) {
++		/* First collect the lengths of the field */
++		rpc_status =3D serializer->deserialize_get_uefi_priv_auth_var_fingerp=
rint_req(
++			req_buf, NULL, &signature_cert_len);
++
++		if (rpc_status =3D=3D RPC_SUCCESS) {
++			/* Allocate the needed space and get the data */
++			signature_cert =3D (uint8_t *)malloc(signature_cert_len);
++
++			if (signature_cert) {
++				rpc_status =3D serializer->deserialize_get_uefi_priv_auth_var_finge=
rprint_req(
++					req_buf, signature_cert, &signature_cert_len);
++			} else {
++				rpc_status =3D RPC_ERROR_RESOURCE_FAILURE;
++			}
++		}
++	}
++
++	if (rpc_status =3D=3D RPC_SUCCESS) {
++		/* Parse the PKCS#7 DER encoded signature block */
++		mbedtls_pkcs7 pkcs7_structure;
++
++		mbedtls_pkcs7_init(&pkcs7_structure);
++
++		mbedtls_status =3D mbedtls_pkcs7_parse_der(&pkcs7_structure, signatur=
e_cert,
++								signature_cert_len);
++
++		if (mbedtls_status =3D=3D MBEDTLS_PKCS7_SIGNED_DATA) {
++
++			uint8_t output_buffer[PSA_HASH_MAX_SIZE] =3D  { 0 };
++			size_t __maybe_unused output_size =3D 0;
++			const mbedtls_asn1_buf *signerCertCN =3D NULL;
++			const mbedtls_x509_crt *topLevelCert =3D &pkcs7_structure.private_si=
gned_data.private_certs;
++			const mbedtls_x509_buf *toplevelCertTbs =3D NULL;
++			struct rpc_buffer *resp_buf =3D &req->response;;
++			psa_hash_operation_t op =3D PSA_HASH_OPERATION_INIT;
++
++			/* Find common name field of the signing certificate, which is the f=
irst in the chain */
++			signerCertCN =3D findCommonName(&topLevelCert->subject);
++			if (!signerCertCN)
++				mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++
++			/* Get the TopLevel certificate which is the last in the chain */
++			while(topLevelCert->next)
++				topLevelCert =3D topLevelCert->next;
++			toplevelCertTbs =3D &topLevelCert->tbs;
++
++			/* Hash the data to create the fingerprint */
++			op =3D psa_hash_operation_init();
++
++			if (psa_hash_setup(&op, PSA_ALG_SHA_256) !=3D PSA_SUCCESS)
++				mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++
++			if (psa_hash_update(&op, signerCertCN->p, signerCertCN->len)) {
++				psa_hash_abort(&op);
++				mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++			}
++
++			if (psa_hash_update(&op, toplevelCertTbs->p, toplevelCertTbs->len)) =
{
++				psa_hash_abort(&op);
++				mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++			}
++
++			if (psa_hash_finish(&op, (uint8_t*)&output_buffer, PSA_HASH_MAX_SIZE=
, &output_size)) {
++				psa_hash_abort(&op);
++				mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++			}
++
++			/* Clear the remaining part of the buffer for consistency */
++			memset(&output_buffer[output_size], 0, PSA_HASH_MAX_SIZE - output_si=
ze);
++
++			rpc_status =3D serializer->serialize_get_uefi_priv_auth_var_fingerpr=
int_resp(
++				resp_buf, (uint8_t*)&output_buffer);
++		}
++
++		mbedtls_pkcs7_free(&pkcs7_structure);
++	}
++
++	free(signature_cert);
++
++	/* Provide the result of the verification */
++	req->service_status =3D (mbedtls_status =3D=3D MBEDTLS_PKCS7_SIGNED_DA=
TA) ? EFI_SUCCESS : EFI_COMPROMISED_DATA;
++
++	return rpc_status;
++}
+ #else
+ static rpc_status_t verify_pkcs7_signature_handler(void *context, struc=
t rpc_request *req)
+ {
+@@ -710,4 +848,12 @@ static rpc_status_t verify_pkcs7_signature_handler(=
void *context, struct rpc_req
+=20
+ 	return RPC_ERROR_INTERNAL;
+ }
++
++static rpc_status_t get_uefi_priv_auth_var_fingerprint_handler(void *co=
ntext, struct rpc_request *req)
++{
++	(void)context;
++	(void)req;
++
++	return RPC_ERROR_INTERNAL;
++}
+ #endif
+diff --git a/components/service/crypto/provider/serializer/crypto_provid=
er_serializer.h b/components/service/crypto/provider/serializer/crypto_pr=
ovider_serializer.h
+index bd5336c3d..2b965afdb 100644
+--- a/components/service/crypto/provider/serializer/crypto_provider_seri=
alizer.h
++++ b/components/service/crypto/provider/serializer/crypto_provider_seri=
alizer.h
+@@ -126,6 +126,14 @@ struct crypto_provider_serializer {
+ 							       uint8_t *hash, uint64_t *hash_len,
+ 							       uint8_t *public_key_cert,
+ 							       uint64_t *public_key_cert_len);
++
++	/* Operation: get_uefi_priv_auth_var_fingerprintentifier */
++	rpc_status_t (*deserialize_get_uefi_priv_auth_var_fingerprint_req)(con=
st struct rpc_buffer *req_buf,
++								uint8_t *signed_data,
++								uint64_t *signed_data_len);
++
++	rpc_status_t (*serialize_get_uefi_priv_auth_var_fingerprint_resp)(stru=
ct rpc_buffer *resp_buf,
++							       const uint8_t *output);
+ };
+=20
+ #endif /* CRYPTO_PROVIDER_SERIALIZER_H */
+diff --git a/components/service/crypto/provider/serializer/packed-c/pack=
edc_crypto_provider_serializer.c b/components/service/crypto/provider/ser=
ializer/packed-c/packedc_crypto_provider_serializer.c
+index 050ef2f7d..89e07e2c8 100644
+--- a/components/service/crypto/provider/serializer/packed-c/packedc_cry=
pto_provider_serializer.c
++++ b/components/service/crypto/provider/serializer/packed-c/packedc_cry=
pto_provider_serializer.c
+@@ -22,6 +22,7 @@
+ #include <protocols/service/crypto/packed-c/sign_hash.h>
+ #include <protocols/service/crypto/packed-c/verify_hash.h>
+ #include <protocols/service/crypto/packed-c/verify_pkcs7_signature.h>
++#include <protocols/service/crypto/packed-c/get_uefi_priv_auth_var_fing=
erprint.h>
+ #include <service/crypto/backend/crypto_backend.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -675,6 +676,57 @@ static rpc_status_t deserialize_verify_pkcs7_signat=
ure_req(
+ 	return rpc_status;
+ }
+=20
++/* Operation: get_uefi_priv_auth_var_fingerprintentifier */
++static rpc_status_t deserialize_get_uefi_priv_auth_var_fingerprint_req(=
const struct rpc_buffer *req_buf,
++							uint8_t *signed_data,
++							uint64_t *signed_data_len)
++{
++	rpc_status_t rpc_status =3D RPC_ERROR_INVALID_REQUEST_BODY;
++
++	if (req_buf->data_length) {
++		struct tlv_const_iterator req_iter;
++		struct tlv_record decoded_record;
++
++		rpc_status =3D RPC_SUCCESS;
++
++		tlv_const_iterator_begin(&req_iter, (uint8_t *)req_buf->data, req_buf=
->data_length);
++
++		if (tlv_find_decode(&req_iter, TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGE=
RPRINT_IN_TAG_SIGNATURE,
++				    &decoded_record)) {
++			*signed_data_len =3D decoded_record.length;
++
++			if (signed_data)
++				memcpy(signed_data, decoded_record.value, decoded_record.length);
++		} else {
++			/* Default to a zero length */
++			*signed_data_len =3D 0;
++		}
++	}
++
++	return rpc_status;
++}
++
++static rpc_status_t serialize_get_uefi_priv_auth_var_fingerprint_resp(s=
truct rpc_buffer *resp_buf,
++							const uint8_t *output)
++{
++	rpc_status_t rpc_status =3D RPC_ERROR_INTERNAL;
++	struct tlv_iterator resp_iter;
++	struct tlv_record out_record;
++
++	out_record.tag =3D TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_OUT_TA=
G_IDENTIFIER;
++	out_record.length =3D PSA_HASH_MAX_SIZE;
++	out_record.value =3D output;
++
++	tlv_iterator_begin(&resp_iter, resp_buf->data, resp_buf->size);
++
++	if (tlv_encode(&resp_iter, &out_record)) {
++		resp_buf->data_length =3D tlv_required_space(PSA_HASH_MAX_SIZE);
++		rpc_status =3D RPC_SUCCESS;
++	}
++
++	return rpc_status;
++}
++
+ /* Singleton method to provide access to the serializer instance */
+ const struct crypto_provider_serializer *packedc_crypto_provider_serial=
izer_instance(void)
+ {
+@@ -704,6 +756,8 @@ const struct crypto_provider_serializer *packedc_cry=
pto_provider_serializer_inst
+ 		deserialize_generate_random_req,
+ 		serialize_generate_random_resp,
+ 		deserialize_verify_pkcs7_signature_req,
++		deserialize_get_uefi_priv_auth_var_fingerprint_req,
++		serialize_get_uefi_priv_auth_var_fingerprint_resp
+ 	};
+=20
+ 	return &instance;
+diff --git a/components/service/uefi/smm_variable/backend/direct/uefi_di=
rect_backend.c b/components/service/uefi/smm_variable/backend/direct/uefi=
_direct_backend.c
+index bf978c5dd..c7ca07254 100644
+--- a/components/service/uefi/smm_variable/backend/direct/uefi_direct_ba=
ckend.c
++++ b/components/service/uefi/smm_variable/backend/direct/uefi_direct_ba=
ckend.c
+@@ -9,6 +9,8 @@
+ #include <mbedtls/pkcs7.h>
+ #include <mbedtls/x509_crt.h>
+ #include <stdint.h>
++#include <string.h>
++#include <compiler.h>
+=20
+ int verify_pkcs7_signature(const uint8_t *signature_cert, uint64_t sign=
ature_cert_len,
+ 			   const uint8_t *hash, uint64_t hash_len, const uint8_t *public_key=
_cert,
+@@ -46,3 +48,91 @@ int verify_pkcs7_signature(const uint8_t *signature_c=
ert, uint64_t signature_cer
+=20
+ 	return mbedtls_status;
+ }
++
++/*
++ * Official value: http://www.oid-info.com/get/2.5.4.3
++ * Hex converter: https://misc.daniel-marschall.de/asn.1/oid-converter/=
online.php
++ */
++static const mbedtls_asn1_buf* findCommonName(const mbedtls_x509_name *=
name)
++{
++	uint8_t CN_oid_tag =3D 0x06;
++	uint8_t CN_oid_len =3D 0x03;
++	uint8_t CN_oid_val[3] =3D {0x55, 0x04, 0x03};
++
++	while (name)
++	{
++		if (name->oid.tag =3D=3D CN_oid_tag && name->oid.len =3D=3D CN_oid_le=
n) {
++			if (name->oid.p !=3D NULL) {
++				if (!memcmp(name->oid.p, CN_oid_val, CN_oid_len))
++					return &name->val;
++			}
++		}
++
++		name =3D name->next;
++	}
++
++	return NULL;
++}
++
++int get_uefi_priv_auth_var_fingerprint_handler(const uint8_t *signature=
_cert,
++				    uint64_t signature_cert_len,
++				    uint8_t *output)
++{
++	int mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++
++	/* Parse the PKCS#7 DER encoded signature block */
++	mbedtls_pkcs7 pkcs7_structure;
++
++	mbedtls_pkcs7_init(&pkcs7_structure);
++
++	mbedtls_status =3D mbedtls_pkcs7_parse_der(&pkcs7_structure, signature=
_cert,
++							signature_cert_len);
++
++	if (mbedtls_status =3D=3D MBEDTLS_PKCS7_SIGNED_DATA) {
++
++		uint8_t output_buffer[PSA_HASH_MAX_SIZE] =3D  { 0 };
++		size_t __maybe_unused output_size =3D 0;
++		const mbedtls_asn1_buf *signerCertCN =3D NULL;
++		const mbedtls_x509_crt *topLevelCert =3D &pkcs7_structure.private_sig=
ned_data.private_certs;
++		const mbedtls_x509_buf *toplevelCertTbs =3D NULL;
++		psa_hash_operation_t op =3D PSA_HASH_OPERATION_INIT;
++
++		/* Find common name field of the signing certificate, which is the fi=
rst in the chain */
++		signerCertCN =3D findCommonName(&topLevelCert->subject);
++		if (!signerCertCN)
++			mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++
++		/* Get the TopLevel certificate which is the last in the chain */
++		while(topLevelCert->next)
++			topLevelCert =3D topLevelCert->next;
++		toplevelCertTbs =3D &topLevelCert->tbs;
++
++		/* Hash the data to create the fingerprint */
++		op =3D psa_hash_operation_init();
++
++		if (psa_hash_setup(&op, PSA_ALG_SHA_256) !=3D PSA_SUCCESS)
++			mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++
++		if (psa_hash_update(&op, signerCertCN->p, signerCertCN->len)) {
++			psa_hash_abort(&op);
++			mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++		}
++
++		if (psa_hash_update(&op, toplevelCertTbs->p, toplevelCertTbs->len)) {
++			psa_hash_abort(&op);
++			mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++		}
++
++		if (psa_hash_finish(&op, (uint8_t*)&output_buffer, PSA_HASH_MAX_SIZE,=
 &output_size)) {
++			psa_hash_abort(&op);
++			mbedtls_status =3D MBEDTLS_ERR_PKCS7_VERIFY_FAIL;
++		}
++
++		/* Clear the remaining part of the buffer for consistency */
++		memset(&output_buffer[output_size], 0, PSA_HASH_MAX_SIZE - output_siz=
e);
++	}
++
++	mbedtls_pkcs7_free(&pkcs7_structure);
++
++	return mbedtls_status;
++}
+diff --git a/deployments/smm-gateway/smm-gateway.cmake b/deployments/smm=
-gateway/smm-gateway.cmake
+index e5ee03b60..de519892d 100644
+--- a/deployments/smm-gateway/smm-gateway.cmake
++++ b/deployments/smm-gateway/smm-gateway.cmake
+@@ -17,6 +17,11 @@ include(${TS_ROOT}/external/MbedTLS/MbedTLS.cmake)
+ target_link_libraries(smm-gateway PRIVATE MbedTLS::mbedcrypto)
+ target_link_libraries(smm-gateway PRIVATE MbedTLS::mbedx509)
+=20
++# Pass the location of the mbedtls config file to C preprocessor.
++target_compile_definitions(smm-gateway PRIVATE
++		MBEDTLS_USER_CONFIG_FILE=3D"${MBEDTLS_USER_CONFIG_FILE}"
++)
++
+ target_compile_definitions(smm-gateway PRIVATE
+ 	-DUEFI_INTERNAL_CRYPTO
+ )
+diff --git a/protocols/service/crypto/packed-c/get_uefi_priv_auth_var_fi=
ngerprint.h b/protocols/service/crypto/packed-c/get_uefi_priv_auth_var_fi=
ngerprint.h
+new file mode 100644
+index 000000000..29964b33c
+--- /dev/null
++++ b/protocols/service/crypto/packed-c/get_uefi_priv_auth_var_fingerpri=
nt.h
+@@ -0,0 +1,21 @@
++/*
++ * Copyright (c) 2024, Arm Limited and Contributors. All rights reserve=
d.
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H
++#define TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H
++
++#include <stdint.h>
++
++/* Variable length output parameter tags */
++enum {
++	TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_OUT_TAG_IDENTIFIER =3D 1,
++};
++
++/* Variable length input parameter tags */
++enum {
++	TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_IN_TAG_SIGNATURE =3D 1,
++};
++
++#endif /* TS_CRYPTO_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT_H */
+diff --git a/protocols/service/crypto/packed-c/opcodes.h b/protocols/ser=
vice/crypto/packed-c/opcodes.h
+index 35b81599b..8bc2b49b0 100644
+--- a/protocols/service/crypto/packed-c/opcodes.h
++++ b/protocols/service/crypto/packed-c/opcodes.h
+@@ -28,6 +28,7 @@
+ #define TS_CRYPTO_OPCODE_SIGN_MESSAGE           (TS_CRYPTO_OPCODE_BASE =
+ 16)
+ #define TS_CRYPTO_OPCODE_VERIFY_MESSAGE         (TS_CRYPTO_OPCODE_BASE =
+ 17)
+ #define TS_CRYPTO_OPCODE_VERIFY_PKCS7_SIGNATURE (TS_CRYPTO_OPCODE_BASE =
+ 18)
++#define TS_CRYPTO_OPCODE_GET_UEFI_PRIV_AUTH_VAR_FINGERPRINT (TS_CRYPTO_=
OPCODE_BASE + 19)
+=20
+ /* Hash operations */
+ #define TS_CRYPTO_OPCODE_HASH_BASE              (0x0200)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0015-Add-timestamp-validation-for-uefi-variables.patch b/meta-arm-bsp/rec=
ipes-security/trusted-services/corstone1000/0015-Add-timestamp-validation=
-for-uefi-variables.patch
new file mode 100644
index 00000000..26e7df5f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Ad=
d-timestamp-validation-for-uefi-variables.patch
@@ -0,0 +1,146 @@
+From 5b418e141aadcb6604406f75e156317bd143d898 Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Fri, 5 Apr 2024 11:27:15 +0200
+Subject: [PATCH 1/3] Add timestamp validation for uefi variables
+
+Return failure if uefi variable creation or update is not
+requested with newer timestamp.
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27955]
+---
+ .../backend/uefi_variable_store.c             | 35 +++++++++++++++----
+ .../smm_variable/backend/variable_index.c     |  1 +
+ .../smm_variable/backend/variable_index.h     |  1 +
+ 3 files changed, 30 insertions(+), 7 deletions(-)
+
+diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
+index c1691dc8f..1b624f0c9 100644
+--- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
+@@ -76,6 +76,7 @@ static efi_status_t verify_var_by_key_var(const efi_da=
ta_map *new_var,
+ 					  const uint8_t *hash_buffer, size_t hash_len);
+=20
+ static efi_status_t authenticate_variable(const struct uefi_variable_st=
ore *context,
++					  EFI_TIME *timestamp,
+ 					  SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var);
+ #endif
+=20
+@@ -197,6 +198,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
+ 					      const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
+ {
+ 	bool should_sync_index =3D false;
++	EFI_TIME timestamp =3D { 0 };
+=20
+ 	/* Validate incoming request */
+ 	efi_status_t status =3D check_name_terminator(var->Name, var->NameSize=
);
+@@ -225,6 +227,9 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
+ 			return EFI_OUT_OF_RESOURCES;
+ 	}
+=20
++	/* Save the timestamp into a buffer, which can be overwritten by the a=
uthentication function */
++	memcpy(&timestamp, &info->metadata.timestamp, sizeof(EFI_TIME));
++
+ 	/* Control access */
+ 	status =3D check_access_permitted_on_set(context, info, var);
+=20
+@@ -240,7 +245,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
+ 			if (info->metadata.attributes &
+ 			    EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS) {
+ 				status =3D authenticate_variable(
+-					context, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)var);
++					context, &timestamp, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)v=
ar);
+=20
+ 				if (status !=3D EFI_SUCCESS)
+ 					return status;
+@@ -326,7 +331,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
+ 			 */
+ 			if (var->Attributes & EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_AC=
CESS) {
+ 				status =3D authenticate_variable(
+-					context, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)var);
++					context, &timestamp, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)v=
ar);
+=20
+ 				if (status !=3D EFI_SUCCESS)
+ 					return status;
+@@ -358,9 +363,11 @@ efi_status_t uefi_variable_store_set_variable(const=
 struct uefi_variable_store *
+ 		if (should_sync_index)
+ 			status =3D sync_variable_index(context);
+=20
+-		/* Store any variable data to the storage backend */
+-		if (info->is_variable_set && (status =3D=3D EFI_SUCCESS))
++		/* Store any variable data to the storage backend with the updated me=
tadata */
++		if (info->is_variable_set && (status =3D=3D EFI_SUCCESS)) {
++			memcpy(&info->metadata.timestamp, &timestamp, sizeof(EFI_TIME));
+ 			status =3D store_variable_data(context, info, var);
++		}
+ 	}
+=20
+ 	variable_index_remove_unused_entry(&context->variable_index, info);
+@@ -1106,6 +1113,7 @@ static efi_status_t verify_var_by_key_var(const ef=
i_data_map *new_var,
+  * then verifies it.
+  */
+ static efi_status_t authenticate_variable(const struct uefi_variable_st=
ore *context,
++					  EFI_TIME *timestamp,
+ 					  SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
+ {
+ 	efi_status_t status =3D EFI_SUCCESS;
+@@ -1223,9 +1231,7 @@ static efi_status_t authenticate_variable(const st=
ruct uefi_variable_store *cont
+ 	 *
+ 	 * UEFI: Page 253
+ 	 * 2. Verify that Pad1, Nanosecond, TimeZone, Daylight and Pad2 compon=
ents
+-	 * of the TimeStamp value are set to zero. Unless the EFI_VARIABLE_APP=
END_WRITE
+-	 * attribute is set, verify that the TimeStamp value is later than the=
 current
+-	 * timestamp value associated with the variable
++	 * of the TimeStamp value are set to zero.
+ 	 */
+ 	if ((var_map.efi_auth_descriptor->TimeStamp.Pad1 !=3D 0) ||
+ 	    (var_map.efi_auth_descriptor->TimeStamp.Pad2 !=3D 0) ||
+@@ -1235,6 +1241,21 @@ static efi_status_t authenticate_variable(const s=
truct uefi_variable_store *cont
+ 		return EFI_SECURITY_VIOLATION;
+ 	}
+=20
++	/**
++	 * UEFI: Page 253
++	 * Unless the EFI_VARIABLE_APPEND_WRITE attribute is set, verify
++	 * that the TimeStamp value is later than the current
++	 * timestamp value associated with the variable
++	 */
++	if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
++		if (memcmp(&var_map.efi_auth_descriptor->TimeStamp, timestamp, sizeof=
(EFI_GUID)) <=3D 0) {
++			EMSG("Timestamp violation");
++			return EFI_SECURITY_VIOLATION;
++		}
++
++		/* Save new timestamp */
++		memcpy(timestamp, &var_map.efi_auth_descriptor->TimeStamp, sizeof(EFI=
_TIME));
++	}
+ 	/* Calculate hash for the variable only once */
+ 	hash_result =3D calc_variable_hash(&var_map, (uint8_t *)&hash_buffer, =
sizeof(hash_buffer),
+ 					 &hash_len);
+diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.c b/components/service/uefi/smm_variable/backend/variable_index.c
+index e2fe6dd38..f4194d2d3 100644
+--- a/components/service/uefi/smm_variable/backend/variable_index.c
++++ b/components/service/uefi/smm_variable/backend/variable_index.c
+@@ -198,6 +198,7 @@ static struct variable_entry *add_entry(const struct=
 variable_index *context, co
+ 			/* Initialize metadata */
+ 			info->metadata.uid =3D generate_uid(context, guid, name_size, name);
+ 			info->metadata.guid =3D *guid;
++			memset(&info->metadata.timestamp, 0, sizeof(EFI_TIME));
+ 			info->metadata.attributes =3D 0;
+ 			info->metadata.name_size =3D name_size;
+ 			memcpy(info->metadata.name, name, name_size);
+diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.h b/components/service/uefi/smm_variable/backend/variable_index.h
+index 5d3b7a7c6..7eef7b86b 100644
+--- a/components/service/uefi/smm_variable/backend/variable_index.h
++++ b/components/service/uefi/smm_variable/backend/variable_index.h
+@@ -32,6 +32,7 @@ extern "C" {
+  */
+ struct variable_metadata {
+ 	EFI_GUID guid;
++	EFI_TIME timestamp;
+ 	size_t name_size;
+ 	int16_t name[VARIABLE_INDEX_MAX_NAME_SIZE];
+ 	uint32_t attributes;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0016-Isolate-common-uefi-variable-authentication-steps.patch b/meta-arm-b=
sp/recipes-security/trusted-services/corstone1000/0016-Isolate-common-uef=
i-variable-authentication-steps.patch
new file mode 100644
index 00000000..16ca63b3
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Is=
olate-common-uefi-variable-authentication-steps.patch
@@ -0,0 +1,282 @@
+From 19e79008e0fa3193b54bf6499516dc75cb10f6ec Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Thu, 11 Apr 2024 13:42:03 +0200
+Subject: [PATCH 2/3] Isolate common uefi variable authentication steps
+
+Currently all auth variables are authenticated with the secure boot
+keys. To introduce corrent check for Private Authenticated Variables
+first separate the common steps from the secure boot related steps.
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27956]
+---
+ .../backend/uefi_variable_store.c             | 191 ++++++++++--------
+ 1 file changed, 103 insertions(+), 88 deletions(-)
+
+diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
+index 1b624f0c9..1384d0def 100644
+--- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
+@@ -78,6 +78,12 @@ static efi_status_t verify_var_by_key_var(const efi_d=
ata_map *new_var,
+ static efi_status_t authenticate_variable(const struct uefi_variable_st=
ore *context,
+ 					  EFI_TIME *timestamp,
+ 					  SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var);
++
++static efi_status_t authenticate_secure_boot_variable(const struct uefi=
_variable_store *context,
++						      efi_data_map* var_map,
++						      uint8_t* hash_buffer,
++						      size_t hash_len,
++						      uint64_t max_variable_size);
+ #endif
+=20
+ static efi_status_t store_variable_data(const struct uefi_variable_stor=
e *context,
+@@ -1118,30 +1124,109 @@ static efi_status_t authenticate_variable(const=
 struct uefi_variable_store *cont
+ {
+ 	efi_status_t status =3D EFI_SUCCESS;
+ 	EFI_GUID pkcs7_guid =3D EFI_CERT_TYPE_PKCS7_GUID;
+-	EFI_GUID global_variable_guid =3D EFI_GLOBAL_VARIABLE;
+-	EFI_GUID security_database_guid =3D EFI_IMAGE_SECURITY_DATABASE_GUID;
+ 	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO variable_info =3D { 0, 0,=
 0, 0 };
+-	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *pk_variable =3D NULL;
+-	size_t pk_payload_size =3D 0;
+ 	efi_data_map var_map =3D { NULL, NULL, NULL, 0, 0, NULL, 0, NULL };
+ 	uint8_t hash_buffer[PSA_HASH_MAX_SIZE];
+ 	size_t hash_len =3D 0;
+-	bool hash_result =3D false;
+=20
+ 	/* Create a map of the fields of the new variable including the auth h=
eader */
+ 	if (!init_efi_data_map(var, true, &var_map))
+ 		return EFI_SECURITY_VIOLATION;
+=20
+-	/* database variables can be verified by either PK or KEK while images
+-	 * should be checked by db and dbx so the length of two will be enough=
.
+-	 */
+-	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *allowed_key_store_variables[=
] =3D { NULL, NULL };
+-
+ 	/* Find the maximal size of variables for the GetVariable operation */
+ 	status =3D uefi_variable_store_query_variable_info(context, &variable_=
info);
+ 	if (status !=3D EFI_SUCCESS)
+ 		return EFI_SECURITY_VIOLATION;
+=20
++	/**
++	 * UEFI: Page 246
++	 * If the EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS attribute=
 is set in a
++	 * SetVariable() call, and firmware does not support signature type of=
 the certificate
++	 * included in the EFI_VARIABLE_AUTHENTICATION_2 descriptor, then the =
SetVariable() call
++	 * shall return EFI_INVALID_PARAMETER. The list of signature types sup=
ported by the
++	 * firmware is defined by the SignatureSupport variable. Signature typ=
e of the certificate
++	 * is defined by its digest and encryption algorithms.
++	 */
++	/* TODO: Should support WIN_CERT_TYPE_PKCS_SIGNED_DATA and WIN_CERT_TY=
PE_EFI_PKCS115 */
++	if (var_map.efi_auth_descriptor->AuthInfo.Hdr.wCertificateType !=3D WI=
N_CERT_TYPE_EFI_GUID)
++		return EFI_INVALID_PARAMETER;
++
++	/* Only a CertType of EFI_CERT_TYPE_PKCS7_GUID is accepted */
++	if (!compare_guid(&var_map.efi_auth_descriptor->AuthInfo.CertType, &pk=
cs7_guid))
++		return EFI_SECURITY_VIOLATION;
++
++	/**
++	 * Time associated with the authentication descriptor. For the TimeSta=
mp value,
++	 * components Pad1, Nanosecond, TimeZone, Daylight and Pad2 shall be s=
et to 0.
++	 * This means that the time shall always be expressed in GMT.
++	 *
++	 * UEFI: Page 253
++	 * 2. Verify that Pad1, Nanosecond, TimeZone, Daylight and Pad2 compon=
ents
++	 * of the TimeStamp value are set to zero.
++	 */
++	if ((var_map.efi_auth_descriptor->TimeStamp.Pad1 !=3D 0) ||
++	    (var_map.efi_auth_descriptor->TimeStamp.Pad2 !=3D 0) ||
++	    (var_map.efi_auth_descriptor->TimeStamp.Nanosecond !=3D 0) ||
++	    (var_map.efi_auth_descriptor->TimeStamp.TimeZone !=3D 0) ||
++	    (var_map.efi_auth_descriptor->TimeStamp.Daylight !=3D 0)) {
++		return EFI_SECURITY_VIOLATION;
++	}
++
++	/**
++	 * UEFI: Page 253
++	 * Unless the EFI_VARIABLE_APPEND_WRITE attribute is set, verify
++	 * that the TimeStamp value is later than the current
++	 * timestamp value associated with the variable
++	 */
++	if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
++		if (memcmp(&var_map.efi_auth_descriptor->TimeStamp, timestamp, sizeof=
(EFI_GUID)) <=3D 0) {
++			EMSG("Timestamp violation");
++			return EFI_SECURITY_VIOLATION;
++		}
++
++		/* Save new timestamp */
++		memcpy(timestamp, &var_map.efi_auth_descriptor->TimeStamp, sizeof(EFI=
_TIME));
++	}
++	/* Calculate hash for the variable only once */
++	if (calc_variable_hash(&var_map, (uint8_t *)&hash_buffer, sizeof(hash_=
buffer), &hash_len) =3D=3D 0) {
++		status =3D EFI_SECURITY_VIOLATION;
++	}
++
++	/* Run Secure Boot related authentication steps */
++	status =3D authenticate_secure_boot_variable(context, &var_map, (uint8=
_t*) &hash_buffer, hash_len, variable_info.MaximumVariableSize);
++
++	/* Remove the authentication header from the variable if the authentic=
ation is successful */
++	if (status =3D=3D EFI_SUCCESS) {
++		uint8_t *smm_payload =3D
++			(uint8_t *)var + SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSE=
T(var);
++
++		memmove(smm_payload, var_map.payload, var_map.payload_len);
++		memset((uint8_t *)smm_payload + var_map.payload_len, 0,
++		       var_map.efi_auth_descriptor_len);
++
++		var->DataSize -=3D var_map.efi_auth_descriptor_len;
++	}
++
++	return status;
++}
++
++static efi_status_t authenticate_secure_boot_variable(const struct uefi=
_variable_store *context,
++						      efi_data_map* var_map,
++						      uint8_t* hash_buffer,
++						      size_t hash_len,
++						      uint64_t max_variable_size)
++{
++	efi_status_t status =3D EFI_SUCCESS;
++	EFI_GUID global_variable_guid =3D EFI_GLOBAL_VARIABLE;
++	EFI_GUID security_database_guid =3D EFI_IMAGE_SECURITY_DATABASE_GUID;
++	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *pk_variable =3D NULL;
++	size_t pk_payload_size =3D 0;
++
++	/* database variables can be verified by either PK or KEK while images
++	 * should be checked by db and dbx so the length of two will be enough=
.
++	 */
++	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *allowed_key_store_variables[=
] =3D { NULL, NULL };
++
+ 	/**
+ 	 * UEFI: Page 253
+ 	 * 3. If the variable SetupMode=3D=3D1, and the variable is a secure
+@@ -1166,14 +1251,14 @@ static efi_status_t authenticate_variable(const =
struct uefi_variable_store *cont
+ 	 * Platform Key is checked to enable or disable authentication.
+ 	 */
+ 	create_smm_variable(&pk_variable, sizeof(EFI_PLATFORM_KEY_NAME),
+-			    variable_info.MaximumVariableSize, (uint8_t *)EFI_PLATFORM_KEY_N=
AME,
++			    max_variable_size, (uint8_t *)EFI_PLATFORM_KEY_NAME,
+ 			    &global_variable_guid);
+=20
+ 	if (!pk_variable)
+ 		return EFI_OUT_OF_RESOURCES;
+=20
+ 	status =3D uefi_variable_store_get_variable(
+-		context, pk_variable, variable_info.MaximumVariableSize, &pk_payload_=
size);
++		context, pk_variable, max_variable_size, &pk_payload_size);
+=20
+ 	/* If PK does not exist authentication is disabled */
+ 	if (status !=3D EFI_SUCCESS) {
+@@ -1207,66 +1292,8 @@ static efi_status_t authenticate_variable(const s=
truct uefi_variable_store *cont
+ 		goto end;
+ 	}
+=20
+-	/**
+-	 * UEFI: Page 246
+-	 * If the EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS attribute=
 is set in a
+-	 * SetVariable() call, and firmware does not support signature type of=
 the certificate
+-	 * included in the EFI_VARIABLE_AUTHENTICATION_2 descriptor, then the =
SetVariable() call
+-	 * shall return EFI_INVALID_PARAMETER. The list of signature types sup=
ported by the
+-	 * firmware is defined by the SignatureSupport variable. Signature typ=
e of the certificate
+-	 * is defined by its digest and encryption algorithms.
+-	 */
+-	/* TODO: Should support WIN_CERT_TYPE_PKCS_SIGNED_DATA and WIN_CERT_TY=
PE_EFI_PKCS115 */
+-	if (var_map.efi_auth_descriptor->AuthInfo.Hdr.wCertificateType !=3D WI=
N_CERT_TYPE_EFI_GUID)
+-		return EFI_INVALID_PARAMETER;
+-
+-	/* Only a CertType of EFI_CERT_TYPE_PKCS7_GUID is accepted */
+-	if (!compare_guid(&var_map.efi_auth_descriptor->AuthInfo.CertType, &pk=
cs7_guid))
+-		return EFI_SECURITY_VIOLATION;
+-
+-	/**
+-	 * Time associated with the authentication descriptor. For the TimeSta=
mp value,
+-	 * components Pad1, Nanosecond, TimeZone, Daylight and Pad2 shall be s=
et to 0.
+-	 * This means that the time shall always be expressed in GMT.
+-	 *
+-	 * UEFI: Page 253
+-	 * 2. Verify that Pad1, Nanosecond, TimeZone, Daylight and Pad2 compon=
ents
+-	 * of the TimeStamp value are set to zero.
+-	 */
+-	if ((var_map.efi_auth_descriptor->TimeStamp.Pad1 !=3D 0) ||
+-	    (var_map.efi_auth_descriptor->TimeStamp.Pad2 !=3D 0) ||
+-	    (var_map.efi_auth_descriptor->TimeStamp.Nanosecond !=3D 0) ||
+-	    (var_map.efi_auth_descriptor->TimeStamp.TimeZone !=3D 0) ||
+-	    (var_map.efi_auth_descriptor->TimeStamp.Daylight !=3D 0)) {
+-		return EFI_SECURITY_VIOLATION;
+-	}
+-
+-	/**
+-	 * UEFI: Page 253
+-	 * Unless the EFI_VARIABLE_APPEND_WRITE attribute is set, verify
+-	 * that the TimeStamp value is later than the current
+-	 * timestamp value associated with the variable
+-	 */
+-	if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
+-		if (memcmp(&var_map.efi_auth_descriptor->TimeStamp, timestamp, sizeof=
(EFI_GUID)) <=3D 0) {
+-			EMSG("Timestamp violation");
+-			return EFI_SECURITY_VIOLATION;
+-		}
+-
+-		/* Save new timestamp */
+-		memcpy(timestamp, &var_map.efi_auth_descriptor->TimeStamp, sizeof(EFI=
_TIME));
+-	}
+-	/* Calculate hash for the variable only once */
+-	hash_result =3D calc_variable_hash(&var_map, (uint8_t *)&hash_buffer, =
sizeof(hash_buffer),
+-					 &hash_len);
+-
+-	if (!hash_result) {
+-		status =3D EFI_SECURITY_VIOLATION;
+-		goto end;
+-	}
+-
+-	status =3D select_verification_keys(var_map, global_variable_guid, sec=
urity_database_guid,
+-					  variable_info.MaximumVariableSize,
++	status =3D select_verification_keys(*var_map, global_variable_guid, se=
curity_database_guid,
++					  max_variable_size,
+ 					  &allowed_key_store_variables[0]);
+=20
+ 	if (status !=3D EFI_SUCCESS)
+@@ -1280,8 +1307,8 @@ static efi_status_t authenticate_variable(const st=
ruct uefi_variable_store *cont
+ 			continue;
+=20
+ 		status =3D uefi_variable_store_get_variable(context, allowed_key_stor=
e_variables[i],
+-							  variable_info.MaximumVariableSize,
+-							  &actual_variable_length);
++							max_variable_size,
++							&actual_variable_length);
+=20
+ 		if (status) {
+ 			/* When the parent does not exist it is considered verification fail=
ure */
+@@ -1297,8 +1324,8 @@ static efi_status_t authenticate_variable(const st=
ruct uefi_variable_store *cont
+ 			goto end;
+ 		}
+=20
+-		status =3D verify_var_by_key_var(&var_map, &allowed_key_store_var_map=
,
+-					       (uint8_t *)&hash_buffer, hash_len);
++		status =3D verify_var_by_key_var(var_map, &allowed_key_store_var_map,
++					hash_buffer, hash_len);
+=20
+ 		if (status =3D=3D EFI_SUCCESS)
+ 			goto end;
+@@ -1311,18 +1338,6 @@ end:
+ 			free(allowed_key_store_variables[i]);
+ 	}
+=20
+-	/* Remove the authentication header from the variable if the authentic=
ation is successful */
+-	if (status =3D=3D EFI_SUCCESS) {
+-		uint8_t *smm_payload =3D
+-			(uint8_t *)var + SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSE=
T(var);
+-
+-		memmove(smm_payload, var_map.payload, var_map.payload_len);
+-		memset((uint8_t *)smm_payload + var_map.payload_len, 0,
+-		       var_map.efi_auth_descriptor_len);
+-
+-		var->DataSize -=3D var_map.efi_auth_descriptor_len;
+-	}
+-
+ 	return status;
+ }
+ #endif
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0017-Implement-Private-Authenticated-Variable-verificatio.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0017-Implement-Priva=
te-Authenticated-Variable-verificatio.patch
new file mode 100644
index 00000000..eb7852f0
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Im=
plement-Private-Authenticated-Variable-verificatio.patch
@@ -0,0 +1,292 @@
+From a172c6e8269915db1b25e2749bae06dc0220cfb8 Mon Sep 17 00:00:00 2001
+From: Gabor Toth <gabor.toth2@arm.com>
+Date: Thu, 11 Apr 2024 13:48:14 +0200
+Subject: [PATCH 3/3] Implement Private Authenticated Variable verificati=
on
+
+Refactor the implementation to only use the PK, KEK, DB authentication
+chain for boot variables, and implement the self authentication for
+private authenticated variables.
+
+Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TS/trus=
ted-services/+/27957]
+---
+ .../backend/uefi_variable_store.c             | 126 +++++++++++++++---
+ .../smm_variable/backend/variable_index.c     |   1 +
+ .../smm_variable/backend/variable_index.h     |   2 +
+ .../config/default-opteesp/CMakeLists.txt     |   2 +-
+ .../config/default-sp/CMakeLists.txt          |   2 +-
+ 5 files changed, 112 insertions(+), 21 deletions(-)
+
+diff --git a/components/service/uefi/smm_variable/backend/uefi_variable_=
store.c b/components/service/uefi/smm_variable/backend/uefi_variable_stor=
e.c
+index 1384d0def..97c43dc74 100644
+--- a/components/service/uefi/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/uefi/smm_variable/backend/uefi_variable_store.c
+@@ -75,15 +75,25 @@ static efi_status_t verify_var_by_key_var(const efi_=
data_map *new_var,
+ 					  const efi_data_map *key_store_var,
+ 					  const uint8_t *hash_buffer, size_t hash_len);
+=20
++static bool isPrivateAuthVar(SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *=
var);
++
+ static efi_status_t authenticate_variable(const struct uefi_variable_st=
ore *context,
+-					  EFI_TIME *timestamp,
+-					  SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var);
++					  EFI_TIME *timestamp, uint8_t (*fingerprint)[FINGERPRINT_SIZE],
++					  bool new_variable, SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var=
);
+=20
+ static efi_status_t authenticate_secure_boot_variable(const struct uefi=
_variable_store *context,
+ 						      efi_data_map* var_map,
+ 						      uint8_t* hash_buffer,
+ 						      size_t hash_len,
+ 						      uint64_t max_variable_size);
++
++static efi_status_t authenticate_private_variable(const struct uefi_var=
iable_store *context,
++						  efi_data_map* var_map,
++						  uint8_t* hash_buffer,
++						  size_t hash_len,
++						  uint64_t max_variable_size,
++						  bool new_variable,
++						  uint8_t (*fingerprint)[FINGERPRINT_SIZE]);
+ #endif
+=20
+ static efi_status_t store_variable_data(const struct uefi_variable_stor=
e *context,
+@@ -205,6 +215,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
+ {
+ 	bool should_sync_index =3D false;
+ 	EFI_TIME timestamp =3D { 0 };
++	uint8_t fingerprint[FINGERPRINT_SIZE] =3D { 0 };
+=20
+ 	/* Validate incoming request */
+ 	efi_status_t status =3D check_name_terminator(var->Name, var->NameSize=
);
+@@ -233,8 +244,9 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
+ 			return EFI_OUT_OF_RESOURCES;
+ 	}
+=20
+-	/* Save the timestamp into a buffer, which can be overwritten by the a=
uthentication function */
++	/* Save the timestamp and fingerprints into a buffer, which can be ove=
rwritten by the authentication function */
+ 	memcpy(&timestamp, &info->metadata.timestamp, sizeof(EFI_TIME));
++	memcpy(&fingerprint, &info->metadata.fingerprint, FINGERPRINT_SIZE);
+=20
+ 	/* Control access */
+ 	status =3D check_access_permitted_on_set(context, info, var);
+@@ -251,7 +263,8 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
+ 			if (info->metadata.attributes &
+ 			    EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS) {
+ 				status =3D authenticate_variable(
+-					context, &timestamp, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)v=
ar);
++					context, &timestamp, &fingerprint, false,
++					(SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)var);
+=20
+ 				if (status !=3D EFI_SUCCESS)
+ 					return status;
+@@ -337,7 +350,8 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
+ 			 */
+ 			if (var->Attributes & EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_AC=
CESS) {
+ 				status =3D authenticate_variable(
+-					context, &timestamp, (SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)v=
ar);
++					context, &timestamp, &fingerprint, true,
++					(SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *)var);
+=20
+ 				if (status !=3D EFI_SUCCESS)
+ 					return status;
+@@ -372,6 +386,7 @@ efi_status_t uefi_variable_store_set_variable(const =
struct uefi_variable_store *
+ 		/* Store any variable data to the storage backend with the updated me=
tadata */
+ 		if (info->is_variable_set && (status =3D=3D EFI_SUCCESS)) {
+ 			memcpy(&info->metadata.timestamp, &timestamp, sizeof(EFI_TIME));
++			memcpy(&info->metadata.fingerprint, &fingerprint, FINGERPRINT_SIZE);
+ 			status =3D store_variable_data(context, info, var);
+ 		}
+ 	}
+@@ -1030,15 +1045,6 @@ select_verification_keys(const efi_data_map new_v=
ar, EFI_GUID global_variable_gu
+ 		create_smm_variable(&(allowed_key_store_variables[1]),
+ 				    sizeof(EFI_KEY_EXCHANGE_KEY_NAME), maximum_variable_size,
+ 				    (uint8_t *)EFI_KEY_EXCHANGE_KEY_NAME, &global_variable_guid);
+-	} else {
+-		/*
+-		 * Any other variable is considered Private Authenticated Variable.
+-		 * These are verified by db
+-		 */
+-		create_smm_variable(&(allowed_key_store_variables[0]),
+-				    sizeof(EFI_IMAGE_SECURITY_DATABASE), maximum_variable_size,
+-				    (uint8_t *)EFI_IMAGE_SECURITY_DATABASE,
+-				    &security_database_guid);
+ 	}
+=20
+ 	return EFI_SUCCESS;
+@@ -1114,13 +1120,39 @@ static efi_status_t verify_var_by_key_var(const =
efi_data_map *new_var,
+ 	return EFI_SECURITY_VIOLATION;
+ }
+=20
+-/* Basic verification of the authentication header of the new variable.
++static bool isPrivateAuthVar(SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *=
var)
++{
++	if (compare_name_to_key_store_name(var->Name,
++					   var->NameSize, EFI_PLATFORM_KEY_NAME,
++					   sizeof(EFI_PLATFORM_KEY_NAME)) ||
++		 compare_name_to_key_store_name(
++			   var->Name, var->NameSize,
++			   EFI_KEY_EXCHANGE_KEY_NAME, sizeof(EFI_KEY_EXCHANGE_KEY_NAME)) ||
++		 compare_name_to_key_store_name(
++			 var->Name, var->NameSize,
++			 EFI_IMAGE_SECURITY_DATABASE, sizeof(EFI_IMAGE_SECURITY_DATABASE)) |=
|
++		 compare_name_to_key_store_name(
++			 var->Name, var->NameSize,
++			 EFI_IMAGE_SECURITY_DATABASE1, sizeof(EFI_IMAGE_SECURITY_DATABASE1))=
 ||
++		 compare_name_to_key_store_name(
++			 var->Name, var->NameSize,
++			 EFI_IMAGE_SECURITY_DATABASE2, sizeof(EFI_IMAGE_SECURITY_DATABASE2))=
 ||
++		 compare_name_to_key_store_name(
++			 var->Name, var->NameSize,
++			 EFI_IMAGE_SECURITY_DATABASE3, sizeof(EFI_IMAGE_SECURITY_DATABASE3))=
)
++		return false;
++
++	return true;
++}
++
++/*
++ * Basic verification of the authentication header of the new variable.
+  * First finds the key variable responsible for the authentication of t=
he new variable,
+  * then verifies it.
+  */
+ static efi_status_t authenticate_variable(const struct uefi_variable_st=
ore *context,
+-					  EFI_TIME *timestamp,
+-					  SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
++					  EFI_TIME *timestamp, uint8_t (*fingerprint)[FINGERPRINT_SIZE],
++					  bool new_variable, SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var=
)
+ {
+ 	efi_status_t status =3D EFI_SUCCESS;
+ 	EFI_GUID pkcs7_guid =3D EFI_CERT_TYPE_PKCS7_GUID;
+@@ -1192,8 +1224,13 @@ static efi_status_t authenticate_variable(const s=
truct uefi_variable_store *cont
+ 		status =3D EFI_SECURITY_VIOLATION;
+ 	}
+=20
+-	/* Run Secure Boot related authentication steps */
+-	status =3D authenticate_secure_boot_variable(context, &var_map, (uint8=
_t*) &hash_buffer, hash_len, variable_info.MaximumVariableSize);
++	if (isPrivateAuthVar(var)) {
++		/* Run Private Authenticated Variable related authentication steps */
++		status =3D authenticate_private_variable(context, &var_map, (uint8_t*=
) &hash_buffer, hash_len, variable_info.MaximumVariableSize, new_variable=
, fingerprint);
++	} else {
++		/* Run Secure Boot related authentication steps */
++		status =3D authenticate_secure_boot_variable(context, &var_map, (uint=
8_t*) &hash_buffer, hash_len, variable_info.MaximumVariableSize);
++	}
+=20
+ 	/* Remove the authentication header from the variable if the authentic=
ation is successful */
+ 	if (status =3D=3D EFI_SUCCESS) {
+@@ -1340,6 +1377,57 @@ end:
+=20
+ 	return status;
+ }
++
++static efi_status_t authenticate_private_variable(const struct uefi_var=
iable_store *context,
++						  efi_data_map* var_map,
++						  uint8_t* hash_buffer,
++						  size_t hash_len,
++						  uint64_t max_variable_size,
++						  bool new_variable,
++						  uint8_t (*fingerprint)[FINGERPRINT_SIZE])
++{
++	efi_status_t status =3D EFI_SUCCESS;
++	uint8_t new_fingerprint[PSA_HASH_MAX_SIZE] =3D { 0 };
++
++	/* Verify the signature of the variable */
++	if (verify_pkcs7_signature(
++		var_map->efi_auth_descriptor->AuthInfo.CertData,
++		var_map->efi_auth_descriptor_certdata_len, hash_buffer,
++		hash_len, NULL, 0) =3D=3D 0)
++		status =3D EFI_SUCCESS;
++	else
++		return EFI_SECURITY_VIOLATION;
++
++	/**
++	 * UEFI: Page 254
++	 * CN of the signing certificate=E2=80=99s Subject and the hash of the=
 tbsCertificate of the top-level issuer certificate
++	 * (or the signing certificate itself if no other certificates are pre=
sent or the certificate chain is of length 1)
++	 * in SignedData.certificates is registered for use in subsequent veri=
fications of this variable. Implementations
++	 * may store just a single hash of these two elements to reduce storag=
e requirements.
++	 */
++	if (get_uefi_priv_auth_var_fingerprint_handler(var_map->efi_auth_descr=
iptor->AuthInfo.CertData,
++						       var_map->efi_auth_descriptor_certdata_len,
++						       (uint8_t*)&new_fingerprint)) {
++		EMSG("Failed to querry variable fingerprint input");
++		return EFI_SECURITY_VIOLATION;
++	}
++
++	/*
++	 * The hash is SHA256 so only 32 bytes contain non zero values.
++	 * Use only that part to decrease metadata size.
++	 */
++	if (!new_variable) {
++		if (memcmp(&new_fingerprint, fingerprint, FINGERPRINT_SIZE)) {
++			EMSG("Fingerprint verification failed");
++			return EFI_SECURITY_VIOLATION;
++		}
++	} else {
++		/* Save fingerprint */
++		memcpy(fingerprint, &new_fingerprint, FINGERPRINT_SIZE);
++	}
++
++	return status;
++}
+ #endif
+=20
+ static efi_status_t store_variable_data(const struct uefi_variable_stor=
e *context,
+diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.c b/components/service/uefi/smm_variable/backend/variable_index.c
+index f4194d2d3..7f2fbe0ba 100644
+--- a/components/service/uefi/smm_variable/backend/variable_index.c
++++ b/components/service/uefi/smm_variable/backend/variable_index.c
+@@ -199,6 +199,7 @@ static struct variable_entry *add_entry(const struct=
 variable_index *context, co
+ 			info->metadata.uid =3D generate_uid(context, guid, name_size, name);
+ 			info->metadata.guid =3D *guid;
+ 			memset(&info->metadata.timestamp, 0, sizeof(EFI_TIME));
++			memset(&info->metadata.fingerprint, 0, sizeof(FINGERPRINT_SIZE));
+ 			info->metadata.attributes =3D 0;
+ 			info->metadata.name_size =3D name_size;
+ 			memcpy(info->metadata.name, name, name_size);
+diff --git a/components/service/uefi/smm_variable/backend/variable_index=
.h b/components/service/uefi/smm_variable/backend/variable_index.h
+index 7eef7b86b..726bc985a 100644
+--- a/components/service/uefi/smm_variable/backend/variable_index.h
++++ b/components/service/uefi/smm_variable/backend/variable_index.h
+@@ -24,6 +24,7 @@ extern "C" {
+  * Implementation limits
+  */
+ #define VARIABLE_INDEX_MAX_NAME_SIZE (64)
++#define FINGERPRINT_SIZE             (32)
+=20
+ /**
+  * \brief variable_metadata structure definition
+@@ -33,6 +34,7 @@ extern "C" {
+ struct variable_metadata {
+ 	EFI_GUID guid;
+ 	EFI_TIME timestamp;
++	uint8_t fingerprint[FINGERPRINT_SIZE];
+ 	size_t name_size;
+ 	int16_t name[VARIABLE_INDEX_MAX_NAME_SIZE];
+ 	uint32_t attributes;
+diff --git a/deployments/smm-gateway/config/default-opteesp/CMakeLists.t=
xt b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
+index 0e281a377..d3df61ded 100644
+--- a/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
++++ b/deployments/smm-gateway/config/default-opteesp/CMakeLists.txt
+@@ -42,7 +42,7 @@ set(SP_BOOT_ORDER "8" CACHE STRING "Boot order of the =
SP")
+ add_platform(TARGET "smm-gateway")
+=20
+ # SMM variable and RPC caller settings
+-set(SMM_GATEWAY_MAX_UEFI_VARIABLES 40 CACHE STRING "Maximum UEFI variab=
le count")
++set(SMM_GATEWAY_MAX_UEFI_VARIABLES 35 CACHE STRING "Maximum UEFI variab=
le count")
+ set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 2*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
+ if (UEFI_AUTH_VAR)
+ set(SMM_SP_HEAP_SIZE 64*1024 CACHE STRING "SMM gateway SP heap size")
+diff --git a/deployments/smm-gateway/config/default-sp/CMakeLists.txt b/=
deployments/smm-gateway/config/default-sp/CMakeLists.txt
+index 8df9256e4..bb97cf8e3 100644
+--- a/deployments/smm-gateway/config/default-sp/CMakeLists.txt
++++ b/deployments/smm-gateway/config/default-sp/CMakeLists.txt
+@@ -47,7 +47,7 @@ set(SP_BOOT_ORDER "8" CACHE STRING "Boot order of the =
SP")
+ add_platform(TARGET "smm-gateway")
+=20
+ # SMM variable and RPC caller settings
+-set(SMM_GATEWAY_MAX_UEFI_VARIABLES 40 CACHE STRING "Maximum UEFI variab=
le count")
++set(SMM_GATEWAY_MAX_UEFI_VARIABLES 35 CACHE STRING "Maximum UEFI variab=
le count")
+ set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 2*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
+ if (UEFI_AUTH_VAR)
+ set(SMM_SP_HEAP_SIZE 64*1024 CACHE STRING "SMM gateway SP heap size")
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index f8a94750..84c40aa8 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -15,6 +15,10 @@ SRC_URI:append:corstone1000  =3D " \
     file://0011-Fix-Avoid-redefinition-of-variables.patch \
     file://0012-Fix-GetNextVariableName-NameSize-input.patch \
     file://0013-Fix-error-handling-of-variable-index-loading.patch \
+    file://0014-Provide-crypto-api-to-create-uefi-priv-var-fingerpri.pat=
ch \
+    file://0015-Add-timestamp-validation-for-uefi-variables.patch \
+    file://0016-Isolate-common-uefi-variable-authentication-steps.patch =
\
+    file://0017-Implement-Private-Authenticated-Variable-verificatio.pat=
ch \
     "
=20
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gat=
eway_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-sm=
m-gateway_%.bbappend
index 931d567f..628dfb48 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
@@ -4,6 +4,7 @@ EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_=
ADDRESS=3D"0x00000000 0x81F
     -DMM_COMM_BUFFER_PAGE_COUNT=3D"1" \
     -DUEFI_AUTH_VAR=3DON \
     -DUEFI_INTERNAL_CRYPTO=3DON \
+    -DSMM_GATEWAY_MAX_UEFI_VARIABLES=3D60 \
     "
=20
 EXTRA_OECMAKE:append:fvp-base =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x000000=
00 0x81000000" \
--=20
2.25.1


