Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA618C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 11:23:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8982.1645701832886894897
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 03:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78FEA106F;
	Thu, 24 Feb 2022 03:23:52 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E21123F70D;
	Thu, 24 Feb 2022 03:23:51 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH honister 1/8] arm-bsp/fvp-baser-aemv8r64: Fix PL011 and SP805
 register sizes
Date: Thu, 24 Feb 2022 11:22:37 +0000
Message-Id: <20220224112244.1521611-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224112244.1521611-1-peter.hoyes@arm.com>
References: <20220224112244.1521611-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Feb 2022 11:23:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3049

From: Peter Hoyes <Peter.Hoyes@arm.com>

The Linux kernel expects the peripheral ID register to be just below the
end of the address range, which for the PL011 and SP805 is at 0xFE0 not
0xFFE0, so set the size to 0x1000.

Issue-Id: SCM-3881
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Iada28e8192d72b1647822c33d13deffe507043b5
---
 .../files/fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/f=
vp-baser-aemv8r64.dts b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser=
-aemv8r64/fvp-baser-aemv8r64.dts
index dfc6f7e..4d6640a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
@@ -111,7 +111,7 @@
=20
         uart@9c090000 {
                 compatible =3D "arm,pl011", "arm,primecell";
-                reg =3D <0x0 0x9c090000 0x0 0x10000>;
+                reg =3D <0x0 0x9c090000 0x0 0x1000>;
                 interrupts =3D <0x0 5 0x4>;
                 clocks =3D <&refclk24mhz>, <&refclk100mhz>;
                 clock-names =3D "uartclk", "apb_pclk";
@@ -119,7 +119,7 @@
=20
         uart@9c0a0000 {
                 compatible =3D "arm,pl011", "arm,primecell";
-                reg =3D <0x0 0x9c0a0000 0x0 0x10000>;
+                reg =3D <0x0 0x9c0a0000 0x0 0x1000>;
                 interrupts =3D <0x0 6 0x4>;
                 clocks =3D <&refclk24mhz>, <&refclk100mhz>;
                 clock-names =3D "uartclk", "apb_pclk";
@@ -127,7 +127,7 @@
=20
         uart@9c0b0000 {
                 compatible =3D "arm,pl011", "arm,primecell";
-                reg =3D <0x0 0x9c0b0000 0x0 0x10000>;
+                reg =3D <0x0 0x9c0b0000 0x0 0x1000>;
                 interrupts =3D <0x0 7 0x4>;
                 clocks =3D <&refclk24mhz>, <&refclk100mhz>;
                 clock-names =3D "uartclk", "apb_pclk";
@@ -135,7 +135,7 @@
=20
         uart@9c0c0000 {
                 compatible =3D "arm,pl011", "arm,primecell";
-                reg =3D <0x0 0x9c0c0000 0x0 0x10000>;
+                reg =3D <0x0 0x9c0c0000 0x0 0x1000>;
                 interrupts =3D <0x0 8 0x4>;
                 clocks =3D <&refclk24mhz>, <&refclk100mhz>;
                 clock-names =3D "uartclk", "apb_pclk";
@@ -143,7 +143,7 @@
=20
         wdt@9c0f0000 {
                 compatible =3D "arm,sp805", "arm,primecell";
-                reg =3D <0x0 0x9c0f0000 0x0 0x10000>;
+                reg =3D <0x0 0x9c0f0000 0x0 0x1000>;
                 interrupts =3D <0x0 0 0x4>;
                 clocks =3D <&refclk24mhz>, <&refclk100mhz>;
                 clock-names =3D "wdog_clk", "apb_pclk";
--=20
2.25.1


