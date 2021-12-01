Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948ACC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 02:45:58 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.87259.1638326757929486685
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 18:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nogzJp8H;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso121542pjb.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 18:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sNj+4kUfy2nu35V+Y2G7618e3DWf5eHo4dJ3zNjWfEQ=;
        b=nogzJp8HzmMuAVmSh6WMpLBsoI+DEFL/a7c7TxMH5qNR+YSydObekpydf8zByw5DnY
         cfJ7xIBRXchdBa/8FO9u2pig43f8ElpGxguAh88re9nuRVz29PWJI/H9hj5SoswzMUCg
         qBT3lrGRJB0gQUWjVntw/j+ahmxMLQCYYX4evNkDYqnAhofBbCJmXqPTF3WuzFY5k1m3
         UZ38MEJvGuaiDqWmAmk2jNGOAKhCsYxun740SQh317+SSdwKI6FOcSySxDVqojjeifsB
         hoG4qEuYeeaSC35fpyC63wKJrvTtUXG8bQatDWPXxHU6J3dgqvL2rZfCCL5A3nOHPi6b
         sZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sNj+4kUfy2nu35V+Y2G7618e3DWf5eHo4dJ3zNjWfEQ=;
        b=pcLfoDzS6r80p+a/Eso2MgrtcOdO+g8WWJf5oXB0qRnMky9zC5vvzS7q+rxF3tN+6C
         fo4AbQuWsV8W+xHNOHfE4mqlTWgQN2CWTY3piCClKq8qFh9XGniRUwBngj6gdJfxGbY7
         2sbkH2AdrSWQodXmRPZF2vvu1V8CuoOhz4KS3l0upBAQU7vRiumFdLhq1S06X4XMmFxN
         L2jpmrjzH8RM/pwexlC9fFZuLim5+6yLd7eZFNDpPcERoW2eEDMMSFR3WG2FtHfDquEn
         OkhamVpLVWHl6T9xNDArRiy4MSGUCAzyxtk4H6kmzzOq7aGwvjhFPu9HqeuPLSxh2k+M
         DGfA==
X-Gm-Message-State: AOAM531r7x6V3CVvi3w3JVSdG5C63GqMeZxlce+SBncyoeScNmet64ll
	22JjSlFdY4w+VQ5AmaeJvFnaIeNEd8/7Ig==
X-Google-Smtp-Source: 
 ABdhPJwjQI8jaayvHJM03JpnTKm8TP3yoGLedemqbMBTYfyEnkNflB1INu8g/WWitbqEdJ+HV3V0sw==
X-Received: by 2002:a17:90a:670e:: with SMTP id
 n14mr3904391pjj.144.1638326757234;
        Tue, 30 Nov 2021 18:45:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 f19sm23024736pfv.76.2021.11.30.18.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 18:45:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] edk2-firmware: Use --platform option only when
 EDK2_PLATFORM_DSC is set
Date: Tue, 30 Nov 2021 18:45:54 -0800
Message-Id: <20211201024555.1102657-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 02:45:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2495

This ensures that --platform is not left dangling for platforms which do
not set EDK2_PLATFORM_DSC

Fixes build errors like
build.exe: error: --platform option requires 1 argument

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
index 66e0cc3..0a1275e 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -29,8 +29,8 @@ EDK2_PLATFORM_DSC  = ""
 EDK2_BIN_NAME      = ""
 # build --arch
 EDK2_ARCH          = ""
-# Extra arguments passed to build
-EDK2_EXTRA_BUILD   = ""
+# Extra arguments passed to build. Pass --platform if it is set
+EDK2_EXTRA_BUILD:append   = "${@' --platform ${EDK2_PLATFORM_DSC}' if '${EDK2_PLATFORM_DSC}' else ''}"
 
 # build --buildtarget
 EDK2_BUILD_MODE ?= "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
@@ -84,7 +84,6 @@ do_compile() {
        --arch "${EDK2_ARCH}" \
        --buildtarget ${EDK2_BUILD_MODE} \
        --tagname ${EDK_COMPILER} \
-       --platform ${EDK2_PLATFORM_DSC} \
        ${EDK2_EXTRA_BUILD}
 }
 
-- 
2.34.1


