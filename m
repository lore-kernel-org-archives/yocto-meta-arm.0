Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB21C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 12:50:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20524.1782823828682140158
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 05:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=BTT63nL7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B07D02ED2;
	Tue, 30 Jun 2026 05:50:23 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.29.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 984A03F905;
	Tue, 30 Jun 2026 05:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782823828; bh=xeWM46I/E73LjxLodYhO44u27LqzS++hl305DrCAIOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTT63nL7jJ/IX0aNQ2cc91WsjXL+0T+Pu0C+odx26EnrtHA0i6Ze7YbyDSGMQCa0Z
	 lemKMfH+GvYJz+X5dcJP9aW8KO+i0iu+h2wvKKGM+RCvVWznCh7BgDIy9TbMW9lO8N
	 uK/uZN0bv4+NZKwX/JJts1GR8RtLkzzxQDmZv9uM=
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 3/4] fvp:corstone1000-a320: update Corstone-1000 A320 FVP to 11.31
Date: Tue, 30 Jun 2026 13:50:13 +0100
Message-Id: <20260630125014.312288-4-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630125014.312288-1-harsimransingh.tungal@arm.com>
References: <20260630125014.312288-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2026 12:50:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7108

Update the Corstone-1000 with Cortex-A320 FVP recipe to use the
11.31.cs1000_a320_2 release from Arm Developer.

Switch the source URL to the new package layout, add the architecture-spe=
cific
download tokens, and update the x86_64 and aarch64 SHA256 checksums.

The new package extracts directly into the FVP install directory, so upda=
te the
install step and license paths accordingly.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../fvp/fvp-corstone1000-a320.bb              | 37 ++++++++++++++-----
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb b/met=
a-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
index c266abc4..1c2e4933 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-corstone1000-a320.bb
@@ -2,12 +2,19 @@ require fvp-ecosystem.inc
=20
 MODEL =3D "Corstone-1000-with-Cortex-A320"
 MODEL_CODE =3D "FVP_Corstone_1000-A320"
-PV =3D "11.30.27"
+PV =3D "11.31.cs1000_a320_2"
+FVP_INSTALL_DIR =3D "${MODEL_CODE}_${PV}"
=20
-FVP_AARCH64_SHA256SUM =3D "a45898fead5549779153263c3544fa1032c285d532275=
eb678f58cae3317b01f"
-FVP_X86_64_SHA256SUM =3D "d57b248a1c1bc5a6040605d50af94a5151adc4da26ec9a=
cc456ec86b819ffb76"
+FVP_AARCH64_SHA256SUM =3D "37b67836ff09089c292c1c78fa23d60f8613a95cf4a76=
8b70f5b4f037ad476ef"
+FVP_X86_64_SHA256SUM =3D "f84b973efa6a65c76ae7038a281b592836081fea1920eb=
90fa9ca983f177a1f2"
=20
-SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Co=
rstone-IoT/${MODEL}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP=
};name=3Dfvp-${HOST_ARCH}"
+FVP_ARCH:aarch64 =3D "Linux_armv8"
+FVP_ARCH:x86-64 =3D "Linux_x86"
+
+FVP_URL_TOKEN:aarch64 =3D "st=3D1782487701~exp=3D2097847701~hmac=3Df31b5=
bcea56a5f3ac8cdb3d3bfe7611e5d394987752444c07c82365dc8936338"
+FVP_URL_TOKEN:x86-64 =3D "st=3D1782487742~exp=3D2097847742~hmac=3Db2e12e=
26a2481d2c280e93c671f0b941fe9ebce5125a4c85f7d4bc7467f3e8f5"
+
+SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/FVPs-Corstone-IoT=
/${MODEL}/${MODEL_CODE}_${PV}_${FVP_ARCH}.tar.gz?__token__=3D${FVP_URL_TO=
KEN};subdir=3D${BP};name=3Dfvp-${HOST_ARCH}"
 SRC_URI[fvp-aarch64.sha256sum] =3D "${FVP_AARCH64_SHA256SUM}"
 SRC_URI[fvp-x86_64.sha256sum] =3D "${FVP_X86_64_SHA256SUM}"
=20
@@ -15,14 +22,24 @@ SRC_URI[fvp-x86_64.sha256sum] =3D "${FVP_X86_64_SHA25=
6SUM}"
 UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
 LIC_FILES_CHKSUM =3D "\
-    file://license_terms/license_agreement.txt;md5=3D1a33828e132ba71861c=
11688dbb0bd16 \
-    file://license_terms/third_party_licenses/third_party_licenses.txt;m=
d5=3Da5ce56e117d0ab63791fbb7c35ec2211 \
+    file://${FVP_INSTALL_DIR}/license_terms/license_agreement.txt;md5=3D=
7fde2369510c8bcafaf4cbf42f7aa23a \
+    file://${FVP_INSTALL_DIR}/license_terms/third_party_licenses/third_p=
arty_licenses.txt;md5=3Dda95c9d79488fe4b6115bb7f9900b505 \
 "
=20
-do_install:append() {
-    # This FVP embeds a Python runtime, so clean up RPATHs and remove po=
intless static libraries
-    chrpath --delete ${D}${FVPDIR}/python/lib/python*/lib-dynload/*.so
-    find ${D}${FVPDIR}/python/ -name *.a -delete
+do_install() {
+    mkdir --parents ${D}${FVPDIR}/models/${FVP_ARCH_DIR} ${D}${bindir}
+
+    cp --archive --no-preserve=3Downership ${S}/${FVP_INSTALL_DIR} ${D}$=
{FVPDIR}/models/${FVP_ARCH_DIR}/
+
+    FVP_DIR=3D"${D}${FVPDIR}/models/${FVP_ARCH_DIR}/${FVP_INSTALL_DIR}"
+
+    stat $FVP_DIR/bin/FVP_* >/dev/null 2>&1 || bbfatal Cannot find FVP b=
inaries in $FVP_DIR/bin
+
+    for FVP in $FVP_DIR/bin/FVP_*; do
+        ln -rs "$FVP" "${D}${bindir}/$(basename "$FVP")"
+    done
 }
=20
 COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
+
+INSANE_SKIP:${PN} +=3D "dev-so"

