Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27D7C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:34:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13498.1639413280672549242
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E86D6D6E;
	Mon, 13 Dec 2021 08:34:39 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9379B3F73B;
	Mon, 13 Dec 2021 08:34:38 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 1/4] arm-bsp/u-boot: corstone1000: passing interface
 ID and event ID in register w4
Date: Mon, 13 Dec 2021 16:34:26 +0000
Message-Id: <20211213163429.2499-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213163429.2499-1-abdellatif.elkhlifi@arm.com>
References: <20211213163429.2499-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:34:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2660

From: Vishnu Banavath <vishnu.banavath@arm.com>

Changing where to pass the SE Proxy interface and event IDs.

Now they are passed to the SE Proxy in register w4.

The events involved are kernel started and buffer ready
events.

Change-Id: Ib60897e9f01cd87b9923892198f8868e02cc830d
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...interface-and-buffer-event-ids-in-w4.patch | 77 +++++++++++++++++++
 ...interface-and-kernel-event-ids-in-w4.patch | 59 ++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  2 +
 3 files changed, 138 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch
new file mode 100644
index 0000000..80982fa
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch
@@ -0,0 +1,77 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 44e0b661c90d83b64b38023ebc27a836ae687b6a Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 10 Dec 2021 20:03:35 +0000
+Subject: [PATCH 1/2] efi_capsule: corstone1000: pass interface id and buffer
+ event id using register w4
+
+Initially the interface/event IDs are passed to the SP using register
+w3 and w5.
+
+Now the SE proxy SP requires this arguments to be in register w4.
+
+This change is to pass interface ID(31:16) and event ID(15:0)
+to SE proxy SP to trigger an event to secure enclave about
+firmware update.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ include/configs/corstone1000.h |  8 ++++++++
+ lib/efi_loader/efi_capsule.c   | 11 +++++++----
+ 2 files changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index 31fc0cb29e..4a78e1a3c5 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -24,6 +24,14 @@
+ #define CORSTONE1000_BUFFER_READY_EVT	(0x1)
+ #define CORSTONE1000_KERNEL_STARTED_EVT	(0x2)
+ 
++#define PREP_SEPROXY_SVC_ID_MASK		GENMASK(31, 16)
++#define PREP_SEPROXY_SVC_ID(x)		\
++			(FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (x)))
++
++#define PREP_SEPROXY_EVT_MASK		GENMASK(15, 0)
++#define PREP_SEPROXY_EVT(x)		\
++			(FIELD_PREP(PREP_SEPROXY_EVT_MASK, (x)))
++
+ /* Size in 4KB pages of the EFI capsule buffer */
+ #define CORSTONE1000_CAPSULE_BUFFER_SIZE		(8192) /* 32 MB */
+ 
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index 089eba0fd0..6917bb4925 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -21,6 +21,8 @@
+ #ifdef CONFIG_TARGET_CORSTONE1000
+ #include <arm_ffa_helper.h>
+ #include <cpu_func.h>
++#include <linux/bitfield.h>
++#include <linux/bitops.h>
+ 
+ void *__efi_runtime_data corstone1000_capsule_buf; /* capsule shared buffer virtual address */
+ efi_guid_t corstone1000_capsule_guid = EFI_CORSTONE1000_CAPSULE_ID_GUID;
+@@ -495,11 +497,12 @@ static int __efi_runtime efi_corstone1000_buffer_ready_event(u32 capsule_image_s
+ 	func_data.data0 = &part_id;
+ 
+ 	/*
+-	 * setting the buffer ready event arguments
++	 * setting the buffer ready event arguments in register w4:
++	 * - capsule update interface ID (31:16)
++	 * - the buffer ready event ID (15:0)
+ 	 */
+-	msg.a3 = CORSTONE1000_SEPROXY_UPDATE_SVC_ID;
+-	msg.a4 = capsule_image_size;
+-	msg.a5 = CORSTONE1000_BUFFER_READY_EVT;
++	msg.a4 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
++		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT);
+ 
+ 	func_data.data1_size = sizeof(msg);
+ 	func_data.data1 = &msg;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch
new file mode 100644
index 0000000..3e3934c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch
@@ -0,0 +1,59 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 51600b4385ddd45ce480bdb58769205072ddadf2 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 10 Dec 2021 20:10:41 +0000
+Subject: [PATCH 2/2] efi_boottime: corstone1000: pass interface id and kernel
+ event id using register w4
+
+Initially the interface/event IDs are passed to the SP using register
+w3 and w5.
+
+Now the SE proxy SP requires this arguments to be in register w4.
+
+This change is to pass interface ID(31:16) and kernel started
+event ID(15:0) to SE proxy SP to trigger an event to
+secure enclave just before ExitbootService().
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ lib/efi_loader/efi_boottime.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime.c
+index be49030717..17cc692064 100644
+--- a/lib/efi_loader/efi_boottime.c
++++ b/lib/efi_loader/efi_boottime.c
+@@ -26,6 +26,11 @@
+ #include <arm_ffa_helper.h>
+ #endif
+ 
++#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
++#include <linux/bitfield.h>
++#include <linux/bitops.h>
++#endif
++
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+ /* Task priority level */
+@@ -2114,10 +2119,12 @@ static int efi_corstone1000_kernel_started_event(void)
+ 	func_data.data0 = &part_id;
+ 
+ 	/*
+-	 * setting the kernel started  event arguments
++	 * setting the kernel started  event arguments:
++	 * setting capsule update interface ID(31:16)
++	 * the kernel started event ID(15:0)
+ 	 */
+-	msg.a3 = CORSTONE1000_SEPROXY_UPDATE_SVC_ID;
+-	msg.a5 = CORSTONE1000_KERNEL_STARTED_EVT;
++	msg.a4 = PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) |
++	PREP_SEPROXY_EVT(CORSTONE1000_KERNEL_STARTED_EVT);
+ 
+ 	func_data.data1_size = sizeof(msg);
+ 	func_data.data1 = &msg;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index ae34e58..81b5697 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -47,6 +47,8 @@ SRC_URI:append:corstone1000 = " \
       file://0033-corstone1000-dts-setting-the-boot-console-output.patch \
       file://0034-corstone1000-dts-remove-the-use-of-fdt_addr_r.patch \
       file://0035-Fix-GetVariable-to-handle-0-data-size.patch \
+      file://0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch \
+      file://0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch \
       "
 
 #
-- 
2.17.1


