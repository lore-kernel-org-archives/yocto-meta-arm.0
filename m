Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3850C61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 23:11:33 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.18647.1675552284375505507
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 04 Feb 2023 15:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UIwvYAbu;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id jh15so8730515plb.8
        for <meta-arm@lists.yoctoproject.org>; Sat, 04 Feb 2023 15:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0uHs6Iv2aMmki2f4yCKdciwrpyjFzb0gmCV+DoxoJGw=;
        b=UIwvYAbuYVLpDkEvEiJp9yZ1wAcf/YDmZMCsjK2rjH07tFhXFnr5W+MaRILo7rTtcc
         gi9PEwuELasHly2LDL6aGHblC6TmtH+C+ptBhCZ3H+rPJdXNqORRtJdjd2bLgM+eZbsS
         2uGCyFMKGjFy5fLXvx03LyPaI7iIjuyXzaFMvJy//bDGIm0IvYnQ1SdFKcKCWvFkiecB
         p7/Cv/Gv5/RreD632w1QO3B9+CzEHDf4PaILPjUCs4gV4jb0AulUAr49oq+G5Cg7n3Cs
         yI+dDFGvUBiuA69iP+nOjrfGYUZZFenp35yXKUsf34+7HwZBlZOTapNJKNHRixQo9ydd
         ZYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uHs6Iv2aMmki2f4yCKdciwrpyjFzb0gmCV+DoxoJGw=;
        b=Wj4V+CnyFxX7r8pdaMc452GjV0yDlCkp3bV04AJ/CI9HKBasKwbIxHzPWdZIn2ftmL
         G0V8mlCgQYaPDUu5ZQa5+zX6VQuEMeJqvzODB5K84TJkspmTd8ez7vTwr4+7Ej64/e11
         /R6/W0Gr0Juc6ofTcqwWpAmkr6+7iQRxQZesAxAQh8U4gokUa6KVQAu+Tp+atDTUrwlm
         2yuFJxn8JMzGz1Rb/TVExr/S6sFvkfvssWFBuegwn9tj3L2CI9gmW85p7A6uxaAijhcd
         tCZey2+NHx9677mmYr2VgNOrf1/OvXCwK/gtvK0SaOYO8k99jIoYDcqjh0nnYUbp72qV
         Hikg==
X-Gm-Message-State: AO0yUKXctDvdTcnqTpRb4r8zGytpDsd+VsiZ80fZTOlrAQzb3m2JOSFJ
	S4c3HBE2XNYk6jPH3200G18Yh/GXiDg=
X-Google-Smtp-Source: AK7set96C91P01KlbINK4UTU15V/wwPrh/cD8wuRgPI4cJf154Z++VgBy5bZPFSuAe2vLvYzpPuODw==
X-Received: by 2002:a05:6a20:d043:b0:bc:57a3:e6e4 with SMTP id hv3-20020a056a20d04300b000bc57a3e6e4mr17215831pzb.34.1675552283461;
        Sat, 04 Feb 2023 15:11:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id x4-20020a17090a6c0400b0022bfaf41662sm1688201pjj.46.2023.02.04.15.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 15:11:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] linux-yocto: Rename 5.19 bbappend to apply on 6.1
Date: Sat,  4 Feb 2023 15:11:20 -0800
Message-Id: <20230204231120.3380708-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Feb 2023 23:11:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4359

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{linux-yocto_5.19%.bbappend => linux-yocto_6.1%.bbappend}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arm/recipes-kernel/linux/{linux-yocto_5.19%.bbappend => linux-yocto_6.1%.bbappend} (100%)

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
similarity index 100%
rename from meta-arm/recipes-kernel/linux/linux-yocto_5.19%.bbappend
rename to meta-arm/recipes-kernel/linux/linux-yocto_6.1%.bbappend
-- 
2.39.1


