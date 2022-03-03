Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26A3C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 23:38:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.1229.1646350679602076338
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 15:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7DD3C40C1E;
	Thu,  3 Mar 2022 23:37:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qwMiEhWEKP4; Thu,  3 Mar 2022 23:37:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 306E6407FE;
	Thu,  3 Mar 2022 23:37:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E34211747C6; Thu,  3 Mar 2022 18:37:49 -0500 (EST)
Date: Thu, 3 Mar 2022 18:37:49 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Sumit Garg <sumit.garg@linaro.org>, Jon Mason <jdmason@kudzu.us>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Vishnu Banavath <Vishnu.Banavath@arm.com>,
	Maxim Uvarov <maxim.uvarov@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Drew Reed <Drew.Reed@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Message-ID: <20220303233749.GP1766@denix.org>
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
 <Yh5JYWMmAd6SnmOS@kudzu.us>
 <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
 <Yh+DX8uaoS1VPpQ8@kudzu.us>
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
 <5d1418bf-6879-237d-7bc7-e7a1ff0024b0@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <5d1418bf-6879-237d-7bc7-e7a1ff0024b0@linux.microsoft.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 23:38:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3106

On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego w=
rote:
>=20
> On 3/3/22 10:55, Abdellatif El Khlifi wrote:
> >Hello,
> >
> >I suggest the following:
> >
> >In meta-arm-bsp/conf/layer.conf add :
> >
> >LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D "
> >meta-python openembedded-layer"
>=20
>=20
> This statement is a little confusing (to me), please correct me if
> I'm wrong, but you're saying
>=20
> we should set a dependency from meta-arm-bsp layer, only for
> qemuarm64-secureboot,
>=20
> however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-=
bsp,
>=20
> AFAIC meta-arm-bsp has now knowledge of its existence, in fact
> there's no other mention of
>=20
> qemuarm64-secureboot in meta-arm-bsp.

Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending o=
n=20
meta-arm, not meta-arm-bsp.

Depending on python3-cryptography which is only available in meta-python =
(part=20
of meta-openembedded) should be avoided. Back in the day we pushed for mo=
ving=20
other python3 dependencies like pycryptodome and pyelftools into OE-Core:

https://git.openembedded.org/meta-openembedded/commit/?id=3Da8f3c00d8d113=
b46a49584682e10435157d516ca
https://git.yoctoproject.org/meta-arm/commit/?id=3Df2069723f27d9229e8ec74=
263a41160c8df32571

We could try doing the same with this new python3-cryptography dependecy =
and=20
propose moving it to OE-Core. Alternatively, consider adding it to meta-a=
rm?=20
Not ideal, but meta-arm-bsp briefly carried alternative/older version rec=
ently:

https://git.yoctoproject.org/meta-arm/commit/?id=3Da15c16068ab011e2ba91a6=
c4ca6e1251de0d8058

--=20
Denys


> Cheers,
>=20
>=20
> Alejandro
>=20
> >
> >In ci/qemuarm64-secureboot.yml add:
> >
> >ci/meta-openembedded.yml
> >
> >Kind regards
> >----------------------------------------------------------------------=
--
> >*From:* Sumit Garg <sumit.garg@linaro.org>
> >*Sent:* 03 March 2022 05:31
> >*To:* Jon Mason <jdmason@kudzu.us>; Alejandro Hernandez
> ><alhe@linux.microsoft.com>
> >*Cc:* meta-arm@lists.yoctoproject.org
> ><meta-arm@lists.yoctoproject.org>; Vishnu Banavath
> ><Vishnu.Banavath@arm.com>; Maxim Uvarov <maxim.uvarov@linaro.org>;
> >Peter Griffin <peter.griffin@linaro.org>; Denys Dmytriyenko
> ><denis@denix.org>; Drew Reed <Drew.Reed@arm.com>; Abdellatif El
> >Khlifi <Abdellatif.ElKhlifi@arm.com>
> >*Subject:* Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
> >On Wed, 2 Mar 2022 at 20:16, Jon Mason <jdmason@kudzu.us> wrote:
> >>
> >> On Tue, Mar 01, 2022 at 09:54:04PM +0000, Alejandro Hernandez wrote:
> >> > Hi John,
> >> >
> >> > On 3/1/22 16:27, Jon Mason wrote:
> >> > > On Fri, Feb 25, 2022 at 08:04:41PM -0700, Alejandro Enedino
> >Hernandez Samaniego wrote:
> >> > > > - Removes upstreamed patches for optee-examples
> >> > > > - Fixes optee-examples installation
> >> > > > - Includes new python3-cryptography dependency
> >> > > > - Fixes python3-cryptography to work with openssl
> >> > > >
> >> > > > Tested on qemuarm64-secureboot via optee-examples xtest -l 15
> >> > > With the new changes in python3-crypto, this is no longer workin=
g.
> >> > > I'm seeing the following error in CI.
> >> > >
> >> > > --- Error summary ---
> >> > > ERROR: Nothing PROVIDES 'python3-cryptography-native' (but /buil=
ds/jonmason00/meta-arm/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> >DEPENDS on or otherwise requires it). Close matches:
> >> > >=A0=A0=A0 python3-cython-native
> >> > >=A0=A0=A0 python3-pycryptodome-native
> >> > >=A0=A0=A0 python3-typogrify-native
> >> > >
> >> > > I _think_ that adding meta-openembedded.yml being adding to the
> >> > > machines should fix it, but I'm not sure that is the right solut=
ion.
> >> > >
> >> > > Thanks,
> >> > > Jon
> >> >
> >> > My apologies, I was testing with meta-oe/meta-python enabled
> >hence I didnt
> >> > see the error before.
> >> >
> >> >
> >> > I'm not sure its the right solution either, this dependency is
> >coming from
> >> > the pem_to_pub_c.py script which is now using
> >python3-cyrptography since
> >> > commit https://github.com/OP-TEE/optee_os/commit/169eac19852d98d8a=
de821f913bbdd76faf52823
> >> > (this also means we could remove python3-cryptodome from the
> >dependencies as
> >> > well), as far as I can tell this creates a hard dependency, passin=
g
> >> > EXTRA_OEMAKE +=3D " CFG_WITH_USER_TA=3Dn" would avoid executing th=
e script
> >> > completely but I also dont think thats what we want.
> >> >
> >> > Should we include meta-openembedded.yml?,=A0 or what other
> >choice do we have?
> >> > create a python3-cyrptography recipe to meta-arm?, thoughts?
> >
> >Yes, we should include meta-openembedded.yml as a dependency and
> >remove python3-cryptodome from the dependencies.
> >
> >-Sumit
> >
> >>
> >> OPTEE isn't an area I understand well (to know whether removing this
> >> is superior to adding the dependency in the files). So, I'm directly
> >> cc'ing contributors that I think will have an opinion to this
> >> response.
> >>
> >> Thanks,
> >> Jon
> >>
> >> >
> >> > Cheers,
> >> >
> >> > Alejandro
> >> >
> >> > > > Signed-off-by: Alejandro Enedino Hernandez
> >Samaniego<alhe@linux.microsoft.com>
> >> > > > ---
> >> > > >=A0=A0 ....bbappend =3D> optee-client_3.16.0.bbappend} |=A0 0
> >> > > >=A0=A0 ...pend =3D> optee-os-tadevkit_3.16.0.bbappend} |=A0 0
> >> > > >=A0=A0 ...14.0.bbappend =3D> optee-os_3.16.0.bbappend} |=A0 0
> >> > > >=A0=A0 ....0.bbappend =3D> optee-test_3.16.0.bbappend} |=A0 0
> >> > > > .../optee-ftpm/optee-ftpm_git.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 8 +-
> >> > > > .../optee/optee-client_3.14.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 3 -
> >> > > > .../optee/optee-client_3.16.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 3 +
> >> > > > .../recipes-security/optee/optee-examples.inc |=A0 7 +-
> >> > > > ...ix-non-portable-sh-check-for-plugins.patch | 46 ++++++++++
> >> > > > ...efault-cross-compiler-environment-se.patch | 84
> >-------------------
> >> > > > ...nable-plugins-installation-in-rootfs.patch | 37 --------
> >> > > > .../optee/optee-examples_3.14.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 4 -
> >> > > > .../optee/optee-examples_3.16.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 3 +
> >> > > >=A0=A0 ..._3.14.0.bb =3D> optee-os-tadevkit_3.16.0.bb} |=A0 3 +=
-
> >> > > > meta-arm/recipes-security/optee/optee-os.inc=A0 |=A0 2 +-
> >> > > >=A0=A0 ...{optee-os_3.14.0.bb =3D> optee-os_3.16.0.bb} |=A0 2 +=
-
> >> > > > .../recipes-security/optee/optee-test.inc=A0=A0=A0=A0 |=A0 2 +=
-
> >> > > > .../optee/optee-test_3.14.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 3 -
> >> > > > .../optee/optee-test_3.16.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 3 +
> >> > > > meta-arm/recipes-security/optee/optee.inc=A0=A0=A0=A0 |=A0 3 +
> >> > > >=A0=A0 20 files changed, 73 insertions(+), 140 deletions(-)
> >> > > >=A0=A0 rename
> >meta-arm-bsp/recipes-security/optee/{optee-client_3.14.0.bbappend
> >=3D> optee-client_3.16.0.bbappend} (100%)
> >> > > >=A0=A0 rename meta-arm-bsp/recipes-security/optee/{optee-os-tad=
evkit_3.14.0.bbappend
> >=3D> optee-os-tadevkit_3.16.0.bbappend} (100%)
> >> > > >=A0=A0 rename
> >meta-arm-bsp/recipes-security/optee/{optee-os_3.14.0.bbappend =3D>
> >optee-os_3.16.0.bbappend} (100%)
> >> > > >=A0=A0 rename
> >meta-arm-bsp/recipes-security/optee/{optee-test_3.14.0.bbappend =3D>
> >optee-test_3.16.0.bbappend} (100%)
> >> > > >=A0=A0 delete mode 100644
> >meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> >> > > >=A0=A0 create mode 100644
> >meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> >> > > >=A0=A0 create mode 100644 meta-arm/recipes-security/optee/optee=
-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch
> >> > > >=A0=A0 delete mode 100644 meta-arm/recipes-security/optee/optee=
-examples/0001-plugins-Honour-default-cross-compiler-environment-se.patch
> >> > > >=A0=A0 delete mode 100644 meta-arm/recipes-security/optee/optee=
-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.patch
> >> > > >=A0=A0 delete mode 100644
> >meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> >> > > >=A0=A0 create mode 100644
> >meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> >> > > >=A0=A0 rename
> >meta-arm/recipes-security/optee/{optee-os-tadevkit_3.14.0.bb =3D>
> >optee-os-tadevkit_3.16.0.bb} (94%)
> >> > > >=A0=A0 rename
> >meta-arm/recipes-security/optee/{optee-os_3.14.0.bb =3D>
> >optee-os_3.16.0.bb} (76%)
> >> > > >=A0=A0 delete mode 100644
> >meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> >> > > >=A0=A0 create mode 100644
> >meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> >> > > >
> >> > > > diff --git
> >a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
> >b/meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappend
> >> > > > similarity index 100%
> >> > > > rename from
> >meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
> >> > > > rename to
> >meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappend
> >> > > > diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tade=
vkit_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadev=
kit_3.16.0.bbappend
> >> > > > similarity index 100%
> >> > > > rename from meta-arm-bsp/recipes-security/optee/optee-os-tadev=
kit_3.14.0.bbappend
> >> > > > rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevki=
t_3.16.0.bbappend
> >> > > > diff --git
> >a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
> >b/meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappend
> >> > > > similarity index 100%
> >> > > > rename from
> >meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
> >> > > > rename to
> >meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappend
> >> > > > diff --git
> >a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
> >b/meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
> >> > > > similarity index 100%
> >> > > > rename from
> >meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
> >> > > > rename to
> >meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> >b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> >> > > > index f2a74da..0eb64cd 100644
> >> > > > --- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> >> > > > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> >> > > > @@ -15,7 +15,9 @@ inherit deploy python3native
> >> > > >=A0=A0 LICENSE =3D "MIT"
> >> > > >=A0=A0 LIC_FILES_CHKSUM
> >=3D"file://${S}/LICENSE;md5=3D27e94c0280987ab296b0b8dd02ab9fe5
> ><file://${S}/LICENSE;md5=3D27e94c0280987ab296b0b8dd02ab9fe5>"
> >> > > > -DEPENDS =3D "python3-pycryptodome-native
> >python3-pycryptodomex-native python3-pyelftools-native
> >optee-os-tadevkit"
> >> > > > +DEPENDS =3D "python3-pycryptodome-native
> >python3-pycryptodomex-native python3-pyelftools-native
> >optee-os-tadevkit \
> >> > > > +=A0=A0=A0 python3-cryptography-native \
> >> > > > +=A0=A0=A0 "
> >> > > > FTPM_UUID=3D"bc50d971-d4c9-42c4-82cb-343fb7f37896"
> >> > > > @@ -48,6 +50,10 @@ EXTRA_OEMAKE:append:aarch64:qemuall =3D "\
> >> > > >=A0=A0=A0=A0=A0=A0 CFG_ARM64_ta_arm64=3Dy \
> >> > > >=A0=A0 "
> >> > > > +# python3-cryptography needs the legacy provider, so set
> >OPENSSL_MODULES to the
> >> > > > +# right path until this is relocated automatically.
> >> > > > +export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modul=
es"
> >> > > > +
> >> > > >=A0=A0 PARALLEL_MAKE =3D ""
> >> > > >=A0=A0 do_compile() {
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> >b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> >> > > > deleted file mode 100644
> >> > > > index be78b88..0000000
> >> > > > --- a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> >> > > > +++ /dev/null
> >> > > > @@ -1,3 +0,0 @@
> >> > > > -require optee-client.inc
> >> > > > -
> >> > > > -SRCREV =3D "06e1b32f6a7028e039c625b07cfc25fda0c17d53"
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> >b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> >> > > > new file mode 100644
> >> > > > index 0000000..4a36cbc
> >> > > > --- /dev/null
> >> > > > +++ b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> >> > > > @@ -0,0 +1,3 @@
> >> > > > +require optee-client.inc
> >> > > > +
> >> > > > +SRCREV =3D "06db73b3f3fdb8d23eceaedbc46c49c0b45fd1e2"
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee/optee-examples.inc
> >b/meta-arm/recipes-security/optee/optee-examples.inc
> >> > > > index 656722e..097f892 100644
> >> > > > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> >> > > > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> >> > > > @@ -5,16 +5,14 @@ HOMEPAGE
> >=3D"https://github.com/linaro-swg/optee_examples"
> >> > > >=A0=A0 LICENSE =3D "BSD-2-Clause"
> >> > > >=A0=A0 LIC_FILES_CHKSUM
> >=3D"file://LICENSE;md5=3Dcd95ab417e23b94f381dafc453d70c30
> ><file://LICENSE;md5=3Dcd95ab417e23b94f381dafc453d70c30>"
> >> > > > -DEPENDS =3D "optee-client optee-os-tadevkit
> >python3-pycryptodome-native"
> >> > > > +DEPENDS =3D "optee-client optee-os-tadevkit
> >python3-pycryptodome-native python3-cryptography-native"
> >> > > >=A0=A0 inherit python3native
> >> > > >=A0=A0 require optee.inc
> >> > > >=A0=A0 SRC_URI =3D "git://github.com/linaro-swg/optee_examples.=
git;branch=3Dmaster;protocol=3Dhttps
> >\
> >> > > > -file://0001-plugins-Honour-default-cross-compiler-environment=
-se.patch
> >\
> >> > > >
> >-file://0002-Makefile-Enable-plugins-installation-in-rootfs.patch
> >\
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> >> > > > +file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.pa=
tch"
> >> > > >=A0=A0 EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
> >> > > > HOST_CROSS_COMPILE=3D${HOST_PREFIX} \
> >> > > > @@ -25,6 +23,7 @@ EXTRA_OEMAKE +=3D
> >"TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
> >> > > >=A0=A0 S =3D "${WORKDIR}/git"
> >> > > >=A0=A0 B =3D "${WORKDIR}/build"
> >> > > > +
> >> > > >=A0=A0 do_compile() {
> >> > > >=A0=A0=A0=A0=A0=A0 oe_runmake -C ${S}
> >> > > >=A0=A0 }
> >> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/00=
01-Makefile-Fix-non-portable-sh-check-for-plugins.patch b/meta-arm/recipe=
s-security/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-f=
or-plugins.patch
> >> > > > new file mode 100644
> >> > > > index 0000000..70add62
> >> > > > --- /dev/null
> >> > > > +++ b/meta-arm/recipes-security/optee/optee-examples/0001-Make=
file-Fix-non-portable-sh-check-for-plugins.patch
> >> > > > @@ -0,0 +1,46 @@
> >> > > > +From 11610debf750f15c7a104db7315dcd7d69e282a8 Mon Sep 17
> >00:00:00 2001
> >> > > > +From: Alejandro Enedino Hernandez
> >Samaniego<alhe@linux.microsoft.com>
> >> > > > +Date: Sat, 26 Feb 2022 01:52:26 +0000
> >> > > > +Subject: [PATCH] Makefile: Fix non-portable sh check for plug=
ins
> >> > > > +
> >> > > > +Upstream-Status: Pending
> >> > > > +
> >> > > > +We previously held a patch that used "=3D" for comparison, bu=
t when
> >> > > > +that patch got upstreamed it was changed to "=3D=3D" which is
> >non-portable,
> >> > > > +resulting in an error:
> >> > > > +
> >> > > > +/bin/sh: 6: [: acipher: unexpected operator
> >> > > > +/bin/sh: 6: [: plugins: unexpected operator
> >> > > > +/bin/sh: 6: [: hello_world: unexpected operator
> >> > > > +/bin/sh: 6: [: hotp: unexpected operator
> >> > > > +/bin/sh: 6: [: aes: unexpected operator
> >> > > > +/bin/sh: 6: [: random: unexpected operator
> >> > > > +/bin/sh: 6: [: secure_storage: unexpected operator
> >> > > > +
> >> > > > +if /bin/sh doesnt point to bash.
> >> > > > +
> >> > > > +Which in turn causes our do_install task to fail since
> >plugins arent
> >> > > > +where we expect them to be.
> >> > > > +
> >> > > > +
> >> > > > +Signed-off-by: Alejandro Enedino Hernandez
> >Samaniego<alhe@linux.microsoft.com>
> >> > > > +---
> >> > > > + Makefile | 2 +-
> >> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> > > > +
> >> > > > +diff --git a/Makefile b/Makefile
> >> > > > +index b3f16aa..9359d95 100644
> >> > > > +--- a/Makefile
> >> > > > ++++ b/Makefile
> >> > > > +@@ -31,7 +31,7 @@ prepare-for-rootfs: examples
> >> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 cp -p
> >$$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
> >> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi; \
> >> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cp -pr $$exa=
mple/ta/*.ta $(OUTPUT_DIR)/ta/; \
> >> > > > +-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ $$example=
 =3D=3D plugins ]; then \
> >> > > > ++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ $$example=
 =3D plugins ]; then \
> >> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 cp -p plugins/syslog/*.plugin
> >$(OUTPUT_DIR)/plugins/; \
> >> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi; \
> >> > > > +=A0=A0=A0=A0=A0=A0=A0=A0 done
> >> > > > +--
> >> > > > +2.25.1
> >> > > > +
> >> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/00=
01-plugins-Honour-default-cross-compiler-environment-se.patch b/meta-arm/=
recipes-security/optee/optee-examples/0001-plugins-Honour-default-cross-c=
ompiler-environment-se.patch
> >> > > > deleted file mode 100644
> >> > > > index 033e48c..0000000
> >> > > > --- a/meta-arm/recipes-security/optee/optee-examples/0001-plug=
ins-Honour-default-cross-compiler-environment-se.patch
> >> > > > +++ /dev/null
> >> > > > @@ -1,84 +0,0 @@
> >> > > > -From 79c826c249001700007a6dffe80c3d61ff4428ef Mon Sep 17
> >00:00:00 2001
> >> > > > -From: Sumit Garg<sumit.garg@linaro.org>
> >> > > > -Date: Tue, 20 Jul 2021 13:54:30 +0530
> >> > > > -Subject: [PATCH 1/2] plugins: Honour default cross
> >compiler environment setup
> >> > > > -
> >> > > > -Honour default $(CC), $(CFLAGS) and $(LDFLAGS) variables.
> >Without this
> >> > > > -plugins example fails to build for OE/Yocto.
> >> > > > -
> >> > > > -Upstream-Status: Submitted
> >[https://github.com/linaro-swg/optee_examples/pull/87]
> >> > > > -
> >> > > > -Signed-off-by: Sumit Garg<sumit.garg@linaro.org>
> >> > > > ----
> >> > > > - plugins/Makefile=A0=A0=A0=A0=A0=A0=A0 |=A0 2 +-
> >> > > > - plugins/host/Makefile=A0=A0 |=A0 2 +-
> >> > > > - plugins/syslog/Makefile | 16 ++++++++++++----
> >> > > > - 3 files changed, 14 insertions(+), 6 deletions(-)
> >> > > > -
> >> > > > -diff --git a/plugins/Makefile b/plugins/Makefile
> >> > > > -index 2372b38..ea472b4 100644
> >> > > > ---- a/plugins/Makefile
> >> > > > -+++ b/plugins/Makefile
> >> > > > -@@ -8,7 +8,7 @@ TA_CROSS_COMPILE ?=3D $(CROSS_COMPILE)
> >> > > > - all:
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 $(MAKE) -C host
> >CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)" --no-builtin-variables
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 $(MAKE) -C ta
> >CROSS_COMPILE=3D"$(TA_CROSS_COMPILE)" LDFLAGS=3D""
> >> > > > --=A0=A0=A0=A0=A0=A0=A0 $(MAKE) -C syslog CROSS_COMPILE=3D"$(H=
OST_CROSS_COMPILE)"
> >> > > > -+=A0=A0=A0=A0=A0=A0=A0 $(MAKE) -C syslog
> >CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)" --no-builtin-variables
> >> > > > -
> >> > > > - .PHONY: clean
> >> > > > - clean:
> >> > > > -diff --git a/plugins/host/Makefile b/plugins/host/Makefile
> >> > > > -index 7285104..76244c7 100644
> >> > > > ---- a/plugins/host/Makefile
> >> > > > -+++ b/plugins/host/Makefile
> >> > > > -@@ -20,7 +20,7 @@ BINARY =3D optee_example_plugins
> >> > > > - all: $(BINARY)
> >> > > > -
> >> > > > - $(BINARY): $(OBJS)
> >> > > > --=A0=A0=A0=A0=A0=A0=A0 $(CC) -o $@ $< $(LDADD)
> >> > > > -+=A0=A0=A0=A0=A0=A0=A0 $(CC) $(LDFLAGS) -o $@ $< $(LDADD)
> >> > > > -
> >> > > > - .PHONY: clean
> >> > > > - clean:
> >> > > > -diff --git a/plugins/syslog/Makefile b/plugins/syslog/Makefil=
e
> >> > > > -index 62d916a..71f5f92 100644
> >> > > > ---- a/plugins/syslog/Makefile
> >> > > > -+++ b/plugins/syslog/Makefile
> >> > > > -@@ -1,3 +1,11 @@
> >> > > > -+CC=A0=A0=A0=A0=A0 ?=3D $(CROSS_COMPILE)gcc
> >> > > > -+LD=A0=A0=A0=A0=A0 ?=3D $(CROSS_COMPILE)ld
> >> > > > -+AR=A0=A0=A0=A0=A0 ?=3D $(CROSS_COMPILE)ar
> >> > > > -+NM=A0=A0=A0=A0=A0 ?=3D $(CROSS_COMPILE)nm
> >> > > > -+OBJCOPY ?=3D $(CROSS_COMPILE)objcopy
> >> > > > -+OBJDUMP ?=3D $(CROSS_COMPILE)objdump
> >> > > > -+READELF ?=3D $(CROSS_COMPILE)readelf
> >> > > > -+
> >> > > > - PLUGIN_UUID =3D 96bcf744-4f72-4866-bf1d-8634fd9c65e5
> >> > > > -
> >> > > > - PLUGIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D=
 $(PLUGIN_UUID).plugin
> >> > > > -@@ -6,17 +14,17 @@ PLUGIN_OBJ=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 =3D $(patsubst
> >%.c, %.o, $(PLUGIN_SRS))
> >> > > > - PLUGIN_INCLUDES_DIR=A0=A0=A0=A0 =3D $(CURDIR) $(TEEC_EXPORT)=
/include
> >> > > > -
> >> > > > - PLUGIN_INCLUDES=A0=A0=A0=A0=A0=A0=A0=A0 =3D $(addprefix -I,
> >$(PLUGIN_INCLUDES_DIR))
> >> > > > --PLUGIN_CCFLAGS=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D -Wall -fPIC
> >> > > > --PLUGIN_LDFLAGS=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D -shared
> >> > > > -+PLUGIN_CCFLAGS=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D $(CFLAGS) -Wal=
l -fPIC
> >> > > > -+PLUGIN_LDFLAGS=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D $(LDFLAGS) -sh=
ared
> >> > > > -
> >> > > > - .PHONY: all
> >> > > > - all: $(PLUGIN)
> >> > > > -
> >> > > > - $(PLUGIN): $(PLUGIN_OBJ)
> >> > > > --=A0=A0=A0=A0=A0=A0=A0 $(CROSS_COMPILE)gcc $(PLUGIN_LDFLAGS)
> >$(PLUGIN_OBJ) -o $@
> >> > > > -+=A0=A0=A0=A0=A0=A0=A0 $(CC) $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) =
-o $@
> >> > > > -
> >> > > > - %.o: %.c
> >> > > > --=A0=A0=A0=A0=A0=A0=A0 $(CROSS_COMPILE)gcc $(PLUGIN_CCFLAGS)
> >$(PLUGIN_INCLUDES) -c $*.c -o $*.o
> >> > > > -+=A0=A0=A0=A0=A0=A0=A0 $(CC) $(PLUGIN_CCFLAGS) $(PLUGIN_INCLU=
DES) -c
> >$*.c -o $*.o
> >> > > > -
> >> > > > - .PHONY: clean
> >> > > > - clean:
> >> > > > ---
> >> > > > -2.25.1
> >> > > > -
> >> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/00=
02-Makefile-Enable-plugins-installation-in-rootfs.patch b/meta-arm/recipe=
s-security/optee/optee-examples/0002-Makefile-Enable-plugins-installation=
-in-rootfs.patch
> >> > > > deleted file mode 100644
> >> > > > index 80e6b5f..0000000
> >> > > > --- a/meta-arm/recipes-security/optee/optee-examples/0002-Make=
file-Enable-plugins-installation-in-rootfs.patch
> >> > > > +++ /dev/null
> >> > > > @@ -1,37 +0,0 @@
> >> > > > -From f4e5e74548d92258855434b550c58fe44993c148 Mon Sep 17
> >00:00:00 2001
> >> > > > -From: Sumit Garg<sumit.garg@linaro.org>
> >> > > > -Date: Tue, 20 Jul 2021 14:20:10 +0530
> >> > > > -Subject: [PATCH] Makefile: Enable plugins installation in roo=
tfs
> >> > > > -
> >> > > > -Upstream-Status: Submitted
> >[https://github.com/linaro-swg/optee_examples/pull/87]
> >> > > > -
> >> > > > -Signed-off-by: Sumit Garg<sumit.garg@linaro.org>
> >> > > > -
> >> > > > ----
> >> > > > - Makefile | 5 +++++
> >> > > > - 1 file changed, 5 insertions(+)
> >> > > > -
> >> > > > -diff --git a/Makefile b/Makefile
> >> > > > -index a275842..9359d95 100644
> >> > > > ---- a/Makefile
> >> > > > -+++ b/Makefile
> >> > > > -@@ -25,14 +25,19 @@ prepare-for-rootfs: examples
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 @mkdir -p $(OUTPUT_DIR)
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 @mkdir -p $(OUTPUT_DIR)/ta
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 @mkdir -p $(OUTPUT_DIR)/ca
> >> > > > -+=A0=A0=A0=A0=A0=A0=A0 @mkdir -p $(OUTPUT_DIR)/plugins
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 @for example in $(EXAMPLE_LIST); do =
\
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ -e
> >$$example/host/optee_example_$$example ]; then \
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 cp -p
> >$$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi; \
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cp -pr $$exa=
mple/ta/*.ta $(OUTPUT_DIR)/ta/; \
> >> > > > -+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ $$example=
 =3D plugins ]; then \
> >> > > > -+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 cp -p plugins/syslog/*.plugin
> >$(OUTPUT_DIR)/plugins/; \
> >> > > > -+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi; \
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 done
> >> > > > -
> >> > > > - prepare-for-rootfs-clean:
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 @rm -rf $(OUTPUT_DIR)/ta
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 @rm -rf $(OUTPUT_DIR)/ca
> >> > > > -+=A0=A0=A0=A0=A0=A0=A0 @rm -rf $(OUTPUT_DIR)/plugins
> >> > > > -=A0=A0=A0=A0=A0=A0=A0=A0 @rmdir --ignore-fail-on-non-empty $(=
OUTPUT_DIR)
> >|| test ! -e $(OUTPUT_DIR)
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> >b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> >> > > > deleted file mode 100644
> >> > > > index f2b5f7d..0000000
> >> > > > --- a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> >> > > > +++ /dev/null
> >> > > > @@ -1,4 +0,0 @@
> >> > > > -require optee-examples.inc
> >> > > > -
> >> > > > -SRCREV =3D "e9c870525af8f7e7fccf575a0ca5394ce55adcec"
> >> > > > -
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> >b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> >> > > > new file mode 100644
> >> > > > index 0000000..b5f6269
> >> > > > --- /dev/null
> >> > > > +++ b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> >> > > > @@ -0,0 +1,3 @@
> >> > > > +require optee-examples.inc
> >> > > > +
> >> > > > +SRCREV =3D "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> >b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
> >> > > > similarity index 94%
> >> > > > rename from
> >meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> >> > > > rename to
> >meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
> >> > > > index 0d37a52..c710e27 100644
> >> > > > --- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0=
.bb
> >> > > > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0=
.bb
> >> > > > @@ -1,10 +1,11 @@
> >> > > >=A0=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os:"
> >> > > > -require optee-os_3.14.0.bb
> >> > > > +require optee-os_3.16.0.bb
> >> > > >=A0=A0 SUMMARY =3D "OP-TEE Trusted OS TA devkit"
> >> > > >=A0=A0 DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
> >> > > >=A0=A0 HOMEPAGE =3D"https://www.op-tee.org/"
> >> > > > +
> >> > > >=A0=A0 do_install() {
> >> > > >=A0=A0=A0=A0=A0=A0 #install TA devkit
> >> > > >=A0=A0=A0=A0=A0=A0 install -d ${D}${includedir}/optee/export-us=
er_ta/
> >> > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc
> >b/meta-arm/recipes-security/optee/optee-os.inc
> >> > > > index 1506a58..57c64fd 100644
> >> > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> >> > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> >> > > > @@ -10,7 +10,7 @@ require optee.inc
> >> > > >=A0=A0 CVE_PRODUCT =3D "linaro:op-tee op-tee:op-tee_os"
> >> > > > -DEPENDS =3D "python3-pycryptodome-native python3-pyelftools-n=
ative"
> >> > > > +DEPENDS =3D "python3-pycryptodome-native
> >python3-pyelftools-native python3-cryptography-native"
> >> > > >=A0=A0 DEPENDS:append:toolchain-clang =3D " compiler-rt"
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> >b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> >> > > > similarity index 76%
> >> > > > rename from meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> >> > > > rename to meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> >> > > > index 95d82bb..873e964 100644
> >> > > > --- a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> >> > > > +++ b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> >> > > > @@ -1,6 +1,6 @@
> >> > > >=A0=A0 require optee-os.inc
> >> > > > -SRCREV =3D "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
> >> > > > +SRCREV =3D "d0b742d1564834dac903f906168d7357063d5459"
> >> > > >=A0=A0 SRC_URI:append =3D " \
> >> > > > file://0006-allow-setting-sysroot-for-libgcc-lookup.patch
> ><file://0006-allow-setting-sysroot-for-libgcc-lookup.patch>=A0 \
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee/optee-test.inc
> >b/meta-arm/recipes-security/optee/optee-test.inc
> >> > > > index aada243..33eda29 100644
> >> > > > --- a/meta-arm/recipes-security/optee/optee-test.inc
> >> > > > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> >> > > > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM
> >=3D"file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940aab1315a4fa
> ><file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940aab1315a4fa>"
> >> > > >=A0=A0 inherit python3native ptest
> >> > > >=A0=A0 require optee.inc
> >> > > > -DEPENDS =3D "optee-client optee-os-tadevkit
> >python3-pycryptodome-native"
> >> > > > +DEPENDS =3D "optee-client optee-os-tadevkit
> >python3-pycryptodome-native python3-cryptography-native"
> >> > > >=A0=A0 SRC_URI =3D
> >"git://github.com/OP-TEE/optee_test.git;branch=3Dmaster;protocol=3Dhtt=
ps
> >\
> >> > > > file://run-ptest <file://run-ptest> \
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> >b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> >> > > > deleted file mode 100644
> >> > > > index 6367c27..0000000
> >> > > > --- a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> >> > > > +++ /dev/null
> >> > > > @@ -1,3 +0,0 @@
> >> > > > -require optee-test.inc
> >> > > > -
> >> > > > -SRCREV =3D "f2eb88affbb7f028561b4fd5cbd049d5d704f741"
> >> > > > diff --git
> >a/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> >b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> >> > > > new file mode 100644
> >> > > > index 0000000..03f9c34
> >> > > > --- /dev/null
> >> > > > +++ b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> >> > > > @@ -0,0 +1,3 @@
> >> > > > +require optee-test.inc
> >> > > > +
> >> > > > +SRCREV =3D "1cf0e6d2bdd1145370033d4e182634458528579d"
> >> > > > diff --git a/meta-arm/recipes-security/optee/optee.inc
> >b/meta-arm/recipes-security/optee/optee.inc
> >> > > > index f02a022..beae366 100644
> >> > > > --- a/meta-arm/recipes-security/optee/optee.inc
> >> > > > +++ b/meta-arm/recipes-security/optee/optee.inc
> >> > > > @@ -26,3 +26,6 @@ EXTRA_OEMAKE +=3D "V=3D1 \
> >> > > > OPTEE_CLIENT_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
> >> > > > TEEC_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
> >> > > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> >> > > > +# python3-cryptography needs the legacy provider, so set
> >OPENSSL_MODULES to the
> >> > > > +# right path until this is relocated automatically.
> >> > > > +export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modul=
es"
> >> > > > --
> >> > > > 2.25.1
> >> > > >
> >> > > >
> >> > > >
> >> > > >
> >> > > >

