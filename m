Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14958C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:25:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.51279.1638797127378247269
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 05:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 066CC1042;
	Mon,  6 Dec 2021 05:25:27 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0E653F73D;
	Mon,  6 Dec 2021 05:25:25 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH][HONISTER 03/13] arm-bsp/u-boot: corstone1000: Enable SMM
 gateway
Date: Mon,  6 Dec 2021 13:25:03 +0000
Message-Id: <20211206132513.20172-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
References: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 13:25:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2537

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This patch updates shared buffer address, disables get/set of NV
variables, and invalidates the cache after write to shared buffer as the
SPs have cache disabled.

Change-Id: Iead01edf3011e192df205236df098415e5bde9a5
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...000-Update-FFA-shared-buffer-address.patch | 38 ++++++++++++
 ...1000-Disable-set-get-of-NV-variables.patch | 58 +++++++++++++++++++
 ...e-sure-shared-buffer-contents-are-no.patch | 45 ++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  3 +
 4 files changed, 144 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-Update-FFA-shared-buffer-address.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone1000-Disable-set-get-of-NV-variables.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone1000-Make-sure-shared-buffer-contents-are-no.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-Update-FFA-shared-buffer-address.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-Update-FFA-shared-buffer-address.patch
new file mode 100644
index 0000000..582d05e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-Update-FFA-shared-buffer-address.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 313b89315d93ace166e2312a8e09aa85f1beb747 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Wed, 17 Nov 2021 15:28:06 +0000
+Subject: [PATCH 06/10] corstone1000: Update FFA shared buffer address
+
+FFA shared buffer address changed to 0x02000000.
+
+The existing address 0x023F8000 is currently being used by
+Optee so the virtual address returned to the SMM gateway is 0x0000.
+So the buffer is moved to 0x02000000.
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+%% original patch: 0025-Update-FFA-shared-buffer-address.patch
+
+%% original patch: 0025-Update-FFA-shared-buffer-address.patch
+---
+ include/configs/corstone1000.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index 7f8c61ba93..0451121b79 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -42,7 +42,7 @@
+ #define FFA_SHARED_MM_BUFFER_SIZE		SZ_4K /* 4 KB */
+ 
+ /* shared buffer physical address used for communication between u-boot and the MM SP */
+-#define FFA_SHARED_MM_BUFFER_ADDR		(0x023F8000)
++#define FFA_SHARED_MM_BUFFER_ADDR		(0x02000000)
+ 
+ #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
+ #define CONFIG_SKIP_LOWLEVEL_INIT
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone1000-Disable-set-get-of-NV-variables.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone1000-Disable-set-get-of-NV-variables.patch
new file mode 100644
index 0000000..f54f548
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone1000-Disable-set-get-of-NV-variables.patch
@@ -0,0 +1,58 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 524c865ae37f9cb9278988120e508c5314c2cd73 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Wed, 17 Nov 2021 15:28:53 +0000
+Subject: [PATCH 07/10] corstone1000: Disable set/get of NV variables
+
+This is a temporary change which uses only the volatile memory
+for get and set variable calls.
+
+The non volatile storage access is via openAmp in se proxy which is still not 
+integrated to the system. So when an efi_set_variable_int() call is made for
+NV variables, mm_commmunicate results in failure. This change will direct
+PlatformLang and OsIndications to volatile memory which would be a
+temporary solution.
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+%% original patch: 0026-Disable-set-get-of-NV-variables.patch
+
+%% original patch: 0026-Disable-set-get-of-NV-variables.patch
+---
+ lib/efi_loader/efi_setup.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
+index 9e3399a28c..fcf2eae9cd 100644
+--- a/lib/efi_loader/efi_setup.c
++++ b/lib/efi_loader/efi_setup.c
+@@ -83,7 +83,11 @@ static efi_status_t efi_init_platform_lang(void)
+ 
+ 	ret = efi_set_variable_int(L"PlatformLang",
+ 				   &efi_global_variable_guid,
+-				   EFI_VARIABLE_NON_VOLATILE |
++				   	/*
++					* This is a temporary change until NV memory is accessible 
++					* through OpenAmp. 
++					*/
++				   //EFI_VARIABLE_NON_VOLATILE | 
+ 				   EFI_VARIABLE_BOOTSERVICE_ACCESS |
+ 				   EFI_VARIABLE_RUNTIME_ACCESS,
+ 				   1 + strlen(lang), lang, false);
+@@ -210,7 +214,11 @@ static efi_status_t efi_clear_os_indications(void)
+ 		os_indications &=
+ 			~EFI_OS_INDICATIONS_FILE_CAPSULE_DELIVERY_SUPPORTED;
+ 	ret = efi_set_variable_int(L"OsIndications", &efi_global_variable_guid,
+-				   EFI_VARIABLE_NON_VOLATILE |
++				   	/*
++					* This is a temporary change until NV memory is accessible 
++					* through OpenAmp. 
++					*/
++				   //EFI_VARIABLE_NON_VOLATILE |
+ 				   EFI_VARIABLE_BOOTSERVICE_ACCESS |
+ 				   EFI_VARIABLE_RUNTIME_ACCESS,
+ 				   sizeof(os_indications), &os_indications,
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone1000-Make-sure-shared-buffer-contents-are-no.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
new file mode 100644
index 0000000..b5bbce4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone1000-Make-sure-shared-buffer-contents-are-no.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 5d53e40021d7fca594bb86307b0851a958047b6b Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Thu, 18 Nov 2021 16:42:59 +0000
+Subject: [PATCH 08/10] corstone1000: Make sure shared buffer contents are not
+ cached
+
+After updating the shared buffer, it is required to flush the cache
+to ensure that the secure world sees expected the shared buffer
+contents.
+
+The MM communication shared buffer is configured in device region of optee
+which has cache disabled. So we need to invalidate the cache every time we
+update the buffer on uboot otherwise the secure world does not see the
+accurate values.
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+%% original patch: 0027-Make-sure-shared-buffer-contents-are-not-cached.patch
+
+%% original patch: 0027-Make-sure-shared-buffer-contents-are-not-cached.patch
+---
+ lib/efi_loader/efi_variable_tee.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
+index b363ec92bf..9375aa6a63 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -331,6 +331,11 @@ static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ulong comm_
+ 	virt_shared_buf = (void *)map_sysmem((phys_addr_t)FFA_SHARED_MM_BUFFER_ADDR, 0);
+ 	efi_memcpy_runtime(virt_shared_buf, comm_buf, tx_data_size);
+ 
++	/* The secure world has cache disabled for device region which we use for shared buffer
++	So, the secure world reads the data from DDR. Let's flush the cache so the DDR is
++	updated with the latest data */
++	invalidate_dcache_all();
++
+ 	/* Announce there is data in the shared buffer */
+ 
+ 	ffa_ret = ffa_notify_mm_sp();
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 1d78c0c..8df5641 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -36,6 +36,9 @@ SRC_URI:append:corstone1000 = " \
       file://0022-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch \
       file://0023-efi-corstone1000-introduce-EFI-capsule-update.patch \
       file://0024-corstone1000-adjust-the-environment-and-heap-sizes.patch \
+      file://0025-corstone1000-Update-FFA-shared-buffer-address.patch \
+      file://0026-corstone1000-Disable-set-get-of-NV-variables.patch \
+      file://0027-corstone1000-Make-sure-shared-buffer-contents-are-no.patch \
      "
 
 #
-- 
2.17.1


