Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A6AC54764
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 18:27:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1646.1708367220772589225
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Feb 2024 10:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F590FEC;
	Mon, 19 Feb 2024 10:27:40 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.93.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5337C3F73F;
	Mon, 19 Feb 2024 10:26:59 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH nanbield 1/1] arm-bsp/optee: Improve PIN counter handling robustness
Date: Mon, 19 Feb 2024 18:26:37 +0000
Message-Id: <20240219182637.530206-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219182637.530206-1-emekcan.aras@arm.com>
References: <20240219182637.530206-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Feb 2024 18:27:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5386

From: Emekcan Aras <emekcan.aras@arm.com>

This patches a security issue discovered lately in OP-TEE version
earlier than v4.1. The detailed report can be found here:

https://github.com/OP-TEE/optee_os/security/advisories/GHSA-2f5m-q4w3-865=
p

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...rove-PIN-counter-handling-robustness.patch | 205 ++++++++++++++++++
 .../recipes-security/optee/optee-os_3.22.0.bb |   1 +
 2 files changed, 206 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0=
005-ta-pkcs11-Improve-PIN-counter-handling-robustness.patch

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0005-ta-=
pkcs11-Improve-PIN-counter-handling-robustness.patch b/meta-arm-bsp/recip=
es-security/optee/optee-os-3.22.0/0005-ta-pkcs11-Improve-PIN-counter-hand=
ling-robustness.patch
new file mode 100644
index 00000000..d95954fa
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-3.22.0/0005-ta-pkcs11-=
Improve-PIN-counter-handling-robustness.patch
@@ -0,0 +1,205 @@
+From d75c42ff2847b090d5b1f11c49067cd41fcc2734 Mon Sep 17 00:00:00 2001
+From: Loic Poulain <loic.poulain@linaro.org>
+Date: Tue, 31 Oct 2023 11:07:00 +0100
+Subject: [PATCH] ta: pkcs11: Improve PIN counter handling robustness
+
+Make sure PIN check attempt is saved persistently before continuing with
+the actual PIN verification, improving counter and flags coherency in
+case of subsequent failure with persistent saving.
+
+Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
+Reviewed-by: Etienne Carriere <etienne.carriere@foss.st.com>
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/6445/=
commits/0a74733d9437d94a5b4b2db6c40c5755cabc5393]
+---
+ ta/pkcs11/src/pkcs11_token.c | 126 +++++++++++++++++------------------
+ 1 file changed, 62 insertions(+), 64 deletions(-)
+
+diff --git a/ta/pkcs11/src/pkcs11_token.c b/ta/pkcs11/src/pkcs11_token.c
+index ab0fc291e..c5271e449 100644
+--- a/ta/pkcs11/src/pkcs11_token.c
++++ b/ta/pkcs11/src/pkcs11_token.c
+@@ -1132,117 +1132,115 @@ static enum pkcs11_rc check_so_pin(struct pkcs=
11_session *session,
+ 				   uint8_t *pin, size_t pin_size)
+ {
+ 	struct ck_token *token =3D session->token;
++	struct token_persistent_main *db =3D token->db_main;
+ 	enum pkcs11_rc rc =3D PKCS11_CKR_OK;
+=20
+-	assert(token->db_main->flags & PKCS11_CKFT_TOKEN_INITIALIZED);
++	assert(db->flags & PKCS11_CKFT_TOKEN_INITIALIZED);
+=20
+ 	if (IS_ENABLED(CFG_PKCS11_TA_AUTH_TEE_IDENTITY) &&
+-	    token->db_main->flags & PKCS11_CKFT_PROTECTED_AUTHENTICATION_PATH)
++	    db->flags & PKCS11_CKFT_PROTECTED_AUTHENTICATION_PATH)
+ 		return verify_identity_auth(token, PKCS11_CKU_SO);
+=20
+-	if (token->db_main->flags & PKCS11_CKFT_SO_PIN_LOCKED)
++	if (db->flags & PKCS11_CKFT_SO_PIN_LOCKED)
+ 		return PKCS11_CKR_PIN_LOCKED;
+=20
+-	rc =3D verify_pin(PKCS11_CKU_SO, pin, pin_size,
+-			token->db_main->so_pin_salt,
+-			token->db_main->so_pin_hash);
+-	if (rc) {
+-		unsigned int pin_count =3D 0;
++	/*
++	 * Preset the counter and flags conservatively in the database so that
++	 * the tentative is saved whatever happens next.
++	 */
++	db->flags |=3D PKCS11_CKFT_SO_PIN_COUNT_LOW;
++	db->so_pin_count++;
+=20
+-		if (rc !=3D PKCS11_CKR_PIN_INCORRECT)
+-			return rc;
++	if (db->so_pin_count =3D=3D PKCS11_TOKEN_SO_PIN_COUNT_MAX - 1)
++		db->flags |=3D PKCS11_CKFT_SO_PIN_FINAL_TRY;
++	else if (db->so_pin_count =3D=3D PKCS11_TOKEN_SO_PIN_COUNT_MAX)
++		db->flags |=3D PKCS11_CKFT_SO_PIN_LOCKED;
+=20
+-		token->db_main->flags |=3D PKCS11_CKFT_SO_PIN_COUNT_LOW;
+-		token->db_main->so_pin_count++;
+-
+-		pin_count =3D token->db_main->so_pin_count;
+-		if (pin_count =3D=3D PKCS11_TOKEN_SO_PIN_COUNT_MAX - 1)
+-			token->db_main->flags |=3D PKCS11_CKFT_SO_PIN_FINAL_TRY;
+-		if (pin_count =3D=3D PKCS11_TOKEN_SO_PIN_COUNT_MAX)
+-			token->db_main->flags |=3D PKCS11_CKFT_SO_PIN_LOCKED;
+-
+-		update_persistent_db(token);
++	update_persistent_db(token);
+=20
+-		if (token->db_main->flags & PKCS11_CKFT_SO_PIN_LOCKED)
++	rc =3D verify_pin(PKCS11_CKU_SO, pin, pin_size,
++			db->so_pin_salt,
++			db->so_pin_hash);
++	if (rc =3D=3D PKCS11_CKR_PIN_INCORRECT) {
++		if (db->flags & PKCS11_CKFT_SO_PIN_LOCKED)
+ 			return PKCS11_CKR_PIN_LOCKED;
+=20
+ 		return PKCS11_CKR_PIN_INCORRECT;
+ 	}
+=20
+-	if (token->db_main->so_pin_count) {
+-		token->db_main->so_pin_count =3D 0;
++	if (rc)
++		db->so_pin_count--;
++	else
++		db->so_pin_count =3D 0;
+=20
+-		update_persistent_db(token);
++	db->flags &=3D ~PKCS11_CKFT_SO_PIN_LOCKED;
++	if (db->so_pin_count < PKCS11_TOKEN_SO_PIN_COUNT_MAX - 1) {
++		db->flags &=3D ~PKCS11_CKFT_SO_PIN_FINAL_TRY;
++		if (!db->so_pin_count)
++			db->flags &=3D ~PKCS11_CKFT_SO_PIN_COUNT_LOW;
+ 	}
+=20
+-	if (token->db_main->flags & (PKCS11_CKFT_SO_PIN_COUNT_LOW |
+-				     PKCS11_CKFT_SO_PIN_FINAL_TRY)) {
+-		token->db_main->flags &=3D ~(PKCS11_CKFT_SO_PIN_COUNT_LOW |
+-					   PKCS11_CKFT_SO_PIN_FINAL_TRY);
+-
+-		update_persistent_db(token);
+-	}
++	update_persistent_db(token);
+=20
+-	return PKCS11_CKR_OK;
++	return rc;
+ }
+=20
+ static enum pkcs11_rc check_user_pin(struct pkcs11_session *session,
+ 				     uint8_t *pin, size_t pin_size)
+ {
+ 	struct ck_token *token =3D session->token;
++	struct token_persistent_main *db =3D token->db_main;
+ 	enum pkcs11_rc rc =3D PKCS11_CKR_OK;
+=20
+ 	if (IS_ENABLED(CFG_PKCS11_TA_AUTH_TEE_IDENTITY) &&
+-	    token->db_main->flags & PKCS11_CKFT_PROTECTED_AUTHENTICATION_PATH)
++	    db->flags & PKCS11_CKFT_PROTECTED_AUTHENTICATION_PATH)
+ 		return verify_identity_auth(token, PKCS11_CKU_USER);
+=20
+-	if (!token->db_main->user_pin_salt)
++	if (!db->user_pin_salt)
+ 		return PKCS11_CKR_USER_PIN_NOT_INITIALIZED;
+=20
+-	if (token->db_main->flags & PKCS11_CKFT_USER_PIN_LOCKED)
++	if (db->flags & PKCS11_CKFT_USER_PIN_LOCKED)
+ 		return PKCS11_CKR_PIN_LOCKED;
+=20
+-	rc =3D verify_pin(PKCS11_CKU_USER, pin, pin_size,
+-			token->db_main->user_pin_salt,
+-			token->db_main->user_pin_hash);
+-	if (rc) {
+-		unsigned int pin_count =3D 0;
+-
+-		if (rc !=3D PKCS11_CKR_PIN_INCORRECT)
+-			return rc;
+-
+-		token->db_main->flags |=3D PKCS11_CKFT_USER_PIN_COUNT_LOW;
+-		token->db_main->user_pin_count++;
++	/*
++	 * Preset the counter and flags conservatively in the database so that
++	 * the tentative is saved whatever happens next.
++	 */
++	db->flags |=3D PKCS11_CKFT_USER_PIN_COUNT_LOW;
++	db->user_pin_count++;
+=20
+-		pin_count =3D token->db_main->user_pin_count;
+-		if (pin_count =3D=3D PKCS11_TOKEN_USER_PIN_COUNT_MAX - 1)
+-			token->db_main->flags |=3D PKCS11_CKFT_USER_PIN_FINAL_TRY;
+-		if (pin_count =3D=3D PKCS11_TOKEN_USER_PIN_COUNT_MAX)
+-			token->db_main->flags |=3D PKCS11_CKFT_USER_PIN_LOCKED;
++	if (db->user_pin_count =3D=3D PKCS11_TOKEN_USER_PIN_COUNT_MAX - 1)
++		db->flags |=3D PKCS11_CKFT_USER_PIN_FINAL_TRY;
++	else if (db->user_pin_count =3D=3D PKCS11_TOKEN_USER_PIN_COUNT_MAX)
++		db->flags |=3D PKCS11_CKFT_USER_PIN_LOCKED;
+=20
+-		update_persistent_db(token);
++	update_persistent_db(token);
+=20
+-		if (token->db_main->flags & PKCS11_CKFT_USER_PIN_LOCKED)
++	rc =3D verify_pin(PKCS11_CKU_USER, pin, pin_size,
++			db->user_pin_salt,
++			db->user_pin_hash);
++	if (rc =3D=3D PKCS11_CKR_PIN_INCORRECT) {
++		if (db->flags & PKCS11_CKFT_USER_PIN_LOCKED)
+ 			return PKCS11_CKR_PIN_LOCKED;
+=20
+ 		return PKCS11_CKR_PIN_INCORRECT;
+ 	}
+=20
+-	if (token->db_main->user_pin_count) {
+-		token->db_main->user_pin_count =3D 0;
++	if (rc)
++		db->user_pin_count--;
++	else
++		db->user_pin_count =3D 0;
+=20
+-		update_persistent_db(token);
++	db->flags &=3D ~PKCS11_CKFT_USER_PIN_LOCKED;
++	if (db->user_pin_count < PKCS11_TOKEN_USER_PIN_COUNT_MAX - 1) {
++		db->flags &=3D ~PKCS11_CKFT_USER_PIN_FINAL_TRY;
++		if (!db->user_pin_count)
++			db->flags &=3D ~PKCS11_CKFT_USER_PIN_COUNT_LOW;
+ 	}
+=20
+-	if (token->db_main->flags & (PKCS11_CKFT_USER_PIN_COUNT_LOW |
+-				     PKCS11_CKFT_USER_PIN_FINAL_TRY)) {
+-		token->db_main->flags &=3D ~(PKCS11_CKFT_USER_PIN_COUNT_LOW |
+-					   PKCS11_CKFT_USER_PIN_FINAL_TRY);
+-
+-		update_persistent_db(token);
+-	}
++	update_persistent_db(token);
+=20
+-	return PKCS11_CKR_OK;
++	return rc;
+ }
+=20
+ enum pkcs11_rc entry_ck_set_pin(struct pkcs11_client *client,
+--=20
+2.25.1
+
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-os_3.22.0.bb
index e1220192..16a193c3 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bb
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bb
@@ -10,4 +10,5 @@ SRC_URI +=3D " \
     file://0002-core-Define-section-attributes-for-clang.patch \
     file://0003-optee-enable-clang-support.patch \
     file://0004-core-link-add-no-warn-rwx-segments.patch \
+    file://0005-ta-pkcs11-Improve-PIN-counter-handling-robustness.patch =
\
    "
--=20
2.25.1


