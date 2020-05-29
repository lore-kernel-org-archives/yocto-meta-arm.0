Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.35812.1590762514539521766
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 07:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Yx1xgiDL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id 205so2346565qkg.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 29 May 2020 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tpY+VjIsQjXz5Vt9dm/Ujjj+dEvw21SkwlCoWVZ57SE=;
        b=Yx1xgiDLAm2VQTTXVBDMYrj+Yykpa/nQ1kDbBeICBJwUQVgFbrm9TH2XHrBHMyKyT9
         zKVVyYKxQI0dxn1kg41Er9ReEmZD2i0A4UdAtJssOHRdM+IpkwymqwiWXkkcRPbqc3nP
         OK98HOHsAbwFhZv4JmrYobBofGhyP8ksNXc1lc5PJ0XGLbKYlWMcrKmAv4ggyJKkxigV
         53SD8+L+RRprUP1RujM21sh5RztDEr94kciuV6UkAyGjXpi6K0SlfssKBT/5x8Pc1HFY
         ggMS/Jhb1M+LEdGzfjKZmcP8Ilu8Vp48Cy0vdt9yVqaB9mE8n1CSTaoVqiI0yODkfy8K
         i3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tpY+VjIsQjXz5Vt9dm/Ujjj+dEvw21SkwlCoWVZ57SE=;
        b=Ky/uYnMkqXX9fsBboxe/Fb4LNROeylpLabVTb9Rxbu+OEMjCipMc1HzB+3VNmK+qyz
         YOWw+vLfbsIsGHps4UkVril3wnpbD5+uRjmxU2l0/cKpIlgf7cYArAdDvoaaEgEdup2o
         Dlp4gb0MNI5CaCsGc8CTAqqvwsr8/lJokGqkdbDi6leUKeD1QjgxllEy9gZNyG3SwB4d
         Hud9fG6jr0JGrvVVGECFV4YPLB2wPf7v0SwtVS3hK4F7NH4zlwyO+vBHWpUW9VwEOMUQ
         jLQtemb2Wu/QmXtfVwZ8me6Qm1DloKx328Uvy7GhmwaXv2lSYNmJjMtlKinwt5y9hmdI
         lTcg==
X-Gm-Message-State: AOAM533IEOGFdknJh/P8MTUvVgOyxuIwVaqWFA91JjEaq/rhcLFFkIM8
	ADrinC/ThpUuJF/XL7Qn2mWvPg==
X-Google-Smtp-Source: ABdhPJwaU6fNimtdi+8e+SdqlKVooVoGgL/Xm4CpakDlPp36bzq26YBu1bmKa7AVG9bkuN8DfyoZJw==
X-Received: by 2002:a37:bc7:: with SMTP id 190mr7895943qkl.286.1590762513596;
        Fri, 29 May 2020 07:28:33 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a424:8d51:840f:7f5c])
        by smtp.gmail.com with ESMTPSA id x41sm8592771qtb.76.2020.05.29.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 07:28:33 -0700 (PDT)
Date: Fri, 29 May 2020 10:28:31 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: set CVE_VERSION to fix cve-check warnings
Message-ID: <20200529142830.GA20456@kudzu.us>
References: <20200528140737.23411-1-ralph.siemsen@linaro.org>
 <CAFA6WYO4c3rHboqfppR+-h_Cjy7trTypfYm7Bikf6hVMy-jJUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYO4c3rHboqfppR+-h_Cjy7trTypfYm7Bikf6hVMy-jJUw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 06:04:05PM +0530, Sumit Garg wrote:
> On Thu, 28 May 2020 at 19:37, Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> >
> > Yocto cve-check currently produces numerous warnings like:
> >     WARNING: gcc-cross-arm-arm-8.3-r2019.03 do_cve_check: gcc:
> >     Failed to compare arm-8.3 < 10.0 for CVE-2019-15847
> > In turn this means that some potential CVEs are not reported.
> >
> > This occurs because PV has been prefixed with "arm-", to allow for
> > multiple gcc implementations.
> >
> > Fix this by setting CVE_VERSION to the non-prefixed version.
> >
> > Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> > ---
> > This patch is against master, but should also be applied to dunfell.
> >
> >  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc | 1 +
> >  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc | 1 +
> >  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 1 +
> >  3 files changed, 3 insertions(+)
> >
> 
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

Applied to the master branch.

Thanks,
Jon

> 
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
> > index c47c320..65fbeff 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
> > @@ -2,6 +2,7 @@ require recipes-devtools/gcc/gcc-common.inc
> >
> >  BASEPV = "8.2"
> >  PV = "arm-${BASEPV}"
> > +CVE_VERSION = "${BASEPV}"
> >
> >  MMYY = "19.01"
> >  RELEASE = "20${MMYY}"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
> > index 65eb0df..3fb87bb 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
> > @@ -2,6 +2,7 @@ require recipes-devtools/gcc/gcc-common.inc
> >
> >  BASEPV = "8.3"
> >  PV = "arm-${BASEPV}"
> > +CVE_VERSION = "${BASEPV}"
> >
> >  MMYY = "19.03"
> >  RELEASE = "20${MMYY}"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > index 08e8f7f..08ad796 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > @@ -3,6 +3,7 @@ require recipes-devtools/gcc/gcc-common.inc
> >  # Third digit in PV should be incremented after a minor release
> >
> >  PV = "arm-9.2"
> > +CVE_VERSION = "9.2"
> >
> >  # BINV should be incremented to a revision after a minor gcc release
> >
> > --
> > 2.17.1
> >
> > 

> 

