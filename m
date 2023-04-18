Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3A4C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 16:37:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.14693.1681835832885445836
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 09:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QAS+w5YR;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id r15so6294196wmo.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 18 Apr 2023 09:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681835831; x=1684427831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PSknuhL7eV0a7z38LxN08RvZxcBxgfLqVnpje7iUi0U=;
        b=QAS+w5YR75mY67P8H6K8nXRSNOTNgnno2l1mkEM6oh4jo+UzetRHvz68C3wD1/1/5N
         Vv6tPS3XpZSD/CFkCXU2DEJE3tnoIjWw4JPVAgFo2KFZbijr3P1FP2XmXnHwP+syDIf9
         Fke+2NrG3Jvy9BjuQIFzCglOWKRXQMGcykY8lOYdenB9Kmto1gUN6IpwO/OLYgbTEox0
         Ct1ml9sNn3cf4ZnzDcckkZnLPUxDiUAH/t32lWnkgqJrscg6+7IKYUIO235UF6tAorGk
         +LuQUWnz7jax8szzjfHgtmkaPQ0p/lnWadFogMAg+g824sOJ7zEbMutaWUH8cU133Mzr
         Fs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681835831; x=1684427831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSknuhL7eV0a7z38LxN08RvZxcBxgfLqVnpje7iUi0U=;
        b=mAopq+VxSfDPtrmZFEjFmhVqbo6JByPMnUJhkW7zZkrwKkAyWxwoMdgGG89HWGt3pW
         94fCUEmafnlcPn9YgCroVFJpNGxK5iOLJNZW0b8WchwO51I3GtbCcr1TQP5ZfCu6Ezgy
         64GhKwx+AEh8e9soCj6vcF5tx+AY0UHwKe/qMUP8LnCKGprAhZGshcsoFPJFp4vUbod1
         RCEz7lhJ9yi4r7iLf9qBnvlmjuZE6Yb4NePb+2WPEzl6LOIjPMWnLXVoxdbbpaKoVX3i
         1iHtuAwXRN4vAhGmrVE2BeB2KiuA/BaXxu0WajiJQl4hCTF62KFaa6YlQcoc3ECruK77
         XaGw==
X-Gm-Message-State: AAQBX9c1RqShnNykZZYW7nxhD4UeIs8nVdz32/vFqAgKp+zNLf/YJZhH
	lshUJisVAy7mg88tFlA70/RFaN4P5dA=
X-Google-Smtp-Source: AKy350ZYrPaKN9kiqHyemPQ5h8N0DSL8dJBZc65RkWO1ogLILJpFFH9ihnh+R0GEN6hEqRV89kybiQ==
X-Received: by 2002:a1c:6a0d:0:b0:3f1:735b:9c4b with SMTP id f13-20020a1c6a0d000000b003f1735b9c4bmr6139968wmc.37.1681835830562;
        Tue, 18 Apr 2023 09:37:10 -0700 (PDT)
Received: from localhost.localdomain (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b003f177c3672dsm3438224wmq.29.2023.04.18.09.37.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Apr 2023 09:37:10 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] gator-daemon: bump to 8.4.0
Date: Tue, 18 Apr 2023 18:36:58 +0200
Message-Id: <20230418163658.13032-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Apr 2023 16:37:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4580

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
2.39.2 (Apple Git-143)


