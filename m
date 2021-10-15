Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67D0C4332F
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 14:40:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13057.1635259201836106408
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 07:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B23611063;
	Tue, 26 Oct 2021 07:40:00 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A29E3F73D;
	Tue, 26 Oct 2021 07:40:00 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 1/2] arm/edk2-firmware: upgrade to 202105
Date: Fri, 15 Oct 2021 12:34:44 -0400
Message-Id: <20211015163445.10695-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Oct 2021 14:40:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2302

From: Ross Burton <ross.burton@arm.com>

Change-Id: I3ea527d820f410a774ff5494c9a02c434913f550
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...re_202102.bbappend => edk2-firmware_%.bbappend} |  0
 .../n1sdp/Configuration-Manager-for-N1SDP.patch    |  8 ++++----
 meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb  |  4 ----
 meta-arm/recipes-bsp/uefi/edk2-firmware_202105.bb  |  4 ++++
 meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch     | 14 +++-----------
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb          |  2 +-
 6 files changed, 12 insertions(+), 20 deletions(-)
 rename meta-arm-bsp/recipes-bsp/uefi/{edk2-firmware_202102.bbappend => edk2-firmware_%.bbappend} (100%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202105.bb

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
rename to meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_%.bbappend
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration-Manager-for-N1SDP.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration-Manager-for-N1SDP.patch
index c5bc9a0..d74371e 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration-Manager-for-N1SDP.patch
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration-Manager-for-N1SDP.patch
@@ -4043,16 +4043,16 @@ diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1SdpPlat
 index 1b46eb2734..b59a563806 100644
 --- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
 +++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-@@ -22,6 +22,8 @@
-   BUILD_NUMBER                   = 1
+@@ -23,6 +23,8 @@
  
  !include Platform/ARM/VExpressPkg/ArmVExpress.dsc.inc
+ !include MdePkg/MdeLibs.dsc.inc
 +!include DynamicTablesPkg/DynamicTables.dsc.inc
 +!include Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManager.dsc.inc
  
  [LibraryClasses.common]
    ArmLib|ArmPkg/Library/ArmLib/ArmBaseLib.inf
-@@ -152,6 +154,9 @@
+@@ -153,6 +155,9 @@
    gArmPlatformTokenSpaceGuid.PcdCoreCount|2
    gArmPlatformTokenSpaceGuid.PcdClusterCount|2
  
@@ -4062,7 +4062,7 @@ index 1b46eb2734..b59a563806 100644
    # Runtime Variable storage
    gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvStoreReserved|0
    gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvModeEnable|TRUE
-@@ -211,6 +216,10 @@
+@@ -212,6 +217,10 @@
        BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
    }
  
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb
deleted file mode 100644
index 1352922..0000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-SRCREV_edk2           ?= "ef91b07388e1c0a50c604e5350eeda98428ccea6"
-SRCREV_edk2-platforms ?= "2620e05c6fade20ef5e1ba69280d09f9e2b3eff6"
-
-require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202105.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202105.bb
new file mode 100644
index 0000000..e3c3d9f
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202105.bb
@@ -0,0 +1,4 @@
+SRCREV_edk2           ?= "e1999b264f1f9d7230edf2448f757c73da567832"
+SRCREV_edk2-platforms ?= "86984c17d562fc60a6dabbc3a479d79163656a0c"
+
+require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch
index 0cbbb47..2f56547 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/shell.patch
@@ -7,20 +7,12 @@ diff --git a/ShellPkg/ShellPkg.dsc b/ShellPkg/ShellPkg.dsc
 index c42bc9464a..ea21f07a31 100644
 --- a/ShellPkg/ShellPkg.dsc
 +++ b/ShellPkg/ShellPkg.dsc
-@@ -20,6 +20,8 @@
-   SKUID_IDENTIFIER               = DEFAULT
- 
+@@ -24,2 +24,4 @@
  [LibraryClasses.common]
 +  SbsaValLib|ShellPkg/Application/sbsa-acs/val/SbsaValLib.inf
 +  SbsaPalLib|ShellPkg/Application/sbsa-acs/platform/pal_uefi/SbsaPalLib.inf
    UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
-   UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
-   UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
-@@ -83,6 +85,7 @@
-   # Build all the libraries when building this package.
-   # This helps developers test changes and how they affect the package.
+@@ -88,2 +90,3 @@
    #
-+  ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf 
++  ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf
    ShellPkg/Library/UefiShellLib/UefiShellLib.inf
-   ShellPkg/Library/UefiShellAcpiViewCommandLib/UefiShellAcpiViewCommandLib.inf
-   ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
index 14f6606..fa7f6d7 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.0.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202102.bb
+require recipes-bsp/uefi/edk2-firmware_202105.bb
 
 PROVIDES:remove = "virtual/uefi-firmware"
 
-- 
2.17.1


