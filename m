Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25414C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 15:59:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13034.1637683190882819471
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 07:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B0F21FB;
	Tue, 23 Nov 2021 07:59:50 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B67D23F5A1;
	Tue, 23 Nov 2021 07:59:48 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	vishnu.banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][honister 06/19] arm/trusted-firmware-a,fiptool-native: Fix
 fiptool execution
Date: Tue, 23 Nov 2021 15:59:13 +0000
Message-Id: <20211123155926.31743-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
References: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 15:59:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2435

From: Diego Sueiro <diego.sueiro@arm.com>

After http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=648571b113b39420735859461fcd69cfc6f66c76
the fiptool create command fails with:
    tools/fiptool/fiptool: error while loading shared libraries: libcrypto.so.3: cannot open shared object file: No such file or directory

Put back the inclusion of BUILD_LDFLAGS to fix this.

Issue-Id: SCM-3548
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I8bfddd0528d5c4dbf5dfd87c9ae17db4e0071b1c
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++++
 meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb       | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 36bd037..3c4cd58 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -152,6 +152,10 @@ BUILD_DIR .= "${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
 BUILD_DIR .= "/${@'debug' if d.getVar("TFA_DEBUG") == '1' else 'release'}"
 
 do_compile() {
+    # This is still needed to have the native fiptool executing properly by
+    # setting the RPATH
+    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
+
     # Currently there are races if you build all the targets at once in parallel
     for T in ${TFA_BUILD_TARGET}; do
         oe_runmake -C ${S} $T
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
index e733ff1..9ad1166 100644
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
@@ -19,6 +19,10 @@ inherit native
 EXTRA_OEMAKE = "V=1 HOSTCC='${BUILD_CC}' OPENSSL_DIR=${STAGING_DIR_NATIVE}/${prefix_native}"
 
 do_compile () {
+    # This is still needed to have the native fiptool executing properly by
+    # setting the RPATH
+    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
+
     oe_runmake fiptool
 }
 
-- 
2.17.1


