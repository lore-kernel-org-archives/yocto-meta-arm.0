Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61B8C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 18:30:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.522.1751913051887547358
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 11:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9053168F
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Jul 2025 11:30:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E1B2E3F694
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Jul 2025 11:30:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm/trusted-services: use UNPACKDIR instead of WORKDIR/sources/
Date: Mon,  7 Jul 2025 19:30:41 +0100
Message-ID: <20250707183042.1299783-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707183042.1299783-1-ross.burton@arm.com>
References: <20250707183042.1299783-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Jul 2025 18:30:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6601

Use UNPACKDIR directly instead of constructing it manually from WORKDIR.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-services/trusted-services-src.inc | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 5a7ab785c2..f557fccf6b 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -56,19 +56,19 @@ inherit apply_local_src_patches
 LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
=20
 do_apply_local_src_patches() {
-    apply_local_src_patches ${S}/external/qcbor ${WORKDIR}/sources/qcbor
-    apply_local_src_patches ${S}/external/t_cose ${WORKDIR}/sources/tcos=
e
-    apply_local_src_patches ${S}/external/MbedTLS ${WORKDIR}/sources/mbe=
dtls
-    apply_local_src_patches ${S}/external/CppUTest ${WORKDIR}/sources/cp=
putest
-    apply_local_src_patches ${S}/external/libfdt ${WORKDIR}/sources/dtc
-    apply_local_src_patches ${S}/external/nanopb ${WORKDIR}/sources/nano=
pb
+    apply_local_src_patches ${S}/external/qcbor ${UNPACKDIR}/qcbor
+    apply_local_src_patches ${S}/external/t_cose ${UNPACKDIR}/tcose
+    apply_local_src_patches ${S}/external/MbedTLS ${UNPACKDIR}/mbedtls
+    apply_local_src_patches ${S}/external/CppUTest ${UNPACKDIR}/cpputest
+    apply_local_src_patches ${S}/external/libfdt ${UNPACKDIR}/dtc
+    apply_local_src_patches ${S}/external/nanopb ${UNPACKDIR}/nanopb
 }
=20
 # Paths to dependencies required by some TS SPs/tools
-EXTRA_OECMAKE +=3D "-DDTC_SOURCE_DIR=3D${WORKDIR}/sources/dtc \
-                  -DCPPUTEST_SOURCE_DIR=3D${WORKDIR}/sources/cpputest \
-                  -DNANOPB_SOURCE_DIR=3D${WORKDIR}/sources/nanopb \
-                  -DT_COSE_SOURCE_DIR=3D${WORKDIR}/sources/tcose \
-                  -DQCBOR_SOURCE_DIR=3D${WORKDIR}/sources/qcbor \
-                  -DMBEDTLS_SOURCE_DIR=3D${WORKDIR}/sources/mbedtls \
+EXTRA_OECMAKE +=3D "-DDTC_SOURCE_DIR=3D${UNPACKDIR}/dtc \
+                  -DCPPUTEST_SOURCE_DIR=3D${UNPACKDIR}/cpputest \
+                  -DNANOPB_SOURCE_DIR=3D${UNPACKDIR}/nanopb \
+                  -DT_COSE_SOURCE_DIR=3D${UNPACKDIR}/tcose \
+                  -DQCBOR_SOURCE_DIR=3D${UNPACKDIR}/qcbor \
+                  -DMBEDTLS_SOURCE_DIR=3D${UNPACKDIR}/mbedtls \
                  "
--=20
2.43.0


