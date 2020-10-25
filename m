Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.26898.1603633394496385895
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 25 Oct 2020 06:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=rpnT5ORN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id q199so5974911qke.10
        for <meta-arm@lists.yoctoproject.org>; Sun, 25 Oct 2020 06:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8Zu/BNK0UGFYsb2mZgrZVKv9agoiG+egDAHhz3BxYqs=;
        b=rpnT5ORN6GYdIb+s6dxkC/uRQW3Sg2+xQWLrKmsaZ626Vcy1FR/p3xXjw7HYBzTPB/
         SwexIRKcJsU4vryy1YLlV3i3pdZTiPWvLs/YovNWJ3mQ7/qEzq2byw73rJnZHN36KlK/
         IpjcjZ1KLnOHVPUe7NGy/d3KqauXkpL+U/MIjmZY2mcwPj6d1XikUbBeZ4XSv8Lf924+
         e1fQgbpDwn0DjcFr091NFK78jfM9htmCDYoX8tUchRTgOB5F1BudsiXl98Q/dJc/F99k
         7R+NsAN25UIORzWpqSxMydo55uG66c5rxMn9+XxhcyIE3/FIT69Bt1nQgI+9Y8HCmEjh
         aM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8Zu/BNK0UGFYsb2mZgrZVKv9agoiG+egDAHhz3BxYqs=;
        b=g6PLzpmJWVXqPpZ0OvjaWyPB1b34dYko98Tbs8wsnagfkyCMLMKk96/N8IpKhvDP8a
         95f7MeZpuw77yC8rlIJKU+fZVDud0EGPST9ZFDLDoo6jeH1WyH8GH+tjFAaGzuC99Bk3
         FL4yEm3EGB2X5ZPqhEeliGlQ0i9dVaLs08rAj9ycha8ROeHBZLv5PiwuS6eBs4vFkDIt
         C6L838t5S0vOlNrNZy/67e4daKi3mvWgBt1WPzW8exEkonDEd2GLPyJ/h6sjqTce/S1F
         13CT/aRncl+gwIrNps5K3+UnoNkwpFCuvfhM5SXiis0bB2E+BnZdYFZolHV10NmrHXro
         jjEQ==
X-Gm-Message-State: AOAM530j6nAS08gojdOi8DEScMzHEGvAdi8xXJaXPj6hXWqGNU6bep4b
	HWF5Qdf/Lr9E9axVzukc3I0SJfg+01iQCgl4
X-Google-Smtp-Source: ABdhPJwl1PIMuKUAtxbpq9FPZIT9nKVechKZZ0ITbO04iXHudHPY3q/EZEHQpVAcnn+dZCa2gExwTA==
X-Received: by 2002:a37:a356:: with SMTP id m83mr11284640qke.433.1603633393629;
        Sun, 25 Oct 2020 06:43:13 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id p13sm4865668qti.58.2020.10.25.06.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 06:43:13 -0700 (PDT)
Date: Sun, 25 Oct 2020 09:43:08 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/6] arm/edk2-firmware: no need to inherit python3native
Message-ID: <20201025134308.GB8073@kudzu.us>
References: <20201020160049.473237-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201020160049.473237-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 05:00:44PM +0100, Ross Burton wrote:
> There are no python3-foo-native dependencies, so just set PYTHON to the host
> python3 (which is in HOSTTOOLS) and remove the python3native inherit.
> 
> Change-Id: I1234d04df380a71a1e881328157e1d154f3cb49c
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series applied to master.

Thanks,
Jon

> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> index a343e07..ee8f523 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> @@ -29,7 +29,6 @@ EDK2_BUILD_MODE = "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'D
>  
>  DEPENDS += "util-linux-native iasl-native"
>  
> -inherit python3native
>  inherit deploy
>  
>  B = "${WORKDIR}/build"
> @@ -48,7 +47,7 @@ export GCC5_AARCH64_PREFIX = "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}"
>  export PACKAGES_PATH       = "${S}/edk2:${S}/edk2/edk2-platforms"
>  export WORKSPACE           = "${S}/edk2"
>  export EDK_TOOLS_PATH      = "${WORKSPACE}/BaseTools"
> -export PYTHON_COMMAND      = "${PYTHON}"
> +export PYTHON_COMMAND      = "python3"
>  export CONF_PATH           = "${WORKSPACE}/Conf"
>  
>  export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
> -- 
> 2.25.1
> 

> 
> 
> 

