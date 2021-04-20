Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web09.8278.1618911368401281029
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 02:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=dQFblIuy;
 spf=pass (domain: blade-group.com, ip: 209.85.221.177, mailfrom: yann.dirson@blade-group.com)
Received: by mail-vk1-f177.google.com with SMTP id k12so4861899vkn.7
        for <meta-arm@lists.yoctoproject.org>; Tue, 20 Apr 2021 02:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n4vvxwuuMBzhSBT2nK24yRnGPmpQXH265wdt3nx83Ss=;
        b=dQFblIuyJ0l6OXlkEN77tbz298lAHnKyJFmvFLshWnjy1OZMmfPRmvZl1Oa16L+SZw
         DRNVGiHm4neCEX6z0XrrdhOYtN0NUIQRmry9f1f4Cj+weFv9mj+4x6ei17PxLL5EUtK+
         QVP5w7eYHXcHlu8Xprs3FfBqC2mc0LceXLMxEFnZWntybI3jJJlphaHvuAZ0dAlHYFoS
         wdyt8/f9Cw8tXA10rfe3MPxy3Ut7eUW4Qz9EwJHaCaI7zhxRXMuDnmqR5/vT4Fff5Cte
         4fksah4zb7iQFDm2752X0wOq1R+pmLhBtXsExXaMikhsqHuEmHEFYa3PKIczrdTVj4yR
         043Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n4vvxwuuMBzhSBT2nK24yRnGPmpQXH265wdt3nx83Ss=;
        b=W0mJNleNb75WXlgyBw9qrUMc11byUiOHf5M1VqYMAIXf6ZM0es92Q8limPNQDIQx/g
         Fjluob49Q87Mrx9RORFV1zrJylBvaJDLB1mwCqoDhCjSFXq4W8eiBPIdalJ8kuswZ/KM
         zUAxbmm3WtPFC3Cki22xfv3hNLu2GhVGagBv+5oDVxnkoJ7ucQZAgeMWJYbZinzj0cTZ
         2xsyKnIHqBPi+Wm5U4mjC89f/63BGsctK1Be731nhpVlyIWMXZ0ffJZcUtY3CWcztwRA
         p4VkCi4KjoV5eoXVaXwlfMk6Sl7eSFZmCjbQYpY9KjWsng1fcVB3wCElNNej7sPJ5Xb2
         89Gw==
X-Gm-Message-State: AOAM533ti4iW6eEVB4mnXwHwVE5S2QWrU68+cRW8cpKMaTwUi0+dsKWz
	zwj/dCD5KQr0LP7XpHoyr/ds7Uk0pJ5k/ZSd7jtFKA==
X-Google-Smtp-Source: ABdhPJwT46AKWVavKSHFdBIkXahBwYItlAzX2ms/XaNjqmmdTdpTrjjtQNlnzQTz764Q3pMUgDUfaVGO6JRQlGLlqJI=
X-Received: by 2002:a1f:9113:: with SMTP id t19mr19191518vkd.14.1618911367522;
 Tue, 20 Apr 2021 02:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210414134726.4125294-1-yann@blade-group.com>
 <20210414134726.4125294-4-yann@blade-group.com> <CAAnfSTumRh_EaePZpxccodTmtTO=M0BqLHzfZn78iZXpVjhT=Q@mail.gmail.com>
 <20210420001756.GK15937@denix.org> <CA+4=imb4A2-4w_-ywqkcze_Mw0Jy3q37Wh7VLbg1+AkwsYLH-g@mail.gmail.com>
In-Reply-To: <CA+4=imb4A2-4w_-ywqkcze_Mw0Jy3q37Wh7VLbg1+AkwsYLH-g@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 20 Apr 2021 11:35:55 +0200
Message-ID: <CA+4=imZLnifL-JUUMtFDJ8PbA3rNi0aF-tgC-MyMDAJ+fTKjWA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v2 3/6] arm/optee-os: deploy tee.elf for u-boot
To: Denys Dmytriyenko <denis@denix.org>
Cc: Ross Burton <ross@burtonini.com>, meta-arm@lists.yoctoproject.org, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

*

Le mar. 20 avr. 2021 =C3=A0 09:54, Yann Dirson
<yann.dirson@blade-group.com> a =C3=A9crit :
>
> Le mar. 20 avr. 2021 =C3=A0 02:18, Denys Dmytriyenko <denis@denix.org> a =
=C3=A9crit :
> >
> > On Mon, Apr 19, 2021 at 05:34:13PM +0100, Ross Burton wrote:
> > > This is causing the CI to break:
> > >
> > > ERROR: optee-os-3.11.0-r0 do_package_qa: QA Issue: optee-os: ELF
> > > binary /lib/firmware/tee.elf has relocations in .text [textrel]
> > >
> > > Can you either fix or add an INSANE_SKIP with a comment?
> >
> > Ah, sorry, forgot to mention that textrel needs to be added to INSANE_S=
KIP now
> > that tee.elf gets packaged.
>
> I'm surprised, how is it that this test is not triggered on all boxes
> (ie. on the master CI but not on testing
> or on my box) ?  I'm all for submitting a fix but it's harder to be
> correct why I cannot reproduce the problem :)

Digging this I am surprised by how hard it is to force a package_qa rerun:
- the package_qa_* functions text is not included, so even changing
them does not
  cause them to re-run
- WARN_QA and ERROR_QA are part of BB_HASHBASE_WHITELIST, so adjusting
  this does not cause a rerun either

It would seem interesting to have all of this part of the package_qa
siginfo, right ?

I have the clear feeling the workflow to investigate the issue is
really suboptimal
("bitbake -c clean && find sstate-cache -delete" between each run).


As for the issue at hand: I can now trigger package_qa at will, and
adding more traces
in textrel test I can see it is really executed on tee.elf, but it
just passes the test.

"objdump -p" and "objdump -r" just show nothing, so indeed no TEXTREL.

On what configuration does the CI get this ?

>
> >
> >
> > > Ross
> > >
> > > On Wed, 14 Apr 2021 at 14:48, Yann Dirson <yann.dirson@blade-group.co=
m> wrote:
> > > >
> > > > From: Yann Dirson <yann@blade-group.com>
> > > >
> > > > Integration of OP-TEE in the u-boot image is done with `TEE=3Dtee.e=
lf`,
> > > > so this build artifact must be exported.
> > > >
> > > > U-boot integration can now be done in a BSP layer with something li=
ke
> > > > this in `u-boot_%.bbappend`:
> > > >
> > > >  # OP-TEE, dependent on "optee" DISTRO_FEATURES
> > > >
> > > >  OPTEE_OEMAKE ?=3D " TEE=3D${DEPLOY_DIR_IMAGE}/optee/tee.elf"
> > > >
> > > >  EXTRA_OEMAKE_append =3D " ${PACKAGECONFIG_CONFARGS}"
> > > >  PACKAGECONFIG[optee] =3D "${OPTEE_OEMAKE},,optee-os"
> > > >  PACKAGECONFIG_append =3D " ${@bb.utils.filter('DISTRO_FEATURES', '=
optee', d)}"
> > > >
> > > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > > ---
> > > >  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-ar=
m/recipes-security/optee/optee-os.inc
> > > > index 34f586a..08cc2f0 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > > @@ -45,7 +45,7 @@ do_compile[cleandirs] =3D "${B}"
> > > >  do_install() {
> > > >      #install core in firmware
> > > >      install -d ${D}${nonarch_base_libdir}/firmware/
> > > > -    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firm=
ware/
> > > > +    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch=
_base_libdir}/firmware/
> > > >
> > > >      #install TA devkit
> > > >      install -d ${D}${includedir}/optee/export-user_ta/
> > > > --
> > > > 2.30.2
> > > >
> > > >
> > > >
> > > >
> >
> > --
> > Regards,
> > Denys Dmytriyenko <denis@denix.org>
> > PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> > Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech



--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
