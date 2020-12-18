Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1923.1608312088262740232
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD87530E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:21:26 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CD5D3F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:21:26 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [gatesgarth PATCH] arm-bsp/linux: fix sgi575 kernel compile warning
Date: Fri, 18 Dec 2020 12:21:20 -0500
Message-Id: <20201218172120.14075-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

SGI575 throws a config warning when compiling the 5.7 kernel.

WARNING: linux-yocto-5.7.19+gitAUTOINC+b9e6fd082d_6b9830fecd-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:

    [NOTE]: 'CONFIG_USB_CONN_GPIO' last val (m) and .config val (y) do not match
    [INFO]: CONFIG_USB_CONN_GPIO : y ## .config: 5334 :configs///defconfig (m)
    [INFO]: raw config text:

        config USB_CONN_GPIO
        	tristate "USB GPIO Based Connection Detection Driver"
        	select USB_ROLE_SWITCH
        	depends on GPIOLIB && USB_SUPPORT
        	help
        	  The driver supports USB role switch between host and device via GPIO
        	  based USB cable detection, used typically if an input GPIO is used
        	  to detect USB ID pin, and another input GPIO may be also used to detect
        	  Vbus pin at the same time, it also can be used to enable/disable
        	  device if an input GPIO is only used to detect Vbus pin.

        	  To compile the driver as a module, choose M here: the module will
        	  be called usb-conn-gpio.ko

        Config 'USB_CONN_GPIO' has the following Direct dependencies (USB_CONN_GPIO=y):
                GPIOLIB(=y) && USB_SUPPORT(=y)
        Parent dependencies are:
             USB_SUPPORT [y] GPIOLIB [y]

    [INFO]: selection details for 'CONFIG_USB_CONN_GPIO':
        Symbols currently y-selecting this symbol:
          - PHY_TEGRA_XUSB

It is using the defconfig from upstream Linux.  So, change that
defconfig to correct the warning by changing USB_CONN_GPIO from 'm' to
'y'.

Change-Id: Ia5080f7f22d0f1aef065b58d8c3b0222625c8f58
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/linux-yocto-5.7/defconfig.patch     | 112 ++++++++++++++++++
 .../linux/linux-yocto_5.7%.bbappend           |   4 +-
 2 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.patch
new file mode 100644
index 0000000..71b1b1e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/defconfig.patch
@@ -0,0 +1,112 @@
+Change USB_CONN_GPIO to 'y' by default and regenerate the defconfig via
+`make savedefconfig`.
+
+Upstream-Status: Inappropriate [not needed in newer kernels]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 03d0189f7d68..a4baafe01c34 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -165,9 +165,9 @@ CONFIG_QRTR_SMD=m
+ CONFIG_QRTR_TUN=m
+ CONFIG_BPF_JIT=y
+ CONFIG_CAN=m
++CONFIG_CAN_FLEXCAN=m
+ CONFIG_CAN_RCAR=m
+ CONFIG_CAN_RCAR_CANFD=m
+-CONFIG_CAN_FLEXCAN=m
+ CONFIG_BT=m
+ CONFIG_BT_HIDP=m
+ # CONFIG_BT_HS is not set
+@@ -202,20 +202,19 @@ CONFIG_PCI_HOST_THUNDER_ECAM=y
+ CONFIG_PCIE_ROCKCHIP_HOST=m
+ CONFIG_PCIE_BRCMSTB=m
+ CONFIG_PCI_LAYERSCAPE=y
+-CONFIG_PCIE_LAYERSCAPE_GEN4=y
+ CONFIG_PCI_HISI=y
+ CONFIG_PCIE_QCOM=y
+ CONFIG_PCIE_ARMADA_8K=y
+ CONFIG_PCIE_KIRIN=y
+ CONFIG_PCIE_HISI_STB=y
+ CONFIG_PCIE_TEGRA194_HOST=m
++CONFIG_PCIE_LAYERSCAPE_GEN4=y
+ CONFIG_DEVTMPFS=y
+ CONFIG_DEVTMPFS_MOUNT=y
+ CONFIG_FW_LOADER_USER_HELPER=y
+ CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
+ CONFIG_HISILICON_LPC=y
+ CONFIG_SIMPLE_PM_BUS=y
+-CONFIG_FSL_MC_BUS=y
+ CONFIG_MTD=y
+ CONFIG_MTD_BLOCK=y
+ CONFIG_MTD_CFI=y
+@@ -494,10 +493,10 @@ CONFIG_SENSORS_INA3221=m
+ CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
+ CONFIG_CPU_THERMAL=y
+ CONFIG_THERMAL_EMULATION=y
+-CONFIG_QORIQ_THERMAL=m
+-CONFIG_SUN8I_THERMAL=y
+ CONFIG_IMX_SC_THERMAL=m
+ CONFIG_IMX8MM_THERMAL=m
++CONFIG_QORIQ_THERMAL=m
++CONFIG_SUN8I_THERMAL=y
+ CONFIG_ROCKCHIP_THERMAL=m
+ CONFIG_RCAR_THERMAL=y
+ CONFIG_RCAR_GEN3_THERMAL=y
+@@ -567,7 +566,6 @@ CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
+ CONFIG_MEDIA_SDR_SUPPORT=y
+ CONFIG_MEDIA_CONTROLLER=y
+ CONFIG_VIDEO_V4L2_SUBDEV_API=y
+-CONFIG_MEDIA_PLATFORM_SUPPORT=y
+ # CONFIG_DVB_NET is not set
+ CONFIG_MEDIA_USB_SUPPORT=y
+ CONFIG_USB_VIDEO_CLASS=m
+@@ -611,10 +609,10 @@ CONFIG_DRM_MSM=m
+ CONFIG_DRM_TEGRA=m
+ CONFIG_DRM_PANEL_LVDS=m
+ CONFIG_DRM_PANEL_SIMPLE=m
+-CONFIG_DRM_SIMPLE_BRIDGE=m
+ CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
+ CONFIG_DRM_DISPLAY_CONNECTOR=m
+ CONFIG_DRM_SII902X=m
++CONFIG_DRM_SIMPLE_BRIDGE=m
+ CONFIG_DRM_THINE_THC63LVD1024=m
+ CONFIG_DRM_TI_SN65DSI86=m
+ CONFIG_DRM_I2C_ADV7511=m
+@@ -662,7 +660,6 @@ CONFIG_SND_SOC_WSA881X=m
+ CONFIG_SND_SIMPLE_CARD=m
+ CONFIG_SND_AUDIO_GRAPH_CARD=m
+ CONFIG_I2C_HID=m
+-CONFIG_USB_CONN_GPIO=m
+ CONFIG_USB=y
+ CONFIG_USB_OTG=y
+ CONFIG_USB_XHCI_HCD=y
+@@ -797,14 +794,13 @@ CONFIG_QCOM_A53PLL=y
+ CONFIG_QCOM_CLK_APCS_MSM8916=y
+ CONFIG_QCOM_CLK_SMD_RPM=y
+ CONFIG_QCOM_CLK_RPMH=y
+-CONFIG_IPQ_GCC_8074=y
+ CONFIG_IPQ_GCC_6018=y
++CONFIG_IPQ_GCC_8074=y
+ CONFIG_MSM_GCC_8916=y
+ CONFIG_MSM_GCC_8994=y
+ CONFIG_MSM_MMCC_8996=y
+ CONFIG_MSM_GCC_8998=y
+ CONFIG_QCS_GCC_404=y
+-CONFIG_SDM_GCC_845=y
+ CONFIG_SDM_GPUCC_845=y
+ CONFIG_SDM_DISPCC_845=y
+ CONFIG_SM_GCC_8150=y
+@@ -933,10 +929,10 @@ CONFIG_FPGA_REGION=m
+ CONFIG_OF_FPGA_REGION=m
+ CONFIG_TEE=y
+ CONFIG_OPTEE=y
++CONFIG_MUX_MMIO=y
+ CONFIG_SLIMBUS=m
+ CONFIG_SLIM_QCOM_CTRL=m
+ CONFIG_SLIM_QCOM_NGD_CTRL=m
+-CONFIG_MUX_MMIO=y
+ CONFIG_EXT2_FS=y
+ CONFIG_EXT3_FS=y
+ CONFIG_EXT4_FS_POSIX_ACL=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
index 432fd0c..607a50e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
@@ -1,3 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto-5.7:"
 
-SRC_URI_append = " file://coresight-traceid.patch"
+SRC_URI_append = " file://coresight-traceid.patch \
+                   file://defconfig.patch \
+                 "
-- 
2.17.1

