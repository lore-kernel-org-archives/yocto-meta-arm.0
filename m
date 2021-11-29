Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8DCC433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 17:58:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.64839.1638208680932801357
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 09:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BA981063;
	Mon, 29 Nov 2021 09:57:59 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3FE23F5A1;
	Mon, 29 Nov 2021 09:57:57 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	"Arpita S . K" <Arpita.S.K@arm.com>
Subject: [PATCH][HONISTER 00/10] Backport "corstone1000: FF-A in u-boot ,
 enabling secure partitions in Optee" commits on honister 
Date: Mon, 29 Nov 2021 17:57:39 +0000
Message-Id: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 17:58:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2480

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Adding to honister stable branch:

- FF-A in u-boot
- Enabling secure partitions in Optee
- spdevkit fixes

Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>

Abdellatif El Khlifi (4):
  arm-bsp/u-boot: corstone1000: introducing Arm FF-A and MM support
  arm-bsp/u-boot: corstone1000: introducing EFI capsule update
  arm-bsp/u-boot: corstone1000: adjust the environment and heap sizes
  arm-bsp/linux: setting the FFA_VERSION compatibility checks

Ross Burton (5):
  arm/optee-test: use precise BSD license
  arm/optee-test: change DEPENDS to optee-os-tadevkit
  CI: build optee-test in qemuarm64-secureboot
  arm/optee-spdevkit: fix non-corstone1000 builds
  CI: build optee-spdevkit for qemuarm64

Vishnu Banavath (1):
  arm-bsp/optee-os: add a rule in optee-os Makefile for secure
    partitions

 ci/qemuarm64-secureboot.yml                   |    3 +
 ...ntroducing-Arm-FF-A-low-level-driver.patch | 2612 +++++++++++++++++
 ...9-arm_ffa-introducing-armffa-command.patch |  344 +++
 ...troducing-test-module-for-UCLASS_FFA.patch |  134 +
 ...troducing-MM-communication-with-FF-A.patch |  383 +++
 ...stone1000-enable-FF-A-and-MM-support.patch |  112 +
 ...one1000-introduce-EFI-capsule-update.patch |  419 +++
 ...djust-the-environment-and-heap-sizes.patch |   34 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |    9 +-
 ...A_VERSION-compatibility-checks.patch.patch |  101 +
 .../linux/linux-arm-platforms.inc             |    1 +
 ...0-add-a-rule-in-Makefile-to-SP_MAKEF.patch |   38 +
 .../optee/optee-os_corstone1000_common.inc    |    3 +-
 .../optee/optee-spdevkit_git.bb               |    5 +-
 .../recipes-security/optee/optee-test.inc     |    4 +-
 15 files changed, 4197 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-arm_ffa-introducing-armffa-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm_ffa-introducing-test-module-for-UCLASS_FFA.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-arm_ffa-introducing-MM-communication-with-FF-A.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi-corstone1000-introduce-EFI-capsule-update.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-corstone1000-adjust-the-environment-and-heap-sizes.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0037-firmware-arm_ffa-setting-the-FFA_VERSION-compatibility-checks.patch.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch

-- 
2.17.1


