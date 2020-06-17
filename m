Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.7203.1592399476649273317
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 06:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=FQKrhNqF;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id e4so2793018ljn.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2020 06:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q8WqSDuTBVe/28hOiRztk0c6NFdIfaHR4SbSJZ6SY+k=;
        b=FQKrhNqFB2mew6VFMW70sa5D769qCpCy9Um44w/xbl8kZeZc5J3NeeAyo48r7yeGkZ
         Snh9kEnzugq36b1tIc6yf9nuBLGrVnwevL+Y5kQtnxwO7lSJ5dGxss93AlQHC3TBYZM4
         /Zdmzjyexj+ZUsb1wW+NvHijxWuBQ/l4bXguD6RXv9/K8Qnuv+C6tqEjBFtB3ka8348w
         PQwFQI5TOBlJOBFMzgUcTcSFapGI+G9SLgzyWavVPtH7dkeMZJdSj5LJMUTDKjyqpgMU
         4Y94OpAOhx5ECa+Yr+yfKdfmvKGq4e3e0hn4JrZENa6dMcnk533NqragCR85pbpgciN3
         cKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q8WqSDuTBVe/28hOiRztk0c6NFdIfaHR4SbSJZ6SY+k=;
        b=JGq1CHvD86weweyjWGkNb3CJdvMKat+mELGP4BPHvQzH24w0kJg4I7NjssjnZ9rpQX
         4fT39BaheCxmkjYjc2n/gwQnkfgdqXIj8e0FNrMm/dcs18P+/vYRE0do3o1F/0hw0obr
         ZhGiCo7kCxJHxt9c96v3bwVCyyeL8N/f4tlUGpuiZjal3qYeNhtFM7rffdgonLfdo64Q
         SXlmGNnJNYip8Oiaqkz+tfw/AiAPrA1lUAerB3hL+hLYyzdOkvz2rcy1xcjBNLPFuTs7
         +H4Q96OgXQCVhY3STnw0Ycsd6XWrGTPJDjRyDHV+R4oQLxzmWc/fOWGW7rggzZ7IDF8Y
         0ByA==
X-Gm-Message-State: AOAM531OJYxssCHBKIV0azN3nKhK2yA72huQ8hbhnR+7sRLHNRyiEeto
	uAzwahfvG6/m10B6CHWrDgwzF82RZjyMyfQceYGaOdbwEhmWsw==
X-Google-Smtp-Source: ABdhPJyobfb1Bk67K4xTuJHsqtbrMKjRlbS48tYDfh4qzoPcJB3FHoEvk7jJeE4WqwBuymLiC9eTLWQEJlwYR4F0WH8=
X-Received: by 2002:a05:651c:2cc:: with SMTP id f12mr3822791ljo.329.1592399474787;
 Wed, 17 Jun 2020 06:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200617081702.18172-1-khasim.mohammed@arm.com>
In-Reply-To: <20200617081702.18172-1-khasim.mohammed@arm.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 17 Jun 2020 14:11:04 +0100
Message-ID: <CAAnfSTsPRZdrhxib7LBy0ZmeQnUPUgdVPK7MvAoJ4hS7t=vH5w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2] arm-bsp/edk2-firmware: fix destsuffix and PV for recursion error
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com, 
	Diego Sueiro <diego.sueiro@arm.com>
Content-Type: text/plain; charset="UTF-8"

+1.

Ross

On Wed, 17 Jun 2020 at 09:17, Khasim Mohammed <khasim.mohammed@arm.com> wrote:
>
> Use relative paths in destsuffix as the paths are relative
> to ${WORKDIR} and turn the existing PV ?= into PV =
>
> Change-Id: Ib9367a15dde611e5b74c11eeff330d0b5a3de75d
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> index c8fc70a..832b226 100644
> --- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> @@ -1,6 +1,6 @@
>  SRC_URI = "\
> -    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=edk2;destsuffix=${S}/edk2;nobranch=1 \
> -    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=edk2-platforms;destsuffix=${S}/edk2/edk2-platforms;nobranch=1 \
> +    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=edk2;destsuffix=git/edk2;nobranch=1 \
> +    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=edk2-platforms;destsuffix=git/edk2/edk2-platforms;nobranch=1 \
>  "
>
>  # TAGS and commit ID as per N1SDP-2020.03.26 release
> @@ -16,4 +16,4 @@ EDK2_ARCH          = "AARCH64"
>
>  COMPATIBLE_MACHINE = "n1sdp"
>
> -PV ?= "201908+git${SRCPV}"
> +PV = "201908+git${SRCPV}"
> --
> 2.17.1
>
> 
