Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEB4CA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 04:16:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.18034.1694492211164463989
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 21:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7AD8640952;
	Tue, 12 Sep 2023 04:16:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhKy2W-xPy8E; Tue, 12 Sep 2023 04:16:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E1550408CD;
	Tue, 12 Sep 2023 04:16:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A0816163CAB; Tue, 12 Sep 2023 00:16:47 -0400 (EDT)
Date: Tue, 12 Sep 2023 00:16:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for
 nanbield
Message-ID: <20230912041647.GF3359@denix.org>
References: <20230910163550.3900070-1-martin.jansa@gmail.com>
 <17840AA742C25184.29005@lists.yoctoproject.org>
 <CAPoiz9wn0kQdsVogYJn-e5ApkAiw9G+2OxR_UCOTFxTaV7egzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPoiz9wn0kQdsVogYJn-e5ApkAiw9G+2OxR_UCOTFxTaV7egzw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Sep 2023 04:16:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5040

On Tue, Sep 12, 2023 at 12:01:50AM -0400, Jon Mason wrote:
> On Mon, Sep 11, 2023 at 11:57=E2=80=AFPM Jon Mason via lists.yoctoproje=
ct.org
> <jdmason=3Dkudzu.us@lists.yoctoproject.org> wrote:
> >
> >
> > On Sun, 10 Sep 2023 18:35:50 +0200, Martin Jansa wrote:
> > > * oe-core switched to nanbield in:
> > >   https://git.openembedded.org/openembedded-core/commit/?id=3Df212c=
b12a0db9c9de5afd3cc89b1331d386e55f6
> > >
> > >
> >
> > Applied, thanks!
> >
> > [1/1] layer.conf: update LAYERSERIES_COMPAT for nanbield
> >       commit: 2d809a7c3511b9fcb71f1b264184e7840a378adc
>=20
> Actually, what was included in meta-arm was Khem's patch, not yours
> (though identical patches, his was the one that made it in).  Weird
> that the b4 tooling got confused.  Sorry for the noise.

And I was really wondering about that - which one got in and why exacly?

--=20
Denys

