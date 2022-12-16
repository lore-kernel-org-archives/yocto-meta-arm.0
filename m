Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A98EC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 20:28:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5463.1671222475909904597
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 12:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 507161474;
	Fri, 16 Dec 2022 12:28:36 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24DF73F71E;
	Fri, 16 Dec 2022 12:27:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/4] arm-bsp/edk2-firmware: allow clang builds on juno
Date: Fri, 16 Dec 2022 20:27:50 +0000
Message-Id: <20221216202751.1031059-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216202751.1031059-1-ross.burton@arm.com>
References: <20221216202751.1031059-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Dec 2022 20:28:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4204

This now works, so there's no need to restrict it to gcc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc b/meta-=
arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc
index aac0d1cb..44613f13 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc
@@ -3,7 +3,3 @@ EDK2_PLATFORM_DSC  =3D "Platform/ARM/JunoPkg/ArmJuno.dsc"
 EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
=20
 COMPATIBLE_MACHINE =3D "juno"
-
-# As of 2022-06-14 with 2022.05, clang builds fail:
-# "The required fv image size 0x104048 exceeds the set fv image size 0xf=
9000"
-TOOLCHAIN =3D "gcc"
--=20
2.34.1


