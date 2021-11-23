Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEF2C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 05:51:03 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.7562.1637646662123485523
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 21:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kyxIZUsF;
 spf=pass (domain: linaro.org, ip: 209.85.215.177,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pg1-f177.google.com with SMTP id g28so17329414pgg.3
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 21:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6UylEpN3CZNqeu0WYIv91U0+xjPH7SEb4D1+p4r3Ek8=;
        b=kyxIZUsFJkO0Lz05UGfGY/pSAjTfYs8jeHm0KYMPCPCwWkB2bzwReB8qwTCIo/nYYa
         IIKGvhEo65GmHIC41FLjq1N8CgaEk0nXC6BJTREXw+4eUUFpiiDAUk3OazUSFmiGnhxk
         FgPZQCgAMiAJuxHy6TRmYCQ1diUdPjAGIiPjfvRsxYNCidIFiGW2Y/0IQPUmbbg46aNQ
         T5SN9iZPFcIzsByNFC0QgY5T5llY6rcRx4m0+JWfGZ/n0RmgsK7OqV7o2prbZQE2JpQu
         45i/7pYLT9WUJxnicNKGWSDBzGHiUhtWztoKrJ/N3nqlD6+EZegqwV0vlj76I98wS991
         F6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6UylEpN3CZNqeu0WYIv91U0+xjPH7SEb4D1+p4r3Ek8=;
        b=l2LKEFUHoj/fjWfuXZMl39msR4wIynuZM10J+b2VtBc+GCqp9/Nfhs2hqiTVRMZM76
         Fve90fTu9piRJypv4gDnW4wsttJ99q9ZyczCrx69xALVfgigim2QZUVocqKgJ2zClJP1
         kUueD49z6IbuNmlHJ/bKX95twBbNSb3Gl48Hg/keUGKKboE5kld/LuoxA2bvJ/7be5Ut
         rDEttQw0RAk6iFt5iAlV9cCgXq6tEbf8D5vu73Ybfv4YnBH45VLdlwNmi+Mo2IxmAG8Q
         U9pKS3+chej0y+Q+InE3i3E8/Ca7+LkbvHDAG2kV5ct05hWafxoVlAtumur9I/WUw+Y1
         S9XQ==
X-Gm-Message-State: AOAM532sXjYJqhp4jTOn66l56XqGwV0ZoDmtfBqPRJuCPEF0UwXzOZe4
	hy/ihme2Jl/uRJXKV66JMUnmKcF3ACd08tnbquuuyA==
X-Google-Smtp-Source: 
 ABdhPJzd0Vsw46MYtBQ6RQTtncRQH4ZqiRWodgS9mZljDN39ivnjgR+B0u62BYjVcR/MqVxb2IL/zgDy92OoUvN4ddk=
X-Received: by 2002:a05:6a00:14ce:b0:49f:dc1c:a0fb with SMTP id
 w14-20020a056a0014ce00b0049fdc1ca0fbmr3139165pfu.56.1637646661506; Mon, 22
 Nov 2021 21:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20211119093331.4536-1-maxim.uvarov@linaro.org>
 <20211119093331.4536-2-maxim.uvarov@linaro.org>
 <20211122210851.GA26226@kudzu.us>
In-Reply-To: <20211122210851.GA26226@kudzu.us>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Tue, 23 Nov 2021 08:51:11 +0300
Message-ID: 
 <CAD8XO3aEyRV0n6v4FFCdz1wOF==-W5n90CZGApMe2Dg76w9q5w@mail.gmail.com>
Subject: Re: [PATCHv6 2/3] add optee-ftpm
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 05:51:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2428

On Tue, 23 Nov 2021 at 00:08, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Fri, Nov 19, 2021 at 12:33:30PM +0300, Maxim Uvarov wrote:
> > Add software TPM emulated in the OPTEE-OS.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> > v6:
> >         - wolfssl submodule needs to be updated to fix falthrough. Sent PR
> >           for that and mention about that in correction patch.
> >       - parallel make is also fixed in the latest master. Removed bb fix and
> >           updated git sha.
> >         - removed not needed B=$S
> >       - removed redurant dependancies
>
> I had to add back the parallel make workaround, as it failed to build
> on a clean (non-sstate) build.  Also, I corrected some
> spelling/grammar issues in the commit log (I hope you doin't mind).
>
> Pushed to master.
>
> Thanks,
> Jon

Thanks!

Maxim.

>
> >
> >  .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 23 ++++++
> >  .../0001-add-enum-to-ta-flags.patch           | 30 ++++++++
> >  .../optee-ftpm/optee-ftpm_git.bb              | 74 +++++++++++++++++++
> >  .../optee-ftpm/optee-os_%.bbappend            | 14 ++++
> >  4 files changed, 141 insertions(+)
> >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
> >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> >
> > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> > new file mode 100644
> > index 0000000..1e2a4b6
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> > @@ -0,0 +1,23 @@
> > +fix gcc compilation
> > +
> > +just fix compilation under gcc.
> > +Upstream-Status: Submitted [https://github.com/microsoft/MSRSec/pull/35]
> > +Compilation issue already fixed in wolfcrypt and submodule
> > +needs to be updated. I sent PR for for update with the link
> > +above.
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
> > index 0000000..ce5059c
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > @@ -0,0 +1,74 @@
> > +SUMMARY = "OPTEE fTPM Microsoft TA"
> > +DESCRIPTION = "TCG reference implementation of the TPM 2.0 Specification."
> > +HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
> > +
> > +COMPATIBLE_MACHINE ?= "invalid"
> > +COMPATIBLE_MACHINE:aarch64 = "(.*)"
> > +COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64"
> > +
> > +#FIXME - doesn't currently work with clang
> > +TOOLCHAIN = "gcc"
> > +
> > +inherit deploy python3native
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
> > +
> > +SRCREV = "81abeb9fa968340438b4b0c08aa6685833f0bfa1"
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

