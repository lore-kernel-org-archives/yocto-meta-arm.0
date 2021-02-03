Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web08.9472.1612360977352374453
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Feb 2021 06:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=VSG1s2tQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id e15so17538614qte.9
        for <meta-arm@lists.yoctoproject.org>; Wed, 03 Feb 2021 06:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1v4TBgcPtCtMeo5WAVZmHC87MW3WE0afv5xo+8ePs94=;
        b=VSG1s2tQp59D1fR3H/tEdKdWRhkeVVcCfdLUOODh4jfllQrYb/NH11S00+ckKZp468
         B7u5MgXoosTZeGOlQzFwFQYtqQQGQLczdbl7RQep9yreyNjoLfvZFvz2HSaeQRiwmxcL
         Aw6/OApm/rArjDqmyemNMwxRUj+ReS4CEqr421AE0149vqAtJhJ2g+035euEoWrOHqmk
         zP8RQk9fqNBRR30H7Pq3Vue2KI7gOvoagmd4UZ3BJ/eyAT5Xyx4glPnPAGh0dIUemNLf
         zIv6XXYiF0xf4ViICptk0CiJixA87AG05FRgLzvX8n1qUnPSV35Fx780tIHu6Gu6lhm1
         /wUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1v4TBgcPtCtMeo5WAVZmHC87MW3WE0afv5xo+8ePs94=;
        b=jT5KfBlYaTypKVasBnvsQlw0Y++TkPbGK3MtbkCr5xLDvdzpLfwe5JhZM+9HOJMabG
         yWR1AeSGZFARNAGNyGomSblclhXUgVAcmobIKpFcPX9WRl3L3w6B3WmBACnfF/WksZpd
         7waLdhnPYfHHHgpUE+WHxPm3ha/Y4chd2oZky6+w7gUGyKxBW0dYWwMxzQOKyfVNTw1c
         CTlq+jYsGDLBMqw0slA5x5BUw9JLLlqTgfY/yivXtWB5TIvEg4eNja9OsCoRGH92wbBw
         k2e52G5R8xY3mgqYYBJziYOIXrKq3Du7gUifD14ujkzykLrYEavFTdvF3YPK5OTIWZsV
         78/g==
X-Gm-Message-State: AOAM533GeeEMPClw8xsN8DDK6M7TMzB54bpy1ydAhiDZWefI+qk0Bebb
	CgGX8W65JqAN5nrrJhiR1IIQfg==
X-Google-Smtp-Source: ABdhPJz1nZBDf8tvyhOVO/v4StCKv2O1IOf8v4C6N5Aa316o5DjCD7QEu2gupwvcaYZc7Ib78fXhjw==
X-Received: by 2002:ac8:6a01:: with SMTP id t1mr2615128qtr.105.1612360976525;
        Wed, 03 Feb 2021 06:02:56 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:b5db:bbf6:3a41:532b])
        by smtp.gmail.com with ESMTPSA id o17sm616248qtl.47.2021.02.03.06.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 06:02:56 -0800 (PST)
Date: Wed, 3 Feb 2021 09:02:54 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/4] arm-autonomy/xen-devicetree: Lower log level for incorrect kernel size
Message-ID: <20210203140254.GA27584@kudzu.us>
References: <20210128100640.31866-1-nathan.dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210128100640.31866-1-nathan.dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 28, 2021 at 10:06:37AM +0000, Nathan Dunne wrote:
> From: Nathan Dunne <Nathan.Dunne@arm.com>
> 
> Reduced the level at which messages relating to overriding the user provided
> value for XEN_DEVICETREE_DOM0_SIZE when it is too small are logged at from
> 'warn' to 'note'
> 
> Issue-Id: SCM-2037
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: I1436dac2c347d40c897291220fe30a95a57f2fa1
> ---

Series applied to the master branch

Thanks,
Jon

>  .../recipes-extended/xen-devicetree/xen-devicetree.bb         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
> index 0369b96..13afb7a 100644
> --- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
> +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
> @@ -91,11 +91,11 @@ python calc_xen_dtb_dom0_size() {
>      size_defined = int(d.getVar('XEN_DEVICETREE_DOM0_SIZE'), 16)
>  
>      if size_required > size_defined:
> -        bb.warn ("Wrong kernel size setting inside xen dtb!\n"\
> +        bb.note ("Wrong kernel size setting inside xen dtb!\n"\
>                   "Required:\t%(req)d (%(req)#010X)\n"\
>                   "Requested:\t%(def)d (%(def)#010X)"\
>                   % {"req": size_required, "def": size_defined})
> -        bb.warn ("Overriding XEN_DEVICETREE_DOM0_SIZE with "\
> +        bb.note ("Overriding XEN_DEVICETREE_DOM0_SIZE with "\
>                   "%(req)d (%(req)#010X)" % {"req": size_required})
>          d.setVar('XEN_DEVICETREE_DOM0_SIZE', hex(size_required))
>  }
> -- 
> 2.17.1
> 

> 
> 
> 

