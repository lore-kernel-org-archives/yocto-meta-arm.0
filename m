Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web09.1586.1603227490613553795
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 13:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=cMQBcB9A;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id h12so246788qtu.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GuWwkNipn/SG3M0vooplhTu1HDWVLaJk54adQbUd+aY=;
        b=cMQBcB9AjyEj1cVfi8D6hVOm2yC6YMQ6RC80KQkrurknIjgDFeuhg8EKpK63fSW4Pg
         ecmXixd9ppvdMr8fh2mTFXhbOc0P11PPjoKzxYi7U0OuAhvNh4Xp0A+xOBR1eju4UA1w
         EOz/Bex8jEBMSFoadPJUv94r8qmWADItOyeDQANmtEzLZZ+iNxmKc7/TBWExEbpauiE1
         h8EMgk5DugddcLV6OgHDKUIx6J+Bof7QBlkwC0+H1LuFHoFpCnrjBWi1YX3B2vuwYUlf
         TdFNrjSIAxB3ydZ/xlSGbYDpx1dakWKtWUjSNOcsA08xVHUf4pwv/chnw/h0dlAln+mi
         Udlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GuWwkNipn/SG3M0vooplhTu1HDWVLaJk54adQbUd+aY=;
        b=LqTGBIJWygc6ozVFCiNrDZNxs/h7NMkS1FHXTF3IoT1kb8KDG7RVfbzA/RjXxxtu4q
         4whwLD4jradr9uG0HKQU2lZnOmame0u28+mjBM9vclGoS8PQegZdGl/u1SSAHirY/zyT
         wPpW8eYoO2Pj7pxes8aqQ4je91Rr/V9hV7K8ezJ6BeTbLhSUHZHJ0fSXQi3YCDCVgs/M
         lM2AjRShmHQM65eeAs0tB0kEVeTD6u5vJH9kklpi7dBCA40yCVqISuUzbftyVJVnhUrK
         E4gmIvusfHhyfZNucOaUNfxqlV9546cWtd6XNcOBypzu7OOyjqa0kwLhg6X0ih/Ud5Nw
         MByg==
X-Gm-Message-State: AOAM5335ulYRi/LktVCd+az8eaJCD4YIxhPcc2Dbl/xDpY8hnopuP3xu
	6L3HfVvXUK18tErSblukPtxBJw==
X-Google-Smtp-Source: ABdhPJw+R5clyL3qATM9sXJFLeKnKDDACitEQE9sOf6OrF6ZZbMNdBqx6NXvgE9zRUQw+6cqTMMtgA==
X-Received: by 2002:ac8:57d1:: with SMTP id w17mr57478qta.194.1603227489634;
        Tue, 20 Oct 2020 13:58:09 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id m33sm1466758qtb.65.2020.10.20.13.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 13:58:09 -0700 (PDT)
Date: Tue, 20 Oct 2020 16:58:04 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: Brett Warren <brett.warren@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v4 7/7] optee: upgrade to 3.11
Message-ID: <20201020205803.GA11378@kudzu.us>
References: <20201019132350.25042-1-brett.warren@arm.com>
 <20201019132350.25042-7-brett.warren@arm.com>
 <CAAnfSTsW1Zz-TohJT8Z1T72P1dt+c87UxBG0MyOLfKRjMtrvGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTsW1Zz-TohJT8Z1T72P1dt+c87UxBG0MyOLfKRjMtrvGA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 09:47:17PM +0100, Ross Burton wrote:
> This fails to build optee-examples for me, because it tries to link to
> libstdc++.a (no absolute path, no -l).
> 
> It looks like the problem is the allow-sysroot-* patches which pass
> the sysroot to the libgcc search, but not the libstdc++ search.
> Adding the LIBGCC_LOCATE_CFLAGS argument to the other static libraries
> is sufficient to fix the build.
> 
> Can you send a v2?

Too late, I pushed it before this email was sent.

Brett, can you push a fix?

Thanks,
Jon

> 
> Ross
> 
> On Mon, 19 Oct 2020 at 14:24, Brett Warren <brett.warren@arm.com> wrote:
> >
> > optee 3.10 recipes have been upgraded to 3.11 to keep up with
> > the latest version.
> >
> > Change-Id: fef3af6d7d04d2903d310cf99d17566b67e2f811
> > Signed-off-by: Brett Warren <brett.warren@arm.com>
> > ---
> >  meta-arm/recipes-security/optee/optee-client_3.10.0.bb        | 3 ---
> >  meta-arm/recipes-security/optee/optee-client_3.11.0.bb        | 3 +++
> >  meta-arm/recipes-security/optee/optee-examples_3.10.0.bb      | 4 ----
> >  meta-arm/recipes-security/optee/optee-examples_3.11.0.bb      | 4 ++++
> >  .../optee/{optee-os_3.10.0.bb => optee-os_3.11.0.bb}          | 2 +-
> >  meta-arm/recipes-security/optee/optee-test_3.10.0.bb          | 3 ---
> >  meta-arm/recipes-security/optee/optee-test_3.11.0.bb          | 3 +++
> >  7 files changed, 11 insertions(+), 11 deletions(-)
> >  delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> >  create mode 100644 meta-arm/recipes-security/optee/optee-client_3.11.0.bb
> >  delete mode 100644 meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> >  create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
> >  rename meta-arm/recipes-security/optee/{optee-os_3.10.0.bb => optee-os_3.11.0.bb} (76%)
> >  delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> >  create mode 100644 meta-arm/recipes-security/optee/optee-test_3.11.0.bb
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> > deleted file mode 100644
> > index c7cef19..0000000
> > --- a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> > +++ /dev/null
> > @@ -1,3 +0,0 @@
> > -require optee-client.inc
> > -
> > -SRCREV = "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
> > diff --git a/meta-arm/recipes-security/optee/optee-client_3.11.0.bb b/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
> > new file mode 100644
> > index 0000000..f765d12
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
> > @@ -0,0 +1,3 @@
> > +require optee-client.inc
> > +
> > +SRCREV = "c0c925384c1d7e3558d27d2708857482952d7907"
> > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> > deleted file mode 100644
> > index 1c52698..0000000
> > --- a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -require optee-examples.inc
> > -
> > -SRCREV = "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
> > -
> > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
> > new file mode 100644
> > index 0000000..72473ed
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
> > @@ -0,0 +1,4 @@
> > +require optee-examples.inc
> > +
> > +SRCREV = "9a7dc598591990349d88b4dba3a37aadd6851295"
> > +
> > diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
> > similarity index 76%
> > rename from meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> > rename to meta-arm/recipes-security/optee/optee-os_3.11.0.bb
> > index c3f7b12..a8f2a11 100644
> > --- a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> > +++ b/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
> > @@ -1,6 +1,6 @@
> >  require optee-os.inc
> >
> > -SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
> > +SRCREV = "c4def2a8262a03244d9a88461699b9b8e43c6b55"
> >
> >  SRC_URI_append = " \
> >      file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> > diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> > deleted file mode 100644
> > index 396f7cb..0000000
> > --- a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> > +++ /dev/null
> > @@ -1,3 +0,0 @@
> > -require optee-test.inc
> > -
> > -SRCREV = "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
> > diff --git a/meta-arm/recipes-security/optee/optee-test_3.11.0.bb b/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
> > new file mode 100644
> > index 0000000..0f8b5b0
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
> > @@ -0,0 +1,3 @@
> > +require optee-test.inc
> > +
> > +SRCREV = "159e295d5cc3ad2275ab15fe544620f6604d4ba4"
> > --
> > 2.17.1
> >
> >
> > 
> >

> 
> 
> 

