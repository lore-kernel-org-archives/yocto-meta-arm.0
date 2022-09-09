Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A47ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 20:05:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.572.1662753896698768294
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Sep 2022 13:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB9C040D47;
	Fri,  9 Sep 2022 20:04:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uU7ejLKYO6Qa; Fri,  9 Sep 2022 20:04:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BC59940D44;
	Fri,  9 Sep 2022 20:04:54 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 626831749C8;
	Fri,  9 Sep 2022 16:04:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] arm-toolchain/gcc,external-arm-toolchain: resolve conflict
 with gcc headers
Date: Fri,  9 Sep 2022 20:04:36 +0000
Message-Id: <20220909200436.1728775-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 20:05:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3760

From: Denys Dmytriyenko <denys@konsulko.com>

Historically external-arm-toolchain recipe packaged all gcc headers from
${libdir}/gcc/${TARGET_SYS}/${BINV}/include - some would be picked up by
packages like gcc-sanitizers, libssp-dev. libquadmath-dev or libgomp-dev.
The rest would fall into catch-all libgcc-dev package.

Unfortunately, that could result in a conflict with a target gcc, which
also packages some of those files, like unwind.h or stddef.h, among other=
s.

The conflict could be seen with this config:

EXTRA_IMAGE_FEATURES +=3D "dev-pkgs tools-sdk"
TCMODE =3D "external-arm"
EXTERNAL_TOOLCHAIN =3D "/OE/toolchains/gcc-arm-11.2-2022.02-x86_64-aarch6=
4-none-linux-gnu"

And the error message is:

Error: Transaction test error:
  file /usr/lib/gcc/aarch64-poky-linux/11.2.1/include/stddef.h conflicts =
between attempted installs of libgcc-s-dev-11.2.1-r0.1.cortexa57 and gcc-=
arm+11.2-r2022.02.1.cortexa57
  file /usr/lib/gcc/aarch64-poky-linux/11.2.1/include/unwind.h conflicts =
between attempted installs of libgcc-s-dev-11.2.1-r0.1.cortexa57 and gcc-=
arm+11.2-r2022.02.1.cortexa57


Modify external-arm-toolchain recipe according to how libgcc in OE-Core
handles those header files by removing and not packaging them:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/gcc/libgcc-common.inc#n40

Also need to adjust gcc recipe to pick up unwind.h from EXTERNAL_TOOLCHAI=
N
location now, since libgcc-dev no longer carries it, and install it into
STAGING_LIBDIR_NATIVE, where OE-Core gcc-target.inc expects it from
gcc-cross:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/gcc/gcc-target.inc#n164

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb     | 9 ++++++---
 .../recipes-devtools/gcc/gcc-arm-common.inc              | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
index dcc8ebf..fab1761 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
@@ -75,7 +75,7 @@ do_install() {
 	install -d ${D}${includedir}
 	install -d ${D}/include
 	install -d ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}
-	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}
+	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include
=20
 	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  =
${D}${base_libdir}
@@ -104,7 +104,11 @@ do_install() {
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/crt*.o ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcc* ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcov* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include/ssp ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include =
|| true
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include/sanitizers ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/i=
nclude || true
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include/quadmath* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/in=
clude || true
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include/omp.h ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/includ=
e || true
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include/openacc.h ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/in=
clude || true
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/finclude ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
=20
 	# fix up the copied symlinks (they are still pointing to the multiarch =
directory)
@@ -495,7 +499,6 @@ FILES:libgcc-dev =3D "\
     ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${li=
bdir}/${BASETARGET_SYS}', d)} \
     ${libdir}/${TARGET_SYS}/${BINV}* \
     ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include \
 "
=20
 FILES:linux-libc-headers =3D ""
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b=
/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
index d7cc4e7..fa23e84 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
@@ -12,7 +12,7 @@
 do_install:prepend:class-target () {
 	if [ "${TCMODE}" =3D "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${=
TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
 		install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${=
BINV}/include/
-		install ${STAGING_LIBDIR}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/unw=
ind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/in=
clude/
+		install ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}=
/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS=
}/${BINV}/include/
 	fi
 }
=20
--=20
2.25.1


