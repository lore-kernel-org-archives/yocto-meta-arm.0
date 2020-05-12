Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.1367.1589317946402276311
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 14:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h+TKagCw;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id f4so9338691iov.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 12 May 2020 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MQhVNTKJlVOM5Uppvm/SwbDl36dsp6mzyYuCFYK2rlU=;
        b=h+TKagCwtyBCJtQ33EqqkbMUaWKOgoCvpIvoQs+1F2hpXqYIRX1JGUuYUOfseL190B
         FuwjUHuspJsbZ+304kI7++UCU/1LGtvAlQuNMw9F3c7DEHXntC+wyKNLo1xjxzVTs3Ap
         wXMT8l4L5kx6fxS746Gj9p0a2BZobOEUZ/W2+sbryS8lpjM2lgqes1rDoHYFJt8BQQ+5
         9D0dzywY8njSJ+776x48oKx2KeSQJFLMLUQ7q87osom3sc+4rRVKIJQ4zp11d/rlGbS0
         XmqCZVgmUHCjYtffbp/oEzGduiaKrk5uVS/6fQvvyyjbb+lODrR+V0zZWlDZsSAb5M3+
         bOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MQhVNTKJlVOM5Uppvm/SwbDl36dsp6mzyYuCFYK2rlU=;
        b=JvhlRKGPU0sLxAXGU9n9NXXF7SqVYgNotwC27oX++c7Cj7fEVqyYwtLdcxnxZ0PUZ1
         fyS/IScdZv96VnUJgdGDkd8fsPUYwlz6U4hgcWQOibkkzuySnNYAwDcWH7shDS3mrfEL
         ncvEKWnbdeUaNUYVtAoAfEF2o8wyA4fbBRq7JqxXl2z8Ut2yivMfF4mV3yPqTVBvWIj0
         UbCcPrI3eedsPtiDiEFaesQvsStxtSnk1rOXibVJlsdsLucwTw9L1UXfvaPOtsGs1dgn
         tBfCL3U7kh/X1Gn3bO5XEz4i+/XAfgssj6+00/LbySLrC7KTdrAhP/gj+AqlTpCmosqw
         88oQ==
X-Gm-Message-State: AGi0PuZRKOBGeEoEHtpGXZupacWjkqo9mnXLV2SCd7FlVuV/U+CJoRiL
	0/tcjaEF4KPzTE5zV279j+OGKYml6aw=
X-Google-Smtp-Source: APiQypJSaZk18t3O4HgclqKSO44mNyMU0YhHDJ8u1rbsLUE+cppHpNzaLnB32nFZnRgon9fdym3mYg==
X-Received: by 2002:a6b:1cc:: with SMTP id 195mr10939178iob.177.1589317945630;
        Tue, 12 May 2020 14:12:25 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:48c7:8e3e:3527:79a])
        by smtp.gmail.com with ESMTPSA id f143sm4008138ilh.17.2020.05.12.14.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 14:12:24 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v2 2/2] trusted-firmware-a: Install .elf file from subdirectory
Date: Tue, 12 May 2020 16:12:19 -0500
Message-Id: <20200512211219.19262-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512211219.19262-1-JPEWhacker@gmail.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200512211219.19262-1-JPEWhacker@gmail.com>

The ELF files produced are in a subdirectory named by the build target
(e.g. "bl31/bl31.elf") instead of the BUILD_PLAT directory.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 5600568..c0274f3 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -107,9 +107,9 @@ do_install() {
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

