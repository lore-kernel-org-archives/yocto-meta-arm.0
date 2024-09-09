Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A78ECE579
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 17:37:26 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.2238.1725903437543442370
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Sep 2024 10:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=iwS9vh+t;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6c353f2f954so32264576d6.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Sep 2024 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725903436; x=1726508236; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5hIKWYSUQ0j4YVhzUQkr1Y75r/hOp0J7AfyeFq513N0=;
        b=iwS9vh+t7bDxFE9V2GMBxg7fx9yq9BW9JxERsrmL6SzyR43RSuEfT5KeYA7/CI0QX6
         Msf7U/9AiJ3U9ibxOrWIk7WGFfI2Qt71EWliG+O4RqLWLPjxkl0otH/LebttRNl1jCIS
         /JNPCPFkByMYGEG751+AqSbO2fBcjoMRVB3UbWmPs30upovGsVWTxuOB/wBRqb/4XYf0
         487fwqtNRxlvn5PDC0wuOr5umcGTbOc+ke/iOXXN9X2OjiVa/RruYHWNdALadDA/JJwE
         D/DNed1unHBOlN9qTLVfW6hljCQ2S/l6XjTJNs0gZjWIJ4j+nlfIR5h7DY/RXxWQUSP6
         qCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725903436; x=1726508236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hIKWYSUQ0j4YVhzUQkr1Y75r/hOp0J7AfyeFq513N0=;
        b=oYdHFAp529pVu0/WWK35GU6vwUDCOVTPteQVgeQiWaqCwmWMR5sqQ56xZLgOlMZFoC
         eJQV0IYZxnbgIny9SQhvB9PYRJdexG2VZKZaVJO3BZppAi47VsC2VbNtk2uonGElFEaL
         KVySb6LyYkONQeQ16egr8wBH/uio0jcV/UK53ngiGxLRPh580yGEwHdJpmdvyDaeynUT
         TPp23rrP98Rs7VsU/6bFL/sjihlZ6kEqqrCPzv7+QfYfrTCeTSc4DvmdWvtwUfU4vjj5
         uoRrw4uqf77Hn5XmNLBoR6stSqg3K8QXY/2yvpE9tMRxJexkVDKKNVXNifObthZ3TPi8
         PAKg==
X-Gm-Message-State: AOJu0Yx0zAV+8EiZZPjCijRgrMKOOIBL1vlSztzN+xTlDWPFL/D7Eajd
	qtk63KZvV0VpvjyGsA+q4lASbf1glm7jqFfQi5se1Ib5aneThsDNwfPUT3XFwg==
X-Google-Smtp-Source: AGHT+IG8skix3D5gdhygWdd8qqc3fHMjolvs3rI6jDoqJpXx+IsvV6GDZ6BIa014++0AMiaZdXiWHg==
X-Received: by 2002:a05:6214:4497:b0:6c1:6d4e:535c with SMTP id 6a1803df08f44-6c5282fe12dmr200956096d6.4.1725903436502;
        Mon, 09 Sep 2024 10:37:16 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53432945esm22442576d6.20.2024.09.09.10.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 10:37:16 -0700 (PDT)
Date: Mon, 9 Sep 2024 13:37:14 -0400
From: Jon Mason <jdmason@kudzu.us>
To: max.oss.09@gmail.com
Cc: meta-arm@lists.yoctoproject.org,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [[PATCH] layer.conf: Update for the styhead release series
Message-ID: <Zt8yStIpXeEXGEoK@kudzu.us>
References: <20240909094810.2801445-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909094810.2801445-1-max.oss.09@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Sep 2024 17:37:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6070

On Mon, Sep 09, 2024 at 11:48:10AM +0200, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Thanks for the patch, but I pulled in Martin's patch (as it was
received first).  See 
https://git.yoctoproject.org/meta-arm/commit/?id=f3d1c0293e5940ae763049c45b7fa4a3c59f54ad

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/layer.conf         | 2 +-
>  meta-arm-systemready/conf/layer.conf | 2 +-
>  meta-arm-toolchain/conf/layer.conf   | 2 +-
>  meta-arm/conf/layer.conf             | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 1a458400831a..4f648ac885be 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
>  BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "5"
>  
> -LAYERSERIES_COMPAT_meta-arm-bsp = "nanbield scarthgap"
> +LAYERSERIES_COMPAT_meta-arm-bsp = "styhead"
>  
>  LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
>  # This won't be used by layerindex-fetch, but works everywhere else
> diff --git a/meta-arm-systemready/conf/layer.conf b/meta-arm-systemready/conf/layer.conf
> index 79ef3a14414a..58f84fd9c8c4 100644
> --- a/meta-arm-systemready/conf/layer.conf
> +++ b/meta-arm-systemready/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
>  BBFILE_COLLECTIONS += "meta-arm-systemready"
>  BBFILE_PATTERN_meta-arm-systemready = "^${LAYERDIR}/"
>  
> -LAYERSERIES_COMPAT_meta-arm-systemready = "nanbield scarthgap"
> +LAYERSERIES_COMPAT_meta-arm-systemready = "styhead"
>  
>  LAYERDEPENDS_meta-arm-systemready = "core"
>  
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index 06494936ec7a..456dbe0d0459 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_arm-toolchain = "5"
>  
>  LAYERDEPENDS_arm-toolchain = "core"
> -LAYERSERIES_COMPAT_arm-toolchain = "nanbield scarthgap"
> +LAYERSERIES_COMPAT_arm-toolchain = "styhead"
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 9e9c9dbda13d..f2fb5c02b29b 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
>      core \
>      arm-toolchain \
>  "
> -LAYERSERIES_COMPAT_meta-arm = "nanbield scarthgap"
> +LAYERSERIES_COMPAT_meta-arm = "styhead"
>  
>  # runfvp --console needs telnet, so pull this in for testimage.
>  HOSTTOOLS_NONFATAL += "telnet"
> -- 
> 2.42.0
> 
> 

