Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web08.12316.1608042177314397376
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 06:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Wq5raQ9X;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id y15so14578743qtv.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 06:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tYo7q/TaxIi0nVVCs8Gg38Oj8iE8Wq1GrUfKpcrQCD8=;
        b=Wq5raQ9XfHtb6HM3/GKCdBY74btmqwNXQvffFH36arYRC9eorFoYS9OeEtssEvXBna
         jVzncQzihqSJjpKZwDiyoJx5DLR/RrNA8HwJ5QTyuSmh2cWJjKZ/Ts2JQbJSkgCCtBm5
         zmPQU+wkQOkN/jU7Ocq7rC3YWsSymklQOAUcNmfldlED6134wcoOpSIdIBckQ506u+oy
         61+gcsmewkM1K25kypydW8JgcUz55WK9591R1AoDKXyFpKQRESRSY4E9ygmSxCsBJ6P5
         QKlAwfRueZTLzCIIE+WOzVpADEf3jDuJxevASmiUZgNAGzH/gFilYQjvOEQBo3yFgoTW
         imvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tYo7q/TaxIi0nVVCs8Gg38Oj8iE8Wq1GrUfKpcrQCD8=;
        b=LDs1ZFh4BXszQLNE66raEJGTDwksCmsgWVs27siCQXWh+cc4w1fakkpwJ5BFdqWKGO
         NLSxcV88OlTEy8Wk3kyn8+V/0cdh7CT7zsqgjktIXvwA+qbFMPfVAlTy0y+TF3WGCPu4
         cWhnEyLfBfox2hyc0tbyALPeAa8P8/vkgEC/CXW8c+HTBkedmAcBYfyhkfUi3B4eEY7t
         zlCSs8Fs9yGqhaJS5GHKg40mVIXcYtNrhtP+/hRLIha8KUk3RBRyrbyPVVxjdJkvxfjx
         RkM+f1sxYgDHWtX7SLHEcPOv+kjL/28rLSampskXa+JhcrsT+mpwh2GCQevAsZxhS8bF
         LV2A==
X-Gm-Message-State: AOAM530LN2hQkqjDMsiOb6Xk6CQoeBhfgGWy5mDwcZrR+zFh8S/M6F6V
	mqYKIRudnRu97IlIhYrnzHVD+peAExR7KQ==
X-Google-Smtp-Source: ABdhPJwAZPrM33jP978Cpv7tWlrJgFCtpJ2pjWATBsSdsk3RY2aPCZjPFn7XynZLy0XtjW4a0bEkQQ==
X-Received: by 2002:ac8:5806:: with SMTP id g6mr36803050qtg.292.1608042176485;
        Tue, 15 Dec 2020 06:22:56 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:4438:99f1:e83e:f284])
        by smtp.gmail.com with ESMTPSA id o21sm15572383qko.9.2020.12.15.06.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 06:22:56 -0800 (PST)
Date: Tue, 15 Dec 2020 09:22:54 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/u-boot: update FVP patch metadata
Message-ID: <20201215142254.GF20024@kudzu.us>
References: <20201215092255.2765278-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201215092255.2765278-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 15, 2020 at 09:22:55AM +0000, Ross Burton wrote:
> Change-Id: If8edc606afa57e33ddd05ae16d6bf53b798257bc
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../0001-Add-vexpress_aemv8a_aarch32-variant.patch              | 2 +-
>  .../u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> index 39c7e6a..ccfa57e 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> @@ -13,7 +13,7 @@ vexpress_armv8a.h.
>  
>  This patch is co-authored with Soby Mathew <Soby.Mathew@arm.com>.
>  
> -Upstream-status: Denied
> +Upstream-Status: Denied
>  
>  For upstream discussion, please visit
>  https://www.mail-archive.com/u-boot@lists.denx.de/msg233429.html
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch
> index 9a21687..0934e40 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch
> @@ -1,4 +1,5 @@
>  Upstream-Status: Inappropriate [OE config specific]
> +Signed-off-by: Anders Dellien <anders.dellien@arm.com>
>  
>  diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
>  index f0ac2f9da3..93fcd3026a 100644
> -- 
> 2.25.1
> 

> 
> 
> 

