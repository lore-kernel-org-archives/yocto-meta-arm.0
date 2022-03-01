Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523B1C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 17:44:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.115.1646156697131129377
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 09:44:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=Q0UtNASD;
 spf=pass (domain: burtonini.com, ip: 209.85.128.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f47.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso1870313wmr.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 09:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ooo79UvMEubffE7oevpcfOfAtLoHnpt7C6pin6L7HDQ=;
        b=Q0UtNASD91oyTgHymoBNhRZscwyhAsi12p3HRmNcYl14EmWJaPHeT2lWCho3UQcJGU
         UxRuD+DTD59dNeiez08NnT56iEUWfkk4T/647sQk5T4N1UH/b0aTt1YHyJiFExuqldqQ
         Wbfxfr2RdQMfaQWmQ6dzh6QwGxPAO4gP8oAfQYDtKlxuYxRQ9hwbQyTn10aEScaopLFn
         e5qSsDaJXfGqDaUhewOexxu1WCfwFvJC2RH2DMA7cCyEhrofWk/ZpapBUu6gYHJ0Wx2z
         pCVsSlE0qWr/ecY3S2Bwx9E/N600IE7L7rhzoXzuTs7DEouws+k8Le3dvbUggeyv+vHp
         zXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ooo79UvMEubffE7oevpcfOfAtLoHnpt7C6pin6L7HDQ=;
        b=zyBNC/4vGentnQ3oFKixRd0Fy6qjh/bVLwp8+rEdr6qKtJ8+HaKvSrLcGfQ9KolbrE
         fnnUhrgjCDr17HrOr2QdDWeXvGYw8/E1T0vU4mP57ZvFdxCUSv81uWk6hChgTsj2LvMX
         4a91VWxXs30x4mLJJ1jexaJbxJ++aNEgw5xfoQqHO38PlVn+ynxhqQmUHfazpx8lrWne
         8NMk0rcSQYo8rcehUiXD4DCkgdHJ/ut4ITY6XecmemDxG0HJ7OuqynF8EGcmPG1g7c1l
         oVryxNCefrLIRieNroTsYzvcNkEKRoKPdLh1OevURIGisVVBbrOrYAt3RKHvUNUlkG4A
         oGqw==
X-Gm-Message-State: AOAM532GI9isrCcJZskjb8klg1QHRhnS4oQIzRWlLIZO9wEvbfkIie5u
	MeG0LazNlI2PnziMUfjn6s9VXlXpqh/YVcbRMniR0Q==
X-Google-Smtp-Source: 
 ABdhPJw1Luo/8yfM8U8NLtW2tDIdvq2etisvhqb46U5QCBxerDjdc7nlrjS4fXnIML4wibIuLjyYAeoij0KO0w9ZKJc=
X-Received: by 2002:a7b:c5d5:0:b0:37b:fda9:a5e2 with SMTP id
 n21-20020a7bc5d5000000b0037bfda9a5e2mr17962387wmk.62.1646156695558; Tue, 01
 Mar 2022 09:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20220301101609.40783-1-emekcan.aras@arm.com>
 <20220301101609.40783-2-emekcan.aras@arm.com>
In-Reply-To: <20220301101609.40783-2-emekcan.aras@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 1 Mar 2022 17:44:44 +0000
Message-ID: 
 <CAAnfSTtoLLAAcEdSfd3wLPr-0ygFu2N3qq-KtDrLOT72kZKgjQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/linux-yocto: upgrade corstone1000
 to 5.15
To: emekcan.aras@arm.com
Cc: meta-arm@lists.yoctoproject.org, ross.burton@arm.com, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Mar 2022 17:44:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3089

On Tue, 1 Mar 2022 at 10:16, <emekcan.aras@arm.com> wrote:
> +Upstream-Status: Pending [Not submitted to upstream yet]

Here the status is "pending, this has not yet been submitted upstream". But...

> +Link: https://lore.kernel.org/r/20220214175643.21931-1-joakim.tjernlund@infinera.com

Here is a lore link for a submission to linux-arm-kernel.

So, the Upstream-Status can be Submitted.

Ross

>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3079): https://lists.yoctoproject.org/g/meta-arm/message/3079
> Mute This Topic: https://lists.yoctoproject.org/mt/89472699/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

