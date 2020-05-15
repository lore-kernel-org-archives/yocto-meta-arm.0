Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.12767.1589548166744094429
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 15 May 2020 06:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=F/MQkotx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id m44so1827171qtm.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 15 May 2020 06:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZL+MoTfWxwfARUhlT+UShLafGGRe2RGc6uaARnxwzaM=;
        b=F/MQkotxaI46mBR3WxhVu3L4z8KZFuDLBBtSoaPUgiwhRxClOGejz8NXnehV4F0kp/
         ko9AhI8ohglZbhGJMAPCSGxlZ6Jth0EmCQl8l9l/b+S6fHeiHF6+/C0C4JIHCaMFtDuA
         0ZbN/Ms631DrNp8c0XzkpvXHK6W05dx50kLcUlSdY+6/BQYM484HfR1vbuLGc2fB7zOF
         czJSpp+OmbQv8Pf3YLCgIYRtpDmuz9yrJuyRDX4Ef8XlRqjK1ifECalguuaVMZpQg6Y8
         tnM31ZxsYOgRhPcCRdTCK6Gp/DGCGNYmU2ZeARlk5t6dxqQgyYZp50QmuR9v0QWc99q5
         G6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZL+MoTfWxwfARUhlT+UShLafGGRe2RGc6uaARnxwzaM=;
        b=HY7aY5rufQU24rIQX/z7CjQ/fT7gcLAQegCJO9EofKDx3zHPuj+QjeAxULR/GRENj8
         67Bs292NwpWNsWND0bRIp/60iU1flLyY4OhCGHmpie4mZEONf6rBk9B+D781hDxYfxrY
         kahIGLNB9PAGlrmA6VG01cp04/9Yt0FnDY89hmeH8Dx45rXTTUcvOoBtvRUd0yUhzkIH
         D+hgT+R4RQ698b+Y5POO5b/qiKo+yv0gWFY4xLSrG3SW9zMdyigiIbsKHT7PDQbeSTHs
         yPnRlHJ3RMRGOAUJLhWog2igCQiBv2vRZ6pUp5YAWXzw6C2C08I+FJE+u3pcL0fnDSpg
         USRA==
X-Gm-Message-State: AOAM531fqdc6GXqcEi7O5feUD9EbtTCfQNmgw77GBy94ssdcWLxMAe9G
	mTNZ6NQ1yIas5XPb/g0FAEwuZQ==
X-Google-Smtp-Source: ABdhPJysib+gOBUqXvB49+z8kqSBtTtANixmwQVjPd1408Ms5Hvilw+Qzye5tZox4TW/XU/WNLSFIA==
X-Received: by 2002:aed:34c2:: with SMTP id x60mr3387342qtd.156.1589548165749;
        Fri, 15 May 2020 06:09:25 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:98b2:6c7a:a8ab:ca04])
        by smtp.gmail.com with ESMTPSA id k138sm1557087qke.55.2020.05.15.06.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 06:09:25 -0700 (PDT)
Date: Fri, 15 May 2020 09:09:23 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH v2 1/4] trusted-firmware-a: support multi-board platforms
Message-ID: <20200515130923.GA18666@kudzu.us>
References: <1589489249-5459-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1589489249-5459-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 04:47:26PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Some platforms can have multiple board configurations, passed as TARGET_BOARD=""
> that also becomes an extra directory level in the build output hierarchy.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - replace boolean index trick

Series pulled into the master branch.

Thanks,
Jon

> 
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 4b5da7a..899b778 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -12,6 +12,10 @@ COMPATIBLE_MACHINE ?= "invalid"
>  # Platform must be set for each machine
>  TFA_PLATFORM ?= "invalid"
>  
> +# Some platforms can have multiple board configurations
> +# Leave empty for default behavior
> +TFA_BOARD ?= ""
> +
>  # Build for debug (set TFA_DEBUG to 1 to activate)
>  TFA_DEBUG ?= "0"
>  
> @@ -65,6 +69,10 @@ DEPENDS_append = " dtc-native openssl-native"
>  # Add platform parameter
>  EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
>  
> +# Handle TFA_BOARD parameter
> +EXTRA_OEMAKE += "${@'TARGET_BOARD=${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
> +BUILD_DIR = "${TFA_PLATFORM}${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
> +
>  # Handle TFA_DEBUG parameter
>  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', ' DEBUG=${TFA_DEBUG}', '', d)}"
>  
> @@ -93,9 +101,9 @@ do_compile[cleandirs] = "${B}"
>  
>  do_install() {
>      if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
> -        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
> +        BUILD_PLAT=${B}/${BUILD_DIR}/debug/
>      else
> -        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
> +        BUILD_PLAT=${B}/${BUILD_DIR}/release/
>      fi
>  
>      install -d -m 755 ${D}/firmware
> -- 
> 2.7.4
> 

> 

