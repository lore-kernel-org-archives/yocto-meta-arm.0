Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.802.1589406634991640218
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 14:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=tRLmsia9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id b6so968394qkh.11
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 14:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=swuZDt3UH/eI2QLiqVQeQgrsiAwhNd6UcA3Tm2+XjHM=;
        b=tRLmsia9w85rFizDHJaiaYABcWxKbHVBilJc9ZL0oF9pUaTuyQGJ6fxeAEkMRUg2hB
         3eBqU7etuzMwNOrfgCfK7KWetTOyUXgLVQzCpj/3qSrTuKhs+yYpMJxaVzb6rdkNW3gr
         h7Lu3V2cY25D/lVyPNNa8CfwLa+Ye8h3OAZi6ZazwV40B2oYvUdQ6urbEip4z8EVnbl7
         7v5d10//wOCmfUcsMbV3etWnNwcGrw0Fmyip3CWMlxfDXxuYq5CmkEBNDsoz1dnsAYOr
         KrA4CR3I83mAxa+mOy/pTeH14VC9BzHaPZIKPOTq4RnAJycx9/46EmeTPFioNNeI7IFT
         bCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=swuZDt3UH/eI2QLiqVQeQgrsiAwhNd6UcA3Tm2+XjHM=;
        b=lRQHOZnQBcLTHIeNVKaFHWhWhUSbmE6zl7zn9GbJRCU0zmgd2/9eRH+Q7HKd6gFYkA
         3Gc5PyC0QfC+OgAcWnMrED002/1efdf1sDJ6a5lWHg/TuOCXmxg/uvco+/k5a4BcksdK
         FZE7hzp7ocJhNOmtpKI69sg5zKl0NzjKqEpDcfq/feZlb7nhUUg7at217ZroPf1HH6bT
         5RNaXP0hnHuMr8TvYWJ78K7Q2xLc5cS9XGW9WWaKCdYXFn3qYtyDI2P4MCj/fAazw6a1
         ebpOYWyLOEQvioobM9ZLywLjz8MWitV2plBkEbeRO1jngI4/5EtL5hmiS2q7d9gyITmF
         goUQ==
X-Gm-Message-State: AOAM533qpPJsok/4PZnxX5HwfvsYDZbUcKvHeoJ9acmjy1qlE8j5mot1
	6nEMq+CGLuoLkJwbjTPoXuCf19BQXLSq5w==
X-Google-Smtp-Source: ABdhPJwjL5O2bDQR/ZXCeRl/Oiz//yesuQa9f8g4BBQPUaTt8vGAa7Pw+TqoUZtRlzsuEbH0vC9WXA==
X-Received: by 2002:a37:50d4:: with SMTP id e203mr1811079qkb.61.1589406634169;
        Wed, 13 May 2020 14:50:34 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:658c:9d8a:81ff:d57])
        by smtp.gmail.com with ESMTPSA id q10sm884577qtk.54.2020.05.13.14.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:50:33 -0700 (PDT)
Date: Wed, 13 May 2020 17:50:32 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH v3 2/2] trusted-firmware-a: Install .elf file from subdirectory
Message-ID: <20200513215031.GB5761@kudzu.us>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200513154707.33747-1-JPEWhacker@gmail.com>
 <20200513154707.33747-3-JPEWhacker@gmail.com>
 <20200513173310.GT11927@denix.org>
 <f49a7362-7368-d1be-1663-189722982f1a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f49a7362-7368-d1be-1663-189722982f1a@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 12:54:16PM -0500, Joshua Watt wrote:
> 
> On 5/13/20 12:33 PM, Denys Dmytriyenko wrote:
> > On Wed, May 13, 2020 at 10:47:07AM -0500, Joshua Watt wrote:
> > > The ELF files produced are in a subdirectory named by the build target
> > > (e.g. "bl31/bl31.elf") instead of the BUILD_PLAT directory.
> > > 
> > > Specifically allows this recipe to correctly install ATF for Rockchip
> > > RK3399
> > I thought you dropped this sentence in v2...
> 
> I stupidly assumed that V2 would be the last patch and edited it in the git
> patch editor before sending, so it came back when I sent another series :(

I removed the offending line above and applied the patch to the master
branch.

Thanks,
Jon

> 
> > 
> > 
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > index febd8ce..4b5da7a 100644
> > > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > @@ -110,9 +110,9 @@ do_install() {
> > >               echo "Install $atfbin.bin"
> > >               install -m 0644 $BUILD_PLAT/$atfbin.bin \
> > >                   ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> > > -        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
> > > +        elif [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
> > >               echo "Install $atfbin.elf"
> > > -            install -m 0644 $BUILD_PLAT/$atfbin.elf \
> > > +            install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
> > >                   ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> > >           elif [ -f $BUILD_PLAT/$atfbin ]; then
> > >               echo "Install $atfbin"
> > > -- 
> > > 2.17.1
> > > 
> > > 

> 

