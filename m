Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web10.32473.1599200215587775025
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 23:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wXgYn3jN;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id s92so3804308ybi.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 03 Sep 2020 23:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KuBHjc/XUst7XeQFI21lQQf/Tt+S5T/yf4XvPMWmAKs=;
        b=wXgYn3jNbbfdzyC+yYmf1LiYkxr9tFUHTeh7WZe8QJ3Konc3Zuz8B8OXXRQxBoakme
         nP6OW2wkQd/ZYE+tt5QQORgwcy9XTkz30YsAvz9yBdVBXA4Cor8dHnbWVNpjUZ12yBBD
         YEGOGTRyK3dce/cK8v0e8gV/7iQDd6uSq3U4HI8VqYsShduX1CPsHulpRwRX+BeLco07
         smNeHgML4/FLAFbqar6bG1cGcfFf52PfqMqMXhQ0cIZuVTFHC9eWh6bo6bkMnIiIQDkM
         iUwKAYi/xZJGDJhyIYiF91CtHzlxcZncuquf2eLNmoO+bv4dIenxOb/PGJ2CI89fHlno
         Kh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KuBHjc/XUst7XeQFI21lQQf/Tt+S5T/yf4XvPMWmAKs=;
        b=XEF/65Q8jxgYLPriNumta5eNw96DWPAgxFLWAQi4vAvEBl8jYp2yerB0/S1aAjpeCk
         +OKtw5X3VFvfy8PAPdVWL+SDy0iykyqhiG6Yiwg3iPAlhg23JMse3Xg5RsAHhf/fVJ9w
         gtpHYZCQyu0rGlv2+NH/iIvW3ch3j1B3cGFmt2RDlnXuhvOJP54jeA8NVTWyFFyo19B4
         LMtoR7LnWsF1/EIC/8pbeLSr7WLX4NVYalKXqdLtSu3UOafiat4eX3uvAKyMlDhQnokj
         /yK5Zianv/oiCAi6FgBtMfnAsKt/lM+JmlRDR1YFvH7MNJFQ9yRQKrYofs0vZpmmjCCT
         xbfg==
X-Gm-Message-State: AOAM533mIrKQ8AqsqqADWywbbr+/MIp3LQMvK5ZBX4544vIRuXWk+DEU
	xGVr0J0AWKdXsvP3CV7xzadJVJKHuPtp83cExZ7MXA==
X-Google-Smtp-Source: ABdhPJybZAg5TZRHYuNPglytJBWPGFp2IqoYZL078jgo23mmnZ79AgAGyUZ01fpXRFoUTbEOj8BaTBC7PPFKbNnsepI=
X-Received: by 2002:a25:d348:: with SMTP id e69mr8192185ybf.273.1599200214572;
 Thu, 03 Sep 2020 23:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200903173618.2910-1-jon.mason@arm.com> <20200903173618.2910-2-jon.mason@arm.com>
 <CAP71Wjxc7rppRkG_VaeE7a0V1BCf7ea=sVKXXGevJ4-VvePkSQ@mail.gmail.com> <20200904014935.GA27623@kudzu.us>
In-Reply-To: <20200904014935.GA27623@kudzu.us>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 4 Sep 2020 08:16:43 +0200
Message-ID: <CAP71WjwmxYBwRLpAr39Jbprsj7JA+KdO7EBLiJ=Gk6DBzCWL1w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2 2/4] arm-bsp: ARMv8-2a: Add tuning files
To: Jon Mason <jdmason@kudzu.us>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000b6fae105ae76d037"

--000000000000b6fae105ae76d037
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 4, 2020 at 3:49 AM Jon Mason <jdmason@kudzu.us> wrote:

> On Thu, Sep 03, 2020 at 09:44:11PM +0200, Nicolas Dechesne wrote:
> > On Thu, Sep 3, 2020 at 7:36 PM Jon Mason <jon.mason@arm.com> wrote:
> > >
> > > Add all the available ARMv8.2 tunings from GCC.  This belongs in
> > > OE-Core, but adding here so that it can be used while trying to
> upstream
> > > there.
> >
> > both patches (the one about ARMv8-A big little) look good to me!
>
> Thanks for the review.  If you like, I can add your "Reviewed-by" to
> give you a little credit for your work.
>

Sure, please add:
Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>


>
> Thanks,
> Jon
>
> >
> > >
> > > Change-Id: I5025eef6d18545478116b5079daf9c4d12e93dca
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > ---
> > >  .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
> > >  .../conf/machine/include/tune-cortexa75.inc   | 13 ++++++++++++
> > >  .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
> > >  .../conf/machine/include/tune-cortexa76.inc   | 13 ++++++++++++
> > >  .../conf/machine/include/tune-cortexa77.inc   | 13 ++++++++++++
> > >  .../conf/machine/include/tune-neoversen1.inc  | 14 +++++++++++++
> > >  6 files changed, 93 insertions(+)
> > >  create mode 100644
> meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > >  create mode 100644
> meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > >  create mode 100644
> meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > >  create mode 100644
> meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > >  create mode 100644
> meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > >  create mode 100644
> meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > >
> > > diff --git
> a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > > new file mode 100644
> > > index 0000000..af4bfbe
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
> > > @@ -0,0 +1,20 @@
> > > +DEFAULTTUNE ?= "cortexa75-cortexa55"
> > > +
> > > +TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE
> Cortex-A75.Cortex-A55 specific processor optimizations"
> > > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES",
> "cortexa75-cortexa55", "cortexa75-cortexa55:", "" ,d)}"
> > > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES",
> "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > +
> > > +# cortexa75.cortexa55 implies crc support
> > > +AVAILTUNES += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
> > > +ARMPKGARCH_tune-cortexa75-cortexa55                  =
> "cortexa75-cortexa55"
> > > +ARMPKGARCH_tune-cortexa75-cortexa55-crypto           =
> "cortexa75-cortexa55-crypto"
> > > +TUNE_FEATURES_tune-cortexa75-cortexa55               = "aarch64 crc
> cortexa75-cortexa55"
> > > +TUNE_FEATURES_tune-cortexa75-cortexa55-crypto        = "aarch64 crc
> crypto cortexa75-cortexa55"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55         =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa75-cortexa55"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto  =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75-cortexa55
> cortexa75-cortexa55-crypto"
> > > +BASE_LIB_tune-cortexa75-cortexa55                    = "lib64"
> > > +BASE_LIB_tune-cortexa75-cortexa55-crypto             = "lib64"
> > > +
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > > new file mode 100644
> > > index 0000000..58a3019
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
> > > @@ -0,0 +1,13 @@
> > > +DEFAULTTUNE ?= "cortexa75"
> > > +
> > > +TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor
> optimizations"
> > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', '
> -mcpu=cortex-a75', '', d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > +
> > > +# Little Endian base configs
> > > +AVAILTUNES += "cortexa75"
> > > +ARMPKGARCH_tune-cortexa75             = "cortexa75"
> > > +TUNE_FEATURES_tune-cortexa75          = "aarch64 cortexa75 crc crypto"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa75    =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75"
> > > +BASE_LIB_tune-cortexa75               = "lib64"
> > > diff --git
> a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > > new file mode 100644
> > > index 0000000..7c27d21
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
> > > @@ -0,0 +1,20 @@
> > > +DEFAULTTUNE ?= "cortexa76-cortexa55"
> > > +
> > > +TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE
> Cortex-A76.Cortex-A55 specific processor optimizations"
> > > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES",
> "cortexa76-cortexa55", "cortexa76-cortexa55:", "" ,d)}"
> > > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES",
> "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > +
> > > +# cortexa76.cortexa55 implies crc support
> > > +AVAILTUNES += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
> > > +ARMPKGARCH_tune-cortexa76-cortexa55                  =
> "cortexa76-cortexa55"
> > > +ARMPKGARCH_tune-cortexa76-cortexa55-crypto           =
> "cortexa76-cortexa55-crypto"
> > > +TUNE_FEATURES_tune-cortexa76-cortexa55               = "aarch64 crc
> cortexa76-cortexa55"
> > > +TUNE_FEATURES_tune-cortexa76-cortexa55-crypto        = "aarch64 crc
> crypto cortexa76-cortexa55"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55         =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa76-cortexa55"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto  =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76-cortexa55
> cortexa76-cortexa55-crypto"
> > > +BASE_LIB_tune-cortexa76-cortexa55                    = "lib64"
> > > +BASE_LIB_tune-cortexa76-cortexa55-crypto             = "lib64"
> > > +
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > > new file mode 100644
> > > index 0000000..70f9770
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
> > > @@ -0,0 +1,13 @@
> > > +DEFAULTTUNE ?= "cortexa76"
> > > +
> > > +TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor
> optimizations"
> > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', '
> -mcpu=cortex-a76', '', d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > +
> > > +# Little Endian base configs
> > > +AVAILTUNES += "cortexa76"
> > > +ARMPKGARCH_tune-cortexa76             = "cortexa76"
> > > +TUNE_FEATURES_tune-cortexa76          = "aarch64 cortexa76 crc crypto"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa76    =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76"
> > > +BASE_LIB_tune-cortexa76               = "lib64"
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > > new file mode 100644
> > > index 0000000..672c8d5
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
> > > @@ -0,0 +1,13 @@
> > > +DEFAULTTUNE ?= "cortexa77"
> > > +
> > > +TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor
> optimizations"
> > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', '
> -mcpu=cortex-a77', '', d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > +
> > > +# Little Endian base configs
> > > +AVAILTUNES += "cortexa77"
> > > +ARMPKGARCH_tune-cortexa77             = "cortexa77"
> > > +TUNE_FEATURES_tune-cortexa77          = "aarch64 cortexa77 crc crypto"
> > > +PACKAGE_EXTRA_ARCHS_tune-cortexa77    =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa77"
> > > +BASE_LIB_tune-cortexa77               = "lib64"
> > > diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > > new file mode 100644
> > > index 0000000..04e28ee
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
> > > @@ -0,0 +1,14 @@
> > > +DEFAULTTUNE ?= "neoversen1"
> > > +
> > > +TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor
> optimizations"
> > > +# Note: Neoverse was called Ares, and GCC will accept "ares" in place
> of "neoverse-n1"
> > > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', '
> -mcpu=neoverse-n1', '', d)}"
> > > +
> > > +require conf/machine/include/arm/arch-armv8-2a.inc
> > > +
> > > +# Little Endian base configs
> > > +AVAILTUNES += "neoversen1"
> > > +ARMPKGARCH_tune-neoversen1             = "neoversen1"
> > > +TUNE_FEATURES_tune-neoversen1          = "aarch64 neoversen1 crc
> crypto"
> > > +PACKAGE_EXTRA_ARCHS_tune-neoversen1    =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1"
> > > +BASE_LIB_tune-neoversen1               = "lib64"
> > > --
> > > 2.17.1
> > >
> > >
>
> >
>
> 
>

--000000000000b6fae105ae76d037
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 4, 2020 at 3:49 AM Jon Ma=
son &lt;<a href=3D"mailto:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Sep 03,=
 2020 at 09:44:11PM +0200, Nicolas Dechesne wrote:<br>
&gt; On Thu, Sep 3, 2020 at 7:36 PM Jon Mason &lt;<a href=3D"mailto:jon.ma=
son@arm.com" target=3D"_blank">jon.mason@arm.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Add all the available ARMv8.2 tunings from GCC.=C2=A0 This belon=
gs in<br>
&gt; &gt; OE-Core, but adding here so that it can be used while trying to =
upstream<br>
&gt; &gt; there.<br>
&gt; <br>
&gt; both patches (the one about ARMv8-A big little) look good to me!<br>
<br>
Thanks for the review.=C2=A0 If you like, I can add your &quot;Reviewed-by=
&quot; to<br>
give you a little credit for your work.<br></blockquote><div><br></div><di=
v>Sure, please add:</div><div>Reviewed-by: Nicolas Dechesne &lt;<a href=3D"=
mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro.org</a>&gt;</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Jon<br>
<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Change-Id: I5025eef6d18545478116b5079daf9c4d12e93dca<br>
&gt; &gt; Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jon.mason@arm.com=
" target=3D"_blank">jon.mason@arm.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../include/tune-cortexa75-cortexa55.inc=C2=A0 =C2=A0 =C2=
=A0 | 20 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../conf/machine/include/tune-cortexa75.inc=C2=A0 =C2=A0| =
13 ++++++++++++<br>
&gt; &gt;=C2=A0 .../include/tune-cortexa76-cortexa55.inc=C2=A0 =C2=A0 =C2=
=A0 | 20 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../conf/machine/include/tune-cortexa76.inc=C2=A0 =C2=A0| =
13 ++++++++++++<br>
&gt; &gt;=C2=A0 .../conf/machine/include/tune-cortexa77.inc=C2=A0 =C2=A0| =
13 ++++++++++++<br>
&gt; &gt;=C2=A0 .../conf/machine/include/tune-neoversen1.inc=C2=A0 | 14 ++=
+++++++++++<br>
&gt; &gt;=C2=A0 6 files changed, 93 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-arm-bsp/conf/machine/include/tune-=
cortexa75-cortexa55.inc<br>
&gt; &gt;=C2=A0 create mode 100644 meta-arm-bsp/conf/machine/include/tune-=
cortexa75.inc<br>
&gt; &gt;=C2=A0 create mode 100644 meta-arm-bsp/conf/machine/include/tune-=
cortexa76-cortexa55.inc<br>
&gt; &gt;=C2=A0 create mode 100644 meta-arm-bsp/conf/machine/include/tune-=
cortexa76.inc<br>
&gt; &gt;=C2=A0 create mode 100644 meta-arm-bsp/conf/machine/include/tune-=
cortexa77.inc<br>
&gt; &gt;=C2=A0 create mode 100644 meta-arm-bsp/conf/machine/include/tune-=
neoversen1.inc<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-co=
rtexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.in=
c<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..af4bfbe<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55=
.inc<br>
&gt; &gt; @@ -0,0 +1,20 @@<br>
&gt; &gt; +DEFAULTTUNE ?=3D &quot;cortexa75-cortexa55&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +TUNEVALID[cortexa75-cortexa55] =3D &quot;Enable big.LITTLE Cort=
ex-A75.Cortex-A55 specific processor optimizations&quot;<br>
&gt; &gt; +TUNECONFLICTS[aarch64] =3D &quot;armv4 armv5 armv6 armv7 armv7a=
&quot;<br>
&gt; &gt; +MACHINEOVERRIDES =3D. &quot;${@bb.utils.contains(&quot;TUNE_FEA=
TURES&quot;, &quot;cortexa75-cortexa55&quot;, &quot;cortexa75-cortexa55:&qu=
ot;, &quot;&quot; ,d)}&quot;<br>
&gt; &gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES=
&quot;, &quot;cortexa75-cortexa55&quot;, &quot; -mcpu=3Dcortex-a75.cortex-a=
55&quot;, &quot;&quot;, d)}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +require conf/machine/include/arm/arch-armv8-2a.inc<br>
&gt; &gt; +<br>
&gt; &gt; +# cortexa75.cortexa55 implies crc support<br>
&gt; &gt; +AVAILTUNES +=3D &quot;cortexa75-cortexa55 cortexa75-cortexa55-c=
rypto&quot;<br>
&gt; &gt; +ARMPKGARCH_tune-cortexa75-cortexa55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa75-cortexa55&quot;<br>
&gt; &gt; +ARMPKGARCH_tune-cortexa75-cortexa55-crypto=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0=3D &quot;cortexa75-cortexa55-crypto&quot;<br>
&gt; &gt; +TUNE_FEATURES_tune-cortexa75-cortexa55=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64 crc cortexa75-cortexa55&q=
uot;<br>
&gt; &gt; +TUNE_FEATURES_tune-cortexa75-cortexa55-crypto=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;aarch64 crc crypto cortexa75-cortexa55&quot;<br>
&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 cortexa75-cortexa55&quot;<br>
&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto=C2=A0 =3D &=
quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75-cortexa55 cort=
exa75-cortexa55-crypto&quot;<br>
&gt; &gt; +BASE_LIB_tune-cortexa75-cortexa55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
&gt; &gt; +BASE_LIB_tune-cortexa75-cortexa55-crypto=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75.in=
c b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..58a3019<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc<br>
&gt; &gt; @@ -0,0 +1,13 @@<br>
&gt; &gt; +DEFAULTTUNE ?=3D &quot;cortexa75&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +TUNEVALID[cortexa75] =3D &quot;Enable Cortex-A75 specific proce=
ssor optimizations&quot;<br>
&gt; &gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&=
#39;, &#39;cortexa75&#39;, &#39; -mcpu=3Dcortex-a75&#39;, &#39;&#39;, d)}&q=
uot;<br>
&gt; &gt; +<br>
&gt; &gt; +require conf/machine/include/arm/arch-armv8-2a.inc<br>
&gt; &gt; +<br>
&gt; &gt; +# Little Endian base configs<br>
&gt; &gt; +AVAILTUNES +=3D &quot;cortexa75&quot;<br>
&gt; &gt; +ARMPKGARCH_tune-cortexa75=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;cortexa75&quot;<br>
&gt; &gt; +TUNE_FEATURES_tune-cortexa75=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=3D &quot;aarch64 cortexa75 crc crypto&quot;<br>
&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa75=C2=A0 =C2=A0 =3D &quot;${PAC=
KAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75&quot;<br>
&gt; &gt; +BASE_LIB_tune-cortexa75=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; &gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76-co=
rtexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.in=
c<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..7c27d21<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55=
.inc<br>
&gt; &gt; @@ -0,0 +1,20 @@<br>
&gt; &gt; +DEFAULTTUNE ?=3D &quot;cortexa76-cortexa55&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +TUNEVALID[cortexa76-cortexa55] =3D &quot;Enable big.LITTLE Cort=
ex-A76.Cortex-A55 specific processor optimizations&quot;<br>
&gt; &gt; +TUNECONFLICTS[aarch64] =3D &quot;armv4 armv5 armv6 armv7 armv7a=
&quot;<br>
&gt; &gt; +MACHINEOVERRIDES =3D. &quot;${@bb.utils.contains(&quot;TUNE_FEA=
TURES&quot;, &quot;cortexa76-cortexa55&quot;, &quot;cortexa76-cortexa55:&qu=
ot;, &quot;&quot; ,d)}&quot;<br>
&gt; &gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES=
&quot;, &quot;cortexa76-cortexa55&quot;, &quot; -mcpu=3Dcortex-a76.cortex-a=
55&quot;, &quot;&quot;, d)}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +require conf/machine/include/arm/arch-armv8-2a.inc<br>
&gt; &gt; +<br>
&gt; &gt; +# cortexa76.cortexa55 implies crc support<br>
&gt; &gt; +AVAILTUNES +=3D &quot;cortexa76-cortexa55 cortexa76-cortexa55-c=
rypto&quot;<br>
&gt; &gt; +ARMPKGARCH_tune-cortexa76-cortexa55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa76-cortexa55&quot;<br>
&gt; &gt; +ARMPKGARCH_tune-cortexa76-cortexa55-crypto=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0=3D &quot;cortexa76-cortexa55-crypto&quot;<br>
&gt; &gt; +TUNE_FEATURES_tune-cortexa76-cortexa55=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64 crc cortexa76-cortexa55&q=
uot;<br>
&gt; &gt; +TUNE_FEATURES_tune-cortexa76-cortexa55-crypto=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;aarch64 crc crypto cortexa76-cortexa55&quot;<br>
&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 cortexa76-cortexa55&quot;<br>
&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto=C2=A0 =3D &=
quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76-cortexa55 cort=
exa76-cortexa55-crypto&quot;<br>
&gt; &gt; +BASE_LIB_tune-cortexa76-cortexa55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
&gt; &gt; +BASE_LIB_tune-cortexa76-cortexa55-crypto=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76.in=
c b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..70f9770<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc<br>
&gt; &gt; @@ -0,0 +1,13 @@<br>
&gt; &gt; +DEFAULTTUNE ?=3D &quot;cortexa76&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +TUNEVALID[cortexa76] =3D &quot;Enable Cortex-A76 specific proce=
ssor optimizations&quot;<br>
&gt; &gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&=
#39;, &#39;cortexa76&#39;, &#39; -mcpu=3Dcortex-a76&#39;, &#39;&#39;, d)}&q=
uot;<br>
&gt; &gt; +<br>
&gt; &gt; +require conf/machine/include/arm/arch-armv8-2a.inc<br>
&gt; &gt; +<br>
&gt; &gt; +# Little Endian base configs<br>
&gt; &gt; +AVAILTUNES +=3D &quot;cortexa76&quot;<br>
&gt; &gt; +ARMPKGARCH_tune-cortexa76=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;cortexa76&quot;<br>
&gt; &gt; +TUNE_FEATURES_tune-cortexa76=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=3D &quot;aarch64 cortexa76 crc crypto&quot;<br>
&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa76=C2=A0 =C2=A0 =3D &quot;${PAC=
KAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76&quot;<br>
&gt; &gt; +BASE_LIB_tune-cortexa76=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; &gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa77.in=
c b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..672c8d5<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc<br>
&gt; &gt; @@ -0,0 +1,13 @@<br>
&gt; &gt; +DEFAULTTUNE ?=3D &quot;cortexa77&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +TUNEVALID[cortexa77] =3D &quot;Enable Cortex-A77 specific proce=
ssor optimizations&quot;<br>
&gt; &gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&=
#39;, &#39;cortexa77&#39;, &#39; -mcpu=3Dcortex-a77&#39;, &#39;&#39;, d)}&q=
uot;<br>
&gt; &gt; +<br>
&gt; &gt; +require conf/machine/include/arm/arch-armv8-2a.inc<br>
&gt; &gt; +<br>
&gt; &gt; +# Little Endian base configs<br>
&gt; &gt; +AVAILTUNES +=3D &quot;cortexa77&quot;<br>
&gt; &gt; +ARMPKGARCH_tune-cortexa77=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;cortexa77&quot;<br>
&gt; &gt; +TUNE_FEATURES_tune-cortexa77=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=3D &quot;aarch64 cortexa77 crc crypto&quot;<br>
&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-cortexa77=C2=A0 =C2=A0 =3D &quot;${PAC=
KAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa77&quot;<br>
&gt; &gt; +BASE_LIB_tune-cortexa77=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; &gt; diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.i=
nc b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..04e28ee<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc<br>
&gt; &gt; @@ -0,0 +1,14 @@<br>
&gt; &gt; +DEFAULTTUNE ?=3D &quot;neoversen1&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +TUNEVALID[neoversen1] =3D &quot;Enable Neoverse-N1 specific pro=
cessor optimizations&quot;<br>
&gt; &gt; +# Note: Neoverse was called Ares, and GCC will accept &quot;are=
s&quot; in place of &quot;neoverse-n1&quot;<br>
&gt; &gt; +TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&=
#39;, &#39;neoversen1&#39;, &#39; -mcpu=3Dneoverse-n1&#39;, &#39;&#39;, d)}=
&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +require conf/machine/include/arm/arch-armv8-2a.inc<br>
&gt; &gt; +<br>
&gt; &gt; +# Little Endian base configs<br>
&gt; &gt; +AVAILTUNES +=3D &quot;neoversen1&quot;<br>
&gt; &gt; +ARMPKGARCH_tune-neoversen1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;neoversen1&quot;<br>
&gt; &gt; +TUNE_FEATURES_tune-neoversen1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D &quot;aarch64 neoversen1 crc crypto&quot;<br>
&gt; &gt; +PACKAGE_EXTRA_ARCHS_tune-neoversen1=C2=A0 =C2=A0 =3D &quot;${PA=
CKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1&quot;<br>
&gt; &gt; +BASE_LIB_tune-neoversen1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt; <br>
<br>
&gt; <br>
<br>
<br>
</blockquote></div></div>

--000000000000b6fae105ae76d037--
