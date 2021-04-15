Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web09.3765.1618472684959073863
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 00:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=HeLSwkLD;
 spf=pass (domain: blade-group.com, ip: 209.85.217.48, mailfrom: yann.dirson@blade-group.com)
Received: by mail-vs1-f48.google.com with SMTP id 66so11702939vsk.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 15 Apr 2021 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3IVDSYDBHAkgDbSe6PSoygmA20J7LrNM5jWkedk3r6g=;
        b=HeLSwkLDQHaNi7JAz7aTBnjww9WTwwh4r28n/XWsU/+H5BCeMkUkJQdwUiYoQy8cqr
         zX/PtRQi7bTlx/fvrRz01mKrENA1TMmgckdpHknL4amv3OmR2u24thwySGnYhUjCA+55
         A7EdYUMguDeeKvpLpC31rUZEWsquoUenuB4A7T9TptLXXOhTsnbx/CBFwovWvoc7jcvh
         Pgh6kdqCgdr8KBFLNtbyZBsnXRn+t488x9tPiNGlY7SbMqi1QrcQnhIHeGhFVpR05epV
         LZiX35NzDdhgEb3eLsCtMeHXBF+j19mya3qqFNqDUSxL5wBuaDXZTwxcR0F1t/AxkfJR
         q7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3IVDSYDBHAkgDbSe6PSoygmA20J7LrNM5jWkedk3r6g=;
        b=IAIGAtcfQVBrQ0WSUOzPiyybHeOO0NqG8I5DjKlzg0p1f257TpInEsLyhhdabl7YXl
         fk+EQSMsRz2oAD9FtIdscJFnhyMu9g/7WB+n8jKPV4mqn5wQCCARB80Ps2NEQ2zfe/kZ
         J2nRXZPuZyhg7eTL3DsgmYcpxesUID03Pw9pBzntwQEcopX2QeTfBEo3ekrJG7QtEtHK
         RuqInBUc9xLpDfSnCIXNXGybMQrdMIBgN7OybVli5Oi9qF9qjpAvLcITNVZsowkv5j/K
         DjD9DEcCUi/MB8pAuJUjlkwEKOr25zeRYpIyMaGzNWtlKIZdjtLK9dnbek1Nb0LP6VRe
         8v3Q==
X-Gm-Message-State: AOAM530a/ACkBaCgDdW51fHZcGJDaIqzCmRd5sOfvJkiOxN0Cfz14ndw
	XcIU49chgwWXWox55+bYg+8ub1GZdkEzycApCtuElocuQORebw==
X-Google-Smtp-Source: ABdhPJx4FN8s++X8y4YpJLxKonAR5r3HdI6ucRcHf4gb+i2eFJa4A7lQWr/cAz7fn2QGl3GIhYC0J7gHP8G88DH3iYw=
X-Received: by 2002:a67:d88b:: with SMTP id f11mr1130577vsj.22.1618472683974;
 Thu, 15 Apr 2021 00:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210413094038.3577754-1-yann@blade-group.com>
 <20210413094038.3577754-4-yann@blade-group.com> <20210413205648.GP15937@denix.org>
 <CA+4=imaKJYjLR-Z=DZOWGQX1_4YCn-f2M0U=+O9Xfmfq9eAaWQ@mail.gmail.com> <20210414150122.GQ15937@denix.org>
In-Reply-To: <20210414150122.GQ15937@denix.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Thu, 15 Apr 2021 09:44:32 +0200
Message-ID: <CA+4=imZ=8vRMPFLbShUWb-LO_gGVR7bMPZKZ-4oSk91GvPCfgA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm/optee-os: deploy tee.elf for u-boot
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 14 avr. 2021 =C3=A0 17:01, Denys Dmytriyenko <denis@denix.org> a =
=C3=A9crit :
>
> On Wed, Apr 14, 2021 at 09:47:06AM +0200, Yann Dirson wrote:
> > Hi Denis,
> >
> > Le mar. 13 avr. 2021 =C3=A0 22:56, Denys Dmytriyenko <denis@denix.org> =
a =C3=A9crit :
> > >
> > > On Tue, Apr 13, 2021 at 11:40:37AM +0200, Yann Dirson wrote:
> > > > From: Yann Dirson <yann@blade-group.com>
> > > >
> > > > Integration of OP-TEE in the u-boot image is done with `TEE=3Dtee.e=
lf`.
> > > > This can now be done in a BSP layer with something like this in
> > > > `u-boot_%.bbappend`:
> > >
> > > Well, this is not very standardized and is platform-specific.
> > >
> > > For example, TI K3 platforms take tee-pager_v2.bin file into U-boot, =
not
> > > tee.elf one. But tee.elf still gets deployed for debugging purposes..=
.
> > >
> > > E.g. in meta-ti u-boot_%.bbappend:
> > >
> > > PACKAGECONFIG[optee] =3D "TEE=3D${STAGING_DIR_HOST}${nonarch_base_lib=
dir}/firmware/tee-pager_v2.bin,,optee-os"
> > > PACKAGECONFIG_append_k3 =3D " optee"
> > >
> > >
> > > >  OPTEE_DEPENDS ??=3D ""
> > > >  OPTEE_DEPENDS_rk3399 =3D " optee-os:do_deploy"
> > > >
> > > >  do_compile[depends] .=3D "${OPTEE_DEPENDS}"
> > > >
> > > >  do_compile_prepend_rk3399() {
> > > >      export TEE=3D${DEPLOY_DIR_IMAGE}/optee/tee.elf
> > > >  }
> > >
> > > To mee, the above PACKAGECONFIG approach is a bit cleaner...
> >
> > Well, I did not like it either and went with a DISTRO_FEATURES approach=
,
> > see my meta-rockchip patches on yocto ml.  It would be nice if it was g=
eneric
> > enough, but your example above shows it probably needs some more
> > refining anyway.
> >
> > Eg. even the PACKAGECONFIG you show above is still BSP-specific.
> > Maybe we could centralize in meta-arm the different ways to integrate
> > op-tee, and get the BSP to choose one ?
> >
> > >
> > > In summary, I support availability of tee.elf, but besides do_deploy(=
), I
> > > would also suggest adding it to do_install()
> >
> > I must say I was puzzled by those optee files put it a package for inst=
allation
> > in the target rootfs
>
> No, they are not in the target rootfs, they don't have to be.
> Getting files installed does put them in a package, which enables
> proper staging, so you can DEPENDS +=3D "optee-os" and the files will
> be in recipe-sysroot, similar to my PACKAGECONFIG example above.
> Whether the package gets installed in the target rootfs or not is
> completely orthogonal here.

I see what you mean.  However, a package is still originally the
"installable unit"
for meant for usage in a consistent filesystem, so we got a semantic
shift, then :).
If we have all those bootloader parts and other files already usable
through classical
DEPENDS, what good does it make to have them also exposed by do_deploy ?

In fact, using deployed artifacts in a recipe could even cause reproducibil=
ity
issues of the same kind we had before per-recipe sysroots.  Shouldn't we ju=
st
stop getting *any* file from DEPLOY_DIR_IMAGE in recipes ?

>
>
> > (but then as you say there seem to be many ways
> > to integrate
> > op-tee on different platforms).  If they're just useful for debugging,
> > they would look like
> > good candidates for a -dbg package: what use-case does the current opte=
e-os
> > binary package serve ?
> >
> > >
> > >
> > > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > > ---
> > > >  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-ar=
m/recipes-security/optee/optee-os.inc
> > > > index 34f586a..db8428a 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > > @@ -58,7 +58,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > >
> > > >  do_deploy() {
> > > >      install -d ${DEPLOYDIR}/optee
> > > > -    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYD=
IR}/optee/
> > > > +    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${B}/core=
/tee.elf ${DEPLOYDIR}/optee/
> > > >  }
> > > >
> > > >  addtask deploy before do_build after do_install
> > > > --
> > > > 2.30.2
> > > >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964



--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
