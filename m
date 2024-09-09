Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC53ECE57B
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 09:48:53 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.49137.1725875328465761954
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Sep 2024 02:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dljvJ1QA;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c3c3b63135so4309017a12.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Sep 2024 02:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725875326; x=1726480126; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BXPQWF/yXG0Mf/z/wzBdYYY2hFOXlEp9ykWAOsD3sfo=;
        b=dljvJ1QAO0k4EHpC3aR9iAKg3wwN4cWrXSocgKnfX/r7E66poVbfg+RQSPYMuQ8fgu
         fxKkhhHTK37SpE5RsZLueTrR/Tw3SkpAdFZBnl9uu67ZEiR63GNku5zCbNvtQunySnwv
         i3z1ghQ4V2b/jgDFByGF6WbHMmdRh25crl1fO4vX/FmH1a1F89vl+zk1VKJAixKci4lh
         QhULTO5lpZDdT+vaPuSO5lW4zVCPpriNWE1r3LgdHJAR7IZi0U4FqT7IoRfiszH0v9xX
         tTPREpwvKX2BKR0weQT8bnIYIfUUgO4gHdiCMEPhMMPryBiEdStinr8EPWkvOMCMC7g0
         C10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725875326; x=1726480126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXPQWF/yXG0Mf/z/wzBdYYY2hFOXlEp9ykWAOsD3sfo=;
        b=rIfhngLaa2OnpJyfwCBM/XDpd7TT5N6LCo/wMmfQFbPQFKwl00jNPRFhWPX1Z1k4Eo
         /ZPRRQbD8RgcgDgP42s7LGRX4J9hI8QSWKFNU1i+b02Gvu+JACc6orE7Vn66uyDPwf5T
         m/6wwnUIp/bUP5mw9fwvV7AbeZWRkVEesx6ncxEmvxuGiIXAY0hPGejtkwqvCgkJdGuO
         8MdDYnBGAaQE4Pc1AzxvoiswAetSpnB/zqaGF7hbOfz/1PV/ZENYOJxQ2rg/3eQYeWBu
         CwEUWqr2xcGfoxMv65XRKjzvItHRw0Jo4TFyxZQ0pocDKRsgYe3/1NaRiq9ENPLlHxyx
         uHGg==
X-Gm-Message-State: AOJu0Yy7UhVrrtCAy/Ln9KdI4MSwjypkMg1O7JZZPaRn76tkXx+BqXpG
	FlJax2m6sU+2vm9MZDLetGDIxSn0NkIYNoPoziBq4qwrTAgHhVDWCaQCew==
X-Google-Smtp-Source: AGHT+IEfvoSr3J/Ou4AjXM7LUnvEiRB+QLH/KraHbHxC0sm9nrRSUkeUNw6Ec8N9SXNXStVv+EWf+g==
X-Received: by 2002:a05:6402:4312:b0:5c2:43a0:47e3 with SMTP id 4fb4d7f45d1cf-5c3dc7e3856mr7376918a12.36.1725875326207;
        Mon, 09 Sep 2024 02:48:46 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd8c4c6sm2796652a12.86.2024.09.09.02.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 02:48:45 -0700 (PDT)
From: max.oss.09@gmail.com
To: meta-arm@lists.yoctoproject.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [[PATCH] layer.conf: Update for the styhead release series
Date: Mon,  9 Sep 2024 11:48:10 +0200
Message-ID: <20240909094810.2801445-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Sep 2024 09:48:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6067

From: Max Krummenacher <max.krummenacher@toradex.com>

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-arm-bsp/conf/layer.conf         | 2 +-
 meta-arm-systemready/conf/layer.conf | 2 +-
 meta-arm-toolchain/conf/layer.conf   | 2 +-
 meta-arm/conf/layer.conf             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 1a458400831a..4f648ac885be 100644
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
index 79ef3a14414a..58f84fd9c8c4 100644
--- a/meta-arm-systemready/conf/layer.conf
+++ b/meta-arm-systemready/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS += "meta-arm-systemready"
 BBFILE_PATTERN_meta-arm-systemready = "^${LAYERDIR}/"
 
-LAYERSERIES_COMPAT_meta-arm-systemready = "nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-arm-systemready = "styhead"
 
 LAYERDEPENDS_meta-arm-systemready = "core"
 
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 06494936ec7a..456dbe0d0459 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "5"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "nanbield scarthgap"
+LAYERSERIES_COMPAT_arm-toolchain = "styhead"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 9e9c9dbda13d..f2fb5c02b29b 100644
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
2.42.0


