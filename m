Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.5002.1596831762369086995
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 13:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 90A8D40C13;
	Fri,  7 Aug 2020 20:22:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2KXSaD1IJ_v; Fri,  7 Aug 2020 20:22:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6C04440951;
	Fri,  7 Aug 2020 20:22:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A9D57174455; Fri,  7 Aug 2020 16:22:38 -0400 (EDT)
Date: Fri, 7 Aug 2020 16:22:38 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: abdellatif.elkhlifi@arm.com
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 0/9] Adding support for corstone700 platform
Message-ID: <20200807202238.GH17660@denix.org>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Is this a 3rd copy of the same content?
Or is this a 3rd revision of the patches? What are the changes then?

-- 
Denys


On Fri, Aug 07, 2020 at 08:42:44PM +0100, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> These patches add support for corstone700 platform on Arm fast model and
> MPS3 FPGA board.
>     
> For more information about the platform, please check:
> 
> https://developer.arm.com/ip-products/subsystem/corstone-foundation-ip/corstone-700
> 
> https://community.arm.com/developer/tools-software/oss-platforms/w/docs/444/corstone-700
> 
> Abdellatif El Khlifi (8):
>   arm-bsp/machine: adding corstone700-fvp machine
>   arm-bsp/linux: configuring v5.6 kernel for corstone700 platforms
>   arm-bsp/trusted-firmware-a: adding support for corstone700 platform
>   arm-bsp/external-system: enabling corstone700 platform support
>   arm-bsp/u-boot: adding corstone700 platform to u-boot
>   arm-bsp/scp-firmware: adding scp support for corstone700 platform
>   arm-bsp/machine: adding corstone700-mps3 machine
>   arm-bsp/linux: Enabling lan9115 Ethernet for corstone700-mps3
> 
> Rui Miguel Silva (1):
>   arm-bsp/external-system: add external system recipe
> 
>  .../conf/machine/corstone700-fvp.conf         |   12 +
>  .../conf/machine/corstone700-mps3.conf        |   12 +
>  .../conf/machine/include/corstone700.inc      |   34 +
>  .../external-system/external-system_0.1.0.bb  |   45 +
>  .../scp-firmware/scp-firmware-corstone700.inc |   37 +
>  .../scp-firmware/scp-firmware_%.bbappend      |    1 +
>  .../trusted-firmware-a-corstone700.inc        |   26 +
>  .../trusted-firmware-a_2.3.bbappend           |    1 +
>  .../0001-armv7-add-mmio-timer.patch           |  108 +
>  ...-arm-add-designstart-cortex-a5-board.patch |  312 +++
>  .../0003-arm-Add-corstone700-platform.patch   |  301 +++
>  ...dd-bootx-command-to-start-XiP-images.patch |  136 +
>  ...g-the-XIP-kernel-using-bootx-command.patch |   39 +
>  ...6-arm-enabling-the-arch_timer-driver.patch |   61 +
>  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   12 +
>  .../bsp/arm-platforms/corstone700-bsp.scc     |    6 +
>  .../bsp/arm-platforms/corstone700/base.cfg    |   35 +
>  .../arm-platforms/corstone700/eth_lan9115.scc |    4 +
>  .../corstone700/eth_lan91c111.scc             |    4 +
>  .../bsp/arm-platforms/corstone700/lan9115.cfg |    1 +
>  .../arm-platforms/corstone700/lan91c111.cfg   |    1 +
>  .../bsp/arm-platforms/corstone700/pnp.cfg     |    4 +
>  .../bsp/arm-platforms/corstone700/xip.cfg     |   12 +
>  .../arm-platforms/corstone700/xip_cmdline.cfg |    3 +
>  .../corstone700/xip_dhcp_cmdline.cfg          |    3 +
>  ...-for-a-single-ARMv7-A-based-platform.patch |   97 +
>  .../0002-arm-Add-tiny-vexpress-machine.patch  |  101 +
>  ...-arm-introduce-corstone700_defconfig.patch |  197 ++
>  ...ilbox-handling-unit-controller-versi.patch |  322 +++
>  ...d-on-rpmsg-char-driver-using-mailbox.patch |  202 ++
>  ...arm-MHU-driver-and-RPMSG-char-driver.patch |   30 +
>  ...ation-of-multiple-arm-rpmsg-channels.patch |  148 ++
>  ...ombined-receiver-interrupt-when-usin.patch |   59 +
>  ...stone700-external-system-harness-dri.patch |  232 ++
>  ...ize-endpoint-and-mailbox-information.patch |  181 ++
>  ...ox-channel-ownership-to-rpmsg-endpoi.patch |  107 +
>  ...v2-add-new-AMBA-ID-to-support-MHU-v2.patch |   36 +
>  ...hu_v2-dynamic-allocation-of-channels.patch |  119 +
>  ...t-XIP-physical-address-to-3MB-offset.patch |   42 +
>  ...ble-ARM_VIRT-extension-if-XIP_KERNEL.patch |   50 +
>  ...onfig-use-DDR-address-instead-of-sha.patch |   34 +
>  ...config-enable-configs-for-cramfs-xip.patch |   61 +
>  ...0-move-to-regmap-for-register-access.patch | 2297 +++++++++++++++++
>  ...cd-refactor-mempool-config-and-setup.patch |  302 +++
>  ...-usb-isp1760-add-support-for-isp1763.patch | 1755 +++++++++++++
>  .../linux/linux-stable-corstone700.inc        |   62 +
>  .../linux/linux-stable_%.bbappend             |    8 +
>  .../wic/arm-reference-image.corstone700.wks   |   22 +
>  meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb |   26 +
>  49 files changed, 7700 insertions(+)
>  create mode 100644 meta-arm-bsp/conf/machine/corstone700-fvp.conf
>  create mode 100644 meta-arm-bsp/conf/machine/corstone700-mps3.conf
>  create mode 100644 meta-arm-bsp/conf/machine/include/corstone700.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
>  create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio-timer.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corstone700-platform.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-the-arch_timer-driver.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700-bsp.scc
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/base.cfg
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan91c111.scc
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan91c111.cfg
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/pnp.cfg
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/xip.cfg
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/xip_cmdline.cfg
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0001-arm-support-for-a-single-ARMv7-A-based-platform.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0002-arm-Add-tiny-vexpress-machine.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0003-arm-introduce-corstone700_defconfig.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0004-add-driver-of-mailbox-handling-unit-controller-versi.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0005-add-rpmsg-based-on-rpmsg-char-driver-using-mailbox.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0006-enable-arm-MHU-driver-and-RPMSG-char-driver.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0007-allow-creation-of-multiple-arm-rpmsg-channels.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0008-mailbox-enable-combined-receiver-interrupt-when-usin.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0009-misc-arm-add-corstone700-external-system-harness-dri.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0010-arm-containerize-endpoint-and-mailbox-information.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0011-arm-couple-mailbox-channel-ownership-to-rpmsg-endpoi.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0012-mailbox-arm_mhu_v2-add-new-AMBA-ID-to-support-MHU-v2.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0013-mailbox-arm_mhu_v2-dynamic-allocation-of-channels.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0014-defconfig-adjust-XIP-physical-address-to-3MB-offset.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0015-arm-Kconfig-disable-ARM_VIRT-extension-if-XIP_KERNEL.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0016-corstone700_defconfig-use-DDR-address-instead-of-sha.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0017-corstone700_defconfig-enable-configs-for-cramfs-xip.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0018-usb-isp1760-move-to-regmap-for-register-access.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0019-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0020-usb-isp1760-add-support-for-isp1763.patch
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
>  create mode 100644 meta-arm-bsp/wic/arm-reference-image.corstone700.wks
>  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
> 
> -- 
> 2.17.1
> 

> 

