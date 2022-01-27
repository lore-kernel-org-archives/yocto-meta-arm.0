Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE0BC433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 16:54:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.378.1643302462726611708
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 08:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 744A71FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 27 Jan 2022 08:54:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B4903F766
	for <meta-arm@lists.yoctoproject.org>; Thu, 27 Jan 2022 08:54:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/trusted-firmware-m: set OpenSSL provider path
Date: Thu, 27 Jan 2022 16:54:17 +0000
Message-Id: <20220127165419.952245-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jan 2022 16:54:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2920

imgtool from mcuboot uses python3-cryptography-native, and the latest
python3-cryptography explicitly loads the legacy provider, which is a
separate shared object in OpenSSL 3.  The search path for providers is
hard-coded into the library so the wrong path is searched and the module
is not found.

Set OPENSSL_MODULES so the right path, so that the legacy module is
found.  In the future we may be able to be removed this if the explict
use of legacy algorithms is removed
(https://github.com/pyca/cryptography/issues/6809).

This also means we can remove the downgrades of python3-crytography that
were being carried in meta-arm.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.5.0.bb            | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.5.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.=
0.bb
index 302fd2cd..c0eee5cc 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
@@ -97,6 +97,10 @@ LDFLAGS[unexport] =3D "1"
 AS[unexport] =3D "1"
 LD[unexport] =3D "1"
=20
+# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
+# right path until this is relocated automatically.
+export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
+
 # TF-M ships patches that it needs applied to mbedcrypto, so apply them
 # as part of do_patch.
 apply_local_patches() {
--=20
2.25.1


