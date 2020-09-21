Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.46073.1600706321370684977
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 09:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mbxVxrw+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id ef16so7744906qvb.8
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Sep 2020 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3ks9NzzltIgzBdi1bpqSe4obbAGlPqbdzJM+Wxq6FfI=;
        b=mbxVxrw+OTJrZkPgU9k/7OzmJNj7+OCES8X36141lXl18UG/ePSuJL0ep39qXjptJC
         KhrAUUxKp2v2BQcxkVssuhTiUeVUHwE8A2xKUEkf/uhRlLigGExEnmTIaw3hL+dSx06x
         xn/o6hUTrxcW1ZKS4M039S56uF/0it/N1caWdCoJLrFL4WyglerwU8clEGanUQ+pjA5r
         md3xq3cQSmjQddxhvTEYl6IqZ6aPZYQE1e73TGSHx2cJEE6JoI1Cz7B67GGOjC1eM2Po
         bPLkhcwssCvee+/G37tX+F5xaMXFLQl1YraQetKzbl5KOUrFhOH1YNozioXW75ZqICyT
         T0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3ks9NzzltIgzBdi1bpqSe4obbAGlPqbdzJM+Wxq6FfI=;
        b=kdzZypsOh3i9GTtX975i7SZzBkGMl2X47//a7McvvoumhrwyjCBMbUkO5N18sVo4ps
         TUp7Bt2pzxamZujKTBznveDl1FSfu/sjXtkIUjSmkibHN3TqFd0amuj1wep8FMmbS0dY
         X1MQ+aUdF6UmLDd8zQnM/kIjUHQcZwf6RpiDji2J7arqF+SsTqKBjMn3/70fPRWcqIyM
         H1HEJoRpMJYyGKhP8Fdr1dPoIqeXokZajYDGCo41f7df76knhVJ23gdUHqeJLBR6E2T8
         kVyEKbuR4TYgqmaOUden5x/cdZpekpnAOsMYJmClKIHPZXGsbVfoT680si+a6hzfxBtI
         VMfw==
X-Gm-Message-State: AOAM532+Himf2BtkOd5pgJGXA5VqWB8p+o9rE7bqDW0VYwtftG4qNfiv
	KZgn6xTJiyMFRa6BUMOrXpRiHg==
X-Google-Smtp-Source: ABdhPJwy4xROLQo1cT49YB/zC/HI94gM2L5S+nJ+dxzXuxgWEOEagvwrvhSae8NS7SR2aUN5y7H2Ug==
X-Received: by 2002:a0c:90f1:: with SMTP id p104mr875152qvp.16.1600706320565;
        Mon, 21 Sep 2020 09:38:40 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id v28sm3068719qkv.72.2020.09.21.09.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:38:39 -0700 (PDT)
Date: Mon, 21 Sep 2020 12:38:37 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/u-boot: fix THISDIR name collision in u-boot_%.bbappend
Message-ID: <20200921163836.GD16787@kudzu.us>
References: <20200917095817.27331-1-Nathan.Dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200917095817.27331-1-Nathan.Dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2020 at 09:58:17AM +0000, Nathan Dunne wrote:
> Renamed ${THISDIR} user defined variable to ${THIS_DIR}, to prevent
> it from breaking ${THISDIR} macro in subsequent u-boot .bbappend files
> 
> Change-Id: I4473ee5c3ac5c0aea9310557294cc9757579bdf1
> Issue-Id: SCM-1302
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>

Pushed to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> index bf57242..5fc3723 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -1,7 +1,7 @@
>  # Machine specific u-boot
>  
> -THISDIR := "${THISDIR}"
> -FILESEXTRAPATHS_prepend = "${THISDIR}/files/:${THISDIR}/${BP}:"
> +THIS_DIR := "${THISDIR}"
> +FILESEXTRAPATHS_prepend = "${THIS_DIR}/files/:${THIS_DIR}/${BP}:"
>  FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp-common:"
>  FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp-common:"
>  
> -- 
> 2.17.1
> 

> 
> 
> 

