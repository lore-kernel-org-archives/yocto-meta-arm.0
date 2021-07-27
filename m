Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.316.1627388321693243620
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 05:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=PgM1OUH3;
 spf=pass (domain: burtonini.com, ip: 209.85.128.41, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f41.google.com with SMTP id l11-20020a7bc34b0000b029021f84fcaf75so1731983wmj.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 27 Jul 2021 05:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VPeCj23aqyOblZKnDQhrX+KexEtl3KNhRFJEKKKFvQM=;
        b=PgM1OUH3EDHBycqphR4h2qGps+3tEeo8qjXBGrco/1oPY/YyszQUlk0z7pzNzy0rhp
         qyTRiTAMxIovIfrs5WsA9k2Q/Kk0TSoR8tmUB5a19CFEr2h1xg7gXw2lARxobuxGx77i
         BUU1FkANJWPtjZbkVh/2Q5lTNSJ3UZjRcjyuUOM3m5ntJRg4vd1Riy7zkzZ44IdxhYgp
         tXh79BEavTPLtnJBD5HsZOomRWBxeir2De9po/LDHT11HFvDb70AsgTbmLyva3B7JZgf
         gLCkCw/ivRJtvYV9xHhEmCaxn5eAGszJ6GFUutWXeaWADRJx6PxdttXDzQgS2q59Kg1E
         khiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VPeCj23aqyOblZKnDQhrX+KexEtl3KNhRFJEKKKFvQM=;
        b=ZhEr/KxZmLMzyYgA6E6E0iaK44K+6cPrJu/zZF3ebj/sp9uu5/c8YrvxhOqDs3NZoH
         6tfMwI1+2837FYG7xqY4Fecq4aY/3NlVsKWIlT6fz4BIrRwb31le7iQHfSUaeeG+SbPJ
         IPvnkfSJ8EMqbUxyixpLRak11V1Ey9whixAkr/AwZv8ZKy+CGQcSP9Q8tvUT5a5iv1i0
         Xh0qPRTzxeRXEjsQ+KSYo2ywcON4v3UHf72fZIe4aAf+Br+Mff5IuPf1ZKOKUkEKXWBy
         QuXCnee0Ziv+ojgE1Pu2bECgc1DncgypocGlFjxTxIRfBXgekxJSqzG8JrXCYF90dLqc
         H2OQ==
X-Gm-Message-State: AOAM533shbD8mNxRv0oLzbQKd78uIpXz0S3MEerCqTpG6YppZO3/gS6n
	JsH0jVTMSRgVpMaX+NT2GF1QnEyt6K9Ep5yqxk8utA==
X-Google-Smtp-Source: ABdhPJytU4ICD/z1ykGz0c9DMfwK6BH3py2kRuAbXSMyp6MBNesPYLWVrHC90Zqv7Ui6ONPZvkgMbvM1fFF2iQaZIHE=
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr1901634wmk.171.1627388319789;
 Tue, 27 Jul 2021 05:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210720100701.881614-1-sumit.garg@linaro.org>
 <CAAnfSTsxPgF62pxre9mntTC0jw+U3DsCm5HMx=fuVYeXGkxh6w@mail.gmail.com>
 <CAFA6WYMjeztz17y=tAv09P0jZS2DadUFdnxe1_vNDGM72ondqA@mail.gmail.com>
 <CAPoiz9zK92aq=rvxGB9Fb3c1xBJ9iS1ZY1dsEWiPdcqgNe-Ckg@mail.gmail.com> <CAFA6WYOdwcY7hEUe1QK8qTqB8q6fm-WDpDy14QfySVJ9UuPtMA@mail.gmail.com>
In-Reply-To: <CAFA6WYOdwcY7hEUe1QK8qTqB8q6fm-WDpDy14QfySVJ9UuPtMA@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 27 Jul 2021 13:18:28 +0100
Message-ID: <CAAnfSTs-rfBdnNoQ5=ibd7nDaToppNiJbZW7Q2Tx_Dp=14sE9w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: version uplift 3.11.0 -> 3.14.0
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org, 
	Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, this might be the problem from log.do_compile:

Copying example CA and TA binaries to
/yocto/ross/build/tmp/work/qemuarm64_secureboot-poky-linux/optee-examples/=
3.14.0-r0/build...
/bin/sh: 6: [: acipher: unexpected operator
/bin/sh: 6: [: plugins: unexpected operator
/bin/sh: 6: [: hello_world: unexpected operator
/bin/sh: 6: [: hotp: unexpected operator
/bin/sh: 6: [: aes: unexpected operator
/bin/sh: 6: [: random: unexpected operator
/bin/sh: 6: [: secure_storage: unexpected operator

Ross

On Tue, 27 Jul 2021 at 07:52, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi Jon,
>
> On Mon, 26 Jul 2021 at 19:31, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Mon, Jul 26, 2021 at 3:10 AM Sumit Garg <sumit.garg@linaro.org> wro=
te:
> > >
> > > Hi Ross,
> > >
> > > On Sat, 24 Jul 2021 at 00:36, Ross Burton <ross@burtonini.com> wrote=
:
> > > >
> > > > The optee-examples recipe is broken:
> > > >
> > > > install: cannot stat
> > > > '/builds/engineering/yocto/meta-arm/work/build/tmp/work/qemuarm64_=
secureboot-poky-linux/optee-examples/3.14.0-r0/build/plugins/*':
> > > > No such file or directory
> > > >
> > > > (qemuarm64-secureboot can build it)
> > > >
> > >
> > > Strangely, it works fine for me when building for
> > > qemuarm64-secureboot. Can you check if the following patches have be=
en
> > > correctly applied in the corresponding work directory?
> > >
> > >            file://0001-plugins-Honour-default-cross-compiler-environ=
ment-se.patch
> > > \
> > >            file://0002-Makefile-Enable-plugins-installation-in-rootf=
s.patch \
> >
> > I'm seeing the same issue Ross is describing.  I would expect a
> > warning or error if it couldn't find the patches while building, not
> > when installing.
>
> Yeah you are correct but I am not able to figure the reason for this beh=
aviour.
>
> > Can you confirm you are building optee-examples, in
> > addition to core-image-minimal/base?
> > See https://gitlab.com/jonmason00/meta-arm/-/jobs/1444856281#L3594
> >
>
> Yeah I am building optee-examples in addition to core-image-minimal/base=
.
>
> - Changes to default poky conf/local.conf:
>
> MACHINE =3D "qemuarm64-secureboot"
> CORE_IMAGE_EXTRA_INSTALL +=3D "optee-examples optee-test"
>
> - Changes to default poky conf/bblayers.conf with additional layers as:
>
> meta-arm/meta-arm-toolchain
> meta-arm/meta-arm
>
> Here is optee-examples build folder directory structure for me:
>
> $ tree tmp/work/qemuarm64_secureboot-poky-linux/optee-examples/3.14.0-r0=
/build/
> tmp/work/qemuarm64_secureboot-poky-linux/optee-examples/3.14.0-r0/build/
> =E2=94=9C=E2=94=80=E2=94=80 ca
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 optee_example_acipher
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 optee_example_aes
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 optee_example_hello_world
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 optee_example_hotp
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 optee_example_plugins
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 optee_example_random
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 optee_example_secure_storage
> =E2=94=9C=E2=94=80=E2=94=80 plugins
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 96bcf744-4f72-4866-bf1d-8634fd9c=
65e5.plugin
> =E2=94=94=E2=94=80=E2=94=80 ta
>     =E2=94=9C=E2=94=80=E2=94=80 2a287631-de1b-4fdd-a55c-b9312e40769a.ta
>     =E2=94=9C=E2=94=80=E2=94=80 484d4143-2d53-4841-3120-4a6f636b6542.ta
>     =E2=94=9C=E2=94=80=E2=94=80 5dbac793-f574-4871-8ad3-04331ec17f24.ta
>     =E2=94=9C=E2=94=80=E2=94=80 8aaaf200-2450-11e4-abe2-0002a5d5c51b.ta
>     =E2=94=9C=E2=94=80=E2=94=80 a734eed9-d6a1-4244-aa50-7c99719e7b7b.ta
>     =E2=94=9C=E2=94=80=E2=94=80 b6c53aba-9669-4668-a7f2-205629d00f86.ta
>     =E2=94=94=E2=94=80=E2=94=80 f4e750bb-1437-4fbf-8785-8d3580c34994.ta
>
> 3 directories, 15 files
>
> > Looks to me like the issue is with newly added line
> > https://gitlab.com/jonmason00/meta-arm/-/blob/master-next/meta-arm/rec=
ipes-security/optee/optee-examples.inc#L39
> >
>
> Looks like this link is pointing to a line where OP-TEE uprev patch
> isn't applied. Were you referring to following line?
>
> +    install -D -p -m0444 ${B}/plugins/* ${D}${libdir}/tee-supplicant/pl=
ugins
>
> As evident from optee-examples build folder above, the plugins
> directory shouldn't be empty for a successful optee-examples build.
>
> -Sumit
>
> > Thanks,
> > Jon
> >
> > >
> > > -Sumit
> > >
> > > > Ross
> > > >
> > > > On Tue, 20 Jul 2021 at 11:07, Sumit Garg <sumit.garg@linaro.org> w=
rote:
> > > > >
> > > > > Brief description of changes:
> > > > > - Version uplift 3.11.0 -> 3.14.0.
> > > > > - Removed OP-TEE patches that has already been accepted upstream=
.
> > > > > - Added support for tee-supplicant plugin framework testing.
> > > > >
> > > > > Tested on qemuarm64_secureboot:
> > > > > $ xtest -l 15
> > > > > $ optee-examples_*
> > > > >
> > > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > > ---
> > > > >  .../optee/optee-client_3.11.0.bb              |   3 -
> > > > >  .../optee/optee-client_3.14.0.bb              |   3 +
> > > > >  .../recipes-security/optee/optee-examples.inc |   9 +-
> > > > >  .../0001-make-Pass-ldflags-during-link.patch  | 103 -----------=
-------
> > > > >  ...efault-cross-compiler-environment-se.patch |  84 +++++++++++=
+++
> > > > >  ...nable-plugins-installation-in-rootfs.patch |  39 +++++++
> > > > >  .../optee/optee-examples_3.11.0.bb            |   4 -
> > > > >  .../optee/optee-examples_3.14.0.bb            |   4 +
> > > > >  ...ide-empty-__getauxval-implementation.patch |  62 -----------
> > > > >  ...t-support-for-libnames-after-libgcc-.patch |  55 ----------
> > > > >  ...ke-sure-that-libutils-is-linked-seco.patch |  44 --------
> > > > >  .../recipes-security/optee/optee-os_3.11.0.bb |  11 --
> > > > >  .../recipes-security/optee/optee-os_3.14.0.bb |   8 ++
> > > > >  .../recipes-security/optee/optee-test.inc     |  15 +--
> > > > >  ...Adjust-order-of-including-compiler.h.patch |  64 -----------
> > > > >  ...ake-remove-Wno-unsafe-loop-for-clang.patch |  31 ------
> > > > >  ...e-remove-Wmissing-noreturn-for-clang.patch |  31 ------
> > > > >  .../optee/optee-test_3.11.0.bb                |   3 -
> > > > >  .../optee/optee-test_3.14.0.bb                |   3 +
> > > > >  19 files changed, 154 insertions(+), 422 deletions(-)
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-client=
_3.11.0.bb
> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-client=
_3.14.0.bb
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-exampl=
es/0001-make-Pass-ldflags-during-link.patch
> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-exampl=
es/0001-plugins-Honour-default-cross-compiler-environment-se.patch
> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-exampl=
es/0002-Makefile-Enable-plugins-installation-in-rootfs.patch
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-exampl=
es_3.11.0.bb
> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-exampl=
es_3.14.0.bb
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-os/000=
1-libutils-provide-empty-__getauxval-implementation.patch
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-os/000=
2-link.mk-implement-support-for-libnames-after-libgcc-.patch
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-os/000=
3-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-os_3.1=
1.0.bb
> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-os_3.1=
4.0.bb
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-test/0=
001-host-xtest-Adjust-order-of-including-compiler.h.patch
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-test/0=
002-make-remove-Wno-unsafe-loop-for-clang.patch
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-test/0=
003-make-remove-Wmissing-noreturn-for-clang.patch
> > > > >  delete mode 100644 meta-arm/recipes-security/optee/optee-test_3=
.11.0.bb
> > > > >  create mode 100644 meta-arm/recipes-security/optee/optee-test_3=
.14.0.bb
> > > > >
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-client_3.11.0=
.bb b/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
> > > > > deleted file mode 100644
> > > > > index f765d12..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
> > > > > +++ /dev/null
> > > > > @@ -1,3 +0,0 @@
> > > > > -require optee-client.inc
> > > > > -
> > > > > -SRCREV =3D "c0c925384c1d7e3558d27d2708857482952d7907"
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-client_3.14.0=
.bb b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > > > > new file mode 100644
> > > > > index 0000000..be78b88
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > > > > @@ -0,0 +1,3 @@
> > > > > +require optee-client.inc
> > > > > +
> > > > > +SRCREV =3D "06e1b32f6a7028e039c625b07cfc25fda0c17d53"
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-examples.inc =
b/meta-arm/recipes-security/optee/optee-examples.inc
> > > > > index 81c31bc..f2e53f3 100644
> > > > > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > > > > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > > > > @@ -12,7 +12,8 @@ inherit python3native
> > > > >  require optee.inc
> > > > >
> > > > >  SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git \
> > > > > -           file://0001-make-Pass-ldflags-during-link.patch \
> > > > > +           file://0001-plugins-Honour-default-cross-compiler-en=
vironment-se.patch \
> > > > > +           file://0002-Makefile-Enable-plugins-installation-in-=
rootfs.patch \
> > > > >            "
> > > > >
> > > > >  EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
> > > > > @@ -32,11 +33,15 @@ do_compile[cleandirs] =3D "${B}"
> > > > >  do_install () {
> > > > >      mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
> > > > >      mkdir -p ${D}${bindir}
> > > > > +    mkdir -p ${D}${libdir}/tee-supplicant/plugins
> > > > >      install -D -p -m0755 ${B}/ca/* ${D}${bindir}
> > > > >      install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/o=
ptee_armtz
> > > > > +    install -D -p -m0444 ${B}/plugins/* ${D}${libdir}/tee-suppl=
icant/plugins
> > > > >  }
> > > > >
> > > > > -FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
> > > > > +FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/ \
> > > > > +                ${libdir}/tee-supplicant/plugins/ \
> > > > > +               "
> > > > >
> > > > >  # Imports machine specific configs from staging to build
> > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/0001=
-make-Pass-ldflags-during-link.patch b/meta-arm/recipes-security/optee/opte=
e-examples/0001-make-Pass-ldflags-during-link.patch
> > > > > deleted file mode 100644
> > > > > index 84202ef..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-examples/0001-make-P=
ass-ldflags-during-link.patch
> > > > > +++ /dev/null
> > > > > @@ -1,103 +0,0 @@
> > > > > -From 29ae21de41f2fbab6dbecbbf408826b28de82df1 Mon Sep 17 00:00:=
00 2001
> > > > > -From: Khem Raj <raj.khem@gmail.com>
> > > > > -Date: Tue, 1 Sep 2020 21:09:56 -0700
> > > > > -Subject: [PATCH] make: Pass ldflags during link
> > > > > -
> > > > > -OpenEmbeeded needs to pass essential linker flags to set correc=
t flags
> > > > > -for gnu_hash among others which sets the linking straight
> > > > > -using LDFLAGS varible here means, we can affect the linker flag=
s
> > > > > -from build environment
> > > > > -
> > > > > -Upstream-Status: Submitted [https://github.com/linaro-swg/optee=
_examples/pull/85]
> > > > > -
> > > > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ----
> > > > > - acipher/host/Makefile        | 2 +-
> > > > > - aes/host/Makefile            | 2 +-
> > > > > - hello_world/host/Makefile    | 2 +-
> > > > > - hotp/host/Makefile           | 2 +-
> > > > > - random/host/Makefile         | 2 +-
> > > > > - secure_storage/host/Makefile | 2 +-
> > > > > - 6 files changed, 6 insertions(+), 6 deletions(-)
> > > > > -
> > > > > -diff --git a/acipher/host/Makefile b/acipher/host/Makefile
> > > > > -index 8f4bc8a..c2cabef 100644
> > > > > ---- a/acipher/host/Makefile
> > > > > -+++ b/acipher/host/Makefile
> > > > > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_acipher
> > > > > - all: $(BINARY)
> > > > > -
> > > > > - $(BINARY): $(OBJS)
> > > > > --      $(CC) -o $@ $< $(LDADD)
> > > > > -+      $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > > > > -
> > > > > - .PHONY: clean
> > > > > - clean:
> > > > > -diff --git a/aes/host/Makefile b/aes/host/Makefile
> > > > > -index dfeb4e8..f61c71b 100644
> > > > > ---- a/aes/host/Makefile
> > > > > -+++ b/aes/host/Makefile
> > > > > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_aes
> > > > > - all: $(BINARY)
> > > > > -
> > > > > - $(BINARY): $(OBJS)
> > > > > --      $(CC) -o $@ $< $(LDADD)
> > > > > -+      $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > > > > -
> > > > > - .PHONY: clean
> > > > > - clean:
> > > > > -diff --git a/hello_world/host/Makefile b/hello_world/host/Makef=
ile
> > > > > -index c4c8239..69cf42c 100644
> > > > > ---- a/hello_world/host/Makefile
> > > > > -+++ b/hello_world/host/Makefile
> > > > > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_hello_world
> > > > > - all: $(BINARY)
> > > > > -
> > > > > - $(BINARY): $(OBJS)
> > > > > --      $(CC) -o $@ $< $(LDADD)
> > > > > -+      $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > > > > -
> > > > > - .PHONY: clean
> > > > > - clean:
> > > > > -diff --git a/hotp/host/Makefile b/hotp/host/Makefile
> > > > > -index cb7fd19..e7f013f 100644
> > > > > ---- a/hotp/host/Makefile
> > > > > -+++ b/hotp/host/Makefile
> > > > > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_hotp
> > > > > - all: $(BINARY)
> > > > > -
> > > > > - $(BINARY): $(OBJS)
> > > > > --      $(CC) -o $@ $< $(LDADD)
> > > > > -+      $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > > > > -
> > > > > - .PHONY: clean
> > > > > - clean:
> > > > > -diff --git a/random/host/Makefile b/random/host/Makefile
> > > > > -index fd407d9..9377f7a 100644
> > > > > ---- a/random/host/Makefile
> > > > > -+++ b/random/host/Makefile
> > > > > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_random
> > > > > - all: $(BINARY)
> > > > > -
> > > > > - $(BINARY): $(OBJS)
> > > > > --      $(CC) -o $@ $< $(LDADD)
> > > > > -+      $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > > > > -
> > > > > - .PHONY: clean
> > > > > - clean:
> > > > > -diff --git a/secure_storage/host/Makefile b/secure_storage/host=
/Makefile
> > > > > -index 29bfb87..b3265ae 100644
> > > > > ---- a/secure_storage/host/Makefile
> > > > > -+++ b/secure_storage/host/Makefile
> > > > > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_secure_storage
> > > > > - all: $(BINARY)
> > > > > -
> > > > > - $(BINARY): $(OBJS)
> > > > > --      $(CC) -o $@ $< $(LDADD)
> > > > > -+      $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > > > > -
> > > > > - .PHONY: clean
> > > > > - clean:
> > > > > ---
> > > > > -2.28.0
> > > > > -
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/0001=
-plugins-Honour-default-cross-compiler-environment-se.patch b/meta-arm/reci=
pes-security/optee/optee-examples/0001-plugins-Honour-default-cross-compile=
r-environment-se.patch
> > > > > new file mode 100644
> > > > > index 0000000..033e48c
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee-examples/0001-plugin=
s-Honour-default-cross-compiler-environment-se.patch
> > > > > @@ -0,0 +1,84 @@
> > > > > +From 79c826c249001700007a6dffe80c3d61ff4428ef Mon Sep 17 00:00:=
00 2001
> > > > > +From: Sumit Garg <sumit.garg@linaro.org>
> > > > > +Date: Tue, 20 Jul 2021 13:54:30 +0530
> > > > > +Subject: [PATCH 1/2] plugins: Honour default cross compiler env=
ironment setup
> > > > > +
> > > > > +Honour default $(CC), $(CFLAGS) and $(LDFLAGS) variables. Witho=
ut this
> > > > > +plugins example fails to build for OE/Yocto.
> > > > > +
> > > > > +Upstream-Status: Submitted [https://github.com/linaro-swg/optee=
_examples/pull/87]
> > > > > +
> > > > > +Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > > +---
> > > > > + plugins/Makefile        |  2 +-
> > > > > + plugins/host/Makefile   |  2 +-
> > > > > + plugins/syslog/Makefile | 16 ++++++++++++----
> > > > > + 3 files changed, 14 insertions(+), 6 deletions(-)
> > > > > +
> > > > > +diff --git a/plugins/Makefile b/plugins/Makefile
> > > > > +index 2372b38..ea472b4 100644
> > > > > +--- a/plugins/Makefile
> > > > > ++++ b/plugins/Makefile
> > > > > +@@ -8,7 +8,7 @@ TA_CROSS_COMPILE ?=3D $(CROSS_COMPILE)
> > > > > + all:
> > > > > +       $(MAKE) -C host CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)" =
--no-builtin-variables
> > > > > +       $(MAKE) -C ta CROSS_COMPILE=3D"$(TA_CROSS_COMPILE)" LDFL=
AGS=3D""
> > > > > +-      $(MAKE) -C syslog CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)=
"
> > > > > ++      $(MAKE) -C syslog CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)=
" --no-builtin-variables
> > > > > +
> > > > > + .PHONY: clean
> > > > > + clean:
> > > > > +diff --git a/plugins/host/Makefile b/plugins/host/Makefile
> > > > > +index 7285104..76244c7 100644
> > > > > +--- a/plugins/host/Makefile
> > > > > ++++ b/plugins/host/Makefile
> > > > > +@@ -20,7 +20,7 @@ BINARY =3D optee_example_plugins
> > > > > + all: $(BINARY)
> > > > > +
> > > > > + $(BINARY): $(OBJS)
> > > > > +-      $(CC) -o $@ $< $(LDADD)
> > > > > ++      $(CC) $(LDFLAGS) -o $@ $< $(LDADD)
> > > > > +
> > > > > + .PHONY: clean
> > > > > + clean:
> > > > > +diff --git a/plugins/syslog/Makefile b/plugins/syslog/Makefile
> > > > > +index 62d916a..71f5f92 100644
> > > > > +--- a/plugins/syslog/Makefile
> > > > > ++++ b/plugins/syslog/Makefile
> > > > > +@@ -1,3 +1,11 @@
> > > > > ++CC      ?=3D $(CROSS_COMPILE)gcc
> > > > > ++LD      ?=3D $(CROSS_COMPILE)ld
> > > > > ++AR      ?=3D $(CROSS_COMPILE)ar
> > > > > ++NM      ?=3D $(CROSS_COMPILE)nm
> > > > > ++OBJCOPY ?=3D $(CROSS_COMPILE)objcopy
> > > > > ++OBJDUMP ?=3D $(CROSS_COMPILE)objdump
> > > > > ++READELF ?=3D $(CROSS_COMPILE)readelf
> > > > > ++
> > > > > + PLUGIN_UUID =3D 96bcf744-4f72-4866-bf1d-8634fd9c65e5
> > > > > +
> > > > > + PLUGIN                        =3D $(PLUGIN_UUID).plugin
> > > > > +@@ -6,17 +14,17 @@ PLUGIN_OBJ          =3D $(patsubst %.c, %.o,=
 $(PLUGIN_SRS))
> > > > > + PLUGIN_INCLUDES_DIR   =3D $(CURDIR) $(TEEC_EXPORT)/include
> > > > > +
> > > > > + PLUGIN_INCLUDES               =3D $(addprefix -I, $(PLUGIN_INC=
LUDES_DIR))
> > > > > +-PLUGIN_CCFLAGS                =3D -Wall -fPIC
> > > > > +-PLUGIN_LDFLAGS                =3D -shared
> > > > > ++PLUGIN_CCFLAGS                =3D $(CFLAGS) -Wall -fPIC
> > > > > ++PLUGIN_LDFLAGS                =3D $(LDFLAGS) -shared
> > > > > +
> > > > > + .PHONY: all
> > > > > + all: $(PLUGIN)
> > > > > +
> > > > > + $(PLUGIN): $(PLUGIN_OBJ)
> > > > > +-      $(CROSS_COMPILE)gcc $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $=
@
> > > > > ++      $(CC) $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
> > > > > +
> > > > > + %.o: %.c
> > > > > +-      $(CROSS_COMPILE)gcc $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES)=
 -c $*.c -o $*.o
> > > > > ++      $(CC) $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*=
.o
> > > > > +
> > > > > + .PHONY: clean
> > > > > + clean:
> > > > > +--
> > > > > +2.25.1
> > > > > +
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/0002=
-Makefile-Enable-plugins-installation-in-rootfs.patch b/meta-arm/recipes-se=
curity/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-ro=
otfs.patch
> > > > > new file mode 100644
> > > > > index 0000000..8d1d60a
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee-examples/0002-Makefi=
le-Enable-plugins-installation-in-rootfs.patch
> > > > > @@ -0,0 +1,39 @@
> > > > > +From a865f2e25e178fc2c4617eb1faf79ac922d02ffd Mon Sep 17 00:00:=
00 2001
> > > > > +From: Sumit Garg <sumit.garg@linaro.org>
> > > > > +Date: Tue, 20 Jul 2021 14:20:10 +0530
> > > > > +Subject: [PATCH 2/2] Makefile: Enable plugins installation in r=
ootfs
> > > > > +
> > > > > +Upstream-Status: Submitted [https://github.com/linaro-swg/optee=
_examples/pull/87]
> > > > > +
> > > > > +Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > > +---
> > > > > + Makefile | 5 +++++
> > > > > + 1 file changed, 5 insertions(+)
> > > > > +
> > > > > +diff --git a/Makefile b/Makefile
> > > > > +index a275842..b3f16aa 100644
> > > > > +--- a/Makefile
> > > > > ++++ b/Makefile
> > > > > +@@ -25,14 +25,19 @@ prepare-for-rootfs: examples
> > > > > +       @mkdir -p $(OUTPUT_DIR)
> > > > > +       @mkdir -p $(OUTPUT_DIR)/ta
> > > > > +       @mkdir -p $(OUTPUT_DIR)/ca
> > > > > ++      @mkdir -p $(OUTPUT_DIR)/plugins
> > > > > +       @for example in $(EXAMPLE_LIST); do \
> > > > > +               if [ -e $$example/host/optee_example_$$example ]=
; then \
> > > > > +                       cp -p $$example/host/optee_example_$$exa=
mple $(OUTPUT_DIR)/ca/; \
> > > > > +               fi; \
> > > > > +               cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \
> > > > > ++              if [ $$example =3D=3D plugins ]; then \
> > > > > ++                      cp -p plugins/syslog/*.plugin $(OUTPUT_D=
IR)/plugins/; \
> > > > > ++              fi; \
> > > > > +       done
> > > > > +
> > > > > + prepare-for-rootfs-clean:
> > > > > +       @rm -rf $(OUTPUT_DIR)/ta
> > > > > +       @rm -rf $(OUTPUT_DIR)/ca
> > > > > ++      @rm -rf $(OUTPUT_DIR)/plugins
> > > > > +       @rmdir --ignore-fail-on-non-empty $(OUTPUT_DIR) || test =
! -e $(OUTPUT_DIR)
> > > > > +--
> > > > > +2.25.1
> > > > > +
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.11=
.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
> > > > > deleted file mode 100644
> > > > > index 72473ed..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
> > > > > +++ /dev/null
> > > > > @@ -1,4 +0,0 @@
> > > > > -require optee-examples.inc
> > > > > -
> > > > > -SRCREV =3D "9a7dc598591990349d88b4dba3a37aadd6851295"
> > > > > -
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.14=
.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > > > > new file mode 100644
> > > > > index 0000000..f2b5f7d
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > > > > @@ -0,0 +1,4 @@
> > > > > +require optee-examples.inc
> > > > > +
> > > > > +SRCREV =3D "e9c870525af8f7e7fccf575a0ca5394ce55adcec"
> > > > > +
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-os/0001-libut=
ils-provide-empty-__getauxval-implementation.patch b/meta-arm/recipes-secur=
ity/optee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.p=
atch
> > > > > deleted file mode 100644
> > > > > index 0120f5c..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-os/0001-libutils-pro=
vide-empty-__getauxval-implementation.patch
> > > > > +++ /dev/null
> > > > > @@ -1,62 +0,0 @@
> > > > > -Upstream-Status: Backport
> > > > > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > > > -
> > > > > -From 36e784f621bf5d5be9183beba35f39426277c110 Mon Sep 17 00:00:=
00 2001
> > > > > -From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > > > > -Date: Tue, 13 Oct 2020 22:45:39 +0300
> > > > > -Subject: [PATCH 1/3] libutils: provide empty __getauxval() impl=
ementation
> > > > > -
> > > > > -Never version of libgcc are built with LSE implementation in mi=
nd. To
> > > > > -determine if LSE is available on platform it calls __getauxval(=
), so in
> > > > > -some cases we can get undefined reference to __getauxval() erro=
r.
> > > > > -
> > > > > -Prominent case is libgcc_eh.a library, which is used by C++ TAs=
. Exception
> > > > > -handler depends on atomic operations, so it tries to call
> > > > > -init_have_lse_atomics() first. This function in turn calls __ge=
tauxval(),
> > > > > -which causes linking error.
> > > > > -
> > > > > -In the future we can make __getauxval() to return actual platfo=
rm
> > > > > -capabilities.
> > > > > -
> > > > > -Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > > > > -Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > -Reviewed-by: Jerome Forissier <jerome@forissier.org>
> > > > > ----
> > > > > - lib/libutils/ext/arch/arm/auxval.c | 12 ++++++++++++
> > > > > - lib/libutils/ext/arch/arm/sub.mk   |  1 +
> > > > > - 2 files changed, 13 insertions(+)
> > > > > - create mode 100644 lib/libutils/ext/arch/arm/auxval.c
> > > > > -
> > > > > -diff --git a/lib/libutils/ext/arch/arm/auxval.c b/lib/libutils/=
ext/arch/arm/auxval.c
> > > > > -new file mode 100644
> > > > > -index 00000000..98bca850
> > > > > ---- /dev/null
> > > > > -+++ b/lib/libutils/ext/arch/arm/auxval.c
> > > > > -@@ -0,0 +1,12 @@
> > > > > -+// SPDX-License-Identifier: BSD-2-Clause
> > > > > -+/*
> > > > > -+ * Copyright (c) 2020, EPAM Systems
> > > > > -+ */
> > > > > -+
> > > > > -+#include <compiler.h>
> > > > > -+
> > > > > -+unsigned long int __getauxval (unsigned long int type);
> > > > > -+unsigned long int __getauxval (unsigned long int type __unused=
)
> > > > > -+{
> > > > > -+      return 0;
> > > > > -+}
> > > > > -diff --git a/lib/libutils/ext/arch/arm/sub.mk b/lib/libutils/ex=
t/arch/arm/sub.mk
> > > > > -index dc5eed67..2e779066 100644
> > > > > ---- a/lib/libutils/ext/arch/arm/sub.mk
> > > > > -+++ b/lib/libutils/ext/arch/arm/sub.mk
> > > > > -@@ -3,6 +3,7 @@ srcs-$(CFG_ARM32_$(sm)) +=3D aeabi_unwind.c
> > > > > - endif
> > > > > - srcs-$(CFG_ARM32_$(sm)) +=3D atomic_a32.S
> > > > > - srcs-$(CFG_ARM64_$(sm)) +=3D atomic_a64.S
> > > > > -+srcs-y +=3D auxval.c
> > > > > - ifneq ($(sm),ldelf) # TA, core
> > > > > - srcs-$(CFG_ARM32_$(sm)) +=3D mcount_a32.S
> > > > > - srcs-$(CFG_ARM64_$(sm)) +=3D mcount_a64.S
> > > > > ---
> > > > > -2.25.1
> > > > > -
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-os/0002-link.=
mk-implement-support-for-libnames-after-libgcc-.patch b/meta-arm/recipes-se=
curity/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-lib=
gcc-.patch
> > > > > deleted file mode 100644
> > > > > index 11296c8..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-os/0002-link.mk-impl=
ement-support-for-libnames-after-libgcc-.patch
> > > > > +++ /dev/null
> > > > > @@ -1,55 +0,0 @@
> > > > > -Upstream-Status: Backport
> > > > > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > > > -
> > > > > -From 73196b58ea6978ffa5e581738030f51c5789ef73 Mon Sep 17 00:00:=
00 2001
> > > > > -From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > > > > -Date: Tue, 13 Oct 2020 22:54:13 +0300
> > > > > -Subject: [PATCH 2/3] link.mk: implement support for libnames-af=
ter-libgcc
> > > > > - variable
> > > > > -
> > > > > -Newer versions of libgcc depend on external __getauxval() symbo=
l, which is
> > > > > -now provided by libutils. But libgcc is linked after libutils, =
so linker
> > > > > -can't resolve that symbol. We can't include libgcc into linking=
 group with
> > > > > -libtutils, because libgcc provides symbols that conflict with l=
ibutil's
> > > > > -ones, like __aeabi_idiv with friends for instance.
> > > > > -
> > > > > -So, to resolve libgcc dependency on libutils we need to link wi=
th libutils
> > > > > -second time. To make things more generic, we will introduce
> > > > > -$(libnames-after-libgcc) variable for libraries that should be =
linked after
> > > > > -libgcc.
> > > > > -
> > > > > -Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > > > > -Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > -Reviewed-by: Jerome Forissier <jerome@forissier.org>
> > > > > ----
> > > > > - ta/arch/arm/link.mk | 6 +++++-
> > > > > - 1 file changed, 5 insertions(+), 1 deletion(-)
> > > > > -
> > > > > -diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk
> > > > > -index 445c285d..3025acb1 100644
> > > > > ---- a/ta/arch/arm/link.mk
> > > > > -+++ b/ta/arch/arm/link.mk
> > > > > -@@ -55,8 +55,11 @@ link-ldflags +=3D --eh-frame-hdr
> > > > > - link-ldadd +=3D $(libstdc++$(sm)) $(libgcc_eh$(sm))
> > > > > - endif
> > > > > - link-ldadd +=3D --end-group
> > > > > --ldargs-$(user-ta-uuid).elf :=3D $(link-ldflags) $(objs) $(link=
-ldadd) $(libgcc$(sm))
> > > > > -
> > > > > -+link-ldadd-after-libgcc +=3D $(addprefix -l,$(libnames-after-l=
ibgcc))
> > > > > -+
> > > > > -+ldargs-$(user-ta-uuid).elf :=3D $(link-ldflags) $(objs) $(link=
-ldadd) \
> > > > > -+                              $(libgcc$(sm)) $(link-ldadd-afte=
r-libgcc)
> > > > > -
> > > > > - link-script-cppflags-$(sm) :=3D \
> > > > > -       $(filter-out $(CPPFLAGS_REMOVE) $(cppflags-remove), \
> > > > > -@@ -76,6 +79,7 @@ $(link-script-pp$(sm)): $(link-script$(sm)) $=
(conf-file) $(link-script-pp-makefi
> > > > > -               $(link-script-cppflags-$(sm)) $$< -o $$@
> > > > > -
> > > > > - $(link-out-dir$(sm))/$(user-ta-uuid).elf: $(objs) $(libdeps) \
> > > > > -+                                        $(libdeps-after-libgcc=
) \
> > > > > -                                         $(link-script-pp$(sm))=
 \
> > > > > -                                         $(dynlistdep) \
> > > > > -                                         $(additional-link-deps=
)
> > > > > ---
> > > > > -2.25.1
> > > > > -
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-os/0003-ta_de=
v_kit.mk-make-sure-that-libutils-is-linked-seco.patch b/meta-arm/recipes-se=
curity/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-=
seco.patch
> > > > > deleted file mode 100644
> > > > > index 88ba5f8..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-os/0003-ta_dev_kit.m=
k-make-sure-that-libutils-is-linked-seco.patch
> > > > > +++ /dev/null
> > > > > @@ -1,44 +0,0 @@
> > > > > -Upstream-Status: Backport
> > > > > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > > > -
> > > > > -From f50962e3f56f0932662b2ffa10afe53339a335dd Mon Sep 17 00:00:=
00 2001
> > > > > -From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > > > > -Date: Fri, 16 Oct 2020 16:36:08 +0300
> > > > > -Subject: [PATCH 3/3] ta_dev_kit.mk: make sure that libutils is =
linked second
> > > > > - time
> > > > > -
> > > > > -libgcc depends on __getauxval symbol from libuils. As, generall=
y libutils
> > > > > -is linked before libgcc, we will get "unresolved symbol" error.=
 To resolve
> > > > > -this dependency we need to link libutils second time - after li=
bgcc.
> > > > > -
> > > > > -Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > > > > -Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > -Reviewed-by: Jerome Forissier <jerome@forissier.org>
> > > > > ----
> > > > > - ta/mk/ta_dev_kit.mk | 10 ++++++++++
> > > > > - 1 file changed, 10 insertions(+)
> > > > > -
> > > > > -diff --git a/ta/mk/ta_dev_kit.mk b/ta/mk/ta_dev_kit.mk
> > > > > -index e28be677..d0e66317 100644
> > > > > ---- a/ta/mk/ta_dev_kit.mk
> > > > > -+++ b/ta/mk/ta_dev_kit.mk
> > > > > -@@ -78,6 +78,16 @@ endif
> > > > > - libnames +=3D dl
> > > > > - libdeps +=3D $(ta-dev-kit-dir$(sm))/lib/libdl.a
> > > > > -
> > > > > -+# libutils provides __getauxval symbol which is needed by libg=
cc 10.x. We can't
> > > > > -+# link libutils after libgcc, because libgcc will replace some=
 symbols provided
> > > > > -+# by libutils, which will cause further linking issues.
> > > > > -+#
> > > > > -+# But if we place libutils before libgcc, linker will not be a=
ble to resolve
> > > > > -+# __getauxval. So we need to link with libutils twice: before =
and after libgcc.
> > > > > -+# Hence it included both in $(libnames) and in $(libnames-afte=
r-libgcc)
> > > > > -+libnames-after-libgcc +=3D utils
> > > > > -+libdeps-after-libgcc +=3D $(ta-dev-kit-dir$(sm))/lib/libutils.=
a
> > > > > -+
> > > > > - # Pass config variable (CFG_) from conf.mk on the command line
> > > > > - cppflags$(sm) +=3D $(strip \
> > > > > -       $(foreach var, $(filter CFG_%,$(.VARIABLES)), \
> > > > > ---
> > > > > -2.25.1
> > > > > -
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-os_3.11.0.bb =
b/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
> > > > > deleted file mode 100644
> > > > > index 13b3dc6..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
> > > > > +++ /dev/null
> > > > > @@ -1,11 +0,0 @@
> > > > > -require optee-os.inc
> > > > > -
> > > > > -SRCREV =3D "c4def2a8262a03244d9a88461699b9b8e43c6b55"
> > > > > -
> > > > > -SRC_URI_append =3D " \
> > > > > -    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> > > > > -    file://0007-allow-setting-sysroot-for-clang.patch \
> > > > > -    file://0001-libutils-provide-empty-__getauxval-implementati=
on.patch \
> > > > > -    file://0002-link.mk-implement-support-for-libnames-after-li=
bgcc-.patch \
> > > > > -    file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked=
-seco.patch \
> > > > > -"
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb =
b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > > > > new file mode 100644
> > > > > index 0000000..3289e2c
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > > > > @@ -0,0 +1,8 @@
> > > > > +require optee-os.inc
> > > > > +
> > > > > +SRCREV =3D "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
> > > > > +
> > > > > +SRC_URI_append =3D " \
> > > > > +    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> > > > > +    file://0007-allow-setting-sysroot-for-clang.patch \
> > > > > +"
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/me=
ta-arm/recipes-security/optee/optee-test.inc
> > > > > index f09b9d2..bcbcc06 100644
> > > > > --- a/meta-arm/recipes-security/optee/optee-test.inc
> > > > > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> > > > > @@ -8,17 +8,9 @@ LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md=
5=3Ddaa2bcccc666345ab8940aab1315a4fa"
> > > > >  inherit python3native ptest
> > > > >  require optee.inc
> > > > >
> > > > > -# Linking fails on musl due to C++/threads
> > > > > -# https://github.com/OP-TEE/optee_test/issues/458#issuecomment-=
720540834
> > > > > -# When upgraded we should be able to remove this limitation
> > > > > -COMPATIBLE_HOST_libc-musl =3D 'null'
> > > > > -
> > > > >  DEPENDS =3D "optee-client optee-os python3-pycryptodome-native"
> > > > >
> > > > >  SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
> > > > > -           file://0001-host-xtest-Adjust-order-of-including-com=
piler.h.patch \
> > > > > -           file://0002-make-remove-Wno-unsafe-loop-for-clang.pa=
tch \
> > > > > -           file://0003-make-remove-Wmissing-noreturn-for-clang.=
patch \
> > > > >             file://run-ptest \
> > > > >            "
> > > > >
> > > > > @@ -36,6 +28,7 @@ do_compile() {
> > > > >      # Top level makefile doesn't seem to handle parallel make g=
racefully
> > > > >      oe_runmake xtest
> > > > >      oe_runmake ta
> > > > > +    oe_runmake test_plugin
> > > > >  }
> > > > >  do_compile[cleandirs] =3D "${B}"
> > > > >
> > > > > @@ -46,9 +39,13 @@ do_install () {
> > > > >      # default TEEC_LOAD_PATH is /lib
> > > > >      mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
> > > > >      install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libd=
ir}/optee_armtz/
> > > > > +    mkdir -p ${D}${libdir}/tee-supplicant/plugins
> > > > > +    install -D -p -m0444 ${B}/supp_plugin/*.plugin ${D}${libdir=
}/tee-supplicant/plugins/
> > > > >  }
> > > > >
> > > > > -FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
> > > > > +FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/ \
> > > > > +                ${libdir}/tee-supplicant/plugins/ \
> > > > > +               "
> > > > >
> > > > >  # Imports machine specific configs from staging to build
> > > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-test/0001-hos=
t-xtest-Adjust-order-of-including-compiler.h.patch b/meta-arm/recipes-secur=
ity/optee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.p=
atch
> > > > > deleted file mode 100644
> > > > > index 3c500d7..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-test/0001-host-xtest=
-Adjust-order-of-including-compiler.h.patch
> > > > > +++ /dev/null
> > > > > @@ -1,64 +0,0 @@
> > > > > -From fc95b3ccbbfd336797ae2cfd6dd4dc58644e146f Mon Sep 17 00:00:=
00 2001
> > > > > -From: Khem Raj <raj.khem@gmail.com>
> > > > > -Date: Sat, 30 May 2020 17:52:18 -0700
> > > > > -Subject: [PATCH] host/xtest: Adjust order of including compiler=
.h
> > > > > -
> > > > > -compiler.h defines some defines which violate libc namespace e.=
g.
> > > > > -__unused, this works ok with glibc but fails in awkward ways wi=
th musl
> > > > > -the reason is musl uses __unused in its internal structures and=
 this
> > > > > -define in compiler.h conflicts with system headers causing erro=
rs like
> > > > > -
> > > > > -recipe-sysroot/usr/include/bits/stat.h:17:19: error: expected i=
dentifier or '(' before '[' token unsigned __unused[2];
> > > > > -                   ^
> > > > > -including compiler.h afer sys/stat.h fixes the problem.
> > > > > -
> > > > > -Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/=
issues/453]
> > > > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ----
> > > > > - host/xtest/install_ta.c | 2 +-
> > > > > - host/xtest/stats.c      | 2 +-
> > > > > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > > > > -
> > > > > -diff --git a/host/xtest/install_ta.c b/host/xtest/install_ta.c
> > > > > -index 09a4c6d..6f7bb5c 100644
> > > > > ---- a/host/xtest/install_ta.c
> > > > > -+++ b/host/xtest/install_ta.c
> > > > > -@@ -4,7 +4,6 @@
> > > > > -  * SPDX-License-Identifier: BSD-2-Clause
> > > > > -  */
> > > > > -
> > > > > --#include <compiler.h>
> > > > > - #include <dirent.h>
> > > > > - #include <err.h>
> > > > > - #include <errno.h>
> > > > > -@@ -20,6 +19,7 @@
> > > > > - #include <sys/types.h>
> > > > > - #include <tee_client_api.h>
> > > > > - #include <unistd.h>
> > > > > -+#include <compiler.h>
> > > > > -
> > > > > - #include "install_ta.h"
> > > > > - #include "xtest_helpers.h"
> > > > > -diff --git a/host/xtest/stats.c b/host/xtest/stats.c
> > > > > -index 96b0b5f..db9bf25 100644
> > > > > ---- a/host/xtest/stats.c
> > > > > -+++ b/host/xtest/stats.c
> > > > > -@@ -3,7 +3,6 @@
> > > > > -  * Copyright (c) 2019, Linaro Limited
> > > > > -  */
> > > > > -
> > > > > --#include <compiler.h>
> > > > > - #include <dirent.h>
> > > > > - #include <err.h>
> > > > > - #include <errno.h>
> > > > > -@@ -18,6 +17,7 @@
> > > > > - #include <sys/types.h>
> > > > > - #include <tee_client_api.h>
> > > > > - #include <unistd.h>
> > > > > -+#include <compiler.h>
> > > > > - #include "xtest_test.h"
> > > > > - #include "stats.h"
> > > > > -
> > > > > ---
> > > > > -2.26.2
> > > > > -
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-test/0002-mak=
e-remove-Wno-unsafe-loop-for-clang.patch b/meta-arm/recipes-security/optee/=
optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch
> > > > > deleted file mode 100644
> > > > > index 17dd7d8..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-test/0002-make-remov=
e-Wno-unsafe-loop-for-clang.patch
> > > > > +++ /dev/null
> > > > > @@ -1,31 +0,0 @@
> > > > > -From 438533ce9da1df0b7c7914e64b39ffdc1da1ab79 Mon Sep 17 00:00:=
00 2001
> > > > > -From: Brett Warren <brett.warran@arm.com>
> > > > > -Date: Thu, 8 Oct 2020 10:03:25 +0100
> > > > > -Subject: [PATCH] make: remove -Wmissing-noreturn for clang
> > > > > -
> > > > > -When compiling when clang, -Wmissing-noreturn causes an error b=
ecause
> > > > > -of non-compliant code. This option is removed to workaround thi=
s.
> > > > > -
> > > > > -Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/=
issues/452]
> > > > > -Changed-Id: 71cb511904547d790d1ea98f93bf8e5a6afcb36d
> > > > > -Signed-off-by: Brett Warren <brett.warren@arm.com>
> > > > > ----
> > > > > - host/xtest/Makefile | 2 +-
> > > > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > -
> > > > > -diff --git a/host/xtest/Makefile b/host/xtest/Makefile
> > > > > -index 3c206b0..96746de 100644
> > > > > ---- a/host/xtest/Makefile
> > > > > -+++ b/host/xtest/Makefile
> > > > > -@@ -169,7 +169,7 @@ CFLAGS +=3D -Wall -Wcast-align -Werror \
> > > > > -         -Werror-implicit-function-declaration -Wextra -Wfloat-=
equal \
> > > > > -         -Wformat-nonliteral -Wformat-security -Wformat=3D2 -Wi=
nit-self \
> > > > > -         -Wmissing-declarations -Wmissing-format-attribute \
> > > > > --        -Wmissing-include-dirs -Wmissing-noreturn \
> > > > > -+        -Wmissing-include-dirs \
> > > > > -         -Wmissing-prototypes -Wnested-externs -Wpointer-arith =
\
> > > > > -         -Wshadow -Wstrict-prototypes -Wswitch-default \
> > > > > -         -Wwrite-strings \
> > > > > ---
> > > > > -2.17.1
> > > > > -
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-test/0003-mak=
e-remove-Wmissing-noreturn-for-clang.patch b/meta-arm/recipes-security/opte=
e/optee-test/0003-make-remove-Wmissing-noreturn-for-clang.patch
> > > > > deleted file mode 100644
> > > > > index bbc303f..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-test/0003-make-remov=
e-Wmissing-noreturn-for-clang.patch
> > > > > +++ /dev/null
> > > > > @@ -1,31 +0,0 @@
> > > > > -From ed5a9d9f7a3e9e14ca0e8aea59008124ee0e5f96 Mon Sep 17 00:00:=
00 2001
> > > > > -From: Brett Warren <brett.warren@arm.com>
> > > > > -Date: Thu, 8 Oct 2020 10:20:52 +0100
> > > > > -Subject: [PATCH] make: remove -Wno-unsafe-loop for clang
> > > > > -
> > > > > -When compiling with clang, the -Wno-unsafe-loop-optimizations o=
ption
> > > > > -throws an error because clang doesn't recognise it. This option=
 is
> > > > > -removed to workaround this.
> > > > > -
> > > > > -Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/=
issues/452]
> > > > > -Change-Id: 5fe0892c73208aaffac8c9995cb3275936fb1ba6
> > > > > -Signed-off-by: Brett Warren <brett.warren@arm.com>
> > > > > ----
> > > > > - host/xtest/Makefile | 1 -
> > > > > - 1 file changed, 1 deletion(-)
> > > > > -
> > > > > -diff --git a/host/xtest/Makefile b/host/xtest/Makefile
> > > > > -index 96746de..73731d0 100644
> > > > > ---- a/host/xtest/Makefile
> > > > > -+++ b/host/xtest/Makefile
> > > > > -@@ -174,7 +174,6 @@ CFLAGS +=3D -Wall -Wcast-align -Werror \
> > > > > -         -Wshadow -Wstrict-prototypes -Wswitch-default \
> > > > > -         -Wwrite-strings \
> > > > > -         -Wno-declaration-after-statement \
> > > > > --        -Wno-unsafe-loop-optimizations \
> > > > > -         -Wno-missing-field-initializers -Wno-format-zero-lengt=
h
> > > > > - endif
> > > > > -
> > > > > ---
> > > > > -2.17.1
> > > > > -
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-test_3.11.0.b=
b b/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
> > > > > deleted file mode 100644
> > > > > index 0f8b5b0..0000000
> > > > > --- a/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
> > > > > +++ /dev/null
> > > > > @@ -1,3 +0,0 @@
> > > > > -require optee-test.inc
> > > > > -
> > > > > -SRCREV =3D "159e295d5cc3ad2275ab15fe544620f6604d4ba4"
> > > > > diff --git a/meta-arm/recipes-security/optee/optee-test_3.14.0.b=
b b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > > > > new file mode 100644
> > > > > index 0000000..6367c27
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > > > > @@ -0,0 +1,3 @@
> > > > > +require optee-test.inc
> > > > > +
> > > > > +SRCREV =3D "f2eb88affbb7f028561b4fd5cbd049d5d704f741"
> > > > > --
> > > > > 2.25.1
> > > > >
> > > > >
> > > > >
> > > > >
> > >
> > >=20
> > >
