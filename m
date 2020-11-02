Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.869.1604331230551949686
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 07:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26C4230E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C51323F66E
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Nov 2020 07:33:49 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] arm/optee-os: fix the optee-test build with GCC 10
Date: Mon,  2 Nov 2020 15:33:37 +0000
Message-Id: <20201102153341.2844482-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102153341.2844482-1-ross.burton@arm.com>
References: <20201102153341.2844482-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

GCC 10 calls __getauxval in some situations so backport some patches
from upstream to fix the linking with this symbol.

Change-Id: I68af7ff9d058b9f602f54350a35908d178a8e688
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ide-empty-__getauxval-implementation.patch | 62 +++++++++++++++++++
 ...t-support-for-libnames-after-libgcc-.patch | 55 ++++++++++++++++
 ...ke-sure-that-libutils-is-linked-seco.patch | 44 +++++++++++++
 .../recipes-security/optee/optee-os_3.11.0.bb |  4 +-
 4 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-libutil=
s-provide-empty-__getauxval-implementation.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0002-link.mk=
-implement-support-for-libnames-after-libgcc-.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0003-ta_dev_=
kit.mk-make-sure-that-libutils-is-linked-seco.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-libutils-provi=
de-empty-__getauxval-implementation.patch b/meta-arm/recipes-security/opt=
ee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
new file mode 100644
index 0000000..0120f5c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-libutils-provide-empt=
y-__getauxval-implementation.patch
@@ -0,0 +1,62 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 36e784f621bf5d5be9183beba35f39426277c110 Mon Sep 17 00:00:00 2001
+From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Date: Tue, 13 Oct 2020 22:45:39 +0300
+Subject: [PATCH 1/3] libutils: provide empty __getauxval() implementatio=
n
+
+Never version of libgcc are built with LSE implementation in mind. To
+determine if LSE is available on platform it calls __getauxval(), so in
+some cases we can get undefined reference to __getauxval() error.
+
+Prominent case is libgcc_eh.a library, which is used by C++ TAs. Excepti=
on
+handler depends on atomic operations, so it tries to call
+init_have_lse_atomics() first. This function in turn calls __getauxval()=
,
+which causes linking error.
+
+In the future we can make __getauxval() to return actual platform
+capabilities.
+
+Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Jerome Forissier <jerome@forissier.org>
+---
+ lib/libutils/ext/arch/arm/auxval.c | 12 ++++++++++++
+ lib/libutils/ext/arch/arm/sub.mk   |  1 +
+ 2 files changed, 13 insertions(+)
+ create mode 100644 lib/libutils/ext/arch/arm/auxval.c
+
+diff --git a/lib/libutils/ext/arch/arm/auxval.c b/lib/libutils/ext/arch/=
arm/auxval.c
+new file mode 100644
+index 00000000..98bca850
+--- /dev/null
++++ b/lib/libutils/ext/arch/arm/auxval.c
+@@ -0,0 +1,12 @@
++// SPDX-License-Identifier: BSD-2-Clause
++/*
++ * Copyright (c) 2020, EPAM Systems
++ */
++
++#include <compiler.h>
++
++unsigned long int __getauxval (unsigned long int type);
++unsigned long int __getauxval (unsigned long int type __unused)
++{
++	return 0;
++}
+diff --git a/lib/libutils/ext/arch/arm/sub.mk b/lib/libutils/ext/arch/ar=
m/sub.mk
+index dc5eed67..2e779066 100644
+--- a/lib/libutils/ext/arch/arm/sub.mk
++++ b/lib/libutils/ext/arch/arm/sub.mk
+@@ -3,6 +3,7 @@ srcs-$(CFG_ARM32_$(sm)) +=3D aeabi_unwind.c
+ endif
+ srcs-$(CFG_ARM32_$(sm)) +=3D atomic_a32.S
+ srcs-$(CFG_ARM64_$(sm)) +=3D atomic_a64.S
++srcs-y +=3D auxval.c
+ ifneq ($(sm),ldelf) # TA, core
+ srcs-$(CFG_ARM32_$(sm)) +=3D mcount_a32.S
+ srcs-$(CFG_ARM64_$(sm)) +=3D mcount_a64.S
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0002-link.mk-implem=
ent-support-for-libnames-after-libgcc-.patch b/meta-arm/recipes-security/=
optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.=
patch
new file mode 100644
index 0000000..11296c8
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0002-link.mk-implement-sup=
port-for-libnames-after-libgcc-.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 73196b58ea6978ffa5e581738030f51c5789ef73 Mon Sep 17 00:00:00 2001
+From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Date: Tue, 13 Oct 2020 22:54:13 +0300
+Subject: [PATCH 2/3] link.mk: implement support for libnames-after-libgc=
c
+ variable
+
+Newer versions of libgcc depend on external __getauxval() symbol, which =
is
+now provided by libutils. But libgcc is linked after libutils, so linker
+can't resolve that symbol. We can't include libgcc into linking group wi=
th
+libtutils, because libgcc provides symbols that conflict with libutil's
+ones, like __aeabi_idiv with friends for instance.
+
+So, to resolve libgcc dependency on libutils we need to link with libuti=
ls
+second time. To make things more generic, we will introduce
+$(libnames-after-libgcc) variable for libraries that should be linked af=
ter
+libgcc.
+
+Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Jerome Forissier <jerome@forissier.org>
+---
+ ta/arch/arm/link.mk | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk
+index 445c285d..3025acb1 100644
+--- a/ta/arch/arm/link.mk
++++ b/ta/arch/arm/link.mk
+@@ -55,8 +55,11 @@ link-ldflags +=3D --eh-frame-hdr
+ link-ldadd +=3D $(libstdc++$(sm)) $(libgcc_eh$(sm))
+ endif
+ link-ldadd +=3D --end-group
+-ldargs-$(user-ta-uuid).elf :=3D $(link-ldflags) $(objs) $(link-ldadd) $=
(libgcc$(sm))
+=20
++link-ldadd-after-libgcc +=3D $(addprefix -l,$(libnames-after-libgcc))
++
++ldargs-$(user-ta-uuid).elf :=3D $(link-ldflags) $(objs) $(link-ldadd) \
++				$(libgcc$(sm)) $(link-ldadd-after-libgcc)
+=20
+ link-script-cppflags-$(sm) :=3D \
+ 	$(filter-out $(CPPFLAGS_REMOVE) $(cppflags-remove), \
+@@ -76,6 +79,7 @@ $(link-script-pp$(sm)): $(link-script$(sm)) $(conf-fil=
e) $(link-script-pp-makefi
+ 		$(link-script-cppflags-$(sm)) $$< -o $$@
+=20
+ $(link-out-dir$(sm))/$(user-ta-uuid).elf: $(objs) $(libdeps) \
++					  $(libdeps-after-libgcc) \
+ 					  $(link-script-pp$(sm)) \
+ 					  $(dynlistdep) \
+ 					  $(additional-link-deps)
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-=
make-sure-that-libutils-is-linked-seco.patch b/meta-arm/recipes-security/=
optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.=
patch
new file mode 100644
index 0000000..88ba5f8
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make-su=
re-that-libutils-is-linked-seco.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From f50962e3f56f0932662b2ffa10afe53339a335dd Mon Sep 17 00:00:00 2001
+From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Date: Fri, 16 Oct 2020 16:36:08 +0300
+Subject: [PATCH 3/3] ta_dev_kit.mk: make sure that libutils is linked se=
cond
+ time
+
+libgcc depends on __getauxval symbol from libuils. As, generally libutil=
s
+is linked before libgcc, we will get "unresolved symbol" error. To resol=
ve
+this dependency we need to link libutils second time - after libgcc.
+
+Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Jerome Forissier <jerome@forissier.org>
+---
+ ta/mk/ta_dev_kit.mk | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/ta/mk/ta_dev_kit.mk b/ta/mk/ta_dev_kit.mk
+index e28be677..d0e66317 100644
+--- a/ta/mk/ta_dev_kit.mk
++++ b/ta/mk/ta_dev_kit.mk
+@@ -78,6 +78,16 @@ endif
+ libnames +=3D dl
+ libdeps +=3D $(ta-dev-kit-dir$(sm))/lib/libdl.a
+=20
++# libutils provides __getauxval symbol which is needed by libgcc 10.x. =
We can't
++# link libutils after libgcc, because libgcc will replace some symbols =
provided
++# by libutils, which will cause further linking issues.
++#
++# But if we place libutils before libgcc, linker will not be able to re=
solve
++# __getauxval. So we need to link with libutils twice: before and after=
 libgcc.
++# Hence it included both in $(libnames) and in $(libnames-after-libgcc)
++libnames-after-libgcc +=3D utils
++libdeps-after-libgcc +=3D $(ta-dev-kit-dir$(sm))/lib/libutils.a
++
+ # Pass config variable (CFG_) from conf.mk on the command line
+ cppflags$(sm) +=3D $(strip \
+ 	$(foreach var, $(filter CFG_%,$(.VARIABLES)), \
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os_3.11.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.11.0.bb
index a8f2a11..13b3dc6 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
@@ -5,5 +5,7 @@ SRCREV =3D "c4def2a8262a03244d9a88461699b9b8e43c6b55"
 SRC_URI_append =3D " \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0007-allow-setting-sysroot-for-clang.patch \
+    file://0001-libutils-provide-empty-__getauxval-implementation.patch =
\
+    file://0002-link.mk-implement-support-for-libnames-after-libgcc-.pat=
ch \
+    file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.pat=
ch \
 "
-
--=20
2.25.1

