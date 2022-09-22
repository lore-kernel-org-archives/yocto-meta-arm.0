Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620BEC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:57:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6730.1663851420545515941
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 05:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D2EC1595
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 05:57:06 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F2413F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 05:56:59 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/edk2-firmware: Work around clang issue
Date: Thu, 22 Sep 2022 08:56:53 -0400
Message-Id: <20220922125653.22079-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 12:57:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3809

A new update to clang is causing warnings (which are errors because edk2
was Werror by default).  The error is:
clang-15: error: '-x c' after last input file has no effect [-Werror,-Wunused-command-line-argument]

Work around it by disabling this specific error.  Also, use devtool to
update the patch.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/uefi/files/unaligned.patch    | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/files/unaligned.patch b/meta-arm/recipes-bsp/uefi/files/unaligned.patch
index fa13956f..783b7644 100644
--- a/meta-arm/recipes-bsp/uefi/files/unaligned.patch
+++ b/meta-arm/recipes-bsp/uefi/files/unaligned.patch
@@ -1,4 +1,8 @@
-Latest clang is causing build failures because -Werror is used:
+From 17f490101f51b03c1ffc7151cc35e9fbd42b6060 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 22 Feb 2022 10:38:13 +0000
+Subject: [PATCH] Latest clang is causing build failures because -Werror is
+ used
 
   edk2/MdeModulePkg/Include/Guid/ExtendedFirmwarePerformance.h:78:47:
   error: field Guid within 'FPDT_GUID_EVENT_RECORD' is less aligned than 'EFI_GUID'
@@ -11,11 +15,20 @@ This has been reported upstream[1] so until this is resolved, ignore the warning
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ BaseTools/Conf/tools_def.template | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.template
-index f2bb6247e8..ca2b449f0a 100755
+index 5ed19810b7..9b4f173519 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -2570 +2570 @@ DEFINE CLANG38_X64_TARGET           = -target x86_64-pc-linux-gnu
+@@ -2548,7 +2548,7 @@ DEFINE CLANG38_X64_PREFIX           = ENV(CLANG38_BIN)
+ DEFINE CLANG38_IA32_TARGET          = -target i686-pc-linux-gnu
+ DEFINE CLANG38_X64_TARGET           = -target x86_64-pc-linux-gnu
+ 
 -DEFINE CLANG38_WARNING_OVERRIDES    = -Wno-parentheses-equality -Wno-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option -Wno-unused-but-set-variable -Wno-unused-const-variable
-+DEFINE CLANG38_WARNING_OVERRIDES    = -Wno-parentheses-equality -Wno-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-error=unaligned-access
++DEFINE CLANG38_WARNING_OVERRIDES    = -Wno-parentheses-equality -Wno-tautological-compare -Wno-tautological-constant-out-of-range-compare -Wno-empty-body -Wno-unused-const-variable -Wno-varargs -Wno-unknown-warning-option -Wno-unused-but-set-variable -Wno-unused-const-variable -Wno-error=unaligned-access -Wno-unused-command-line-argument 
+ DEFINE CLANG38_ALL_CC_FLAGS         = DEF(GCC48_ALL_CC_FLAGS) DEF(CLANG38_WARNING_OVERRIDES) -fno-stack-protector -mms-bitfields -Wno-address -Wno-shift-negative-value -Wno-unknown-pragmas -Wno-incompatible-library-redeclaration -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -msoft-float -mno-implicit-float  -ftrap-function=undefined_behavior_has_been_optimized_away_by_clang -funsigned-char -fno-ms-extensions -Wno-null-dereference
+ 
+ ###########################
-- 
2.17.1


