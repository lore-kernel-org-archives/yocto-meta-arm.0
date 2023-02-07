Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4655EC636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 15:20:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.85934.1675783215814342757
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 07:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lwW2xTB5;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id z13so3809124wmp.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Feb 2023 07:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m7jv2d1NAa+6b5nW78NVyNELWneqWgYoX9PRcCqlkKI=;
        b=lwW2xTB5AyXLIPdcTb82lhQ41IJaZMy5n0sc0ZphyymNbv8mTuPUvs8B34XCSyEGL0
         I7RNSrTRHSS+cKWGykGRACypRZXqMpgG+vsYA7NTmmYsBuVE056KhpWljfrNq43KnOxi
         ClSkVSkjrP3qTtDZJCshRvAUUt4ebfEuqUGUbg1CKRtwLvmYClDvglW81bVRlc56y0BB
         P1/ExrRMyozuynfwt3jWzD8uYFcWAiHnomyQI7HvNuXR5+3T/21rnEZCpRdvAa4mjIfU
         h9O8YwXUrl6Ym+4G6rjmBrmH3Kues90p6J+UqAGTpyYDRrkz4XvUV/b/4dE4C0U9q58w
         vVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7jv2d1NAa+6b5nW78NVyNELWneqWgYoX9PRcCqlkKI=;
        b=3AiNDrRQ6LhgBKaYL7px4D8mOTos6TkW4MBuYHpbfbr+DPZ33iz8EGbB0ixgkw/50/
         yu4APYusov5RfH7BftHZov9JrXSafv/xY0PMrm+f0de1fQQcW0nsgKqzeCzu9IClo68b
         xeuzqhiqRIjm+4qbVjed7nasMStlqHQqYkjaeW7GvXTlifoHIF0A6oHib40veu1+5NDt
         p/swPe8xvo6fyJa2k2ZYnPFEnmIwA45xp7a9vOXmRddkK+n+x+KMbeDX155waGze+1Uu
         wrFQK/DUFbEyfDYzmPSYKv44uVzcIMth9azuYENhgdOEy7BSzUytjh0Yb+sW+1KCk3oK
         sQkQ==
X-Gm-Message-State: AO0yUKUAaBTDiO1TVTRAui0aa3vnZiSrKGUPmX/DUVIIYAlML5cLiH0g
	Q+EpbdWKbL0paCnmhXaYfTIHI42oKo4=
X-Google-Smtp-Source: AK7set9EjnvBKI0fxMLoSxOHKTHM2iQZprwozQTF6DraoDLKry6Ukvw01fqFjEZ9a7qrPG7wmUI4WA==
X-Received: by 2002:a05:600c:2b46:b0:3dc:50dd:361b with SMTP id e6-20020a05600c2b4600b003dc50dd361bmr3353754wmf.5.1675783213821;
        Tue, 07 Feb 2023 07:20:13 -0800 (PST)
Received: from clements-macbook-pro.home (2a01cb000c0d3d0020c970ead9153f73.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:20c9:70ea:d915:3f73])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c205100b003dd1bd0b915sm16100891wmg.22.2023.02.07.07.20.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 07 Feb 2023 07:20:13 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] gator-daemon: bump to 8.3.0
Date: Tue,  7 Feb 2023 16:19:52 +0100
Message-Id: <20230207151952.94769-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Feb 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4369

Bump gator daemon to 8.3.0.

Drop no more required patches
Move to CMake
Add a patch to fix template compilation

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 ...rf-fix-no-matching-function-for-call.patch | 27 ++++++++++++++++
 .../0001-Include-missing-cstdint.patch        | 32 -------------------
 .../0001-daemon-mxml-Define-_GNU_SOURCE.patch | 31 ------------------
 ...-daemon_7.8.0.bb => gator-daemon_8.3.0.bb} | 21 ++++++------
 4 files changed, 36 insertions(+), 75 deletions(-)
 create mode 100644 meta-arm/recipes-devtools/gator-daemon/files/0001-daemon-agents-perf-fix-no-matching-function-for-call.patch
 delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-Include-missing-cstdint.patch
 delete mode 100644 meta-arm/recipes-devtools/gator-daemon/gator-daemon/0001-daemon-mxml-Define-_GNU_SOURCE.patch
 rename meta-arm/recipes-devtools/gator-daemon/{gator-daemon_7.8.0.bb => gator-daemon_8.3.0.bb} (54%)

diff --git a/meta-arm/recipes-devtools/gator-daemon/files/0001-daemon-agents-perf-fix-no-matching-function-for-call.patch b/meta-arm/recipes-devtools/gator-daemon/files/0001-daemon-agents-perf-fix-no-matching-function-for-call.patch
new file mode 100644
index 00000000..5c7b0bc3
--- /dev/null
+++ b/meta-arm/recipes-devtools/gator-daemon/files/0001-daemon-agents-perf-fix-no-matching-function-for-call.patch
@@ -0,0 +1,27 @@
+From 28f93c8fac4b3565db757010de01974caff74c8d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <cpe@outsight.tech>
+Date: Tue, 7 Feb 2023 13:03:29 +0100
+Subject: [PATCH] fix
+
+---
+ daemon/agents/perf/capture_configuration.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/daemon/agents/perf/capture_configuration.cpp b/daemon/agents/perf/capture_configuration.cpp
+index 84b04de..6817d6d 100644
+--- a/daemon/agents/perf/capture_configuration.cpp
++++ b/daemon/agents/perf/capture_configuration.cpp
+@@ -49,8 +49,8 @@ namespace agents::perf {
+             msg.set_has_exclude_callchain_kernel(perf_config.has_exclude_callchain_kernel);
+         }
+ 
+-        template<typename T, typename H, typename R>
+-        constexpr void set_if_not_null(T const * ptr, H & host, R (H::*fn)(T const *))
++        template<typename H, typename T = char, typename R = void>
++        constexpr void set_if_not_null(const T * ptr, H & host, R (H::*fn)(const std::string &))
+         {
+             if (ptr != nullptr) {
+                 (host.*fn)(ptr);
+-- 
+2.34.1
+
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
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.3.0.bb
similarity index 54%
rename from meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
rename to meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.3.0.bb
index 6188b07e..3a0e53cd 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_8.3.0.bb
@@ -8,28 +8,25 @@ HOMEPAGE = "https://github.com/ARM-software/gator"
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
+SRCREV = "17ae804323e0ce451f5df23d06416dadddc337a5"
 SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=main;protocol=https \
-           file://0001-daemon-mxml-Define-_GNU_SOURCE.patch;striplevel=2 \
-           file://0001-Include-missing-cstdint.patch;striplevel=2 \
+           file://0001-daemon-agents-perf-fix-no-matching-function-for-call.patch;striplevel=2 \
           "
 
 S = "${WORKDIR}/git/daemon"
 
+DEPENDS = "boost libmxml protobuf protobuf-native"
+
 COMPATIBLE_HOST = "aarch64.*-linux"
 
-EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOURCE -DETCDIR=\"${sysconfdir}\"' \
-                'LDFLAGS=${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=${TARGET_PREFIX}' \
-                'CXXFLAGS=${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC='${CC}' CXX='${CXX}' V=1"
+inherit cmake
+
+EXTRA_OECMAKE += "-DENABLE_VCPKG=OFF -DGATOR_INSTALL_PREFIX=./bin"
 
-do_install() {
-        install -d ${D}${sbindir}
-        install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
-}
+FILES_${PN} = "/usr/bin/daemon"
-- 
2.37.1 (Apple Git-137.1)


