Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.12795.1618933857943170535
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 08:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B5F7140C2A;
	Tue, 20 Apr 2021 15:50:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMQpWekwDF3l; Tue, 20 Apr 2021 15:50:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 82E5B407FE;
	Tue, 20 Apr 2021 15:50:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E961D1745C5; Tue, 20 Apr 2021 11:50:52 -0400 (EDT)
Date: Tue, 20 Apr 2021 11:50:52 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Ross Burton <ross@burtonini.com>, meta-arm@lists.yoctoproject.org,
	Yann Dirson <yann@blade-group.com>
Subject: Re: [meta-arm] [PATCH v2 3/6] arm/optee-os: deploy tee.elf for u-boot
Message-ID: <20210420155052.GL15937@denix.org>
References: <20210414134726.4125294-1-yann@blade-group.com>
 <20210414134726.4125294-4-yann@blade-group.com>
 <CAAnfSTumRh_EaePZpxccodTmtTO=M0BqLHzfZn78iZXpVjhT=Q@mail.gmail.com>
 <20210420001756.GK15937@denix.org>
 <CA+4=imb4A2-4w_-ywqkcze_Mw0Jy3q37Wh7VLbg1+AkwsYLH-g@mail.gmail.com>
 <CA+4=imZLnifL-JUUMtFDJ8PbA3rNi0aF-tgC-MyMDAJ+fTKjWA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+4=imZLnifL-JUUMtFDJ8PbA3rNi0aF-tgC-MyMDAJ+fTKjWA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021 at 11:35:55AM +0200, Yann Dirson wrote:
> *
>=20
> Le mar. 20 avr. 2021 =E0 09:54, Yann Dirson
> <yann.dirson@blade-group.com> a =E9crit :
> >
> > Le mar. 20 avr. 2021 =E0 02:18, Denys Dmytriyenko <denis@denix.org> a=
 =E9crit :
> > >
> > > On Mon, Apr 19, 2021 at 05:34:13PM +0100, Ross Burton wrote:
> > > > This is causing the CI to break:
> > > >
> > > > ERROR: optee-os-3.11.0-r0 do_package_qa: QA Issue: optee-os: ELF
> > > > binary /lib/firmware/tee.elf has relocations in .text [textrel]
> > > >
> > > > Can you either fix or add an INSANE_SKIP with a comment?
> > >
> > > Ah, sorry, forgot to mention that textrel needs to be added to INSA=
NE_SKIP now
> > > that tee.elf gets packaged.
> >
> > I'm surprised, how is it that this test is not triggered on all boxes
> > (ie. on the master CI but not on testing
> > or on my box) ?  I'm all for submitting a fix but it's harder to be
> > correct why I cannot reproduce the problem :)
>=20
> Digging this I am surprised by how hard it is to force a package_qa rer=
un:
> - the package_qa_* functions text is not included, so even changing
> them does not
>   cause them to re-run
> - WARN_QA and ERROR_QA are part of BB_HASHBASE_WHITELIST, so adjusting
>   this does not cause a rerun either
>=20
> It would seem interesting to have all of this part of the package_qa
> siginfo, right ?
>=20
> I have the clear feeling the workflow to investigate the issue is
> really suboptimal
> ("bitbake -c clean && find sstate-cache -delete" between each run).

I usually do -c cleansstate and then force -c compile -f to invalidate ss=
tate=20
for a package.


> As for the issue at hand: I can now trigger package_qa at will, and
> adding more traces
> in textrel test I can see it is really executed on tee.elf, but it
> just passes the test.
>=20
> "objdump -p" and "objdump -r" just show nothing, so indeed no TEXTREL.
>=20
> On what configuration does the CI get this ?

I wonder if tee.elf for your platform is different. Are you building for =
qemu=20
or a real machine? I saw this QA issue reported for TI platforms before.


> > > > Ross
> > > >
> > > > On Wed, 14 Apr 2021 at 14:48, Yann Dirson <yann.dirson@blade-grou=
p.com> wrote:
> > > > >
> > > > > From: Yann Dirson <yann@blade-group.com>
> > > > >
> > > > > Integration of OP-TEE in the u-boot image is done with `TEE=3Dt=
ee.elf`,
> > > > > so this build artifact must be exported.
> > > > >
> > > > > U-boot integration can now be done in a BSP layer with somethin=
g like
> > > > > this in `u-boot_%.bbappend`:
> > > > >
> > > > >  # OP-TEE, dependent on "optee" DISTRO_FEATURES
> > > > >
> > > > >  OPTEE_OEMAKE ?=3D " TEE=3D${DEPLOY_DIR_IMAGE}/optee/tee.elf"
> > > > >
> > > > >  EXTRA_OEMAKE_append =3D " ${PACKAGECONFIG_CONFARGS}"
> > > > >  PACKAGECONFIG[optee] =3D "${OPTEE_OEMAKE},,optee-os"
> > > > >  PACKAGECONFIG_append =3D " ${@bb.utils.filter('DISTRO_FEATURES=
', 'optee', d)}"
> > > > >
> > > > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > > > ---
> > > > >  meta-arm/recipes-security/optee/optee-os.inc | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/met=
a-arm/recipes-security/optee/optee-os.inc
> > > > > index 34f586a..08cc2f0 100644
> > > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > > > @@ -45,7 +45,7 @@ do_compile[cleandirs] =3D "${B}"
> > > > >  do_install() {
> > > > >      #install core in firmware
> > > > >      install -d ${D}${nonarch_base_libdir}/firmware/
> > > > > -    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/=
firmware/
> > > > > +    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${non=
arch_base_libdir}/firmware/
> > > > >
> > > > >      #install TA devkit
> > > > >      install -d ${D}${includedir}/optee/export-user_ta/
> > > > > --
> > > > > 2.30.2
> > > > >
> > > > >
> > > > >
> > > > >
> > >
> > > --
> > > Regards,
> > > Denys Dmytriyenko <denis@denix.org>
> > > PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> > > Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> >
> >
> >
> > --
> > Yann Dirson <yann@blade-group.com>
> > Blade / Shadow -- http://shadow.tech
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
