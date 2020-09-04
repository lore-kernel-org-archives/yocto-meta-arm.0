Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.29395.1599184183022665865
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 18:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=pVWMP/wi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id u3so5036038qkd.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 03 Sep 2020 18:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FFu9YAsuAxtEwGrGl/WMz6CPT+tJfpYcmRg3tvWaNtc=;
        b=pVWMP/wiBsQa/HRmtb1y1ekh54WM4ct6wrKpD89laoA5PeHnLWlIcMYGVZmKcZL1yb
         rTdUyi8aaevPVUZwjVKJ6cD+fya9P6EAN6hVnn5e4C+G5yN1HH7csaT+6vHtGqMt4HDQ
         tvmRs58Wizzh2NE+hHwah2aoTIoP8AvOp5ee7VsKuxvbqvnDD9oAxv7wrHV5TnZks4Su
         omICpQwQ5qMGLfEEpzq9RtHmzsdMU+G7vn7xIAZocsJHaVBlh3TolvAp7SNmve9R1pl4
         pSYFkgCCfRnoMXxAmfNZYzOqyVDrvcj7TdRrW+xxSD/8QJ8qlLUpIiBfK6zNpa6ovNiT
         MKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FFu9YAsuAxtEwGrGl/WMz6CPT+tJfpYcmRg3tvWaNtc=;
        b=L7Iv/inKy4sgiM904U2PX5ck8rghkPSgyGslnsxvHeJ7ykSHlIWvRZ6g17KT/QvMkx
         f5pLaOlO4TGfkuusL9nP+8/9LHn8y3jyyTXPKg4/f21Hd7J8D1Pa4qxZwmtxCOmXhR6X
         ek8QR9+OwOSiGH2n7p8kiP5C0+AC9FGd+/ooAs0Rt5+xo+SzgWaML5pSygTKEwfpoFY+
         +haRDGuTw9A5WHnenGmKU3qFet7fmZvJFwfk/BO1HqhzozL0gZvX0vc7PJ0EZlbUn1W8
         Iz5agp4CE8zA2mWGvaHni2wvJB9/Jh/mCH2GyKXW9KSZPweSjDA1DlAK2oBSxejLp0pS
         Nxtw==
X-Gm-Message-State: AOAM531RZrin3D155kiWPy4GRU8Y8c75ekl4wqpZ4ExkpVf0soEKdvfS
	+u4lPfhvlME5drqTfVgNcl9wsw==
X-Google-Smtp-Source: ABdhPJwEHXtT/7El0UHAsoKK0y9ES9xfJpsrOgAemhBDMiSQbPAmBi7iCJWZgSx0QVgnW6zMFPimyw==
X-Received: by 2002:a37:b942:: with SMTP id j63mr6111337qkf.138.1599184182080;
        Thu, 03 Sep 2020 18:49:42 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id o72sm3494081qka.113.2020.09.03.18.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 18:49:41 -0700 (PDT)
Date: Thu, 3 Sep 2020 21:49:36 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH v2 2/4] arm-bsp: ARMv8-2a: Add tuning files
Message-ID: <20200904014935.GA27623@kudzu.us>
References: <20200903173618.2910-1-jon.mason@arm.com>
 <20200903173618.2910-2-jon.mason@arm.com>
 <CAP71Wjxc7rppRkG_VaeE7a0V1BCf7ea=sVKXXGevJ4-VvePkSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjxc7rppRkG_VaeE7a0V1BCf7ea=sVKXXGevJ4-VvePkSQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2020 at 09:44:11PM +0200, Nicolas Dechesne wrote:
> On Thu, Sep 3, 2020 at 7:36 PM Jon Mason <jon.mason@arm.com> wrote:
> >
> > Add all the available ARMv8.2 tunings from GCC.  This belongs in
> > OE-Core, but adding here so that it can be used while trying to upstream
> > there.
> 
> both patches (the one about ARMv8-A big little) look good to me!

Thanks for the review.  If you like, I can add your "Reviewed-by" to
give you a little credit for your work.

Thanks,
Jon

> 
> >
> > Change-Id: I5025eef6d18545478116b5079daf9c4d12e93dca
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
> >  .../conf/machine/include/tune-cortexa75.inc   | 13 ++++++++++++
> >  .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
> >  .../conf/machine/include/tune-cortexa76.inc   | 13 ++++++++++++
> >  .../conf/machine/include/tune-cortexa77.inc   | 13 ++++++++++++
> >  .../conf/machine/include/tune-neoversen1.inc  | 14 +++++++++++++
> >  6 files changed, 93 insertions(+)
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> >
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > new file mode 100644
> > index 0000000..af4bfbe
> > --- /dev/null
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > @@ -0,0 +1,20 @@
> > +DEFAULTTUNE ?= "cortexa75-cortexa55"
> > +
> > +TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
> > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "" ,d)}"
> > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
> > +
> > +require conf/machine/include/arm/arch-armv8-2a.inc
> > +
> > +# cortexa75.cortexa55 implies crc support
> > +AVAILTUNES += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
> > +ARMPKGARCH_tune-cortexa75-cortexa55                  = "cortexa75-cortexa55"
> > +ARMPKGARCH_tune-cortexa75-cortexa55-crypto           = "cortexa75-cortexa55-crypto"
> > +TUNE_FEATURES_tune-cortexa75-cortexa55               = "aarch64 crc cortexa75-cortexa55"
> > +TUNE_FEATURES_tune-cortexa75-cortexa55-crypto        = "aarch64 crc crypto cortexa75-cortexa55"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa75-cortexa55"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
> > +BASE_LIB_tune-cortexa75-cortexa55                    = "lib64"
> > +BASE_LIB_tune-cortexa75-cortexa55-crypto             = "lib64"
> > +
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > new file mode 100644
> > index 0000000..58a3019
> > --- /dev/null
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > @@ -0,0 +1,13 @@
> > +DEFAULTTUNE ?= "cortexa75"
> > +
> > +TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
> > +
> > +require conf/machine/include/arm/arch-armv8-2a.inc
> > +
> > +# Little Endian base configs
> > +AVAILTUNES += "cortexa75"
> > +ARMPKGARCH_tune-cortexa75             = "cortexa75"
> > +TUNE_FEATURES_tune-cortexa75          = "aarch64 cortexa75 crc crypto"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa75    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75"
> > +BASE_LIB_tune-cortexa75               = "lib64"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > new file mode 100644
> > index 0000000..7c27d21
> > --- /dev/null
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > @@ -0,0 +1,20 @@
> > +DEFAULTTUNE ?= "cortexa76-cortexa55"
> > +
> > +TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
> > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "" ,d)}"
> > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
> > +
> > +require conf/machine/include/arm/arch-armv8-2a.inc
> > +
> > +# cortexa76.cortexa55 implies crc support
> > +AVAILTUNES += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
> > +ARMPKGARCH_tune-cortexa76-cortexa55                  = "cortexa76-cortexa55"
> > +ARMPKGARCH_tune-cortexa76-cortexa55-crypto           = "cortexa76-cortexa55-crypto"
> > +TUNE_FEATURES_tune-cortexa76-cortexa55               = "aarch64 crc cortexa76-cortexa55"
> > +TUNE_FEATURES_tune-cortexa76-cortexa55-crypto        = "aarch64 crc crypto cortexa76-cortexa55"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa76-cortexa55"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
> > +BASE_LIB_tune-cortexa76-cortexa55                    = "lib64"
> > +BASE_LIB_tune-cortexa76-cortexa55-crypto             = "lib64"
> > +
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > new file mode 100644
> > index 0000000..70f9770
> > --- /dev/null
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > @@ -0,0 +1,13 @@
> > +DEFAULTTUNE ?= "cortexa76"
> > +
> > +TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
> > +
> > +require conf/machine/include/arm/arch-armv8-2a.inc
> > +
> > +# Little Endian base configs
> > +AVAILTUNES += "cortexa76"
> > +ARMPKGARCH_tune-cortexa76             = "cortexa76"
> > +TUNE_FEATURES_tune-cortexa76          = "aarch64 cortexa76 crc crypto"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa76    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76"
> > +BASE_LIB_tune-cortexa76               = "lib64"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > new file mode 100644
> > index 0000000..672c8d5
> > --- /dev/null
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > @@ -0,0 +1,13 @@
> > +DEFAULTTUNE ?= "cortexa77"
> > +
> > +TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
> > +
> > +require conf/machine/include/arm/arch-armv8-2a.inc
> > +
> > +# Little Endian base configs
> > +AVAILTUNES += "cortexa77"
> > +ARMPKGARCH_tune-cortexa77             = "cortexa77"
> > +TUNE_FEATURES_tune-cortexa77          = "aarch64 cortexa77 crc crypto"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa77    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa77"
> > +BASE_LIB_tune-cortexa77               = "lib64"
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > new file mode 100644
> > index 0000000..04e28ee
> > --- /dev/null
> > +++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > @@ -0,0 +1,14 @@
> > +DEFAULTTUNE ?= "neoversen1"
> > +
> > +TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor optimizations"
> > +# Note: Neoverse was called Ares, and GCC will accept "ares" in place of "neoverse-n1"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
> > +
> > +require conf/machine/include/arm/arch-armv8-2a.inc
> > +
> > +# Little Endian base configs
> > +AVAILTUNES += "neoversen1"
> > +ARMPKGARCH_tune-neoversen1             = "neoversen1"
> > +TUNE_FEATURES_tune-neoversen1          = "aarch64 neoversen1 crc crypto"
> > +PACKAGE_EXTRA_ARCHS_tune-neoversen1    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1"
> > +BASE_LIB_tune-neoversen1               = "lib64"
> > --
> > 2.17.1
> >
> > 

> 

