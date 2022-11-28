Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52AAC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 12:19:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.116295.1669637973423224047
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 04:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FBwTZWy9;
 spf=pass (domain: linaro.org, ip: 209.85.128.44, mailfrom: rui.silva@linaro.org)
Received: by mail-wm1-f44.google.com with SMTP id 83-20020a1c0256000000b003d03017c6efso10790186wmc.4
        for <meta-arm@lists.yoctoproject.org>; Mon, 28 Nov 2022 04:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m01ZmZyZbTsdnLKp5tA2XsuaTWJJXwF2lVqhHNJLVyc=;
        b=FBwTZWy981G1FrUISllcPY3T4fzD5wOo8ymrLGA+9sXaz6iKDvKqU3ILgXO+jW4yAR
         ngkvYh8wkJnDaFxG2oQ1bVZJ+hNM/o0Cis7zqP2ZiT/k7mb/O8P1xJG7YiK77h2FAZEu
         r+wSHL2kamjz2nWsOC7u3W5AY9gh1Bry6hmtwDdes5tVrx4LCsjk94VInjkmz4Hi67eC
         3QueNAEvr/2QQnG/Q/NkGgFOWO8GCSBmQtzfFuHQw4c1XUkdV6smnmh5UmddtdVdXWlt
         S2j5orpWvILSKq8WO9IW4jNDXCE3cfLEpjGgYUZ9HuEHF+o3Jxz8j5dzVTeaso54wc1c
         IRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m01ZmZyZbTsdnLKp5tA2XsuaTWJJXwF2lVqhHNJLVyc=;
        b=FFgKZuGtwvH3Gc3PByOXosN8U0fcjUbv2hPsASpPQkau50CsEs8OUEoJ53ecRriCve
         H5jL5yA5YqlE1P5U1qqDNYgutfEUqkCsweD8Hy3DJHH6gRg7xzBMjDapp8270yCL9bIW
         un6ckXzL8WwHQrtC+E4sLg3wkFdl5AALIw7b7YlYA4DzOhUZXig2wDBB/7JHOr3O/SVC
         nWkDauY6TzFK7WG8+C7kOYrcMqIxH4LJSamFzQCZCQNwsUXN2CZndlpYHjEz2E0mAzP3
         9DwDODcDRgToyMd9IVABOljBgu2/d38+Vx2Alr9Z4zImNBLwXI1ubQYX3giMw6Q2tezs
         z8oQ==
X-Gm-Message-State: ANoB5pmiAMHz1W2gRgzhhP+eg3bhSrjRoaR1cGSbqmE9ECQkfYYFmQHQ
	jTu+ph1Wz/ktq1sL+xMsgXY45ECNg4Odow==
X-Google-Smtp-Source: AA0mqf44tR6wg/63knL22I62CnP3HFZ/IvDLMQgwwGRSBEg826k3BMrd65BYjOLT6+IDL2i0ptJWcg==
X-Received: by 2002:a05:600c:a382:b0:3c6:bece:49b5 with SMTP id hn2-20020a05600ca38200b003c6bece49b5mr31720381wmb.160.1669637971604;
        Mon, 28 Nov 2022 04:19:31 -0800 (PST)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003b4c979e6bcsm17970869wma.10.2022.11.28.04.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 04:19:30 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH langdale] kas/corstone500.yml: pin repos to langdale
Date: Mon, 28 Nov 2022 12:19:27 +0000
Message-Id: <20221128121927.3949299-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Nov 2022 12:19:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4167

Pin repos by default to langdale release branches.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 kas/corstone500.yml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kas/corstone500.yml b/kas/corstone500.yml
index a454a469b7d2..5e1b9e64f60e 100644
--- a/kas/corstone500.yml
+++ b/kas/corstone500.yml
@@ -5,7 +5,7 @@ distro: poky-tiny
 
 defaults:
   repos:
-    refspec: master
+    refspec: langdale
 
 repos:
   meta-arm:
@@ -16,7 +16,6 @@ repos:
 
   poky:
     url: https://git.yoctoproject.org/git/poky
-    refspec: master
     layers:
       meta:
       meta-poky:
@@ -24,7 +23,6 @@ repos:
 
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
-    refspec: master
     layers:
       meta-oe:
       meta-python:
-- 
2.38.1


