Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1597C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 16:31:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12918.1664901093020195264
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 09:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2876113E;
	Tue,  4 Oct 2022 09:31:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93B193F792;
	Tue,  4 Oct 2022 09:31:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/optee-spdevkit: remove
Date: Tue,  4 Oct 2022 17:31:28 +0100
Message-Id: <20221004163128.3867085-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Oct 2022 16:31:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3921

The "secure parition development kit" is obsolete, newlib is used instead=
.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/qemuarm64-secureboot.yml                   |   1 -
 .../optee/optee-spdevkit_3.10.0.bbappend      |   5 -
 .../optee/optee-spdevkit_3.10.0.bb            | 305 ------------------
 3 files changed, 311 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-spdevkit_3.=
10.0.bbappend
 delete mode 100644 meta-arm/recipes-security/optee/optee-spdevkit_3.10.0=
.bb

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index 7e15a76b..c3522e17 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -14,5 +14,4 @@ target:
   - core-image-base
   - optee-examples
   - optee-test
-  - optee-spdevkit
   - optee-os-tadevkit
diff --git a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_3.10.0.bb=
append b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_3.10.0.bbappe=
nd
deleted file mode 100644
index cfc3023f..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_3.10.0.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_SPDEVKIT_REQUIRE ?=3D ""
-
-require ${MACHINE_OPTEE_SPDEVKIT_REQUIRE}
diff --git a/meta-arm/recipes-security/optee/optee-spdevkit_3.10.0.bb b/m=
eta-arm/recipes-security/optee/optee-spdevkit_3.10.0.bb
deleted file mode 100644
index 7608cec0..00000000
--- a/meta-arm/recipes-security/optee/optee-spdevkit_3.10.0.bb
+++ /dev/null
@@ -1,305 +0,0 @@
-SUMMARY =3D "OP-TEE Secure Partion Development Kit"
-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Developme=
nt Kit to run secure partitions"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee55ec=
173"
-
-inherit deploy python3native
-require optee.inc
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os:"
-
-CVE_PRODUCT =3D "linaro:op-tee op-tee:op-tee_os"
-
-DEPENDS =3D "python3-pyelftools-native"
-
-DEPENDS:append:toolchain-clang =3D " compiler-rt"
-
-# spdevkit isn't yet merged to master
-SRC_URI =3D "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=3D=
https;branch=3Dpsa-development \
-    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0007-allow-setting-sysroot-for-clang.patch \
-"
-SRCREV =3D "f9de2c9520ed97b89760cc4c99424aae440b63f4"
-PV =3D "3.10+git${SRCPV}"
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-EXTRA_OEMAKE +=3D " \
-    PLATFORM=3D${OPTEEMACHINE} \
-    CFG_${OPTEE_CORE}_core=3Dy \
-    CROSS_COMPILE_core=3D${HOST_PREFIX} \
-    CROSS_COMPILE_sp_${OPTEE_ARCH}=3D${HOST_PREFIX} \
-    CFG_CORE_FFA=3Dy \
-    CFG_WITH_SP=3Dy \
-    O=3D${B} \
-"
-
-CFLAGS[unexport] =3D "1"
-LDFLAGS[unexport] =3D "1"
-CPPFLAGS[unexport] =3D "1"
-AS[unexport] =3D "1"
-LD[unexport] =3D "1"
-
-do_configure[noexec] =3D "1"
-
-do_compile() {
-    oe_runmake -C ${S} sp_dev_kit
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install() {
-    #install SP devkit
-    install -d ${D}${includedir}/optee/export-user_sp/
-    for f in ${B}/export-sp_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_sp/
-    done
-    cat > ${D}${includedir}/optee/export-user_sp/include/stddef.h <<'EOF=
'
-#ifndef STDDEF_H
-#define STDDEF_H
-
-#include <stddef_.h>
-
-#ifndef _PTRDIFF_T
-typedef long ptrdiff_t;
-#define _PTRDIFF_T
-#endif
-
-#ifndef NULL
-#define NULL ((void *) 0)
-#endif
-
-#define offsetof(st, m) __builtin_offsetof(st, m)
-
-#endif /* STDDEF_H */
-EOF
-    cat > ${D}${includedir}/optee/export-user_sp/include/stddef_.h <<'EO=
F'
-#ifndef STDDEF__H
-#define STDDEF__H
-
-#ifndef SIZET_
-typedef unsigned long size_t;
-#define SIZET_
-#endif
-
-#endif /* STDDEF__H */
-EOF
-    cat > ${D}${includedir}/optee/export-user_sp/include/stdarg.h <<'EOF=
'
-#ifndef STDARG_H
-#define STDARG_H
-
-#define va_list __builtin_va_list
-#define va_start(ap, last) __builtin_va_start(ap, last)
-#define va_end(ap) __builtin_va_end(ap)
-#define va_copy(to, from) __builtin_va_copy(to, from)
-#define va_arg(to, type) __builtin_va_arg(to, type)
-
-#endif /* STDARG_H */
-EOF
-    cat > ${D}${includedir}/optee/export-user_sp/include/stdbool.h <<'EO=
F'
-#ifndef STDBOOL_H
-#define STDBOOL_H
-
-#define bool	_Bool
-
-#define true	1
-#define false	0
-
-#define __bool_true_false_are_defined	1
-
-#endif /* STDBOOL_H */
-EOF
-
-cat > ${D}${includedir}/optee/export-user_sp/include/features.h <<'EOF'
-    #ifndef _FEATURES_H
-    #define _FEATURES_H
-    #if defined(_ALL_SOURCE) && !defined(_GNU_SOURCE)
-    #define _GNU_SOURCE 1
-#endif
-    #if defined(_DEFAULT_SOURCE) && !defined(_BSD_SOURCE)
-    #define _BSD_SOURCE 1
-#endif
-    #if !defined(_POSIX_SOURCE) && !defined(_POSIX_C_SOURCE) \
-     && !defined(_XOPEN_SOURCE) && !defined(_GNU_SOURCE) \
-     && !defined(_BSD_SOURCE) && !defined(__STRICT_ANSI__)
-    #define _BSD_SOURCE 1
-    #define _XOPEN_SOURCE 700
-#endif
-    #if __STDC_VERSION__ >=3D 199901L
-    #define __restrict restrict
-    #elif !defined(__GNUC__)
-    #define __restrict
-#endif
-    #if __STDC_VERSION__ >=3D 199901L || defined(__cplusplus)
-    #define __inline inline
-    #elif !defined(__GNUC__)
-    #define __inline
-#endif
-    #if __STDC_VERSION__ >=3D 201112L
-    #elif defined(__GNUC__)
-    #define _Noreturn __attribute__((__noreturn__))
-#else
-    #define _Noreturn
-#endif
-    #define __REDIR(x,y) __typeof__(x) x __asm__(#y)
-#endif
-EOF
-cat > ${D}${includedir}/optee/export-user_sp/include/errno.h <<'EOF'
-    #ifndef _ERRNO_H
-    #define _ERRNO_H
-    #include <features.h>
-    #define EPERM            1
-    #define ENOENT           2
-    #define ESRCH            3
-    #define EINTR            4
-    #define EIO              5
-    #define ENXIO            6
-    #define E2BIG            7
-    #define ENOEXEC          8
-    #define EBADF            9
-    #define ECHILD          10
-    #define EAGAIN          11
-    #define ENOMEM          12
-    #define EACCES          13
-    #define EFAULT          14
-    #define ENOTBLK         15
-    #define EBUSY           16
-    #define EEXIST          17
-    #define EXDEV           18
-    #define ENODEV          19
-    #define ENOTDIR         20
-    #define EISDIR          21
-    #define EINVAL          22
-    #define ENFILE          23
-    #define EMFILE          24
-    #define ENOTTY          25
-    #define ETXTBSY         26
-    #define EFBIG           27
-    #define ENOSPC          28
-    #define ESPIPE          29
-    #define EROFS           30
-    #define EMLINK          31
-    #define EPIPE           32
-    #define EDOM            33
-    #define ERANGE          34
-    #define EDEADLK         35
-    #define ENAMETOOLONG    36
-    #define ENOLCK          37
-    #define ENOSYS          38
-    #define ENOTEMPTY       39
-    #define ELOOP           40
-    #define EWOULDBLOCK     EAGAIN
-    #define ENOMSG          42
-    #define EIDRM           43
-    #define ECHRNG          44
-    #define EL2NSYNC        45
-    #define EL3HLT          46
-    #define EL3RST          47
-    #define ELNRNG          48
-    #define EUNATCH         49
-    #define ENOCSI          50
-    #define EL2HLT          51
-    #define EBADE           52
-    #define EBADR           53
-    #define EXFULL          54
-    #define ENOANO          55
-    #define EBADRQC         56
-    #define EBADSLT         57
-    #define EDEADLOCK       EDEADLK
-    #define EBFONT          59
-    #define ENOSTR          60
-    #define ENODATA         61
-    #define ETIME           62
-    #define ENOSR           63
-    #define ENONET          64
-    #define ENOPKG          65
-    #define EREMOTE         66
-    #define ENOLINK         67
-    #define EADV            68
-    #define ESRMNT          69
-    #define ECOMM           70
-    #define EPROTO          71
-    #define EMULTIHOP       72
-    #define EDOTDOT         73
-    #define EBADMSG         74
-    #define EOVERFLOW       75
-    #define ENOTUNIQ        76
-    #define EBADFD          77
-    #define EREMCHG         78
-    #define ELIBACC         79
-    #define ELIBBAD         80
-    #define ELIBSCN         81
-    #define ELIBMAX         82
-    #define ELIBEXEC        83
-    #define EILSEQ          84
-    #define ERESTART        85
-    #define ESTRPIPE        86
-    #define EUSERS          87
-    #define ENOTSOCK        88
-    #define EDESTADDRREQ    89
-    #define EMSGSIZE        90
-    #define EPROTOTYPE      91
-    #define ENOPROTOOPT     92
-    #define EPROTONOSUPPORT 93
-    #define ESOCKTNOSUPPORT 94
-    #define EOPNOTSUPP      95
-    #define ENOTSUP         EOPNOTSUPP
-    #define EPFNOSUPPORT    96
-    #define EAFNOSUPPORT    97
-    #define EADDRINUSE      98
-    #define EADDRNOTAVAIL   99
-    #define ENETDOWN        100
-    #define ENETUNREACH     101
-    #define ENETRESET       102
-    #define ECONNABORTED    103
-    #define ECONNRESET      104
-    #define ENOBUFS         105
-    #define EISCONN         106
-    #define ENOTCONN        107
-    #define ESHUTDOWN       108
-    #define ETOOMANYREFS    109
-    #define ETIMEDOUT       110
-    #define ECONNREFUSED    111
-    #define EHOSTDOWN       112
-    #define EHOSTUNREACH    113
-    #define EALREADY        114
-    #define EINPROGRESS     115
-    #define ESTALE          116
-    #define EUCLEAN         117
-    #define ENOTNAM         118
-    #define ENAVAIL         119
-    #define EISNAM          120
-    #define EREMOTEIO       121
-    #define EDQUOT          122
-    #define ENOMEDIUM       123
-    #define EMEDIUMTYPE     124
-    #define ECANCELED       125
-    #define ENOKEY          126
-    #define EKEYEXPIRED     127
-    #define EKEYREVOKED     128
-    #define EKEYREJECTED    129
-    #define EOWNERDEAD      130
-    #define ENOTRECOVERABLE 131
-    #define ERFKILL         132
-    #define EHWPOISON       133
-    #ifdef __GNUC__
-    __attribute__((const))
-#endif
-    int *__errno_location(void);
-    #define errno (*__errno_location())
-    #ifdef _GNU_SOURCE
-    extern char *program_invocation_short_name, *program_invocation_name=
;
-#endif
-#endif
-EOF
-}
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-COMPATIBLE_HOST =3D "aarch64.*-linux"
-
-# optee-spdevkit static library is part of optee-os image. No need to pa=
ckage this library in a staticdev package
-INSANE_SKIP:${PN}-dev =3D "staticdev"
-# Build paths are currently embedded
-INSANE_SKIP:${PN}-dev +=3D "buildpaths"
--=20
2.34.1


