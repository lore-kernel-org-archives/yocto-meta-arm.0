Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.509.1620746813445301894
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 May 2021 08:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Es964Vjr;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id d11so20549086wrw.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 11 May 2021 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OQ0QZtqA7ayaAxSksDRrRJ5ZLUrOSC07E9Zw/nT/KVI=;
        b=Es964VjrhlaQeFNEOc+0X6Xt/Bat6ZbhTAI6ei9yawQOeTcNaJDFWIavYRypvOStr6
         ow6caMffxdnjdjHECwzZriwEJ9vodfftOvOOkY8RhZONC817q+bkEzFQOKHv8IAYXwDF
         1HqRLdk9gqCxLYH3nefWnqo8UHsQAf4Vt/88iemnaVS4ZYIC1cVTs9+dHf0ZFhvfHuBC
         v6BhknzLrUxeaQRlr7XYhJwCJObKNmVCh+MKEOvPHUUDFpzGDnJhB4Qlw5oEyJ1eWExU
         xLmUhzoB4h1jEWkIcbMOE8hIPCvYr/Zul2ul+8bUKlPFd3B1RzsyHY/WUHtG7xelARdB
         ekhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OQ0QZtqA7ayaAxSksDRrRJ5ZLUrOSC07E9Zw/nT/KVI=;
        b=Sym5mZ28Sm7vi/M2ag8sfEM1E7g3v3yrNhasnG+bB5vLARVNjs6JDNVQtNLxPwnzYU
         sSbZqsXXBcBiZv3ub6iGxZVGFMNLaBY/LfTbgTOW7XvDCwQlJSEv9UjAGnZyEgHBh6x4
         vk6holhQ5w6qktE8MWJJApMvIsUBsmZlC/22z478psPSMQuGa6XyMXMsfJpmEcaXI3QE
         Bof2M9eB8/338FFwBhTKSe4RcmvwUzJGizdoksAFOe+LcgelmUgpKXZOc+X4t2PHwgdl
         nWLquHAFnSu4T1mRsj7u2x2f2zQgpOuaVikWceWox+kUc451gV7d6jOB4MpY2tRxfufK
         1HdQ==
X-Gm-Message-State: AOAM530xbdIdcI/rMSwrzWBaHuWzxvtd9fhHQOI/94lENScET5BvIPse
	vxfDoQ7hEQW6k7/x3FOeO/N5SucMWTpZDjdCAWOlBg==
X-Google-Smtp-Source: ABdhPJyjxuTGtfd7whNt9RtN5DXTyHI3Eo7EbsXWVoAHU1MnU3rZOBpyTwmyvy7LiQREwHO6ToAe+JCGhjq6nxoR7dU=
X-Received: by 2002:adf:f508:: with SMTP id q8mr39192353wro.109.1620746811854;
 Tue, 11 May 2021 08:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210510163254.3243264-1-ross.burton@arm.com> <20210510163254.3243264-5-ross.burton@arm.com>
In-Reply-To: <20210510163254.3243264-5-ross.burton@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 11 May 2021 16:26:41 +0100
Message-ID: <CAAnfSTvV1QGA+YHOyEBckR28Ge9er3OccC9vRntk+GeL1M+R6w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 5/5] CI: add external Arm GCC build for fvp-base
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Turns out this fails if you don't have any x86-64 tagged builders.
But we don't want to set allow_failure...

Ross

On Mon, 10 May 2021 at 17:33, Ross Burton via lists.yoctoproject.org
<ross=burtonini.com@lists.yoctoproject.org> wrote:
>
> This job requires the runner to be tagged x86-64 as currently the Arm
> binary GCC for aarch64 is only available for x86-64 hosts.
>
> Change-Id: If168806883c959af4baf4e3214b86b75c58899e5
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .gitlab-ci.yml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 834e16b..e79d1f5 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -83,6 +83,12 @@ corstone700-mps3:
>  fvp-base:
>    extends: .build
>
> +fvp-base/external-gccarm:
> +  extends: .build
> +  # The aarch64 cross compiler in Arm GCC is only available for x86-64 so far
> +  tags:
> +  - x86-64
> +
>  fvp-base-arm32:
>    extends: .build
>
> --
> 2.25.1
>
>
> 
>
