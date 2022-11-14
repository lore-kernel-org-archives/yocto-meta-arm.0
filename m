Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAEEC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 16:18:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7535.1668442721624814036
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Nov 2022 08:18:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79159113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 08:18:47 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DD8C3F663
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 08:18:41 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/gn: update to the latest SHA
Date: Mon, 14 Nov 2022 09:32:13 -0500
Message-Id: <20221114143213.16026-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221114143213.16026-1-jon.mason@arm.com>
References: <20221114143213.16026-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Nov 2022 16:18:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4127

Recent changes appear to have fixed clang issues.  Unfortunately,
hafnium gn visibility is not done properly.  So, a patch to that is
needed to get it working.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../0001-work-around-visibility-issue.patch   | 29 +++++++++++++++++++
 meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb   |  1 +
 meta-arm/recipes-devtools/gn/gn_git.bb        |  7 +----
 3 files changed, 31 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-visibility-issue.patch

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-visibility-issue.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-visibility-issue.patch
new file mode 100644
index 00000000..62c5ec1f
--- /dev/null
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-work-around-visibility-issue.patch
@@ -0,0 +1,29 @@
+From 4f1ab5944c1042a141a2ce16ec8bf1d12749e41a Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Thu, 27 Oct 2022 20:10:09 +0000
+Subject: [PATCH] work around visibility issue
+
+gn commit 46b572ce4ceedfe57f4f84051bd7da624c98bf01 "fixed" the
+visibility field not applying to public configs.  This caused dtc to
+have issues due to libfdt and others not being specified.  Due to the
+number, it was cleaner to remove the visibility field (which defaults to
+everything being visible).
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ BUILD.gn | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/BUILD.gn b/BUILD.gn
+index f55560c..d60c3e3 100644
+--- a/BUILD.gn
++++ b/BUILD.gn
+@@ -5,7 +5,6 @@
+ # https://opensource.org/licenses/BSD-3-Clause.
+ 
+ config("libfdt_config") {
+-  visibility = [ ":gtest" ]
+   include_dirs = [
+     "libfdt",
+     "hafnium_inc",
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
index ebf13730..564c203f 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
@@ -18,6 +18,7 @@ SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https;br
            file://0002-arm-hafnium-fix-kernel-tool-linking.patch  \
            file://0003-Fix-build-with-clang-15.patch \
            file://0001-Use-pkg-config-native-to-find-the-libssl-headers.patch;patchdir=third_party/linux \
+           file://0001-work-around-visibility-issue.patch;patchdir=third_party/dtc \
           "
 SRCREV = "79e9522d26fc2a88a44af149034acc27312b73a1"
 S = "${WORKDIR}/git"
diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
index 9b3906c9..8d1efb65 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -5,17 +5,12 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "69ec4fca1fa69ddadae13f9e6b7507efa0675263"
+SRCREV = "bf4e17dc67b2a2007475415e3f9e1d1cf32f6e35"
 PV = "0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
-# Currently fails to build with clang, eg:
-# https://errors.yoctoproject.org/Errors/Details/610602/
-# https://errors.yoctoproject.org/Errors/Details/610486/
-TOOLCHAIN = "gcc"
-
 # Map from our _OS strings to the GN's platform values.
 def gn_platform(variable, d):
     os = d.getVar(variable)
-- 
2.17.1


