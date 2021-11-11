Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B454C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 19:13:16 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.4296.1636657995047021425
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 11:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1125640C90;
	Thu, 11 Nov 2021 19:13:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9go5xeMzOck; Thu, 11 Nov 2021 19:13:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D6D2740C8A;
	Thu, 11 Nov 2021 19:13:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 511011746C1; Thu, 11 Nov 2021 14:13:10 -0500 (EST)
Date: Thu, 11 Nov 2021 14:13:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Subject: Re: [meta-arm] [PATCHv2 2/3] add optee-ftpm
Message-ID: <20211111191310.GP10132@denix.org>
References: <20211111131615.16972-1-maxim.uvarov@linaro.org>
 <20211111131615.16972-2-maxim.uvarov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111131615.16972-2-maxim.uvarov@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 19:13:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2377

On Thu, Nov 11, 2021 at 04:16:14PM +0300, Maxim Uvarov wrote:
> Add software TPM emulated in the OPTEE-OS.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 20 ++++++
>  .../0002-add-enum-to-ta-flags.patch           | 30 ++++++++
>  .../optee-ftpm/optee-ftpm_git.bb              | 71 +++++++++++++++++++
>  .../optee-ftpm/optee-os_%.bbappend            |  5 ++
>  4 files changed, 126 insertions(+)
>  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
>  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
>  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
>  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> 
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> new file mode 100644
> index 0000000..08acde2
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> @@ -0,0 +1,20 @@
> +fix gcc compilation
> +
> +just fix compilation under gcc.
> +Upstream-Status: Submitted [https://github.com/wolfSSL/wolfssl/pull/4563]
> +
> +Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> +
> +diff --git a/wolfssl/wolfcrypt/types.h b/wolfssl/wolfcrypt/types.h
> +index 7b3a953aebda..e156ae5c7909 100755
> +--- a/external/wolfssl/wolfssl/wolfcrypt/types.h
> ++++ b/external/wolfssl/wolfssl/wolfcrypt/types.h
> +@@ -181,7 +181,7 @@
> +     /* GCC 7 has new switch() fall-through detection */
> +     #if defined(__GNUC__)
> +         #if ((__GNUC__ > 7) || ((__GNUC__ == 7) && (__GNUC_MINOR__ >= 1)))
> +-            #define FALL_THROUGH __attribute__ ((fallthrough));
> ++            #define FALL_THROUGH __attribute__ ((__fallthrough__));
> +         #endif
> +     #endif
> +     #ifndef FALL_THROUGH
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
> new file mode 100644
> index 0000000..bbc1107
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0002-add-enum-to-ta-flags.patch
> @@ -0,0 +1,30 @@
> +From 2d00f16058529eb9f4d4d2bcaeed91fd53b43989 Mon Sep 17 00:00:00 2001
> +From: Maxim Uvarov <maxim.uvarov@linaro.org>
> +Date: Fri, 17 Apr 2020 12:05:53 +0100
> +Subject: [PATCH 2/2] add enum to ta flags
> +
> +If we compile this TA into OPTEE-OS we need to define a flag
> +that this TA can be discovered on the optee bus.
> +Upstream-Status: Submitted [https://github.com/microsoft/MSRSec/pull/34]
> +
> +Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> +---
> + TAs/optee_ta/fTPM/user_ta_header_defines.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/TAs/optee_ta/fTPM/user_ta_header_defines.h b/TAs/optee_ta/fTPM/user_ta_header_defines.h
> +index 6ff62d1..685b54a 100644
> +--- a/TAs/optee_ta/fTPM/user_ta_header_defines.h
> ++++ b/TAs/optee_ta/fTPM/user_ta_header_defines.h
> +@@ -44,7 +44,7 @@
> + 
> + #define TA_UUID                     TA_FTPM_UUID
> + 
> +-#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE )
> ++#define TA_FLAGS                    (TA_FLAG_SINGLE_INSTANCE | TA_FLAG_INSTANCE_KEEP_ALIVE | TA_FLAG_DEVICE_ENUM_SUPP)
> + #define TA_STACK_SIZE               (64 * 1024)
> + #define TA_DATA_SIZE                (64 * 1024)
> + 
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> new file mode 100644
> index 0000000..a6244b2
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> @@ -0,0 +1,71 @@
> +SUMMARY = "OPTEE fTPM Microsoft TA"
> +DESCRIPTION = "OPTEE fTPM"

There's no need in DESCRIPTION here, as it's meant to expand on the short 
SUMMARY and provide a more detailed description of the package, which it 
clearly doesn't here.


> +HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
> +
> +inherit autotools-brokensep deploy pkgconfig gettext python3native
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=27e94c0280987ab296b0b8dd02ab9fe5"
> +
> +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
> +DEPENDS += " optee-os-tadevkit"
> +
> +FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> +
> +# SRC_URI = "git://github.com/Microsoft/ms-tpm-20-ref;branch=master"
> +# Since this is not built as a pseudo TA, we can only use it as a kernel module and not built in.
> +# The TEE supplicant is also needed to provide access to secure storage.
> +# Secure storage access required by OP-TEE fTPM TA
> +# is provided via OP-TEE supplicant that's not available during boot.
> +# Fix this once we replace this with the MS implementation
> +SRC_URI = "gitsm://github.com/microsoft/MSRSec;protocol=https;branch=master"
> +SRC_URI += "file://0000-fix-ssl-fallthrough.patch"
> +SRC_URI += "file://0002-add-enum-to-ta-flags.patch"
> +SRCREV = "76f81b36efbb1a366b0d382bc0defe677f1f0534"
> +
> +S = "${WORKDIR}/git"
> +
> +OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> +TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> +TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
> +
> +EXTRA_OEMAKE += '\
> +    CFG_FTPM_USE_WOLF=y \
> +    TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> +    TA_CROSS_COMPILE=${TARGET_PREFIX} \
> +    CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_HOST} -I${WORKDIR}/optee-os" \
> +'
> +
> +EXTRA_OEMAKE:append:aarch64:qemuall = "\

Is it aarch64 or qemuall?


> +    CFG_ARM64_ta_arm64=y \
> +"
> +
> +B = "${S}"
> +
> +# fails with j > 1
> +PARALLEL_MAKE = ""
> +
> +do_compile() {
> +    sed -i 's/-mcpu=$(TA_CPU)//' TAs/optee_ta/fTPM/sub.mk

If not done statically as a patch, then should at least be done in 
do_configure() instead of do_compile()


> +    # there's also a secure variable storage TA called authvars
> +    cd ${S}/TAs/optee_ta
> +    oe_runmake ftpm
> +}
> +
> +do_install () {
> +    mkdir -p ${D}/lib/optee_armtz
> +    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/optee_armtz/

/lib -> ${nonarch_base_libdir}


> +}
> +
> +do_deploy () {
> +    install -d ${DEPLOYDIR}/optee
> +    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.stripped.elf ${DEPLOYDIR}/optee/
> +}
> +
> +addtask deploy before do_build after do_install
> +
> +FILES:${PN} += "${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.ta"
> +
> +# Imports machine specific configs from staging to build
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +INSANE_SKIP:${PN} += "ldflags"
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> new file mode 100644
> index 0000000..910603e
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> @@ -0,0 +1,5 @@
> +DEPENDS:append = "optee-ftpm"
> +inherit deploy

Again, this is redundant, as optee-os already inherits deploy.


> +FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> +EXTRA_OEMAKE:append='CFG_EARLY_TA=y EARLY_TA_PATHS="${DEPLOY_DIR_IMAGE}/optee/${FTPM_UUID}.stripped.elf"'

Needs a leading whitespace, as :append won't insert it, hence it will 
concatenate it to the existing value of EXTRA_OEMAKE.

And I do believe there's a confusion about how bbappends work in OE - it is 
not optional, even when it's in a different directory. This bbappend will 
unconditionally modify the main optee-os recipe, which is also in the same 
layer. So, if it is meant to unconditionally modify optee-os, then these 
changes should go directly into optee-os recipe, instead of a bbappend. And 
if this is meant to be an optional extension to optee-os, then it cannot be 
done as bbappend either.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

