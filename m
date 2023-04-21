Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC77C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 09:07:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7394.1682068066426851922
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 02:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YXFAdwNy;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f09b9ac51dso42204535e9.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Apr 2023 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682068064; x=1684660064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dc1q9+CXoUPyqs7xh/Y9jAHZCWg/kuAEUFIhDFXRAU=;
        b=YXFAdwNyeuqW+R5UD4eOTsYqlFcUjHGowm3jkpV19hG32x8/ekCxh2rq4Jyd3s8I0l
         RejhMnV5sD6JN4VJVwIlb44uBGWnuUwqDdPjWMIW5HR7nDQQIg16T39j0fqragWyjXHj
         reCY79eS1H+4bDGLf7hKEtkOzKazQVJ2VytjMRqRdu0bDhfSRgPqeLDTsc8uZEsX5y2C
         6C07EwF+nrCl8VwfJ4Ej7KiU86D9jrOlq94Dc7xDUKOyYXJ1jFS2UMkH3oROSXsawlk6
         QvHdS9hhNvu4pDt69qEAaIJERt8W8Ruj2GojljRqQF5VPkWhbVuV3IOdrV78A6t4WsUG
         kGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682068064; x=1684660064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dc1q9+CXoUPyqs7xh/Y9jAHZCWg/kuAEUFIhDFXRAU=;
        b=HjTO9QVPkJX0naTLGqBY2QiJHK7bRolVpgLr9o9eYaDzyxuFCb2DdNfVtTvnsOFkSz
         WQSyEgyB9rZRA1z6DQm58d1M0DxnwPecBcefDlWk6xPQMzJaXGDaRiJPuJkhwavuaK5/
         n4WxZ7pHYzkktyQKMZTZxRT1UG22CX2+ZP9ZGAcZtKCRbN8oQjUg9XsOCud5QGu31BYd
         UpKlJPkmryt08ymo3TokPN2oEOCF9FLoDymESQDbQ3yzp0Jd7PnI2MfJrui3vtUv8xSR
         svwi4tHVm7P2P849FKfumwcF0JhL6h0Joy9zCACSXMMR/nzV2KJH5GP0pyhCRRSWBhY3
         DOSw==
X-Gm-Message-State: AAQBX9cmjIqB9gpZtedOUHMakGkT6ZK5YMb0f7H769YsYbm8M4nT00ad
	a1XkBJAuvjbMjZMeTwU/eTeEuKxpRN4=
X-Google-Smtp-Source: AKy350YL3vo3AnHny+K6CMQhBn9TZUxDwCUpbRjB+k4tdELrEpOzDpdjsm3cWF8b7I0ido4hfpTrtg==
X-Received: by 2002:a05:600c:19d4:b0:3f1:6ebd:d995 with SMTP id u20-20020a05600c19d400b003f16ebdd995mr1462362wmq.0.1682068064429;
        Fri, 21 Apr 2023 02:07:44 -0700 (PDT)
Received: from Clement-Blade14.home (2a01cb000c0d3d00d52d9d45828de677.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:d52d:9d45:828d:e677])
        by smtp.gmail.com with ESMTPSA id h5-20020a1ccc05000000b003ed1ff06faasm4230443wmb.19.2023.04.21.02.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 02:07:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 2/2] gator-daemon: bump to 8.4.0
Date: Fri, 21 Apr 2023 11:07:32 +0200
Message-Id: <20230421090732.54079-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421090732.54079-1-peron.clem@gmail.com>
References: <20230421090732.54079-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Apr 2023 09:07:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4607

Gator Daemon moved to CMake build system so update the recipe

Remove Apache-2.0 license as mxml has been moved out of this package

Drop patches that has been merged

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../0001-Include-missing-cstdint.patch        | 32 -------------------
 .../0001-daemon-mxml-Define-_GNU_SOURCE.patch | 31 ------------------
 ...-daemon_7.8.0.bb => gator-daemon_8.4.0.bb} | 21 ++++--------
 3 files changed, 7 insertions(+), 77 deletions(-)
 delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch
 delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
 rename meta-arm/recipes-devtools/gator-daemon/{gator-daemon_7.8.0.bb => gator-daemon_8.4.0.bb} (51%)

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
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
similarity index 51%
rename from meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
rename to meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
index 6188b07e..586b3ce8 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.4.0.bb
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
-- 
2.40.0


