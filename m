Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE82C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:53:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12760.1692888786410917549
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 07:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A760D75;
	Thu, 24 Aug 2023 07:53:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 583D33F762;
	Thu, 24 Aug 2023 07:53:05 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone] arm-bsp/secure-partitions: fix build with GCC 11.4
Date: Thu, 24 Aug 2023 15:53:03 +0100
Message-Id: <20230824145303.1956465-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Aug 2023 14:53:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4993

From: Ross Burton <ross.burton@arm.com>

GCC 11.4 has improved code generation and needs the __aarch64_cas4_sync
intrinsic from libgcc, but one of the modules here doesn't link to
libgcc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...7-Add-openamp-to-SE-proxy-deployment.patch | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/00=
07-Add-openamp-to-SE-proxy-deployment.patch
index 06fb4979..3cb44aaf 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
@@ -53,7 +53,7 @@ new file mode 100644
 index 0000000..840683a
 --- /dev/null
 +++ b/deployments/se-proxy/opteesp/lse.S
-@@ -0,0 +1,19 @@
+@@ -0,0 +1,28 @@
 +// SPDX-License-Identifier: BSD-3-Clause
 +/*
 + * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
@@ -61,18 +61,27 @@ index 0000000..840683a
 +
 +.text
 +.globl __aarch64_cas4_acq_rel
++.globl __aarch64_cas4_sync
 +
 +__aarch64_cas4_acq_rel:
-+	mov	w16, w0
-+	ldaxr	w0, [x2]
-+	cmp	w0, w16
-+0:	bne	1f
++       mov     w16, w0
++       ldaxr   w0, [x2]
++       cmp     w0, w16
++0:     bne     1f
 +
-+	stlxr	w17, w1, [x2]
-+	cbnz	w17, 0b
-+1:	ret
++       stlxr   w17, w1, [x2]
++       cbnz    w17, 0b
++1:     ret
 +
++__aarch64_cas4_sync:
++       mov     w16, w0
++       ldxr    w0, [x2]
++       cmp     w0, w16
++0:     bne     1f
 +
++       stlxr   w17, w1, [x2]
++       cbnz    w17, 0b
++1:     ret
 diff --git a/external/openamp/libmetal.cmake b/external/openamp/libmetal=
.cmake
 new file mode 100644
 index 0000000..3a647e6
--=20
2.34.1


