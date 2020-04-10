Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.1829.1586540512654490958
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Apr 2020 10:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Cuv+5v6/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id x66so2873765qkd.9
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Apr 2020 10:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YidBu2xdxRCNhh7BUINEioSQEvYgLwijGKOJBPvlIL8=;
        b=Cuv+5v6/gUNYZ6Ldx8oFMc26alUVN6XvxpJV7XpDqnsevnLQrgyf6LTtMi4X/nsCSx
         bQc4P1Z+RtQQrDgQW7DvHyoiN8oBREDsjlivHkHBC2Kfp03Wggj/DhC+uqpbE/YtoTQJ
         +QWkCrtRV519jk213/jlVMKa8DcCzF+8pOXpraSGo5fTEoJgt5dK5m1tdlkQdTxPsg1b
         frjrCtpkuMQfZ1mlpxg859ddIaLjNGnx4XGCnmz+7foQzuWXa9UD3L2TFH5UvFClChD3
         8rXr9eXJF96ke0bfXuCNqstXYIt6QAYJ9VNJTO3+5Y8x8mYxtI//MswHMmm7VSb0PxuS
         rLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YidBu2xdxRCNhh7BUINEioSQEvYgLwijGKOJBPvlIL8=;
        b=qG9Cd9xuzsIigJHswnsM8WSX6MF6+skfTnr0gz3iw8lgc6ixPcAtKXyTCSGjKUAFCn
         fgoRWReYeneJ/zSrN7yL+uELFS6BxUZhPjVMniwCLZhYQxVE+5JQLLddiH1R+CJfixLd
         shey4RyPZbq69Q56UajrUB0ZA9lVLDYFDAaMG0WWgEliswIR6NDYTPVtEw+OktuH9Pav
         TASFbwIkOXL/7gOsdfwxXQk6+lxxvJ/E36SWyJ9JhEDeUvxhYAXBYhpYpG3c58ciJTjL
         2P9jjPFIwuVdZMptqMVspZu+0MJOY/fcC1JsbnlyfryC+V/J9GTa63dSzBrUtQDqdjjd
         Da1g==
X-Gm-Message-State: AGi0PuYZYXIl5AGzEfbJ56DGNbj476nqqBKmWBqxI6y5yk1ESsUw6sCf
	goeR71AG9BOONF1suNK7MKS5ZMdsyvSpGw==
X-Google-Smtp-Source: APiQypL6Q123PZy8WhvcMJoumHdocnBrcw4nUx3g7Nw0hwQr1EOvZMVBCF7r2Zpdz6kPbeIXGocPiA==
X-Received: by 2002:a37:bf05:: with SMTP id p5mr5088992qkf.344.1586540511562;
        Fri, 10 Apr 2020 10:41:51 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:fdce:218c:4ca5:6b77])
        by smtp.gmail.com with ESMTPSA id q6sm2075538qte.72.2020.04.10.10.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 10:41:51 -0700 (PDT)
Date: Fri, 10 Apr 2020 13:41:49 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Linaro list for OpenEmbedded topics <openembedded@lists.linaro.org>
Subject: Re: [meta-arm] meta-linaro-toolchain transition to meta-arm-toolchain
Message-ID: <20200410174148.GA28574@kudzu.us>
References: <CAP71WjwuQWL9Efja199LFO6BORe0tT6DYyKP1ntqj+taFWdPEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjwuQWL9Efja199LFO6BORe0tT6DYyKP1ntqj+taFWdPEQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 10, 2020 at 06:05:57PM +0200, Nicolas Dechesne wrote:
> hi there,
> 
> over the last few months, we've transitioned the gcc-arm toolchain from
> meta-linaro-toolchain for master. Since we are approaching the next YP
> release, I would like to remove/cleanup recipes in meta-linaro-toolchain
> before we create the dunfell branch.
> 
> as of now, meta-linaro-toolchain has the following recipes:
> gcc_arm-8.2.bb
> gcc_arm-8.3.bb
> gcc_arm-9.2.bb
> gcc_linaro-7.2.bb
> 
> including all their usual dependencies, and the 'external' toolchain
> recipes.
> 
> meta-arm-toolchain has
> gcc_arm-8.2.bb
> gcc_arm-8.3.bb
> gcc_arm-9.2.bb
> 
> and it's strictly the same metadata, as of now.
> 
> As such, I am proposing to remove all recipes from meta-linaro-toolchain
> master branch, and require every user to transition to meta-arm.
> 
> it will effectively become an empty layer.. so I have 2 options:
> 1. keep an empty layer with conf/layer.conf
> 2. remove the layer completely (e.g. remote meta-linaro-toolchain folder)
> 
> I am not sure which one is better.. #2 will generate an obvious error
> message for anyone using the layer. Maybe that would be a strong signal..
> 
> I will default to #2 right before we create the dunfell branch (in a couple
> of weeks max), unless someone speaks before that!

I agree with you that #2 is the correct choice (in case you were
wanting a secondary opinion).

Thanks,
Jon

> 
> Nothing will change of course for our stable branches.
> 
> cheers
> nico

> 

