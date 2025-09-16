Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E00BCAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:00:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.580.1758034819587568261
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Sep 2025 08:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 011AE1595;
	Tue, 16 Sep 2025 08:00:11 -0700 (PDT)
Received: from LXKV206JHX.arm.com (unknown [10.57.80.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 933863F694;
	Tue, 16 Sep 2025 08:00:18 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 1/4] arm/trusted-services:corstone1000: Pass Corstone-1000 target type
Date: Tue, 16 Sep 2025 16:00:10 +0100
Message-ID: <20250916150013.30666-2-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916150013.30666-1-hugues.kambampiana@arm.com>
References: <20250916150013.30666-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Sep 2025 15:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6711

Trusted Services requires knowledge of the Corstone-1000 platform type to
select the correct set of FWU image UUIDs at compile time.

This change introduces a CORSTONE_1000_TYPE variable in both BitBake
and CMake code to differentiate between Corstone-1000 platform types.
Its value is determined by the selected Corstone-1000 target machine
configuration file:
* `CORSTONE_1000_TYPE_CORTEX_A35_FVP`
* `CORSTONE_1000_TYPE_CORTEX_A35_MPS3`

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../conf/machine/corstone1000-fvp.conf        |  2 +-
 .../conf/machine/corstone1000-mps3.conf       |  6 +-
 ...e1000-Add-PLATFORM_IS_FVP-toggle-for.patch | 77 -------------------
 ...e1000-Add-CORSTONE_1000_TYPE-variabl.patch | 72 +++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  6 +-
 5 files changed, 80 insertions(+), 83 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0009-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0009-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index 632bd028..b897931c 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -7,7 +7,7 @@ TFA_TARGET_PLATFORM =3D "fvp"
=20
 TFM_PLATFORM_IS_FVP =3D "TRUE"
=20
-TS_PLATFORM =3D "arm/corstone1000-fvp"
+CORSTONE_1000_TYPE =3D "CORSTONE_1000_TYPE_CORTEX_A35_FVP"
=20
 # testimage config
 TEST_TARGET =3D "OEFVPTarget"
diff --git a/meta-arm-bsp/conf/machine/corstone1000-mps3.conf b/meta-arm-=
bsp/conf/machine/corstone1000-mps3.conf
index cefe184b..2b5aed4e 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-mps3.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-mps3.conf
@@ -6,9 +6,7 @@ require conf/machine/include/corstone1000.inc
=20
 TFA_TARGET_PLATFORM =3D "fpga"
=20
-PLATFORM_IS_FVP =3D "FALSE"
-
-TS_PLATFORM =3D "arm/corstone1000-mps3"
-
 # Unlike the FVP, MPS3 supports CoreSight
 MACHINE_FEATURES +=3D "coresight"
+
+CORSTONE_1000_TYPE =3D "CORSTONE_1000_TYPE_CORTEX_A35_MPS3"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0009-Platform-Corsto=
ne1000-Add-PLATFORM_IS_FVP-toggle-for.patch
deleted file mode 100644
index b4c027cc..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Pl=
atform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 00cbde17d3e38de385a6f0897cdd6d9bfe8250c7 Mon Sep 17 00:00:00 2001
-From: Ali Can Ozaslan <ali.oezaslan@arm.com>
-Date: Thu, 27 Feb 2025 14:06:07 +0000
-Subject: [PATCH 03/10] Platform: Corstone1000: Add PLATFORM_IS_FVP toggl=
e for
- FVP/FPGA builds
-
-Introduces PLATFORM_IS_FVP to differentiate between FVP and FPGA builds.
-Adds platform-specific CMake files for corstone1000-fvp and corstone1000=
-mps3,
-and updates platform.cmake to use this toggle.
-
-Upstream-Status: Pending
-Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- .../providers/arm/corstone1000-fvp/platform.cmake     | 11 +++++++++++
- .../providers/arm/corstone1000-mps3/platform.cmake    | 11 +++++++++++
- platform/providers/arm/corstone1000/platform.cmake    |  3 ++-
- 3 files changed, 24 insertions(+), 1 deletion(-)
- create mode 100644 platform/providers/arm/corstone1000-fvp/platform.cma=
ke
- create mode 100644 platform/providers/arm/corstone1000-mps3/platform.cm=
ake
-
-diff --git a/platform/providers/arm/corstone1000-fvp/platform.cmake b/pl=
atform/providers/arm/corstone1000-fvp/platform.cmake
-new file mode 100644
-index 00000000..9a281e7a
---- /dev/null
-+++ b/platform/providers/arm/corstone1000-fvp/platform.cmake
-@@ -0,0 +1,11 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2025, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+# Platform definition for the Corstone-1000-MPS3 platform.
-+#----------------------------------------------------------------------=
---------
-+
-+set(PLATFORM_IS_FVP 1 CACHE BOOL "Whether to enable FVP or FPGA build o=
f the platform.")
-+
-+include(${TS_PLATFORM_ROOT}/arm/corstone1000/platform.cmake)
-diff --git a/platform/providers/arm/corstone1000-mps3/platform.cmake b/p=
latform/providers/arm/corstone1000-mps3/platform.cmake
-new file mode 100644
-index 00000000..ec92d1e5
---- /dev/null
-+++ b/platform/providers/arm/corstone1000-mps3/platform.cmake
-@@ -0,0 +1,11 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2025, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+# Platform definition for the Corstone-1000-FVP platform.
-+#----------------------------------------------------------------------=
---------
-+
-+set(PLATFORM_IS_FVP 0 CACHE BOOL "Whether to enable FVP or FPGA build o=
f the platform.")
-+
-+include(${TS_PLATFORM_ROOT}/arm/corstone1000/platform.cmake)
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index 04c8138f..60bc208b 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2021-2024, Arm Limited and Contributors. All rights res=
erved.
-+# Copyright (c) 2021-2025, Arm Limited and Contributors. All rights res=
erved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -17,6 +17,7 @@ target_compile_definitions(${TGT} PRIVATE
- 	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE}
-  	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
- 	MBEDTLS_ECP_DP_SECP521R1_ENABLED
-+	PLATFORM_IS_FVP=3D${PLATFORM_IS_FVP}
- )
-=20
- get_property(_platform_driver_dependencies TARGET ${TGT}
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0009-platform-corsto=
ne1000-Add-CORSTONE_1000_TYPE-variabl.patch
new file mode 100644
index 00000000..8b387694
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-pl=
atform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.patch
@@ -0,0 +1,72 @@
+From a644191e6f184e39fbe60a8fd79bf34a9a88eb17 Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Thu, 11 Sep 2025 14:25:04 +0100
+Subject: [PATCH] platform: corstone1000: Add CORSTONE_1000_TYPE variable=
 for
+ platform selection
+
+This change introduces a CORSTONE_1000_TYPE variable in both CMake
+and C code to differentiate between Corstone-1000 platform types:
+* `CORSTONE_1000_TYPE_CORTEX_A35_FVP`
+* `CORSTONE_1000_TYPE_CORTEX_A35_MPS3`
+
+The default platform type (`CORSTONE_1000_TYPE_CORTEX_A35_FVP`) is
+set in CMake and can be overridden via the `-DCORSTONE_1000_TYPE`
+option at configure time.
+
+This variable will be used to select the correct FWU image UUIDs at
+compile time, as the UUIDs differ depending on the target platform.
+
+Upstream-Status: Backport [2cd4db9828f244de77e402ad31c52d9c4ba3c600]
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../providers/arm/corstone1000/platform.cmake | 21 ++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index d39b7903..478a394d 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -1,11 +1,29 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2021-2024, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2021-2025, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+ # Platform definition for the Corstone-1000 platform.
+ #----------------------------------------------------------------------=
---------
+=20
++# Important: The order and index of values must match C code expectatio=
ns
++set(_corstone_1000_valid_types
++    CORSTONE_1000_TYPE_CORTEX_A35_FVP
++    CORSTONE_1000_TYPE_CORTEX_A35_MPS3
++)
++set(CORSTONE_1000_TYPE "CORSTONE_1000_TYPE_CORTEX_A35_FVP" CACHE STRING
++    "Corstone-1000 platform type. Valid values are: ${_corstone_1000_va=
lid_types}"
++)
++set_property(CACHE CORSTONE_1000_TYPE PROPERTY STRINGS ${_corstone_1000=
_valid_types})
++list(FIND _corstone_1000_valid_types "${CORSTONE_1000_TYPE}" CORSTONE_1=
000_TYPE_INT)
++if(CORSTONE_1000_TYPE_INT EQUAL -1)
++    message(FATAL_ERROR
++        "Invalid CORSTONE_1000_TYPE: ${CORSTONE_1000_TYPE}.
++         Valid values are: ${_corstone_1000_valid_types}"
++    )
++endif()
++unset(_corstone_1000_valid_types)
++
+ set(SMM_GATEWAY_MAX_UEFI_VARIABLES 80 CACHE STRING "Maximum UEFI variab=
le count")
+ set(SMM_RPC_CALLER_SESSION_SHARED_MEMORY_SIZE 4*4096 CACHE STRING "RPC =
caller buffer size in SMMGW")
+ set(SMM_SP_HEAP_SIZE 80*1024 CACHE STRING "SMM gateway SP heap size")
+@@ -14,6 +32,7 @@ target_compile_definitions(${TGT} PRIVATE
+ 	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
+ 	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D0x2080
+ 	COMMS_MHU_MSG_SIZE=3D0x3500
++	CORSTONE_1000_TYPE=3D${CORSTONE_1000_TYPE_INT}
+ )
+=20
+ get_property(_platform_driver_dependencies TARGET ${TGT}
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index a17beeee..4d2dfa31 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -10,7 +10,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0006-Align-PSA-Crypto-with-TF-Mv2.1.patch \
     file://0007-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
     file://0008-se-proxy-protobuf-change.patch \
-    file://0009-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.pat=
ch \
+    file://0009-platform-corstone1000-Add-CORSTONE_1000_TYPE-variabl.pat=
ch \
     file://0010-Integrate-PSA-FWU-IPC-framework-for-Corstone-1000.patch =
\
     file://0011-Load-initial-image-state-in-PSA-FWU-M-update-agent.patch=
 \
     file://0012-Corstone1000-Define-PSA-FWU-image-mapping-structure.patc=
h \
@@ -27,3 +27,7 @@ CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -W=
no-implicit-function-declar
=20
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
 TS_PLATFORM:fvp-base =3D "arm/fvp/fvp_base_revc-2xaemv8a"
+
+EXTRA_OECMAKE:append:corstone1000 =3D " \
+    -DCORSTONE_1000_TYPE=3D${CORSTONE_1000_TYPE} \
+"

