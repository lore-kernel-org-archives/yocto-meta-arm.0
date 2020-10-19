Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.13026.1603113914623917809
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 06:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=2L0BikJB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.196, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f196.google.com with SMTP id n5so3811749ile.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2De/UnFMX9auydAdfLR+g43NEMWxdIl/4wJzdLB9f7M=;
        b=2L0BikJBm5aYXhBhHhTA6Wt2kC1iC9g93ENHviF+/EecD4yBHi+Z5YarR4sXy6o6UM
         uv57PbY4V5UX9rjzing3uYQR81wJSfBICxJgAkuPcjEE39yHh40P1D9217UTPbsV1J7m
         VNIeXi9yf6S/UZsrIMb2pjFIgxcP/VWe6QJvaCcvuJoOgHTpy75KhWlFYp3HXcXV6Nk0
         wWmM4MG8luFGV7BBwnOXNzxc1JtbO++APArpl4hUjLB/k0gdN0KUxaaXCwW8nQI7caki
         MKuTEJbs06lpEBaNkiRLlir8CFcR0IaGCaip+FlLhlQzMUPTRu1j8dMNOAdw/D/fMeF9
         8sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2De/UnFMX9auydAdfLR+g43NEMWxdIl/4wJzdLB9f7M=;
        b=prNrr4kqFYLa6xRjoD4Bv+4r4SblHpCE08iPJ0KH1xchdJnkP1p06r+CrbcTakXYfk
         0eL54DPIn/vNrg35c9Z6lEx8TUWbZdiiygMZDaw45GDWz1/dUHP1QsSzdSuDb5xeczNv
         0jMGpB4mnvKRW18+h4KGMlCfAPX7gLnqfJnwuS7YgIXigUFJ9OS6xqnsXWKVRFJjK5iV
         ov/+e8C+9MvBfQJabQBIvvqsfq5aY86GTNM2hppWWd8ERbvwbWB2fof51o/9WIIDSduo
         pPJ7rSAiMoB3O35LNCNXX2scV511ZIs8cTiKD2R07/oeDzbOkagd7PIjJ9MlvJT/uo56
         v2xw==
X-Gm-Message-State: AOAM532zLeq9UL41tzp10xdwGREXTPE3WRURNILKqBvWaUPzcZArKe3s
	CAHsE6F0Po7oVGXkbgNpmQysjw==
X-Google-Smtp-Source: ABdhPJxLcd+Tg/SL9f0ptMLB2p7WJUIEXjXrboZbX7Qv2FmhzdB9xgyZ5m2NRJkkUXD9cCjn+weuhQ==
X-Received: by 2002:a92:502:: with SMTP id q2mr7074145ile.202.1603113913904;
        Mon, 19 Oct 2020 06:25:13 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id d7sm9948935ilr.31.2020.10.19.06.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 06:25:13 -0700 (PDT)
Date: Mon, 19 Oct 2020 09:25:10 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Brett Warren <brett.warren@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v3 2/6] optee: upgraded recipes to 3.10
Message-ID: <20201019132510.GA26865@kudzu.us>
References: <20201019092712.13467-1-brett.warren@arm.com>
 <20201019092712.13467-2-brett.warren@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201019092712.13467-2-brett.warren@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 19, 2020 at 10:27:08AM +0100, Brett Warren wrote:
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
> Change-Id: Iacaba02d64570a790d5cc20eca8be58246e39019
> Signed-off-by: Brett Warren <brett.warren@arm.com>
> ---

Still seeing fuzz on patch 0006-allow-setting-sysroot-for-libgcc-lookup.patch

>  .../{optee-client_git.bb => optee-client_3.10.0.bb}    |  4 +---
>  .../{optee-client_git.bb => optee-client_3.8.0.bb}     |  2 --
>  ...{optee-examples_git.bb => optee-examples_3.10.0.bb} |  5 ++---
>  .../{optee-examples_git.bb => optee-examples_3.8.0.bb} |  3 +--
>  .../optee/{optee-os_git.bb => optee-os_3.10.0.bb}      | 10 +---------
>  .../optee/{optee-os_git.bb => optee-os_3.8.0.bb}       |  2 --
>  .../optee/{optee-test_git.bb => optee-test_3.10.0.bb}  |  5 ++---
>  .../optee/{optee-test_git.bb => optee-test_3.8.0.bb}   |  3 +--
>  8 files changed, 8 insertions(+), 26 deletions(-)
>  copy meta-arm/recipes-security/optee/{optee-client_git.bb => optee-client_3.10.0.bb} (95%)
>  rename meta-arm/recipes-security/optee/{optee-client_git.bb => optee-client_3.8.0.bb} (98%)
>  copy meta-arm/recipes-security/optee/{optee-examples_git.bb => optee-examples_3.10.0.bb} (92%)
>  rename meta-arm/recipes-security/optee/{optee-examples_git.bb => optee-examples_3.8.0.bb} (95%)
>  copy meta-arm/recipes-security/optee/{optee-os_git.bb => optee-os_3.10.0.bb} (81%)
>  rename meta-arm/recipes-security/optee/{optee-os_git.bb => optee-os_3.8.0.bb} (98%)
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
> similarity index 98%
> rename from meta-arm/recipes-security/optee/optee-os_git.bb
> rename to meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> index deeb515..0001271 100644
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
> 2.17.1
> 

> 
> 
> 

