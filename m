Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7227.1792762833914439032
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 06:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=Wnkxvn79;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91b89c6caffso7705146d6.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 23 Oct 2026 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1792762833; x=1793367633; darn=lists.yoctoproject.org;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCqWhf2i58Z1Y5GygooV8+uOB+3AHaujIAKZToTwBLQ=;
        b=Wnkxvn79VxuzFnSG+4BenKUhlnN48Tt2ec1lb/p+GjcxXwbBlj50T2K3rTjdtVD+gz
         sU4/I/IsnGnXAuqbVTjU3eJskWxt21qbrd2YdwXMeCUU5bCFz1tdC3s19RLQJyZrmC5R
         DztEkelYkIo3zziiSyCJwKvUDTFuiw1Zu/183VADvyuvvCETMpGR+nSR7FBUu3jM7UAW
         EIyk70Ye0dr3JADj//Ho8bG3B3xlSC6ejOiFcV0TyhViRaCa4TnaJKya/Mc1HgILR9P6
         xrt8wtmeW3cRyXFGnfBmMHFOTazoeduff1U5/fKONsdjInU9ujBJNySTa9czYhr64SsR
         yotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762833; x=1793367633;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCqWhf2i58Z1Y5GygooV8+uOB+3AHaujIAKZToTwBLQ=;
        b=p3z7TvqUoZxmO6NytK4M13lnzJuQ5gkHFY5bk8H3jKWSOE+pgpe8igr9+zS2pC0WWZ
         GSuDp0y70Wngz5eOlQsXI0wDZUsqDvQFKmm0KMEYWc37Vtwo6CCMlEMEB6k37o+WJ12u
         0wXTBc1Mx7e0JfA2bBi9vljmeU2+NMQHdoXvPg9XRRdkHLZB+X7YTvepZyMhmgdkfUMD
         N0aKZ9QIzpNyKtzFE6y++iblXHJwVOEvQURBR1OZ1K8g11ziwYzFNcy4PAg8/NjPjrs5
         VqYIa857GVWIMRwr2BYKOSAC5N/1R6cCgKGTkaI0ARv3q2zM6/yrEzWlr6lghdMi8X+Q
         zpsA==
X-Gm-Message-State: AFq9FYJBFOGdzowWLYpfrfIwuHpd4V85nCOjgJX20baPfVB568dmANNH
	i5A0CRihRDTpJS3dFkY9/9tTc5Cj2G7jmQ+54sDFsF4U8n70AcNcOHaP1NuIs5tu/0mbuoOaZxi
	SpUA=
X-Gm-Gg: AYBFou1FuWl5UnVN8hihewu27einW6xq9Aovq3Xz/Ol8J3gbucZGIOW1u5rbL6m+gH+
	uT6v8KfdcOey5yFgCBRkIgxh5iORrSoHgdbt8RixsJCk+g5yXYWaKFFBRcrhgTmj+bxu/sxODkp
	ExPDlyeiEGaUaQr9bTj2kXOLkd/b9KUxJXwac4coyBKfqThUMPmpP9vM6mXMvkQXrIESiMsuWBY
	FkP1SxKvgLn/mpDwDeWee01lGZeTlNd9YmTjbsHpaiDAtwykcoZR5PbFzMf8oABxCeJzUolDBRL
	uE+6zckvwwykFPAWlt8DwvXuI055Wqk+EZNsmENIKKjLQFnOUDXskqaQ2J/6inAYDm2oRvA0rdc
	t5vZSKdCNi551Eo1ggHG3sLrmoPc60Evf/0xbICOYb8Cdq4h99L+G5tbc85BNziRdq62FDJ6kaX
	Od5F7gOYg+LXhc1b5TIjDkil6JSSS/KNOy0i63TeIj7KwFo49T1Q6EEz98BhRSAVw853j95HNR5
	34Kt8Cs9SO2kDCYdJnzkgucE7VB/bts4958XdRHn203AA==
X-Received: by 2002:a05:6214:2681:b0:91b:83a8:2d6d with SMTP id 6a1803df08f44-91c3a8bdba6mr29174396d6.39.1792762831459;
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c450b122fsm2006006d6.2.2026.10.23.06.40.30
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Fri, 23 Oct 2026 09:40:30 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm whinlatter update
Message-ID: <attjzvA7mCiuLBD3@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Fri, 23 Oct 2026 13:40:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7197

meta-arm has released an updated whinlatter support tag, 5.3.1.

This release contains 8 commits between 2026-01-06 and 2026-03-26.

Changes included in this release:

  b295bd407c4a CI: use whinlatter branches
  d9f9fa431b63 arm-bsp: corstone1000: Enable secure debug on TF-M v2.2.x
  de9026e4813f corstone1000: Pin layers SHA for whinlatter release
  d3a9da81bc38 docs:corstone1000: Update user guide
  7b66a1d63afa corstone1000: Fix Ethos-U test build for Cortex-A320 variant
  4f9c410953fd arm-bsp/docs:corstone1000: Update copyright notice
  73460c539496 arm-bsp/docs:corstone1000: Update copyright and host tool versions
  4dc2a7bf29c1 arm-bsp/edk2-firmware: fix build on newer hosts

The release is available under the 5.3.1 and yocto-5.3.1 tags.
Both tags are GPG signed.

Thanks,
Jon
