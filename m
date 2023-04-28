Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496FAC77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 13:47:39 +0000 (UTC)
Subject: external-arm-toolchain is not compatible with CMake
To: meta-arm@lists.yoctoproject.org
From: "Vasyl Vavrychuk" <vvavrychuk@gmail.com>
X-Originating-Location: Lviv, Lviv Oblast, UA (178.136.122.186)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 28 Apr 2023 06:47:30 -0700
Message-ID: <FV09.1682689650700057399.dcye@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="irQpsU2WXdSc2buDcfwB"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Apr 2023 13:47:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4623

--irQpsU2WXdSc2buDcfwB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

1. Get poky & meta-arm=C2=A0langdale branch.
2. Enable meta-arm-toolchain
3. In local.conf configure

MACHINE ?=3D "qemuarm"
TCMODE =3D "external-arm"
EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/../arm-gnu-toolchain-11.3.rel1-x86_64-arm=
-none-linux-gnueabihf"

and get and extract toolchain from ARM website.

Building recipe which uses CMake build system fails with

The CMAKE_C_COMPILER:

arm-none-linux-gnueabihf-gcc

is not a full path and was not found in the PATH.

--irQpsU2WXdSc2buDcfwB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

1. Get poky &amp; meta-arm&nbsp;langdale branch.<br />2. Enable meta-arm-to=
olchain<br />3. In local.conf configure<br />
<div><br />
<div>MACHINE ?=3D "qemuarm"</div>
TCMODE =3D "external-arm"</div>
<div>EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/../arm-gnu-toolchain-11.3.rel1-x86_6=
4-arm-none-linux-gnueabihf"</div>
<div>&nbsp;</div>
and get and extract toolchain from ARM website.<br /><br />Building recipe =
which uses CMake build system fails with<br />
<div><br />&nbsp; &nbsp;The CMAKE_C_COMPILER:</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp;arm-none-linux-gnueabihf-gcc</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp;is not a full path and was not found in the PATH.</div>
<div>&nbsp;</div>

--irQpsU2WXdSc2buDcfwB--

