Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1267.1615928965354347084
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 14:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E435FD6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Mar 2021 14:09:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BEE73F718
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Mar 2021 14:09:23 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] layers: add hardknott to compatible release branches
Date: Tue, 16 Mar 2021 21:09:21 +0000
Message-Id: <20210316210921.3215579-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Upstream oe-core is preparing to be the Hardknott release, so add
hardknott to our compatible release list.

Once hardknott is public we should remove gatesgarth.

Change-Id: Ia5c59e703910db96a3967a1ecad074ac80d03ee9
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-autonomy/conf/layer.conf  | 2 +-
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 meta-gem5/conf/layer.conf          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/l=
ayer.conf
index d577a55..2372af6 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_meta-arm-autonomy =3D " \
    networking-layer \
    virtualization-layer \
 "
-LAYERSERIES_COMPAT_meta-arm-autonomy =3D "gatesgarth"
+LAYERSERIES_COMPAT_meta-arm-autonomy =3D "gatesgarth hardknott"
=20
 # We don't activate virtualization feature from meta-virtualization as i=
t
 # brings in lots of stuff we don't need. We need to disable the sanity c=
heck
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 445697f..622f89e 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp =3D "5"
=20
-LAYERSERIES_COMPAT_meta-arm-bsp =3D "gatesgarth"
+LAYERSERIES_COMPAT_meta-arm-bsp =3D "gatesgarth hardknott"
=20
 LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf=
/layer.conf
index 1a0499d..2e53e42 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -12,7 +12,7 @@ BBFILE_PRIORITY_arm-toolchain =3D "5"
 LICENSE_PATH +=3D "${LAYERDIR}/custom-licenses"
=20
 LAYERDEPENDS_arm-toolchain =3D "core"
-LAYERSERIES_COMPAT_arm-toolchain =3D "gatesgarth"
+LAYERSERIES_COMPAT_arm-toolchain =3D "gatesgarth hardknott"
=20
 # do not error out on bbappends for missing recipes
 BB_DANGLINGAPPENDS_WARNONLY =3D "true"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 9649738..9116563 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,4 +13,4 @@ LAYERDEPENDS_meta-arm =3D " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm =3D "gatesgarth"
+LAYERSERIES_COMPAT_meta-arm =3D "gatesgarth hardknott"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index e29c940..055d50f 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 =3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 =3D "5"
=20
 LAYERDEPENDS_meta-gem5 =3D "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-gem5 =3D "gatesgarth"
+LAYERSERIES_COMPAT_meta-gem5 =3D "gatesgarth hardknott"
=20
 BBFILES_DYNAMIC +=3D " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/=
*/*/*.bbappend \
--=20
2.25.1

