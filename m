Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788C0C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 11:47:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14942.1746013637555206055
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Apr 2025 04:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7D1A106F;
	Wed, 30 Apr 2025 04:47:09 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.74.97])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1ABCB3F5A1;
	Wed, 30 Apr 2025 04:47:15 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH] arm/classes/tfm_sign_image: Update script so different keys can be used
Date: Wed, 30 Apr 2025 13:47:04 +0200
Message-Id: <20250430114704.320831-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Apr 2025 11:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6484

From: Bence Balogh <bence.balogh@arm.com>

The tfm_sign_image.bbclass was updated so now the used signing key is
passed by the caller. This is needed because there can be cases where
different images have to be signed with different keys.

If no key is passed to the script, then use a default one to keep the
backward compatibility.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 meta-arm/classes/tfm_sign_image.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/classes/tfm_sign_image.bbclass b/meta-arm/classes/t=
fm_sign_image.bbclass
index 44ef3318..3b662e66 100644
--- a/meta-arm/classes/tfm_sign_image.bbclass
+++ b/meta-arm/classes/tfm_sign_image.bbclass
@@ -40,7 +40,6 @@ export OPENSSL_MODULES =3D "${STAGING_LIBDIR_NATIVE}/os=
sl-modules"
 TFM_IMAGE_SIGN_ARGS ?=3D "\
     -v ${RE_LAYOUT_WRAPPER_VERSION} \
     --layout "${TFM_IMAGE_SIGN_DIR}/${host_binary_layout}" \
-    -k  "${RECIPE_SYSROOT_NATIVE}/${TFM_SIGN_PRIVATE_KEY}" \
     --public-key-format full \
     --align 1 \
     --pad \
@@ -63,12 +62,15 @@ TFM_IMAGE_SIGN_ARGS ?=3D "\
 # $1 ... path of binary to sign
 # $2 ... load address of the given binary
 # $3 ... signed binary size
+# $4 ... signing private key's path
 #
 # Note: The signed binary is copied to ${TFM_IMAGE_SIGN_DIR}
 #
 sign_host_image() {
     host_binary_filename=3D"$(basename -s .bin "${1}")"
     host_binary_layout=3D"${host_binary_filename}_ns"
+    # If no key was passed then use the ${RECIPE_SYSROOT_NATIVE}/${TFM_S=
IGN_PRIVATE_KEY}
+    signing_key_path=3D"${4:-${RECIPE_SYSROOT_NATIVE}/${TFM_SIGN_PRIVATE=
_KEY}}"
=20
     cat << EOF > ${TFM_IMAGE_SIGN_DIR}/${host_binary_layout}
 enum image_attributes {
@@ -81,6 +83,7 @@ EOF
=20
     ${PYTHON} "${STAGING_LIBDIR_NATIVE}/tfm-scripts/wrapper/wrapper.py" =
\
             ${TFM_IMAGE_SIGN_ARGS} \
+            -k  "${signing_key_path}" \
             "${1}" \
             "${host_binary_signed}"
 }
--=20
2.25.1


