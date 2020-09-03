Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.5069.1599099571827126255
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 19:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=JH+bHW6J;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id b14so1771490qkn.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Sep 2020 19:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OvyaoFb4fbOCF8bkOQdqBL8nRD17DK0dyTcReRRqzUI=;
        b=JH+bHW6JgPrjVzXIcaTdgbpr4vtkol5GddG9p4Z6tTyg3K9C1NOYrU87rML2hA2eAH
         Rk6ecmFN87BIe0kyzvU3rMy+Wu1IIdU7J6NVNtyamEDVpnRSmKCelQQJKXUZUm2qOho/
         sDetMr/8LVaJUWd1IGEbuHKgC687K/UWtFuFbxL2zUK6KZ4ohl8Y99L3aGK/uqrKD00+
         s2hXOhk+l1itcyi7SLE6ov+LLY4Ia2K4ns2ajkJY7u04JlQW3rQe+3lL7NSbxRS+i5UR
         ryYx6eXD3dguMmeufCuFsc6XYZ5+gHSOzZfkzVe0PP6V5pn2pQU3QfvxY4y5+MWc7Z+o
         qWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OvyaoFb4fbOCF8bkOQdqBL8nRD17DK0dyTcReRRqzUI=;
        b=sj0VygwbEwsE/4P8SJJAKidBVkjvHQ4dDUc3MdsoqsYj2ZSTLlJrEYqRHt70DyiWV/
         n/LfjeaU4tt2sJmz76oDLNl0U3qNfxD2Q3vJbaDpCW8Q/OLSrxhLQpDhOyJqgMvZxqwL
         XvfJz7lb0Tb6YILAvUhuxeVu4SRyrVhq56LC8YBbPL+dbp6W+VEc9PCkK5NyFMehvfel
         u6fouGgVyNJQ2YInt34aAPgSOkZy7rz+Ap8UcY3RpYFAiOTWt5yp9gqyoV28yN5CSg92
         0KS3vAXWPprBTw05e5/x35dCYDyNJ30M/kXx57Gg9clj1J9a2BZBC8MuQ7m7WkPDJGbE
         EdaQ==
X-Gm-Message-State: AOAM533SCIVq4JKgbwiHlz8lzb6P3Cy0eyjFZCPNaE+LAhm8kaS3biVS
	XBTRnVKVV5Y26fVbKT/+KmmhRw==
X-Google-Smtp-Source: ABdhPJxfAY5WDdpOjPmxomuAyHaROUpKBkI5orrYcQB2YIRUx2Ij7r7MTnCZHiCPbyQhgQL/1ESugA==
X-Received: by 2002:a37:9d4e:: with SMTP id g75mr1074598qke.186.1599099570889;
        Wed, 02 Sep 2020 19:19:30 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id w94sm993630qte.93.2020.09.02.19.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 19:19:30 -0700 (PDT)
Date: Wed, 2 Sep 2020 22:19:10 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
	nd <nd@arm.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp: ARMv8-2a: Add tuning files
Message-ID: <20200903021909.GA31845@kudzu.us>
References: <20200902155320.16918-1-jon.mason@arm.com>
 <CAP71WjwFJGtzv5re3tRwKhUje9bjb3qU8QQqE5KTLVUiOar9TA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjwFJGtzv5re3tRwKhUje9bjb3qU8QQqE5KTLVUiOar9TA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2020 at 09:55:04PM +0200, Nicolas Dechesne wrote:
> On Wed, Sep 2, 2020 at 5:53 PM Jon Mason <jon.mason@arm.com> wrote:
> >
> > Add all the available ARMv8.2 tunings from GCC.  This belongs in
> > OE-Core, but adding here so that it can be used while trying to upstream
> > there.
> 
> This was merged recently in OE-core:
> https://git.openembedded.org/openembedded-core/commit/?id=88c79a56b4ddab61c16cd4cb7b887e7d7223d845
> 
> Shouldn't you use this ?

Below, the cores that are ARMv8.2 based are referencing that file.

However, if you are asking if that should be sufficient for those
(instead of needing a core specific tuning), the answer appears to be
no.  If you compare the GCC flags for the generic 8.2
https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-arches.def;h=3be55fa29aa15cb19ab00aeb2edb156ad3d09aee;hb=HEAD
and an A75 (which is 8.2 based)
https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;h=a7dde38d7687049825aec4eb9446e76db84cd9c0;hb=HEAD#l102
You will see the flags are different.  Perhaps not sufficiently
different for anything more than benchmarking, but that is a secondary
discussion.  Given that these will mostly be used by meta-arm-bsp
machines, which will most likely want to be running as optimally as
possible, then this is a good thing to have here.

What I would like to do is actually include all of the 8.2 based cores
into the conf/machine/include/arm/arch-armv8-2a.inc.  This would stop
the explosion of core specific tunes in conf/machine/include/ and
nicely group them into a CPU generation family file.  However, that
might be contriversial.  While that is being hashed out, this can be
used here for those that need it.  So, think of this patch as an
intermediate step for that change.

Thanks,
Jon

> 
> 
> >
> > Change-Id: I5025eef6d18545478116b5079daf9c4d12e93dca
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  .../include/tune-cortexa73-cortexa35.inc      | 20 +++++++++++++++++++
> >  .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
> >  .../conf/machine/include/tune-cortexa75.inc   | 13 ++++++++++++
> >  .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
> >  .../conf/machine/include/tune-cortexa76.inc   | 13 ++++++++++++
> >  .../conf/machine/include/tune-cortexa77.inc   | 13 ++++++++++++
> >  .../conf/machine/include/tune-neoversen1.inc  | 14 +++++++++++++
> >  7 files changed, 113 insertions(+)
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> >  create mode 100644 meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> >
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> > new file mode 100644
> > index 0000000..9e0786c
> > --- /dev/null
> > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
> > @@ -0,0 +1,20 @@
> > +DEFAULTTUNE ?= "cortexa73-cortexa35"
> > +
> > +TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
> > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "" ,d)}"
> > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
> > +
> > +require conf/machine/include/arm/arch-armv8a.inc
> > +
> > +# cortexa73.cortexa35 implies crc support
> > +AVAILTUNES += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> > +ARMPKGARCH_tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
> > +ARMPKGARCH_tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
> > +TUNE_FEATURES_tune-cortexa73-cortexa35               = "aarch64 crc cortexa73-cortexa35"
> > +TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "aarch64 crc crypto cortexa73-cortexa35"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa35"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> > +BASE_LIB_tune-cortexa73-cortexa35                    = "lib64"
> > +BASE_LIB_tune-cortexa73-cortexa35-crypto             = "lib64"
> > +
> > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > new file mode 100644
> > index 0000000..8bc6b74
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
> > +require conf/machine/include/arm/arch-armv8a.inc
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
> > index 0000000..138d443
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
> > +require conf/machine/include/arm/arch-armv8a.inc
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

