Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.33140.1591631506263543897
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 08:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=VRvUKMPU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id y9so8555589qvs.4
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7lDXGpYmRiDMjeeB+oSYOKQQWFDN9EGxMX2QGxslXxs=;
        b=VRvUKMPUZ3+oedK3oHO3R/RcyAr0KrMb6RvETo993wmktk8ddmcLMFyc195++wfnLR
         lcC2sgjvVHnKSju/1lK5fRVESc8jSnPIp/kPgovYd6chihqH6ZQIVlgQ72U9Kg13++TB
         mlO7a65DRhzHVT/wwm9WgkCcpmuQEtlzvtghJ3+He7IYSp8gPZBXR7iyYAfKJC8Clh7c
         GPBztO6Cw8hI5KG2gRA9fEmCEpn0gp/tF2jmP6Zku9ItMScb0AJT5jS55XZYt4mmPGvw
         kh0RbLsUqXdnFDfNtvgAJH+buV+jEcouKWz0IUUlW2ihcyvHawhsTfGugyUJnUW6Z5ZB
         SIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7lDXGpYmRiDMjeeB+oSYOKQQWFDN9EGxMX2QGxslXxs=;
        b=Zcj66kBfu7U4NnD2BVVjIu8LcosYtq4ziy2o8RO/DYM6IFGv4QFTl+8TKN5sKVN0sk
         TLLxAxUvng57ao5LEo6Axsuv1mB2BPbQXhDlrJqIfG9UH2Ap9afDu4S3pa9uQKOmOtLl
         n2oHbuFinPnniXoJ0hEk0s19BH65qOFwynMvvDHnkAg2yrkMJhnOWJtklHx869XvFBom
         Z6GMc8yD8t1L9KtTWDHXy4wsZNgSuQUkh1OrDrfLkqMbK2sE1kltJp6VRzvralcaZemA
         hRtliLJMKzWB8UvYH67sJhRGnoYTbo4gkdxIhMwGyRV4PksTzsLZgzS28aORDJtzI2ba
         kKXQ==
X-Gm-Message-State: AOAM531oA225uEbRAgY7FN/J0QcaIcCAMnxTaJUJQ4HqW9mqiQj8IXFa
	9Dm4HMnuGVjP7gXkWi//QXiC/iMaj30=
X-Google-Smtp-Source: ABdhPJzV9jpAyVgKpS1s/WtoOKv32HmkisNZayXfoM/4XZ3NmHMSWCOYmc00lxdIM1cJ99C0AlTHCA==
X-Received: by 2002:a05:6214:1327:: with SMTP id c7mr23393874qvv.64.1591631505463;
        Mon, 08 Jun 2020 08:51:45 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:b9b3:35e6:b1bd:2c87])
        by smtp.gmail.com with ESMTPSA id z194sm6972571qkb.73.2020.06.08.08.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 08:51:45 -0700 (PDT)
Date: Mon, 8 Jun 2020 11:51:43 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: remove dependency on meta-python
Message-ID: <20200608155142.GF15959@kudzu.us>
References: <1591228165-20078-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1591228165-20078-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2020 at 07:49:25PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Corresponding Python modules pycryptodome(x) and pyelftools, needed by optee,
> were moved from meta-python to oe-core.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Pulled into master

Thanks,
Jon

> ---
>  meta-arm/conf/layer.conf | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index d96e9f1..3341972 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
>  
>  LAYERDEPENDS_meta-arm = " \
>      core \
> -    meta-python \
>  "
>  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> -- 
> 2.7.4
> 

> 

