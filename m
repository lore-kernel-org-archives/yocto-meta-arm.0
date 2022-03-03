Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FCDC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 15:34:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12204.1646321675255921128
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 07:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 211811424;
	Thu,  3 Mar 2022 07:34:34 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF1A13F66F;
	Thu,  3 Mar 2022 07:34:33 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Steve Capper <steve.capper@arm.com>
Subject: [PATCH] arm-bsp/firmware-image-juno: update offset addresses for NOR
 flash images
Date: Thu,  3 Mar 2022 10:34:26 -0500
Message-Id: <20220303153426.10088-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 15:34:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3099

From: Steve Capper <steve.capper@arm.com>

This is to allow a larger kernel image size.

Suggested-by: Deepak Pandey <deepak.pandey@arm.com>
Signed-off-by: Steve Capper <steve.capper@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/images/firmware-image-juno/images-r0.txt  | 8 ++++----
 .../recipes-bsp/images/firmware-image-juno/images-r1.txt  | 8 ++++----
 .../recipes-bsp/images/firmware-image-juno/images-r2.txt  | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
index f6ac533..3b36ed1 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
@@ -23,14 +23,14 @@ NOR2LOAD: 00000000               ;Image Load Address
 NOR2ENTRY: 00000000              ;Image Entry Point
 
 NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02900000          ;Image Flash Address
+NOR3ADDRESS: 0x03000000          ;Image Flash Address
 NOR3FILE: \SOFTWARE\juno.dtb     ;Image File Name
 NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
 NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
 
 NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x029C0000          ;Image Flash Address
+NOR4ADDRESS: 0x030C0000          ;Image Flash Address
 NOR4FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
 NOR4LOAD: 00000000               ;Image Load Address
 NOR4ENTRY: 00000000              ;Image Entry Point
@@ -56,13 +56,13 @@ NOR7LOAD: 00000000               ;Image Load Address
 NOR7ENTRY: 00000000              ;Image Entry Point
 
 NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x02A00000          ;Image Flash Address
+NOR8ADDRESS: 0x03100000          ;Image Flash Address
 NOR8FILE: \SOFTWARE\selftest     ;Image File Name
 NOR8LOAD: 00000000               ;Image Load Address
 NOR8ENTRY: 00000000              ;Image Entry Point
 
 NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02A80000          ;Image Flash Address
+NOR9ADDRESS: 0x03180000          ;Image Flash Address
 NOR9NAME: uEnv.txt
 NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
 NOR9LOAD: 00000000               ;Image Load Address
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
index a6291da..5db13af 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
@@ -23,14 +23,14 @@ NOR2LOAD: 00000000               ;Image Load Address
 NOR2ENTRY: 00000000              ;Image Entry Point
 
 NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02900000          ;Image Flash Address
+NOR3ADDRESS: 0x03000000          ;Image Flash Address
 NOR3FILE: \SOFTWARE\juno-r1.dtb  ;Image File Name
 NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
 NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
 
 NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x029C0000          ;Image Flash Address
+NOR4ADDRESS: 0x030C0000          ;Image Flash Address
 NOR4FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
 NOR4LOAD: 00000000               ;Image Load Address
 NOR4ENTRY: 00000000              ;Image Entry Point
@@ -56,13 +56,13 @@ NOR7LOAD: 00000000               ;Image Load Address
 NOR7ENTRY: 00000000              ;Image Entry Point
 
 NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x02A00000          ;Image Flash Address
+NOR8ADDRESS: 0x03100000          ;Image Flash Address
 NOR8FILE: \SOFTWARE\selftest     ;Image File Name
 NOR8LOAD: 00000000               ;Image Load Address
 NOR8ENTRY: 00000000              ;Image Entry Point
 
 NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02A80000          ;Image Flash Address
+NOR9ADDRESS: 0x03180000          ;Image Flash Address
 NOR9NAME: uEnv.txt
 NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
 NOR9LOAD: 00000000               ;Image Load Address
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
index 16a6a5f..7c499bf 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
@@ -23,14 +23,14 @@ NOR2LOAD: 00000000               ;Image Load Address
 NOR2ENTRY: 00000000              ;Image Entry Point
 
 NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02900000          ;Image Flash Address
+NOR3ADDRESS: 0x03000000          ;Image Flash Address
 NOR3FILE: \SOFTWARE\juno-r2.dtb  ;Image File Name
 NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
 NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
 
 NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x029C0000          ;Image Flash Address
+NOR4ADDRESS: 0x030C0000          ;Image Flash Address
 NOR4FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
 NOR4LOAD: 00000000               ;Image Load Address
 NOR4ENTRY: 00000000              ;Image Entry Point
@@ -56,13 +56,13 @@ NOR7LOAD: 00000000               ;Image Load Address
 NOR7ENTRY: 00000000              ;Image Entry Point
 
 NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x02A00000          ;Image Flash Address
+NOR8ADDRESS: 0x03100000          ;Image Flash Address
 NOR8FILE: \SOFTWARE\selftest     ;Image File Name
 NOR8LOAD: 00000000               ;Image Load Address
 NOR8ENTRY: 00000000              ;Image Entry Point
 
 NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02A80000          ;Image Flash Address
+NOR9ADDRESS: 0x03180000          ;Image Flash Address
 NOR9NAME: uEnv.txt
 NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
 NOR9LOAD: 00000000               ;Image Load Address
-- 
2.17.1


