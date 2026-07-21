Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EDFC4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 20:02:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32501.1784664119940997034
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 13:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 288CC40CB1;
	Tue, 21 Jul 2026 20:01:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9UubK02cpjhe; Tue, 21 Jul 2026 20:01:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D628C40BD6;
	Tue, 21 Jul 2026 20:01:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8C3431769F1; Tue, 21 Jul 2026 16:01:56 -0400 (EDT)
Date: Tue, 21 Jul 2026 16:01:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: JPEWhacker@gmail.com
Cc: ross.burton@arm.com, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] recipes: port LICENSE to SPDX
Message-ID: <20260721200156.GS10186@denix.org>
References: <20260721130159.558910-1-ross.burton@arm.com>
 <CAJdd5GYn6LKUOiA+ZXzRL_V+EB0im6OcQUs5t98yskJ-1hRzXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJdd5GYn6LKUOiA+ZXzRL_V+EB0im6OcQUs5t98yskJ-1hRzXA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2026 20:02:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7123

On Tue, Jul 21, 2026 at 01:58:49PM -0600, Joshua Watt via lists.yoctoproj=
ect.org wrote:
> On Tue, Jul 21, 2026 at 7:02=E2=80=AFAM Ross Burton via lists.yoctoproj=
ect.org
> <ross.burton=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> > openembedded-core now parses the LICENSE field as a SPDX license
> > expression[1], so convert the license statements.
> >
> > This is mostly replacing "&" with "AND", but we can also use "WITH" i=
n
> > the GCC recipes.
> >
> > [1] oe-core e9d424738d6 ("classes/conf/lib: Parse LICENSE as SPDX
> > Expression")
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb | 2 =
+-
> >  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2.inc  | 2 =
+-
> >  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2.inc  | 2 =
+-
> >  .../external-arm-toolchain/gcc-aarch64-none-elf_15.3.rel1.bb    | 2 =
+-
> >  .../external-arm-toolchain/gcc-arm-none-eabi_15.3.rel1.bb       | 2 =
+-
> >  meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb                  | 2 =
+-
> >  meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc              | 2 =
+-
> >  meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb    | 2 =
+-
> >  meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb    | 2 =
+-
> >  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 2 =
+-
> >  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.2.bb | 2 =
+-
> >  .../trusted-firmware-m/trusted-firmware-m-2.2.2-src.inc         | 2 =
+-
> >  .../trusted-firmware-m/trusted-firmware-m-2.3.0-src.inc         | 2 =
+-
> >  .../trusted-firmware-m/trusted-firmware-m-git-src.inc           | 2 =
+-
> >  .../trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb          | 2 =
+-
> >  meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb                     | 2 =
+-
> >  meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb        | 2 =
+-
> >  meta-arm/recipes-devtools/fvp/fvp-common.inc                    | 2 =
+-
> >  meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb    | 2 =
+-
> >  meta-arm/recipes-security/optee/optee-test.inc                  | 2 =
+-
> >  .../recipes-security/trusted-services/trusted-services-src.inc  | 2 =
+-
> >  meta-arm/recipes-security/trusted-services/trusted-services.inc | 2 =
+-
> >  22 files changed, 22 insertions(+), 22 deletions(-)
> >
> > diff --git a/meta-arm-bsp/recipes-bsp/external-system/
> > external-system_git.bb b/meta-arm-bsp/recipes-bsp/external-system/
> > external-system_git.bb
> > index ede5b80a76..87a8a34886 100644
> > --- a/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
> > +++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
> > @@ -4,7 +4,7 @@ DESCRIPTION =3D "Firmware to be loaded and run in Ext=
ernal
> > System Harness in\
> >  HOMEPAGE =3D "
> > https://git.linaro.org/landing-teams/working/arm/external-system.git"
> >  DEPENDS =3D "gcc-arm-none-eabi-native"
> >  INHIBIT_DEFAULT_DEPS =3D "1"
> > -LICENSE =3D "BSD-3-Clause & Apache-2.0"
> > +LICENSE =3D "Apache-2.0 AND BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De44b2531cd6ffe9dece394dbe=
988d9a0 \
> >
> >  file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4b21ef20c29e"
> >
> > diff --git
> > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2=
.inc
> > b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2=
.inc
> > index d761a7ae63..c86d4a584e 100644
> > ---
> > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2=
.inc
> > +++
> > b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2=
.inc
> > @@ -38,7 +38,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
> >  # add MBEDTLS to our sources if activated
> >  SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1',
> > '${SRC_URI_MBEDTLS}', '', d)}"
> >  # Update license variables
> > -LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' &
> > Apache-2.0', '', d)}"
> > +LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' AND
> > Apache-2.0', '', d)}"
> >  LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1'=
, '
> > ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
> >  # add mbed TLS to version
> >  SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1',
> > '_mbedtls', '', d)}"
> > diff --git
> > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2=
.inc
> > b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2=
.inc
> > index 8010c523e1..408185e388 100644
> > ---
> > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2=
.inc
> > +++
> > b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2=
.inc
> > @@ -38,7 +38,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
> >  # add MBEDTLS to our sources if activated
> >  SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1',
> > '${SRC_URI_MBEDTLS}', '', d)}"
> >  # Update license variables
> > -LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' &
> > Apache-2.0', '', d)}"
> > +LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' AND
> > Apache-2.0', '', d)}"
> >  LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1'=
, '
> > ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
> >  # add mbed TLS to version
> >  SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1',
> > '_mbedtls', '', d)}"
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/
> > gcc-aarch64-none-elf_15.3.rel1.bb
> > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> > gcc-aarch64-none-elf_15.3.rel1.bb
> > index 447db59cd4..05d6a9f952 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> > gcc-aarch64-none-elf_15.3.rel1.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> > gcc-aarch64-none-elf_15.3.rel1.bb
> > @@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
> >  COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
> >
> >  SUMMARY =3D "Arm GNU Toolchain - AArch64 bare-metal target
> > (aarch64-none-elf)"
> > -LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > +LICENSE =3D "GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exceptio=
n-3.1"
> >
>=20
> Per discussion, this should be "GPL-3.0-only AND GPL-3.0-or-later WITH
> GCC-exception-3.1"

Was exactly my point.


> Ross, did the script auto change this one or did you hand edit it?

The script doesn't change this and I know it for a fact, as I had to make=
 a=20
similar manual change and was quite confused by Ross' change, which didn'=
t=20
look right to me.


> >  LIC_FILES_CHKSUM:aarch64 =3D
> > "file://share/doc/gcc/Copying.html;md5=3D90014a59d1783b37a10240d4d000=
2c6e"
> >  LIC_FILES_CHKSUM:x86-64 =3D
> > "file://share/doc/gcc/Copying.html;md5=3D90014a59d1783b37a10240d4d000=
2c6e"
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/
> > gcc-arm-none-eabi_15.3.rel1.bb
> > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> > gcc-arm-none-eabi_15.3.rel1.bb
> > index 70a3a37289..db7a5dffa2 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> > gcc-arm-none-eabi_15.3.rel1.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/
> > gcc-arm-none-eabi_15.3.rel1.bb
> > @@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
> >  COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
> >
> >  SUMMARY =3D "Arm GNU Toolchain - AArch32 bare-metal target (arm-none=
-eabi)"
> > -LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > +LICENSE =3D "GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exceptio=
n-3.1"
> >
> >  LIC_FILES_CHKSUM:aarch64 =3D
> > "file://share/doc/gcc/Copying.html;md5=3D90014a59d1783b37a10240d4d000=
2c6e"
> >  LIC_FILES_CHKSUM:x86-64 =3D
> > "file://share/doc/gcc/Copying.html;md5=3D90014a59d1783b37a10240d4d000=
2c6e"
> > diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
> > b/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
> > index f8a374b7f0..0dfa2dace6 100644
> > --- a/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
> > +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
> > @@ -2,7 +2,7 @@ SUMMARY =3D "Hafnium"
> >  DESCRIPTION =3D "A reference Secure Partition Manager (SPM) for syst=
ems
> > that implement the Armv8.4-A Secure-EL2 extension"
> >  DEPENDS =3D "gn-native ninja-native bison-native bc-native dtc-nativ=
e
> > openssl-native clang-native lld-native"
> >
> > -LICENSE =3D "BSD-3-Clause & GPL-2.0-only"
> > +LICENSE =3D "BSD-3-Clause AND GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D782b40c14bad5294672c50050=
1edc103"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > index 032445b3bd..495b0f2905 100644
> > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > @@ -2,7 +2,7 @@ SUMMARY =3D "SCP and MCP Firmware"
> >  DESCRIPTION =3D "Firmware for SCP and MCP software reference impleme=
ntation"
> >  HOMEPAGE =3D "https://gitlab.arm.com/firmware/SCP-firmware"
> >
> > -LICENSE =3D "BSD-3-Clause & Apache-2.0"
> > +LICENSE =3D "Apache-2.0 AND BSD-3-Clause"
> >  LIC_FILES_CHKSUM =3D
> > "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d9300a6c3d15101b197=
31 \
> >
> >  file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88d0a364313df4b21e=
f20c29e"
> >
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.=
0.bb
> > b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
> > index a65106f24e..e876bd1eaa 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
> > @@ -1,5 +1,5 @@
> >  DESCRIPTION =3D "Trusted Firmware-A tests(aka TFTF)"
> > -LICENSE =3D "BSD-3-Clause & NCSA"
> > +LICENSE =3D "BSD-3-Clause AND NCSA"
> >
> >  LIC_FILES_CHKSUM +=3D
> > "file://docs/license.rst;md5=3D6175cc0aa2e63b6d21a32aa0ee7d1b4a"
> >
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.=
0.bb
> > b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
> > index 8bd5dd5643..17951766e1 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
> > @@ -1,5 +1,5 @@
> >  DESCRIPTION =3D "Trusted Firmware-A tests(aka TFTF)"
> > -LICENSE =3D "BSD-3-Clause & NCSA"
> > +LICENSE =3D "BSD-3-Clause AND NCSA"
> >
> >  LIC_FILES_CHKSUM +=3D
> > "file://docs/license.rst;md5=3D6175cc0aa2e63b6d21a32aa0ee7d1b4a"
> >
> > diff --git
> > a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index 211196b5f8..1e06559ce2 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Trusted Firmware-A"
> >  HOMEPAGE =3D "https://trustedfirmware-a.readthedocs.io/"
> > -LICENSE =3D "BSD-2-Clause & BSD-3-Clause & MIT & Apache-2.0"
> > +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT"
> >
> >  inherit firmware
> >
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/
> > trusted-firmware-a_2.14.2.bb b/meta-arm/recipes-bsp/trusted-firmware-=
a/
> > trusted-firmware-a_2.14.2.bb
> > index 3d0b80188e..9c70d0b581 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14=
.2.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14=
.2.bb
> > @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
> >  # add MBEDTLS to our sources if activated
> >  SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1',
> > '${SRC_URI_MBEDTLS}', '', d)}"
> >  # Update license variables
> > -LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' &
> > Apache-2.0', '', d)}"
> > +LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' AND
> > Apache-2.0', '', d)}"
> >  LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1'=
, '
> > ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
> >  # add mbed TLS to version
> >  SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1',
> > '_mbedtls', '', d)}"
> > diff --git
> > a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
> > b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
> > index ddaab88e8b..8fb0265e94 100644
> > ---
> > a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
> > +++
> > b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
> > @@ -1,6 +1,6 @@
> >  # Common src definitions for trusted-firmware-m and
> > trusted-firmware-m-scripts
> >
> > -LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
> > +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
> >
> >  LIC_FILES_CHKSUM =3D
> > "file://license.rst;md5=3D07f368487da347f3c7bd0fc3085f3afa \
> >
> >  file://external/tf-m-tests/license.rst;md5=3D4481bae2221b0cfca76a69f=
b3411f390
> > \
> > diff --git
> > a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-sr=
c.inc
> > b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-sr=
c.inc
> > index d3ab29d0e2..4ed6d8cb80 100644
> > ---
> > a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-sr=
c.inc
> > +++
> > b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-sr=
c.inc
> > @@ -1,6 +1,6 @@
> >  # Common src definitions for trusted-firmware-m and
> > trusted-firmware-m-scripts
> >
> > -LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
> > +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
> >
> >  LIC_FILES_CHKSUM =3D
> > "file://license.rst;md5=3D002a64dec64b82c58a203a94bee7b2a1 \
> >
> >  file://external/tf-m-tests/license.rst;md5=3D4481bae2221b0cfca76a69f=
b3411f390
> > \
> > diff --git
> > a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
> > b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
> > index 7bea317cf3..ffc6200e77 100644
> > ---
> > a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
> > +++
> > b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
> > @@ -1,6 +1,6 @@
> >  # Common src definitions for trusted-firmware-m and
> > trusted-firmware-m-scripts
> >
> > -LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
> > +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
> >
> >  LIC_FILES_CHKSUM =3D
> > "file://license.rst;md5=3D07f368487da347f3c7bd0fc3085f3afa \
> >
> >  file://external/tf-m-tests/license.rst;md5=3D4481bae2221b0cfca76a69f=
b3411f390
> > \
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/
> > trusted-firmware-rmm_0.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware=
-rmm/
> > trusted-firmware-rmm_0.6.0.bb
> > index 60558b6bca..43585982e9 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-rmm/
> > trusted-firmware-rmm_0.6.0.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/
> > trusted-firmware-rmm_0.6.0.bb
> > @@ -1,6 +1,6 @@
> >  SUMMARY =3D "RMM Firmware"
> >  DESCRIPTION =3D "RMM Firmware for Arm reference platforms"
> > -LICENSE =3D "BSD-3-Clause & MIT"
> > +LICENSE =3D "BSD-3-Clause AND MIT"
> >
> >  SRC_URI =3D "gitsm://
> > git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=3Dhttps;branch=3Dm=
ain"
> >  SRCREV =3D "7f6bc132caef3596fbb88d3a419c2a3cb499cde2"
> > diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
> > b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
> > index 6d4422f99a..1c4753cbb2 100644
> > --- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
> > +++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
> > @@ -1,7 +1,7 @@
> >  require recipes-bsp/uefi/edk2-firmware_202605.bb
> >  PROVIDES:remove =3D "virtual/bootloader"
> >
> > -LICENSE +=3D "& Apache-2.0"
> > +LICENSE +=3D "AND Apache-2.0"
> >  LIC_FILES_CHKSUM +=3D
> > "file://ShellPkg/Application/sbsa-acs/LICENSE.md;md5=3D2a944942e1496a=
f1886903d274dedb13"
> >
> >  SRC_URI +=3D "git://
> > github.com/ARM-software/sbsa-acs;destsuffix=3Dedk2/ShellPkg/Applicati=
on/sbsa-acs;protocol=3Dhttps;branch=3Dmaster;name=3Dacs
> > \
> > diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
> > b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
> > index 3c41d05c54..3a4789c57f 100644
> > --- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
> > +++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
> > @@ -1,6 +1,6 @@
> >  require fvp-envelope.inc
> >
> > -LICENSE:append =3D " & Artistic-2.0 & BSL-1.0 & BSD-2-Clause & Unlic=
ense"
> > +LICENSE:append =3D " AND Artistic-2.0 AND BSL-1.0 AND BSD-2-Clause A=
ND
> > Unlicense"
> >
> >  SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architect=
ure
> > Envelope Model FVP"
> >  LIC_FILES_CHKSUM =3D
> > "file://license_terms/license_agreement.txt;md5=3D1a33828e132ba71861c=
11688dbb0bd16
> > \
> > diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc
> > b/meta-arm/recipes-devtools/fvp/fvp-common.inc
> > index 5d87cef783..5059985563 100644
> > --- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
> > +++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
> > @@ -1,7 +1,7 @@
> >  HOMEPAGE =3D "
> > https://developer.arm.com/tools-and-software/simulation-models/fixed-=
virtual-platforms
> > "
> >
> >  LICENSE_FLAGS =3D "Arm-FVP-EULA"
> > -LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 &
> > GPL-3.0-with-GCC-exception & Zlib & NCSA & LGPL-2.0-or-later & MIT &
> > BSD-3-Clause"
> > +LICENSE =3D "Apache-2.0 AND BSD-3-Clause AND GPL-3.0-or-later WITH
> > GCC-exception-3.1 AND LGPL-2.0-or-later AND MIT AND NCSA AND Python-2=
.0 AND
> > Zlib AND LicenseRef-Proprietary"
> >
> >  # FVP has an End User License Agreement. Add Arm-FVP-EULA to
> >  # LICENSE_FLAGS_ACCEPTED if the EULA has been accepted, so it can
> > diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.=
0.bb
> > b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> > index ffd308fa95..84681b1585 100644
> > --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> > +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
> > @@ -8,7 +8,7 @@ HOMEPAGE =3D "https://github.com/ARM-software/gator"
> >  # configuration requirement specified here:
> >  # https://github.com/ARM-software/gator#kernel-configuration
> >
> > -LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
> > +LICENSE =3D "Apache-2.0 AND GPL-2.0-only AND LGPL-2.1-or-later"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263 \
> >
> >  file://libsensors/COPYING.LGPL;md5=3D4fbd65380cdd255951079008b364516=
c \
> >
> >  file://mxml/LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327 \
> > diff --git a/meta-arm/recipes-security/optee/optee-test.inc
> > b/meta-arm/recipes-security/optee/optee-test.inc
> > index bb9471bf88..8786d1bb5a 100644
> > --- a/meta-arm/recipes-security/optee/optee-test.inc
> > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> > @@ -2,7 +2,7 @@ SUMMARY =3D "OP-TEE sanity testsuite"
> >  DESCRIPTION =3D "Open Portable Trusted Execution Environment - Test =
suite"
> >  HOMEPAGE =3D "https://www.op-tee.org/"
> >
> > -LICENSE =3D "BSD-2-Clause & GPL-2.0-only"
> > +LICENSE =3D "BSD-2-Clause AND GPL-2.0-only"
> >
> >  inherit python3native ptest
> >  inherit deploy
> > diff --git
> > a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> > b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
> > index 22cc76ef25..2519b4c297 100644
> > --- a/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
> > +++ b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
> > @@ -1,6 +1,6 @@
> >  # Define sources of Trusted Service and all external dependencies
> >
> > -LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Zlib"
> > +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND Zlib"
> >
> >
> >  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
> > diff --git
> > a/meta-arm/recipes-security/trusted-services/trusted-services.inc
> > b/meta-arm/recipes-security/trusted-services/trusted-services.inc
> > index bdfccc48fd..c40d70bf8a 100644
> > --- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
> > +++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
> > @@ -1,7 +1,7 @@
> >  SUMMARY ?=3D "The Trusted Services: framework for developing root-of=
-trust
> > services"
> >  HOMEPAGE =3D "https://trusted-services.readthedocs.io/en/latest/inde=
x.html"
> >
> > -LICENSE =3D "Apache-2.0 & BSD-3-Clause & Zlib"
> > +LICENSE =3D "Apache-2.0 AND BSD-3-Clause AND Zlib"
> >
> >  inherit python3native cmake pkgconfig
> >
> > --
> > 2.43.0

