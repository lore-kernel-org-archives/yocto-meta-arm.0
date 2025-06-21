Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40E6C7115D
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 13:27:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7282.1750512460307068454
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 21 Jun 2025 06:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 742F81655
	for <meta-arm@lists.yoctoproject.org>; Sat, 21 Jun 2025 06:27:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 560AD3F673
	for <meta-arm@lists.yoctoproject.org>; Sat, 21 Jun 2025 06:27:39 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] Add whinlatter to compatible layers
Date: Sat, 21 Jun 2025 09:27:37 -0400
Message-Id: <20250621132738.83559-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 21 Jun 2025 13:27:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6575

whinlatter is the next release, add it as a compatible layer

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/layer.conf         | 2 +-
 meta-arm-systemready/conf/layer.conf | 2 +-
 meta-arm-toolchain/conf/layer.conf   | 2 +-
 meta-arm/conf/layer.conf             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index a1f0730d1afe..655a8c9681dc 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp =3D "5"
=20
-LAYERSERIES_COMPAT_meta-arm-bsp =3D "styhead walnascar"
+LAYERSERIES_COMPAT_meta-arm-bsp =3D "walnascar whinlatter"
=20
 LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-systemready/conf/layer.conf b/meta-arm-systemready/=
conf/layer.conf
index 263b38d18247..5616a3aaf71d 100644
--- a/meta-arm-systemready/conf/layer.conf
+++ b/meta-arm-systemready/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS +=3D "meta-arm-systemready"
 BBFILE_PATTERN_meta-arm-systemready =3D "^${LAYERDIR}/"
=20
-LAYERSERIES_COMPAT_meta-arm-systemready =3D "styhead walnascar"
+LAYERSERIES_COMPAT_meta-arm-systemready =3D "walnascar whinlatter"
=20
 LAYERDEPENDS_meta-arm-systemready =3D "core"
=20
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf=
/layer.conf
index 38ccc7ee94e1..c7a832011bf5 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain =3D "5"
=20
 LAYERDEPENDS_arm-toolchain =3D "core"
-LAYERSERIES_COMPAT_arm-toolchain =3D "styhead walnascar"
+LAYERSERIES_COMPAT_arm-toolchain =3D "walnascar whinlatter"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 3c38e7697656..753f5259d6be 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm =3D " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm =3D "styhead walnascar"
+LAYERSERIES_COMPAT_meta-arm =3D "walnascar whinlatter"
=20
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL +=3D "telnet"
--=20
2.39.5 (Apple Git-154)


