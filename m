Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC60DC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 14:25:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5888.1640010314166168673
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 06:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A910DD6E;
	Mon, 20 Dec 2021 06:25:13 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F41F63F718;
	Mon, 20 Dec 2021 06:25:12 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH honister 0/4] arm-bsp/secure-partitions: corstone1000:
 Configure storage in SMM gateway
Date: Mon, 20 Dec 2021 14:25:01 +0000
Message-Id: <20211220142505.30331-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 14:25:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2737

From: Xueliang Zhong <xueliang.zhong@arm.com>

This patch will add a macro to configure the volatile and
non volatile storage in SMM gateway. Few useful logs are
also added to the secure world.

Gowtham Suresh Kumar (3):
  arm-bsp/secure-partitions: corstone1000: Configure storage in SMM
    gateway
  arm-bsp/u-boot: corstone1000: Fix SCT failures
  arm-bsp/security: Revert set append write TS patch

Vishnu Banavath (1):
  arm-bsp/u-boot: populate ESRT table with image_info

 ...-Disable-DHCP-PING-config-parameters.patch |   31 +
 ...1000-Disable-set-get-of-NV-variables.patch |   48 +
 ...config-enable-CAPSULE_FIRMWARE_RAW-c.patch |   31 +
 ...ate-ESRT-table-if-EFI_ESRT-config-op.patch |   38 +
 ...-add-get_image_info-for-corstone1000.patch |  119 ++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |    5 +
 ...-logs-to-functions-in-SMM-gateway-SP.patch |  251 ++++
 .../0027-Configure-storage-size.patch         |   43 +
 ...d-uefi-variable-append-write-support.patch | 1220 +++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |    3 +
 10 files changed, 1789 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-Disable-DHCP-PING-config-parameters.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-Revert-corstone1000-Disable-set-get-of-NV-variables.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-corstone1000-defconfig-enable-CAPSULE_FIRMWARE_RAW-c.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-efi_firmware-add-get_image_info-for-corstone1000.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0027-Configure-storage-size.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0028-Revert-Add-uefi-variable-append-write-support.patch

-- 
2.17.1


