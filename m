Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.2463.1607988295412233669
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 15:24:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF47131B
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Dec 2020 15:24:54 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F8493F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Dec 2020 15:24:54 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm-bsp: have sgi575 use EDK2 sources
Date: Mon, 14 Dec 2020 18:24:40 -0500
Message-Id: <20201214232442.4371-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201214232442.4371-1-jon.mason@arm.com>
References: <20201214232442.4371-1-jon.mason@arm.com>

Move sgi575 off its own unique version of EDK2 and onto using the
version used in the EDK2 recipe.

NOTE: SGI575 not compiling cleanly with EDK2 202011

Change-Id: I7ab9a6673cc91758121b618e6691c25ae67e9a21
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf                  | 2 ++
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
index 7714d0d..ef74d1f 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -23,6 +23,8 @@ PREFERRED_VERSION_linux-yocto ?= "5.7%"
 KCONFIG_MODE = "--alldefconfig"
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
+PREFERRED_VERSION_edk2-firmware ?= "202008%"
+
 #grub-efi
 EFI_PROVIDER ?= "grub-efi"
 MACHINE_FEATURES += "efi"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
index 9666a1e..708cd4c 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
@@ -1,6 +1,3 @@
-SRCREV_edk2           = "50528537b2fb0ebdf32c719a0525635c93b905c2"
-SRCREV_edk2-platforms = "b972f17b329a85e6aa4d69f240d459839ba8b47c"
-
 # SGI575 specific EDK2 configurations
 EDK2_BUILD_RELEASE = "0"
 EDK2_PLATFORM      = "Sgi575"
@@ -9,5 +6,3 @@ EDK2_BIN_NAME      = "BL33_AP_UEFI.fd"
 EDK2_ARCH          = "AARCH64"
 
 COMPATIBLE_MACHINE = "sgi575"
-
-PV = "202005+git${SRCPV}"
-- 
2.17.1

