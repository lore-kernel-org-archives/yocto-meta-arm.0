Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.9830.1588943150567417585
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 06:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=kkgA25vD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id s9so485520qkm.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 May 2020 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qWNqlwsSctDJw1Yxql/hmsqs0Vbkhd3qavYlXbeq8Vg=;
        b=kkgA25vDCyO4MndDFK5FMPoEUieOXkKTPt3p/KGduiVKk9gPfL6KiSAJiNFag2HnmM
         vYrdMghhDprAPI3BJ+AyPdg5zfIebRLE0QbR1y1fAZKNc2Sru5t+6MWhkOf8vP+NgtJU
         dFnQN6LNeJEhxMrbiVPCzPiBd5KU7zx1AX+yBCTdCSPyeUeCmnoAsUs34lbIaGv2UI7V
         pq0+ROzIl5BvQf9A/CQaa/ZtRFvs3RiZO+IQ/w6QxlnPkd1LqRjHP5NA6wPGk1VuuFml
         hU5MUXQrPEgyPNI3pIlJzCEpCxxUlGNr1GuOp4o0Ywr7g3MkjDFiNUfgYxBx6XTdk3j2
         rowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qWNqlwsSctDJw1Yxql/hmsqs0Vbkhd3qavYlXbeq8Vg=;
        b=g3Hhla1pgAeY6j0pQ+0/07KIcLLn0XwCqWEor28J/27XQt5UhScCNbNKfewhqG94Qo
         XjFKb1egGRgpGgcklfdTwJAbui2btAlXeUo9j2zOfJdvvg9q/Gyf9s4HoMqQ/TzAuqvV
         0d24/gwO1iqkrO8ac7mrTit2VQCJn9GIm10HT+8bu0knZ+J+ZlUIT5bh+pwtFFZrad8o
         l5hOZHgx+W/hdtO7myK7Y2SgZ3hKuM4GKvtRevC0QsDmlXsELMU/8KIOek/NdFsHkIPl
         AiCZ/s1ms/OZKvzHjMbBQiWhVkTF0NcAYV3siGB4jwVGy7s14qMJ2q3xFhjWJ/eE4AUc
         U+nA==
X-Gm-Message-State: AGi0PuZeYs6AXyVCC2BK1zGXFFIFtMDdyXgAHTtUhQzCH4TZo3BYJ1Ax
	u+OPIsqnTm+SBpWoH52mMZQ/hP32lFymdw==
X-Google-Smtp-Source: APiQypIX1VarKxOpRzrpDbZj5uVQVAMYD2TYP/EcjYfHDFH1+tiVaQ+XIxiI7XrYBdk6FSOVyIiP0g==
X-Received: by 2002:a37:38e:: with SMTP id 136mr2646259qkd.247.1588943149619;
        Fri, 08 May 2020 06:05:49 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bc2d:d256:cb0b:903c])
        by smtp.gmail.com with ESMTPSA id k58sm1409435qtf.40.2020.05.08.06.05.49
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 06:05:49 -0700 (PDT)
Date: Fri, 8 May 2020 09:05:47 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] [arm-autonomy] Fix missing xen binary in deploy image
Message-ID: <20200508130547.GF32710@kudzu.us>
References: <20200507111039.38588-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200507111039.38588-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 12:10:39PM +0100, Bertrand Marquis wrote:
> Change Xen package to be machine specific.
> This is solving issues encountered when building 2 projects with the
> same xen configuration but different machines.
> In that case one of the project did not have a xen binary in the deploy
> directory.
> 
> Change-Id: I2575d91b57455ab690eec9c51e07415673242c06
> Issue-Id: SCM-815
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> ---
>  meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> index 92348e6..846d244 100644
> --- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> +++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> @@ -6,3 +6,9 @@ XEN_CONFIG_EARLY_PRINTK ??= "disable"
>  
>  EXTRA_OEMAKE += "${@bb.utils.contains('XEN_CONFIG_EARLY_PRINTK', 'disable', \
>      '', ' CONFIG_DEBUG=y CONFIG_EARLY_PRINTK=${XEN_CONFIG_EARLY_PRINTK}',d)}"
> +
> +# Make Xen machine specific
> +# This ensures that sstate is properly handled and that each machine can have
> +# its own configuration
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> -- 
> 2.17.1
> 

> 

