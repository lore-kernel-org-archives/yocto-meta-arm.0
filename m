Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13663.1607609960162360909
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 06:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 658F51FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 06:19:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EF6A3F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 06:19:18 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] layers: consolidate layer priority to match oe-core
Date: Thu, 10 Dec 2020 14:19:15 +0000
Message-Id: <20201210141915.1499208-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Without exceptional justification there is no good reason for layers to
have a priority other than 5, to match oe-core.  If a layer has a
priority higher than oe-core's then recipes in that layer take immediate
preference over those in oe-core and there's no simple way to resolve
this as that is exactly what is meant to happen.

As a concrete example, meta-arm-bsp contains older releases of U-Boot
for platforms that have not yet moved to the latest release in oe-core.
As the priority of meta-arm-bsp is higher, simply adding this layer to a
qemuarm build will immediately downgrade u-boot.

As there is no exceptional justification for the differing priorities,
unify on 5.

Change-Id: I1975753b4a9799cc00310a7c8a6a11c2aef41f65
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-autonomy/conf/layer.conf  | 2 +-
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-gem5/conf/layer.conf          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/l=
ayer.conf
index 936b6c1..dee0c01 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILES +=3D " \
=20
 BBFILE_COLLECTIONS +=3D "meta-arm-autonomy"
 BBFILE_PATTERN_meta-arm-autonomy =3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-arm-autonomy =3D "6"
+BBFILE_PRIORITY_meta-arm-autonomy =3D "5"
 LAYERDEPENDS_meta-arm-autonomy =3D " \
    core \
    yocto \
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 8374012..445697f 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
=20
 BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-arm-bsp =3D "6"
+BBFILE_PRIORITY_meta-arm-bsp =3D "5"
=20
 LAYERSERIES_COMPAT_meta-arm-bsp =3D "gatesgarth"
=20
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf=
/layer.conf
index d0ca75a..1a0499d 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -6,7 +6,7 @@ BBFILES +=3D "\
=20
 BBFILE_COLLECTIONS +=3D "arm-toolchain"
 BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_arm-toolchain =3D "30"
+BBFILE_PRIORITY_arm-toolchain =3D "5"
=20
 # Additional license directories.
 LICENSE_PATH +=3D "${LAYERDIR}/custom-licenses"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index 58242c3..a6448eb 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
=20
 BBFILE_COLLECTIONS +=3D "meta-gem5"
 BBFILE_PATTERN_meta-gem5 =3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-gem5 =3D "6"
+BBFILE_PRIORITY_meta-gem5 =3D "5"
=20
 LAYERDEPENDS_meta-gem5 =3D "core openembedded-layer"
 LAYERSERIES_COMPAT_meta-gem5 =3D "gatesgarth"
--=20
2.25.1

