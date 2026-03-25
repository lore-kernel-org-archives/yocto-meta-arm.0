Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52367109C032
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 15:25:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25477.1774452357468099087
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 08:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=iSALtxm4;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2E2C1F02
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 08:25:50 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 95FD23F915
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774452356; bh=F636omO0+P2KuiPa0SvCM1aMK7VHAK5a615hndXftZs=;
	h=From:To:Subject:Date:From;
	b=iSALtxm4dF6QqGRje+9vcmlr/lUCH9n1Z+g0F22Jdi2algf64vhSP+xzPpJd6Ae7u
	 sYKqXKgnyaChLMlsky3DoLw1GbNfkFRw9Dlc8Qi86LQ2gpyOLOel8zVcPvyqi0L0y3
	 MAfMX1T4DAFHLPC4vl/mHmR1DAlQSrHgSGET9EKI=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/fvp-base-a-aem: update to 11.31.28
Date: Wed, 25 Mar 2026 11:25:54 -0400
Message-ID: <20260325152555.84335-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Mar 2026 15:25:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6969

Massive layout changes inside the FVP tarball.  The files are not
located in *_FVP anymore, including the license files, which were in 2
locations in previous releases.  The tarball changed from
Linux64/Linux64_armv8l to Linux_x86/Linux_armv8.  It hchanged extention
from tgz to tar.gz

Also, adding skip of dev-so, due to libstdc++.so and libsystemc.so being
symlinks and fvps being a binary.

NOTE: the license file changes are due to version bumps for sdl, ffmpeg,
libvpx, and python.  The license changes in the managements utilities
was version changes in clang and golang, and removal of wxWidgets,
libstdc++-6.dll, libgcc_s_seh-1.dll, and libwinpthread-1.dll

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...11.29.27.bb =3D> fvp-base-a-aem_11.31.28.bb} | 12 ++++----
 .../recipes-devtools/fvp/fvp-envelope.inc     | 28 +++++++++++++++++--
 2 files changed, 32 insertions(+), 8 deletions(-)
 rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.29.27.bb =3D> fv=
p-base-a-aem_11.31.28.bb} (58%)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
similarity index 58%
rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
index a45fa153a171..1ef4a59cfb74 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.29.27.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
@@ -4,15 +4,17 @@ LICENSE:append =3D " & Artistic-2.0 & BSL-1.0 & BSD-2-C=
lause & Unlicense"
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D92ea58bb219213dfdc48111b693019b6 \
-                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dabcaafefc7b7a0cdf66=
64c51f9075c5b"
+                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D5e3a194978d88188b5a0eebd263f2ca8 \
+                    file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3D4f61d2f0d834d5c29d5=
3d828572fb6fc"
=20
-SRC_URI[fvp-aarch64.sha256sum] =3D "8fce0dc6346c37b0df4809d08b599463c880=
b6375f9b58d89a73fa6f9ab2e129"
-SRC_URI[fvp-x86_64.sha256sum] =3D "8a8c4a609c32890ce96799aa7319fff3ecf75=
2c7a9dab52b2e968cb80cc1836f"
+SRC_URI[fvp-aarch64.sha256sum] =3D "38cfb5244fe898bed5c3ba46ec6e3654638e=
29085ef597b9ed92f36be08adf1d"
+SRC_URI[fvp-x86_64.sha256sum] =3D "527920d1873472de045c844fa6f5b8679511a=
d4f9996058eb9e075b0f0eada10"
=20
 # The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
 UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
-MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
+MODEL_CODE =3D "FVP_Base_RevC_AEMvA"
=20
 COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
+
+INSANE_SKIP:${PN} =3D "dev-so"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc b/meta-arm/re=
cipes-devtools/fvp/fvp-envelope.inc
index a52691ebc505..a6a618edb4ea 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
@@ -2,15 +2,37 @@ require fvp-common.inc
=20
 HOMEPAGE =3D "https://developer.arm.com/Tools%20and%20Software/Fixed%20V=
irtual%20Platforms/Arm%20Architecture%20FVPs"
=20
-SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=
=3D${BP};name=3Dfvp-${HOST_ARCH}"
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tar.gz;sub=
dir=3D${BP};name=3Dfvp-${HOST_ARCH}"
=20
 UPSTREAM_CHECK_URI =3D "${HOMEPAGE}"
-UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+).tgz"
+UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+).tar.gz"
=20
+FVP_ARCH:aarch64 =3D "Linux_armv8"
+FVP_ARCH:x86-64 =3D "Linux_x86"
+
+# This is needed because all of the files are now included in the first
+# dir in the tarball, instead of having the license files split out.
+S =3D "${UNPACKDIR}/${BP}/${MODEL_CODE}_${VERSION}_${BUILD}"
+
+# Keeping this separate from do_install below in case it can be moved
+# out when other FVPs bump to newer versions and this because needed mor=
e commonly
+fvp_link_binaries() {
+    DIR=3D"${D}${FVPDIR}/bin/"
+
+    stat $DIR/FVP_* >/dev/null 2>&1 || bbfatal Cannot find FVP binaries =
in $DIR
+
+    for FVP in $DIR/FVP_*; do
+        ln -rs $FVP ${D}${bindir}/$(basename $FVP)
+    done
+    # But not the .so files too
+    rm -f ${D}${bindir}/*.so
+}
+
+# This is needed because the FVP Base doesn't have an install script lik=
e others
 do_install() {
     mkdir --parents ${D}${FVPDIR} ${D}${bindir}
=20
-    cp --archive --no-preserve=3Downership ${S}/*_pkg/* ${D}${FVPDIR}/
+    cp --archive --no-preserve=3Downership ${S}/* ${D}${FVPDIR}/
=20
     fvp_link_binaries
 }
--=20
2.50.1 (Apple Git-155)


