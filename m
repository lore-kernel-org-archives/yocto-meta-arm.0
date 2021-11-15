Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44290C433FE
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 17:06:53 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.68.1636996012303878361
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 09:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=E+vqueCB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id t34so16232712qtc.7
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 09:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xG+1Mk+C77ca+r6Cb3bAxi2jDChErz2HKiWxCbMUBEI=;
        b=E+vqueCBxiR1Y1WudJl8eZ10RXFAkeMCojxEadVJ9NspQ732WOCqiaIGbOIiQ4a/of
         tHk/gkL/ITcLR/qJwqr18QW449g4j98Bq/b1vkhzybW/haDjcKa0mJ8pmltonZM2NI2G
         P+sRxRK9Uqs1pqOKxGuf+nmRxKM0KNuV1tFi/i39seXLBmtB5pOYJa25Ioy4dxoI1Swf
         al0XcTWoRpnnpsbuWiz8pu9E0NJBrZf1UnXlWDPhtvKWtCWdavPWTVgTq5UvLAe8aIkp
         tG/cEC9L/C33IXQB1v6Op9QZtdsoW5QNWCGUDqd49GlNG4xsJu6D0Xj/lcIoNwc5K+8o
         t4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xG+1Mk+C77ca+r6Cb3bAxi2jDChErz2HKiWxCbMUBEI=;
        b=d1angHJDK7tt2eJB+hf9+M8GlOESP8AOuUg42CMpLdQHh/kaYFL+nFRVuW42M5vMRx
         RO/rmhOld7Ny7kAqvkffnG8VRNUQkY67WfB6sZKHOZwGKF2BFgKeW2zKQ8PzyxJe3gW+
         KkWq1fwVtx5O01Lk2fipAZH0DDj1wwSuIW7DlnP6zMQ4vg7oDsD/vPEttBVpmfgm55OK
         yx/zhUVDg3NIc6mNAtmNBRyNxl/F6ULyQ8wKwqxHZMzzj4O5CROp92vURUorx8cqy4rn
         58t1pyHS77d5lh7x/FRLvaYV90w6d4U1XZHo55sPIwVsRpVzilAqkEMhpmM+24yYYvFP
         cKGQ==
X-Gm-Message-State: AOAM533xacom3jtWD3UrFps2aqwBmu8EJyfVjwRnl0CKqscutY9n/UbD
	0SH0kvi7MqjZDCg0TwDaZ/tVyQ==
X-Google-Smtp-Source: 
 ABdhPJyPxOaORrmcjOurvB+2BFWHvTdz8aRMeJLQ4xylXh0lbA4w387+L59UjFyO/KamrYwBtImZvA==
X-Received: by 2002:ac8:7e83:: with SMTP id w3mr571489qtj.160.1636996011330;
        Mon, 15 Nov 2021 09:06:51 -0800 (PST)
Received: from kudzu.us ([2605:a601:a618:1500:6191:7e45:fd06:9a39])
        by smtp.gmail.com with ESMTPSA id
 r3sm5927838qkm.85.2021.11.15.09.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 09:06:50 -0800 (PST)
Date: Mon, 15 Nov 2021 12:06:49 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Subject: Re: [meta-arm] [PATCHv3 2/5] add optee-ftpm
Message-ID: <20211115170648.GC31079@kudzu.us>
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
 <20211115140100.24634-2-maxim.uvarov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115140100.24634-2-maxim.uvarov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 17:06:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2399

On Mon, Nov 15, 2021 at 05:00:57PM +0300, Maxim Uvarov wrote:
> Add software TPM emulated in the OPTEE-OS.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  .../optee-ftpm/0000-fix-ssl-fallthrough.patch | 20 ++++++
>  .../0002-add-enum-to-ta-flags.patch           | 30 ++++++++
>  .../optee-ftpm/optee-ftpm_git.bb              | 71 +++++++++++++++++++
>  .../optee-ftpm/optee-os_%.bbappend            | 14 ++++
>  4 files changed, 135 insertions(+)
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
> index 0000000..6c72c7f
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> @@ -0,0 +1,71 @@
> +SUMMARY = "OPTEE fTPM Microsoft TA"
> +DESCRIPTION = "TCG reference implementation of the TPM 2.0 Specification."
> +HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
> +
> +inherit autotools-brokensep deploy pkgconfig gettext python3native
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=27e94c0280987ab296b0b8dd02ab9fe5"
> +
> +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
> +DEPENDS += " optee-os-tadevkit"

Is there a reason why this isn't on the previous line?

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

While this does work, it would be better to follow how other recipes
in meta-arm are doing it and make it a single SRC_URI entry.

Also, it's super odd to me that the patches are 0000 and 0002, not
0001 and 0002 (but this is being super pedantic).

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

shouldn't this have a ${S} in the file path?

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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2387): https://lists.yoctoproject.org/g/meta-arm/message/2387
> Mute This Topic: https://lists.yoctoproject.org/mt/87069391/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


