Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.12416.1614954029142920605
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 06:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=myiv78Tn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id 2so1814945qtw.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Mar 2021 06:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6E9QSifH1IZHnYrZax/m6w3WQGk9fXB66paZhsR024E=;
        b=myiv78Tnfsge8/DPwRXxc2wVq3LGWXs9gYX6vAlkxluM0ASSF4p3g+aYKNBJAGWwST
         wxkPPNc7L/jWrE29dyKEwtp8c/Q/KEQmyJR1+nEpsijxdHyB/0N40J1SZZaBNKiPJJUd
         27DNhz0ED0JX42GRDjM61IszfohLD+GMq2L6YJcJY0zvROh77WNz9jTNYnsdGDsvWq0b
         CYOVGkR6MGAIITtxJhh54bD819g85Lkw9f7nD1Hcxww96GgF7PqRIgJ/9W5P12taBFQ3
         Z3f3j4/81oY9Ja1P7xyLlmzfpG2t5iBn48jvVuy5gEmWvSsTJw88412ENE5wOnHjgdWA
         7fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6E9QSifH1IZHnYrZax/m6w3WQGk9fXB66paZhsR024E=;
        b=jl2OVHYl4uZ3PF6WXr9WtuLLf4/M4rSyKlN9PRQVB1FN5dXf0KAgm0RKy1VH6JDJfS
         8C0D8b+oHDVhaYsBsR6Wq7DsVFYquwk3Fo6416NUERLPzyd5I5UY9L6RTjuLBdv6aw3Q
         HlG7AwWSYG93Q0G+qfFjSt2nrTHsrLblssrX8VbtU+icNIhpPy5B7AQntK2ZKWhmps9S
         X2LIooQbbx8zlYLM1qPl7occdQh0FFTVH3iUZ/UVvwpPkwwPeYJ2w1K6OCh46Jh39is9
         Rp1drWm5FfxnXoYG7DpoPvvEbBhjk+SrNS6I9a+6HzxKY2oNObVEZ+F48Jp4GbKYh+5o
         G2cg==
X-Gm-Message-State: AOAM533L/ufPc9q08dCFOmQcXEoHlf+RCVbaNyH2xwdjfjtSWCyxILQ2
	0IYd9+TZznTpu+yIgUjCTF/9DA==
X-Google-Smtp-Source: ABdhPJz4dzk+gZSCCqbiAfs3MSHhaSHQ8Wgd2PgNGkoe8fFMYCezTMPM1S39Fx/9BbL31P8ZZL6aEw==
X-Received: by 2002:a05:622a:28d:: with SMTP id z13mr8867263qtw.87.1614954028231;
        Fri, 05 Mar 2021 06:20:28 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:20a3:3a4f:ed63:83f])
        by smtp.gmail.com with ESMTPSA id d24sm1810297qko.54.2021.03.05.06.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:20:28 -0800 (PST)
Date: Fri, 5 Mar 2021 09:20:26 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Richard Neill <richard.neill@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-autonomy: Add meta-networking dependency to autonomy layer config
Message-ID: <20210305142026.GE17134@kudzu.us>
References: <20210304111732.35026-1-richard.neill@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210304111732.35026-1-richard.neill@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 04, 2021 at 11:17:32AM +0000, Richard Neill wrote:
> meta-arm-autonomy requires the bridge-utils package, which is provided by the
> meta-openembedded/meta-networking layer. This patch adds the explicit
> dependency.
> 
> Issue-Id: SCM-2166
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> Change-Id: I3a43eb78fe1f40a9a2fb5116b5dbaf3ebfc9af7d
> ---

All of these applied to their respective branches.

Thanks,
Jon

>  meta-arm-autonomy/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
> index dee0c01..38634f3 100644
> --- a/meta-arm-autonomy/conf/layer.conf
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -14,6 +14,7 @@ LAYERDEPENDS_meta-arm-autonomy = " \
>     core \
>     yocto \
>     openembedded-layer \
> +   networking-layer \
>     virtualization-layer \
>  "
>  LAYERSERIES_COMPAT_meta-arm-autonomy = "gatesgarth"
> -- 
> 2.25.1
> 

> 
> 
> 

