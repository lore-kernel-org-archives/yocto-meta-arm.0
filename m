Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D31C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 22:26:49 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.4286.1664231205970022302
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 15:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h8QSbWQq;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso8310082pjm.5
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 15:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=2emR6+pCHiM2KhsZUqiBbQ35pqG7tcg+dYEzWTUOYso=;
        b=h8QSbWQqwAo+hO+qx+/N5/j0SyB9gH2r0pa6UQIn/KuCKXTqh/wRIIIcZeybsPYTS8
         UlQhbTdOHBT8AEn/munXY7o+LfMMOO5oflsxLAkvQKJf9Azw+vYdsn/kHijXd+55i7F+
         CJWkKGZ4H1CMqb0cCfwa2GWD0bSSTRFtcBXIbcqWYsfq4g2CFteI5yV1qQzewb6Hfnew
         8lw60jctKvVEab9D774MnOJheBvbbYlAJp5Iq+205Q8bZO66dSkF0104+bhtY/7daaIW
         0QU9BPLKzs1M9RksbEgG9MlWm0G4a2gTiXsZxjUwlAfFhvFC9SBMPzOSdK05rFYt2ofF
         xr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=2emR6+pCHiM2KhsZUqiBbQ35pqG7tcg+dYEzWTUOYso=;
        b=fe01Yek4JUHHYt/ZdW0tmCYNufS8uz1NbZfFMGvisZFwUYGqMXLQXMajslW1lCsstL
         fsigK7U45bXMRnME/kx6iEDv+oV8MhQToYMVYxI7jtr0nN1mPqWj9Z+NxFjhea/xs4kJ
         ciAtmNNsA+ooFgrptRqYhEz2juBQAMLKKuLNxtAdRUZWeMiDUgaJ2PkvzBhpcnt4Leys
         Urv45rKrxg/JY91hSG5vsnFrb15+ePMDW0vpzDXR8gmgqvrDkge/jvPVnQ+bs3DiCbv8
         hFEEaB3RxDJK6AV1yahPA4hCkAUJFS4lEQBYs5bD4k2wJVqs+5E5ObZcSUDL8ggpx6W+
         9XMw==
X-Gm-Message-State: ACrzQf3TWGxc1jNppIXlEc3k/7ncKX+9Ms1Dm/EqNrpJr9mts0XiUkbh
	5H1Xu+OY+k5qd9NFly9sHf530RaL0HdPtQ==
X-Google-Smtp-Source: 
 AMsMyM5DMMrPtqI5y/pBVoF6MtfhHyqnnniZI1fnAnQ/Gw6TPvsF/n3q6Daa9AWxDG+nhv1LgutIgw==
X-Received: by 2002:a17:90b:3ec9:b0:203:246e:4370 with SMTP id
 rm9-20020a17090b3ec900b00203246e4370mr948433pjb.221.1664231205231;
        Mon, 26 Sep 2022 15:26:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::dee7])
        by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b001780e4e1a0fsm11809250plg.125.2022.09.26.15.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 15:26:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] hafnium: Exclude from world builds
Date: Mon, 26 Sep 2022 15:26:42 -0700
Message-Id: <20220926222642.3105379-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 22:26:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3842

This does not build with clang from meta-clang and also does not build
with gcc either

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
index d90f747..0c4e294 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
@@ -77,3 +77,5 @@ python() {
     if d.getVar("BUILD_ARCH") != "x86_64":
         raise bb.parse.SkipRecipe("Cannot be built on non-x86-64 hosts")
 }
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.37.3


