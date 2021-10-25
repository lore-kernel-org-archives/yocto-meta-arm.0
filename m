Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A37C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 15:42:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.33891.1635176533216481511
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 08:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E64331476
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 08:42:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 921C93F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 08:42:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm/fiptool-native: bumping the version to v2.5
Date: Mon, 25 Oct 2021 16:42:05 +0100
Message-Id: <20211025154207.2061343-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025154207.2061343-1-ross.burton@arm.com>
References: <20211025154207.2061343-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 15:42:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2299

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

The commit provides the v2.5 recipe for fiptool-native
and removes the older versions.

Change-Id: Ie87ca97bc63bfe7ba2337b1bf05d9658921bab83
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../fiptool/fiptool-native_1.5.bb             | 31 -------------------
 ...ol-native_2.3.bb =3D> fiptool-native_2.5.bb} |  9 +++---
 2 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.=
bb
 rename meta-arm/recipes-devtools/fiptool/{fiptool-native_2.3.bb =3D> fip=
tool-native_2.5.bb} (73%)

diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb b/me=
ta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb
deleted file mode 100644
index 925542c8..00000000
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-# Firmware Image Package (FIP)
-# It is a packaging format used by TF-A to package the
-# firmware images in a single binary.
-
-DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
-LICENSE =3D "BSD-3-Clause"
-
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps"
-LIC_FILES_CHKSUM =3D "file://license.rst;md5=3De927e02bca647e14efd87e9e9=
14b2443"
-
-# Use fiptool from TF-A v1.5
-SRCREV =3D "ed8112606c54d85781fc8429160883d6310ece32"
-
-DEPENDS +=3D "openssl-native"
-
-inherit native
-
-S =3D "${WORKDIR}/git"
-
-do_compile () {
-    # These changes are needed to have the fiptool compiling and executi=
ng properly
-    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
-    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
-
-    oe_runmake fiptool
-}
-
-do_install () {
-    install -d ${D}${bindir}/
-    install -m 0755 tools/fiptool/fiptool ${D}${bindir}
-}
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb b/me=
ta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
similarity index 73%
rename from meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
rename to meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
index 25ca111e..2d0f333a 100644
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
@@ -6,10 +6,10 @@ DESCRIPTION =3D "fiptool - Trusted Firmware tool for pa=
ckaging"
 LICENSE =3D "BSD-3-Clause"
=20
 SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;d=
estsuffix=3Dfiptool-${PV};protocol=3Dhttps;"
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa6=
3c46fe93fa89"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D713afe122abbe07f067f=
939ca3c480c5"
=20
-# Use fiptool from TF-A v2.3
-SRCREV =3D "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
+# Use fiptool from TF-A v2.5
+SRCREV =3D "c158878249f1bd930906ebd744b90d3f2a8265f1"
=20
 DEPENDS +=3D "openssl-native"
=20
@@ -24,6 +24,5 @@ do_compile () {
 }
=20
 do_install () {
-    install -d ${D}${bindir}/
-    install -m 0755 tools/fiptool/fiptool ${D}${bindir}
+    install -D -p -m 0755 tools/fiptool/fiptool ${D}${bindir}/fiptool
 }
--=20
2.25.1


