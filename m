Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web11.7360.1618905312203697297
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 00:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=AGSr0iJd;
 spf=pass (domain: blade-group.com, ip: 209.85.221.169, mailfrom: yann.dirson@blade-group.com)
Received: by mail-vk1-f169.google.com with SMTP id h130so2856156vkh.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Apr 2021 00:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fTsKpxSgJSIHd4ftICh9tsAKN92kMNc85O5KAMKFk3c=;
        b=AGSr0iJd6Ox8D5v7mCIhUq6C9lt2oqwosppGq/w1EVxdt5OMF5K65ggf+lEzjpVYyA
         yClcEiWxSYQ5/B93Hr+yY9nLmPNZekV3fKkbxDpA/VhNVSwQi3kRrwRRxknQETS9z+5l
         w1Ei8KohXSgzcZ8+WoteBQLLzqBBau8tW3GWk0sGUdENc1evD+DxXp9LsSbk+fO+gGd/
         3dAUiVK4sON9+1mrodtcp3+1NBae4xH3o9epdc57Hsq3jN48Z8TFhx8uBnbgHMHxcGuX
         FXoI7Zq0OXdU0i/Q25YlCZJAUdnAAcwZiwM+V3XHtIqV7SAehBOYC755C8+dyWjp768j
         94SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fTsKpxSgJSIHd4ftICh9tsAKN92kMNc85O5KAMKFk3c=;
        b=nadxU4QWyxWzCqzwkpkO0YEs8H2K0q7r3KqZmR4P1GoSG/A6Qqin3/A4Cf2pKTzy/3
         hD5MolQ/zwFG1yClX2lTmTlMaN0/qHrzgMAr/yWbxXXV22zBDd7pg7g4iJkYKWm7HSSb
         GLmxLjt3vRsT6KNlkLao+g/AzASxY4L/4dSn0bXxL4ATVL8GEpIWFs9690RnGMED12vN
         zVEkYscRKQqA8RqJrXbv8IK1IH//HycANJho264TnnKmc3nEmuCwLRbozJqqjk6Ci22h
         u04dLej7ATebllKqM0012VM/6c78dWRqhr7UKUxpBqKI+PPOXle8B16e52ixKSc26Lo1
         FdcQ==
X-Gm-Message-State: AOAM5317AVzSS0kzt9+I/BOLMhVhH2F4Ym6aRtIoIQjth+WVXdJ+idy7
	pxObXD1Whvnla/L5CdULn8SZQMx+LqP2/114rzKciA==
X-Google-Smtp-Source: ABdhPJw/SQqKWQK2j+0zqjQI5NsfRAnC/ZmxmfnXz7NaqEKmsPAnlXrZpGIrVtJvb3szAf8ZcDIdYqTiA7W1o5X3aAM=
X-Received: by 2002:a1f:7344:: with SMTP id o65mr6441073vkc.15.1618905311270;
 Tue, 20 Apr 2021 00:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210414134726.4125294-1-yann@blade-group.com>
 <20210414134726.4125294-4-yann@blade-group.com> <CAAnfSTumRh_EaePZpxccodTmtTO=M0BqLHzfZn78iZXpVjhT=Q@mail.gmail.com>
 <20210420001756.GK15937@denix.org>
In-Reply-To: <20210420001756.GK15937@denix.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 20 Apr 2021 09:54:59 +0200
Message-ID: <CA+4=imb4A2-4w_-ywqkcze_Mw0Jy3q37Wh7VLbg1+AkwsYLH-g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2 3/6] arm/optee-os: deploy tee.elf for u-boot
To: Denys Dmytriyenko <denis@denix.org>
Cc: Ross Burton <ross@burtonini.com>, meta-arm@lists.yoctoproject.org, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 20 avr. 2021 =C3=A0 02:18, Denys Dmytriyenko <denis@denix.org> a =
=C3=A9crit :
>
> On Mon, Apr 19, 2021 at 05:34:13PM +0100, Ross Burton wrote:
> > This is causing the CI to break:
> >
> > ERROR: optee-os-3.11.0-r0 do_package_qa: QA Issue: optee-os: ELF
> > binary /lib/firmware/tee.elf has relocations in .text [textrel]
> >
> > Can you either fix or add an INSANE_SKIP with a comment?
>
> Ah, sorry, forgot to mention that textrel needs to be added to INSANE_SKI=
P now
> that tee.elf gets packaged.

I'm surprised, how is it that this test is not triggered on all boxes
(ie. on the master CI but not on testing
or on my box) ?  I'm all for submitting a fix but it's harder to be
correct why I cannot reproduce the problem :)

>
>
> > Ross
> >
> > On Wed, 14 Apr 2021 at 14:48, Yann Dirson <yann.dirson@blade-group.com>=
 wrote:
> > >
> > > From: Yann Dirson <yann@blade-group.com>
> > >
> > > Integration of OP-TEE in the u-boot image is done with `TEE=3Dtee.elf=
`,
> > > so this build artifact must be exported.
> > >
> > > U-boot integration can now be done in a BSP layer with something like
> > > this in `u-boot_%.bbappend`:
> > >
> > >  # OP-TEE, dependent on "optee" DISTRO_FEATURES
> > >
> > >  OPTEE_OEMAKE ?=3D " TEE=3D${DEPLOY_DIR_IMAGE}/optee/tee.elf"
> > >
> > >  EXTRA_OEMAKE_append =3D " ${PACKAGECONFIG_CONFARGS}"
> > >  PACKAGECONFIG[optee] =3D "${OPTEE_OEMAKE},,optee-os"
> > >  PACKAGECONFIG_append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'op=
tee', d)}"
> > >
> > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > ---
> > >  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/=
recipes-security/optee/optee-os.inc
> > > index 34f586a..08cc2f0 100644
> > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > @@ -45,7 +45,7 @@ do_compile[cleandirs] =3D "${B}"
> > >  do_install() {
> > >      #install core in firmware
> > >      install -d ${D}${nonarch_base_libdir}/firmware/
> > > -    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmwa=
re/
> > > +    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_b=
ase_libdir}/firmware/
> > >
> > >      #install TA devkit
> > >      install -d ${D}${includedir}/optee/export-user_ta/
> > > --
> > > 2.30.2
> > >
> > >
> > >
> > >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964



--
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
