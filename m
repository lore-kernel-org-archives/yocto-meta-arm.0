Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web11.14710.1602852862449232651
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Oct 2020 05:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ZOChAagX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.195, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f195.google.com with SMTP id i7so460361ils.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 Oct 2020 05:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=o5yRF2cq/+ZG5/XQA6/mjOBsOoxEC8bbtXjC9AIpTGw=;
        b=ZOChAagX5Mrrr+ZMsQTdtu5sMdpeVltLAVxn+eT1IVfr+OOENq6sQai8UF9oTHtytE
         W9c2gn8B/5dtp+aGD52ha5no8Y33m7rnIlyODd92as6ojleN/QBZjqTAcDzFLAWMapos
         6rR1+S5tZJdc27DEY+aiWj15hQXZ3BvMvyEtukM4gBT1t4Uiilvt2iMx77I3t4Hhq1zI
         Hs8F3seCwckc4BWNXeMnkd35UAZwiyNTWfKWR7NpJ+2bcD7u4ln8l8Dr2T83Me/Pl0Rr
         eLbWXBmrS0EWIgdmY/jKIJebGtkaTLDlX7pE0Tb5vK8UXnddNliYkAgVZbBzRLcbZxGw
         1svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=o5yRF2cq/+ZG5/XQA6/mjOBsOoxEC8bbtXjC9AIpTGw=;
        b=khQrCsCEZTkA2BxBvQ0MFffNJ90OTluZ2tCVXQwdf6i9fDuPmKEe/4SP6YKv7yFwZC
         uhoKZ3D4pdTOvwJ3B+1lDI/tdEMiTlBx1g3WsrYHW1bxfU5m2ss6BSuf9AI5BuWeWl6F
         2VQsniPTd+aC2+eybGs+JNN+IMjGxkE+G3DE8tcZ4qUuFHvYRL5Gdt1tu6x9PUBHDBY+
         wPHM7Ss+z6Qklp5MQ4DduHacahV42MocC9WRaIrUf0ShZQsxC71Bh0xWxEj0yMOoyD5G
         pVkyGYpjDCd925/gPwjPsACTONRKRsdFrfpxgOj3bejGG5xbTC1VIdTf9TIKbbxcGDxS
         RZKQ==
X-Gm-Message-State: AOAM531MrOMXTFz93rRCOCknIlQ8FYur8ZyfG6roT+kwsqINizEH94rc
	6yoEhVYqC81Ai/P0iVi3MJubZw==
X-Google-Smtp-Source: ABdhPJyM6OiYUls7Uapa+NU0MOSyfDlk4wn3IC6UXlm3lASjQazXyIjbxzpHJfIX4iEGobCUy1g4lw==
X-Received: by 2002:a05:6e02:6c6:: with SMTP id p6mr2469400ils.91.1602852861690;
        Fri, 16 Oct 2020 05:54:21 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id k8sm2031433ioh.20.2020.10.16.05.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 05:54:21 -0700 (PDT)
Date: Fri, 16 Oct 2020 08:54:18 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Brett Warren <brett.warren@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/6] optee: upgraded recipes to 3.10
Message-ID: <20201016125417.GA25594@kudzu.us>
References: <8kyH.1602675228543077329.RykC@lists.yoctoproject.org>
 <20201014155848.GS19155@denix.org>
MIME-Version: 1.0
In-Reply-To: <20201014155848.GS19155@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2020 at 11:58:48AM -0400, Denys Dmytriyenko wrote:
> Maybe passing --find-copies-harder would yield a smaller and more readable 
> patch (i.e. diff between 3.8 and 3.10)?
> 
> Also, are there any details on backward compatibility needs to preserve 3.8?

I have not heard anyone asking to keep 3.8 around, but I also don't
know of any users of OPTEE in meta-arm.  My logic in asking Brett to
convert the existing recipe to 3.8 is to allow for it to be used in
case there are unknown users.

After making the gatestgarth release, I plan on dropping older
versions of recipes (like OPTEE 3.8) unless some says they need it.

Thanks,
Jon

> 
> Thanks.
> 
> -- 
> Denys
> 
> 
> On Wed, Oct 14, 2020 at 04:33:48AM -0700, Brett Warren wrote:
> > The optee recipes were upgraded due to issues booting with 3.8
> > on qemuarm64-secureboot, which were resolved by the upgrade.
> > The 3.8 recipes are retained for backwards compatibility.
> > 
> > optee-test and optee-examples were modified to pass a sysroot
> > to the LIBGCC_LOCATE_CFLAGS parameter, to ensure proper location
> > of the libgcc library.
> > 
> > Recipes have been renamed to reflect their current version.
> > As this makes the PV variables redundent, these have been removed.
> > 
> > Change-Id: Iacaba02d64570a790d5cc20eca8be58246e39019
> > Signed-off-by: Brett Warren <brett.warren@arm.com>
> > ---
> > .../optee/optee-client_3.10.0.bb              | 59 +++++++++++++
> > ...ee-client_git.bb => optee-client_3.8.0.bb} |  2 -
> > .../optee/optee-examples_3.10.0.bb            | 52 ++++++++++++
> > ...xamples_git.bb => optee-examples_3.8.0.bb} |  3 +-
> > .../recipes-security/optee/optee-os_3.10.0.bb | 83 +++++++++++++++++++
> > .../{optee-os_git.bb => optee-os_3.8.0.bb}    |  2 -
> > .../optee/optee-test_3.10.0.bb                | 55 ++++++++++++
> > ...{optee-test_git.bb => optee-test_3.8.0.bb} |  3 +-
> > 8 files changed, 251 insertions(+), 8 deletions(-)
> > create mode 100644 meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> > rename meta-arm/recipes-security/optee/{optee-client_git.bb => optee-client_3.8.0.bb} (98%)
> > create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> > rename meta-arm/recipes-security/optee/{optee-examples_git.bb => optee-examples_3.8.0.bb} (95%)
> > create mode 100644 meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> > rename meta-arm/recipes-security/optee/{optee-os_git.bb => optee-os_3.8.0.bb} (98%)
> > create mode 100644 meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> > rename meta-arm/recipes-security/optee/{optee-test_git.bb => optee-test_3.8.0.bb} (96%)
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> > new file mode 100644
> > index 0000000..cbd3b93
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> > @@ -0,0 +1,59 @@
> > +SUMMARY = "OP-TEE Client API"
> > +DESCRIPTION = "Open Portable Trusted Execution Environment - Normal World Client side of the TEE"
> > +HOMEPAGE = "https://www.op-tee.org/"
> > +
> > +LICENSE = "BSD"
> > +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
> > +
> > +require optee.inc
> > +
> > +inherit python3native systemd update-rc.d
> > +
> > +SRCREV = "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
> > +SRC_URI = " \
> > +    git://github.com/OP-TEE/optee_client.git \
> > +    file://tee-supplicant.service \
> > +    file://tee-supplicant.sh \
> > +"
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> > +
> > +EXTRA_OEMAKE = "O=${B}"
> > +
> > +do_compile() {
> > +    cd ${S}
> > +    oe_runmake
> > +}
> > +do_compile[cleandirs] = "${B}"
> > +
> > +do_install() {
> > +    cd ${S}
> > +    oe_runmake install
> > +
> > +    install -D -p -m0755 ${B}/export/usr/sbin/tee-supplicant ${D}${sbindir}/tee-supplicant
> > +
> > +    install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0
> > +    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
> > +    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
> > +
> > +    install -d ${D}${includedir}
> > +    install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
> > +
> > +    install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
> > +
> > +    install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
> > +
> > +    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
> > +           -e s:@sbindir@:${sbindir}:g \
> > +              ${D}${systemd_system_unitdir}/tee-supplicant.service \
> > +              ${D}${sysconfdir}/init.d/tee-supplicant
> > +}
> > +
> > +SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
> > +
> > +INITSCRIPT_PACKAGES = "${PN}"
> > +
> > +INITSCRIPT_NAME_${PN} = "tee-supplicant"
> > +INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
> > +
> > diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
> > similarity index 98%
> > rename from meta-arm/recipes-security/optee/optee-client_git.bb
> > rename to meta-arm/recipes-security/optee/optee-client_3.8.0.bb
> > index 5dbbfe9..d43ebf4 100644
> > --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
> > @@ -5,8 +5,6 @@ HOMEPAGE = "https://www.op-tee.org/"
> > LICENSE = "BSD"
> > LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
> > 
> > -PV = "3.8.0+git${SRCPV}"
> > -
> > require optee.inc
> > 
> > inherit python3native systemd update-rc.d
> > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> > new file mode 100644
> > index 0000000..4a7db10
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> > @@ -0,0 +1,52 @@
> > +SUMMARY = "OP-TEE examples"
> > +DESCRIPTION = "Open Portable Trusted Execution Environment - Sample Applications"
> > +HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
> > +
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
> > +
> > +DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
> > +
> > +inherit python3native
> > +
> > +require optee.inc
> > +
> > +SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
> > +           file://0001-make-Pass-ldflags-during-link.patch \
> > +           "
> > +SRCREV = "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> > +
> > +OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> > +TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> > +TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
> > +
> > +EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> > +                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
> > +                 TEEC_EXPORT=${TEEC_EXPORT} \
> > +                 HOST_CROSS_COMPILE=${TARGET_PREFIX} \
> > +                 TA_CROSS_COMPILE=${TARGET_PREFIX} \
> > +                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
> > +                 V=1 \
> > +                 OUTPUT_DIR=${B} \
> > +               "
> > +
> > +do_compile() {
> > +    cd ${S}
> > +    oe_runmake
> > +}
> > +do_compile[cleandirs] = "${B}"
> > +
> > +do_install () {
> > +    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
> > +    mkdir -p ${D}${bindir}
> > +    install -D -p -m0755 ${B}/ca/* ${D}${bindir}
> > +    install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/optee_armtz
> > +}
> > +
> > +FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
> > +
> > +# Imports machine specific configs from staging to build
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
> > similarity index 95%
> > rename from meta-arm/recipes-security/optee/optee-examples_git.bb
> > rename to meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
> > index 71be593..7ed3dfa 100644
> > --- a/meta-arm/recipes-security/optee/optee-examples_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
> > @@ -5,8 +5,6 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
> > LICENSE = "GPLv2"
> > LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
> > 
> > -PV = "3.8.0+git${SRCPV}"
> > -
> > DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
> > 
> > inherit python3native
> > @@ -30,6 +28,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> > TEEC_EXPORT=${TEEC_EXPORT} \
> > HOST_CROSS_COMPILE=${TARGET_PREFIX} \
> > TA_CROSS_COMPILE=${TARGET_PREFIX} \
> > +                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
> > V=1 \
> > OUTPUT_DIR=${B} \
> > "
> > diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> > new file mode 100644
> > index 0000000..369e011
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> > @@ -0,0 +1,83 @@
> > +SUMMARY = "OP-TEE Trusted OS"
> > +DESCRIPTION = "Open Portable Trusted Execution Environment - Trusted side of the TEE"
> > +HOMEPAGE = "https://www.op-tee.org/"
> > +
> > +LICENSE = "BSD"
> > +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
> > +
> > +inherit deploy python3native
> > +require optee.inc
> > +
> > +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
> > +
> > +SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
> > +SRC_URI = " \
> > +    git://github.com/OP-TEE/optee_os.git \
> > +    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> > +"
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> > +
> > +OPTEEMACHINE ?= "${MACHINE}"
> > +OPTEEMACHINE_aarch64_qemuall ?= "vexpress-qemu_armv8a"
> > +OPTEE_ARCH = "null"
> > +OPTEE_ARCH_armv7a = "arm32"
> > +OPTEE_ARCH_aarch64 = "arm64"
> > +OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
> > +
> > +EXTRA_OEMAKE = " \
> > +    PLATFORM=${OPTEEMACHINE} \
> > +    CFG_${OPTEE_CORE}_core=y \
> > +    CROSS_COMPILE_core=${HOST_PREFIX} \
> > +    CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
> > +    NOWERROR=1 \
> > +    V=1 \
> > +    ta-targets=ta_${OPTEE_ARCH} \
> > +    LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
> > +    O=${B} \
> > +"
> > +
> > +CFLAGS[unexport] = "1"
> > +LDFLAGS[unexport] = "1"
> > +CPPFLAGS[unexport] = "1"
> > +AS[unexport] = "1"
> > +LD[unexport] = "1"
> > +
> > +do_configure[noexec] = "1"
> > +
> > +do_compile() {
> > +    cd ${S}
> > +    oe_runmake all CFG_TEE_TA_LOG_LEVEL=0
> > +}
> > +do_compile[cleandirs] = "${B}"
> > +
> > +do_install() {
> > +    #install core in firmware
> > +    install -d ${D}${nonarch_base_libdir}/firmware/
> > +    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
> > +
> > +    #install TA devkit
> > +    install -d ${D}${includedir}/optee/export-user_ta/
> > +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > +    done
> > +}
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +do_deploy() {
> > +    install -d ${DEPLOYDIR}/optee
> > +    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/optee/
> > +}
> > +
> > +addtask deploy before do_build after do_install
> > +
> > +SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> > +
> > +FILES_${PN} = "${nonarch_base_libdir}/firmware/"
> > +FILES_${PN}-dev = "${includedir}/optee/"
> > +
> > +INSANE_SKIP_${PN}-dev = "staticdev"
> > +
> > +INHIBIT_PACKAGE_STRIP = "1"
> > diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> > similarity index 98%
> > rename from meta-arm/recipes-security/optee/optee-os_git.bb
> > rename to meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> > index deeb515..0001271 100644
> > --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> > @@ -5,8 +5,6 @@ HOMEPAGE = "https://www.op-tee.org/"
> > LICENSE = "BSD"
> > LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
> > 
> > -PV = "3.8.0+git${SRCPV}"
> > -
> > inherit deploy python3native
> > require optee.inc
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> > new file mode 100644
> > index 0000000..96e612a
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> > @@ -0,0 +1,55 @@
> > +SUMMARY = "OP-TEE sanity testsuite"
> > +DESCRIPTION = "Open Portable Trusted Execution Environment - Test suite"
> > +HOMEPAGE = "https://www.op-tee.org/"
> > +
> > +LICENSE = "BSD & GPLv2"
> > +LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
> > +
> > +inherit python3native
> > +require optee.inc
> > +
> > +DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
> > +
> > +SRCREV = "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
> > +SRC_URI = "git://github.com/OP-TEE/optee_test.git \
> > +           file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
> > +          "
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> > +
> > +OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> > +TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
> > +TA_DEV_KIT_DIR      = "${STAGING_INCDIR}/optee/export-user_ta"
> > +
> > +EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> > +                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
> > +                 TEEC_EXPORT=${TEEC_EXPORT} \
> > +                 CROSS_COMPILE_HOST=${TARGET_PREFIX} \
> > +                 CROSS_COMPILE_TA=${TARGET_PREFIX} \
> > +                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
> > +                 V=1 \
> > +                 O=${B} \
> > +               "
> > +
> > +do_compile() {
> > +    cd ${S}
> > +    # Top level makefile doesn't seem to handle parallel make gracefully
> > +    oe_runmake xtest
> > +    oe_runmake ta
> > +}
> > +do_compile[cleandirs] = "${B}"
> > +
> > +do_install () {
> > +    install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xtest
> > +
> > +    # install path should match the value set in optee-client/tee-supplicant
> > +    # default TEEC_LOAD_PATH is /lib
> > +    mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
> > +    install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armtz/
> > +}
> > +
> > +FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
> > +
> > +# Imports machine specific configs from staging to build
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> > similarity index 96%
> > rename from meta-arm/recipes-security/optee/optee-test_git.bb
> > rename to meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> > index 957286c..65e6cd1 100644
> > --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> > @@ -10,8 +10,6 @@ require optee.inc
> > 
> > DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
> > 
> > -PV = "3.8.0+git${SRCPV}"
> > -
> > SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
> > SRC_URI = "git://github.com/OP-TEE/optee_test.git \
> > file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
> > @@ -29,6 +27,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> > TEEC_EXPORT=${TEEC_EXPORT} \
> > CROSS_COMPILE_HOST=${TARGET_PREFIX} \
> > CROSS_COMPILE_TA=${TARGET_PREFIX} \
> > +                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
> > V=1 \
> > O=${B} \
> > "
> > --
> > 2.17.1
> 
> > 
> > 
> > 
> 

> 
> 
> 

