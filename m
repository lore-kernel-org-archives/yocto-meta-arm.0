Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7623.1618495862833546552
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 07:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BBC5B40C81;
	Thu, 15 Apr 2021 14:11:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siMkR14h8a4r; Thu, 15 Apr 2021 14:11:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FE08407E5;
	Thu, 15 Apr 2021 14:10:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EEDE61745B4; Thu, 15 Apr 2021 10:10:58 -0400 (EDT)
Date: Thu, 15 Apr 2021 10:10:58 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm/optee-os: deploy tee.elf for u-boot
Message-ID: <20210415141058.GR15937@denix.org>
References: <20210413094038.3577754-1-yann@blade-group.com>
 <20210413094038.3577754-4-yann@blade-group.com>
 <20210413205648.GP15937@denix.org>
 <CA+4=imaKJYjLR-Z=DZOWGQX1_4YCn-f2M0U=+O9Xfmfq9eAaWQ@mail.gmail.com>
 <20210414150122.GQ15937@denix.org>
 <CA+4=imZ=8vRMPFLbShUWb-LO_gGVR7bMPZKZ-4oSk91GvPCfgA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+4=imZ=8vRMPFLbShUWb-LO_gGVR7bMPZKZ-4oSk91GvPCfgA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 09:44:32AM +0200, Yann Dirson wrote:
> Le mer. 14 avr. 2021 =E0 17:01, Denys Dmytriyenko <denis@denix.org> a =E9=
crit :
> >
> > On Wed, Apr 14, 2021 at 09:47:06AM +0200, Yann Dirson wrote:
> > > Hi Denis,
> > >
> > > Le mar. 13 avr. 2021 =E0 22:56, Denys Dmytriyenko <denis@denix.org>=
 a =E9crit :
> > > >
> > > > On Tue, Apr 13, 2021 at 11:40:37AM +0200, Yann Dirson wrote:
> > > > > From: Yann Dirson <yann@blade-group.com>
> > > > >
> > > > > Integration of OP-TEE in the u-boot image is done with `TEE=3Dt=
ee.elf`.
> > > > > This can now be done in a BSP layer with something like this in
> > > > > `u-boot_%.bbappend`:
> > > >
> > > > Well, this is not very standardized and is platform-specific.
> > > >
> > > > For example, TI K3 platforms take tee-pager_v2.bin file into U-bo=
ot, not
> > > > tee.elf one. But tee.elf still gets deployed for debugging purpos=
es...
> > > >
> > > > E.g. in meta-ti u-boot_%.bbappend:
> > > >
> > > > PACKAGECONFIG[optee] =3D "TEE=3D${STAGING_DIR_HOST}${nonarch_base=
_libdir}/firmware/tee-pager_v2.bin,,optee-os"
> > > > PACKAGECONFIG_append_k3 =3D " optee"
> > > >
> > > >
> > > > >  OPTEE_DEPENDS ??=3D ""
> > > > >  OPTEE_DEPENDS_rk3399 =3D " optee-os:do_deploy"
> > > > >
> > > > >  do_compile[depends] .=3D "${OPTEE_DEPENDS}"
> > > > >
> > > > >  do_compile_prepend_rk3399() {
> > > > >      export TEE=3D${DEPLOY_DIR_IMAGE}/optee/tee.elf
> > > > >  }
> > > >
> > > > To mee, the above PACKAGECONFIG approach is a bit cleaner...
> > >
> > > Well, I did not like it either and went with a DISTRO_FEATURES appr=
oach,
> > > see my meta-rockchip patches on yocto ml.  It would be nice if it w=
as generic
> > > enough, but your example above shows it probably needs some more
> > > refining anyway.
> > >
> > > Eg. even the PACKAGECONFIG you show above is still BSP-specific.
> > > Maybe we could centralize in meta-arm the different ways to integra=
te
> > > op-tee, and get the BSP to choose one ?
> > >
> > > >
> > > > In summary, I support availability of tee.elf, but besides do_dep=
loy(), I
> > > > would also suggest adding it to do_install()
> > >
> > > I must say I was puzzled by those optee files put it a package for =
installation
> > > in the target rootfs
> >
> > No, they are not in the target rootfs, they don't have to be.
> > Getting files installed does put them in a package, which enables
> > proper staging, so you can DEPENDS +=3D "optee-os" and the files will
> > be in recipe-sysroot, similar to my PACKAGECONFIG example above.
> > Whether the package gets installed in the target rootfs or not is
> > completely orthogonal here.
>=20
> I see what you mean.  However, a package is still originally the
> "installable unit"
> for meant for usage in a consistent filesystem, so we got a semantic
> shift, then :).
> If we have all those bootloader parts and other files already usable
> through classical
> DEPENDS, what good does it make to have them also exposed by do_deploy =
?
>=20
> In fact, using deployed artifacts in a recipe could even cause reproduc=
ibility
> issues of the same kind we had before per-recipe sysroots.  Shouldn't w=
e just
> stop getting *any* file from DEPLOY_DIR_IMAGE in recipes ?

Consuming files from DEPLOY within recipes is not recommended. At least i=
t=20
wasn't originally...


> >
> >
> > > (but then as you say there seem to be many ways
> > > to integrate
> > > op-tee on different platforms).  If they're just useful for debuggi=
ng,
> > > they would look like
> > > good candidates for a -dbg package: what use-case does the current =
optee-os
> > > binary package serve ?
> > >
> > > >
> > > >
> > > > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > > > ---
> > > > >  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/met=
a-arm/recipes-security/optee/optee-os.inc
> > > > > index 34f586a..db8428a 100644
> > > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > > > @@ -58,7 +58,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > >
> > > > >  do_deploy() {
> > > > >      install -d ${DEPLOYDIR}/optee
> > > > > -    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEP=
LOYDIR}/optee/
> > > > > +    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${B}/=
core/tee.elf ${DEPLOYDIR}/optee/
> > > > >  }
> > > > >
> > > > >  addtask deploy before do_build after do_install
> > > > > --
> > > > > 2.30.2
> > > > >
> >
> > --
> > Regards,
> > Denys Dmytriyenko <denis@denix.org>
> > PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> > Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>=20
>=20
>=20
> --=20
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>=20

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
