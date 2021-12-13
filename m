Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1082C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:34:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13618.1639413278561465266
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:34:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 349191FB;
	Mon, 13 Dec 2021 08:34:38 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE07A3F73B;
	Mon, 13 Dec 2021 08:34:36 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 0/4] backport: "corstone1000: out-of-tree u-boot
 patches" 
Date: Mon, 13 Dec 2021 16:34:25 +0000
Message-Id: <20211213163429.2499-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:34:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2659

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Backporting the features already merged with master.

Abdellatif El Khlifi (2):
  arm-bsp/u-boot: corstone1000: arm_ffa: removing the cast when using
    binary OR on FIELD_PREP macros
  arm-bsp/u-boot: corstone1000: add the header file for
    invalidate_dcache_all function

Vishnu Banavath (2):
  arm-bsp/u-boot: corstone1000: passing interface ID and event ID in
    register w4
  arm-bsp/u-boot: corstone1000: make capsule guid check platform
    agnostic

 ...interface-and-buffer-event-ids-in-w4.patch | 77 +++++++++++++++++++
 ...interface-and-kernel-event-ids-in-w4.patch | 59 ++++++++++++++
 ...e-guid-check-from-corstone1000-confi.patch | 62 +++++++++++++++
 ...t-when-using-binary-OR-on-FIELD_PREP.patch | 42 ++++++++++
 ...eader-file-for-invalidate_dcache_all.patch | 32 ++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  5 ++
 6 files changed, 277 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch

-- 
2.17.1


