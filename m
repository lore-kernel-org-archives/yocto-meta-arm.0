Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.9271.1605793637365655274
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 05:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=JVAqnljp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id k4so5265869qko.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2020 05:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zMpKh8OiCr+ZB+yxQS5MZmC3IpjQ9Js74AP8QGt893w=;
        b=JVAqnljpswIN+hpOHMLwsmYqzXkKTxWKLhkWhs+OGOG91sFf5Pk/ZaI0gbuCopHKxp
         CGoCNk47PlLIQlQvp6yEFszPXtHs2iYDchBDYfwXj5G5Tk3E+mLIMUWpBSBNGinXMutE
         iXgiiI0cOT2Q6PT3QPfF7slcBMq081GXnZWC5ltyjRrtdaA4uw4twTMM5HcukYddTDa3
         OKd0/2OSIEtsmlcOnRhe632jHK/N5QzsCZ3liDfI9uLh3JXjH/XrM22fiVEyAMwNGfa/
         f+PR7bsPTEpa8tsqn2UxJC1+Z94ahGfwMrQYLreCCYt7+PAXuv/ZEjjWHDQfTY0RW1lc
         noGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zMpKh8OiCr+ZB+yxQS5MZmC3IpjQ9Js74AP8QGt893w=;
        b=LDZgKNPKbqzVXce4yLUZHRdmgXChbmvUstzEsGTY7KizYL2jhua1arrbfrNrVc7EOx
         IUAPhKmAMi7Y3l7MYPCWuni/9mk0YqLJCyMGF5qOPPdsoBfEwwYWdH84E/ld1gWtIA7Q
         glq+OQUoEdjZ2t2hienbVb/34jmEH8VKDRTTRbcQ/bURE7mh+RV5nmdu8QmonXSeUlm9
         M5T0HXbPE7WdB6Q+SE3X3tQN5TmTPhShCpEVzKOpaJTXfY122vfbjcOIDHz9KS4G7oxv
         QkauWra0OmdkTP/IKzjxqHi0O03YWbcEELiid4mvIMwWWah49o6fi4Sm6AJ4g6tCeFx0
         yitQ==
X-Gm-Message-State: AOAM531Ay2Dy6KJ+Vwnxw7amSDoaRO1EBiK/mX2AQVC9iTC9QCn8k4t7
	8qjnt+tVa8Ks1HnEuGXFktMftg==
X-Google-Smtp-Source: ABdhPJxiGLcfZCOJRpT7aNyo8wAOVvs/IKZwzetXKm9WcDt+QA7PJdJrvbFBj9Qk5EewooSKOTJiig==
X-Received: by 2002:a37:a14a:: with SMTP id k71mr11305168qke.33.1605793636123;
        Thu, 19 Nov 2020 05:47:16 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:c9b6:920b:7215:8210])
        by smtp.gmail.com with ESMTPSA id 205sm18582257qki.50.2020.11.19.05.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 05:47:15 -0800 (PST)
Date: Thu, 19 Nov 2020 08:47:14 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy/documentation: Updated for gatesgarth branch
Message-ID: <20201119134713.GB13793@kudzu.us>
References: <20201117125921.13879-1-Nathan.Dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201117125921.13879-1-Nathan.Dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2020 at 12:59:20PM +0000, Nathan Dunne wrote:
> Updated arm-autonomy-quickstart.md to suggest a user checkout the
> latest gatesgarth branch instead of zeus.
> 
> Issue-Id: SCM-1521
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: Idbd54efbe4bdbc31588f726b41b082de89812d60

Both patches applied to master.

Thanks,
Jon

> ---
>  meta-arm-autonomy/documentation/arm-autonomy-quickstart.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> index eb02b3a..13b588f 100644
> --- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> +++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> @@ -30,7 +30,7 @@ First you must download the Yocto layers needed:
>   - all other layers you might want to use
>  
>  For each of the downloaded layer make sure you checkout the release of Yocto
> -you want to use (for example zeus using `git checkout zeus`).
> +you want to use (for example gatesgarth using `git checkout gatesgarth`).
>  
>  Please follow [Yocto documentation](https://www.yoctoproject.org/docs/latest/brief-yoctoprojectqs/brief-yoctoprojectqs.html)
>  in order to have the required dependencies.
> -- 
> 2.17.1
> 

> 
> 
> 

