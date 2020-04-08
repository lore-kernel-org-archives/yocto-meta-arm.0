Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.11751.1586354365269324978
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 06:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=EfpRWEBf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id g74so85355qke.13
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2020 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AHOuQsnaDTOtVPW7WwmSSv/ebeSxSOHiQ1SUVMli8Ow=;
        b=EfpRWEBf1p6TazntXWZuPZGAxyVKNuPFvaUOTPBF1MTGBTQuJ9oJckSujS/Q4obPbC
         0SDI26utTuY+bBuTAsf/4dUvB0iVrS970xf/Ltyan0J2sq0DT41GqFWONsNxDb9MXgTN
         BDum+v4GC4W4Lpns6th7luKK3ePMlDPnu68d7sSV/a+NGtMAze8HCvujJYsOdGqi4aZA
         FdLivslUOhr3ArPbb+JYaykD4mHb/R6aKwkl7kOMNzCEFX+zzNU/Z6U3LXMIFEx3thjN
         CaltthfaNoMCYiy1t3focag6pHrh8O4GRHlciptnDjbp6Wd6CVuXjPwwk6e7aFRRN/h9
         Ba5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AHOuQsnaDTOtVPW7WwmSSv/ebeSxSOHiQ1SUVMli8Ow=;
        b=RG0SqOESMGbjRqzqC05Q0Qp1eVh3zt8Imdj2oAdkS9CuGMZ1cbNsZhYFvlsd9m+Tga
         8K9XRmAjLdOMXyhRQMdSyueBuNdLb7Pi8LmXXvySrK7v8989/mH5Gc5R6E1lZ9Z0uVAL
         X19UMfEvjp7oQJKzUKtx3qvKwpj67G9uDawotJptfm5DB2/nJYEx3VhbBNorUqOT/u4I
         5Bz5wWL++0OOLMp7CBFS7Rg7GtPHKXx/pE01YPTTrYTkF2zFGP6Qs6IMVYzZ+FjSCIso
         Apb16lkc89d5m1sQYJoOCVtfzA3H/nJig7YMljc6VBNPo7g9N7h/mo+uY5+fmaLQGbDl
         LL/Q==
X-Gm-Message-State: AGi0Pua4cO4kQPWaP4/L+GZH+asK/dKHGePMZSnJE3YEQh3HmJy/lxv1
	IHGpUQMxnNH9LoPaMSRDoYTu/EqOGv4TxA==
X-Google-Smtp-Source: APiQypK1yAgZZkBvdybAv0ok4q/RWf9mElCclBSo/uiUv0zr4VCjWVKRwcH4S9x61ri7X/B8MY0jMw==
X-Received: by 2002:a05:620a:958:: with SMTP id w24mr7728022qkw.347.1586354364206;
        Wed, 08 Apr 2020 06:59:24 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:e180:b789:7869:7b22])
        by smtp.gmail.com with ESMTPSA id n64sm119853qka.18.2020.04.08.06.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:59:24 -0700 (PDT)
Date: Wed, 8 Apr 2020 09:59:22 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Diego Sueiro <diego.sueiro@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy:init-ifupdown: Fix interfaces.d sub-dir scan
Message-ID: <20200408135922.GD1355@kudzu.us>
References: <1586350520-13681-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1586350520-13681-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2020 at 01:55:20PM +0100, Diego Sueiro wrote:
> Add a missing line breake ("\") to do_install_append to effectually
> append the "/etc/network/interfaces.d/" line into
> "/etc/network/interfaces" file.

Applied to the master branch.

Thanks,
Jon

> 
> Change-Id: I1cf4e134639d1f63ada7d068cc2822d1ac4218ea
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> index 2181210..1d97e50 100644
> --- a/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> +++ b/meta-arm-autonomy/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
> @@ -6,7 +6,7 @@
>  do_install_append() {
>      # Add scan of interfaces.d to interfaces file
>      cp -f ${WORKDIR}/interfaces ${WORKDIR}/interfaces.subdir
> -    echo "source-directory ${sysconfdir}/network/interfaces.d/"
> +    echo "source-directory ${sysconfdir}/network/interfaces.d/" \
>          >> ${WORKDIR}/interfaces.subdir
>  
>      # Create interfaces.d script in case nobody is adding a script
> -- 
> 2.7.4
> 

> 

