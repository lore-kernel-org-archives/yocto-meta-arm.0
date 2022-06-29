Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56420C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 13:01:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11142.1656507707970171179
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jun 2022 06:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB87C152B
	for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jun 2022 06:01:47 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 538693F792
	for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jun 2022 06:01:47 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/edk2-firmware: devtool changes
Date: Wed, 29 Jun 2022 09:01:42 -0400
Message-Id: <20220629130142.20544-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Jun 2022 13:01:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3541

Make the changes necessary to allow for devtool to be used on edk2
sources.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   | 2 +-
 meta-arm/recipes-bsp/uefi/files/default.patch | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
index 21bc58dd..76f9d62c 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -18,7 +18,7 @@ SRC_URI = "\
     ${EDK2_SRC_URI};name=edk2;destsuffix=edk2;nobranch=1 \
     ${EDK2_PLATFORMS_SRC_URI};name=edk2-platforms;destsuffix=edk2/edk2-platforms;nobranch=1 \
     file://unaligned.patch \
-    file://default.patch \
+    file://default.patch;patchdir=edk2-platforms \
 "
 
 SRCREV_FORMAT         = "edk2_edk2-platforms"
diff --git a/meta-arm/recipes-bsp/uefi/files/default.patch b/meta-arm/recipes-bsp/uefi/files/default.patch
index 7c2ffc2b..fca232f0 100644
--- a/meta-arm/recipes-bsp/uefi/files/default.patch
+++ b/meta-arm/recipes-bsp/uefi/files/default.patch
@@ -16,8 +16,8 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
 
 diff --git a/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c b/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
 index d23739ad38..fba5e0ba30 100644
---- a/edk2-platforms/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
-+++ b/edk2-platforms/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
+--- a/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
++++ b/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
 @@ -136,1 +136,1 @@ ShellDynCmdRunAxfHandler (
 -  UINTN                       FileSize;
 +  UINTN                       FileSize = 0;
-- 
2.17.1


