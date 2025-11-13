Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74991CD6E6D
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 14:01:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24436.1763042504402580666
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 06:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43A731477
	for <meta-arm@lists.yoctoproject.org>; Thu, 13 Nov 2025 06:01:36 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B5923F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 13 Nov 2025 06:01:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/hafnium: ensure prebuilt binaries can't be used
Date: Thu, 13 Nov 2025 14:01:37 +0000
Message-ID: <20251113140138.3224976-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113140138.3224976-1-ross.burton@arm.com>
References: <20251113140138.3224976-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Nov 2025 14:01:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6768

We depend on native tools to provide these binaries, so we can delete
them to ensure that our tools are always used and never the prebuilt.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.13.0.bb
index 60024553eb..72b7801073 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb
@@ -40,6 +40,13 @@ EXTRA_OEMAKE +=3D "PLATFORM=3D${HAFNIUM_PLATFORM}"
 # Don't use prebuilt binaries for gn and ninja
 EXTRA_OEMAKE +=3D "GN=3D${STAGING_BINDIR_NATIVE}/gn NINJA=3D${STAGING_BI=
NDIR_NATIVE}/ninja"
=20
+prune_prebuilts() {
+    for dir in dtc gn ninja qemu; do
+        rm -rf ${S}/prebuilts/*/$dir
+    done
+}
+do_unpack[postfuncs] +=3D "prune_prebuilts"
+
 do_configure() {
     oe_runmake -C ${S} ${B}/build.ninja
 }
--=20
2.43.0


