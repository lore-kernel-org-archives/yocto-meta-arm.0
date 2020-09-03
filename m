Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web10.7610.1599112621488650031
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 22:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ItocyG51;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id c17so1381909ybe.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2020 22:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vCz8dNA4G+Rb3kVr6e2JNwW1V6usujveiXGsalj7UbM=;
        b=ItocyG51YOlVgWc5bE1GK5p7C+mjihI8yrka6X3QnLu2WV1QxxWTEnSS+otCG33iQR
         /8t6QUEkI9lQhZEAmpy/iWDePTO4IaVw0S1xKSOjrNOyrz+rbtZHP0OwnkkGdecG5W+z
         MqaNfjsDD5/nXMka1/ORKSFJPSHjJlcw3TLekjqtGaDrVvm7Y5gzheYTGLWnyy/Dcp4Y
         svUGkAptfImeq7haAZJ140mSFBDP7Idb7jAjnlvG0haOS+W1lTnn/IP+kY+Hz3DPd4TD
         gKd/8oWwh7Ypxji83o/svUMyiht71kHFzrJ0zJc2Orwy78pni00ng+Qsn8AbeogJc8lG
         jJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vCz8dNA4G+Rb3kVr6e2JNwW1V6usujveiXGsalj7UbM=;
        b=krm/5T/68oR1aObo2perQR3hYRZJdAK0xzJCWFzXrTnvMMFHo2matnXdnAZw+5W43X
         spaDjoDnyw2pevqafQOLbL+sPjxV0fAp5ZcZe4c0TdzfBGZWP9cdmaqYa+QfgOq4udvx
         f3LqIHNmAV3vUI12T9zXO1depXFCWA5P9IOSnQTxPMZ1Po8eLTzBr+TY9tw5NGJY2GbK
         GAo9t9OVGdDs3U1giMQJxWx9zXNUcbr1BFZ0GmLEX7US6AkfyErbw+NDHpc/dpd3yZg+
         uOtHpCTDUvGq9SUAOcwISjzAOEB8HmQ6D6jSQoCLjM59AQVsMSH4unva4T/RF4ogOT2q
         Xf+A==
X-Gm-Message-State: AOAM533NNVRKqdE/v/LR+uBpk1j+O32IbRzknOa+Rz0crxsKCVP+Boob
	ybzbTR1OZLN2x4peOULMtucMFdPleafr8EGKZMvATg==
X-Google-Smtp-Source: ABdhPJx3uFAD6uSdCtlcUgmTfVoNPFApKdyixvQ/7td8YZPu5uFcc8wv/McZgaoNMf+4Mbvrmy7pgI8TphDlldmM974=
X-Received: by 2002:a25:c004:: with SMTP id c4mr512493ybf.475.1599112620408;
 Wed, 02 Sep 2020 22:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200902155320.16918-1-jon.mason@arm.com> <CAP71WjwFJGtzv5re3tRwKhUje9bjb3qU8QQqE5KTLVUiOar9TA@mail.gmail.com>
 <20200903021909.GA31845@kudzu.us>
In-Reply-To: <20200903021909.GA31845@kudzu.us>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 3 Sep 2020 07:56:49 +0200
Message-ID: <CAP71Wjzpu44KkX17XxWC6nXreEL88YDU_YZo_gJ1hH2LnHLD2w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp: ARMv8-2a: Add tuning files
To: Jon Mason <jdmason@kudzu.us>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org, nd <nd@arm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 3, 2020 at 4:19 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Wed, Sep 02, 2020 at 09:55:04PM +0200, Nicolas Dechesne wrote:
> > On Wed, Sep 2, 2020 at 5:53 PM Jon Mason <jon.mason@arm.com> wrote:
> > >
> > > Add all the available ARMv8.2 tunings from GCC.  This belongs in
> > > OE-Core, but adding here so that it can be used while trying to upstream
> > > there.
> >
> > This was merged recently in OE-core:
> > https://git.openembedded.org/openembedded-core/commit/?id=88c79a56b4ddab61c16cd4cb7b887e7d7223d845
> >
> > Shouldn't you use this ?
>
> Below, the cores that are ARMv8.2 based are referencing that file.

ok. I missed them. However, more below ..

>
> However, if you are asking if that should be sufficient for those
> (instead of needing a core specific tuning), the answer appears to be
> no.  If you compare the GCC flags for the generic 8.2
> https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-arches.def;h=3be55fa29aa15cb19ab00aeb2edb156ad3d09aee;hb=HEAD
> and an A75 (which is 8.2 based)
> https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;h=a7dde38d7687049825aec4eb9446e76db84cd9c0;hb=HEAD#l102
> You will see the flags are different.  Perhaps not sufficiently
> different for anything more than benchmarking, but that is a secondary
> discussion.  Given that these will mostly be used by meta-arm-bsp
> machines, which will most likely want to be running as optimally as
> possible, then this is a good thing to have here.

I agree with that, we should use CPU flags when they are available.

>
> What I would like to do is actually include all of the 8.2 based cores
> into the conf/machine/include/arm/arch-armv8-2a.inc.  This would stop
> the explosion of core specific tunes in conf/machine/include/ and
> nicely group them into a CPU generation family file.  However, that
> might be contriversial.  While that is being hashed out, this can be
> used here for those that need it.  So, think of this patch as an
> intermediate step for that change.
>
> Thanks,
> Jon
>
> >
> >
> > >
> > > Change-Id: I5025eef6d18545478116b5079daf9c4d12e93dca
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > ---
> > >  .../include/tune-cortexa73-cortexa35.inc      | 20 +++++++++++++++++++
> > >  .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
> > >  .../conf/machine/include/tune-cortexa75.inc   | 13 ++++++++++++
> > >  .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
> > >  .../conf/machine/include/tune-cortexa76.inc   | 13 ++++++++++++
> > >  .../conf/machine/include/tune-cortexa77.inc   | 13 ++++++++++++
> > >  .../conf/machine/include/tune-neoversen1.inc  | 14 +++++++++++++
> > >  7 files changed, 113 insertions(+)
> > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > >
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> > > new file mode 100644
> > > index 0000000..9e0786c
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> > > @@ -0,0 +1,20 @@
> > > +DEFAULTTUNE ?= "cortexa73-cortexa35"
> > > +
> > > +TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
> > > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "" ,d)}"
> > > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8a.inc

The commit log says that you are adding 8.2 tuning, however a73/a35 is
not 8.2. Perhaps you should split  (or reword $msg).

> > > +
> > > +# cortexa73.cortexa35 implies crc support
> > > +AVAILTUNES += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> > > +ARMPKGARCH_tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
> > > +ARMPKGARCH_tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
> > > +TUNE_FEATURES_tune-cortexa73-cortexa35               = "aarch64 crc cortexa73-cortexa35"
> > > +TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "aarch64 crc crypto cortexa73-cortexa35"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa35"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> > > +BASE_LIB_tune-cortexa73-cortexa35                    = "lib64"
> > > +BASE_LIB_tune-cortexa73-cortexa35-crypto             = "lib64"
> > > +
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > > new file mode 100644
> > > index 0000000..8bc6b74
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > > @@ -0,0 +1,20 @@
> > > +DEFAULTTUNE ?= "cortexa75-cortexa55"
> > > +
> > > +TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
> > > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "" ,d)}"
> > > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8a.inc

Why not using 8.2 here? I stopped reviewing when I noticed that (and
that's why I missed that you used 8.2 include later!).

> > > +
> > > +# cortexa75.cortexa55 implies crc support
> > > +AVAILTUNES += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
> > > +ARMPKGARCH_tune-cortexa75-cortexa55                  = "cortexa75-cortexa55"
> > > +ARMPKGARCH_tune-cortexa75-cortexa55-crypto           = "cortexa75-cortexa55-crypto"
> > > +TUNE_FEATURES_tune-cortexa75-cortexa55               = "aarch64 crc cortexa75-cortexa55"
> > > +TUNE_FEATURES_tune-cortexa75-cortexa55-crypto        = "aarch64 crc crypto cortexa75-cortexa55"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa75-cortexa55"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
> > > +BASE_LIB_tune-cortexa75-cortexa55                    = "lib64"
> > > +BASE_LIB_tune-cortexa75-cortexa55-crypto             = "lib64"
> > > +
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > > new file mode 100644
> > > index 0000000..58a3019
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > > @@ -0,0 +1,13 @@
> > > +DEFAULTTUNE ?= "cortexa75"
> > > +
> > > +TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
> > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > +
> > > +# Little Endian base configs
> > > +AVAILTUNES += "cortexa75"
> > > +ARMPKGARCH_tune-cortexa75             = "cortexa75"
> > > +TUNE_FEATURES_tune-cortexa75          = "aarch64 cortexa75 crc crypto"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa75    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75"
> > > +BASE_LIB_tune-cortexa75               = "lib64"
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > > new file mode 100644
> > > index 0000000..138d443
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > > @@ -0,0 +1,20 @@
> > > +DEFAULTTUNE ?= "cortexa76-cortexa55"
> > > +
> > > +TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
> > > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "" ,d)}"
> > > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8a.inc

Why not 8.2?

> > > +
> > > +# cortexa76.cortexa55 implies crc support
> > > +AVAILTUNES += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
> > > +ARMPKGARCH_tune-cortexa76-cortexa55                  = "cortexa76-cortexa55"
> > > +ARMPKGARCH_tune-cortexa76-cortexa55-crypto           = "cortexa76-cortexa55-crypto"
> > > +TUNE_FEATURES_tune-cortexa76-cortexa55               = "aarch64 crc cortexa76-cortexa55"
> > > +TUNE_FEATURES_tune-cortexa76-cortexa55-crypto        = "aarch64 crc crypto cortexa76-cortexa55"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa76-cortexa55"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
> > > +BASE_LIB_tune-cortexa76-cortexa55                    = "lib64"
> > > +BASE_LIB_tune-cortexa76-cortexa55-crypto             = "lib64"
> > > +
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > > new file mode 100644
> > > index 0000000..70f9770
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > > @@ -0,0 +1,13 @@
> > > +DEFAULTTUNE ?= "cortexa76"
> > > +
> > > +TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
> > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > +
> > > +# Little Endian base configs
> > > +AVAILTUNES += "cortexa76"
> > > +ARMPKGARCH_tune-cortexa76             = "cortexa76"
> > > +TUNE_FEATURES_tune-cortexa76          = "aarch64 cortexa76 crc crypto"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa76    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76"
> > > +BASE_LIB_tune-cortexa76               = "lib64"
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > > new file mode 100644
> > > index 0000000..672c8d5
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > > @@ -0,0 +1,13 @@
> > > +DEFAULTTUNE ?= "cortexa77"
> > > +
> > > +TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
> > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > +
> > > +# Little Endian base configs
> > > +AVAILTUNES += "cortexa77"
> > > +ARMPKGARCH_tune-cortexa77             = "cortexa77"
> > > +TUNE_FEATURES_tune-cortexa77          = "aarch64 cortexa77 crc crypto"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa77    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa77"
> > > +BASE_LIB_tune-cortexa77               = "lib64"
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > > new file mode 100644
> > > index 0000000..04e28ee
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > > @@ -0,0 +1,14 @@
> > > +DEFAULTTUNE ?= "neoversen1"
> > > +
> > > +TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor optimizations"
> > > +# Note: Neoverse was called Ares, and GCC will accept "ares" in place of "neoverse-n1"
> > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > +
> > > +# Little Endian base configs
> > > +AVAILTUNES += "neoversen1"
> > > +ARMPKGARCH_tune-neoversen1             = "neoversen1"
> > > +TUNE_FEATURES_tune-neoversen1          = "aarch64 neoversen1 crc crypto"
> > > +PACKAGE_EXTRA_ARCHS_tune-neoversen1    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1"
> > > +BASE_LIB_tune-neoversen1               = "lib64"
> > > --
> > > 2.17.1
> > >
> > >
>
> > 
>
