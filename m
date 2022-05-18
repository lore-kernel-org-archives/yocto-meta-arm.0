Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CE1C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 11:07:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3613.1652872051083180704
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 04:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B87291042;
	Wed, 18 May 2022 04:07:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 102DD3F718;
	Wed, 18 May 2022 04:07:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] Revert "arm-toolchain/external-arm-toolchain: add back
 10.3"
Date: Wed, 18 May 2022 12:07:26 +0100
Message-Id: <20220518110727.3460305-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518110727.3460305-1-ross.burton@arm.com>
References: <20220518110727.3460305-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 11:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3426

This reverts commit 5fec85b41d7263dcc8aa15351beb7c19e2017849.
---
 .../external-arm-toolchain_10.3-2021.07.bb    | 680 ------------------
 1 file changed, 680 deletions(-)
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/external-arm-toolchain_10.3-2021.07.bb

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain_10.3-2021.07.bb b/meta-arm-toolchain/recipes-devtoo=
ls/external-arm-toolchain/external-arm-toolchain_10.3-2021.07.bb
deleted file mode 100644
index c0b5e6d5..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain_10.3-2021.07.bb
+++ /dev/null
@@ -1,680 +0,0 @@
-require recipes-core/glibc/glibc-package.inc
-
-require license.inc
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-LIC_FILES_CHKSUM =3D "\
-	file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302=
 \
-	file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20=
420 \
-"
-
-PROVIDES +=3D "\
-	linux-libc-headers \
-	virtual/${TARGET_PREFIX}gcc \
-	virtual/${TARGET_PREFIX}g++ \
-	virtual/${TARGET_PREFIX}gcc-initial \
-	virtual/${TARGET_PREFIX}binutils \
-	virtual/${TARGET_PREFIX}libc-for-gcc \
-	virtual/${TARGET_PREFIX}compilerlibs \
-	virtual/libc \
-	virtual/libintl \
-	virtual/libiconv \
-	virtual/crypt \
-	glibc-mtrace \
-	glibc-thread-db \
-	glibc \
-	libc-mtrace \
-	gcc-runtime \
-	libgcc \
-	libg2c \
-	libg2c-dev \
-	libssp \
-	libssp-dev \
-	libssp-staticdev \
-	libgfortran \
-	libgfortran-dev \
-	libgfortran-staticdev \
-	libmudflap \
-	libmudflap-dev \
-	libgomp \
-	libgomp-dev \
-	libgomp-staticdev \
-	libitm \
-	libitm-dev \
-	libitm-staticdev \
-	libquadmath \
-	libquadmath-dev \
-	libquadmath-staticdev \
-	virtual/linux-libc-headers \
-	libgcov-staticdev \
-	virtual/libc-locale \
-"
-
-PKGV =3D "${EAT_VER_MAIN}"
-
-BINV =3D "${EAT_VER_GCC}"
-
-SRC_URI =3D "file://SUPPORTED"
-
-do_install() {
-	# Add stubs for files OE-core expects
-	install -d ${S}/nscd/
-	touch  ${S}/nscd/nscd.init
-	touch  ${S}/nscd/nscd.conf
-	touch  ${S}/nscd/nscd.service
-	touch  ${S}/../makedbs.sh
-
-	install -d ${D}${base_libdir}
-	install -d ${D}${base_sbindir}
-	install -d ${D}${bindir}
-	install -d ${D}${sbindir}
-	install -d ${D}${libdir}
-	install -d ${D}${libexecdir}
-	install -d ${D}${datadir}
-	install -d ${D}${includedir}
-	install -d ${D}/include
-	install -d ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}
-	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}
-
-	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  =
${D}${base_libdir}
-	if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/${EA=
T_TARGET_SYS} ]; then
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDI=
R}/${EAT_TARGET_SYS}/*  ${D}${base_libdir}
-	else
-		if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/ld-=
${EAT_VER_LIBC}.so ]; then
-			cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBD=
IR}/*  ${D}${base_libdir}
-		else
-			cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_=
LIBDIR}/*.so*  ${D}${base_libdir}
-		fi
-	fi
-	if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/=
${EAT_TARGET_SYS} ]; then
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_L=
IBDIR}/${EAT_TARGET_SYS}/*  ${D}${libdir}
-	else
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_L=
IBDIR}/*  ${D}${libdir}
-		if [ ! -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/l=
d-${EAT_VER_LIBC}.so ]; then
-			rm -rf ${D}${libdir}/*.so*
-		fi
-	fi
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/share/* =
 ${D}${datadir}
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/=
*  ${D}${includedir}
-	if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/${EAT_=
TARGET_SYS} ]; then
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include=
/${EAT_TARGET_SYS}/*  ${D}${includedir}
-		rm -r ${D}${includedir}/${EAT_TARGET_SYS}
-	fi
-
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${i=
ncludedir}
-	if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
-		mv ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ${D}${includ=
edir}/c++/${EAT_VER_GCC}/${TARGET_SYS}
-	fi
-	ln -sf ../usr/include/c++ ${D}/include/c++
-
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/bin/* ${=
D}${bindir}
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/sbin/* $=
{D}${sbindir}
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/sbin/* ${D}$=
{base_sbindir}
-	rm -rf ${D}${bindir}/gdbserver
-	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/tzsel=
ect
-	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/ldd
-	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
-	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/ldd
-	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
-	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
-
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/crt*.o ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcc* ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcov* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/finclude ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
-
-	# fix up the copied symlinks (they are still pointing to the multiarch =
directory)
-	linker_name=3D"${@bb.utils.contains("TUNE_FEATURES", "aarch64", "ld-lin=
ux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-hard=
", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
-	ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
-	ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
-	ln -sf ../../lib/libcrypt.so.1 ${D}${libdir}/libcrypt.so
-	ln -sf ../../lib/libresolv.so.2 ${D}${libdir}/libresolv.so
-	ln -sf ../../lib/libnss_hesiod.so.2 ${D}${libdir}/libnss_hesiod.so
-	ln -sf ../../lib/libutil.so.1 ${D}${libdir}/libutil.so
-	ln -sf ../../lib/libBrokenLocale.so.1 ${D}${libdir}/libBrokenLocale.so
-	ln -sf ../../lib/libpthread.so.0 ${D}${libdir}/libpthread.so
-	ln -sf ../../lib/libthread_db.so.1 ${D}${libdir}/libthread_db.so
-	ln -sf ../../lib/libanl.so.1 ${D}${libdir}/libanl.so
-	ln -sf ../../lib/libdl.so.2 ${D}${libdir}/libdl.so
-	ln -sf ../../lib/libnss_db.so.2 ${D}${libdir}/libnss_db.so
-	ln -sf ../../lib/libnss_dns.so.2 ${D}${libdir}/libnss_dns.so
-	ln -sf ../../lib/libnss_files.so.2 ${D}${libdir}/libnss_files.so
-	ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
-	ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
-
-	# remove potential .so duplicates from base_libdir
-	# for all symlinks created above in libdir
-	rm -f ${D}${base_libdir}/librt.so
-	rm -f ${D}${base_libdir}/libcrypt.so
-	rm -f ${D}${base_libdir}/libresolv.so
-	rm -f ${D}${base_libdir}/libnss_hesiod.so
-	rm -f ${D}${base_libdir}/libutil.so
-	rm -f ${D}${base_libdir}/libBrokenLocale.so
-	rm -f ${D}${base_libdir}/libpthread.so
-	rm -f ${D}${base_libdir}/libthread_db.so
-	rm -f ${D}${base_libdir}/libanl.so
-	rm -f ${D}${base_libdir}/libdl.so
-	rm -f ${D}${base_libdir}/libnss_db.so
-	rm -f ${D}${base_libdir}/libnss_dns.so
-	rm -f ${D}${base_libdir}/libnss_files.so
-	rm -f ${D}${base_libdir}/libnss_compat.so
-	rm -f ${D}${base_libdir}/libm.so
-
-	# Move these completely to ${libdir} and delete duplicates in ${base_li=
bdir}
-	for lib in asan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubs=
an; do
-		if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
-			mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdir}
-		fi
-		if [ -e ${D}${base_libdir}/lib${lib}.a ] ; then
-			mv ${D}${base_libdir}/lib${lib}.a ${D}${libdir}
-		fi
-		rm -f ${D}${base_libdir}/lib${lib}*
-	done
-
-	# Clean up duplicate libs that are both in base_libdir and libdir
-	rm -f ${D}${libdir}/libgcc*
-
-	# Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates like li=
b*-${EAT_VER_LIBC}.so
-	# Only remove them if both are regular files and are identical
-	for i in ${D}${base_libdir}/lib*-${EAT_VER_LIBC}.so; do
-		f=3D$(echo $i | sed 's/-${EAT_VER_LIBC}//')
-		l=3D$(ls $f.*)
-		if [ $(readlink -f $i ) =3D $l ]; then
-			echo "$i is a symlink of $l, keep it"
-		elif [ $(readlink -f $l ) =3D $i ]; then
-			echo "$l is a symlink of $i, keep it"
-		else
-			cmp -s $i $l
-			if [ $? -eq 0 ]; then
-				echo "$i is a duplicate of $l, remove it"
-				rm $i
-			else
-				echo "$i and $l are different files, keep them both"
-			fi
-		fi
-	done
-
-	if [ -d ${D}${base_libdir}/arm-linux-gnueabi ]; then
-	   rm -rf ${D}${base_libdir}/arm-linux-gnueabi
-	fi
-
-	if [ -d ${D}${base_libdir}/ldscripts ]; then
-	   rm -rf ${D}${base_libdir}/ldscripts
-	fi
-
-	# Provided by libnsl2
-	rm -rf ${D}${includedir}/rpcsvc/yppasswd.*
-	# Provided by quota
-	rm -rf ${D}${includedir}/rpcsvc/rquota.*
-
-	if [ -f ${D}${libdir}/libc.so ];then
-		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g"=
 -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT=
_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld=
-linux#g" ${D}${libdir}/libc.so
-		sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${libdir=
}/libc.so
-		sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/l=
ibc.so
-	fi
-
-	if [ -f ${D}${base_libdir}/libc.so ];then
-		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib#g" -e "s# /u=
sr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" "s# /${EAT_LIBDIR}/# /lib/#g" ${=
D}${base_libdir}/libc.so
-		if [ -f ${D}${base_libdir}/libc.so.6 ]; then
-			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" "s# /${=
EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
-		fi
-	fi
-
-	# Remove if empty
-	rmdir ${D}${bindir} || true
-	rmdir ${D}${sbindir} || true
-	rmdir ${D}${base_sbindir} || true
-	rmdir ${D}${libexecdir} || true
-
-	# Remove unused /usr/share/info/dir
-	rm -f ${D}${infodir}/dir
-}
-
-# External toolchain doesn't provide multilib support so make correspond=
ing
-# install API as an empty API to avoid an unnecessary errors.
-oe_multilib_header () {
-	return
-}
-
-PACKAGES_DYNAMIC =3D "^locale-base-.* \
-                    ^glibc-gconv-.* ^glibc-charmap-.* ^glibc-localedata-=
.* ^glibc-binary-localedata-.* \
-                    ^${MLPREFIX}glibc-gconv$"
-
-# PACKAGES is split up according to the 'source' recipes/includes in OE-=
core
-# Stylistic differences are kept to make copy/pasting easier.
-
-# From gcc-runtime.inc
-
-PACKAGES +=3D "\
-    gcc-runtime-dbg \
-    libstdc++ \
-    libstdc++-precompile-dev \
-    libstdc++-dev \
-    libstdc++-staticdev \
-    libg2c \
-    libg2c-dev \
-    libssp \
-    libssp-dev \
-    libssp-staticdev \
-    libmudflap \
-    libmudflap-dev \
-    libmudflap-staticdev \
-    libquadmath \
-    libquadmath-dev \
-    libquadmath-staticdev \
-    libgomp \
-    libgomp-dev \
-    libgomp-staticdev \
-    libatomic \
-    libatomic-dev \
-    libatomic-staticdev \
-    libitm \
-    libitm-dev \
-    libitm-staticdev \
-"
-
-# From gcc-sanitizers.inc
-
-PACKAGES +=3D "gcc-sanitizers gcc-sanitizers-dbg"
-PACKAGES +=3D "libasan libubsan liblsan libtsan"
-PACKAGES +=3D "libasan-dev libubsan-dev liblsan-dev libtsan-dev"
-PACKAGES +=3D "libasan-staticdev libubsan-staticdev liblsan-staticdev li=
btsan-staticdev"
-
-# From libgfortran.inc:
-
-PACKAGES +=3D "\
-    libgfortran-dbg \
-    libgfortran \
-    libgfortran-dev \
-    libgfortran-staticdev \
-"
-
-# libgcc.inc uses ${PN}, so replace that
-
-PACKAGES +=3D "\
-    libgcc \
-    libgcc-dev \
-    libgcc-dbg \
-"
-
-# ... and the leftovers
-
-PACKAGES =3D+ "\
-        ${PN}-mtrace \
-	libgcov-staticdev \
-	linux-libc-headers \
-	linux-libc-headers-dev \
-"
-
-# Re-order PACKAGES list in order to shift ${PN}-dev towards the end as
-# it is meant to pick up remaining dev libraries and headers that aren't
-# picked up by other packages. And since some static libraries needs to
-# be packaged in ${PN}-dev, so we need to keep ${PN}-staticdev later in
-# order.
-
-PACKAGES :=3D "${@oe.utils.str_filter_out('${PN}-dev', '${PACKAGES}', d)=
}"
-PACKAGES :=3D "${@oe.utils.str_filter_out('${PN}-staticdev', '${PACKAGES=
}', d)}"
-PACKAGES +=3D "\
-	${PN}-dev \
-	${PN}-staticdev \
-"
-
-INSANE_SKIP:${PN}-dbg =3D "staticdev"
-INSANE_SKIP:${PN}-utils +=3D "ldflags"
-INSANE_SKIP:libstdc++ +=3D "ldflags"
-INSANE_SKIP:libgfortran +=3D "ldflags"
-INSANE_SKIP:libgcc +=3D "ldflags dev-deps"
-INSANE_SKIP:libgcc-dev +=3D "staticdev"
-INSANE_SKIP:libgfortran +=3D "ldflags dev-deps"
-INSANE_SKIP:libstdc++ +=3D "ldflags dev-deps"
-INSANE_SKIP:libatomic +=3D "ldflags"
-INSANE_SKIP:libasan +=3D "ldflags"
-INSANE_SKIP:libubsan +=3D "ldflags"
-INSANE_SKIP:libssp +=3D "ldflags"
-INSANE_SKIP:libgomp +=3D "ldflags"
-INSANE_SKIP:libitm +=3D "ldflags"
-INSANE_SKIP:gdbserver +=3D "ldflags"
-
-# OE-core has literally listed 'glibc' in LIBC_DEPENDENCIES :/
-RPROVIDES:${PN} =3D "glibc rtld(GNU_HASH)"
-# Add runtime provides for the other libc* packages as well
-RPROVIDES:${PN}-dev =3D "glibc-dev"
-RPROVIDES:${PN}-doc =3D "glibc-doc"
-RPROVIDES:${PN}-dbg =3D "glibc-dbg"
-RPROVIDES:${PN}-pic =3D "glibc-pic"
-RPROVIDES:${PN}-utils =3D "glibc-utils"
-RPROVIDES:${PN}-mtrace =3D "glibc-mtrace libc-mtrace"
-
-PKG:${PN} =3D "glibc"
-PKG:${PN}-dev =3D "glibc-dev"
-PKG:${PN}-doc =3D "glibc-doc"
-PKG:${PN}-dbg =3D "glibc-dbg"
-PKG:${PN}-pic =3D "glibc-pic"
-PKG:${PN}-utils =3D "glibc-utils"
-PKG:${PN}-mtrace =3D "glibc-mtrace"
-PKG:${PN}-gconv =3D "glibc-gconv"
-PKG:${PN}-extra-nss =3D "glibc-extra-nss"
-PKG:${PN}-thread-db =3D "glibc-thread-db"
-PKG:${PN}-pcprofile =3D "glibc-pcprofile"
-PKG:${PN}-staticdev =3D "glibc-staticdev"
-
-PKGV =3D "${EAT_VER_LIBC}"
-PKGV:${PN} =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-dev =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-doc =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-dbg =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-pic =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-utils =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-mtrace =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-gconv =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-extra-nss =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-thread-db =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-pcprofile =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-staticdev =3D "${EAT_VER_LIBC}"
-PKGV:catchsegv =3D "${EAT_VER_LIBC}"
-PKGV:glibc-extra-nss =3D "${EAT_VER_LIBC}"
-PKGV:glibc-thread-db =3D "${EAT_VER_LIBC}"
-
-PKGV:libmemusage =3D "${EAT_VER_LIBC}"
-PKGV:libsegfault =3D "${EAT_VER_LIBC}"
-PKGV:libsotruss =3D "${EAT_VER_LIBC}"
-PKGV:sln =3D "${EAT_VER_LIBC}"
-PKGV:nscd =3D "${EAT_VER_LIBC}"
-PKGV:ldd =3D "${EAT_VER_LIBC}"
-
-PKGV:libasan-dev =3D "${EAT_VER_GCC}"
-PKGV:libasan =3D "${EAT_VER_GCC}"
-PKGV:libasan-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libatomic-dev =3D "${EAT_VER_GCC}"
-PKGV:libatomic =3D "${EAT_VER_GCC}"
-PKGV:libatomic-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libg2c-dev =3D "${EAT_VER_GCC}"
-PKGV:libg2c =3D "${EAT_VER_GCC}"
-PKGV:libgcc-dev =3D "${EAT_VER_GCC}"
-PKGV:libgcc =3D "${EAT_VER_GCC}"
-PKGV:libgfortran-dbg =3D "${EAT_VER_GCC}"
-PKGV:libgfortran-dev =3D "${EAT_VER_GCC}"
-PKGV:libgfortran =3D "${EAT_VER_GCC}"
-PKGV:libgfortran-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libgomp-dev =3D "${EAT_VER_GCC}"
-PKGV:libgomp =3D "${EAT_VER_GCC}"
-PKGV:libgomp-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libitm-dev =3D "${EAT_VER_GCC}"
-PKGV:libitm =3D "${EAT_VER_GCC}"
-PKGV:libitm-staticdev =3D "${EAT_VER_GCC}"
-PKGV:liblsan-dev =3D "${EAT_VER_GCC}"
-PKGV:liblsan =3D "${EAT_VER_GCC}"
-PKGV:liblsan-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libmudflap-dev =3D "${EAT_VER_GCC}"
-PKGV:libmudflap =3D "${EAT_VER_GCC}"
-PKGV:libmudflap-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libquadmath-dev =3D "${EAT_VER_GCC}"
-PKGV:libquadmath =3D "${EAT_VER_GCC}"
-PKGV:libquadmath-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libssp-dev =3D "${EAT_VER_GCC}"
-PKGV:libssp =3D "${EAT_VER_GCC}"
-PKGV:libssp-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libstdc++-dbg =3D "${EAT_VER_GCC}"
-PKGV:libstdc++-dev =3D "${EAT_VER_GCC}"
-PKGV:libstdc++ =3D "${EAT_VER_GCC}"
-PKGV:libstdc++-precompile-dev =3D "${EAT_VER_GCC}"
-PKGV:libstdc++-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libtsan-dev =3D "${EAT_VER_GCC}"
-PKGV:libtsan =3D "${EAT_VER_GCC}"
-PKGV:libtsan-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libubsan-dev =3D "${EAT_VER_GCC}"
-PKGV:libubsan =3D "${EAT_VER_GCC}"
-PKGV:libubsan-staticdev =3D "${EAT_VER_GCC}"
-
-PKGV:linux-libc-headers-dev =3D "${EAT_VER_KERNEL}"
-PKGV:linux-libc-headers =3D "${EAT_VER_KERNEL}"
-
-PKGV:gdbserver =3D "${EAT_VER_GDBSERVER}"
-
-ALLOW_EMPTY:${PN}-mtrace =3D "1"
-FILES:${PN}-mtrace =3D "${bindir}/mtrace"
-
-FILES:libgcov-staticdev =3D "${libdir}/gcc/${TARGET_SYS}/${BINV}/libgcov=
.a"
-
-FILES:libsegfault =3D "${base_libdir}/libSegFault*"
-
-FILES:catchsegv =3D "${bindir}/catchsegv"
-RDEPENDS:catchsegv =3D "libsegfault"
-
-# From libgfortran.inc:
-
-FILES:libgfortran =3D "${libdir}/libgfortran.so.*"
-FILES:libgfortran-dev =3D "\
-    ${libdir}/libgfortran*.so \
-    ${libdir}/libgfortran.spec \
-    ${libdir}/libgfortran.la \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \
-"
-FILES:libgfortran-staticdev =3D "${libdir}/libgfortran.a"
-
-
-# From gcc-sanitizers.inc:
-
-FILES:libasan +=3D "${libdir}/libasan.so.*"
-FILES:libasan-dev +=3D "\
-    ${libdir}/libasan_preinit.o \
-    ${libdir}/libasan.so \
-    ${libdir}/libasan.la \
-"
-FILES:libasan-staticdev +=3D "${libdir}/libasan.a"
-
-FILES:libubsan +=3D "${libdir}/libubsan.so.*"
-FILES:libubsan-dev +=3D "\
-    ${libdir}/libubsan.so \
-    ${libdir}/libubsan.la \
-"
-FILES:libubsan-staticdev +=3D "${libdir}/libubsan.a"
-
-FILES:liblsan +=3D "${libdir}/liblsan.so.*"
-FILES:liblsan-dev +=3D "\
-    ${libdir}/liblsan.so \
-    ${libdir}/liblsan.la \
-    ${libdir}/liblsan_preinit.o \
-"
-FILES:liblsan-staticdev +=3D "${libdir}/liblsan.a"
-
-FILES:libtsan +=3D "${libdir}/libtsan.so.*"
-FILES:libtsan-dev +=3D "\
-    ${libdir}/libtsan.so \
-    ${libdir}/libtsan.la \
-    ${libdir}/libtsan_*.o \
-"
-FILES:libtsan-staticdev +=3D "${libdir}/libtsan.a"
-
-FILES:gcc-sanitizers =3D "${libdir}/*.spec ${libdir}/gcc/${TARGET_SYS}/$=
{BINV}/include/sanitizer/*.h"
-
-# From libgcc.inc:
-
-FILES:libgcc =3D "${base_libdir}/libgcc_s.so.1"
-
-FILES:libgcc-dev =3D "\
-    ${base_libdir}/libgcc*.so \
-    ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${li=
bdir}/${BASETARGET_SYS}', d)} \
-    ${libdir}/${TARGET_SYS}/${BINV}* \
-    ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include \
-"
-
-FILES:linux-libc-headers =3D ""
-FILES:linux-libc-headers-dev =3D "\
-	${includedir}/asm* \
-	${includedir}/linux \
-	${includedir}/mtd \
-	${includedir}/rdma \
-	${includedir}/scsi \
-	${includedir}/sound \
-	${includedir}/video \
-"
-FILES:${PN} +=3D "\
-	${libdir}/bin \
-	${libdir}/locale \
-	${libdir}/gconv/gconv-modules \
-	${datadir}/zoneinfo \
-	${base_libdir}/libcrypt*.so.* \
-	${base_libdir}/libcrypt-*.so \
-	${base_libdir}/libc.so.* \
-	${base_libdir}/libc-*.so \
-	${base_libdir}/libm.so.* \
-	${base_libdir}/libmemusage.so \
-	${base_libdir}/libm-*.so \
-	${base_libdir}/ld*.so.* \
-	${base_libdir}/ld-*.so \
-	${base_libdir}/libpthread*.so.* \
-	${base_libdir}/libpthread*.so \
-	${base_libdir}/libpthread-*.so \
-	${base_libdir}/libresolv*.so.* \
-	${base_libdir}/libresolv-*.so \
-	${base_libdir}/librt*.so.* \
-	${base_libdir}/librt-*.so \
-	${base_libdir}/libutil*.so.* \
-	${base_libdir}/libutil-*.so \
-	${base_libdir}/libnss_files*.so.* \
-	${base_libdir}/libnss_files-*.so \
-	${base_libdir}/libnss_compat*.so.* \
-	${base_libdir}/libnss_compat-*.so \
-	${base_libdir}/libnss_dns*.so.* \
-	${base_libdir}/libnss_dns-*.so \
-	${base_libdir}/libnss_nis*.so.* \
-	${base_libdir}/libnss_nisplus-*.so \
-	${base_libdir}/libnss_nisplus*.so.* \
-	${base_libdir}/libnss_nis-*.so \
-	${base_libdir}/libnss_hesiod*.so.* \
-	${base_libdir}/libnss_hesiod-*.so \
-	${base_libdir}/libdl*.so.* \
-	${base_libdir}/libdl-*.so \
-	${base_libdir}/libanl*.so.* \
-	${base_libdir}/libanl-*.so \
-	${base_libdir}/libBrokenLocale*.so.* \
-	${base_libdir}/libBrokenLocale-*.so \
-	${base_libdir}/libthread_db*.so.* \
-	${base_libdir}/libthread_db-*.so \
-	${base_libdir}/libmemusage.so \
-	${base_libdir}/libSegFault.so \
-	${base_libdir}/libpcprofile.so \
-    "
-
-FILES:${PN}-dbg +=3D "${base_libdir}/debug"
-
-# From gcc-runtime.inc
-
-# include python debugging scripts
-FILES:gcc-runtime-dbg +=3D "\
-    ${libdir}/libstdc++.so.*-gdb.py \
-    ${datadir}/gcc-${BINV}/python/libstdcxx \
-"
-
-FILES:libg2c =3D "${target_libdir}/libg2c.so.*"
-SUMMARY:libg2c =3D "Companion runtime library for g77"
-FILES:libg2c-dev =3D "\
-    ${libdir}/libg2c.so \
-    ${libdir}/libg2c.a \
-    ${libdir}/libfrtbegin.a \
-"
-SUMMARY:libg2c-dev =3D "Companion runtime library for g77 - development =
files"
-
-FILES:libstdc++ =3D "${libdir}/libstdc++.so.*"
-SUMMARY:libstdc++ =3D "GNU standard C++ library"
-FILES:libstdc++-dev =3D "\
-    /include/c++ \
-    ${includedir}/c++/ \
-    ${libdir}/libstdc++.so \
-    ${libdir}/libstdc++*.la \
-    ${libdir}/libsupc++.la \
-"
-SUMMARY:libstdc++-dev =3D "GNU standard C++ library - development files"
-
-FILES:libstdc++-staticdev =3D "\
-    ${libdir}/libstdc++*.a \
-    ${libdir}/libsupc++.a \
-"
-SUMMARY:libstdc++-staticdev =3D "GNU standard C++ library - static devel=
opment files"
-
-FILES:libstdc++-precompile-dev =3D "${includedir}/c++/${TARGET_SYS}/bits=
/*.gch"
-SUMMARY:libstdc++-precompile-dev =3D "GNU standard C++ library - precomp=
iled header files"
-
-FILES:libssp =3D "${libdir}/libssp.so.*"
-SUMMARY:libssp =3D "GNU stack smashing protection library"
-FILES:libssp-dev =3D "\
-    ${libdir}/libssp*.so \
-    ${libdir}/libssp*_nonshared.a \
-    ${libdir}/libssp*.la \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
-"
-SUMMARY:libssp-dev =3D "GNU stack smashing protection library - developm=
ent files"
-FILES:libssp-staticdev =3D "${libdir}/libssp*.a"
-SUMMARY:libssp-staticdev =3D "GNU stack smashing protection library - st=
atic development files"
-
-FILES:libquadmath =3D "${libdir}/libquadmath*.so.*"
-SUMMARY:libquadmath =3D "GNU quad-precision math library"
-FILES:libquadmath-dev =3D "\
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
-    ${libdir}/libquadmath*.so \
-    ${libdir}/libquadmath.la \
-"
-SUMMARY:libquadmath-dev =3D "GNU quad-precision math library - developme=
nt files"
-FILES:libquadmath-staticdev =3D "${libdir}/libquadmath.a"
-SUMMARY:libquadmath-staticdev =3D "GNU quad-precision math library - sta=
tic development files"
-
-# NOTE: mudflap has been removed as of gcc 4.9 and has been superseded b=
y the address sanitiser
-FILES:libmudflap =3D "${libdir}/libmudflap*.so.*"
-SUMMARY:libmudflap =3D "Pointer debugging library for gcc"
-FILES:libmudflap-dev =3D "\
-    ${libdir}/libmudflap*.so \
-    ${libdir}/libmudflap.la \
-"
-SUMMARY:libmudflap-dev =3D "Pointer debugging library for gcc - developm=
ent files"
-FILES:libmudflap-staticdev =3D "${libdir}/libmudflap.a"
-SUMMARY:libmudflap-staticdev =3D "Pointer debugging library for gcc - st=
atic development files"
-
-FILES:libgomp =3D "${libdir}/libgomp*${SOLIBS}"
-SUMMARY:libgomp =3D "GNU OpenMP parallel programming library"
-FILES:libgomp-dev =3D "\
-    ${libdir}/libgomp*${SOLIBSDEV} \
-    ${libdir}/libgomp*.la \
-    ${libdir}/libgomp.spec \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
-"
-SUMMARY:libgomp-dev =3D "GNU OpenMP parallel programming library - devel=
opment files"
-FILES:libgomp-staticdev =3D "${libdir}/libgomp*.a"
-SUMMARY:libgomp-staticdev =3D "GNU OpenMP parallel programming library -=
 static development files"
-
-FILES:libatomic =3D "${libdir}/libatomic.so.*"
-SUMMARY:libatomic =3D "GNU C++11 atomics support library"
-FILES:libatomic-dev =3D "\
-    ${libdir}/libatomic.so \
-    ${libdir}/libatomic.la \
-"
-SUMMARY:libatomic-dev =3D "GNU C++11 atomics support library - developme=
nt files"
-FILES:libatomic-staticdev =3D "${libdir}/libatomic.a"
-SUMMARY:libatomic-staticdev =3D "GNU C++11 atomics support library - sta=
tic development files"
-
-FILES:libitm =3D "${libdir}/libitm.so.*"
-SUMMARY:libitm =3D "GNU transactional memory support library"
-FILES:libitm-dev =3D "\
-    ${libdir}/libitm.so \
-    ${libdir}/libitm.la \
-    ${libdir}/libitm.spec \
-"
-SUMMARY:libitm-dev =3D "GNU transactional memory support library - devel=
opment files"
-FILES:libitm-staticdev =3D "${libdir}/libitm.a"
-SUMMARY:libitm-staticdev =3D "GNU transactional memory support library -=
 static development files"
-
-EAT_VER_MAIN ??=3D ""
-
-python () {
-    if not d.getVar("EAT_VER_MAIN", False):
-        raise bb.parse.SkipPackage("External ARM toolchain not configure=
d (EAT_VER_MAIN not set).")
-    if d.getVar('TCLIBC', True) !=3D "glibc":
-        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TC=
LIBC', True))
-}
--=20
2.25.1


