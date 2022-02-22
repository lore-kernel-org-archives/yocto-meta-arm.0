Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61398C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 02:34:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8144.1645497244708411236
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 18:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8579A40AE9
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 02:34:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Plq__FcCPoCQ for <meta-arm@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 02:34:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 764DA40951
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 02:34:03 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 81B73174765;
	Mon, 21 Feb 2022 21:34:02 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] meta-arm: switch layer compatibility from honister to
 kirkstone
Date: Tue, 22 Feb 2022 02:33:46 +0000
Message-Id: <20220222023346.2812867-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 02:34:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3034

Due to several global variable renames as part of "inclusinve language",
kirkstone has no advertised backward compatibility with honister.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 meta-atp/conf/layer.conf           | 2 +-
 meta-gem5/conf/layer.conf          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf=
/layer.conf
index fe23fd4..e00180c 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain =3D "5"
=20
 LAYERDEPENDS_arm-toolchain =3D "core"
-LAYERSERIES_COMPAT_arm-toolchain =3D "honister"
+LAYERSERIES_COMPAT_arm-toolchain =3D "kirkstone"
=20
 # do not error out on bbappends for missing recipes
 BB_DANGLINGAPPENDS_WARNONLY =3D "true"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 69817f4..c23ea56 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm =3D " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm =3D "honister"
+LAYERSERIES_COMPAT_meta-arm =3D "kirkstone"
=20
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL +=3D "telnet"
diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf
index f749e4a..3ec36e8 100644
--- a/meta-atp/conf/layer.conf
+++ b/meta-atp/conf/layer.conf
@@ -6,4 +6,4 @@ BBFILE_COLLECTIONS +=3D "meta-atp"
 BBFILE_PATTERN_meta-atp =3D "^${LAYERDIR}/"
=20
 LAYERDEPENDS_meta-atp =3D "core openembedded-layer meta-gem5"
-LAYERSERIES_COMPAT_meta-atp =3D "honister"
+LAYERSERIES_COMPAT_meta-atp =3D "kirkstone"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index 0b699b2..d329bd0 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 =3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 =3D "5"
=20
 LAYERDEPENDS_meta-gem5 =3D "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-gem5 =3D "honister"
+LAYERSERIES_COMPAT_meta-gem5 =3D "kirkstone"
=20
 BBFILES_DYNAMIC +=3D " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/=
*/*/*.bbappend \
--=20
2.25.1


