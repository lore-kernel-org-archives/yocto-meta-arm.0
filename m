Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E0CCEACF1
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 18:39:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89685.1727807946269299737
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 11:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1424B339
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Oct 2024 11:39:35 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 59D023F58B
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Oct 2024 11:39:05 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] arm/optee: update to 4.3.0
Date: Tue,  1 Oct 2024 14:38:59 -0400
Message-Id: <20241001183903.13457-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Oct 2024 18:39:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6156

Update OP-TEE to version 4.3.0
NOTE: the license file in optee-test changed, but the license is the
same (commit a748f5fcd9ec8a574dc86a5aa56d05bc6ac174e7).  They chose to
change the URL of the licenses in question to be "LICENSE-GPL" and
"LICENSE-BSD".

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...one1000-Remove-MMCOMM-buffer-address.patch | 43 ------------
 .../optee/optee-os-corstone1000-common.inc    |  1 -
 ...-client_4.2.0.bb =3D> optee-client_4.3.0.bb} |  2 +-
 ...mples_4.2.0.bb =3D> optee-examples_4.3.0.bb} |  0
 ...it_4.2.0.bb =3D> optee-os-tadevkit_4.3.0.bb} |  0
 ...arm64.h-fix-compile-error-with-Clang.patch | 70 -------------------
 ...not-use-full-path-to-generate-guard-.patch | 45 ------------
 ...002-libutils-zlib-fix-Clang-warnings.patch | 64 -----------------
 .../{optee-os_4.2.0.bb =3D> optee-os_4.3.0.bb}  |  5 +-
 ...stats-remove-unneeded-stat.h-include.patch | 34 ---------
 ...ptee-test_4.2.0.bb =3D> optee-test_4.3.0.bb} |  4 +-
 12 files changed, 5 insertions(+), 265 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0003-plat-corstone1000-Remove-MMCOMM-buffer-address.patch
 rename meta-arm/recipes-security/optee/{optee-client_4.2.0.bb =3D> optee=
-client_4.3.0.bb} (71%)
 rename meta-arm/recipes-security/optee/{optee-examples_4.2.0.bb =3D> opt=
ee-examples_4.3.0.bb} (100%)
 rename meta-arm/recipes-security/optee/{optee-os-tadevkit_4.2.0.bb =3D> =
optee-os-tadevkit_4.3.0.bb} (100%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-arm64.h=
-fix-compile-error-with-Clang.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-checkco=
nf.mk-do-not-use-full-path-to-generate-guard-.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0002-libutil=
s-zlib-fix-Clang-warnings.patch
 rename meta-arm/recipes-security/optee/{optee-os_4.2.0.bb =3D> optee-os_=
4.3.0.bb} (64%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-xtest=
-stats-remove-unneeded-stat.h-include.patch
 rename meta-arm/recipes-security/optee/{optee-test_4.2.0.bb =3D> optee-t=
est_4.3.0.bb} (78%)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index d65906362d54..132d425af0be 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -14,7 +14,7 @@ TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
=20
 # optee
-PREFERRED_VERSION_optee-os ?=3D "4.2.%"
+PREFERRED_VERSION_optee-os ?=3D "4.3.%"
=20
 # Trusted Services
 TS_PLATFORM =3D "arm/corstone1000"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0003-plat-corstone1000-Remove-MMCOMM-buffer-address.patch b/meta-arm-=
bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone=
1000-Remove-MMCOMM-buffer-address.patch
deleted file mode 100644
index e493ee1a66e5..000000000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
3-plat-corstone1000-Remove-MMCOMM-buffer-address.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2fadadf1075c95b2955f047fa0387b39612f7b30 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 30 May 2024 13:37:38 +0000
-Subject: [PATCH] plat-corstone1000: Remove MMCOMM buffer address
-
-Remove MMCOMM buffer address and mapping, as it is not being used anymor=
e
-
-Upstream-Status: Backport [In v3, https://github.com/OP-TEE/optee_os/com=
mit/eaee88fbcac6dcc15fe1d1a758b53eb2b66cfc60]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- core/arch/arm/plat-corstone1000/main.c            | 1 -
- core/arch/arm/plat-corstone1000/platform_config.h | 3 ---
- 2 files changed, 4 deletions(-)
-
-diff --git a/core/arch/arm/plat-corstone1000/main.c b/core/arch/arm/plat=
-corstone1000/main.c
-index b3861c4c8..61171b9a9 100644
---- a/core/arch/arm/plat-corstone1000/main.c
-+++ b/core/arch/arm/plat-corstone1000/main.c
-@@ -15,7 +15,6 @@
- static struct pl011_data console_data __nex_bss;
-=20
- register_ddr(DRAM0_BASE, DRAM0_SIZE);
--register_ddr(MM_COMM_BUF_BASE, MM_COMM_BUF_SIZE);
-=20
- register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_S=
IZE);
- register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
-diff --git a/core/arch/arm/plat-corstone1000/platform_config.h b/core/ar=
ch/arm/plat-corstone1000/platform_config.h
-index 6653d38bc..f59c93a14 100644
---- a/core/arch/arm/plat-corstone1000/platform_config.h
-+++ b/core/arch/arm/plat-corstone1000/platform_config.h
-@@ -26,9 +26,6 @@
- #define GICD_BASE		(GIC_BASE + GICD_OFFSET)
- #define GICC_BASE		(GIC_BASE + GICC_OFFSET)
-=20
--#define MM_COMM_BUF_BASE	0x02000000
--#define MM_COMM_BUF_SIZE	0x1000
--
- #define UART_BAUDRATE		115200
- #define CONSOLE_BAUDRATE	UART_BAUDRATE
-=20
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index 2228908726b3..482aab773262 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -2,7 +2,6 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/c=
orstone1000:"
 SRC_URI:append =3D " \
                   file://0001-Handle-logging-syscall.patch \
                   file://0002-increase-tzdram-size.patch \
-                  file://0003-plat-corstone1000-Remove-MMCOMM-buffer-add=
ress.patch \
 		  "
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
diff --git a/meta-arm/recipes-security/optee/optee-client_4.2.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.3.0.bb
similarity index 71%
rename from meta-arm/recipes-security/optee/optee-client_4.2.0.bb
rename to meta-arm/recipes-security/optee/optee-client_4.3.0.bb
index 56494e4cfe66..4a0880046e9d 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
@@ -1,6 +1,6 @@
 require recipes-security/optee/optee-client.inc
=20
-SRCREV =3D "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
+SRCREV =3D "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
=20
 inherit pkgconfig
 DEPENDS +=3D "util-linux"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.2.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.3.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-examples_4.2.0.bb
rename to meta-arm/recipes-security/optee/optee-examples_4.3.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.3.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb
rename to meta-arm/recipes-security/optee/optee-os-tadevkit_4.3.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-arm64.h-fix-co=
mpile-error-with-Clang.patch b/meta-arm/recipes-security/optee/optee-os/0=
001-arm64.h-fix-compile-error-with-Clang.patch
deleted file mode 100644
index e4508b3435c6..000000000000
--- a/meta-arm/recipes-security/optee/optee-os/0001-arm64.h-fix-compile-e=
rror-with-Clang.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From dc9fd53be9d69c4a6bc67d9de951b8f2a92abade Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Fri, 14 Jun 2024 17:51:22 +0200
-Subject: [PATCH 1/2] arm64.h: fix compile error with Clang
-
-Clang 18.1.6 fails to compile OP-TEE OS with the following error:
-
-   CC      out/arm/core/arch/arm/kernel/vfp.o
- In file included from core/arch/arm/kernel/vfp.c:6:
- In file included from core/arch/arm/include/arm.h:137:
- core/arch/arm/include/arm64.h:455:1: error: expected readable system re=
gister
-   455 | DEFINE_U32_REG_READWRITE_FUNCS(fpcr)
-       | ^
- core/arch/arm/include/arm64.h:436:3: note: expanded from macro 'DEFINE_=
U32_REG_READWRITE_FUNCS'
-   436 |                 DEFINE_U32_REG_READ_FUNC(reg)   \
-       |                 ^
- core/arch/arm/include/arm64.h:430:3: note: expanded from macro 'DEFINE_=
U32_REG_READ_FUNC'
-   430 |                 DEFINE_REG_READ_FUNC_(reg, uint32_t, reg)
-       |                 ^
- core/arch/arm/include/arm64.h:417:15: note: expanded from macro 'DEFINE=
_REG_READ_FUNC_'
-   417 |         asm volatile("mrs %0, " #asmreg : "=3Dr" (val64));     =
   \
-       |                      ^
- <inline asm>:1:10: note: instantiated into assembly here
-     1 |         mrs x8, fpcr
-       |                 ^
-
-...and similar ones for fpcr write, as well as fpsr read and write.
-
-Clang 12.0.0 does not have any problem with this code which makes me
-think that it's a Clang/LLVM issue.
-
-Work around the problem by using the coded system register identifiers
-S3_3_c4_c4_0 and S3_3_c4_c4_1 instead of fpcr and fpsr, respectively.
-The values 3-3-4-4-0 and 3-3-4-4-1 are taken from the Arm ARM sections
-C.5.2.8 and C.5.2.9.
-
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Joakim Bech <joakim.bech@linaro.org>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-
-Upstream-Status: Backport
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
----
- core/arch/arm/include/arm64.h | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/core/arch/arm/include/arm64.h b/core/arch/arm/include/arm64=
.h
-index 28922631f637..c72b5cd7bbd3 100644
---- a/core/arch/arm/include/arm64.h
-+++ b/core/arch/arm/include/arm64.h
-@@ -452,8 +452,15 @@ static inline __noprof void write_##reg(type val)		=
\
-=20
- DEFINE_U32_REG_READWRITE_FUNCS(cpacr_el1)
- DEFINE_U32_REG_READWRITE_FUNCS(daif)
-+#ifdef __clang__
-+DEFINE_REG_READ_FUNC_(fpcr, uint32_t, S3_3_c4_c4_0)
-+DEFINE_REG_WRITE_FUNC_(fpcr, uint32_t, S3_3_c4_c4_0)
-+DEFINE_REG_READ_FUNC_(fpsr, uint32_t, S3_3_c4_c4_1)
-+DEFINE_REG_WRITE_FUNC_(fpsr, uint32_t, S3_3_c4_c4_1)
-+#else
- DEFINE_U32_REG_READWRITE_FUNCS(fpcr)
- DEFINE_U32_REG_READWRITE_FUNCS(fpsr)
-+#endif
-=20
- DEFINE_U32_REG_READ_FUNC(ctr_el0)
- #define read_ctr() read_ctr_el0()
---=20
-2.39.5
-
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-d=
o-not-use-full-path-to-generate-guard-.patch b/meta-arm/recipes-security/=
optee/optee-os/0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.=
patch
deleted file mode 100644
index 29719b4505b9..000000000000
--- a/meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-do-not-u=
se-full-path-to-generate-guard-.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c8a2a6529dc3ff609281ef4fe5c5bc949c805b5c Mon Sep 17 00:00:00 2001
-From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
-Date: Thu, 6 Jun 2024 11:42:46 +0200
-Subject: [PATCH] checkconf.mk: do not use full path to generate guard sy=
mbol
- in conf.h
-
-The combination of building with -g3 (which emits definitions of all
-defined preprocessor macros to the debug info) and using a full path
-to define the name of this preprocessor guard means that the output is
-not binary reproducible across different build hosts. For example, in
-my Yocto build, the string
-
-  __home_ravi_yocto_tmp_glibc_work_stm32mp135fdk_oe_linux_gnueabi_optee_=
os_stm32mp_3_19_0_stm32mp_r1_1_build_stm32mp135f_dk_include_generated_con=
f_h_
-
-appears in several build artifacts. Another developer or buildbot
-would not build in some /home/ravi/... directory.
-
-In order to increase binary reproducibility, only use the path sans
-the $(out-dir)/ prefix of the conf.h file.
-
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
----
- mk/checkconf.mk | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Upstream-Status: Backport [c8a2a6529dc3ff609281ef4fe5c5bc949c805b5c]
-
-diff --git a/mk/checkconf.mk b/mk/checkconf.mk
-index 449b1c2b8..bb08d6b15 100644
---- a/mk/checkconf.mk
-+++ b/mk/checkconf.mk
-@@ -17,7 +17,8 @@ define check-conf-h
- 	cnf=3D'$(strip $(foreach var,				\
- 		$(call cfg-vars-by-prefix,$1),			\
- 		$(call cfg-make-define,$(var))))';		\
--	guard=3D"_`echo $@ | tr -- -/.+ _`_";			\
-+	guardpath=3D"$(patsubst $(out-dir)/%,%,$@)"		\
-+	guard=3D"_`echo "$${guardpath}" | tr -- -/.+ _`_";	\
- 	mkdir -p $(dir $@);					\
- 	echo "#ifndef $${guard}" >$@.tmp;			\
- 	echo "#define $${guard}" >>$@.tmp;			\
---=20
-2.34.1
-
diff --git a/meta-arm/recipes-security/optee/optee-os/0002-libutils-zlib-=
fix-Clang-warnings.patch b/meta-arm/recipes-security/optee/optee-os/0002-=
libutils-zlib-fix-Clang-warnings.patch
deleted file mode 100644
index fb50fecbd01b..000000000000
--- a/meta-arm/recipes-security/optee/optee-os/0002-libutils-zlib-fix-Cla=
ng-warnings.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 47d5e6cbd61a38d1c31538e6b1775b901273fdec Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Fri, 14 Jun 2024 18:40:53 +0200
-Subject: [PATCH 2/2] libutils, zlib: fix Clang warnings
-
-Clang 18.1.6 reports the following warnings:
-
-   CC      out/arm/ldelf-lib/libutils/isoc/bget_malloc.o
- In file included from lib/libutils/isoc/bget_malloc.c:127:
- lib/libutils/isoc/bget.c:607:7: warning: a function definition without =
a prototype is deprecated in all versions of C and is not supported in C2=
3 [-Wdeprecated-non-prototype]
-   607 | void *bget(requested_align, hdr_size, requested_size, poolset)
-       |       ^
-
-And same with lib/zlib/{adler32.c,inffast.c,inflate.c,zutil.c}.
-
-In addition, zutil.c causes:
-
-  CC      out/arm/core/lib/zlib/zutil.o
-core/lib/zlib/zutil.c:28:33: warning: a function declaration without a p=
rototype is deprecated in all versions of C [-Wstrict-prototypes]
-   28 | const char * ZEXPORT zlibVersion()
-      |                                 ^
-      |                                  void
-
-Add -Wno-deprecated-non-prototype to libutils' bget_malloc.c to silence
-the first series, and simply remove -Wstrict-prototypes (added by
-default by mk/compile.mk) when building zlib.
-
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Joakim Bech <joakim.bech@linaro.org>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-
-Upstream-Status: Backport
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
----
- core/lib/zlib/sub.mk     | 2 ++
- lib/libutils/isoc/sub.mk | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/core/lib/zlib/sub.mk b/core/lib/zlib/sub.mk
-index d4f225dfbfc4..399544d02e20 100644
---- a/core/lib/zlib/sub.mk
-+++ b/core/lib/zlib/sub.mk
-@@ -6,3 +6,5 @@ srcs-y +=3D inftrees.c
- srcs-y +=3D zutil.c
- cflags-remove-y +=3D -Wold-style-definition
- cflags-remove-y +=3D -Wswitch-default
-+cflags-remove-y +=3D -Wstrict-prototypes
-+cflags-y +=3D $(call cc-option,-Wno-deprecated-non-prototype)
-diff --git a/lib/libutils/isoc/sub.mk b/lib/libutils/isoc/sub.mk
-index ef1ca5da8cf0..705090211627 100644
---- a/lib/libutils/isoc/sub.mk
-+++ b/lib/libutils/isoc/sub.mk
-@@ -3,6 +3,7 @@ global-incdirs-y +=3D include
- srcs-y +=3D bget_malloc.c
- cflags-remove-bget_malloc.c-y +=3D -Wold-style-definition -Wredundant-d=
ecls
- cflags-bget_malloc.c-y +=3D -Wno-sign-compare -Wno-cast-align
-+cflags-bget_malloc.c-y +=3D $(call cc-option,-Wno-deprecated-non-protot=
ype)
- ifeq ($(sm),core)
- cflags-remove-bget_malloc.c-y +=3D $(cflags_kasan)
- endif
---=20
-2.39.5
-
diff --git a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.3.0.bb
similarity index 64%
rename from meta-arm/recipes-security/optee/optee-os_4.2.0.bb
rename to meta-arm/recipes-security/optee/optee-os_4.3.0.bb
index 3f00c7b3617f..cfd926b0346b 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.3.0.bb
@@ -4,14 +4,11 @@ DEPENDS +=3D "dtc-native"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-SRCREV =3D "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
+SRCREV =3D "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"
 SRC_URI +=3D " \
     file://0003-optee-enable-clang-support.patch \
-    file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.pat=
ch \
     file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
     file://0001-compile.mk-use-CFLAGS-from-environment.patch \
     file://0002-link.mk-use-CFLAGS-with-version.o.patch \
     file://0003-link.mk-generate-version.o-in-link-out-dir.patch \
-    file://0001-arm64.h-fix-compile-error-with-Clang.patch \
-    file://0002-libutils-zlib-fix-Clang-warnings.patch \
 "
diff --git a/meta-arm/recipes-security/optee/optee-test/0001-xtest-stats-=
remove-unneeded-stat.h-include.patch b/meta-arm/recipes-security/optee/op=
tee-test/0001-xtest-stats-remove-unneeded-stat.h-include.patch
deleted file mode 100644
index 581c6db3cc82..000000000000
--- a/meta-arm/recipes-security/optee/optee-test/0001-xtest-stats-remove-=
unneeded-stat.h-include.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 236ebb968a298fa5d461e734559ad8a13b667eb6 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Wed, 24 Jan 2024 11:35:50 -0500
-Subject: [PATCH] xtest: stats: remove unneeded stat.h include
-
-Hack to work around musl compile error:
-
-| In file included from optee-test/4.1.0/recipe-sysroot/usr/include/sys/=
stat.h:23,
-|                  from optee-test/4.1.0/git/host/xtest/stats.c:17:
-| optee-test/4.1.0/recipe-sysroot/usr/include/bits/stat.h:17:26: error: =
expected identifier or '(' before '[' token
-|    17 |         unsigned __unused[2];
-|       |                          ^
-
-stat.h is not needed, since it is not being used in this file.  So
-removing it.
-
-Upstream-Status: Inappropriate [https://github.com/OP-TEE/optee_test/iss=
ues/722]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
----
- host/xtest/stats.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/host/xtest/stats.c b/host/xtest/stats.c
-index fb16d55586da..05aa3adac611 100644
---- a/host/xtest/stats.c
-+++ b/host/xtest/stats.c
-@@ -14,7 +14,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <sys/stat.h>
- #include <sys/types.h>
- #include <tee_client_api.h>
- #include <unistd.h>
diff --git a/meta-arm/recipes-security/optee/optee-test_4.2.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.3.0.bb
similarity index 78%
rename from meta-arm/recipes-security/optee/optee-test_4.2.0.bb
rename to meta-arm/recipes-security/optee/optee-test_4.3.0.bb
index 6317a72f0b1b..44846fef2d89 100644
--- a/meta-arm/recipes-security/optee/optee-test_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_4.3.0.bb
@@ -1,7 +1,7 @@
 require recipes-security/optee/optee-test.inc
=20
-SRCREV =3D "526d5bac1b65f907f67c05cd07beca72fbab88dd"
-SRC_URI +=3D "file://0001-xtest-stats-remove-unneeded-stat.h-include.pat=
ch"
+SRCREV =3D "9d4c4fb9638fb533211037016b6da12fbbcc4bb6"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560"
=20
 # Include ffa_spmc test group if the SPMC test is enabled.
 # Supported after op-tee v3.20
--=20
2.39.5 (Apple Git-154)


