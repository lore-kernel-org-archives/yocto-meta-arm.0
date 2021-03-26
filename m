Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12149.1616764555940754533
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 06:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75912143D
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 06:15:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FE3C3F7D7
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 06:15:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/trusted-firmware-a: remove unused trusted-firmware-a 2.2
Date: Fri, 26 Mar 2021 13:15:46 +0000
Message-Id: <20210326131547.3093762-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326131547.3093762-1-ross.burton@arm.com>
References: <20210326131547.3093762-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: If2c92878e63614cfc91cf500a11fe39e5a82fe46
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a_2.2.bbappend           |  5 --
 ...compiler-rt-builtins-when-32-bit-2-2.patch | 54 -------------------
 .../trusted-firmware-a_2.2.bb                 | 33 ------------
 3 files changed, 92 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.2.bbappend
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-2.2/0001-make-link-compiler-rt-builtins-when-32-bit-2-2.patch
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.2.bb

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.2.bbappend
deleted file mode 100644
index 3c7460f..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.=
bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Machine specific TFAs
-
-MACHINE_TFA_REQUIRE ?=3D ""
-
-require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2=
.2/0001-make-link-compiler-rt-builtins-when-32-bit-2-2.patch b/meta-arm/r=
ecipes-bsp/trusted-firmware-a/trusted-firmware-a-2.2/0001-make-link-compi=
ler-rt-builtins-when-32-bit-2-2.patch
deleted file mode 100644
index 16bfcf1..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2.2/0001=
-make-link-compiler-rt-builtins-when-32-bit-2-2.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f2855c0957ded1af279724c1a82c3e381cc036f9 Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Fri, 27 Nov 2020 10:12:07 +0000
-Subject: [PATCH 3/3] make: link compiler-rt builtins when 32-bit
-
-Compiler-rt builtins weren't previously linked when using
-GNU ld to link for aarch32; this is now explicitly linked
-in.
-
-For use with TFA 2.2
-
-Upstream-Status: Pending
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- Makefile                     | 9 +++++++++
- make_helpers/build_macros.mk | 2 +-
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 721246d51..5bf8e9a11 100644
---- a/Makefile
-+++ b/Makefile
-@@ -204,6 +204,15 @@ LD			=3D	$(LINKER)
- AS			=3D	$(CC) -c -x assembler-with-cpp $(TF_CFLAGS_$(ARCH))
- CPP			=3D	$(CC) -E
- PP			=3D	$(CC) -E
-+
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
-+
- else
- TF_CFLAGS_aarch32	=3D	$(march32-directive)
- TF_CFLAGS_aarch64	=3D	$(march64-directive)
-diff --git a/make_helpers/build_macros.mk b/make_helpers/build_macros.mk
-index b89d87ea6..1ff345336 100644
---- a/make_helpers/build_macros.mk
-+++ b/make_helpers/build_macros.mk
-@@ -436,7 +436,7 @@ ifneq ($(findstring armlink,$(notdir $(LD))),)
- else
- 	$$(Q)$$(LD) -o $$@ $$(TF_LDFLAGS) $$(LDFLAGS) -Map=3D$(MAPFILE) \
- 		--script $(LINKERFILE) $(BUILD_DIR)/build_message.o \
--		$(OBJS) $(LDPATHS) $(LIBWRAPPER) $(LDLIBS) $(BL_LIBS)
-+		$(OBJS) $(LDPATHS) $(LIBWRAPPER) $(LDLIBS) $(BL_LIBS) $(RUNTIME_LIB)
- endif
- ifeq ($(DISABLE_BIN_GENERATION),1)
- 	@${ECHO_BLANK_LINE}
---=20
-2.17.1
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
deleted file mode 100644
index f4deebb..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-#
-# Trusted firmware-A 2.2
-#
-
-require trusted-firmware-a.inc
-
-# Use TF-A for version
-SRCREV_FORMAT =3D "tfa"
-
-# TF-A v2.2
-SRCREV_tfa =3D "7192b956bde11652a835eee0724dca0e403fee90"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
-
-#
-# mbed TLS source
-# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
-#
-
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.16"
-
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BP}:"
-SRC_URI +=3D " \
-    file://0001-make-link-compiler-rt-builtins-when-32-bit-2-2.patch \
-    "
-
-# mbed TLS v2.16.2
-SRCREV_mbedtls =3D "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D " \
-    file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
-    file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
-    "
--=20
2.25.1

