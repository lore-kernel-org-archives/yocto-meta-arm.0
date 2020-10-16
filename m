Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22879.1602872328130958230
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Oct 2020 11:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A0ED40BD6;
	Fri, 16 Oct 2020 18:18:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlWto805ZBF7; Fri, 16 Oct 2020 18:18:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3967640BC7;
	Fri, 16 Oct 2020 18:18:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0274217449A; Fri, 16 Oct 2020 14:18:44 -0400 (EDT)
Date: Fri, 16 Oct 2020 14:18:44 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Brett Warren <brett.warren@arm.com>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH v2 2/6] optee: upgraded recipes to 3.10
Message-ID: <20201016181844.GY19155@denix.org>
References: <163E8B1B2086C4D9.31077@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <163E8B1B2086C4D9.31077@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2020 at 02:04:14PM -0400, Denys Dmytriyenko wrote:
> From: Brett Warren <brett.warren@arm.com>
> 
> The optee recipes were upgraded due to issues booting with 3.8
> on qemuarm64-secureboot, which were resolved by the upgrade.
> The 3.8 recipes are retained for backwards compatibility.
> 
> optee-test and optee-examples were modified to pass a sysroot
> to the LIBGCC_LOCATE_CFLAGS parameter, to ensure proper location
> of the libgcc library.
> 
> Recipes have been renamed to reflect their current version.
> As this makes the PV variables redundent, these have been removed.
> 
> Patch 0006 has been refreshed to work with 3.10 without fuzzing.
> The original copy has been retained for the 3.8 recipes to use.
> 
> Change-Id: Iacaba02d64570a790d5cc20eca8be58246e39019
> Signed-off-by: Brett Warren <brett.warren@arm.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> Resend of the origin v2 patch with --find-copies-harder to help with the review.

Much easier to review now! You can now see diff between 3.8 and 3.10

The only minor comment I have is about inconsistent naming of the patches:

* 3.8 still uses 6+ patches and #6 in the series got renamed and dropped 0006- 
prefix for some reason

* 3.10 now doesn't apply first 5 patches, making #6 a standalone one, but it 
retains 0006- prefix

I would expect those 2 points above to be the other way around. But it's not 
critical and purely cosmetic... So, up to the maintainer to decide on this.


>  .../optee/{optee-client_git.bb => optee-client_3.10.0.bb} |  4 +---
>  .../optee/{optee-client_git.bb => optee-client_3.8.0.bb}  |  2 --
>  .../{optee-examples_git.bb => optee-examples_3.10.0.bb}   |  5 ++---
>  .../{optee-examples_git.bb => optee-examples_3.8.0.bb}    |  3 +--
>  .../0006-allow-setting-sysroot-for-libgcc-lookup.patch    | 15 ++++++---------
>  ...low-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch} |  0
>  .../optee/{optee-os_git.bb => optee-os_3.10.0.bb}         | 10 +---------
>  .../optee/{optee-os_git.bb => optee-os_3.8.0.bb}          |  4 +---
>  .../optee/{optee-test_git.bb => optee-test_3.10.0.bb}     |  5 ++---
>  .../optee/{optee-test_git.bb => optee-test_3.8.0.bb}      |  3 +--
>  10 files changed, 15 insertions(+), 36 deletions(-)
>  copy meta-arm/recipes-security/optee/{optee-client_git.bb => optee-client_3.10.0.bb} (95%)
>  rename meta-arm/recipes-security/optee/{optee-client_git.bb => optee-client_3.8.0.bb} (98%)
>  copy meta-arm/recipes-security/optee/{optee-examples_git.bb => optee-examples_3.10.0.bb} (92%)
>  rename meta-arm/recipes-security/optee/{optee-examples_git.bb => optee-examples_3.8.0.bb} (95%)
>  copy meta-arm/recipes-security/optee/optee-os/{0006-allow-setting-sysroot-for-libgcc-lookup.patch => allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch} (100%)
>  copy meta-arm/recipes-security/optee/{optee-os_git.bb => optee-os_3.10.0.bb} (81%)
>  rename meta-arm/recipes-security/optee/{optee-os_git.bb => optee-os_3.8.0.bb} (96%)
>  copy meta-arm/recipes-security/optee/{optee-test_git.bb => optee-test_3.10.0.bb} (93%)
>  rename meta-arm/recipes-security/optee/{optee-test_git.bb => optee-test_3.8.0.bb} (96%)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> similarity index 95%
> copy from meta-arm/recipes-security/optee/optee-client_git.bb
> copy to meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> index 5dbbfe9..cbd3b93 100644
> --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
> @@ -5,13 +5,11 @@ HOMEPAGE = "https://www.op-tee.org/"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
>  
> -PV = "3.8.0+git${SRCPV}"
> -
>  require optee.inc
>  
>  inherit python3native systemd update-rc.d
>  
> -SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
> +SRCREV = "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
>  SRC_URI = " \
>      git://github.com/OP-TEE/optee_client.git \
>      file://tee-supplicant.service \
> diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
> similarity index 98%
> rename from meta-arm/recipes-security/optee/optee-client_git.bb
> rename to meta-arm/recipes-security/optee/optee-client_3.8.0.bb
> index 5dbbfe9..d43ebf4 100644
> --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
> @@ -5,8 +5,6 @@ HOMEPAGE = "https://www.op-tee.org/"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
>  
> -PV = "3.8.0+git${SRCPV}"
> -
>  require optee.inc
>  
>  inherit python3native systemd update-rc.d
> diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> similarity index 92%
> copy from meta-arm/recipes-security/optee/optee-examples_git.bb
> copy to meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> index 71be593..4a7db10 100644
> --- a/meta-arm/recipes-security/optee/optee-examples_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
> @@ -5,8 +5,6 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
>  
> -PV = "3.8.0+git${SRCPV}"
> -
>  DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
>  
>  inherit python3native
> @@ -16,7 +14,7 @@ require optee.inc
>  SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
>             file://0001-make-Pass-ldflags-during-link.patch \
>             "
> -SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
> +SRCREV = "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
>  
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
> @@ -30,6 +28,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
>                   TEEC_EXPORT=${TEEC_EXPORT} \
>                   HOST_CROSS_COMPILE=${TARGET_PREFIX} \
>                   TA_CROSS_COMPILE=${TARGET_PREFIX} \
> +                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
>                   V=1 \
>                   OUTPUT_DIR=${B} \
>                 "
> diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
> similarity index 95%
> rename from meta-arm/recipes-security/optee/optee-examples_git.bb
> rename to meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
> index 71be593..7ed3dfa 100644
> --- a/meta-arm/recipes-security/optee/optee-examples_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
> @@ -5,8 +5,6 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
>  
> -PV = "3.8.0+git${SRCPV}"
> -
>  DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
>  
>  inherit python3native
> @@ -30,6 +28,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
>                   TEEC_EXPORT=${TEEC_EXPORT} \
>                   HOST_CROSS_COMPILE=${TARGET_PREFIX} \
>                   TA_CROSS_COMPILE=${TARGET_PREFIX} \
> +                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
>                   V=1 \
>                   OUTPUT_DIR=${B} \
>                 "
> diff --git a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
> index d911d80..86e8428 100644
> --- a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
> +++ b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
> @@ -1,25 +1,22 @@
> -From 030cd84cf0df1c27355ec02e0226317684897a97 Mon Sep 17 00:00:00 2001
> +From 017994c477e2d082395460de83a7828d4e7d4b70 Mon Sep 17 00:00:00 2001
>  From: Joshua Watt <JPEWhacker@gmail.com>
>  Date: Tue, 26 May 2020 14:38:02 -0500
> -Subject: [PATCH 6/6] allow setting sysroot for libgcc lookup
> +Subject: [PATCH] allow setting sysroot for libgcc lookup
>  
>  ---
>   mk/gcc.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/mk/gcc.mk b/mk/gcc.mk
> -index c53a23b1..330b200a 100644
> +index adc77a24..e238b9f3 100644
>  --- a/mk/gcc.mk
>  +++ b/mk/gcc.mk
> -@@ -12,7 +12,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
> +@@ -13,7 +13,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
>   			-print-file-name=include 2> /dev/null)
>   
>   # Get location of libgcc from gcc
>  -libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
>  +libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
>   			-print-libgcc-file-name 2> /dev/null)
> - 
> - # Define these to something to discover accidental use
> --- 
> -2.17.1
> -
> + libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
> + 			-print-file-name=libstdc++.a 2> /dev/null)
> diff --git a/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-os/allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch
> similarity index 100%
> copy from meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
> copy to meta-arm/recipes-security/optee/optee-os/allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> similarity index 81%
> copy from meta-arm/recipes-security/optee/optee-os_git.bb
> copy to meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> index deeb515..369e011 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
> @@ -5,23 +5,15 @@ HOMEPAGE = "https://www.op-tee.org/"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
>  
> -PV = "3.8.0+git${SRCPV}"
> -
>  inherit deploy python3native
>  require optee.inc
>  
>  DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
>  
> -SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
> +SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
>  SRC_URI = " \
>      git://github.com/OP-TEE/optee_os.git \
> -    file://0001-mk-compile.mk-fix-cc-option-macro.patch \
> -    file://0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
> -    file://0003-arm64-Disable-outline-atomics-when-compiling.patch \
> -    file://0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch \
> -    file://0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
>      file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> -    file://missing-mkdir.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> similarity index 96%
> rename from meta-arm/recipes-security/optee/optee-os_git.bb
> rename to meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> index deeb515..8791bc7 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> @@ -5,8 +5,6 @@ HOMEPAGE = "https://www.op-tee.org/"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
>  
> -PV = "3.8.0+git${SRCPV}"
> -
>  inherit deploy python3native
>  require optee.inc
>  
> @@ -20,7 +18,7 @@ SRC_URI = " \
>      file://0003-arm64-Disable-outline-atomics-when-compiling.patch \
>      file://0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch \
>      file://0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
> -    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> +    file://allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch\
>      file://missing-mkdir.patch \
>  "
>  
> diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> similarity index 93%
> copy from meta-arm/recipes-security/optee/optee-test_git.bb
> copy to meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> index 957286c..96e612a 100644
> --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
> @@ -10,9 +10,7 @@ require optee.inc
>  
>  DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
>  
> -PV = "3.8.0+git${SRCPV}"
> -
> -SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
> +SRCREV = "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
>  SRC_URI = "git://github.com/OP-TEE/optee_test.git \
>             file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
>            "
> @@ -29,6 +27,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
>                   TEEC_EXPORT=${TEEC_EXPORT} \
>                   CROSS_COMPILE_HOST=${TARGET_PREFIX} \
>                   CROSS_COMPILE_TA=${TARGET_PREFIX} \
> +                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
>                   V=1 \
>                   O=${B} \
>                 "
> diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> similarity index 96%
> rename from meta-arm/recipes-security/optee/optee-test_git.bb
> rename to meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> index 957286c..65e6cd1 100644
> --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> @@ -10,8 +10,6 @@ require optee.inc
>  
>  DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
>  
> -PV = "3.8.0+git${SRCPV}"
> -
>  SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
>  SRC_URI = "git://github.com/OP-TEE/optee_test.git \
>             file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
> @@ -29,6 +27,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
>                   TEEC_EXPORT=${TEEC_EXPORT} \
>                   CROSS_COMPILE_HOST=${TARGET_PREFIX} \
>                   CROSS_COMPILE_TA=${TARGET_PREFIX} \
> +                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
>                   V=1 \
>                   O=${B} \
>                 "
> -- 
> 2.7.4
> 

> 
> 
> 

