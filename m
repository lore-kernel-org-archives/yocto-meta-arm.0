Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.2463.1615338729657893586
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 17:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ibqIcRHE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id x10so15216410qkm.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Mar 2021 17:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wsi2FwLjKTu/y2a1wlXee+mupSDEIYsyxQKOC48hLUM=;
        b=ibqIcRHES1IYaNJuV4lmw0f1OUX51UnwMicKLeRN7ludYF+anFpu7ukBVnL3jRouE4
         yZD06vJktoMsLrmRGXCGDHjzndAqvXvN1djmoPEJG5wvvR2q9r0uqvHzJa2h62DeKVkN
         OUOQvR6SRu+eZK9H0e0cQ+37/HtIXUGXqGHB9wRynwA0puXMytHAm2i4YH1LUlDuUY66
         U+QQlaknfFEdL2/LZGV5dfz5cgBvSxIHo9miFxeyekpT6LEYPh8bar9X+b2kgXvztA8E
         GmIgm37uguBgR/1QG19P5nFcixMCDu8Q6B4JlllcyzQQta66iTomdDDfmx4LpUE+EfxA
         a31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wsi2FwLjKTu/y2a1wlXee+mupSDEIYsyxQKOC48hLUM=;
        b=AMGT7GhSi8W7PTKhlAV3sKGz/ZN45UQ9jY1NsyN7GJtHo246vyv0IKfPR5bzCuZuSq
         il7o1VriCw3UNRNs2YhmuNRNGxxd3rkq7KZYXdmhwrakCyDAKA24WcbWS7T5Zx2UnWOl
         bR7pOzsCczHwSpvhrzfhCdi58+jP+sdAwnp5rmPV4xx4VoVl4ebf1dh5K5UV4+Lgt5gO
         87VaxritB9dRC/MwLikqrTH5Yi1vwf4HXAHmLNmg+B71kip8kOWm62fhVhLcORroV5wN
         1LOSus09WB1Hy7PU0K8W2XCyexDOhPXQi2FaCIGqZrePxq42+Ao06eOuSo3jeJo3JkL3
         SfdA==
X-Gm-Message-State: AOAM532locbxpGkOcSA5Ip/vOOnqqquVOqxe/fhfIkPMRouiGBO7w1bw
	uBdBUKu5ijLIr0Cmb+910MBUXA==
X-Google-Smtp-Source: ABdhPJx/Wmw+bkr63sLUn9b4dy3bUsFQeYc0jAgsVcSBZIvPpV9SmIuV6+PuV6zJ6eilZ2wImCFZKA==
X-Received: by 2002:a37:6115:: with SMTP id v21mr453407qkb.239.1615338728816;
        Tue, 09 Mar 2021 17:12:08 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:55e6:414f:4108:a7b])
        by smtp.gmail.com with ESMTPSA id i13sm11216974qtv.95.2021.03.09.17.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 17:12:08 -0800 (PST)
Date: Tue, 9 Mar 2021 20:12:07 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/qemuarm64-secureboot: removed unused -dev kernel
Message-ID: <20210310011206.GA1938@kudzu.us>
References: <20210309194911.14477-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210309194911.14477-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 09, 2021 at 02:49:11PM -0500, Jon Mason wrote:
> The change of the qemuarm64-secureboot kernel to the generic one didn't
> remove the no longer necessary kernel.
> 
> Change-Id: Id6d49084e2bee0956b986958a5d990f9ec41ea5a
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Added to master

Thanks,
Jon

> ---
>  meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend | 4 ----
>  meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg  | 4 ----
>  2 files changed, 8 deletions(-)
>  delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
>  delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
> 
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
> deleted file mode 100644
> index c7742f8..0000000
> --- a/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI_append_qemuarm64-secureboot = " file://tee.cfg"
> -
> diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
> deleted file mode 100644
> index 7415e18..0000000
> --- a/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -CONFIG_HW_RANDOM_OPTEE=m
> -CONFIG_TEE=m
> -CONFIG_OPTEE=m
> -CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=10
> -- 
> 2.17.1
> 

> 
> 
> 

