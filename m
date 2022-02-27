Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385FEC433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 02:28:49 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.5707.1645928928106718956
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 26 Feb 2022 18:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EOOn7xUe;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id l19so8015148pfu.2
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 26 Feb 2022 18:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eIMjJXGRkI5YZrZQ9LXS3VwyMKV51w17pg1RibiC0Rs=;
        b=EOOn7xUeV4TGHsBMUn1fRANNhAJohbZFV7yidP/RrWYRk7GYwhuq4gPfI+SOVABolb
         DFx3N+6Z0dkWFMqGMYdLsv00xXQbhyTndgsWaTvkAUqOEip3dyqBjGWi9yqsd2PAm2k5
         JIhDlPgldO1H0fCMg1gpdGbmqPQ2sdKXsqva0i8w0AI1PJFtnXIuDZ7mAenkXeEhWmMn
         fNll0ie2gPnu7IuBQjKdQn1VejDr+dYzkLT7ceI1fT+2akYFAUOKsgznuV+kiHRWPEZa
         utG6VvTL/2lIPTQVAkNUL6noB+jqgBmx8fsBGbBWaCjVsd1rZGw7ngM7Q7BCml5KhXGT
         b9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eIMjJXGRkI5YZrZQ9LXS3VwyMKV51w17pg1RibiC0Rs=;
        b=7C1Xi3ZRLXTCXlHG7j8VxmL4wtQFuo809d5acYm8KxBkv55D/2ZlyMiic3hos/1kca
         SKmx7sok3+0YcAGvSIt+Pib4Ylj8D6fm2ZJOoNZaY/MiK9zPGwFOt60tV1B32yqhrbCQ
         w/40FZbUWYna+T5QhWRwdaSevMUmUmDyXG88ya5u+mWwWCqqBpAxT4vW6v1Tad1UhsDC
         2CSVN91Z82W1Hk18kFPbdxp+5sHeIuCiYyzmV3wP46pPlZARRL9jG2DXnHFKLMSLeequ
         md1CV/xkfDYCw2BKrUSvxpLGHDwJQAwUe45MlueKLm8qwVDQY/YXfibGCa90z/oNRnYK
         CvEw==
X-Gm-Message-State: AOAM533zum0m7IP8KsEoNVC7JRx4PLwoZdr7q0/NudOMmugA8sxRR0gx
	0kLCBmxdpliaUHwtXdIvDu2aoEiJjPs3RQ==
X-Google-Smtp-Source: 
 ABdhPJy6HY1FDAT94Vc2ROL9GWA1I+hJrSZri3ksu4iYL2/26bqhwrgqcQY7tOLSfFREsv/13SMnxw==
X-Received: by 2002:a63:3708:0:b0:364:db19:1365 with SMTP id
 e8-20020a633708000000b00364db191365mr2044457pga.113.1645928927253;
        Sat, 26 Feb 2022 18:28:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 d15-20020a17090ab30f00b001b8e65326b3sm6145452pjr.9.2022.02.26.18.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 18:28:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] androidclang: Skip useless-rpaths check
Date: Sat, 26 Feb 2022 18:28:44 -0800
Message-Id: <20220227022844.3604861-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 27 Feb 2022 02:28:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3073

This is a prebuilt stuff, better to ignore its guts.

Fixes
androidclang: /usr/share/clang-r416183b/python3/lib/python3.9/lib-dynload/_posixsubprocess.cpython-39-x86_64-linux-gnu.so contains probably-redundant RPATH /../lib [useless-rpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../external-arm-toolchain/androidclang_r416183b.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb
index d28d6b1..8213388 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb
@@ -43,7 +43,7 @@ do_install() {
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-INSANE_SKIP:${PN} = "already-stripped libdir staticdev file-rdeps arch dev-so"
+INSANE_SKIP:${PN} = "already-stripped libdir staticdev file-rdeps arch dev-so useless-rpaths"
 
 INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.35.1


