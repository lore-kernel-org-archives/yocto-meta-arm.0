Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web08.8435.1620707772458378827
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 21:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oNeO5Qbr;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2so26683010lft.4
        for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 21:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zFMgS9gD87EEmomRtP603xh3+88vilKcquDq19Q5Q4U=;
        b=oNeO5QbrzYILwBfyh80NNCCSJRxchA0RbRx+Psx0I1rFiHHkHmo+XdcvCW9OID/9jR
         kkSpT1cMCpkDgwgk37mXZWXC1yMiepouyC8dVI5R4yRKRqwsi6vSv7AqHhFrEAv1fUy/
         23evSvNsCJsTko1ryaQMjF1m09GdFDoCPEz7HDKE3dOwZ/aZhGS1TN7y2nsmanl1NBB0
         YP1HaIsc8TdeI1GM8iu8OZodbWG46lhN8dongjMrivKpIqZO3Nu682gQQjZvwpyvEEap
         Tb/eaw4JQqMTTi0YUrBy6QXTvhGU/fivi2z1q9/BMtC/DcEhXzYKNaBC2h4GOvQhb2FN
         3Hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zFMgS9gD87EEmomRtP603xh3+88vilKcquDq19Q5Q4U=;
        b=h21BEXjw/pCJQ+4xOlseprFYqH3tqSHj3oGTivmdSTTDDTr6sLGPdYqoFibkUHk6ZN
         ThiGDJEvaVtzqJOYCVINsRraZwmY6hB4fhf+NdFbLaFndAKdKfpNjsQ8PHk9AO5u95lo
         Ykfhy90fW6tC+Wy3rQvCSQINP4/aqjvOwhhqOLoeBn9Rw2n8KXzIm3coYATLbgc8w3H4
         wQ9ueHA3VoxqiNiKLKY7IfsEUoWlFt6tFZ37Y2wBZQ6qousPLQVc6GaPHiqyLZJl69qr
         Rx4Ei2Rq8EXZkhKWSA4nC289bLiZGu6xRMN+XLGsII+cf1UGih7qjDANvByBu48VqkfN
         0p7w==
X-Gm-Message-State: AOAM530is9LJ3ersmJSMWanv2MLFqgx3M1sLvO/ZU0SxMC8pv5gP86ak
	bdKNrWmlETaCG29tu45gB+9G6J8QaTZsSNCyGBEFLA==
X-Google-Smtp-Source: ABdhPJzTyefJoxiDgIse3Pf5+I+stMAR3XhfEUXMiRVyu7GyqxShF4JgEvg7DIDdB1jjHdpKatyVYcTWUdTl02yrn30=
X-Received: by 2002:a05:6512:3591:: with SMTP id m17mr18962996lfr.302.1620707770489;
 Mon, 10 May 2021 21:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210510181635.3252727-1-ross.burton@arm.com>
In-Reply-To: <20210510181635.3252727-1-ross.burton@arm.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 11 May 2021 10:05:58 +0530
Message-ID: <CAFA6WYOd_hGzeP+CAvqb5Oih8aG1k4uLAeZTu8KC6OSUvXGy5w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain/external-arm-toolchain: inhibit build dependencies
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 May 2021 at 23:46, Ross Burton <ross@burtonini.com> wrote:
>
> These recipes don't build anything, so there's no need to depend on a
> toolchain.
>
> Change-Id: I49b641fb54839c30255a11a7c9d5798c8e4afd2a
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 ++
>  1 file changed, 2 insertions(+)
>

For the series:

Acked-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> index 2fbabfb..046ab62 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> @@ -1,3 +1,5 @@
> +INHIBIT_DEFAULT_DEPS = "1"
> +
>  FILES_${PN} = "${datadir} ${bindir}"
>
>  BINNAME = "${@d.getVar("BPN").strip("gcc-")}"
> --
> 2.25.1
>
>
> 
>
