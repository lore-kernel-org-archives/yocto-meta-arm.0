Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544C4C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 21:08:57 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.2331.1637615336083531100
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 13:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=T8S/SDw2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id p4so19640224qkm.7
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 13:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7wMWlkUjvQlW4PhMwztcdyadCtxVY7cgUY3Q5t8P4SA=;
        b=T8S/SDw231WbNuVFevqfWp6RFaCU4sfC5+3fxo+psN1g11j+1i4FlGjDeXXPiP7/ys
         e8VEIuaAR2KjV48TPIA3g/gpLljgsDz9c3/qHNjV9tLaxDBh9JODYWXtMIeyb27apjEl
         7iY34ItWyMd9aEYI6ajc1UCtQ9MoAPnlhGXa4X+SmqAYZeDruTx2YBPq8x+BqIMxSErw
         JRMxLq4FUg7BqLxNecd4dvGaUfXoKbn8L4KS3WV3S2a8orgDUAUlwAX3QTkbUPllgglK
         1v9ksgMb9ool/yAL3473GtvoOJerpXsNb8SKnCx8ZNbK6nEQa6ybLfwzETZozxuG1pta
         yXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7wMWlkUjvQlW4PhMwztcdyadCtxVY7cgUY3Q5t8P4SA=;
        b=duSiC1Q4RyhPu+JxFmpCUH7IqeYVk0FCmGciLsRCKjulOEKII6TGhSPPTX6vEi8ggL
         /LllZIa5pQYZ90RnH8ZSmvpNHlTAigsD8TCCwgUPzUFZk/WUWRSIlQkfxCSpgPHQFM2I
         wO6uj6NpdXfBKqr5z59Sob4hKTCNggd/4p5dOZkBo1/+BR08CC6DiXiun8b3rPMh6w3f
         +j5WLIbMp8I6FfbsdzVkpd5xVkTHc2z4jE9uLPEhbfdZlZM5UCXbZuU2N+ADZYgRLMn4
         ge95CARlgdXVko4SsHl8wvz8ZAurggQtisoX/lmulxgsJuifFrRQW0Gxcp3sobHCqovF
         1Vlw==
X-Gm-Message-State: AOAM5339A1qvcmv05qiXazGq4wMj7IXoGo9Q9+093Szla62btXydaH2s
	4FnVOy1hmZ2Uw6bdjXNf4FQhWw==
X-Google-Smtp-Source: 
 ABdhPJxcCO1MmQr/mPGBdb6DKXtz+wJqBjsZIsNY6rE+iG4dLFkYlqh5C3wxUn731MdjirFPckEB/g==
X-Received: by 2002:a05:620a:f07:: with SMTP id
 v7mr52452047qkl.143.1637615335041;
        Mon, 22 Nov 2021 13:08:55 -0800 (PST)
Received: from kudzu.us ([2605:a601:a618:1500:bce7:192f:3929:8e38])
        by smtp.gmail.com with ESMTPSA id
 s7sm5099485qta.31.2021.11.22.13.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 13:08:54 -0800 (PST)
Date: Mon, 22 Nov 2021 16:08:53 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Subject: Re: [PATCHv6 2/3] add optee-ftpm
Message-ID: <20211122210851.GA26226@kudzu.us>
References: <20211119093331.4536-1-maxim.uvarov@linaro.org>
 <20211119093331.4536-2-maxim.uvarov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119093331.4536-2-maxim.uvarov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Nov 2021 21:08:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2427

On Fri, Nov 19, 2021 at 12:33:30PM +0300, Maxim Uvarov wrote:
> Add software TPM emulated in the OPTEE-OS.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
> v6:
>         - wolfssl submodule needs to be updated to fix falthrough. Sent PR
>           for that and mention about that in correction patch.
> 	- parallel make is also fixed in the latest master. Removed bb fix and
>           updated git sha.
>         - removed not needed B=$S
> 	- removed redurant dependancies

I had to add back the parallel make workaround, as it failed to build
on a clean (non-sstate) build.  Also, I corrected some
spelling/grammar issues in the commit log (I hope you doin't mind).

Pushed to master.

Thanks,
Jon

> 
>  .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 23 ++++++
>  .../0001-add-enum-to-ta-flags.patch           | 30 ++++++++
>  .../optee-ftpm/optee-ftpm_git.bb              | 74 +++++++++++++++++++
>  .../optee-ftpm/optee-os_%.bbappend            | 14 ++++
>  4 files changed, 141 insertions(+)
>  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
>  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
>  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
>  create mode 100644 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> 
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> new file mode 100644
> index 0000000..1e2a4b6
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0000-fix-ssl-fallthrough.patch
> @@ -0,0 +1,23 @@
> +fix gcc compilation
> +
> +just fix compilation under gcc.
> +Upstream-Status: Submitted [https://github.com/microsoft/MSRSec/pull/35]
> +Compilation issue already fixed in wolfcrypt and submodule
> +needs to be updated. I sent PR for for update with the link
> +above.
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
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
> new file mode 100644
> index 0000000..bbc1107
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm/0001-add-enum-to-ta-flags.patch
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
> index 0000000..ce5059c
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> @@ -0,0 +1,74 @@
> +SUMMARY = "OPTEE fTPM Microsoft TA"
> +DESCRIPTION = "TCG reference implementation of the TPM 2.0 Specification."
> +HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
> +
> +COMPATIBLE_MACHINE ?= "invalid"
> +COMPATIBLE_MACHINE:aarch64 = "(.*)"
> +COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64"
> +
> +#FIXME - doesn't currently work with clang
> +TOOLCHAIN = "gcc"
> +
> +inherit deploy python3native
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
> +SRC_URI = "gitsm://github.com/microsoft/MSRSec;protocol=https;branch=master \
> +           file://0000-fix-ssl-fallthrough.patch \
> +           file://0001-add-enum-to-ta-flags.patch"
> +
> +SRCREV = "81abeb9fa968340438b4b0c08aa6685833f0bfa1"
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
> +    CFG_ARM64_ta_arm64=y \
> +"
> +
> +do_compile() {
> +    sed -i 's/-mcpu=$(TA_CPU)//' TAs/optee_ta/fTPM/sub.mk
> +    # there's also a secure variable storage TA called authvars
> +    cd ${S}/TAs/optee_ta
> +    oe_runmake ftpm
> +}
> +
> +do_install () {
> +    mkdir -p ${D}/lib/optee_armtz
> +    install -D -p -m 0644 ${S}/TAs/optee_ta/out/fTPM/${FTPM_UUID}.ta ${D}/lib/optee_armtz/
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
> index 0000000..0cfa949
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> @@ -0,0 +1,14 @@
> +FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
> +
> +DEPENDS:append = "\
> +                  ${@bb.utils.contains('MACHINE_FEATURES', \
> +                 'optee-ftpm', \
> +                 'optee-ftpm', \
> +                 '' , \
> +                 d)}"
> +
> +EXTRA_OEMAKE:append = "${@bb.utils.contains('MACHINE_FEATURES', \
> +                      'optee-ftpm', \
> +                      'CFG_EARLY_TA=y EARLY_TA_PATHS="${DEPLOY_DIR_IMAGE}/optee/${FTPM_UUID}.stripped.elf"', \
> +                      '', \
> +                      d)} "
> -- 
> 2.17.1
> 
> 

