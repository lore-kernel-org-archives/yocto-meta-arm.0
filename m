Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C251C677F1
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 12:05:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7011.1677067506312761612
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 04:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 667F4139F;
	Wed, 22 Feb 2023 04:05:48 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0579E3F881;
	Wed, 22 Feb 2023 04:05:04 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/6] arm/classes: Factor out image signing arguments in tfm_image_sign
Date: Wed, 22 Feb 2023 12:04:37 +0000
Message-Id: <20230222120441.2684534-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222120441.2684534-1-peter.hoyes@arm.com>
References: <20230222120441.2684534-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 12:05:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4438

From: Peter Hoyes <Peter.Hoyes@arm.com>

Factor out the image signing arguments in tfm_image_sign.bbclass into
its own variable, TFM_IMAGE_SIGN_ARGS, so that it can be customized on a
per-machine basis if necessary.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta-arm/classes/tfm_sign_image.bbclass | 26 +++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta-arm/classes/tfm_sign_image.bbclass b/meta-arm/classes/t=
fm_sign_image.bbclass
index a5c41ae3..5ba57dc8 100644
--- a/meta-arm/classes/tfm_sign_image.bbclass
+++ b/meta-arm/classes/tfm_sign_image.bbclass
@@ -35,6 +35,21 @@ DEPENDS +=3D "trusted-firmware-m-scripts-native"
 # right path until this is relocated automatically.
 export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
=20
+# The arguments passed to the TF-M image signing script. Override this v=
ariable
+# in an image recipe to customize the arguments.
+TFM_IMAGE_SIGN_ARGS ?=3D "\
+    -v ${RE_LAYOUT_WRAPPER_VERSION} \
+    --layout "${TFM_IMAGE_SIGN_DIR}/${host_binary_layout}" \
+    -k  "${RECIPE_SYSROOT_NATIVE}/${TFM_SIGN_PRIVATE_KEY}" \
+    --public-key-format full \
+    --align 1 \
+    --pad \
+    --pad-header \
+    --measured-boot-record \
+    -H ${RE_IMAGE_OFFSET} \
+    -s auto \
+"
+
 #
 # sign_host_image
 #
@@ -65,16 +80,7 @@ EOF
     host_binary_signed=3D"${TFM_IMAGE_SIGN_DIR}/signed_$(basename "${1}"=
)"
=20
     ${PYTHON} "${STAGING_LIBDIR_NATIVE}/tfm-scripts/wrapper/wrapper.py" =
\
-            -v ${RE_LAYOUT_WRAPPER_VERSION} \
-            --layout "${TFM_IMAGE_SIGN_DIR}/${host_binary_layout}" \
-            -k  "${RECIPE_SYSROOT_NATIVE}/${TFM_SIGN_PRIVATE_KEY}" \
-            --public-key-format full \
-            --align 1 \
-            --pad \
-            --pad-header \
-            --measured-boot-record \
-            -H ${RE_IMAGE_OFFSET} \
-            -s auto \
+            ${TFM_IMAGE_SIGN_ARGS} \
             "${1}" \
             "${host_binary_signed}"
 }
--=20
2.34.1


