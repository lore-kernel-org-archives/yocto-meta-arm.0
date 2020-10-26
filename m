Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10420.1603704737947770225
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 02:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D2B7113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 297413F719
	for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 02:32:16 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/8] arm/edk2-firmware: set GCC_VER appropriately with meta-clang
Date: Mon, 26 Oct 2020 09:32:07 +0000
Message-Id: <20201026093212.1532587-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026093212.1532587-1-ross.burton@arm.com>
References: <20201026093212.1532587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Also as this isn't actually GCC-specific, rename the variable to
EDK_COMPILER.

Change-Id: I617f5da642c10decd83124e160b06579c46405ba
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index f3fb491..d6f6af1 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -56,7 +56,8 @@ export CONF_PATH           =3D "${S}/Conf"
=20
 export BTOOLS_PATH =3D "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
=20
-GCC_VER ?=3D "GCC5"
+EDK_COMPILER ?=3D "GCC5"
+EDK_COMPILER_toolchain-clang =3D "CLANG38"
=20
 do_compile() {
     sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/So=
urce/C/Makefiles/header.makefile
@@ -74,13 +75,13 @@ do_compile() {
     "${S}/BaseTools/BinWrappers/PosixLike/build" \
        -a "${EDK2_ARCH}" \
        -b ${EDK2_BUILD_MODE} \
-       -t ${GCC_VER} \
+       -t ${EDK_COMPILER} \
        -p "${S}/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
 }
=20
 do_install() {
     install -d ${D}/firmware
-    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_VER}/FV=
/${EDK2_BIN_NAME} ${D}/firmware/uefi.bin
+    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILE=
R}/FV/${EDK2_BIN_NAME} ${D}/firmware/uefi.bin
 }
=20
 FILES_${PN} =3D "/firmware"
--=20
2.25.1

