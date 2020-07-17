Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.565.1595014461269858547
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 12:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=HCIdyI6t;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id p7so4754118qvl.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Jul 2020 12:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+c1k28k3PceKXtydF/jk/irmq/MrGCFvrXMByqTKT0Y=;
        b=HCIdyI6tL8ckX5cxGf9Yd4V5VXJJypI/yZUu4CKPvCSKXQYSLXZRyKGzKu9T0f9WsC
         haDb6YaQSOjsU87pQ/S8qRfDt4nZ1TRLlzx+BjsZwkEeRhItk+RR4hRIygqwWln1Fjxc
         6TnIMPLTVwyTZR0o+PzZhagL6pDA2A+XjodwdzrseNTCpEHctFlytzi5jyDyQVpoY2ve
         yem/xB/CmGZAeIP4P0aYODQ5r6yxexMQfa2181j5NdUwxQJO7Xreft2+7ATsRUxuL6Nj
         jhFPEbiFv0iUOB5YRnRpflVhf7Cx7rbityz5YLtrq0A8MscJs2k0CHJnwRcMWrwAc935
         3AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+c1k28k3PceKXtydF/jk/irmq/MrGCFvrXMByqTKT0Y=;
        b=tl/wIeLdshFSvlchvJa9cYL/y15O0hX4QJ4OniAd4+9CYB4naC8PSDHiKAjOxiJl8k
         274t7pn5qrDwfG8F7TdGVwNQ0oZtzxfVm2UVuZPawcSwoZ70fzVWbwsAu1W2dWFcOP1K
         lfJtj0gr6/bbyyTONFzfAY0YYZme3ug/JgAfXuStWwBbubjJ76G/JxZuxXe3oEzNLF2y
         Rj1ntMDvyk+QGanCHwK6R8VNf2qn3mfLR+MQm87gTIkd+rfkgKgS/S+YQJqW6AqrO5xQ
         x9by9PrFAiVftDIvRgEcGoUxbBLPzaqvu0Zn5JctQCEe5WWo18uz86Wz5CVt7fSwZZ6z
         6Cbg==
X-Gm-Message-State: AOAM533+7BHFxChW0xhSeCdkkAadvvBIixhTQTCOGMyLn5UvlJOdkg6G
	Eurk2Dm4fV7wV+LrVBmQ9HLf0w==
X-Google-Smtp-Source: ABdhPJy2kSUpuBIe152h1LCdlSbg/3HvGzYOgaB7dQBfLLO1znG/c4Zn2maLkuxbV1lEK/fHsNMJlg==
X-Received: by 2002:a0c:f0c8:: with SMTP id d8mr10716900qvl.217.1595014460443;
        Fri, 17 Jul 2020 12:34:20 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8034:b667:f1cd:123f])
        by smtp.gmail.com with ESMTPSA id r22sm10661617qke.34.2020.07.17.12.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 12:34:19 -0700 (PDT)
Date: Fri, 17 Jul 2020 15:34:18 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/image_types_disk_img: do not force 'ext4' FS by default
Message-ID: <20200717193417.GA31974@kudzu.us>
References: <20200717131433.GC26434@kudzu.us>
 <31567.1594993356559201517@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <31567.1594993356559201517@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2020 at 06:42:36AM -0700, Kamil Dziezyk wrote:
> Can you backport this change to dunfell?

Done.


> 

