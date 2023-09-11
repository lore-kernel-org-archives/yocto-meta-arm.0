Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903C5EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 18:14:47 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.4832.1694456078528502846
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 11:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rmHLw9nC;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68fbd31d9ddso1068391b3a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 11:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694456078; x=1695060878; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5czwqUa048u4WQPwFmxegW31lOrjb6Y56LvCSLTar7g=;
        b=rmHLw9nCaih1Yg1Q/zD14eaHJzBPAfGKMlI02PHorIlA8tOoY8FzWe1Of+2dsKOwDW
         dYEbtoZdpT/zG84D7WDqoYfin+1N5516eUDTDWc5nnxvlXJb2KC0r7hHZQr5LRHXuudR
         hRfeIefxF2TuvV/ko8FvvXIM6VZflAjRAwr5FcfFdoFax1aJzUJzsxv0SN+ufy5UWJqJ
         cBVWOiek9wCu5JH4zAv9HRqvGw59b0cLTL73+btKNnzMWfz4RAEeLcdlVw1O5HLfqDFD
         9lthCJeYB0LrmTXuhflP1z6Hj6SoKCMchhGsDl8/QjVBiVKsbvJMAC8yuYkLTSXDAiTs
         Jueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694456078; x=1695060878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5czwqUa048u4WQPwFmxegW31lOrjb6Y56LvCSLTar7g=;
        b=RJmnhMbychrtMipkaf71WESAplibvzoQpK4mAnhA+mfWseRyHueqWEMtHFKDQ/qY2Q
         aMug04EYavG2LcYYg/DNHHu2qUWZp4WYpmQ0SiVXO8nEoCideKEEYH3oPtbFNPKl1lJ/
         yTbR0Fa2BaLykpY0ryVWaYv1aqOqz7Sdfs6d6wndy7X9UO9qFUuXE9is3nG5YtHUtxou
         86/vZMbentEXHjyIWoa0HmM1lL3Y4ajvXbcwFlNWALouni50878P4KUUJS9ypszb1oO/
         PoYVRZ2bAlOOtSCPre/eDRz45kk2Zi9CKhqdGIkZdaGOoAc1Pv9qWuQT6B/pwUdJ1Jyf
         EiYg==
X-Gm-Message-State: AOJu0Yz0PWNlPI2ko/qJ+9v76Srn90Zn5ihm41jFn23UHZlfgrpsDxCP
	fB0waZElh6jp/kb9yLhKK3meyyLgtpk7SA==
X-Google-Smtp-Source: AGHT+IG9VYYsvJwJLXeDLYOOpG7snb7rAPjDLt3mGpNvb7E1HCHQXVIfegM8ZS9wR6v7AGvZVReqKg==
X-Received: by 2002:a05:6a20:430c:b0:126:9081:2156 with SMTP id h12-20020a056a20430c00b0012690812156mr10327187pzk.4.1694456077587;
        Mon, 11 Sep 2023 11:14:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id u8-20020a17090adb4800b002684b837d88sm6101621pjx.14.2023.09.11.11.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 11:14:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layer.conf: update LAYERSERIES_COMPAT for nanbield
Date: Mon, 11 Sep 2023 11:14:35 -0700
Message-ID: <20230911181435.54905-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 18:14:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5034

* oe-core switched to nanbield in:
  https://git.openembedded.org/openembedded-core/commit/?id=f212cb12a0db9c9de5afd3cc89b1331d386e55f6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


