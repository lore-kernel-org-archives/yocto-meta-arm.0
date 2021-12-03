Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975BBC433FE
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 12:29:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10930.1638534557906454850
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 04:29:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0935A1396;
	Fri,  3 Dec 2021 04:29:12 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C01833F5A1;
	Fri,  3 Dec 2021 04:29:10 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 00/11] Corstone1000: platform specific patches for u-boot,
 trusted firmware-a, trusted firmware-m
Date: Fri,  3 Dec 2021 12:28:50 +0000
Message-Id: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 12:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2515

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Out of tree patches adding the following features to Corstone1000:

- Enabling SMM gateway
- A fix for ISP1760 EFI boot
- EFI reset
- Autoboot using storage devices in u-boot
- FW update support

Emekcan Aras (3):
  arm-bsp/u-boot: corstone1000: Enable PSCI Reset
  arm-bsp/trusted firmware-a: corstone1000: implement EFI reset system
  arm-bsp/u-boot: corstone1000: Implement autoboot storage device
    selection

Gowtham Suresh Kumar (1):
  arm-bsp/u-boot: corstone1000: Enable SMM gateway

Harry Moulton (1):
  arm-bsp/u-boot: corstone1000: Fix ISP1760 EFI boot issue

Satish Kumar (6):
  arm-bsp/trusted-firmware-m: corstone1000: firmware update changes
  arm-bsp/trusted-firmware-a: patch to change flash base address of FIP
  arm-bsp/u-boot: patch to change kernel flash address
  arm-bsp/trusted-firmware-a: patch to identify which bank to load fip
    from
  arm-bsp/u-boot: identify which bank to load kernel from
  kas: corstone1000: update SE binary sizes

 kas/corstone1000-base.yml                     |   2 +-
 ...plement-platform-specific-psci-reset.patch |  60 ++
 ...change-base-address-of-FIP-in-the-fl.patch |  33 +
 ...identify-which-bank-to-load-fip-from.patch | 102 +++
 .../trusted-firmware-a-corstone1000.inc       |   3 +
 ...000-disable-secure-debug-temporarily.patch |  33 +
 ...ovision-firmware-update-metadata-fwu.patch | 470 +++++++++++++
 ...rse-the-uefi-firmware-update-capsule.patch | 243 +++++++
 ...-firmware-update-fwu-agent-into-TF-M.patch | 106 +++
 ...lement-corstone1000_fwu_flash_images.patch | 437 ++++++++++++
 ...ne1000-add-logic-to-select-boot-bank.patch | 266 ++++++++
 ...rstone1000-integrate-watchdog-driver.patch | 645 ++++++++++++++++++
 ...one1000-impelment-accept-image-logic.patch | 119 ++++
 ...implement-select-previous-bank-logic.patch |  91 +++
 ...-implement-corstone1000_fwu_host_ack.patch | 136 ++++
 ...e-initailize-multi-core-communicatio.patch |  39 ++
 ...plement-timer-to-track-host-progress.patch | 169 +++++
 ...fwu-nv-counter-anti-rollback-support.patch | 369 ++++++++++
 ...stone1000-bug-fix-in-openamp-version.patch |  50 ++
 ...cure-host-watchdog-interrupt-handler.patch |  80 +++
 .../trusted-firmware-m-corstone1000.inc       |  23 +-
 ...000-Update-FFA-shared-buffer-address.patch |  38 ++
 ...1000-Disable-set-get-of-NV-variables.patch |  58 ++
 ...e-sure-shared-buffer-contents-are-no.patch |  45 ++
 ...x-unrecognized-filesystem-type-error.patch |  96 +++
 ...9-corstone1000-set-CONFIG_PSCI_RESET.patch |  27 +
 ...rstone1000-Implement-autoboot-script.patch |  64 ++
 ...nge-base-address-of-kernel-in-the-fl.patch |  47 ++
 ...0-identify-which-bank-to-load-kernel.patch |  66 ++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  10 +-
 30 files changed, 3924 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-corstone1000-implement-platform-specific-psci-reset.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-corstone1000-disable-secure-debug-temporarily.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-corstone1000-provision-firmware-update-metadata-fwu.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-corstone1000-parse-the-uefi-firmware-update-capsule.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-corstone1000-add-firmware-update-fwu-agent-into-TF-M.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-corstone1000-implement-corstone1000_fwu_flash_images.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-corstone1000-add-logic-to-select-boot-bank.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-corstone1000-integrate-watchdog-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-corstone1000-impelment-accept-image-logic.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-corstone1000-implement-select-previous-bank-logic.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-corstone1000-implement-corstone1000_fwu_host_ack.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-SPM-multiple-core-initailize-multi-core-communicatio.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-corstone1000-implement-timer-to-track-host-progress.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-corstone1000-fwu-nv-counter-anti-rollback-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014-corstone1000-bug-fix-in-openamp-version.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-corstone1000-secure-host-watchdog-interrupt-handler.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-Update-FFA-shared-buffer-address.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone1000-Disable-set-get-of-NV-variables.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-arm-corstone1000-fix-unrecognized-filesystem-type-error.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone1000-set-CONFIG_PSCI_RESET.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-arm-bsp-u-boot-corstone1000-Implement-autoboot-script.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone1000-change-base-address-of-kernel-in-the-fl.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-arm-corstone1000-identify-which-bank-to-load-kernel.patch

-- 
2.17.1


