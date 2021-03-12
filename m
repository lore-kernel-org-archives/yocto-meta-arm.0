Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.922.1615574403990352246
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 10:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF6DE101E
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Mar 2021 10:40:02 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 749F83F7D7
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Mar 2021 10:40:02 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/machine: Create QEMU SBSA machine
Date: Fri, 12 Mar 2021 13:39:55 -0500
Message-Id: <20210312183956.24840-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210312183956.24840-1-jon.mason@arm.com>
References: <20210312183956.24840-1-jon.mason@arm.com>

Add a QEMU machine for Server Base System Architecture (SBSA)
development.

Change-Id: Ic4e286a6583b38aee2a78ab4b53669048136f1a1
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |   3 +
 kas/qemuarm64-sbsa.yml                        |   6 +
 meta-arm/conf/machine/qemuarm64-sbsa.conf     |  30 ++
 .../trusted-firmware-a_%.bbappend             |   2 +
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  18 ++
 .../linux/linux-yocto/defconfig.patch         | 304 ++++++++++++++++++
 .../linux/linux-yocto_%.bbappend              |   5 +
 7 files changed, 368 insertions(+)
 create mode 100644 kas/qemuarm64-sbsa.yml
 create mode 100644 meta-arm/conf/machine/qemuarm64-sbsa.conf
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a9b0619..ccf58bb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -97,6 +97,9 @@ n1sdp:
 n1sdp/armgcc:
   extends: .build
 
+qemuarm64-sbsa:
+  extends: .build
+
 qemuarm64-secureboot:
   extends: .build
 
diff --git a/kas/qemuarm64-sbsa.yml b/kas/qemuarm64-sbsa.yml
new file mode 100644
index 0000000..821215e
--- /dev/null
+++ b/kas/qemuarm64-sbsa.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: qemuarm64-sbsa
diff --git a/meta-arm/conf/machine/qemuarm64-sbsa.conf b/meta-arm/conf/machine/qemuarm64-sbsa.conf
new file mode 100644
index 0000000..d2ac56c
--- /dev/null
+++ b/meta-arm/conf/machine/qemuarm64-sbsa.conf
@@ -0,0 +1,30 @@
+#@TYPE: Machine
+#@NAME: qemuarm64_sbsa
+#@DESCRIPTION: QEMU Machine for Arm Server Base System Architecture
+
+MACHINEOVERRIDES =. "qemuarm64:"
+
+require ${COREBASE}/meta/conf/machine/qemuarm64.conf
+
+KMACHINE = "qemuarm64"
+
+QB_MACHINE = "-machine sbsa-ref"
+QB_MEM = "-m 1024"
+QB_DEFAULT_FSTYPE = "wic.qcow2"
+QB_NETWORK_DEVICE = ""
+QB_DRIVE_TYPE = "/dev/hd"
+QB_ROOTFS_OPT = "-drive file=@ROOTFS@,if=ide,format=qcow2"
+QB_DEFAULT_KERNEL = "none"
+QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
+
+IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
+IMAGE_FSTYPES += "wic wic.qcow2"
+
+WKS_FILE ?= "mkefidisk.wks"
+
+MACHINE_FEATURES += "efi"
+
+EXTRA_IMAGEDEPENDS += "edk2-firmware"
+
+KBUILD_DEFCONFIG = "defconfig"
+KCONFIG_MODE = "--alldefconfig"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index dd1da1b..dd74cd5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,7 @@
 COMPATIBLE_MACHINE_qemuarm64 = "qemuarm64"
 
 TFA_PLATFORM_qemuarm64-secureboot = "qemu"
+TFA_PLATFORM_qemuarm64-sbsa = "qemu_sbsa"
 
 TFA_SPD_qemuarm64-secureboot = "opteed"
 
@@ -8,6 +9,7 @@ TFA_UBOOT_qemuarm64-secureboot = "1"
 TFA_BUILD_TARGET_aarch64_qemuall = "all fip"
 
 TFA_INSTALL_TARGET_qemuarm64-secureboot = "flash.bin"
+TFA_INSTALL_TARGET_qemuarm64-sbsa = "bl1 fip"
 
 DEPENDS_append_aarch64_qemuall = " optee-os"
 
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 318afc4..8330ac9 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -1,8 +1,26 @@
 COMPATIBLE_MACHINE = "qemuarm64"
 
+DEPENDS_append_qemuarm64-sbsa = " virtual/trusted-firmware-a"
+
 EDK2_BUILD_RELEASE_aarch64_qemuall = "1"
 EDK2_ARCH_aarch64_qemuall          = "AARCH64"
 
+EDK2_PLATFORM_qemuarm64-sbsa      = "SbsaQemu"
+EDK2_PLATFORM_DSC_qemuarm64-sbsa  = "Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
+EDK2_BIN_NAME_qemuarm64-sbsa      = "SBSA_FLASH0.fd"
+
 EDK2_PLATFORM_qemuarm64-secureboot      = "ArmVirtQemu-AARCH64"
 EDK2_PLATFORM_DSC_qemuarm64-secureboot  = "ArmVirtPkg/ArmVirtQemu.dsc"
 EDK2_BIN_NAME_qemuarm64-secureboot      = "QEMU_EFI.fd"
+
+do_compile_prepend_qemuarm64-sbsa() {
+    mkdir -p ${B}/Platform/Qemu/Sbsa/
+    cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platform/Qemu/Sbsa/
+    cp ${RECIPE_SYSROOT}/firmware/fip.bin ${B}/Platform/Qemu/Sbsa/
+}
+
+do_install_append_qemuarm64-sbsa() {
+    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH0.fd ${D}/firmware/ovmf-tfa.bin
+    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH1.fd ${D}/firmware/ovmf-uefi.bin
+    /usr/bin/truncate -s 256M ${D}/firmware/ovmf*.bin
+}
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch b/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
new file mode 100644
index 0000000..5ff05c2
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
@@ -0,0 +1,304 @@
+Change USB_CONN_GPIO to 'y' by default and regenerate the defconfig via
+`make savedefconfig`.
+
+Upstream-Status: Inappropriate [not needed in newer kernels]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 5cfe3cf6f2ac..1fed16950a7c 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -13,7 +13,6 @@ CONFIG_IKCONFIG=y
+ CONFIG_IKCONFIG_PROC=y
+ CONFIG_NUMA_BALANCING=y
+ CONFIG_MEMCG=y
+-CONFIG_MEMCG_SWAP=y
+ CONFIG_BLK_CGROUP=y
+ CONFIG_CGROUP_PIDS=y
+ CONFIG_CGROUP_HUGETLB=y
+@@ -65,7 +64,6 @@ CONFIG_ARM64_VA_BITS_48=y
+ CONFIG_SCHED_MC=y
+ CONFIG_SCHED_SMT=y
+ CONFIG_NUMA=y
+-CONFIG_SECCOMP=y
+ CONFIG_KEXEC=y
+ CONFIG_KEXEC_FILE=y
+ CONFIG_CRASH_DUMP=y
+@@ -83,7 +81,6 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=m
+ CONFIG_CPU_FREQ_GOV_USERSPACE=y
+ CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
+-CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
+ CONFIG_CPUFREQ_DT=y
+ CONFIG_ACPI_CPPC_CPUFREQ=m
+ CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM=m
+@@ -105,7 +102,6 @@ CONFIG_IMX_SCU_PD=y
+ CONFIG_ACPI=y
+ CONFIG_ACPI_APEI=y
+ CONFIG_ACPI_APEI_GHES=y
+-CONFIG_ACPI_APEI_PCIEAER=y
+ CONFIG_ACPI_APEI_MEMORY_FAILURE=y
+ CONFIG_ACPI_APEI_EINJ=y
+ CONFIG_VIRTUALIZATION=y
+@@ -180,12 +176,11 @@ CONFIG_QRTR_SMD=m
+ CONFIG_QRTR_TUN=m
+ CONFIG_BPF_JIT=y
+ CONFIG_CAN=m
++CONFIG_CAN_FLEXCAN=m
+ CONFIG_CAN_RCAR=m
+ CONFIG_CAN_RCAR_CANFD=m
+-CONFIG_CAN_FLEXCAN=m
+ CONFIG_BT=m
+ CONFIG_BT_HIDP=m
+-# CONFIG_BT_HS is not set
+ # CONFIG_BT_LE is not set
+ CONFIG_BT_LEDS=y
+ # CONFIG_BT_DEBUGFS is not set
+@@ -222,13 +217,13 @@ CONFIG_PCI_HOST_THUNDER_ECAM=y
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
+ CONFIG_PCI_ENDPOINT=y
+ CONFIG_PCI_ENDPOINT_CONFIGFS=y
+ CONFIG_PCI_EPF_TEST=m
+@@ -238,7 +233,6 @@ CONFIG_FW_LOADER_USER_HELPER=y
+ CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
+ CONFIG_HISILICON_LPC=y
+ CONFIG_SIMPLE_PM_BUS=y
+-CONFIG_FSL_MC_BUS=y
+ CONFIG_TEGRA_ACONNECT=m
+ CONFIG_MTD=y
+ CONFIG_MTD_BLOCK=y
+@@ -257,7 +251,6 @@ CONFIG_MTD_NAND_MARVELL=y
+ CONFIG_MTD_NAND_FSL_IFC=y
+ CONFIG_MTD_NAND_QCOM=y
+ CONFIG_MTD_SPI_NOR=y
+-CONFIG_SPI_CADENCE_QUADSPI=y
+ CONFIG_BLK_DEV_LOOP=y
+ CONFIG_BLK_DEV_NBD=m
+ CONFIG_VIRTIO_BLK=y
+@@ -342,18 +335,18 @@ CONFIG_SNI_NETSEC=y
+ CONFIG_STMMAC_ETH=m
+ CONFIG_TI_K3_AM65_CPSW_NUSS=y
+ CONFIG_QCOM_IPA=m
+-CONFIG_MDIO_BUS_MUX_MMIOREG=y
+-CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
++CONFIG_MESON_GXL_PHY=m
+ CONFIG_AQUANTIA_PHY=y
+ CONFIG_MARVELL_PHY=m
+ CONFIG_MARVELL_10G_PHY=m
+-CONFIG_MESON_GXL_PHY=m
+ CONFIG_MICREL_PHY=y
+ CONFIG_MICROSEMI_PHY=y
+ CONFIG_AT803X_PHY=y
+ CONFIG_REALTEK_PHY=m
+ CONFIG_ROCKCHIP_PHY=y
+ CONFIG_VITESSE_PHY=y
++CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
++CONFIG_MDIO_BUS_MUX_MMIOREG=y
+ CONFIG_USB_PEGASUS=m
+ CONFIG_USB_RTL8150=m
+ CONFIG_USB_RTL8152=m
+@@ -453,6 +446,7 @@ CONFIG_SPI=y
+ CONFIG_SPI_ARMADA_3700=y
+ CONFIG_SPI_BCM2835=m
+ CONFIG_SPI_BCM2835AUX=m
++CONFIG_SPI_CADENCE_QUADSPI=y
+ CONFIG_SPI_FSL_LPSPI=y
+ CONFIG_SPI_FSL_QUADSPI=y
+ CONFIG_SPI_NXP_FLEXSPI=y
+@@ -513,9 +507,6 @@ CONFIG_GPIO_PCA953X_IRQ=y
+ CONFIG_GPIO_BD9571MWV=m
+ CONFIG_GPIO_MAX77620=y
+ CONFIG_GPIO_SL28CPLD=m
+-CONFIG_POWER_AVS=y
+-CONFIG_QCOM_CPR=y
+-CONFIG_ROCKCHIP_IODOMAIN=y
+ CONFIG_POWER_RESET_MSM=y
+ CONFIG_POWER_RESET_XGENE=y
+ CONFIG_POWER_RESET_SYSCON=y
+@@ -532,10 +523,10 @@ CONFIG_SENSORS_INA3221=m
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
+@@ -552,7 +543,6 @@ CONFIG_WATCHDOG=y
+ CONFIG_SL28CPLD_WATCHDOG=m
+ CONFIG_ARM_SP805_WATCHDOG=y
+ CONFIG_ARM_SBSA_WATCHDOG=y
+-CONFIG_ARM_SMC_WATCHDOG=y
+ CONFIG_S3C2410_WATCHDOG=y
+ CONFIG_DW_WATCHDOG=y
+ CONFIG_SUNXI_WATCHDOG=m
+@@ -561,6 +551,7 @@ CONFIG_IMX_SC_WDT=m
+ CONFIG_QCOM_WDT=m
+ CONFIG_MESON_GXBB_WATCHDOG=m
+ CONFIG_MESON_WATCHDOG=m
++CONFIG_ARM_SMC_WATCHDOG=y
+ CONFIG_RENESAS_WDT=y
+ CONFIG_UNIPHIER_WATCHDOG=y
+ CONFIG_BCM2835_WDT=y
+@@ -607,13 +598,12 @@ CONFIG_MEDIA_CAMERA_SUPPORT=y
+ CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
+ CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
+ CONFIG_MEDIA_SDR_SUPPORT=y
+-CONFIG_MEDIA_CONTROLLER=y
+-CONFIG_VIDEO_V4L2_SUBDEV_API=y
+ CONFIG_MEDIA_PLATFORM_SUPPORT=y
+ # CONFIG_DVB_NET is not set
+ CONFIG_MEDIA_USB_SUPPORT=y
+ CONFIG_USB_VIDEO_CLASS=m
+ CONFIG_V4L_PLATFORM_DRIVERS=y
++CONFIG_VIDEO_QCOM_CAMSS=m
+ CONFIG_VIDEO_RCAR_CSI2=m
+ CONFIG_VIDEO_RCAR_VIN=m
+ CONFIG_VIDEO_SUN6I_CSI=m
+@@ -628,7 +618,6 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
+ CONFIG_VIDEO_RCAR_DRIF=m
+ CONFIG_VIDEO_IMX219=m
+ CONFIG_VIDEO_OV5645=m
+-CONFIG_VIDEO_QCOM_CAMSS=m
+ CONFIG_DRM=m
+ CONFIG_DRM_I2C_NXP_TDA998X=m
+ CONFIG_DRM_MALI_DISPLAY=m
+@@ -660,8 +649,8 @@ CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
+ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+ CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
+ CONFIG_DRM_DISPLAY_CONNECTOR=m
+-CONFIG_DRM_NWL_MIPI_DSI=m
+ CONFIG_DRM_LONTIUM_LT9611=m
++CONFIG_DRM_NWL_MIPI_DSI=m
+ CONFIG_DRM_SII902X=m
+ CONFIG_DRM_SIMPLE_BRIDGE=m
+ CONFIG_DRM_THINE_THC63LVD1024=m
+@@ -682,7 +671,6 @@ CONFIG_DRM_PANFROST=m
+ CONFIG_FB=y
+ CONFIG_FB_MODE_HELPERS=y
+ CONFIG_FB_EFI=y
+-CONFIG_BACKLIGHT_GENERIC=m
+ CONFIG_BACKLIGHT_PWM=m
+ CONFIG_BACKLIGHT_LP855X=m
+ CONFIG_LOGO=y
+@@ -726,7 +714,6 @@ CONFIG_SND_SOC_WSA881X=m
+ CONFIG_SND_SIMPLE_CARD=m
+ CONFIG_SND_AUDIO_GRAPH_CARD=m
+ CONFIG_I2C_HID=m
+-CONFIG_USB_CONN_GPIO=m
+ CONFIG_USB=y
+ CONFIG_USB_OTG=y
+ CONFIG_USB_XHCI_HCD=y
+@@ -859,7 +846,6 @@ CONFIG_VIRTIO_BALLOON=y
+ CONFIG_VIRTIO_MMIO=y
+ CONFIG_XEN_GNTDEV=y
+ CONFIG_XEN_GRANT_DEV_ALLOC=y
+-CONFIG_MFD_CROS_EC_DEV=y
+ CONFIG_CHROME_PLATFORMS=y
+ CONFIG_CROS_EC=y
+ CONFIG_CROS_EC_I2C=y
+@@ -885,8 +871,8 @@ CONFIG_QCOM_A53PLL=y
+ CONFIG_QCOM_CLK_APCS_MSM8916=y
+ CONFIG_QCOM_CLK_SMD_RPM=y
+ CONFIG_QCOM_CLK_RPMH=y
+-CONFIG_IPQ_GCC_8074=y
+ CONFIG_IPQ_GCC_6018=y
++CONFIG_IPQ_GCC_8074=y
+ CONFIG_MSM_GCC_8916=y
+ CONFIG_MSM_GCC_8994=y
+ CONFIG_MSM_MMCC_8996=y
+@@ -894,12 +880,9 @@ CONFIG_MSM_GCC_8998=y
+ CONFIG_QCS_GCC_404=y
+ CONFIG_SC_GCC_7180=y
+ CONFIG_SDM_CAMCC_845=m
+-CONFIG_SDM_GCC_845=y
+ CONFIG_SDM_GPUCC_845=y
+ CONFIG_SDM_VIDEOCC_845=y
+ CONFIG_SDM_DISPCC_845=y
+-CONFIG_SM_GCC_8150=y
+-CONFIG_SM_GCC_8250=y
+ CONFIG_SM_GPUCC_8150=y
+ CONFIG_SM_GPUCC_8250=y
+ CONFIG_QCOM_HFPLL=y
+@@ -930,6 +913,7 @@ CONFIG_RASPBERRYPI_POWER=y
+ CONFIG_FSL_DPAA=y
+ CONFIG_FSL_MC_DPIO=y
+ CONFIG_QCOM_AOSS_QMP=y
++CONFIG_QCOM_CPR=y
+ CONFIG_QCOM_GENI_SE=y
+ CONFIG_QCOM_RMTFS_MEM=m
+ CONFIG_QCOM_RPMH=y
+@@ -941,19 +925,20 @@ CONFIG_QCOM_SMP2P=y
+ CONFIG_QCOM_SMSM=y
+ CONFIG_QCOM_SOCINFO=m
+ CONFIG_QCOM_APR=m
+-CONFIG_ARCH_R8A774A1=y
+-CONFIG_ARCH_R8A774B1=y
+-CONFIG_ARCH_R8A774C0=y
+-CONFIG_ARCH_R8A774E1=y
++CONFIG_ARCH_R8A77995=y
++CONFIG_ARCH_R8A77990=y
+ CONFIG_ARCH_R8A77950=y
+ CONFIG_ARCH_R8A77951=y
++CONFIG_ARCH_R8A77965=y
+ CONFIG_ARCH_R8A77960=y
+ CONFIG_ARCH_R8A77961=y
+-CONFIG_ARCH_R8A77965=y
+-CONFIG_ARCH_R8A77970=y
+ CONFIG_ARCH_R8A77980=y
+-CONFIG_ARCH_R8A77990=y
+-CONFIG_ARCH_R8A77995=y
++CONFIG_ARCH_R8A77970=y
++CONFIG_ARCH_R8A774C0=y
++CONFIG_ARCH_R8A774E1=y
++CONFIG_ARCH_R8A774A1=y
++CONFIG_ARCH_R8A774B1=y
++CONFIG_ROCKCHIP_IODOMAIN=y
+ CONFIG_ROCKCHIP_PM_DOMAINS=y
+ CONFIG_ARCH_TEGRA_132_SOC=y
+ CONFIG_ARCH_TEGRA_210_SOC=y
+@@ -1017,9 +1002,9 @@ CONFIG_PHY_UNIPHIER_USB3=y
+ CONFIG_PHY_TEGRA_XUSB=y
+ CONFIG_ARM_SMMU_V3_PMU=m
+ CONFIG_FSL_IMX8_DDR_PMU=m
+-CONFIG_HISI_PMU=y
+ CONFIG_QCOM_L2_PMU=y
+ CONFIG_QCOM_L3_PMU=y
++CONFIG_HISI_PMU=y
+ CONFIG_NVMEM_IMX_OCOTP=y
+ CONFIG_NVMEM_IMX_OCOTP_SCU=y
+ CONFIG_QCOM_QFPROM=y
+@@ -1035,10 +1020,9 @@ CONFIG_FPGA_REGION=m
+ CONFIG_OF_FPGA_REGION=m
+ CONFIG_TEE=y
+ CONFIG_OPTEE=y
+-CONFIG_SLIMBUS=m
++CONFIG_MUX_MMIO=y
+ CONFIG_SLIM_QCOM_CTRL=m
+ CONFIG_SLIM_QCOM_NGD_CTRL=m
+-CONFIG_MUX_MMIO=y
+ CONFIG_INTERCONNECT=y
+ CONFIG_INTERCONNECT_QCOM=y
+ CONFIG_INTERCONNECT_QCOM_MSM8916=m
+@@ -1059,7 +1043,6 @@ CONFIG_CUSE=m
+ CONFIG_OVERLAY_FS=m
+ CONFIG_VFAT_FS=y
+ CONFIG_HUGETLBFS=y
+-CONFIG_CONFIGFS_FS=y
+ CONFIG_EFIVAR_FS=y
+ CONFIG_SQUASHFS=y
+ CONFIG_NFS_FS=y
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
new file mode 100644
index 0000000..6fc96c5
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/linux-yocto:"
+
+SRC_URI_append_qemuarm64-sbsa = " \
+    file://defconfig.patch \
+    "
-- 
2.17.1

