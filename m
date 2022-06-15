Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71ECC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 14:18:46 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.5356.1655302724170122341
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 07:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fnO9d8gi;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id c30so13425328ljr.9
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8jhWQkOwGGOJLn9FMnAVW5OvK3QGRhYSL7Mu8DSvG3I=;
        b=fnO9d8giQmXk437+qfiXSGF3HwyS92HT7Tn9d5nu6sDKM9pYfPg6siQYdh9TN4yObl
         dvVH25auAzFstD3Fkn8f218E2JuDgGC5RXubn3z+hcJXWq0CD5+zqcVfkde+Y8KrtmB+
         oy7UWVZeGj/YIw7vrtDC2Aqm7HfvWSL23jGnt7Y86laaJZhCofemvq8guckqY+nkMnRd
         g9SJFpHX4SHoeWoEZDRZek+nXQNrXP1R0FWRfOztQ3S0rIHCIKN00a4qsvDji9jj5Nk9
         HmUXlEqrvWaHk1e8jdSN5KE+cc3kUaX0H+KM0pEPC5tgMgnAodFAFMvmERBPCUfXR8Ic
         0cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8jhWQkOwGGOJLn9FMnAVW5OvK3QGRhYSL7Mu8DSvG3I=;
        b=SldBpWcc+qimf9qD1C85Ie95od9U5AEkrYcFxar1BLX7U0RsFGGXDq8XB1IaCP+Dk6
         SxPwc0nUoXhVytiyMZxcW1oCT+If91xPOd9zdAWFS4OOU1l0cSxOO/P3CP5+2Yp8GOyI
         eNyLz3YCZLwnUa36/AL1byM5Nykzw29sZqjz4Vnmefplri9sspNDV0WlA41KP9c4+vTv
         Xnm1TYb4QZ+67Wx6+w8Qu/il6YshHqPQkm5kp5gHt/5XteCFUoxI6IYaRxtKHlwuEQO4
         pKVgsdsi8hpg9ucJyOwmp4nckjf0jK7LWOhwZCxvmVvm77aeDgKqhuIV24Ae8bz23aZe
         NhWA==
X-Gm-Message-State: AJIora8g68Id0AqEMueD37qx0+ZnpzV1RorUO7KnbeWhI4brSpjMBKvx
	Y0V6BZc7RdVoMws5UsjzksnhPPgzHeJ2vZXCh+4=
X-Google-Smtp-Source: 
 AGRyM1sJBW8YER7JJrwz618bQGh/vEekm387NRL+EVXC6WvoqeuEDmqgtY+sp6o3uoTJupJ5nbXtouWuXILBxa9TjHM=
X-Received: by 2002:a05:651c:8f:b0:255:8e6e:1980 with SMTP id
 15-20020a05651c008f00b002558e6e1980mr5279950ljq.462.1655302721939; Wed, 15
 Jun 2022 07:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220613132016.1062359-1-andrey.z@gmail.com>
 <YqlL/a6n8bB5pjED@kudzu.us>
In-Reply-To: <YqlL/a6n8bB5pjED@kudzu.us>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Wed, 15 Jun 2022 16:18:30 +0200
Message-ID: 
 <CAHtQpK483XdPsDhYQ29fxgtH+_DnoFQo43D+NY2RfVjXdty8fw@mail.gmail.com>
Subject: Re: [meta-arm][PATCH] arm/trusted-firmware-a: upgrade to v2.7
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Jun 2022 14:18:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3505

Hello Jon,

On Wed, Jun 15, 2022 at 5:03 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Jun 13, 2022 at 01:20:16PM +0000, Andrey Zhizhikin wrote:
> > Upstream has version v2.7 released, upgrade recipe to pick up new
> > version.
> >
> > Drop local patches as they are already applied upstream, namely:
> > - build-deps-upgrade-to-mbed-TLS-2.28.0.patch is covered by upstream
> > commit a93084be95 ("build(deps): upgrade to mbed TLS 2.28.0")
> >
> > - ssl.patch is covered by upstream commit 0a956f8180 ("fix(fiptool):
> > respect OPENSSL_DIR")
> >
> > Rename bbappends in meta-arm-bsp to match new PV.
> >
> > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
>
> Thank you for sending this patch out.  I had one queued up internally
> which did the same thing, and had a few extra changes.  I sent this
> out for review.  Please take a look and verify it does everything you
> need.  It passes our CI.

No problem, thanks for following this one up!

I needed the v2.7 upgrade of TF-A because it have support for
`imx8mp-lpddr4-evk` machine from meta-freescale layer.

I've introduced the possibility to use upstream TF-A in the layer,
and in order to test the functionality this update was required.

I've verified your upgrade with `imx8mm-lpddr4-evk` and
`imx8mp-lpddr4-evk` machines, and they are both operable with
your new version.

Your version appears to be way better, as you've taken care of `-tc`
patches and clang builds, which I did not include in simply due to
the fact this was not used by machines I was working on.

>
> Welcome, and I look forward to more patches from you.

Sure, thanks for the invite! :-)

>
> Thanks,
> Jon
>
> > ---
> >  ...s_2.6.bbappend => tf-a-tests_2.7.bbappend} |  0
> >  ...append => trusted-firmware-a_2.7.bbappend} |  0
> >  ...uild-deps-upgrade-to-mbed-TLS-2.28.0.patch | 72 -------------------
> >  .../trusted-firmware-a/files/ssl.patch        | 52 --------------
> >  .../{tf-a-tests_2.6.bb => tf-a-tests_2.7.bb}  |  4 +-
> >  .../trusted-firmware-a/trusted-firmware-a.inc |  4 +-
> >  ...are-a_2.6.bb => trusted-firmware-a_2.7.bb} |  4 +-
> >  7 files changed, 5 insertions(+), 131 deletions(-)
> >  rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.6.bbappend => tf-a-tests_2.7.bbappend} (100%)
> >  rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.6.bbappend => trusted-firmware-a_2.7.bbappend} (100%)
> >  delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
> >  delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
> >  rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.6.bb => tf-a-tests_2.7.bb} (94%)
> >  rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.6.bb => trusted-firmware-a_2.7.bb} (85%)
> >
> > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bbappend
> > similarity index 100%
> > rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
> > rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bbappend
> > diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bbappend
> > similarity index 100%
> > rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend
> > rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bbappend
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
> > deleted file mode 100644
> > index 058423c..0000000
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
> > +++ /dev/null
> > @@ -1,72 +0,0 @@
> > -Upstream-Status: Backport
> > -Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> > -
> > -From a93084be95634b66b917f1c8baf403067dc75c5d Mon Sep 17 00:00:00 2001
> > -From: Sandrine Bailleux <sandrine.bailleux@arm.com>
> > -Date: Thu, 21 Apr 2022 10:21:29 +0200
> > -Subject: [PATCH] build(deps): upgrade to mbed TLS 2.28.0
> > -
> > -Upgrade to the latest and greatest 2.x release of Mbed TLS library
> > -(i.e. v2.28.0) to take advantage of their bug fixes.
> > -
> > -Note that the Mbed TLS project published version 3.x some time
> > -ago. However, as this is a major release with API breakages, upgrading
> > -to 3.x might require some more involved changes in TF-A, which we are
> > -not ready to do. We shall upgrade to mbed TLS 3.x after the v2.7
> > -release of TF-A.
> > -
> > -Actually, the upgrade this time simply boils down to including the new
> > -source code module 'constant_time.c' into the firmware.
> > -
> > -To quote mbed TLS v2.28.0 release notes [1]:
> > -
> > -  The mbedcrypto library includes a new source code module
> > -  constant_time.c, containing various functions meant to resist timing
> > -  side channel attacks. This module does not have a separate
> > -  configuration option, and functions from this module will be
> > -  included in the build as required.
> > -
> > -As a matter of fact, if one is attempting to link TF-A against mbed
> > -TLS v2.28.0 without the present patch, one gets some linker errors
> > -due to missing symbols from this new module.
> > -
> > -Apart from this, none of the items listed in mbed TLS release
> > -notes [1] directly affect TF-A. Special note on the following one:
> > -
> > -  Fix a bug in mbedtls_gcm_starts() when the bit length of the iv
> > -  exceeds 2^32.
> > -
> > -In TF-A, we do use mbedtls_gcm_starts() when the firmware decryption
> > -feature is enabled with AES-GCM as the authenticated decryption
> > -algorithm (DECRYPTION_SUPPORT=aes_gcm). However, the iv_len variable
> > -which gets passed to mbedtls_gcm_starts() is an unsigned int, i.e. a
> > -32-bit value which by definition is always less than 2**32. Therefore,
> > -we are immune to this bug.
> > -
> > -With this upgrade, the size of BL1 and BL2 binaries does not appear to
> > -change on a standard sample test build (with trusted boot and measured
> > -boot enabled).
> > -
> > -[1] https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.0
> > -
> > -Change-Id: Icd5dbf527395e9e22c8fd6b77427188bd7237fd6
> > -Signed-off-by: Sandrine Bailleux <sandrine.bailleux@arm.com>
> > ----
> > - drivers/auth/mbedtls/mbedtls_common.mk | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/drivers/auth/mbedtls/mbedtls_common.mk b/drivers/auth/mbedtls/mbedtls_common.mk
> > -index 0a4775d00..3eb41617f 100644
> > ---- a/drivers/auth/mbedtls/mbedtls_common.mk
> > -+++ b/drivers/auth/mbedtls/mbedtls_common.mk
> > -@@ -48,6 +48,7 @@ LIBMBEDTLS_SRCS            := $(addprefix ${MBEDTLS_DIR}/library/, \
> > -                                     rsa_internal.c                          \
> > -                                     x509.c                                  \
> > -                                     x509_crt.c                              \
> > -+                                    constant_time.c                         \
> > -                                     )
> > -
> > - # The platform may define the variable 'TF_MBEDTLS_KEY_ALG' to select the key
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
> > deleted file mode 100644
> > index cdabd1b..0000000
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
> > +++ /dev/null
> > @@ -1,52 +0,0 @@
> > -fiptool: respect OPENSSL_DIR
> > -
> > -fiptool links to libcrypto, so as with the other tools it should respect
> > -OPENSSL_DIR for include/library paths.
> > -
> > -Upstream-Status: Submitted
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -diff --git a/Makefile b/Makefile
> > -index ec6f88585..2d3b9fc26 100644
> > ---- a/Makefile
> > -+++ b/Makefile
> > -@@ -1388,7 +1388,7 @@ fwu_fip: ${BUILD_PLAT}/${FWU_FIP_NAME}
> > -
> > - ${FIPTOOL}: FORCE
> > - ifdef UNIX_MK
> > --    ${Q}${MAKE} CPPFLAGS="-DVERSION='\"${VERSION_STRING}\"'" FIPTOOL=${FIPTOOL} --no-print-directory -C ${FIPTOOLPATH}
> > -+    ${Q}${MAKE} CPPFLAGS="-DVERSION='\"${VERSION_STRING}\"'" FIPTOOL=${FIPTOOL} OPENSSL_DIR=${OPENSSL_DIR} --no-print-directory -C ${FIPTOOLPATH}
> > - else
> > - # Clear the MAKEFLAGS as we do not want
> > - # to pass the gnumake flags to nmake.
> > -diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
> > -index 11d2e7b0b..7c2a08379 100644
> > ---- a/tools/fiptool/Makefile
> > -+++ b/tools/fiptool/Makefile
> > -@@ -12,6 +12,8 @@ FIPTOOL ?= fiptool${BIN_EXT}
> > - PROJECT := $(notdir ${FIPTOOL})
> > - OBJECTS := fiptool.o tbbr_config.o
> > - V ?= 0
> > -+OPENSSL_DIR := /usr
> > -+
> > -
> > - override CPPFLAGS += -D_GNU_SOURCE -D_XOPEN_SOURCE=700
> > - HOSTCCFLAGS := -Wall -Werror -pedantic -std=c99
> > -@@ -20,7 +22,7 @@ ifeq (${DEBUG},1)
> > - else
> > -   HOSTCCFLAGS += -O2
> > - endif
> > --LDLIBS := -lcrypto
> > -+LDLIBS := -L${OPENSSL_DIR}/lib -lcrypto
> > -
> > - ifeq (${V},0)
> > -   Q := @
> > -@@ -28,7 +30,7 @@ else
> > -   Q :=
> > - endif
> > -
> > --INCLUDE_PATHS := -I../../include/tools_share
> > -+INCLUDE_PATHS := -I../../include/tools_share  -I${OPENSSL_DIR}/include
> > -
> > - HOSTCC ?= gcc
> > -
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
> > similarity index 94%
> > rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb
> > rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
> > index 2da6116..e4d3880 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
> > @@ -8,8 +8,8 @@ inherit deploy
> >  COMPATIBLE_MACHINE ?= "invalid"
> >
> >  SRC_URI = "git://git.trustedfirmware.org/TF-A/tf-a-tests.git;protocol=https;branch=master"
> > -# post v2.6 snapshot
> > -SRCREV ?= "af5a517ae9f295455122109100fe5d55668e8eaf"
> > +# v2.7 snapshot
> > +SRCREV ?= "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
> >  PV .= "+git${SRCPV}"
> >
> >  DEPENDS += "optee-os"
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index 510a7d4..dfb5675 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -5,9 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
> >  inherit deploy
> >
> > -SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master \
> > -           file://ssl.patch \
> > -         file://build-deps-upgrade-to-mbed-TLS-2.28.0.patch"
> > +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
> >
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
> > similarity index 85%
> > rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
> > rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
> > index 89a9214..537ec32 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
> > @@ -1,7 +1,7 @@
> >  require trusted-firmware-a.inc
> >
> > -# TF-A v2.6
> > -SRCREV_tfa = "a1f02f4f3daae7e21ee58b4c93ec3e46b8f28d15"
> > +# TF-A v2.7
> > +SRCREV_tfa = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
> >
> >  LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
> >
> > --
> > 2.25.1
> >
> >



-- 
Regards,
Andrey.

