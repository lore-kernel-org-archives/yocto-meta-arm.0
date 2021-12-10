Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D87CC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 01:15:19 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.1273.1639098917724240503
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 17:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JaMw33QT;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so8288618pjc.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 17:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ZJALl8ykoc7ctLZI1lZAcj5QK4CiLyE0Lahn15Ebxs=;
        b=JaMw33QTyTYmkYofgKX1g4XYmNXybsBZOfT7NvFkTOckPSsjU6O0+XHeu/atb6k4D7
         FgTEgMDriCnsfD9QYwq7e2XIi2WqK/EFu0gUZIutKmlF+s+PSL1gJGnmWP0griCPa5Rv
         vA+ku/9zVOEhIQi62VDXy2TZVjTEuhEjIYTGJACAbZtySUZJfQZCt9p9ZkRvKgcya0kX
         KJ9CtJ5uUcs4WW/hhPo9I+qFclUHstms8pNJ9ktfdXEazrLmPwbIovl4lIs1RIDEqqQ/
         ab3p0s3w6NFl9PS4oLmqViGyWsNcV+2BAzlFgEECoGUgVz5ZVbefbF3TlQvrqitUWjXH
         7jQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ZJALl8ykoc7ctLZI1lZAcj5QK4CiLyE0Lahn15Ebxs=;
        b=hB+i9UpzbTdB568KwFQwtmyeJEhWvwwm/mR+MF+OSzHvPTok3R+3XyZZFZ7PUsmZm0
         QE0lfESo7w0b79ad9LBFdYKv0aBYkY3r6AOpJMrW1RG/ZO6iFUlHq8V8zvIq6DwkOx68
         syBSHGK1sJrZIGByOHxu7PcWgpVQVjjQftrtCQKC5MInqEmSaHc6isH3ja+raP1ebdYx
         7cjRIPlcJPa1pyX1XXP8K7vi1kH6C3zwgxWMSs4h9GRdEM44Yrf4gWMXq7vXKkTNih5d
         t06KU0D5pseMFVay7P47gNwOSS/1egkVXdqP+d94D0r+oMB2ZKCIg6zsj2KXbp6TMI/u
         QOIA==
X-Gm-Message-State: AOAM532vbzi7yyatVyELXSbx0uur2JptvkPpxjWSIha5xV/6sI2iQYF2
	274/nF/T98pnmGIsoGEQQbEIbrXDiiHA1w==
X-Google-Smtp-Source: 
 ABdhPJwaw9eBceuuBr8hl0i5lLMmBdYx2vuQYdShyruVHaZDSaK/LpMzvjcmC6OdLRmAd0qmFBRBRA==
X-Received: by 2002:a17:90a:fd8c:: with SMTP id
 cx12mr19865762pjb.11.1639098916939;
        Thu, 09 Dec 2021 17:15:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 h1sm879731pfi.217.2021.12.09.17.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 17:15:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] Revert "trusted-firmware-a: Pin to use gcc for now"
Date: Thu,  9 Dec 2021 17:15:14 -0800
Message-Id: <20211210011514.1664810-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Dec 2021 01:15:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2609

Change moved to meta-rockchip

This reverts commit ad030e5830803c308a6b035b8ba1f63d42d5dc2c.
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
index dd8fd44..ec1bec9 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
@@ -10,8 +10,3 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
 SRCREV_mbedtls = "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
 
 LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-# code bloats with clang and results in error below now
-# | aarch64-yoe-linux-musl-ld: region `PMUSRAM' overflowed by 3928 bytes
-# this needs fixing until then use gcc
-TOOLCHAIN = "gcc"
-- 
2.34.1


