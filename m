Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCFCCD6E6A
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 14:01:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24437.1763042505006153949
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 06:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06B1912FC
	for <meta-arm@lists.yoctoproject.org>; Thu, 13 Nov 2025 06:01:37 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 243BE3F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 13 Nov 2025 06:01:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/hafnium: build just the root target, not the tests
Date: Thu, 13 Nov 2025 14:01:38 +0000
Message-ID: <20251113140138.3224976-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113140138.3224976-1-ross.burton@arm.com>
References: <20251113140138.3224976-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Nov 2025 14:01:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6769

We don't run or package the tests, so there's no point to building them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.13.0.bb
index 72b7801073..d62ea363db 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.13.0.bb
@@ -53,7 +53,7 @@ do_configure() {
 do_configure[cleandirs] +=3D "${B}"
=20
 do_compile() {
-    ninja -v ${PARALLEL_MAKE}
+    ninja -v ${PARALLEL_MAKE} root
 }
 do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
=20
--=20
2.43.0


