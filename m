Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62A7103E183
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:56:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14632.1773842170247873774
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 06:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F3D31BF7
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Mar 2026 06:56:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48E4B3F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Mar 2026 06:56:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] layer.conf: update compatibility to wrynose
Date: Wed, 18 Mar 2026 13:56:05 +0000
Message-ID: <20260318135605.2483851-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Mar 2026 13:56:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6962

The oe-core master branch just switched from whinlatter to wrynose[1] so
follow this change in our layers.

[1] oe-core cd1179544d7 ("layer.conf: Update to wrynose")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index ecb91b0808..0e54e3f42c 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp =3D "5"
=20
-LAYERSERIES_COMPAT_meta-arm-bsp =3D "whinlatter"
+LAYERSERIES_COMPAT_meta-arm-bsp =3D "wrynose"
=20
 LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf=
/layer.conf
index 8bffff418b..12272da1f9 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain =3D "5"
=20
 LAYERDEPENDS_arm-toolchain =3D "core"
-LAYERSERIES_COMPAT_arm-toolchain =3D "whinlatter"
+LAYERSERIES_COMPAT_arm-toolchain =3D "wrynose"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 9d18c7c4db..c783846dcc 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm =3D " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm =3D "whinlatter"
+LAYERSERIES_COMPAT_meta-arm =3D "wrynose"
=20
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL +=3D "telnet"
--=20
2.43.0


