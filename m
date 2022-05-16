Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C794C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 14:19:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7834.1652797153306474990
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 07:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7328E1042
	for <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 07:19:12 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 578493F718
	for <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 07:19:12 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] sbsa-acs: fix patch not applying issue
Date: Mon, 16 May 2022 19:11:11 -0400
Message-Id: <20220516231111.18039-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 14:19:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3418

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../0001-BaseTools-fix-gcc12-warning-1.patch  | 32 ++++++-------
 .../0001-BaseTools-fix-gcc12-warning.patch    | 45 +++++++++++--------
 2 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1.patch
index 565ba111..ba41cb23 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1.patch
@@ -1,4 +1,4 @@
-From b0a0b7b605aeb8106e7b50d1efeb746f401498cc Mon Sep 17 00:00:00 2001
+From 85021f8cf22d1bd4114803c6c610dea5ef0059f1 Mon Sep 17 00:00:00 2001
 From: Gerd Hoffmann <kraxel@redhat.com>
 Date: Thu, 24 Mar 2022 20:04:35 +0800
 Subject: [PATCH] BaseTools: fix gcc12 warning
@@ -32,20 +32,20 @@ index 4e9b499f8d..4b9f5fa692 100644
 --- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
 +++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
 @@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, BoolInt reInit,
- 
-   nowPos64 = p->nowPos64;
-   RangeEnc_Init(&p->rc);
--  p->rc.outStream = &outStream.vt;
- 
-   if (desiredPackSize == 0)
-     return SZ_ERROR_OUTPUT_EOF;
- 
-+  p->rc.outStream = &outStream.vt;
-   res = LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);
-+  p->rc.outStream = NULL;
- 
-   *unpackSize = (UInt32)(p->nowPos64 - nowPos64);
-   *destLen -= outStream.rem;
+ 
+   nowPos64 = p->nowPos64;
+   RangeEnc_Init(&p->rc);
+-  p->rc.outStream = &outStream.vt;
+ 
+   if (desiredPackSize == 0)
+     return SZ_ERROR_OUTPUT_EOF;
+ 
++  p->rc.outStream = &outStream.vt;
+   res = LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);
++  p->rc.outStream = NULL;
+ 
+   *unpackSize = (UInt32)(p->nowPos64 - nowPos64);
+   *destLen -= outStream.rem;
 -- 
-2.36.1
+2.30.2
 
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.patch
index f2142de2..6c2dc3bc 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.patch
@@ -1,4 +1,4 @@
-From 2435c17e56652479315853cec5b91fb0ea0911a3 Mon Sep 17 00:00:00 2001
+From 7b005f344e533cd913c3ca05b266f9872df886d1 Mon Sep 17 00:00:00 2001
 From: Gerd Hoffmann <kraxel@redhat.com>
 Date: Thu, 24 Mar 2022 20:04:34 +0800
 Subject: [PATCH] BaseTools: fix gcc12 warning
@@ -18,25 +18,32 @@ Reviewed-by: Bob Feng <bob.c.feng@intel.com>
  BaseTools/Source/C/GenSec/GenSec.c | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/GenFfs/GenFfs.c
+index 949025c333..d78d62ab36 100644
 --- a/BaseTools/Source/C/GenFfs/GenFfs.c
 +++ b/BaseTools/Source/C/GenFfs/GenFfs.c
-@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT3
-   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
-   if (PeFileBuffer == NULL) {
-     fclose (InFileHandle);
--    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
-+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
-     return EFI_OUT_OF_RESOURCES;
-   }
-   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
+@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
+   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
+   if (PeFileBuffer == NULL) {
+     fclose (InFileHandle);
+-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
+     return EFI_OUT_OF_RESOURCES;
+   }
+   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
+diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/GenSec/GenSec.c
+index d54a4f9e0a..b1d05367ec 100644
 --- a/BaseTools/Source/C/GenSec/GenSec.c
 +++ b/BaseTools/Source/C/GenSec/GenSec.c
-@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT3
-   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
-   if (PeFileBuffer == NULL) {
-     fclose (InFileHandle);
--    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
-+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
-     return EFI_OUT_OF_RESOURCES;
-   }
-   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
+@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
+   PeFileBuffer = (UINT8 *) malloc (PeFileSize);
+   if (PeFileBuffer == NULL) {
+     fclose (InFileHandle);
+-    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s", InFileHandle);
++    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s", InFile);
+     return EFI_OUT_OF_RESOURCES;
+   }
+   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);
+-- 
+2.30.2
+
-- 
2.17.1


