Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504E1C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:39:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.53332.1697805577004164158
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 05:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 989A32F4
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:40:17 -0700 (PDT)
Received: from e127725.arm.com (unknown [10.57.36.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 286983F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:39:36 -0700 (PDT)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm-bsp/trusted-firmware-a/fvp-base: Add stdout path and virtio net and rng
Date: Fri, 20 Oct 2023 13:38:25 +0100
Message-Id: <20231020123827.346193-2-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020123827.346193-1-Debbie.Martin@arm.com>
References: <20231020123827.346193-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 12:39:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5155

Set the Trusted Firmware devicetree to fvp-base-gicv3-psci-1t. Patch the
devicetree to include: the stdout path for console access, a virtio net
node and a virtio rng node. This is necessary in the case that the
Trusted Firmware devicetree is passed to Linux from U-boot (rather than
sideloading).

Also rename the include file to change the suffix from "fvp" to "fvp-base=
".

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 ...d-stdout-path-and-virtio-net-and-rng.patch | 64 +++++++++++++++++++
 ...vp.inc =3D> trusted-firmware-a-fvp-base.inc} |  5 ++
 .../trusted-firmware-a_%.bbappend             |  2 +-
 3 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp=
-base/0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a-f=
vp.inc =3D> trusted-firmware-a-fvp-base.inc} (50%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/0=
001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/0001-fdts-fvp-base-Add=
-stdout-path-and-virtio-net-and-rng.patch
new file mode 100644
index 00000000..4d0019a5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/0001-fdt=
s-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch
@@ -0,0 +1,64 @@
+From b79d3cf319cc5698311ef83247110c93d3c2de2c Mon Sep 17 00:00:00 2001
+Message-Id: <b79d3cf319cc5698311ef83247110c93d3c2de2c.1695834344.git.die=
go.sueiro@arm.com>
+From: Diego Sueiro <diego.sueiro@arm.com>
+Date: Wed, 27 Sep 2023 18:05:26 +0100
+Subject: [PATCH] fdts/fvp-base: Add stdout-path and virtio net and rng n=
odes
+
+Upstream-Status: Pending
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ fdts/fvp-base-psci-common.dtsi |  8 ++++++--
+ fdts/rtsm_ve-motherboard.dtsi  | 12 ++++++++++++
+ 2 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/fdts/fvp-base-psci-common.dtsi b/fdts/fvp-base-psci-common.=
dtsi
+index 79cf37d3b0..b1ba5ce703 100644
+--- a/fdts/fvp-base-psci-common.dtsi
++++ b/fdts/fvp-base-psci-common.dtsi
+@@ -30,7 +30,9 @@
+ #if (ENABLE_RME =3D=3D 1)
+ 	chosen { bootargs =3D "console=3DttyAMA0 earlycon=3Dpl011,0x1c090000 r=
oot=3D/dev/vda ip=3Don";};
+ #else
+-	chosen {};
++	chosen {
++		stdout-path =3D &v2m_serial0;
++	};
+ #endif
+=20
+ 	aliases {
+@@ -243,6 +245,8 @@
+ 				<0 0 39 &gic 0 GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+ 				<0 0 40 &gic 0 GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+ 				<0 0 41 &gic 0 GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+-				<0 0 42 &gic 0 GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
++				<0 0 42 &gic 0 GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
++				<0 0 44 &gic 0 GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
++				<0 0 46 &gic 0 GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+ 	};
+ };
+diff --git a/fdts/rtsm_ve-motherboard.dtsi b/fdts/rtsm_ve-motherboard.dt=
si
+index 0a824b349a..21a083a51a 100644
+--- a/fdts/rtsm_ve-motherboard.dtsi
++++ b/fdts/rtsm_ve-motherboard.dtsi
+@@ -230,6 +230,18 @@
+ 					interrupts =3D <42>;
+ 				};
+=20
++				virtio@150000 {
++					compatible =3D "virtio,mmio";
++					reg =3D <0x150000 0x200>;
++					interrupts =3D <44>;
++				};
++
++				virtio@200000 {
++					compatible =3D "virtio,mmio";
++					reg =3D <0x200000 0x200>;
++					interrupts =3D <46>;
++				};
++
+ 				rtc@170000 {
+ 					compatible =3D "arm,pl031", "arm,primecell";
+ 					reg =3D <0x170000 0x1000>;
+--=20
+2.39.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc
similarity index 50%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-fvp.inc
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
fvp-base.inc
index ca96b448..d773e41c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.=
inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -4,9 +4,14 @@
 # Armv8-A Base Platform FVP
 #
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:"
+SRC_URI:append =3D " file://0001-fdts-fvp-base-Add-stdout-path-and-virti=
o-net-and-rng.patch"
+
 COMPATIBLE_MACHINE =3D "fvp-base"
 TFA_PLATFORM =3D "fvp"
 TFA_DEBUG =3D "1"
 TFA_MBEDTLS =3D "1"
 TFA_UBOOT ?=3D "1"
 TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fip"
+
+EXTRA_OEMAKE:append =3D " FVP_DT_PREFIX=3Dfvp-base-gicv3-psci-1t"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend
index 7fbcd3ab..cb482a6f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
@@ -4,7 +4,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:"
=20
 MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-corstone1000.in=
c"
-MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp.inc"
+MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp-base.inc"
 MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE:n1sdp =3D "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
--=20
2.25.1


