Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.360.1610652054442217779
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=pS36Q5np;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id e15so4354543qte.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=0JuljEN5OlumA4WjBhTDWN1t9zbw0Gal+ABUQteSH2Q=;
        b=pS36Q5np6dhlumdx3CwKFc6b/avyE576roxan11CrA2oXa4DermjpYW5VoBTc4owdo
         3lsCZ9tZzfNyPVi9/NcQvBq8k4KUbLSazaZlS9wmEtMtmiIPMDLiEoXD6QEDDGK0SebN
         Jn5jdPY+pIuvF0HbFnmrMm3VwxJXQeQzLi8fhiPp8BmQyuOT2dllxtINIf4IAyGO72H4
         BEw7Mroh2Danu+LGRQZHuwQESPavlgCWsUujeBA3cQVuRqfvhO5QOvAgeIjfQ1A0uIgC
         Ad7xUpNDGJDds21lJbc8gariuYUKGtQgSXyYR6oa54W5oR17ZPAO/pz7yXRH4W1KZ/tg
         pZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0JuljEN5OlumA4WjBhTDWN1t9zbw0Gal+ABUQteSH2Q=;
        b=rPcF8t13HCp581+6MhvIyp4DPvkBMjKzWibw2Xes3kF4KEL8FiWI2nOwdSSgt1H62K
         9iziHBHi3WoLg1Nu6gozISUsH66k7LYYHLW0GpMcuHTqq1UTs4Srf5udCNyWaIWVR14g
         FHzgyfnmNs+CDmqbg8GU9Vd5WPQhyWTRBZd/ByfNZLVRldirCw6EmyJU8SIAft7G7ixv
         FoWB9GbNHEMkFYI4UePwbtMLNg3DIuoH60t+QH05uQub2A9TjDsG8YTBfDtnmuX2Byi0
         W2OGf4fOV6TqlVSnnIin1CiWxZQ5LxAKeIOxXo6bAEEA4CGhfuK5q//oLv2UYhRohhJs
         d+Mg==
X-Gm-Message-State: AOAM530xzzBBh7wjMhMxF0Gbmg+bcE32SEkgmRHLDXTPgMzSatBPhTRt
	vScOXM6ahuo0cAoyV5aMimPUSA==
X-Google-Smtp-Source: ABdhPJzPXMUGB7GLsSq+SIpMaF8FTazOdnlaUiGtZVLiZE2nCdYq0Qd9ehvv0oy9VwuajN3s9YmE+Q==
X-Received: by 2002:ac8:664a:: with SMTP id j10mr8558373qtp.249.1610652053162;
        Thu, 14 Jan 2021 11:20:53 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:1d40:95cb:6898:8d5])
        by smtp.gmail.com with ESMTPSA id f17sm3333863qtv.68.2021.01.14.11.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:20:52 -0800 (PST)
Date: Thu, 14 Jan 2021 14:20:51 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: port and migrate to linux yocto kernel 5.10
Message-ID: <20210114192050.GA511@kudzu.us>
References: <20210111144421.7118-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210111144421.7118-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 11, 2021 at 08:14:21PM +0530, Khasim Mohammed wrote:
> This commit includes :
>     - rebased and fixed kernel 5.4 PCIe quirk patches to apply on 5.10
>     - pci probe in n1sdp driver is modified to use 5.10 structure
>     - USB_CON_GPIO config is added to remove build time warning
>     - Updated n1sdp conf to use 5.10 yocto kernel
> 
> Change-Id: I9e3d3945057ac09768a4a4e4d7a3033138925955
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Ross's revised version of this patch was included in master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf          |   6 +-
>  .../linux/linux-arm-platforms.inc             |  17 +
>  ...irk-add-acs-override-for-PCI-devices.patch | 161 +++++++++
>  ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 329 ++++++++++++++++++
>  ...e-n1sdp-pci-quirk-for-SR-IOV-support.patch |  58 +++
>  ...uirk-support-enabling-remote-chip-PC.patch | 137 ++++++++
>  ...id-duplicate-sysfs-entry-creation-er.patch |  45 +++
>  .../n1sdp/enable-realtek-R8169.cfg            |   3 +
>  .../n1sdp/enable-usb_conn_gpio.cfg            |   2 +
>  9 files changed, 755 insertions(+), 3 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-PCI-devices.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-realtek-R8169.cfg
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-usb_conn_gpio.cfg
> 
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 67363ac..0fc4bb8 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -17,9 +17,9 @@ WKS_FILE ?= "n1sdp-efidisk.wks"
>  IMAGE_EFI_BOOT_FILES ?= "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
>  WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
>  
> -# Use kernel provided by linaro (Contains support for SCMi or HDMI)
> -PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
> -PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
> +# Use kernel provided by yocto
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> +PREFERRED_VERSION_linux-yocto ?= "5.10%"
>  
>  # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> index 1c9fdc1..7faabb2 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> @@ -78,6 +78,23 @@ SRC_URI_append_tc0 = " \
>      file://0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch \
>      "
>  
> +#
> +# N1SDP KMACHINE
> +#
> +FILESEXTRAPATHS_prepend_n1sdp := "${THISDIR}/linux-yocto-5.10/n1sdp:"
> +COMPATIBLE_MACHINE_n1sdp = "n1sdp"
> +KBUILD_DEFCONFIG_n1sdp = "defconfig"
> +KCONFIG_MODE_n1sdp = "--alldefconfig"
> +SRC_URI_append_n1sdp = " \
> +    file://0001-pci_quirk-add-acs-override-for-PCI-devices.patch \
> +    file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
> +    file://0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
> +    file://0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch \
> +    file://0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch \
> +    file://enable-realtek-R8169.cfg \
> +    file://enable-usb_conn_gpio.cfg \
> +    "
> +
>  #
>  # Musca B1/S2 can't run Linux
>  #
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-PCI-devices.patch
> new file mode 100644
> index 0000000..aa4e9e4
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-PCI-devices.patch
> @@ -0,0 +1,161 @@
> +From cfe5f638279e99cfc991cb38635cb9083c71f1e2 Mon Sep 17 00:00:00 2001
> +From: Khasim Mohammed <khasim.mohammed@arm.com>
> +Date: Mon, 4 Jan 2021 18:03:00 +0000
> +Subject: [PATCH 1/4] pci_quirk: add acs override for PCI devices
> +
> +Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
> +
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +Patch taken from:
> +https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/5.4/acso.patch
> +
> +Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
> +---
> + .../admin-guide/kernel-parameters.txt         |   9 ++
> + drivers/pci/quirks.c                          | 102 ++++++++++++++++++
> + 2 files changed, 111 insertions(+)
> +
> +diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> +index 44fde25bb221..866a8eac8c3f 100644
> +--- a/Documentation/admin-guide/kernel-parameters.txt
> ++++ b/Documentation/admin-guide/kernel-parameters.txt
> +@@ -3629,6 +3629,15 @@
> + 		nomsi		[MSI] If the PCI_MSI kernel config parameter is
> + 				enabled, this kernel boot option can be used to
> + 				disable the use of MSI interrupts system-wide.
> ++		pcie_acs_override =
> ++					[PCIE] Override missing PCIe ACS support for:
> ++				downstream
> ++					All downstream ports - full ACS capabilities
> ++				multfunction
> ++					All multifunction devices - multifunction ACS subset
> ++				id:nnnn:nnnn
> ++					Specfic device - full ACS capabilities
> ++					Specified as vid:did (vendor/device ID) in hex
> + 		noioapicquirk	[APIC] Disable all boot interrupt quirks.
> + 				Safety option to keep boot IRQs enabled. This
> + 				should never be necessary.
> +diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> +index f70692ac79c5..bc758323c8f3 100644
> +--- a/drivers/pci/quirks.c
> ++++ b/drivers/pci/quirks.c
> +@@ -3557,6 +3557,107 @@ static void quirk_no_bus_reset(struct pci_dev *dev)
> + 	dev->dev_flags |= PCI_DEV_FLAGS_NO_BUS_RESET;
> + }
> + 
> ++static bool acs_on_downstream;
> ++static bool acs_on_multifunction;
> ++
> ++#define NUM_ACS_IDS 16
> ++struct acs_on_id {
> ++	unsigned short vendor;
> ++	unsigned short device;
> ++};
> ++static struct acs_on_id acs_on_ids[NUM_ACS_IDS];
> ++static u8 max_acs_id;
> ++
> ++static __init int pcie_acs_override_setup(char *p)
> ++{
> ++	if (!p)
> ++		return -EINVAL;
> ++
> ++	while (*p) {
> ++		if (!strncmp(p, "downstream", 10))
> ++			acs_on_downstream = true;
> ++		if (!strncmp(p, "multifunction", 13))
> ++			acs_on_multifunction = true;
> ++		if (!strncmp(p, "id:", 3)) {
> ++			char opt[5];
> ++			int ret;
> ++			long val;
> ++
> ++			if (max_acs_id >= NUM_ACS_IDS - 1) {
> ++				pr_warn("Out of PCIe ACS override slots (%d)\n",
> ++						NUM_ACS_IDS);
> ++				goto next;
> ++			}
> ++
> ++			p += 3;
> ++			snprintf(opt, 5, "%s", p);
> ++			ret = kstrtol(opt, 16, &val);
> ++			if (ret) {
> ++				pr_warn("PCIe ACS ID parse error %d\n", ret);
> ++				goto next;
> ++			}
> ++			acs_on_ids[max_acs_id].vendor = val;
> ++
> ++			p += strcspn(p, ":");
> ++			if (*p != ':') {
> ++				pr_warn("PCIe ACS invalid ID\n");
> ++				goto next;
> ++			}
> ++
> ++			p++;
> ++			snprintf(opt, 5, "%s", p);
> ++			ret = kstrtol(opt, 16, &val);
> ++			if (ret) {
> ++				pr_warn("PCIe ACS ID parse error %d\n", ret);
> ++				goto next;
> ++			}
> ++			acs_on_ids[max_acs_id].device = val;
> ++			max_acs_id++;
> ++		}
> ++next:
> ++		p += strcspn(p, ",");
> ++		if (*p == ',')
> ++			p++;
> ++	}
> ++
> ++	if (acs_on_downstream || acs_on_multifunction || max_acs_id)
> ++		pr_warn("Warning: PCIe ACS overrides enabled; This may allow non-IOMMU protected peer-to-peer DMA\n");
> ++
> ++	return 0;
> ++}
> ++early_param("pcie_acs_override", pcie_acs_override_setup);
> ++
> ++static int pcie_acs_overrides(struct pci_dev *dev, u16 acs_flags)
> ++{
> ++	int i;
> ++
> ++	/* Never override ACS for legacy devices or devices with ACS caps */
> ++	if (!pci_is_pcie(dev) ||
> ++		pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS))
> ++			return -ENOTTY;
> ++
> ++	for (i = 0; i < max_acs_id; i++)
> ++		if (acs_on_ids[i].vendor == dev->vendor &&
> ++			acs_on_ids[i].device == dev->device)
> ++				return 1;
> ++
> ++	switch (pci_pcie_type(dev)) {
> ++	case PCI_EXP_TYPE_DOWNSTREAM:
> ++	case PCI_EXP_TYPE_ROOT_PORT:
> ++		if (acs_on_downstream)
> ++			return 1;
> ++		break;
> ++	case PCI_EXP_TYPE_ENDPOINT:
> ++	case PCI_EXP_TYPE_UPSTREAM:
> ++	case PCI_EXP_TYPE_LEG_END:
> ++	case PCI_EXP_TYPE_RC_END:
> ++		if (acs_on_multifunction && dev->multifunction)
> ++			return 1;
> ++	}
> ++
> ++	return -ENOTTY;
> ++}
> ++
> + /*
> +  * Some Atheros AR9xxx and QCA988x chips do not behave after a bus reset.
> +  * The device will throw a Link Down error on AER-capable systems and
> +@@ -4769,6 +4870,7 @@ static const struct pci_dev_acs_enabled {
> + 	{ PCI_VENDOR_ID_ZHAOXIN, 0x9083, pci_quirk_mf_endpoint_acs },
> + 	/* Zhaoxin Root/Downstream Ports */
> + 	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs },
> ++	{ PCI_ANY_ID, PCI_ANY_ID, pcie_acs_overrides },
> + 	{ 0 }
> + };
> + 
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
> new file mode 100644
> index 0000000..7b35e3b
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
> @@ -0,0 +1,329 @@
> +From 5b9fd8da4deaabcd854c49286bf5c57c661e122f Mon Sep 17 00:00:00 2001
> +From: Khasim Mohammed <khasim.mohammed@arm.com>
> +Date: Mon, 4 Jan 2021 18:34:46 +0000
> +Subject: [PATCH 2/4] pcie: Add quirk for the Arm Neoverse N1SDP platform
> +
> +Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
> +
> +The patch is taken from :
> +https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tree/linux
> +
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +The Arm N1SDP SoC suffers from some PCIe integration issues, most
> +prominently config space accesses to not existing BDFs being answered
> +with a bus abort, resulting in an SError.
> +To mitigate this, the firmware scans the bus before boot (catching the
> +SErrors) and creates a table with valid BDFs, which acts as a filter for
> +Linux' config space accesses.
> +
> +Add code consulting the table as an ACPI PCIe quirk, also register the
> +corresponding device tree based description of the host controller.
> +Also fix the other two minor issues on the way, namely not being fully
> +ECAM compliant and config space accesses being restricted to 32-bit
> +accesses only.
> +
> +This allows the Arm Neoverse N1SDP board to boot Linux without crashing
> +and to access *any* devices (there are no platform devices except UART).
> +
> +Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
> +[Sudipto: extend to cover the CCIX root port as well]
> +Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
> +[Andre: fix coding style issues, rewrite some parts, add DT support]
> +Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> +[Khasim: port the patch to linux kernel 5.10]
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +---
> + arch/arm64/configs/defconfig        |   1 +
> + drivers/acpi/pci_mcfg.c             |   7 +
> + drivers/pci/controller/Kconfig      |  11 ++
> + drivers/pci/controller/Makefile     |   1 +
> + drivers/pci/controller/pcie-n1sdp.c | 198 ++++++++++++++++++++++++++++
> + include/linux/pci-ecam.h            |   2 +
> + 6 files changed, 220 insertions(+)
> + create mode 100644 drivers/pci/controller/pcie-n1sdp.c
> +
> +diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> +index 5cfe3cf6f2ac..a035dcd7055d 100644
> +--- a/arch/arm64/configs/defconfig
> ++++ b/arch/arm64/configs/defconfig
> +@@ -205,6 +205,7 @@ CONFIG_NFC_NCI=m
> + CONFIG_NFC_S3FWRN5_I2C=m
> + CONFIG_PCI=y
> + CONFIG_PCIEPORTBUS=y
> ++CONFIG_PCI_QUIRKS=y
> + CONFIG_PCI_IOV=y
> + CONFIG_PCI_PASID=y
> + CONFIG_HOTPLUG_PCI=y
> +diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
> +index 95f23acd5b80..f7a7d6e87780 100644
> +--- a/drivers/acpi/pci_mcfg.c
> ++++ b/drivers/acpi/pci_mcfg.c
> +@@ -143,6 +143,13 @@ static struct mcfg_fixup mcfg_quirks[] = {
> + 	XGENE_V2_ECAM_MCFG(4, 1),
> + 	XGENE_V2_ECAM_MCFG(4, 2),
> + 
> ++#define N1SDP_ECAM_MCFG(rev, seg, ops) \
> ++	{"ARMLTD", "ARMN1SDP", rev, seg, MCFG_BUS_ANY, ops }
> ++
> ++	/* N1SDP SoC with v1 PCIe controller */
> ++	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
> ++	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
> ++
> + #define ALTRA_ECAM_QUIRK(rev, seg) \
> + 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
> + 
> +diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> +index 64e2f5e379aa..df10736b2d9e 100644
> +--- a/drivers/pci/controller/Kconfig
> ++++ b/drivers/pci/controller/Kconfig
> +@@ -37,6 +37,17 @@ config PCI_FTPCI100
> + 	depends on OF
> + 	default ARCH_GEMINI
> + 
> ++config PCIE_HOST_N1SDP_ECAM
> ++	bool "ARM N1SDP PCIe Controller"
> ++	depends on ARM64
> ++	depends on OF || (ACPI && PCI_QUIRKS)
> ++	select PCI_HOST_COMMON
> ++	default y if ARCH_VEXPRESS
> ++	help
> ++	  Say Y here if you want PCIe support for the Arm N1SDP platform.
> ++	  The controller is ECAM compliant, but needs a quirk to workaround
> ++	  an integration issue.
> ++
> + config PCI_TEGRA
> + 	bool "NVIDIA Tegra PCIe controller"
> + 	depends on ARCH_TEGRA || COMPILE_TEST
> +diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
> +index 04c6edc285c5..6e5c3dcae8d3 100644
> +--- a/drivers/pci/controller/Makefile
> ++++ b/drivers/pci/controller/Makefile
> +@@ -29,6 +29,7 @@ obj-$(CONFIG_PCIE_ROCKCHIP_HOST) += pcie-rockchip-host.o
> + obj-$(CONFIG_PCIE_MEDIATEK) += pcie-mediatek.o
> + obj-$(CONFIG_PCIE_TANGO_SMP8759) += pcie-tango.o
> + obj-$(CONFIG_VMD) += vmd.o
> ++obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) += pcie-n1sdp.o
> + obj-$(CONFIG_PCIE_BRCMSTB) += pcie-brcmstb.o
> + obj-$(CONFIG_PCI_LOONGSON) += pci-loongson.o
> + obj-$(CONFIG_PCIE_HISI_ERR) += pcie-hisi-error.o
> +diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
> +new file mode 100644
> +index 000000000000..327aee9c5564
> +--- /dev/null
> ++++ b/drivers/pci/controller/pcie-n1sdp.c
> +@@ -0,0 +1,198 @@
> ++// SPDX-License-Identifier: GPL-2.0
> ++/*
> ++ * Copyright (C) 2018/2019 ARM Ltd.
> ++ *
> ++ * This quirk is to mask the following issues:
> ++ * - PCIE SLVERR: config space accesses to invalid PCIe BDFs cause a bus
> ++ *		  error (signalled as an asynchronous SError)
> ++ * - MCFG BDF mapping: the root complex is mapped separately from the device
> ++ *		       config space
> ++ * - Non 32-bit accesses to config space are not supported.
> ++ *
> ++ * At boot time the SCP board firmware creates a discovery table with
> ++ * the root complex' base address and the valid BDF values, discovered while
> ++ * scanning the config space and catching the SErrors.
> ++ * Linux responds only to the EPs listed in this table, returning NULL
> ++ * for the rest.
> ++ */
> ++
> ++#include <linux/kernel.h>
> ++#include <linux/init.h>
> ++#include <linux/ioport.h>
> ++#include <linux/sizes.h>
> ++#include <linux/of_pci.h>
> ++#include <linux/of.h>
> ++#include <linux/pci-ecam.h>
> ++#include <linux/platform_device.h>
> ++#include <linux/module.h>
> ++
> ++/* Platform specific values as hardcoded in the firmware. */
> ++#define AP_NS_SHARED_MEM_BASE	0x06000000
> ++#define MAX_SEGMENTS		2
> ++#define BDF_TABLE_SIZE		SZ_16K
> ++
> ++/*
> ++ * Shared memory layout as written by the SCP upon boot time:
> ++ *  ----
> ++ *  Discover data header --> RC base address
> ++ *                       \-> BDF Count
> ++ *  Discover data        --> BDF 0...n
> ++ *  ----
> ++ */
> ++struct pcie_discovery_data {
> ++	u32 rc_base_addr;
> ++	u32 nr_bdfs;
> ++	u32 valid_bdfs[0];
> ++} *pcie_discovery_data[MAX_SEGMENTS];
> ++
> ++void __iomem *rc_remapped_addr[MAX_SEGMENTS];
> ++
> ++/*
> ++ * map_bus() is called before we do a config space access for a certain
> ++ * device. We use this to check whether this device is valid, avoiding
> ++ * config space accesses which would result in an SError otherwise.
> ++ */
> ++static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned int devfn,
> ++				       int where)
> ++{
> ++	struct pci_config_window *cfg = bus->sysdata;
> ++	unsigned int devfn_shift = cfg->ops->bus_shift - 8;
> ++	unsigned int busn = bus->number;
> ++	unsigned int segment = bus->domain_nr;
> ++	unsigned int bdf_addr;
> ++	unsigned int table_count, i;
> ++
> ++	if (segment >= MAX_SEGMENTS ||
> ++	    busn < cfg->busr.start || busn > cfg->busr.end)
> ++		return NULL;
> ++
> ++	/* The PCIe root complex has a separate config space mapping. */
> ++	if (busn == 0 && devfn == 0)
> ++		return rc_remapped_addr[segment] + where;
> ++
> ++	busn -= cfg->busr.start;
> ++	bdf_addr = (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
> ++	table_count = pcie_discovery_data[segment]->nr_bdfs;
> ++	for (i = 0; i < table_count; i++) {
> ++		if (bdf_addr == pcie_discovery_data[segment]->valid_bdfs[i])
> ++			return pci_ecam_map_bus(bus, devfn, where);
> ++	}
> ++
> ++	return NULL;
> ++}
> ++
> ++static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
> ++{
> ++	phys_addr_t table_base;
> ++	struct device *dev = cfg->parent;
> ++	struct pcie_discovery_data *shared_data;
> ++	size_t bdfs_size;
> ++
> ++	if (segment >= MAX_SEGMENTS)
> ++		return -ENODEV;
> ++
> ++	table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
> ++
> ++	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
> ++				"PCIe valid BDFs")) {
> ++		dev_err(dev, "PCIe BDF shared region request failed\n");
> ++		return -ENOMEM;
> ++	}
> ++
> ++	shared_data = devm_ioremap(dev,
> ++				   table_base, BDF_TABLE_SIZE);
> ++	if (!shared_data)
> ++		return -ENOMEM;
> ++
> ++	/* Copy the valid BDFs structure to allocated normal memory. */
> ++	bdfs_size = sizeof(struct pcie_discovery_data) +
> ++		    sizeof(u32) * shared_data->nr_bdfs;
> ++	pcie_discovery_data[segment] = devm_kmalloc(dev, bdfs_size, GFP_KERNEL);
> ++	if (!pcie_discovery_data[segment])
> ++		return -ENOMEM;
> ++
> ++	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
> ++
> ++	rc_remapped_addr[segment] = devm_ioremap(dev,
> ++						shared_data->rc_base_addr,
> ++						PCI_CFG_SPACE_EXP_SIZE);
> ++	if (!rc_remapped_addr[segment]) {
> ++		dev_err(dev, "Cannot remap root port base\n");
> ++		return -ENOMEM;
> ++	}
> ++
> ++	devm_iounmap(dev, shared_data);
> ++
> ++	return 0;
> ++}
> ++
> ++static int pci_n1sdp_pcie_init(struct pci_config_window *cfg)
> ++{
> ++	return pci_n1sdp_init(cfg, 0);
> ++}
> ++
> ++static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
> ++{
> ++	return pci_n1sdp_init(cfg, 1);
> ++}
> ++
> ++const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops = {
> ++	.bus_shift	= 20,
> ++	.init		= pci_n1sdp_pcie_init,
> ++	.pci_ops	= {
> ++		.map_bus        = pci_n1sdp_map_bus,
> ++		.read           = pci_generic_config_read32,
> ++		.write          = pci_generic_config_write32,
> ++	}
> ++};
> ++
> ++const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops = {
> ++	.bus_shift	= 20,
> ++	.init		= pci_n1sdp_ccix_init,
> ++	.pci_ops	= {
> ++		.map_bus        = pci_n1sdp_map_bus,
> ++		.read           = pci_generic_config_read32,
> ++		.write          = pci_generic_config_write32,
> ++	}
> ++};
> ++
> ++struct of_device_id n1sdp_pcie_of_match[] = {
> ++	{ .compatible = "arm,n1sdp-pcie" },
> ++	{ },
> ++};
> ++MODULE_DEVICE_TABLE(of, n1sdp_pcie_of_match);
> ++
> ++static int n1sdp_pcie_probe(struct platform_device *pdev)
> ++{
> ++	const struct device_node *of_node = pdev->dev.of_node;
> ++	u32 segment;
> ++
> ++	if (of_property_read_u32(of_node, "linux,pci-domain", &segment)) {
> ++		dev_err(&pdev->dev, "N1SDP PCI controllers require linux,pci-domain property\n");
> ++		return -EINVAL;
> ++	}
> ++
> ++	switch (segment) {
> ++	case 0:
> ++		n1sdp_pcie_of_match[0].data = &pci_n1sdp_pcie_ecam_ops;
> ++		return pci_host_common_probe(pdev);
> ++	case 1:
> ++		n1sdp_pcie_of_match[0].data = &pci_n1sdp_ccix_ecam_ops;
> ++		return pci_host_common_probe(pdev);
> ++	}
> ++
> ++	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n",
> ++		MAX_SEGMENTS);
> ++
> ++	return -EINVAL;
> ++}
> ++
> ++static struct platform_driver n1sdp_pcie_driver = {
> ++	.driver = {
> ++		.name = KBUILD_MODNAME,
> ++		.of_match_table = n1sdp_pcie_of_match,
> ++		.suppress_bind_attrs = true,
> ++	},
> ++	.probe = n1sdp_pcie_probe,
> ++};
> ++builtin_platform_driver(n1sdp_pcie_driver);
> +diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
> +index 033ce74f02e8..d3959ada44af 100644
> +--- a/include/linux/pci-ecam.h
> ++++ b/include/linux/pci-ecam.h
> +@@ -58,6 +58,8 @@ extern const struct pci_ecam_ops pci_thunder_ecam_ops; /* Cavium ThunderX 1.x */
> + extern const struct pci_ecam_ops xgene_v1_pcie_ecam_ops; /* APM X-Gene PCIe v1 */
> + extern const struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v2.x */
> + extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PCIe */
> ++extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe */
> ++extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe */
> + #endif
> + 
> + #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
> new file mode 100644
> index 0000000..5a53460
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
> @@ -0,0 +1,58 @@
> +From f3662513b224d9704355afc61a9dc26493bbdf13 Mon Sep 17 00:00:00 2001
> +From: Khasim Mohammed <khasim.mohammed@arm.com>
> +Date: Tue, 5 Jan 2021 17:57:46 +0000
> +Subject: [PATCH 3/4] n1sdp: update n1sdp pci quirk for SR-IOV support
> +
> +Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
> +
> +The patch is taken from:
> +https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tree/linux
> +
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +VFs are not probing the vendor ID first, which is otherwise
> +the gate keeper for undiscovered devices. So any accesses using
> +a config space offset greater than 0 must be coming for an
> +already discovered device or from a VF that has just been created.
> +
> +Also if Linux already has a struct pci_dev* for a given BDF,
> +this device is safe to access.
> +
> +Skip the firmware table in these cases and allow accesses to
> +those devices. That enables SR-IOV support on the N1SDP board.
> +
> +Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> +---
> + drivers/pci/controller/pcie-n1sdp.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
> +index 327aee9c5564..45bbe506045a 100644
> +--- a/drivers/pci/controller/pcie-n1sdp.c
> ++++ b/drivers/pci/controller/pcie-n1sdp.c
> +@@ -61,6 +61,7 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned int devfn,
> + 	unsigned int segment = bus->domain_nr;
> + 	unsigned int bdf_addr;
> + 	unsigned int table_count, i;
> ++	struct pci_dev *dev;
> + 
> + 	if (segment >= MAX_SEGMENTS ||
> + 	    busn < cfg->busr.start || busn > cfg->busr.end)
> +@@ -70,6 +71,14 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned int devfn,
> + 	if (busn == 0 && devfn == 0)
> + 		return rc_remapped_addr[segment] + where;
> + 
> ++	dev = pci_get_domain_bus_and_slot(segment, busn, devfn);
> ++	if (dev && dev->is_virtfn)
> ++		return pci_ecam_map_bus(bus, devfn, where);
> ++
> ++	/* Accesses beyond the vendor ID always go to existing devices. */
> ++	if (where > 0)
> ++		return pci_ecam_map_bus(bus, devfn, where);
> ++
> + 	busn -= cfg->busr.start;
> + 	bdf_addr = (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
> + 	table_count = pcie_discovery_data[segment]->nr_bdfs;
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
> new file mode 100644
> index 0000000..10a59e8
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
> @@ -0,0 +1,137 @@
> +From 604e0130dff007f28a510291064edf20aff3ddea Mon Sep 17 00:00:00 2001
> +From: Khasim Mohammed <khasim.mohammed@arm.com>
> +Date: Tue, 5 Jan 2021 18:20:16 +0000
> +Subject: [PATCH 4/4] n1sdp: pcie: add quirk support enabling remote chip PCIe
> +
> +Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
> +
> +This patch is picked from the git repository and ported 5.10:
> +https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/patch/?id=04b7e76d0fe6481a803f58e54e008a1489d713a5
> +
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +Base address mapping for remote chip Root PCIe ECAM space.
> +
> +Remote Chip PCIe topology is enumerated in Firmware and current
> +change takes referecne of enumerated PCIe hierarchy of Remote chip into the
> +kernel and include in complete PCIe topology for kernel framework.
> +
> +Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
> +---
> + drivers/acpi/pci_mcfg.c             |  1 +
> + drivers/pci/controller/pcie-n1sdp.c | 36 ++++++++++++++++++++++++++---
> + include/linux/pci-ecam.h            |  1 +
> + 3 files changed, 35 insertions(+), 3 deletions(-)
> +
> +diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
> +index f7a7d6e87780..0523f485c930 100644
> +--- a/drivers/acpi/pci_mcfg.c
> ++++ b/drivers/acpi/pci_mcfg.c
> +@@ -149,6 +149,7 @@ static struct mcfg_fixup mcfg_quirks[] = {
> + 	/* N1SDP SoC with v1 PCIe controller */
> + 	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
> + 	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
> ++	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
> + 
> + #define ALTRA_ECAM_QUIRK(rev, seg) \
> + 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
> +diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
> +index 45bbe506045a..01f601e36343 100644
> +--- a/drivers/pci/controller/pcie-n1sdp.c
> ++++ b/drivers/pci/controller/pcie-n1sdp.c
> +@@ -28,8 +28,11 @@
> + 
> + /* Platform specific values as hardcoded in the firmware. */
> + #define AP_NS_SHARED_MEM_BASE	0x06000000
> +-#define MAX_SEGMENTS		2
> ++
> ++/* Two PCIe root complexes in One Chip + One PCIe RC in Remote Chip*/
> ++#define MAX_SEGMENTS		3
> + #define BDF_TABLE_SIZE		SZ_16K
> ++#define REMOTE_CHIP_ADDR_OFFSET	0x40000000000
> + 
> + /*
> +  * Shared memory layout as written by the SCP upon boot time:
> +@@ -100,7 +103,10 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
> + 	if (segment >= MAX_SEGMENTS)
> + 		return -ENODEV;
> + 
> +-	table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
> ++	if (segment > 1)
> ++		table_base = AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
> ++	else
> ++		table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
> + 
> + 	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
> + 				"PCIe valid BDFs")) {
> +@@ -122,9 +128,15 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
> + 
> + 	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
> + 
> +-	rc_remapped_addr[segment] = devm_ioremap(dev,
> ++	if (segment > 1)
> ++		rc_remapped_addr[segment] = devm_ioremap(dev,
> ++						shared_data->rc_base_addr + REMOTE_CHIP_ADDR_OFFSET,
> ++						PCI_CFG_SPACE_EXP_SIZE);
> ++	else
> ++		rc_remapped_addr[segment] = devm_ioremap(dev,
> + 						shared_data->rc_base_addr,
> + 						PCI_CFG_SPACE_EXP_SIZE);
> ++
> + 	if (!rc_remapped_addr[segment]) {
> + 		dev_err(dev, "Cannot remap root port base\n");
> + 		return -ENOMEM;
> +@@ -145,6 +157,11 @@ static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
> + 	return pci_n1sdp_init(cfg, 1);
> + }
> + 
> ++static int pci_n1sdp_remote_pcie_init(struct pci_config_window *cfg)
> ++{
> ++	return pci_n1sdp_init(cfg, 2);
> ++}
> ++
> + const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops = {
> + 	.bus_shift	= 20,
> + 	.init		= pci_n1sdp_pcie_init,
> +@@ -165,6 +182,16 @@ const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops = {
> + 	}
> + };
> + 
> ++const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops = {
> ++	.bus_shift	= 20,
> ++	.init		= pci_n1sdp_remote_pcie_init,
> ++	.pci_ops	= {
> ++		.map_bus	= pci_n1sdp_map_bus,
> ++		.read		= pci_generic_config_read32,
> ++		.write		= pci_generic_config_write32,
> ++	}
> ++};
> ++
> + struct of_device_id n1sdp_pcie_of_match[] = {
> + 	{ .compatible = "arm,n1sdp-pcie" },
> + 	{ },
> +@@ -188,6 +215,9 @@ static int n1sdp_pcie_probe(struct platform_device *pdev)
> + 	case 1:
> + 		n1sdp_pcie_of_match[0].data = &pci_n1sdp_ccix_ecam_ops;
> + 		return pci_host_common_probe(pdev);
> ++	case 2:
> ++		n1sdp_pcie_of_match[0].data = &pci_n1sdp_remote_pcie_ecam_ops;
> ++		return pci_host_common_probe(pdev);
> + 	}
> + 
> + 	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n",
> +diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
> +index d3959ada44af..08d9684b7dc8 100644
> +--- a/include/linux/pci-ecam.h
> ++++ b/include/linux/pci-ecam.h
> +@@ -60,6 +60,7 @@ extern const struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v2.x
> + extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PCIe */
> + extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe */
> + extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe */
> ++extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm N1SDP PCIe */
> + #endif
> + 
> + #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch
> new file mode 100644
> index 0000000..143f78b
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch
> @@ -0,0 +1,45 @@
> +From 914fe7871fc2f00ec94cd4d17722158e94fa88df Mon Sep 17 00:00:00 2001
> +From: Khasim Mohammed <khasim.mohammed@arm.com>
> +Date: Fri, 8 Jan 2021 04:21:23 +0000
> +Subject: [PATCH] r8169: Fix to avoid duplicate sysfs entry creation error
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending [yet to submit]
> +
> +Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> +
> +Patch taken from :
> +https://git.linaro.org/landing-teams/working/arm/kernel-release.git/commit/?h=n1sdp&id=84baaae9e751c058717d9702438429257f077f03
> +
> +Following error observed with r8169 driver, this patch fix the issue.
> +
> +[ 27.544136] r8169 0002:07:00.0: enabling device (0000 -> 0003)
> +[ 27.559734] sysfs: cannot create duplicate filename '/class/mdio_bus/r8169-700'
> +…
> +[ 27.684858] libphy: mii_bus r8169-700 failed to register
> +[ 27.695602] r8169: probe of 0002:07:00.0 failed with error -22
> +
> +Change-Id: Id696abbabd794ecef5c551c5c45630963d9502a6
> +Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
> +---
> + drivers/net/ethernet/realtek/r8169_main.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
> +index 85d9c3e30c69..6d6b24978fd5 100644
> +--- a/drivers/net/ethernet/realtek/r8169_main.c
> ++++ b/drivers/net/ethernet/realtek/r8169_main.c
> +@@ -5088,7 +5088,7 @@ static int r8169_mdio_register(struct rtl8169_private *tp)
> + 	new_bus->priv = tp;
> + 	new_bus->parent = &pdev->dev;
> + 	new_bus->irq[0] = PHY_IGNORE_INTERRUPT;
> +-	snprintf(new_bus->id, MII_BUS_ID_SIZE, "r8169-%x", pci_dev_id(pdev));
> ++	snprintf(new_bus->id, MII_BUS_ID_SIZE, "r8169-%x-%x", pdev->bus->domain_nr, pci_dev_id(pdev));
> + 
> + 	new_bus->read = r8169_mdio_read_reg;
> + 	new_bus->write = r8169_mdio_write_reg;
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-realtek-R8169.cfg
> new file mode 100644
> index 0000000..7a57474
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-realtek-R8169.cfg
> @@ -0,0 +1,3 @@
> +# Enable Realtek Gigabit Ethernet adapter
> +CONFIG_REALTEK_PHY=y
> +CONFIG_R8169=y
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-usb_conn_gpio.cfg
> new file mode 100644
> index 0000000..128c902
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-usb_conn_gpio.cfg
> @@ -0,0 +1,2 @@
> +# PHY_TEGRA_XUSB sets this to y, but its set as m in defconfig
> +CONFIG_USB_CONN_GPIO=y
> -- 
> 2.17.1
> 

> 
> 
> 

