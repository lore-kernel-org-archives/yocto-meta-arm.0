Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A70C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 07:19:49 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.2510.1637219988975751424
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 23:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wZi1pPmj;
 spf=pass (domain: linaro.org, ip: 209.85.214.175,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pl1-f175.google.com with SMTP id p18so4440403plf.13
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 23:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MKyXzDb5F5qpPoE15FKhoIEYdDnigqfiMCdyDRM29io=;
        b=wZi1pPmjWQuQk5w5lvygNAX/UCMlgYWPBmsplNBorgN0lqLVc7N9A+pef4fPzhPcmr
         f31eWjMS+EtPqgrUuiU0GPIYegtq0j9dlk/RT2Mvx52fQyqS4SORi7C1jidqZNMiMj9W
         4e5G9vrl0HwDyyzj+OSHstqgyXzfbXBC4A5kCXX87Wy7JNEpwXdastVb6L180PiWNSag
         YCBqQMJGEEyAAnG9gxd/lDRa3MSw8FewpEOyNQzIc9LxSzt+ZncNaKVkDp3Qwyg5Jq7+
         6n8d2USVHrL5h5FIIffWTjk3uhSWnmadExqShBrdQ4fekssKkvYFoYFrRg6l8Z32VF4K
         YaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MKyXzDb5F5qpPoE15FKhoIEYdDnigqfiMCdyDRM29io=;
        b=I+/ofchg05vz98PLF89ltIIWhvmMwSsO6vABgpvGV3OBiCXoNliSC7xwbiYjG73F1c
         DLCFZKoAWFn2mHGbVkZGk+Jmd6rOZfKqjFkOJeVqGWs5JWXbf0T7ojyqskiMQs8WC4r0
         vflMc3a+4M3oLXNcTp2swrTdUQtJVZPhGpKDvh4d4RGP41h8Dv5iOKSrfWPw9jIP13NJ
         0btklYoLjOR3/ndhsH5zPMDOu7IjvfoTAF8N3v/FJLwOlPI4sxvFuPDqhjmkjLtT8D6m
         rWZ4lQ6jkeD+5W8b1O1e1HhnnB3cWks7xqlXb/4WBq4lR3b5TVg/e9S3inxKzjj1CJD2
         tu3w==
X-Gm-Message-State: AOAM531K6et5aGAiZDX/vHHFo52XiXSqFv1DTGTnDF9b9OiZwId6sHB+
	oJwKH5er4RqecIymVy0h/ZbBfJ+jfnOH/1WWD41nAQ==
X-Google-Smtp-Source: 
 ABdhPJy7puW1Q++APqotvHY5xQ0P/d7Y6LwhYDPaH0q2x4xEIkryTSLiRbcpkCcBkmH0VpzjjOTDVCHS2IDp0+mwYm4=
X-Received: by 2002:a17:902:728e:b0:143:a388:868b with SMTP id
 d14-20020a170902728e00b00143a388868bmr63992017pll.33.1637219988315; Wed, 17
 Nov 2021 23:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20211117100210.1401-1-maxim.uvarov@linaro.org>
 <20211117100210.1401-2-maxim.uvarov@linaro.org>
 <CAPoiz9wHJ7=vd4gC5icjNmma=m7Oq01DasQYq+eejeUBEfjvuA@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9wHJ7=vd4gC5icjNmma=m7Oq01DasQYq+eejeUBEfjvuA@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Thu, 18 Nov 2021 10:19:36 +0300
Message-ID: 
 <CAD8XO3YEYjrY7Y9_giS-4fah-mGF0Hc8GS+mN732yA3N8NhxRw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv5 2/3] add optee-ftpm
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Nov 2021 07:19:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2421

On Wed, 17 Nov 2021 at 23:51, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Wed, Nov 17, 2021 at 5:02 AM Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > Add software TPM emulated in the OPTEE-OS.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  v5: add compatible stings to pass "ci/check-layers.py ci/check-layers.yml" script.
> >
> >
> >  .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 20 +++++
> >  .../0001-add-enum-to-ta-flags.patch           | 30 ++++++++
> >  .../optee-ftpm/optee-ftpm_git.bb              | 75 +++++++++++++++++++
> >  .../optee-ftpm/optee-os_%.bbappend            | 14 ++++
> >  4 files changed, 139 insertions(+)
> >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
> >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> >
> > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> > new file mode 100644
> > index 0000000..08acde2
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> > @@ -0,0 +1,20 @@
> > +fix gcc compilation
> > +
> > +just fix compilation under gcc.
> > +Upstream-Status: Submitted [https://github.com/wolfSSL/wolfssl/pull/4563]
> > +
> > +Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > +
> > +diff --git a/wolfssl/wolfcrypt/types.h b/wolfssl/wolfcrypt/types.h
> > +index 7b3a953aebda..e156ae5c7909 100755
> > +--- a/external/wolfssl/wolfssl/wolfcrypt/types.h
> > ++++ b/external/wolfssl/wolfssl/wolfcrypt/types.h
> > +@@ -181,7 +181,7 @@
> > +     /* GCC 7 has new switch() fall-through detection */
> > +     #if defined(__GNUC__)
> > +         #if ((__GNUC__ > 7) || ((__GNUC__ == 7) && (__GNUC_MINOR__ >= 1)))
> > +-            #define FALL_THROUGH __attribute__ ((fallthrough));
> > ++            #define FALL_THROUGH __attribute__ ((__fallthrough__));
> > +         #endif
> > +     #endif
> > +     #ifndef FALL_THROUGH
> > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
> > new file mode 100644
> > index 0000000..bbc1107
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
> > @@ -0,0 +1,30 @@
> > +From 2d00f16058529eb9f4d4d2bcaeed91fd53b43989 Mon Sep 17 00:00:00 2001
> > +From: Maxim Uvarov <maxim.uvarov@linaro.org>
> > +Date: Fri, 17 Apr 2020 12:05:53 +0100
> > +Subject: [PATCH 2/2] add enum to ta flags
> > +
> > +If we compile this TA into OPTEE-OS we need to define a flag
> > +that this TA can be discovered on the optee bus.
> > +Upstream-Status: Submitted [https://github.com/microsoft/MSRSec/pull/34]
> > +
> > +Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > +---
> > + TAs/optee_ta/fTPM/user_ta_header_defines.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/TAs/optee_ta/fTPM/user_ta_header_defines.h b/TAs/optee_ta/fTPM/user_ta_header_defines.h
> > +index 6ff62d1..685b54a 100644
> > +--- a/TAs/optee_ta/fTPM/user_ta_header_defines.h
> > ++++ b/TAs/optee_ta/fTPM/user_ta_header_defines.h
> > +@@ -44,7 +44,7 @@
> > +
> > + #define TA_UUID                     TA_FTPM_UUID
> > +
> > +-#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE )
> > ++#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM_SUPP)
> > + #define TA_STACK_SIZE               (64 * 1024)
> > + #define TA_DATA_SIZE                (64 * 1024)
> > +
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > new file mode 100644
> > index 0000000..ee9dc61
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > @@ -0,0 +1,75 @@
> > +SUMMARY = "OPTEE fTPM Microsoft TA"
> > +DESCRIPTION = "TCG reference implementation of the TPM 2.0 Specification."
> > +HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
> > +
> > +COMPATIBLE_MACHINE ?= "invalid"
> > +COMPATIBLE_MACHINE:aarch64 = "(.*)"
> > +COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64"
>
> I added the following here and got it to pass the failing
> qemuarm64-secureboot clang machines (see
> https://gitlab.com/jonmason00/meta-arm/-/pipelines/410996476):
> #FIXME - doesn't currently work with clang
> TOOLCHAIN = "gcc"
>

Ok. Thanks, I will add that.

>
>
> > +
> > +inherit autotools-brokensep deploy pkgconfig gettext python3native
> > +
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=27e94c0280987ab296b0b8dd02ab9fe5"
> > +
> > +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
> > +DEPENDS += " optee-os-tadevkit"
> > +
> > +FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> > +
> > +# SRC_URI = "git://github.com/Microsoft/ms-tpm-20-ref;branch=master"
> > +# Since this is not built as a pseudo TA, we can only use it as a kernel module and not built in.
> > +# The TEE supplicant is also needed to provide access to secure storage.
> > +# Secure storage access required by OP-TEE fTPM TA
> > +# is provided via OP-TEE supplicant that's not available during boot.
> > +# Fix this once we replace this with the MS implementation
> > +SRC_URI = "gitsm://github.com/microsoft/MSRSec;protocol=https;branch=master \
> > +           file://0000-fix-ssl-fallthrough.patch \
> > +           file://0001-add-enum-to-ta-flags.patch"
> > +SRCREV = "76f81b36efbb1a366b0d382bc0defe677f1f0534"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> > +TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> > +TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
> > +
> > +EXTRA_OEMAKE += '\
> > +    CFG_FTPM_USE_WOLF=y \
> > +    TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> > +    TA_CROSS_COMPILE=${TARGET_PREFIX} \
> > +    CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_HOST} -I${WORKDIR}/optee-os" \
> > +'
> > +
> > +EXTRA_OEMAKE:append:aarch64:qemuall = "\
> > +    CFG_ARM64_ta_arm64=y \
> > +"
> > +
> > +B = "${S}"
> > +
> > +# fails with j > 1
> > +PARALLEL_MAKE = ""
> > +
> > +do_compile() {
> > +    sed -i 's/-mcpu=$(TA_CPU)//' TAs/optee_ta/fTPM/sub.mk
> > +    # there's also a secure variable storage TA called authvars
> > +    cd ${S}/TAs/optee_ta
> > +    oe_runmake ftpm
> > +}
> > +
> > +do_install () {
> > +    mkdir -p ${D}/lib/optee_armtz
> > +    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/optee_armtz/
> > +}
> > +
> > +do_deploy () {
> > +    install -d ${DEPLOYDIR}/optee
> > +    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${DEPLOYDIR}/optee/
> > +}
> > +
> > +addtask deploy before do_build after do_install
> > +
> > +FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.ta"
> > +
> > +# Imports machine specific configs from staging to build
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +INSANE_SKIP:${PN} += "ldflags"
> > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > new file mode 100644
> > index 0000000..0cfa949
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > @@ -0,0 +1,14 @@
> > +FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> > +
> > +DEPENDS:append = "\
> > +                  ${@bb.utils.contains('MACHINE_FEATURES', \
> > +                 'optee-ftpm', \
> > +                 'optee-ftpm', \
> > +                 '' , \
> > +                 d)}"
> > +
> > +EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', \
> > +                      'optee-ftpm', \
> > +                      'CFG_EARLY_TA=y EARLY_TA_PATHS="${DEPLOY_DIR_IMAGE}/optee/${FTPM_UUID}.stripped.elf"', \
> > +                      '', \
> > +                      d)} "
> > --
> > 2.17.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2415): https://lists.yoctoproject.org/g/meta-arm/message/2415
> > Mute This Topic: https://lists.yoctoproject.org/mt/87116206/3616920
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

