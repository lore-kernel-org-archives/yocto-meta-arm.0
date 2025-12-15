Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9065AD5B170
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 18:00:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.863.1765821656508091118
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 10:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCE93FEC
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 10:00:48 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DCD53F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 10:00:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-m: apply local patches in the git version
Date: Mon, 15 Dec 2025 18:00:50 +0000
Message-ID: <20251215180051.1476057-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 18:00:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6798

When the git version of this recipe was created, the application of local
patches was left out.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m-git-src.inc                   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc
index fc23c0285d..bf3a07d218 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
@@ -62,3 +62,15 @@ SRCREV_t-cose =3D "3076010eeb6383f0827bd992c75b68af931=
1cf1d"
 SRCREV_FORMAT =3D "tfm"
=20
 S =3D "${UNPACKDIR}/tfm"
+
+# Apply patches
+inherit apply_local_src_patches
+LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
+
+do_apply_local_src_patches() {
+    apply_local_src_patches ${S}/lib/ext/qcbor ${UNPACKDIR}/qcbor
+    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${UNPACKDIR}/mbedtls
+    apply_local_src_patches ${S}/lib/ext/mcuboot ${UNPACKDIR}/mcuboot
+    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${UNPACKDIR}/tf-m-te=
sts
+    apply_local_src_patches ${S}/lib/ext/t_cose ${UNPACKDIR}/t_cose
+}
--=20
2.43.0


