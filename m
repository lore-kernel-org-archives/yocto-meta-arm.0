Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9146C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 16:23:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.28400.1646670218110549325
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 08:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A93DF153B
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Mar 2022 08:23:37 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 85F5C3FA32
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Mar 2022 08:23:37 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH dunfell] arm-bsp: fix yyloc kernel build error
Date: Mon,  7 Mar 2022 11:23:33 -0500
Message-Id: <20220307162333.2014-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Mar 2022 16:23:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3121

Backport patch from upstream to address the following error:
scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ve-redundant-YYLOC-global-declaratio.patch | 54 +++++++++++++++++++
 .../linux/linux-arm64-ack-tc0.inc             |  1 +
 .../linux/linux-linaro-arm_4.19.bb            |  3 +-
 .../linux/linux-linaro-arm_5.4.bb             |  1 +
 .../recipes-kernel/linux/linux-yocto_5.3.bb   |  4 +-
 5 files changed, 60 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
new file mode 100644
index 0000000..efd9803
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Backport
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+From e33a814e772cdc36436c8c188d8c42d019fda639 Mon Sep 17 00:00:00 2001
+From: Dirk Mueller <dmueller@suse.com>
+Date: Tue, 14 Jan 2020 18:53:41 +0100
+Subject: [PATCH] scripts/dtc: Remove redundant YYLOC global declaration
+
+gcc 10 will default to -fno-common, which causes this error at link
+time:
+
+  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol from plugin):(.text+0x0): first defined here
+
+This is because both dtc-lexer as well as dtc-parser define the same
+global symbol yyloc. Before with -fcommon those were merged into one
+defintion. The proper solution would be to to mark this as "extern",
+however that leads to:
+
+  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=redundant-decls]
+   26 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+In file included from dtc-lexer.l:24:
+dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
+  127 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+cc1: all warnings being treated as errors
+
+which means the declaration is completely redundant and can just be
+dropped.
+
+Signed-off-by: Dirk Mueller <dmueller@suse.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+[robh: cherry-pick from upstream]
+Cc: stable@vger.kernel.org
+Signed-off-by: Rob Herring <robh@kernel.org>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index 5c6c3fd557d7..b3b7270300de 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -23,7 +23,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
index a8fe6ff..d26f3be 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
@@ -8,6 +8,7 @@ SRC_URI_append = " \
     file://defconfig \
     file://0001-drm-Add-component-aware-simple-encoder.patch \
     file://0002-swap-red-and-blue-colors-in-HDLCD-driver.patch \
+    file://0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch \
     "
 
 KCONFIG_MODE = "--alldefconfig"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
index 089f6cb..d227886 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
@@ -4,14 +4,13 @@ KBRANCH ?= "latest-4.19-armlt-19.01"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-
 SRCREV_machine ?= "e97e8d868aba53467039dbef3b7436c857433ae3"
-
 SRCREV_meta ?= "ad6f8b357720ca8167a090713b7746230cf4b314"
 
 SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
            file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+           file://0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
index d2cd127..569deb7 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
@@ -13,6 +13,7 @@ KBRANCH = "n1sdp"
 
 SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;nobranch=1 \
            file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+           file://0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch \
           "
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
index 9d5e9ce..d81d3f4 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
@@ -6,7 +6,9 @@ SRCREV_machine = "d4f3318ed8fab6316cb7a269b8f42306632a3876"
 SRCREV_meta = "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA} \
+           file://0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch \
+          "
 
 LINUX_VERSION = "5.3.18"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-- 
2.17.1


