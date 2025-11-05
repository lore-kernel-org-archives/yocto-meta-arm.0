Return-Path: <david.hu2@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA82CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 10:41:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6871.1762339263684547602
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 02:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: david.hu2@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 661D2169C;
	Wed,  5 Nov 2025 02:40:55 -0800 (PST)
Received: from e124118.manchester.arm.com (e124118.arm.com [10.33.11.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E9ED3F66E;
	Wed,  5 Nov 2025 02:41:02 -0800 (PST)
From: David Hu <david.hu2@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: David Hu <david.hu2@arm.com>
Subject: [PATCH] arm/classes/tfm_sign_image: Support security counter
Date: Wed,  5 Nov 2025 10:40:38 +0000
Message-Id: <20251105104038.2479339-1-david.hu2@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Nov 2025 10:41:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6750

tfm_sign_image.bbclass hard codes the image security counter, which is
generated from the image version x.y.z.
The generated image security counter value is huge if x or y > 0.
Platform security counter store may not support such a huge counter
value.

Introduce a variable RE_WRAPPER_SECURITY_COUNTER to enable platforms to
specify the actual image security counter.

Signed-off-by: David Hu <david.hu2@arm.com>
---
 meta-arm/classes/tfm_sign_image.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arm/classes/tfm_sign_image.bbclass b/meta-arm/classes/t=
fm_sign_image.bbclass
index 3b662e66..f7900bb0 100644
--- a/meta-arm/classes/tfm_sign_image.bbclass
+++ b/meta-arm/classes/tfm_sign_image.bbclass
@@ -12,6 +12,11 @@ inherit python3native
 TFM_IMAGE_SIGN_DIR =3D "${WORKDIR}/tfm-signed-images"
 TFM_IMAGE_SIGN_DEPLOY_DIR =3D "${WORKDIR}/deploy-tfm-signed-images"
=20
+# Security counter value
+# If the security counter is not specified, generate the value from the =
image
+# version by default
+RE_WRAPPER_SECURITY_COUNTER ?=3D "auto"
+
 SSTATETASKS +=3D "do_sign_images"
 do_sign_images[sstate-inputdirs] =3D "${TFM_IMAGE_SIGN_DEPLOY_DIR}"
 do_sign_images[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
@@ -39,6 +44,7 @@ export OPENSSL_MODULES =3D "${STAGING_LIBDIR_NATIVE}/os=
sl-modules"
 # in an image recipe to customize the arguments.
 TFM_IMAGE_SIGN_ARGS ?=3D "\
     -v ${RE_LAYOUT_WRAPPER_VERSION} \
+    -s ${RE_WRAPPER_SECURITY_COUNTER} \
     --layout "${TFM_IMAGE_SIGN_DIR}/${host_binary_layout}" \
     --public-key-format full \
     --align 1 \
@@ -46,7 +52,6 @@ TFM_IMAGE_SIGN_ARGS ?=3D "\
     --pad-header \
     --measured-boot-record \
     -H ${RE_IMAGE_OFFSET} \
-    -s auto \
 "
=20
 #
--=20
2.34.1


