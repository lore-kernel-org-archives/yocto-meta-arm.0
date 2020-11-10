Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web08.23506.1604984324186712646
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 20:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=nXeoME85;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id m65so7758936qte.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Nov 2020 20:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=93LhpTAsV3K4qz+XW1UOt5NTQFU6LCkeo2VoSCjJvUk=;
        b=nXeoME85yJdBTDifiLmrEkmIwTtliiBdmClTn0nP536PVLYLw3VR7+ukAM2+0868cn
         q3//8A88NDshzlBEB8LK2OZgMXPa6/6C14awGaJEeMeW9r8hwMMmGTmGx7NKQv1XGnN2
         yVnAD0ydseYpOaaV+g719nmnZnTuQ98sgnSWkoYtUQ2q0IcuXLneunmvPT2pQQDnF8Xa
         r9yXw5KS3G9xJjB1ptOw/dcIQF3wvva6h9mtCKajm6uQ/+HR82vDzD6XS4hBXoXzNZnH
         uOMMYBCfzs2Vc8iBm8p06d5mN6RMF7PSYrlYw4GI3amQujoydV9KEK0JhFGETKiOK+wa
         pr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=93LhpTAsV3K4qz+XW1UOt5NTQFU6LCkeo2VoSCjJvUk=;
        b=g+GK16V8y6BYZnbAj7uPvWlYW/7SeZvEkmIsufSSHttskhZNN/9jemTjml2N0MgPlk
         vI95X7TircfjCYGIWb9qmWuA/ej/ZyCo+B9agS+b7TmwhpJ1SggqHwMxU3sCfjebpmRq
         m5mrZF/KUAWhzKeGm8ZKaXge9eJjHplhnCwdwAITFaKMxx4jYCHX4eq3PVMWq/o71hBD
         Pa29MkDKxlDETowaGjsdgErJFMuZ8iHDsvf/T6/lwvEm9DyJy4euS+PxsySqNLThrHDS
         KxP0J6i22As973BeMhAtV2GZu8KxVV2HM81w7PXSjB+0+DMszRUP4LlClgvXU8/BkRPr
         6LKw==
X-Gm-Message-State: AOAM533zmG9LvnzJ0CPPW00XC8pGBR6/D1W4pPxXolpBRlgpQfkLwcgC
	o4zJTYdE+soWb2pOZCI57gLWFE4varMMNw==
X-Google-Smtp-Source: ABdhPJzNm5xkXFsyD1alkr5NEo54Jxes8Hqrwo4faJIuvZLAE2swTLYF0q2nHD2Z2uUc1PPQAFSl/g==
X-Received: by 2002:ac8:58ce:: with SMTP id u14mr16282238qta.56.1604984323318;
        Mon, 09 Nov 2020 20:58:43 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e05c:37c6:4b68:d472])
        by smtp.gmail.com with ESMTPSA id q1sm7147798qti.95.2020.11.09.20.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 20:58:42 -0800 (PST)
Date: Mon, 9 Nov 2020 23:58:41 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: Add wic.gz and wic.bmap to IMAGE_FSTYPES
Message-ID: <20201110045840.GG17359@kudzu.us>
References: <041a43d1a908d18a5eab982dcfc857c7f5f01b1b.1604931024.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <041a43d1a908d18a5eab982dcfc857c7f5f01b1b.1604931024.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2020 at 02:10:46PM +0000, Diego Sueiro wrote:
> Speed up wic image flashing by including wic.gz and wic.bmap to IMAGE_FSTYPES.
> 
> Change-Id: I503b6ede5aaf188aabd2a925c2c42e5872d7713a
> Issue-Id: SCM-1520
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Queued for after the gatesgarth release.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 3d31c4c..7c3a944 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -8,7 +8,7 @@ require conf/machine/include/tune-neoversen1.inc
>  
>  KERNEL_IMAGETYPE = "Image"
>  
> -IMAGE_FSTYPES += "wic tar.bz2 ext4"
> +IMAGE_FSTYPES += "wic wic.gz wic.bmap tar.bz2 ext4"
>  
>  SERIAL_CONSOLES = "115200;ttyAMA0"
>  
> -- 
> 2.7.4
> 

> 
> 
> 

