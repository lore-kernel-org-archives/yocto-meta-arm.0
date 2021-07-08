Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8830.1625729847099709157
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Jul 2021 00:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: huifeng.zhang@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 001C331B;
	Thu,  8 Jul 2021 00:37:26 -0700 (PDT)
Received: from huifeng-optiplex7070.shanghai.arm.com (huifeng-optiplex7070.shanghai.arm.com [10.169.188.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A23463F694;
	Thu,  8 Jul 2021 00:37:23 -0700 (PDT)
From: huifeng.zhang@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	wei.chen@arm.com,
	robbie.cao@arm.com,
	jaxson.han@arm.com,
	qi.feng@arm.com,
	Huifeng Zhang <Huifeng.Zhang@arm.com>
Subject: [PATCH] arm-bsp/boot-wrapper-aarch64: Enable SMP support for fvp-baser-aemv8r64
Date: Thu,  8 Jul 2021 15:35:58 +0800
Message-Id: <20210708073558.1770062-1-Huifeng.Zhang@arm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Downstream patch "Allow --enable-psci to choose between smc and hvc"
from boot-wrapper-aarch64. With this patch, kernel can bring up
secondary core successfully through hvc call.

Issue-Id: SCM-2949
Signed-off-by: Huifeng Zhang <Huifeng.Zhang@arm.com>
Change-Id: Iecc99d925317ab7981284671cb8cc4ef1894e6d6
---
 .../documentation/fvp-baser-aemv8r64.md       |  7 --
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |  3 +-
 ...e-psci-to-choose-between-smc-and-hvc.patch | 83 +++++++++++++++++++
 3 files changed, 85 insertions(+), 8 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0003-Allow-enable-psci-to-choose-between-smc-and-hvc.pa=
tch

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index fc56def..580e890 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -153,10 +153,3 @@ Devices supported in the kernel
 - virtio network
 - watchdog
 - rtc
-
-
-Devices not supported or not functional
----------------------------------------
-
-- Only one CPU since SMP is not functional in boot-wrapper-aarch64 yet
-
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-a=
arch64-fvp-baser-aemv8r64.inc b/meta-arm-bsp/recipes-bsp/boot-wrapper-aar=
ch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
index 7fbba3e..bd8e993 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-=
fvp-baser-aemv8r64.inc
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-=
fvp-baser-aemv8r64.inc
@@ -4,11 +4,12 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files/${MACHIN=
E}:"
 SRC_URI_append =3D " \
     file://0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch \
     file://0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch \
+    file://0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch \
     "
=20
 BOOT_WRAPPER_AARCH64_CMDLINE =3D "\
 earlycon console=3DttyAMA0 loglevel=3D8 rootfstype=3Dext4 root=3D/dev/vd=
a1 rw"
=20
-EXTRA_OECONF_remove =3D "--enable-psci"
+EXTRA_OECONF +=3D "--enable-psci=3Dhvc"
=20
 TUNE_CCARGS =3D ""
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch b/m=
eta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/000=
3-Allow-enable-psci-to-choose-between-smc-and-hvc.patch
new file mode 100644
index 0000000..fcd77b7
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch
@@ -0,0 +1,83 @@
+From 5120127e5f767b44a087c741a3438cef1e22ed50 Mon Sep 17 00:00:00 2001
+From: Qi Feng <qi.feng@arm.com>
+Date: Wed, 26 May 2021 17:52:01 +0800
+Subject: [PATCH] Allow --enable-psci to choose between smc and hvc
+
+According to Armv8-R AArch64 manual [1], Armv8-R AArch64 does not
+support smc:
+
+- Pseudocode for AArch64.CheckForSMCUndefOrTrap has this snippet:
+
+      if !HaveEL(EL3) || PSTATE.EL =3D=3D EL0 then
+          UNDEFINED;
+
+  And Armv8-R AArch64 does not have EL3.
+
+- In the document of HCR_EL2 TSC bit:
+  If EL3 is not implemented and HCR_EL2.NV is 0, it is IMPLEMENTATION
+  DEFINED whether this bit is:
+  - RES0.
+  - Implemented with the functionality as described in HCR_EL2.TSC.
+
+So hvc is needed in this situation. And due to the lack of libfdt, the
+psci method cannot be modified at runtime.
+
+To use smc, use --enable-psci or --enable-psci=3Dsmc.
+To use hvc, use --enable-psci=3Dhvc.
+
+[1]: https://developer.arm.com/documentation/ddi0600/latest/
+
+Issue-Id: SCM-2654
+Signed-off-by: Qi Feng <qi.feng@arm.com>
+Change-Id: Ib8afabdad2d98bc37371d165bbb6f1f9b88bfc87
+
+Upstream-Status: Pending
+Signed-off-by: Huifeng Zhang <Huifeng.Zhang@arm.com>
+---
+ Makefile.am  |  2 +-
+ configure.ac | 14 +++++++++-----
+ 2 files changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ef6b793..a9ddd16 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -47,7 +47,7 @@ BOOTMETHOD	:=3D psci.o
+ OFILES		+=3D psci.o
+ PSCI_NODE	:=3D psci {				\
+ 			compatible =3D \"arm,psci\";	\
+-			method =3D \"smc\";		\
++			method =3D \"$(PSCI_METHOD)\";	\
+ 			cpu_on =3D <$(PSCI_CPU_ON)>;	\
+ 			cpu_off =3D <$(PSCI_CPU_OFF)>;	\
+ 		   };
+diff --git a/configure.ac b/configure.ac
+index 6914eb4..9aab4a1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -83,13 +83,17 @@ AS_IF([test "x$X_IMAGE" !=3D "x"],
+ # Allow a user to pass --enable-psci
+ AC_ARG_ENABLE([psci],
+ 	AS_HELP_STRING([--enable-psci], [enable the psci boot method]),
+-	[USE_PSCI=3D$enableval])
+-AM_CONDITIONAL([PSCI], [test "x$USE_PSCI" =3D "xyes"])
+-AS_IF([test "x$USE_PSCI" =3D "xyes"], [], [USE_PSCI=3Dno])
+-
+-AS_IF([test "x$USE_PSCI" !=3D "xyes" -a "x$KERNEL_ES" =3D "x32"],
++	[case "${enableval}" in
++		yes|smc) USE_PSCI=3Dsmc ;;
++		hvc) USE_PSCI=3Dhvc ;;
++		*) AC_MSG_ERROR([Bad value "${enableval}" for --enable-psci. Use "smc=
" or "hvc"]) ;;
++	esac])
++AM_CONDITIONAL([PSCI], [test "x$USE_PSCI" =3D "xyes" -o "x$USE_PSCI" =3D=
 "xsmc" -o "x$USE_PSCI" =3D "xhvc"])
++
++AS_IF([test "x$USE_PSCI" =3D "xno" -a "x$KERNEL_ES" =3D "x32"],
+ 	[AC_MSG_ERROR([With an AArch32 kernel, boot method must be PSCI.])]
+ )
++AC_SUBST([PSCI_METHOD], [$USE_PSCI])
+=20
+ # Allow a user to pass --with-initrd
+ AC_ARG_WITH([initrd],
+--=20
+2.32.0
+
--=20
2.32.0

