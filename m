Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA85AC433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 18:32:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3686.1636655555234083999
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 10:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 20F3340C8A;
	Thu, 11 Nov 2021 18:32:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtAXdezdi8qY; Thu, 11 Nov 2021 18:32:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EFC6F40CB5;
	Thu, 11 Nov 2021 18:32:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B9F8F1746BD; Thu, 11 Nov 2021 13:32:30 -0500 (EST)
Date: Thu, 11 Nov 2021 13:32:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Subject: Re: [meta-arm] [PATCH 2/2] add optee-ftpm
Message-ID: <20211111183230.GN10132@denix.org>
References: <20211103131144.4005-1-maxim.uvarov@linaro.org>
 <20211103131144.4005-2-maxim.uvarov@linaro.org>
 <20211103172302.GU10132@denix.org>
 <CAD8XO3bHc9mkMd0w-Hj5cAne73SDTaMe3n3m1zWgZSJL+soG5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAD8XO3bHc9mkMd0w-Hj5cAne73SDTaMe3n3m1zWgZSJL+soG5Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 18:32:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2376

On Thu, Nov 11, 2021 at 02:42:33PM +0300, Maxim Uvarov wrote:
> Thanks Denys,
> 
> I installed KAS and updated the patch to the current master. I also
> have a few comments below.
> 
> On Wed, 3 Nov 2021 at 20:23, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Wed, Nov 03, 2021 at 04:11:44PM +0300, Maxim Uvarov wrote:
> > > Add software TPM emulated in the OPTEE-OS.
> > >
> > > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > ---
> > >  .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 13 +++
> > >  .../0002-add-enum-to-ta-flags.patch           | 26 ++++++
> > >  .../otee-ftpm/optee-ftpm_git.bb               | 82 +++++++++++++++++++
> > >  .../otee-ftpm/optee-os_%.bbappend             |  7 ++
> > >  4 files changed, 128 insertions(+)
> > >  create mode 100644 meta-arm/recipes-security/otee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> > >  create mode 100644 meta-arm/recipes-security/otee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
> > >  create mode 100644 meta-arm/recipes-security/otee-ftpm/optee-ftpm_git.bb
> > >  create mode 100644 meta-arm/recipes-security/otee-ftpm/optee-os_%.bbappend
> > >
> > > diff --git a/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch b/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> > > new file mode 100644
> > > index 0000000..3e61d2d
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> >
> > Patch w/o a header?
> >
> >
> > > @@ -0,0 +1,13 @@
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
> > > diff --git a/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
> > > new file mode 100644
> > > index 0000000..0d285d7
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/otee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
> > > @@ -0,0 +1,26 @@
> > > +From 2d00f16058529eb9f4d4d2bcaeed91fd53b43989 Mon Sep 17 00:00:00 2001
> > > +From: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > +Date: Fri, 17 Apr 2020 12:05:53 +0100
> > > +Subject: [PATCH 2/2] add enum to ta flags
> > > +
> > > +Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> >
> > Upstream-Status?
> >
> >
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
> > > diff --git a/meta-arm/recipes-security/otee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/otee-ftpm/optee-ftpm_git.bb
> > > new file mode 100644
> > > index 0000000..1eb11b0
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/otee-ftpm/optee-ftpm_git.bb
> > > @@ -0,0 +1,82 @@
> > > +SUMMARY = "OPTEE fTPM Microsoft TA"
> > > +DESCRIPTION = "OPTEE fTPM"
> >
> > The other way around - short summary and long description (if needed)
> >
> >
> > > +HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
> > > +
> > > +inherit autotools-brokensep deploy pkgconfig gettext python3native
> > > +
> > > +FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=27e94c0280987ab296b0b8dd02ab9fe5"
> > > +SYSROOT_DIRS += "${RECIPE_SYSROOT}/../optee-ftpm/usr/"
> >
> > Why is this?
> >
> >
> > > +DEPENDS = "optee-client openssl"
> > > +DEPENDS += " openssl-native autoconf-archive-native"
> > > +DEPENDS += " python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
> > > +DEPENDS += " libgcc"
> > > +DEPENDS += " optee-os-tadevkit"
> >
> > Seems excessive...
> >
> >
> > > +# SRC_URI = "git://github.com/Microsoft/ms-tpm-20-ref;branch=master"
> > > +# Since this is not built as a pseudo TA, we can only use it as a kernel module and not built in.
> > > +# The TEE supplicant is also needed to provide access to secure storage.
> > > +# Secure storage access required by OP-TEE fTPM TA
> > > +# is provided via OP-TEE supplicant that's not available during boot.
> > > +# Fix this once we replace this with the MS implementation
> > > +SRC_URI = "git://github.com/microsoft/MSRSec"
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
> > > +EXTRA_OEMAKE_append_aarch64 = "\
> >
> > Old override syntax
> >
> >
> > > +    CFG_ARM64_ta_arm64=y \
> > > +"
> > > +
> > > +B = "${S}"
> > > +
> > > +do_unpack_append() {
> > > +    bb.build.exec_func('source_fixup_patch', d)
> > > +}
> > > +
> > > +source_fixup_patch() {
> > > +    cd ${S}
> > > +    git submodule update --init
> >
> > There's a special bitbake fetcher for git submodules - this way is hacky and
> > will mess up sstate etc.
> >
> >
> > > +    sed -i 's/-mcpu=$(TA_CPU)//' TAs/optee_ta/fTPM/sub.mk
> >
> > Patching in do_unpack()?
> >
> >
> > > +}
> > > +
> > > +do_compile() {
> > > +    # there's also a secure variable storage TA called authvars
> > > +    cd ${S}/TAs/optee_ta
> > > +    # fails with j > 1
> > > +    oe_runmake -j1 ftpm
> >
> > This is done with:
> > PARALLEL_MAKE = ""
> >
> >
> > > +}
> > > +
> > > +do_install () {
> > > +    mkdir -p ${D}/lib/optee_armtz
> > > +    install -D -p -m0444 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/optee_armtz/
> >
> > Use ${nonarch_base_libdir} instead of /lib
> > And should permissions be 644 instead of 444?
> >
> >
> > > +}
> > > +
> > > +do_deploy () {
> > > +     install -d ${DEPLOYDIR}/optee
> > > +    install -D -p -m0444 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${DEPLOYDIR}/optee/
> >
> > Permissions
> >
> >
> > > +}
> > > +
> > > +addtask deploy before do_build after do_install
> > > +
> > > +FILES_${PN} += "/lib/optee_armtz/${FTPM_UUID}.ta"
> >
> > ${nonarch_base_libdir}
> >
> >
> > > +
> > > +# Imports machine specific configs from staging to build
> > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > +INSANE_SKIP_${PN} += "ldflags"
> > > diff --git a/meta-arm/recipes-security/otee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/otee-ftpm/optee-os_%.bbappend
> >
> > bbappend for optee-os, but in a separate dir?
> 
> Yes. It's optee-ftpm/ under directory. This also will force otee-os to
> compile-in this TA. There might be other TAs which users would like to
> compile-in in the same way.

bbappend is not optional and it doesn't allow picking and choosing different 
TAs. Moreover, using bbappend in the same layer could be confusing.


> > > new file mode 100644
> > > index 0000000..c102de4
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/otee-ftpm/optee-os_%.bbappend
> > > @@ -0,0 +1,7 @@
> > > +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >
> > Old override synax
> >
> >
> > > +
> > > +DEPENDS += "optee-ftpm"
> > > +inherit deploy
> >
> > Redundant
> 
> 'inherit deploy'  defines ${DEPLOY_DIR_IMAGE} variable which is used below.

But why do it twice?


> > > +FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> >
> > Is it hardcoded? Where does it come from? Maybe a commend needed?
> 
> 
> It's TA (Trusted Application) which builds in the current folder
> optee-ftpm/ . I think from the tree it should be clear that you build
> TA and ask optee-os to compile it in.
> But if you would like to add some text here please let me know.
> 
> All others notes will be fixed in v2.
> 
> BR,
> Maxim.
> 
> >
> >
> > > +EXTRA_OEMAKE_append='CFG_EARLY_TA=y EARLY_TA_PATHS="${DEPLOY_DIR_IMAGE}/optee/${FTPM_UUID}.stripped.elf"'
> >${DEPLOY_DIR_IMAGE}/
> > Also old override syntax

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

