Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403ACC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 21:11:34 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.16593.1646341892827389279
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 13:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=Ev9b+1M9;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.8.233] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0FC7620B7178;
	Thu,  3 Mar 2022 13:11:29 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0FC7620B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1646341892;
	bh=ygWKOGosecjL3qNl5xs0n6SKKDlvqbuhG+yCw6+txDQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ev9b+1M9rm1I2mAgbktR7+g7726Jqp+fEt43gs0/LmheKUAMFkTUaHCSwbEYrksIr
	 Qevv+LQWT0sac2BvaDfvoYc5noHIg6qUkdK9/dzyGtHNElcZpgHYTfMFFQ/nuU6lqF
	 LWaGZhNu1z+XNI613MCiqpBbH6GPV2CPcLesDH9U=
Content-Type: multipart/alternative;
 boundary="------------0FUxJR3lZLhIbe82myS8c0OG"
Message-ID: <5d1418bf-6879-237d-7bc7-e7a1ff0024b0@linux.microsoft.com>
Date: Thu, 3 Mar 2022 21:11:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Content-Language: en-US
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Sumit Garg <sumit.garg@linaro.org>, Jon Mason <jdmason@kudzu.us>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
 Vishnu Banavath <Vishnu.Banavath@arm.com>,
 Maxim Uvarov <maxim.uvarov@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Denys Dmytriyenko
 <denis@denix.org>, Drew Reed <Drew.Reed@arm.com>
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
 <Yh5JYWMmAd6SnmOS@kudzu.us>
 <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
 <Yh+DX8uaoS1VPpQ8@kudzu.us>
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: 
 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 21:11:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3105

This is a multi-part message in MIME format.
--------------0FUxJR3lZLhIbe82myS8c0OG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 3/3/22 10:55, Abdellatif El Khlifi wrote:
> Hello,
>
> I suggest the following:
>
> In meta-arm-bsp/conf/layer.conf add :
>
> LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D " meta-python=
=20
> openembedded-layer"


This statement is a little confusing (to me), please correct me if I'm=20
wrong, but you're saying

we should set a dependency from meta-arm-bsp layer, only for=20
qemuarm64-secureboot,

however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bs=
p,

AFAIC meta-arm-bsp has now knowledge of its existence, in fact there's=20
no other mention of

qemuarm64-secureboot in meta-arm-bsp.


Cheers,


Alejandro

>
> In ci/qemuarm64-secureboot.yml add:
>
> ci/meta-openembedded.yml
>
> Kind regards
> -----------------------------------------------------------------------=
-
> *From:* Sumit Garg <sumit.garg@linaro.org>
> *Sent:* 03 March 2022 05:31
> *To:* Jon Mason <jdmason@kudzu.us>; Alejandro Hernandez=20
> <alhe@linux.microsoft.com>
> *Cc:* meta-arm@lists.yoctoproject.org=20
> <meta-arm@lists.yoctoproject.org>; Vishnu Banavath=20
> <Vishnu.Banavath@arm.com>; Maxim Uvarov <maxim.uvarov@linaro.org>;=20
> Peter Griffin <peter.griffin@linaro.org>; Denys Dmytriyenko=20
> <denis@denix.org>; Drew Reed <Drew.Reed@arm.com>; Abdellatif El Khlifi=20
> <Abdellatif.ElKhlifi@arm.com>
> *Subject:* Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
> On Wed, 2 Mar 2022 at 20:16, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Tue, Mar 01, 2022 at 09:54:04PM +0000, Alejandro Hernandez wrote:
> > > Hi John,
> > >
> > > On 3/1/22 16:27, Jon Mason wrote:
> > > > On Fri, Feb 25, 2022 at 08:04:41PM -0700, Alejandro Enedino=20
> Hernandez Samaniego wrote:
> > > > > - Removes upstreamed patches for optee-examples
> > > > > - Fixes optee-examples installation
> > > > > - Includes new python3-cryptography dependency
> > > > > - Fixes python3-cryptography to work with openssl
> > > > >
> > > > > Tested on qemuarm64-secureboot via optee-examples xtest -l 15
> > > > With the new changes in python3-crypto, this is no longer working=
.
> > > > I'm seeing the following error in CI.
> > > >
> > > > --- Error summary ---
> > > > ERROR: Nothing PROVIDES 'python3-cryptography-native' (but=20
> /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee/optee-os_3.=
16.0.bb=20
> DEPENDS on or otherwise requires it). Close matches:
> > > >=C2=A0=C2=A0=C2=A0 python3-cython-native
> > > >=C2=A0=C2=A0=C2=A0 python3-pycryptodome-native
> > > >=C2=A0=C2=A0=C2=A0 python3-typogrify-native
> > > >
> > > > I _think_ that adding meta-openembedded.yml being adding to the
> > > > machines should fix it, but I'm not sure that is the right soluti=
on.
> > > >
> > > > Thanks,
> > > > Jon
> > >
> > > My apologies, I was testing with meta-oe/meta-python enabled hence=20
> I didnt
> > > see the error before.
> > >
> > >
> > > I'm not sure its the right solution either, this dependency is=20
> coming from
> > > the pem_to_pub_c.py script which is now using python3-cyrptography=20
> since
> > > commit=20
> https://github.com/OP-TEE/optee_os/commit/169eac19852d98d8ade821f913bbd=
d76faf52823
> > > (this also means we could remove python3-cryptodome from the=20
> dependencies as
> > > well), as far as I can tell this creates a hard dependency, passing
> > > EXTRA_OEMAKE +=3D " CFG_WITH_USER_TA=3Dn" would avoid executing the=
 script
> > > completely but I also dont think thats what we want.
> > >
> > > Should we include meta-openembedded.yml?,=C2=A0 or what other choic=
e do=20
> we have?
> > > create a python3-cyrptography recipe to meta-arm?, thoughts?
>
> Yes, we should include meta-openembedded.yml as a dependency and
> remove python3-cryptodome from the dependencies.
>
> -Sumit
>
> >
> > OPTEE isn't an area I understand well (to know whether removing this
> > is superior to adding the dependency in the files). So, I'm directly
> > cc'ing contributors that I think will have an opinion to this
> > response.
> >
> > Thanks,
> > Jon
> >
> > >
> > > Cheers,
> > >
> > > Alejandro
> > >
> > > > > Signed-off-by: Alejandro Enedino Hernandez=20
> Samaniego<alhe@linux.microsoft.com>
> > > > > ---
> > > > >=C2=A0=C2=A0 ....bbappend =3D> optee-client_3.16.0.bbappend} |=C2=
=A0 0
> > > > >=C2=A0=C2=A0 ...pend =3D> optee-os-tadevkit_3.16.0.bbappend} |=C2=
=A0 0
> > > > >=C2=A0=C2=A0 ...14.0.bbappend =3D> optee-os_3.16.0.bbappend} |=C2=
=A0 0
> > > > >=C2=A0=C2=A0 ....0.bbappend =3D> optee-test_3.16.0.bbappend} |=C2=
=A0 0
> > > > > .../optee-ftpm/optee-ftpm_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +-
> > > > > .../optee/optee-client_3.14.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 -
> > > > > .../optee/optee-client_3.16.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +
> > > > > .../recipes-security/optee/optee-examples.inc |=C2=A0 7 +-
> > > > > ...ix-non-portable-sh-check-for-plugins.patch | 46 ++++++++++
> > > > > ...efault-cross-compiler-environment-se.patch | 84=20
> -------------------
> > > > > ...nable-plugins-installation-in-rootfs.patch | 37 --------
> > > > > .../optee/optee-examples_3.14.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 -
> > > > > .../optee/optee-examples_3.16.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +
> > > > >=C2=A0=C2=A0 ..._3.14.0.bb =3D> optee-os-tadevkit_3.16.0.bb} |=C2=
=A0 3 +-
> > > > > meta-arm/recipes-security/optee/optee-os.inc=C2=A0 |=C2=A0 2 +-
> > > > >=C2=A0=C2=A0 ...{optee-os_3.14.0.bb =3D> optee-os_3.16.0.bb} |=C2=
=A0 2 +-
> > > > > .../recipes-security/optee/optee-test.inc=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
> > > > > .../optee/optee-test_3.14.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 -
> > > > > .../optee/optee-test_3.16.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +
> > > > > meta-arm/recipes-security/optee/optee.inc=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 3 +
> > > > >=C2=A0=C2=A0 20 files changed, 73 insertions(+), 140 deletions(-=
)
> > > > >=C2=A0=C2=A0 rename=20
> meta-arm-bsp/recipes-security/optee/{optee-client_3.14.0.bbappend =3D>=20
> optee-client_3.16.0.bbappend} (100%)
> > > > >=C2=A0=C2=A0 rename=20
> meta-arm-bsp/recipes-security/optee/{optee-os-tadevkit_3.14.0.bbappend=20
> =3D> optee-os-tadevkit_3.16.0.bbappend} (100%)
> > > > >=C2=A0=C2=A0 rename=20
> meta-arm-bsp/recipes-security/optee/{optee-os_3.14.0.bbappend =3D>=20
> optee-os_3.16.0.bbappend} (100%)
> > > > >=C2=A0=C2=A0 rename=20
> meta-arm-bsp/recipes-security/optee/{optee-test_3.14.0.bbappend =3D>=20
> optee-test_3.16.0.bbappend} (100%)
> > > > >=C2=A0=C2=A0 delete mode 100644=20
> meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > > > >=C2=A0=C2=A0 create mode 100644=20
> meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> > > > >=C2=A0=C2=A0 create mode 100644=20
> meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-po=
rtable-sh-check-for-plugins.patch
> > > > >=C2=A0=C2=A0 delete mode 100644=20
> meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-defa=
ult-cross-compiler-environment-se.patch
> > > > >=C2=A0=C2=A0 delete mode 100644=20
> meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plu=
gins-installation-in-rootfs.patch
> > > > >=C2=A0=C2=A0 delete mode 100644=20
> meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > > > >=C2=A0=C2=A0 create mode 100644=20
> meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> > > > >=C2=A0=C2=A0 rename=20
> meta-arm/recipes-security/optee/{optee-os-tadevkit_3.14.0.bb =3D>=20
> optee-os-tadevkit_3.16.0.bb} (94%)
> > > > >=C2=A0=C2=A0 rename meta-arm/recipes-security/optee/{optee-os_3.=
14.0.bb=20
> =3D> optee-os_3.16.0.bb} (76%)
> > > > >=C2=A0=C2=A0 delete mode 100644=20
> meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > > > >=C2=A0=C2=A0 create mode 100644=20
> meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> > > > >
> > > > > diff --git=20
> a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend=20
> b/meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappend
> > > > > similarity index 100%
> > > > > rename from=20
> meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
> > > > > rename to=20
> meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappend
> > > > > diff --git=20
> a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend=
=20
> b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.16.0.bbappend
> > > > > similarity index 100%
> > > > > rename from=20
> meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend
> > > > > rename to=20
> meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.16.0.bbappend
> > > > > diff --git=20
> a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend=20
> b/meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappend
> > > > > similarity index 100%
> > > > > rename from=20
> meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
> > > > > rename to=20
> meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappend
> > > > > diff --git=20
> a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend=20
> b/meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
> > > > > similarity index 100%
> > > > > rename from=20
> meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
> > > > > rename to=20
> meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb=20
> b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > > > index f2a74da..0eb64cd 100644
> > > > > --- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > > > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > > > @@ -15,7 +15,9 @@ inherit deploy python3native
> > > > >=C2=A0=C2=A0 LICENSE =3D "MIT"
> > > > >=C2=A0=C2=A0 LIC_FILES_CHKSUM=20
> =3D"file://${S}/LICENSE;md5=3D27e94c0280987ab296b0b8dd02ab9fe5=20
> <file://${S}/LICENSE;md5=3D27e94c0280987ab296b0b8dd02ab9fe5>"
> > > > > -DEPENDS =3D "python3-pycryptodome-native=20
> python3-pycryptodomex-native python3-pyelftools-native optee-os-tadevki=
t"
> > > > > +DEPENDS =3D "python3-pycryptodome-native=20
> python3-pycryptodomex-native python3-pyelftools-native optee-os-tadevki=
t \
> > > > > +=C2=A0=C2=A0=C2=A0 python3-cryptography-native \
> > > > > +=C2=A0=C2=A0=C2=A0 "
> > > > > FTPM_UUID=3D"bc50d971-d4c9-42c4-82cb-343fb7f37896"
> > > > > @@ -48,6 +50,10 @@ EXTRA_OEMAKE:append:aarch64:qemuall =3D "\
> > > > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CFG_ARM64_ta_arm64=3Dy \
> > > > >=C2=A0=C2=A0 "
> > > > > +# python3-cryptography needs the legacy provider, so set=20
> OPENSSL_MODULES to the
> > > > > +# right path until this is relocated automatically.
> > > > > +export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-module=
s"
> > > > > +
> > > > >=C2=A0=C2=A0 PARALLEL_MAKE =3D ""
> > > > >=C2=A0=C2=A0 do_compile() {
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb=20
> b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > > > > deleted file mode 100644
> > > > > index be78b88..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > > > > +++ /dev/null
> > > > > @@ -1,3 +0,0 @@
> > > > > -require optee-client.inc
> > > > > -
> > > > > -SRCREV =3D "06e1b32f6a7028e039c625b07cfc25fda0c17d53"
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-client_3.16.0.bb=20
> b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> > > > > new file mode 100644
> > > > > index 0000000..4a36cbc
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> > > > > @@ -0,0 +1,3 @@
> > > > > +require optee-client.inc
> > > > > +
> > > > > +SRCREV =3D "06db73b3f3fdb8d23eceaedbc46c49c0b45fd1e2"
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-examples.inc=20
> b/meta-arm/recipes-security/optee/optee-examples.inc
> > > > > index 656722e..097f892 100644
> > > > > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > > > > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > > > > @@ -5,16 +5,14 @@ HOMEPAGE=20
> =3D"https://github.com/linaro-swg/optee_examples"
> > > > >=C2=A0=C2=A0 LICENSE =3D "BSD-2-Clause"
> > > > >=C2=A0=C2=A0 LIC_FILES_CHKSUM=20
> =3D"file://LICENSE;md5=3Dcd95ab417e23b94f381dafc453d70c30=20
> <file://LICENSE;md5=3Dcd95ab417e23b94f381dafc453d70c30>"
> > > > > -DEPENDS =3D "optee-client optee-os-tadevkit=20
> python3-pycryptodome-native"
> > > > > +DEPENDS =3D "optee-client optee-os-tadevkit=20
> python3-pycryptodome-native python3-cryptography-native"
> > > > >=C2=A0=C2=A0 inherit python3native
> > > > >=C2=A0=C2=A0 require optee.inc
> > > > >=C2=A0=C2=A0 SRC_URI =3D=20
> "git://github.com/linaro-swg/optee_examples.git;branch=3Dmaster;protoco=
l=3Dhttps=20
> \
> > > > >=20
> -file://0001-plugins-Honour-default-cross-compiler-environment-se.patch=
 \
> > > > >=20
> -file://0002-Makefile-Enable-plugins-installation-in-rootfs.patch \
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > > > > +file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.pat=
ch"
> > > > >=C2=A0=C2=A0 EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DI=
R} \
> > > > > HOST_CROSS_COMPILE=3D${HOST_PREFIX} \
> > > > > @@ -25,6 +23,7 @@ EXTRA_OEMAKE +=3D=20
> "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
> > > > >=C2=A0=C2=A0 S =3D "${WORKDIR}/git"
> > > > >=C2=A0=C2=A0 B =3D "${WORKDIR}/build"
> > > > > +
> > > > >=C2=A0=C2=A0 do_compile() {
> > > > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake -C ${S}
> > > > >=C2=A0=C2=A0 }
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-=
portable-sh-check-for-plugins.patch=20
> b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-=
portable-sh-check-for-plugins.patch
> > > > > new file mode 100644
> > > > > index 0000000..70add62
> > > > > --- /dev/null
> > > > > +++=20
> b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-=
portable-sh-check-for-plugins.patch
> > > > > @@ -0,0 +1,46 @@
> > > > > +From 11610debf750f15c7a104db7315dcd7d69e282a8 Mon Sep 17=20
> 00:00:00 2001
> > > > > +From: Alejandro Enedino Hernandez=20
> Samaniego<alhe@linux.microsoft.com>
> > > > > +Date: Sat, 26 Feb 2022 01:52:26 +0000
> > > > > +Subject: [PATCH] Makefile: Fix non-portable sh check for plugi=
ns
> > > > > +
> > > > > +Upstream-Status: Pending
> > > > > +
> > > > > +We previously held a patch that used "=3D" for comparison, but=
 when
> > > > > +that patch got upstreamed it was changed to "=3D=3D" which is=20
> non-portable,
> > > > > +resulting in an error:
> > > > > +
> > > > > +/bin/sh: 6: [: acipher: unexpected operator
> > > > > +/bin/sh: 6: [: plugins: unexpected operator
> > > > > +/bin/sh: 6: [: hello_world: unexpected operator
> > > > > +/bin/sh: 6: [: hotp: unexpected operator
> > > > > +/bin/sh: 6: [: aes: unexpected operator
> > > > > +/bin/sh: 6: [: random: unexpected operator
> > > > > +/bin/sh: 6: [: secure_storage: unexpected operator
> > > > > +
> > > > > +if /bin/sh doesnt point to bash.
> > > > > +
> > > > > +Which in turn causes our do_install task to fail since=20
> plugins arent
> > > > > +where we expect them to be.
> > > > > +
> > > > > +
> > > > > +Signed-off-by: Alejandro Enedino Hernandez=20
> Samaniego<alhe@linux.microsoft.com>
> > > > > +---
> > > > > + Makefile | 2 +-
> > > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > +
> > > > > +diff --git a/Makefile b/Makefile
> > > > > +index b3f16aa..9359d95 100644
> > > > > +--- a/Makefile
> > > > > ++++ b/Makefile
> > > > > +@@ -31,7 +31,7 @@ prepare-for-rootfs: examples
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cp -p=20
> $$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi; \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/=
ta/; \
> > > > > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $$example =3D=3D plugins ]; then \
> > > > > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $$example =3D plugins ]; then \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cp -p plugins/syslog/*.plugin=20
> $(OUTPUT_DIR)/plugins/; \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi; \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
> > > > > +--
> > > > > +2.25.1
> > > > > +
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-de=
fault-cross-compiler-environment-se.patch=20
> b/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-de=
fault-cross-compiler-environment-se.patch
> > > > > deleted file mode 100644
> > > > > index 033e48c..0000000
> > > > > ---=20
> a/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-de=
fault-cross-compiler-environment-se.patch
> > > > > +++ /dev/null
> > > > > @@ -1,84 +0,0 @@
> > > > > -From 79c826c249001700007a6dffe80c3d61ff4428ef Mon Sep 17=20
> 00:00:00 2001
> > > > > -From: Sumit Garg<sumit.garg@linaro.org>
> > > > > -Date: Tue, 20 Jul 2021 13:54:30 +0530
> > > > > -Subject: [PATCH 1/2] plugins: Honour default cross compiler=20
> environment setup
> > > > > -
> > > > > -Honour default $(CC), $(CFLAGS) and $(LDFLAGS) variables.=20
> Without this
> > > > > -plugins example fails to build for OE/Yocto.
> > > > > -
> > > > > -Upstream-Status: Submitted=20
> [https://github.com/linaro-swg/optee_examples/pull/87]
> > > > > -
> > > > > -Signed-off-by: Sumit Garg<sumit.garg@linaro.org>
> > > > > ----
> > > > > - plugins/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> > > > > - plugins/host/Makefile=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > > - plugins/syslog/Makefile | 16 ++++++++++++----
> > > > > - 3 files changed, 14 insertions(+), 6 deletions(-)
> > > > > -
> > > > > -diff --git a/plugins/Makefile b/plugins/Makefile
> > > > > -index 2372b38..ea472b4 100644
> > > > > ---- a/plugins/Makefile
> > > > > -+++ b/plugins/Makefile
> > > > > -@@ -8,7 +8,7 @@ TA_CROSS_COMPILE ?=3D $(CROSS_COMPILE)
> > > > > - all:
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -C ho=
st=20
> CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)" --no-builtin-variables
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -C ta=
 CROSS_COMPILE=3D"$(TA_CROSS_COMPILE)"=20
> LDFLAGS=3D""
> > > > > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -C syslog =
CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)"
> > > > > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) -C syslog=20
> CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)" --no-builtin-variables
> > > > > -
> > > > > - .PHONY: clean
> > > > > - clean:
> > > > > -diff --git a/plugins/host/Makefile b/plugins/host/Makefile
> > > > > -index 7285104..76244c7 100644
> > > > > ---- a/plugins/host/Makefile
> > > > > -+++ b/plugins/host/Makefile
> > > > > -@@ -20,7 +20,7 @@ BINARY =3D optee_example_plugins
> > > > > - all: $(BINARY)
> > > > > -
> > > > > - $(BINARY): $(OBJS)
> > > > > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) -o $@ $< $(L=
DADD)
> > > > > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) $(LDFLAGS) -=
o $@ $< $(LDADD)
> > > > > -
> > > > > - .PHONY: clean
> > > > > - clean:
> > > > > -diff --git a/plugins/syslog/Makefile b/plugins/syslog/Makefile
> > > > > -index 62d916a..71f5f92 100644
> > > > > ---- a/plugins/syslog/Makefile
> > > > > -+++ b/plugins/syslog/Makefile
> > > > > -@@ -1,3 +1,11 @@
> > > > > -+CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?=3D $(CROSS_COMPILE)gcc
> > > > > -+LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?=3D $(CROSS_COMPILE)ld
> > > > > -+AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?=3D $(CROSS_COMPILE)ar
> > > > > -+NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?=3D $(CROSS_COMPILE)nm
> > > > > -+OBJCOPY ?=3D $(CROSS_COMPILE)objcopy
> > > > > -+OBJDUMP ?=3D $(CROSS_COMPILE)objdump
> > > > > -+READELF ?=3D $(CROSS_COMPILE)readelf
> > > > > -+
> > > > > - PLUGIN_UUID =3D 96bcf744-4f72-4866-bf1d-8634fd9c65e5
> > > > > -
> > > > > - PLUGIN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(PLUGIN_UUID).plugin
> > > > > -@@ -6,17 +14,17 @@ PLUGIN_OBJ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(patsubst %.c,=20
> %.o, $(PLUGIN_SRS))
> > > > > - PLUGIN_INCLUDES_DIR=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(CURDIR) $(T=
EEC_EXPORT)/include
> > > > > -
> > > > > - PLUGIN_INCLUDES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D $(addprefix -I,=20
> $(PLUGIN_INCLUDES_DIR))
> > > > > --PLUGIN_CCFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D -Wall -fPIC
> > > > > --PLUGIN_LDFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D -shared
> > > > > -+PLUGIN_CCFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D $(CFLAGS) -Wall -fPIC
> > > > > -+PLUGIN_LDFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D $(LDFLAGS) -shared
> > > > > -
> > > > > - .PHONY: all
> > > > > - all: $(PLUGIN)
> > > > > -
> > > > > - $(PLUGIN): $(PLUGIN_OBJ)
> > > > > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CROSS_COMPILE)gc=
c $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ)=20
> -o $@
> > > > > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) $(PLUGIN_LDF=
LAGS) $(PLUGIN_OBJ) -o $@
> > > > > -
> > > > > - %.o: %.c
> > > > > --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CROSS_COMPILE)gc=
c $(PLUGIN_CCFLAGS)=20
> $(PLUGIN_INCLUDES) -c $*.c -o $*.o
> > > > > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) $(PLUGIN_CCF=
LAGS) $(PLUGIN_INCLUDES) -c $*.c=20
> -o $*.o
> > > > > -
> > > > > - .PHONY: clean
> > > > > - clean:
> > > > > ---
> > > > > -2.25.1
> > > > > -
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-p=
lugins-installation-in-rootfs.patch=20
> b/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-p=
lugins-installation-in-rootfs.patch
> > > > > deleted file mode 100644
> > > > > index 80e6b5f..0000000
> > > > > ---=20
> a/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-p=
lugins-installation-in-rootfs.patch
> > > > > +++ /dev/null
> > > > > @@ -1,37 +0,0 @@
> > > > > -From f4e5e74548d92258855434b550c58fe44993c148 Mon Sep 17=20
> 00:00:00 2001
> > > > > -From: Sumit Garg<sumit.garg@linaro.org>
> > > > > -Date: Tue, 20 Jul 2021 14:20:10 +0530
> > > > > -Subject: [PATCH] Makefile: Enable plugins installation in root=
fs
> > > > > -
> > > > > -Upstream-Status: Submitted=20
> [https://github.com/linaro-swg/optee_examples/pull/87]
> > > > > -
> > > > > -Signed-off-by: Sumit Garg<sumit.garg@linaro.org>
> > > > > -
> > > > > ----
> > > > > - Makefile | 5 +++++
> > > > > - 1 file changed, 5 insertions(+)
> > > > > -
> > > > > -diff --git a/Makefile b/Makefile
> > > > > -index a275842..9359d95 100644
> > > > > ---- a/Makefile
> > > > > -+++ b/Makefile
> > > > > -@@ -25,14 +25,19 @@ prepare-for-rootfs: examples
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @mkdir -p $(O=
UTPUT_DIR)
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @mkdir -p $(O=
UTPUT_DIR)/ta
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @mkdir -p $(O=
UTPUT_DIR)/ca
> > > > > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @mkdir -p $(OUTPUT=
_DIR)/plugins
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @for example =
in $(EXAMPLE_LIST); do \
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e=20
> $$example/host/optee_example_$$example ]; then \
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cp -p=20
> $$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi; \
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/=
ta/; \
> > > > > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $$example =3D plugins ]; then \
> > > > > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 cp -p plugins/syslog/*.plugin=20
> $(OUTPUT_DIR)/plugins/; \
> > > > > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi; \
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
> > > > > -
> > > > > - prepare-for-rootfs-clean:
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @rm -rf $(OUT=
PUT_DIR)/ta
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @rm -rf $(OUT=
PUT_DIR)/ca
> > > > > -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @rm -rf $(OUTPUT_D=
IR)/plugins
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @rmdir --igno=
re-fail-on-non-empty $(OUTPUT_DIR) ||=20
> test ! -e $(OUTPUT_DIR)
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb=20
> b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > > > > deleted file mode 100644
> > > > > index f2b5f7d..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > > > > +++ /dev/null
> > > > > @@ -1,4 +0,0 @@
> > > > > -require optee-examples.inc
> > > > > -
> > > > > -SRCREV =3D "e9c870525af8f7e7fccf575a0ca5394ce55adcec"
> > > > > -
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb=20
> b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> > > > > new file mode 100644
> > > > > index 0000000..b5f6269
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> > > > > @@ -0,0 +1,3 @@
> > > > > +require optee-examples.inc
> > > > > +
> > > > > +SRCREV =3D "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb=20
> b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
> > > > > similarity index 94%
> > > > > rename from=20
> meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > > > rename to=20
> meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
> > > > > index 0d37a52..c710e27 100644
> > > > > --- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.=
bb
> > > > > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.=
bb
> > > > > @@ -1,10 +1,11 @@
> > > > >=C2=A0=C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os:"
> > > > > -require optee-os_3.14.0.bb
> > > > > +require optee-os_3.16.0.bb
> > > > >=C2=A0=C2=A0 SUMMARY =3D "OP-TEE Trusted OS TA devkit"
> > > > >=C2=A0=C2=A0 DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
> > > > >=C2=A0=C2=A0 HOMEPAGE =3D"https://www.op-tee.org/"
> > > > > +
> > > > >=C2=A0=C2=A0 do_install() {
> > > > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #install TA devkit
> > > > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir=
}/optee/export-user_ta/
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc=20
> b/meta-arm/recipes-security/optee/optee-os.inc
> > > > > index 1506a58..57c64fd 100644
> > > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > > > @@ -10,7 +10,7 @@ require optee.inc
> > > > >=C2=A0=C2=A0 CVE_PRODUCT =3D "linaro:op-tee op-tee:op-tee_os"
> > > > > -DEPENDS =3D "python3-pycryptodome-native python3-pyelftools-na=
tive"
> > > > > +DEPENDS =3D "python3-pycryptodome-native=20
> python3-pyelftools-native python3-cryptography-native"
> > > > >=C2=A0=C2=A0 DEPENDS:append:toolchain-clang =3D " compiler-rt"
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb=20
> b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> > > > > similarity index 76%
> > > > > rename from meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > > > > rename to meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> > > > > index 95d82bb..873e964 100644
> > > > > --- a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > > > > +++ b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> > > > > @@ -1,6 +1,6 @@
> > > > >=C2=A0=C2=A0 require optee-os.inc
> > > > > -SRCREV =3D "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
> > > > > +SRCREV =3D "d0b742d1564834dac903f906168d7357063d5459"
> > > > >=C2=A0=C2=A0 SRC_URI:append =3D " \
> > > > > file://0006-allow-setting-sysroot-for-libgcc-lookup.patch=20
> <file://0006-allow-setting-sysroot-for-libgcc-lookup.patch>=C2=A0 \
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-test.inc=20
> b/meta-arm/recipes-security/optee/optee-test.inc
> > > > > index aada243..33eda29 100644
> > > > > --- a/meta-arm/recipes-security/optee/optee-test.inc
> > > > > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> > > > > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM=20
> =3D"file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940aab1315a4fa=20
> <file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940aab1315a4fa>"
> > > > >=C2=A0=C2=A0 inherit python3native ptest
> > > > >=C2=A0=C2=A0 require optee.inc
> > > > > -DEPENDS =3D "optee-client optee-os-tadevkit=20
> python3-pycryptodome-native"
> > > > > +DEPENDS =3D "optee-client optee-os-tadevkit=20
> python3-pycryptodome-native python3-cryptography-native"
> > > > >=C2=A0=C2=A0 SRC_URI =3D=20
> "git://github.com/OP-TEE/optee_test.git;branch=3Dmaster;protocol=3Dhttp=
s \
> > > > > file://run-ptest <file://run-ptest> \
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb=20
> b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > > > > deleted file mode 100644
> > > > > index 6367c27..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > > > > +++ /dev/null
> > > > > @@ -1,3 +0,0 @@
> > > > > -require optee-test.inc
> > > > > -
> > > > > -SRCREV =3D "f2eb88affbb7f028561b4fd5cbd049d5d704f741"
> > > > > diff --git=20
> a/meta-arm/recipes-security/optee/optee-test_3.16.0.bb=20
> b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> > > > > new file mode 100644
> > > > > index 0000000..03f9c34
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> > > > > @@ -0,0 +1,3 @@
> > > > > +require optee-test.inc
> > > > > +
> > > > > +SRCREV =3D "1cf0e6d2bdd1145370033d4e182634458528579d"
> > > > > diff --git a/meta-arm/recipes-security/optee/optee.inc=20
> b/meta-arm/recipes-security/optee/optee.inc
> > > > > index f02a022..beae366 100644
> > > > > --- a/meta-arm/recipes-security/optee/optee.inc
> > > > > +++ b/meta-arm/recipes-security/optee/optee.inc
> > > > > @@ -26,3 +26,6 @@ EXTRA_OEMAKE +=3D "V=3D1 \
> > > > > OPTEE_CLIENT_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
> > > > > TEEC_EXPORT=3D${STAGING_DIR_HOST}${prefix} \
> > > > >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > > > > +# python3-cryptography needs the legacy provider, so set=20
> OPENSSL_MODULES to the
> > > > > +# right path until this is relocated automatically.
> > > > > +export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-module=
s"
> > > > > --
> > > > > 2.25.1
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3096):https://lists.yoctoproject.org/g/meta-arm/mes=
sage/3096
> Mute This Topic:https://lists.yoctoproject.org/mt/89404067/4354175
> Group Owner:meta-arm+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-arm/unsub  [alhe@linu=
x.microsoft.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------0FUxJR3lZLhIbe82myS8c0OG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/3/22 10:55, Abdellatif El Khlifi
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurp=
rd08.prod.outlook.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <style type=3D"text/css" style=3D"display:none;">P {margin-top:0;ma=
rgin-bottom:0;}</style>
      <div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        Hello,
        <div><br>
        </div>
        <div>I suggest the following:</div>
        <div><br>
        </div>
        <div>In meta-arm-bsp/conf/layer.conf add :</div>
        <div><br>
        </div>
        <div>LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot =3D "
          meta-python openembedded-layer"</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>This statement is a little confusing (to me), please correct me
      if I'm wrong, but you're saying</p>
    <p>we should set a dependency from meta-arm-bsp layer, only for
      qemuarm64-secureboot,</p>
    <p>however, the qemuarm64-secureboot is part of meta-arm and not
      meta-arm-bsp,</p>
    <p>AFAIC meta-arm-bsp has now knowledge of its existence, in fact
      there's no other mention of</p>
    <p>qemuarm64-secureboot in meta-arm-bsp.<br>
    </p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurp=
rd08.prod.outlook.com">
      <div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
        <div><br>
        </div>
        <div>In ci/qemuarm64-secureboot.yml add:</div>
        <div><br>
        </div>
        <div>ci/meta-openembedded.yml</div>
        <div><br>
        </div>
        Kind regards<br>
      </div>
      <hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
      <div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt=
"
          face=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Sum=
it
          Garg <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sumit.ga=
rg@linaro.org">&lt;sumit.garg@linaro.org&gt;</a><br>
          <b>Sent:</b> 03 March 2022 05:31<br>
          <b>To:</b> Jon Mason <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:jdmason@kudzu.us">&lt;jdmason@kudzu.us&gt;</a>; Alejandro
          Hernandez <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alh=
e@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a><br>
          <b>Cc:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto=
:meta-arm@lists.yoctoproject.org">meta-arm@lists.yoctoproject.org</a>
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:meta-arm@list=
s.yoctoproject.org">&lt;meta-arm@lists.yoctoproject.org&gt;</a>; Vishnu B=
anavath
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Vishnu.Banava=
th@arm.com">&lt;Vishnu.Banavath@arm.com&gt;</a>; Maxim Uvarov
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:maxim.uvarov@=
linaro.org">&lt;maxim.uvarov@linaro.org&gt;</a>; Peter Griffin
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:peter.griffin=
@linaro.org">&lt;peter.griffin@linaro.org&gt;</a>; Denys Dmytriyenko
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:denis@denix.o=
rg">&lt;denis@denix.org&gt;</a>; Drew Reed <a class=3D"moz-txt-link-rfc23=
96E" href=3D"mailto:Drew.Reed@arm.com">&lt;Drew.Reed@arm.com&gt;</a>;
          Abdellatif El Khlifi <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:Abdellatif.ElKhlifi@arm.com">&lt;Abdellatif.ElKhlifi@arm.com&gt;<=
/a><br>
          <b>Subject:</b> Re: [meta-arm] [PATCH] arm/optee: Upgrade from
          3.14 to 3.16</font>
        <div>=C2=A0</div>
      </div>
      <div class=3D"BodyFragment"><font size=3D"2"><span
            style=3D"font-size:11pt;">
            <div class=3D"PlainText">On Wed, 2 Mar 2022 at 20:16, Jon
              Mason <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jdm=
ason@kudzu.us">&lt;jdmason@kudzu.us&gt;</a> wrote:<br>
              &gt;<br>
              &gt; On Tue, Mar 01, 2022 at 09:54:04PM +0000, Alejandro
              Hernandez wrote:<br>
              &gt; &gt; Hi John,<br>
              &gt; &gt;<br>
              &gt; &gt; On 3/1/22 16:27, Jon Mason wrote:<br>
              &gt; &gt; &gt; On Fri, Feb 25, 2022 at 08:04:41PM -0700,
              Alejandro Enedino Hernandez Samaniego wrote:<br>
              &gt; &gt; &gt; &gt; - Removes upstreamed patches for
              optee-examples<br>
              &gt; &gt; &gt; &gt; - Fixes optee-examples installation<br>
              &gt; &gt; &gt; &gt; - Includes new python3-cryptography
              dependency<br>
              &gt; &gt; &gt; &gt; - Fixes python3-cryptography to work
              with openssl<br>
              &gt; &gt; &gt; &gt;<br>
              &gt; &gt; &gt; &gt; Tested on qemuarm64-secureboot via
              optee-examples xtest -l 15<br>
              &gt; &gt; &gt; With the new changes in python3-crypto,
              this is no longer working.<br>
              &gt; &gt; &gt; I'm seeing the following error in CI.<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; --- Error summary ---<br>
              &gt; &gt; &gt; ERROR: Nothing PROVIDES
              'python3-cryptography-native' (but
/builds/jonmason00/meta-arm/meta-arm/recipes-security/optee/optee-os_3.16=
.0.bb
              DEPENDS on or otherwise requires it). Close matches:<br>
              &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0 python3-cython-native<br>
              &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0 python3-pycryptodome-nativ=
e<br>
              &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0 python3-typogrify-native<b=
r>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; I _think_ that adding meta-openembedded.yml
              being adding to the<br>
              &gt; &gt; &gt; machines should fix it, but I'm not sure
              that is the right solution.<br>
              &gt; &gt; &gt;<br>
              &gt; &gt; &gt; Thanks,<br>
              &gt; &gt; &gt; Jon<br>
              &gt; &gt;<br>
              &gt; &gt; My apologies, I was testing with
              meta-oe/meta-python enabled hence I didnt<br>
              &gt; &gt; see the error before.<br>
              &gt; &gt;<br>
              &gt; &gt;<br>
              &gt; &gt; I'm not sure its the right solution either, this
              dependency is coming from<br>
              &gt; &gt; the pem_to_pub_c.py script which is now using
              python3-cyrptography since<br>
              &gt; &gt; commit <a
href=3D"https://github.com/OP-TEE/optee_os/commit/169eac19852d98d8ade821f=
913bbdd76faf52823"
                moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">
https://github.com/OP-TEE/optee_os/commit/169eac19852d98d8ade821f913bbdd7=
6faf52823</a><br>
              &gt; &gt; (this also means we could remove
              python3-cryptodome from the dependencies as<br>
              &gt; &gt; well), as far as I can tell this creates a hard
              dependency, passing<br>
              &gt; &gt; EXTRA_OEMAKE +=3D " CFG_WITH_USER_TA=3Dn" would
              avoid executing the script<br>
              &gt; &gt; completely but I also dont think thats what we
              want.<br>
              &gt; &gt;<br>
              &gt; &gt; Should we include meta-openembedded.yml?,=C2=A0 o=
r
              what other choice do we have?<br>
              &gt; &gt; create a python3-cyrptography recipe to
              meta-arm?, thoughts?<br>
              <br>
              Yes, we should include meta-openembedded.yml as a
              dependency and<br>
              remove python3-cryptodome from the dependencies.<br>
              <br>
              -Sumit<br>
              <br>
              &gt;<br>
              &gt; OPTEE isn't an area I understand well (to know
              whether removing this<br>
              &gt; is superior to adding the dependency in the files).=C2=
=A0
              So, I'm directly<br>
              &gt; cc'ing contributors that I think will have an opinion
              to this<br>
              &gt; response.<br>
              &gt;<br>
              &gt; Thanks,<br>
              &gt; Jon<br>
              &gt;<br>
              &gt; &gt;<br>
              &gt; &gt; Cheers,<br>
              &gt; &gt;<br>
              &gt; &gt; Alejandro<br>
              &gt; &gt;<br>
              &gt; &gt; &gt; &gt; Signed-off-by: Alejandro Enedino
              Hernandez Samaniego<a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a><br=
>
              &gt; &gt; &gt; &gt; ---<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 ....bbappend =3D&gt;
              optee-client_3.16.0.bbappend} |=C2=A0 0<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 ...pend =3D&gt;
              optee-os-tadevkit_3.16.0.bbappend} |=C2=A0 0<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 ...14.0.bbappend =3D&gt;
              optee-os_3.16.0.bbappend} |=C2=A0 0<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 ....0.bbappend =3D&gt;
              optee-test_3.16.0.bbappend} |=C2=A0 0<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              .../optee-ftpm/optee-ftpm_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +-<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              .../optee/optee-client_3.14.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 -<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              .../optee/optee-client_3.16.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              .../recipes-security/optee/optee-examples.inc |=C2=A0 7 +-<=
br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              ...ix-non-portable-sh-check-for-plugins.patch | 46
              ++++++++++<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              ...efault-cross-compiler-environment-se.patch | 84
              -------------------<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              ...nable-plugins-installation-in-rootfs.patch | 37
              --------<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              .../optee/optee-examples_3.14.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 -<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              .../optee/optee-examples_3.16.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 ..._3.14.0.bb =3D&gt;
              optee-os-tadevkit_3.16.0.bb} |=C2=A0 3 +-<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              meta-arm/recipes-security/optee/optee-os.inc=C2=A0 |=C2=A0 =
2 +-<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 ...{optee-os_3.14.0.bb =3D&=
gt;
              optee-os_3.16.0.bb} |=C2=A0 2 +-<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              .../recipes-security/optee/optee-test.inc=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              .../optee/optee-test_3.14.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 -<=
br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              .../optee/optee-test_3.16.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +<=
br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              meta-arm/recipes-security/optee/optee.inc=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 +<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 20 files changed, 73 insert=
ions(+),
              140 deletions(-)<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 rename
              meta-arm-bsp/recipes-security/optee/{optee-client_3.14.0.bb=
append
              =3D&gt; optee-client_3.16.0.bbappend} (100%)<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 rename
              meta-arm-bsp/recipes-security/optee/{optee-os-tadevkit_3.14=
.0.bbappend
              =3D&gt; optee-os-tadevkit_3.16.0.bbappend} (100%)<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 rename
              meta-arm-bsp/recipes-security/optee/{optee-os_3.14.0.bbappe=
nd
              =3D&gt; optee-os_3.16.0.bbappend} (100%)<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 rename
              meta-arm-bsp/recipes-security/optee/{optee-test_3.14.0.bbap=
pend
              =3D&gt; optee-test_3.16.0.bbappend} (100%)<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 delete mode 100644
              meta-arm/recipes-security/optee/optee-client_3.14.0.bb<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 create mode 100644
              meta-arm/recipes-security/optee/optee-client_3.16.0.bb<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 create mode 100644
meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-port=
able-sh-check-for-plugins.patch<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 delete mode 100644
meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-defaul=
t-cross-compiler-environment-se.patch<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 delete mode 100644
meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plugi=
ns-installation-in-rootfs.patch<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 delete mode 100644
              meta-arm/recipes-security/optee/optee-examples_3.14.0.bb<br=
>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 create mode 100644
              meta-arm/recipes-security/optee/optee-examples_3.16.0.bb<br=
>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 rename
              meta-arm/recipes-security/optee/{optee-os-tadevkit_3.14.0.b=
b
              =3D&gt; optee-os-tadevkit_3.16.0.bb} (94%)<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 rename
              meta-arm/recipes-security/optee/{optee-os_3.14.0.bb =3D&gt;
              optee-os_3.16.0.bb} (76%)<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 delete mode 100644
              meta-arm/recipes-security/optee/optee-test_3.14.0.bb<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 create mode 100644
              meta-arm/recipes-security/optee/optee-test_3.16.0.bb<br>
              &gt; &gt; &gt; &gt;<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.b=
bappend
b/meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappend<br>
              &gt; &gt; &gt; &gt; similarity index 100%<br>
              &gt; &gt; &gt; &gt; rename from
              meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bba=
ppend<br>
              &gt; &gt; &gt; &gt; rename to
              meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bba=
ppend<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.1=
4.0.bbappend
b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.16.0.bbappend<b=
r>
              &gt; &gt; &gt; &gt; similarity index 100%<br>
              &gt; &gt; &gt; &gt; rename from
              meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.=
0.bbappend<br>
              &gt; &gt; &gt; &gt; rename to
              meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.16.=
0.bbappend<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbapp=
end
b/meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappend<br>
              &gt; &gt; &gt; &gt; similarity index 100%<br>
              &gt; &gt; &gt; &gt; rename from
              meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappen=
d<br>
              &gt; &gt; &gt; &gt; rename to
              meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappen=
d<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bba=
ppend
b/meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend<br>
              &gt; &gt; &gt; &gt; similarity index 100%<br>
              &gt; &gt; &gt; &gt; rename from
              meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbapp=
end<br>
              &gt; &gt; &gt; &gt; rename to
              meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbapp=
end<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
              b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb<br=
>
              &gt; &gt; &gt; &gt; index f2a74da..0eb64cd 100644<br>
              &gt; &gt; &gt; &gt; ---
              a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb<br=
>
              &gt; &gt; &gt; &gt; +++
              b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb<br=
>
              &gt; &gt; &gt; &gt; @@ -15,7 +15,9 @@ inherit deploy
              python3native<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 LICENSE =3D "MIT"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 LIC_FILES_CHKSUM =3D"<a
                href=3D"file://${S}/LICENSE;md5=3D27e94c0280987ab296b0b8d=
d02ab9fe5"
                moz-do-not-send=3D"true">file://${S}/LICENSE;md5=3D27e94c=
0280987ab296b0b8dd02ab9fe5</a>"<br>
              &gt; &gt; &gt; &gt; -DEPENDS =3D
              "python3-pycryptodome-native python3-pycryptodomex-native
              python3-pyelftools-native optee-os-tadevkit"<br>
              &gt; &gt; &gt; &gt; +DEPENDS =3D
              "python3-pycryptodome-native python3-pycryptodomex-native
              python3-pyelftools-native optee-os-tadevkit \<br>
              &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0 python3-cryptograph=
y-native \<br>
              &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0 "<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0
              FTPM_UUID=3D"bc50d971-d4c9-42c4-82cb-343fb7f37896"<br>
              &gt; &gt; &gt; &gt; @@ -48,6 +50,10 @@
              EXTRA_OEMAKE:append:aarch64:qemuall =3D "\<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CFG=
_ARM64_ta_arm64=3Dy \<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 "<br>
              &gt; &gt; &gt; &gt; +# python3-cryptography needs the
              legacy provider, so set OPENSSL_MODULES to the<br>
              &gt; &gt; &gt; &gt; +# right path until this is relocated
              automatically.<br>
              &gt; &gt; &gt; &gt; +export
              OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"<b=
r>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 PARALLEL_MAKE =3D ""<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 do_compile() {<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
              b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb<br=
>
              &gt; &gt; &gt; &gt; deleted file mode 100644<br>
              &gt; &gt; &gt; &gt; index be78b88..0000000<br>
              &gt; &gt; &gt; &gt; ---
              a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb<br=
>
              &gt; &gt; &gt; &gt; +++ /dev/null<br>
              &gt; &gt; &gt; &gt; @@ -1,3 +0,0 @@<br>
              &gt; &gt; &gt; &gt; -require optee-client.inc<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; -SRCREV =3D
              "06e1b32f6a7028e039c625b07cfc25fda0c17d53"<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
              b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb<br=
>
              &gt; &gt; &gt; &gt; new file mode 100644<br>
              &gt; &gt; &gt; &gt; index 0000000..4a36cbc<br>
              &gt; &gt; &gt; &gt; --- /dev/null<br>
              &gt; &gt; &gt; &gt; +++
              b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb<br=
>
              &gt; &gt; &gt; &gt; @@ -0,0 +1,3 @@<br>
              &gt; &gt; &gt; &gt; +require optee-client.inc<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +SRCREV =3D
              "06db73b3f3fdb8d23eceaedbc46c49c0b45fd1e2"<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-examples.inc
              b/meta-arm/recipes-security/optee/optee-examples.inc<br>
              &gt; &gt; &gt; &gt; index 656722e..097f892 100644<br>
              &gt; &gt; &gt; &gt; ---
              a/meta-arm/recipes-security/optee/optee-examples.inc<br>
              &gt; &gt; &gt; &gt; +++
              b/meta-arm/recipes-security/optee/optee-examples.inc<br>
              &gt; &gt; &gt; &gt; @@ -5,16 +5,14 @@ HOMEPAGE =3D"<a
                href=3D"https://github.com/linaro-swg/optee_examples"
                moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://github.com/linaro-swg/optee_examples</a>"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 LICENSE =3D "BSD-2-Clause"<=
br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 LIC_FILES_CHKSUM =3D"<a
                href=3D"file://LICENSE;md5=3Dcd95ab417e23b94f381dafc453d7=
0c30"
                moz-do-not-send=3D"true">file://LICENSE;md5=3Dcd95ab417e2=
3b94f381dafc453d70c30</a>"<br>
              &gt; &gt; &gt; &gt; -DEPENDS =3D "optee-client
              optee-os-tadevkit python3-pycryptodome-native"<br>
              &gt; &gt; &gt; &gt; +DEPENDS =3D "optee-client
              optee-os-tadevkit python3-pycryptodome-native
              python3-cryptography-native"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 inherit python3native<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 require optee.inc<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 SRC_URI =3D
"git://github.com/linaro-swg/optee_examples.git;branch=3Dmaster;protocol=3D=
https
              \<br>
              &gt; &gt; &gt; &gt;
              -file://0001-plugins-Honour-default-cross-compiler-environm=
ent-se.patch=C2=A0
              \<br>
              &gt; &gt; &gt; &gt;
              -file://0002-Makefile-Enable-plugins-installation-in-rootfs=
.patch=C2=A0
              \<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 "<br>
              &gt; &gt; &gt; &gt;
              +file://0001-Makefile-Fix-non-portable-sh-check-for-plugins=
.patch"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 EXTRA_OEMAKE +=3D
              "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
              HOST_CROSS_COMPILE=3D${HOST_PREFIX} \<br>
              &gt; &gt; &gt; &gt; @@ -25,6 +23,7 @@ EXTRA_OEMAKE +=3D
              "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 S =3D "${WORKDIR}/git"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 B =3D "${WORKDIR}/build"<br=
>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 do_compile() {<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_=
runmake -C ${S}<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 }<br>
              &gt; &gt; &gt; &gt; diff --git
a/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-po=
rtable-sh-check-for-plugins.patch
b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-po=
rtable-sh-check-for-plugins.patch<br>
              &gt; &gt; &gt; &gt; new file mode 100644<br>
              &gt; &gt; &gt; &gt; index 0000000..70add62<br>
              &gt; &gt; &gt; &gt; --- /dev/null<br>
              &gt; &gt; &gt; &gt; +++
b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-po=
rtable-sh-check-for-plugins.patch<br>
              &gt; &gt; &gt; &gt; @@ -0,0 +1,46 @@<br>
              &gt; &gt; &gt; &gt; +From
              11610debf750f15c7a104db7315dcd7d69e282a8 Mon Sep 17
              00:00:00 2001<br>
              &gt; &gt; &gt; &gt; +From: Alejandro Enedino Hernandez
              Samaniego<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a><br>
              &gt; &gt; &gt; &gt; +Date: Sat, 26 Feb 2022 01:52:26 +0000<=
br>
              &gt; &gt; &gt; &gt; +Subject: [PATCH] Makefile: Fix
              non-portable sh check for plugins<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +Upstream-Status: Pending<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +We previously held a patch that used
              "=3D" for comparison, but when<br>
              &gt; &gt; &gt; &gt; +that patch got upstreamed it was
              changed to "=3D=3D" which is non-portable,<br>
              &gt; &gt; &gt; &gt; +resulting in an error:<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +/bin/sh: 6: [: acipher: unexpected
              operator<br>
              &gt; &gt; &gt; &gt; +/bin/sh: 6: [: plugins: unexpected
              operator<br>
              &gt; &gt; &gt; &gt; +/bin/sh: 6: [: hello_world:
              unexpected operator<br>
              &gt; &gt; &gt; &gt; +/bin/sh: 6: [: hotp: unexpected
              operator<br>
              &gt; &gt; &gt; &gt; +/bin/sh: 6: [: aes: unexpected
              operator<br>
              &gt; &gt; &gt; &gt; +/bin/sh: 6: [: random: unexpected
              operator<br>
              &gt; &gt; &gt; &gt; +/bin/sh: 6: [: secure_storage:
              unexpected operator<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +if /bin/sh doesnt point to bash.<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +Which in turn causes our do_install
              task to fail since plugins arent<br>
              &gt; &gt; &gt; &gt; +where we expect them to be.<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +Signed-off-by: Alejandro Enedino
              Hernandez Samaniego<a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a><br=
>
              &gt; &gt; &gt; &gt; +---<br>
              &gt; &gt; &gt; &gt; + Makefile | 2 +-<br>
              &gt; &gt; &gt; &gt; + 1 file changed, 1 insertion(+), 1
              deletion(-)<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +diff --git a/Makefile b/Makefile<br>
              &gt; &gt; &gt; &gt; +index b3f16aa..9359d95 100644<br>
              &gt; &gt; &gt; &gt; +--- a/Makefile<br>
              &gt; &gt; &gt; &gt; ++++ b/Makefile<br>
              &gt; &gt; &gt; &gt; +@@ -31,7 +31,7 @@ prepare-for-rootfs:
              examples<br>
              &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -p
              $$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/;
              \<br>
              &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi; \<br>
              &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -pr
              $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \<br>
              &gt; &gt; &gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $$example =3D=3D
              plugins ]; then \<br>
              &gt; &gt; &gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $$example =3D
              plugins ]; then \<br>
              &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -p
              plugins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \<br>
              &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi; \<br>
              &gt; &gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 done<br>
              &gt; &gt; &gt; &gt; +--<br>
              &gt; &gt; &gt; &gt; +2.25.1<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; diff --git
a/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-defa=
ult-cross-compiler-environment-se.patch
b/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-defa=
ult-cross-compiler-environment-se.patch<br>
              &gt; &gt; &gt; &gt; deleted file mode 100644<br>
              &gt; &gt; &gt; &gt; index 033e48c..0000000<br>
              &gt; &gt; &gt; &gt; ---
a/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-defa=
ult-cross-compiler-environment-se.patch<br>
              &gt; &gt; &gt; &gt; +++ /dev/null<br>
              &gt; &gt; &gt; &gt; @@ -1,84 +0,0 @@<br>
              &gt; &gt; &gt; &gt; -From
              79c826c249001700007a6dffe80c3d61ff4428ef Mon Sep 17
              00:00:00 2001<br>
              &gt; &gt; &gt; &gt; -From: Sumit
              Garg<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sumit=
.garg@linaro.org">&lt;sumit.garg@linaro.org&gt;</a><br>
              &gt; &gt; &gt; &gt; -Date: Tue, 20 Jul 2021 13:54:30 +0530<=
br>
              &gt; &gt; &gt; &gt; -Subject: [PATCH 1/2] plugins: Honour
              default cross compiler environment setup<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; -Honour default $(CC), $(CFLAGS) and
              $(LDFLAGS) variables. Without this<br>
              &gt; &gt; &gt; &gt; -plugins example fails to build for
              OE/Yocto.<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; -Upstream-Status: Submitted [<a
                href=3D"https://github.com/linaro-swg/optee_examples/pull=
/87"
                moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://github.com/linaro-swg/optee_examples/pull/87</a>]<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; -Signed-off-by: Sumit
              Garg<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sumit=
.garg@linaro.org">&lt;sumit.garg@linaro.org&gt;</a><br>
              &gt; &gt; &gt; &gt; ----<br>
              &gt; &gt; &gt; &gt; - plugins/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-<br>
              &gt; &gt; &gt; &gt; - plugins/host/Makefile=C2=A0=C2=A0 |=C2=
=A0 2 +-<br>
              &gt; &gt; &gt; &gt; - plugins/syslog/Makefile | 16
              ++++++++++++----<br>
              &gt; &gt; &gt; &gt; - 3 files changed, 14 insertions(+), 6
              deletions(-)<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; -diff --git a/plugins/Makefile
              b/plugins/Makefile<br>
              &gt; &gt; &gt; &gt; -index 2372b38..ea472b4 100644<br>
              &gt; &gt; &gt; &gt; ---- a/plugins/Makefile<br>
              &gt; &gt; &gt; &gt; -+++ b/plugins/Makefile<br>
              &gt; &gt; &gt; &gt; -@@ -8,7 +8,7 @@ TA_CROSS_COMPILE ?=3D
              $(CROSS_COMPILE)<br>
              &gt; &gt; &gt; &gt; - all:<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 $(MAKE) -C host
              CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)"
              --no-builtin-variables<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 $(MAKE) -C ta
              CROSS_COMPILE=3D"$(TA_CROSS_COMPILE)" LDFLAGS=3D""<br>
              &gt; &gt; &gt; &gt; --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $(MAKE) -C syslog
              CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)"<br>
              &gt; &gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $(MAKE) -C syslog
              CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)"
              --no-builtin-variables<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; - .PHONY: clean<br>
              &gt; &gt; &gt; &gt; - clean:<br>
              &gt; &gt; &gt; &gt; -diff --git a/plugins/host/Makefile
              b/plugins/host/Makefile<br>
              &gt; &gt; &gt; &gt; -index 7285104..76244c7 100644<br>
              &gt; &gt; &gt; &gt; ---- a/plugins/host/Makefile<br>
              &gt; &gt; &gt; &gt; -+++ b/plugins/host/Makefile<br>
              &gt; &gt; &gt; &gt; -@@ -20,7 +20,7 @@ BINARY =3D
              optee_example_plugins<br>
              &gt; &gt; &gt; &gt; - all: $(BINARY)<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; - $(BINARY): $(OBJS)<br>
              &gt; &gt; &gt; &gt; --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $(CC) -o $@ $&lt; $(LDADD)<br>
              &gt; &gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $(CC) $(LDFLAGS) -o $@ $&lt;
              $(LDADD)<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; - .PHONY: clean<br>
              &gt; &gt; &gt; &gt; - clean:<br>
              &gt; &gt; &gt; &gt; -diff --git a/plugins/syslog/Makefile
              b/plugins/syslog/Makefile<br>
              &gt; &gt; &gt; &gt; -index 62d916a..71f5f92 100644<br>
              &gt; &gt; &gt; &gt; ---- a/plugins/syslog/Makefile<br>
              &gt; &gt; &gt; &gt; -+++ b/plugins/syslog/Makefile<br>
              &gt; &gt; &gt; &gt; -@@ -1,3 +1,11 @@<br>
              &gt; &gt; &gt; &gt; -+CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?=3D=
 $(CROSS_COMPILE)gcc<br>
              &gt; &gt; &gt; &gt; -+LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?=3D=
 $(CROSS_COMPILE)ld<br>
              &gt; &gt; &gt; &gt; -+AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?=3D=
 $(CROSS_COMPILE)ar<br>
              &gt; &gt; &gt; &gt; -+NM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ?=3D=
 $(CROSS_COMPILE)nm<br>
              &gt; &gt; &gt; &gt; -+OBJCOPY ?=3D $(CROSS_COMPILE)objcopy<=
br>
              &gt; &gt; &gt; &gt; -+OBJDUMP ?=3D $(CROSS_COMPILE)objdump<=
br>
              &gt; &gt; &gt; &gt; -+READELF ?=3D $(CROSS_COMPILE)readelf<=
br>
              &gt; &gt; &gt; &gt; -+<br>
              &gt; &gt; &gt; &gt; - PLUGIN_UUID =3D
              96bcf744-4f72-4866-bf1d-8634fd9c65e5<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; - PLUGIN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D
              $(PLUGIN_UUID).plugin<br>
              &gt; &gt; &gt; &gt; -@@ -6,17 +14,17 @@
              PLUGIN_OBJ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D $(patsubst %.c, %.o,
              $(PLUGIN_SRS))<br>
              &gt; &gt; &gt; &gt; - PLUGIN_INCLUDES_DIR=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D $(CURDIR)
              $(TEEC_EXPORT)/include<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; - PLUGIN_INCLUDES=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D
              $(addprefix -I, $(PLUGIN_INCLUDES_DIR))<br>
              &gt; &gt; &gt; &gt; --PLUGIN_CCFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D -Wall
              -fPIC<br>
              &gt; &gt; &gt; &gt; --PLUGIN_LDFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D -shared<br>
              &gt; &gt; &gt; &gt; -+PLUGIN_CCFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(CFLAGS)
              -Wall -fPIC<br>
              &gt; &gt; &gt; &gt; -+PLUGIN_LDFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D $(LDFLAGS)
              -shared<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; - .PHONY: all<br>
              &gt; &gt; &gt; &gt; - all: $(PLUGIN)<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; - $(PLUGIN): $(PLUGIN_OBJ)<br>
              &gt; &gt; &gt; &gt; --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $(CROSS_COMPILE)gcc
              $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@<br>
              &gt; &gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $(CC) $(PLUGIN_LDFLAGS)
              $(PLUGIN_OBJ) -o $@<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; - %.o: %.c<br>
              &gt; &gt; &gt; &gt; --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $(CROSS_COMPILE)gcc
              $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*.o<br>
              &gt; &gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $(CC) $(PLUGIN_CCFLAGS)
              $(PLUGIN_INCLUDES) -c $*.c -o $*.o<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; - .PHONY: clean<br>
              &gt; &gt; &gt; &gt; - clean:<br>
              &gt; &gt; &gt; &gt; ---<br>
              &gt; &gt; &gt; &gt; -2.25.1<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; diff --git
a/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plu=
gins-installation-in-rootfs.patch
b/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plu=
gins-installation-in-rootfs.patch<br>
              &gt; &gt; &gt; &gt; deleted file mode 100644<br>
              &gt; &gt; &gt; &gt; index 80e6b5f..0000000<br>
              &gt; &gt; &gt; &gt; ---
a/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plu=
gins-installation-in-rootfs.patch<br>
              &gt; &gt; &gt; &gt; +++ /dev/null<br>
              &gt; &gt; &gt; &gt; @@ -1,37 +0,0 @@<br>
              &gt; &gt; &gt; &gt; -From
              f4e5e74548d92258855434b550c58fe44993c148 Mon Sep 17
              00:00:00 2001<br>
              &gt; &gt; &gt; &gt; -From: Sumit
              Garg<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sumit=
.garg@linaro.org">&lt;sumit.garg@linaro.org&gt;</a><br>
              &gt; &gt; &gt; &gt; -Date: Tue, 20 Jul 2021 14:20:10 +0530<=
br>
              &gt; &gt; &gt; &gt; -Subject: [PATCH] Makefile: Enable
              plugins installation in rootfs<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; -Upstream-Status: Submitted [<a
                href=3D"https://github.com/linaro-swg/optee_examples/pull=
/87"
                moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://github.com/linaro-swg/optee_examples/pull/87</a>]<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; -Signed-off-by: Sumit
              Garg<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sumit=
.garg@linaro.org">&lt;sumit.garg@linaro.org&gt;</a><br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; ----<br>
              &gt; &gt; &gt; &gt; - Makefile | 5 +++++<br>
              &gt; &gt; &gt; &gt; - 1 file changed, 5 insertions(+)<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; -diff --git a/Makefile b/Makefile<br>
              &gt; &gt; &gt; &gt; -index a275842..9359d95 100644<br>
              &gt; &gt; &gt; &gt; ---- a/Makefile<br>
              &gt; &gt; &gt; &gt; -+++ b/Makefile<br>
              &gt; &gt; &gt; &gt; -@@ -25,14 +25,19 @@
              prepare-for-rootfs: examples<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 @mkdir -p $(OUTPUT_DIR)<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 @mkdir -p $(OUTPUT_DIR)/ta<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 @mkdir -p $(OUTPUT_DIR)/ca<br>
              &gt; &gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 @mkdir -p
              $(OUTPUT_DIR)/plugins<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 @for example in
              $(EXAMPLE_LIST); do \<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e
              $$example/host/optee_example_$$example ]; then \<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -p
              $$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/;
              \<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi; \<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -pr
              $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \<br>
              &gt; &gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $$example =3D
              plugins ]; then \<br>
              &gt; &gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cp -p
              plugins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \<br>
              &gt; &gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi; \<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 done<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; - prepare-for-rootfs-clean:<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 @rm -rf $(OUTPUT_DIR)/ta<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 @rm -rf $(OUTPUT_DIR)/ca<br>
              &gt; &gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 @rm -rf
              $(OUTPUT_DIR)/plugins<br>
              &gt; &gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 @rmdir
              --ignore-fail-on-non-empty $(OUTPUT_DIR) || test ! -e
              $(OUTPUT_DIR)<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
              b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb<=
br>
              &gt; &gt; &gt; &gt; deleted file mode 100644<br>
              &gt; &gt; &gt; &gt; index f2b5f7d..0000000<br>
              &gt; &gt; &gt; &gt; ---
              a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb<=
br>
              &gt; &gt; &gt; &gt; +++ /dev/null<br>
              &gt; &gt; &gt; &gt; @@ -1,4 +0,0 @@<br>
              &gt; &gt; &gt; &gt; -require optee-examples.inc<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; -SRCREV =3D
              "e9c870525af8f7e7fccf575a0ca5394ce55adcec"<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
              b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb<=
br>
              &gt; &gt; &gt; &gt; new file mode 100644<br>
              &gt; &gt; &gt; &gt; index 0000000..b5f6269<br>
              &gt; &gt; &gt; &gt; --- /dev/null<br>
              &gt; &gt; &gt; &gt; +++
              b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb<=
br>
              &gt; &gt; &gt; &gt; @@ -0,0 +1,3 @@<br>
              &gt; &gt; &gt; &gt; +require optee-examples.inc<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +SRCREV =3D
              "65fc74309e12189ad5b6ce3ffec37c8011088a5a"<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.=
bb
b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb<br>
              &gt; &gt; &gt; &gt; similarity index 94%<br>
              &gt; &gt; &gt; &gt; rename from
              meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb=
<br>
              &gt; &gt; &gt; &gt; rename to
              meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb=
<br>
              &gt; &gt; &gt; &gt; index 0d37a52..c710e27 100644<br>
              &gt; &gt; &gt; &gt; ---
              a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.=
bb<br>
              &gt; &gt; &gt; &gt; +++
              b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.=
bb<br>
              &gt; &gt; &gt; &gt; @@ -1,10 +1,11 @@<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 FILESEXTRAPATHS:prepend :=3D
              "${THISDIR}/optee-os:"<br>
              &gt; &gt; &gt; &gt; -require optee-os_3.14.0.bb<br>
              &gt; &gt; &gt; &gt; +require optee-os_3.16.0.bb<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 SUMMARY =3D "OP-TEE Trusted=
 OS TA
              devkit"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 DESCRIPTION =3D "OP-TEE TA =
devkit for
              build TAs"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 HOMEPAGE =3D"<a
                href=3D"https://www.op-tee.org/" moz-do-not-send=3D"true"
                class=3D"moz-txt-link-freetext">https://www.op-tee.org/</=
a>"<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 do_install() {<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #in=
stall TA devkit<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ins=
tall -d
              ${D}${includedir}/optee/export-user_ta/<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-os.inc
              b/meta-arm/recipes-security/optee/optee-os.inc<br>
              &gt; &gt; &gt; &gt; index 1506a58..57c64fd 100644<br>
              &gt; &gt; &gt; &gt; ---
              a/meta-arm/recipes-security/optee/optee-os.inc<br>
              &gt; &gt; &gt; &gt; +++
              b/meta-arm/recipes-security/optee/optee-os.inc<br>
              &gt; &gt; &gt; &gt; @@ -10,7 +10,7 @@ require optee.inc<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 CVE_PRODUCT =3D "linaro:op-=
tee
              op-tee:op-tee_os"<br>
              &gt; &gt; &gt; &gt; -DEPENDS =3D
              "python3-pycryptodome-native python3-pyelftools-native"<br>
              &gt; &gt; &gt; &gt; +DEPENDS =3D
              "python3-pycryptodome-native python3-pyelftools-native
              python3-cryptography-native"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 DEPENDS:append:toolchain-cl=
ang =3D "
              compiler-rt"<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
              b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb<br>
              &gt; &gt; &gt; &gt; similarity index 76%<br>
              &gt; &gt; &gt; &gt; rename from
              meta-arm/recipes-security/optee/optee-os_3.14.0.bb<br>
              &gt; &gt; &gt; &gt; rename to
              meta-arm/recipes-security/optee/optee-os_3.16.0.bb<br>
              &gt; &gt; &gt; &gt; index 95d82bb..873e964 100644<br>
              &gt; &gt; &gt; &gt; ---
              a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb<br>
              &gt; &gt; &gt; &gt; +++
              b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb<br>
              &gt; &gt; &gt; &gt; @@ -1,6 +1,6 @@<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 require optee-os.inc<br>
              &gt; &gt; &gt; &gt; -SRCREV =3D
              "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"<br>
              &gt; &gt; &gt; &gt; +SRCREV =3D
              "d0b742d1564834dac903f906168d7357063d5459"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 SRC_URI:append =3D " \<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a
                href=3D"file://0006-allow-setting-sysroot-for-libgcc-look=
up.patch"
                moz-do-not-send=3D"true">
file://0006-allow-setting-sysroot-for-libgcc-lookup.patch</a>=C2=A0 \<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-test.inc
              b/meta-arm/recipes-security/optee/optee-test.inc<br>
              &gt; &gt; &gt; &gt; index aada243..33eda29 100644<br>
              &gt; &gt; &gt; &gt; ---
              a/meta-arm/recipes-security/optee/optee-test.inc<br>
              &gt; &gt; &gt; &gt; +++
              b/meta-arm/recipes-security/optee/optee-test.inc<br>
              &gt; &gt; &gt; &gt; @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D"<a
href=3D"file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940aab1315a4fa"
                moz-do-not-send=3D"true">file://${S}/LICENSE.md;md5=3Ddaa=
2bcccc666345ab8940aab1315a4fa</a>"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 inherit python3native ptest=
<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 require optee.inc<br>
              &gt; &gt; &gt; &gt; -DEPENDS =3D "optee-client
              optee-os-tadevkit python3-pycryptodome-native"<br>
              &gt; &gt; &gt; &gt; +DEPENDS =3D "optee-client
              optee-os-tadevkit python3-pycryptodome-native
              python3-cryptography-native"<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0 SRC_URI =3D
              "git://github.com/OP-TEE/optee_test.git;branch=3Dmaster;pro=
tocol=3Dhttps
              \<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a
                href=3D"file://run-ptest" moz-do-not-send=3D"true">file:/=
/run-ptest</a>=C2=A0
              \<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
              b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb<br>
              &gt; &gt; &gt; &gt; deleted file mode 100644<br>
              &gt; &gt; &gt; &gt; index 6367c27..0000000<br>
              &gt; &gt; &gt; &gt; ---
              a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb<br>
              &gt; &gt; &gt; &gt; +++ /dev/null<br>
              &gt; &gt; &gt; &gt; @@ -1,3 +0,0 @@<br>
              &gt; &gt; &gt; &gt; -require optee-test.inc<br>
              &gt; &gt; &gt; &gt; -<br>
              &gt; &gt; &gt; &gt; -SRCREV =3D
              "f2eb88affbb7f028561b4fd5cbd049d5d704f741"<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
              b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb<br>
              &gt; &gt; &gt; &gt; new file mode 100644<br>
              &gt; &gt; &gt; &gt; index 0000000..03f9c34<br>
              &gt; &gt; &gt; &gt; --- /dev/null<br>
              &gt; &gt; &gt; &gt; +++
              b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb<br>
              &gt; &gt; &gt; &gt; @@ -0,0 +1,3 @@<br>
              &gt; &gt; &gt; &gt; +require optee-test.inc<br>
              &gt; &gt; &gt; &gt; +<br>
              &gt; &gt; &gt; &gt; +SRCREV =3D
              "1cf0e6d2bdd1145370033d4e182634458528579d"<br>
              &gt; &gt; &gt; &gt; diff --git
              a/meta-arm/recipes-security/optee/optee.inc
              b/meta-arm/recipes-security/optee/optee.inc<br>
              &gt; &gt; &gt; &gt; index f02a022..beae366 100644<br>
              &gt; &gt; &gt; &gt; ---
              a/meta-arm/recipes-security/optee/optee.inc<br>
              &gt; &gt; &gt; &gt; +++
              b/meta-arm/recipes-security/optee/optee.inc<br>
              &gt; &gt; &gt; &gt; @@ -26,3 +26,6 @@ EXTRA_OEMAKE +=3D "V=3D=
1
              \<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
              OPTEE_CLIENT_EXPORT=3D${STAGING_DIR_HOST}${prefix} \<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
              TEEC_EXPORT=3D${STAGING_DIR_HOST}${prefix} \<br>
              &gt; &gt; &gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "<br>
              &gt; &gt; &gt; &gt; +# python3-cryptography needs the
              legacy provider, so set OPENSSL_MODULES to the<br>
              &gt; &gt; &gt; &gt; +# right path until this is relocated
              automatically.<br>
              &gt; &gt; &gt; &gt; +export
              OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"<b=
r>
              &gt; &gt; &gt; &gt; --<br>
              &gt; &gt; &gt; &gt; 2.25.1<br>
              &gt; &gt; &gt; &gt;<br>
              &gt; &gt; &gt; &gt;<br>
              &gt; &gt; &gt; &gt;<br>
              &gt; &gt; &gt; &gt; <br>
              &gt; &gt; &gt; &gt;<br>
            </div>
          </span></font></div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#3096): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.yoctoproject.org/g/meta-arm/message/3096">https://lists.yoctop=
roject.org/g/meta-arm/message/3096</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.yoctoproject.org/mt/89404067/4354175">https://lists.yoctoproject.org/mt/=
89404067/4354175</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-ar=
m+owner@lists.yoctoproject.org">meta-arm+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.yoc=
toproject.org/g/meta-arm/unsub">https://lists.yoctoproject.org/g/meta-arm=
/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:alhe@lin=
ux.microsoft.com">alhe@linux.microsoft.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------0FUxJR3lZLhIbe82myS8c0OG--

