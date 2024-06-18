Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE6FC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 15:41:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89909.1718725292436036655
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 08:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6AE3DA7
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 08:41:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A75283F6A8
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 08:41:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/optee-ftpm: silence new compiler errors from GCC 14.1
Date: Tue, 18 Jun 2024 15:41:27 +0000
Message-Id: <20240618154129.456464-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 15:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5825

GCC 14.1 is stricter with code validation and the build now fails.
However as upstream appear to be about to remove this source entirely fro=
m
upstream[1] I didn't want to spend long investigating this if upstream
changes will obsolete it, so just silence the errors for now.

[1] https://github.com/microsoft/ms-tpm-20-ref/pull/108

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/met=
a-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index d5f6e01d..9546215a 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -42,6 +42,11 @@ EXTRA_OEMAKE:append:aarch64:qemuall =3D "\
     CFG_ARM64_ta_arm64=3Dy \
 "
=20
+# TODO: GCC 14.1 is finding genuine issues with the code but as upstream=
 appear to be removing
+# the code we're building (https://github.com/microsoft/ms-tpm-20-ref/pu=
ll/108) lets just
+# ignore them for now.
+CFLAGS +=3D "-Wno-implicit-function-declaration -Wno-incompatible-pointe=
r-types"
+
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
 # right path until this is relocated automatically.
 export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
--=20
2.34.1


