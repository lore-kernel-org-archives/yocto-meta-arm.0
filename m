Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2188BCDD1CF
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 17:44:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.75263.1727459068208059595
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 10:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30D0214BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 10:44:57 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 94AFA3F587
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 10:44:27 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-base: use trusted-firmware-a v2.11
Date: Fri, 27 Sep 2024 13:44:26 -0400
Message-Id: <20240927174426.80998-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 17:44:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6135

Update to use the latest version of tf-a.  The patch for virtio was
upstreamed and already in v2.11.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       |  1 -
 ...d-stdout-path-and-virtio-net-and-rng.patch | 64 -------------------
 .../trusted-firmware-a-fvp-base.inc           |  1 -
 3 files changed, 66 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp=
-base/0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index cbfd79d25828..03896a347184 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -9,7 +9,6 @@ require conf/machine/include/arm/arch-armv8-4a.inc
 ARM_SYSTEMREADY_FIRMWARE =3D "trusted-firmware-a:do_deploy"
 ARM_SYSTEMREADY_ACS_CONSOLE =3D "default"
 EXTRA_IMAGEDEPENDS =3D "${ARM_SYSTEMREADY_FIRMWARE}"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
=20
 MACHINE_FEATURES =3D "efi vfat"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/0=
001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/0001-fdts-fvp-base-Add=
-stdout-path-and-virtio-net-and-rng.patch
deleted file mode 100644
index 4d0019a50138..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/0001-fdt=
s-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b79d3cf319cc5698311ef83247110c93d3c2de2c Mon Sep 17 00:00:00 2001
-Message-Id: <b79d3cf319cc5698311ef83247110c93d3c2de2c.1695834344.git.die=
go.sueiro@arm.com>
-From: Diego Sueiro <diego.sueiro@arm.com>
-Date: Wed, 27 Sep 2023 18:05:26 +0100
-Subject: [PATCH] fdts/fvp-base: Add stdout-path and virtio net and rng n=
odes
-
-Upstream-Status: Pending
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- fdts/fvp-base-psci-common.dtsi |  8 ++++++--
- fdts/rtsm_ve-motherboard.dtsi  | 12 ++++++++++++
- 2 files changed, 18 insertions(+), 2 deletions(-)
-
-diff --git a/fdts/fvp-base-psci-common.dtsi b/fdts/fvp-base-psci-common.=
dtsi
-index 79cf37d3b0..b1ba5ce703 100644
---- a/fdts/fvp-base-psci-common.dtsi
-+++ b/fdts/fvp-base-psci-common.dtsi
-@@ -30,7 +30,9 @@
- #if (ENABLE_RME =3D=3D 1)
- 	chosen { bootargs =3D "console=3DttyAMA0 earlycon=3Dpl011,0x1c090000 r=
oot=3D/dev/vda ip=3Don";};
- #else
--	chosen {};
-+	chosen {
-+		stdout-path =3D &v2m_serial0;
-+	};
- #endif
-=20
- 	aliases {
-@@ -243,6 +245,8 @@
- 				<0 0 39 &gic 0 GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
- 				<0 0 40 &gic 0 GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
- 				<0 0 41 &gic 0 GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
--				<0 0 42 &gic 0 GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-+				<0 0 42 &gic 0 GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
-+				<0 0 44 &gic 0 GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
-+				<0 0 46 &gic 0 GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
- 	};
- };
-diff --git a/fdts/rtsm_ve-motherboard.dtsi b/fdts/rtsm_ve-motherboard.dt=
si
-index 0a824b349a..21a083a51a 100644
---- a/fdts/rtsm_ve-motherboard.dtsi
-+++ b/fdts/rtsm_ve-motherboard.dtsi
-@@ -230,6 +230,18 @@
- 					interrupts =3D <42>;
- 				};
-=20
-+				virtio@150000 {
-+					compatible =3D "virtio,mmio";
-+					reg =3D <0x150000 0x200>;
-+					interrupts =3D <44>;
-+				};
-+
-+				virtio@200000 {
-+					compatible =3D "virtio,mmio";
-+					reg =3D <0x200000 0x200>;
-+					interrupts =3D <46>;
-+				};
-+
- 				rtc@170000 {
- 					compatible =3D "arm,pl031", "arm,primecell";
- 					reg =3D <0x170000 0x1000>;
---=20
-2.39.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-base.inc
index 4c37f7cb723e..a5d1ee53515b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -7,7 +7,6 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:${THISDIR}/files/fvp-bas=
e"
=20
 SRC_URI:append =3D " \
-    file://0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.pat=
ch \
     file://optee_spmc_maifest.dts;subdir=3Dgit/plat/arm/board/fvp/fdts \
 "
=20
--=20
2.39.3 (Apple Git-146)


