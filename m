Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC71AC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:11:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1794.1645114278762767082
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 08:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B246113E;
	Thu, 17 Feb 2022 08:11:18 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.87.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55EA43F718;
	Thu, 17 Feb 2022 08:11:17 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 4/6] arm-bsp/kernel: Use 4 Gb of RAM in fvp-baser-aemv8r64
Date: Thu, 17 Feb 2022 16:09:57 +0000
Message-Id: <20220217160959.4157807-5-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217160959.4157807-1-peter.hoyes@arm.com>
References: <20220217160959.4157807-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 16:11:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3019

From: Peter Hoyes <Peter.Hoyes@arm.com>

The FVP default configuration has bp.dram_size=3D4, which is sufficient
for development and testing purposes, so remove the FVP_CONFIG
override and set to 4 Gb in the device tree.

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I4a96062c9e94d36f5459f33c86aab4d4885bab43
---
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf               | 1 -
 .../linux/files/fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts       | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 96db158..f7bed76 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -39,7 +39,6 @@ FVP_CONSOLE ?=3D "terminal_0"
 FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.wic"
 FVP_CONFIG[bp.dram_metadata.init_value] ?=3D "0"
 FVP_CONFIG[bp.dram_metadata.is_enabled] ?=3D "true"
-FVP_CONFIG[bp.dram_size] ?=3D "8"
 FVP_CONFIG[bp.exclusive_monitor.monitor_access_level] ?=3D "1"
 FVP_CONFIG[bp.pl011_uart0.unbuffered_output] ?=3D "1"
 FVP_CONFIG[bp.pl011_uart0.untimed_fifos] ?=3D "true"
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/f=
vp-baser-aemv8r64.dts b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser=
-aemv8r64/fvp-baser-aemv8r64.dts
index 4d6640a..a5078f2 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
@@ -13,7 +13,7 @@
                 #size-cells =3D <0x2>;
                 device_type =3D "memory";
                 reg =3D <0x0        0x0        0x0 0x80000000>,
-                      <0x00000008 0x80000000 0x1 0x80000000>;
+                      <0x00000008 0x80000000 0x0 0x80000000>;
         };
=20
         cpus {
--=20
2.25.1


