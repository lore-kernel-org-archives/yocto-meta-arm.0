Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.10976.1619895199508317831
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 01 May 2021 11:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LTGIlOTA;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id b19-20020a05600c06d3b029014258a636e8so1106036wmn.2
        for <meta-arm@lists.yoctoproject.org>; Sat, 01 May 2021 11:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GJLHNzNI8vNp5FPgLCOsuvLahsgtcbx/TmJdlyC9en4=;
        b=LTGIlOTA8Pbrf3zNU+LWhivyYv/sOClg6zb2R5+q71LhY/enfljerjDxAxpYbylEbB
         7O28vmZiDBKwgLC1lM3yQOhRaT7ZAFdSxkzur3Q/8jXv1tMGlGlohSObJ6GavRL7zROs
         2SrzVHKKtBLQyyD+RBjxWu9QOdXhbw3JefOLT02EOGVzTl1EMKbOLvEGvnUNjlJixHPG
         croM4uFiLNoc6VWRCk/o8xcRdFoBymZIXMKAoWuAaTGsEAJtZYmBHKkZGoXNm0tfXGZP
         T0R84gZuvnQ1jDNz4AOnzlDgMNFTOYI/v7TyteNyykapO1XXdPjod621m+VUzcoNiwXh
         y7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GJLHNzNI8vNp5FPgLCOsuvLahsgtcbx/TmJdlyC9en4=;
        b=o6mLnVAB77xnd7PV3qLBLSv9//xSmBpaWb5054isDYx98B0MK2LPcSOY7zD6JyFzzk
         rMOx9txy7ddjPaLJ2fE2dHmiK75CULV6NMn9eu//Zou5EUfhOO3iyQQ46lfjrc5i8lLy
         HirYWhGX2BtMs33WNBA9LeeAh6yLq+CiRsOhtO+OU+KJSCZ/hvWtGG5Zn3dTQ1O1FhB7
         47f2HMhmF4IxuHOwHWC4xNlJpDdoT41fFlelFKrMvtfluMQ4t6MvJxLVIj6KNC0loCTZ
         ho34H+7LZJDASGyPZBvBXHHiE+KEVDZSQCrK5V6ln8LEWe0Gg+8ELiqX7bckE/xWwuXs
         Y9EA==
X-Gm-Message-State: AOAM531Xg0hjFUxzqyGkWtTD5DC7CbpbIh+xI9CmH61ZeTXK5+bfdV9L
	P3D/08ZE6R/rZ0jbj9wOlzKfhOoeiS6+lA==
X-Google-Smtp-Source: ABdhPJzBiqPH7DJdDEuE3QMUuNsbxiFtPbRpJZ7gdSj5sg4kgUKJi4GngGLyZDf0iypOScT6Y94qcA==
X-Received: by 2002:a1c:9a8a:: with SMTP id c132mr8869668wme.48.1619895197694;
        Sat, 01 May 2021 11:53:17 -0700 (PDT)
Return-Path: <peron.clem@gmail.com>
Received: from localhost.localdomain (2a01cb0003ba9b0016adc64e4bfc0dd5.ipv6.abo.wanadoo.fr. [2a01:cb00:3ba:9b00:16ad:c64e:4bfc:dd5])
        by smtp.gmail.com with ESMTPSA id d6sm6580295wrr.77.2021.05.01.11.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 11:53:17 -0700 (PDT)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] gator: Add new package
Date: Sat,  1 May 2021 20:53:13 +0200
Message-Id: <20210501185313.606401-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To communicate with the target device, Streamline requires the
gator daemon, gatord, to be running on the device.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---

Changes since v1:
 - Bump to 7.6.0
 - Add upstream-status and signoff patch
 - Add Kernel config requirement to summary
 - Add Homepage
 - Add all Licenses and checksums

 .../gator/0001-gator-don-t-strip-debug.patch  | 29 ++++++++++++++++++
 .../recipes-devtools/gator/gator_7.6.0.bb     | 30 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
 create mode 100644 meta-arm/recipes-devtools/gator/gator_7.6.0.bb

diff --git a/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch b/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
new file mode 100644
index 000000000000..dc30809b58f8
--- /dev/null
+++ b/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
@@ -0,0 +1,29 @@
+From 5b51a78186f0ea7474902d8ed8f2c96d8be91c33 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
+Date: Fri, 16 Apr 2021 15:27:16 +0200
+Subject: [PATCH] gator: don't strip debug
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [https://github.com/ARM-software/gator/pull/26]
+Signed-off-by: Clément Péron <peron.clem@gmail.com>
+---
+ daemon/Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/daemon/Makefile b/daemon/Makefile
+index ba5f29cfeb10..6807948310f9 100644
+--- a/daemon/Makefile
++++ b/daemon/Makefile
+@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut -f1 -d.` \>= 5),1)
+ 	CXXFLAGS += -fno-sized-deallocation
+ endif
+ 
+-# -s strips the binary of debug info
+-LDFLAGS     += -s
+ LDLIBS      += -lrt -lm -pthread
+ TARGET      := $(OBJ_DIR)gatord
+ ESCAPE_EXE  := $(OBJ_DIR)escape/escape
+-- 
+2.25.1
diff --git a/meta-arm/recipes-devtools/gator/gator_7.6.0.bb b/meta-arm/recipes-devtools/gator/gator_7.6.0.bb
new file mode 100644
index 000000000000..75f144b209aa
--- /dev/null
+++ b/meta-arm/recipes-devtools/gator/gator_7.6.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "DS-5 Streamine Gator daemon"
+DESCRIPTION = "Target-side daemon gathering data for ARM Streamline \
+Performance Analyzer. Note that Gator uses the Linux Perf API for \
+most of its data collection. Check that your Kernel follow the \
+configuration requirement specified here: \
+https://github.com/ARM-software/gator#kernel-configuration"
+HOMEPAGE = "https://github.com/ARM-software/gator"
+
+LICENSE = "GPLv2 & LGPLv2.1+ & Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+		    file://libsensors/COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
+		    file://mxml/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
+		    file://k/perf_event.h;endline=14;md5=e548bf30a60b2ed11ef2dcf7bfdac230 \
+		   "
+
+SRCREV = "6088d3533146d7b7c9700b8e396292053240b25f"
+SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=master \
+	   file://0001-gator-don-t-strip-debug.patch;patchdir=.. \
+          "
+
+S = "${WORKDIR}/git/daemon"
+
+EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOURCE -DETCDIR=\"${sysconfdir}\"' \
+		 'LDFLAGS=${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=${TARGET_PREFIX}' \
+		 'CXXFLAGS=${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC='${CC}' CXX='${CXX}'"
+
+do_install() {
+        install -d ${D}${sbindir}
+        install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
+}
-- 
2.25.1

