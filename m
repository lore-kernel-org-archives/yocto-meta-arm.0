Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872E8C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 18:41:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.502.1649264968981185447
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 10:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6EC323A;
	Wed,  6 Apr 2022 10:09:27 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B55D3F5A1;
	Wed,  6 Apr 2022 10:09:26 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-bsp/linux-yocto: Enable virtio-rng for fvp-baser-aemv8r64
Date: Wed,  6 Apr 2022 18:09:15 +0100
Message-Id: <20220406170915.304097-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Apr 2022 18:41:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3245

From: Peter Hoyes <Peter.Hoyes@arm.com>

A virtio-rng is available from FVP_BaseR_AEMv8R version 11.17, so add
to the device tree and enable the correpsonding FVP configuration flag.

This improves the boot time and removes the following warning in the
boot log:

    random: udevd: uninitialized urandom read (16 bytes read)

Issue-Id: SCM-4304
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ic935d0b935e21965a489a55db09c4a5f9ac51366
---
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf           | 1 +
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md            | 3 ++-
 .../linux/files/fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts   | 6 ++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 1f1b170..db8c4fe 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -61,5 +61,6 @@ FVP_CONFIG[gic_distributor.has-two-security-states] ?=3D=
 "0"
 FVP_CONFIG[pctl.startup] ?=3D "0.0.0.*"
 FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
 FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
+FVP_CONFIG[bp.virtio_rng.enabled] ?=3D "1"
 FVP_CONFIG[bp.vis.rate_limit-enable] ?=3D "0"
 FVP_CONFIG[bp.refcounter.use_real_time] ?=3D "1"
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index a864f9f..eeeb4fa 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -226,6 +226,7 @@ Devices supported in the kernel
 - virtio 9p
 - virtio disk
 - virtio network
+- virtio rng
 - watchdog
 - rtc
=20
@@ -243,7 +244,7 @@ Known Issues and Limitations
=20
 Change Log
 ----------
-
+- Added virtio\_rng to improve random number generation.
 - Added U-Boot v2022.01 for UEFI support.
 - Updated Linux kernel version from 5.14 to 5.15 for both standard and
   Real-Time (PREEMPT\_RT) builds.
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/f=
vp-baser-aemv8r64.dts b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser=
-aemv8r64/fvp-baser-aemv8r64.dts
index a5078f2..1a4e501 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
@@ -175,6 +175,12 @@
                 interrupts =3D <0x0 44 0x4>;
         };
=20
+        virtio-rng@9c200000 {
+                compatible =3D "virtio,mmio";
+                reg =3D <0 0x9c200000 0 0x200>;
+                interrupts =3D <0x0 46 0x4>;
+        };
+
         timer {
                 compatible =3D "arm,armv8-timer";
                 interrupts =3D <0x1 13 0xff08>,
--=20
2.25.1


