Return-Path: <marek.bykowski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5189C52D7D
	for <webhook@archiver.kernel.org>; Sat, 17 Aug 2024 07:42:40 +0000 (UTC)
Subject: meta-arm-bsp supporting fvp-base armv9 CPUs
To: meta-arm@lists.yoctoproject.org
From: "Marek Bykowski" <marek.bykowski@gmail.com>
X-Originating-Location: Warsaw, Mazovia, PL (5.173.152.68)
X-Originating-Platform: Windows Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 17 Aug 2024 00:42:31 -0700
Message-ID: <Kzp1.1723880551717838263.t5nq@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="ocpsOQalH9nGBbiEfEc1"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 17 Aug 2024 07:42:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5965

--ocpsOQalH9nGBbiEfEc1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi folks,

Are you going to add support for armv9 CPUs for fvp-base?=C2=A0Or alternati=
vely can I start adding it by myself but I guess I would need some pointers=
.

When I simply changed for `meta-arm-bsp/conf/machine/fvp-base.conf`

-require conf/machine/include/arm/arch-armv8-4a.inc
+require conf/machine/include/arm/arch-armv9a.inc

and

-FVP_CONFIG[cluster0.has_arm_v8-4] =3D "1"
-FVP_CONFIG[cluster1.has_arm_v8-4] =3D "1"
+FVP_CONFIG[cluster0.has_arm_v9-0] =3D "1"
+FVP_CONFIG[cluster1.has_arm_v9-0] =3D "1"

I get the error

NOTICE: =C2=A0Booting Trusted Firmware
NOTICE: =C2=A0BL1: v2.10.4(release):lts-v2.10.4-dirty
NOTICE: =C2=A0BL1: Built : 16:23:33, Apr 26 2024
NOTICE: =C2=A0BL1: Booting BL2
ERROR: =C2=A0 EL1 supports AArch64-only. Please set build flag CTX_INCLUDE_=
AARCH32_REGS =3D 0

--ocpsOQalH9nGBbiEfEc1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi folks,</div>
<div>&nbsp;</div>
<div>Are you going to add support for armv9 CPUs for fvp-base?&nbsp;Or alte=
rnatively can I start adding it by myself but I guess I would need some poi=
nters.</div>
<div>&nbsp;</div>
<div>When I simply changed for `meta-arm-bsp/conf/machine/fvp-base.conf`</d=
iv>
<div>&nbsp;</div>
<div>-require conf/machine/include/arm/arch-armv8-4a.inc<br />+require conf=
/machine/include/arm/arch-armv9a.inc</div>
<div>&nbsp;</div>
<div>and&nbsp;</div>
<div>&nbsp;</div>
<div>-FVP_CONFIG[cluster0.has_arm_v8-4] =3D "1"<br />-FVP_CONFIG[cluster1.h=
as_arm_v8-4] =3D "1"<br />+FVP_CONFIG[cluster0.has_arm_v9-0] =3D "1"<br />+=
FVP_CONFIG[cluster1.has_arm_v9-0] =3D "1"</div>
<div>&nbsp;</div>
<div>I get the error</div>
<div>&nbsp;</div>
<div>NOTICE: &nbsp;Booting Trusted Firmware<br />NOTICE: &nbsp;BL1: v2.10.4=
(release):lts-v2.10.4-dirty<br />NOTICE: &nbsp;BL1: Built : 16:23:33, Apr 2=
6 2024<br />NOTICE: &nbsp;BL1: Booting BL2<br />ERROR: &nbsp; EL1 supports =
AArch64-only. Please set build flag CTX_INCLUDE_AARCH32_REGS =3D 0</div>

--ocpsOQalH9nGBbiEfEc1--

