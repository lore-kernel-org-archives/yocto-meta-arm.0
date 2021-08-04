Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.11826.1628095307752458486
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 09:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=GwAa3QXd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id t68so3337316qkf.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Aug 2021 09:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bh+5Lp+iwRuZVzo3Who7g49v1F+H6jEjN2oZQEj1Jug=;
        b=GwAa3QXdR1nh65aaR/sK1+uY+2VWqDNo5sSsbbfpQvmUcEhWr+R4kuk8NTV5ahR7YQ
         qyWlECZN8Uf7vspV6igNdHdZPCrg54fdo9sJ+nOm80OVujLSwnkiIGS1A/dVNSTCklss
         3IdUu6YivWjW0hQ6vCzrblUxzgcWIlLM2l65y2oYQJ8fX792SmE4sRv4V6rnYXjwXbdt
         jCVoCcG5ybm9UwPsas/uQY5r1mTUYq7YKFTenuMeDIa02rzhztqa86c0jH6Fs4ujvOxU
         xN8/xQae3b7O1mQpyFK9vrjJA1kOGXR5kZGbVPVWtvJmxYNd6tpZa4mXNBmmV3xSOtmZ
         0pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bh+5Lp+iwRuZVzo3Who7g49v1F+H6jEjN2oZQEj1Jug=;
        b=T4+EyK4WyLOaS7O1bluBYyjImgLVqXuBOI9DYb5zj/x6b+vKr/qi5P41w5awfDQGxK
         cVkM83sBfedC6+JCsjEyZEiKC0ix9vLDgc2fapsKXBZNGxAdCqhh4vJ6+Yaaone8yr21
         B9cSxzJ2arRDD5gNL1V9Rj5hH051odtAm9gEZg5gXGddQd9RQsI+wWrv71nioZO/IcwI
         nvQriT1Q8y6yh/b25TmT9erads77FB5UekN8ISluAgpSpdOcJucyic8zo+uk3idPRDin
         EpJ5YJ7kutqD1/qBpa9vZaSd7ueonhMUWPSsCDrqTA/EuIkw2yBc3/VCyGaLHyxhUMPe
         lZTA==
X-Gm-Message-State: AOAM5336s5W5HLfTmMmbRRpz7e+WorE4T+7r8IhFZ6IOPCrbbaEtf9C5
	MH9x2TrYyJBSdVeU2z8L7RikGMN2rAy4/A==
X-Google-Smtp-Source: ABdhPJxHgeCNeLGrEHLuFyZv4K5xKPgDEb7MgKTClX0SNXknN+Z0V3vGhacdseo3bozc1ldUlq4EgA==
X-Received: by 2002:a05:620a:127b:: with SMTP id b27mr337232qkl.122.1628095306725;
        Wed, 04 Aug 2021 09:41:46 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:5502:1c1f:b765:ad72])
        by smtp.gmail.com with ESMTPSA id s69sm1460095qka.102.2021.08.04.09.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 09:41:46 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Denys Dmytriyenko <denis@denix.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 0/3] Convert to new override syntax
Date: Wed,  4 Aug 2021 12:41:42 -0400
Message-Id: <20210804164145.1556-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In an effort to get this out ASAP, I'm bypassing Arm's internal review
process.  So, there could be bugs in here or other stupidity on my part.

I have run this through Gitlab CI.  There are still a few tests not
passing, which I believe are unrelated to this change.  Specifically,
* check-layers no longer passes
* corstone500 perf is not building
* meta-zephyr machines are throwing errors implying that meta-zephyr
  doesn't have the new override syntax fix
* gem5-arm64-xen throws an error implying meta-virt doesn't have a fix
  either
* juno throws an error related to a new 5.4 kernel causing a patch not
  to apply

Everything else is working and qemu based machines pass testimage.

Please code review and test.

Thanks,
Jon

Jon Mason (3):
  meta-arm: Add honister layer compatibility
  CI: increase CONF_VERSION
  meta-arm: Convert to new override syntax

 ci/base.yml                                   |  10 +-
 ci/gem5-arm64-xen.yml                         |   2 +-
 ci/qemuarmv5.yml                              |   2 +-
 ci/testimage.yml                              |   2 +-
 kas/fvp-baser-aemv8r64-bsp.yml                |  10 +-
 .../classes/alternate-kernel.bbclass          |   6 +-
 .../classes/docker_extern_containers.bbclass  |   4 +-
 .../classes/kernel-xenguest.bbclass           |   2 +-
 .../classes/xenguest_image_extra.bbclass      |   2 +-
 .../distro/include/arm-autonomy-guest.inc     |   4 +-
 .../conf/distro/include/arm-autonomy-host.inc |   8 +-
 meta-arm-autonomy/conf/layer.conf             |   4 +-
 .../arm-autonomy-machine-extra-settings.inc   |   6 +-
 .../conf/machine/fvp-base-extra-settings.inc  |   2 +-
 .../conf/machine/juno-extra-settings.inc      |   2 +-
 .../conf/machine/n1sdp-extra-settings.inc     |   6 +-
 .../images/firmware-image-juno.bbappend       |  12 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   6 +-
 .../xen-devicetree/xen-devicetree.bbappend    |  22 +-
 .../recipes-extended/xen/xen_%.bbappend       |  18 +-
 .../recipes-bsp/grub/grub-efi_%.bbappend      |   4 +-
 .../import-docker-containers.bb               |   2 +-
 .../packagegroup-docker-runtime-minimal.bb    |   2 +-
 .../recipes-core/busybox/busybox_%.bbappend   |   6 +-
 .../init-ifupdown/init-ifupdown_1.0.bbappend  |   4 +-
 .../qemu/qemu-autonomy-host.inc               |   4 +-
 .../xen-devicetree/xen-devicetree.bb          |   2 +-
 .../recipes-extended/xen/xen-tools_%.bbappend |   2 +-
 .../xen/xen-tools_4.14.bbappend               |   6 +-
 .../recipes-extended/xen/xen_%.bbappend       |   4 +-
 .../recipes-extended/xen/xen_4.14.bbappend    |   6 +-
 .../xenguest/xenguest-base-image.bb           |   2 +-
 .../xenguest/xenguest-extern-guests.bb        |   2 +-
 .../xenguest/xenguest-manager.bb              |   4 +-
 .../xenguest/xenguest-mkimage.bb              |   4 +-
 .../xenguest/xenguest-network.bb              |  22 +-
 .../linux/linux-arm-autonomy.inc              |   8 +-
 meta-arm-bsp/conf/layer.conf                  |   6 +-
 .../conf/machine/corstone700-fvp.conf         |   2 +-
 .../conf/machine/corstone700-mps3.conf        |   4 +-
 .../conf/machine/fvp-baser-aemv8r64.conf      |   2 +-
 meta-arm-bsp/conf/machine/fvp-common.inc      |   2 +-
 .../conf/machine/include/arm/arch-armv6m.inc  |   6 +-
 .../conf/machine/include/arm/arch-armv7em.inc |   6 +-
 .../conf/machine/include/arm/arch-armv7m.inc  |   6 +-
 .../include/arm/arch-armv8-1m-main.inc        |   6 +-
 .../machine/include/arm/arch-armv8-2a.inc     |  16 +-
 .../machine/include/arm/arch-armv8-4a.inc     |  16 +-
 .../machine/include/arm/arch-armv8m-base.inc  |   6 +-
 .../machine/include/arm/arch-armv8m-main.inc  |  24 +-
 .../include/arm/armv8r/arch-armv8r64.inc      |  24 +-
 .../conf/machine/include/corstone700.inc      |   4 +-
 .../conf/machine/include/tune-cortexm0.inc    |   6 +-
 .../machine/include/tune-cortexm0plus.inc     |   6 +-
 .../conf/machine/include/tune-cortexm1.inc    |   6 +-
 .../conf/machine/include/tune-cortexm23.inc   |   6 +-
 .../conf/machine/include/tune-cortexm3.inc    |   6 +-
 .../conf/machine/include/tune-cortexm33.inc   |   6 +-
 .../conf/machine/include/tune-cortexm35p.inc  |   6 +-
 .../conf/machine/include/tune-cortexm4.inc    |   6 +-
 .../conf/machine/include/tune-cortexm55.inc   |   6 +-
 .../conf/machine/include/tune-cortexm7.inc    |   6 +-
 .../conf/machine/include/tune-neoversen1.inc  |   8 +-
 meta-arm-bsp/conf/machine/musca-b1.conf       |   2 +-
 meta-arm-bsp/conf/machine/n1sdp.conf          |   2 +-
 meta-arm-bsp/conf/machine/sgi575.conf         |   2 +-
 .../boot-firmware/boot-firmware_git.bb        |   4 +-
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |   4 +-
 .../boot-wrapper-aarch64_%.bbappend           |   2 +-
 .../external-system/external-system_0.1.0.bb  |   2 +-
 .../recipes-bsp/hafnium/hafnium_2.5.bbappend  |   2 +-
 .../images/n1sdp-board-firmware_2020.07.27.bb |   2 +-
 .../scp-firmware/scp-firmware-juno.inc        |   2 +-
 .../scp-firmware/scp-firmware-n1sdp.inc       |   8 +-
 .../scp-firmware/scp-firmware-sgi575.inc      |   2 +-
 .../scp-firmware/scp-firmware-tc0.inc         |   2 +-
 .../scp-firmware/scp-firmware_2.8%.bbappend   |   8 +-
 .../trusted-firmware-a-corstone500.inc        |   2 +-
 .../trusted-firmware-a-corstone700.inc        |   2 +-
 .../trusted-firmware-a-fvp-arm32.inc          |   2 +-
 .../trusted-firmware-a-juno.inc               |   2 +-
 .../trusted-firmware-a_2.%.bbappend           |   2 +-
 .../trusted-firmware-a_2.5.bbappend           |  16 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   6 +-
 .../u-boot/u-boot_2020.04.bbappend            |   4 +-
 .../u-boot/u-boot_2020.07.bbappend            |   6 +-
 .../u-boot/u-boot_2021.07.bbappend            |   4 +-
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   6 +-
 .../uefi/edk2-firmware_202102.bbappend        |   6 +-
 .../init-ifupdown/init-ifupdown_1.0.bbappend  |   2 +-
 .../linux/linux-arm-platforms.inc             |  82 ++--
 .../linux/linux-arm64-ack_5.10.bbappend       |   2 +-
 .../linux/linux-yocto-corstone700.inc         |  10 +-
 .../linux/linux-yocto-rt_%.bbappend           |   4 +-
 .../linux/linux-yocto_5.3%.bbappend           |   4 +-
 .../linux/linux-yocto_5.6%.bbappend           |   6 +-
 .../linux/linux-yocto_5.7%.bbappend           |   4 +-
 .../optee/optee-client_3.14.0.bbappend        |   2 +-
 .../recipes-security/optee/optee-os-tc0.inc   |   6 +-
 .../optee/optee-os_3.14.0.bbappend            |   2 +-
 .../optee/optee-test_3.14.0.bbappend          |   2 +-
 .../distro/include/tcmode-external-arm.inc    |  14 +-
 meta-arm-toolchain/conf/layer.conf            |   4 +-
 .../arm-binary-toolchain.inc                  |   4 +-
 .../external-arm-sdk-toolchain.bb             |  30 +-
 .../external-arm-toolchain.bb                 | 374 +++++++++---------
 .../gcc-aarch64-none-elf_10.2-2020.11.bb      |   4 +-
 .../external-arm-toolchain/license.inc        | 134 +++----
 .../recipes-devtools/gcc/gcc-arm-10.2.inc     |   4 +-
 .../recipes-devtools/gcc/gcc-arm-common.inc   |   4 +-
 .../gcc/gcc-sanitizers_arm-10.2.bb            |   4 +-
 .../recipes-devtools/gcc/gcc_arm-10.2.bb      |  10 +-
 .../gcc/libgcc-initial_arm-10.2.bb            |   2 +-
 .../recipes-devtools/gcc/libgcc_arm-10.2.bb   |   2 +-
 meta-arm/conf/layer.conf                      |   2 +-
 meta-arm/conf/machine/microbit-v1.conf        |   2 +-
 meta-arm/conf/machine/qemu-cortex-a53.conf    |   2 +-
 .../boot-wrapper-aarch64_git.bb               |   2 +-
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb   |   6 +-
 .../scp-firmware/scp-firmware_2.8.0.bb        |   6 +-
 .../trusted-firmware-a/trusted-firmware-a.inc |  18 +-
 .../trusted-firmware-a_%.bbappend             |  22 +-
 .../trusted-firmware-m_1.3.0.bb               |   2 +-
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |   4 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  10 +-
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  22 +-
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb     |   2 +-
 meta-arm/recipes-devtools/fvp/fvp-common.inc  |   6 +-
 .../linux/linux-yocto_5.10.bbappend           |  14 +-
 .../recipes-security/optee/optee-client.inc   |  10 +-
 .../recipes-security/optee/optee-examples.inc |   2 +-
 meta-arm/recipes-security/optee/optee-os.inc  |  10 +-
 .../recipes-security/optee/optee-os_3.14.0.bb |   2 +-
 .../recipes-security/optee/optee-test.inc     |   2 +-
 meta-arm/recipes-security/optee/optee.inc     |   8 +-
 meta-atp/conf/layer.conf                      |   2 +-
 .../gem5/gem5-aarch64-native_20.bbappend      |   6 +-
 .../gem5/gem5-m5ops_20.bbappend               |   4 +-
 meta-atp/recipes-kernel/atp/atp-module_3.1.bb |   4 +-
 meta-atp/recipes-kernel/atp/atp-test_3.1.bb   |   2 +-
 .../linux/linux-yocto_5.4.bbappend            |   2 +-
 meta-gem5/conf/layer.conf                     |   4 +-
 meta-gem5/conf/machine/gem5-arm64.conf        |   2 +-
 .../boot-wrapper-aarch64_%.bbappend           |  10 +-
 .../gem5/gem5-aarch64-native_20.bbappend      |   2 +-
 .../recipes-extended/xen/xen_%.bbappend       |   6 +-
 .../recipes-kernel/linux/linux-%.bbappend     |   8 +-
 .../boot-wrapper-aarch64_%.bbappend           |  10 +-
 .../gem5/gem5-aarch64-native_20.bb            |   6 +-
 .../recipes-devtools/gem5/gem5-native.inc     |   6 +-
 .../linux/linux-yocto_5.4.bbappend            |  10 +-
 151 files changed, 734 insertions(+), 734 deletions(-)

-- 
2.20.1

