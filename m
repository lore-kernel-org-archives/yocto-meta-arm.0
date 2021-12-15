Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A01C433FE
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 11:13:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38937.1639566795343501623
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 03:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09350106F
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 03:13:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8D0D3F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 03:13:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/trusted-firmware-m: use Ninja to build
Date: Wed, 15 Dec 2021 11:13:10 +0000
Message-Id: <20211215111311.3066077-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215111311.3066077-1-ross.burton@arm.com>
References: <20211215111311.3066077-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 11:13:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2717

Ninja is a better Make.  Add progress feedback and parallelisation
options, reducing the time to build TF-M on my machine from 100s to 6s.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.5.0.bb          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.5.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.=
0.bb
index 8e795deb..fe3f729c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
@@ -48,6 +48,7 @@ INHIBIT_DEFAULT_DEPS =3D "1"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 DEPENDS +=3D "cmake-native \
+            ninja-native \
             python3-intelhex-native \
             python3-jinja2-native \
             python3-pyyaml-native \
@@ -88,6 +89,8 @@ EXTRA_OECMAKE +=3D "-DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON"
=20
 EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DMCUBOOT_PATH=3D${S}/../mcuboot"
=20
+export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
+
 # Let the Makefile handle setting up the CFLAGS and LDFLAGS as it is a s=
tandalone application
 CFLAGS[unexport] =3D "1"
 LDFLAGS[unexport] =3D "1"
@@ -103,7 +106,7 @@ do_patch[postfuncs] +=3D "apply_local_patches"
=20
 do_configure[cleandirs] =3D "${B}"
 do_configure() {
-    cmake -G"Unix Makefiles" -S ${S} -B ${B} ${EXTRA_OECMAKE} ${PACKAGEC=
ONFIG_CONFARGS}
+    cmake -GNinja -S ${S} -B ${B} ${EXTRA_OECMAKE} ${PACKAGECONFIG_CONFA=
RGS}
 }
=20
 # Invoke install here as there's no point in splitting compile from inst=
all: the
@@ -113,6 +116,7 @@ do_configure() {
 do_compile() {
     cmake --build ${B} -- install
 }
+do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
=20
 do_install() {
     # TODO install headers and static libraries when we know how they're=
 used
--=20
2.25.1


