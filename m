Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9218DCCA47A
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 17:15:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8861.1655226920054288136
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 10:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42441175A
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:19 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B6BBF3F800
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:18 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm-bsp/tc: Update to u-boot v2022.04
Date: Tue, 14 Jun 2022 13:15:10 -0400
Message-Id: <20220614171514.32495-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220614171514.32495-1-jon.mason@arm.com>
References: <20220614171514.32495-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 17:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3491

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/include/tc.inc                  | 2 +-
 .../0001-arm-total_compute-update-secure-dram-size.patch  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf/machine/include/tc.inc
index ed5ffa96..88eda556 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -6,7 +6,7 @@ MACHINEOVERRIDES =. "tc:"
 
 # Das U-boot
 UBOOT_MACHINE ?= "total_compute_defconfig"
-PREFERRED_VERSION_u-boot ?= "2022.01"
+PREFERRED_VERSION_u-boot ?= "2022.04"
 UBOOT_RD_LOADADDRESS = "0x88000000"
 UBOOT_RD_ENTRYPOINT = "0x88000000"
 UBOOT_LOADADDRESS = "0x80080000"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-total_compute-update-secure-dram-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-total_compute-update-secure-dram-size.patch
index 657af223..85b14b03 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-total_compute-update-secure-dram-size.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0001-arm-total_compute-update-secure-dram-size.patch
@@ -1,7 +1,7 @@
-From 5f10bd9b64c745084292a7094af2e4c3d14c1ac5 Mon Sep 17 00:00:00 2001
+From f7c24393604e45012447b16aaa95eb5e7224ba07 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Tue, 12 Apr 2022 12:43:49 +0100
-Subject: [PATCH 1/3] arm: total_compute: update secure dram size
+Subject: [PATCH] arm: total_compute: update secure dram size
 
 Update secure DRAM size as it is increased by 64MB for additional
 secure partitions.
@@ -14,10 +14,10 @@ Upstream-Status: Pending [Not submitted to upstream yet]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/include/configs/total_compute.h b/include/configs/total_compute.h
-index 933a145f99..66de8ae239 100644
+index 0324b1e1b217..62bdb4f6a3ae 100644
 --- a/include/configs/total_compute.h
 +++ b/include/configs/total_compute.h
-@@ -25,8 +25,8 @@
+@@ -23,8 +23,8 @@
  
  /* Physical Memory Map */
  #define PHYS_SDRAM_1		0x80000000
-- 
2.17.1


