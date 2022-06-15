Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E897C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 03:03:32 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.27.1655262209430387682
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 20:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=nh5pQOT/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id i19so7791687qvu.13
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 20:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YGGoLHRdgCyM17y+GsXC2E5u4rU3UAeh9Wc7QZjV498=;
        b=nh5pQOT/z40cCyMo+BmOQ+M0G34AvEUG7W4XKxdywzggRcAd9Ew58yuIOgAWZBwvIl
         IJ3E9pFiqk8Rk2LcS+ncKAOPYTAjXV0Cgp0K/blv2m1SYhXqzX6LmP+ih3V/hqb2bQ8k
         HNZ1bhzKgxJhuGbttMTUdqXOcWoUWbzs0rWl8EMl1k0Kbsa0lrLIsIE9PrgixQnJxX9I
         GkBo2Ad1/7vox2HScAVwUUhv7kNp0cyrtockq0RYFB5ImuU7sCkZQj69tz42BtSVRvUT
         Bzgo/grxdVyekY8VL/psJs8/WDTXIMWBG+4gu71OWR6gk2+5RPosNBLLsiMz6bxhBFhQ
         9+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YGGoLHRdgCyM17y+GsXC2E5u4rU3UAeh9Wc7QZjV498=;
        b=gdURXLPkhOHC1Bl3TM9gOACTrIANH9y27GsZTMoA7GD6iOcioLeVQYhIj35+4FkfQb
         b5dzvecuCSiLvE5C/qm+dshH7PPwaSIWwzpNJQ1Wsb8CQuySBK1dzHoSuXvKYipn5cE/
         zvpqFq/dQNf/tdb3qA0HQu9OUOuW+O6Ta7u6EnL3qb3T7ODefaZtliNBvxfjIvKeYQrG
         STddRwlpPPH60XqkKsApKo66FrCokHriv/+oj00UZKD1SpNSHldzp0IXfgog0aweCx19
         XeDu3GEqMjOUrayWy+Sr0aLRLktusi01NKOzMZtpjGgOxZndsdDQybYFscNfQnIV7D0H
         AfwA==
X-Gm-Message-State: AJIora8CdsyRsW+aeXekv8OwqLWVfEweHffnH2RN8NsVnUTsuPGSNiee
	t40WLCPv6D12O/LUd9YxXr2MZA==
X-Google-Smtp-Source: 
 AGRyM1t7e/vhVo/uq3e6hVMk9xzvETlw0cAfgZnzdu9mRNFeStXBzfGa1dfqqMc0245pVSK9Nc/IGQ==
X-Received: by 2002:a05:6214:1c83:b0:46b:a79a:2f0b with SMTP id
 ib3-20020a0562141c8300b0046ba79a2f0bmr6556706qvb.103.1655262208296;
        Tue, 14 Jun 2022 20:03:28 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 w23-20020ac843d7000000b002f39b99f69csm8240979qtn.54.2022.06.14.20.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 20:03:27 -0700 (PDT)
Date: Tue, 14 Jun 2022 23:03:25 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Subject: Re: [meta-arm][PATCH] arm/trusted-firmware-a: upgrade to v2.7
Message-ID: <YqlL/a6n8bB5pjED@kudzu.us>
References: <20220613132016.1062359-1-andrey.z@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613132016.1062359-1-andrey.z@gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Jun 2022 03:03:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3503

On Mon, Jun 13, 2022 at 01:20:16PM +0000, Andrey Zhizhikin wrote:
> Upstream has version v2.7 released, upgrade recipe to pick up new
> version.
> 
> Drop local patches as they are already applied upstream, namely:
> - build-deps-upgrade-to-mbed-TLS-2.28.0.patch is covered by upstream
> commit a93084be95 ("build(deps): upgrade to mbed TLS 2.28.0")
> 
> - ssl.patch is covered by upstream commit 0a956f8180 ("fix(fiptool):
> respect OPENSSL_DIR")
> 
> Rename bbappends in meta-arm-bsp to match new PV.
> 
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>

Thank you for sending this patch out.  I had one queued up internally
which did the same thing, and had a few extra changes.  I sent this
out for review.  Please take a look and verify it does everything you
need.  It passes our CI.

Welcome, and I look forward to more patches from you.

Thanks,
Jon

> ---
>  ...s_2.6.bbappend => tf-a-tests_2.7.bbappend} |  0
>  ...append => trusted-firmware-a_2.7.bbappend} |  0
>  ...uild-deps-upgrade-to-mbed-TLS-2.28.0.patch | 72 -------------------
>  .../trusted-firmware-a/files/ssl.patch        | 52 --------------
>  .../{tf-a-tests_2.6.bb => tf-a-tests_2.7.bb}  |  4 +-
>  .../trusted-firmware-a/trusted-firmware-a.inc |  4 +-
>  ...are-a_2.6.bb => trusted-firmware-a_2.7.bb} |  4 +-
>  7 files changed, 5 insertions(+), 131 deletions(-)
>  rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.6.bbappend => tf-a-tests_2.7.bbappend} (100%)
>  rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.6.bbappend => trusted-firmware-a_2.7.bbappend} (100%)
>  delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
>  delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
>  rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.6.bb => tf-a-tests_2.7.bb} (94%)
>  rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.6.bb => trusted-firmware-a_2.7.bb} (85%)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bbappend
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
> rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bbappend
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bbappend
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend
> rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bbappend
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
> deleted file mode 100644
> index 058423c..0000000
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> -
> -From a93084be95634b66b917f1c8baf403067dc75c5d Mon Sep 17 00:00:00 2001
> -From: Sandrine Bailleux <sandrine.bailleux@arm.com>
> -Date: Thu, 21 Apr 2022 10:21:29 +0200
> -Subject: [PATCH] build(deps): upgrade to mbed TLS 2.28.0
> -
> -Upgrade to the latest and greatest 2.x release of Mbed TLS library
> -(i.e. v2.28.0) to take advantage of their bug fixes.
> -
> -Note that the Mbed TLS project published version 3.x some time
> -ago. However, as this is a major release with API breakages, upgrading
> -to 3.x might require some more involved changes in TF-A, which we are
> -not ready to do. We shall upgrade to mbed TLS 3.x after the v2.7
> -release of TF-A.
> -
> -Actually, the upgrade this time simply boils down to including the new
> -source code module 'constant_time.c' into the firmware.
> -
> -To quote mbed TLS v2.28.0 release notes [1]:
> -
> -  The mbedcrypto library includes a new source code module
> -  constant_time.c, containing various functions meant to resist timing
> -  side channel attacks. This module does not have a separate
> -  configuration option, and functions from this module will be
> -  included in the build as required.
> -
> -As a matter of fact, if one is attempting to link TF-A against mbed
> -TLS v2.28.0 without the present patch, one gets some linker errors
> -due to missing symbols from this new module.
> -
> -Apart from this, none of the items listed in mbed TLS release
> -notes [1] directly affect TF-A. Special note on the following one:
> -
> -  Fix a bug in mbedtls_gcm_starts() when the bit length of the iv
> -  exceeds 2^32.
> -
> -In TF-A, we do use mbedtls_gcm_starts() when the firmware decryption
> -feature is enabled with AES-GCM as the authenticated decryption
> -algorithm (DECRYPTION_SUPPORT=aes_gcm). However, the iv_len variable
> -which gets passed to mbedtls_gcm_starts() is an unsigned int, i.e. a
> -32-bit value which by definition is always less than 2**32. Therefore,
> -we are immune to this bug.
> -
> -With this upgrade, the size of BL1 and BL2 binaries does not appear to
> -change on a standard sample test build (with trusted boot and measured
> -boot enabled).
> -
> -[1] https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.0
> -
> -Change-Id: Icd5dbf527395e9e22c8fd6b77427188bd7237fd6
> -Signed-off-by: Sandrine Bailleux <sandrine.bailleux@arm.com>
> ----
> - drivers/auth/mbedtls/mbedtls_common.mk | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/drivers/auth/mbedtls/mbedtls_common.mk b/drivers/auth/mbedtls/mbedtls_common.mk
> -index 0a4775d00..3eb41617f 100644
> ---- a/drivers/auth/mbedtls/mbedtls_common.mk
> -+++ b/drivers/auth/mbedtls/mbedtls_common.mk
> -@@ -48,6 +48,7 @@ LIBMBEDTLS_SRCS		:= $(addprefix ${MBEDTLS_DIR}/library/,	\
> - 					rsa_internal.c				\
> - 					x509.c 					\
> - 					x509_crt.c 				\
> -+					constant_time.c 			\
> - 					)
> - 
> - # The platform may define the variable 'TF_MBEDTLS_KEY_ALG' to select the key
> --- 
> -2.25.1
> -
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
> deleted file mode 100644
> index cdabd1b..0000000
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -fiptool: respect OPENSSL_DIR
> -
> -fiptool links to libcrypto, so as with the other tools it should respect
> -OPENSSL_DIR for include/library paths.
> -
> -Upstream-Status: Submitted
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -diff --git a/Makefile b/Makefile
> -index ec6f88585..2d3b9fc26 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -1388,7 +1388,7 @@ fwu_fip: ${BUILD_PLAT}/${FWU_FIP_NAME}
> - 
> - ${FIPTOOL}: FORCE
> - ifdef UNIX_MK
> --	${Q}${MAKE} CPPFLAGS="-DVERSION='\"${VERSION_STRING}\"'" FIPTOOL=${FIPTOOL} --no-print-directory -C ${FIPTOOLPATH}
> -+	${Q}${MAKE} CPPFLAGS="-DVERSION='\"${VERSION_STRING}\"'" FIPTOOL=${FIPTOOL} OPENSSL_DIR=${OPENSSL_DIR} --no-print-directory -C ${FIPTOOLPATH}
> - else
> - # Clear the MAKEFLAGS as we do not want
> - # to pass the gnumake flags to nmake.
> -diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
> -index 11d2e7b0b..7c2a08379 100644
> ---- a/tools/fiptool/Makefile
> -+++ b/tools/fiptool/Makefile
> -@@ -12,6 +12,8 @@ FIPTOOL ?= fiptool${BIN_EXT}
> - PROJECT := $(notdir ${FIPTOOL})
> - OBJECTS := fiptool.o tbbr_config.o
> - V ?= 0
> -+OPENSSL_DIR := /usr
> -+
> - 
> - override CPPFLAGS += -D_GNU_SOURCE -D_XOPEN_SOURCE=700
> - HOSTCCFLAGS := -Wall -Werror -pedantic -std=c99
> -@@ -20,7 +22,7 @@ ifeq (${DEBUG},1)
> - else
> -   HOSTCCFLAGS += -O2
> - endif
> --LDLIBS := -lcrypto
> -+LDLIBS := -L${OPENSSL_DIR}/lib -lcrypto
> - 
> - ifeq (${V},0)
> -   Q := @
> -@@ -28,7 +30,7 @@ else
> -   Q :=
> - endif
> - 
> --INCLUDE_PATHS := -I../../include/tools_share
> -+INCLUDE_PATHS := -I../../include/tools_share  -I${OPENSSL_DIR}/include
> - 
> - HOSTCC ?= gcc
> - 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
> similarity index 94%
> rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb
> rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
> index 2da6116..e4d3880 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
> @@ -8,8 +8,8 @@ inherit deploy
>  COMPATIBLE_MACHINE ?= "invalid"
>  
>  SRC_URI = "git://git.trustedfirmware.org/TF-A/tf-a-tests.git;protocol=https;branch=master"
> -# post v2.6 snapshot
> -SRCREV ?= "af5a517ae9f295455122109100fe5d55668e8eaf"
> +# v2.7 snapshot
> +SRCREV ?= "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
>  PV .= "+git${SRCPV}"
>  
>  DEPENDS += "optee-os"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 510a7d4..dfb5675 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -5,9 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  inherit deploy
>  
> -SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master \
> -           file://ssl.patch \
> -	    file://build-deps-upgrade-to-mbed-TLS-2.28.0.patch"
> +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
>  
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
> similarity index 85%
> rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
> rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
> index 89a9214..537ec32 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
> @@ -1,7 +1,7 @@
>  require trusted-firmware-a.inc
>  
> -# TF-A v2.6
> -SRCREV_tfa = "a1f02f4f3daae7e21ee58b4c93ec3e46b8f28d15"
> +# TF-A v2.7
> +SRCREV_tfa = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
>  
>  LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
>  
> -- 
> 2.25.1
> 
> 

