Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA012C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:12:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.24358.1639480372651592602
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BF04106F;
	Tue, 14 Dec 2021 03:12:52 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FF4E3F5A1;
	Tue, 14 Dec 2021 03:12:50 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 2/2] arm-bsp/u-boot: corstone1000: Fix efi debug issue
Date: Tue, 14 Dec 2021 11:12:40 +0000
Message-Id: <20211214111240.11186-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214111240.11186-1-abdellatif.elkhlifi@arm.com>
References: <20211214111240.11186-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:12:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2700

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This patch will fix the ffa mm communicate function behavior as
expected by efi_get_var() and also fix the com buffer size used by
u-boot.

Change-Id: I8ce28a2e51b8f52856d81ea6e3c1e2e72cfaa362
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...-error-code-when-rx-buffer-is-larger.patch | 33 +++++++++++++++
 .../0041-Use-correct-buffer-size.patch        | 42 +++++++++++++++++++
 ...e-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch | 32 ++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  3 ++
 4 files changed, 110 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-Return-proper-error-code-when-rx-buffer-is-larger.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-Use-correct-buffer-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-Return-proper-error-code-when-rx-buffer-is-larger.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-Return-proper-error-code-when-rx-buffer-is-larger.patch
new file mode 100644
index 0000000..a733d20
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-Return-proper-error-code-when-rx-buffer-is-larger.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 048d07817e1508022dc9a623ae9410e8f142fd46 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Sun, 12 Dec 2021 17:51:17 +0000
+Subject: [PATCH 1/3] Return proper error code when rx buffer is larger
+
+ffa_mm_communicate should return EFI_BUFFER_TOO_SMALL when
+the buffer received from the secure world is larger than the
+comm buffer as this value is forwarded by mm_communicate.
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+---
+ lib/efi_loader/efi_variable_tee.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
+index 3ffc35ea1e..ec68994e0f 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -354,7 +354,7 @@ static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ulong comm_
+ 
+ 		if (rx_data_size > comm_buf_size) {
+ 			unmap_sysmem(virt_shared_buf);
+-			return EFI_OUT_OF_RESOURCES;
++			return EFI_BUFFER_TOO_SMALL;
+ 		}
+ 
+ 		efi_memcpy_runtime(comm_buf, virt_shared_buf, rx_data_size);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-Use-correct-buffer-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-Use-correct-buffer-size.patch
new file mode 100644
index 0000000..f4d8875
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-Use-correct-buffer-size.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From d2ae8c021185ac1d067c5b78f21467bda4b7591b Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Mon, 13 Dec 2021 15:25:23 +0000
+Subject: [PATCH] Use correct buffer size
+
+The comm buffer created has additional 4 bytes length which
+needs to be trimmed. This change will reduce the size of the
+comm buffer to what is expected.
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+---
+ include/mm_communication.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/mm_communication.h b/include/mm_communication.h
+index e65fbde60d..bb99190956 100644
+--- a/include/mm_communication.h
++++ b/include/mm_communication.h
+@@ -123,7 +123,7 @@ struct __packed efi_mm_communicate_header {
+  *
+  * Defined in EDK2 as SMM_VARIABLE_COMMUNICATE_HEADER.
+  */
+-struct smm_variable_communicate_header {
++struct __packed smm_variable_communicate_header {
+ 	efi_uintn_t  function;
+ 	efi_status_t ret_status;
+ 	u8           data[];
+@@ -145,7 +145,7 @@ struct smm_variable_communicate_header {
+  * Defined in EDK2 as SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE.
+  *
+  */
+-struct smm_variable_access {
++struct __packed smm_variable_access {
+ 	efi_guid_t  guid;
+ 	efi_uintn_t data_size;
+ 	efi_uintn_t name_size;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
new file mode 100644
index 0000000..dee9b88
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 7bd96f322f42ae577cd201465f618849605c1e85 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Sun, 12 Dec 2021 17:58:08 +0000
+Subject: [PATCH 3/3] Update comm_buf when EFI_BUFFER_TOO_SMALL
+
+When the received buffer is larger than the comm buffer,
+the contents of the shared buffer which can fit in the
+comm buffer should be read before returning.
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+---
+ lib/efi_loader/efi_variable_tee.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
+index 1d7a033e98..c948eed491 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -355,6 +355,7 @@ static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ulong comm_
+ 			sizeof(size_t);
+ 
+ 		if (rx_data_size > comm_buf_size) {
++			efi_memcpy_runtime(comm_buf, virt_shared_buf, comm_buf_size);
+ 			unmap_sysmem(virt_shared_buf);
+ 			return EFI_BUFFER_TOO_SMALL;
+ 		}
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 77c0904..9b9a4ce 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -49,6 +49,9 @@ SRC_URI:append:corstone1000 = " \
       file://0037-efi_loader-remove-guid-check-from-corstone1000-confi.patch \
       file://0038-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch \
       file://0039-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch \
+      file://0040-Return-proper-error-code-when-rx-buffer-is-larger.patch \
+      file://0041-Use-correct-buffer-size.patch \
+      file://0042-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch \
       "
 
 #
-- 
2.17.1


