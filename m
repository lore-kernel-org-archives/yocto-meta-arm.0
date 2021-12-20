Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E07C433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 14:25:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5782.1640010315950508113
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 06:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 929E5D6E;
	Mon, 20 Dec 2021 06:25:15 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEDC23F718;
	Mon, 20 Dec 2021 06:25:14 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH honister 2/4] arm-bsp/u-boot: corstone1000: Fix SCT failures
Date: Mon, 20 Dec 2021 14:25:03 +0000
Message-Id: <20211220142505.30331-3-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211220142505.30331-1-xueliang.zhong@arm.com>
References: <20211220142505.30331-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 14:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2739

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This patch removes the CONFIG_CMD_DHCP and CONFIG_CMD_PING
config parameters from the defconfig. It also reverts the workaround
patch which disabled NV get and set on u-boot.

Change-Id: I80f41235dbca2e76003c28164b42f4403dadc499
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...-Disable-DHCP-PING-config-parameters.patch | 31 ++++++++++++
 ...1000-Disable-set-get-of-NV-variables.patch | 48 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  2 +
 3 files changed, 81 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-Disable-DHCP-PING-config-parameters.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-Revert-corstone1000-Disable-set-get-of-NV-variables.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-Disable-DHCP-PING-config-parameters.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-Disable-DHCP-PING-config-parameters.patch
new file mode 100644
index 0000000..e96e9a5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-Disable-DHCP-PING-config-parameters.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From e6b420ce5d56fcc08aac2812ee5402686fa56fae Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Thu, 16 Dec 2021 17:25:29 +0000
+Subject: [PATCH] Disable DHCP, PING config parameters
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+---
+ configs/corstone1000_defconfig | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index 3c00e13ceb..e11ffbfc89 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -31,10 +31,8 @@ CONFIG_CMD_NVEDIT_EFI=y
+ CONFIG_CMD_USB=y
+ CONFIG_CMD_ITEST=y
+ # CONFIG_CMD_SETEXPR is not set
+-CONFIG_CMD_DHCP=y
+ # CONFIG_CMD_NFS is not set
+ CONFIG_CMD_MII=y
+-CONFIG_CMD_PING=y
+ CONFIG_CMD_CACHE=y
+ CONFIG_CMD_EFIDEBUG=y
+ CONFIG_CMD_FAT=y
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-Revert-corstone1000-Disable-set-get-of-NV-variables.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-Revert-corstone1000-Disable-set-get-of-NV-variables.patch
new file mode 100644
index 0000000..cb3eb49
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-Revert-corstone1000-Disable-set-get-of-NV-variables.patch
@@ -0,0 +1,48 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 2a8d1b3fb89ae68d126e16f8346405df8fcc3ed6 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Thu, 16 Dec 2021 19:36:18 +0000
+Subject: [PATCH] Revert "corstone1000: Disable set/get of NV variables"
+
+This reverts commit 5c77e9883ea29472c353d63c66a7f8ffd6ea367f.
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+---
+ lib/efi_loader/efi_setup.c | 12 ++----------
+ 1 file changed, 2 insertions(+), 10 deletions(-)
+
+diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
+index fcf2eae9cd..9e3399a28c 100644
+--- a/lib/efi_loader/efi_setup.c
++++ b/lib/efi_loader/efi_setup.c
+@@ -83,11 +83,7 @@ static efi_status_t efi_init_platform_lang(void)
+ 
+ 	ret = efi_set_variable_int(L"PlatformLang",
+ 				   &efi_global_variable_guid,
+-				   	/*
+-					* This is a temporary change until NV memory is accessible 
+-					* through OpenAmp. 
+-					*/
+-				   //EFI_VARIABLE_NON_VOLATILE | 
++				   EFI_VARIABLE_NON_VOLATILE |
+ 				   EFI_VARIABLE_BOOTSERVICE_ACCESS |
+ 				   EFI_VARIABLE_RUNTIME_ACCESS,
+ 				   1 + strlen(lang), lang, false);
+@@ -214,11 +210,7 @@ static efi_status_t efi_clear_os_indications(void)
+ 		os_indications &=
+ 			~EFI_OS_INDICATIONS_FILE_CAPSULE_DELIVERY_SUPPORTED;
+ 	ret = efi_set_variable_int(L"OsIndications", &efi_global_variable_guid,
+-				   	/*
+-					* This is a temporary change until NV memory is accessible 
+-					* through OpenAmp. 
+-					*/
+-				   //EFI_VARIABLE_NON_VOLATILE |
++				   EFI_VARIABLE_NON_VOLATILE |
+ 				   EFI_VARIABLE_BOOTSERVICE_ACCESS |
+ 				   EFI_VARIABLE_RUNTIME_ACCESS,
+ 				   sizeof(os_indications), &os_indications,
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 3d5d64f..8b65082 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -54,6 +54,8 @@ SRC_URI:append:corstone1000 = " \
       file://0040-Return-proper-error-code-when-rx-buffer-is-larger.patch \
       file://0041-Use-correct-buffer-size.patch \
       file://0042-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch \
+      file://0043-Disable-DHCP-PING-config-parameters.patch \
+      file://0044-Revert-corstone1000-Disable-set-get-of-NV-variables.patch \
       "
 
 #
-- 
2.17.1


