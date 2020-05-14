Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.5400.1589424574468866115
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 19:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=NZObtdwg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id f13so1679070qkh.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 19:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWw1rpF/0GjR2FZ6wtgUPx1iOUzQ3KpOv7qV874X1tk=;
        b=NZObtdwg8H+9X4cUEDIe9qa60rUv69cAyrrXwxjBQJYxhaJHaJ1SVbou8C2KtZuTlG
         6Py/ifnwC9COjs+afCH4FytkZvwetFAUX2uFY6+cfEJ1jwYmO//vtWaIDX55aE4IbOe8
         o5cmpzW3GBmAd8u+4VjP4TIx76ba/gGLPFL5YC3bYNoGBz+9KOAy0or/sD1p6P/Aoxt0
         DDXsX8Pxy90NOqP+EwQXySB0EYKOod7wPqi/3ize5s+AUyLXY8xuIFj+aUD6+L9zi9mw
         h2khzEfEYUjHXR1abtn9HzgaEdx6CpZOsEe080ZUhunZU/n1i2jE66gfcPQyfHqJ3/nL
         9GBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWw1rpF/0GjR2FZ6wtgUPx1iOUzQ3KpOv7qV874X1tk=;
        b=nrXqBwnC57nJBR6iWp3pWKoMxuNzcXqd+PClW1KAQPTedUVuT83aR0DlOycHoRPEI6
         ixXnkBaEmHAfwtPBjov4jF4fscRFGcFCGoQ56Aik68LXOcrGpnVYUt8i/8saV0dKgunU
         d2UTJ7jRerlfeRwO6mIj+ppG8MgxFsnsFquNPhgYINED7B0rsa3Enj89r1Uqxq4Q668y
         9aJ+GSGngFxNne225wBcin8gtvgmhzvEYXMdiQzCYt3nYw1atqJqJC89NIyaM0fT1MiM
         7dW924MVOYuCsnHdeXTZe4kYRIS5GNynRZufjSsRct6kJTrgAP27A2bnkfRhHx3Nrr0X
         Inpg==
X-Gm-Message-State: AOAM5339kz98W5puNuSeh7TdNWCQ4nkBjz3tjb/BqqynkvVFC6BvDMiR
	zeTXYun7ElWfEpl0/Y/yLy+/b8Lz0QGJ4g==
X-Google-Smtp-Source: ABdhPJzUB2NIfudHx3+Z9o3KGl4bOOvVxx+rK+GdiuwslGkFHLNnXBwWPo4q5moBE2pYSwxqAFJV1w==
X-Received: by 2002:a37:ad02:: with SMTP id f2mr2752806qkm.486.1589424573482;
        Wed, 13 May 2020 19:49:33 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a664:2e00:658c:9d8a:81ff:d57])
        by smtp.gmail.com with ESMTPSA id l8sm1518839qtl.86.2020.05.13.19.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 19:49:32 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Date: Wed, 13 May 2020 22:49:32 -0400
Message-Id: <20200514024932.19962-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
and Cortex-M processors from ARM. This toolchain is required to build
Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
some firmware for the M0 coprocessor.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 ...cc-arm-none-eabi-native_9-2019-q4-major.bb | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
new file mode 100644
index 0000000..a0c832d
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
@@ -0,0 +1,37 @@
+# Copyright (C) 2019 Garmin Ltd. or its subsidaries
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Baremetal GCC for ARM-R and ARM-M processors"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
+
+PROVIDES = "virtual/arm-none-eabi-gcc"
+
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/RC2.1/${BPN}-${PV}-x86_64-linux.tar.bz2"
+
+SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
+SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+inherit native
+
+COMPATIBLE_HOST = "x86_64.*-linux"
+
+do_install() {
+    install -d ${D}${datadir}/arm-none-eabi/
+    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
+
+    install -d ${D}${bindir}
+    # Symlink all executables into bindir
+    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
+        lnr $f ${D}${bindir}/$(basename $f)
+    done
+}
+
+INSANE_SKIP_${PN} = "already-stripped"
+
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.20.1

