Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.13068.1589207185187303268
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 07:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WTbeYbMN;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id 79so671060iou.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0imCvzjtyqDI5U/5JrkUYe/CCCWOBgcWj8sp+Gl8ENg=;
        b=WTbeYbMNK0wk+X9+drLx/PanJ9/h5q1DR39LaVcDkyPdPEFIuZZJDTqnGqENh1F6Pr
         QD9kom+i1M2DXI0wGo7dLBslJXY9VEHyiZCYAu1WdkbBUTNHQpMb/ycc7mP5PXEa4D5G
         ANxgGIgz0Wmor3ATgWPMOfuyDvbf88gCuRRieJuEMDiZSovHmQTBiKik6Vd2WkjxwnzK
         gBEAjoG2htYXq43ePgCwKN3MUIFKpWSjWxZIcHfGtHEHZQgt5s3jIQSZSkBPgS3rqcka
         eLP/381tJWbQWpXUHQqOfSSydxL+7AbjraBKZraJWrHOQUgNqM/p+Oi+QRi6gfP4jwEr
         0MVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0imCvzjtyqDI5U/5JrkUYe/CCCWOBgcWj8sp+Gl8ENg=;
        b=CqBvTE3sLuREIeT7H/GYs4/tcmb4q/QteyWN1AvCnVz3XhHgnO/1dTGnPQf9r/dDee
         s+W87atE+KXYwYv6WrzLZ2ClvLHfFskIx5VmZfb2CZXG4VIMFMsvfoyagzHYjJ75l1By
         /3EazvVrEbv+kW1B6wMDnMCfSY4KFgtPLnM71c6Gqa44Fy1/As1GJuSi/ayNIxPdlJs7
         LFANQCJpZdGNnfsywdHuR4dQ1887NGaXIjU2S4P6DdFlLkG7UwDOxZKpbzJ+m29x3CLW
         wVHQkJ2DMcSqT1MaUs5fFmimlQqTQn5D/narz4rcqRZEM6GcRzSmK7IZLEsu8YwgvNp+
         wnjQ==
X-Gm-Message-State: AGi0PuaTDvtMrmy7u/R/jXgNlXS4xcSXZC+6sLrzIoT3uqTrqzvpa/cb
	URBkoeg52xak74F+6UqOdtwbSL3l
X-Google-Smtp-Source: APiQypLQ1Mim557zFYUcserRby7P4m5JaFpocsvrxFQC5pGsb2VnD7zLjeXEPn5yMdK66J7CUCbETA==
X-Received: by 2002:a02:9f8b:: with SMTP id a11mr15576888jam.122.1589207181400;
        Mon, 11 May 2020 07:26:21 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:ac13:ea07:8c16:df2d])
        by smtp.gmail.com with ESMTPSA id a1sm5152256ilq.75.2020.05.11.07.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:26:19 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH 2/3] trusted-firmware-a: Install .elf file from subdirectory
Date: Mon, 11 May 2020 09:26:03 -0500
Message-Id: <20200511142604.11860-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511142604.11860-1-JPEWhacker@gmail.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>

The ELF files produced are in a subdirectory named by the build target
(e.g. "bl31/bl31.elf") instead of the BUILD_PLAT directory.

Specifically allows this recipe to correctly install ATF for Rockchip
RK3399

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 197ab92..2eade9f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -100,9 +100,9 @@ do_install() {
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

