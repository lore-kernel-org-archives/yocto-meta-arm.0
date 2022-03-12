Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E178AC433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 00:50:26 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.412.1647046225691902841
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=TFvlirJb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id hu12so8286883qvb.6
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XuJ973zyxUi/g5guJQtv5HO/RG3c75xSIUF8cvK+vtU=;
        b=TFvlirJbB4sjJEhaKKZiQG3yn4Uzs7qMQzuzh0BvSGAda5VOlVen2BisY4Y1WIXumF
         kAT8icbmhxBkwRJZ75RGvIXFcGeioBZCYymT7n+tMlADq2WBCM+hCXFv8mja4vNhl9RB
         g35nb/hakpRA4YwAwIwluCHnLDstUdiJ5TtrGZrCPuZhbZskaI/+keteo9V2g9Htr8Eb
         CbcCkVi5avbHkOgE0as62w6UvzD+wFGPcSwfm7ivU1pPFmWpGqBJlkbLgaWU6aaI1Wzz
         WUmfuUsmWOGBpuCuwI0XgLgsgeAeuXrGyu+A+ZcdUVg/N/mx3HIi7h6qlU1IUbGj7j+i
         9AQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XuJ973zyxUi/g5guJQtv5HO/RG3c75xSIUF8cvK+vtU=;
        b=GxKibu9AMZz/WPFdpdfrEGv8k5m93PusNZ46ah09DzuOxtPgFjOyucNdl8Byj7Lsbz
         aTa4ZDrc7oGJQUK3Wgd1P7v3Rm17UzqUf5ST8dOFVf1P8ZyHsXJN2C89yDVpzgY7v3DH
         IGiuLDD7nXCLsVZefEvcuG505e/9mMoK+k/YFWooX72CPyLVLoqpj5/xUkzQZ8traDgI
         IgBCsY9xrJtkrcQDq9Gnr1NGnoo3jfPhzwauJpI4jg/Yb393V04ewPvO0dglhGfnPjrf
         FOYBaADBY8vKdEjzk6S6LwVPEtLbAH0zRwZGAO3i3+Ft6Io3xCXEhTbjqsPpqslwObQn
         v2Yw==
X-Gm-Message-State: AOAM530dOIWUcnEQ8w049Es23LMiREu2eHk8CCXCeNPjkdZWJcCu6Wta
	sEBfY1CSOuK4zU6xFZf7zFtEdLTbZcIhIw==
X-Google-Smtp-Source: 
 ABdhPJwruipLCPtc13wPHGsVrBAExx43osV4uqqjAreBvwoBDTUmh7Pvol5Uvg5u1bvoZ8HtbPhBFg==
X-Received: by 2002:a05:6214:e65:b0:43c:6996:6444 with SMTP id
 jz5-20020a0562140e6500b0043c69966444mr3452457qvb.90.1647046224462;
        Fri, 11 Mar 2022 16:50:24 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:77d1:5990:d885:810c])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a05620a03cc00b0067d370e414esm4412891qkm.15.2022.03.11.16.50.24
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 16:50:24 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH honister 1/2] arm-bsp: fix yylloc kernel build error
Date: Fri, 11 Mar 2022 19:50:22 -0500
Message-Id: <20220312005023.3864751-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 12 Mar 2022 00:50:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3158

Backport patch from upstream to address the following error:
scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ve-redundant-YYLOC-global-declaratio.patch | 54 +++++++++++++++++++
 .../recipes-kernel/linux/linux-yocto_5.3.bb   |  4 +-
 ...ve-redundant-YYLOC-global-declaratio.patch | 54 +++++++++++++++++++
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb   |  1 +
 4 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/meta-arm-bsp/recipes-kernel/linux/files/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
new file mode 100644
index 000000000000..efd9803ac792
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
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
index 036cb00ab2c7..7999766a7af4 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
@@ -6,7 +6,9 @@ SRCREV_machine = "d4f3318ed8fab6316cb7a269b8f42306632a3876"
 SRCREV_meta = "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA} \
+           file://0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch \
+          "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 LINUX_VERSION = "5.3.18"
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
new file mode 100644
index 000000000000..e09e05b80892
--- /dev/null
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Backport
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+From e33a814e772cdc36436c8c188d8c42d019fda639 Mon Sep 17 00:00:00 2001
+From: Dirk Mueller <dmueller@suse.com>
+Date: Tue, 14 Jan 2020 18:53:41 +0100
+Subject: [PATCH] third_party/linux/scripts/dtc: Remove redundant YYLOC global declaration
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
+ third_party/linux/scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/third_party/linux/scripts/dtc/dtc-lexer.l b/third_party/linux/scripts/dtc/dtc-lexer.l
+index 5c6c3fd557d7..b3b7270300de 100644
+--- a/third_party/linux/scripts/dtc/dtc-lexer.l
++++ b/third_party/linux/scripts/dtc/dtc-lexer.l
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
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
index fe24a904719a..4c57e581b0e0 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -13,6 +13,7 @@ SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https \
            file://hashbang.patch \
            file://host-ld.patch \
            file://pkg-config-native.patch \
+           file://0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch \
            file://native-dtc.patch"
 SRCREV = "3a149eb219467c0d9336467ea1fb9d3fb65da94b"
 S = "${WORKDIR}/git"
-- 
2.30.2


