Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DF0C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 10:42:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6195.1662547340424930313
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Sep 2022 03:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCDDF1042;
	Wed,  7 Sep 2022 03:42:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06C4F3F7B4;
	Wed,  7 Sep 2022 03:42:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/optee-os: refresh patch to remove fuzz
Date: Wed,  7 Sep 2022 11:42:16 +0100
Message-Id: <20220907104216.582351-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Sep 2022 10:42:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3744

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../0010-add-note-GNU-stack-section.patch     | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-=
GNU-stack-section.patch b/meta-arm/recipes-security/optee/optee-os/3.18/0=
010-add-note-GNU-stack-section.patch
index 95d5e676..fd5f08f2 100644
--- a/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-sta=
ck-section.patch
+++ b/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-sta=
ck-section.patch
@@ -1,4 +1,4 @@
-From 38bf606653ee08b10db6bb298e369cb3a9cdcda9 Mon Sep 17 00:00:00 2001
+From 91bf1c53442e0151ecc8a4f87c4e16c89fb1fad6 Mon Sep 17 00:00:00 2001
 From: Jerome Forissier <jerome.forissier@linaro.org>
 Date: Tue, 23 Aug 2022 12:31:46 +0000
 Subject: [PATCH] arm32: libutils, libutee, ta: add .note.GNU-stack secti=
on to
@@ -36,12 +36,12 @@ Upstream-Status: Backport [https://github.com/OP-TEE/=
optee_os/pull/5499]
  7 files changed, 14 insertions(+)
=20
 diff --git a/lib/libutee/arch/arm/utee_syscalls_a32.S b/lib/libutee/arch=
/arm/utee_syscalls_a32.S
-index 6e621ca6..af405f62 100644
+index d416c270..99e518c2 100644
 --- a/lib/libutee/arch/arm/utee_syscalls_a32.S
 +++ b/lib/libutee/arch/arm/utee_syscalls_a32.S
-@@ -7,6 +7,8 @@
- #include <tee_syscall_numbers.h>
- #include <asm.S>
+@@ -13,6 +13,8 @@
+ #define UNWIND(...)
+ #endif
 =20
 +	.section .note.GNU-stack,"",%progbits
 +
@@ -62,7 +62,7 @@ index eaef6914..2be73ffa 100644
  FUNC atomic_inc32 , :
  	ldrex	r1, [r0]
 diff --git a/lib/libutils/ext/arch/arm/mcount_a32.S b/lib/libutils/ext/a=
rch/arm/mcount_a32.S
-index 51439a23..54dc3c02 100644
+index b49421ac..a044367f 100644
 --- a/lib/libutils/ext/arch/arm/mcount_a32.S
 +++ b/lib/libutils/ext/arch/arm/mcount_a32.S
 @@ -7,6 +7,8 @@
@@ -75,7 +75,7 @@ index 51439a23..54dc3c02 100644
   * Convert return address to call site address by subtracting the size =
of the
   * mcount call instruction (blx __gnu_mcount_nc).
 diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S b/lib/l=
ibutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-index a600c879..37ae9ec6 100644
+index e34b8dbe..2ee8c69a 100644
 --- a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
 +++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
 @@ -5,6 +5,8 @@
@@ -85,10 +85,10 @@ index a600c879..37ae9ec6 100644
 +	.section .note.GNU-stack,"",%progbits
 +
  /*
-  * signed ret_idivmod_values(signed quot, signed rem);
-  * return quotient and remaining the EABI way (regs r0,r1)
+  * This assembly source is used both in kernel and userland
+  * hence define unwind resources that match both environments.
 diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S b/lib/=
libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-index 2dc50bc9..5c3353e2 100644
+index 03ca3349..123c0579 100644
 --- a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
 +++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
 @@ -5,6 +5,8 @@
@@ -98,8 +98,8 @@ index 2dc50bc9..5c3353e2 100644
 +	.section .note.GNU-stack,"",%progbits
 +
  /*
-  * __value_in_regs lldiv_t __aeabi_ldivmod( long long n, long long d)
-  */
+  * This assembly source is used both in kernel and userland
+  * hence define unwind resources that match both environments.
 diff --git a/lib/libutils/isoc/arch/arm/setjmp_a32.S b/lib/libutils/isoc=
/arch/arm/setjmp_a32.S
 index 43ea5937..f8a0b70d 100644
 --- a/lib/libutils/isoc/arch/arm/setjmp_a32.S
@@ -114,12 +114,12 @@ index 43ea5937..f8a0b70d 100644
 =20
     The interworking scheme expects functions to use a BX instruction
 diff --git a/ta/arch/arm/ta_entry_a32.S b/ta/arch/arm/ta_entry_a32.S
-index d2f8a69d..cd9a12f9 100644
+index e3ef0e33..7c424f2b 100644
 --- a/ta/arch/arm/ta_entry_a32.S
 +++ b/ta/arch/arm/ta_entry_a32.S
-@@ -5,6 +5,8 @@
-=20
- #include <asm.S>
+@@ -11,6 +11,8 @@
+ #define UNWIND(...)
+ #endif
 =20
 +	.section .note.GNU-stack,"",%progbits
 +
--=20
2.34.1


