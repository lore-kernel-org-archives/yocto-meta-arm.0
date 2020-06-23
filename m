Subject: Re: [PATCH 4/6] arm: trusted-firmware-m: Add recipe
To: meta-arm@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Fremont, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 23 Jun 2020 00:06:56 -0700
References: <20200622194802.GI17660@denix.org>
In-Reply-To: <20200622194802.GI17660@denix.org>
Message-ID: <31688.1592896016698778890@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 08:48 PM, Denys Dmytriyenko wrote:

>
> On Mon, Jun 22, 2020 at 08:29:02PM +0100, Ross Burton wrote:
> > On Mon, 22 Jun 2020 at 19:44, Denys Dmytriyenko <denis@denix.org> wrot=
e:
> > > > Looks like it's time to start that multiconfig experiment where we
> > > > just build another cross compiler inside Yocto.
> > >
> > > You can check meta-ti - our K3 platforms have Aarch64 Cortex-A cores=
 and
> Armv7
> > > Cortex-R cores, so meta-ti now uses multiconfig to build 2 cross com=
pilers
> and
> > > use those for corresponding components. TF-M sounds like a perfect u=
se
> case
> > > for that, as well.
> >=20
> > Awesome for doing it already.  Does it work well?
>=20
> Works quite well, as long as you can express relations between multiconf=
igs=20
> with build-time dependency and hand-off via DEPLOY_DIR. Works quite well=
 if=20
> you only need to do firmwares or bootloaders for those extra cores. You =
can=20
> even have those packaged into a partition in your wic image.
>=20
> But more complex use cases, which would require run-time dependencies, l=
ike=20
> packaging an SDK with both cross-compilers and sysroots, aren't supporte=
d yet.
>=20
> --=20
> Denys
>
On Mon, Jun 22, 2020 at 08:48 PM, Denys Dmytriyenko wrote:

>
> On Mon, Jun 22, 2020 at 08:29:02PM +0100, Ross Burton wrote:
> > On Mon, 22 Jun 2020 at 19:44, Denys Dmytriyenko <denis@denix.org> wrot=
e:
> > > > Looks like it's time to start that multiconfig experiment where we
> > > > just build another cross compiler inside Yocto.
> > >
> > > You can check meta-ti - our K3 platforms have Aarch64 Cortex-A cores=
 and
> Armv7
> > > Cortex-R cores, so meta-ti now uses multiconfig to build 2 cross com=
pilers
> and
> > > use those for corresponding components. TF-M sounds like a perfect u=
se
> case
> > > for that, as well.
> >=20
> > Awesome for doing it already.  Does it work well?
>=20
> Works quite well, as long as you can express relations between multiconf=
igs=20
> with build-time dependency and hand-off via DEPLOY_DIR. Works quite well=
 if=20
> you only need to do firmwares or bootloaders for those extra cores. You =
can=20
> even have those packaged into a partition in your wic image.
>=20
> But more complex use cases, which would require run-time dependencies, l=
ike=20
> packaging an SDK with both cross-compilers and sysroots, aren't supporte=
d yet.
>=20
> --=20
> Denys
>

I'm struggling to understand what multiconfig and building the toolchain f=
rom source will help on removing the meta-arm dependency on meta-arm-toolch=
ain.
Can you guys elaborate better?

The ideal place for trusted-firmware-[a|m] recipes is meta-arm layer since=
 they are generic and supposed to be specialized/customized/extended/tweake=
d by BSP layers.

Using BBFILES_DYNAMIC is a feasible possibility (despite adding at least m=
ore two directory levels) if adding meta-arm-toolchain as default dependenc=
y on meta-arm will cause so much pain.
