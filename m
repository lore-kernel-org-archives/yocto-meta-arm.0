Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web10.674.1618938395752391725
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 10:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=jXEHxmIN;
 spf=pass (domain: blade-group.com, ip: 209.85.222.45, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ua1-f45.google.com with SMTP id r8so4677242uaw.12
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Apr 2021 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HG+2GG1AuulU57XXf7aISwG3Wr2GdPdBCU1VhV0d+gg=;
        b=jXEHxmINoK2Lvw0Jeq9LnKXuxEzBVIdXp9EraF8cjSTcmE/+F+ojzdIJtSGppCWNxb
         c4aXemiHwP817BAsYHIFAqp1Kjiwoxc6IWszS6HI5lQX3ytz53A7kYJSSagJbdxMXMWF
         vJUR0UEcDhezZxa9spmPdYmcV2YrIvVL6OYp2KOU/fa95wMJvRLw5HDtZ3pD93vvDRNW
         5PBD+McmRe48412yJagGi15RST2ZxbFN74hNZRbJKIEepteuMIGzrxeJ+VzgSn6rQkmk
         QtsL/UakPltRKy5ryl7VCYv7mX7SzaKFZqaccRJbBSigs4z9lRz0i14zQ1E2owLkafQI
         yMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HG+2GG1AuulU57XXf7aISwG3Wr2GdPdBCU1VhV0d+gg=;
        b=hgyTsLzyRYX6VRrrccU/xs0QwKEpJUYElX+keTcf5mRRVej6anRHDeZstyNwQELjr0
         UyEH7HE3lq8va8ngzf5WCtbeY+IDHDSHqQPpv1oUWxYCqXnbunmecyvGQ1+G89AfoBct
         +Lc30TR22GxdshKHii9GVhz2HrZcrCjHarDIYLTkv86LhWAV8+KUggB3+AG6tqv7Q1h/
         HDlD/wfX4a88cYFZ86CQe7pRDd3EDIRL9ZX1VgyACaENXeK3fZ8GjJ9BlMy38nKow08Q
         zMcnTBKWVoaZoi9UI2yjwAZXqsid50sPn+iY0R2yIZ7m9Ic1X0mIVSBu1u+27OI35DXn
         M7lQ==
X-Gm-Message-State: AOAM530goVrL766C1jf7Jm0zFmKEtWBgiykSH+TgzBQ1RW55VetLWUGu
	upVlluo5UGNUcnkviUo5jodFfHRPWgzo5qWywj7x7g==
X-Google-Smtp-Source: ABdhPJxmdj11QjwBuUnLFjBFcTqq84TpAQXIpbn2ZesXkxnswDdpqAj5+tApOozBH0v6w7O8fbQ9BwTA5lo4RmiYHJ4=
X-Received: by 2002:ab0:596f:: with SMTP id o44mr14162177uad.8.1618938394869;
 Tue, 20 Apr 2021 10:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210414134726.4125294-1-yann@blade-group.com>
 <20210414134726.4125294-4-yann@blade-group.com> <CAAnfSTumRh_EaePZpxccodTmtTO=M0BqLHzfZn78iZXpVjhT=Q@mail.gmail.com>
 <20210420001756.GK15937@denix.org> <CA+4=imb4A2-4w_-ywqkcze_Mw0Jy3q37Wh7VLbg1+AkwsYLH-g@mail.gmail.com>
 <CA+4=imZLnifL-JUUMtFDJ8PbA3rNi0aF-tgC-MyMDAJ+fTKjWA@mail.gmail.com> <20210420155052.GL15937@denix.org>
In-Reply-To: <20210420155052.GL15937@denix.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 20 Apr 2021 19:06:23 +0200
Message-ID: <CA+4=imbz2JJtRJeCYjjBb_t3fO2JC1DAf8A6vCpMkdv50ZfpZA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2 3/6] arm/optee-os: deploy tee.elf for u-boot
To: Denys Dmytriyenko <denis@denix.org>
Cc: Ross Burton <ross@burtonini.com>, meta-arm@lists.yoctoproject.org, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 20 avr. 2021 =C3=A0 17:50, Denys Dmytriyenko <denis@denix.org> a =
=C3=A9crit :
>
> On Tue, Apr 20, 2021 at 11:35:55AM +0200, Yann Dirson wrote:
> > *
> >
> > Le mar. 20 avr. 2021 =C3=A0 09:54, Yann Dirson
> > <yann.dirson@blade-group.com> a =C3=A9crit :
> > >
> > > Le mar. 20 avr. 2021 =C3=A0 02:18, Denys Dmytriyenko <denis@denix.org=
> a =C3=A9crit :
> > > >
> > > > On Mon, Apr 19, 2021 at 05:34:13PM +0100, Ross Burton wrote:
> > > > > This is causing the CI to break:
> > > > >
> > > > > ERROR: optee-os-3.11.0-r0 do_package_qa: QA Issue: optee-os: ELF
> > > > > binary /lib/firmware/tee.elf has relocations in .text [textrel]
> > > > >
> > > > > Can you either fix or add an INSANE_SKIP with a comment?
> > > >
> > > > Ah, sorry, forgot to mention that textrel needs to be added to INSA=
NE_SKIP now
> > > > that tee.elf gets packaged.
> > >
> > > I'm surprised, how is it that this test is not triggered on all boxes
> > > (ie. on the master CI but not on testing
> > > or on my box) ?  I'm all for submitting a fix but it's harder to be
> > > correct why I cannot reproduce the problem :)
> >
> > Digging this I am surprised by how hard it is to force a package_qa rer=
un:
> > - the package_qa_* functions text is not included, so even changing
> > them does not
> >   cause them to re-run
> > - WARN_QA and ERROR_QA are part of BB_HASHBASE_WHITELIST, so adjusting
> >   this does not cause a rerun either
> >
> > It would seem interesting to have all of this part of the package_qa
> > siginfo, right ?
> >
> > I have the clear feeling the workflow to investigate the issue is
> > really suboptimal
> > ("bitbake -c clean && find sstate-cache -delete" between each run).
>
> I usually do -c cleansstate and then force -c compile -f to invalidate ss=
tate
> for a package.
>
>
> > As for the issue at hand: I can now trigger package_qa at will, and
> > adding more traces
> > in textrel test I can see it is really executed on tee.elf, but it
> > just passes the test.
> >
> > "objdump -p" and "objdump -r" just show nothing, so indeed no TEXTREL.
> >
> > On what configuration does the CI get this ?
>
> I wonder if tee.elf for your platform is different. Are you building for =
qemu
> or a real machine? I saw this QA issue reported for TI platforms before.

Yes I'm building for rk3399-based nanopi-m4.

>
>
> > > > > Ross
> > > > >
> > > > > On Wed, 14 Apr 2021 at 14:48, Yann Dirson <yann.dirson@blade-grou=
p.com> wrote:
> > > > > >
> > > > > > From: Yann Dirson <yann@blade-group.com>
> > > > > >
> > > > > > Integration of OP-TEE in the u-boot image is done with `TEE=3Dt=
ee.elf`,
> > > > > > so this build artifact must be exported.
> > > > > >
> > > > > > U-boot integration can now be done in a BSP layer with somethin=
g like
> > > > > > this in `u-boot_%.bbappend`:
> > > > > >
> > > > > >  # OP-TEE, dependent on "optee" DISTRO_FEATURES
> > > > > >
> > > > > >  OPTEE_OEMAKE ?=3D " TEE=3D${DEPLOY_DIR_IMAGE}/optee/tee.elf"
> > > > > >
> > > > > >  EXTRA_OEMAKE_append =3D " ${PACKAGECONFIG_CONFARGS}"
> > > > > >  PACKAGECONFIG[optee] =3D "${OPTEE_OEMAKE},,optee-os"
> > > > > >  PACKAGECONFIG_append =3D " ${@bb.utils.filter('DISTRO_FEATURES=
', 'optee', d)}"
> > > > > >
> > > > > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > > > > ---
> > > > > >  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/met=
a-arm/recipes-security/optee/optee-os.inc
> > > > > > index 34f586a..08cc2f0 100644
> > > > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > > > > @@ -45,7 +45,7 @@ do_compile[cleandirs] =3D "${B}"
> > > > > >  do_install() {
> > > > > >      #install core in firmware
> > > > > >      install -d ${D}${nonarch_base_libdir}/firmware/
> > > > > > -    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/=
firmware/
> > > > > > +    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${non=
arch_base_libdir}/firmware/
> > > > > >
> > > > > >      #install TA devkit
> > > > > >      install -d ${D}${includedir}/optee/export-user_ta/
> > > > > > --
> > > > > > 2.30.2
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > >
> > > > --
> > > > Regards,
> > > > Denys Dmytriyenko <denis@denix.org>
> > > > PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> > > > Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> > >
> > >
> > >
> > > --
> > > Yann Dirson <yann@blade-group.com>
> > > Blade / Shadow -- http://shadow.tech
> >
> >
> >
> > --
> > Yann Dirson <yann@blade-group.com>
> > Blade / Shadow -- http://shadow.tech
> >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964



--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
