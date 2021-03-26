Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12391.1616764556362033641
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 06:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E0291476
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 06:15:56 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A713C3F7D7
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 06:15:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/trusted-firmware-a: remove unused trusted-firmware-a 2.3
Date: Fri, 26 Mar 2021 13:15:47 +0000
Message-Id: <20210326131547.3093762-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326131547.3093762-1-ross.burton@arm.com>
References: <20210326131547.3093762-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ifb0bed130a6db8146f37a866385727805e00cd43
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a_2.3.bbappend           |  5 --
 ...-a5ds-Fix-for-the-system-timer-issue.patch | 34 ------------
 ...compiler-rt-builtins-when-32-bit-2-3.patch | 52 -------------------
 .../trusted-firmware-a_2.3.bb                 | 35 -------------
 4 files changed, 126 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.3.bbappend
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fd=
ts-a5ds-Fix-for-the-system-timer-issue.patch
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-2.3/0001-make-link-compiler-rt-builtins-when-32-bit-2-3.patch
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.3.bb

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.3.bbappend
deleted file mode 100644
index 3c7460f..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Machine specific TFAs
-
-MACHINE_TFA_REQUIRE ?=3D ""
-
-require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fdts-a5ds=
-Fix-for-the-system-timer-issue.patch b/meta-arm/recipes-bsp/trusted-firm=
ware-a/files/0001-fdts-a5ds-Fix-for-the-system-timer-issue.patch
deleted file mode 100644
index 212eacd..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fdts-a5ds-Fix-fo=
r-the-system-timer-issue.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Backport [e3c152d1156af8a4b6453376454ecdceaf81704c]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From e3c152d1156af8a4b6453376454ecdceaf81704c Mon Sep 17 00:00:00 2001
-From: lakshmi Kailasanathan <lakshmi.Kailasanathan@arm.com>
-Date: Fri, 17 Apr 2020 12:52:19 +0100
-Subject: [PATCH] fdts: a5ds: Fix for the system timer issue.
-
-A5DS FPGA system timer clock frequency is 7.5Mhz.
-The dt is file updated inline with the hardware
-clock frequency.
-
-Change-Id: I3f6c2e0d4a7b293175a42cf398a8730448504af9
-Signed-off-by: lakshmi Kailasanathan <lakshmi.Kailasanathan@arm.com>
----
- fdts/a5ds.dts | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/fdts/a5ds.dts b/fdts/a5ds.dts
-index 7334c4559..c6f5be6fa 100644
---- a/fdts/a5ds.dts
-+++ b/fdts/a5ds.dts
-@@ -128,7 +128,7 @@
- 		#size-cells =3D <1>;
- 		ranges;
- 		reg =3D <0x1a040000 0x1000>;
--		clock-frequency =3D <50000000>;
-+		clock-frequency =3D <7500000>;
-=20
- 		frame@1a050000 {
- 			frame-number =3D <0>;
---=20
-2.17.1
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2=
.3/0001-make-link-compiler-rt-builtins-when-32-bit-2-3.patch b/meta-arm/r=
ecipes-bsp/trusted-firmware-a/trusted-firmware-a-2.3/0001-make-link-compi=
ler-rt-builtins-when-32-bit-2-3.patch
deleted file mode 100644
index 1c01865..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2.3/0001=
-make-link-compiler-rt-builtins-when-32-bit-2-3.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 39d139a56c54856a718218e30114f732188832ea Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Fri, 27 Nov 2020 14:41:43 +0000
-Subject: [PATCH] make: link compiler-rt builtins when 32-bit
-
-Compiler-rt builtins weren't previously linked when using
-GNU ld to link for aarch32; this is now explicitly linked
-in.
-
-For use with TFA 2.3
-
-Upstream-Status: Pending
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- Makefile                     | 7 +++++++
- make_helpers/build_macros.mk | 2 +-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index f01a9ae3e..493b80b14 100644
---- a/Makefile
-+++ b/Makefile
-@@ -243,6 +243,13 @@ endif
- AS			=3D	$(CC) -c -x assembler-with-cpp $(TF_CFLAGS_$(ARCH))
- CPP			=3D	$(CC) -E
- PP			=3D	$(CC) -E
-+ifeq (${ARCH},aarch32)
-+RUNTIME_LIB             =3D       $(shell $(CC) --sysroot=3D$(RUNTIME_S=
YSROOT) \
-+                                              $(shell sed 's/none/linux=
/' <<< '$(target32-directive)') \
-+                                              -mfloat-abi=3D$(TARGET_FP=
U) \
-+                                              -rtlib=3Dcompiler-rt \
-+                                              -print-libgcc-file-name 2=
> /dev/null)
-+endif
- else ifneq ($(findstring gcc,$(notdir $(CC))),)
- TF_CFLAGS_aarch32	=3D	$(march32-directive)
- TF_CFLAGS_aarch64	=3D	$(march64-directive)
-diff --git a/make_helpers/build_macros.mk b/make_helpers/build_macros.mk
-index 1c3d14d05..2a1abd4fe 100644
---- a/make_helpers/build_macros.mk
-+++ b/make_helpers/build_macros.mk
-@@ -482,7 +482,7 @@ ifneq ($(findstring armlink,$(notdir $(LD))),)
- else ifneq ($(findstring gcc,$(notdir $(LD))),)
- 	$$(Q)$$(LD) -o $$@ $$(TF_LDFLAGS) $$(LDFLAGS) -Wl,-Map=3D$(MAPFILE) \
- 		-Wl,-T$(LINKERFILE) $(BUILD_DIR)/build_message.o \
--		$(OBJS) $(LDPATHS) $(LIBWRAPPER) $(LDLIBS) $(BL_LIBS)
-+		$(OBJS) $(LDPATHS) $(LIBWRAPPER) $(LDLIBS) $(BL_LIBS) $(RUNTIME_LIB)
- else
- 	$$(Q)$$(LD) -o $$@ $$(TF_LDFLAGS) $$(LDFLAGS) $(BL_LDFLAGS) -Map=3D$(M=
APFILE) \
- 		--script $(LINKERFILE) $(BUILD_DIR)/build_message.o \
---=20
-2.17.1
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
deleted file mode 100644
index ad95fa2..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-#
-# Trusted firmware-A 2.3
-#
-
-require trusted-firmware-a.inc
-
-# Use TF-A for version
-SRCREV_FORMAT =3D "tfa"
-
-# TF-A v2.3
-SRCREV_tfa =3D "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
-
-SRC_URI +=3D "file://0001-fdts-a5ds-Fix-for-the-system-timer-issue.patch=
"
-
-#
-# mbed TLS source
-# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
-#
-
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.18"
-
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BP}:"
-SRC_URI +=3D " \
-    file://0001-make-link-compiler-rt-builtins-when-32-bit-2-3.patch \
-    "
-
-# mbed TLS v2.18.1
-SRCREV_mbedtls =3D "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D " \
-    file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
-    file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
-    "
--=20
2.25.1

