Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AFCC43217
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 18:53:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9632.1640112813796888261
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Dec 2021 10:53:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 107ACED1;
	Tue, 21 Dec 2021 10:53:33 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C8593F718;
	Tue, 21 Dec 2021 10:53:32 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 1/2] arm-bsp/secure-partitions: corstone1000: Change UID of
 variable index in SMM
Date: Tue, 21 Dec 2021 18:53:23 +0000
Message-Id: <20211221185324.3890-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221185324.3890-1-xueliang.zhong@arm.com>
References: <20211221185324.3890-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Dec 2021 18:53:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2752

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This patch fixes the os_indications setVariable() failure. The variable
index UID in SMM gateway which was 1 is changed in this patch. TFM has a
special usage for variable with UID 1, which makes it write once only.
This is not required for SMM variable index.

Change-Id: I50d60b87d3ef44ffd50e71ec4f20d31fdacf7acd
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...-Change-UID-of-variable-index-in-SMM.patch | 34 +++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0029-Change-UID-of-variable-index-in-SMM.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0029-Change-UID-of-variable-index-in-SMM.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0029-Change-UID-of-variable-index-in-SMM.patch
new file mode 100644
index 0000000..fe31f8f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0029-Change-UID-of-variable-index-in-SMM.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 451eac3ed36231380b8e3dd0ad76c1a3c010a375 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Mon, 20 Dec 2021 19:54:39 +0000
+Subject: [PATCH 1/3] Change UID of variable index in SMM
+
+This patch fixes the os_indications setVariable() failure. The variable
+index UID in SMM gateway which was 1 is changed in this patch. TFM has a
+special usage for variable with UID 1, which makes it write once only.
+This is not required for SMM variable index.
+
+%% original patch: 0029-Change-UID-of-variable-index-in-SMM.patch
+---
+ components/service/smm_variable/backend/uefi_variable_store.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
+index 6a90f46..1bb869a 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/smm_variable/backend/uefi_variable_store.c
+@@ -67,7 +67,7 @@ static efi_status_t check_name_terminator(
+ 	size_t name_size);
+ 
+ /* Private UID for storing the variable index */
+-#define VARIABLE_INDEX_STORAGE_UID			(1)
++#define VARIABLE_INDEX_STORAGE_UID			(0x787)
+ 
+ /* Default maximum variable size -
+  * may be overridden using uefi_variable_store_set_storage_limits()
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 9693430..55f5a27 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -39,6 +39,7 @@ SRC_URI:append = " \
                   file://0026-Add-logs-to-functions-in-SMM-gateway-SP.patch \
                   file://0027-Configure-storage-size.patch \
                   file://0028-Revert-Add-uefi-variable-append-write-support.patch \
+                  file://0029-Change-UID-of-variable-index-in-SMM.patch \
                   "
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
-- 
2.17.1


