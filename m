Return-Path: <d.sabato@4sigma.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53CDC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 17:51:47 +0000 (UTC)
Subject: aarch64 external-toolchain multilib support
To: meta-arm@lists.yoctoproject.org
From: d.sabato@4sigma.it
X-Originating-Location: Milan, Lombardy, IT (213.45.28.152)
X-Originating-Platform: Linux Chrome 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 27 Feb 2024 09:51:47 -0800
Message-ID: <llGR.1709056307395060423.8aZp@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="9I6hZQRtFPKS22b2SUIn"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 27 Feb 2024 17:51:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5400

--9I6hZQRtFPKS22b2SUIn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I use pre-built external ARM toolchain to build iMx8 distro 64 bit.

TCMODE =3D "external-arm"
EXTERNAL_TOOLCHAIN =3D "/opt/arm-gnu-toolchain-13.2.Rel1-x86_64-aarch64-non=
e-linux-gnu"

I'd like to generate 32bit version of libraries for my sysroot=C2=A0so I ad=
d following in my build/local.conf :

require conf/multilib.conf
MULTILIBS =3D "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7athf-neon"
IMAGE_INSTALL:append :=3D " lib32-glibc lib32-libgcc lib32-libstdc++"

Am I doing right ?

Build Configuration:
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "2.4.0"
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "x86_64-linux"
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D "debian-12"
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "aarch64-oe-linux"
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "aarch64 armv8a crc cortexa53 =
crypto"
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ""
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "mast=
er:3c35416a8bff3a857004beadbd053d50eca30ce2"
meta-oe
meta-networking
meta-python
meta-filesystems=C2=A0 =C2=A0 =C2=A0=3D "master:39968837196cb48209b71e8852d=
d04a2f8ccdca8"
meta-freescale=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:7f0a7f3d19f564da0faf20=
e279b1b18a7f0068b6"
meta-arm-toolchain
meta-arm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:9bcc166=
bd5bb717aa86bb0464621a36abc51fa19"

Thank you,
Danilo

--9I6hZQRtFPKS22b2SUIn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div>
<div>I use pre-built external ARM toolchain to build iMx8 distro 64 bit.</d=
iv>
<div>&nbsp;</div>
<div>TCMODE =3D "external-arm"</div>
<div>EXTERNAL_TOOLCHAIN =3D "/opt/arm-gnu-toolchain-13.2.Rel1-x86_64-aarch6=
4-none-linux-gnu"</div>
<div>&nbsp;</div>
<div>I'd like to generate 32bit version of libraries for my sysroot&nbsp;so=
 I add following in my build/local.conf :</div>
<div>&nbsp;</div>
<div>require conf/multilib.conf</div>
<div>MULTILIBS =3D "multilib:lib32"</div>
<div>DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7athf-neon"</div>
<div>IMAGE_INSTALL:append :=3D " lib32-glibc lib32-libgcc lib32-libstdc++"<=
/div>
<div>&nbsp;</div>
<div>Am I doing right ?</div>
<div>&nbsp;</div>
<div>Build Configuration:</div>
<div>BB_VERSION&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "2.4.0"</div>
<div>BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "x86_64-linux"<=
/div>
<div>NATIVELSBSTRING&nbsp; &nbsp; &nbsp; =3D "debian-12"</div>
<div>TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "aarch64-oe-lin=
ux"</div>
<div>TUNE_FEATURES&nbsp; &nbsp; &nbsp; &nbsp; =3D "aarch64 armv8a crc corte=
xa53 crypto"</div>
<div>TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D ""</div>
<div>meta&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D =
"master:3c35416a8bff3a857004beadbd053d50eca30ce2"</div>
<div>meta-oe&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-networking&nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-python&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>meta-filesystems&nbsp; &nbsp; &nbsp;=3D "master:39968837196cb48209b71e=
8852dd04a2f8ccdca8"</div>
<div>meta-freescale&nbsp; &nbsp; &nbsp; &nbsp;=3D "master:7f0a7f3d19f564da0=
faf20e279b1b18a7f0068b6"</div>
<div>meta-arm-toolchain&nbsp; &nbsp;</div>
<div>meta-arm&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "master:9b=
cc166bd5bb717aa86bb0464621a36abc51fa19"</div>
<div><br />Thank you,<br />Danilo</div>

--9I6hZQRtFPKS22b2SUIn--

