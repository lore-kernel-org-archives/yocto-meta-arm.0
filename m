Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF1DC433EF
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 18:47:40 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.1667.1651430855801501604
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 01 May 2022 11:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=juw0Q+PN;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so14563800pjq.0
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 01 May 2022 11:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JLI8Atxbm3TMJF4GJkwz84uBTH5FYqDB0zLS409YOCI=;
        b=juw0Q+PNHIZIkaSR4l8zVgSw8qli7XQq1T7eWv8rkhINZPwkcfN9t1Cm2zlr2mQTLo
         jBsPDfYXC8AywaZ0MHS4QVOkMHmh9k3hoeFujSDdSj/khnSeaXifIbwAhvr3NFeFEYK+
         gwkkP/EH/ZIDlfP3/WZt6QssfTwEqqkBZLnZ/fhM5JlFb0SgNujvXtbbAvccUeXUOCiF
         qbnyKk32tIbfAC0iGKuc5jJk+m+ReAw1VLqIZ4md3lrqcl5AGDvd1J2P5F52iFesglrg
         Bt4dJS92a6rtF4EIVCl5Mq25ts7UgcKld7fR1C/xsidzdNqwDs1f/8GddsyUbNP2A1x/
         hPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JLI8Atxbm3TMJF4GJkwz84uBTH5FYqDB0zLS409YOCI=;
        b=q4bq7ZeNsesIzSDSPkk0nKqOxk23NP3qEjpS4EYseFsTlvKlEZog8PUkCmJmx77CAR
         ja+IlNVy7SDncRQVXEbgUgVDO7yBFV+Uc/ZiMAmjAJc1znij3kJ5SAVDdaPv370dkUaR
         ogGfC4Bo+ALimA4FLRf1E5ipPRXGaOnv+t/agAuSbt8JSkbEoRWXnkbUdN7PXiR1BV/j
         ipnUPupFJK0Ep8wAVE2+6m0W0m/LgzLaodmB2groqkoF0YXJ/a6LPqBN9X5LpQQ1WT8m
         EnPMWtsjVBBnTPNPJO4xpGxjGssSbNIyBHzZJzghzuA6rLkNi3eMdabfmTaKiAMhQ1i+
         s8Cg==
X-Gm-Message-State: AOAM5300CuWFGkuUaI3/62wDTpgm/SD6D6e3UZ+O4CYoZqnde+KaIn7k
	uBL2S7J1vGfkSfVKnMt6e5st/wGHVEhvoQ==
X-Google-Smtp-Source: 
 ABdhPJwqEQhgqi0SU8PjP1dUIwSlYQcHmJATDuL3qp8p+nrkJDhdBtHdW7dKj8jxNTNWJ5jqveS6QQ==
X-Received: by 2002:a17:902:7006:b0:156:3cbe:6b04 with SMTP id
 y6-20020a170902700600b001563cbe6b04mr8498846plk.68.1651430854808;
        Sun, 01 May 2022 11:47:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 co21-20020a17090afe9500b001cd4989fedcsm17543379pjb.40.2022.05.01.11.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 11:47:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffa-debugfs-mod: Do not build for TI SOCs
Date: Sun,  1 May 2022 11:47:31 -0700
Message-Id: <20220501184731.3730441-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 01 May 2022 18:47:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3335

The module can not be compiled without patching kernel 5.10
This helps meta-ti to live in multi-BSP envs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
index 4051c34..a4dd38c 100644
--- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
+++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
@@ -27,6 +27,7 @@ do_install:append() {
 }
 
 COMPATIBLE_HOST = "(arm|aarch64).*-linux"
+COMPATIBLE_HOST:ti-soc = "null"
 
 # Kernel modules currently RDEPEND on the kernel, which is troublesome when you want to put a
 # kernel module into a initramfs without pulling the kernel into the initramfs, which would be
-- 
2.36.0


