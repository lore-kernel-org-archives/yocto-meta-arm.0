Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4C8C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 00:49:29 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.3563.1652143764775510609
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 May 2022 17:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SC8ELIel;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id o18so12524599qtk.7
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 May 2022 17:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=kgEGA2zSUsg7Vc8y5jKOM57kf5W4TDa4EnWjPt4niYs=;
        b=SC8ELIelmCUpPQOa7AXWf3Up3vZTJwUNCkPLxjpf6lYFj/enx/GW7XWTSweL8LyEJs
         TAqrpCn9PACW+ATCNu1h9z8m/Na5tGBpF7rGDkXu9p6HKIDsrtLCnU9vXLuTwnwXSDd8
         e1pMy/KteR91l+AdVb4ibqrNE7dwPTXUzTc/dGPGcR+8HpmR4Y27Jo2B2/WDnSc2Sfw9
         CBFPzSTUophYijMOZGNDoO9WE0BtuTZSQDqFF9yOgJPOkhWcyS7mIgmhmGmGQYthfETo
         dklCbvsk4EOlAJJSoi/b4okXFnv0Sm5eZRW/3fleXhbzYJMAlaR6kkctkFIl2w8dsmv4
         x91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=kgEGA2zSUsg7Vc8y5jKOM57kf5W4TDa4EnWjPt4niYs=;
        b=QwYT1OhFYBCdBhPxvfFbd7lNnb8mfpWbfpETjAourBdneEj9eUDKW3LscA2kNd8R4M
         tuepvgCRouURGFRj0Tqw+ArGLo04wfBaOMC1o6oZn5gKGGRGfeWKPLn5rmlOd79SpSXc
         Ch2pIqbpMLsdP5lU/mUYlYcQ+OqhWw4oE4nFzeUXKHKAci3Xl3QxOOaKpEShC+2mVIzE
         YEPM2yq5BRKcq9E/ESOiYpd5Zqw60IcF5cC0+O9vx/GEErOcVgDT4pNeXuvhsSVQH47P
         NCb9cMfeTpsoSJ9v4zJksxtC6+RNlxRSGTXRSNhw3sPG0LZqNL0VdwwyhSvdf8JNWjOY
         3Fng==
X-Gm-Message-State: AOAM532KsIbKMfBYSAtfGYVv7kMrmYS3CKQoMAVg3knn6/TIpKH7njUl
	PnZN8LRwH8K9KbzZJH1MyMDPZlQEU5hqi83vrr+qTLDa0EE+tw==
X-Google-Smtp-Source: 
 ABdhPJyF9XVNmPNhDMDUhu1vOftso9TXj6md96KTHgYpKuSQsB8j3wwybqSXQ2Li4GTgTKHj0I4UFMt46RJCjvpBMvA=
X-Received: by 2002:ac8:7d44:0:b0:2f3:af0b:dec1 with SMTP id
 h4-20020ac87d44000000b002f3af0bdec1mr17222676qtb.634.1652143763715; Mon, 09
 May 2022 17:49:23 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 May 2022 17:48:58 -0700
Message-ID: 
 <CAMKF1srinq0SbsmN+VNpc=kNdfWo61mZ4mg7hBcseAH9U8q6hQ@mail.gmail.com>
Subject: World builds failing on qemuarm
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 May 2022 00:49:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3373

Hi

I am seeing following build failures on qemuarm ( using clang compiler )

https://errors.yoctoproject.org/Errors/Build/145605/

This started to happen late last week.

Can someone look into this regression ?

Thanks
-Khem

