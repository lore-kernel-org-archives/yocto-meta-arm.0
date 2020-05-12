Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.5060.1589242532748392032
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 17:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Vk6czl7z;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id 190so6324213qki.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 17:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0P8Pk4c0iP/35fsGAZECU6sfjJK7JzAFKd3Ivmv2/Vc=;
        b=Vk6czl7zacZXuAk1rTlkug+myHj/gyPT8wtzS3Jem7ZUWY/uQ9iOFVo3bTkgcXoe6X
         tMv68eIfxgS/H+vdy/OaYI45FOuY8wNR+VOTZ1Y9Uo7NnO6/xMovwLjHBo2wg9/2gRDv
         UnJtr2JQ1ZAcQ5L1hsYFV/UFAfkGQeaiNvpEnByd8/A469o5+e7pY0GfQhOJM78CtNi9
         CScHhwoafjwcByIqQYXktN1l0jBN9lBP//CkcF8pLT0l8UTT55QZE6cxkldYAJFS9C/p
         ejRJP9Y2EEKsUdFvAjJP6tjtjB2I0uUmdKje2CrYX3ID1HA3kkxildVYqu5AzeP3X4gF
         ymmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0P8Pk4c0iP/35fsGAZECU6sfjJK7JzAFKd3Ivmv2/Vc=;
        b=egpU5yH7K+E2PTAGH9Noy/ptFL9GuTDwydkJJauFB7ozQF7MG1supueV/emi238sf1
         3EQTu53zoOEZd3o4BOXRZLS6GUfYwiWl87FFg5V52M/jKUy5+GQPJdq7ojCGQLdMoIf3
         c2KPnm91zpiIOgeCvruph7R0f5ZZLaIj3/5Y1ZtN0fC/R7NZYDTa+dOnWGiuqpAuM4MX
         oHW8hi1CKA9fy8XCmW30j5xXVK/nmQ0iaxkSRjp4wb/uJkzUy5ZLtjxIc0qttOCJJkY/
         81LciaBGZFmkoFhoibUKNfheqNteHxQkUHN0q7789QVf/+nsm8Qb1iUL3K9AvXsROLNx
         YB8Q==
X-Gm-Message-State: AGi0PubUIwVocbSidspF5oY0fxdaRphtQAc9wd7roWmxVCK5p9ka97RG
	Y623ctOCEo4hJb7JLHPfxoVx0A==
X-Google-Smtp-Source: APiQypLMckO7b4/Ll/H5L5DfppIqvUOho5CLZNQiK5+dMtqWy9Pk9fa7VYhkZf8xO8Kk5QzuQLX8yw==
X-Received: by 2002:ae9:ebd2:: with SMTP id b201mr18510349qkg.80.1589242530480;
        Mon, 11 May 2020 17:15:30 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a1b5:1e25:173e:a7bd])
        by smtp.gmail.com with ESMTPSA id n8sm11134911qtn.12.2020.05.11.17.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 17:15:30 -0700 (PDT)
Date: Mon, 11 May 2020 20:15:28 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: Add CONFIG_MD and CONFIG_BLK_DEV_DM in xen-host.cfg
Message-ID: <20200512001527.GA8026@kudzu.us>
References: <1589202898-35955-1-git-send-email-diego.sueiro@arm.com>
 <51674435-1EC3-4A37-8DDB-BED8C7C109AC@arm.com>
MIME-Version: 1.0
In-Reply-To: <51674435-1EC3-4A37-8DDB-BED8C7C109AC@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 01:35:00PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 11 May 2020, at 14:14, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > The CONFIG_MD (Multiple Devices) and CONFIG_BLK_DEV_DM (Device Mapper)
> > kernel configs are needed for LVM2, so add them in xen-host.cfg to be
> > included in the kernel configuration for DOM0.
> > 
> > Change-Id: Ib5f4f4d767751615ee1239e95da7a7d56cbbc2dc
> > Issue-Id: SCM-996
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > ---
> > .../linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg        | 3 +++
> > 1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
> > index 2affab9..d457cb8 100644
> > --- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
> > +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
> > @@ -33,3 +33,6 @@ CONFIG_SWIOTLB_XEN=y
> > CONFIG_XEN_EFI=y
> > CONFIG_XEN_AUTO_XLATE=y
> > 
> > +# For LVM2 we need Multiple Devices and Device Mapper support
> > +CONFIG_MD=y
> > +CONFIG_BLK_DEV_DM=y
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

