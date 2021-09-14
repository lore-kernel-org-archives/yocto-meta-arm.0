Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.12140.1631634134471952666
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Sep 2021 08:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Jx/UyVsh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id b64so15361021qkg.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Sep 2021 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eTZ25+jMryWsXWb1/dfMKv3tC2fOfSiYKJR1K37w/oY=;
        b=Jx/UyVshnAKL5XQcU5pj5oOxzf/SDe4zP8K++uiAAW5NyWKVlTZF9jDUwN8d7CfJhT
         s+7AOXL4Yu2IyPCpLd8zFvRhKG6k47ePEbKiYZZwaWeZ8j+uDRi232JqaJpVuqxGNlS1
         pg2NVFpWPBmBHV4JojcbWi5KIfbQMhanu4tSNh4Ws1kkBC+bwvv3Rq5cSVxyZdV/BccO
         lgFBdLhh4hFlJ8GKcVTncwvU38202CXgj3vGSPuwxb5foGGPthHY6QdnbMdE6Ne3r7dy
         nloLwgqfPOlRq3YgxY2Q0Vnimki1X8cuL8XV4eYxO8FLSLaEYZe1ULYavcfBTfXFvj7l
         4Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eTZ25+jMryWsXWb1/dfMKv3tC2fOfSiYKJR1K37w/oY=;
        b=YfzLSxgXpF59yqJWOdxJdKwwEq0f/8H5oSohChI7XRNVptEQHMRtIL0JmjHIE0ijit
         pJcPc7Xq4SU6/q1DEVB0isRNTnRcjKyVkrYDCKE47xIn3Odr+q9/0r4JTh8ZfYpW5jox
         e7ZckK/Dw/lqea8KtqWpd9f+UK/CqQk40r7PGiXIVmiRSV4zZARquUkChsxCLvADm14e
         wRXh6vUWZ2FgvQ3EV/WSJtgdLe3ocogH6SgSLyKCu9EHIIvVPH3aNe+kUKBV+ji9S+Hp
         hp1YZpkn0rAibp8OPtV7VeX7j3Fi773isJxzmFj1Wx9TMLm0hDp8hVuM4PofITnSFVnj
         l18Q==
X-Gm-Message-State: AOAM533Om/Pc3NwBbsmlPw1IyFTu/pkuyA3g/koaVaTSq9DZisQv47Tx
	m5z/PnRX9PD7tM90vybTsY8x8YlVgHZpKThKeZ5HoQ==
X-Google-Smtp-Source: ABdhPJyhXIACK7X4GnuDrIVtP2TBk8aiaZg2skPLgF69tdE6r6xmkV3IOonYqRtqoKegKM0oVpTVTOKJEzI5gPqo6Ns=
X-Received: by 2002:a37:d4c:: with SMTP id 73mr5721028qkn.188.1631634133520;
 Tue, 14 Sep 2021 08:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210913174436.19864-1-jon.mason@arm.com> <CAFA6WYM=7E73jgd8TWVhoUBzjB5CxyRcLHVAUCFpcY6D_R1bPw@mail.gmail.com>
In-Reply-To: <CAFA6WYM=7E73jgd8TWVhoUBzjB5CxyRcLHVAUCFpcY6D_R1bPw@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Tue, 14 Sep 2021 11:42:00 -0400
Message-ID: <CAPoiz9zOgWjHpyBgJ9sZ6h50=Gioth+2rfym775sworb7OwAQw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] ci: make get-binary-toolchain run per build
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 1:23 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Mon, 13 Sept 2021 at 23:14, Jon Mason <jon.mason@arm.com> wrote:
> >
> > In a distributed, non-homogeneous CI setup, the binary-toolchain setup
> > script might not run on the machine that needs the toolchains.  Make
> > this per-build and it will always be there, at the expense of running on
> > builds that might not need it (though it still should be fast).
> >
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  .gitlab-ci.yml           | 9 ++-------
> >  ci/get-binary-toolchains | 2 +-
> >  2 files changed, 3 insertions(+), 8 deletions(-)
> >
>
> Thanks John for the updates.
>
> Acked-by: Sumit Garg <sumit.garg@linaro.org>

Unfortunately, I found a bug when running against multiple branches
simultaneously.  v2 coming shortly :)

Thanks,
Jon

>
> -Sumit
>
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 697603b..ab254f6 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -24,6 +24,8 @@ stages:
> >      - echo DL_DIR = $DL_DIR
> >      - rm -rf $KAS_WORK_DIR
> >      - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR
> > +    # Must do this here, as it's the only way to make sure the toolhchain is installed on the same builder
> > +    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR
> >
> >  # Generalised fragment to do a Kas build
> >  .build:
> > @@ -43,13 +45,6 @@ update-repos:
> >    script:
> >    - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
> >
> > -get-binary-toolchains:
> > -  extends: .setup
> > -  stage: prep
> > -  script:
> > -    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR
> > -
> > -
> >  #
> >  # Bootstrap stage, bootstrap and machine coverage
> >  #
> > diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> > index 6fa7ff4..fae3b01 100755
> > --- a/ci/get-binary-toolchains
> > +++ b/ci/get-binary-toolchains
> > @@ -7,7 +7,7 @@ VER="10.2-2020.11"
> >  DOWNLOAD_DIR=$1
> >  TOOLCHAIN_DIR=$2
> >
> > -# These should be already created by .bitlab-ci.yml, but do here if run outside of that env
> > +# These should be already created by .gitlab-ci.yml, but do here if run outside of that env
> >  mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR
> >
> >  if [ $HOST_ARCH = "aarch64" ]; then
> > --
> > 2.17.1
> >
> >
> >
> >
>
> 
>
