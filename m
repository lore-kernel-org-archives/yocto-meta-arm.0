Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.5808.1603441530556473664
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Oct 2020 01:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=aYeA8dvw;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id 77so1083497lfl.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 23 Oct 2020 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=38Fndt32iMJ0kSp0uRUtsw/LnZevBAifvnVE0rcWuQU=;
        b=aYeA8dvwFgHg8iuklHgQipFonmeJ7wg44wl16A2rS9e9bdkVs6C6x4hEUf/dFrMIOz
         ZHXRKPhx9iMJQov4+0uZcO7ktlbMtt3D4OPjCoNE4oyI7Ad8GjQ6UFg/Vkv8EVc+QA5n
         9wfPekSpIegvZGaM0dwkI5VrH/fOqvaVMnqJiSBICJmGykAwtdU15qwGWwlt2FgUxqPL
         PQvh1dwty22c+HlN3jBqmqLcX5R36XgGQ4dmbfbicr3BIzalAQYVPX5pPVZQbYCePbSR
         VdsLNywYt1xJxdMoIL0YHB2ykkTWkk3FN0JnNUy+y+TPRaPSeGz/hVP0VVw5stKdGnlv
         ugcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=38Fndt32iMJ0kSp0uRUtsw/LnZevBAifvnVE0rcWuQU=;
        b=JbYMetQOUti8thovSzU4S10QyxoB/Onw6zWKIScL1Y5RKOL0RXFKM2aNa6V+sOpNPR
         J0ahfUiSqpUrmLVP7u5Wj0Z6Yb4ErXOrgtzhTrhXxQF7a2+cjUs6LoKMkz1RTV9esayA
         jPZ7G/cab+vxFZMvewOyzeK4ehlsMvEGTx4Rme251Ry+MqCAW/Js2q2Q7wGgD2vmcOpC
         xo7ahPC1BkNgsUvlQ0C0hMubBZJ6hn6C4qf43eMUFGowmh1DanEmTUfzxo6pF8BXsBoy
         i1XvYBILwsgMdDfbKqwUsI3TBx5zORcBpKkP+L6f/0i0i+cBEIj0EPPUM/7VY2CC9wZ9
         5z1A==
X-Gm-Message-State: AOAM533QykX90pvAjXoC+xNwhnbuSA8xA0wN+8oq+rArDMmMCeE/xHEr
	P26XJ41fE0Iuegx/w/N5kaQ0nDPjXYbKlIE9toGbJQ==
X-Google-Smtp-Source: ABdhPJyuZEf+Q6+49BS7DDo2rd1bc8MbDU5Ahc4kU3huLU+7RM9SYHKxDOGLurgaUwiyST/LuDsnSMdF6D/D1+Q65oM=
X-Received: by 2002:ac2:465a:: with SMTP id s26mr362996lfo.125.1603441528672;
 Fri, 23 Oct 2020 01:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>
 <20201021172340.GF19155@denix.org> <CAAnfSTviL7v4i=YVO78ANwTH6859iKivy-Br+AQQXogtG_km9g@mail.gmail.com>
 <20201021185859.GG19155@denix.org> <CAAnfSTtRhQt_nFT4wbEOVT=p5Bqo3hiGAgKO9GCvN9Ph5sY1YA@mail.gmail.com>
 <20201022214503.GO19155@denix.org>
In-Reply-To: <20201022214503.GO19155@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 23 Oct 2020 09:25:17 +0100
Message-ID: <CAAnfSTtWSay7zgqFvhc5wfRig8DdM-8TaHNmdYZUXnzxnvYq_Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test recipe for systems comms
To: Denys Dmytriyenko <denis@denix.org>
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, meta-arm@lists.yoctoproject.org, 
	Lakshmi.Kailasanathan@arm.com
Content-Type: text/plain; charset="UTF-8"

Yes, it was actually RPM that was the holdout.  See
meta/lib/oeqa/selftest/cases/package.py:VersionOrdering() which
exercises the logic for each package manager.

Ross

On Thu, 22 Oct 2020 at 22:45, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Oct 22, 2020 at 03:03:33PM +0100, Ross Burton wrote:
> > On Wed, 21 Oct 2020 at 19:59, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > > Yeah, I know this is Debian convention for things like -rc1
> > >
> > > And OpenEmbedded convention for this case historically was 0.9+1.0-rc1
> >
> > That was because historically we didn't have ~ support.  We do now.
>
> Oh, great! Is it supported by all package managers, including opkg?
>
> --
> Denys
>
> 
>
