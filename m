Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBACBC52D71
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 18:25:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2485.1722623136028083766
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Aug 2024 11:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61466DA7
	for <meta-arm@lists.yoctoproject.org>; Fri,  2 Aug 2024 11:26:01 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC2C53F766
	for <meta-arm@lists.yoctoproject.org>; Fri,  2 Aug 2024 11:25:34 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm-bsp: remove unreferenced patches and configs
Date: Fri,  2 Aug 2024 14:25:24 -0400
Message-Id: <20240802182525.80611-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240802182525.80611-1-jon.mason@arm.com>
References: <20240802182525.80611-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Aug 2024 18:25:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5949

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../files/rwx-segments.patch                  | 45 -------------------
 .../tf-a-tests-no-warn-rwx-segments.patch     | 33 --------------
 .../recipes-bsp/u-boot/u-boot/tc/bootargs.cfg |  3 --
 .../bsp/arm-platforms/arm64.cfg               | 17 -------
 .../arm-platforms/fvp-common-peripherals.cfg  |  8 ----
 .../0003-optee-enable-clang-support.patch     | 29 ------------
 6 files changed, 135 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/rwx=
-segments.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tf-=
a-tests-no-warn-rwx-segments.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/bootargs.cf=
g
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/arm64.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/fvp-common-peripherals.cfg
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os/0003-opt=
ee-enable-clang-support.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segmen=
ts.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments=
.patch
deleted file mode 100644
index 403381c9d6ce..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/rwx-segments.patc=
h
+++ /dev/null
@@ -1,45 +0,0 @@
-From 051c723a6463a579b05dcaa81f204516737a3645 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 9 Aug 2023 15:56:03 -0400
-Subject: [PATCH] Binutils 2.39 now warns when a segment has RXW
- permissions[1]:
-
-aarch64-none-elf-ld.bfd: warning: bl31.elf has a LOAD segment with RWX
-permissions
-
-However, TF-A passes --fatal-warnings to LD, so this is a build failure.
-
-There is a ticket filed upstream[2], so until that is resolved just
-remove --fatal-warnings.
-
-[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dba95=
1afb99912da01a6e8434126b8fac7aa75107
-[2] https://developer.trustedfirmware.org/T996
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 1ddb7b84417d..9eae30c923ec 100644
---- a/Makefile
-+++ b/Makefile
-@@ -425,7 +425,7 @@ TF_LDFLAGS		+=3D	$(TF_LDFLAGS_$(ARCH))
- # LD =3D gcc (used when GCC LTO is enabled)
- else ifneq ($(findstring gcc,$(notdir $(LD))),)
- # Pass ld options with Wl or Xlinker switches
--TF_LDFLAGS		+=3D	-Wl,--fatal-warnings -O1
-+TF_LDFLAGS		+=3D	-O1
- TF_LDFLAGS		+=3D	-Wl,--gc-sections
- ifeq ($(ENABLE_LTO),1)
- 	ifeq (${ARCH},aarch64)
-@@ -442,7 +442,7 @@ TF_LDFLAGS		+=3D	$(subst --,-Xlinker --,$(TF_LDFLAGS=
_$(ARCH)))
-=20
- # LD =3D gcc-ld (ld) or llvm-ld (ld.lld) or other
- else
--TF_LDFLAGS		+=3D	--fatal-warnings -O1
-+TF_LDFLAGS		+=3D	-O1
- TF_LDFLAGS		+=3D	--gc-sections
- # ld.lld doesn't recognize the errata flags,
- # therefore don't add those in that case
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tf-a-tests=
-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a=
/files/tf-a-tests-no-warn-rwx-segments.patch
deleted file mode 100644
index 0193e8cc414b..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tf-a-tests-no-war=
n-rwx-segments.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6635341615a5bcb36ce71479ee30dae1599081e2 Mon Sep 17 00:00:00 2001
-From: Anton Antonov <anrton.antonov@arm.com>
-Date: Wed, 9 Aug 2023 15:56:03 -0400
-Subject: [PATCH] Binutils 2.39 now warns when a segment has RXW
- permissions[1]:
-
-aarch64-poky-linux-musl-ld: tftf.elf has a LOAD segment with RWX permiss=
ions
-
-There is a ticket filed upstream[2], so until that is resolved just
-disable the warning
-
-[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dba95=
1afb99912da01a6e8434126b8fac7aa75107
-[2] https://developer.trustedfirmware.org/T996
-
-Upstream-Status: Inappropriate
-Signed-off-by: Anton Antonov <anrton.antonov@arm.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 286a47c7d454..3481187b62cf 100644
---- a/Makefile
-+++ b/Makefile
-@@ -246,7 +246,7 @@ TFTF_SOURCES		:=3D ${FRAMEWORK_SOURCES}	${TESTS_SOUR=
CES} ${PLAT_SOURCES} ${LIBC_SR
- TFTF_INCLUDES		+=3D ${PLAT_INCLUDES}
- TFTF_CFLAGS		+=3D ${COMMON_CFLAGS}
- TFTF_ASFLAGS		+=3D ${COMMON_ASFLAGS}
--TFTF_LDFLAGS		+=3D ${COMMON_LDFLAGS}
-+TFTF_LDFLAGS		+=3D ${COMMON_LDFLAGS} --no-warn-rwx-segments
- TFTF_EXTRA_OBJS 	:=3D
-=20
- ifneq (${BP_OPTION},none)
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/bootargs.cfg b/met=
a-arm-bsp/recipes-bsp/u-boot/u-boot/tc/bootargs.cfg
deleted file mode 100644
index 2bfd403f5b3b..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/bootargs.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_USE_BOOTARGS=3Dy
-CONFIG_BOOTARGS=3D"console=3DttyAMA0 debug earlycon=3Dpl011,0x7ff80000"
-CONFIG_BOOTDELAY=3D0
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/arm64.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-k=
meta/bsp/arm-platforms/arm64.cfg
deleted file mode 100644
index 62c023878633..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/arm64.cfg
+++ /dev/null
@@ -1,17 +0,0 @@
-# SPDX-License-Identifier: MIT
-#
-# ARM64
-#
-CONFIG_ARM64=3Dy
-CONFIG_64BIT=3Dy
-CONFIG_ARCH_VEXPRESS=3Dy
-
-#
-# Bus support
-#
-CONFIG_ARM_AMBA=3Dy
-
-#
-# Bus devices
-#
-CONFIG_VEXPRESS_CONFIG=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp-common-peripherals.cfg b/meta-arm-bsp/recipes-kernel/linu=
x/arm-platforms-kmeta/bsp/arm-platforms/fvp-common-peripherals.cfg
deleted file mode 100644
index ecb3cc9da44f..000000000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-common-peripherals.cfg
+++ /dev/null
@@ -1,8 +0,0 @@
-# SPDX-License-Identifier: MIT
-CONFIG_SERIAL_AMBA_PL011=3Dy
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
-
-CONFIG_ARM_SP805_WATCHDOG=3Dy
-
-CONFIG_RTC_CLASS=3Dy
-CONFIG_RTC_DRV_PL031=3Dy
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enab=
le-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee-os/000=
3-optee-enable-clang-support.patch
deleted file mode 100644
index 4718c36d5da1..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enable-clan=
g-support.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1cd944e1953a8665db9019faddc8e7dc31ca20fa Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Wed, 23 Sep 2020 09:27:34 +0100
-Subject: [PATCH] optee: enable clang support
-
-When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
-to provide a sysroot wasn't included, which results in not locating
-compiler-rt. This is mitigated by including the variable as ammended.
-
-Upstream-Status: Pending
-ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- mk/clang.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk/clang.mk b/mk/clang.mk
-index a045beee8482..1ebe2f702dcd 100644
---- a/mk/clang.mk
-+++ b/mk/clang.mk
-@@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
-=20
- # Note, use the compiler runtime library (libclang_rt.builtins.*.a) ins=
tead of
- # libgcc for clang
--libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(a=
rch-bits-$(sm))) \
- 			-rtlib=3Dcompiler-rt -print-libgcc-file-name 2> /dev/null)
-=20
- # Core ASLR relies on the executable being ready to run from its prefer=
red load
--=20
2.39.3 (Apple Git-146)


