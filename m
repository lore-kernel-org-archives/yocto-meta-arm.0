Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.16807.1594637290259515247
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jul 2020 03:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=I6mT7/lg;
 spf=pass (domain: burtonini.com, ip: 209.85.221.67, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f67.google.com with SMTP id o11so15818557wrv.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Jul 2020 03:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1dAlPDxmbos8v4t5vc7zt+LqZmOvoAQQPmU3avWY9m8=;
        b=I6mT7/lgcZEXEjk3dgtLLQcc3MxwF+B2g3S6V3nOrM3Dz6Sr5Mg12luqpfDJtxw7+U
         C+Q+scA8TcpWllbU1NcPRFpnXmCgK6wN1dOisbeBKgLnpWyxgJ4iZb9oqUnHKCNbPkjf
         LoiKfq3IZwCa8Tjlu0G01DFa2T3wrnj9qcJwiu2KpnnQGuz5N3aftfchSZww5iAFXYl7
         SKWF5DabuirWld4FyOQZe1ulx15xzekfrcU4U9nEVhSULYEhzIh4oWK3F8BsFdnL69IB
         RktdASVjBajJ26ROWMBoms6wBmRp+sL0V8lcEr9TgYyyfM+afdQ+PkqCPiO1gAFM37ZP
         Kt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1dAlPDxmbos8v4t5vc7zt+LqZmOvoAQQPmU3avWY9m8=;
        b=CSMPzvo8oCTGDGlh6KOZZCCbgp6nw6LqzDurBg2d6l96OmZNlrIAPI9l+ZvC0Ej3yi
         oc1adn6ecIo2u2pL0ZIEfFC8o38G4VNzLj8aFcOXHOsqpcXpgrKa89qm5B/jxKstmdDy
         rDonzJu/KctDfyWPQcBw/n0Qc5eYCCf0dvIKj8wCAA0Ixxn5wz4Bnr3kKVBvglg36VTx
         B5XNAfhtT4QNFIpOj6+0qwsxwj0D9gHO02xMDga5BHeHqVrjD3h4PYCzu6a/0K+qSXra
         cNliThLpISvGhUZpYkDaarvt0FxK6w+88CDGV6fTMjPeGWJWNwDM3Vvpsym/iOkFjJPm
         iA5w==
X-Gm-Message-State: AOAM532DW6rPKopkChw/bT3h29Kt7qorbo8BKNogti/r1w2oFixFgJIA
	lefMuA6RTWil0hHM47+b3S2U5mb1dy8=
X-Google-Smtp-Source: ABdhPJzEDeE2OWOKIe2ULCpEq95Y68vxNRhi8+pOf+VgOTU3hXufhj8GgZPDpMwalI0STaNiup/elQ==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr52918269wra.150.1594637288352;
        Mon, 13 Jul 2020 03:48:08 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id y16sm23890747wro.71.2020.07.13.03.48.07
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 03:48:07 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/edk2-firmware: merge the .bb/.inc files
Date: Mon, 13 Jul 2020 11:48:03 +0100
Message-Id: <20200713104804.174263-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

There is no reason to split this recipe between two files, so merge them.

Change-Id: I130cfb0ef78baa3117d5683d4732bc9b86798869
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   | 84 -------------------
 .../recipes-bsp/uefi/edk2-firmware_git.bb     | 84 ++++++++++++++++++-
 2 files changed, 83 insertions(+), 85 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware.inc

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
deleted file mode 100644
index 6696768..0000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ /dev/null
@@ -1,84 +0,0 @@
-SUMMARY = "UEFI EDK2 Firmware"
-
-PROVIDES += "virtual/uefi-firmware"
-
-EDK2_BUILD_RELEASE   ?= "0"
-EDK2_PLATFORM        ?= "invalid"
-EDK2_PLATFORM_DSC    ?= ""
-EDK2_BIN_NAME        ?= ""
-EDK2_ARCH            ?= ""
-
-EDK2_BUILD_MODE = "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
-
-DEPENDS += "util-linux-native iasl-native"
-
-inherit python3native
-inherit deploy
-
-B = "${WORKDIR}/build"
-S = "${WORKDIR}/git"
-
-COMPATIBLE_MACHINE ?= "invalid"
-
-LDFLAGS[unexport] = "1"
-
-# No configure
-do_configure[noexec] = "1"
-
-# Set variables as per envsetup
-export GCC5_AARCH64_PREFIX = "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}"
-export PACKAGES_PATH       = "${S}/edk2:${S}/edk2/edk2-platforms"
-export WORKSPACE           = "${S}/edk2"
-export EDK_TOOLS_PATH      = "${WORKSPACE}/BaseTools"
-export PYTHON_COMMAND      = "${PYTHON}"
-export CONF_PATH           = "${WORKSPACE}/Conf"
-
-export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
-
-python __anonymous() {
-    # If GCC Version is greater than 4 then pass GCC5
-    # set GCC5 by default
-    d.setVar('GCC_VER', 'GCC5')
-
-    # Otherwise pass the corresponding version
-    G = d.getVar('GCCVERSION',True).split(".")
-    gcc_vlist = ['1', '2', '3', '4']
-    if G[0] in gcc_vlist:
-        d.setVar('GCC_VER', 'GCC'+G[0])
-}
-
-do_compile() {
-    sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile
-    sed -i -e 's: -luuid: -luuid ${BUILD_LDFLAGS}:g' ${EDK_TOOLS_PATH}/Source/C/*/GNUmakefile
-
-    # Copy the templates as we don't run envsetup
-    cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${WORKSPACE}/Conf/build_rule.txt
-    cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${WORKSPACE}/Conf/tools_def.txt
-    cp ${EDK_TOOLS_PATH}/Conf/target.template ${WORKSPACE}/Conf/target.txt
-
-    # Build basetools
-    oe_runmake -C ${S}/edk2/BaseTools
-
-    PATH="${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
-    "${S}/edk2/BaseTools/BinWrappers/PosixLike/build" \
-       -a "${EDK2_ARCH}" \
-       -b ${EDK2_BUILD_MODE} \
-       -t ${GCC_VER} \
-       -p "${S}/edk2/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
-}
-
-do_install() {
-    install -d ${D}/firmware
-    install "${S}/edk2/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_VER}/FV/${EDK2_BIN_NAME}" "${D}/firmware/uefi.bin"
-}
-
-FILES_${PN} = "/firmware"
-SYSROOT_DIRS += "/firmware"
-# Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP_${PN} = "textrel"
-
-do_deploy() {
-    # Copy the images to deploy directory
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
index 4aadc3c..350af79 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -1,8 +1,11 @@
+SUMMARY = "UEFI EDK2 Firmware"
 DESCRIPTION = "UEFI EDK2 Firmware for Arm reference platforms"
 HOMEPAGE = "https://github.com/tianocore/edk2"
 
 LICENSE = "BSD-2-Clause-Patent"
 
+PROVIDES += "virtual/uefi-firmware"
+
 # EDK2
 LIC_FILES_CHKSUM = "file://edk2/License.txt;md5=2b415520383f7964e96700ae12b4570a"
 # EDK2 Platforms
@@ -16,4 +19,83 @@ SRCREV_edk2           ?= "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
 SRCREV_edk2-platforms ?= "ed4cc8059ec551032f0d8b8c172e9ec19214a638"
 SRCREV_FORMAT         = "edk2_edk2-platforms"
 
-require edk2-firmware.inc
+EDK2_BUILD_RELEASE   ?= "0"
+EDK2_PLATFORM        ?= "invalid"
+EDK2_PLATFORM_DSC    ?= ""
+EDK2_BIN_NAME        ?= ""
+EDK2_ARCH            ?= ""
+
+EDK2_BUILD_MODE = "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
+
+DEPENDS += "util-linux-native iasl-native"
+
+inherit python3native
+inherit deploy
+
+B = "${WORKDIR}/build"
+S = "${WORKDIR}/git"
+
+COMPATIBLE_MACHINE ?= "invalid"
+
+LDFLAGS[unexport] = "1"
+
+# No configure
+do_configure[noexec] = "1"
+
+# Set variables as per envsetup
+export GCC5_AARCH64_PREFIX = "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}"
+export PACKAGES_PATH       = "${S}/edk2:${S}/edk2/edk2-platforms"
+export WORKSPACE           = "${S}/edk2"
+export EDK_TOOLS_PATH      = "${WORKSPACE}/BaseTools"
+export PYTHON_COMMAND      = "${PYTHON}"
+export CONF_PATH           = "${WORKSPACE}/Conf"
+
+export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
+
+python __anonymous() {
+    # If GCC Version is greater than 4 then pass GCC5
+    # set GCC5 by default
+    d.setVar('GCC_VER', 'GCC5')
+
+    # Otherwise pass the corresponding version
+    G = d.getVar('GCCVERSION',True).split(".")
+    gcc_vlist = ['1', '2', '3', '4']
+    if G[0] in gcc_vlist:
+        d.setVar('GCC_VER', 'GCC'+G[0])
+}
+
+do_compile() {
+    sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile
+    sed -i -e 's: -luuid: -luuid ${BUILD_LDFLAGS}:g' ${EDK_TOOLS_PATH}/Source/C/*/GNUmakefile
+
+    # Copy the templates as we don't run envsetup
+    cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${WORKSPACE}/Conf/build_rule.txt
+    cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${WORKSPACE}/Conf/tools_def.txt
+    cp ${EDK_TOOLS_PATH}/Conf/target.template ${WORKSPACE}/Conf/target.txt
+
+    # Build basetools
+    oe_runmake -C ${S}/edk2/BaseTools
+
+    PATH="${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
+    "${S}/edk2/BaseTools/BinWrappers/PosixLike/build" \
+       -a "${EDK2_ARCH}" \
+       -b ${EDK2_BUILD_MODE} \
+       -t ${GCC_VER} \
+       -p "${S}/edk2/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
+}
+
+do_install() {
+    install -d ${D}/firmware
+    install "${S}/edk2/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_VER}/FV/${EDK2_BIN_NAME}" "${D}/firmware/uefi.bin"
+}
+
+FILES_${PN} = "/firmware"
+SYSROOT_DIRS += "/firmware"
+# Skip QA check for relocations in .text of elf binaries
+INSANE_SKIP_${PN} = "textrel"
+
+do_deploy() {
+    # Copy the images to deploy directory
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
-- 
2.26.2

