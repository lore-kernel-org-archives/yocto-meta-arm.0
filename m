Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.26.1592419938655819370
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 11:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mp27XH4y;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id x16so1572428qvr.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2020 11:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o6wcFMue3NCMc2QPOzt7/Jsz8sJyUo25kW/yZwutS9M=;
        b=mp27XH4yVp51iCWlup+XbCzahGUITEYi4UqX3sl2XazCWuyX9YBKf0DaAlMwvlhfif
         6G/ksKi1dkKhsKfdGSz8ph/oix3ynQ9VrSEON5rNlr35tGJEIOP0j1P9aJc87TyXXawF
         tMyNheEd2kXky06Nxr+opzcafX9roHe62X5/NCqAD8AGuUw5fFbVhs911gWtM4n4vwUe
         mT00ZH/vY79OOWmOR6S3UJLPN9vQg5ut4DnIc40lP4OlHXBt10MiLNoNrD9BnDnc/nsX
         wPAcEZgelH5PZc3nHpyWvLXEBQUPFF/XFtD8fDKw3WDnR3Xua1WAfJDUFnS0pIW/k6Z1
         DBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o6wcFMue3NCMc2QPOzt7/Jsz8sJyUo25kW/yZwutS9M=;
        b=sLqwBl3xX/7EB66Oqx1+Lo3D+Tnk+5VDGIeDqvwSA2Ysz4XowmfTBtlTRUAmqjZMcb
         72bSQkVyHjhUu6EEPV78hu/w9IzIKXkxs2wz3cHq0DcQoWCvoynO8Uf6pOEKlFpKVWHa
         UdXbsGtMST1ry6Q800WRPXDN8i6aZUCv+HdWLUH67IbzlDSZXc5wBWpleE04DvkoXXg5
         vFMfliancWHSZ6Ly0VEgDy9HeJUcR02o+OuXe7I0W4fTMwXj+dlIqI17lL0P9udw25VZ
         xQGLEHp4/T8FpUxkocPyZA8ZEQFMNms/PgJi6ZOF9ZGMnE9Zwj+I16mjEScla3HZp2Xo
         xlrg==
X-Gm-Message-State: AOAM532nY7tyGa7sDDiDhzUN0B75R2O+ful47GuterFOgawho8JF+vvN
	viihGjnNCjTtN77VZvQi6NNXcw==
X-Google-Smtp-Source: ABdhPJzqZUlL8+LWUoM8FaWlz61BRecz44tLSnUEUKs10dRezToI+NpEpbQQiOZAI7aKwzyoAxz1rA==
X-Received: by 2002:ad4:42b1:: with SMTP id e17mr25475qvr.159.1592419937747;
        Wed, 17 Jun 2020 11:52:17 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:94c6:6885:fd31:55fa])
        by smtp.gmail.com with ESMTPSA id g11sm683219qkk.123.2020.06.17.11.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 11:52:17 -0700 (PDT)
Date: Wed, 17 Jun 2020 14:52:15 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Sumit Garg <sumit.garg@linaro.org>, meta-arm@lists.yoctoproject.org,
	pbarker@konsulko.com, denis@denix.org, wmills@ti.com,
	richard.purdie@linuxfoundation.org
Subject: Re: [meta-arm] [PATCH v3 4/5] meta-arm-toolchain: Add README
Message-ID: <20200617185214.GA23329@kudzu.us>
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
 <1591957928-5959-5-git-send-email-sumit.garg@linaro.org>
 <20200615181632.GA16788@kudzu.us>
 <20200616100639.7gx6fzyz2m7czcs4@holly.lan>
MIME-Version: 1.0
In-Reply-To: <20200616100639.7gx6fzyz2m7czcs4@holly.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2020 at 11:06:39AM +0100, Daniel Thompson wrote:
> On Mon, Jun 15, 2020 at 02:16:32PM -0400, Jon Mason wrote:
> > On Fri, Jun 12, 2020 at 04:02:07PM +0530, Sumit Garg wrote:
> > > +gcc-aarch64-none-elf_<version>.bb
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +This recipe provides support for pre-built GNU Arm toolchain for bare-metal
> > > +software development on devices based on 64-bit Arm Cortex-A processors.
> > > +
> > > +Supported version: 9.2-2019.12
> > > +
> > > +Layer maintainer(s)
> > > +-------------------
> > > +* Sumit Garg <sumit.garg@linaro.org>
> > 
> > Linaro is the origin of this code, and I think it is important to
> > recognize this.  However, I would like some clarification as to what
> > this role is recognized to be and how interactions with the community
> > will occur.
> > 
> > Specifically, I want all patches on the list and no pull requests.
> > This is an active community, and I want to guarantee that all voices
> > are heard, and comments addressed.
> 
> Agree entirely that is the right way to organise contributions.
> 
> I also couldn't help noticing that this policy is not currently enacted
> in the Contributing section for meta-arm-autonomy ;-) .

Noted and working on resolving that.  :)

Thanks,
Jon

> 
> 
> Daniel.
