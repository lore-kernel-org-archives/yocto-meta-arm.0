Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.438.1610652265087195327
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=dLloYvgY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id b9so4379959qtr.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=93m2LqD5oTzsVzSFfBH+Y8mE1WO+umSkCm3IJ3WJuBg=;
        b=dLloYvgYjsEYCiJUI/pTbMp/N3U4Y1wNUpqEEnrMHzSclh2jVRrbqUkuoaL22ligDZ
         C4v/Fyqmii9cESMVBmOthyVichEy8FuW8iYaKGLTLeubzhIFH+YCvh78EFATR+/g6Nh+
         YO7s4ZGs67LEWBsZNc/Osm77emjso/9y3u4bULSn2jtOo0xbC6Y02xdiFpcLqH5XFpPY
         MjyLINa50Tz3/dMu/+apnr21ilEQkIsE4RlAG9lROah9Bk+FoM4rIENKp04MjeRGzYAZ
         2PdnlyiqiwBHOdB4YQvrO4uoCeFWOg4pYPkKIhw2GX589lcddfppe/g3ujC+8IgSMxts
         seEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=93m2LqD5oTzsVzSFfBH+Y8mE1WO+umSkCm3IJ3WJuBg=;
        b=G+ZQAZ34c7HCrCY2X5yYZDMRzOXDH8YuneK3+EXb2rNaG56tC5y2DbHfxPyoTXGozG
         +Theyj3/OOEtRapsUKLXDhDmsaDu+WrHjBimGy6c7u9wFAg0GLL9lnwLtdv5FX1AR5r4
         fXnWOJQyOzGPdoJMs06IzV+oNrLL9RBFla8pW39Pi0wmn+KM+WQXYdYOaEgH+l2I7TUr
         q1A8AaIU1fFTn6Bw2eR0QVwjAJfZjKs3cCbvPIFSyU6H5Zjxzv2jO6cgYpqpsb3e/6o5
         rdnS/z+a0Xi/UExdUKjFsBWAcvN+57CUOX8F55hjtxZ2W58U+fepbm316g2nmx/O9fDp
         xuqQ==
X-Gm-Message-State: AOAM530nk4F5EuzhsW4tKMAsfT+N4s+6++MR6J8c64IzD7rAa+B7/cmO
	e/N/T+iZOFREIKThbyG4dPT7Z2FKCX32uQ==
X-Google-Smtp-Source: ABdhPJxHaQWxYMoi4k9b0gIruQ3k1WXoCL82B+n/edOzQVZY195wfDyPFGHOUm4IAzFFYcomyvlRDg==
X-Received: by 2002:ac8:3417:: with SMTP id u23mr8556724qtb.80.1610652264272;
        Thu, 14 Jan 2021 11:24:24 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:1d40:95cb:6898:8d5])
        by smtp.gmail.com with ESMTPSA id v196sm3672651qkb.84.2021.01.14.11.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:24:24 -0800 (PST)
Date: Thu, 14 Jan 2021 14:24:22 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] CI: don't retry jobs
Message-ID: <20210114192422.GH511@kudzu.us>
References: <20210112212027.594670-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210112212027.594670-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 09:20:27PM +0000, Ross Burton wrote:
> We can't retry jobs blindly because if a build fails with warnings we want
> to fail the job.  With retries enabled the job fails, but is immediately
> retried and builds quickly from sstate without any warnings.
> 
> Thus, all and any warnings are hidden.
> 
> Disabling retries. We may get occasional failures from Docker, we'll have
> to see how bad they are.
> 
> Change-Id: Ib726f14a264c029fdf372fc1b8a02aca52bf5e4c
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Pulled into master.

Thanks,
Jon

>  .gitlab-ci.yml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 3ae0aa3..18f9ae1 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -8,8 +8,6 @@ stages:
>  
>  # Common job fragment to get a worker ready
>  .setup:
> -  # Retry because the runner is flakey (see https://gitlab.com/gitlab-org/gitlab-runner/-/issues/2890)
> -  retry: 2
>    stage: build
>    variables:
>      KAS_WORK_DIR: $CI_PROJECT_DIR/work
> -- 
> 2.25.1
> 

> 
> 
> 

