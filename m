Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CB3C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 09:45:01 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.7779.1637055900288391306
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 01:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jjf0Wf8d;
 spf=pass (domain: linaro.org, ip: 209.85.214.172,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pl1-f172.google.com with SMTP id b13so16956726plg.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 01:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=18JUdNGQKHUqr/E2CHSt/ukq0rkqkxQKLDUblQ41SxM=;
        b=jjf0Wf8duU2NGrwQpwNv2eite+E8ZVyu40ger1vWUsUhRUaZDWHj7PilMpnrOOHQ41
         Owm20T4sC1d/IHfXmBY7ouiG6akd9B024v4ZmIbllSd+he4GJ32ZZ7TaXv1xVyvzaZFa
         /bJfJFCoSYJkN7hS7KthSuUKoaTvp51R/O9xsSmYv+0wMwelbmXTQEOTZeDTthvRPthq
         XlbsWXztwGJqIZg18DAFMgGw86ILymAZftb3JrB0cF/dPt5rD9Ncaz9y6h4whHJxjl8b
         OII7O7tbpMydeQ/R38/bWfssDhnh9RnD3oGr6DmX9m+boG+xMA3T3TEFwRetbt/SNKuP
         JQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=18JUdNGQKHUqr/E2CHSt/ukq0rkqkxQKLDUblQ41SxM=;
        b=yrbVHgzggg0ZJ0BmXUyYGTBraVTOKPDYj/czvJW6zCADfWoaZ1O/JSwQguNhh/eODU
         9FPndndFqEl34kxJoBwdWFLMMMYEOgMxCzLcGsXJLK1+ga/qjaqvVmOZPC1HMt8VchBG
         Rrz9MxdeGlO5HGQia52EIb6TFYLxf3heuoFv6pwczbjg4yPuO6RdnD2mHG1Se1hXsGdz
         aspCFEqivmr+ScFdbrugsk17uVmPaOaU0rnV9xMGlHqEFrPzcsH8xcL2QQEgSZERN0gY
         GXRlml4CCmfyxfyzPGS95aYbUeeqOGfx4AUi/4Rwn/gRpM1ygkmlLsO/WbmWiCkq5ZmG
         iMCQ==
X-Gm-Message-State: AOAM530N8TuxoMkb/k7xoIStDI32nu3uUsuFTK3M/Rw1rWKI7vBEzFLx
	mDXl76ZbDTemFA5z2W32KnXatg07PEK/4T1j0+VvOg==
X-Google-Smtp-Source: 
 ABdhPJx6oYzI/QFVHgFdSPI/niNPWacP5TR35uBKFaeEcoh5w/Tj/Q8RcwS6U9/uBYqOT+RKKtEVSuUrrno6sQgIreA=
X-Received: by 2002:a17:90a:7645:: with SMTP id
 s5mr73147793pjl.125.1637055899643;
 Tue, 16 Nov 2021 01:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
 <20211115140100.24634-2-maxim.uvarov@linaro.org>
 <20211115170648.GC31079@kudzu.us>
In-Reply-To: <20211115170648.GC31079@kudzu.us>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Tue, 16 Nov 2021 12:44:48 +0300
Message-ID: 
 <CAD8XO3b2b0UKzYpqKSMM3_Suk8PdapP7wn0L2K97ZKQELuf5CQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv3 2/5] add optee-ftpm
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 09:45:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2405

On Mon, 15 Nov 2021 at 20:06, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Nov 15, 2021 at 05:00:57PM +0300, Maxim Uvarov wrote:
> > Add software TPM emulated in the OPTEE-OS.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 20 ++++++
> >  .../0002-add-enum-to-ta-flags.patch           | 30 ++++++++
> >  .../optee-ftpm/optee-ftpm_git.bb              | 71 +++++++++++++++++++
> >  .../optee-ftpm/optee-os_%.bbappend            | 14 ++++
> >  4 files changed, 135 insertions(+)
> >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
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
> > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
> > new file mode 100644
> > index 0000000..bbc1107
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
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
> > index 0000000..6c72c7f
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > @@ -0,0 +1,71 @@
> > +SUMMARY = "OPTEE fTPM Microsoft TA"
> > +DESCRIPTION = "TCG reference implementation of the TPM 2.0 Specification."
> > +HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
> > +
> > +inherit autotools-brokensep deploy pkgconfig gettext python3native
> > +
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=27e94c0280987ab296b0b8dd02ab9fe5"
> > +
> > +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
> > +DEPENDS += " optee-os-tadevkit"
>
> Is there a reason why this isn't on the previous line?
>
> > +
> > +FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> > +
> > +# SRC_URI = "git://github.com/Microsoft/ms-tpm-20-ref;branch=master"
> > +# Since this is not built as a pseudo TA, we can only use it as a kernel module and not built in.
> > +# The TEE supplicant is also needed to provide access to secure storage.
> > +# Secure storage access required by OP-TEE fTPM TA
> > +# is provided via OP-TEE supplicant that's not available during boot.
> > +# Fix this once we replace this with the MS implementation
> > +SRC_URI = "gitsm://github.com/microsoft/MSRSec;protocol=https;branch=master"
> > +SRC_URI += "file://0000-fix-ssl-fallthrough.patch"
> > +SRC_URI += "file://0002-add-enum-to-ta-flags.patch"
>
> While this does work, it would be better to follow how other recipes
> in meta-arm are doing it and make it a single SRC_URI entry.
>
> Also, it's super odd to me that the patches are 0000 and 0002, not
> 0001 and 0002 (but this is being super pedantic).
>

yes, v4 for this one.

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
>
> shouldn't this have a ${S} in the file path?
>

do_compile() should enter the right build directory. I think
everything is correct here.


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
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2387): https://lists.yoctoproject.org/g/meta-arm/message/2387
> > Mute This Topic: https://lists.yoctoproject.org/mt/87069391/3616920
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

