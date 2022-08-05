Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C0FC25B08
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 14:10:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7226.1659708606838918401
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Aug 2022 07:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB92F113E;
	Fri,  5 Aug 2022 07:10:06 -0700 (PDT)
Received: from e126345.arm.com (unknown [10.57.13.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76E7F3F73B;
	Fri,  5 Aug 2022 07:10:04 -0700 (PDT)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 2/2] arm-bsp/u-boot: drop EFI GetVariable() workarounds
 patches
Date: Fri,  5 Aug 2022 15:09:50 +0100
Message-Id: <20220805140950.26430-3-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220805140950.26430-1-gowtham.sureshkumar@arm.com>
References: <20220805140950.26430-1-gowtham.sureshkumar@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Aug 2022 14:10:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3649

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The dropped u-boot patches are not required as the bug is
from the SMM Gateway SP. A patch for the secure partitions
has been added to fix the SMM Gateway behaviour. Patch
0048-Fix-UEFI-get_variable-with-small-buffer.patch has been
added in commit "arm-bsp/secure-partitions: fix SMM gateway
bug for EFI GetVariable()".

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...-error-code-when-rx-buffer-is-larger.patch | 31 -----------------
 ...tch => 0019-Use-correct-buffer-size.patch} |  0
 ...te-ESRT-table-if-EFI_ESRT-config-op.patch} |  0
 ...e-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch | 30 ----------------
 ...add-get_image_info-for-corstone1000.patch} |  0
 ...ootcomplete-message-to-secure-encla.patch} |  0
 ...ll-pointer-exception-with-get_image.patch} |  0
 ...4-Comment-mm_communicate-failure-log.patch | 34 -------------------
 ...24-arm-corstone1000-add-mmc-for-fvp.patch} |  0
 .../recipes-bsp/u-boot/u-boot_%.bbappend      | 15 ++++----
 10 files changed, 6 insertions(+), 104 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0020-Use-correct-buffer-size.patch => 0019-Use-correct-buffer-size.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch => 0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0023-efi_firmware-add-get_image_info-for-corstone1000.patch => 0021-efi_firmware-add-get_image_info-for-corstone1000.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch => 0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0026-efi_loader-fix-null-pointer-exception-with-get_image.patch => 0023-efi_loader-fix-null-pointer-exception-with-get_image.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0027-arm-corstone1000-add-mmc-for-fvp.patch => 0024-arm-corstone1000-add-mmc-for-fvp.patch} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch
deleted file mode 100644
index 21a89a40..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Return-proper-error-code-when-rx-buffer-is-larger.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7db27eeaba0fd5ddb1e49977bb7e342a1980aa3d Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Sun, 12 Dec 2021 17:51:17 +0000
-Subject: [PATCH 19/27] Return proper error code when rx buffer is larger
-
-ffa_mm_communicate should return EFI_BUFFER_TOO_SMALL when
-the buffer received from the secure world is larger than the
-comm buffer as this value is forwarded by mm_communicate.
-
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- lib/efi_loader/efi_variable_tee.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index b6be2b54a030..38655a9dbb7c 100644
---- a/lib/efi_loader/efi_variable_tee.c
-+++ b/lib/efi_loader/efi_variable_tee.c
-@@ -358,7 +358,7 @@ static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ulong comm_
- 
- 		if (rx_data_size > comm_buf_size) {
- 			unmap_sysmem(virt_shared_buf);
--			return EFI_OUT_OF_RESOURCES;
-+			return EFI_BUFFER_TOO_SMALL;
- 		}
- 
- 		efi_memcpy_runtime(comm_buf, virt_shared_buf, rx_data_size);
--- 
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Use-correct-buffer-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Use-correct-buffer-size.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Use-correct-buffer-size.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Use-correct-buffer-size.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
deleted file mode 100644
index c7ac38f7..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b81214dea7056c3877aa9eb775557dc4702660ec Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Sun, 12 Dec 2021 17:58:08 +0000
-Subject: [PATCH 21/27] Update comm_buf when EFI_BUFFER_TOO_SMALL
-
-When the received buffer is larger than the comm buffer,
-the contents of the shared buffer which can fit in the
-comm buffer should be read before returning.
-
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- lib/efi_loader/efi_variable_tee.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index 38655a9dbb7c..67743d1f8fce 100644
---- a/lib/efi_loader/efi_variable_tee.c
-+++ b/lib/efi_loader/efi_variable_tee.c
-@@ -357,6 +357,7 @@ static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ulong comm_
- 			sizeof(size_t);
- 
- 		if (rx_data_size > comm_buf_size) {
-+			efi_memcpy_runtime(comm_buf, virt_shared_buf, comm_buf_size);
- 			unmap_sysmem(virt_shared_buf);
- 			return EFI_BUFFER_TOO_SMALL;
- 		}
--- 
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi_firmware-add-get_image_info-for-corstone1000.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmware-add-get_image_info-for-corstone1000.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi_firmware-add-get_image_info-for-corstone1000.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-efi_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_loader-fix-null-pointer-exception-with-get_image.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-efi_loader-fix-null-pointer-exception-with-get_image.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_loader-fix-null-pointer-exception-with-get_image.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch
deleted file mode 100644
index c6a1aed2..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-Comment-mm_communicate-failure-log.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c0c6e4c1166c4868afc36649b9ed98081a6966e1 Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Fri, 24 Dec 2021 14:22:52 +0000
-Subject: [PATCH 24/27] Comment mm_communicate failure log
-
-When a getVariable() call is made with data size set to 0,
-mm_communicate should return EFI_BUFFER_TOO_SMALL. This is
-an expected behavior. There should not be any failure logs
-in this case. So the error log is commented here.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- lib/efi_loader/efi_variable_tee.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index 67743d1f8fce..a34989efac83 100644
---- a/lib/efi_loader/efi_variable_tee.c
-+++ b/lib/efi_loader/efi_variable_tee.c
-@@ -411,7 +411,10 @@ static efi_status_t __efi_runtime mm_communicate(u8 *comm_buf, efi_uintn_t dsize
- 	ret = ffa_mm_communicate(comm_buf, dsize);
- 	#endif
- 	if (ret != EFI_SUCCESS) {
--		log_err("%s failed!\n", __func__);
-+		/* mm_communicate failure is logged even when getVariable() is called
-+		 * with data size set to 0. This is not expected so logging is commented.
-+		*/
-+		//log_err("%s failed!\n", __func__);
- 		return ret;
- 	}
- 
--- 
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-arm-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corstone1000-add-mmc-for-fvp.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-arm-corstone1000-add-mmc-for-fvp.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corstone1000-add-mmc-for-fvp.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index e254d41b..0b965a1c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -36,15 +36,12 @@ SRC_URI:append:corstone1000 = " \
         file://0016-efi_boottime-corstone1000-pass-interface-id-and-kern.patch \
         file://0017-efi_loader-corstone1000-remove-guid-check-from-corst.patch \
         file://0018-arm_ffa-removing-the-cast-when-using-binary-OR-on-FI.patch \
-        file://0019-Return-proper-error-code-when-rx-buffer-is-larger.patch \
-        file://0020-Use-correct-buffer-size.patch \
-        file://0021-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch \
-        file://0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch \
-        file://0023-efi_firmware-add-get_image_info-for-corstone1000.patch \
-        file://0024-Comment-mm_communicate-failure-log.patch \
-        file://0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch \
-        file://0026-efi_loader-fix-null-pointer-exception-with-get_image.patch \
-        file://0027-arm-corstone1000-add-mmc-for-fvp.patch \
+        file://0019-Use-correct-buffer-size.patch \
+        file://0020-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch \
+        file://0021-efi_firmware-add-get_image_info-for-corstone1000.patch \
+        file://0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch \
+        file://0023-efi_loader-fix-null-pointer-exception-with-get_image.patch \
+        file://0024-arm-corstone1000-add-mmc-for-fvp.patch \
       "
 
 #
-- 
2.17.1


