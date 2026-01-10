Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BF3D277F3
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 16:52:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12003.1768063963739785841
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 10 Jan 2026 08:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CBCE1516
	for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 08:52:36 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E0FE3F6A8
	for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 08:52:43 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] arm/trusted-firmware-m: drop unreferenced patch
Date: Sat, 10 Jan 2026 11:52:37 -0500
Message-ID: <20260110165242.38662-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 16:52:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6830

Forgot to remove this patch in the previous commit.  Removing now.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...L2-and-TF-M-binary-address-alignment.patch | 134 ------------------
 1 file changed, 134 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/0001-Ad=
d-checks-for-BL2-and-TF-M-binary-address-alignment.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/0001-Add-check=
s-for-BL2-and-TF-M-binary-address-alignment.patch b/meta-arm/recipes-bsp/=
trusted-firmware-m/files/0001-Add-checks-for-BL2-and-TF-M-binary-address-=
alignment.patch
deleted file mode 100644
index 4bed335388db..000000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/files/0001-Add-checks-for-B=
L2-and-TF-M-binary-address-alignment.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 57a1a4cbbc40342c88a6fe2f4eaeadbd15dcbfa6 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Fri, 22 Aug 2025 20:34:10 +0000
-Subject: [PATCH 2/2] Add checks for BL2 and TF-M binary address alignmen=
t
-
-Add relevant checks in GCC linker scripts to validate if the
-BL2 and TF-M binary addresses are aligned to 0x100 byte boundary
-for Cortex-M0+ based platforms.
-
-Upstream-Status: Backport [069a9b5a3acece140369ff07281b26e25bc50026]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- platform/ext/common/gcc/tfm_common_bl2.ld           | 12 +++++++++++-
- platform/ext/common/gcc/tfm_common_s.ld.template    | 13 ++++++++++++-
- platform/ext/common/gcc/tfm_isolation_s.ld.template | 13 ++++++++++++-
- platform/ext/common/tfm_s_linker_alignments.h       |  9 ++++++++-
- 4 files changed, 43 insertions(+), 4 deletions(-)
-
-diff --git a/platform/ext/common/gcc/tfm_common_bl2.ld b/platform/ext/co=
mmon/gcc/tfm_common_bl2.ld
-index eee915210..65d75980b 100644
---- a/platform/ext/common/gcc/tfm_common_bl2.ld
-+++ b/platform/ext/common/gcc/tfm_common_bl2.ld
-@@ -1,5 +1,7 @@
- ;/*
--; * Copyright (c) 2022-2024 Arm Limited. All rights reserved.
-+; * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributor=
s
-+; *
-+; * SPDX-License-Identifier: BSD-3-Clause
- ; *
- ; * Licensed under the Apache License, Version 2.0 (the "License");
- ; * you may not use this file except in compliance with the License.
-@@ -33,6 +35,14 @@ MEMORY
-     RAM   (rwx) : ORIGIN =3D BL2_DATA_START, LENGTH =3D BL2_DATA_SIZE
- }
-=20
-+/* For Cortex-M0+ VTOR: 256-byte vector table is at the offset 0x00 of =
the image.
-+ * To keep that table in one block, the image base must be a multiple o=
f 0x100.
-+ * For reference: https://developer.arm.com/documentation/ddi0419/lates=
t/
-+ */
-+#if defined(__ARM_ARCH_6M__)
-+CHECK_ALIGNMENT_256(BL2_CODE_START)
-+#endif
-+
- __heap_size__  =3D BL2_HEAP_SIZE;
- __msp_stack_size__ =3D BL2_MSP_STACK_SIZE;
-=20
-diff --git a/platform/ext/common/gcc/tfm_common_s.ld.template b/platform=
/ext/common/gcc/tfm_common_s.ld.template
-index 023f2224e..db6a2d570 100644
---- a/platform/ext/common/gcc/tfm_common_s.ld.template
-+++ b/platform/ext/common/gcc/tfm_common_s.ld.template
-@@ -1,5 +1,8 @@
- ;/*
--; * Copyright (c) 2009-2024 Arm Limited
-+; * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributor=
s
-+; *
-+; * SPDX-License-Identifier: BSD-3-Clause
-+; *
- ; * Copyright (c) 2022-2024 Cypress Semiconductor Corporation (an Infin=
eon company)
- ; * or an affiliate of Cypress Semiconductor Corporation. All rights re=
served.
- ; *
-@@ -38,6 +41,14 @@ MEMORY
- #endif
- }
-=20
-+/* For Cortex-M0+ VTOR: 256-byte vector table is at the offset 0x00 of =
the image.
-+ * To keep that table in one block, the image base must be a multiple o=
f 0x100.
-+ * For reference: https://developer.arm.com/documentation/ddi0419/lates=
t/
-+ */
-+#if defined(__ARM_ARCH_6M__)
-+CHECK_ALIGNMENT_256(S_CODE_START)
-+#endif
-+
- #ifndef TFM_LINKER_VENEERS_START
- #define TFM_LINKER_VENEERS_START ALIGN(TFM_LINKER_VENEERS_ALIGNMENT)
- #endif
-diff --git a/platform/ext/common/gcc/tfm_isolation_s.ld.template b/platf=
orm/ext/common/gcc/tfm_isolation_s.ld.template
-index 00693a19d..6c4f13efa 100644
---- a/platform/ext/common/gcc/tfm_isolation_s.ld.template
-+++ b/platform/ext/common/gcc/tfm_isolation_s.ld.template
-@@ -1,5 +1,8 @@
- ;/*
--; * Copyright (c) 2009-2024 Arm Limited
-+; * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributor=
s
-+; *
-+; * SPDX-License-Identifier: BSD-3-Clause
-+; *
- ; * Copyright (c) 2022-2024 Cypress Semiconductor Corporation (an Infin=
eon company)
- ; * or an affiliate of Cypress Semiconductor Corporation. All rights re=
served.
- ; *
-@@ -47,6 +50,14 @@ MEMORY
- #endif
- }
-=20
-+/* For Cortex-M0+ VTOR: 256-byte vector table is at the offset 0x00 of =
the image.
-+ * To keep that table in one block, the image base must be a multiple o=
f 0x100.
-+ * For reference: https://developer.arm.com/documentation/ddi0419/lates=
t/
-+ */
-+#if defined(__ARM_ARCH_6M__)
-+CHECK_ALIGNMENT_256(S_CODE_START)
-+#endif
-+
- #ifndef TFM_LINKER_VENEERS_START
- #define TFM_LINKER_VENEERS_START ALIGN(TFM_LINKER_VENEERS_ALIGNMENT)
- #endif
-diff --git a/platform/ext/common/tfm_s_linker_alignments.h b/platform/ex=
t/common/tfm_s_linker_alignments.h
-index 0d115575c..fb96938c9 100644
---- a/platform/ext/common/tfm_s_linker_alignments.h
-+++ b/platform/ext/common/tfm_s_linker_alignments.h
-@@ -1,7 +1,8 @@
- /*
-  * Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon co=
mpany)
-  * or an affiliate of Cypress Semiconductor Corporation. All rights res=
erved.
-- * Copyright (c) 2024, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -21,6 +22,12 @@
-=20
- #define CHECK_ALIGNMENT_4(size) ASSERT((size) % 4 =3D=3D 0, #size)
-=20
-+/* For Cortex-M0+ VTOR: 256-byte vector table is at the offset 0x00 of =
the image.
-+ * To keep that table in one block, the image base must be a multiple o=
f 0x100.
-+ * For reference: https://developer.arm.com/documentation/ddi0419/lates=
t/
-+ */
-+#define CHECK_ALIGNMENT_256(addr) ASSERT((addr % 256) =3D=3D 0, #addr)
-+
- /* Default alignment for linker file sections is set to 32 because ARM =
TrustZone
-  * protection units (SAU and MPU) require regions to be 32 bytes aligne=
d. */
- #ifndef TFM_LINKER_DEFAULT_ALIGNMENT
---=20
-2.43.0
-
--=20
2.50.1 (Apple Git-155)


