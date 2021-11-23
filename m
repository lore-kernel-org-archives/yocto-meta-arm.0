Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414E1C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 15:59:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13096.1637683178029439157
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 07:59:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C1921FB;
	Tue, 23 Nov 2021 07:59:37 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FCA13F5A1;
	Tue, 23 Nov 2021 07:59:36 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	vishnu.banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][honister 00/19] adding corstone1000-fvp on honister
Date: Tue, 23 Nov 2021 15:59:07 +0000
Message-Id: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 15:59:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2429

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Backporting corstone1000-fvp to honister stable branch.

Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>

Abdellatif El Khlifi (8):
  arm-bsp/trusted-firmware-a: remove TARGET_FPU build argument
  arm/fiptool-native: bumping the version to v2.5
  arm-bsp/linux: introducing corstone1000 FVP machine
  arm-bsp/trusted-firmware-a: introducing corstone1000 FVP machine
  arm-bsp/python3-imgtool: add the recipe
  arm-bsp/trusted-firmware-m: corstone1000: signing trusted-firmware-a
    binaries
  arm-bsp/linux: corstone1000: integrating ARM_FFA_TRANSPORT in v5.10
    kernel
  arm/ffa-debugfs: corstone1000: enabling FF-A Debugfs Linux driver

Arpita S.K (2):
  corstone1000: Introducing ci and kas files
  arm/trusted-firmware-a,fiptool-native: Fix fiptool execution wrt
    corstone1000

Diego Sueiro (1):
  arm/trusted-firmware-a,fiptool-native: Fix fiptool execution

Ross Burton (2):
  arm/fiptool-native: improve OpenSSL build fix
  arm/trusted-firmware-a: improve OpenSSL build fix

Rui Miguel Silva (2):
  arm-bsp/u-boot: introducing corstone1000 FVP machine
  arm-bsp/linux: corstone1000: enable efi

Satish Kumar (1):
  arm/trusted-firmware-m: upgrade to 1.4.0

Vishnu Banavath (3):
  arm-bsp/trusted-firmware-m: introducing corstone1000 FVP machine
  arm-bsp/optee: introducing corstone1000 FVP machine
  arm-bsp/u-boot: corstone1000: extend efi support

 .gitlab-ci.yml                                |    3 +
 ci/corstone1000-fvp.yml                       |   12 +
 kas/corstone1000-base.yml                     |   48 +
 kas/corstone1000-fvp.yml                      |   16 +
 meta-arm-bsp/conf/layer.conf                  |    1 +
 .../conf/machine/corstone1000-fvp.conf        |    9 +
 .../conf/machine/include/corstone1000.inc     |   63 +
 .../0001-Rename-Diphda-to-corstone1000.patch  |  587 +++
 ...e1000-made-changes-to-accommodate-3M.patch |  201 +
 .../trusted-firmware-a-corstone1000.inc       |   50 +
 .../trusted-firmware-a_2.5.bbappend           |    1 +
 .../trusted-firmware-m-corstone1000.inc       |   49 +
 .../trusted-firmware-m-sign-host-images.inc   |   50 +
 .../trusted-firmware-m_%.bbappend             |    6 +
 .../0001-arm-add-corstone1000-platform.patch  |  330 ++
 ...e1000-enable-devicetree-in-defconfig.patch |   59 +
 ...3-usb-common-move-urb-code-to-common.patch |  508 +++
 .../0004-usb-add-isp1760-family-driver.patch  | 3797 +++++++++++++++++
 ...one1000-enable-isp1763-and-usb-stack.patch |   92 +
 ...-corstone1000-enable-support-for-FVP.patch |  240 ++
 ...-sharing-PSCI-DTS-node-between-FVP-a.patch |   34 +
 ...rm-corstone1000-Emulated-RTC-Support.patch |   32 +
 ...-corstone1000-execute-uboot-from-DDR.patch |   31 +
 ...d-add-load-command-for-memory-mapped.patch |  177 +
 ...-corstone1000-enable-boot-using-uefi.patch |   61 +
 ...corstone1000-enable-uefi-secure-boot.patch |   32 +
 ...0-enable-handlers-for-uefi-variables.patch |   47 +
 ...stone1000-enable-efi-capsule-options.patch |   36 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   26 +
 .../python3-imgtool_1.7.1.bb                  |   14 +
 .../arm-platforms/corstone1000-standard.scc   |    5 +
 .../bsp/arm-platforms/corstone1000/base.cfg   |   29 +
 ...-usb-isp1760-fix-strict-typechecking.patch |  191 +
 ...0-move-to-regmap-for-register-access.patch | 2333 ++++++++++
 ...3-usb-isp1760-use-relaxed-primitives.patch |   64 +
 ...remove-platform-data-struct-and-code.patch |   62 +
 ...cd-refactor-mempool-config-and-setup.patch |  304 ++
 ...0006-usb-isp1760-use-dr_mode-binding.patch |   78 +
 ...-usb-isp1760-add-support-for-isp1763.patch | 1894 ++++++++
 ...indings-usb-nxp-isp1760-add-bindings.patch |   99 +
 ...0009-usb-isp1763-add-peripheral-mode.patch |  303 ++
 ...ccc-Add-SMCCC-TRNG-function-call-IDs.patch |   69 +
 ...smccc-Introduce-SMCCC-TRNG-framework.patch |  103 +
 ...v1.2-extended-input-output-registers.patch |  192 +
 ...A-bus-support-for-device-enumeration.patch |  423 ++
 ...a-Add-initial-Arm-FFA-driver-support.patch |  422 ++
 ...for-SMCCC-as-transport-to-ffa-driver.patch |  119 +
 ...up-in-kernel-users-of-FFA-partitions.patch |  410 ++
 ..._ffa-Add-support-for-MEM_-interfaces.patch |  409 ++
 ...ure-drivers-provide-a-probe-function.patch |   40 +
 ...ware-arm_ffa-Simplify-probe-function.patch |   38 +
 ...rmware-arm_ffa-Fix-the-comment-style.patch |   41 +
 ...ble-ffa_linux_errmap-buffer-overflow.patch |   46 +
 ...760-udc-Provide-missing-description-.patch |   41 +
 ...Fix-meaningless-check-in-isp1763_run.patch |   38 +
 ...sp1760-remove-debug-message-as-error.patch |   32 +
 ...-do-not-sleep-in-field-register-poll.patch |   58 +
 ...rk-cache-initialization-error-handli.patch |   55 +
 ...re-return-value-for-bus-change-patte.patch |   55 +
 ...-check-maxpacketsize-before-using-it.patch |   40 +
 ...0029-usb-isp1760-do-not-reset-retval.patch |   36 +
 ...0-do-not-shift-in-uninitialized-slot.patch |   61 +
 ...clean-never-read-udc_enabled-warning.patch |   52 +
 ...p1760-fix-memory-pool-initialization.patch |   36 +
 ...0033-usb-isp1760-fix-qtd-fill-length.patch |   38 +
 ...write-to-status-and-address-register.patch |   90 +
 ...isp1760-use-the-right-irq-status-bit.patch |   72 +
 ...-isp1760-otg-control-register-access.patch |  134 +
 .../corstone1000_kernel_debug.cfg             |    3 +
 .../linux/files/corstone1000/defconfig        |   95 +
 .../linux/linux-arm-platforms.inc             |   80 +
 ...rstone1000-add-corstone1000-platform.patch |  201 +
 ...000-reserve-3MB-CVM-memory-for-optee.patch |   30 +
 .../optee/optee-os_3.14.0.bbappend            |    1 +
 .../optee/optee-os_corstone1000.inc           |   27 +
 .../trusted-firmware-a/files/ssl.patch        |   52 +
 .../trusted-firmware-a/trusted-firmware-a.inc |   20 +-
 .../trusted-firmware-m_1.4.0.bb               |  128 +
 .../recipes-devtools/fiptool/files/ssl.patch  |   52 +
 .../fiptool/fiptool-native_2.3.bb             |   29 -
 ...ol-native_1.5.bb => fiptool-native_2.5.bb} |   17 +-
 .../ffa-debugfs/ffa-debugfs-mod_2.1.0.bb      |   29 +
 .../files/0001-build-add-Yocto-support.patch  |   79 +
 ...-loading-the-driver-in-a-generic-way.patch |   46 +
 84 files changed, 15963 insertions(+), 50 deletions(-)
 create mode 100644 ci/corstone1000-fvp.yml
 create mode 100644 kas/corstone1000-base.yml
 create mode 100644 kas/corstone1000-fvp.yml
 create mode 100644 meta-arm-bsp/conf/machine/corstone1000-fvp.conf
 create mode 100644 meta-arm-bsp/conf/machine/include/corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001-Rename-Diphda-to-corstone1000.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sign-host-images.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-cmd-load-add-load-command-for-memory-mapped.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm-corstone1000-enable-boot-using-uefi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-enable-uefi-secure-boot.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm-corstone1000-enable-handlers-for-uefi-variables.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm-corstone1000-enable-efi-capsule-options.patch
 create mode 100644 meta-arm-bsp/recipes-devtool/corstone1000-imgtool/python3-imgtool_1.7.1.bb
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone1000-standard.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone1000/base.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-usb-isp1760-fix-strict-typechecking.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-usb-isp1760-move-to-regmap-for-register-access.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-usb-isp1760-use-relaxed-primitives.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-usb-isp1760-remove-platform-data-struct-and-code.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-usb-isp1760-use-dr_mode-binding.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0007-usb-isp1760-add-support-for-isp1763.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0008-dt-bindings-usb-nxp-isp1760-add-bindings.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0009-usb-isp1763-add-peripheral-mode.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0010-firmware-smccc-Add-SMCCC-TRNG-function-call-IDs.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0011-firmware-smccc-Introduce-SMCCC-TRNG-framework.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0012-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input-output-registers.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0013-firmware-arm_ffa-Add-initial-FFA-bus-support-for-device-enumeration.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0014-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0015-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-to-ffa-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0016-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partitions.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0017-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0018-firmware-arm_ffa-Ensure-drivers-provide-a-probe-function.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0019-firmware-arm_ffa-Simplify-probe-function.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0020-firmware-arm_ffa-Fix-the-comment-style.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0021-firmware-arm_ffa-Fix-a-possible-ffa_linux_errmap-buffer-overflow.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0022-usb-isp1760-isp1760-udc-Provide-missing-description-.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0023-usb-isp1760-Fix-meaningless-check-in-isp1763_run.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0024-usb-isp1760-remove-debug-message-as-error.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0025-usb-isp1760-do-not-sleep-in-field-register-poll.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0026-usb-isp1760-rework-cache-initialization-error-handli.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0027-usb-isp1760-ignore-return-value-for-bus-change-patte.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0028-usb-isp1760-check-maxpacketsize-before-using-it.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0029-usb-isp1760-do-not-reset-retval.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0030-usb-isp1760-do-not-shift-in-uninitialized-slot.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0031-usb-isp1760-clean-never-read-udc_enabled-warning.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0032-usb-isp1760-fix-memory-pool-initialization.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0033-usb-isp1760-fix-qtd-fill-length.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0034-usb-isp1760-write-to-status-and-address-register.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0035-usb-isp1760-use-the-right-irq-status-bit.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0036-usb-isp1760-otg-control-register-access.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/corstone1000_kernel_debug.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.0.bb
 create mode 100644 meta-arm/recipes-devtools/fiptool/files/ssl.patch
 delete mode 100644 meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
 rename meta-arm/recipes-devtools/fiptool/{fiptool-native_1.5.bb => fiptool-native_2.5.bb} (52%)
 create mode 100644 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
 create mode 100644 meta-arm/recipes-kernel/ffa-debugfs/files/0001-build-add-Yocto-support.patch
 create mode 100644 meta-arm/recipes-kernel/ffa-debugfs/files/0002-script-loading-the-driver-in-a-generic-way.patch

-- 
2.17.1


