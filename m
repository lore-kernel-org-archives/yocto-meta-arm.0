Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.107.1610083936148866011
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 21:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WXeQuXfN;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id o10so9303150lfl.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 Jan 2021 21:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GVHB8bmeINUqD/gOELBv/vFIcyQ/stY5tv/Uvd9hIrg=;
        b=WXeQuXfNZAnfkXvDAgsnAwqNZ+MJhZWIQyYPxMiCvFvyPLXfqygBB+1CZBKGKrNc97
         7n69ceSbgMu2NSIEM0hc92p7qXHySp0faLTGiH6fhJDzEK2WF0RtV/THwUh1cYUL/ScF
         lNWLG79Fv8sueSXt5pTTgXzJ85/2KuP2BZMKcGc/ncXSAReUGxh51gmm8U5ViylYr3WA
         xfcArAiKmcxgRWZNvNL7zCgnc+FfmQgDOagcwQN0VnN9lrVVV2lL4slz85X+aK8EAWew
         gEtFN6oLOkNK9oBlDjXxkBtNb9kd7J0RVeLrlwzISoG+Uv6Jx5Cid6rs9rm1gL8SwGuB
         +NBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GVHB8bmeINUqD/gOELBv/vFIcyQ/stY5tv/Uvd9hIrg=;
        b=CZCYNXBzeREC64XRneTa47CujdB/hlxfuPAFoOlaGq1OSU+3v6HED37DGMcx9vwexP
         C863Cqskeu1KGQjugRQP6w95EUC0w2BYJVjEFEhoQ11fl+FRA6VQNU4ajRwJwF95Nv1r
         FWi3y0zObTOsAbE4kY2r+BPKfkq8aF9m7RPSQvbX419PP5ZBwe1WSFynPvBwbjNbQFrh
         byAJskaCIozaqNHB2ZYYp/ZHZ3IMwduRZaTEvi96/cGOAkhy55oljvXMNYeWy9IkOOQm
         zZzkfQ1UnbSOhFedpy+QVEx3Z5T/AEPWw08NXQ34lLkUWDcfhAw32fefHEr/Pnhaef0L
         S3Kw==
X-Gm-Message-State: AOAM532BUCgIZEDpc9Bzwt0ADCnYfpCbIqhC1isAnJKUpAIAhAOs1/iM
	0Syul4mIzvQk6ks7Pda+/ghJAJKrUTrhiEtkoglzjg==
X-Google-Smtp-Source: ABdhPJyg5KkW6IC4KEzOeagRVJdBZtO1wlp+z5Gbz8io+woIw1ZxtSXwlHSYKKqL8bK3V7N9JiwyKfrfwncqL+H8BWw=
X-Received: by 2002:a2e:50c:: with SMTP id 12mr795237ljf.226.1610083933912;
 Thu, 07 Jan 2021 21:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20210107142537.3870474-1-ross.burton@arm.com>
In-Reply-To: <20210107142537.3870474-1-ross.burton@arm.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 8 Jan 2021 11:02:02 +0530
Message-ID: <CAFA6WYM_4um7gzTsei5ZbrVaRgwiHcAZ8ajNW1V=WYYGXfEE_w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] kas: add testing of gcc-arm
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Jan 2021 at 19:55, Ross Burton <ross@burtonini.com> wrote:
>
> Add a build to verify that setting GCCVERSION to arm-10.2 works.
>
> Change-Id: I086fa786b11560a8e94ee646859c59288bacba5d
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .gitlab-ci.yml | 3 +++
>  kas/armgcc.yml | 6 ++++++
>  2 files changed, 9 insertions(+)
>  create mode 100644 kas/armgcc.yml
>

Thanks Ross for setting this up.

Acked-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 9e14e2d..3ae0aa3 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -87,6 +87,9 @@ musca-s1:
>  n1sdp:
>    extends: .build
>
> +n1sdp/armgcc:
> +  extends: .build
> +
>  qemuarm64-secureboot:
>    extends: .build
>
> diff --git a/kas/armgcc.yml b/kas/armgcc.yml
> new file mode 100644
> index 0000000..52b09b0
> --- /dev/null
> +++ b/kas/armgcc.yml
> @@ -0,0 +1,6 @@
> +header:
> +  version: 9
> +
> +local_conf_header:
> +  libc: |
> +    GCCVERSION = "arm-10.2"
> --
> 2.25.1
>
>
> 
>
