Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F57CDB477
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 18:36:13 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.24454.1697049369340954712
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 11:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8847240CBB;
	Wed, 11 Oct 2023 18:36:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arz3496hGsT8; Wed, 11 Oct 2023 18:36:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67B2F40C8E;
	Wed, 11 Oct 2023 18:36:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6D666163CD8; Wed, 11 Oct 2023 14:36:05 -0400 (EDT)
Date: Wed, 11 Oct 2023 14:36:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Jon Mason <Jon.Mason@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm/boot-wrapper-aarch64: remove recipe
Message-ID: <20231011183605.GG2408@denix.org>
References: <20231011130203.3871606-1-jon.mason@arm.com>
 <20231011170803.GF2408@denix.org>
 <515F76C4-6343-422A-AAF9-13B90492C599@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <515F76C4-6343-422A-AAF9-13B90492C599@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Oct 2023 18:36:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5111

On Wed, Oct 11, 2023 at 05:28:29PM +0000, Ross Burton wrote:
> On 11 Oct 2023, at 18:08, Denys Dmytriyenko via lists.yoctoproject.org =
<denis=3Ddenix.org@lists.yoctoproject.org> wrote:
> >=20
> > On Wed, Oct 11, 2023 at 08:02:02AM -0500, Jon Mason wrote:
> >> fvp-baser was the only user of this recipe.  Since that has been
> >> removed, remove this as well.
> >=20
> > Is *common* meta-arm layer now being relegated to only serve ARM's ow=
n BSP?
> >=20
> > I don't know what fvp-baser is or was, but I do know that boot-wrappe=
r-aarch64=20
> > is commonly used by other BSPs for early stages of new platform devel=
opment=20
> > and board bringup, and/or custom bootflows.
> >=20
> > Removing this crucial common component sends the wrong message=E2=80=A6
>=20
> It=E2=80=99s aim is to be a common source of recipes, certainly.
>=20
> Can you point us at a BSP layer that uses this recipe?

Unfortunately, early stages of new platform development and board bringup=
=20
activities aren't done in the open and are not public. By the time a new=20
platform is made public, it usually has all the other pieces of the boot=20
chain integrated - U-boot/EFI, TF-A, OPTEE, etc.

Back when I was still with TI we used boot-wrapper-aarch64 to bring up th=
e=20
new K3 family of processors and the first 2 platforms - AM65x (A53) and=20
J721e (A72). Though it was before meta-arm was established, so I maintain=
ed=20
own version of the recipe inside internal-only layers.

A similar situation was with TF-A and OPTEE where BSPs would have own rec=
ipes=20
for those components back then. But the only difference is that those wou=
ld=20
eventually have to become public, and hence we all worked hard to unify t=
hose=20
recipes under meta-arm around early 2020. I'd argue same applies to this=20
boot-wrapper-aarch64 recipe, although it's less visible.

I know it's been added to meta-arm as part of Gem5 and you never heard of=
=20
anyone else using it, but it is still useful and having a common recipe f=
or=20
it is quite beneficial and probably worth a bit extra maintenance burden.=
..

--=20
Denys

