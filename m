Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.12792.1589465210039602374
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 07:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Fkt297nS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id r3so1552334qve.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 May 2020 07:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sPAqT1BQ5/DDb7qKbkiBHMSjsBUezviLfgLyv/EoKHg=;
        b=Fkt297nSFIMm7d38G3CXCszFTyd/v/XPttnz6oTUMlKw/zRUXaSjVn5iWdloGv2O+a
         pRZxeBqeDLu3theGmk64mMW4nN72sjeUsGpM2NvsaO2G9WCFG9k2kU9Az2GxarbZ5hBe
         Q5zZNxkyq23z2Y6pwXuVwE9RQZSWE+lElrk5O8OAKmbLPzwRn3W5D+VQE7MVCKM2rhT/
         TOK0+KLyw4JxiCzMwXgv23oxP8zgEf8CDxc1xx2v4GkxwpF0UgE6RyORGpEHctxBTRbu
         0GNx4vTUl1PJ1jz0FarW/K9Yzb6PfeqllMlNLR9KsXKTml3WDx4KknUoRi+BfiK0Zo9Z
         AhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sPAqT1BQ5/DDb7qKbkiBHMSjsBUezviLfgLyv/EoKHg=;
        b=IKpv7kkjTKLtBslnGBWL0Tbj7/pYKdVtH7zxnylTWflUBXyjLo6mSH9m0Q3+z1L44a
         r88F5ro9vF3DcDTApH0xM3FKO80JA+GwZjM98YSzjTaFTyCO8XZgwvhKuelzIM8wTLs7
         zWaSOBkxNwLDWlAQn0pFltzvJWxwrUuY84z7yYICsxqpbhdjGzgSUV/EOVBKZH0JUL6p
         fluXxMhvLqxCYX7BN2rJ6MxhVBzXc4oZ13hb+22iG8wp6aM7/R3a9h7TkXTTlFSDIFur
         J+mX8LRFKPUOAoqyOgYVCk7NJuAEMdAhMvAfd+edmekwMXu32bgOSyoaR8Za5kX7Nnt+
         JE2g==
X-Gm-Message-State: AOAM532zsi7sqck+i3gIefBoKN2u3Q8L1qncaBDHDz1llJ7GEZWZmq2J
	831QoqDVV0c5JmYv+80Yknswz8qdmHd6Dg==
X-Google-Smtp-Source: ABdhPJwvkfSLy+uvr99Mdxtt6iHQLg8W1Q+7plp2/MG/Wf+yQNHnJrjRJYgSldyxCZmD1Yq0IsdoUw==
X-Received: by 2002:a05:6214:1365:: with SMTP id c5mr4713613qvw.152.1589465208074;
        Thu, 14 May 2020 07:06:48 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a664:2e00:658c:9d8a:81ff:d57])
        by smtp.gmail.com with ESMTPSA id s29sm2696746qtj.43.2020.05.14.07.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:06:46 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Date: Thu, 14 May 2020 10:06:46 -0400
Message-Id: <20200514140646.26519-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
and Cortex-M processors from ARM. This toolchain is required to build
Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
some firmware for the M0 coprocessor.

This was originally taken from meta-rockchip, but has been modified from
mailing list feedback.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 ...cc-arm-none-eabi-native_9-2019-q4-major.bb | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi-native_9-2019-q4-major.bb

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi-native_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi-native_9-2019-q4-major.bb
new file mode 100644
index 0000000..f1c0cff
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi-native_9-2019-q4-major.bb
@@ -0,0 +1,39 @@
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
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-x86_64-linux.tar.bz2"
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
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1

