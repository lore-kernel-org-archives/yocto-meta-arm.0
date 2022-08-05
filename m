Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D89C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 14:10:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7225.1659708603305641815
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Aug 2022 07:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7DBE106F;
	Fri,  5 Aug 2022 07:10:02 -0700 (PDT)
Received: from e126345.arm.com (unknown [10.57.13.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 331093F73B;
	Fri,  5 Aug 2022 07:10:01 -0700 (PDT)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 0/2] fix EFI GetVariable() issue
Date: Fri,  5 Aug 2022 15:09:48 +0100
Message-Id: <20220805140950.26430-1-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Aug 2022 14:10:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3647

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The secure-partitions patch will fix the response from SMM
gateway for GetVariable() call. The u-boot patch will drop
the workaround patches.

Gowtham Suresh Kumar (2):
  arm-bsp/secure-partitions: fix SMM gateway bug for EFI GetVariable()
  arm-bsp/u-boot: drop EFI GetVariable() workarounds patches

 ...-error-code-when-rx-buffer-is-larger.patch |  31 --
 ...tch => 0019-Use-correct-buffer-size.patch} |   0
 ...te-ESRT-table-if-EFI_ESRT-config-op.patch} |   0
 ...e-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch |  30 --
 ...add-get_image_info-for-corstone1000.patch} |   0
 ...ootcomplete-message-to-secure-encla.patch} |   0
 ...ll-pointer-exception-with-get_image.patch} |   0
 ...4-Comment-mm_communicate-failure-log.patch |  34 --
 ...24-arm-corstone1000-add-mmc-for-fvp.patch} |   0
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  15 +-
 ...-UEFI-get_variable-with-small-buffer.patch | 407 ++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |   1 +
 12 files changed, 414 insertions(+), 104 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0020-Use-correct-buffer-size.patch => 0019-Use-correct-buffer-size.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch => 0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0023-efi_firmware-add-get_image_info-for-corstone1000.patch => 0021-efi_firmware-add-get_image_info-for-corstone1000.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch => 0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0026-efi_loader-fix-null-pointer-exception-with-get_image.patch => 0023-efi_loader-fix-null-pointer-exception-with-get_image.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0027-arm-corstone1000-add-mmc-for-fvp.patch => 0024-arm-corstone1000-add-mmc-for-fvp.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0048-Fix-UEFI-get_variable-with-small-buffer.patch

-- 
2.17.1


