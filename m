Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web12.9761.1618386438260628740
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 00:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=YX3dfVdb;
 spf=pass (domain: blade-group.com, ip: 209.85.222.44, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ua1-f44.google.com with SMTP id s2so6140323uap.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Apr 2021 00:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9CyD54I6PtfHk5Opoq04jr9Vw96JDfjNA8r1XUomkc8=;
        b=YX3dfVdbnyPqT/ddAGzFs0+ipp+GYtfs4+YO6D3TME5yVN9/YMCGJGElQ0aF7DqlSl
         s8goB4PXVGbNQwAiHLTV1dPAfH3f11YRbdm/joi2r+Pr5p2by/6xUEq9SpFiGwNPbKAm
         5JKIvmYf6NO+Iu0GDVAii8tSYEs6Vx8ffoTvRkfGrT4pI4uW0uh21iDqW/q4xxZhMtYf
         pmOPrS7fQTpKmorZiKFmH2jXZ1imCXQAJ5MfM+4GYESWY10lG8kjS+8Ojot0AEKZ2HDb
         GRb29dM/AGn+otEX2xNr0Bc1+dWE8AAxIkc2PVmWOEPLjAzU6uBnOcgIPOxFGUbaDJkJ
         EVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9CyD54I6PtfHk5Opoq04jr9Vw96JDfjNA8r1XUomkc8=;
        b=j3/1WVP7k49HDIXh579rKEiJQjeBxhp14Pv4Hyfg0Gy90RUZjpBGNJQ1X702erL9P9
         ZAUsuO70AwnlabLnhFttOxyrSTM3/0n9SFk5mZHA1z8i0pJx6DmNi+iDnlKhe2pHEnmb
         /5Iuz/c0b1BtNTFDFbg05L9cwtjeM2nPbDnbys/NWG+DKxABsJ26iK13D2MXuSsJ8gJi
         OionIDgeBp9gPUx4weFyY8BuTje4joqYg/4LkM/pExJqknd/xJPFTdm9BoFVKoLn4jjM
         ezVHbfYTF5Y1OF1TpYmVdzhbQemcgFqWLyzpvc2dl2fSkQtsUxAgIZW1dLKkCHeRyPn0
         qKBA==
X-Gm-Message-State: AOAM5332vBGiDc+3Xp7VPv/Sn4kTkTuhNIMm/A2ldsG7SPh1fF84sHiF
	Fp0TLgC25ViW5YYnxNBS5lxtzLuLG858d9XPP445Bw==
X-Google-Smtp-Source: ABdhPJzgveQnRuH+rm+jMas1ne7U3UF8Birz8UhtYObx1J8b4VXGxs3DexjDkFqDdla1m8Hw75YrFfljlEGOdV0yKVU=
X-Received: by 2002:ab0:7393:: with SMTP id l19mr16341247uap.130.1618386437266;
 Wed, 14 Apr 2021 00:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210413094038.3577754-1-yann@blade-group.com>
 <20210413094038.3577754-4-yann@blade-group.com> <20210413205648.GP15937@denix.org>
In-Reply-To: <20210413205648.GP15937@denix.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Wed, 14 Apr 2021 09:47:06 +0200
Message-ID: <CA+4=imaKJYjLR-Z=DZOWGQX1_4YCn-f2M0U=+O9Xfmfq9eAaWQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm/optee-os: deploy tee.elf for u-boot
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Le mar. 13 avr. 2021 =C3=A0 22:56, Denys Dmytriyenko <denis@denix.org> a =
=C3=A9crit :
>
> On Tue, Apr 13, 2021 at 11:40:37AM +0200, Yann Dirson wrote:
> > From: Yann Dirson <yann@blade-group.com>
> >
> > Integration of OP-TEE in the u-boot image is done with `TEE=3Dtee.elf`.
> > This can now be done in a BSP layer with something like this in
> > `u-boot_%.bbappend`:
>
> Well, this is not very standardized and is platform-specific.
>
> For example, TI K3 platforms take tee-pager_v2.bin file into U-boot, not
> tee.elf one. But tee.elf still gets deployed for debugging purposes...
>
> E.g. in meta-ti u-boot_%.bbappend:
>
> PACKAGECONFIG[optee] =3D "TEE=3D${STAGING_DIR_HOST}${nonarch_base_libdir}=
/firmware/tee-pager_v2.bin,,optee-os"
> PACKAGECONFIG_append_k3 =3D " optee"
>
>
> >  OPTEE_DEPENDS ??=3D ""
> >  OPTEE_DEPENDS_rk3399 =3D " optee-os:do_deploy"
> >
> >  do_compile[depends] .=3D "${OPTEE_DEPENDS}"
> >
> >  do_compile_prepend_rk3399() {
> >      export TEE=3D${DEPLOY_DIR_IMAGE}/optee/tee.elf
> >  }
>
> To mee, the above PACKAGECONFIG approach is a bit cleaner...

Well, I did not like it either and went with a DISTRO_FEATURES approach,
see my meta-rockchip patches on yocto ml.  It would be nice if it was gener=
ic
enough, but your example above shows it probably needs some more
refining anyway.

Eg. even the PACKAGECONFIG you show above is still BSP-specific.
Maybe we could centralize in meta-arm the different ways to integrate
op-tee, and get the BSP to choose one ?

>
> In summary, I support availability of tee.elf, but besides do_deploy(), I
> would also suggest adding it to do_install()

I must say I was puzzled by those optee files put it a package for installa=
tion
in the target rootfs (but then as you say there seem to be many ways
to integrate
op-tee on different platforms).  If they're just useful for debugging,
they would look like
good candidates for a -dbg package: what use-case does the current optee-os
binary package serve ?

>
>
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/re=
cipes-security/optee/optee-os.inc
> > index 34f586a..db8428a 100644
> > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > @@ -58,7 +58,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> >  do_deploy() {
> >      install -d ${DEPLOYDIR}/optee
> > -    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/=
optee/
> > +    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${B}/core/tee=
.elf ${DEPLOYDIR}/optee/
> >  }
> >
> >  addtask deploy before do_build after do_install
> > --
> > 2.30.2
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
