Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B864C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 23:53:03 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.2708.1707954774136237641
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 15:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VMjXcSzI;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d751bc0c15so2954805ad.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Feb 2024 15:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707954773; x=1708559573; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6RA3GD4mZSY/bsEf6/zhmdl4oF1M/QOsaMtuxbXdgYA=;
        b=VMjXcSzIWuuRo34Motw2BHi02Lb5oJbo7YnAD5TCkcKo/wWKqjX02NJcrzRXYfMSyb
         xTt42H/cNp9jyapWwCVd4Sswf8hZQhGtxT3s3PDeR0bhSPl6SF6mi8uP+xwjCiZhuzgN
         CDmqBdqHdTskdess3chsMwBM8iXUg/B7JChn6P9KePuHkjsnl7vFQ+2DLIaDh5XrNZk3
         KJ9nTDpVzoo4D/Vb6oUuZBnR2iaW7Yjp6XA1zjmx98YLr4SC/T/jQcaIm6VY/AUiBGhh
         qk55G/kzx5tQh/GcLYWoJF2afCSKRfeG16k8DLme6vzMliM0H8QrFDPW3kimbMTBmgd5
         xrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707954773; x=1708559573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RA3GD4mZSY/bsEf6/zhmdl4oF1M/QOsaMtuxbXdgYA=;
        b=pNZhJ/lDjJeSn+yQu+4JMju45mCEUuX6Q7KywyCV+Gm9rWjPhPhEKf6g0QCufyst0r
         DyBkJ5PnbdOAJLG6sewHG5nOFGAu4cpsqs1+RrwMSgAyljhq+GtSAybWRobzQSrKIjsN
         3VKCRfs3oFwn6SI8qXXoFUgk2+ipcHBt9z0XV9iDgF/iDUMESPaO9TBVxmSpm4LAPflj
         wCym4k50WzY3TQCpqCc7JPGmgUSfQxdxEjlI4HC8v4QwK21BZ+LPotH/YYKRLwG6YzmA
         rwZTkFdEvNZSmOCfmoy9Hxt7KFkxShq0s1XmtLy8V/TWcgv8NYAC3D0Op+rc1jbUB87E
         VsXA==
X-Gm-Message-State: AOJu0YwIruhSRmDjdoWzqjH/ci5Eov71I1NmN+ZypGy9HMqjOL+gahgW
	xhOFppT6a/AUZLxoFS75RXmYRUY03YO2II6/ulcAplf26CBR8LdtBA9ZXbWg32A=
X-Google-Smtp-Source: AGHT+IEzhQTeyvUOzbM73n6/UlhNMYDPkwd69Foudth+SFHSPLcN9xlo5RsesHZUokYP5x6Hstv8YA==
X-Received: by 2002:a17:90a:ad82:b0:298:b784:c72a with SMTP id s2-20020a17090aad8200b00298b784c72amr257097pjq.23.1707954773155;
        Wed, 14 Feb 2024 15:52:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::b58c])
        by smtp.gmail.com with ESMTPSA id f18-20020a17090ace1200b00298c9790610sm69707pju.6.2024.02.14.15.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 15:52:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layer.conf: Update for the scarthgap release series
Date: Wed, 14 Feb 2024 15:52:49 -0800
Message-ID: <20240214235249.2224401-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Feb 2024 23:53:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5384

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm-bsp/conf/layer.conf         | 2 +-
 meta-arm-systemready/conf/layer.conf | 2 +-
 meta-arm-toolchain/conf/layer.conf   | 2 +-
 meta-arm/conf/layer.conf             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 71f64d9a..543b8c23 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "nanbield"
+LAYERSERIES_COMPAT_meta-arm-bsp = "nanbield scarthgap"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-systemready/conf/layer.conf b/meta-arm-systemready/conf/layer.conf
index 27bb568e..79ef3a14 100644
--- a/meta-arm-systemready/conf/layer.conf
+++ b/meta-arm-systemready/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS += "meta-arm-systemready"
 BBFILE_PATTERN_meta-arm-systemready = "^${LAYERDIR}/"
 
-LAYERSERIES_COMPAT_meta-arm-systemready = "nanbield"
+LAYERSERIES_COMPAT_meta-arm-systemready = "nanbield scarthgap"
 
 LAYERDEPENDS_meta-arm-systemready = "core"
 
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index bce70dac..06494936 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "5"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "nanbield"
+LAYERSERIES_COMPAT_arm-toolchain = "nanbield scarthgap"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index b506af8b..af8275af 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "nanbield"
+LAYERSERIES_COMPAT_meta-arm = "nanbield scarthgap"
 
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL += "telnet"
-- 
2.43.2


