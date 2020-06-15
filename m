Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.17236.1592225868336435052
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 05:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=uB+7zynN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id c185so15547572qke.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2020 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3nEy8mbxqYnsYpIikFcKZRvRm6XeylI81HzGPSvubTQ=;
        b=uB+7zynNajtxNaMXGj8NNmyroBi/c+7KqwZe2YXh7kAe8sqQa68A8OwThi+P89NhMK
         QP9re9srvrHwAmAvGRlgkC6+QjjiLSsp39dqct35y++2Vey9ZlJXLB+Mwqp7MOdWulyR
         8HuP/IXRXVQ7wiJCiXA/oicJif7eOMIIyTjhlyyL2XdB8atPIEGN+RPiYziovLrIpRPZ
         lO1QMo7iink795+6VrpRUvYhUNcRGoNHTAn10Yc7qDYINab7+pn3jMeTIZwO93g+Ed/F
         YVTl8jhx6w2WEYohAjdtXUIsgmpLMNC+JcrhOCUniIqxjaXwivDAx5v8NsoXczuowQJP
         xRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3nEy8mbxqYnsYpIikFcKZRvRm6XeylI81HzGPSvubTQ=;
        b=Tq5sLsrC2u4NhNMMCfgDDecpeH/SuQCEarzwgCrWDtvk6z669wSwhj7ozDohakxumD
         2/2KCEgSIZcmO/LkpevsxUZQCMil62PCOlmSK0gbJx8grYz3K4MG0FSI+iMvJwheSF6f
         R/LQ95NnHgRqzQscfqLdtRWZkuUqdqrQtI0TpcToSEFD2vHOOwFPs91XcB3IvvyPlEtv
         dbE0UcVtgB1qkO6sFAq/lDn99+svfUslbiq8JCD5HQS7JjidNS87vb1qaPXS0DdNdqoB
         kuaLVBWs6Na1CpioXCXAm8qvdSU6o5d5mD51pKwiXAQxXvmt9HLyZUmxU5bgiAWrqmvT
         bPeg==
X-Gm-Message-State: AOAM531vLhPdN5f4rG5YwujmGaQzEAaPM6gvleEYoCujc1NsnEr4kttZ
	tP4RXPyKsCq1Hf20WdEYGj0/1w==
X-Google-Smtp-Source: ABdhPJwNoU7cf4CVHKD+k7ZBFrbl9fxjAQADbnzo9KWPLB4KuYh7THrBFonG/6lUY4R8AYceFB0BFQ==
X-Received: by 2002:a37:e504:: with SMTP id e4mr15753084qkg.268.1592225867262;
        Mon, 15 Jun 2020 05:57:47 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:943:fb04:6a3e:b604])
        by smtp.gmail.com with ESMTPSA id 124sm10013210qkn.45.2020.06.15.05.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 05:57:46 -0700 (PDT)
Date: Mon, 15 Jun 2020 08:57:45 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: fiptool build using BUILD_CFLAGS and BUILD_LDFLAGS
Message-ID: <20200615125744.GA18750@kudzu.us>
References: <20200612124503.GB14746@kudzu.us>
 <14107.1591966447946904888@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <14107.1591966447946904888@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 05:54:07AM -0700, Diego Sueiro wrote:
> On Fri, Jun 12, 2020 at 01:45 PM, Jon Mason wrote:
> 
> >
> > On Thu, Jun 11, 2020 at 03:17:04PM +0100, Diego Sueiro wrote:
> > > Since the TF-A fiptool is native tool we should be using the
> > > BUILD_CFLAGS and BUILD_LDFLAGS flags to proper build and execute it.
> > > 
> > > Change-Id: I9634604dbc42ba7da85d9b9449f1ed94ecb38df2
> > > Issue-Id: SCM-888
> > > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > 
> > Pulled into master.
> 
> Thanks.
> 
> Could you please backport it to dunfell?

Done.

> 

