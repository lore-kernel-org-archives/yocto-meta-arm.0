Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.7060.1604452733405892221
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 17:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DCFB540B2D;
	Wed,  4 Nov 2020 01:18:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWzdn6B36OyY; Wed,  4 Nov 2020 01:18:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C019940AFF;
	Wed,  4 Nov 2020 01:18:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8C6901744E0; Tue,  3 Nov 2020 20:18:51 -0500 (EST)
Date: Tue, 3 Nov 2020 20:18:51 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 7/7] arm/optee: consolidate common variables
Message-ID: <20201104011851.GD19155@denix.org>
References: <20201102153341.2844482-1-ross.burton@arm.com>
 <20201102153341.2844482-7-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201102153341.2844482-7-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2020 at 03:33:41PM +0000, Ross Burton wrote:
> Move a number of shared varibles into optee.inc so that they don't have
> to be duplicated repeatedly.
> 
> Change-Id: Ie2565dfa66cbd61aad199224a4cdc7b2e1af0c5d
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-security/optee/optee-examples.inc | 17 +++------------
>  meta-arm/recipes-security/optee/optee-os.inc  | 14 +------------
>  .../recipes-security/optee/optee-test.inc     | 16 +++-----------
>  meta-arm/recipes-security/optee/optee.inc     | 21 +++++++++++++++++++
>  4 files changed, 28 insertions(+), 40 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> index 73193f5..851043b 100644
> --- a/meta-arm/recipes-security/optee/optee-examples.inc
> +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> @@ -15,26 +15,15 @@ SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
>             file://0001-make-Pass-ldflags-during-link.patch \
>            "
>  
> -OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
> -
> -EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> -                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
> -                 TEEC_EXPORT=${TEEC_EXPORT} \
> -                 HOST_CROSS_COMPILE=${TARGET_PREFIX} \
> -                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
> -                 COMPILER=${OPTEE_COMPILER} \
> -                 TA_CROSS_COMPILE=${TARGET_PREFIX} \
> -                 V=1 \
> +EXTRA_OEMAKE += "TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> +                 HOST_CROSS_COMPILE=${HOST_PREFIX} \
> +                 TA_CROSS_COMPILE=${HOST_PREFIX} \
>                   OUTPUT_DIR=${B} \
>                 "
>  
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
>  
> -OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> -TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> -TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
> -
>  do_compile() {
>      oe_runmake -C ${S}
>  }
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index e513fcc..ea6c496 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -17,25 +17,13 @@ SRC_URI = "git://github.com/OP-TEE/optee_os.git"
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
>  
> -OPTEEMACHINE ?= "${MACHINE}"
> -OPTEEMACHINE_aarch64_qemuall ?= "vexpress-qemu_armv8a"
> -OPTEE_ARCH = "null"
> -OPTEE_ARCH_armv7a = "arm32"
> -OPTEE_ARCH_aarch64 = "arm64"
> -OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
> -OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
> -
> -
> -EXTRA_OEMAKE = " \
> +EXTRA_OEMAKE += " \
>      PLATFORM=${OPTEEMACHINE} \
>      CFG_${OPTEE_CORE}_core=y \
>      CROSS_COMPILE_core=${HOST_PREFIX} \
>      CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
>      NOWERROR=1 \
> -    V=1 \

I noticed verbose building got disabled - any specific reasons?


>      ta-targets=ta_${OPTEE_ARCH} \
> -    LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
> -    COMPILER=${OPTEE_COMPILER} \
>      O=${B} \
>  "
>  
> diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> index 95ed311..467e687 100644
> --- a/meta-arm/recipes-security/optee/optee-test.inc
> +++ b/meta-arm/recipes-security/optee/optee-test.inc
> @@ -19,19 +19,9 @@ SRC_URI = "git://github.com/OP-TEE/optee_test.git \
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
>  
> -OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
> -TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
> -TA_DEV_KIT_DIR      = "${STAGING_INCDIR}/optee/export-user_ta"
> -OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
> -
> -EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> -                 OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
> -                 TEEC_EXPORT=${TEEC_EXPORT} \
> -                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
> -                 COMPILER=${OPTEE_COMPILER} \
> -                 CROSS_COMPILE_HOST=${TARGET_PREFIX} \
> -                 CROSS_COMPILE_TA=${TARGET_PREFIX} \
> -                 V=1 \
> +EXTRA_OEMAKE += "TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
> +                 CROSS_COMPILE_HOST=${HOST_PREFIX} \
> +                 CROSS_COMPILE_TA=${HOST_PREFIX} \
>                   O=${B} \
>                 "
>  
> diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> index 4bf87fe..8aaf616 100644
> --- a/meta-arm/recipes-security/optee/optee.inc
> +++ b/meta-arm/recipes-security/optee/optee.inc
> @@ -1,3 +1,24 @@
>  COMPATIBLE_MACHINE ?= "invalid"
>  COMPATIBLE_MACHINE_qemuarm64 ?= "qemuarm64"
>  # Please add supported machines below or set it in .bbappend or .conf
> +
> +OPTEEMACHINE ?= "${MACHINE}"
> +OPTEEMACHINE_aarch64_qemuall ?= "vexpress-qemu_armv8a"
> +
> +OPTEE_ARCH = "null"
> +OPTEE_ARCH_armv7a = "arm32"
> +OPTEE_ARCH_aarch64 = "arm64"
> +OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
> +
> +OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
> +
> +# Set here but not passed to EXTRA_OEMAKE by default as that breaks
> +# the optee-os build
> +TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
> +
> +EXTRA_OEMAKE += "V=1 \
> +                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
> +                 COMPILER=${OPTEE_COMPILER} \
> +                 OPTEE_CLIENT_EXPORT=${STAGING_DIR_HOST}${prefix} \
> +                 TEEC_EXPORT=${STAGING_DIR_HOST}${prefix} \
> +                "
> -- 
> 2.25.1
> 

> 
> 
> 

