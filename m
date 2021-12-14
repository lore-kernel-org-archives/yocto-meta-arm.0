Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC0CC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:12:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.24440.1639480369885100686
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D3896D;
	Tue, 14 Dec 2021 03:12:49 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56FFC3F5A1;
	Tue, 14 Dec 2021 03:12:48 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/2] EFI u-boot fixes
Date: Tue, 14 Dec 2021 11:12:38 +0000
Message-Id: <20211214111240.11186-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2698

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Adding fixes for u-boot at EFI level.

Gowtham Suresh Kumar (2):
  arm-bsp/u-boot: corstone1000: Remove GetVariable() fix
  arm-bsp/u-boot: corstone1000: Fix efi debug issue

 ...ix-GetVariable-to-handle-0-data-size.patch | 47 -------------------
 ...nterface-and-buffer-event-ids-in-w4.patch} |  0
 ...nterface-and-kernel-event-ids-in-w4.patch} |  0
 ...-guid-check-from-corstone1000-confi.patch} |  0
 ...-when-using-binary-OR-on-FIELD_PREP.patch} |  0
 ...ader-file-for-invalidate_dcache_all.patch} |  0
 ...-error-code-when-rx-buffer-is-larger.patch | 33 +++++++++++++
 .../0041-Use-correct-buffer-size.patch        | 42 +++++++++++++++++
 ...e-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch | 32 +++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      | 14 +++---
 10 files changed, 115 insertions(+), 53 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-Fix-GetVariable-to-handle-0-data-size.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch => 0035-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch => 0036-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch => 0037-efi_loader-remove-guid-check-from-corstone1000-confi.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch => 0038-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch => 0039-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-Return-proper-error-code-when-rx-buffer-is-larger.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-Use-correct-buffer-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch

-- 
2.17.1


