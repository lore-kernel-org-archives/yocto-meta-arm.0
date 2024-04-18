Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5975AC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 15:57:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2369.1713455865603339455
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Apr 2024 08:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C0B5A40C6B;
	Thu, 18 Apr 2024 15:57:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtfVn5v3mBxo; Thu, 18 Apr 2024 15:57:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 96012408CD;
	Thu, 18 Apr 2024 15:57:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C9D99163F32; Thu, 18 Apr 2024 11:57:38 -0400 (EDT)
Date: Thu, 18 Apr 2024 11:57:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/3] external-arm-toolchain: in libc.so GNU
 ld script use base_libdir
Message-ID: <20240418155738.GY28791@denix.org>
References: <20240417113042.91880-1-vvavrychuk@gmail.com>
 <20240417113042.91880-3-vvavrychuk@gmail.com>
 <20240417201213.GU28791@denix.org>
 <CAGj4m+47gi6kai=_5ubCtqoz-Qis_uNgERLEn=Ho1otpH0pfRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGj4m+47gi6kai=_5ubCtqoz-Qis_uNgERLEn=Ho1otpH0pfRg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Apr 2024 15:57:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5565

On Thu, Apr 18, 2024 at 04:54:05PM +0300, Vasyl Vavrychuk wrote:
> On Wed, Apr 17, 2024 at 11:12=E2=80=AFPM Denys Dmytriyenko <denis@denix=
.org> wrote:
> >
> > On Wed, Apr 17, 2024 at 02:30:41PM +0300, Vasyl Vavrychuk wrote:
> > > -             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../..=
/${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${=
EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../..=
/${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
> > > +             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../..=
/${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${=
EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../..=
/${base_libdir}/ld-linux#g" ${D}${libdir}/libc.so
> >
> > Here ^^^ it's not clear why only the last of the sed replacements get=
s
> > updated, not all of them?
>=20
> 1. `/${EAT_LIBDIR}/${EAT_TARGET_SYS}` path is not used in libc.so in
> Arm GNU Toolchain v13.2.Rel1 in targets "arm-none-linux-gnueabihf" and
> "aarch64-none-linux-gnu". I am not sure in which versions for ARM or
> Linaro toolchain this path was used in libc.so. Should I replace it
> blindly?

Yeah, this list has grown with different versions of the toolchain, where=
=20
almost every new version required a slightly different adjustment in the=20
past.

And the external toolchain recipe was always trying to be version agnosti=
c=20
and work with a wide range of toolchain versions.

But I guess we could simplify the list of supported versions to what is=20
currently available for download - I see that 11.x and 12.x are supported=
=20
now.=20

Can you please check if libc.so is the same in those versions? If so, we=20
can potentially drop all other sed mods from here. Thanks.


> 2. Rest two expressions replace input string to "/usr/lib" or ".", so
> they are not affected by usrmerge.

--=20
Denys

