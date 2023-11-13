Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C97C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 13:31:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.36673.1699882263880707897
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Nov 2023 05:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E3381007;
	Mon, 13 Nov 2023 05:31:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 858FE3F7B4;
	Mon, 13 Nov 2023 05:31:02 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-bsp/optee-os: backport fix for CVE-2023-41325
Date: Mon, 13 Nov 2023 13:31:00 +0000
Message-Id: <20231113133100.2200065-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231113133100.2200065-1-ross.burton@arm.com>
References: <20231113133100.2200065-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Nov 2023 13:31:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5231

From: Ross Burton <ross.burton@arm.com>

This bug has been fixed in 3.22, backport for 3.20.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../optee-os-3.20.0/CVE-2023-41325.patch      | 634 ++++++++++++++++++
 .../recipes-security/optee/optee-os_3.20.0.bb |   1 +
 2 files changed, 635 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/C=
VE-2023-41325.patch

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/CVE-2023=
-41325.patch b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/CVE-20=
23-41325.patch
new file mode 100644
index 00000000..08acce07
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/CVE-2023-41325.=
patch
@@ -0,0 +1,634 @@
+From 800627f054959aac0dd3527495ee3fad0137600a Mon Sep 17 00:00:00 2001
+From: Jihwan Park <jihwp@amazon.com>
+Date: Mon, 3 Jul 2023 08:51:47 +0200
+Subject: [PATCH] core: crypto_bignum_free(): add indirection and set poi=
nter
+ to NULL
+
+To prevent human mistake, crypto_bignum_free() sets the location of the
+bignum pointer to NULL after freeing it.
+
+Signed-off-by: Jihwan Park <jihwp@amazon.com>
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+Reviewed-by: Joakim Bech <joakim.bech@linaro.org>
+Reviewed-by: Etienne Carriere <etienne.carriere@foss.st.com>
+
+CVE: CVE-2023-41325
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ core/crypto/crypto.c                        |  4 +--
+ core/drivers/crypto/caam/acipher/caam_dh.c  |  8 ++---
+ core/drivers/crypto/caam/acipher/caam_dsa.c | 14 ++++----
+ core/drivers/crypto/caam/acipher/caam_ecc.c | 10 +++---
+ core/drivers/crypto/caam/acipher/caam_rsa.c | 24 ++++++-------
+ core/drivers/crypto/se050/core/ecc.c        | 14 ++++----
+ core/drivers/crypto/se050/core/rsa.c        | 38 ++++++++++-----------
+ core/drivers/crypto/versal/ecc.c            |  6 ++--
+ core/include/crypto/crypto.h                |  2 +-
+ core/lib/libtomcrypt/dh.c                   |  8 ++---
+ core/lib/libtomcrypt/dsa.c                  | 14 ++++----
+ core/lib/libtomcrypt/ecc.c                  | 10 +++---
+ core/lib/libtomcrypt/mpi_desc.c             |  9 +++--
+ core/lib/libtomcrypt/rsa.c                  | 22 ++++++------
+ core/tee/tee_svc_cryp.c                     |  7 ++--
+ lib/libmbedtls/core/bignum.c                |  9 +++--
+ lib/libmbedtls/core/dh.c                    |  8 ++---
+ lib/libmbedtls/core/ecc.c                   | 10 +++---
+ lib/libmbedtls/core/rsa.c                   | 22 ++++++------
+ 19 files changed, 122 insertions(+), 117 deletions(-)
+
+diff --git a/core/crypto/crypto.c b/core/crypto/crypto.c
+index 9f7d35097..60cb89a31 100644
+--- a/core/crypto/crypto.c
++++ b/core/crypto/crypto.c
+@@ -498,9 +498,9 @@ void crypto_bignum_copy(struct bignum *to __unused,
+ 	bignum_cant_happen();
+ }
+=20
+-void crypto_bignum_free(struct bignum *a)
++void crypto_bignum_free(struct bignum **a)
+ {
+-	if (a)
++	if (a && *a)
+ 		panic();
+ }
+=20
+diff --git a/core/drivers/crypto/caam/acipher/caam_dh.c b/core/drivers/c=
rypto/caam/acipher/caam_dh.c
+index 6131ff0ef..35fc44541 100644
+--- a/core/drivers/crypto/caam/acipher/caam_dh.c
++++ b/core/drivers/crypto/caam/acipher/caam_dh.c
+@@ -195,10 +195,10 @@ static TEE_Result do_allocate_keypair(struct dh_ke=
ypair *key, size_t size_bits)
+ err:
+ 	DH_TRACE("Allocation error");
+=20
+-	crypto_bignum_free(key->g);
+-	crypto_bignum_free(key->p);
+-	crypto_bignum_free(key->x);
+-	crypto_bignum_free(key->y);
++	crypto_bignum_free(&key->g);
++	crypto_bignum_free(&key->p);
++	crypto_bignum_free(&key->x);
++	crypto_bignum_free(&key->y);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+diff --git a/core/drivers/crypto/caam/acipher/caam_dsa.c b/core/drivers/=
crypto/caam/acipher/caam_dsa.c
+index 2696f0b3c..d60bb8e89 100644
+--- a/core/drivers/crypto/caam/acipher/caam_dsa.c
++++ b/core/drivers/crypto/caam/acipher/caam_dsa.c
+@@ -309,10 +309,10 @@ static TEE_Result do_allocate_keypair(struct dsa_k=
eypair *key, size_t l_bits,
+ err:
+ 	DSA_TRACE("Allocation error");
+=20
+-	crypto_bignum_free(key->g);
+-	crypto_bignum_free(key->p);
+-	crypto_bignum_free(key->q);
+-	crypto_bignum_free(key->x);
++	crypto_bignum_free(&key->g);
++	crypto_bignum_free(&key->p);
++	crypto_bignum_free(&key->q);
++	crypto_bignum_free(&key->x);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+@@ -358,9 +358,9 @@ static TEE_Result do_allocate_publickey(struct dsa_p=
ublic_key *key,
+ err:
+ 	DSA_TRACE("Allocation error");
+=20
+-	crypto_bignum_free(key->g);
+-	crypto_bignum_free(key->p);
+-	crypto_bignum_free(key->q);
++	crypto_bignum_free(&key->g);
++	crypto_bignum_free(&key->p);
++	crypto_bignum_free(&key->q);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+diff --git a/core/drivers/crypto/caam/acipher/caam_ecc.c b/core/drivers/=
crypto/caam/acipher/caam_ecc.c
+index 90e87c20a..6b12b6cbe 100644
+--- a/core/drivers/crypto/caam/acipher/caam_ecc.c
++++ b/core/drivers/crypto/caam/acipher/caam_ecc.c
+@@ -169,8 +169,8 @@ static TEE_Result do_allocate_keypair(struct ecc_key=
pair *key, size_t size_bits)
+ err:
+ 	ECC_TRACE("Allocation error");
+=20
+-	crypto_bignum_free(key->d);
+-	crypto_bignum_free(key->x);
++	crypto_bignum_free(&key->d);
++	crypto_bignum_free(&key->x);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+@@ -204,7 +204,7 @@ static TEE_Result do_allocate_publickey(struct ecc_p=
ublic_key *key,
+ err:
+ 	ECC_TRACE("Allocation error");
+=20
+-	crypto_bignum_free(key->x);
++	crypto_bignum_free(&key->x);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+@@ -216,8 +216,8 @@ err:
+  */
+ static void do_free_publickey(struct ecc_public_key *key)
+ {
+-	crypto_bignum_free(key->x);
+-	crypto_bignum_free(key->y);
++	crypto_bignum_free(&key->x);
++	crypto_bignum_free(&key->y);
+ }
+=20
+ /*
+diff --git a/core/drivers/crypto/caam/acipher/caam_rsa.c b/core/drivers/=
crypto/caam/acipher/caam_rsa.c
+index e860c641c..b59ab0b6e 100644
+--- a/core/drivers/crypto/caam/acipher/caam_rsa.c
++++ b/core/drivers/crypto/caam/acipher/caam_rsa.c
+@@ -86,14 +86,14 @@ static uint8_t caam_era;
+  */
+ static void do_free_keypair(struct rsa_keypair *key)
+ {
+-	crypto_bignum_free(key->e);
+-	crypto_bignum_free(key->d);
+-	crypto_bignum_free(key->n);
+-	crypto_bignum_free(key->p);
+-	crypto_bignum_free(key->q);
+-	crypto_bignum_free(key->qp);
+-	crypto_bignum_free(key->dp);
+-	crypto_bignum_free(key->dq);
++	crypto_bignum_free(&key->e);
++	crypto_bignum_free(&key->d);
++	crypto_bignum_free(&key->n);
++	crypto_bignum_free(&key->p);
++	crypto_bignum_free(&key->q);
++	crypto_bignum_free(&key->qp);
++	crypto_bignum_free(&key->dp);
++	crypto_bignum_free(&key->dq);
+ }
+=20
+ /*
+@@ -435,8 +435,8 @@ static TEE_Result do_allocate_publickey(struct rsa_p=
ublic_key *key,
+ err_alloc_publickey:
+ 	RSA_TRACE("Allocation error");
+=20
+-	crypto_bignum_free(key->e);
+-	crypto_bignum_free(key->n);
++	crypto_bignum_free(&key->e);
++	crypto_bignum_free(&key->n);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+@@ -448,8 +448,8 @@ err_alloc_publickey:
+  */
+ static void do_free_publickey(struct rsa_public_key *key)
+ {
+-	crypto_bignum_free(key->e);
+-	crypto_bignum_free(key->n);
++	crypto_bignum_free(&key->e);
++	crypto_bignum_free(&key->n);
+ }
+=20
+ /*
+diff --git a/core/drivers/crypto/se050/core/ecc.c b/core/drivers/crypto/=
se050/core/ecc.c
+index d74334760..52f82c69d 100644
+--- a/core/drivers/crypto/se050/core/ecc.c
++++ b/core/drivers/crypto/se050/core/ecc.c
+@@ -752,9 +752,9 @@ static TEE_Result do_alloc_keypair(struct ecc_keypai=
r *s,
+ 		goto err;
+ 	return TEE_SUCCESS;
+ err:
+-	crypto_bignum_free(s->d);
+-	crypto_bignum_free(s->x);
+-	crypto_bignum_free(s->y);
++	crypto_bignum_free(&s->d);
++	crypto_bignum_free(&s->x);
++	crypto_bignum_free(&s->y);
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+=20
+@@ -768,8 +768,8 @@ static TEE_Result do_alloc_publickey(struct ecc_publ=
ic_key *s,
+ 		goto err;
+ 	return TEE_SUCCESS;
+ err:
+-	crypto_bignum_free(s->x);
+-	crypto_bignum_free(s->y);
++	crypto_bignum_free(&s->x);
++	crypto_bignum_free(&s->y);
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+=20
+@@ -778,8 +778,8 @@ static void do_free_publickey(struct ecc_public_key =
*s)
+ 	if (!s)
+ 		return;
+=20
+-	crypto_bignum_free(s->x);
+-	crypto_bignum_free(s->y);
++	crypto_bignum_free(&s->x);
++	crypto_bignum_free(&s->y);
+ }
+=20
+ static struct drvcrypt_ecc driver_ecc =3D {
+diff --git a/core/drivers/crypto/se050/core/rsa.c b/core/drivers/crypto/=
se050/core/rsa.c
+index 815abb3cd..475d2b99a 100644
+--- a/core/drivers/crypto/se050/core/rsa.c
++++ b/core/drivers/crypto/se050/core/rsa.c
+@@ -537,14 +537,14 @@ static TEE_Result do_alloc_keypair(struct rsa_keyp=
air *s,
+=20
+ 	return TEE_SUCCESS;
+ err:
+-	crypto_bignum_free(s->e);
+-	crypto_bignum_free(s->d);
+-	crypto_bignum_free(s->n);
+-	crypto_bignum_free(s->p);
+-	crypto_bignum_free(s->q);
+-	crypto_bignum_free(s->qp);
+-	crypto_bignum_free(s->dp);
+-	crypto_bignum_free(s->dq);
++	crypto_bignum_free(&s->e);
++	crypto_bignum_free(&s->d);
++	crypto_bignum_free(&s->n);
++	crypto_bignum_free(&s->p);
++	crypto_bignum_free(&s->q);
++	crypto_bignum_free(&s->qp);
++	crypto_bignum_free(&s->dp);
++	crypto_bignum_free(&s->dq);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+@@ -556,7 +556,7 @@ static TEE_Result do_alloc_publickey(struct rsa_publ=
ic_key *s,
+ 	if (!bn_alloc_max(&s->e))
+ 		return TEE_ERROR_OUT_OF_MEMORY;
+ 	if (!bn_alloc_max(&s->n)) {
+-		crypto_bignum_free(s->e);
++		crypto_bignum_free(&s->e);
+ 		return TEE_ERROR_OUT_OF_MEMORY;
+ 	}
+=20
+@@ -566,8 +566,8 @@ static TEE_Result do_alloc_publickey(struct rsa_publ=
ic_key *s,
+ static void do_free_publickey(struct rsa_public_key *s)
+ {
+ 	if (s) {
+-		crypto_bignum_free(s->n);
+-		crypto_bignum_free(s->e);
++		crypto_bignum_free(&s->n);
++		crypto_bignum_free(&s->e);
+ 	}
+ }
+=20
+@@ -587,14 +587,14 @@ static void do_free_keypair(struct rsa_keypair *s)
+ 			sss_se05x_key_store_erase_key(se050_kstore, &k_object);
+ 	}
+=20
+-	crypto_bignum_free(s->e);
+-	crypto_bignum_free(s->d);
+-	crypto_bignum_free(s->n);
+-	crypto_bignum_free(s->p);
+-	crypto_bignum_free(s->q);
+-	crypto_bignum_free(s->qp);
+-	crypto_bignum_free(s->dp);
+-	crypto_bignum_free(s->dq);
++	crypto_bignum_free(&s->e);
++	crypto_bignum_free(&s->d);
++	crypto_bignum_free(&s->n);
++	crypto_bignum_free(&s->p);
++	crypto_bignum_free(&s->q);
++	crypto_bignum_free(&s->qp);
++	crypto_bignum_free(&s->dp);
++	crypto_bignum_free(&s->dq);
+ }
+=20
+ static TEE_Result do_gen_keypair(struct rsa_keypair *key, size_t kb)
+diff --git a/core/drivers/crypto/versal/ecc.c b/core/drivers/crypto/vers=
al/ecc.c
+index 3d5454509..18ec4f78d 100644
+--- a/core/drivers/crypto/versal/ecc.c
++++ b/core/drivers/crypto/versal/ecc.c
+@@ -284,9 +284,9 @@ static TEE_Result sign(uint32_t algo, struct ecc_key=
pair *key,
+=20
+ 	versal_mbox_alloc(bytes, NULL, &k);
+ 	crypto_bignum_bn2bin_eswap(key->curve, ephemeral.d, k.buf);
+-	crypto_bignum_free(ephemeral.d);
+-	crypto_bignum_free(ephemeral.x);
+-	crypto_bignum_free(ephemeral.y);
++	crypto_bignum_free(&ephemeral.d);
++	crypto_bignum_free(&ephemeral.x);
++	crypto_bignum_free(&ephemeral.y);
+=20
+ 	/* Private key*/
+ 	versal_mbox_alloc(bytes, NULL, &d);
+diff --git a/core/include/crypto/crypto.h b/core/include/crypto/crypto.h
+index 71a287ec6..0e6c139ce 100644
+--- a/core/include/crypto/crypto.h
++++ b/core/include/crypto/crypto.h
+@@ -98,7 +98,7 @@ size_t crypto_bignum_num_bytes(struct bignum *a);
+ size_t crypto_bignum_num_bits(struct bignum *a);
+ void crypto_bignum_bn2bin(const struct bignum *from, uint8_t *to);
+ void crypto_bignum_copy(struct bignum *to, const struct bignum *from);
+-void crypto_bignum_free(struct bignum *a);
++void crypto_bignum_free(struct bignum **a);
+ void crypto_bignum_clear(struct bignum *a);
+=20
+ /* return -1 if a<b, 0 if a=3D=3Db, +1 if a>b */
+diff --git a/core/lib/libtomcrypt/dh.c b/core/lib/libtomcrypt/dh.c
+index 4eb9916f2..b1d0a4d00 100644
+--- a/core/lib/libtomcrypt/dh.c
++++ b/core/lib/libtomcrypt/dh.c
+@@ -28,10 +28,10 @@ TEE_Result crypto_acipher_alloc_dh_keypair(struct dh=
_keypair *s,
+ 		goto err;
+ 	return TEE_SUCCESS;
+ err:
+-	crypto_bignum_free(s->g);
+-	crypto_bignum_free(s->p);
+-	crypto_bignum_free(s->y);
+-	crypto_bignum_free(s->x);
++	crypto_bignum_free(&s->g);
++	crypto_bignum_free(&s->p);
++	crypto_bignum_free(&s->y);
++	crypto_bignum_free(&s->x);
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+=20
+diff --git a/core/lib/libtomcrypt/dsa.c b/core/lib/libtomcrypt/dsa.c
+index a2dc720ed..d6243c469 100644
+--- a/core/lib/libtomcrypt/dsa.c
++++ b/core/lib/libtomcrypt/dsa.c
+@@ -30,10 +30,10 @@ TEE_Result crypto_acipher_alloc_dsa_keypair(struct d=
sa_keypair *s,
+ 		goto err;
+ 	return TEE_SUCCESS;
+ err:
+-	crypto_bignum_free(s->g);
+-	crypto_bignum_free(s->p);
+-	crypto_bignum_free(s->q);
+-	crypto_bignum_free(s->y);
++	crypto_bignum_free(&s->g);
++	crypto_bignum_free(&s->p);
++	crypto_bignum_free(&s->q);
++	crypto_bignum_free(&s->y);
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+=20
+@@ -52,9 +52,9 @@ TEE_Result crypto_acipher_alloc_dsa_public_key(struct =
dsa_public_key *s,
+ 		goto err;
+ 	return TEE_SUCCESS;
+ err:
+-	crypto_bignum_free(s->g);
+-	crypto_bignum_free(s->p);
+-	crypto_bignum_free(s->q);
++	crypto_bignum_free(&s->g);
++	crypto_bignum_free(&s->p);
++	crypto_bignum_free(&s->q);
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+=20
+diff --git a/core/lib/libtomcrypt/ecc.c b/core/lib/libtomcrypt/ecc.c
+index 938378247..fa645e17a 100644
+--- a/core/lib/libtomcrypt/ecc.c
++++ b/core/lib/libtomcrypt/ecc.c
+@@ -18,8 +18,8 @@ static void _ltc_ecc_free_public_key(struct ecc_public=
_key *s)
+ 	if (!s)
+ 		return;
+=20
+-	crypto_bignum_free(s->x);
+-	crypto_bignum_free(s->y);
++	crypto_bignum_free(&s->x);
++	crypto_bignum_free(&s->y);
+ }
+=20
+ /*
+@@ -465,8 +465,8 @@ TEE_Result crypto_asym_alloc_ecc_keypair(struct ecc_=
keypair *s,
+ err:
+ 	s->ops =3D NULL;
+=20
+-	crypto_bignum_free(s->d);
+-	crypto_bignum_free(s->x);
++	crypto_bignum_free(&s->d);
++	crypto_bignum_free(&s->x);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+@@ -541,7 +541,7 @@ TEE_Result crypto_asym_alloc_ecc_public_key(struct e=
cc_public_key *s,
+ err:
+ 	s->ops =3D NULL;
+=20
+-	crypto_bignum_free(s->x);
++	crypto_bignum_free(&s->x);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+diff --git a/core/lib/libtomcrypt/mpi_desc.c b/core/lib/libtomcrypt/mpi_=
desc.c
+index 235fbe630..ff8dd13c7 100644
+--- a/core/lib/libtomcrypt/mpi_desc.c
++++ b/core/lib/libtomcrypt/mpi_desc.c
+@@ -763,10 +763,13 @@ struct bignum *crypto_bignum_allocate(size_t size_=
bits)
+ 	return (struct bignum *)bn;
+ }
+=20
+-void crypto_bignum_free(struct bignum *s)
++void crypto_bignum_free(struct bignum **s)
+ {
+-	mbedtls_mpi_free((mbedtls_mpi *)s);
+-	free(s);
++	assert(s);
++
++	mbedtls_mpi_free((mbedtls_mpi *)*s);
++	free(*s);
++	*s =3D NULL;
+ }
+=20
+ void crypto_bignum_clear(struct bignum *s)
+diff --git a/core/lib/libtomcrypt/rsa.c b/core/lib/libtomcrypt/rsa.c
+index 8d0443f36..13ed23934 100644
+--- a/core/lib/libtomcrypt/rsa.c
++++ b/core/lib/libtomcrypt/rsa.c
+@@ -131,7 +131,7 @@ TEE_Result sw_crypto_acipher_alloc_rsa_public_key(st=
ruct rsa_public_key *s,
+ 		goto err;
+ 	return TEE_SUCCESS;
+ err:
+-	crypto_bignum_free(s->e);
++	crypto_bignum_free(&s->e);
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+=20
+@@ -143,8 +143,8 @@ void sw_crypto_acipher_free_rsa_public_key(struct rs=
a_public_key *s)
+ {
+ 	if (!s)
+ 		return;
+-	crypto_bignum_free(s->n);
+-	crypto_bignum_free(s->e);
++	crypto_bignum_free(&s->n);
++	crypto_bignum_free(&s->e);
+ }
+=20
+=20
+@@ -155,14 +155,14 @@ void sw_crypto_acipher_free_rsa_keypair(struct rsa=
_keypair *s)
+ {
+ 	if (!s)
+ 		return;
+-	crypto_bignum_free(s->e);
+-	crypto_bignum_free(s->d);
+-	crypto_bignum_free(s->n);
+-	crypto_bignum_free(s->p);
+-	crypto_bignum_free(s->q);
+-	crypto_bignum_free(s->qp);
+-	crypto_bignum_free(s->dp);
+-	crypto_bignum_free(s->dq);
++	crypto_bignum_free(&s->e);
++	crypto_bignum_free(&s->d);
++	crypto_bignum_free(&s->n);
++	crypto_bignum_free(&s->p);
++	crypto_bignum_free(&s->q);
++	crypto_bignum_free(&s->qp);
++	crypto_bignum_free(&s->dp);
++	crypto_bignum_free(&s->dq);
+ }
+=20
+ TEE_Result crypto_acipher_gen_rsa_key(struct rsa_keypair *key,
+diff --git a/core/tee/tee_svc_cryp.c b/core/tee/tee_svc_cryp.c
+index 534e5ac39..880809753 100644
+--- a/core/tee/tee_svc_cryp.c
++++ b/core/tee/tee_svc_cryp.c
+@@ -869,8 +869,7 @@ static void op_attr_bignum_free(void *attr)
+ {
+ 	struct bignum **bn =3D attr;
+=20
+-	crypto_bignum_free(*bn);
+-	*bn =3D NULL;
++	crypto_bignum_free(bn);
+ }
+=20
+ static TEE_Result op_attr_value_from_user(void *attr, const void *buffe=
r,
+@@ -3445,8 +3444,8 @@ TEE_Result syscall_cryp_derive_key(unsigned long s=
tate,
+ 		} else {
+ 			res =3D TEE_ERROR_OUT_OF_MEMORY;
+ 		}
+-		crypto_bignum_free(pub);
+-		crypto_bignum_free(ss);
++		crypto_bignum_free(&pub);
++		crypto_bignum_free(&ss);
+ 	} else if (TEE_ALG_GET_MAIN_ALG(cs->algo) =3D=3D TEE_MAIN_ALGO_ECDH) {
+ 		struct ecc_public_key key_public;
+ 		uint8_t *pt_secret;
+diff --git a/lib/libmbedtls/core/bignum.c b/lib/libmbedtls/core/bignum.c
+index 61f6c5c60..dea30f61a 100644
+--- a/lib/libmbedtls/core/bignum.c
++++ b/lib/libmbedtls/core/bignum.c
+@@ -87,10 +87,13 @@ struct bignum *crypto_bignum_allocate(size_t size_bi=
ts)
+ 	return (struct bignum *)bn;
+ }
+=20
+-void crypto_bignum_free(struct bignum *s)
++void crypto_bignum_free(struct bignum **s)
+ {
+-	mbedtls_mpi_free((mbedtls_mpi *)s);
+-	free(s);
++	assert(s);
++
++	mbedtls_mpi_free((mbedtls_mpi *)*s);
++	free(*s);
++	*s =3D NULL;
+ }
+=20
+ void crypto_bignum_clear(struct bignum *s)
+diff --git a/lib/libmbedtls/core/dh.c b/lib/libmbedtls/core/dh.c
+index b3415aaa7..e95aa1495 100644
+--- a/lib/libmbedtls/core/dh.c
++++ b/lib/libmbedtls/core/dh.c
+@@ -35,10 +35,10 @@ TEE_Result crypto_acipher_alloc_dh_keypair(struct dh=
_keypair *s,
+ 		goto err;
+ 	return TEE_SUCCESS;
+ err:
+-	crypto_bignum_free(s->g);
+-	crypto_bignum_free(s->p);
+-	crypto_bignum_free(s->y);
+-	crypto_bignum_free(s->x);
++	crypto_bignum_free(&s->g);
++	crypto_bignum_free(&s->p);
++	crypto_bignum_free(&s->y);
++	crypto_bignum_free(&s->x);
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+=20
+diff --git a/lib/libmbedtls/core/ecc.c b/lib/libmbedtls/core/ecc.c
+index fd4a51b9d..46cd9fd1c 100644
+--- a/lib/libmbedtls/core/ecc.c
++++ b/lib/libmbedtls/core/ecc.c
+@@ -40,8 +40,8 @@ static void ecc_free_public_key(struct ecc_public_key =
*s)
+ 	if (!s)
+ 		return;
+=20
+-	crypto_bignum_free(s->x);
+-	crypto_bignum_free(s->y);
++	crypto_bignum_free(&s->x);
++	crypto_bignum_free(&s->y);
+ }
+=20
+ /*
+@@ -484,8 +484,8 @@ TEE_Result crypto_asym_alloc_ecc_keypair(struct ecc_=
keypair *s,
+ 	return TEE_SUCCESS;
+=20
+ err:
+-	crypto_bignum_free(s->d);
+-	crypto_bignum_free(s->x);
++	crypto_bignum_free(&s->d);
++	crypto_bignum_free(&s->x);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+@@ -581,7 +581,7 @@ TEE_Result crypto_asym_alloc_ecc_public_key(struct e=
cc_public_key *s,
+ 	return TEE_SUCCESS;
+=20
+ err:
+-	crypto_bignum_free(s->x);
++	crypto_bignum_free(&s->x);
+=20
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+diff --git a/lib/libmbedtls/core/rsa.c b/lib/libmbedtls/core/rsa.c
+index c3b5be509..a8aeb2c04 100644
+--- a/lib/libmbedtls/core/rsa.c
++++ b/lib/libmbedtls/core/rsa.c
+@@ -183,7 +183,7 @@ TEE_Result sw_crypto_acipher_alloc_rsa_public_key(st=
ruct rsa_public_key *s,
+ 		goto err;
+ 	return TEE_SUCCESS;
+ err:
+-	crypto_bignum_free(s->e);
++	crypto_bignum_free(&s->e);
+ 	return TEE_ERROR_OUT_OF_MEMORY;
+ }
+=20
+@@ -194,8 +194,8 @@ void sw_crypto_acipher_free_rsa_public_key(struct rs=
a_public_key *s)
+ {
+ 	if (!s)
+ 		return;
+-	crypto_bignum_free(s->n);
+-	crypto_bignum_free(s->e);
++	crypto_bignum_free(&s->n);
++	crypto_bignum_free(&s->e);
+ }
+=20
+ void crypto_acipher_free_rsa_keypair(struct rsa_keypair *s)
+@@ -205,14 +205,14 @@ void sw_crypto_acipher_free_rsa_keypair(struct rsa=
_keypair *s)
+ {
+ 	if (!s)
+ 		return;
+-	crypto_bignum_free(s->e);
+-	crypto_bignum_free(s->d);
+-	crypto_bignum_free(s->n);
+-	crypto_bignum_free(s->p);
+-	crypto_bignum_free(s->q);
+-	crypto_bignum_free(s->qp);
+-	crypto_bignum_free(s->dp);
+-	crypto_bignum_free(s->dq);
++	crypto_bignum_free(&s->e);
++	crypto_bignum_free(&s->d);
++	crypto_bignum_free(&s->n);
++	crypto_bignum_free(&s->p);
++	crypto_bignum_free(&s->q);
++	crypto_bignum_free(&s->qp);
++	crypto_bignum_free(&s->dp);
++	crypto_bignum_free(&s->dq);
+ }
+=20
+ TEE_Result crypto_acipher_gen_rsa_key(struct rsa_keypair *key,
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb
index 0f3e58de..0638cf7f 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb
@@ -14,4 +14,5 @@ SRC_URI +=3D " \
     file://0006-core-ffa-add-TOS_FW_CONFIG-handling.patch \
     file://0007-core-spmc-handle-non-secure-interrupts.patch \
     file://0008-core-spmc-configure-SP-s-NS-interrupt-action-based-o.pat=
ch \
+    file://CVE-2023-41325.patch \
    "
--=20
2.34.1


