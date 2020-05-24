Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.18376.1590344887642157141
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 24 May 2020 11:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F124E40BEF
	for <meta-arm@lists.yoctoproject.org>; Sun, 24 May 2020 18:28:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IwcyNjqFD7OU for <meta-arm@lists.yoctoproject.org>;
	Sun, 24 May 2020 18:28:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D57D840A35
	for <meta-arm@lists.yoctoproject.org>; Sun, 24 May 2020 18:28:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 90DB0173205; Sun, 24 May 2020 14:28:06 -0400 (EDT)
Date: Sun, 24 May 2020 14:28:06 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v3 1/3] optee-{os,examples,client,test}: Build out of tree
Message-ID: <20200524182806.GG17660@denix.org>
References: <20200521142259.15363-2-JPEWhacker@gmail.com>
 <12610.1590131993511480969@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <12610.1590131993511480969@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2020 at 12:19:53AM -0700, Diego Sueiro wrote:
> On Thu, May 21, 2020 at 03:23 PM, Joshua Watt wrote:
> 
> >
> > Modifies the optee recipes to all build out of tree. This is cleaner and
> > helps prevent build error from stale builds when dependencies change.
> > Also allows the elimination of the OPTEEOUTPUTMACHINE variable in
> > optee-os.
> > 
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> > ---
> >  .../recipes-security/optee/optee-client_git.bb   | 16 +++++++++++++---
> >  .../recipes-security/optee/optee-examples_git.bb |  8 ++++++--
> >  meta-arm/recipes-security/optee/optee-os_git.bb  | 10 ++++++----
> >  .../recipes-security/optee/optee-test_git.bb     |  8 ++++++--
> >  4 files changed, 31 insertions(+), 11 deletions(-)
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb
> > b/meta-arm/recipes-security/optee/optee-client_git.bb
> > index bae7b20..64d7d57 100644
> > --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> > @@ -18,20 +18,30 @@ SRC_URI = " \
> >  "
> >
> >  S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> >
> >  SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
> >
> > +EXTRA_OEMAKE = "O=${B}"
> > +
> > +do_compile() {
> > +    cd ${S}
> > +    oe_runmake
> > +}
> > +do_compile[cleandirs] = "${B}"
> > +
> >  do_install() {
> > +    cd ${S}
> >      oe_runmake install
> >
> > -    install -D -p -m0755 ${S}/out/export/usr/sbin/tee-supplicant
> > ${D}${sbindir}/tee-supplicant
> > +    install -D -p -m0755 ${B}/export/usr/sbin/tee-supplicant
> > ${D}${sbindir}/tee-supplicant
> >
> > -    install -D -p -m0644 ${S}/out/export/usr/lib/libteec.so.1.0
> > ${D}${libdir}/libteec.so.1.0
> > +    install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0
> > ${D}${libdir}/libteec.so.1.0
> >      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
> >      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
> >
> >      install -d ${D}${includedir}
> > -    install -p -m0644 ${S}/out/export/usr/include/*.h ${D}${includedir}
> > +    install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
> >
> >      sed -i -e s:/etc:${sysconfdir}:g \
> >             -e s:/usr/bin:${bindir}:g \
> > diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb
> > b/meta-arm/recipes-security/optee/optee-examples_git.bb
> > index 996e2cd..04cc5fd 100644
> > --- a/meta-arm/recipes-security/optee/optee-examples_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
> > @@ -17,6 +17,7 @@ SRC_URI = "git://github.com/linaro-swg/optee_examples.git"
> >  SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
> >
> >  S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> >
> >  OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> >  TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> > @@ -28,17 +29,20 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> >                   HOST_CROSS_COMPILE=${TARGET_PREFIX} \
> >                   TA_CROSS_COMPILE=${TARGET_PREFIX} \
> >                   V=1 \
> > +                 OUTPUT_DIR=${B} \
> >                 "
> >
> >  do_compile() {
> > +    cd ${S}
> >      oe_runmake
> >  }
> > +do_compile[cleandirs] = "${B}"
> >
> >  do_install () {
> >      mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
> >      mkdir -p ${D}${bindir}
> > -    install -D -p -m0755 ${S}/out/ca/* ${D}${bindir}
> > -    install -D -p -m0444 ${S}/out/ta/* ${D}${nonarch_base_libdir}/optee_armtz
> > +    install -D -p -m0755 ${B}/ca/* ${D}${bindir}
> > +    install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/optee_armtz
> >  }
> >
> >  FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
> > diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb
> > b/meta-arm/recipes-security/optee/optee-os_git.bb
> > index eced362..dcbe990 100644
> > --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> > @@ -20,10 +20,9 @@ SRC_URI = " \
> >  "
> >
> >  S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> >
> >  OPTEEMACHINE ?= "${MACHINE}"
> > -OPTEEOUTPUTMACHINE ?= "${MACHINE}"
> > -
> >  OPTEE_ARCH = "null"
> >  OPTEE_ARCH_armv7a = "arm32"
> >  OPTEE_ARCH_aarch64 = "arm64"
> > @@ -38,6 +37,7 @@ EXTRA_OEMAKE = " \
> >      V=1 \
> >      ta-targets=ta_${OPTEE_ARCH} \
> >      LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
> > +    O=${B} \
> >  "
> >
> >  CFLAGS[unexport] = "1"
> > @@ -49,17 +49,19 @@ LD[unexport] = "1"
> >  do_configure[noexec] = "1"
> >
> >  do_compile() {
> > +    cd ${S}
> >      oe_runmake all CFG_TEE_TA_LOG_LEVEL=0
> >  }
> > +do_compile[cleandirs] = "${B}"
> >
> >  do_install() {
> >      #install core in firmware
> >      install -d ${D}${nonarch_base_libdir}/firmware/
> > -    install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.bin
> > ${D}${nonarch_base_libdir}/firmware/
> > +    install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
> >
> >      #install TA devkit
> >      install -d ${D}${includedir}/optee/export-user_ta/
> > -    for f in
> > ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-ta_${OPTEE_ARCH}/* ; do
> > +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> >          cp -aR $f ${D}${includedir}/optee/export-user_ta/
> >      done
> >  }
> > diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb
> > b/meta-arm/recipes-security/optee/optee-test_git.bb
> > index ee73a2c..f699972 100644
> > --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-test_git.bb
> > @@ -16,6 +16,7 @@ SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
> >  SRC_URI = "git://github.com/OP-TEE/optee_test.git"
> >
> >  S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> >
> >  OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> >  TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
> > @@ -27,21 +28,24 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> >                   CROSS_COMPILE_HOST=${TARGET_PREFIX} \
> >                   CROSS_COMPILE_TA=${TARGET_PREFIX} \
> >                   V=1 \
> > +                 O=${B} \
> >                 "
> >
> >  do_compile() {
> > +    cd ${S}
> >      # Top level makefile doesn't seem to handle parallel make gracefully
> >      oe_runmake xtest
> >      oe_runmake ta
> >  }
> > +do_compile[cleandirs] = "${B}"
> >
> >  do_install () {
> > -    install -D -p -m0755 ${S}/out/xtest/xtest ${D}${bindir}/xtest
> > +    install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xtest
> >
> >      # install path should match the value set in optee-client/tee-supplicant
> >      # default TEEC_LOAD_PATH is /lib
> >      mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
> > -    install -D -p -m0444 ${S}/out/ta/*/*.ta
> > ${D}${nonarch_base_libdir}/optee_armtz/
> > +    install -D -p -m0444 ${B}/ta/*/*.ta
> > ${D}${nonarch_base_libdir}/optee_armtz/
> >  }
> >
> >  FILES_${PN} += "${nonarch_base_libdir}/optee_armtz/"
> > -- 
> > 2.17.1
> > 
> >

> 

