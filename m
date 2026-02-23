Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EB3EA4FC3
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 13:52:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35398.1771854743891238856
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 05:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 055BA497
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 05:52:17 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2396C3F59E
	for <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 05:52:23 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm*/layer.conf: drop walnascar
Date: Mon, 23 Feb 2026 08:52:20 -0500
Message-ID: <20260223135221.4381-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223135221.4381-1-jon.mason@arm.com>
References: <20260223135221.4381-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Feb 2026 13:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6914

walnascar compatibility isn't tested and isn't supported with whinlatter
or later, drop it.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index a4b348df3dc2..ecb91b080814 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp =3D "5"
=20
-LAYERSERIES_COMPAT_meta-arm-bsp =3D "walnascar whinlatter"
+LAYERSERIES_COMPAT_meta-arm-bsp =3D "whinlatter"
=20
 LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf=
/layer.conf
index c7a832011bf5..8bffff418b2d 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain =3D "5"
=20
 LAYERDEPENDS_arm-toolchain =3D "core"
-LAYERSERIES_COMPAT_arm-toolchain =3D "walnascar whinlatter"
+LAYERSERIES_COMPAT_arm-toolchain =3D "whinlatter"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 8f7e1a437142..956a67c797e1 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm =3D " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm =3D "walnascar whinlatter"
+LAYERSERIES_COMPAT_meta-arm =3D "whinlatter"
=20
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL +=3D "telnet"
--=20
2.50.1 (Apple Git-155)


