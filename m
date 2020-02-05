Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web09.47.1580917434814756215
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Feb 2020 07:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=RY+owXGN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.68, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f68.google.com with SMTP id z8so2647375ioh.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Feb 2020 07:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BtUtgOjk3hmqNQtcEB5kntTZGQ6BiNfsoh8wyHJ5gnw=;
        b=RY+owXGNbayH0EtG/jeVAtbbdQ+pif8t5i+gQ6l6uQsP4ul/snWigdoH5oZnxDcypa
         HqFq0/Bs8KmBajHPt/4cpS2r8IBR7PgWOnd+q6JY6fCz+lMUu3wO1IwsXjNcC5bD1ynK
         uh2MetX3sYQ0xIGtxr9r7aGDMCiDx1c75fhJYjr5q7PRTF+eHSDXMCqII/UPLckOceBr
         3RpYAo1kh9v8NJ1z8Gf4iua70Z51JEvXtQwcFZp0LyrZf4X9kR94/v0syFh7PGE0hEId
         kZRhm55pxDIa39FOLz1ALIFZefldt0iMneiYTScMt5A1vOT6j74AdvZFISzHHHIhdSKI
         ZVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BtUtgOjk3hmqNQtcEB5kntTZGQ6BiNfsoh8wyHJ5gnw=;
        b=blc8ZxAC8mxURnniGtcuLJZeWCGY/+4A8GSCauqIrqD41We0F3Jv63mjUQiOzveP82
         iQ4JyYYlJZE3Y0Kglie7los1keCEuCLUrMZw0z8ckX4QegNvbjpMEtkj00TWemZTl6iT
         Ae3D30BBLPEe3wsrl7k8OPgjpDuSDGkxOKu6cx99D3qDAVMbgwYYMoq8fHVwzgNq9b9g
         qg3rayn1QIwDUPVvib7ptO8YYQmWSA8eH3actYiehtepHOPwjyt13/sLanWLNZtjqyvZ
         7Nflkvzn1vVvn2ew3GWZ6u2MXwvk/AodJO1HS7heyaIRgUMGnijdvzNprojSs7ArrsR6
         0ZCA==
X-Gm-Message-State: APjAAAUG58Ee8ejPhw+XU49HKiop0SJnF+FwjpQgdjhoAzWfxhz0O9xf
	dKZjyqOPtm5w8KPliW1TBfB92ECGv0/FXugHG0CaFcBXiyWxNA==
X-Google-Smtp-Source: APXvYqz7FxEHvVqpD0Falm3zDsFKkP6qQ3T+EQqNs0MhdRz1tcTXGywDKIU8mzzNzvsa3YCGf2qEs5oAWz5ghu6RSy8=
X-Received: by 2002:a6b:6103:: with SMTP id v3mr29321991iob.49.1580917434039;
 Wed, 05 Feb 2020 07:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20200204143957.18275-1-bertrand.marquis@arm.com>
In-Reply-To: <20200204143957.18275-1-bertrand.marquis@arm.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Wed, 5 Feb 2020 15:43:43 +0000
Message-ID: <CAPoiz9yFQzFa12w8mRENp0JreS=73a6yd6yLkxzWQwtPffyaPQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] Optimize execution on FVP and Foundation platform
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 4, 2020 at 2:40 PM Bertrand <bertrand.marquis@arm.com> wrote:
>
> Add an extra partition to the disk image generated for FVP and
> Foundation platform (to be used for user data or extra usage). The
> partition is created on the hard drive but is not formated.
> Speed up running on FVP and Foundation by optimizing model parameters:
> - disable options that are already set by default
> - disable cache modelling on FVP
> - disable secure memory
> - disable real time on Foundation (prevents timeout as execution is a
> lot slower then on a real system)

The patch has been accepted and pushed to the master branch of
meta-arm.  Thank you for doing this work.

Thanks,
Jon

>
> Change-Id: I20d613bd8b0f4cb7df87c294d45b9f718f6a8ed3
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  meta-arm-bsp/conf/machine/fvp-common/fvp.inc              | 5 +++++
>  .../fvp-common/files/start-foundation-armv8.sh            | 4 ++--
>  .../recipes-devtools/fvp-common/files/start-fvp-base.sh   | 8 +++-----
>  3 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> index 606ea32..6bf33f3 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> @@ -27,6 +27,11 @@ DISK_IMG_PARTITION2_SIZE = "2048"
>  DISK_IMG_PARTITION2_FSTYPE = "ext4"
>  DISK_IMG_PARTITION2_CONTENT = "rootfs"
>
> +# Empty third partition (8G - 2048M - 128M)
> +DISK_IMG_PARTITION3_SIZE = "6016"
> +DISK_IMG_PARTITION3_FSTYPE = ""
> +DISK_IMG_PARTITION3_CONTENT = ""
> +
>  SERIAL_CONSOLES = "115200;ttyAMA0"
>
>  PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
> diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> index 4e45a04..ca39bee 100755
> --- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> +++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> @@ -40,10 +40,10 @@ DISK_FILE=""
>  FOUNDATION_PLAT_EXE="Foundation_Platform"
>
>  # Foundation Platform arguments
> +# 4 cores
> +# gicv3 emulation (required for hardware virtualisation)
>  FOUNDATION_PLAT_ARGS=" \
>      --cores=4 \
> -    --secure-memory \
> -    --use-real-time \
>      --gicv3"
>
>  # Foundation Platform user arguments
> diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> index b6e237b..1d3c206 100755
> --- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> +++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> @@ -38,13 +38,11 @@ DISK_FILE=""
>  FVPEXEC="FVP_Base_RevC-2xAEMv8A"
>
>  # FVP arguments
> +# enable virtio network
> +# disable cache modelling to improve performances
>  FVPARGS=" \
>      -C bp.virtio_net.enabled=1 \
> -    -C pctl.startup=0.0.0.0 \
> -    -C bp.secure_memory=1 \
> -    -C bp.tzc_400.diagnostics=1 \
> -    -C cluster0.NUM_CORES=4 \
> -    -C cluster1.NUM_CORES=4"
> +    -C cache_state_modelled=0"
>
>  # FVP user arguments
>  EXTRA_ARGS=""
> --
> 2.17.1
>
> 
