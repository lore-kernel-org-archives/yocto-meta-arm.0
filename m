Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.242.1586815459188321073
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=EVWk3Uzp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id v38so5241536qvf.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 13 Apr 2020 15:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G1cwjtpb6CcOkDVnl8ACzmuCOJRrQa/QGfG3HGE74r4=;
        b=EVWk3Uzp5AYg42irQPyHhxFvm8UqMATXVr4yW9DFuZQBwgzSFtVLI04orwfbKEpLcP
         7BRdFYAX2wcmlNfff+aYMEsEbt9H56khRts4YtryD3dciG0p7QA7mdBAjGhAX5I9/eek
         QZIYVG1oFQEZSOka/EEwmlTN3zBd6A8XziVmrdpy3yNEQxntC+huA07+LTNLxECGbbRo
         RfvJW+AXwSxRiFII5bku5U2XsZpOb2XEEX8gACLtzCoGQitMDfawsHi7yQEdWoPrWKbi
         swG+jrtwI5+ORRoT2nQe5jnGsvgLBAkzq2esKLRaeFUXF6TSd9loZOF+JUjg1Fk1Bmpy
         4ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G1cwjtpb6CcOkDVnl8ACzmuCOJRrQa/QGfG3HGE74r4=;
        b=jpe3e8PyD4fQtTeuVHOTQUrYjAQ/abwSTqQ2ukVZvtY2f+0AZ/8DEncMFimDhNit7q
         rI+1RZ0+vcBikHj6czyqifcL6xUY9z4qWB//2gj/M/6HZbLGW1VFNZizQ2E29efO+J0u
         0E/Qkay5qF/Yq+v3NMcC1BGLn96wT21FZAqpOH/Y+TRFo5ZxEv5wBqSB8Vygya3+B8b/
         TKV0cGGYUS87lyHAYjT91Hm7+tl4v4no0xFJeP62fxMReIfVIOGGjHLrgTsVN99Cfjb4
         sZAaKjWEx9MIkfr9CtOHaaagi/sThcYT2fnAMgqbQ94Bivrhcvkc8D8SRlYD3C3zapdf
         jWYA==
X-Gm-Message-State: AGi0PuY0UAs5gzv26K/EykNzyNzMJF8XfhBbGJLZu4azTHf8B/YCn57D
	Mf0uezhkMAVTxyPuTNPuZU1Jc5fWEnsZPw==
X-Google-Smtp-Source: APiQypJbo9HGraU8DNRkD70HOtf9SYDC+sk2iij6RRpSe0E/7UXCBDMB6tVFB6s4tvoFuoyYs38+VA==
X-Received: by 2002:a0c:f709:: with SMTP id w9mr19208403qvn.159.1586815458220;
        Mon, 13 Apr 2020 15:04:18 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a879:c5d6:85ec:e8ee])
        by smtp.gmail.com with ESMTPSA id l9sm9609909qth.60.2020.04.13.15.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 15:04:18 -0700 (PDT)
Date: Mon, 13 Apr 2020 18:04:16 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: meta-arm-toolchain should depend on core layer
Message-ID: <20200413220416.GC30105@kudzu.us>
References: <1586650807-24249-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1586650807-24249-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 11, 2020 at 08:20:07PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> While core layer may be implied, it's still nice to depend on it explicitly
> for building gcc and other toolchain components in this layer.

Pulled into the master branch.

Thanks,
Jon

> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arm-toolchain/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index 3a4c4f0..76eac9d 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -8,6 +8,7 @@ BBFILE_COLLECTIONS += "arm-toolchain"
>  BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_arm-toolchain = "30"
>  
> +LAYERDEPENDS_arm-toolchain = "core"
>  LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
>  
>  # do not error out on bbappends for missing recipes
> -- 
> 2.7.4
> 

> 

