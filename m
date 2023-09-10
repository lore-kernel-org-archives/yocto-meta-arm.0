Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60438EEB57B
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 16:36:00 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.39455.1694363756916844854
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 10 Sep 2023 09:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lwU25hwn;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso473472466b.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 10 Sep 2023 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694363755; x=1694968555; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pAZmC0rNc/aan7A4pGe83gJUdahhym4MLEjjAH3HlmU=;
        b=lwU25hwnHgELKQP4WpOnPUzzjBcaAGABq/HtPPCsWrbLg1JwATsroCcwyYBymhlXmA
         /tuUquFF8cSXIS3e18b0XZbYncXB8gQ/HdFkSuk3H3lwZnE53QVGC09QVoTvbyytCaUt
         kDmrudpJtVYmwRQO2mkOoNFs3fswf7oW64JtDCzz3A//jWAfapUF/AsUClbfBXrqe800
         3yLF6/dOJtjfmof+QE/IHyAgaH+4bVB1A4canW24eHzeqfD153fHmrCu2vH5hMa9z7M1
         BghajN/WQwGkGGKfFtp+kSu7L89b8lPjXfTie9+MAqGWd95loSV6iq+zJam9yvy/9uQb
         q2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694363755; x=1694968555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAZmC0rNc/aan7A4pGe83gJUdahhym4MLEjjAH3HlmU=;
        b=jjfCy47+09kB1JmgIniWWC9PcV23TXLHN2x2HMS35KCtHATyH/2qG0egP+LIhs86KU
         JdQYqjlW3389qZ7xYaFXYwxQrF1Gw7SJVV84rgDXwJE1pXGg2BgTRsGttlsnjngxceup
         Cdbgw+gEcLsmdMIdznw/KnkVTfwoyKI+jKpXMkA41tqZCqcSKbshkcVrfEHBDiAsC0+c
         hBf7478s0ZtgIOIAugQEuhGstppgpIo2hEh7IhSuHb1HMj3y6izkcR5TndRtJcGoirzs
         haVDW5LuA/8rt5EfPJ5ilRsAwNI+XWStRmg27GsvOmEtX10DHFYvweF3+bLJKVlMZUJT
         +U4g==
X-Gm-Message-State: AOJu0YxDTOFX1DhTz1EOgpbbiIZTtWFd0l6QtwUsndq1djR+H2PP2I03
	dkix6iObGWCx/4dUXki3rHY9zIcyrd8=
X-Google-Smtp-Source: AGHT+IG8eKlcgrXznzN81/PYSUnGgDdLSSVSH8h7ZnYA1tdRkevmDL7UfrIBowpvMbKEOcp2ZK4viA==
X-Received: by 2002:a17:906:749b:b0:9a1:edfd:73b2 with SMTP id e27-20020a170906749b00b009a1edfd73b2mr6439854ejl.2.1694363754952;
        Sun, 10 Sep 2023 09:35:54 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b009a9f00bdf8dsm3998630ejb.191.2023.09.10.09.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 09:35:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] layer.conf: update LAYERSERIES_COMPAT for nanbield
Date: Sun, 10 Sep 2023 18:35:50 +0200
Message-ID: <20230910163550.3900070-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 10 Sep 2023 16:36:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5026

* oe-core switched to nanbield in:
  https://git.openembedded.org/openembedded-core/commit/?id=f212cb12a0db9c9de5afd3cc89b1331d386e55f6

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index e192a83d..97d9728c 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "mickledore"
+LAYERSERIES_COMPAT_meta-arm-bsp = "nanbield"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index a6f403ec..bce70dac 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "5"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "mickledore"
+LAYERSERIES_COMPAT_arm-toolchain = "nanbield"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 2b354375..b506af8b 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "mickledore"
+LAYERSERIES_COMPAT_meta-arm = "nanbield"
 
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL += "telnet"
-- 
2.42.0


