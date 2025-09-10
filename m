Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA125CAC583
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 12:51:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16898.1757508700037218619
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 05:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33F7816F8;
	Wed, 10 Sep 2025 05:51:31 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0CD23F63F;
	Wed, 10 Sep 2025 05:51:38 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 2/3] arm/trusted-firmware-m: Add alignment checks for Cortex-M0+ based platform binaries
Date: Wed, 10 Sep 2025 13:51:11 +0100
Message-Id: <20250910125112.75362-3-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910125112.75362-1-harsimransingh.tungal@arm.com>
References: <20250910125112.75362-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 12:51:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6697

Include patch to add relevant checks in GCC linker scripts to validate if=
 the
BL2 and Trusted-Firmware-M binary addresses are aligned to 0x100 byte bou=
ndary
for Cortex-M0+ based platforms.

This is required because:
For Cortex-M0+ VTOR: 256-byte vector table is at the offset 0x00 of the i=
mage.
To keep that table in one block, the image base must be a multiple of 0x1=
00.
For reference: https://developer.arm.com/documentation/ddi0419/latest/

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...L2-and-TF-M-binary-address-alignment.patch | 134 ++++++++++++++++++
 .../trusted-firmware-m-2.2.1-src.inc          |   2 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/0001-Ad=
d-checks-for-BL2-and-TF-M-binary-address-alignment.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/0001-Add-check=
s-for-BL2-and-TF-M-binary-address-alignment.patch b/meta-arm/recipes-bsp/=
trusted-firmware-m/files/0001-Add-checks-for-BL2-and-TF-M-binary-address-=
alignment.patch
new file mode 100644
index 00000000..4bed3353
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/files/0001-Add-checks-for-B=
L2-and-TF-M-binary-address-alignment.patch
@@ -0,0 +1,134 @@
+From 57a1a4cbbc40342c88a6fe2f4eaeadbd15dcbfa6 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Fri, 22 Aug 2025 20:34:10 +0000
+Subject: [PATCH 2/2] Add checks for BL2 and TF-M binary address alignmen=
t
+
+Add relevant checks in GCC linker scripts to validate if the
+BL2 and TF-M binary addresses are aligned to 0x100 byte boundary
+for Cortex-M0+ based platforms.
+
+Upstream-Status: Backport [069a9b5a3acece140369ff07281b26e25bc50026]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ platform/ext/common/gcc/tfm_common_bl2.ld           | 12 +++++++++++-
+ platform/ext/common/gcc/tfm_common_s.ld.template    | 13 ++++++++++++-
+ platform/ext/common/gcc/tfm_isolation_s.ld.template | 13 ++++++++++++-
+ platform/ext/common/tfm_s_linker_alignments.h       |  9 ++++++++-
+ 4 files changed, 43 insertions(+), 4 deletions(-)
+
+diff --git a/platform/ext/common/gcc/tfm_common_bl2.ld b/platform/ext/co=
mmon/gcc/tfm_common_bl2.ld
+index eee915210..65d75980b 100644
+--- a/platform/ext/common/gcc/tfm_common_bl2.ld
++++ b/platform/ext/common/gcc/tfm_common_bl2.ld
+@@ -1,5 +1,7 @@
+ ;/*
+-; * Copyright (c) 2022-2024 Arm Limited. All rights reserved.
++; * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributor=
s
++; *
++; * SPDX-License-Identifier: BSD-3-Clause
+ ; *
+ ; * Licensed under the Apache License, Version 2.0 (the "License");
+ ; * you may not use this file except in compliance with the License.
+@@ -33,6 +35,14 @@ MEMORY
+     RAM   (rwx) : ORIGIN =3D BL2_DATA_START, LENGTH =3D BL2_DATA_SIZE
+ }
+=20
++/* For Cortex-M0+ VTOR: 256-byte vector table is at the offset 0x00 of =
the image.
++ * To keep that table in one block, the image base must be a multiple o=
f 0x100.
++ * For reference: https://developer.arm.com/documentation/ddi0419/lates=
t/
++ */
++#if defined(__ARM_ARCH_6M__)
++CHECK_ALIGNMENT_256(BL2_CODE_START)
++#endif
++
+ __heap_size__  =3D BL2_HEAP_SIZE;
+ __msp_stack_size__ =3D BL2_MSP_STACK_SIZE;
+=20
+diff --git a/platform/ext/common/gcc/tfm_common_s.ld.template b/platform=
/ext/common/gcc/tfm_common_s.ld.template
+index 023f2224e..db6a2d570 100644
+--- a/platform/ext/common/gcc/tfm_common_s.ld.template
++++ b/platform/ext/common/gcc/tfm_common_s.ld.template
+@@ -1,5 +1,8 @@
+ ;/*
+-; * Copyright (c) 2009-2024 Arm Limited
++; * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributor=
s
++; *
++; * SPDX-License-Identifier: BSD-3-Clause
++; *
+ ; * Copyright (c) 2022-2024 Cypress Semiconductor Corporation (an Infin=
eon company)
+ ; * or an affiliate of Cypress Semiconductor Corporation. All rights re=
served.
+ ; *
+@@ -38,6 +41,14 @@ MEMORY
+ #endif
+ }
+=20
++/* For Cortex-M0+ VTOR: 256-byte vector table is at the offset 0x00 of =
the image.
++ * To keep that table in one block, the image base must be a multiple o=
f 0x100.
++ * For reference: https://developer.arm.com/documentation/ddi0419/lates=
t/
++ */
++#if defined(__ARM_ARCH_6M__)
++CHECK_ALIGNMENT_256(S_CODE_START)
++#endif
++
+ #ifndef TFM_LINKER_VENEERS_START
+ #define TFM_LINKER_VENEERS_START ALIGN(TFM_LINKER_VENEERS_ALIGNMENT)
+ #endif
+diff --git a/platform/ext/common/gcc/tfm_isolation_s.ld.template b/platf=
orm/ext/common/gcc/tfm_isolation_s.ld.template
+index 00693a19d..6c4f13efa 100644
+--- a/platform/ext/common/gcc/tfm_isolation_s.ld.template
++++ b/platform/ext/common/gcc/tfm_isolation_s.ld.template
+@@ -1,5 +1,8 @@
+ ;/*
+-; * Copyright (c) 2009-2024 Arm Limited
++; * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributor=
s
++; *
++; * SPDX-License-Identifier: BSD-3-Clause
++; *
+ ; * Copyright (c) 2022-2024 Cypress Semiconductor Corporation (an Infin=
eon company)
+ ; * or an affiliate of Cypress Semiconductor Corporation. All rights re=
served.
+ ; *
+@@ -47,6 +50,14 @@ MEMORY
+ #endif
+ }
+=20
++/* For Cortex-M0+ VTOR: 256-byte vector table is at the offset 0x00 of =
the image.
++ * To keep that table in one block, the image base must be a multiple o=
f 0x100.
++ * For reference: https://developer.arm.com/documentation/ddi0419/lates=
t/
++ */
++#if defined(__ARM_ARCH_6M__)
++CHECK_ALIGNMENT_256(S_CODE_START)
++#endif
++
+ #ifndef TFM_LINKER_VENEERS_START
+ #define TFM_LINKER_VENEERS_START ALIGN(TFM_LINKER_VENEERS_ALIGNMENT)
+ #endif
+diff --git a/platform/ext/common/tfm_s_linker_alignments.h b/platform/ex=
t/common/tfm_s_linker_alignments.h
+index 0d115575c..fb96938c9 100644
+--- a/platform/ext/common/tfm_s_linker_alignments.h
++++ b/platform/ext/common/tfm_s_linker_alignments.h
+@@ -1,7 +1,8 @@
+ /*
+  * Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon co=
mpany)
+  * or an affiliate of Cypress Semiconductor Corporation. All rights res=
erved.
+- * Copyright (c) 2024, Arm Limited. All rights reserved.
++ *
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -21,6 +22,12 @@
+=20
+ #define CHECK_ALIGNMENT_4(size) ASSERT((size) % 4 =3D=3D 0, #size)
+=20
++/* For Cortex-M0+ VTOR: 256-byte vector table is at the offset 0x00 of =
the image.
++ * To keep that table in one block, the image base must be a multiple o=
f 0x100.
++ * For reference: https://developer.arm.com/documentation/ddi0419/lates=
t/
++ */
++#define CHECK_ALIGNMENT_256(addr) ASSERT((addr % 256) =3D=3D 0, #addr)
++
+ /* Default alignment for linker file sections is set to 32 because ARM =
TrustZone
+  * protection units (SAU and MPU) require regions to be 32 bytes aligne=
d. */
+ #ifndef TFM_LINKER_DEFAULT_ALIGNMENT
+--=20
+2.43.0
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.1-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.1-src.inc
index 35ef8f8c..833d257a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.1-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.1-sr=
c.inc
@@ -21,7 +21,9 @@ SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.c=
om/mcu-tools/mcuboot.git;pr
 SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
+
 SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
+            file://0001-Add-checks-for-BL2-and-TF-M-binary-address-align=
ment.patch \
             ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm-extras \
             ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtf-m-tests \
             ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dcmsis \

