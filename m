Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.3687.1626179095755203377
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jul 2021 05:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F3491FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 Jul 2021 05:24:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 875313F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 Jul 2021 05:24:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-base: use the mainline linux devicetree
Date: Tue, 13 Jul 2021 13:24:52 +0100
Message-Id: <20210713122452.1879702-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When the FVP Base machine was first added the mainline kernel didn't
have a usable Devicetree.  This is no longer the case, so use the
fvp-base-revc devicetree in the kernel.

Change-Id: Ib1c4dc332776b393869c6fb3f11be1811a6544f5
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       |   4 +-
 .../linux/files/fvp-base-dts.patch            | 578 ------------------
 .../linux/linux-arm-platforms.inc             |   1 -
 3 files changed, 2 insertions(+), 581 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.=
patch

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 41163c9..b74daf6 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -14,7 +14,7 @@ UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
=20
 KERNEL_IMAGETYPE =3D "Image"
=20
-KERNEL_DEVICETREE =3D "arm/fvp-base-gicv3-psci-custom.dtb"
+KERNEL_DEVICETREE =3D "arm/fvp-base-revc.dtb"
=20
 FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
 FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
@@ -23,7 +23,7 @@ FVP_CONFIG[bp.secureflashloader.fname] ?=3D "${DEPLOY_D=
IR_IMAGE}/bl1-fvp.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?=3D "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
 FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.wic"
 FVP_DATA ?=3D "cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}@0=
x80080000 \
-            cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/fvp-base-gicv3-psci-cust=
om.dtb@0x83000000"
+            cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/fvp-base-revc.dtb@0x8300=
0000"
 FVP_CONSOLE ?=3D "terminal_0"
 FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
 FVP_TERMINALS[bp.terminal_1] ?=3D ""
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch b=
/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch
deleted file mode 100644
index fcd8f70..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch
+++ /dev/null
@@ -1,578 +0,0 @@
-Add DTS files which are not yet upstream. In the future these will be pr=
ovided by TF-A.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Anders Dellien <anders.dellien@arm.com
-
-diff --git a/arch/arm64/boot/dts/arm/fvp-base-gicv3-psci-common-custom.d=
tsi b/arch/arm64/boot/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi
-new file mode 100644
-index 000000000000..f4601c7f99f8
---- /dev/null
-+++ b/arch/arm64/boot/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi
-@@ -0,0 +1,264 @@
-+/*
-+ * Copyright (c) 2017-2018, ARM Limited and Contributors. All rights re=
served.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+/memreserve/ 0x80000000 0x00010000;
-+
-+/include/ "rtsm_ve-motherboard-nomap.dtsi"
-+
-+/ {
-+       model =3D "FVP Base";
-+       compatible =3D "arm,vfp-base", "arm,vexpress";
-+       interrupt-parent =3D <&gic>;
-+       #address-cells =3D <2>;
-+       #size-cells =3D <2>;
-+
-+       aliases {
-+               serial0 =3D &v2m_serial0;
-+               serial1 =3D &v2m_serial1;
-+               serial2 =3D &v2m_serial2;
-+               serial3 =3D &v2m_serial3;
-+       };
-+
-+       psci {
-+               compatible =3D "arm,psci-1.0", "arm,psci-0.2", "arm,psci=
";
-+               method =3D "smc";
-+               cpu_suspend =3D <0xc4000001>;
-+               cpu_off =3D <0x84000002>;
-+               cpu_on =3D <0xc4000003>;
-+               sys_poweroff =3D <0x84000008>;
-+               sys_reset =3D <0x84000009>;
-+       };
-+
-+       cpus {
-+               #address-cells =3D <2>;
-+               #size-cells =3D <0>;
-+
-+               cpu-map {
-+                       cluster0 {
-+                               core0 {
-+                                       cpu =3D <&CPU0>;
-+                               };
-+                               core1 {
-+                                       cpu =3D <&CPU1>;
-+                               };
-+                               core2 {
-+                                       cpu =3D <&CPU2>;
-+                               };
-+                               core3 {
-+                                       cpu =3D <&CPU3>;
-+                               };
-+                       };
-+
-+                       cluster1 {
-+                               core0 {
-+                                       cpu =3D <&CPU4>;
-+                               };
-+                               core1 {
-+                                       cpu =3D <&CPU5>;
-+                               };
-+                               core2 {
-+                                       cpu =3D <&CPU6>;
-+                               };
-+                               core3 {
-+                                       cpu =3D <&CPU7>;
-+                               };
-+                       };
-+               };
-+
-+               idle-states {
-+                       entry-method =3D "arm,psci";
-+
-+                       CPU_SLEEP_0: cpu-sleep-0 {
-+                               compatible =3D "arm,idle-state";
-+                               local-timer-stop;
-+                               arm,psci-suspend-param =3D <0x0010000>;
-+                               entry-latency-us =3D <40>;
-+                               exit-latency-us =3D <100>;
-+                               min-residency-us =3D <150>;
-+                       };
-+
-+                       CLUSTER_SLEEP_0: cluster-sleep-0 {
-+                               compatible =3D "arm,idle-state";
-+                               local-timer-stop;
-+                               arm,psci-suspend-param =3D <0x1010000>;
-+                               entry-latency-us =3D <500>;
-+                               exit-latency-us =3D <1000>;
-+                               min-residency-us =3D <2500>;
-+                       };
-+               };
-+
-+               CPU0:cpu@0 {
-+                       device_type =3D "cpu";
-+                       compatible =3D "arm,armv8";
-+                       reg =3D <0x0 0x0>;
-+                       enable-method =3D "psci";
-+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP=
_0>;
-+                       next-level-cache =3D <&L2_0>;
-+               };
-+
-+               CPU1:cpu@100 {
-+                       device_type =3D "cpu";
-+                       compatible =3D "arm,armv8";
-+                       reg =3D <0x0 0x100>;
-+                       enable-method =3D "psci";
-+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP=
_0>;
-+                       next-level-cache =3D <&L2_0>;
-+               };
-+
-+               CPU2:cpu@200 {
-+                       device_type =3D "cpu";
-+                       compatible =3D "arm,armv8";
-+                       reg =3D <0x0 0x200>;
-+                       enable-method =3D "psci";
-+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP=
_0>;
-+                       next-level-cache =3D <&L2_0>;
-+               };
-+
-+               CPU3:cpu@300 {
-+                       device_type =3D "cpu";
-+                       compatible =3D "arm,armv8";
-+                       reg =3D <0x0 0x300>;
-+                       enable-method =3D "psci";
-+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP=
_0>;
-+                       next-level-cache =3D <&L2_0>;
-+               };
-+
-+               CPU4:cpu@10000 {
-+                       device_type =3D "cpu";
-+                       compatible =3D "arm,armv8";
-+                       reg =3D <0x0 0x10000>;
-+                       enable-method =3D "psci";
-+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP=
_0>;
-+                       next-level-cache =3D <&L2_0>;
-+               };
-+
-+               CPU5:cpu@10100 {
-+                       device_type =3D "cpu";
-+                       compatible =3D "arm,armv8";
-+                       reg =3D <0x0 0x10100>;
-+                       enable-method =3D "psci";
-+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP=
_0>;
-+                       next-level-cache =3D <&L2_0>;
-+               };
-+
-+               CPU6:cpu@10200 {
-+                       device_type =3D "cpu";
-+                       compatible =3D "arm,armv8";
-+                       reg =3D <0x0 0x10200>;
-+                       enable-method =3D "psci";
-+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP=
_0>;
-+                       next-level-cache =3D <&L2_0>;
-+               };
-+
-+               CPU7:cpu@10300 {
-+                       device_type =3D "cpu";
-+                       compatible =3D "arm,armv8";
-+                       reg =3D <0x0 0x10300>;
-+                       enable-method =3D "psci";
-+                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP=
_0>;
-+                       next-level-cache =3D <&L2_0>;
-+               };
-+
-+               L2_0: l2-cache0 {
-+                       compatible =3D "cache";
-+               };
-+       };
-+
-+       memory@80000000 {
-+               device_type =3D "memory";
-+               reg =3D <0x00000000 0x80000000 0 0x7F000000>,
-+                     <0x00000008 0x80000000 0 0x80000000>;
-+       };
-+
-+       gic: interrupt-controller@2f000000 {
-+               compatible =3D "arm,gic-v3";
-+               #interrupt-cells =3D <3>;
-+               #address-cells =3D <2>;
-+               #size-cells =3D <2>;
-+               ranges;
-+               interrupt-controller;
-+               reg =3D <0x0 0x2f000000 0 0x10000>,       // GICD
-+                     <0x0 0x2f100000 0 0x200000>,      // GICR
-+                     <0x0 0x2c000000 0 0x2000>,        // GICC
-+                     <0x0 0x2c010000 0 0x2000>,        // GICH
-+                     <0x0 0x2c02f000 0 0x2000>;        // GICV
-+               interrupts =3D <1 9 4>;
-+
-+               its: its@2f020000 {
-+                       compatible =3D "arm,gic-v3-its";
-+                       msi-controller;
-+                       reg =3D <0x0 0x2f020000 0x0 0x20000>; // GITS
-+               };
-+       };
-+
-+       timer {
-+               compatible =3D "arm,armv8-timer";
-+               interrupts =3D <1 13 0xff01>,
-+                            <1 14 0xff01>,
-+                            <1 11 0xff01>,
-+                            <1 10 0xff01>;
-+               clock-frequency =3D <100000000>;
-+       };
-+
-+       timer@2a810000 {
-+                       compatible =3D "arm,armv7-timer-mem";
-+                       reg =3D <0x0 0x2a810000 0x0 0x10000>;
-+                       clock-frequency =3D <100000000>;
-+                       #address-cells =3D <2>;
-+                       #size-cells =3D <2>;
-+                       ranges;
-+                       frame@2a830000 {
-+                               frame-number =3D <1>;
-+                               interrupts =3D <0 26 4>;
-+                               reg =3D <0x0 0x2a830000 0x0 0x10000>;
-+                       };
-+       };
-+
-+       pmu {
-+               compatible =3D "arm,armv8-pmuv3";
-+               interrupts =3D <0 60 4>,
-+                            <0 61 4>,
-+                            <0 62 4>,
-+                            <0 63 4>;
-+       };
-+
-+       smb@8000000 {
-+               compatible =3D "simple-bus";
-+
-+               #address-cells =3D <2>;
-+               #size-cells =3D <1>;
-+               ranges =3D <0 0 0 0x08000000 0x04000000>,
-+                        <1 0 0 0x14000000 0x04000000>,
-+                        <2 0 0 0x18000000 0x04000000>,
-+                        <3 0 0 0x1c000000 0x04000000>,
-+                        <4 0 0 0x0c000000 0x04000000>,
-+                        <5 0 0 0x10000000 0x04000000>;
-+       };
-+
-+       panels {
-+               panel {
-+                       compatible      =3D "panel";
-+                       mode            =3D "XVGA";
-+                       refresh         =3D <60>;
-+                       xres            =3D <1024>;
-+                       yres            =3D <768>;
-+                       pixclock        =3D <15748>;
-+                       left_margin     =3D <152>;
-+                       right_margin    =3D <48>;
-+                       upper_margin    =3D <23>;
-+                       lower_margin    =3D <3>;
-+                       hsync_len       =3D <104>;
-+                       vsync_len       =3D <4>;
-+                       sync            =3D <0>;
-+                       vmode           =3D "FB_VMODE_NONINTERLACED";
-+                       tim2            =3D "TIM2_BCD", "TIM2_IPC";
-+                       cntl            =3D "CNTL_LCDTFT", "CNTL_BGR", "=
CNTL_LCDVCOMP(1)";
-+                       caps            =3D "CLCD_CAP_5551", "CLCD_CAP_5=
65", "CLCD_CAP_888";
-+                       bpp             =3D <16>;
-+               };
-+       };
-+
-+};
-diff --git a/arch/arm64/boot/dts/arm/fvp-base-gicv3-psci-custom.dts b/ar=
ch/arm64/boot/dts/arm/fvp-base-gicv3-psci-custom.dts
-new file mode 100644
-index 000000000000..984dbca90126
---- /dev/null
-+++ b/arch/arm64/boot/dts/arm/fvp-base-gicv3-psci-custom.dts
-@@ -0,0 +1,9 @@
-+/*
-+ * Copyright (c) 2013-2017, ARM Limited and Contributors. All rights re=
served.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+/dts-v1/;
-+
-+/include/ "fvp-base-gicv3-psci-common-custom.dtsi"
-diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard-nomap.dtsi b/ar=
ch/arm64/boot/dts/arm/rtsm_ve-motherboard-nomap.dtsi
-new file mode 100644
-index 000000000000..a94f7cb863a2
---- /dev/null
-+++ b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard-nomap.dtsi
-@@ -0,0 +1,282 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * ARM Ltd. Fast Models
-+ *
-+ * Versatile Express (VE) system model
-+ * Motherboard component
-+ *
-+ * VEMotherBoard.lisa
-+ *
-+ * This is a duplicate of rtsm_ve-motherboard.dtsi but not
-+ * using interrupt-map as this is not properly supported in
-+ * xen right now
-+ */
-+/ {
-+       smb@8000000 {
-+               motherboard {
-+                       arm,v2m-memory-map =3D "rs1";
-+                       compatible =3D "arm,vexpress,v2m-p1", "simple-bu=
s";
-+                       #address-cells =3D <2>; /* SMB chipselect number=
 and offset */
-+                       #size-cells =3D <1>;
-+                       ranges;
-+
-+                       flash@0,00000000 {
-+                               compatible =3D "arm,vexpress-flash", "cf=
i-flash";
-+                               reg =3D <0 0x00000000 0x04000000>,
-+                                     <4 0x00000000 0x04000000>;
-+                               bank-width =3D <4>;
-+                       };
-+
-+                       v2m_video_ram: vram@2,00000000 {
-+                               compatible =3D "arm,vexpress-vram";
-+                               reg =3D <2 0x00000000 0x00800000>;
-+                       };
-+
-+                       ethernet@2,02000000 {
-+                               compatible =3D "smsc,lan91c111";
-+                               reg =3D <2 0x02000000 0x10000>;
-+                               interrupts =3D <0 15 4>;
-+                       };
-+
-+                       v2m_clk24mhz: clk24mhz {
-+                               compatible =3D "fixed-clock";
-+                               #clock-cells =3D <0>;
-+                               clock-frequency =3D <24000000>;
-+                               clock-output-names =3D "v2m:clk24mhz";
-+                       };
-+
-+                       v2m_refclk1mhz: refclk1mhz {
-+                               compatible =3D "fixed-clock";
-+                               #clock-cells =3D <0>;
-+                               clock-frequency =3D <1000000>;
-+                               clock-output-names =3D "v2m:refclk1mhz";
-+                       };
-+
-+                       v2m_refclk32khz: refclk32khz {
-+                               compatible =3D "fixed-clock";
-+                               #clock-cells =3D <0>;
-+                               clock-frequency =3D <32768>;
-+                               clock-output-names =3D "v2m:refclk32khz"=
;
-+                       };
-+
-+                       iofpga@3,00000000 {
-+                               compatible =3D "simple-bus";
-+                               #address-cells =3D <1>;
-+                               #size-cells =3D <1>;
-+                               ranges =3D <0 3 0 0x200000>;
-+
-+                               v2m_sysreg: sysreg@10000 {
-+                                       compatible =3D "arm,vexpress-sys=
reg";
-+                                       reg =3D <0x010000 0x1000>;
-+                                       gpio-controller;
-+                                       #gpio-cells =3D <2>;
-+                               };
-+
-+                               v2m_sysctl: sysctl@20000 {
-+                                       compatible =3D "arm,sp810", "arm=
,primecell";
-+                                       reg =3D <0x020000 0x1000>;
-+                                       clocks =3D <&v2m_refclk32khz>, <=
&v2m_refclk1mhz>, <&v2m_clk24mhz>;
-+                                       clock-names =3D "refclk", "timcl=
k", "apb_pclk";
-+                                       #clock-cells =3D <1>;
-+                                       clock-output-names =3D "timerclk=
en0", "timerclken1", "timerclken2", "timerclken3";
-+                                       assigned-clocks =3D <&v2m_sysctl=
 0>, <&v2m_sysctl 1>, <&v2m_sysctl 3>, <&v2m_sysctl 3>;
-+                                       assigned-clock-parents =3D <&v2m=
_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>;
-+                               };
-+
-+                               aaci@40000 {
-+                                       compatible =3D "arm,pl041", "arm=
,primecell";
-+                                       reg =3D <0x040000 0x1000>;
-+                                       interrupts =3D <0 11 4>;
-+                                       clocks =3D <&v2m_clk24mhz>;
-+                                       clock-names =3D "apb_pclk";
-+                               };
-+
-+                               mmci@50000 {
-+                                       compatible =3D "arm,pl180", "arm=
,primecell";
-+                                       reg =3D <0x050000 0x1000>;
-+                                       interrupts =3D <0 9 4 0 10 4>;
-+                                       cd-gpios =3D <&v2m_sysreg 0 0>;
-+                                       wp-gpios =3D <&v2m_sysreg 1 0>;
-+                                       max-frequency =3D <12000000>;
-+                                       vmmc-supply =3D <&v2m_fixed_3v3>=
;
-+                                       clocks =3D <&v2m_clk24mhz>, <&v2=
m_clk24mhz>;
-+                                       clock-names =3D "mclk", "apb_pcl=
k";
-+                               };
-+
-+                               kmi@60000 {
-+                                       compatible =3D "arm,pl050", "arm=
,primecell";
-+                                       reg =3D <0x060000 0x1000>;
-+                                       interrupts =3D <0 12 4>;
-+                                       clocks =3D <&v2m_clk24mhz>, <&v2=
m_clk24mhz>;
-+                                       clock-names =3D "KMIREFCLK", "ap=
b_pclk";
-+                               };
-+
-+                               kmi@70000 {
-+                                       compatible =3D "arm,pl050", "arm=
,primecell";
-+                                       reg =3D <0x070000 0x1000>;
-+                                       interrupts =3D <0 13 4>;
-+                                       clocks =3D <&v2m_clk24mhz>, <&v2=
m_clk24mhz>;
-+                                       clock-names =3D "KMIREFCLK", "ap=
b_pclk";
-+                               };
-+
-+                               v2m_serial0: uart@90000 {
-+                                       compatible =3D "arm,pl011", "arm=
,primecell";
-+                                       reg =3D <0x090000 0x1000>;
-+                                       interrupts =3D <0 5 4>;
-+                                       clocks =3D <&v2m_clk24mhz>, <&v2=
m_clk24mhz>;
-+                                       clock-names =3D "uartclk", "apb_=
pclk";
-+                               };
-+
-+                               v2m_serial1: uart@a0000 {
-+                                       compatible =3D "arm,pl011", "arm=
,primecell";
-+                                       reg =3D <0x0a0000 0x1000>;
-+                                       interrupts =3D <0 6 4>;
-+                                       clocks =3D <&v2m_clk24mhz>, <&v2=
m_clk24mhz>;
-+                                       clock-names =3D "uartclk", "apb_=
pclk";
-+                               };
-+
-+                               v2m_serial2: uart@b0000 {
-+                                       compatible =3D "arm,pl011", "arm=
,primecell";
-+                                       reg =3D <0x0b0000 0x1000>;
-+                                       interrupts =3D <0 7 4>;
-+                                       clocks =3D <&v2m_clk24mhz>, <&v2=
m_clk24mhz>;
-+                                       clock-names =3D "uartclk", "apb_=
pclk";
-+                               };
-+
-+                               v2m_serial3: uart@c0000 {
-+                                       compatible =3D "arm,pl011", "arm=
,primecell";
-+                                       reg =3D <0x0c0000 0x1000>;
-+                                       interrupts =3D <0 8 4>;
-+                                       clocks =3D <&v2m_clk24mhz>, <&v2=
m_clk24mhz>;
-+                                       clock-names =3D "uartclk", "apb_=
pclk";
-+                               };
-+
-+                               wdt@f0000 {
-+                                       compatible =3D "arm,sp805", "arm=
,primecell";
-+                                       reg =3D <0x0f0000 0x1000>;
-+                                       interrupts =3D <0 0 4>;
-+                                       clocks =3D <&v2m_refclk32khz>, <=
&v2m_clk24mhz>;
-+                                       clock-names =3D "wdogclk", "apb_=
pclk";
-+                               };
-+
-+                               v2m_timer01: timer@110000 {
-+                                       compatible =3D "arm,sp804", "arm=
,primecell";
-+                                       reg =3D <0x110000 0x1000>;
-+                                       interrupts =3D <0 2 4>;
-+                                       clocks =3D <&v2m_sysctl 0>, <&v2=
m_sysctl 1>, <&v2m_clk24mhz>;
-+                                       clock-names =3D "timclken1", "ti=
mclken2", "apb_pclk";
-+                               };
-+
-+                               v2m_timer23: timer@120000 {
-+                                       compatible =3D "arm,sp804", "arm=
,primecell";
-+                                       reg =3D <0x120000 0x1000>;
-+                                       interrupts =3D <0 3 4>;
-+                                       clocks =3D <&v2m_sysctl 2>, <&v2=
m_sysctl 3>, <&v2m_clk24mhz>;
-+                                       clock-names =3D "timclken1", "ti=
mclken2", "apb_pclk";
-+                               };
-+
-+                               rtc@170000 {
-+                                       compatible =3D "arm,pl031", "arm=
,primecell";
-+                                       reg =3D <0x170000 0x1000>;
-+                                       interrupts =3D <0 4 4>;
-+                                       clocks =3D <&v2m_clk24mhz>;
-+                                       clock-names =3D "apb_pclk";
-+                               };
-+
-+                               clcd@1f0000 {
-+                                       compatible =3D "arm,pl111", "arm=
,primecell";
-+                                       reg =3D <0x1f0000 0x1000>;
-+                                       interrupt-names =3D "combined";
-+                                       interrupts =3D <0 14 4>;
-+                                       clocks =3D <&v2m_oscclk1>, <&v2m=
_clk24mhz>;
-+                                       clock-names =3D "clcdclk", "apb_=
pclk";
-+                                       arm,pl11x,framebuffer =3D <0x180=
00000 0x00180000>;
-+                                       memory-region =3D <&v2m_video_ra=
m>;
-+                                       max-memory-bandwidth =3D <130000=
000>; /* 16bpp @ 63.5MHz */
-+
-+                                       port {
-+                                               v2m_clcd_pads: endpoint =
{
-+                                                       remote-endpoint =
=3D <&v2m_clcd_panel>;
-+                                                       arm,pl11x,tft-r0=
g0b0-pads =3D <0 8 16>;
-+                                               };
-+                                       };
-+
-+                                       panel {
-+                                               compatible =3D "panel-dp=
i";
-+
-+                                               port {
-+                                                       v2m_clcd_panel: =
endpoint {
-+                                                               remote-e=
ndpoint =3D <&v2m_clcd_pads>;
-+                                                       };
-+                                               };
-+
-+                                               panel-timing {
-+                                                       clock-frequency =
=3D <63500127>;
-+                                                       hactive =3D <102=
4>;
-+                                                       hback-porch =3D =
<152>;
-+                                                       hfront-porch =3D=
 <48>;
-+                                                       hsync-len =3D <1=
04>;
-+                                                       vactive =3D <768=
>;
-+                                                       vback-porch =3D =
<23>;
-+                                                       vfront-porch =3D=
 <3>;
-+                                                       vsync-len =3D <4=
>;
-+                                               };
-+                                       };
-+                               };
-+
-+                               virtio-block@130000 {
-+                                       compatible =3D "virtio,mmio";
-+                                       reg =3D <0x130000 0x200>;
-+                                       interrupts =3D <0 42 4>;
-+                               };
-+                       };
-+
-+                       v2m_fixed_3v3: v2m-3v3 {
-+                               compatible =3D "regulator-fixed";
-+                               regulator-name =3D "3V3";
-+                               regulator-min-microvolt =3D <3300000>;
-+                               regulator-max-microvolt =3D <3300000>;
-+                               regulator-always-on;
-+                       };
-+
-+                       mcc {
-+                               compatible =3D "arm,vexpress,config-bus"=
;
-+                               arm,vexpress,config-bridge =3D <&v2m_sys=
reg>;
-+
-+                               v2m_oscclk1: oscclk1 {
-+                                       /* CLCD clock */
-+                                       compatible =3D "arm,vexpress-osc=
";
-+                                       arm,vexpress-sysreg,func =3D <1 =
1>;
-+                                       freq-range =3D <23750000 6350000=
0>;
-+                                       #clock-cells =3D <0>;
-+                                       clock-output-names =3D "v2m:oscc=
lk1";
-+                               };
-+
-+                               reset {
-+                                       compatible =3D "arm,vexpress-res=
et";
-+                                       arm,vexpress-sysreg,func =3D <5 =
0>;
-+                               };
-+
-+                               muxfpga {
-+                                       compatible =3D "arm,vexpress-mux=
fpga";
-+                                       arm,vexpress-sysreg,func =3D <7 =
0>;
-+                               };
-+
-+                               shutdown {
-+                                       compatible =3D "arm,vexpress-shu=
tdown";
-+                                       arm,vexpress-sysreg,func =3D <8 =
0>;
-+                               };
-+
-+                               reboot {
-+                                       compatible =3D "arm,vexpress-reb=
oot";
-+                                       arm,vexpress-sysreg,func =3D <9 =
0>;
-+                               };
-+
-+                               dvimode {
-+                                       compatible =3D "arm,vexpress-dvi=
mode";
-+                                       arm,vexpress-sysreg,func =3D <11=
 0>;
-+                               };
-+                       };
-+               };
-+       };
-+};
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 17a036e..5c361f7 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -31,7 +31,6 @@ COMPATIBLE_MACHINE_corstone500 =3D "corstone500"
 COMPATIBLE_MACHINE_fvp-base =3D "fvp-base"
 KMACHINE_fvp-base =3D "fvp"
 FILESEXTRAPATHS_prepend_fvp-base :=3D "${ARMBSPFILESPATHS}"
-SRC_URI_append_fvp-base =3D " file://fvp-base-dts.patch"
=20
 #
 # FVP BASE ARM32 KMACHINE
--=20
2.25.1

