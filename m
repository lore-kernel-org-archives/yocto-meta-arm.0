Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E1DC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 05:31:17 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.7817.1646285476617771387
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 21:31:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=G0DEhp21;
 spf=pass (domain: linaro.org, ip: 209.85.208.172,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id bn33so5288761ljb.6
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 21:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dIespXSVsXWFZaqzbfDsjBPRaN14fM5X3rBvaFajZ6k=;
        b=G0DEhp21jEuqaTcVmR250mFm5K1gVIBkOI6JsGtd9/TlxEBAh/SYpRtcWXT2Q7UUEs
         PrLXFeuY6uCg984hkFe2HHTKQ0PhT+zlf0msb0kY3pVhue8QPV5UsJIXiSnoMzx4A9Et
         V4NASs6Mf6SG+UY4y3TwBavSeUwX4G4aN1FMeXZ5tsUr3c4JDMi1IPTPg32pYjpQIIVt
         9pGOMhHTr1WgkiVkil7uGGTDtK52VU5aedL7FST0ZTyrffxDF2BiKaQcT1zVeQDWwRIE
         W1EQzRkdL0x2+52R7STpHd6BWbYE9inErMqGP2dyu4YOpZvQ1xp/npzT06lbxtg5UWYD
         zRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dIespXSVsXWFZaqzbfDsjBPRaN14fM5X3rBvaFajZ6k=;
        b=CSxJeKP/J4ev/d+1BJyADWMl7hb5gXjfBE2ppIoKBPV1Nu6mCtxrAEGejjn93Bwuak
         hHN+6TToaplL8/oOez07BssT41ahvXNweKksVT77/Mq6szdqBp0rIS0d1kkwdTBBViVz
         vskTF/ni7RwCZmQoFoRH8o8uZvKsJPC4wzeeR86v1NC2W1ZRrj9dGppekjqwYCqOXpvA
         xVgNezq25+J0xRnklMEiHnR2Xi1Iu8iT4QE+UxqvnmtKFNRFY15yZ01supwGR75NBQCn
         s7FYi2bCN6KWfjItRb6f9Q/bVKhtH/RLtqxjMspO2zNz3xS7itIMwFTYvnBwu9xqoNfe
         nQwg==
X-Gm-Message-State: AOAM531PaOceQ7FwaWN7XY9mQnwi+Zegor5+3lfP8sYCLW3wjemwOjXX
	kBdKWVMyzdayDgj7ogFLeUg5Av9NCEP1QZzSru7Gsw==
X-Google-Smtp-Source: 
 ABdhPJz5ypvLmoMWOX/Loz/t1CdQ8y4zVdQYyLsM/cyy/0mgCEZSBnz7HydnNFNax0y/Aelc1oR5tQtl0M5h15UGyxw=
X-Received: by 2002:a2e:8895:0:b0:246:3e9a:df64 with SMTP id
 k21-20020a2e8895000000b002463e9adf64mr22791859lji.323.1646285474482; Wed, 02
 Mar 2022 21:31:14 -0800 (PST)
MIME-Version: 1.0
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
 <Yh5JYWMmAd6SnmOS@kudzu.us>
 <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
 <Yh+DX8uaoS1VPpQ8@kudzu.us>
In-Reply-To: <Yh+DX8uaoS1VPpQ8@kudzu.us>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 3 Mar 2022 11:01:01 +0530
Message-ID: 
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
To: Jon Mason <jdmason@kudzu.us>,
 Alejandro Hernandez <alhe@linux.microsoft.com>
Cc: meta-arm@lists.yoctoproject.org,
 Vishnu Banavath <vishnu.banavath@arm.com>,
	Maxim Uvarov <maxim.uvarov@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
	Denys Dmytriyenko <denis@denix.org>, Drew Reed <drew.reed@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 05:31:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3092

On Wed, 2 Mar 2022 at 20:16, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, Mar 01, 2022 at 09:54:04PM +0000, Alejandro Hernandez wrote:
> > Hi John,
> >
> > On 3/1/22 16:27, Jon Mason wrote:
> > > On Fri, Feb 25, 2022 at 08:04:41PM -0700, Alejandro Enedino Hernandez Samaniego wrote:
> > > > - Removes upstreamed patches for optee-examples
> > > > - Fixes optee-examples installation
> > > > - Includes new python3-cryptography dependency
> > > > - Fixes python3-cryptography to work with openssl
> > > >
> > > > Tested on qemuarm64-secureboot via optee-examples xtest -l 15
> > > With the new changes in python3-crypto, this is no longer working.
> > > I'm seeing the following error in CI.
> > >
> > > --- Error summary ---
> > > ERROR: Nothing PROVIDES 'python3-cryptography-native' (but /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee/optee-os_3.16.0.bb DEPENDS on or otherwise requires it). Close matches:
> > >    python3-cython-native
> > >    python3-pycryptodome-native
> > >    python3-typogrify-native
> > >
> > > I _think_ that adding meta-openembedded.yml being adding to the
> > > machines should fix it, but I'm not sure that is the right solution.
> > >
> > > Thanks,
> > > Jon
> >
> > My apologies, I was testing with meta-oe/meta-python enabled hence I didnt
> > see the error before.
> >
> >
> > I'm not sure its the right solution either, this dependency is coming from
> > the pem_to_pub_c.py script which is now using python3-cyrptography since
> > commit https://github.com/OP-TEE/optee_os/commit/169eac19852d98d8ade821f913bbdd76faf52823
> > (this also means we could remove python3-cryptodome from the dependencies as
> > well), as far as I can tell this creates a hard dependency, passing
> > EXTRA_OEMAKE += " CFG_WITH_USER_TA=n" would avoid executing the script
> > completely but I also dont think thats what we want.
> >
> > Should we include meta-openembedded.yml?,  or what other choice do we have?
> > create a python3-cyrptography recipe to meta-arm?, thoughts?

Yes, we should include meta-openembedded.yml as a dependency and
remove python3-cryptodome from the dependencies.

-Sumit

>
> OPTEE isn't an area I understand well (to know whether removing this
> is superior to adding the dependency in the files).  So, I'm directly
> cc'ing contributors that I think will have an opinion to this
> response.
>
> Thanks,
> Jon
>
> >
> > Cheers,
> >
> > Alejandro
> >
> > > > Signed-off-by: Alejandro Enedino Hernandez Samaniego<alhe@linux.microsoft.com>
> > > > ---
> > > >   ....bbappend => optee-client_3.16.0.bbappend} |  0
> > > >   ...pend => optee-os-tadevkit_3.16.0.bbappend} |  0
> > > >   ...14.0.bbappend => optee-os_3.16.0.bbappend} |  0
> > > >   ....0.bbappend => optee-test_3.16.0.bbappend} |  0
> > > >   .../optee-ftpm/optee-ftpm_git.bb              |  8 +-
> > > >   .../optee/optee-client_3.14.0.bb              |  3 -
> > > >   .../optee/optee-client_3.16.0.bb              |  3 +
> > > >   .../recipes-security/optee/optee-examples.inc |  7 +-
> > > >   ...ix-non-portable-sh-check-for-plugins.patch | 46 ++++++++++
> > > >   ...efault-cross-compiler-environment-se.patch | 84 -------------------
> > > >   ...nable-plugins-installation-in-rootfs.patch | 37 --------
> > > >   .../optee/optee-examples_3.14.0.bb            |  4 -
> > > >   .../optee/optee-examples_3.16.0.bb            |  3 +
> > > >   ..._3.14.0.bb => optee-os-tadevkit_3.16.0.bb} |  3 +-
> > > >   meta-arm/recipes-security/optee/optee-os.inc  |  2 +-
> > > >   ...{optee-os_3.14.0.bb => optee-os_3.16.0.bb} |  2 +-
> > > >   .../recipes-security/optee/optee-test.inc     |  2 +-
> > > >   .../optee/optee-test_3.14.0.bb                |  3 -
> > > >   .../optee/optee-test_3.16.0.bb                |  3 +
> > > >   meta-arm/recipes-security/optee/optee.inc     |  3 +
> > > >   20 files changed, 73 insertions(+), 140 deletions(-)
> > > >   rename meta-arm-bsp/recipes-security/optee/{optee-client_3.14.0.bbappend => optee-client_3.16.0.bbappend} (100%)
> > > >   rename meta-arm-bsp/recipes-security/optee/{optee-os-tadevkit_3.14.0.bbappend => optee-os-tadevkit_3.16.0.bbappend} (100%)
> > > >   rename meta-arm-bsp/recipes-security/optee/{optee-os_3.14.0.bbappend => optee-os_3.16.0.bbappend} (100%)
> > > >   rename meta-arm-bsp/recipes-security/optee/{optee-test_3.14.0.bbappend => optee-test_3.16.0.bbappend} (100%)
> > > >   delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > > >   create mode 100644 meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> > > >   create mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch
> > > >   delete mode 100644 meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-environment-se.patch
> > > >   delete mode 100644 meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.patch
> > > >   delete mode 100644 meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > > >   create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> > > >   rename meta-arm/recipes-security/optee/{optee-os-tadevkit_3.14.0.bb => optee-os-tadevkit_3.16.0.bb} (94%)
> > > >   rename meta-arm/recipes-security/optee/{optee-os_3.14.0.bb => optee-os_3.16.0.bb} (76%)
> > > >   delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > > >   create mode 100644 meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> > > >
> > > > diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappend
> > > > similarity index 100%
> > > > rename from meta-arm-bsp/recipes-security/optee/optee-client_3.14.0.bbappend
> > > > rename to meta-arm-bsp/recipes-security/optee/optee-client_3.16.0.bbappend
> > > > diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.16.0.bbappend
> > > > similarity index 100%
> > > > rename from meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend
> > > > rename to meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.16.0.bbappend
> > > > diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappend
> > > > similarity index 100%
> > > > rename from meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
> > > > rename to meta-arm-bsp/recipes-security/optee/optee-os_3.16.0.bbappend
> > > > diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
> > > > similarity index 100%
> > > > rename from meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
> > > > rename to meta-arm-bsp/recipes-security/optee/optee-test_3.16.0.bbappend
> > > > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > > index f2a74da..0eb64cd 100644
> > > > --- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > > @@ -15,7 +15,9 @@ inherit deploy python3native
> > > >   LICENSE = "MIT"
> > > >   LIC_FILES_CHKSUM ="file://${S}/LICENSE;md5=27e94c0280987ab296b0b8dd02ab9fe5"
> > > > -DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native optee-os-tadevkit"
> > > > +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native optee-os-tadevkit \
> > > > +    python3-cryptography-native \
> > > > +    "
> > > >   FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> > > > @@ -48,6 +50,10 @@ EXTRA_OEMAKE:append:aarch64:qemuall = "\
> > > >       CFG_ARM64_ta_arm64=y \
> > > >   "
> > > > +# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES to the
> > > > +# right path until this is relocated automatically.
> > > > +export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
> > > > +
> > > >   PARALLEL_MAKE = ""
> > > >   do_compile() {
> > > > diff --git a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > > > deleted file mode 100644
> > > > index be78b88..0000000
> > > > --- a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > > > +++ /dev/null
> > > > @@ -1,3 +0,0 @@
> > > > -require optee-client.inc
> > > > -
> > > > -SRCREV = "06e1b32f6a7028e039c625b07cfc25fda0c17d53"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-client_3.16.0.bb b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> > > > new file mode 100644
> > > > index 0000000..4a36cbc
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
> > > > @@ -0,0 +1,3 @@
> > > > +require optee-client.inc
> > > > +
> > > > +SRCREV = "06db73b3f3fdb8d23eceaedbc46c49c0b45fd1e2"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> > > > index 656722e..097f892 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > > > @@ -5,16 +5,14 @@ HOMEPAGE ="https://github.com/linaro-swg/optee_examples"
> > > >   LICENSE = "BSD-2-Clause"
> > > >   LIC_FILES_CHKSUM ="file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
> > > > -DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
> > > > +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native python3-cryptography-native"
> > > >   inherit python3native
> > > >   require optee.inc
> > > >   SRC_URI = "git://github.com/linaro-swg/optee_examples.git;branch=master;protocol=https \
> > > > -file://0001-plugins-Honour-default-cross-compiler-environment-se.patch  \
> > > > -file://0002-Makefile-Enable-plugins-installation-in-rootfs.patch  \
> > > > -          "
> > > > +file://0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch"
> > > >   EXTRA_OEMAKE += "TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> > > >                    HOST_CROSS_COMPILE=${HOST_PREFIX} \
> > > > @@ -25,6 +23,7 @@ EXTRA_OEMAKE += "TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> > > >   S = "${WORKDIR}/git"
> > > >   B = "${WORKDIR}/build"
> > > > +
> > > >   do_compile() {
> > > >       oe_runmake -C ${S}
> > > >   }
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch
> > > > new file mode 100644
> > > > index 0000000..70add62
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee-examples/0001-Makefile-Fix-non-portable-sh-check-for-plugins.patch
> > > > @@ -0,0 +1,46 @@
> > > > +From 11610debf750f15c7a104db7315dcd7d69e282a8 Mon Sep 17 00:00:00 2001
> > > > +From: Alejandro Enedino Hernandez Samaniego<alhe@linux.microsoft.com>
> > > > +Date: Sat, 26 Feb 2022 01:52:26 +0000
> > > > +Subject: [PATCH] Makefile: Fix non-portable sh check for plugins
> > > > +
> > > > +Upstream-Status: Pending
> > > > +
> > > > +We previously held a patch that used "=" for comparison, but when
> > > > +that patch got upstreamed it was changed to "==" which is non-portable,
> > > > +resulting in an error:
> > > > +
> > > > +/bin/sh: 6: [: acipher: unexpected operator
> > > > +/bin/sh: 6: [: plugins: unexpected operator
> > > > +/bin/sh: 6: [: hello_world: unexpected operator
> > > > +/bin/sh: 6: [: hotp: unexpected operator
> > > > +/bin/sh: 6: [: aes: unexpected operator
> > > > +/bin/sh: 6: [: random: unexpected operator
> > > > +/bin/sh: 6: [: secure_storage: unexpected operator
> > > > +
> > > > +if /bin/sh doesnt point to bash.
> > > > +
> > > > +Which in turn causes our do_install task to fail since plugins arent
> > > > +where we expect them to be.
> > > > +
> > > > +
> > > > +Signed-off-by: Alejandro Enedino Hernandez Samaniego<alhe@linux.microsoft.com>
> > > > +---
> > > > + Makefile | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/Makefile b/Makefile
> > > > +index b3f16aa..9359d95 100644
> > > > +--- a/Makefile
> > > > ++++ b/Makefile
> > > > +@@ -31,7 +31,7 @@ prepare-for-rootfs: examples
> > > > +                         cp -p $$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
> > > > +                 fi; \
> > > > +                 cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \
> > > > +-                if [ $$example == plugins ]; then \
> > > > ++                if [ $$example = plugins ]; then \
> > > > +                         cp -p plugins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \
> > > > +                 fi; \
> > > > +         done
> > > > +--
> > > > +2.25.1
> > > > +
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-environment-se.patch b/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-environment-se.patch
> > > > deleted file mode 100644
> > > > index 033e48c..0000000
> > > > --- a/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-environment-se.patch
> > > > +++ /dev/null
> > > > @@ -1,84 +0,0 @@
> > > > -From 79c826c249001700007a6dffe80c3d61ff4428ef Mon Sep 17 00:00:00 2001
> > > > -From: Sumit Garg<sumit.garg@linaro.org>
> > > > -Date: Tue, 20 Jul 2021 13:54:30 +0530
> > > > -Subject: [PATCH 1/2] plugins: Honour default cross compiler environment setup
> > > > -
> > > > -Honour default $(CC), $(CFLAGS) and $(LDFLAGS) variables. Without this
> > > > -plugins example fails to build for OE/Yocto.
> > > > -
> > > > -Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examples/pull/87]
> > > > -
> > > > -Signed-off-by: Sumit Garg<sumit.garg@linaro.org>
> > > > ----
> > > > - plugins/Makefile        |  2 +-
> > > > - plugins/host/Makefile   |  2 +-
> > > > - plugins/syslog/Makefile | 16 ++++++++++++----
> > > > - 3 files changed, 14 insertions(+), 6 deletions(-)
> > > > -
> > > > -diff --git a/plugins/Makefile b/plugins/Makefile
> > > > -index 2372b38..ea472b4 100644
> > > > ---- a/plugins/Makefile
> > > > -+++ b/plugins/Makefile
> > > > -@@ -8,7 +8,7 @@ TA_CROSS_COMPILE ?= $(CROSS_COMPILE)
> > > > - all:
> > > > -         $(MAKE) -C host CROSS_COMPILE="$(HOST_CROSS_COMPILE)" --no-builtin-variables
> > > > -         $(MAKE) -C ta CROSS_COMPILE="$(TA_CROSS_COMPILE)" LDFLAGS=""
> > > > --        $(MAKE) -C syslog CROSS_COMPILE="$(HOST_CROSS_COMPILE)"
> > > > -+        $(MAKE) -C syslog CROSS_COMPILE="$(HOST_CROSS_COMPILE)" --no-builtin-variables
> > > > -
> > > > - .PHONY: clean
> > > > - clean:
> > > > -diff --git a/plugins/host/Makefile b/plugins/host/Makefile
> > > > -index 7285104..76244c7 100644
> > > > ---- a/plugins/host/Makefile
> > > > -+++ b/plugins/host/Makefile
> > > > -@@ -20,7 +20,7 @@ BINARY = optee_example_plugins
> > > > - all: $(BINARY)
> > > > -
> > > > - $(BINARY): $(OBJS)
> > > > --        $(CC) -o $@ $< $(LDADD)
> > > > -+        $(CC) $(LDFLAGS) -o $@ $< $(LDADD)
> > > > -
> > > > - .PHONY: clean
> > > > - clean:
> > > > -diff --git a/plugins/syslog/Makefile b/plugins/syslog/Makefile
> > > > -index 62d916a..71f5f92 100644
> > > > ---- a/plugins/syslog/Makefile
> > > > -+++ b/plugins/syslog/Makefile
> > > > -@@ -1,3 +1,11 @@
> > > > -+CC      ?= $(CROSS_COMPILE)gcc
> > > > -+LD      ?= $(CROSS_COMPILE)ld
> > > > -+AR      ?= $(CROSS_COMPILE)ar
> > > > -+NM      ?= $(CROSS_COMPILE)nm
> > > > -+OBJCOPY ?= $(CROSS_COMPILE)objcopy
> > > > -+OBJDUMP ?= $(CROSS_COMPILE)objdump
> > > > -+READELF ?= $(CROSS_COMPILE)readelf
> > > > -+
> > > > - PLUGIN_UUID = 96bcf744-4f72-4866-bf1d-8634fd9c65e5
> > > > -
> > > > - PLUGIN                  = $(PLUGIN_UUID).plugin
> > > > -@@ -6,17 +14,17 @@ PLUGIN_OBJ            = $(patsubst %.c, %.o, $(PLUGIN_SRS))
> > > > - PLUGIN_INCLUDES_DIR     = $(CURDIR) $(TEEC_EXPORT)/include
> > > > -
> > > > - PLUGIN_INCLUDES         = $(addprefix -I, $(PLUGIN_INCLUDES_DIR))
> > > > --PLUGIN_CCFLAGS          = -Wall -fPIC
> > > > --PLUGIN_LDFLAGS          = -shared
> > > > -+PLUGIN_CCFLAGS          = $(CFLAGS) -Wall -fPIC
> > > > -+PLUGIN_LDFLAGS          = $(LDFLAGS) -shared
> > > > -
> > > > - .PHONY: all
> > > > - all: $(PLUGIN)
> > > > -
> > > > - $(PLUGIN): $(PLUGIN_OBJ)
> > > > --        $(CROSS_COMPILE)gcc $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
> > > > -+        $(CC) $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
> > > > -
> > > > - %.o: %.c
> > > > --        $(CROSS_COMPILE)gcc $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*.o
> > > > -+        $(CC) $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*.o
> > > > -
> > > > - .PHONY: clean
> > > > - clean:
> > > > ---
> > > > -2.25.1
> > > > -
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.patch b/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.patch
> > > > deleted file mode 100644
> > > > index 80e6b5f..0000000
> > > > --- a/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.patch
> > > > +++ /dev/null
> > > > @@ -1,37 +0,0 @@
> > > > -From f4e5e74548d92258855434b550c58fe44993c148 Mon Sep 17 00:00:00 2001
> > > > -From: Sumit Garg<sumit.garg@linaro.org>
> > > > -Date: Tue, 20 Jul 2021 14:20:10 +0530
> > > > -Subject: [PATCH] Makefile: Enable plugins installation in rootfs
> > > > -
> > > > -Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examples/pull/87]
> > > > -
> > > > -Signed-off-by: Sumit Garg<sumit.garg@linaro.org>
> > > > -
> > > > ----
> > > > - Makefile | 5 +++++
> > > > - 1 file changed, 5 insertions(+)
> > > > -
> > > > -diff --git a/Makefile b/Makefile
> > > > -index a275842..9359d95 100644
> > > > ---- a/Makefile
> > > > -+++ b/Makefile
> > > > -@@ -25,14 +25,19 @@ prepare-for-rootfs: examples
> > > > -         @mkdir -p $(OUTPUT_DIR)
> > > > -         @mkdir -p $(OUTPUT_DIR)/ta
> > > > -         @mkdir -p $(OUTPUT_DIR)/ca
> > > > -+        @mkdir -p $(OUTPUT_DIR)/plugins
> > > > -         @for example in $(EXAMPLE_LIST); do \
> > > > -                 if [ -e $$example/host/optee_example_$$example ]; then \
> > > > -                         cp -p $$example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
> > > > -                 fi; \
> > > > -                 cp -pr $$example/ta/*.ta $(OUTPUT_DIR)/ta/; \
> > > > -+                if [ $$example = plugins ]; then \
> > > > -+                        cp -p plugins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \
> > > > -+                fi; \
> > > > -         done
> > > > -
> > > > - prepare-for-rootfs-clean:
> > > > -         @rm -rf $(OUTPUT_DIR)/ta
> > > > -         @rm -rf $(OUTPUT_DIR)/ca
> > > > -+        @rm -rf $(OUTPUT_DIR)/plugins
> > > > -         @rmdir --ignore-fail-on-non-empty $(OUTPUT_DIR) || test ! -e $(OUTPUT_DIR)
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > > > deleted file mode 100644
> > > > index f2b5f7d..0000000
> > > > --- a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > > > +++ /dev/null
> > > > @@ -1,4 +0,0 @@
> > > > -require optee-examples.inc
> > > > -
> > > > -SRCREV = "e9c870525af8f7e7fccf575a0ca5394ce55adcec"
> > > > -
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> > > > new file mode 100644
> > > > index 0000000..b5f6269
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
> > > > @@ -0,0 +1,3 @@
> > > > +require optee-examples.inc
> > > > +
> > > > +SRCREV = "65fc74309e12189ad5b6ce3ffec37c8011088a5a"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
> > > > similarity index 94%
> > > > rename from meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > > rename to meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
> > > > index 0d37a52..c710e27 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
> > > > @@ -1,10 +1,11 @@
> > > >   FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
> > > > -require optee-os_3.14.0.bb
> > > > +require optee-os_3.16.0.bb
> > > >   SUMMARY = "OP-TEE Trusted OS TA devkit"
> > > >   DESCRIPTION = "OP-TEE TA devkit for build TAs"
> > > >   HOMEPAGE ="https://www.op-tee.org/"
> > > > +
> > > >   do_install() {
> > > >       #install TA devkit
> > > >       install -d ${D}${includedir}/optee/export-user_ta/
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > > > index 1506a58..57c64fd 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > > @@ -10,7 +10,7 @@ require optee.inc
> > > >   CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
> > > > -DEPENDS = "python3-pycryptodome-native python3-pyelftools-native"
> > > > +DEPENDS = "python3-pycryptodome-native python3-pyelftools-native python3-cryptography-native"
> > > >   DEPENDS:append:toolchain-clang = " compiler-rt"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> > > > similarity index 76%
> > > > rename from meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > > > rename to meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> > > > index 95d82bb..873e964 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > > > +++ b/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
> > > > @@ -1,6 +1,6 @@
> > > >   require optee-os.inc
> > > > -SRCREV = "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
> > > > +SRCREV = "d0b742d1564834dac903f906168d7357063d5459"
> > > >   SRC_URI:append = " \
> > > >       file://0006-allow-setting-sysroot-for-libgcc-lookup.patch  \
> > > > diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> > > > index aada243..33eda29 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-test.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> > > > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM ="file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
> > > >   inherit python3native ptest
> > > >   require optee.inc
> > > > -DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
> > > > +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native python3-cryptography-native"
> > > >   SRC_URI = "git://github.com/OP-TEE/optee_test.git;branch=master;protocol=https \
> > > >              file://run-ptest  \
> > > > diff --git a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > > > deleted file mode 100644
> > > > index 6367c27..0000000
> > > > --- a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > > > +++ /dev/null
> > > > @@ -1,3 +0,0 @@
> > > > -require optee-test.inc
> > > > -
> > > > -SRCREV = "f2eb88affbb7f028561b4fd5cbd049d5d704f741"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-test_3.16.0.bb b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> > > > new file mode 100644
> > > > index 0000000..03f9c34
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
> > > > @@ -0,0 +1,3 @@
> > > > +require optee-test.inc
> > > > +
> > > > +SRCREV = "1cf0e6d2bdd1145370033d4e182634458528579d"
> > > > diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> > > > index f02a022..beae366 100644
> > > > --- a/meta-arm/recipes-security/optee/optee.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee.inc
> > > > @@ -26,3 +26,6 @@ EXTRA_OEMAKE += "V=1 \
> > > >                    OPTEE_CLIENT_EXPORT=${STAGING_DIR_HOST}${prefix} \
> > > >                    TEEC_EXPORT=${STAGING_DIR_HOST}${prefix} \
> > > >                   "
> > > > +# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES to the
> > > > +# right path until this is relocated automatically.
> > > > +export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > > >
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#3088):https://lists.yoctoproject.org/g/meta-arm/message/3088
> > > > Mute This Topic:https://lists.yoctoproject.org/mt/89404067/4354175
> > > > Group Owner:meta-arm+owner@lists.yoctoproject.org
> > > > Unsubscribe:https://lists.yoctoproject.org/g/meta-arm/unsub  [alhe@linux.microsoft.com]
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > >

