Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.55316.1594033653979067121
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 04:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=aZaKHWSC;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id f5so28905749ljj.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jul 2020 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Ga36mjSMyP2YL7/whQBkWbPgMT1KHovRubayML85ro=;
        b=aZaKHWSCVAQQRyLNGzmU0kqvuU5dd9iZJK5H/xLB767IugMiTX1MOzQjSb0oZqB/U7
         bQbZuWzW3/fwxLoGkULMi85EutAkd/jRuAGOWehn6l6WFPhbWOVjkeB8vmnNM6m0jmNz
         WG8NX8ylkcDs2JxPTQ9TmT45b0KP+vIgSZfAgNVrZiccXj2v63Pqx7D4DPqsO72uZR96
         TTLp3R/O55Yvim1s/+0fb28/+JcXybhDUwNACq/o9LLSlB54mMx/X2sfuaxAmms5QlQH
         TzqMnBULkOsDWyy6ztaXBTlyY2ntGqJqhw8qvX1PQOSgwPdYNbNhuvYZTzM5B/uR65gr
         YtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Ga36mjSMyP2YL7/whQBkWbPgMT1KHovRubayML85ro=;
        b=LRbh+FhsLLgFd6XeVEn67xGdPhixoCbCLSVXtzK45FSeFdjHZ+TcSPFZDhSlNfsX3U
         Bxn/+XDSLOrfZkCyTKBP1+UE3BmLR3EG/WAQM088lb4dKNr7nyPBWtFhC8gRO5DcPTql
         cs6aQ8kkTIs4ibeyYFiUbMaVMlCgPSBXJ/1fA/PasbpQZghnzp9keZnqDxt+WABETEdU
         qQ9V02QoD2ZtDMh+0hJuyHP0xK8UPs5nPcl+mbqRLw68lwNApfrjvA/2GAswvEMyl3gC
         gcuMWcS3Z69sepysfDRoPfo8Dg6atqhTxRO7d6tlbS+menu01l32dOpboC8qflyhW3b6
         eGJw==
X-Gm-Message-State: AOAM531BeFBjbLm3TrYM/EoaZqV4IzrgdJtcnFm5X8iKb57eBJJzIK5N
	y5p7KrOgSCI4lYf8iR8zC6IEZDAU20j+JY8JDbtbaA==
X-Google-Smtp-Source: ABdhPJwxUHuloEB26Sb0m2kaEUMrp+7DlzwHnFivuQs8U+QAMjW45vFuGcdRaelSE5qs+RM80LaPi95wxNEy82MIaoo=
X-Received: by 2002:a2e:9891:: with SMTP id b17mr23793388ljj.22.1594033652108;
 Mon, 06 Jul 2020 04:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200703145233.2494070-1-raj.khem@gmail.com> <70b0c7092890fb9841969d1d0df52b2c9fcccac6.camel@linuxfoundation.org>
In-Reply-To: <70b0c7092890fb9841969d1d0df52b2c9fcccac6.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 6 Jul 2020 12:07:21 +0100
Message-ID: <CAAnfSTvvrndnMZo9s4RwNLLp8iaB3JHuotKgmNgLQVFJKCdmrA@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] meta-arm: Use dynamic layer magic to build trusted-firmware-m
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Jul 2020 at 21:15, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2020-07-03 at 07:52 -0700, Khem Raj wrote:
> > trusted-firmware-m needs arm binary toolchain to build from another
> > layer, this is the only recipe thus far and its better to hide it to
> > majority users who may not be using trusted-firmware-m and thusly
> > meta-arm-toolchain, folks who need to use trusted-firmware-m should
> > explicitly add it to layer mix

My fault: the layer ordering wasn't quite as important before, but it
is now.  Testing a fix to autobuilder-helper now.

Ross
