Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2421.1607988294803555775
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 15:24:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FD781FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Dec 2020 15:24:54 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC3FC3F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Dec 2020 15:24:53 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm: new recipes for EDK2
Date: Mon, 14 Dec 2020 18:24:39 -0500
Message-Id: <20201214232442.4371-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Rework the EDK2 recipes to allow for multiple versions, and create a
recipe for the latest version.  This will allow for BSPs using the older
version to continue to function while waiting to be upgraded.  Also,
rework the n1sdp recipe to use the 201911 recipe, but overwrite
everything with its unique git trees.

Change-Id: I96869191bcf896ea17304d2ccf93da58605c72a1
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                     | 1 +
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc    | 9 +--------
 .../recipes-bsp/uefi/edk2-firmware_201911.bbappend       | 8 ++++++++
 .../recipes-bsp/uefi/edk2-firmware_202008.bbappend       | 7 +++++++
 ...rmware_git.bbappend => edk2-firmware_202011.bbappend} | 4 ----
 .../recipes-bsp/uefi/files/{ => n1sdp}/initialise.patch  | 0
 .../uefi/{edk2-firmware_git.bb => edk2-firmware.inc}     | 3 ---
 meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb        | 5 +++++
 meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb        | 4 ++++
 meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb        | 4 ++++
 10 files changed, 30 insertions(+), 15 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend
 rename meta-arm-bsp/recipes-bsp/uefi/{edk2-firmware_git.bbappend => edk2-firmware_202011.bbappend} (52%)
 rename meta-arm-bsp/recipes-bsp/uefi/files/{ => n1sdp}/initialise.patch (100%)
 rename meta-arm/recipes-bsp/uefi/{edk2-firmware_git.bb => edk2-firmware.inc} (94%)
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index acb0f5c..67363ac 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -33,6 +33,7 @@ PREFERRED_VERSION_scp-firmware ?= "2.7%"
 
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
+PREFERRED_VERSION_edk2-firmware ?= "201911%"
 
 #grub-efi
 EFI_PROVIDER ?= "grub-efi"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 3c57bd0..07a41b0 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,12 +1,7 @@
-EDK2_SRC_URI = "git://git.linaro.org/landing-teams/working/arm/edk2.git"
-EDK2_PLATFORMS_SRC_URI = "git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git"
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI += "file://initialise.patch"
 
-# TAGS and commit ID as per N1SDP-2020.03.26 release
-SRCREV_edk2           = "3ff8a6bffabad761279817252014d59b6069d68a"
-SRCREV_edk2-platforms = "d9d32e6c8b7456d21ce365486ac563b6be36c20d"
-
 # N1SDP specific EDK2 configurations
 EDK2_BUILD_RELEASE = "0"
 EDK2_PLATFORM      = "n1sdp"
@@ -16,8 +11,6 @@ EDK2_ARCH          = "AARCH64"
 
 COMPATIBLE_MACHINE = "n1sdp"
 
-PV = "201908+git${SRCPV}"
-
 # UEFI EDK2 on N1SDP is unable to detect FS2 during boot resulting in launching of
 # EDK2 shell instead of launching grub. The startup.nsh will force launching of grub
 EFIDIR             = "/EFI/BOOT"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend
new file mode 100644
index 0000000..cc25ee0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend
@@ -0,0 +1,8 @@
+EDK2_SRC_URI = "git://git.linaro.org/landing-teams/working/arm/edk2.git"
+EDK2_PLATFORMS_SRC_URI = "git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git"
+
+# TAGS and commit ID as per N1SDP-2020.03.26 release
+SRCREV_edk2           = "3ff8a6bffabad761279817252014d59b6069d68a"
+SRCREV_edk2-platforms = "d9d32e6c8b7456d21ce365486ac563b6be36c20d"
+
+require edk2-firmware-n1sdp.inc
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend
new file mode 100644
index 0000000..fb4abed
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202008.bbappend
@@ -0,0 +1,7 @@
+# Include machine specific configurations for UEFI EDK2
+
+MACHINE_EDK2_REQUIRE ?= ""
+
+MACHINE_EDK2_REQUIRE_sgi575 = "edk2-firmware-sgi575.inc"
+
+require ${MACHINE_EDK2_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
similarity index 52%
rename from meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
rename to meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
index 8cfd6c5..8a656d7 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
@@ -1,11 +1,7 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
 # Include machine specific configurations for UEFI EDK2
 
 MACHINE_EDK2_REQUIRE ?= ""
 
-MACHINE_EDK2_REQUIRE_n1sdp = "edk2-firmware-n1sdp.inc"
-MACHINE_EDK2_REQUIRE_sgi575 = "edk2-firmware-sgi575.inc"
 MACHINE_EDK2_REQUIRE_fvp-base = "edk2-firmware-fvp-base.inc"
 
 require ${MACHINE_EDK2_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/initialise.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/initialise.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/uefi/files/initialise.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/initialise.patch
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
similarity index 94%
rename from meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
rename to meta-arm/recipes-bsp/uefi/edk2-firmware.inc
index a594971..43b635a 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -20,9 +20,6 @@ SRC_URI = "\
     ${EDK2_PLATFORMS_SRC_URI};name=edk2-platforms;destsuffix=edk2/edk2-platforms;nobranch=1 \
 "
 
-PV = "202008+git${SRCPV}"
-SRCREV_edk2           ?= "06dc822d045c2bb42e497487935485302486e151"
-SRCREV_edk2-platforms ?= "7aab81a35aef7b295e73d7d6dfd528cc812790ed"
 SRCREV_FORMAT         = "edk2_edk2-platforms"
 
 EDK2_BUILD_RELEASE   ?= "1"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb
new file mode 100644
index 0000000..1ff24ff
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb
@@ -0,0 +1,5 @@
+SRCREV_edk2           ?= "bd85bf54c268204c7a698a96f3ccd96cd77952cd"
+SRCREV_edk2-platforms ?= "46df7b29afeb846ee664e48949f9c8161abf1f2f"
+
+require edk2-firmware.inc
+
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb
new file mode 100644
index 0000000..60363d8
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202008.bb
@@ -0,0 +1,4 @@
+SRCREV_edk2           ?= "06dc822d045c2bb42e497487935485302486e151"
+SRCREV_edk2-platforms ?= "7aab81a35aef7b295e73d7d6dfd528cc812790ed"
+
+require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
new file mode 100644
index 0000000..1d47d3e
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
@@ -0,0 +1,4 @@
+SRCREV_edk2           ?= "872f953262d68a11da7bc2fb3ded16df234b8700"
+SRCREV_edk2-platforms ?= "46df7b29afeb846ee664e48949f9c8161abf1f2f"
+
+require edk2-firmware.inc
-- 
2.17.1

