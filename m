Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3E3C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 15:59:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13031.1637683184252845718
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 07:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7ADD1FB;
	Tue, 23 Nov 2021 07:59:43 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F4B43F5A1;
	Tue, 23 Nov 2021 07:59:41 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	vishnu.banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][honister 03/19] arm/fiptool-native: bumping the version to
 v2.5
Date: Tue, 23 Nov 2021 15:59:10 +0000
Message-Id: <20211123155926.31743-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
References: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 15:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2432

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

The commit provides the v2.5 recipe for fiptool-native
and removes the older versions.

Change-Id: Ie87ca97bc63bfe7ba2337b1bf05d9658921bab83
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../fiptool/fiptool-native_1.5.bb             | 31 -------------------
 ...ol-native_2.3.bb => fiptool-native_2.5.bb} |  9 +++---
 2 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb
 rename meta-arm/recipes-devtools/fiptool/{fiptool-native_2.3.bb => fiptool-native_2.5.bb} (73%)

diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb b/meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb
deleted file mode 100644
index 925542c..0000000
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-# Firmware Image Package (FIP)
-# It is a packaging format used by TF-A to package the
-# firmware images in a single binary.
-
-DESCRIPTION = "fiptool - Trusted Firmware tool for packaging"
-LICENSE = "BSD-3-Clause"
-
-SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https"
-LIC_FILES_CHKSUM = "file://license.rst;md5=e927e02bca647e14efd87e9e914b2443"
-
-# Use fiptool from TF-A v1.5
-SRCREV = "ed8112606c54d85781fc8429160883d6310ece32"
-
-DEPENDS += "openssl-native"
-
-inherit native
-
-S = "${WORKDIR}/git"
-
-do_compile () {
-    # These changes are needed to have the fiptool compiling and executing properly
-    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
-    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool/Makefile
-
-    oe_runmake fiptool
-}
-
-do_install () {
-    install -d ${D}${bindir}/
-    install -m 0755 tools/fiptool/fiptool ${D}${bindir}
-}
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
similarity index 73%
rename from meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
rename to meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
index 25ca111..2d0f333 100644
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
@@ -6,10 +6,10 @@ DESCRIPTION = "fiptool - Trusted Firmware tool for packaging"
 LICENSE = "BSD-3-Clause"
 
 SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;destsuffix=fiptool-${PV};protocol=https;"
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=713afe122abbe07f067f939ca3c480c5"
 
-# Use fiptool from TF-A v2.3
-SRCREV = "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
+# Use fiptool from TF-A v2.5
+SRCREV = "c158878249f1bd930906ebd744b90d3f2a8265f1"
 
 DEPENDS += "openssl-native"
 
@@ -24,6 +24,5 @@ do_compile () {
 }
 
 do_install () {
-    install -d ${D}${bindir}/
-    install -m 0755 tools/fiptool/fiptool ${D}${bindir}
+    install -D -p -m 0755 tools/fiptool/fiptool ${D}${bindir}/fiptool
 }
-- 
2.17.1


