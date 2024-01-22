Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0B1C47DD3
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 20:05:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2678.1705953894296979680
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jan 2024 12:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25C1540C2E;
	Mon, 22 Jan 2024 20:04:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3cIMOESJXfJ; Mon, 22 Jan 2024 20:04:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 13EF240BD4;
	Mon, 22 Jan 2024 20:04:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7E407163DDD; Mon, 22 Jan 2024 15:04:47 -0500 (EST)
Date: Mon, 22 Jan 2024 15:04:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross.burton@arm.com>
Cc: Michael Lynch <mlynch@hi-techniques.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [meta-arm] optee failing to build on head of dunfell
 branch for j7-evm
Message-ID: <20240122200447.GG18608@denix.org>
References: <UuhE.1705687266596590169.nYL6@lists.yoctoproject.org>
 <EF84BE17-CEE6-45A8-9FCC-0CDD4BB6F111@arm.com>
 <CADSA=uHnkpYGXfiK-u5NkHgqLutFh=Fy75Uurv4Zw7HcAMqCcg@mail.gmail.com>
 <797DCC01-1255-43F0-9596-85E7F173A6F0@arm.com>
 <CADSA=uFgpA6E=m2XvGuu-oSG+_BcXbGz04=Hf2bpN0vVN4=SgQ@mail.gmail.com>
 <2EB56308-5017-42DE-B55F-92AF772AE1E2@arm.com>
 <17ACBF07F3A964F3.17265@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17ACBF07F3A964F3.17265@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Jan 2024 20:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5353

On Mon, Jan 22, 2024 at 01:33:12PM -0500, Denys Dmytriyenko wrote:
> On Mon, Jan 22, 2024 at 02:25:34PM +0000, Ross Burton wrote:
> > On 22 Jan 2024, at 14:11, Michael Lynch <mlynch@hi-techniques.com> wr=
ote:
> > >=20
> > > Meta-ti branch is head of dunfell.
> > >=20
> > > Ok I believe see what's going on.  The dunfell branch of the meta-t=
i layer=20
> > > appends optee_os such that it updates optee_os to the 3.20.0 git ve=
rsion=20
> > > but does NOT supply a replacement patch file that works with the=20
> > > "mk/gcc.mk" file that comes with 3.20.0 nor does TI's optee_os appe=
nd=20
> > > override do_patch and I believe this is why the build ends up faili=
ng? =20
> > > Maybe time to ask on the meta-ti forum?
> >=20
> > Absolutely.  They don=E2=80=99t appear to be testing that combination=
.
>=20
> Well, TI historically have been using stable/LTS releases even for addi=
ng new=20
> platforms, hence bumping BSP components to newer versions, often backpo=
rting=20
> them from master, but sometimes even updating OPTEE/TFA before meta-arm=
 does.=20
> Those combinations are always being tested for TI platforms, as overrid=
es in=20
> those bbappends are specific to TI SoC platforms.
>=20
> Now, the issue is with the libgcc sysroot patch that's been there forev=
er,=20
> until just several days ago when it got replaced with CFLAGS in master.=
 And=20
> passing sysroot is required for OE-built toolchain.
>=20
> Anyway, I've done some digging - in the past TI was using external tool=
chain=20
> for their products, so when optee-os got bumped to 3.20, the issue with=
 the=20
> patch was missed, as external toolchain has no issue finding libgcc, e.=
g.:
>=20
> TCMODE =3D "external-arm"
> EXTERNAL_TOOLCHAIN =3D "<path-to-the-toolchain>"
>=20
> And switching TI products to OE-built toolchain (TOOLCHAIN_TYPE=3Dinter=
nal)=20
> surely exposes this issue:
>=20
> | aarch64-oe-linux-ld.bfd: cannot find libgcc.a: No such file or direct=
ory
>=20
> TI products have switched to Kirkstone about a year ago and also change=
d the=20
> default toolchain to OE-built one, so no issues there or in master.
>=20
> And Dunfell branch hasn't seen any updates in meta-ti since then, but I=
 guess=20
> this can be fixed, as apparently there are people still using Dunfell..=
.

https://patchwork.yoctoproject.org/project/ti/patch/20240122191902.156151=
0-1-denis@denix.org/

--=20
Denys

