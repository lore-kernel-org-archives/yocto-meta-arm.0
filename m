Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3463.1593626926072796458
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 11:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6B61B40BA1;
	Wed,  1 Jul 2020 18:08:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCf7QPGHOCBl; Wed,  1 Jul 2020 18:08:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 24BE3409A6;
	Wed,  1 Jul 2020 18:08:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 678B5173D5E; Wed,  1 Jul 2020 14:08:40 -0400 (EDT)
Date: Wed, 1 Jul 2020 14:08:40 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Gabor Abonyi <Gabor.Abonyi@arm.com>
Cc: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	Jon Mason <jdmason@kudzu.us>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
Message-ID: <20200701180840.GT17660@denix.org>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
 <20200622071401.2570-5-gabor.abonyi@arm.com>
 <20200622164936.GF17660@denix.org>
 <20200622172654.GC14044@kudzu.us>
 <20200622173611.GG17660@denix.org>
 <e4cd2080-3747-9ead-d307-6394caba82d1@gmail.com>
 <VI1PR0802MB2414E9F9AB2A65D5B27A7DE68E940@VI1PR0802MB2414.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VI1PR0802MB2414E9F9AB2A65D5B27A7DE68E940@VI1PR0802MB2414.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 08:59:56AM +0000, Gabor Abonyi wrote:
> If I move TF-M to meta-arm-bsp, then meta-arm-bsp would have the depend=
ency on arm-toolchain. Would that be better?
> (I do not understand why meta-arm depending on arm-toolchain is a bad t=
hing, explanations are welcome :) )

meta-arm is meant to be a central place for shared components to be used =
by=20
other BSPs. Kind of a community layer, if you like. And arm-toolchain is =
kind=20
of a special layer and may not be desirable by all BSPs, so that would re=
duce=20
overall usefulness of meta-arm layer. Each individual BSP (and meta-arm-b=
sp is=20
one of those) is free to depend on arm-toolchain layer directly, if neede=
d.

--=20
Denys


> I experimented with BBFILES_DYNAMIC, but it is very unhelpful from end-=
user perspective (if arm-toolchain is not in bblayers):
> "ERROR: Nothing PROVIDES 'trusted-firmware-m'. Close matches:
>   trusted-firmware-a"
> Compared to the current one:
> "ERROR: Layer 'meta-arm' depends on layer 'arm-toolchain', but this lay=
er is not enabled in your configuration"
>=20
> I am open to any suggestions.
> =20
> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>=
 On Behalf Of Joshua Watt via lists.yoctoproject.org
> Sent: 2020. j=C3=BAnius 22., h=C3=A9tf=C5=91 20:04
> To: Denys Dmytriyenko <denis@denix.org>; Jon Mason <jdmason@kudzu.us>
> Cc: Gabor Abonyi <Gabor.Abonyi@arm.com>; meta-arm@lists.yoctoproject.or=
g; nd <nd@arm.com>
> Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
>=20
>=20
> On 6/22/20 12:36 PM, Denys Dmytriyenko wrote:
> > On Mon, Jun 22, 2020 at 01:26:54PM -0400, Jon Mason wrote:
> >> On Mon, Jun 22, 2020 at 12:49:36PM -0400, Denys Dmytriyenko wrote:
> >>> On Mon, Jun 22, 2020 at 09:13:59AM +0200, Gabor Abonyi wrote:
> >>>> Adds a recipe to pull down the trusted-firmware-m repository and=20
> >>>> the ones it depends on. The recipe can either use=20
> >>>> gcc-arm-none-eabi-native or armcompiler-native Clang toolchain to =
compile the firmware.
> >>>>
> >>>> Change-Id: I37a4ba38982b5b1d387eccbb26bb5c79bddab0f7
> >>>> Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
> >>>> ---
> >>>>   meta-arm/conf/layer.conf                      |   1 +
> >>>>   .../trusted-firmware-m/trusted-firmware-m.inc | 118 ++++++++++++=
++++++
> >>>>   .../trusted-firmware-m_1.0.bb                 |  25 ++++
> >>>>   3 files changed, 144 insertions(+)
> >>>>   create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trust=
ed-firmware-m.inc
> >>>>   create mode 100644=20
> >>>> meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> >>>>
> >>>> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf=20
> >>>> index 3341972..10a7951 100644
> >>>> --- a/meta-arm/conf/layer.conf
> >>>> +++ b/meta-arm/conf/layer.conf
> >>>> @@ -11,5 +11,6 @@ BBFILE_PRIORITY_meta-arm =3D "6"
> >>>>  =20
> >>>>   LAYERDEPENDS_meta-arm =3D " \
> >>>>       core \
> >>>> +    arm-toolchain \
> >>> This may be problematic...
> >> Yes, this was flagged as a potential problem internally. =20
> >> Fortunately, meta-arm-toolchain currently has no other layer=20
> >> dependencies.  So, it shouldn't hurt too much.  Ccing JPEW directly=20
> >> on this, since his insight has been helpful in the past.
> >>
> >> TF-M requires Arm's LLVM/Clang based toolchain to compile, which is=20
> >> the second patch of this series.
> > One of the options is to move TF-M to meta-arm-bsp...
>=20
> Ya, I wouldn't want to mandate meta-arm-toolchain here. You could eithe=
r move it to meta-arm-bsp as Denys suggested or possibly use BBFILES_DYNA=
MIC?
>=20
>=20
> >
