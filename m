Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C5ACCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 16:54:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22400.1762880078625152151
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 08:54:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 964B6497;
	Tue, 11 Nov 2025 08:54:30 -0800 (PST)
Received: from e132995.arm.com (unknown [10.57.87.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5FF83F5A1;
	Tue, 11 Nov 2025 08:54:37 -0800 (PST)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-a: corstone1000: Add patch for removing dependency of GICC frame for GICv3
Date: Tue, 11 Nov 2025 16:54:22 +0000
Message-Id: <20251111165422.303832-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111165422.303832-1-harsimransingh.tungal@arm.com>
References: <20251111165422.303832-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Nov 2025 16:54:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6766

GICC registers are not defined for GICv3. Trusted-Firmware-A throws error=
 when
GICC register address is not defined even for GICv3. Adding patch
to handle this in Trusted-Firmware-A.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...quire-the-GICC-frame-to-be-defined-o.patch | 45 +++++++++++++++++++
 .../trusted-firmware-a_2.13.0.bb              |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0002-fi=
x-css-don-t-require-the-GICC-frame-to-be-defined-o.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0002-fix-css-d=
on-t-require-the-GICC-frame-to-be-defined-o.patch b/meta-arm/recipes-bsp/=
trusted-firmware-a/files/0002-fix-css-don-t-require-the-GICC-frame-to-be-=
defined-o.patch
new file mode 100644
index 00000000..cef26ba0
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0002-fix-css-don-t-re=
quire-the-GICC-frame-to-be-defined-o.patch
@@ -0,0 +1,45 @@
+From 60d103759b0835d61d90c8f2fbc7cf55f37e61a0 Mon Sep 17 00:00:00 2001
+From: Boyan Karatotev <boyan.karatotev@arm.com>
+Date: Wed, 22 Oct 2025 13:52:28 +0100
+Subject: [PATCH] fix(css): don't require the GICC frame to be defined on=
 GICv3
+
+It's used for GICv2 operation, which won't happen with v3. CSS will
+always use USE_GIC_DRIVER with the correct version so we can rely on
+that to skip passing the GICC frame.
+
+Upstream-Status: Backport [e3c36e35f8f92f817e537064d97a3816c339c704]
+Change-Id: I358b99646f98bd7c6ea398bc8d8900cc80ca15bb
+Signed-off-by: Boyan Karatotev <boyan.karatotev@arm.com>
+---
+ include/plat/arm/css/common/aarch64/css_macros.S | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/include/plat/arm/css/common/aarch64/css_macros.S b/include/=
plat/arm/css/common/aarch64/css_macros.S
+index 85a7044d7..8a687d582 100644
+--- a/include/plat/arm/css/common/aarch64/css_macros.S
++++ b/include/plat/arm/css/common/aarch64/css_macros.S
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2015, ARM Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2015-2025, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -18,7 +18,14 @@
+ 	 */
+ 	.macro css_print_gic_regs
+ 	mov_imm	x16, PLAT_ARM_GICD_BASE
++	/*
++	 * The ID registers will show GIC version, so it can safely be assumed
++	 * that no v2 operation will be attempted on v3. Don't require the
++	 * macro.
++	 */
++#if USE_GIC_DRIVER =3D=3D 2
+ 	mov_imm	x17, PLAT_ARM_GICC_BASE
++#endif
+ 	arm_print_gic_regs
+ 	.endm
+=20
+--=20
+2.43.0
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.13.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
3.0.bb
index 3de30bca..ed9d42a2 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.b=
b
@@ -16,4 +16,5 @@ LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md=
5=3D379d5819937a6c2f1ef1630d3
=20
 SRC_URI +=3D "\
     file://0001-fix-arm-re-enable-console-by-default-in-BL31.patch \
+    file://0002-fix-css-don-t-require-the-GICC-frame-to-be-defined-o.pat=
ch \
 "

