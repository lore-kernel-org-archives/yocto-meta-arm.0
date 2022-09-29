Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8E6C433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 23:41:05 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.61.1664494863519733754
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 16:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ALnY0wcI;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id s26so2750068pgv.7
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=uG2hU0KYp8aToWXWUn41+CSjGL5Yb2tbzEH4TL7EOYM=;
        b=ALnY0wcITtYN6/mPtFfJ+hnbMP44OUFtZT7d7ehoHaBmC8uAs/gWiajQ9BVuC0H+va
         98BBw47Jgz4AYoTmdX9A5mpzJfD1H9pmXgQVADWGmWNvM5475Sl8EsyU9seQ9MsL7P1R
         cqXaeOqKHCfLNzRkaW/SB7XNLPpCllPNFrDNUCgScZU2JyF0ymKFgqogt3itAv41BVzq
         TjXnD3Y44O1A6V31WeqSSjCQYZFoUWF4tCXyb0gtLUq9yxDAOZzjevoiz90OaaW9m4tL
         9KykQejRqdkmXl3WAlldr3NXKuJkh5prQ95YaGspmGECWD9IMUQ43TFdGrTDTsDNa6B1
         9+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=uG2hU0KYp8aToWXWUn41+CSjGL5Yb2tbzEH4TL7EOYM=;
        b=OP7Z0LjO1qtIXCeoqfWw6M9Jq1NK6cSUh+j3feH+cDylwA+T+CsmicRDCAHYXo/2Az
         qsLDjhhaZpMnP1v4dhL3DwsncrFi8N+LjOBjWXg3beNhkYWi8KVCCMkAEORWD71x2Pbd
         +eZvrxGIL92PoR2kC38vt7HOXP6T1jfvYw4HFpd/3PzadcfFcdFiQyedNl1ndQPKVgx0
         u5efvnw8rxxmIEewdUKJVPEWSp5G4R96Y40VhiPhyjVL3k7jJndoOeTiW4hE5jR7HLcU
         MKKE949uERZHxpnsAEdUCnXIJzEowv4ghHDEk04oTYuPSfQ5OGvlnMg517UZM2aQMH8N
         HiZw==
X-Gm-Message-State: ACrzQf0HdQoIPlvg3we7YCSmbO64CNYFvQzJ7NXRX5+QVFuCKQDR58Kx
	fSE83e6iPWp2xzGRmMKLw4iJqiogMW26OQ==
X-Google-Smtp-Source: 
 AMsMyM6zufR8ImJlD7V4TEUCYFAU9xWt390jl0ZV097CMp7oD+kFOsvcqBohGy6IzUhYqIonejr5RA==
X-Received: by 2002:a62:d403:0:b0:54b:a7e4:909c with SMTP id
 a3-20020a62d403000000b0054ba7e4909cmr5877598pfh.61.1664494862690;
        Thu, 29 Sep 2022 16:41:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::dee7])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a170902a38d00b0017c37a5a2fdsm216250pla.216.2022.09.29.16.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 16:41:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layers: Add langdale to LAYERSERIES_COMPAT
Date: Thu, 29 Sep 2022 16:41:00 -0700
Message-Id: <20220929234100.3608904-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 23:41:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3879

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 meta-atp/conf/layer.conf           | 2 +-
 meta-gem5/conf/layer.conf          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index a1e22c0..236d9a5 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "kirkstone"
+LAYERSERIES_COMPAT_meta-arm-bsp = "kirkstone langdale"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 3cb8b06..935eb62 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "5"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "kirkstone"
+LAYERSERIES_COMPAT_arm-toolchain = "kirkstone langdale"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index c23ea56..4b3161e 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "kirkstone"
+LAYERSERIES_COMPAT_meta-arm = "kirkstone langdale"
 
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL += "telnet"
diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf
index 3ec36e8..043d601 100644
--- a/meta-atp/conf/layer.conf
+++ b/meta-atp/conf/layer.conf
@@ -6,4 +6,4 @@ BBFILE_COLLECTIONS += "meta-atp"
 BBFILE_PATTERN_meta-atp = "^${LAYERDIR}/"
 
 LAYERDEPENDS_meta-atp = "core openembedded-layer meta-gem5"
-LAYERSERIES_COMPAT_meta-atp = "kirkstone"
+LAYERSERIES_COMPAT_meta-atp = "kirkstone langdale"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index d329bd0..3802b43 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "5"
 
 LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-gem5 = "kirkstone"
+LAYERSERIES_COMPAT_meta-gem5 = "kirkstone langdale"
 
 BBFILES_DYNAMIC += " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
-- 
2.37.3


