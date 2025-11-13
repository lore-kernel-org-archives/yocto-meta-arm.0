Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71780CD6E63
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 14:01:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24435.1763042503769430097
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 06:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4405B12FC
	for <meta-arm@lists.yoctoproject.org>; Thu, 13 Nov 2025 06:01:35 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 697CB3F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 13 Nov 2025 06:01:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/hafnium: split configure/compile and call ninja directly
Date: Thu, 13 Nov 2025 14:01:36 +0000
Message-ID: <20251113140138.3224976-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Nov 2025 14:01:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6767

Split configure/compile and invoke ninja directly so that we can
control parallelisation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.13.0.bb
index 70ad6b1611..60024553eb 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb
@@ -40,11 +40,15 @@ EXTRA_OEMAKE +=3D "PLATFORM=3D${HAFNIUM_PLATFORM}"
 # Don't use prebuilt binaries for gn and ninja
 EXTRA_OEMAKE +=3D "GN=3D${STAGING_BINDIR_NATIVE}/gn NINJA=3D${STAGING_BI=
NDIR_NATIVE}/ninja"
=20
+do_configure() {
+    oe_runmake -C ${S} ${B}/build.ninja
+}
 do_configure[cleandirs] +=3D "${B}"
=20
 do_compile() {
-    oe_runmake -C ${S}
+    ninja -v ${PARALLEL_MAKE}
 }
+do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
=20
 do_install() {
     cd ${B}/${HAFNIUM_PLATFORM}_clang
--=20
2.43.0


