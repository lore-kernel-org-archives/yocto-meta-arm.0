Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9051C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 02:22:49 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.7980.1645496566396532273
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 18:22:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cnSIEsqJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id x11so14346037pll.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 18:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bA79Id4LzkL8fFlCdiMeSJcoMpzFv8Fw9RV82qSdybE=;
        b=cnSIEsqJQdegZrlj7MLxmEnZf54u4Y3PF+DOwGdvm4Ai4tN/Byg5DB7LngoJzISPMR
         ZxQCrH2Hpd92bfpxa9h5QlYAd+TH6a6LDKCs3H06tZH6Ol9ZBq1BlKyQyQ6I556OAHJu
         fgqC47vL6/79anTCx/8Tez2732mOVkUSuj2Rwu7OvP7Z7H7ngZwYpKHj5iX71oTAXgtC
         oK1IrxshSEsySBl/+0bV9L6nfggnIJpLtn7eFHm9rJGu6zGvPI0/icFrAULuaIEj+CMe
         /aWaphp0HKeRoe6d6RuRzBRl92cm+wqroimkuJRP7dhIDKGhCAGNQ3kblYzJo5IoYkCu
         mxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bA79Id4LzkL8fFlCdiMeSJcoMpzFv8Fw9RV82qSdybE=;
        b=4k0WLjlsIy3T2xNSTXlqKdno+q2KV/N1CRS9wz3fNlqkhbtJ7F8K+J/SwuxP4us558
         CzWWWkgdQYLnPymzE9vU8Z8VwCTDG9JdaVKO9mdUq/HnPL3xbladQvkwLnsJmO7VzvFA
         5cC/BPpcwH+czCcj91ZZX5sYCuhAishh9kPrnhPov1/OhXUBkAPdGuOTzKl/LxKOzl+R
         6sFonySen7D7QrpGM5pTMDNaHu9q+yM6kloUKrTv+fFrDNKoSnaem013QP0Z07Mcm0Qs
         jBnCaU7Pgu++jUJoKomx0iccdU07kmRWOu216I4y8x9qCrLq65CQWb6hSCD2UVZKCCmt
         vwBw==
X-Gm-Message-State: AOAM533Th2SE9S0hF0KKLFb82EeLvlKKJfNNQxtf0f3D2gBPTOMa/7V3
	3KDKPpmprRakYItEf70ztTStd7ypEs/F9qez
X-Google-Smtp-Source: 
 ABdhPJzfQld+XYefwefuKswHh3S1ZRtm2QVhKw1djY2v4r2JOi/PWDumteql5/OFb9PrAKw0wgt3BQ==
X-Received: by 2002:a17:902:aa98:b0:14f:82c9:bbcb with SMTP id
 d24-20020a170902aa9800b0014f82c9bbcbmr14596197plr.160.1645496565737;
        Mon, 21 Feb 2022 18:22:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 s5sm13266188pgv.70.2022.02.21.18.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 18:22:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] layers: Bump to use kirkstone
Date: Mon, 21 Feb 2022 18:22:41 -0800
Message-Id: <20220222022241.1389914-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222022241.1389914-1-raj.khem@gmail.com>
References: <20220222022241.1389914-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 02:22:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3033

its not going to be backward ABI compatible with honister due to variable renaming.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 meta-atp/conf/layer.conf           | 2 +-
 meta-gem5/conf/layer.conf          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 7af156e..a1e22c0 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "honister"
+LAYERSERIES_COMPAT_meta-arm-bsp = "kirkstone"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 778910b..3512c34 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "5"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "honister"
+LAYERSERIES_COMPAT_arm-toolchain = "kirkstone"
 
 # do not error out on bbappends for missing recipes
 BB_DANGLINGAPPENDS_WARNONLY = "true"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 69817f4..c23ea56 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "honister"
+LAYERSERIES_COMPAT_meta-arm = "kirkstone"
 
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL += "telnet"
diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf
index f749e4a..3ec36e8 100644
--- a/meta-atp/conf/layer.conf
+++ b/meta-atp/conf/layer.conf
@@ -6,4 +6,4 @@ BBFILE_COLLECTIONS += "meta-atp"
 BBFILE_PATTERN_meta-atp = "^${LAYERDIR}/"
 
 LAYERDEPENDS_meta-atp = "core openembedded-layer meta-gem5"
-LAYERSERIES_COMPAT_meta-atp = "honister"
+LAYERSERIES_COMPAT_meta-atp = "kirkstone"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index 0b699b2..d329bd0 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "5"
 
 LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-gem5 = "honister"
+LAYERSERIES_COMPAT_meta-gem5 = "kirkstone"
 
 BBFILES_DYNAMIC += " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
-- 
2.35.1


