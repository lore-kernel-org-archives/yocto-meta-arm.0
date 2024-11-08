Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BA2D5C0C9
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 13:50:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13027.1731073807137311829
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Nov 2024 05:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBC41339
	for <meta-arm@lists.yoctoproject.org>; Fri,  8 Nov 2024 05:50:35 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A87453F528
	for <meta-arm@lists.yoctoproject.org>; Fri,  8 Nov 2024 05:50:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: don't use debug-tweaks
Date: Fri,  8 Nov 2024 13:49:59 +0000
Message-Id: <20241108134959.1857796-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 08 Nov 2024 13:50:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6248

As of the following commit in oe-core[1]:

  classes-recipe/core-image: drop debug-tweaks IMAGE_FEATURE

The debug-tweaks feature is no longer valid. Replace it with the options
that we need to perform login over testimage.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D2c229f954=
2c6ba608912e14c9c3f783c3fa89349

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/debug.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ci/debug.yml b/ci/debug.yml
index 371035a1..c13b2874 100644
--- a/ci/debug.yml
+++ b/ci/debug.yml
@@ -5,5 +5,5 @@ header:
=20
 # Add universally helpful features when testing boards
 local_conf_header:
-  debug: |
-    EXTRA_IMAGE_FEATURES:append =3D " debug-tweaks"
+  rootlogin: |
+    EXTRA_IMAGE_FEATURES:append =3D " allow-empty-password empty-root-pa=
ssword allow-root-login"
--=20
2.34.1


