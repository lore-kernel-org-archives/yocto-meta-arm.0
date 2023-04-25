Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94637C77B61
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:39:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.79846.1682429943071871410
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 06:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=blpoMF6L;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f19323259dso46749585e9.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 25 Apr 2023 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682429941; x=1685021941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OImIOjMVd8752Knvjw2onOCyc/iTk3MzDQbYUsnKHsU=;
        b=blpoMF6LqUfC0sSlBHXIFA0bTjWk3qO/Vvc646x/JKd485ETPaNK+9oWhkZpdiFtkA
         /PCtAiR9EJF6QUHS/t4OOEHXqroUPRmr+gmQaq+6En1nKbXhCsaDdvLFkxPA3OIIFk2X
         AjIXAs3vNB4A0KAUmGxmVDkKMVaVe68+ceYt4maQk46Y5U+6ylvncNqCN1t+8/I68Kmu
         9UkhdJ3wdR69env773SjzLm7gbmPAU2f+S6IntwrKH1craqDyqcWKUUdRiTolyvQ1By9
         p3g1iihsrV8CcDKvEIdvsh9XVoaLcNvL/HMYI9tRtONS4c2sxfK5LoAclZ1R4CEBBLVl
         e8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682429941; x=1685021941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OImIOjMVd8752Knvjw2onOCyc/iTk3MzDQbYUsnKHsU=;
        b=ZhSQLKETjW5ttnA9Bd+t/AgA8xG0TXunm9wInhdKxh7eBjWEiLGNAoRKnM7x9aQBWg
         u2LdoOXdgMxAmeOxOAQZW5KjPPK3RB9AtYWfBuvSrG68ZOYyrrmI1nbZdOJoN0sANWSV
         eUA3lG+zsVgFYPcAjX+bBcJIUP5mjWG+zD0l/LaQ27p2hWuQ6AcbBSOYxAF0ZoCohBUH
         HX11MsAgGKZjanQdWAVhzZWt+y21xQ9bfXWfdp8zdTH211+KYAja9QyQcVOpRarpZjOh
         59gJsI2W0nZNQsrtsroK/ShKhG4jTvOEWiURZS1HOs02IOVtGwBlxZoaV8kwlP2RP/bb
         3JJA==
X-Gm-Message-State: AAQBX9fD+XLm2r9juVvuzPib9XQSwdcCARNlh4//riPgDt4imieMu9C2
	qILLVzPoEN6xDAXDEODOSHRJSGQc4aM=
X-Google-Smtp-Source: AKy350bVfU/Y584Ftg05qiEmjv7ydWFvRnQ4sbGyd7CB196m2qsE4c10Jf10vxeiWMScytKWLzKaiw==
X-Received: by 2002:a7b:cd87:0:b0:3ed:c468:ab11 with SMTP id y7-20020a7bcd87000000b003edc468ab11mr10450669wmj.28.1682429941113;
        Tue, 25 Apr 2023 06:39:01 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b003f1958eeadcsm10936459wmq.17.2023.04.25.06.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:39:00 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 2/2] gator-daemon: bump to 8.4.0
Date: Tue, 25 Apr 2023 15:38:57 +0200
Message-Id: <20230425133857.27753-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425133857.27753-1-peron.clem@gmail.com>
References: <20230425133857.27753-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Apr 2023 13:39:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4617

Gator daemon moved to CMake build system so update the recipe to inherit
cmake and drop patches that has been merged.

This new version have removed the internal libmxml and now required to link with it.
As the libmxml is present in meta-oe and we don't want meta-oe to be an explicit
dependency of meta-arm move the gator daemon recipe to a dynamic-layer.

At the same time remove the Apache-2.0 license as it was set for libmxml.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../gator-daemon/gator-daemon_8.4.0.bb}       | 21 ++++--------
 .../0001-Include-missing-cstdint.patch        | 32 -------------------
 .../0001-daemon-mxml-Define-_GNU_SOURCE.patch | 31 ------------------
 3 files changed, 7 insertions(+), 77 deletions(-)
 rename meta-arm/{recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb => dynamic-layers/openembedded-layer/gator-daemon/gator-daemon_8.4.0.bb} (51%)
 delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch
 delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch

diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb b/meta-arm/dynamic-layers/openembedded-layer/gator-daemon/gator-daemon_8.4.0.bb
similarity index 51%
rename from meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
rename to meta-arm/dynamic-layers/openembedded-layer/gator-daemon/gator-daemon_8.4.0.bb
index 6188b07e..586b3ce8 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
+++ b/meta-arm/dynamic-layers/openembedded-layer/gator-daemon/gator-daemon_8.4.0.bb
@@ -8,28 +8,21 @@ HOMEPAGE = "https://github.com/ARM-software/gator"
 # configuration requirement specified here:
 # https://github.com/ARM-software/gator#kernel-configuration
 
-LICENSE = "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
+LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://libsensors/COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
-                    file://mxml/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://k/perf_event.h;endline=14;md5=e548bf30a60b2ed11ef2dcf7bfdac230 \
                    "
 
-SRCREV = "6a944e7ee1f1c3ab9b2a57efd24c58503122db02"
-SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main;protocol=https \
-           file://0001-daemon-mxml-Define-_GNU_SOURCE.patch;striplevel=2 \
-           file://0001-Include-missing-cstdint.patch;striplevel=2 \
-          "
+SRCREV = "75662ba2dc2e1c7a17cff640a35629dca99c5b79"
+SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main;protocol=https"
 
 S = "${WORKDIR}/git/daemon"
 
+DEPENDS = "boost libmxml pkgconfig-native protobuf protobuf-native"
+
 COMPATIBLE_HOST = "aarch64.*-linux"
 
-EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOURCE -DETCDIR=\"${sysconfdir}\"' \
-                'LDFLAGS=${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=${TARGET_PREFIX}' \
-                'CXXFLAGS=${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC='${CC}' CXX='${CXX}' V=1"
+inherit cmake
 
-do_install() {
-        install -d ${D}${sbindir}
-        install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
-}
+EXTRA_OECMAKE += "-DENABLE_VCPKG=OFF -DGATOR_INSTALL_PREFIX=./bin"
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch
deleted file mode 100644
index 294f804f..00000000
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 87745a6cad0f7819ac8f8d3826f5e228ebd843c5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 2 Feb 2023 16:39:26 -0800
-Subject: [PATCH] Include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no
-longer transitively included [1]. Explicitly include it
-for uintXX_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://github.com/ARM-software/gator/pull/40]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- daemon/xml/CurrentConfigXML.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/daemon/xml/CurrentConfigXML.h b/daemon/xml/CurrentConfigXML.h
-index 0b239fd..d9047e3 100644
---- a/daemon/xml/CurrentConfigXML.h
-+++ b/daemon/xml/CurrentConfigXML.h
-@@ -1,6 +1,7 @@
- /* Copyright (C) 2020-2021 by Arm Limited. All rights reserved. */
- #pragma once
- 
-+#include <cstdint>
- #include <set>
- #include <string>
- 
--- 
-2.39.1
-
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch b/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
deleted file mode 100644
index d2460434..00000000
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 04e2e924c3ab8da41343277746804dbcd7bf520d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 13 Aug 2022 16:49:52 -0700
-Subject: [PATCH] daemon/mxml: Define _GNU_SOURCE
-
-This file uses vasprintf() which is defined only with _GNU_SOURCE
-feature macro is on.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- daemon/mxml/mxml-string.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/daemon/mxml/mxml-string.c b/daemon/mxml/mxml-string.c
-index 678aeb9..c9cd153 100644
---- a/daemon/mxml/mxml-string.c
-+++ b/daemon/mxml/mxml-string.c
-@@ -13,6 +13,8 @@
-  * Include necessary headers...
-  */
- 
-+#define _GNU_SOURCE
-+
- #include "config.h"
- 
- 
--- 
-2.37.2
-
-- 
2.40.0


