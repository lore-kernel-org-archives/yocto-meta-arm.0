Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.3285.1619367120922296692
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 25 Apr 2021 09:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X2uXs5Yz;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id x5so2984664wrv.13
        for <meta-arm@lists.yoctoproject.org>; Sun, 25 Apr 2021 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KemXF6CXiwO5qEXo7oACj7FxQ3y0b2B6HMAOwb5otN8=;
        b=X2uXs5Yz4xJWdRDG4VlwOEgR+t6hwz+6vfT97tW3I3R3kpPlBS8jKBspSBLhmtwvqx
         C8tuuPPsbRAE7CM8td7sQq/374n4x1EcAk1q6glagaqN+Wo3s1pnBpTzZR4mKUydDfvf
         egre5peEPAnPUNXdXpxxt19xiCsFhpqtHFx0xpPsJ7UVo/1yZe31fsADuW/ZpCJkqOZP
         gncPF0qA2yKNo/UZLDI41roJQ25SUtSC9B77RHKqXb8UVKxJXkJpIiRF1NRXSmcDGJpK
         jujDIebEKMj0u8R3TBxsOphIBtQiqZak6Nj7+BPOacJWEvZo2HcdllacrG0ZZEGKhES9
         ofrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KemXF6CXiwO5qEXo7oACj7FxQ3y0b2B6HMAOwb5otN8=;
        b=nYfa3dvgogvSbF1XUcaOqnZAkJa2e1cUV/GW+JqZaQI3pMRABFxOpfzbsfpLjzEUAp
         U+5AVpf1S8mWXBYxS2InuJ5SnZ4vPM26OhnoqmHIRyJi9wexENCgf1oflhJJL582m67a
         x4GXcxGKk46YKMC6ap0ggEgrjmk9bacv0iQ32yRuBZFNO6G9/aHoP3sX/NMzlhR8iw36
         O9zzuR9MqOVJf2ElEpN0IteakQ8zN9tjPiL2hbPukN7WHdcl6UI6j2CylnSzxka/OOrE
         NIyImydoaKdYNf3ShqjA4rjcjTrrL4LGknlwgW95Op+pBgZAR0MPs62ebpTZtK26xtNK
         lGQw==
X-Gm-Message-State: AOAM533RyE0ahSt9KphbmSYt1cThlYO3tFODQOXDVVgQVx0M/bF6utVZ
	cGIqn+pA1US2S0FXKoKpVOfJMwhb5DoosQ==
X-Google-Smtp-Source: ABdhPJznX+YiYHbUMQMJUHHMm9lGwcWTZRJQPNdEgY+WI9c9+n7g+UnI+r/BmD73zFUGVeuJ94zHhQ==
X-Received: by 2002:adf:a294:: with SMTP id s20mr17572509wra.54.1619367119106;
        Sun, 25 Apr 2021 09:11:59 -0700 (PDT)
Return-Path: <peron.clem@gmail.com>
Received: from localhost.localdomain (2a01cb0003ba9b00ba599de23d83eacf.ipv6.abo.wanadoo.fr. [2a01:cb00:3ba:9b00:ba59:9de2:3d83:eacf])
        by smtp.gmail.com with ESMTPSA id z18sm2339799wrh.16.2021.04.25.09.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 09:11:58 -0700 (PDT)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] [RFC] gator: Add new package
Date: Sun, 25 Apr 2021 18:11:53 +0200
Message-Id: <20210425161153.31518-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To communicate with the target device, Streamline requires the
gator daemon, gatord, to be running on the device.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../gator/0001-gator-don-t-strip-debug.patch  | 24 +++++++++++++++++++
 .../recipes-devtools/gator/gator_7.5.0.bb     | 22 +++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
 create mode 100644 meta-arm/recipes-devtools/gator/gator_7.5.0.bb

diff --git a/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch b/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
new file mode 100644
index 000000000000..8e59fffa1fc2
--- /dev/null
+++ b/meta-arm/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
@@ -0,0 +1,24 @@
+From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <cpe@outsight.tech>
+Date: Fri, 16 Apr 2021 15:27:16 +0200
+Subject: [PATCH] gator: don't strip debug
+
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
diff --git a/meta-arm/recipes-devtools/gator/gator_7.5.0.bb b/meta-arm/recipes-devtools/gator/gator_7.5.0.bb
new file mode 100644
index 000000000000..8e15b1ca5fc5
--- /dev/null
+++ b/meta-arm/recipes-devtools/gator/gator_7.5.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "DS-5 Streamine Gator daemon"
+DESCRIPTION = "Target-side daemon gathering data for ARM Streamline Performance Analyzer."
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LICENSE_libsensors = "LGPL-2.1-or-later"
+
+SRCREV = "6088d3533146d7b7c9700b8e396292053240b25f"
+SRC_URI = "git://github.com/ARM-software/gator.git;protocol=http;branch=master \
+	   file://0001-gator-don-t-strip-debug.patch;patchdir=.. \
+	  "
+
+S = "${WORKDIR}/git/daemon"
+
+EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOURCE -DETCDIR=\"${sysconfdir}\"' \
+    'LDFLAGS=${LDFLAGS} ${TARGET_CC_ARCH}' 'CROSS_COMPILE=${TARGET_PREFIX}' \
+    'CXXFLAGS=${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC='${CC}' CXX='${CXX}'"
+
+do_install() {
+	install -d ${D}${sbindir}
+	install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
+}
-- 
2.25.1

