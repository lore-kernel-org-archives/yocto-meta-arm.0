Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C35E6FE32
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 16:58:26 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.3987.1725641901719680694
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Sep 2024 09:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RsqSIRrf;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a89c8db505bso307993966b.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Sep 2024 09:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725641900; x=1726246700; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5CdQcb4d4NPQAvJpHRWFg/X3Ban7dCffayupt8CtlU=;
        b=RsqSIRrfsXAhYYhFid//aNdYJNjUuHVLF76IPR4yOZqbXKJ2DSQ7YJn5sfYsq15Cv1
         RG/UD2VmVrRqkwxcIlWzsvm5qBWc/bUqoeFtFn73OLbKEk7OA/MGg+kIY1y3AvHYKbJL
         4IllJQjPmj/cUXqFX3ngcPUoi8B7Uz3k+ih2jZbTgoLmUX+AXk3iKRRslv/ZwcOT9Iew
         Bzhwif8rMh/YuPmD5XRQ6PeUk810I4xceEG135N4AYutZLyddbGpxn8hLBgBhjaoMGTA
         aXg2g6d0PBAsCBVYnYAPRI/W6MlyFFSVUspeWYdTNxTkrcg9Zki38kY5kU5rG88/Lr8H
         sXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725641900; x=1726246700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5CdQcb4d4NPQAvJpHRWFg/X3Ban7dCffayupt8CtlU=;
        b=P2moP1xUa9e5vfytHq0FH5AUFeme7Q/u8DEPtjc3jsw9E2wwvVc+cjI09sg0CMqm9W
         TyFczAB3L0CF/X0pqwmviEAgWJcjGnZOlUl9SidG6vDp8Rq5rhzfXBz9bDEE5psWByOt
         VqblwPJVuj+yYbowqPpI7dcEo5bR/hS7s3U8iX+vP6HDAwno8ugxgCi2I5xxmbKacibv
         PCwsEG2ESWlpiwV6AXdDzJjUdWWtWz5/JhL7cAj+Mdu2GOn8H+YNJPqEJnOAuTa+Mylk
         HuWwj/utK7mEAh38CgZyGY+8GznNV+QJaNayS/bhZW/ZEHDiWdL1vHWqAzE/Hcq7USXn
         fwTg==
X-Gm-Message-State: AOJu0YzKH2m1sOk115fr9TuuxV77fiQQbhrwbma/Ssu3Bo4fwR07nEG2
	uQdjQzY56/mpGfYCfTI4QbBRpC/piAPE633Phv+IgPmzlyj+i2ekmBdraA==
X-Google-Smtp-Source: AGHT+IGKXH91St+9sY3QUt1Gs3hOK9RWAIW+w2sLBEF4k2xWzD2oDTmh+qLjUBMWuClIVak69hLuNQ==
X-Received: by 2002:a17:906:478d:b0:a86:af28:fc2b with SMTP id a640c23a62f3a-a8a888ec65fmr296298866b.54.1725641899408;
        Fri, 06 Sep 2024 09:58:19 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a70ebd7c9sm240712466b.55.2024.09.06.09.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 09:58:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] layer.conf: Update to styhead release name series
Date: Fri,  6 Sep 2024 18:58:09 +0200
Message-ID: <20240906165809.3715892-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 Sep 2024 16:58:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6066

oe-core switched to styhead only in:
https://git.openembedded.org/openembedded-core/commit/?h=styhead&id=b4cf6d5236a3eacaf56ca2f805b006efac65b26c

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-arm-bsp/conf/layer.conf         | 2 +-
 meta-arm-systemready/conf/layer.conf | 2 +-
 meta-arm-toolchain/conf/layer.conf   | 2 +-
 meta-arm/conf/layer.conf             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 1a458400..4f648ac8 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arm-bsp = "styhead"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-systemready/conf/layer.conf b/meta-arm-systemready/conf/layer.conf
index 79ef3a14..58f84fd9 100644
--- a/meta-arm-systemready/conf/layer.conf
+++ b/meta-arm-systemready/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS += "meta-arm-systemready"
 BBFILE_PATTERN_meta-arm-systemready = "^${LAYERDIR}/"
 
-LAYERSERIES_COMPAT_meta-arm-systemready = "nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arm-systemready = "styhead"
 
 LAYERDEPENDS_meta-arm-systemready = "core"
 
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 06494936..456dbe0d 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "5"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "nanbield scarthgap"
+LAYERSERIES_COMPAT_arm-toolchain = "styhead"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 9e9c9dbd..f2fb5c02 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arm = "styhead"
 
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL += "telnet"
-- 
2.46.0


