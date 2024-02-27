Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17CAC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:02:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.638.1709067762986085393
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 13:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DCE0B40C81;
	Tue, 27 Feb 2024 21:02:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unmyEEp_H6k3; Tue, 27 Feb 2024 21:02:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BF77E40023;
	Tue, 27 Feb 2024 21:02:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C923D163EB6; Tue, 27 Feb 2024 16:02:39 -0500 (EST)
Date: Tue, 27 Feb 2024 16:02:39 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: d.sabato@4sigma.it
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] aarch64 external-toolchain multilib support
Message-ID: <20240227210239.GD6072@denix.org>
References: <llGR.1709056307395060423.8aZp@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <llGR.1709056307395060423.8aZp@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 27 Feb 2024 21:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5401

Unlike x86, there are separate compilers for 64bit Arm and 32bit Arm. The=
=20
external toolchain you use is aarch64-none-linux-gnu and is for 64bit, wh=
ile=20
32bit toolchain is called arm-none-linux-gnueabihf. TCMODE=3Dexternal-arm=
 does=20
not support dual toolchains at the same time, hence no multilib.


On Tue, Feb 27, 2024 at 09:51:47AM -0800, d.sabato via lists.yoctoproject=
.org wrote:
> Hello,
> I use pre-built external ARM toolchain to build iMx8 distro 64 bit.
>=20
> TCMODE =3D "external-arm"
> EXTERNAL_TOOLCHAIN =3D "/opt/arm-gnu-toolchain-13.2.Rel1-x86_64-aarch64=
-none-linux-gnu"
>=20
> I'd like to generate 32bit version of libraries for my sysroot=A0so I a=
dd following in my build/local.conf :
>=20
> require conf/multilib.conf
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7athf-neon"
> IMAGE_INSTALL:append :=3D " lib32-glibc lib32-libgcc lib32-libstdc++"
>=20
> Am I doing right ?
>=20
> Build Configuration:
> BB_VERSION=A0 =A0 =A0 =A0 =A0 =A0=3D "2.4.0"
> BUILD_SYS=A0 =A0 =A0 =A0 =A0 =A0 =3D "x86_64-linux"
> NATIVELSBSTRING=A0 =A0 =A0 =3D "debian-12"
> TARGET_SYS=A0 =A0 =A0 =A0 =A0 =A0=3D "aarch64-oe-linux"
> TUNE_FEATURES=A0 =A0 =A0 =A0 =3D "aarch64 armv8a crc cortexa53 crypto"
> TARGET_FPU=A0 =A0 =A0 =A0 =A0 =A0=3D ""
> meta=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D "master:3c35416a8bff3a857004=
beadbd053d50eca30ce2"
> meta-oe
> meta-networking
> meta-python
> meta-filesystems=A0 =A0 =A0=3D "master:39968837196cb48209b71e8852dd04a2=
f8ccdca8"
> meta-freescale=A0 =A0 =A0 =A0=3D "master:7f0a7f3d19f564da0faf20e279b1b1=
8a7f0068b6"
> meta-arm-toolchain
> meta-arm=A0 =A0 =A0 =A0 =A0 =A0 =A0=3D "master:9bcc166bd5bb717aa86bb046=
4621a36abc51fa19"
>=20
> Thank you,
> Danilo

