Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAC1C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 14:02:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5772.1668434512192574912
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Nov 2022 06:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5591A23A;
	Mon, 14 Nov 2022 06:01:57 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99DE23F73D;
	Mon, 14 Nov 2022 06:01:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH][kirkstone] arm-bsp/linux-yocto: refresh juno-dts-mhu-doorbell.patch for 5.15.72
Date: Mon, 14 Nov 2022 14:01:45 +0000
Message-Id: <20221114140145.190556-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 14:02:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4123

The linux-yocto recipe in oe-core upgraded to 5.15.72, so rebase the
doorbell patches to apply correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/files/juno/juno-dts-mhu-doorbell.patch             | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/juno-dts-mhu-do=
orbell.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/juno-dts-mhu-=
doorbell.patch
index 81f641c4..ca0ba6f9 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/juno-dts-mhu-doorbell.=
patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/juno-dts-mhu-doorbell.=
patch
@@ -24,7 +24,7 @@ diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/a=
rch/arm64/boot/dts/arm/ju
 index 6288e104a089..36844f7d861e 100644
 --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
 +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
-@@ -23,11 +23,12 @@ frame@2a830000 {
+@@ -23,12 +23,13 @@ frame@2a830000 {
  	};
 =20
  	mailbox: mhu@2b1f0000 {
@@ -32,7 +32,8 @@ index 6288e104a089..36844f7d861e 100644
 +		compatible =3D "arm,mhu-doorbell", "arm,primecell";
  		reg =3D <0x0 0x2b1f0000 0x0 0x1000>;
  		interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
- 			     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+ 			     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+ 			     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 -		#mbox-cells =3D <1>;
 +		#mbox-cells =3D <2>;
 +		mbox-name =3D "ARM-MHU";
--=20
2.34.1


