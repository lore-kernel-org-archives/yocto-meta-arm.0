Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09C1CF886A
	for <webhook@archiver.kernel.org>; Sat,  5 Oct 2024 02:38:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.4608.1728095902219983220
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 19:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T26LFWMV;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71dba8b05cbso2703667b3a.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Oct 2024 19:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728095901; x=1728700701; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkjG8CWYd0bATlIhZPiWznpyc3QKi7EBI71XAYbVCzs=;
        b=T26LFWMV3BFWL9J5H8FNuvx28uuqm3sDCuc+jJK8gKJ8UWe5FZd85GiKaz80HDdxoT
         HI2AeZrSnrPVjMzCBTLLQfyr+sKZSUf/hO5LvUOeWsd1m4Hx3ppdX5Ub1BeiaBwZE0Vm
         sFPSQxzaDub2DC6hDME05L6STaw47F/ur/hIoSDMetC2s0LVc2obgjEPvfvWr7DeRAyg
         6sH4ASP7DI7rDfyfhQ/ObbB2XoX90uDnlIWUacnVUqdADFAhVVwpDzNpWjxs1fdjDoeY
         qlkZ6Y2sQ+Sx8sgbuC6dVZ1ZSBo/2SfpFE2Up2b1CVd9BfvFlZV04Hy9oSouQmt79TJG
         UmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728095901; x=1728700701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkjG8CWYd0bATlIhZPiWznpyc3QKi7EBI71XAYbVCzs=;
        b=vDTWTF8frsdEElQBB1RtEYLRUl1/9Suwcjbph6PLGtaob+v1K02SF8QPtM77dMVUL9
         SZ4HH2lNrbucLfBy7DOopL0dXIttMFkeAGo1JBSSTx6y7JCsvlolVJctOZmg2YAvDaeH
         bE+zulb/VDSpLuPtr6fx7/42YOKWvYJDh+GD78ojYRlYLjKoo9lQ/6FXd7ut/CNAZsP/
         GAgK8GTlxr8x2hgeqfOE+1U3kqUP3JJz0NIREMKCMqte4AenJdIlysV1fWYZ3xT6dyft
         yWTzJHtOWNmagKZ3JHSxvKf3hnqXcf/USXXIygqXLioqpigPaSGzxSxksh5bdc+O5biB
         3uLA==
X-Gm-Message-State: AOJu0YxcNf6qRg46eSNutseQPU6sE/MY4oqf2pwjVnOLbDccMaYRtFiH
	+mjuXMZ8C79vK5ccFzfJD9V8ZGcZcK6k88CSb6YQRJzkAD3OJjSbCa8CTFBx
X-Google-Smtp-Source: AGHT+IFD/YvYAfbBsA7vJXmbWBqEwpyI8z/uo2EBn6FHRrh6uGDpvRqA9j9n116WG4gVLsMI/v8/Vw==
X-Received: by 2002:a05:6a00:890:b0:714:2069:d90e with SMTP id d2e1a72fcca58-71de24690bcmr7588280b3a.26.1728095901365;
        Fri, 04 Oct 2024 19:38:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::23dc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d452a9sm571265b3a.123.2024.10.04.19.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 19:38:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layer.conf: Update to walnascar (5.2) layer/release series
Date: Fri,  4 Oct 2024 19:38:18 -0700
Message-ID: <20241005023818.1689930-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 05 Oct 2024 02:38:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6174

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm-bsp/conf/layer.conf         | 2 +-
 meta-arm-systemready/conf/layer.conf | 2 +-
 meta-arm-toolchain/conf/layer.conf   | 2 +-
 meta-arm/conf/layer.conf             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 4f648ac8..bbe28be2 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "styhead"
+LAYERSERIES_COMPAT_meta-arm-bsp = "styhead walnascar"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm-systemready/conf/layer.conf b/meta-arm-systemready/conf/layer.conf
index 58f84fd9..263b38d1 100644
--- a/meta-arm-systemready/conf/layer.conf
+++ b/meta-arm-systemready/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
 BBFILE_COLLECTIONS += "meta-arm-systemready"
 BBFILE_PATTERN_meta-arm-systemready = "^${LAYERDIR}/"
 
-LAYERSERIES_COMPAT_meta-arm-systemready = "styhead"
+LAYERSERIES_COMPAT_meta-arm-systemready = "styhead walnascar"
 
 LAYERDEPENDS_meta-arm-systemready = "core"
 
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 456dbe0d..38ccc7ee 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
 BBFILE_PRIORITY_arm-toolchain = "5"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "styhead"
+LAYERSERIES_COMPAT_arm-toolchain = "styhead walnascar"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index f2fb5c02..3c38e769 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "styhead"
+LAYERSERIES_COMPAT_meta-arm = "styhead walnascar"
 
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL += "telnet"

