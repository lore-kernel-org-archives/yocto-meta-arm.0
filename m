Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.5370.1586317358389478061
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 20:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=wBrtYLrP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id h14so1827151qke.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Apr 2020 20:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nzUAe/IWZLYd1n/AZk9c58QI0s3TmIWSIwp4K7zPvMU=;
        b=wBrtYLrPkhQCEm+aSr+yxp6ZaTvXi3GMRnx5J1lq+29+wYxJvlzSeWVZnR5etfJVUp
         FoZfbEs+jrQYLqi0uxO6Vcco+vpW7eIitLXI4tTJcNRoaWQe8ugsDlfSJHGgTQnZmykL
         NDVWQBOQkC6Us/+FWn7Jo8lREmO+wcyu+qjslPwyOP8s+7Y3yXiKvCuwN9a7g+MSs/Qy
         qz535vKOGemsHcOU7nkM7TwNrP3TlVM9yMCsYMGsTPQ7wlg1j1UvkkoOZxMOCzuABkZR
         NJnl8aq50DuGdOQ+oXyhA5FyXjbb/X+VEe0SziaCfIRVDQRsYa3cyZrxJk9kr/tfDtuE
         gWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nzUAe/IWZLYd1n/AZk9c58QI0s3TmIWSIwp4K7zPvMU=;
        b=eami0d6H1xipwr8T/sam242IZrxJRjk/FDRmK1pFi0u5OkKL4fJU90UyIa05xH0h29
         nBqDMffs9ZXxQu6VJbzQknlEXcDDo0ZfjD4oUnbeESj4+ln6HKs7xuHaLzi7BuhOCnER
         D0L9OQnfRd5z7/db3rQeFI6u6nMHW8UgX65jjvEOSGQEOnnE3RgU4YiITw1j1VA0fBX5
         Kdtq74zwBdwI2N5RcN1hAax0y2PyFfGAO8vm4uZ+zQMjOM5f6TfsT6fmwBvpb8AXqtBR
         kTg9l9ozIYdvJ2//v1dawLigmdu8LsGpDl43KgDAOPXYM+1fLf+kcWJs6/rFW81REgfC
         NOIw==
X-Gm-Message-State: AGi0PuZi3Eca4HxnfwnPe4qRBB9OzpSeiO+0YNNyDn1qaDs4FcpQKxpi
	Izzi9NZOOPiMWZGuKWciH5vm7FHjD+4cHQ==
X-Google-Smtp-Source: APiQypK2BSi0GAsd6UJNpeJUj0A8+sKp108dgzHH/aBgHPOM31E3nbkqhY0Ij8QszM2IlaDqhClXVA==
X-Received: by 2002:a37:b002:: with SMTP id z2mr5560972qke.289.1586317357296;
        Tue, 07 Apr 2020 20:42:37 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:e180:b789:7869:7b22])
        by smtp.gmail.com with ESMTPSA id m127sm14600291qke.64.2020.04.07.20.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 20:42:36 -0700 (PDT)
Date: Tue, 7 Apr 2020 23:42:35 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for dunfell
Message-ID: <20200408034234.GD29748@kudzu.us>
References: <1585684637-53492-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1585684637-53492-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2020 at 03:57:17PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arm-bsp/conf/layer.conf       | 2 +-
>  meta-arm-toolchain/conf/layer.conf | 3 +--
>  meta-arm/conf/layer.conf           | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 0632ba3..8afcbe5 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "6"
>  
>  LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
> -LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus"
> +LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"

I was actually waiting for dunfell to be released, then I was going to
remove warrior and zeus when adding dunfell.  The logic behind this is
to limit the scope of our support and testing.  To my knowledge, no one
is using meta-arm in production for warrior or zeus, so I don't think
it's an issue.

Thanks,
Jon

>  
>  # We have patches for xen but meta-virtualization might not be there so filter
>  # out recipes-extended/xen unless xen is activated in the features
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index a247dc1..3a4c4f0 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -8,8 +8,7 @@ BBFILE_COLLECTIONS += "arm-toolchain"
>  BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_arm-toolchain = "30"
>  
> -LAYERSERIES_COMPAT_arm-toolchain = "zeus"
> +LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
>  
>  # do not error out on bbappends for missing recipes
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
> -
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 65ccd15..0b93e8d 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm = "6"
>  
>  LAYERDEPENDS_meta-arm = "core"
> -LAYERSERIES_COMPAT_meta-arm = "warrior zeus"
> +LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> -- 
> 2.7.4
> 

> 

