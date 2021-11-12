Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F29C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 11:15:14 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.14399.1636715713230970674
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 03:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yoSH8VpU;
 spf=pass (domain: linaro.org, ip: 209.85.215.182,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pg1-f182.google.com with SMTP id m15so3858620pgu.11
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 03:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KVApoBL+CeR43JR6yG/tk266lx8X1/StfTXxxnErmPk=;
        b=yoSH8VpUPgivH2RODhoplR7NBBf2aX7O97FPuECNWFqgjDmLXJAED6k8BSxDC4wYAr
         rMAFI7nUlJPieWbo+BS81LEJqnHVPDvKfmqBuEJ/UXt8X2IhM+FB7kq34+rJIdmGZ5LZ
         0/Vj3xK3buQDLh92cFCiymI2saGvIXrw6Wl3rrXEBWj4U55rAbFG0DhmZtMtt1ok0B96
         yejQPCP9DMW4s6hO92yUYqn60zq75quR6UqLMIblZgT6R6m/vFsTjuUYWHpZgO0Gbp5D
         IqKyM03KCMK7DPIXf3R2MQPGmHhNwgWnK+WwGhD5etDI9tDSihTso2V9WMIDw1OnMj6t
         90Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KVApoBL+CeR43JR6yG/tk266lx8X1/StfTXxxnErmPk=;
        b=N3BA+vQvSaxctweLioY6Du1cdXrOkkcPI7jM8w8GrIeZdKwrOPd1eAJRlpizfL1+EO
         riIn5u+nvA+s27455Z96KFlOULqtTNY8Nz28Hb+dsHep8HhqYdsl/qTpC0WfCbtioMWq
         Wr2xUKCNhbYTWDpxf1vFKnB2f3C2p1mGvY2RycjeYWr6VdLxiuawLeo8HcCOIG4dN7pR
         lnzpOgYn0mRDWepOLlRVgt7VN8TnBp9TXKUhgKQdv9O9UgJvUN/rV/PjFt5Qc/W6gEnu
         d02ahTqrhNBomNIFZB6G3I6ezfvkUjGOUshHEgTZQjWSHefzIJa1yh9uYUnu9p2T6L8h
         m+Mw==
X-Gm-Message-State: AOAM532bjqAK+53M81AuN//wmobQHw6m+DI4yCDDoVr86d0o/SXd0WAI
	bgLVaGG/9b5vmUXIyfpjLIh4fZV8xIZpFzys7OHvYw==
X-Google-Smtp-Source: 
 ABdhPJxUI0/5OYiFjroNRDFgY/lrjG+U+fIRWF8VlbrFhEDKs70VllUa9upOCdx0lVSsjjPiCIasPaaMtxHBJbGfqrw=
X-Received: by 2002:a05:6a00:14ce:b0:49f:dc1c:a0fb with SMTP id
 w14-20020a056a0014ce00b0049fdc1ca0fbmr13362024pfu.56.1636715712384; Fri, 12
 Nov 2021 03:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20211111131615.16972-1-maxim.uvarov@linaro.org>
 <20211111131615.16972-2-maxim.uvarov@linaro.org>
 <20211111191310.GP10132@denix.org>
 <16B6C33755E65ACE.32262@lists.yoctoproject.org>
In-Reply-To: <16B6C33755E65ACE.32262@lists.yoctoproject.org>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Fri, 12 Nov 2021 14:15:01 +0300
Message-ID: 
 <CAD8XO3a0qhZQ7=QRoNSPKDt1co4-emoYxR0ov0LqUhqL2PLiZw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv2 2/3] add optee-ftpm
To: maxim.uvarov@linaro.org
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org,
 Jon.Mason@arm.com,
	Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Nov 2021 11:15:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2380

On Fri, 12 Nov 2021 at 12:42, Maxim Uvarov via lists.yoctoproject.org
<maxim.uvarov=linaro.org@lists.yoctoproject.org> wrote:
>
> On Thu, 11 Nov 2021 at 22:13, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Thu, Nov 11, 2021 at 04:16:14PM +0300, Maxim Uvarov wrote:
> > > Add software TPM emulated in the OPTEE-OS.
> > >
> > > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > ---
> > >  .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 20 ++++++
> > >  .../0002-add-enum-to-ta-flags.patch           | 30 ++++++++
> > >  .../optee-ftpm/optee-ftpm_git.bb              | 71 +++++++++++++++++++
> > >  .../optee-ftpm/optee-os_%.bbappend            |  5 ++
> > >  4 files changed, 126 insertions(+)
> > >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> > >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
> > >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > >  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > >
> > > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> > > new file mode 100644
> > > index 0000000..08acde2
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> > > @@ -0,0 +1,20 @@
> > > +fix gcc compilation
> > > +
> > > +just fix compilation under gcc.
> > > +Upstream-Status: Submitted [https://github.com/wolfSSL/wolfssl/pull/4563]
> > > +
> > > +Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > +
> > > +diff --git a/wolfssl/wolfcrypt/types.h b/wolfssl/wolfcrypt/types.h
> > > +index 7b3a953aebda..e156ae5c7909 100755
> > > +--- a/external/wolfssl/wolfssl/wolfcrypt/types.h
> > > ++++ b/external/wolfssl/wolfssl/wolfcrypt/types.h
> > > +@@ -181,7 +181,7 @@
> > > +     /* GCC 7 has new switch() fall-through detection */
> > > +     #if defined(__GNUC__)
> > > +         #if ((__GNUC__ > 7) || ((__GNUC__ == 7) && (__GNUC_MINOR__ >= 1)))
> > > +-            #define FALL_THROUGH __attribute__ ((fallthrough));
> > > ++            #define FALL_THROUGH __attribute__ ((__fallthrough__));
> > > +         #endif
> > > +     #endif
> > > +     #ifndef FALL_THROUGH
> > > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
> > > new file mode 100644
> > > index 0000000..bbc1107
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
> > > @@ -0,0 +1,30 @@
> > > +From 2d00f16058529eb9f4d4d2bcaeed91fd53b43989 Mon Sep 17 00:00:00 2001
> > > +From: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > +Date: Fri, 17 Apr 2020 12:05:53 +0100
> > > +Subject: [PATCH 2/2] add enum to ta flags
> > > +
> > > +If we compile this TA into OPTEE-OS we need to define a flag
> > > +that this TA can be discovered on the optee bus.
> > > +Upstream-Status: Submitted [https://github.com/microsoft/MSRSec/pull/34]
> > > +
> > > +Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > +---
> > > + TAs/optee_ta/fTPM/user_ta_header_defines.h | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/TAs/optee_ta/fTPM/user_ta_header_defines.h b/TAs/optee_ta/fTPM/user_ta_header_defines.h
> > > +index 6ff62d1..685b54a 100644
> > > +--- a/TAs/optee_ta/fTPM/user_ta_header_defines.h
> > > ++++ b/TAs/optee_ta/fTPM/user_ta_header_defines.h
> > > +@@ -44,7 +44,7 @@
> > > +
> > > + #define TA_UUID                     TA_FTPM_UUID
> > > +
> > > +-#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE )
> > > ++#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM_SUPP)
> > > + #define TA_STACK_SIZE               (64 * 1024)
> > > + #define TA_DATA_SIZE                (64 * 1024)
> > > +
> > > +--
> > > +2.17.1
> > > +
> > > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > new file mode 100644
> > > index 0000000..a6244b2
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > @@ -0,0 +1,71 @@
> > > +SUMMARY = "OPTEE fTPM Microsoft TA"
> > > +DESCRIPTION = "OPTEE fTPM"
> >
> > There's no need in DESCRIPTION here, as it's meant to expand on the short
> > SUMMARY and provide a more detailed description of the package, which it
> > clearly doesn't here.
> >
> >
> > > +HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
> > > +
> > > +inherit autotools-brokensep deploy pkgconfig gettext python3native
> > > +
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=27e94c0280987ab296b0b8dd02ab9fe5"
> > > +
> > > +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
> > > +DEPENDS += " optee-os-tadevkit"
> > > +
> > > +FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> > > +
> > > +# SRC_URI = "git://github.com/Microsoft/ms-tpm-20-ref;branch=master"
> > > +# Since this is not built as a pseudo TA, we can only use it as a kernel module and not built in.
> > > +# The TEE supplicant is also needed to provide access to secure storage.
> > > +# Secure storage access required by OP-TEE fTPM TA
> > > +# is provided via OP-TEE supplicant that's not available during boot.
> > > +# Fix this once we replace this with the MS implementation
> > > +SRC_URI = "gitsm://github.com/microsoft/MSRSec;protocol=https;branch=master"
> > > +SRC_URI += "file://0000-fix-ssl-fallthrough.patch"
> > > +SRC_URI += "file://0002-add-enum-to-ta-flags.patch"
> > > +SRCREV = "76f81b36efbb1a366b0d382bc0defe677f1f0534"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> > > +TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> > > +TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
> > > +
> > > +EXTRA_OEMAKE += '\
> > > +    CFG_FTPM_USE_WOLF=y \
> > > +    TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> > > +    TA_CROSS_COMPILE=${TARGET_PREFIX} \
> > > +    CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_HOST} -I${WORKDIR}/optee-os" \
> > > +'
> > > +
> > > +EXTRA_OEMAKE:append:aarch64:qemuall = "\
> >
> > Is it aarch64 or qemuall?
> >
> >
> > > +    CFG_ARM64_ta_arm64=y \
> > > +"
> > > +
> > > +B = "${S}"
> > > +
> > > +# fails with j > 1
> > > +PARALLEL_MAKE = ""
> > > +
> > > +do_compile() {
> > > +    sed -i 's/-mcpu=$(TA_CPU)//' TAs/optee_ta/fTPM/sub.mk
> >
> > If not done statically as a patch, then should at least be done in
> > do_configure() instead of do_compile()
> >
> >
> > > +    # there's also a secure variable storage TA called authvars
> > > +    cd ${S}/TAs/optee_ta
> > > +    oe_runmake ftpm
> > > +}
> > > +
> > > +do_install () {
> > > +    mkdir -p ${D}/lib/optee_armtz
> > > +    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/optee_armtz/
> >
> > /lib -> ${nonarch_base_libdir}
> >
> >
> > > +}
> > > +
> > > +do_deploy () {
> > > +    install -d ${DEPLOYDIR}/optee
> > > +    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${DEPLOYDIR}/optee/
> > > +}
> > > +
> > > +addtask deploy before do_build after do_install
> > > +
> > > +FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.ta"
> > > +
> > > +# Imports machine specific configs from staging to build
> > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > +INSANE_SKIP:${PN} += "ldflags"
> > > diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > > new file mode 100644
> > > index 0000000..910603e
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> > > @@ -0,0 +1,5 @@
> > > +DEPENDS:append = "optee-ftpm"
> > > +inherit deploy
> >
> > Again, this is redundant, as optee-os already inherits deploy.
> >
> >
> > > +FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> > > +EXTRA_OEMAKE:append='CFG_EARLY_TA=y EARLY_TA_PATHS="${DEPLOY_DIR_IMAGE}/optee/${FTPM_UUID}.stripped.elf"'
> >
> > Needs a leading whitespace, as :append won't insert it, hence it will
> > concatenate it to the existing value of EXTRA_OEMAKE.
> >
> > And I do believe there's a confusion about how bbappends work in OE - it is
> > not optional, even when it's in a different directory. This bbappend will
> > unconditionally modify the main optee-os recipe, which is also in the same
> > layer. So, if it is meant to unconditionally modify optee-os, then these
> > changes should go directly into optee-os recipe, instead of a bbappend. And
> > if this is meant to be an optional extension to optee-os, then it cannot be
> > done as bbappend either.
> >
>
> I think that it's better to enable a condition for it and make fTPM
> optional. Some systems might have hardware TPM device
> and don't need software emulated in secure os.It looks like
> MACHINE_FEATURES is a good place for it. Something like:
>
> optee-os.bb:
> FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
>
> DEPENDS:append = "\
>                   ${@bb.utils.contains('MACHINE_FEATURES', \
>                  'optee-ftpm', \
>                  'optee-ftpm', \
>                  '' , \
>                  d)}"
>
> EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', \
>                       'optee-ftpm', \
>                       'CFG_EARLY_TA=y
> EARLY_TA_PATHS="${DEPLOY_DIR_IMAGE}/optee/${FTPM_UUID}.stripped.elf"',
> \
>                       '', \
>                       d)} "
>
> ./meta-arm/conf/machine/qemuarm64-secureboot.conf
> MACHINE_FEATURES += "optee-ftpm"
>
> Does that look good?
>
>
> I also did grep for other MACHINE_FEATURES in meta-arm and looks like
> they are not used anymore and config files can be
> cleaned up:
> fgrep -r FEATURE ./meta-* |grep optee
> ./meta-arm-bsp/conf/machine/fvp-common.inc:MACHINE_FEATURES = "optee"
> ./meta-arm-bsp/conf/machine/juno.conf:MACHINE_FEATURES = "usbhost
> usbgadget alsa screen wifi bluetooth optee pci"
> ./meta-gem5/conf/machine/gem5-arm64.conf:MACHINE_FEATURES = "optee pci"
>
> BR,
> Maxim.
>

Also due to
optee-os-tadevkit_3.14.0.bb calls:
require optee-os_3.14.0.bb

I can not move DEPENDS += optee-ftpm inside optee-os_3.14.0.bb. It
will cause circular dependency.
But separate  .bbappend with enabling this TA, with condition based on
MACHINE_FEATURES
works well.

Maxim.

> > --
> > Regards,
> > Denys Dmytriyenko <denis@denix.org>
> > PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> > Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2379): https://lists.yoctoproject.org/g/meta-arm/message/2379
> Mute This Topic: https://lists.yoctoproject.org/mt/86981078/4454737
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [maxim.uvarov@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

