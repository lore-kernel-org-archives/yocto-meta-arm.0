Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CEDC87FD3
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.33472.1753876434135182769
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2D8E2681;
	Wed, 30 Jul 2025 04:53:45 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF4943F66E;
	Wed, 30 Jul 2025 04:53:52 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>,
	Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 04/13] arm-bsp: corstone1000: Add PLATFORM_IS_FVP toggle for FVP/FPGA builds
Date: Wed, 30 Jul 2025 12:53:18 +0100
Message-Id: <20250730115327.3671160-5-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6641

Introduces PLATFORM_IS_FVP to differentiate between FVP and FPGA builds.
Adds platform-specific CMake files for corstone1000-fvp and corstone1000-=
mps3,
and updates platform.cmake to use this toggle.

This commit also adds the TS_PLATFORM variable to corstone1000-fvp.conf
and corstone1000-mps3.conf, explicitly defining platform identifiers
for Trusted Services. This ensures a consistent and clear distinction
between the FVP and MPS3 builds within the build system.

These changes improve maintainability and platform-specific handling
by making it easier to reference the correct target platform
in configurations and scripts.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../conf/machine/corstone1000-fvp.conf        |  2 +
 .../conf/machine/corstone1000-mps3.conf       |  2 +
 ...e1000-Add-PLATFORM_IS_FVP-toggle-for.patch | 77 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 4 files changed, 82 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0017-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index df0275ef..632bd028 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -7,6 +7,8 @@ TFA_TARGET_PLATFORM =3D "fvp"
=20
 TFM_PLATFORM_IS_FVP =3D "TRUE"
=20
+TS_PLATFORM =3D "arm/corstone1000-fvp"
+
 # testimage config
 TEST_TARGET =3D "OEFVPTarget"
 TEST_TARGET_IP =3D "127.0.0.1:2222"
diff --git a/meta-arm-bsp/conf/machine/corstone1000-mps3.conf b/meta-arm-=
bsp/conf/machine/corstone1000-mps3.conf
index 88f3d9dd..88d01b09 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-mps3.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-mps3.conf
@@ -7,3 +7,5 @@ require conf/machine/include/corstone1000.inc
 TFA_TARGET_PLATFORM =3D "fpga"
=20
 PLATFORM_IS_FVP =3D "FALSE"
+
+TS_PLATFORM =3D "arm/corstone1000-mps3"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0017-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0017-Platform-Corsto=
ne1000-Add-PLATFORM_IS_FVP-toggle-for.patch
new file mode 100644
index 00000000..b4c027cc
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Pl=
atform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.patch
@@ -0,0 +1,77 @@
+From 00cbde17d3e38de385a6f0897cdd6d9bfe8250c7 Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Thu, 27 Feb 2025 14:06:07 +0000
+Subject: [PATCH 03/10] Platform: Corstone1000: Add PLATFORM_IS_FVP toggl=
e for
+ FVP/FPGA builds
+
+Introduces PLATFORM_IS_FVP to differentiate between FVP and FPGA builds.
+Adds platform-specific CMake files for corstone1000-fvp and corstone1000=
-mps3,
+and updates platform.cmake to use this toggle.
+
+Upstream-Status: Pending
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../providers/arm/corstone1000-fvp/platform.cmake     | 11 +++++++++++
+ .../providers/arm/corstone1000-mps3/platform.cmake    | 11 +++++++++++
+ platform/providers/arm/corstone1000/platform.cmake    |  3 ++-
+ 3 files changed, 24 insertions(+), 1 deletion(-)
+ create mode 100644 platform/providers/arm/corstone1000-fvp/platform.cma=
ke
+ create mode 100644 platform/providers/arm/corstone1000-mps3/platform.cm=
ake
+
+diff --git a/platform/providers/arm/corstone1000-fvp/platform.cmake b/pl=
atform/providers/arm/corstone1000-fvp/platform.cmake
+new file mode 100644
+index 00000000..9a281e7a
+--- /dev/null
++++ b/platform/providers/arm/corstone1000-fvp/platform.cmake
+@@ -0,0 +1,11 @@
++#----------------------------------------------------------------------=
---------
++# Copyright (c) 2025, Arm Limited and Contributors. All rights reserved=
.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++# Platform definition for the Corstone-1000-MPS3 platform.
++#----------------------------------------------------------------------=
---------
++
++set(PLATFORM_IS_FVP 1 CACHE BOOL "Whether to enable FVP or FPGA build o=
f the platform.")
++
++include(${TS_PLATFORM_ROOT}/arm/corstone1000/platform.cmake)
+diff --git a/platform/providers/arm/corstone1000-mps3/platform.cmake b/p=
latform/providers/arm/corstone1000-mps3/platform.cmake
+new file mode 100644
+index 00000000..ec92d1e5
+--- /dev/null
++++ b/platform/providers/arm/corstone1000-mps3/platform.cmake
+@@ -0,0 +1,11 @@
++#----------------------------------------------------------------------=
---------
++# Copyright (c) 2025, Arm Limited and Contributors. All rights reserved=
.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++# Platform definition for the Corstone-1000-FVP platform.
++#----------------------------------------------------------------------=
---------
++
++set(PLATFORM_IS_FVP 0 CACHE BOOL "Whether to enable FVP or FPGA build o=
f the platform.")
++
++include(${TS_PLATFORM_ROOT}/arm/corstone1000/platform.cmake)
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
+index 04c8138f..60bc208b 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2021-2024, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2021-2025, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -17,6 +17,7 @@ target_compile_definitions(${TGT} PRIVATE
+ 	PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE=3D${PLAT_RSE_COMMS_PAYLOAD_MAX_SIZE}
+  	COMMS_MHU_MSG_SIZE=3D${COMMS_MHU_MSG_SIZE}
+ 	MBEDTLS_ECP_DP_SECP521R1_ENABLED
++	PLATFORM_IS_FVP=3D${PLATFORM_IS_FVP}
+ )
+=20
+ get_property(_platform_driver_dependencies TARGET ${TGT}
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 543413ea..ed40ca7f 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -19,6 +19,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0015-se-proxy-protobuf-change.patch \
     file://0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch \
     file://0016-Add-the-com-buffer-address-and-page-count.patch \
+    file://0017-Platform-Corstone1000-Add-PLATFORM_IS_FVP-toggle-for.pat=
ch \
     "
 # The patches above introduce errors with GCC 14.1, silence them for now
 CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -Wno-implicit-funct=
ion-declaration"

