Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.7605.1594304051446407925
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 07:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=O68+v4rq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id e13so1880963qkg.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Jul 2020 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=33E475k4BuzpHSNefaqplSwBEy9joOji+3XtjUJZEm0=;
        b=O68+v4rqFDyYxTmbmCh7fHDRKIBMTcbXDK+HOipN4Pi3+fXYitqWjedobNITtYnQXy
         WvMHXX6KxY0Hpmr2ggz4h/HBqUzZVKvJ/DMT7Cs6Jm1IxT3yahbJQtq+s+rqiFcg1Vw/
         +DBWhTXE6p5vEcGb7MeRjKPjdiDSCMgKGzz4A6uBCz5qAybBeQ7Z4dU6giWDW5BDn5B8
         Rk1g68fM73pQRCXVqiwIxp4L2f5IaBLoBDfsudqtm6wPCt1CmjLJ+rO6reLJ0U4dHOJN
         a/NStJDwjXMqJ2GUuyWrts0nXmCBO3A3CbpOUB0DLRj0fNlJ/a/dHEZ9EUEIxYIglMBc
         hxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=33E475k4BuzpHSNefaqplSwBEy9joOji+3XtjUJZEm0=;
        b=aIh1n0Ah/rI/5hbl7j5tqqEzvkOpt/O0E0VaU9vVhRKyTDFU0A+ZRra4L3poyXQW9L
         m6FmDKJsz1pbXhyh/pIvTCrSyqdxuC6ySc+2iwWLIk6DDOfk/qrrvCH7DqL8n3ggZk5O
         AOsQaKl130VQ8nFlO7pVZg+IdKuZiEHsbA/Bw6nWKL2TSiSlzPUlVmwr+N4aItfi2tvu
         78GQRDZj4Sl8Yphdo5grzXkU1Nnc1cFuN2KCPplcWGow6bR8i8ZpikMeiTmELyfVvKF7
         rS9BPuYKbV5PN10eMTzBcFgrro1FK8XdxsPDpQtYA4QErbhFSvB2xhxP8jLxigiR3ieR
         5FlQ==
X-Gm-Message-State: AOAM531c8jzRs9+GRL9t/pnL/x30lrdXFSCH8hJdXO1Wq8YGCSHmC4r5
	dZjwT1QGsym3fm2gOE3M/4g3vyiUbHGtuA==
X-Google-Smtp-Source: ABdhPJxnvIaYGuPBva1nceIYPF5hnaVO8BpGqEJ8LmOtMPT8xSJ2FKqsCmXj/ndjOYVEeVGOrjW9pg==
X-Received: by 2002:ae9:f808:: with SMTP id x8mr64553570qkh.357.1594304050640;
        Thu, 09 Jul 2020 07:14:10 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:5416:c1ad:e833:f407])
        by smtp.gmail.com with ESMTPSA id o18sm3540591qkk.91.2020.07.09.07.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 07:14:10 -0700 (PDT)
Date: Thu, 9 Jul 2020 10:14:08 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/u-boot: Updated platform port for TC0
Message-ID: <20200709141408.GG9023@kudzu.us>
References: <20200707141848.36308-1-usama.arif@arm.com>
 <4892.1594296200845407559@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <4892.1594296200845407559@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2020 at 05:03:20AM -0700, Usama Arif wrote:
> Hi,
> 
> Could you merge this patch in dunfell as well?

Done

> 
> Thanks,
> Usama

> 

