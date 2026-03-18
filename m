Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C72D103E168
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 12:30:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12844.1773837007909590226
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 05:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+x11IYj;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so3605825e9.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Mar 2026 05:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773837006; x=1774441806; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ddhiHxhxzfdXsIA5Z8pR8HqhHyFDQOFvRglhzIRc1kc=;
        b=W+x11IYjSow2QLo5d5JaxCJhp1PII0GVZbnUR5ppnnL/AEXoGGHB1PUj/fk/qd9oRk
         +FvOylAUQem5wsxmy98m8tjJ5Yah5pbJRLU5Yxt35C+yNo4NDvRKgwEhQAPng/fhK31k
         /nzWIJfDtjBal+XNVme9wOxfsqgD7ABSFykDbQ9ZXa9KH/vJ9lCpSAq9b3taq6Dijyp1
         9fDo2s7tm7zGo4Z2p4nLOvWCTLXw2lf+xStRe+uHX5bCjSR2Sibz3sSglTxNFunmcOej
         YdN6v3vrolpPBTS1gk2PDJxIl1gaBrGVOUxLq7ZJJyjQB2ClAFZAQtQSpgx/6GmGvc2F
         a7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837006; x=1774441806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddhiHxhxzfdXsIA5Z8pR8HqhHyFDQOFvRglhzIRc1kc=;
        b=iixWQCh+sM22LgnvXGqkKzkB3U9XvfHPxQIYXE6jEeLnivbt8A1VI4+UiiTlTrK/X0
         xlabTLZqqhHPNyyQaCB9dTMPltfuWdAG9fBbVzqAVQ14zVmDS4pE0D7553dG7kCGzBDR
         xa6Nmu7VO7wYXha8VuW+LAkU8eJmdjdeyL5gPUY5ON6IaJ42+cdIHWGYqz1cAsvgOjHV
         Sie9MHi5/JOkYAITALjsObY0CXMGw+Fw+DU6wIwRdZUI8X8e6dYLNM9UhfllwJMmSynU
         yyuDJXmOPSrrGJHSLGPlrpyr/yLlfsVW4cNQUtkU+AqT3lJeu5LJWbXFXos5wHwJWbnA
         +k7g==
X-Gm-Message-State: AOJu0Ywdip95EH9lxt6oCcVuqVXVnY9RRLly/9wlMmiSWNp0mpFfNfXc
	2h85mHUEuBTQMa/urfhsmn/qB+kUTHBbTYZzDR4m3LIdJfFqLzAaKjtML6okxEZH
X-Gm-Gg: ATEYQzzDNnJWSAi1qSEYDqywXB+vcLcQocqli84LrxbBuDPfqGk0DEf4D3OMKbjZg9h
	P9P5h7bFf3gwQbCIZp6c0rZr1fjay8o8DqTSlnZ3sCkoUZQ/RJ5kEVdGlIJeBdJHihFlGQfJLZa
	TpxuE7vDPGfuyFr1ivoWnUpfWnbYLkVpbm4h2mmT+ikqGiME+Qjjs0AnTZk2v33KmARYsNRKpzq
	2LmuqArMCaEkea7mPBlloSO39yAQje5osGXPQZhYy1ZVDarp4mXc9fcjfpkKlgUK5x0o/A0picT
	r8vwSXkISltVuDQhyd2BmsdpiWLRB+xK88CMC1m0TJp17Z2QsFiBIyRlPUvgm1GTEAW+uTJH24l
	8SQZi48jI+6X+sJBqizWuJrgBFLqjErZ+gv5OfSia9r5tOKmsKMU0OAh30oqibd4xQgUpeFAdmL
	KSQXtusCxusLPZXEBC0D60UKR8N1YjZmOm3zdQDKIpsuTcNxjw
X-Received: by 2002:a05:600c:a418:b0:485:6bcc:87dc with SMTP id 5b1f17b1804b1-486f44292f4mr43796015e9.14.1773837005716;
        Wed, 18 Mar 2026 05:30:05 -0700 (PDT)
Received: from toster.lan ([185.228.162.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b87236sm30145645e9.7.2026.03.18.05.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:30:04 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH] layers: update for wrynose release series
Date: Wed, 18 Mar 2026 12:29:49 +0000
Message-ID: <20260318122948.3511335-2-jose.quaresma@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Mar 2026 12:30:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6961

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index ecb91b08..58ab6b87 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "whinlatter"
+LAYERSERIES_COMPAT_meta-arm-bsp = "whinlatter wrynose"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 8bffff41..b51fc107 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "5"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "whinlatter"
+LAYERSERIES_COMPAT_arm-toolchain = "whinlatter wrynose"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 9d18c7c4..bfcd569d 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "whinlatter"
+LAYERSERIES_COMPAT_meta-arm = "whinlatter wrynose"
 
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL += "telnet"
-- 
2.53.0


