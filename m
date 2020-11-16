Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.35325.1605536809432611603
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 06:26:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ktMXR85d;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id 3so12959211qtx.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 16 Nov 2020 06:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KZhT7POxfIoznPLlwtOe3BQIjjQn1l6xGCGgIoxBF84=;
        b=ktMXR85dxmAY5IkABDHkuW8TD1B8+OVXOC7yBt81jJLHZgUjH/YzcYlAKgj6YAH9/R
         IKKSmVfo+jBdSYI5pydnOuYp2jnglxayhAXAUSXSRKkFmV2Xbwni/ghnk2nn+9uKcjFu
         PkO3Q6F4NcKeCgn6WumfLWkR/epiiUczYai+SiygqZsPJEgiQKnvPhMHKhQmCrzRu80I
         Fkb7qrrM19+2zsNDuhd97JM7zhrd3us++twtmAzBizpaoxglOFqqmymsQVHFm09J1Hkr
         4i8eHv23oCUqkQtlEKNwvvJZywG4RFbqCeDTULj4igFT9jKDTRiI/jDmeCqBfGFOcJdE
         stcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KZhT7POxfIoznPLlwtOe3BQIjjQn1l6xGCGgIoxBF84=;
        b=UphNbmV7Q7gMLfDICcwZZEdc8yhVSPPLr/JpAS2MSKUE1JTXQqDCpbMtBne9JSaIu2
         s3BfrvO6yl1WpDMXQcpBRHt/m97d4sSHCcLU1KpFTh4d0v2tH9IRb5JUcGZ2W/wa5bAk
         X6T3kU91e694rStf7H/9DtBQmbSMVupIEB9XNVLQDUEfe8Cqad9NKgg8zWKgFBZKcQJt
         f6JylgEldPhz5F89tn6KwVcEBiMIWwGFEtYHIDZa+nfCVc5YZshI2RnP7oM5UtOzjDln
         P68fgePMqwVYcrd+DxrSuyXC2HoK9UibGGuEd+kqtblkXZA5JXjR42qhigfFTs2oTt2K
         ZATg==
X-Gm-Message-State: AOAM531MHBxY9wGSJePI51/YRi7V0TFGQ0F4sOsFbKcVaEVI3lAaT1Pf
	JS1FsDjH2C5u7TZshFmzWdk+BA==
X-Google-Smtp-Source: ABdhPJyTSyQyHkTmv7fT186rxmg/AOd7PVw72IR23a5ggn4sL/uevhw8qCPzwjMBBJD5IGivhik88A==
X-Received: by 2002:ac8:6f3b:: with SMTP id i27mr14786098qtv.221.1605536808596;
        Mon, 16 Nov 2020 06:26:48 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8d8f:f072:1037:de6f])
        by smtp.gmail.com with ESMTPSA id y4sm11814524qtd.24.2020.11.16.06.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:26:48 -0800 (PST)
Date: Mon, 16 Nov 2020 09:26:46 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-init: fix guest shutdown issues after host reboot
Message-ID: <20201116142645.GE20627@kudzu.us>
References: <20201113101931.6372-1-kamil.dziezyk@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201113101931.6372-1-kamil.dziezyk@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2020 at 11:19:31AM +0100, Kamil Dziezyk wrote:
> This patch contain following changes:
>  * xenguest-init stop action uses now blocking call,
>    and additional 'xl destroy guest' call if normal shutdown has failed.
>  * xenguest-init stop action stops only running guest.
>  * xenguest-init script is now caled before xen-tools scripts
>    on host shutdown or reboot.
>  * xenguest-network-bridge script is now called before ifupdown script
>    on host shutdown or reboot.
> 
> Change-Id: I46e307fd0ad36b2e35559b4e8a071be9bbc50e34
> Issue-Id: SCM-1632
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../recipes-extended/xenguest/files/xenguest-init             | 4 +++-
>  .../recipes-extended/xenguest/xenguest-manager.bb             | 3 ++-
>  .../recipes-extended/xenguest/xenguest-network.bb             | 3 ++-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> index cd249cf..d580908 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> @@ -65,8 +65,10 @@ case "$1" in
>          ;;
>    stop)
>          echo "Stopping xenguest"
> +        # update guest list
> +        guestlist=$(xenguest-manager status | grep Running | cut -d ":" -f1)
>          for f in ${guestlist}; do
> -            /usr/bin/xenguest-manager stop ${f}
> +            xl shutdown -w ${f} || xl destroy ${f}
>          done
>          ;;
>    reload)
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> index bd7963f..9c29bde 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> @@ -21,8 +21,9 @@ XENGUEST_MANAGER_VOLUME_NAME ?= "vg-xen"
>  XENGUEST_MANAGER_GUEST_DIR ?= "${datadir}/guests/"
>  
>  # We add an init script to create and start guests automatically
> +# run start script after xen-tools and run stop script before xen-tools
>  INITSCRIPT_NAME = "xenguest"
> -INITSCRIPT_PARAMS = "defaults 90"
> +INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 79 0 1 6 ."
>  
>  inherit update-rc.d
>  
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> index d0517b6..9464d43 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> @@ -29,9 +29,10 @@ PACKAGES =+ "${PN}-kea-dhcp4"
>  
>  # Bridge configurator needs to run before S01networking init script
>  # Prefix with a_ to make sure it is executed in runlevel 01 before others
> +# run start script before ifupdown and run stop script after ifupdown
>  INITSCRIPT_PACKAGES = "${PN} ${PN}-kea-dhcp4"
>  INITSCRIPT_NAME_${PN} = "a_xenguest-network-bridge"
> -INITSCRIPT_PARAMS_${PN} = "defaults 01"
> +INITSCRIPT_PARAMS_${PN} = "start 01 2 3 4 5 . stop 81 0 1 6 ."
>  
>  # Kea configuration needs to be restored before kea init scripts:
>  # Kea dhcp4 server is 30, so lets use 20, to have higher priority
> -- 
> 2.17.1
> 

> 
> 
> 

