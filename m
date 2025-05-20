Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D82C54756
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:28:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26828.1747762087951519973
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 10:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AA311516;
	Tue, 20 May 2025 10:27:54 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9C263F5A1;
	Tue, 20 May 2025 10:28:06 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 2/9] arm/trusted-services: drop newlib
Date: Tue, 20 May 2025 19:27:40 +0200
Message-ID: <20250520172748.3439803-2-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520172748.3439803-1-gyorgy.szing@arm.com>
References: <20250520172748.3439803-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 17:28:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6509

Trusted Services introduced its own libc implementation and has no
dependency on newlib anymore. Remove TS specific newlib recipes and
patch files.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 ...wlib-memcpy-remove-optimized-version.patch | 210 ------------------
 .../trusted-services/ts-newlib_%.bbappend     |   8 -
 .../trusted-services/trusted-services.inc     |   2 +-
 .../trusted-services/ts-newlib_4.1.0.bb       |  39 ----
 .../trusted-services/ts-sp-common.inc         |   2 +-
 5 files changed, 2 insertions(+), 259 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/ts-newlib/0001-newlib-memcpy-remove-optimized-version.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-new=
lib_%.bbappend
 delete mode 100644 meta-arm/recipes-security/trusted-services/ts-newlib_=
4.1.0.bb

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
ts-newlib/0001-newlib-memcpy-remove-optimized-version.patch b/meta-arm-bs=
p/recipes-security/trusted-services/corstone1000/ts-newlib/0001-newlib-me=
mcpy-remove-optimized-version.patch
deleted file mode 100644
index 7d8504d9..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-newl=
ib/0001-newlib-memcpy-remove-optimized-version.patch
+++ /dev/null
@@ -1,210 +0,0 @@
-From 03d97c104f2d68cffd1bfc48cd62727e13a64712 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Fri, 14 Oct 2022 17:42:52 +0100
-Subject: [PATCH] newlib: memcpy: remove optimized version
-
-When creating messages packed to send over openamp we may need
-to do some copy in unaligned address, because of that we may
-not always use the assembler optimized version, which will
-trough a data-abort on aligned address exception.
-
-So, we may just use the version in string.h (the same used in
-optee-os) that will take care to check and use different
-optimization based on given source or destination address's.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- newlib/libc/machine/aarch64/memcpy-stub.c |   2 +-
- newlib/libc/machine/aarch64/memcpy.S      | 166 ----------------------
- 2 files changed, 1 insertion(+), 167 deletions(-)
-
-diff --git a/newlib/libc/machine/aarch64/memcpy-stub.c b/newlib/libc/mac=
hine/aarch64/memcpy-stub.c
-index cd6d72a8b8af..5f2b7968c7fc 100644
---- a/newlib/libc/machine/aarch64/memcpy-stub.c
-+++ b/newlib/libc/machine/aarch64/memcpy-stub.c
-@@ -27,5 +27,5 @@
- #if (defined (__OPTIMIZE_SIZE__) || defined (PREFER_SIZE_OVER_SPEED))
- # include "../../string/memcpy.c"
- #else
--/* See memcpy.S  */
-+# include "../../string/memcpy.c"
- #endif
-diff --git a/newlib/libc/machine/aarch64/memcpy.S b/newlib/libc/machine/=
aarch64/memcpy.S
-index 463bad0a1816..2a1460546374 100644
---- a/newlib/libc/machine/aarch64/memcpy.S
-+++ b/newlib/libc/machine/aarch64/memcpy.S
-@@ -61,170 +61,4 @@
- #if (defined (__OPTIMIZE_SIZE__) || defined (PREFER_SIZE_OVER_SPEED))
- /* See memcpy-stub.c  */
- #else
--
--#define dstin	x0
--#define src	x1
--#define count	x2
--#define dst	x3
--#define srcend	x4
--#define dstend	x5
--#define A_l	x6
--#define A_lw	w6
--#define A_h	x7
--#define A_hw	w7
--#define B_l	x8
--#define B_lw	w8
--#define B_h	x9
--#define C_l	x10
--#define C_h	x11
--#define D_l	x12
--#define D_h	x13
--#define E_l	src
--#define E_h	count
--#define F_l	srcend
--#define F_h	dst
--#define tmp1	x9
--
--#define L(l) .L ## l
--
--	.macro def_fn f p2align=3D0
--	.text
--	.p2align \p2align
--	.global \f
--	.type \f, %function
--\f:
--	.endm
--
--/* Copies are split into 3 main cases: small copies of up to 16 bytes,
--   medium copies of 17..96 bytes which are fully unrolled. Large copies
--   of more than 96 bytes align the destination and use an unrolled loop
--   processing 64 bytes per iteration.
--   Small and medium copies read all data before writing, allowing any
--   kind of overlap, and memmove tailcalls memcpy for these cases as
--   well as non-overlapping copies.
--*/
--
--def_fn memcpy p2align=3D6
--	prfm	PLDL1KEEP, [src]
--	add	srcend, src, count
--	add	dstend, dstin, count
--	cmp	count, 16
--	b.ls	L(copy16)
--	cmp	count, 96
--	b.hi	L(copy_long)
--
--	/* Medium copies: 17..96 bytes.  */
--	sub	tmp1, count, 1
--	ldp	A_l, A_h, [src]
--	tbnz	tmp1, 6, L(copy96)
--	ldp	D_l, D_h, [srcend, -16]
--	tbz	tmp1, 5, 1f
--	ldp	B_l, B_h, [src, 16]
--	ldp	C_l, C_h, [srcend, -32]
--	stp	B_l, B_h, [dstin, 16]
--	stp	C_l, C_h, [dstend, -32]
--1:
--	stp	A_l, A_h, [dstin]
--	stp	D_l, D_h, [dstend, -16]
--	ret
--
--	.p2align 4
--	/* Small copies: 0..16 bytes.  */
--L(copy16):
--	cmp	count, 8
--	b.lo	1f
--	ldr	A_l, [src]
--	ldr	A_h, [srcend, -8]
--	str	A_l, [dstin]
--	str	A_h, [dstend, -8]
--	ret
--	.p2align 4
--1:
--	tbz	count, 2, 1f
--	ldr	A_lw, [src]
--	ldr	A_hw, [srcend, -4]
--	str	A_lw, [dstin]
--	str	A_hw, [dstend, -4]
--	ret
--
--	/* Copy 0..3 bytes.  Use a branchless sequence that copies the same
--	   byte 3 times if count=3D=3D1, or the 2nd byte twice if count=3D=3D2=
.  */
--1:
--	cbz	count, 2f
--	lsr	tmp1, count, 1
--	ldrb	A_lw, [src]
--	ldrb	A_hw, [srcend, -1]
--	ldrb	B_lw, [src, tmp1]
--	strb	A_lw, [dstin]
--	strb	B_lw, [dstin, tmp1]
--	strb	A_hw, [dstend, -1]
--2:	ret
--
--	.p2align 4
--	/* Copy 64..96 bytes.  Copy 64 bytes from the start and
--	   32 bytes from the end.  */
--L(copy96):
--	ldp	B_l, B_h, [src, 16]
--	ldp	C_l, C_h, [src, 32]
--	ldp	D_l, D_h, [src, 48]
--	ldp	E_l, E_h, [srcend, -32]
--	ldp	F_l, F_h, [srcend, -16]
--	stp	A_l, A_h, [dstin]
--	stp	B_l, B_h, [dstin, 16]
--	stp	C_l, C_h, [dstin, 32]
--	stp	D_l, D_h, [dstin, 48]
--	stp	E_l, E_h, [dstend, -32]
--	stp	F_l, F_h, [dstend, -16]
--	ret
--
--	/* Align DST to 16 byte alignment so that we don't cross cache line
--	   boundaries on both loads and stores.	 There are at least 96 bytes
--	   to copy, so copy 16 bytes unaligned and then align.	The loop
--	   copies 64 bytes per iteration and prefetches one iteration ahead.  =
*/
--
--	.p2align 4
--L(copy_long):
--	and	tmp1, dstin, 15
--	bic	dst, dstin, 15
--	ldp	D_l, D_h, [src]
--	sub	src, src, tmp1
--	add	count, count, tmp1	/* Count is now 16 too large.  */
--	ldp	A_l, A_h, [src, 16]
--	stp	D_l, D_h, [dstin]
--	ldp	B_l, B_h, [src, 32]
--	ldp	C_l, C_h, [src, 48]
--	ldp	D_l, D_h, [src, 64]!
--	subs	count, count, 128 + 16	/* Test and readjust count.  */
--	b.ls	2f
--1:
--	stp	A_l, A_h, [dst, 16]
--	ldp	A_l, A_h, [src, 16]
--	stp	B_l, B_h, [dst, 32]
--	ldp	B_l, B_h, [src, 32]
--	stp	C_l, C_h, [dst, 48]
--	ldp	C_l, C_h, [src, 48]
--	stp	D_l, D_h, [dst, 64]!
--	ldp	D_l, D_h, [src, 64]!
--	subs	count, count, 64
--	b.hi	1b
--
--	/* Write the last full set of 64 bytes.	 The remainder is at most 64
--	   bytes, so it is safe to always copy 64 bytes from the end even if
--	   there is just 1 byte left.  */
--2:
--	ldp	E_l, E_h, [srcend, -64]
--	stp	A_l, A_h, [dst, 16]
--	ldp	A_l, A_h, [srcend, -48]
--	stp	B_l, B_h, [dst, 32]
--	ldp	B_l, B_h, [srcend, -32]
--	stp	C_l, C_h, [dst, 48]
--	ldp	C_l, C_h, [srcend, -16]
--	stp	D_l, D_h, [dst, 64]
--	stp	E_l, E_h, [dstend, -64]
--	stp	A_l, A_h, [dstend, -48]
--	stp	B_l, B_h, [dstend, -32]
--	stp	C_l, C_h, [dstend, -16]
--	ret
--
--	.size	memcpy, . - memcpy
- #endif
---=20
-2.38.0
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.b=
bappend b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbap=
pend
deleted file mode 100644
index 708f5986..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/corstone1000/${PN}=
:"
-
-COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
-SRC_URI:append:corstone1000 =3D " \
-  file://0001-newlib-memcpy-remove-optimized-version.patch;patchdir=3D..=
/newlib \
-"
-
-COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.=
inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index 17064f74..a35f93c0 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -54,5 +54,5 @@ EXTRA_OECMAKE +=3D "${@get_ts_toolchain_option(d)}"
=20
 # Paths to pre-built dependencies required by some TS SPs/tools
 EXTRA_OECMAKE +=3D "-Dlibts_ROOT=3D${STAGING_DIR_HOST}${TS_INSTALL}/lib/=
cmake/libts/ \
-                  -DNEWLIB_INSTALL_DIR=3D${STAGING_DIR_HOST}/usr/opteesp=
/newlib \
+
                  "
diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.b=
b b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
deleted file mode 100644
index 1fda415a..00000000
--- a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY =3D "Newlib static libraries built with Trusted Services opteesp=
 deployment options"
-
-TS_ENV =3D "opteesp"
-
-require trusted-services.inc
-
-SRC_URI +=3D "git://sourceware.org/git/newlib-cygwin.git;name=3Dnewlib;p=
rotocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/newlib \
-"
-
-# tag "newlib-4.1.0"
-SRCREV_newlib =3D "415fdd4279b85eeec9d54775ce13c5c412451e08"
-LIC_FILES_CHKSUM +=3D "file://../newlib/COPYING.NEWLIB;md5=3Db8dda70da54=
e0efb49b1074f349d7749"
-
-# Newlib does not compile with clang
-TOOLCHAIN =3D "gcc"
-
-EXTRA_OECMAKE +=3D '-DNEWLIB_SOURCE_DIR=3D${WORKDIR}/git/newlib \
-                  -DNEWLIB_CFLAGS=3D"--sysroot=3D${STAGING_DIR_HOST}" \
-                 '
-
-OECMAKE_SOURCEPATH =3D "${S}/deployments/newlib/${TS_ENV}/"
-
-# Silence compilation errors from GCC 14.1 due to stricter code validati=
on
-export NEWLIB_CFLAGS_TARGET =3D "-Wno-implicit-function-declaration -Wno=
-int-conversion"
-
-# TS ships a patch that needs to be applied to newlib
-apply_ts_patch() {
-    set -ex
-    cd ${WORKDIR}/git/newlib
-    check_git_config
-    git stash
-    git branch -f bf_am
-    git am ${S}/external/newlib/*.patch
-    git reset bf_am
-}
-do_patch[postfuncs] +=3D "apply_ts_patch"
-
-FILES:${PN}-dev =3D "${TS_INSTALL}/newlib"
-FILES:${PN}-staticdev =3D "${TS_INSTALL}/newlib/*/lib/*.a"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc =
b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
index 83cac6ea..65065880 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -5,7 +5,7 @@ TS_ENV ?=3D "opteesp"
 require trusted-services.inc
 require ts-uuid.inc
=20
-DEPENDS +=3D "dtc-native ts-newlib"
+DEPENDS +=3D "dtc-native"
 DEPENDS +=3D "${@oe.utils.conditional('TS_ENV','sp','python3-pyelftools-=
native','', d)}"
=20
 FILES:${PN}-dev =3D "${TS_INSTALL}"
--=20
2.43.0


