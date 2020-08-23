Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.182184.1598216102390024994
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 23 Aug 2020 13:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=AevGQ4/L;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id o12so1157878qki.13
        for <meta-arm@lists.yoctoproject.org>; Sun, 23 Aug 2020 13:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eSHHSc1T92MWKFcfP0y7RXaW+PCyT8WbsxkfrT4jjeU=;
        b=AevGQ4/LYXvH3h5rtzqeFtE00TXldBctAjHOrOXPZmvuRe27TROuBeGavgZ2AV/hNX
         h1VHg7WoA+JtMn+CNdngoYi38RHn+8ewAnGlccXNEwTijjmrF3wLhH9vGGl0eRiprKAE
         HlERf10hLoKu5C98nnZKSysvFg4/gxbllymGQYRgE2DtbG4coH9X2naGsg7yASFbgOld
         Rerkei2j7bcetUY+GJ/g+puC+CYVGerC5khHreRjxWeMlwnuUAJL/kslpxEREDJfoQtk
         EuslSE1c8+Xcn99lL1be7fXIPs/X1IHkvPRZjzhlwjCVdhqD8OMBpzOdmNprMGC7HYux
         ssYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eSHHSc1T92MWKFcfP0y7RXaW+PCyT8WbsxkfrT4jjeU=;
        b=M3yJy6RHItjksjqlfHeKY5HPz8xJXPBspNPNeuvX93RN8j/bGAs2nILpdSL1AhlCAg
         UMb86owjC7aaGTH8E3n5Hx/hbSKc5xloSZWcmbWTfNyhp20Zp2jxzQkufPcYXbc7rTtP
         oU5JssvchOxH0yUemhj5M1Z3DNewBhUdcG3/4AtHLwJE+48F+GjdU+t1NsYgWRHGhP0N
         5Ejky1exViUkKAcjYeBGjfj1yFbeel+/si2VwpowqZx6Ag2Z+ap8G5vhCdyKqFuNZSf4
         /QghoDuv/4rhJrUpMedxQCB75eetBl/xbsH8OJmncireQd9ZjN8cLCOWJvY/M/1Vc97G
         /8Bw==
X-Gm-Message-State: AOAM530YmSgf4J8mJkit1F4wXDVnSc0lv7aFi6mLMdE0pHTlmaqzfi14
	NBPYdazCgGaFX1u7AMkWTqHQWA==
X-Google-Smtp-Source: ABdhPJxvoVTU4JfcmBGTkbiaRywUUrfy+RnRCUV0GtQE94DgYJWodDktJr1chQ4tjpcW54V76Mj5Rg==
X-Received: by 2002:ae9:dc03:: with SMTP id q3mr2219318qkf.276.1598216101552;
        Sun, 23 Aug 2020 13:55:01 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id a203sm8079254qkg.30.2020.08.23.13.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:55:01 -0700 (PDT)
Date: Sun, 23 Aug 2020 16:54:56 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH v2 1/3] arm/trusted-firmware-a: fix variable name typo
Message-ID: <20200823205455.GB25261@kudzu.us>
References: <20200821160927.10598-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200821160927.10598-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2020 at 09:39:25PM +0530, Khasim Mohammed wrote:
> Variable name "processes" is wrongly mentioned as "processed", this patch
> fixes the same.
> 
> Change-Id: Id9362f514861c75f8f6a727582e11b0e65736349
> Issue-Id: PLATFORMS-3971
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Series pulled into master.

Thanks,
Jon

> ---
>  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 4362882..e4847b5 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -171,7 +171,7 @@ do_install() {
>              echo "dtbs install, skipped"
>          elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
>              echo "Tools $atfbin install, skipped"
> -        elif [ "$processed" = "0" ]; then
> +        elif [ "$processes" = "0" ]; then
>              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
>              exit 1
>          fi
> -- 
> 2.17.1
> 

> 

