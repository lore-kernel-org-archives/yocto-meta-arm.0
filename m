Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528D4C5B570
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 17:48:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35392.1786384099365043336
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2026 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fRKBLFCJ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD4811516
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2026 10:48:14 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8BF183F632
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2026 10:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786384098; bh=7ZNzi4gOipLdBWz9pYFfxHWrmdntyF2r+cixIifPHx0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fRKBLFCJJPUER/4AqZuEDV4TqAVbQ3Ht1gS0+r9tfk40w/Zcc4njUoJfD3J8LNhUQ
	 BTqUEEXicfjepJeaiOAylWXbgJk+UR4kYy9CWsdRTUQWKSpQGu+DEOecV2DS5bJi1y
	 z6ZNU7Y4UHGv6DvZpgwhgHEWi40h36+36drILAWU=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/fvps: remove unused files
Date: Mon, 10 Aug 2026 13:48:16 -0400
Message-ID: <20260810174817.89440-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260810174817.89440-1-jon.mason@arm.com>
References: <20260810174817.89440-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Aug 2026 17:48:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7138

fvp-envelope is no longer used and fvp-rdv1 and fvp-sgi575 no longer
have anything referencing them.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-devtools/fvp/fvp-envelope.inc     | 38 -------------------
 meta-arm/recipes-devtools/fvp/fvp-rdv1.bb     | 14 -------
 meta-arm/recipes-devtools/fvp/fvp-sgi575.bb   | 13 -------
 3 files changed, 65 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-envelope.inc
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-rdv1.bb
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-sgi575.bb

diff --git a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc b/meta-arm/re=
cipes-devtools/fvp/fvp-envelope.inc
deleted file mode 100644
index a6a618edb4ea..000000000000
--- a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
+++ /dev/null
@@ -1,38 +0,0 @@
-require fvp-common.inc
-
-HOMEPAGE =3D "https://developer.arm.com/Tools%20and%20Software/Fixed%20V=
irtual%20Platforms/Arm%20Architecture%20FVPs"
-
-SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tar.gz;sub=
dir=3D${BP};name=3Dfvp-${HOST_ARCH}"
-
-UPSTREAM_CHECK_URI =3D "${HOMEPAGE}"
-UPSTREAM_CHECK_REGEX =3D "${MODEL_CODE}_(?P<pver>(\d+[\.\-_]*)+).tar.gz"
-
-FVP_ARCH:aarch64 =3D "Linux_armv8"
-FVP_ARCH:x86-64 =3D "Linux_x86"
-
-# This is needed because all of the files are now included in the first
-# dir in the tarball, instead of having the license files split out.
-S =3D "${UNPACKDIR}/${BP}/${MODEL_CODE}_${VERSION}_${BUILD}"
-
-# Keeping this separate from do_install below in case it can be moved
-# out when other FVPs bump to newer versions and this because needed mor=
e commonly
-fvp_link_binaries() {
-    DIR=3D"${D}${FVPDIR}/bin/"
-
-    stat $DIR/FVP_* >/dev/null 2>&1 || bbfatal Cannot find FVP binaries =
in $DIR
-
-    for FVP in $DIR/FVP_*; do
-        ln -rs $FVP ${D}${bindir}/$(basename $FVP)
-    done
-    # But not the .so files too
-    rm -f ${D}${bindir}/*.so
-}
-
-# This is needed because the FVP Base doesn't have an install script lik=
e others
-do_install() {
-    mkdir --parents ${D}${FVPDIR} ${D}${bindir}
-
-    cp --archive --no-preserve=3Downership ${S}/* ${D}${FVPDIR}/
-
-    fvp_link_binaries
-}
diff --git a/meta-arm/recipes-devtools/fvp/fvp-rdv1.bb b/meta-arm/recipes=
-devtools/fvp/fvp-rdv1.bb
deleted file mode 100644
index 23804bf3fef4..000000000000
--- a/meta-arm/recipes-devtools/fvp/fvp-rdv1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require fvp-ecosystem.inc
-
-MODEL =3D "RD-V1"
-MODEL_CODE =3D "FVP_RD_V1"
-PV =3D "11.17.29"
-
-SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ne=
overse-Infrastructure/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;su=
bdir=3D${BP};name=3Dfvp-${HOST_ARCH}"
-SRC_URI[fvp-x86_64.sha256sum] =3D "715c0e0264fc3df961a0b9ff4c4399d55e4cc=
f4efb0944a412141d97873027a3"
-
-# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
-UPSTREAM_VERSION_UNKNOWN =3D "1"
-
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
41029e71051b1c786bae3112a29905a7"
diff --git a/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb b/meta-arm/recip=
es-devtools/fvp/fvp-sgi575.bb
deleted file mode 100644
index 99a9940c37de..000000000000
--- a/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require fvp-ecosystem.inc
-
-MODEL =3D "SGI-575"
-MODEL_CODE =3D "FVP_CSS_SGI-575"
-PV =3D "11.15.26"
-
-SRC_URI[sha256sum] =3D "d07241112f6c146362deec789e782e10e83bc3560cf605cc=
d055a606d0b44e74"
-
-# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
-UPSTREAM_VERSION_UNKNOWN =3D "1"
-
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
3db0c4947b7e3405c40b943672d8de2f"
--=20
2.50.1 (Apple Git-155)


