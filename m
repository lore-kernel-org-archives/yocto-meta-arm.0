Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C87C77B7C
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 18:40:20 +0000 (UTC)
Subject: Re: external-arm-toolchain is not compatible with CMake
To: meta-arm@lists.yoctoproject.org
From: "Vasyl Vavrychuk" <vvavrychuk@gmail.com>
X-Originating-Location: Lviv, Lviv Oblast, UA (178.136.122.186)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 01 May 2023 11:40:10 -0700
References: <CDCFE884-083F-4762-B56E-46B25D3EB948@arm.com>
In-Reply-To: <CDCFE884-083F-4762-B56E-46B25D3EB948@arm.com>
Message-ID: <5976.1682966410299697211@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="CD3xYTLcb1rGoMLdpIas"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 May 2023 18:40:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4630

--CD3xYTLcb1rGoMLdpIas
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I've found that this issue is reproduced only if=C2=A0EXTERNAL_TOOLCHAIN is=
 set to a path relative to ${TOPDIR} and outside of it.

Reproducing steps:

git clone -b langdale https://github.com/jonmason/meta-arm.git
cd meta-arm

Apply change:

diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
index 2af8b5e8..fed1eb8c 100644
--- a/ci/external-gccarm.yml
+++ b/ci/external-gccarm.yml
@@ -5,4 +5,4 @@ local_conf_header:
cc: |
SKIP_RECIPE[gcc-cross-arm] =3D "Using external toolchain"
TCMODE =3D "external-arm"
-=C2=A0 =C2=A0 EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/toolchains/${TARGET_ARCH}"
+=C2=A0 =C2=A0 EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/../toolchains/${TARGET_ARC=
H}"

And run:

ci/get-binary-toolchains ~/downloads/ $PWD/toolchains toolchains
kas checkout ci/fvp-base-arm32.yml:ci/external-gccarm.yml
source poky/oe-init-build-env
bitbake libcomps

--CD3xYTLcb1rGoMLdpIas
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I've found that this issue is reproduced only if&nbsp;EXTERNAL_TOOLCHAIN is=
 set to a path relative to ${TOPDIR} and outside of it.<br /><br />Reproduc=
ing steps:<br />
<div><br />git clone -b langdale https://github.com/jonmason/meta-arm.git</=
div>
<div>cd meta-arm</div>
<div><br />Apply change:<br /><br />
<div>diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml</div>
<div>index 2af8b5e8..fed1eb8c 100644</div>
<div>--- a/ci/external-gccarm.yml</div>
<div>+++ b/ci/external-gccarm.yml</div>
<div>@@ -5,4 +5,4 @@ local_conf_header:</div>
<div>&nbsp; &nbsp;cc: |</div>
<div>&nbsp; &nbsp; &nbsp;SKIP_RECIPE[gcc-cross-arm] =3D "Using external too=
lchain"</div>
<div>&nbsp; &nbsp; &nbsp;TCMODE =3D "external-arm"</div>
<div>-&nbsp; &nbsp; EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/toolchains/${TARGET_A=
RCH}"</div>
<div>+&nbsp; &nbsp; EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/../toolchains/${TARGE=
T_ARCH}"</div>
<div><br />And run:<br /><br /></div>
</div>
<div>ci/get-binary-toolchains ~/downloads/ $PWD/toolchains toolchains</div>
<div>kas checkout ci/fvp-base-arm32.yml:ci/external-gccarm.yml</div>
<div>source poky/oe-init-build-env</div>
<div>bitbake libcomps</div>
<div>&nbsp;</div>

--CD3xYTLcb1rGoMLdpIas--

