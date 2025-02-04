Return-Path: <Philip.Puk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D5CC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 15:08:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.118539.1738681690844979690
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 07:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: philip.puk@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A0B611FB;
	Tue,  4 Feb 2025 07:08:34 -0800 (PST)
Received: from e125751.cambridge.arm.com (e125751.cambridge.arm.com [10.1.199.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D4613F63F;
	Tue,  4 Feb 2025 07:08:10 -0800 (PST)
From: Philip.puk@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Philip Puk <philip.puk@arm.com>
Subject: [PATCH 1/1] arm-bsp/u-boot: corstone1000: Reserve memory for RSS comm pointer access protocol
Date: Tue,  4 Feb 2025 15:05:27 +0000
Message-Id: <20250204150527.326455-2-Philip.puk@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204150527.326455-1-Philip.puk@arm.com>
References: <20250204150527.326455-1-Philip.puk@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Feb 2025 15:08:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6367

From: Philip Puk <philip.puk@arm.com>

This memory was used by OpenAMP to establish communication between
the Secure Enclave and Trusted Services. After transitioning from
OpenAMP to RSE_COMMS, this shared memory is now configured for the
pointer access protocol in RSE_COMMS.

Since this memory may be still used by a user-space application
in linux as U-Boot is passing an EFI memory map starting from
0x80000000, this memory range should be reserved as the
pointer access protocol may be enabled on corstone1000 in the future.

Signed-off-by: Philip Puk <philip.puk@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 .../0052-reserve-memory-for-se-comm.patch     | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
052-reserve-memory-for-se-comm.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 2470db02..bb9da10d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -68,6 +68,7 @@ SRC_URI:append =3D " \
     file://0050-fwu-Use-metadata-v2.patch	  \
     ${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000-extsys', \
                          '', 'file://0051-corstone1000-purge-remoteproc-=
dts-node.patch' , d)} \
+    file://0052-reserve-memory-for-se-comm.patch \
     "
=20
 do_configure:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-res=
erve-memory-for-se-comm.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/co=
rstone1000/0052-reserve-memory-for-se-comm.patch
new file mode 100644
index 00000000..73fdc4bd
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-reserve-me=
mory-for-se-comm.patch
@@ -0,0 +1,46 @@
+From 8fdd91630f335b71e55e570a011f07b083c47dd6 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Mon, 10 Jul 2023 19:00:43 +0100
+Subject: [PATCH] arm-bsp/u-boot: Reserve memory for RSS comm pointer acc=
ess protocol
+
+This memory was used by OpenAMP to establish communication between
+the Secure Enclave and Trusted Services. After transitioning from
+OpenAMP to RSE_COMMS, this shared memory is now configured for the
+pointer access protocol in RSE_COMMS.
+
+Since this memory may be still used by a user-space application
+in linux as U-Boot is passing an EFI memory map starting from
+0x80000000, this memory range should be reserved as the
+pointer access protocol may be enabled on corstone1000 in the future.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+
+---
+ arch/arm/dts/corstone1000.dtsi | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
+index 0f8ad255ce..a71b89c025 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -45,6 +45,17 @@
+ 		lba =3D <65536>;
+ 	};
+=20
++	reserved-memory {
++		#address-cells =3D <2>;
++		#size-cells =3D <2>;
++		ranges;
++
++		smem_mem: smem_region@88000000 {
++			reg =3D <0x0 0x88000000 0x0 0x100000>;
++			no-map;
++		};
++	};
++
+ 	gic: interrupt-controller@1c000000 {
+ 		compatible =3D "arm,gic-400";
+ 		#interrupt-cells =3D <3>;
+--=20
+2.17.1
--=20
2.25.1


