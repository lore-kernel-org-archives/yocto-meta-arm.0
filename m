Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web08.8474.1607528049220504855
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Dec 2020 07:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=DBLih9YA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id h19so1159940qtq.13
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Dec 2020 07:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dZf5gbSsbKF/yaMtX6lVksQ40OKYsl/xdqg5C9FtomM=;
        b=DBLih9YACvuW6wklCXvifCtQfQ+UFP/9Wze7B3FyHCoyxbz9mZGtpVnL7c6atANuyf
         0LjiAbZPXzMVmjjLrMxQGaP6nL09/Vu1T7+kxGOdz0jT383t+CQv7uFyY8eULaZWn/Xs
         HI+pQ4/diXq5KBZNRFH1MqFfUJSMDvQA2WudSNjA3j6y0YwzJPdDAUzi4pcEBRzBFDOe
         X+j7PnX3lckVjlrp64j7f99z+RZo7RN/7KwfJNYX1Hi30HroM68lLvQFRQkHuKjVllP1
         ejTFXMUMtTJABr+kSWPMVz6hyWxkS2VxwWIlYNE6I/ewNEoKzzwTBCe9SnZI2onC/KWy
         KxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dZf5gbSsbKF/yaMtX6lVksQ40OKYsl/xdqg5C9FtomM=;
        b=TbBQglxY1ku4IT6MC9crS8mcKLFrIg+8d6j7llde8mURX5UVBN6eReqPsUdXxjbpzk
         m2RXKOUREAnl09r9ZaNJNAS89szXtMbNkm+4D8Li/xDkbsQlYN2/+OaO3Xr4NmQ99T6Q
         ahjs9Q43BKF3GbuPBQvWWI65RPkYcO8zUO0xnb4+9aSE3Tenu5AVfbjGxcWpME2ArS0d
         mpy5Eq7lEaSYVK48h8mGhIy9qTclY6hLI/GPOd0Os24seSZkjXkgt2kdqvWXdZZ0R49u
         bZMUKNLpRXN/gXOi+/bHJtUB13hsDB2wcMxKXO6SPAhSdOEjBetrL4DtONm0/L+uR/Rf
         wbSQ==
X-Gm-Message-State: AOAM533ixop1dEzaZSzm1DiaDFe0VYxTM2nEvynogpRRTkDsVOSxCklR
	NQmsYH5csNACn4nM+nYCI8McNA==
X-Google-Smtp-Source: ABdhPJxb4QJbTQ2dMVEmXdj9qbm4Jh4246g+p/VEoqxxFEtYXsktqIsEAoGOcu9IEH2xd8OnsEJxmQ==
X-Received: by 2002:aed:31a6:: with SMTP id 35mr3717508qth.370.1607528048290;
        Wed, 09 Dec 2020 07:34:08 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:a12d:9189:5829:3da3])
        by smtp.gmail.com with ESMTPSA id n81sm1262096qka.76.2020.12.09.07.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:34:07 -0800 (PST)
Date: Wed, 9 Dec 2020 10:34:06 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] gitlab-ci: force git updates
Message-ID: <20201209153405.GE12460@kudzu.us>
References: <20201209105701.4193892-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201209105701.4193892-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 09, 2020 at 10:57:00AM +0000, Ross Burton wrote:
> Explicitly force kas to update in case the repositories are reused.
> 
> Change-Id: Ieedf518c7586bb1a4eff274dc1a33b52a3c49d9f
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Both patches applied to master.

Thanks,
Jon

> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index fc5b7b4..f43dc8f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -26,7 +26,7 @@ stages:
>    extends: .setup
>    script:
>    - KASFILES=$(kas/jobs-to-kas $CI_JOB_NAME)
> -  - kas shell --update $KASFILES -c 'cat conf/*.conf'
> +  - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
>    - kas build $KASFILES
>  
>  
> -- 
> 2.25.1
> 

> 
> 
> 

