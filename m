Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DD6C7EE25
	for <webhook@archiver.kernel.org>; Sat, 10 Jun 2023 00:53:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9694.1686358422022684554
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 17:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D8E5140C30;
	Sat, 10 Jun 2023 00:53:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHKriUsnqy3u; Sat, 10 Jun 2023 00:53:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B4E5640AE9;
	Sat, 10 Jun 2023 00:53:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 76DBE163A06; Fri,  9 Jun 2023 20:52:50 -0400 (EDT)
Date: Fri, 9 Jun 2023 20:52:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Sumit Garg <sumit.garg@linaro.org>
Subject: Re: RFC: removal of gcc-arm recipes
Message-ID: <20230610005250.GL9226@denix.org>
References: <9BB4164D-F0CC-4CB9-BAD0-4F3E64E7904A@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9BB4164D-F0CC-4CB9-BAD0-4F3E64E7904A@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 10 Jun 2023 00:53:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4755

On Thu, Jun 08, 2023 at 02:32:23PM +0000, Ross Burton wrote:
> First, to be clear, I am not talking about the removal of the binary=20
> toolchain recipes (gcc-arm-none-eabi and gcc-aarch64-none-elf) or suppo=
rt=20
> for external binary toolchains (TCMODE =3D "external-arm=E2=80=9D).
>=20
> I=E2=80=99m talking specifically about the gcc-arm recipes in meta-arm-=
toolchain=20
> that take the source release of the Arm GNU Toolchain, apply the best-e=
ffort=20
> rebase of the oe-core patches on top of that, and then build it as GCC.=
 =20
> This recipe is time-consuming to maintain (the patches need to be maint=
ained=20
> and synced with oe-core manually), and when the oe-core GCC and the Arm=
 GNU=20
> Toolchain are different versions things tend to break.
>=20
> For example: oe-core master now has GCC 13.1 so oe-core uses the new=20
> -fcanon-prefix-map option, but gcc-arm is 12.2 which doesn=E2=80=99t kn=
ow this=20
> option.  Set GCCVERSION to arm-12.2 and the build fails because it pass=
es a=20
> GCC 13-specific option to GCC 12, and there=E2=80=99s no neat way to re=
move that=20
> option automatically.
>=20
> This doesn=E2=80=99t affect the external binary toolchain support as we=
 can=20
> manipulate DEBUG_PREFIX_MAP in the toolchain file as needed.
>=20
> My hypothesis is that nobody is actually using the gcc-arm recipes.  If=
 you=20
> just want GCC then you=E2=80=99ll be better off using the recipes in oe=
-core=20
> already, they=E2=80=99re updated more regularly.  If you want GCC with =
Arm=E2=80=99s special=20
> sauce/source then you=E2=80=99re trusting that our rebuild of it -- wit=
h almost 30=20
> patches on top -- is actually effectively the same as the binary releas=
e=20
> that Arm makes.  In that case you=E2=80=99re probably better off using =
the binary=20
> release: you can be sure it does what it claims, and if it goes wrong=20
> there=E2=80=99s actually a support channel.
>=20
> So, in the spirit of keeping the things that people use and removing th=
e=20
> things that people don=E2=80=99t, I=E2=80=99m thinking we should remove=
 gcc-arm.  Does=20
> anyone have any strong opinions on this?

Well, we actually stumbled upon the breakage you describe above. And not=20
intentionally! In our distro we used to set GCCVERSION=3D"12%" so Bitbake=
 won't=20
complain that there are multiple versions of gcc - "12.2" from OE-Core an=
d=20
"arm-12.2" from meta-arm. So once OE-Core upgraded to 13.1, Bitbake decid=
ed=20
that "12%" pattern matches better to "arm-12.2" than "13.1" and switched =
over=20
to gcc from meta-arm, failing due to -fcanon-prefix-map setting :)

As of the question/proposal - it was useful to have an alternative gcc ba=
ck in=20
the day when Arm gcc often had more cutting edge features than upstream, =
but=20
these days they are more aligned than ever and we haven't used a dedicate=
d Arm=20
gcc for many years. I'd be in favor of dropping it due to heavy maintenan=
ce=20
burden.

--=20
Denys

