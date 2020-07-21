Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.19262.1595339355069926392
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jul 2020 06:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=J4i3NJ12;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id 6so16158530qtt.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2020 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NO0d80tDiTvoT8PeSovb4FDnhc0+FW37W7e+ge7Y/IM=;
        b=J4i3NJ129Cw+J5/gGh2WEpVy8FEN4MUbjxmHJnOTFYjj2HpzpvBw8l/81hv8mPmYtJ
         3CXPUAhtvPOA3WaURzbcu34BSetIwyixEinxc8jrVepSAqmhcdUWVc/1uxnx/8zPJNzl
         4LdFGGgRGghcr9ny/tTaglKYjO2R6FJ/4UA1d7/Tpbldzl3inyC92Ueip7/o+fx1ygOM
         tM3JJDbNMi3U8QsjMCBCmNpS31YLC0LFu0YkmHmLfSZ2B+cAaWXCKTX89zSxbB442tQ+
         Lon0rBvdC9jmo1hm2lfJpvkIkC0t1hchWG0buZ3CmgkMWk/EyMvjR6MZPa5zilAlLJAd
         NG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NO0d80tDiTvoT8PeSovb4FDnhc0+FW37W7e+ge7Y/IM=;
        b=Z83ak5/kCcNUfWVeb0CkptShahtu2j2FWRw68ZLIWCXnw2x4i7J7N0mbChC2dixPuY
         zQj/bj655U5pokmouEQTZEyYLc8YpYuOVt/CnWEFQg5RVD8oBqhNWIyHdH1pD9XQGu1e
         BkQ8iyQ49hI2i5jR/v2Ls3Tf7GRMYFxF8PZdipIdfgeRCUg+/kbxdNsQvz9LN6Kq7Kn7
         ecOH554aziftQhA6eG5wETCbwhf3n95xSFnB+bLrtVj/uahn4KcYwZ0P/MkkcdlCn9CO
         ShtWmjJn7WKSe/47VIDBwq4sEeKcGnyECUsSmNAIK6XfRrwWJl/8c5ij79olTqzqpIu3
         0mrw==
X-Gm-Message-State: AOAM5311SCCPhmxpyoPHaO6uxu0o2gsf2rWuKOun8JMvNtJVIGbiLGN1
	7UFO8noHFRhPFXk43/Tj9yiJbA==
X-Google-Smtp-Source: ABdhPJzjpHpPa7RUzmS8V3REJLVdtKvhwMPBqZBwNYeZ+qQd1cPsT6wsEZO2LrdkSj9G8N71JWZhfw==
X-Received: by 2002:ac8:2bba:: with SMTP id m55mr27910967qtm.214.1595339354250;
        Tue, 21 Jul 2020 06:49:14 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:68b9:7ce6:1e10:7177])
        by smtp.gmail.com with ESMTPSA id w18sm21398743qtn.3.2020.07.21.06.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 06:49:13 -0700 (PDT)
Date: Tue, 21 Jul 2020 09:49:12 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy: Extend compatibility to gatesgarth
Message-ID: <20200721134911.GB30432@kudzu.us>
References: <1595334082-41274-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1595334082-41274-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2020 at 01:21:22PM +0100, Diego Sueiro wrote:
> Change-Id: I38c688f0b50bdfc8abc2119821977755dde33cad
> Issue-Id: SCM-1065
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

I don't expect any objections to this, so pulling in to master now.

Thanks,
Jon

> ---
>  meta-arm-autonomy/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
> index 739dc81..5c13596 100644
> --- a/meta-arm-autonomy/conf/layer.conf
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -16,7 +16,7 @@ LAYERDEPENDS_meta-arm-autonomy = " \
>     openembedded-layer \
>     virtualization-layer \
>  "
> -LAYERSERIES_COMPAT_meta-arm-autonomy = "dunfell"
> +LAYERSERIES_COMPAT_meta-arm-autonomy = "dunfell gatesgarth"
>  
>  # We don't activate virtualization feature from meta-virtualization as it
>  # brings in lots of stuff we don't need. We need to disable the sanity check
> -- 
> 2.7.4
> 

> 

