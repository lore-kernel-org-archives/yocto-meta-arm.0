Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.1062.1584649997691983931
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 13:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=LuTbLlcu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id z13so1821635qvw.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2020 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rianFxiopDHwZqccaWBSBmivyjZcAkpG0FYNK0jMJFo=;
        b=LuTbLlcuZPvzJvRL8rD7EDqXGdZPmUXqRlm+JFas3rMa3wUyg/WvzN75+3ngAM9X56
         tkQQ8FaRUSlALdg1z1bfDkXw8JXGkr0Kr6W70ZcefhERnLZgh1ml+hUE7EWZw6BPsyL7
         TUSJgKsf563RALPUnJQ2GVYfyiWDg5jaJXqxvOWvxiZJrXyyZck6/x4+V6zgMxX7vDoj
         EP6UpChTtPF958K1SpTpXM01gQv2LdVbWrXb60kRIbzKHq2UktoLBzdLgzUyyaphljJZ
         R1HqngYrjEpCijWoq3rGIaP/kjpqHXHAdR1V3cY/iOpDxH2bof3qdqrIB73/KfdB0ggx
         7Pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rianFxiopDHwZqccaWBSBmivyjZcAkpG0FYNK0jMJFo=;
        b=ltDgO/Qzk+S8FUOlMQt6aA3i/vT4lrdNzcl58efxwnZE5gGA3HnIgVRODmVtHOuOQN
         hPiBwUUcG+Km78EPQR3/g/8Qs/wyha06cqv6aiCqgsu/4fk5Yho4PVyyGVmnufmllzOM
         /fbXgNQAxMGF+GG97W8K0ULBgldhzTuP/8dKcW19YblggTH3GwShBuf92ZkbPsAF9n1z
         +tgQIgsZll52QTeWEkIEmG0gxtBxyt13IuuG0LJrEH6LSYJQWpozhsrn61n5ZDJT1l30
         mRqphJwimBDxHmioSnz7ikI2jEg8HO5stSnpX51Jd1ejB7fn6Wg5AtfOFN3VB4yJtguN
         FaRw==
X-Gm-Message-State: ANhLgQ3Eaas+136TsJUwjkREwXE00qHZXOAdTcdBFn4RU5n5rBLnvmJ7
	PbTj7EsNa+kWGirks4clNmqLdAdJBmLWbA==
X-Google-Smtp-Source: ADFU+vuiwf9bliv1Shva3kWtO7llMjbjICQ8YO2boNPsXIZI6bQouzEzmQy7wl3pgK1Ybkb5PURzTg==
X-Received: by 2002:a0c:d603:: with SMTP id c3mr5006455qvj.45.1584649996483;
        Thu, 19 Mar 2020 13:33:16 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:4158:6bf7:f564:e8f1])
        by smtp.gmail.com with ESMTPSA id i13sm2275254qke.56.2020.03.19.13.33.15
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 13:33:16 -0700 (PDT)
Date: Thu, 19 Mar 2020 16:33:14 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] Use xen dtb if xen image is present
Message-ID: <20200319203313.GC27467@kudzu.us>
References: <20200318114934.9841-1-rahul.singh@arm.com>
 <E0E058E4-2B09-4DC2-ACD4-995919CC1970@arm.com>
MIME-Version: 1.0
In-Reply-To: <E0E058E4-2B09-4DC2-ACD4-995919CC1970@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2020 at 08:02:24AM +0000, Bertrand Marquis wrote:
> 
> 
> On 18 Mar 2020, at 11:49, Rahul Singh via Lists.Yoctoproject.Org<http://Lists.Yoctoproject.Org> <rahul.singh=arm.com@lists.yoctoproject.org<mailto:rahul.singh=arm.com@lists.yoctoproject.org>> wrote:
> 
> Use xen dtb if xen image is present for foundation
> and fvp pltaform.

Applied to the master branch of meta-arm.

Thanks,
Jon

> 
> Change-Id: I8ee0c5f59ea731202ca97c2cdef315cc5e6665e6
> Signed-off-by: Rahul Singh <rahul.singh@arm.com<mailto:rahul.singh@arm.com>>
> ---
> .../fvp-common/files/start-foundation-armv8.sh | 18 +++++++++++-------
> .../fvp-common/files/start-fvp-base.sh         | 18 +++++++++++-------
> 2 files changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> index 1df4fd8..a113998 100755
> --- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> +++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
> @@ -12,7 +12,7 @@ source <(MACHINE=foundation-armv8 bitbake -e foundation-armv8-native | grep \
> 
> # Bitbake image to run
> IMAGE_NAME="$(cd $DEPLOY_DIR_IMAGE; ls *-foundation-armv8.manifest | \
> -    sed -e "s/-foundation-armv8\.manifest//")"
> +    sed -e "s/-foundation-armv8\.manifest//" | head -1)"
> 
> # BL1 and FIP files
> BL1_FILE="bl1-fvp.bin"
> @@ -210,6 +210,16 @@ if [ -n "$KERNEL_FILE" ]; then
>         --data=$DEPLOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR"
> fi
> 
> +# Add xen if present
> +if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
> +   FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
> +       --data=$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
> +   #switch dtb if there
> +   if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xen.dtb ]; then
> +      DTB_FILE=$(basename ${DTB_FILE} .dtb)-xen.dtb
> +   fi
> +fi
> +
> # Add DTB
> if [ -n "$DTB_FILE" ]; then
>     if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then
> @@ -220,12 +230,6 @@ if [ -n "$DTB_FILE" ]; then
>         --data=$DEPLOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR"
> fi
> 
> -# Add xen if present
> -if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
> -   FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
> -       --data=$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
> -fi
> -
> # Add disk if present
> if [ -n "$DISK_FILE" -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then
>     FOUNDATION_PLAT_ARGS="$FOUNDATION_PLAT_ARGS \
> diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> index ab60cea..f391c23 100755
> --- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> +++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
> @@ -12,7 +12,7 @@ source <(MACHINE=fvp-base bitbake -e fvp-base-native | grep \
> 
> # Bitbake image to run
> IMAGE_NAME="$(cd $DEPLOY_DIR_IMAGE; ls *-fvp-base.manifest | \
> -    sed -e "s/-fvp-base\.manifest//")"
> +    sed -e "s/-fvp-base\.manifest//" | head -1)"
> 
> # BL1 and FIP files
> BL1_FILE="bl1-fvp.bin"
> @@ -202,6 +202,16 @@ if [ -n "$KERNEL_FILE" ]; then
>         --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$KERNEL_FILE@$KERNEL_ADDR"
> fi
> 
> +# Add xen if present
> +if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
> +    FVPARGS="$FVPARGS \
> +        --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
> +   #switch dtb if there
> +   if [ -f $DEPLOY_DIR_IMAGE/$(basename ${DTB_FILE} .dtb)-xen.dtb ]; then
> +      DTB_FILE=$(basename ${DTB_FILE} .dtb)-xen.dtb
> +   fi
> +fi
> +
> # Add DTB
> if [ -n "$DTB_FILE" ]; then
>     if [ ! -f $DEPLOY_DIR_IMAGE/$DTB_FILE ]; then
> @@ -212,12 +222,6 @@ if [ -n "$DTB_FILE" ]; then
>         --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$DTB_FILE@$DTB_ADDR"
> fi
> 
> -# Add xen if present
> -if [ -n "$XEN_FILE" -a -f $DEPLOY_DIR_IMAGE/$XEN_FILE ]; then
> -    FVPARGS="$FVPARGS \
> -        --data cluster0.cpu0=$DEPLOY_DIR_IMAGE/$XEN_FILE@$XEN_ADDR"
> -fi
> -
> # Add disk if present
> if [ -n "$DISK_FILE" -a -f $DEPLOY_DIR_IMAGE/$DISK_FILE ]; then
>     FVPARGS="$FVPARGS \
> --
> 2.17.1
> 
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com<mailto:bertrand.marquis@arm.com>>
> 

> 

