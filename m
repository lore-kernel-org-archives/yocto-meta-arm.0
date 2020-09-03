Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.13523.1599138795966051603
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 06:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=LuqFo9yG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id w16so2940389qkj.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 03 Sep 2020 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sXuNG9kD+fxMH71JMNyEZibIjAFajKXVDOs7ljCDY8Q=;
        b=LuqFo9yGCINrStD0gOIdjzAz+P0jjJwvK2D1pESpkHM5n8fB0UiQb5ET4cKZH7ezho
         sGk5ZrjIOuN/IUmwrIcXhyjOBmubSfqx/QyNrBFQbi3sqaitJs5WS5Zz6HPjmS01YZau
         PpZ2/j+MlqMpZ152Tf8zbd6HobQfSkjQwtoejuo6nq5oojty7nInHFEgihmWwzi062mo
         fv4DapITQJLL7CryMGWp/OtiqBZ6SNngSaeABPCshlscUaw+6TjdH2+sQqZaJEicLT9H
         7sGy7X4T+III9iIM2+kAwIDHuM2myh4w+ghBqX5jB2cmAhCs/d/ILF/XdwS0flwakNtZ
         9OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sXuNG9kD+fxMH71JMNyEZibIjAFajKXVDOs7ljCDY8Q=;
        b=PVJ2oTgdbcZRmUsDM3qWm90c9S50sDc2ZSJz/WZMzg3yhztLvgPYs5JIub3dssMIv0
         xfIQKEDAuVOK5Q04Og47Ey3K6/MO1Zw7Awa0mhCKG7pDiJhE6Z5FDw8ytWS9wjokLKuM
         mgFPP/EjpyT53F0H/KoIhGGslVms+t1UWSqn1XiLsM+ad1sqpiGivu13xzfSIZNnmacL
         205E+d/Tl8EyYH5hcEU3WRMK0PTxkW1p2QBB3Zuw3YXPZMTHxPWdm6ZAvjampFFBOr8+
         jdz+D2FCt0nL72NnTwE8qP/pO6IeLYb3eEuAmJv3LyUIX+AVVqy7doRgLDH20ejxgn8l
         CcIQ==
X-Gm-Message-State: AOAM531dY8bYhASk9hSKnaWlrWzQI3EMrKMOVShBJgGYAGOneTH9AV9E
	hhXV4M5gKAJBE5MU3Un39Q8iUg==
X-Google-Smtp-Source: ABdhPJwDZitQv3DAW3dVPdrzZ1OprFsEmFLAUNTab+paHl3eOZ2aexfsUHmsliQyNDoi1qq46rwp4A==
X-Received: by 2002:a37:9c16:: with SMTP id f22mr3054614qke.331.1599138794407;
        Thu, 03 Sep 2020 06:13:14 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id h17sm2126361qke.68.2020.09.03.06.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 06:13:13 -0700 (PDT)
Date: Thu, 3 Sep 2020 09:13:08 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
	nd <nd@arm.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp: ARMv8-2a: Add tuning files
Message-ID: <20200903131307.GC31845@kudzu.us>
References: <20200902155320.16918-1-jon.mason@arm.com>
 <CAP71WjwFJGtzv5re3tRwKhUje9bjb3qU8QQqE5KTLVUiOar9TA@mail.gmail.com>
 <20200903021909.GA31845@kudzu.us>
 <CAP71Wjzpu44KkX17XxWC6nXreEL88YDU_YZo_gJ1hH2LnHLD2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjzpu44KkX17XxWC6nXreEL88YDU_YZo_gJ1hH2LnHLD2w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2020 at 07:56:49AM +0200, Nicolas Dechesne wrote:
> On Thu, Sep 3, 2020 at 4:19 AM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Wed, Sep 02, 2020 at 09:55:04PM +0200, Nicolas Dechesne wrote:
> > > On Wed, Sep 2, 2020 at 5:53 PM Jon Mason <jon.mason@arm.com> wrote:
> > > >
> > > > Add all the available ARMv8.2 tunings from GCC.  This belongs in
> > > > OE-Core, but adding here so that it can be used while trying to upstream
> > > > there.
> > >
> > > This was merged recently in OE-core:
> > > https://git.openembedded.org/openembedded-core/commit/?id=88c79a56b4ddab61c16cd4cb7b887e7d7223d845
> > >
> > > Shouldn't you use this ?
> >
> > Below, the cores that are ARMv8.2 based are referencing that file.
> 
> ok. I missed them. However, more below ..
> 
> >
> > However, if you are asking if that should be sufficient for those
> > (instead of needing a core specific tuning), the answer appears to be
> > no.  If you compare the GCC flags for the generic 8.2
> > https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-arches.def;h=3be55fa29aa15cb19ab00aeb2edb156ad3d09aee;hb=HEAD
> > and an A75 (which is 8.2 based)
> > https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;h=a7dde38d7687049825aec4eb9446e76db84cd9c0;hb=HEAD#l102
> > You will see the flags are different.  Perhaps not sufficiently
> > different for anything more than benchmarking, but that is a secondary
> > discussion.  Given that these will mostly be used by meta-arm-bsp
> > machines, which will most likely want to be running as optimally as
> > possible, then this is a good thing to have here.
> 
> I agree with that, we should use CPU flags when they are available.
> 
> >
> > What I would like to do is actually include all of the 8.2 based cores
> > into the conf/machine/include/arm/arch-armv8-2a.inc.  This would stop
> > the explosion of core specific tunes in conf/machine/include/ and
> > nicely group them into a CPU generation family file.  However, that
> > might be contriversial.  While that is being hashed out, this can be
> > used here for those that need it.  So, think of this patch as an
> > intermediate step for that change.
> >
> > Thanks,
> > Jon
> >
> > >
> > >
> > > >
> > > > Change-Id: I5025eef6d18545478116b5079daf9c4d12e93dca
> > > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > > ---
> > > >  .../include/tune-cortexa73-cortexa35.inc      | 20 +++++++++++++++++++
> > > >  .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
> > > >  .../conf/machine/include/tune-cortexa75.inc   | 13 ++++++++++++
> > > >  .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
> > > >  .../conf/machine/include/tune-cortexa76.inc   | 13 ++++++++++++
> > > >  .../conf/machine/include/tune-cortexa77.inc   | 13 ++++++++++++
> > > >  .../conf/machine/include/tune-neoversen1.inc  | 14 +++++++++++++
> > > >  7 files changed, 113 insertions(+)
> > > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> > > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > > >
> > > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> > > > new file mode 100644
> > > > index 0000000..9e0786c
> > > > --- /dev/null
> > > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> > > > @@ -0,0 +1,20 @@
> > > > +DEFAULTTUNE ?= "cortexa73-cortexa35"
> > > > +
> > > > +TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
> > > > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > > > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "" ,d)}"
> > > > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
> > > > +
> > > > +require conf/machine/include/arm/arch-armv8a.inc
> 
> The commit log says that you are adding 8.2 tuning, however a73/a35 is
> not 8.2. Perhaps you should split  (or reword $msg).

Excellent point.  I'll break this out into a separate patch and clean
up the message to be more accurate.

> 
> > > > +
> > > > +# cortexa73.cortexa35 implies crc support
> > > > +AVAILTUNES += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> > > > +ARMPKGARCH_tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
> > > > +ARMPKGARCH_tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
> > > > +TUNE_FEATURES_tune-cortexa73-cortexa35               = "aarch64 crc cortexa73-cortexa35"
> > > > +TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "aarch64 crc crypto cortexa73-cortexa35"
> > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa35"
> > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> > > > +BASE_LIB_tune-cortexa73-cortexa35                    = "lib64"
> > > > +BASE_LIB_tune-cortexa73-cortexa35-crypto             = "lib64"
> > > > +
> > > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > > > new file mode 100644
> > > > index 0000000..8bc6b74
> > > > --- /dev/null
> > > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > > > @@ -0,0 +1,20 @@
> > > > +DEFAULTTUNE ?= "cortexa75-cortexa55"
> > > > +
> > > > +TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
> > > > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > > > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "" ,d)}"
> > > > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
> > > > +
> > > > +require conf/machine/include/arm/arch-armv8a.inc
> 
> Why not using 8.2 here? I stopped reviewing when I noticed that (and
> that's why I missed that you used 8.2 include later!).

Good catch.  I'll address this and the ones you mentioned below.

Thanks,
Jon

> > > > +
> > > > +# cortexa75.cortexa55 implies crc support
> > > > +AVAILTUNES += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
> > > > +ARMPKGARCH_tune-cortexa75-cortexa55                  = "cortexa75-cortexa55"
> > > > +ARMPKGARCH_tune-cortexa75-cortexa55-crypto           = "cortexa75-cortexa55-crypto"
> > > > +TUNE_FEATURES_tune-cortexa75-cortexa55               = "aarch64 crc cortexa75-cortexa55"
> > > > +TUNE_FEATURES_tune-cortexa75-cortexa55-crypto        = "aarch64 crc crypto cortexa75-cortexa55"
> > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa75-cortexa55"
> > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
> > > > +BASE_LIB_tune-cortexa75-cortexa55                    = "lib64"
> > > > +BASE_LIB_tune-cortexa75-cortexa55-crypto             = "lib64"
> > > > +
> > > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > > > new file mode 100644
> > > > index 0000000..58a3019
> > > > --- /dev/null
> > > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > > > @@ -0,0 +1,13 @@
> > > > +DEFAULTTUNE ?= "cortexa75"
> > > > +
> > > > +TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
> > > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
> > > > +
> > > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > > +
> > > > +# Little Endian base configs
> > > > +AVAILTUNES += "cortexa75"
> > > > +ARMPKGARCH_tune-cortexa75             = "cortexa75"
> > > > +TUNE_FEATURES_tune-cortexa75          = "aarch64 cortexa75 crc crypto"
> > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa75    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75"
> > > > +BASE_LIB_tune-cortexa75               = "lib64"
> > > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > > > new file mode 100644
> > > > index 0000000..138d443
> > > > --- /dev/null
> > > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > > > @@ -0,0 +1,20 @@
> > > > +DEFAULTTUNE ?= "cortexa76-cortexa55"
> > > > +
> > > > +TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
> > > > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > > > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "" ,d)}"
> > > > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
> > > > +
> > > > +require conf/machine/include/arm/arch-armv8a.inc
> 
> Why not 8.2?
> 
> > > > +
> > > > +# cortexa76.cortexa55 implies crc support
> > > > +AVAILTUNES += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
> > > > +ARMPKGARCH_tune-cortexa76-cortexa55                  = "cortexa76-cortexa55"
> > > > +ARMPKGARCH_tune-cortexa76-cortexa55-crypto           = "cortexa76-cortexa55-crypto"
> > > > +TUNE_FEATURES_tune-cortexa76-cortexa55               = "aarch64 crc cortexa76-cortexa55"
> > > > +TUNE_FEATURES_tune-cortexa76-cortexa55-crypto        = "aarch64 crc crypto cortexa76-cortexa55"
> > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa76-cortexa55"
> > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
> > > > +BASE_LIB_tune-cortexa76-cortexa55                    = "lib64"
> > > > +BASE_LIB_tune-cortexa76-cortexa55-crypto             = "lib64"
> > > > +
> > > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > > > new file mode 100644
> > > > index 0000000..70f9770
> > > > --- /dev/null
> > > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > > > @@ -0,0 +1,13 @@
> > > > +DEFAULTTUNE ?= "cortexa76"
> > > > +
> > > > +TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
> > > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
> > > > +
> > > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > > +
> > > > +# Little Endian base configs
> > > > +AVAILTUNES += "cortexa76"
> > > > +ARMPKGARCH_tune-cortexa76             = "cortexa76"
> > > > +TUNE_FEATURES_tune-cortexa76          = "aarch64 cortexa76 crc crypto"
> > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa76    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76"
> > > > +BASE_LIB_tune-cortexa76               = "lib64"
> > > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > > > new file mode 100644
> > > > index 0000000..672c8d5
> > > > --- /dev/null
> > > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > > > @@ -0,0 +1,13 @@
> > > > +DEFAULTTUNE ?= "cortexa77"
> > > > +
> > > > +TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
> > > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
> > > > +
> > > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > > +
> > > > +# Little Endian base configs
> > > > +AVAILTUNES += "cortexa77"
> > > > +ARMPKGARCH_tune-cortexa77             = "cortexa77"
> > > > +TUNE_FEATURES_tune-cortexa77          = "aarch64 cortexa77 crc crypto"
> > > > +PACKAGE_EXTRA_ARCHS_tune-cortexa77    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa77"
> > > > +BASE_LIB_tune-cortexa77               = "lib64"
> > > > diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > > > new file mode 100644
> > > > index 0000000..04e28ee
> > > > --- /dev/null
> > > > +++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > > > @@ -0,0 +1,14 @@
> > > > +DEFAULTTUNE ?= "neoversen1"
> > > > +
> > > > +TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor optimizations"
> > > > +# Note: Neoverse was called Ares, and GCC will accept "ares" in place of "neoverse-n1"
> > > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
> > > > +
> > > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > > +
> > > > +# Little Endian base configs
> > > > +AVAILTUNES += "neoversen1"
> > > > +ARMPKGARCH_tune-neoversen1             = "neoversen1"
> > > > +TUNE_FEATURES_tune-neoversen1          = "aarch64 neoversen1 crc crypto"
> > > > +PACKAGE_EXTRA_ARCHS_tune-neoversen1    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1"
> > > > +BASE_LIB_tune-neoversen1               = "lib64"
> > > > --
> > > > 2.17.1
> > > >
> > > >
> >
> > > 
> >
