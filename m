Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web12.9024.1589384834013210262
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 08:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nqYC+OpP;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id j2so111949ilr.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=08/yx+EEZxitFfTJwa0zvxS87xQfefPijsum3tlzY74=;
        b=nqYC+OpPxNgMXe7SLnCeFqCH2nbN1rxi0I57uRcJ8sJFOmgg8KXFyKkQKBIrCg9F9Y
         HYHHUuBNMHscmeaaGm84TQDMP2a6CP4wz9C8lQ0VzxqEONd/VKcijAOgbCpHkksNzS8A
         bzEBgsFOGcFMNbegoGGr/RQFk/4R0WZArH1x9C5JAmGjJSFtQHzbSh5RRpKKkhrk8QTN
         M7M0gdeQWe8VxDRr8YAAYnWfPUDh5sARkoAf8jQOWdC+htzr4b8hq28o1NVL+bYfwL+3
         uXMQpVWaZqoYqAtJb6bX3Wx/RfguAjn0SVGPJE5j+a/vfe8cnmBWZtGUGP90SeCtelv6
         YXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=08/yx+EEZxitFfTJwa0zvxS87xQfefPijsum3tlzY74=;
        b=oyeH0gGwHLxQauj/g1xNnlF8TrY0pgZYdaOULWyaUAkaAufWdiuOXwTkeVln1TLmiy
         SdeNMz+tiyvysow5oTEr+c/AcvitUVTaf0ii2OtLvmgJYIsetW5XEc9ymKH16fuZ6elc
         kGWLI2XHaDqW8Vkn2Nu/yuSEazYJoI8+GXMlhmPvxr8fGY3Qry8nPag9g6ClcSRCNxar
         Cu24/pko4ofuJ8l1Nv8eK+S0O8su0FxHyEinfY7Hdsv+6QZsCxSwCXI/GVlrPHLNvNDf
         l1G6vYL5R8vpHqR7TeqPfTtXX1ughcMdBwnS98f8iruGW7QbnY4vlgjDZuErNWTskhz5
         HUvw==
X-Gm-Message-State: AOAM533FnlWY34YQi/VGOHmC5LD9godv+z1GQLf7PLJqzBaQqCulEbTA
	9h7uvw1kEuVKl7ZowKR8SfL4Sb7QpEA=
X-Google-Smtp-Source: ABdhPJwlgjiBreSukGwab8lMBFI2eQfD1qwTdi01WWqtGhVDaM/uFks2soCPhRyA7l8SLOsyEeBgLQ==
X-Received: by 2002:a92:a312:: with SMTP id a18mr107524ili.80.1589384832242;
        Wed, 13 May 2020 08:47:12 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:11af:b72d:1039:51ec])
        by smtp.gmail.com with ESMTPSA id c10sm35412ioc.24.2020.05.13.08.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 08:47:11 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v3 2/2] trusted-firmware-a: Install .elf file from subdirectory
Date: Wed, 13 May 2020 10:47:07 -0500
Message-Id: <20200513154707.33747-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513154707.33747-1-JPEWhacker@gmail.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200513154707.33747-1-JPEWhacker@gmail.com>

The ELF files produced are in a subdirectory named by the build target
(e.g. "bl31/bl31.elf") instead of the BUILD_PLAT directory.

Specifically allows this recipe to correctly install ATF for Rockchip
RK3399

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index febd8ce..4b5da7a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -110,9 +110,9 @@ do_install() {
             echo "Install $atfbin.bin"
             install -m 0644 $BUILD_PLAT/$atfbin.bin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
-        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
+        elif [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
             echo "Install $atfbin.elf"
-            install -m 0644 $BUILD_PLAT/$atfbin.elf \
+            install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
         elif [ -f $BUILD_PLAT/$atfbin ]; then
             echo "Install $atfbin"
-- 
2.17.1

