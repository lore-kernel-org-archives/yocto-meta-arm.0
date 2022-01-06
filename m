Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA2EC433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 13:47:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8645.1641476845203068341
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 05:47:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C50713D5;
	Thu,  6 Jan 2022 05:47:18 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D50D53F5A1;
	Thu,  6 Jan 2022 05:47:17 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm-bsp/uboot: send bootcomplete event to secure enclave
Date: Thu,  6 Jan 2022 13:47:10 +0000
Message-Id: <20220106134710.10029-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220106134710.10029-1-xueliang.zhong@arm.com>
References: <20220106134710.10029-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Jan 2022 13:47:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2805

From: Vishnu Banavath <vishnu.banavath@arm.com>

On corstone1000 platform, Secure Enclave will be expecting
an event from uboot when it performs capsule update. Previously,
an event is sent at exitbootservice level. This will create a problem
when user wants to interrupt at UEFI shell, hence, it is required
to send an uboot efi initialized event at efi sub-system initialization
stage.

Change-Id: I7d16e184675d537d790365e1b03a414ac802694a
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...bootcomplete-message-to-secure-encla.patch | 186 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
 2 files changed, 187 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-efi_loader-send-bootcomplete-message-to-secure-encla.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-efi_loader-send-bootcomplete-message-to-secure-encla.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-efi_loader-send-bootcomplete-message-to-secure-encla.patch
new file mode 100644
index 0000000..dcd0b29
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0051-efi_loader-send-bootcomplete-message-to-secure-encla.patch
@@ -0,0 +1,186 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From b315c9e23e38341cd105802e85f606b64e0f0449 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Wed, 5 Jan 2022 17:56:09 +0000
+Subject: [PATCH] efi_loader: send bootcomplete message to secure enclave
+
+On corstone1000 platform, Secure Enclave will be expecting
+an event from uboot when it performs capsule update. Previously,
+an event is sent at exitbootservice level. This will create a problem
+when user wants to interrupt at UEFI shell, hence, it is required
+to send an uboot efi initialized event at efi sub-system initialization
+stage.
+
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index 4a78e1a3c5..c4a1146b52 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -22,7 +22,7 @@
+ 
+ /* Notification events used with SE Proxy update service */
+ #define CORSTONE1000_BUFFER_READY_EVT	(0x1)
+-#define CORSTONE1000_KERNEL_STARTED_EVT	(0x2)
++#define CORSTONE1000_UBOOT_EFI_STARTED_EVT	(0x2)
+ 
+ #define PREP_SEPROXY_SVC_ID_MASK		GENMASK(31, 16)
+ #define PREP_SEPROXY_SVC_ID(x)		\
+diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
+index 17cc692064..154b69e514 100644
+--- a/lib/efi_loader/efi_boottime.c
++++ b/lib/efi_loader/efi_boottime.c
+@@ -2094,46 +2094,6 @@ static void efi_exit_caches(void)
+ #endif
+ }
+ 
+-#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
+-/**
+- * efi_corstone1000_kernel_started_event - notifies SE Proxy FW update service
+- *
+- * This function notifies the SE Proxy update service that the kernel has already started
+- *
+- * Return:
+- *
+- * 0: on success, otherwise failure
+- */
+-static int efi_corstone1000_kernel_started_event(void)
+-{
+-	struct ffa_interface_data func_data = {0};
+-	struct ffa_send_direct_data msg = {0};
+-	u16 part_id = CORSTONE1000_SEPROXY_PART_ID;
+-
+-	log_debug("[%s]\n", __func__);
+-
+-	/*
+-	 * telling the driver which partition to use
+-	 */
+-	func_data.data0_size = sizeof(part_id);
+-	func_data.data0 = &part_id;
+-
+-	/*
+-	 * setting the kernel started  event arguments:
+-	 * setting capsule update interface ID(31:16)
+-	 * the kernel started event ID(15:0)
+-	 */
+-	msg.a4 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
+-	PREP_SEPROXY_EVT(CORSTONE1000_KERNEL_STARTED_EVT);
+-
+-	func_data.data1_size = sizeof(msg);
+-	func_data.data1 = &msg;
+-
+-	return ffa_helper_msg_send_direct_req(&func_data);
+-}
+-
+-#endif
+-
+ /**
+  * efi_exit_boot_services() - stop all boot services
+  * @image_handle: handle of the loaded image
+@@ -2239,15 +2199,6 @@ static efi_status_t EFIAPI efi_exit_boot_services(efi_handle_t image_handle,
+ 	/* Recalculate CRC32 */
+ 	efi_update_table_header_crc32(&systab.hdr);
+ 
+-#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
+-	/* Notifying SE Proxy FW update service */
+-	ffa_ret = efi_corstone1000_kernel_started_event();
+-	if (ffa_ret)
+-		debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update service\n");
+-	else
+-		debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n");
+-#endif
+-
+ 	/* Give the payload some time to boot */
+ 	efi_set_watchdog(0);
+ 	WATCHDOG_RESET();
+diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
+index 85fb5254eb..a7f7598eab 100644
+--- a/lib/efi_loader/efi_firmware.c
++++ b/lib/efi_loader/efi_firmware.c
+@@ -353,7 +353,7 @@ static efi_status_t efi_corstone1000_img_info_get (
+ 		*package_version_name = NULL; /* not supported */
+ 
+ 	if(image_info == NULL) {
+-		log_warning("image_info is null\n");
++		log_info("image_info is null\n");
+ 		return EFI_BUFFER_TOO_SMALL;
+ 	}
+ 
+diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
+index 9e3399a28c..25524fafe4 100644
+--- a/lib/efi_loader/efi_setup.c
++++ b/lib/efi_loader/efi_setup.c
+@@ -17,6 +17,9 @@
+ efi_status_t efi_obj_list_initialized = OBJ_LIST_NOT_INITIALIZED;
+ 
+ #if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
++#include <linux/bitfield.h>
++#include <linux/bitops.h>
++#include <arm_ffa_helper.h>
+ /**
+  * efi_corstone1000_alloc_capsule_shared_buf - allocate capsule shared buffer
+  */
+@@ -126,6 +129,44 @@ static efi_status_t efi_init_secure_boot(void)
+ }
+ #endif /* CONFIG_EFI_SECURE_BOOT */
+ 
++#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
++/**
++ * efi_corstone1000_uboot-efi_started_event - notifies SE Proxy FW update service
++ *
++ * This function notifies the SE Proxy update service that uboot efi has already started
++ *
++ * Return:
++ *
++ * 0: on success, otherwise failure
++ * */
++static int efi_corstone1000_uboot_efi_started_event(void)
++{
++	struct ffa_interface_data func_data = {0};
++	struct ffa_send_direct_data msg = {0};
++	u16 part_id = CORSTONE1000_SEPROXY_PART_ID;
++
++	log_debug("[%s]\n", __func__);
++
++	/*
++	 * telling the driver which partition to use
++	 */
++	func_data.data0_size = sizeof(part_id);
++	func_data.data0 = &part_id;
++	/*
++	 * setting the uboot efi subsystem started  event arguments:
++	 * setting capsule update interface ID(31:16)
++	 * the uboot efi subsystem started event ID(15:0)
++	 */
++	msg.a4 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
++			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT);
++
++	func_data.data1_size = sizeof(msg);
++	func_data.data1 = &msg;
++
++	return ffa_helper_msg_send_direct_req(&func_data);
++}
++#endif
++
+ /**
+  * efi_init_capsule - initialize capsule update state
+  *
+@@ -134,8 +175,15 @@ static efi_status_t efi_init_secure_boot(void)
+ static efi_status_t efi_init_capsule(void)
+ {
+ 	efi_status_t ret = EFI_SUCCESS;
++	int ffa_ret;
+ 
+ #if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
++	ffa_ret = efi_corstone1000_uboot_efi_started_event();
++	if (ffa_ret)
++		debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update service\n");
++	else
++		debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n");
++
+ 	ret = efi_corstone1000_alloc_capsule_shared_buf();
+ 	if (ret != EFI_SUCCESS) {
+ 		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n");
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 7762cb6..08aacf6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -60,6 +60,7 @@ SRC_URI:append:corstone1000 = " \
       file://0048-corstone1000-enable-ethernet-device.patch \
       file://0049-efi_loader-Fix-loaded-image-alignment.patch \
       file://0050-Comment-mm_communicate-failure-log.patch \
+      file://0051-efi_loader-send-bootcomplete-message-to-secure-encla.patch \
       "
 
 #
-- 
2.17.1


