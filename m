Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EF2C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 11:28:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3913.1635506917911085543
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 04:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 823291FB;
	Fri, 29 Oct 2021 04:28:37 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.80.198])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 127003F5A1;
	Fri, 29 Oct 2021 04:28:35 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com
Subject: [PATCH 13/13] arm/trusted-firmware-a,fiptool-native: Fix fiptool
 execution wrt corstone1000
Date: Fri, 29 Oct 2021 12:27:53 +0100
Message-Id: <20211029112753.8231-14-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
References: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Oct 2021 11:28:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2326

From: "Arpita S.K" <Arpita.S.K@arm.com>

After http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=648571b113b39420735859461fcd69cfc6f66c76,
building the corstone1000-image fails with the below error.
    fiptool_platform.h:19:11: fatal error: openssl/sha.h: No such file or directory
    # include <openssl/sha.h>

Put back the inclusion of BUILD_LDFLAGS to fix this.

Change-Id: I57396eefe2c9a58e4c5c6a751b2ee7d32509cac5
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 1 +
 meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 3c4cd58..0d49a0a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -155,6 +155,7 @@ do_compile() {
     # This is still needed to have the native fiptool executing properly by
     # setting the RPATH
     sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
+    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool/Makefile
 
     # Currently there are races if you build all the targets at once in parallel
     for T in ${TFA_BUILD_TARGET}; do
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
index 9ad1166..dd36eca 100644
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
@@ -22,6 +22,7 @@ do_compile () {
     # This is still needed to have the native fiptool executing properly by
     # setting the RPATH
     sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
+    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool/Makefile
 
     oe_runmake fiptool
 }
-- 
2.17.1


