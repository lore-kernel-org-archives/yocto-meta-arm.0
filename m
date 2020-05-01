Subject: Re: [PATCH] meta-arm-bsp: add dunfell compatibility to fvps and juno
To: meta-arm@lists.yoctoproject.org
From: "Vineeth Raveendran" <vineeth.raveendran@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Linux Firefox 71
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 01 May 2020 06:32:59 -0700
References: <8de32e0cb92a562b63e909843483a4f240fff47c.camel@linuxfoundation.org>
In-Reply-To: <8de32e0cb92a562b63e909843483a4f240fff47c.camel@linuxfoundation.org>
Message-ID: <19562.1588339979907721254@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 01:10 PM, Richard Purdie wrote:

>
> On Thu, 2020-04-30 at 14:22 +0000, Bertrand Marquis wrote:
> > On 30 Apr 2020, at 10:06, Richard Purdie via lists.yoctoproject.org
> > > <richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:
> > >=20
> > > On Thu, 2020-04-30 at 09:17 +0100, Vineeth Raveendran wrote:
> > > > LAYERDEPENDS_meta-arm-bsp =3D "core openembedded-layer meta-arm"
> > > > LAYERSERIES_COMPAT_meta-arm-bsp =3D "warrior zeus dunfell"
> > > > +
> > > > +# Place holder for yocto version compatibility
> > > > +OVERRIDES_append =3D ":${LAYERSERIES_CORENAMES}"
> > >=20
> > > Generally we've advised different branches to make it clear to
> > > people
> > > which layers are compatible with which releases. I appreciate its
> > > "easier" to have one layer fits all to maintain, I'm less sure its
> > > clear for users.
> >=20
> > We have internal needs to keep zeus compatibility and as the amount
> > of conflict is reduced we decided to keep dunfell branch compatible
> > with Zeus.
> > From the external user point of view this will still be in dunfell
> > branch and officially to be used with dunfell, we don=E2=80=99t plan t=
o make
> > any =E2=80=9Cpublicity=E2=80=9D of it.
> >=20
> > Zeus compatibility will be remove from master once we will create the
> > Dunfell branch (Jon Mason should give more info on this shortly).
> >=20
> > > Whilst I can see why you want to do add to overrides like this, I'm
> > > not
> > > sure its a great idea. This will affect every layer in the combined
> > > stack, not just yours. OVERRIDES are fairly dangerous things and
> > > need
> > > careful namespacing. Our release names are designed to be
> > > distinctive
> > > but after bad experiences we generally recommend additional
> > > overrides
> > > be carefully namespaced, e.g. "class-XXXX", "pn-XXXX" since we know
> > > what weird issues these can cause.
> >=20
> > I agree with that and we will modify the patch to get rid of the
> > override and use something like:
> > RDEPENDS_${PN} +=3D "${@bb.utils.contains('LAYERSERIES_CORENAMES',
> > 'zeus', =E2=80=98zeus-solution', =E2=80=98dunfell-solution', d)}"
>=20
> This looks better, I'd probably pick something specific to your layer
> like "meta-arm-zeus" but the general idea and filtering is much better.
>=20
> > > Anyhow, there is a bug here since LAYERSERIES_CORENAMES can have
> > > multiple values, the clue being the plural name, e.g. it did here
> > > for a
> > > while:
> > >=20
> > >
> http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/layer.conf?id=
=
=3D8702b79a3b90a06524098e8b2a10b6e6d287166a
> >=20
> > Thanks for the pointer :-)
> > The bb.utils.contains solution should also solve this case that we
> > did not see before.
>=20
> Yes, looks much better!
>=20
> Cheers,
>=20
> Richard
>=20
>

Abandoning patch to rework on the same.

Thanks,

Vineeth
