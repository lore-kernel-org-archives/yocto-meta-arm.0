Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.14392.1618412486453594660
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 08:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 686DE40C3E;
	Wed, 14 Apr 2021 15:01:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJcpUtufV69T; Wed, 14 Apr 2021 15:01:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3A0F9409E0;
	Wed, 14 Apr 2021 15:01:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A6FB21745B3; Wed, 14 Apr 2021 11:01:22 -0400 (EDT)
Date: Wed, 14 Apr 2021 11:01:22 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm/optee-os: deploy tee.elf for u-boot
Message-ID: <20210414150122.GQ15937@denix.org>
References: <20210413094038.3577754-1-yann@blade-group.com>
 <20210413094038.3577754-4-yann@blade-group.com>
 <20210413205648.GP15937@denix.org>
 <CA+4=imaKJYjLR-Z=DZOWGQX1_4YCn-f2M0U=+O9Xfmfq9eAaWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+4=imaKJYjLR-Z=DZOWGQX1_4YCn-f2M0U=+O9Xfmfq9eAaWQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 09:47:06AM +0200, Yann Dirson wrote:
> Hi Denis,
>=20
> Le mar. 13 avr. 2021 =E0 22:56, Denys Dmytriyenko <denis@denix.org> a =E9=
crit :
> >
> > On Tue, Apr 13, 2021 at 11:40:37AM +0200, Yann Dirson wrote:
> > > From: Yann Dirson <yann@blade-group.com>
> > >
> > > Integration of OP-TEE in the u-boot image is done with `TEE=3Dtee.e=
lf`.
> > > This can now be done in a BSP layer with something like this in
> > > `u-boot_%.bbappend`:
> >
> > Well, this is not very standardized and is platform-specific.
> >
> > For example, TI K3 platforms take tee-pager_v2.bin file into U-boot, =
not
> > tee.elf one. But tee.elf still gets deployed for debugging purposes..=
.
> >
> > E.g. in meta-ti u-boot_%.bbappend:
> >
> > PACKAGECONFIG[optee] =3D "TEE=3D${STAGING_DIR_HOST}${nonarch_base_lib=
dir}/firmware/tee-pager_v2.bin,,optee-os"
> > PACKAGECONFIG_append_k3 =3D " optee"
> >
> >
> > >  OPTEE_DEPENDS ??=3D ""
> > >  OPTEE_DEPENDS_rk3399 =3D " optee-os:do_deploy"
> > >
> > >  do_compile[depends] .=3D "${OPTEE_DEPENDS}"
> > >
> > >  do_compile_prepend_rk3399() {
> > >      export TEE=3D${DEPLOY_DIR_IMAGE}/optee/tee.elf
> > >  }
> >
> > To mee, the above PACKAGECONFIG approach is a bit cleaner...
>=20
> Well, I did not like it either and went with a DISTRO_FEATURES approach=
,
> see my meta-rockchip patches on yocto ml.  It would be nice if it was g=
eneric
> enough, but your example above shows it probably needs some more
> refining anyway.
>=20
> Eg. even the PACKAGECONFIG you show above is still BSP-specific.
> Maybe we could centralize in meta-arm the different ways to integrate
> op-tee, and get the BSP to choose one ?
>=20
> >
> > In summary, I support availability of tee.elf, but besides do_deploy(=
), I
> > would also suggest adding it to do_install()
>=20
> I must say I was puzzled by those optee files put it a package for inst=
allation
> in the target rootfs

No, they are not in the target rootfs, they don't have to be.
Getting files installed does put them in a package, which enables=20
proper staging, so you can DEPENDS +=3D "optee-os" and the files will=20
be in recipe-sysroot, similar to my PACKAGECONFIG example above.
Whether the package gets installed in the target rootfs or not is=20
completely orthogonal here.


> (but then as you say there seem to be many ways
> to integrate
> op-tee on different platforms).  If they're just useful for debugging,
> they would look like
> good candidates for a -dbg package: what use-case does the current opte=
e-os
> binary package serve ?
>=20
> >
> >
> > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > ---
> > >  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-ar=
m/recipes-security/optee/optee-os.inc
> > > index 34f586a..db8428a 100644
> > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > @@ -58,7 +58,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >
> > >  do_deploy() {
> > >      install -d ${DEPLOYDIR}/optee
> > > -    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYD=
IR}/optee/
> > > +    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${B}/core=
/tee.elf ${DEPLOYDIR}/optee/
> > >  }
> > >
> > >  addtask deploy before do_build after do_install
> > > --
> > > 2.30.2
> > >

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
