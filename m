Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDC5C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 13:59:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12362.1638971953524901141
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29684D6E;
	Wed,  8 Dec 2021 05:59:13 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E19893F73B;
	Wed,  8 Dec 2021 05:59:11 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 2/8] arm/optee-spdevkit: add missing header file in
 optee-spdevkit
Date: Wed,  8 Dec 2021 13:58:54 +0000
Message-Id: <20211208135900.683-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
References: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Dec 2021 13:59:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2563

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to add following header file to optee-spdevkit
and these are required by openAMP:

* features.h
* error.h

Change-Id: I51b801911b5a0131bf938ac1d520c4818e416637
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../optee/optee-spdevkit_git.bb               | 183 ++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
index f23cfa7..16ad751 100644
--- a/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
+++ b/meta-arm/recipes-security/optee/optee-spdevkit_git.bb
@@ -106,6 +106,189 @@ EOF
 
 #endif /* STDBOOL_H */
 EOF
+
+cat > ${D}${includedir}/optee/export-user_sp/include/features.h <<'EOF'
+    #ifndef _FEATURES_H
+    #define _FEATURES_H
+    #if defined(_ALL_SOURCE) && !defined(_GNU_SOURCE)
+    #define _GNU_SOURCE 1
+#endif
+    #if defined(_DEFAULT_SOURCE) && !defined(_BSD_SOURCE)
+    #define _BSD_SOURCE 1
+#endif
+    #if !defined(_POSIX_SOURCE) && !defined(_POSIX_C_SOURCE) \
+     && !defined(_XOPEN_SOURCE) && !defined(_GNU_SOURCE) \
+     && !defined(_BSD_SOURCE) && !defined(__STRICT_ANSI__)
+    #define _BSD_SOURCE 1
+    #define _XOPEN_SOURCE 700
+#endif
+    #if __STDC_VERSION__ >= 199901L
+    #define __restrict restrict
+    #elif !defined(__GNUC__)
+    #define __restrict
+#endif
+    #if __STDC_VERSION__ >= 199901L || defined(__cplusplus)
+    #define __inline inline
+    #elif !defined(__GNUC__)
+    #define __inline
+#endif
+    #if __STDC_VERSION__ >= 201112L
+    #elif defined(__GNUC__)
+    #define _Noreturn __attribute__((__noreturn__))
+#else
+    #define _Noreturn
+#endif
+    #define __REDIR(x,y) __typeof__(x) x __asm__(#y)
+#endif
+EOF
+cat > ${D}${includedir}/optee/export-user_sp/include/errno.h <<'EOF'
+    #ifndef _ERRNO_H
+    #define _ERRNO_H
+    #include <features.h>
+    #define EPERM            1
+    #define ENOENT           2
+    #define ESRCH            3
+    #define EINTR            4
+    #define EIO              5
+    #define ENXIO            6
+    #define E2BIG            7
+    #define ENOEXEC          8
+    #define EBADF            9
+    #define ECHILD          10
+    #define EAGAIN          11
+    #define ENOMEM          12
+    #define EACCES          13
+    #define EFAULT          14
+    #define ENOTBLK         15
+    #define EBUSY           16
+    #define EEXIST          17
+    #define EXDEV           18
+    #define ENODEV          19
+    #define ENOTDIR         20
+    #define EISDIR          21
+    #define EINVAL          22
+    #define ENFILE          23
+    #define EMFILE          24
+    #define ENOTTY          25
+    #define ETXTBSY         26
+    #define EFBIG           27
+    #define ENOSPC          28
+    #define ESPIPE          29
+    #define EROFS           30
+    #define EMLINK          31
+    #define EPIPE           32
+    #define EDOM            33
+    #define ERANGE          34
+    #define EDEADLK         35
+    #define ENAMETOOLONG    36
+    #define ENOLCK          37
+    #define ENOSYS          38
+    #define ENOTEMPTY       39
+    #define ELOOP           40
+    #define EWOULDBLOCK     EAGAIN
+    #define ENOMSG          42
+    #define EIDRM           43
+    #define ECHRNG          44
+    #define EL2NSYNC        45
+    #define EL3HLT          46
+    #define EL3RST          47
+    #define ELNRNG          48
+    #define EUNATCH         49
+    #define ENOCSI          50
+    #define EL2HLT          51
+    #define EBADE           52
+    #define EBADR           53
+    #define EXFULL          54
+    #define ENOANO          55
+    #define EBADRQC         56
+    #define EBADSLT         57
+    #define EDEADLOCK       EDEADLK
+    #define EBFONT          59
+    #define ENOSTR          60
+    #define ENODATA         61
+    #define ETIME           62
+    #define ENOSR           63
+    #define ENONET          64
+    #define ENOPKG          65
+    #define EREMOTE         66
+    #define ENOLINK         67
+    #define EADV            68
+    #define ESRMNT          69
+    #define ECOMM           70
+    #define EPROTO          71
+    #define EMULTIHOP       72
+    #define EDOTDOT         73
+    #define EBADMSG         74
+    #define EOVERFLOW       75
+    #define ENOTUNIQ        76
+    #define EBADFD          77
+    #define EREMCHG         78
+    #define ELIBACC         79
+    #define ELIBBAD         80
+    #define ELIBSCN         81
+    #define ELIBMAX         82
+    #define ELIBEXEC        83
+    #define EILSEQ          84
+    #define ERESTART        85
+    #define ESTRPIPE        86
+    #define EUSERS          87
+    #define ENOTSOCK        88
+    #define EDESTADDRREQ    89
+    #define EMSGSIZE        90
+    #define EPROTOTYPE      91
+    #define ENOPROTOOPT     92
+    #define EPROTONOSUPPORT 93
+    #define ESOCKTNOSUPPORT 94
+    #define EOPNOTSUPP      95
+    #define ENOTSUP         EOPNOTSUPP
+    #define EPFNOSUPPORT    96
+    #define EAFNOSUPPORT    97
+    #define EADDRINUSE      98
+    #define EADDRNOTAVAIL   99
+    #define ENETDOWN        100
+    #define ENETUNREACH     101
+    #define ENETRESET       102
+    #define ECONNABORTED    103
+    #define ECONNRESET      104
+    #define ENOBUFS         105
+    #define EISCONN         106
+    #define ENOTCONN        107
+    #define ESHUTDOWN       108
+    #define ETOOMANYREFS    109
+    #define ETIMEDOUT       110
+    #define ECONNREFUSED    111
+    #define EHOSTDOWN       112
+    #define EHOSTUNREACH    113
+    #define EALREADY        114
+    #define EINPROGRESS     115
+    #define ESTALE          116
+    #define EUCLEAN         117
+    #define ENOTNAM         118
+    #define ENAVAIL         119
+    #define EISNAM          120
+    #define EREMOTEIO       121
+    #define EDQUOT          122
+    #define ENOMEDIUM       123
+    #define EMEDIUMTYPE     124
+    #define ECANCELED       125
+    #define ENOKEY          126
+    #define EKEYEXPIRED     127
+    #define EKEYREVOKED     128
+    #define EKEYREJECTED    129
+    #define EOWNERDEAD      130
+    #define ENOTRECOVERABLE 131
+    #define ERFKILL         132
+    #define EHWPOISON       133
+    #ifdef __GNUC__
+    __attribute__((const))
+#endif
+    int *__errno_location(void);
+    #define errno (*__errno_location())
+    #ifdef _GNU_SOURCE
+    extern char *program_invocation_short_name, *program_invocation_name;
+#endif
+#endif
+EOF
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.17.1


