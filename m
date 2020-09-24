Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.27064.1600978327731338398
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 13:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ZWU5O+g+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id n10so165976qtv.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 24 Sep 2020 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TcdS12kmHSTfW6ZD+HuxP/ZxTP+U+gGnj+eAuhg7KLM=;
        b=ZWU5O+g+fSo7QdpgQS6WM+kFx5WuQY4MOqNzE2ukSGIvp8D81KPYAWbLAMN7Ga+JYh
         f9RPOWxQQGxx38bPRplZYuaA25Mx+8gECTF8Tppjj595ZuWkInczvzlsHnXHsqDUQdfX
         Q7/rnDo8KJdEeC4xy6cGZ/7WDi2HKS12UqzWiRMI9buU4xPyXApKE8J2YU7GyzU/DHCL
         PmqGoKlc4WpC3Seoakpd3dyQ78ROykr2cIMsweHHQuLZ34QXLo0XQVJqv3JlpSiiUhmO
         T6XC1AIEzc87axKGWNibe0x1EQMnQl8Sd4vqsDujRWC0O15bPXw1qb1RfngiNVDJ7hA0
         TPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TcdS12kmHSTfW6ZD+HuxP/ZxTP+U+gGnj+eAuhg7KLM=;
        b=NuTLlnL9a2qCLIeciHaWZkU9aNrwk/juisJlnkNdF9+dOddu+a6/dDglp2WAJDv7i5
         Hc0qyhEZ963h7ta8pmf9YFep+v9UGTjsu3DDoAM3oCNCQpNrtfilKTtRZxpKohrz9MUd
         wLYrEOsXYe30SwnftGCeScpKzToxHTPA6Ydtwvj4qIFb4QTfkR1/1uU/vL1i6AavteDn
         pUH23bkeQrTAA0PE3Y5iingriRlH+9d6ChqFVLPwstEynJPDGFIqpcHq6ikfzpLFju1T
         eLGzXpqeIZN+/3RkDi9Ba7HL9FqIXzkGiJi2s4NwLGKnDzClngjbt2jE7ff0d0wgTyH2
         CzeQ==
X-Gm-Message-State: AOAM532Ue7ObrIkpwkHnJ9b5q6WOfAlvQip28t3iXEwQHuwDKPhG3k86
	Jp/mlL9755cne+mgLf+7g7s6wA==
X-Google-Smtp-Source: ABdhPJyBd44pXI9hniNk6dcM5VwqGD5oJajJpi5Z+KLG3edVHCV2ELAc87p0OagDKByASLgUhTsbHg==
X-Received: by 2002:ac8:728e:: with SMTP id v14mr870746qto.311.1600978326572;
        Thu, 24 Sep 2020 13:12:06 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id s10sm361521qkg.61.2020.09.24.13.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 13:12:06 -0700 (PDT)
Date: Thu, 24 Sep 2020 16:12:03 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [v2] arm-bsp/tc0: update kernel from 4.19 to 5.4
Message-ID: <20200924201203.GF4275@kudzu.us>
References: <20200924183236.41938-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200924183236.41938-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2020 at 07:32:36PM +0100, Usama Arif wrote:
> As the ack-4.19 patches are no longer used, they can
> be removed.
> The extra defconfig options have been removed as well
> according for 5.4 kernel.
> 
> Change-Id: Iecbfe86107b7b142f17af6bdfbee086b9590fc1a
> Signed-off-by: Usama Arif <usama.arif@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/tc0.conf            |   2 +-
>  .../recipes-kernel/linux/files/tc0/defconfig  | 134 ++-----
>  .../linux/linux-arm-platforms.inc             |   7 +-
>  ...m-Add-component-aware-simple-encoder.patch | 368 ------------------
>  ...-red-and-blue-colors-in-HDLCD-driver.patch |  43 --
>  .../linux/linux-arm64-ack_4.19.bbappend       |   2 -
>  6 files changed, 32 insertions(+), 524 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
> 
> diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
> index 2de99cd..1eb3d87 100644
> --- a/meta-arm-bsp/conf/machine/tc0.conf
> +++ b/meta-arm-bsp/conf/machine/tc0.conf
> @@ -14,7 +14,7 @@ UBOOT_MACHINE ?= "total_compute_defconfig"
>  # Trusted firmware A v2.3
>  PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
> -PREFERRED_VERSION_linux-arm64-ack ?= "4.19"
> +PREFERRED_VERSION_linux-arm64-ack ?= "5.4"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
>  
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig b/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
> index 1f3b1d2..69a9a0a 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
> +++ b/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
> @@ -27,7 +27,6 @@ CONFIG_CGROUP_CPUACCT=y
>  CONFIG_CGROUP_PERF=y
>  CONFIG_CGROUP_BPF=y
>  CONFIG_SCHED_AUTOGROUP=y
> -CONFIG_SCHED_TUNE=y
>  CONFIG_BLK_DEV_INITRD=y
>  # CONFIG_FHANDLE is not set
>  CONFIG_KALLSYMS_ALL=y
> @@ -50,19 +49,11 @@ CONFIG_ARCH_HISI=y
>  CONFIG_ARCH_MEDIATEK=y
>  CONFIG_ARCH_MESON=y
>  CONFIG_ARCH_MVEBU=y
> -CONFIG_ARCH_QCOM=y
> +CONFIG_ARCH_RENESAS=y
>  CONFIG_ARCH_ROCKCHIP=y
>  CONFIG_ARCH_SEATTLE=y
> -CONFIG_ARCH_SYNQUACER=y
> -CONFIG_ARCH_RENESAS=y
> -CONFIG_ARCH_R8A7795=y
> -CONFIG_ARCH_R8A7796=y
> -CONFIG_ARCH_R8A77965=y
> -CONFIG_ARCH_R8A77970=y
> -CONFIG_ARCH_R8A77980=y
> -CONFIG_ARCH_R8A77990=y
> -CONFIG_ARCH_R8A77995=y
>  CONFIG_ARCH_STRATIX10=y
> +CONFIG_ARCH_SYNQUACER=y
>  CONFIG_ARCH_TEGRA=y
>  CONFIG_ARCH_SPRD=y
>  CONFIG_ARCH_THUNDER=y
> @@ -72,24 +63,6 @@ CONFIG_ARCH_VEXPRESS=y
>  CONFIG_ARCH_XGENE=y
>  CONFIG_ARCH_ZX=y
>  CONFIG_ARCH_ZYNQMP=y
> -CONFIG_PCI=y
> -CONFIG_PCI_IOV=y
> -CONFIG_HOTPLUG_PCI=y
> -CONFIG_HOTPLUG_PCI_ACPI=y
> -CONFIG_PCI_AARDVARK=y
> -CONFIG_PCI_TEGRA=y
> -CONFIG_PCIE_RCAR=y
> -CONFIG_PCI_HOST_GENERIC=y
> -CONFIG_PCI_XGENE=y
> -CONFIG_PCI_HOST_THUNDER_PEM=y
> -CONFIG_PCI_HOST_THUNDER_ECAM=y
> -CONFIG_PCIE_ROCKCHIP_HOST=m
> -CONFIG_PCI_LAYERSCAPE=y
> -CONFIG_PCI_HISI=y
> -CONFIG_PCIE_QCOM=y
> -CONFIG_PCIE_ARMADA_8K=y
> -CONFIG_PCIE_KIRIN=y
> -CONFIG_PCIE_HISI_STB=y
>  CONFIG_ARM64_VA_BITS_48=y
>  CONFIG_SCHED_MC=y
>  CONFIG_NUMA=y
> @@ -98,8 +71,8 @@ CONFIG_KEXEC=y
>  CONFIG_CRASH_DUMP=y
>  CONFIG_XEN=y
>  CONFIG_ARM64_SW_TTBR0_PAN=y
> -CONFIG_RANDOMIZE_BASE=y
>  CONFIG_COMPAT=y
> +CONFIG_RANDOMIZE_BASE=y
>  CONFIG_HIBERNATION=y
>  CONFIG_PM_DEBUG=y
>  CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
> @@ -115,7 +88,6 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
>  CONFIG_CPUFREQ_DT=y
>  CONFIG_ACPI_CPPC_CPUFREQ=m
>  CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
> -CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
>  CONFIG_ARM_SCPI_CPUFREQ=y
>  CONFIG_ARM_TEGRA186_CPUFREQ=y
>  CONFIG_ARM_SCPI_PROTOCOL=y
> @@ -125,7 +97,6 @@ CONFIG_ACPI=y
>  CONFIG_ACPI_APEI=y
>  CONFIG_ACPI_APEI_GHES=y
>  CONFIG_ACPI_APEI_MEMORY_FAILURE=y
> -CONFIG_ACPI_APEI_EINJ=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=y
>  CONFIG_ARM64_CRYPTO=y
> @@ -136,7 +107,6 @@ CONFIG_CRYPTO_SHA3_ARM64=m
>  CONFIG_CRYPTO_SM3_ARM64_CE=m
>  CONFIG_CRYPTO_GHASH_ARM64_CE=y
>  CONFIG_CRYPTO_CRCT10DIF_ARM64_CE=m
> -CONFIG_CRYPTO_CRC32_ARM64_CE=m
>  CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
>  CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
>  CONFIG_CRYPTO_CHACHA20_NEON=m
> @@ -270,7 +240,6 @@ CONFIG_BT_HIDP=m
>  # CONFIG_BT_HS is not set
>  # CONFIG_BT_LE is not set
>  CONFIG_BT_LEDS=y
> -# CONFIG_BT_DEBUGFS is not set
>  CONFIG_BT_HCIBTUSB=m
>  CONFIG_BT_HCIUART=m
>  CONFIG_BT_HCIUART_LL=y
> @@ -281,20 +250,29 @@ CONFIG_MAC80211_LEDS=y
>  CONFIG_RFKILL=m
>  CONFIG_NET_9P=y
>  CONFIG_NET_9P_VIRTIO=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
> +CONFIG_PCI=y
> +CONFIG_PCI_IOV=y
> +CONFIG_HOTPLUG_PCI=y
> +CONFIG_HOTPLUG_PCI_ACPI=y
> +CONFIG_PCI_AARDVARK=y
> +CONFIG_PCI_TEGRA=y
> +CONFIG_PCIE_RCAR=y
> +CONFIG_PCI_HOST_GENERIC=y
> +CONFIG_PCI_XGENE=y
> +CONFIG_PCI_HOST_THUNDER_PEM=y
> +CONFIG_PCI_HOST_THUNDER_ECAM=y
> +CONFIG_PCIE_ROCKCHIP_HOST=m
> +CONFIG_PCI_LAYERSCAPE=y
> +CONFIG_PCI_HISI=y
> +CONFIG_PCIE_ARMADA_8K=y
> +CONFIG_PCIE_KIRIN=y
> +CONFIG_PCIE_HISI_STB=y
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
> -CONFIG_DMA_CMA=y
> -CONFIG_CMA_SIZE_MBYTES=32
>  CONFIG_HISILICON_LPC=y
>  CONFIG_SIMPLE_PM_BUS=y
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
> -CONFIG_MTD_M25P80=y
> -CONFIG_MTD_NAND=y
> -CONFIG_MTD_NAND_DENALI_DT=y
> -CONFIG_MTD_NAND_MARVELL=y
> -CONFIG_MTD_NAND_QCOM=y
>  CONFIG_MTD_SPI_NOR=y
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_NBD=m
> @@ -312,7 +290,6 @@ CONFIG_SCSI_HISI_SAS=y
>  CONFIG_SCSI_HISI_SAS_PCI=y
>  CONFIG_SCSI_UFSHCD=m
>  CONFIG_SCSI_UFSHCD_PLATFORM=m
> -CONFIG_SCSI_UFS_QCOM=m
>  CONFIG_SCSI_UFS_HISI=m
>  CONFIG_ATA=y
>  CONFIG_SATA_AHCI=y
> @@ -410,7 +387,6 @@ CONFIG_TABLET_USB_KBTAB=y
>  CONFIG_INPUT_TOUCHSCREEN=y
>  CONFIG_TOUCHSCREEN_ATMEL_MXT=m
>  CONFIG_INPUT_MISC=y
> -CONFIG_INPUT_PM8941_PWRKEY=y
>  CONFIG_INPUT_UINPUT=y
>  CONFIG_INPUT_HISI_POWERKEY=y
>  # CONFIG_SERIO_SERPORT is not set
> @@ -434,8 +410,6 @@ CONFIG_SERIAL_SAMSUNG=y
>  CONFIG_SERIAL_SAMSUNG_CONSOLE=y
>  CONFIG_SERIAL_TEGRA=y
>  CONFIG_SERIAL_SH_SCI=y
> -CONFIG_SERIAL_MSM=y
> -CONFIG_SERIAL_MSM_CONSOLE=y
>  CONFIG_SERIAL_XILINX_PS_UART=y
>  CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
>  CONFIG_SERIAL_MVEBU_UART=y
> @@ -444,14 +418,12 @@ CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_TCG_TPM=y
>  CONFIG_TCG_TIS_I2C_INFINEON=y
>  CONFIG_I2C_CHARDEV=y
> -CONFIG_I2C_MUX_PCA954x=y
>  CONFIG_I2C_BCM2835=m
>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>  CONFIG_I2C_IMX=y
>  CONFIG_I2C_MESON=y
>  CONFIG_I2C_MV64XXX=y
>  CONFIG_I2C_PXA=y
> -CONFIG_I2C_QUP=y
>  CONFIG_I2C_RK3X=y
>  CONFIG_I2C_SH_MOBILE=y
>  CONFIG_I2C_TEGRA=y
> @@ -468,19 +440,11 @@ CONFIG_SPI_MESON_SPIFC=m
>  CONFIG_SPI_ORION=y
>  CONFIG_SPI_PL022=y
>  CONFIG_SPI_ROCKCHIP=y
> -CONFIG_SPI_QUP=y
>  CONFIG_SPI_S3C64XX=y
>  CONFIG_SPI_SPIDEV=m
>  CONFIG_SPMI=y
>  CONFIG_PINCTRL_SINGLE=y
>  CONFIG_PINCTRL_MAX77620=y
> -CONFIG_PINCTRL_IPQ8074=y
> -CONFIG_PINCTRL_MSM8916=y
> -CONFIG_PINCTRL_MSM8994=y
> -CONFIG_PINCTRL_MSM8996=y
> -CONFIG_PINCTRL_QDF2XXX=y
> -CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
> -CONFIG_PINCTRL_MT7622=y
>  CONFIG_GPIO_DWAPB=y
>  CONFIG_GPIO_MB86S7X=y
>  CONFIG_GPIO_PL061=y
> @@ -493,7 +457,6 @@ CONFIG_GPIO_PCA953X_IRQ=y
>  CONFIG_GPIO_MAX77620=y
>  CONFIG_POWER_AVS=y
>  CONFIG_ROCKCHIP_IODOMAIN=y
> -CONFIG_POWER_RESET_MSM=y
>  CONFIG_POWER_RESET_XGENE=y
>  CONFIG_POWER_RESET_SYSCON=y
>  CONFIG_SYSCON_REBOOT_MODE=y
> @@ -512,7 +475,6 @@ CONFIG_ARMADA_THERMAL=y
>  CONFIG_BRCMSTB_THERMAL=m
>  CONFIG_EXYNOS_THERMAL=y
>  CONFIG_TEGRA_BPMP_THERMAL=m
> -CONFIG_QCOM_TSENS=y
>  CONFIG_UNIPHIER_THERMAL=y
>  CONFIG_WATCHDOG=y
>  CONFIG_ARM_SP805_WATCHDOG=y
> @@ -524,29 +486,12 @@ CONFIG_UNIPHIER_WATCHDOG=y
>  CONFIG_BCM2835_WDT=y
>  CONFIG_MFD_BD9571MWV=y
>  CONFIG_MFD_AXP20X_RSB=y
> -CONFIG_MFD_CROS_EC=y
> -CONFIG_MFD_CROS_EC_CHARDEV=m
>  CONFIG_MFD_EXYNOS_LPASS=m
>  CONFIG_MFD_HI6421_PMIC=y
>  CONFIG_MFD_HI655X_PMIC=y
>  CONFIG_MFD_MAX77620=y
> -CONFIG_MFD_SPMI_PMIC=y
>  CONFIG_MFD_RK808=y
>  CONFIG_MFD_SEC_CORE=y
> -CONFIG_REGULATOR_FIXED_VOLTAGE=y
> -CONFIG_REGULATOR_AXP20X=y
> -CONFIG_REGULATOR_BD9571MWV=y
> -CONFIG_REGULATOR_FAN53555=y
> -CONFIG_REGULATOR_GPIO=y
> -CONFIG_REGULATOR_HI6421V530=y
> -CONFIG_REGULATOR_HI655X=y
> -CONFIG_REGULATOR_MAX77620=y
> -CONFIG_REGULATOR_PWM=y
> -CONFIG_REGULATOR_QCOM_SMD_RPM=y
> -CONFIG_REGULATOR_QCOM_SPMI=y
> -CONFIG_REGULATOR_RK808=y
> -CONFIG_REGULATOR_S2MPS11=y
> -CONFIG_REGULATOR_VCTRL=m
>  CONFIG_RC_CORE=m
>  CONFIG_RC_DECODERS=y
>  CONFIG_RC_DEVICES=y
> @@ -571,7 +516,6 @@ CONFIG_DRM_LOAD_EDID_FIRMWARE=y
>  CONFIG_DRM_I2C_NXP_TDA998X=y
>  CONFIG_DRM_HDLCD=y
>  CONFIG_DRM_NOUVEAU=m
> -CONFIG_DRM_VIRT_ENCODER=y
>  CONFIG_DRM_EXYNOS=m
>  CONFIG_DRM_EXYNOS5433_DECON=y
>  CONFIG_DRM_EXYNOS7_DECON=y
> @@ -586,7 +530,6 @@ CONFIG_ROCKCHIP_DW_HDMI=y
>  CONFIG_ROCKCHIP_DW_MIPI_DSI=y
>  CONFIG_ROCKCHIP_INNO_HDMI=y
>  CONFIG_DRM_RCAR_DU=m
> -CONFIG_DRM_RCAR_LVDS=m
>  CONFIG_DRM_TEGRA=m
>  CONFIG_DRM_PANEL_SIMPLE=m
>  CONFIG_DRM_I2C_ADV7511=m
> @@ -719,7 +662,6 @@ CONFIG_MMC_SDHCI_CADENCE=y
>  CONFIG_MMC_SDHCI_TEGRA=y
>  CONFIG_MMC_SDHCI_F_SDH30=y
>  CONFIG_MMC_MESON_GX=y
> -CONFIG_MMC_SDHCI_MSM=y
>  CONFIG_MMC_SPI=y
>  CONFIG_MMC_SDHI=y
>  CONFIG_MMC_DW=y
> @@ -759,7 +701,6 @@ CONFIG_K3_DMA=y
>  CONFIG_MV_XOR_V2=y
>  CONFIG_PL330_DMA=y
>  CONFIG_TEGRA20_APB_DMA=y
> -CONFIG_QCOM_BAM_DMA=y
>  CONFIG_QCOM_HIDMA_MGMT=y
>  CONFIG_QCOM_HIDMA=y
>  CONFIG_RCAR_DMAC=y
> @@ -774,6 +715,7 @@ CONFIG_XEN_GRANT_DEV_ALLOC=y
>  CONFIG_STAGING=y
>  CONFIG_ASHMEM=y
>  CONFIG_ION=y
> +CONFIG_MFD_CROS_EC=y
>  CONFIG_CROS_EC_I2C=y
>  CONFIG_CROS_EC_SPI=y
>  CONFIG_COMMON_CLK_RK808=y
> @@ -782,37 +724,28 @@ CONFIG_COMMON_CLK_CS2000_CP=y
>  CONFIG_COMMON_CLK_S2MPS11=y
>  CONFIG_CLK_QORIQ=y
>  CONFIG_COMMON_CLK_PWM=y
> -CONFIG_COMMON_CLK_QCOM=y
> -CONFIG_QCOM_CLK_SMD_RPM=y
> -CONFIG_IPQ_GCC_8074=y
> -CONFIG_MSM_GCC_8916=y
> -CONFIG_MSM_GCC_8994=y
> -CONFIG_MSM_MMCC_8996=y
>  CONFIG_HWSPINLOCK=y
> -CONFIG_HWSPINLOCK_QCOM=y
>  CONFIG_ARM_MHU=y
>  CONFIG_PLATFORM_MHU=y
>  CONFIG_BCM2835_MBOX=y
> -CONFIG_QCOM_APCS_IPC=y
>  CONFIG_ROCKCHIP_IOMMU=y
>  CONFIG_TEGRA_IOMMU_SMMU=y
> -CONFIG_ARM_SMMU=y
>  CONFIG_ARM_SMMU_V3=y
> -CONFIG_QCOM_IOMMU=y
>  CONFIG_RPMSG_QCOM_GLINK_RPM=y
> -CONFIG_RPMSG_QCOM_SMD=y
>  CONFIG_RASPBERRYPI_POWER=y
> -CONFIG_QCOM_SMEM=y
> -CONFIG_QCOM_SMD_RPM=y
> -CONFIG_QCOM_SMP2P=y
> -CONFIG_QCOM_SMSM=y
> +CONFIG_ARCH_R8A7795=y
> +CONFIG_ARCH_R8A7796=y
> +CONFIG_ARCH_R8A77965=y
> +CONFIG_ARCH_R8A77970=y
> +CONFIG_ARCH_R8A77980=y
> +CONFIG_ARCH_R8A77990=y
> +CONFIG_ARCH_R8A77995=y
>  CONFIG_ROCKCHIP_PM_DOMAINS=y
>  CONFIG_ARCH_TEGRA_132_SOC=y
>  CONFIG_ARCH_TEGRA_210_SOC=y
>  CONFIG_ARCH_TEGRA_186_SOC=y
>  CONFIG_ARCH_TEGRA_194_SOC=y
>  CONFIG_ARCH_K3_AM6_SOC=y
> -CONFIG_SOC_TI=y
>  CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
>  CONFIG_EXTCON_USB_GPIO=y
>  CONFIG_EXTCON_USBC_CROS_EC=y
> @@ -838,7 +771,6 @@ CONFIG_PHY_HI6220_USB=y
>  CONFIG_PHY_HISTB_COMBPHY=y
>  CONFIG_PHY_HISI_INNO_USB2=y
>  CONFIG_PHY_MVEBU_CP110_COMPHY=y
> -CONFIG_PHY_QCOM_QMP=m
>  CONFIG_PHY_QCOM_USB_HS=y
>  CONFIG_PHY_RCAR_GEN3_USB2=y
>  CONFIG_PHY_RCAR_GEN3_USB3=m
> @@ -848,11 +780,8 @@ CONFIG_PHY_ROCKCHIP_PCIE=m
>  CONFIG_PHY_ROCKCHIP_TYPEC=y
>  CONFIG_PHY_TEGRA_XUSB=y
>  CONFIG_HISI_PMU=y
> -CONFIG_QCOM_L2_PMU=y
> -CONFIG_QCOM_L3_PMU=y
>  CONFIG_ANDROID=y
>  CONFIG_ANDROID_BINDER_IPC=y
> -CONFIG_QCOM_QFPROM=y
>  CONFIG_ROCKCHIP_EFUSE=y
>  CONFIG_UNIPHIER_EFUSE=y
>  CONFIG_MESON_EFUSE=m
> @@ -862,12 +791,10 @@ CONFIG_EXT2_FS=y
>  CONFIG_EXT3_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
>  CONFIG_EXT4_FS_SECURITY=y
> -CONFIG_EXT4_ENCRYPTION=y
>  CONFIG_BTRFS_FS=m
>  CONFIG_BTRFS_FS_POSIX_ACL=y
>  CONFIG_F2FS_FS=y
>  CONFIG_F2FS_FS_SECURITY=y
> -CONFIG_F2FS_FS_ENCRYPTION=y
>  CONFIG_FANOTIFY=y
>  CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
>  CONFIG_QUOTA=y
> @@ -878,17 +805,14 @@ CONFIG_CUSE=m
>  CONFIG_OVERLAY_FS=y
>  CONFIG_MSDOS_FS=y
>  CONFIG_VFAT_FS=y
> -CONFIG_TMPFS_POSIX_ACL=y
>  CONFIG_HUGETLBFS=y
>  CONFIG_EFIVAR_FS=y
> -CONFIG_SDCARD_FS=y
>  CONFIG_SQUASHFS=y
>  CONFIG_PSTORE_CONSOLE=y
>  CONFIG_PSTORE_RAM=y
>  CONFIG_9P_FS=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ISO8859_1=y
> -CONFIG_SECURITY_PERF_EVENTS_RESTRICT=y
>  CONFIG_SECURITY=y
>  CONFIG_SECURITY_NETWORK=y
>  CONFIG_HARDENED_USERCOPY=y
> @@ -896,6 +820,8 @@ CONFIG_SECURITY_SELINUX=y
>  CONFIG_CRYPTO_GCM=y
>  CONFIG_CRYPTO_SHA512=y
>  CONFIG_CRYPTO_ANSI_CPRNG=y
> +CONFIG_DMA_CMA=y
> +CONFIG_CMA_SIZE_MBYTES=32
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_INFO=y
>  CONFIG_MAGIC_SYSRQ=y
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> index 79ef26e..d4dac1d 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> @@ -72,12 +72,7 @@ KCONFIG_MODE_sgi575 = "--alldefconfig"
>  #
>  # Total Compute KMACHINE
>  #
> +SRC_URI_append_tc0 = " file://defconfig"
>  COMPATIBLE_MACHINE_tc0 = "tc0"
>  KMACHINE_tc0 = "tc0"
> -KBUILD_DEFCONFIG_tc0 = "defconfig"
>  KCONFIG_MODE_tc0 = "--alldefconfig"
> -SRC_URI_append_tc0 = " \
> -    file://0001-drm-Add-component-aware-simple-encoder.patch \
> -    file://0002-swap-red-and-blue-colors-in-HDLCD-driver.patch \
> -    file://defconfig \
> -    "
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
> deleted file mode 100644
> index 96cc651..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
> +++ /dev/null
> @@ -1,368 +0,0 @@
> -From 6fd66138c44107786879d0adebe78ca94cf6292f Mon Sep 17 00:00:00 2001
> -From: Liviu Dudau <Liviu.Dudau@arm.com>
> -Date: Wed, 1 Apr 2020 12:10:14 +0100
> -Subject: [PATCH 1/2] drm: Add component-aware simple encoder
> -
> -This is a simple DRM encoder that gets its connector timings information
> -from a OF subnode in the device tree and exposes that as a "discovered"
> -panel. It can be used together with component-based DRM drivers in an
> -emulated environment where no real encoder or connector hardware exists
> -and the display output is configured outside the kernel.
> -
> -Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> -[Backported to gem5's 4.3 kernel]
> -Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
> -[Ported to gem5's 4.9 kernel. Added dep. on VIDEOMODE_HELPERS.]
> -Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
> -[Ported to gem5's 4.14 kernel.]
> -Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
> -Upstream-Status: Backport
> -Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
> ----
> - drivers/gpu/drm/Kconfig               |  10 ++
> - drivers/gpu/drm/Makefile              |   3 +
> - drivers/gpu/drm/drm_virtual_encoder.c | 297 ++++++++++++++++++++++++++++++++++
> - 3 files changed, 310 insertions(+)
> - create mode 100644 drivers/gpu/drm/drm_virtual_encoder.c
> -
> -diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> -index e44e567..6e95357 100644
> ---- a/drivers/gpu/drm/Kconfig
> -+++ b/drivers/gpu/drm/Kconfig
> -@@ -255,6 +255,16 @@ config DRM_VKMS
> - 
> - 	  If M is selected the module will be called vkms.
> - 
> -+config DRM_VIRT_ENCODER
> -+	tristate "Virtual OF-based encoder"
> -+	depends on DRM && OF
> -+	select VIDEOMODE_HELPERS
> -+	help
> -+	  Choose this option to get a virtual encoder and its associated
> -+	  connector that will use the device tree to read the display
> -+	  timings information. If M is selected the module will be called
> -+	  drm_vencoder.
> -+
> - source "drivers/gpu/drm/exynos/Kconfig"
> - 
> - source "drivers/gpu/drm/rockchip/Kconfig"
> -diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> -index a6771ce..733ad62 100644
> ---- a/drivers/gpu/drm/Makefile
> -+++ b/drivers/gpu/drm/Makefile
> -@@ -46,6 +46,9 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
> - obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
> - obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
> - 
> -+drm_vencoder-y := drm_virtual_encoder.o
> -+obj-$(CONFIG_DRM_VIRT_ENCODER) += drm_vencoder.o
> -+
> - obj-$(CONFIG_DRM)	+= drm.o
> - obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
> - obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
> -diff --git a/drivers/gpu/drm/drm_virtual_encoder.c b/drivers/gpu/drm/drm_virtual_encoder.c
> -new file mode 100644
> -index 00000000..2e2c51d
> ---- /dev/null
> -+++ b/drivers/gpu/drm/drm_virtual_encoder.c
> -@@ -0,0 +1,297 @@
> -+/*
> -+ * Copyright (C) 2016 ARM Limited
> -+ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
> -+ *
> -+ * Dummy encoder and connector that use the OF to "discover" the attached
> -+ * display timings. Can be used in situations where the encoder and connector's
> -+ * functionality are emulated and no setup steps are needed, or to describe
> -+ * attached panels for which no driver exists but can be used without
> -+ * additional hardware setup.
> -+ *
> -+ * The encoder also uses the component framework so that it can be a quick
> -+ * replacement for existing drivers when testing in an emulated environment.
> -+ *
> -+ * This file is subject to the terms and conditions of the GNU General Public
> -+ * License.  See the file COPYING in the main directory of this archive
> -+ * for more details.
> -+ *
> -+ */
> -+
> -+#include <drm/drmP.h>
> -+#include <drm/drm_crtc.h>
> -+#include <drm/drm_atomic_helper.h>
> -+#include <drm/drm_crtc_helper.h>
> -+#include <drm/drm_of.h>
> -+#include <linux/component.h>
> -+#include <video/display_timing.h>
> -+#include <video/of_display_timing.h>
> -+#include <video/videomode.h>
> -+
> -+struct drm_virt_priv {
> -+	struct drm_connector connector;
> -+	struct drm_encoder encoder;
> -+	struct display_timings *timings;
> -+};
> -+
> -+#define connector_to_drm_virt_priv(x) \
> -+	container_of(x, struct drm_virt_priv, connector)
> -+
> -+#define encoder_to_drm_virt_priv(x) \
> -+	container_of(x, struct drm_virt_priv, encoder)
> -+
> -+static void drm_virtcon_destroy(struct drm_connector *connector)
> -+{
> -+	struct drm_virt_priv *conn = connector_to_drm_virt_priv(connector);
> -+
> -+	drm_connector_cleanup(connector);
> -+	display_timings_release(conn->timings);
> -+}
> -+
> -+static enum drm_connector_status
> -+drm_virtcon_detect(struct drm_connector *connector, bool force)
> -+{
> -+	return connector_status_connected;
> -+}
> -+
> -+static const struct drm_connector_funcs drm_virtcon_funcs = {
> -+	.reset = drm_atomic_helper_connector_reset,
> -+	.detect	= drm_virtcon_detect,
> -+	.fill_modes = drm_helper_probe_single_connector_modes,
> -+	.destroy = drm_virtcon_destroy,
> -+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -+};
> -+
> -+static int drm_virtcon_get_modes(struct drm_connector *connector)
> -+{
> -+	struct drm_virt_priv *conn = connector_to_drm_virt_priv(connector);
> -+	struct display_timings *timings = conn->timings;
> -+	int i;
> -+
> -+	for (i = 0; i < timings->num_timings; i++) {
> -+		struct drm_display_mode *mode = drm_mode_create(connector->dev);
> -+		struct videomode vm;
> -+
> -+		if (videomode_from_timings(timings, &vm, i))
> -+			break;
> -+
> -+		drm_display_mode_from_videomode(&vm, mode);
> -+		mode->type = DRM_MODE_TYPE_DRIVER;
> -+		if (timings->native_mode == i)
> -+			mode->type = DRM_MODE_TYPE_PREFERRED;
> -+
> -+		drm_mode_set_name(mode);
> -+		drm_mode_probed_add(connector, mode);
> -+	}
> -+
> -+	return i;
> -+}
> -+
> -+static int drm_virtcon_mode_valid(struct drm_connector *connector,
> -+				   struct drm_display_mode *mode)
> -+{
> -+	return MODE_OK;
> -+}
> -+
> -+struct drm_encoder *drm_virtcon_best_encoder(struct drm_connector *connector)
> -+{
> -+	struct drm_virt_priv *priv = connector_to_drm_virt_priv(connector);
> -+
> -+	return &priv->encoder;
> -+}
> -+
> -+struct drm_encoder *
> -+drm_virtcon_atomic_best_encoder(struct drm_connector *connector,
> -+				 struct drm_connector_state *connector_state)
> -+{
> -+	struct drm_virt_priv *priv = connector_to_drm_virt_priv(connector);
> -+
> -+	return &priv->encoder;
> -+}
> -+
> -+static const struct drm_connector_helper_funcs drm_virtcon_helper_funcs = {
> -+	.get_modes = drm_virtcon_get_modes,
> -+	.mode_valid = drm_virtcon_mode_valid,
> -+	.best_encoder = drm_virtcon_best_encoder,
> -+	.atomic_best_encoder = drm_virtcon_atomic_best_encoder,
> -+};
> -+
> -+static void drm_vencoder_destroy(struct drm_encoder *encoder)
> -+{
> -+	drm_encoder_cleanup(encoder);
> -+}
> -+
> -+static const struct drm_encoder_funcs drm_vencoder_funcs = {
> -+	.destroy = drm_vencoder_destroy,
> -+};
> -+
> -+static void drm_vencoder_dpms(struct drm_encoder *encoder, int mode)
> -+{
> -+	/* nothing needed */
> -+}
> -+
> -+static bool drm_vencoder_mode_fixup(struct drm_encoder *encoder,
> -+				    const struct drm_display_mode *mode,
> -+				    struct drm_display_mode *adjusted_mode)
> -+{
> -+	/* nothing needed */
> -+	return true;
> -+}
> -+
> -+static void drm_vencoder_prepare(struct drm_encoder *encoder)
> -+{
> -+	drm_vencoder_dpms(encoder, DRM_MODE_DPMS_OFF);
> -+}
> -+
> -+static void drm_vencoder_commit(struct drm_encoder *encoder)
> -+{
> -+	drm_vencoder_dpms(encoder, DRM_MODE_DPMS_ON);
> -+}
> -+
> -+static void drm_vencoder_mode_set(struct drm_encoder *encoder,
> -+				  struct drm_display_mode *mode,
> -+				  struct drm_display_mode *adjusted_mode)
> -+{
> -+	/* nothing needed */
> -+}
> -+
> -+static const struct drm_encoder_helper_funcs drm_vencoder_helper_funcs = {
> -+	.dpms		= drm_vencoder_dpms,
> -+	.mode_fixup	= drm_vencoder_mode_fixup,
> -+	.prepare	= drm_vencoder_prepare,
> -+	.commit		= drm_vencoder_commit,
> -+	.mode_set	= drm_vencoder_mode_set,
> -+};
> -+
> -+static int drm_vencoder_bind(struct device *dev, struct device *master,
> -+			     void *data)
> -+{
> -+	struct drm_encoder *encoder;
> -+	struct drm_virt_priv *con;
> -+	struct drm_connector *connector;
> -+	struct drm_device *drm = data;
> -+	u32 crtcs = 0;
> -+	int ret;
> -+
> -+	con = devm_kzalloc(dev, sizeof(*con), GFP_KERNEL);
> -+	if (!con)
> -+		return -ENOMEM;
> -+
> -+	dev_set_drvdata(dev, con);
> -+	connector = &con->connector;
> -+	encoder = &con->encoder;
> -+
> -+	if (dev->of_node) {
> -+		struct drm_bridge *bridge;
> -+		crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
> -+		bridge = of_drm_find_bridge(dev->of_node);
> -+		if (bridge) {
> -+			ret = drm_bridge_attach(encoder, bridge, NULL);
> -+			if (ret) {
> -+				DRM_ERROR("Failed to initialize bridge\n");
> -+				return ret;
> -+			}
> -+		}
> -+		con->timings = of_get_display_timings(dev->of_node);
> -+		if (!con->timings) {
> -+			dev_err(dev, "failed to get display panel timings\n");
> -+			return ENXIO;
> -+		}
> -+	}
> -+
> -+	/* If no CRTCs were found, fall back to the old encoder's behaviour */
> -+	if (crtcs == 0) {
> -+		dev_warn(dev, "Falling back to first CRTC\n");
> -+		crtcs = 1 << 0;
> -+	}
> -+
> -+	encoder->possible_crtcs = crtcs ? crtcs : 1;
> -+	encoder->possible_clones = 0;
> -+
> -+	ret = drm_encoder_init(drm, encoder, &drm_vencoder_funcs,
> -+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> -+	if (ret)
> -+		goto encoder_init_err;
> -+
> -+	drm_encoder_helper_add(encoder, &drm_vencoder_helper_funcs);
> -+
> -+	/* bogus values, pretend we're a 24" screen for DPI calculations */
> -+	connector->display_info.width_mm = 519;
> -+	connector->display_info.height_mm = 324;
> -+	connector->interlace_allowed = false;
> -+	connector->doublescan_allowed = false;
> -+	connector->polled = 0;
> -+
> -+	ret = drm_connector_init(drm, connector, &drm_virtcon_funcs,
> -+				 DRM_MODE_CONNECTOR_VIRTUAL);
> -+	if (ret)
> -+		goto connector_init_err;
> -+
> -+	drm_connector_helper_add(connector, &drm_virtcon_helper_funcs);
> -+
> -+	drm_connector_register(connector);
> -+
> -+	ret = drm_connector_attach_encoder(connector, encoder);
> -+	if (ret)
> -+		goto attach_err;
> -+
> -+	return ret;
> -+
> -+attach_err:
> -+	drm_connector_unregister(connector);
> -+	drm_connector_cleanup(connector);
> -+connector_init_err:
> -+	drm_encoder_cleanup(encoder);
> -+encoder_init_err:
> -+	display_timings_release(con->timings);
> -+
> -+	return ret;
> -+};
> -+
> -+static void drm_vencoder_unbind(struct device *dev, struct device *master,
> -+				void *data)
> -+{
> -+	struct drm_virt_priv *con = dev_get_drvdata(dev);
> -+
> -+	drm_connector_unregister(&con->connector);
> -+	drm_connector_cleanup(&con->connector);
> -+	drm_encoder_cleanup(&con->encoder);
> -+	display_timings_release(con->timings);
> -+}
> -+
> -+static const struct component_ops drm_vencoder_ops = {
> -+	.bind = drm_vencoder_bind,
> -+	.unbind = drm_vencoder_unbind,
> -+};
> -+
> -+static int drm_vencoder_probe(struct platform_device *pdev)
> -+{
> -+	return component_add(&pdev->dev, &drm_vencoder_ops);
> -+}
> -+
> -+static int drm_vencoder_remove(struct platform_device *pdev)
> -+{
> -+	component_del(&pdev->dev, &drm_vencoder_ops);
> -+	return 0;
> -+}
> -+
> -+static const struct of_device_id drm_vencoder_of_match[] = {
> -+	{ .compatible = "drm,virtual-encoder", },
> -+	{},
> -+};
> -+MODULE_DEVICE_TABLE(of, drm_vencoder_of_match);
> -+
> -+static struct platform_driver drm_vencoder_driver = {
> -+	.probe = drm_vencoder_probe,
> -+	.remove = drm_vencoder_remove,
> -+	.driver = {
> -+		.name = "drm_vencoder",
> -+		.of_match_table = drm_vencoder_of_match,
> -+	},
> -+};
> -+
> -+module_platform_driver(drm_vencoder_driver);
> -+
> -+MODULE_AUTHOR("Liviu Dudau");
> -+MODULE_DESCRIPTION("Virtual DRM Encoder");
> -+MODULE_LICENSE("GPL v2");
> --- 
> -2.7.4
> -
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
> deleted file mode 100644
> index 621209f..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 064807d22a0a2865a930d4cc48b61f917f4bf15f Mon Sep 17 00:00:00 2001
> -From: Anders Dellien <anders.dellien@arm.com>
> -Date: Fri, 17 Apr 2020 16:06:03 +0100
> -Subject: [PATCH 2/2] swap red and blue colors in HDLCD driver
> -
> -The HDLCD drivers is configured to use BGR888 but Android needs
> -RGB888 - so we need to swap the red and blue components.
> -
> -Change-Id: Ib47ddff9280a53757925f6c1b1f373089d038025
> -Signed-off-by: Anders Dellien<anders.dellien@arm.com>
> -Upstream-Status: Inappropriate [Color swap needed for TC0 only]
> -Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
> ----
> - drivers/gpu/drm/arm/hdlcd_crtc.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
> -index e69d996..a46ba4f 100644
> ---- a/drivers/gpu/drm/arm/hdlcd_crtc.c
> -+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
> -@@ -110,15 +110,15 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
> - 	 * pixel is outside the visible frame area or when there is a
> - 	 * buffer underrun.
> - 	 */
> --	hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format->red.offset |
> -+	hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format->blue.offset |
> - #ifdef CONFIG_DRM_HDLCD_SHOW_UNDERRUN
> - 		    0x00ff0000 |	/* show underruns in red */
> - #endif
> --		    ((format->red.length & 0xf) << 8));
> -+		    ((format->blue.length & 0xf) << 8));
> - 	hdlcd_write(hdlcd, HDLCD_REG_GREEN_SELECT, format->green.offset |
> - 		    ((format->green.length & 0xf) << 8));
> --	hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format->blue.offset |
> --		    ((format->blue.length & 0xf) << 8));
> -+	hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format->red.offset |
> -+		    ((format->red.length & 0xf) << 8));
> - 
> - 	return 0;
> - }
> --- 
> -2.7.4
> -
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> index 4b1aaa0..f765661 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
> @@ -1,5 +1,3 @@
>  # Machine specific configurations
>  
> -FILESEXTRAPATHS_prepend := "${THISDIR}/linux-arm64-ack-4.19:${THISDIR}/files:"
> -
>  require linux-arm-platforms.inc
> -- 
> 2.17.1
> 

> 
> 
> 

