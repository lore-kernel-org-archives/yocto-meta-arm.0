Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FB0C43217
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 11:28:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4009.1635506905505951256
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 04:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27E6C1FB;
	Fri, 29 Oct 2021 04:28:25 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.80.198])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79E103F5A1;
	Fri, 29 Oct 2021 04:28:23 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 07/13] arm-bsp/linux: corstone1000: enable efi
Date: Fri, 29 Oct 2021 12:27:47 +0100
Message-Id: <20211029112753.8231-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
References: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Oct 2021 11:28:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2320

From: Rui Miguel Silva <rui.silva@arm.com>

In an effort to setup capsule update and efi runtime service
handlers, enable the correspondent efi config options.

Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Change-Id: Ib068448564268dcacb9bcad3667a3b293f177a83
---
 .../recipes-kernel/linux/files/corstone1000/defconfig        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
index cc7dc3e..4642352 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -8,7 +8,12 @@ CONFIG_RELAY=y
 CONFIG_BOOT_CONFIG=y
 CONFIG_ARCH_VEXPRESS=y
 CONFIG_CMDLINE="console=ttyAMA0 loglevel=9"
+CONFIG_EFI=y
 # CONFIG_SUSPEND is not set
+CONFIG_EFI_BOOTLOADER_CONTROL=y
+CONFIG_EFI_CAPSULE_LOADER=y
+CONFIG_EFI_TEST=y
+CONFIG_RESET_ATTACK_MITIGATION=y
 # CONFIG_STACKPROTECTOR is not set
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-- 
2.17.1


