Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.42.1580251799737369165
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Jan 2020 14:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0C6B040BCC;
	Tue, 28 Jan 2020 22:49:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dtbo_oGDAfFc; Tue, 28 Jan 2020 22:49:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C453F409E7;
	Tue, 28 Jan 2020 22:49:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2700D1743C2; Tue, 28 Jan 2020 17:49:54 -0500 (EST)
Date: Tue, 28 Jan 2020 17:49:54 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>, jon.mason@arm.com,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] Import ARM GNU-A toolset recipes from meta-linaro
Message-ID: <20200128224954.GN4735@denix.org>
References: <1580124007-23324-1-git-send-email-sumit.garg@linaro.org>
 <20200128045355.GK4735@denix.org>
 <CAPoiz9zvPps4ZfkgOwFKEKcKUCdbAov5x9F4+GNfgQ1v5r5YhA@mail.gmail.com>
 <20200128212006.GM4735@denix.org>
 <CAP71WjzGOUJZbtuJKkgBDnibyvgntmxvXM6LgsFeoQqxh5g0Nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjzGOUJZbtuJKkgBDnibyvgntmxvXM6LgsFeoQqxh5g0Nw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 11:28:45PM +0100, Nicolas Dechesne wrote:
> Le mar. 28 janv. 2020 =C3=A0 22:20, Denys Dmytriyenko <denis@denix.org>=
 a =C3=A9crit :
>=20
> > On Tue, Jan 28, 2020 at 04:06:17PM -0500, Jon Mason wrote:
> > > On Mon, Jan 27, 2020 at 11:54 PM Denys Dmytriyenko <denis@denix.org=
>
> > wrote:
> > > >
> > > > On Mon, Jan 27, 2020 at 04:50:07PM +0530, Sumit Garg wrote:
> > > > > Add a new meta-arm-toolchain layer to hold ARM GNU-A toolset re=
cipes
> > > > > imported from meta-linaro tree, branch: master and commit ID:
> > > > > 504ca3b217c9602b10eda0ec8a9f1055b59e482f.
> > > > >
> > > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > >
> > > > It's an exact copy of what's currently in meta-linaro-toolchain, =
but I
> > still
> > > > decided to test it - I applied this patch to meta-arm and reconfi=
gured
> > my
> > > > setup by replacing meta-linaro-toolchain with the new
> > meta-arm-toolchain and
> > > > ran few builds that use external-arm-toolchain and gcc-arm recipe=
s:
> > > >
> > > > Tested-by: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Thank you for the patch, Sumit, and for testing, Denys.  It is now
> > > included in meta-arm, see
> > >
> > https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=3Dc0a5=
9f3d94c633d6c902e7bd436690bc890bbc40
> >
> > Thank you, Jon!
> >
> > Now I only need OP-TEE recipes migrated (Nico?) - I wonder if meta-op=
tee
> > sublayer is required like it's in meta-linaro/meta-optee[1], or just
> > adding
> > them into main meta-arm sublayer would be fine?
>=20
>=20
> I think it should go into meta-arm directly. I don=E2=80=99t think addi=
ng too many
> layers is the right approach. We need to make sure that meta-arm remain=
s a
> generic software layer (no machine, no distro) so that it can easilt be
> consumed, so arguably we might not even need meta-arm-toolchain neither=
...

I tend to agree regarding placing OPTEE in the main meta-arm layer, espec=
ially=20
since it is now officially part of the Trusted Firmware project.

When do you expect the patches out? Do you need help with that?

As of meta-arm-toolchain, it's not so clear - I'd prefer it in a separate=
=20
layer, many people get confused by additional toolchain configs and recip=
es :)

--=20
Denys


> > [1] https://git.linaro.org/openembedded/meta-linaro.git/tree/
> >
> > --
> > Denys
> >
