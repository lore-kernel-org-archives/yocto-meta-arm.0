Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web08.26927.1603633558430482533
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 25 Oct 2020 06:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=bJemS1OW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id f5so3093890qvx.6
        for <meta-arm@lists.yoctoproject.org>; Sun, 25 Oct 2020 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tdHKVhbtNozroSu1yNezrknIqhpaQ7PWcJ0+q0nE9/E=;
        b=bJemS1OWF3d36GkZ6BUIN1oVk/4f2P17tsjH3RSLZS35VMEzni5rtQhqnNDZZ5GU4I
         2WFjFobLAoqKleOlr8B2+6iRnY/x7LvBNG7iyVo6BxloCmnW/EaIIs1bh701e/Qz7S1+
         kGLSjvM2se89FqUkh90CF2Op9L2stVRyThaJhYRzsrMrFQzcUDKIBq+Z9oRRRVYPaf+m
         Ajp9jzeBHUcv9Ai+KaQOzxPRQlfm3DxH2/Ak/0kJhIHc1pqHUo9W8WD1R5aKRYUQ/b7a
         0fKUKcUSxzwwuUp0LtpvIGM6YiSnZpLm+JxJZ4saAghJpknMCpkZadtR3ynh/3ge8088
         XSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tdHKVhbtNozroSu1yNezrknIqhpaQ7PWcJ0+q0nE9/E=;
        b=hhS+amQZBrFTfN5JJNrtvoCfil7F3g9Le5kVvQzN+Hkno82ACJYPHoQoQZuzCQDfn3
         bpMA5vNxMpByaxbYFVQWZxU+aIykf7lsza3m5taeaxGwnqRc94IB4twMVK1IDAZsRKyc
         L0nOsAqG/PGPHeqH8OUGjCuL7MdQrooueRZg3J6xa2w5Mdj9FbaHoGFHD6t9S/IdKhag
         u9WDLL1O/q2VnVwQnxP+G+ynhiENO1s5dZY50waTpLsR1zI2xoEgI7vw+/b9kPxPC5Z7
         l7bpBVOxEWqtspEzfheWYysENaNRoj1flOXSoy+kYlLflmMf2ZALv6vJ7cMMjtOONDRb
         4dYA==
X-Gm-Message-State: AOAM530iadndRlQdunfmTrun6hajYlYtDtraKpAGh4biu9PDuQn4ff9n
	too3AO+bHgpggKoANcDGBfqMzg==
X-Google-Smtp-Source: ABdhPJxPvqW5NQ2jbSfvk05mVmTxljO3/+/vAxbhV5cBM5NoOeFPkJaqYPm+9MUx1y6X+G/RHw83NA==
X-Received: by 2002:a0c:c187:: with SMTP id n7mr8963345qvh.19.1603633557599;
        Sun, 25 Oct 2020 06:45:57 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id t3sm4749482qtq.24.2020.10.25.06.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 06:45:57 -0700 (PDT)
Date: Sun, 25 Oct 2020 09:45:52 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/layer.conf: add meta-python for musca
Message-ID: <20201025134552.GC8073@kudzu.us>
References: <20201020160136.473402-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201020160136.473402-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 05:01:35PM +0100, Ross Burton wrote:
> Change-Id: I46568f3144519bc25a65bce3d29d0ae659335f55
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/layer.conf | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 816ff9d..eedb7e0 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -9,5 +9,9 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
>  BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "6"
>  
> -LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
>  LAYERSERIES_COMPAT_meta-arm-bsp = "dunfell gatesgarth"
> +
> +LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
> +# This won't be used by layerindex-fetch, but works everywhere else
> +LAYERDEPENDS_meta-arm-bsp_append_musca-b1 = " meta-python"
> +LAYERDEPENDS_meta-arm-bsp_append_musca-s1 = " meta-python"
> -- 
> 2.25.1
> 

> 
> 
> 

