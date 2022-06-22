Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C473FC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 13:39:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7315.1655905166957276786
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 06:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3D8E1042;
	Wed, 22 Jun 2022 06:39:26 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.85.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72AAC3F534;
	Wed, 22 Jun 2022 06:39:25 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	jiamei.xie@arm.com
Subject: [PATCH 2/2][kirkstone] arm-bsp/fvp-baser-aemv8r64: Use secure
 hypervisor physical timer in EL2
Date: Wed, 22 Jun 2022 14:39:09 +0100
Message-Id: <20220622133909.1526025-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622133909.1526025-1-peter.hoyes@arm.com>
References: <20220622133909.1526025-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 13:39:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3529

From: Jiamei Xie <jiamei.xie@arm.com>

Arm generic timer provides different timers for different exception
levels and different secure states. Because Armv8-R AArch64 has secure
state only, the valid timer for hypervisor in EL2 is secure hypervisor
physical timer. But for platform fvp-baser-aemv8r64, before FVP 11.18,
the secure hypervisor physical timer could not work well in EL2, so we
had been using Non-secure physical timer in EL2 for hypervisor as a
workaround.

Since secure hypervisor physical timer issue has been fixed from FVP
11.18, we can use this correct timer in EL2 for hypervisor now. So we
update the device tree timer node to use secure hypervisor physical
timer interrupt for hypervisor.

About the interrupt assignments of FVP, please refer to
https://developer.arm.com/documentation/100964/latest/Base-Platform/Base-=
--interrupt-assignments

Issue-Id: SCM-4596
Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
Change-Id: I9d4b9f4e0ed14c6c1567269c83696ceb9ff84ac8
---
 .../linux/files/fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/f=
vp-baser-aemv8r64.dts b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser=
-aemv8r64/fvp-baser-aemv8r64.dts
index 1a4e501..6911a59 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
@@ -186,7 +186,7 @@
                 interrupts =3D <0x1 13 0xff08>,
                              <0x1 14 0xff08>,
                              <0x1 11 0xff08>,
-                             <0x1 10 0xff08>;
+                             <0x1  4 0xff08>;
                 clock-frequency =3D <100000000>;
         };
=20
--=20
2.25.1


