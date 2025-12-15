Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4274D5B16C
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 14:28:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49759.1765808882294970545
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 06:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2500FEC
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 06:27:54 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA39F3F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 06:28:01 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-m: update 2.2.x to latest hotfix release
Date: Mon, 15 Dec 2025 09:28:00 -0500
Message-ID: <20251215142800.93984-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251215142800.93984-1-jon.mason@arm.com>
References: <20251215142800.93984-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 14:28:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6797

Update TF-M to the latest hotfix release and rebase the Corstone1000
patches, and drop
0008-Platform-Corstone1000-Increase-BL1-size-and-align-bi.patch
0009-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.patch
as they are in the TF-Mv2.2.2 release

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...ware-m-disable-address-warnings-into.patch |  7 +-
 ...form-CS1000-Remove-unused-BL1-files.patch} | 11 +--
 ...1000-Fix-BL1-compiler-switch-and-re.patch} |  9 +-
 ...f-cc312-differences-between-fvp-and.patch} | 11 +--
 ...m-Corstone1000-Enable-FWU-partition.patch} |  9 +-
 ...1000-Implement-Bootloader-Abstracti.patch} | 39 ++++----
 ...-Corstone1000-Increase-buffer-sizes.patch} |  9 +-
 ...e1000-Increase-BL1-size-and-align-bi.patch | 93 -------------------
 ...1000-Remove-duplicate-configuration.patch} |  9 +-
 ...apt-ADAC-enabled-build-to-the-new-BL.patch | 45 ---------
 .../trusted-firmware-m-corstone1000.inc       | 21 ++---
 ...c.inc =3D> trusted-firmware-m-2.2.2-src.inc} | 13 ++-
 ...rusted-firmware-m-scripts-native_2.2.2.bb} |  0
 ...m_2.2.1.bb =3D> trusted-firmware-m_2.2.2.bb} |  0
 15 files changed, 56 insertions(+), 222 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/{ =3D> corstone=
1000}/0001-arm-trusted-firmware-m-disable-address-warnings-into.patch (81=
%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
001-Platform-CS1000-Remove-unused-BL1-files.patch =3D> 0002-Platform-CS10=
00-Remove-unused-BL1-files.patch} (98%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
002-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch =3D> 0003-=
Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch} (90%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
003-CC312-alignment-of-cc312-differences-between-fvp-and.patch =3D> 0004-=
CC312-alignment-of-cc312-differences-between-fvp-and.patch} (84%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
004-Platform-Corstone1000-Enable-FWU-partition.patch =3D> 0005-Platform-C=
orstone1000-Enable-FWU-partition.patch} (91%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
005-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch =3D> 0006-=
Platform-Corstone1000-Implement-Bootloader-Abstracti.patch} (99%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
006-Platform-Corstone1000-Increase-buffer-sizes.patch =3D> 0007-Platform-=
Corstone1000-Increase-buffer-sizes.patch} (91%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-Corstone1000-Increase-BL1-size-and-align-bi.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
007-Platform-Corstone1000-Remove-duplicate-configuration.patch =3D> 0008-=
Platform-Corstone1000-Remove-duplicate-configuration.patch} (88%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.patch
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-2.2.1=
-src.inc =3D> trusted-firmware-m-2.2.2-src.inc} (93%)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-scrip=
ts-native_2.2.1.bb =3D> trusted-firmware-m-scripts-native_2.2.2.bb} (100%=
)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_2.2.1=
.bb =3D> trusted-firmware-m_2.2.2.bb} (100%)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 6f5127b67855..25a330def46e 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -5,7 +5,7 @@ require ${TUNE_FILE}
 MACHINEOVERRIDES =3D. "corstone1000:"
=20
 # TF-M
-PREFERRED_VERSION_trusted-firmware-m ?=3D "2.2.1"
+PREFERRED_VERSION_trusted-firmware-m ?=3D "2.2.%"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0001-arm-t=
rusted-firmware-m-disable-address-warnings-into.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0001-arm-trusted-firmware-m=
-disable-address-warnings-into.patch
similarity index 81%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0001-arm-tr=
usted-firmware-m-disable-address-warnings-into.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0001-arm-trusted-firmware-m-disable-address-warnings-into.patch
index 1f19f55c4895..73fbd0a6ad7c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/0001-arm-trusted-=
firmware-m-disable-address-warnings-into.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-arm-trusted-firmware-m-disable-address-warnings-into.patch
@@ -1,4 +1,4 @@
-From 961d2e3718e9e6d652cadf5b4d3597cfe822dd04 Mon Sep 17 00:00:00 2001
+From f3400c6527e6d0c073215694e19734a6268a6bc9 Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Wed, 24 Jan 2024 16:10:08 +0000
 Subject: [PATCH] arm/trusted-firmware-m: disable address warnings into a=
n
@@ -7,16 +7,15 @@ Subject: [PATCH] arm/trusted-firmware-m: disable addres=
s warnings into an
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Upstream-Status: Inappropriate
-
 ---
  toolchain_GNUARM.cmake | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/toolchain_GNUARM.cmake b/toolchain_GNUARM.cmake
-index b6ae50ec3..4c2f5b3d7 100644
+index 56a220ba8471..af80a2746676 100644
 --- a/toolchain_GNUARM.cmake
 +++ b/toolchain_GNUARM.cmake
-@@ -111,6 +111,7 @@ add_compile_options(
+@@ -113,6 +113,7 @@ add_compile_options(
      -Wno-format
      -Wno-return-type
      -Wno-unused-but-set-variable
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-Platform-CS1000-Remove-unused-BL1-files.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-CS1000-Remove=
-unused-BL1-files.patch
similarity index 98%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0001-Platform-CS1000-Remove-unused-BL1-files.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0002-Platform-CS1000-Remove-unused-BL1-files.patch
index 91b1ff6ee563..b68c5f4f8885 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-CS1000-Remove-unused-BL1-files.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-CS1000-Remove-unused-BL1-files.patch
@@ -1,7 +1,7 @@
-From 778d62d8ebe91212363cdab2fa1eef6a977ae6e2 Mon Sep 17 00:00:00 2001
+From 9ed08f26cafc2c6e5bf1d5cc04f91ca17d94a1bd Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Wed, 13 Aug 2025 14:02:57 +0000
-Subject: [PATCH 1/7] Platform: CS1000: Remove unused BL1 files
+Subject: [PATCH] Platform: CS1000: Remove unused BL1 files
=20
 These files are not referenced anywhere so removed them to prevent
 confusion.
@@ -17,7 +17,7 @@ Upstream-Status: Backport [9a7bdf9ef595196e1e518a27d3c7=
9079aedb5bda]
=20
 diff --git a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt b/p=
latform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
 deleted file mode 100644
-index d85b0611d..000000000
+index d85b0611dd42..000000000000
 --- a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
 +++ /dev/null
 @@ -1,345 +0,0 @@
@@ -368,7 +368,7 @@ index d85b0611d..000000000
 -)
 diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c=
 b/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c
 deleted file mode 100644
-index 32c1481cc..000000000
+index 32c1481cca11..000000000000
 --- a/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c
 +++ /dev/null
 @@ -1,75 +0,0 @@
@@ -447,6 +447,3 @@ index 32c1481cc..000000000
 -
 -    return 0;
 -}
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-=
Corstone1000-Fix-BL1-compiler-switch-and-re.patch
similarity index 90%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0002-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0003-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch
index 4753b0679310..ef73c5722fb7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch
@@ -1,7 +1,7 @@
-From 162d46ac77be0ad3e7cf1840fa05578cce084a68 Mon Sep 17 00:00:00 2001
+From 1d7ab426f171516c15ce8e5223541c62c91ec596 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Wed, 13 Aug 2025 14:31:53 +0000
-Subject: [PATCH 2/7] Platform: Corstone1000: Fix BL1 compiler switch and
+Subject: [PATCH] Platform: Corstone1000: Fix BL1 compiler switch and
  regression test failure
=20
 Introduce a dedicated preprocessor definition (`BL1_BUILD`) added only t=
o the
@@ -16,7 +16,7 @@ Upstream-Status: Backport [f25649cc0de56f360069c6128670=
f7533ba5e14d]
  1 file changed, 8 insertions(+)
=20
 diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 4d165ed9c..3573c8492 100644
+index ff7cf7330a07..66dfb2399503 100644
 --- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
 +++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
 @@ -146,6 +146,7 @@ target_sources(platform_s
@@ -41,6 +41,3 @@ index 4d165ed9c..3573c8492 100644
  )
 =20
  target_include_directories(platform_bl1_1_interface
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-CC312-alignment-of-cc312-differences-between-fvp-and.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-CC312-ali=
gnment-of-cc312-differences-between-fvp-and.patch
similarity index 84%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0003-CC312-alignment-of-cc312-differences-between-fvp-and.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0004-CC312-alignment-of-cc312-differences-between-fvp-and.patch
index 37f762d6c5c6..7aa4d5e9bbdd 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-CC312-alignment-of-cc312-differences-between-fvp-and.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-CC312-alignment-of-cc312-differences-between-fvp-and.patch
@@ -1,8 +1,8 @@
-From bfc977a43ea6b328136599a7558c3706739579b6 Mon Sep 17 00:00:00 2001
+From 4274b94aa0af175e31b8883ec6f2113133608e24 Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Wed, 15 May 2024 12:12:15 +0000
-Subject: [PATCH 3/7] CC312: alignment of cc312 differences between fvp a=
nd
- mps3 corstone1000 platforms
+Subject: [PATCH] CC312: alignment of cc312 differences between fvp and m=
ps3
+ corstone1000 platforms
=20
 Configures CC312 mps3 model same as predefined cc312 FVP
 configuration while keeping debug ports closed.
@@ -15,7 +15,7 @@ Upstream-Status: Inappropriate [Requires an aligment cc=
3xx with mps3 hw and fvp
  1 file changed, 3 insertions(+)
=20
 diff --git a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c b=
/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
-index 31e4332be..4b08c0252 100644
+index 31e4332bed64..4b08c02526d3 100644
 --- a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
 +++ b/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
 @@ -207,6 +207,9 @@ CClibRetCode_t CC_LibInit(CCRndContext_t *rndContext=
_ptr, CCRndWorkBuff_t  *rndW
@@ -28,6 +28,3 @@ index 31e4332be..4b08c0252 100644
      /* turn off the DFA since Cerberus doen't support it */
      reg =3D CC_HAL_READ_REGISTER(CC_REG_OFFSET(HOST_RGF, HOST_AO_LOCK_B=
ITS));
      CC_REG_FLD_SET(0, HOST_AO_LOCK_BITS, HOST_FORCE_DFA_ENABLE, reg, 0x=
0);
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0004-Platform-Corstone1000-Enable-FWU-partition.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-Corstone10=
00-Enable-FWU-partition.patch
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0004-Platform-Corstone1000-Enable-FWU-partition.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0005-Platform-Corstone1000-Enable-FWU-partition.patch
index b4bd9a713202..4e890975b49c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-Platform-Corstone1000-Enable-FWU-partition.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-Platform-Corstone1000-Enable-FWU-partition.patch
@@ -1,7 +1,7 @@
-From ab1ecf0cfbbf199c4d868d2c565f7bff3f5245ee Mon Sep 17 00:00:00 2001
+From fdfbb3b82f62a2d4575a983ebaee14a67130d316 Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Tue, 15 Oct 2024 12:50:16 +0000
-Subject: [PATCH 4/7] Platform: Corstone1000: Enable FWU partition
+Subject: [PATCH] Platform: Corstone1000: Enable FWU partition
=20
 Enable firmware update partition for Corstone-1000 platform.
=20
@@ -17,7 +17,7 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  1 file changed, 4 insertions(+)
=20
 diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
-index 0e6297dae..e45b56b2f 100644
+index 7a88542a32fc..6d9cb1fea750 100644
 --- a/platform/ext/target/arm/corstone1000/config.cmake
 +++ b/platform/ext/target/arm/corstone1000/config.cmake
 @@ -55,6 +55,10 @@ set(TFM_PARTITION_CRYPTO                ON          C=
ACHE BOOL      "Enable Cryp
@@ -31,6 +31,3 @@ index 0e6297dae..e45b56b2f 100644
 =20
  if (${CMAKE_BUILD_TYPE} STREQUAL Debug OR ${CMAKE_BUILD_TYPE} STREQUAL =
RelWithDebInfo)
    set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE          CACHE BOOL      "En=
able Firmware update agent debug logs.")
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-=
Corstone1000-Implement-Bootloader-Abstracti.patch
similarity index 99%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0005-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0006-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
index 942c798a8d82..509ab2078500 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
@@ -1,7 +1,7 @@
-From ed7dc0b54d8a654916c62fed4a201872e94233cc Mon Sep 17 00:00:00 2001
+From acefd1b894790c1d2a158bd42fcb4892ffa7c053 Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Tue, 15 Oct 2024 12:50:16 +0000
-Subject: [PATCH 5/8] Platform: Corstone1000: Implement Bootloader Abstra=
ction
+Subject: [PATCH] Platform: Corstone1000: Implement Bootloader Abstractio=
n
  Layer
=20
 This commit introduces the Bootloader Abstraction Layer (BAL) for
@@ -112,7 +112,7 @@ Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
  delete mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/uefi_capsule_parser.h
=20
 diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 3573c8492..6105c951b 100644
+index 66dfb2399503..91bf197d86b7 100644
 --- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
 +++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
 @@ -115,7 +115,7 @@ target_include_directories(platform_s
@@ -234,7 +234,7 @@ index 3573c8492..6105c951b 100644
 =20
  #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D ns_agent_mailbox =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
 diff --git a/platform/ext/target/arm/corstone1000/bl1/provisioning.c b/p=
latform/ext/target/arm/corstone1000/bl1/provisioning.c
-index b8b03ad55..b28c840f8 100644
+index b8b03ad558b9..b28c840f8668 100644
 --- a/platform/ext/target/arm/corstone1000/bl1/provisioning.c
 +++ b/platform/ext/target/arm/corstone1000/bl1/provisioning.c
 @@ -92,7 +92,7 @@ enum tfm_plat_err_t provision_assembly_and_test(void)
@@ -247,7 +247,7 @@ index b8b03ad55..b28c840f8 100644
      }
 =20
 diff --git a/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c=
 b/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
-index da9f74e1c..850ed46ac 100644
+index da9f74e1c88c..850ed46ac2d8 100644
 --- a/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
 +++ b/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
 @@ -76,7 +76,8 @@ int32_t boot_nv_security_counter_update(uint32_t image=
_id,
@@ -271,7 +271,7 @@ index da9f74e1c..850ed46ac 100644
 =20
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h=
 b/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
 new file mode 100644
-index 000000000..aa5af15b2
+index 000000000000..aa5af15b26ce
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
 @@ -0,0 +1,123 @@
@@ -400,7 +400,7 @@ index 000000000..aa5af15b2
 +#endif /* FWU_AGENT_H */
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/fwu_config.=
h.in b/platform/ext/target/arm/corstone1000/bootloader/fwu_config.h.in
 new file mode 100644
-index 000000000..acb8de05e
+index 000000000000..acb8de05e107
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/bootloader/fwu_config.h.in
 @@ -0,0 +1,58 @@
@@ -464,7 +464,7 @@ index 000000000..acb8de05e
 +#endif /* __FWU_CONFIG_H__ */
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/CMa=
keLists.txt b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/CMa=
keLists.txt
 new file mode 100644
-index 000000000..13a3caf54
+index 000000000000..13a3caf5431a
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/CMakeLists=
.txt
 @@ -0,0 +1,52 @@
@@ -522,7 +522,7 @@ index 000000000..13a3caf54
 +)
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
 new file mode 100644
-index 000000000..a458b5478
+index 000000000000..a458b5478fe6
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
 @@ -0,0 +1,2345 @@
@@ -2875,7 +2875,7 @@ diff --git a/platform/ext/target/arm/corstone1000/f=
w_update_agent/uefi_fmp.c b/p
 similarity index 66%
 rename from platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fm=
p.c
 rename to platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_f=
mp.c
-index 896658995..aef9c9a20 100644
+index 896658995a55..aef9c9a20c0f 100644
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.c
 +++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_fmp.c
 @@ -1,5 +1,5 @@
@@ -3078,7 +3078,7 @@ index 896658995..aef9c9a20 100644
 -
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/tfm_bootloa=
der_fwu_abstraction.h b/platform/ext/target/arm/corstone1000/bootloader/t=
fm_bootloader_fwu_abstraction.h
 new file mode 100644
-index 000000000..909b4857b
+index 000000000000..909b4857b8a9
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/bootloader/tfm_bootloader_fwu=
_abstraction.h
 @@ -0,0 +1,189 @@
@@ -3275,7 +3275,7 @@ diff --git a/platform/ext/target/arm/corstone1000/f=
w_update_agent/uefi_fmp.h b/p
 similarity index 89%
 rename from platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fm=
p.h
 rename to platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h
-index d876bd7cf..36c604714 100644
+index d876bd7cff05..36c604714900 100644
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.h
 +++ b/platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h
 @@ -1,5 +1,5 @@
@@ -3303,7 +3303,7 @@ index d876bd7cf..36c604714 100644
 +psa_status_t fmp_get_image_info(void *buffer, uint32_t size);
  #endif /* UEFI_FMP_H */
 diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
-index e45b56b2f..f1de066e5 100644
+index 6d9cb1fea750..a923f63ca697 100644
 --- a/platform/ext/target/arm/corstone1000/config.cmake
 +++ b/platform/ext/target/arm/corstone1000/config.cmake
 @@ -55,10 +55,13 @@ set(TFM_PARTITION_CRYPTO                ON          =
CACHE BOOL      "Enable Cryp
@@ -3326,7 +3326,7 @@ index e45b56b2f..f1de066e5 100644
    set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE          CACHE BOOL      "En=
able Firmware update agent debug logs.")
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
 deleted file mode 100644
-index 29c7be9a3..000000000
+index 29c7be9a3bb3..000000000000
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
 +++ /dev/null
 @@ -1,1405 +0,0 @@
@@ -4737,7 +4737,7 @@ index 29c7be9a3..000000000
 -}
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
 deleted file mode 100644
-index 701f20558..000000000
+index 701f20558370..000000000000
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
 +++ /dev/null
 @@ -1,73 +0,0 @@
@@ -4816,7 +4816,7 @@ index 701f20558..000000000
 -#endif /* FWU_AGENT_H */
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.c b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.c
 deleted file mode 100644
-index 44566e08d..000000000
+index 44566e08de36..000000000000
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
 +++ /dev/null
 @@ -1,176 +0,0 @@
@@ -4998,7 +4998,7 @@ index 44566e08d..000000000
 -}
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.h b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.h
 deleted file mode 100644
-index a31cd8a3a..000000000
+index a31cd8a3a0b7..000000000000
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.h
 +++ /dev/null
 @@ -1,33 +0,0 @@
@@ -5036,7 +5036,7 @@ index a31cd8a3a..000000000
 -
 -#endif /* UEFI_CAPSULE_PARSER_H */
 diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index f42dda809..e2219d80a 100644
+index f42dda809658..e2219d80a75c 100644
 --- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
 +++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
 @@ -1,5 +1,5 @@
@@ -5065,6 +5065,3 @@ index f42dda809..e2219d80a 100644
 =20
  /************************************************************/
  /* Bank : Images flash offsets are with respect to the bank */
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-Platform-Corstone1000-Increase-buffer-sizes.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-Corstone1=
000-Increase-buffer-sizes.patch
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0006-Platform-Corstone1000-Increase-buffer-sizes.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0007-Platform-Corstone1000-Increase-buffer-sizes.patch
index d5f3bee4d6b8..2980937dfd00 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-Increase-buffer-sizes.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-Platform-Corstone1000-Increase-buffer-sizes.patch
@@ -1,7 +1,7 @@
-From def9095e7bfd5a82ba6cd4756e990cd9ae7307ab Mon Sep 17 00:00:00 2001
+From 78231f27db0bbc747902b603bf279dce1707a3cc Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Mon, 16 Jun 2025 14:44:39 +0100
-Subject: [PATCH 6/7] Platform: Corstone1000: Increase buffer sizes
+Subject: [PATCH] Platform: Corstone1000: Increase buffer sizes
=20
 Increase PSA_MAX_ASSET_SIZE and CRYPTO_IOVEC_BUFFER_SIZE
 to accommodate large size EFI variables set by new U-Boot version.
@@ -18,7 +18,7 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
-index 4920f6708..cf13712a1 100644
+index 4920f67084d4..cf13712a1806 100644
 --- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
 +++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
 @@ -1,5 +1,5 @@
@@ -44,6 +44,3 @@ index 4920f6708..cf13712a1 100644
 =20
  /* The Mailbox partition is used as an NS Agent so its stack size is us=
ed to
   * determine the PSP and PSPLIM during the SFN backend initialization. =
It has to
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-Platform-Corstone1000-Increase-BL1-size-and-align-bi.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-=
Corstone1000-Increase-BL1-size-and-align-bi.patch
deleted file mode 100644
index 65cecc2f6dc0..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-Platform-Corstone1000-Increase-BL1-size-and-align-bi.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From d708753e317c89dead0759e3ffa6ecabef5a84a3 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 21 Aug 2025 09:12:25 +0000
-Subject: [PATCH 1/2] Platform: Corstone1000: Increase BL1 size and align
- binary addresses
-
-The move to Trusted-Firmware-M v2.2.1 makes the BL1 code larger,
-while the provisioning bundle can be trimmed.  At the same time BL2 and
-TF-M binary addresses now need to begin on a 0x100-byte boundary for
-Cortex-M0+ based platforms.
-
-Key changes
---------------------------------
-- Increase `BL1_1_CODE_SIZE` to 58KB to accommodate the v2.2.1 binaries.
-- Reduce `PROVISIONING_DATA_SIZE` to 6KB.
-- `BL2_CODE_START` and `S_CODE_START` are aligned to 0x100 byte boundary
-   so both start addresses are an exact multiple of 0x100.
-
-Upstream-Status: Backport [d56178638a49c8c964aab3bff69ed8396dd6d8fc]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- .../arm/corstone1000/partition/region_defs.h  | 29 ++++++++++---------
- 1 file changed, 15 insertions(+), 14 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.=
h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-index 3e1294484..92e01c0e3 100644
---- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
-+++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-@@ -24,6 +24,10 @@
- #include "flash_layout.h"
- #include "bl1_2_config.h"
-=20
-+/* Align address to 0x100 bytes boundary */
-+#define ADDR_ALIGN               0x100
-+#define ALIGN_UP_100(addr)       (((addr + (ADDR_ALIGN - 1)) / ADDR_ALI=
GN) * ADDR_ALIGN)
-+
- /* BL1_1 */
- #define BL1_1_HEAP_SIZE         (0x0001000) /* 4KiB */
- #define BL1_1_MSP_STACK_SIZE    (0x0001800) /* 6KiB */
-@@ -43,14 +47,10 @@
-=20
- #define BOOT_TFM_SHARED_DATA_SIZE (0x400)
-=20
--#define IMAGE_TFM_CODE_SIZE \
--            (TFM_PARTITION_SIZE - BL2_HEADER_SIZE - BL2_TRAILER_SIZE)
--
--#define IMAGE_BL2_CODE_SIZE \
--            (SE_BL2_PARTITION_SIZE - TFM_BL1_2_HEADER_MAX_SIZE)
--
- /* Secure regions */
--#define S_CODE_START            (SRAM_BASE + BL2_HEADER_SIZE)
-+#define S_CODE_START            ALIGN_UP_100(SRAM_BASE + BL2_HEADER_SIZ=
E)
-+#define S_CODE_ALIGNMENT_DIFF   (S_CODE_START - (SRAM_BASE + BL2_HEADER=
_SIZE))
-+#define IMAGE_TFM_CODE_SIZE     (TFM_PARTITION_SIZE - BL2_HEADER_SIZE -=
 BL2_TRAILER_SIZE - S_CODE_ALIGNMENT_DIFF)
- #define S_CODE_SIZE             (IMAGE_TFM_CODE_SIZE)
- #define S_CODE_LIMIT            (S_CODE_START + S_CODE_SIZE - 1)
-=20
-@@ -80,12 +80,13 @@
- #define SECONDARY_PARTITION_START 0
- #define SECONDARY_PARTITION_SIZE (TFM_PARTITION_SIZE)
-=20
--
- /* SE BL2 regions */
--#define BL2_IMAGE_START   (SRAM_BASE + SRAM_SIZE - SE_BL2_PARTITION_SIZ=
E)
--#define BL2_CODE_START    (BL2_IMAGE_START + TFM_BL1_2_HEADER_MAX_SIZE)
--#define BL2_CODE_SIZE     (IMAGE_BL2_CODE_SIZE)
--#define BL2_CODE_LIMIT    (BL2_CODE_START + BL2_CODE_SIZE - 1)
-+#define BL2_IMAGE_START            (SRAM_BASE + SRAM_SIZE - SE_BL2_PART=
ITION_SIZE)
-+#define BL2_CODE_START             ALIGN_UP_100(BL2_IMAGE_START + TFM_B=
L1_2_HEADER_MAX_SIZE)
-+#define BL2_CODE_ALIGNMENT_DIFF    (BL2_CODE_START - (BL2_IMAGE_START +=
 TFM_BL1_2_HEADER_MAX_SIZE))
-+#define IMAGE_BL2_CODE_SIZE        (SE_BL2_PARTITION_SIZE - TFM_BL1_2_H=
EADER_MAX_SIZE - BL2_CODE_ALIGNMENT_DIFF)
-+#define BL2_CODE_SIZE              (IMAGE_BL2_CODE_SIZE)
-+#define BL2_CODE_LIMIT             (BL2_CODE_START + BL2_CODE_SIZE - 1)
-=20
- #define BL2_DATA_START    (S_DATA_START)
- #define BL2_DATA_SIZE     (BL2_IMAGE_START - BL2_DATA_START)
-@@ -93,11 +94,11 @@
-=20
- /* SE BL1 regions */
- #define BL1_1_CODE_START    (0)
--#define BL1_1_CODE_SIZE     (0x0000C800)     /* 50 KiB */
-+#define BL1_1_CODE_SIZE     (0x0000E800)     /* 58 KiB */
- #define BL1_1_CODE_LIMIT    (BL1_1_CODE_START + BL1_1_CODE_SIZE - 1)
-=20
- #define PROVISIONING_DATA_START (BL1_1_CODE_START + BL1_1_CODE_SIZE)
--#define PROVISIONING_DATA_SIZE  (0x00002000)     /* 8 KiB */
-+#define PROVISIONING_DATA_SIZE  (0x00001800)     /* 6 KiB */
- #define PROVISIONING_DATA_LIMIT (PROVISIONING_DATA_START + PROVISIONING=
_DATA_SIZE - 1)
-=20
- #define BL1_1_DATA_START    (SRAM_BASE)
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0007-Platform-Corstone1000-Remove-duplicate-configuration.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-=
Corstone1000-Remove-duplicate-configuration.patch
similarity index 88%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0007-Platform-Corstone1000-Remove-duplicate-configuration.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0008-Platform-Corstone1000-Remove-duplicate-configuration.patch
index 1a95fd25c577..3728bf8d6911 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-Platform-Corstone1000-Remove-duplicate-configuration.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-Platform-Corstone1000-Remove-duplicate-configuration.patch
@@ -1,7 +1,7 @@
-From 038b35ac96dcdaa640bb5f641b8c028491abb9b7 Mon Sep 17 00:00:00 2001
+From 291b717c9ff6124dd132602e84f75f320adbfda1 Mon Sep 17 00:00:00 2001
 From: Yogesh Wani <yogesh.wani@arm.com>
 Date: Wed, 30 Apr 2025 14:39:37 +0100
-Subject: [PATCH 7/7] Platform: Corstone1000: Remove duplicate configurat=
ion
+Subject: [PATCH] Platform: Corstone1000: Remove duplicate configuration
  parameters for Corstone-1000
=20
 The PS_NUM_ASSET is duplicated in the cmake.config and the
@@ -18,7 +18,7 @@ Signed-off-by: Yogesh Wani <yogesh.wani@arm.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
-index f1de066e5..cf4d63f61 100644
+index a923f63ca697..032265cdf4ac 100644
 --- a/platform/ext/target/arm/corstone1000/config.cmake
 +++ b/platform/ext/target/arm/corstone1000/config.cmake
 @@ -74,7 +74,6 @@ endif()
@@ -29,6 +29,3 @@ index f1de066e5..cf4d63f61 100644
 =20
  set(MCUBOOT_USE_PSA_CRYPTO            ON               CACHE BOOL      =
"Enable the cryptographic abstraction layer to use PSA Crypto APIs")
  set(MCUBOOT_SIGNATURE_TYPE            "EC-P256"        CACHE STRING    =
"Algorithm to use for signature validation [RSA-2048, RSA-3072, EC-P256, =
EC-P384]")
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-=
CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.patch
deleted file mode 100644
index 65a9074210f7..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 31d3a21a2012d64c7acff55183477c7593ef4b31 Mon Sep 17 00:00:00 2001
-From: Antonio de Angelis <Antonio.deAngelis@arm.com>
-Date: Fri, 18 Apr 2025 21:00:55 +0100
-Subject: [PATCH] Platform: CS1K: Adapt ADAC enabled build to the new BL2=
 build
- restructure
-
-The BL2 build was restructured in order to always migrate to use
-MCUBOOT_USE_PSA_CRYPTO and then support hardware crypto drivers
-through the PSA driver interface instead of the _ALT interface
-which will be deprecated in newer versions of Mbed TLS. The ADAC
-enabled library will then use PSA Crypto APIs through the thin
-PSA Crypto core which is available in the BL2 build, without the
-need to link the old driver through psa_adac_cc312.
-
-Upstream-Status: Backport [36cc3a7cda2356d3a256e1271b75a93f35531b2f]
-Signed-off-by: Antonio de Angelis <antonio.deangelis@arm.com>
-Change-Id: I413116406ee18506ed3bcfe83ce7709542ea6f47
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- platform/ext/target/arm/corstone1000/CMakeLists.txt | 9 ---------
- 1 file changed, 9 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 6105c951b..ca5a034e3 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -436,15 +436,6 @@ if (${PLATFORM_PSA_ADAC_SECURE_DEBUG})
-             trusted-firmware-m-psa-adac
-     )
-=20
--    target_link_libraries(trusted-firmware-m-psa-adac
--        PRIVATE
--            psa_adac_cc312
--    )
--
--    target_link_libraries(psa_adac_psa_crypto
--        PRIVATE
--            bl2_mbedcrypto_config
--    )
- endif()
-=20
-=20
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index a355e844ce71..d3e236f2759c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -26,21 +26,16 @@ EXTRA_OECMAKE:append:corstone1000-fvp =3D " -DENABLE_=
MULTICORE=3D${@bb.utils.contain
 EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SECURE_=
DEBUG=3D${@bb.utils.contains('MACHINE_FEATURES', 'secure-debug', 'ON', 'O=
FF', d)}"
 EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SOURCE_=
PATH=3D${UNPACKDIR}/tfm-psa-adac -DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/tf=
m-psa-adac-build"
=20
-SRC_URI +=3D " \
-            file://0001-arm-trusted-firmware-m-disable-address-warnings-=
into.patch \
-           "
-
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append:corstone1000 =3D " \
-    file://0001-Platform-CS1000-Remove-unused-BL1-files.patch \
-    file://0002-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.pat=
ch \
-    file://0003-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
-    file://0004-Platform-Corstone1000-Enable-FWU-partition.patch \
-    file://0005-Platform-Corstone1000-Implement-Bootloader-Abstracti.pat=
ch \
-    file://0006-Platform-Corstone1000-Increase-buffer-sizes.patch \
-    file://0007-Platform-Corstone1000-Remove-duplicate-configuration.pat=
ch \
-    file://0008-Platform-Corstone1000-Increase-BL1-size-and-align-bi.pat=
ch \
-    file://0009-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.pat=
ch \
+    file://0001-arm-trusted-firmware-m-disable-address-warnings-into.pat=
ch \
+    file://0002-Platform-CS1000-Remove-unused-BL1-files.patch \
+    file://0003-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.pat=
ch \
+    file://0004-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
+    file://0005-Platform-Corstone1000-Enable-FWU-partition.patch \
+    file://0006-Platform-Corstone1000-Implement-Bootloader-Abstracti.pat=
ch \
+    file://0007-Platform-Corstone1000-Increase-buffer-sizes.patch \
+    file://0008-Platform-Corstone1000-Remove-duplicate-configuration.pat=
ch \
     file://0010-plat-corstone1000-Add-support-for-Cortex-A320-varian.pat=
ch \
     "
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.1-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.2-src.inc
similarity index 93%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.=
2.1-src.inc
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.=
2-src.inc
index a53124ddd45e..e78bbdd7d34c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.1-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
@@ -21,7 +21,6 @@ SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.tru=
stedfirmware.org/shared/psa
 SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
=20
 SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
-            file://0001-Add-checks-for-BL2-and-TF-M-binary-address-align=
ment.patch \
             ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm-extras \
             ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtf-m-tests \
             ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dcmsis \
@@ -33,21 +32,21 @@ SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D=
${SRCBRANCH_tfm};name=3Dtfm;dests
             "
=20
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
-# TF-Mv2.2.1
+# TF-Mv2.2.2
 SRCBRANCH_tfm ?=3D "release/2.2.x"
-SRCREV_tfm =3D "2d91588b14ba2138e05beb1d0685302e68c05fb1"
-# TF-Mv2.2.1
+SRCREV_tfm =3D "816058200a647f988676ee4b0655e80af3601200"
+# TF-Mv2.2.2
 SRCBRANCH_tfm-extras ?=3D "release/2.2.x"
 SRCREV_tfm-extras =3D "88a4bd39284bb497dd8b362f20cd2b7f704ac390"
-# TF-Mv2.2.1
+# TF-Mv2.2.2
 SRCBRANCH_tfm-tests ?=3D "release/2.2.x"
 SRCREV_tfm-tests =3D "e0a433c67c37138cd9dce23657ae82c5cbdcf51f"
 # CMSIS v6.1.0, CMSIS_TAG from lib/ext/cmsis/CMakeLists.txt
 SRCBRANCH_cmsis ?=3D "main"
 SRCREV_cmsis =3D "b0bbb0423b278ca632cfe1474eb227961d835fd2"
-# mbedtls-3.6.3.1, value from MBEDCRYPTO_VERSION(-ish)
+# mbedtls-3.6.5, value from MBEDCRYPTO_VERSION(-ish)
 SRCBRANCH_mbedtls ?=3D "mbedtls-3.6"
-SRCREV_mbedtls =3D "6fb5120fde4ab889bea402f5ab230c720b0a3b9a"
+SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
 # mcuboot v2.2.0, value from MCUBOOT_VERSION
 SRCBRANCH_mcuboot ?=3D "main"
 SRCREV_mcuboot =3D "2d61c318933819a0f4954fb2a5a957a62c6128ce"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.2.2.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sc=
ripts-native_2.2.1.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scri=
pts-native_2.2.2.bb
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.=
2.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.=
2.1.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.=
2.bb
--=20
2.50.1 (Apple Git-155)


