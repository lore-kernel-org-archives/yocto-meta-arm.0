Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.3986.1593658922107071834
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 20:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=k630GaV0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id u8so12003310qvj.12
        for <meta-arm@lists.yoctoproject.org>; Wed, 01 Jul 2020 20:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O4y1mzqbfiocs9dBdsHPd+w/EdNUBAH1qAeOzV6jcOI=;
        b=k630GaV09clYF+vtzVpbIY1SzRFzZBGL3Z79Ttwkg4tlOnVI/Q6CfN2lR/PqsRexbJ
         6jARsuHTi1RjhArfSOP5ZCsQaBo0i6oqOhgWjQ027iZh+Q6eD8S33f/Bh6uvARe5eYZV
         9wzJ49GtiY4z6LvMnomCPFCuN4wVKmYm8H/l3DjyN+RMvc2GgPQxeNgM+8OF3SJCIAaf
         yOEwi84hTCxl/fwzAHqqJuicaXFrOo4fZIhztGROBN94ot1GHu5cMZB6Lmp0DmOf/q6C
         eG0li+ea5TuZMxduVaXvdH636yMNTLpeQFRK4IswqDOZ0+nT12DKckCC+1SoK5pcX0t2
         +2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O4y1mzqbfiocs9dBdsHPd+w/EdNUBAH1qAeOzV6jcOI=;
        b=fEfjoOCfwBL3gHkWHX2AVPXXRkX528jX0Wsnres+hdH0g35f0UJVDRfU0r0B2iCBNf
         GxMmDzcrxZNjDrfE/7XUKRXbNgzeF+N0xtN92fjQmIvGpQ/+23J4CiSUJK+DZl+MJjhf
         iYDtTwX9AFjqB95/Jtb3iIIbdUZ9bIexWXQoHPnIHmmSA7mxuU9vKKExgf80qpasyowx
         hK84eGitNp61jljEQqYm/Lf8WUP0aflTwZFqXgP0a9c5HwpEl+HHY8RLk6Gi4ataESTg
         Yn37B/JJmz3RxCaB1frjLgcUG1WojRC6qDS1l6UUtVFnQNY3sX891vp8JzWbBA/LjJen
         iVgA==
X-Gm-Message-State: AOAM532i5gOeE7MyKb5gAlXEG/Lk0aZ56XkdHArHvafgxMPFJYG6f/o+
	+d6pylu2AKCrBxymjEFZJdaSUpcNEwhzCQ==
X-Google-Smtp-Source: ABdhPJzc7Osm8b3ubmRSmJfhx9z8mKW4uLTtoWijXeevVjQ/H+7+UpX1ebFgAw61Fc4Fawj/9u+4pg==
X-Received: by 2002:a05:6214:734:: with SMTP id c20mr28608630qvz.118.1593658921202;
        Wed, 01 Jul 2020 20:02:01 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:1d8b:ebce:76d9:94e6])
        by smtp.gmail.com with ESMTPSA id y67sm3132463qka.101.2020.07.01.20.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 20:02:00 -0700 (PDT)
Date: Wed, 1 Jul 2020 23:01:59 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] gem5: add dunfell support
Message-ID: <20200702030158.GA29060@kudzu.us>
References: <20200630191932.31241-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200630191932.31241-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 03:19:31PM -0400, Jon Mason wrote:
> Add dunfell support to meta-gem5.  This allows for the master to work
> with stable dunfell branches.
> 
> Change-Id: Ie43bd7ca0a145fd30d92d0c241431dfc0a307dd5
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-gem5/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
> index 58242c3..439444c 100644
> --- a/meta-gem5/conf/layer.conf
> +++ b/meta-gem5/conf/layer.conf
> @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-gem5 = "6"
>  
>  LAYERDEPENDS_meta-gem5 = "core openembedded-layer"
> -LAYERSERIES_COMPAT_meta-gem5 = "gatesgarth"
> +LAYERSERIES_COMPAT_meta-gem5 = "dunfell gatesgarth"
> -- 
> 2.17.1
> 

> 

