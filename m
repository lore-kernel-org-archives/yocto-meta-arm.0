Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.17567.1597411127381718807
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 06:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=iO2tudwt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id n129so8266624qkd.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 14 Aug 2020 06:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5BrCAF60EJsoI63YWsG60n7WFBdWdu1QzHPI6REBSgI=;
        b=iO2tudwtK1POyJLNLCnRgM/quSSSoDV/klV5pY7rH0J0BRkxWvpg6CxTBZiKnpfgz3
         El2awJzpPYJL8Nu9CoeAhXZop1LYjrwQpTjcdCvLOmgyrOg6VZtSbHmtTGAhvLRK1dW2
         c0pMvf/uiOUkj7L8dtOnrXfSY3lB+dlZ62UayC2qXcDkui/aZD7d7bl1x6yVjOk/3L2k
         zlqhMHY92avnTrs8GQNQOWmuMI0zmGUz+FZ+TQ+6NnmbAj9tJdu9AykJuGTjDRUsM4PP
         qaPc52RxvfGWrrQ5yzNrLzFsEJYCnUtvadf6DLxIYGLFDjLUPdvGjhWRlNh48yCDLDvu
         P0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5BrCAF60EJsoI63YWsG60n7WFBdWdu1QzHPI6REBSgI=;
        b=WEJD1SfiQJkpjfpWOnZQprxatuqrpY9kgjrx1NKrQ9pcBk58KsNQO5/gYE5gGdv6R5
         1nicKgGtU2Qe1kRmzctCkZO727LoLlX5hSZZU8yRktzrCqQmHTv0AgjlaF7FZ8dqSu6U
         pz9R8K6afLpIDRs5DBZSiECLyDTFOjj4zKX1Xj/tpSWN0DAtnNgzVvDWv/y4XNgBY53p
         4rl0elkoEFOtaMtBOxt6/ZG7R+3f1vXv+Zr93GfR3PYHFermfXnh6/dwJHhnx0WsGzfN
         uPHMPb9/hB8jXiir7d/YV2CpzAKAg8EhbZyzBKUNFrv0bFbF6FfV3FNgvHUh2LL3IMm6
         e5iQ==
X-Gm-Message-State: AOAM5321qTf+6PL4pRYFHkiumYRfpjNbwoksF4p0/KTlIAuBAZ2bHf1q
	5bSwrqcZa9cALij2jsd59BUA3A==
X-Google-Smtp-Source: ABdhPJw5cO4639HZsLIkHeqO9o19AVlUdIsPZh2yOARase1U3SFcaUWjWNDDJZMXYBXHQiCH7LyaQQ==
X-Received: by 2002:a05:620a:2230:: with SMTP id n16mr2047363qkh.268.1597411126424;
        Fri, 14 Aug 2020 06:18:46 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:cca3:93d4:6837:123c])
        by smtp.gmail.com with ESMTPSA id l29sm10246157qtu.88.2020.08.14.06.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 06:18:45 -0700 (PDT)
Date: Fri, 14 Aug 2020 09:18:44 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH v2 0/9] Adding support for corstone700 platform
Message-ID: <20200814131843.GA6409@kudzu.us>
References: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2020 at 03:52:21PM +0100, Abdellatif El Khlifi wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> These patches add support for corstone700 platform on Arm fast model and
> MPS3 FPGA board.

In the future, it would be helpful the specifiy the difference between
v1 and v2 here.  Something like:
- v2:  Fixed u-boot patch issues, the rest are the same

Anyway, these patches are now in master.  Thanks for all the hard
work!

Thanks,
Jon

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
>  .../0001-arm-Add-corstone700-platform.patch   |  268 ++
>  ...dd-bootx-command-to-start-XiP-images.patch |  136 +
>  ...g-the-XIP-kernel-using-bootx-command.patch |   39 +
>  ...4-arm-enabling-the-arch_timer-driver.patch |   61 +
>  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   10 +
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
>  meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb |   28 +
>  47 files changed, 7247 insertions(+)
>  create mode 100644 meta-arm-bsp/conf/machine/corstone700-fvp.conf
>  create mode 100644 meta-arm-bsp/conf/machine/corstone700-mps3.conf
>  create mode 100644 meta-arm-bsp/conf/machine/include/corstone700.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
>  create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-arm-Add-corstone700-platform.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-arm-enabling-the-arch_timer-driver.patch
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

