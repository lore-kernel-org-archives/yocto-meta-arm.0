Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.11285.1586352877342666414
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 06:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=E75jbJhj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id 13so3659002qtt.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2020 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JUvrTdancxk0geimZNUDfeduQnnHhjLNMFV8Cu+Ju88=;
        b=E75jbJhjhMGJARn6IhG8GxHY8j5ntXl3xGghWFL2s1D7Z1TmxK2yDAnm92m+eM61Mw
         /DkygeoglRH9KLSivZJAXrSFy+D5aljYMakVmLNvzbkrRpXW716hkvNEVsJK8AT5NALP
         v+ykX1z0SKaObN28z3YurH/YLanG5E0XzJeayLju1fI88zHVwlvDJEkC0TMGp8Q6AwLE
         cCXfxTNv80phbYoL94PeUvB7cOwcEImHNTa5T+kvt9DD2xFJov7Z5p4IlP3NYv3zdtg3
         xkAY80VmqFf/mojUJ8CeASk734HY7nK286YzKNG7PcHLWtQmOPlkgYY9gau2g29/iIfO
         9utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JUvrTdancxk0geimZNUDfeduQnnHhjLNMFV8Cu+Ju88=;
        b=CeMbgET2xkETdGdnkaQwiRr4XUl5tkE+qMPTfsXZl6yQkkhaI905YHvtI21CEe0IGD
         0rV422a1HyHzDtjb9QnmJ1r7yTLPuWQnJFfjvMhgVBonx7eiURGZAsi201rg8ZW6/l+D
         GM0VLLg7eY3VTYq+1gfLNpwBgjmL+O6uMWjqkdc8QioiARPA6WN19ovkRqeMBLzuo6re
         gZMUcsjPecjueG29NRFjQHTQxwR8yNy4p2QPbb4LDDhmZ1VEMu5x9gVcmrQb8m8nejpk
         2SqELWRAfJZxctja8FbqOvs937nh8FB5qheIBK7hbKo7UEii7oQMVj1CFNyqpnN+4hmn
         x7jw==
X-Gm-Message-State: AGi0Pub2V7U8MoEnNZRYLtY/BM70Gj/2tnZ0wS8MF/fdtBfrqNWBtOpM
	ElCtUK/vKnwrhbgz+unLqq6cAQlM0SwLRA==
X-Google-Smtp-Source: APiQypKF/8McWQFFoKS9umBx9hNufI+xc4CPBpHQnIkZsXRGxpiLAE/qnTnS8aBJeCAd6oWjB/hpZA==
X-Received: by 2002:ac8:2224:: with SMTP id o33mr7498417qto.263.1586352876262;
        Wed, 08 Apr 2020 06:34:36 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:e180:b789:7869:7b22])
        by smtp.gmail.com with ESMTPSA id f188sm16311987qkd.101.2020.04.08.06.34.36
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:34:36 -0700 (PDT)
Date: Wed, 8 Apr 2020 09:34:34 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v2 1/5] layer.conf: add meta-python to LAYERDEPENDS for optee components
Message-ID: <20200408133434.GB1355@kudzu.us>
References: <1586329205-24951-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1586329205-24951-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2020 at 03:00:01AM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> optee components use pycrypto, pycryptodomex and pyelftools from meta-python layer

Thanks for the resend (and for adding the Reviewed-by's).  I've pulled
it in to the master branch (pushing shortly).

Thanks,
Jon

> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  meta-arm/conf/layer.conf | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 0b93e8d..d96e9f1 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -9,5 +9,8 @@ BBFILE_COLLECTIONS += "meta-arm"
>  BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm = "6"
>  
> -LAYERDEPENDS_meta-arm = "core"
> +LAYERDEPENDS_meta-arm = " \
> +    core \
> +    meta-python \
> +"
>  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> -- 
> 2.7.4
> 

> 

