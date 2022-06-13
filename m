Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9F8C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 13:20:47 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.5796.1655126443232498921
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 06:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XiTvveiU;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: andrey.z@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id z7so7074953edm.13
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Td6uxsCROfv6dmHXtOHtv/QGjrUebku3u/qOwpM3JGI=;
        b=XiTvveiUq7ltPy0nWvOziPSoIbGeayXgVbekIrbGmFF7Qg8ittbHKea2kIQxHEjxd9
         u42enIbiNOQOCweeHRDcWjtc1RKtN1d+DUerjgnZTPYGtj8Kk0f77Scpeg3CNn4PqcFg
         rq39etixYdv6qrB0JR8T2RSoLCyqqsHwAReyJLPVkMQRBqenjuHITCQQ6XET1+em/Te0
         9S1KF9DhbwDpKh7jzEX0602Qu5/SSoeIzEZadiawR7uc+KD8ZNjhASDfPp3dE9aGSdHp
         4US/LYCrnlADAFZ5uyal5sLPtxxlksgUVgPojFALbD0VuOXllGwE1+nwf/G60mmLMIDS
         qMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Td6uxsCROfv6dmHXtOHtv/QGjrUebku3u/qOwpM3JGI=;
        b=ThItedF1PGm75eBI0yPrb90GfEYNgTl06yngjMwkFq8/qeaiJl/DZ4/sDAR+1oPrPY
         ypaDYUB7ONC4Ni71QcxM8nbSca4OZB87CAbu0q32wsx45LwAeS4taODQq7XbU/Hl6Uxk
         /jjTqATuWgS+ns1itWv7R52Xm9Of5bejZmJDGE7W4rFNuTkAf6gdw+Hf4Se3uO4Cysal
         pxXxIQdZesOhqpvzRe4VySLgLbux6itTx85JkEWsucgrp3DSg3WDO6kwzgBHDbZjL6Bh
         Si7zjc02Q8WT07zmSsFyLYE1M61F4iYKN4Pqu/bp/KLi1e9ayKRtryXl0LF20qSQeikS
         nu0Q==
X-Gm-Message-State: AOAM533ix8RM2Xbj3yv4nkryhFRwcOUO5JkFynZ05APsI1MfOuSGT5pN
	6Gv3/qo5AZXlDn9tO2YHJKmllz6RQko=
X-Google-Smtp-Source: 
 ABdhPJwzReT4LFn4Rcdm7WYhyCYKlgDbuB1/Od3gVgurIR1Pake97eDdI3nG8bA+sg+Ei6rPY++MDA==
X-Received: by 2002:a50:ec89:0:b0:42d:cc7f:abbe with SMTP id
 e9-20020a50ec89000000b0042dcc7fabbemr64641713edr.381.1655126441591;
        Mon, 13 Jun 2022 06:20:41 -0700 (PDT)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id
 v7-20020a1709062f0700b006fea2705d18sm3805338eji.210.2022.06.13.06.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 06:20:40 -0700 (PDT)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [meta-arm][PATCH] arm/trusted-firmware-a: upgrade to v2.7
Date: Mon, 13 Jun 2022 13:20:16 +0000
Message-Id: <20220613132016.1062359-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Jun 2022 13:20:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3490

Upstream has version v2.7 released, upgrade recipe to pick up new
version.

Drop local patches as they are already applied upstream, namely:
- build-deps-upgrade-to-mbed-TLS-2.28.0.patch is covered by upstream
commit a93084be95 ("build(deps): upgrade to mbed TLS 2.28.0")

- ssl.patch is covered by upstream commit 0a956f8180 ("fix(fiptool):
respect OPENSSL_DIR")

Rename bbappends in meta-arm-bsp to match new PV.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 ...s_2.6.bbappend => tf-a-tests_2.7.bbappend} |  0
 ...append => trusted-firmware-a_2.7.bbappend} |  0
 ...uild-deps-upgrade-to-mbed-TLS-2.28.0.patch | 72 -------------------
 .../trusted-firmware-a/files/ssl.patch        | 52 --------------
 .../{tf-a-tests_2.6.bb => tf-a-tests_2.7.bb}  |  4 +-
 .../trusted-firmware-a/trusted-firmware-a.inc |  4 +-
 ...are-a_2.6.bb => trusted-firmware-a_2.7.bb} |  4 +-
 7 files changed, 5 insertions(+), 131 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.6.bbappend => tf-a-tests_2.7.bbappend} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.6.bbappend => trusted-firmware-a_2.7.bbappend} (100%)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
 rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.6.bb => tf-a-tests_2.7.bb} (94%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.6.bb => trusted-firmware-a_2.7.bb} (85%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bbappend
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bbappend
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
deleted file mode 100644
index 058423c..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/build-deps-upgrade-to-mbed-TLS-2.28.0.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-
-From a93084be95634b66b917f1c8baf403067dc75c5d Mon Sep 17 00:00:00 2001
-From: Sandrine Bailleux <sandrine.bailleux@arm.com>
-Date: Thu, 21 Apr 2022 10:21:29 +0200
-Subject: [PATCH] build(deps): upgrade to mbed TLS 2.28.0
-
-Upgrade to the latest and greatest 2.x release of Mbed TLS library
-(i.e. v2.28.0) to take advantage of their bug fixes.
-
-Note that the Mbed TLS project published version 3.x some time
-ago. However, as this is a major release with API breakages, upgrading
-to 3.x might require some more involved changes in TF-A, which we are
-not ready to do. We shall upgrade to mbed TLS 3.x after the v2.7
-release of TF-A.
-
-Actually, the upgrade this time simply boils down to including the new
-source code module 'constant_time.c' into the firmware.
-
-To quote mbed TLS v2.28.0 release notes [1]:
-
-  The mbedcrypto library includes a new source code module
-  constant_time.c, containing various functions meant to resist timing
-  side channel attacks. This module does not have a separate
-  configuration option, and functions from this module will be
-  included in the build as required.
-
-As a matter of fact, if one is attempting to link TF-A against mbed
-TLS v2.28.0 without the present patch, one gets some linker errors
-due to missing symbols from this new module.
-
-Apart from this, none of the items listed in mbed TLS release
-notes [1] directly affect TF-A. Special note on the following one:
-
-  Fix a bug in mbedtls_gcm_starts() when the bit length of the iv
-  exceeds 2^32.
-
-In TF-A, we do use mbedtls_gcm_starts() when the firmware decryption
-feature is enabled with AES-GCM as the authenticated decryption
-algorithm (DECRYPTION_SUPPORT=aes_gcm). However, the iv_len variable
-which gets passed to mbedtls_gcm_starts() is an unsigned int, i.e. a
-32-bit value which by definition is always less than 2**32. Therefore,
-we are immune to this bug.
-
-With this upgrade, the size of BL1 and BL2 binaries does not appear to
-change on a standard sample test build (with trusted boot and measured
-boot enabled).
-
-[1] https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.0
-
-Change-Id: Icd5dbf527395e9e22c8fd6b77427188bd7237fd6
-Signed-off-by: Sandrine Bailleux <sandrine.bailleux@arm.com>
----
- drivers/auth/mbedtls/mbedtls_common.mk | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drivers/auth/mbedtls/mbedtls_common.mk b/drivers/auth/mbedtls/mbedtls_common.mk
-index 0a4775d00..3eb41617f 100644
---- a/drivers/auth/mbedtls/mbedtls_common.mk
-+++ b/drivers/auth/mbedtls/mbedtls_common.mk
-@@ -48,6 +48,7 @@ LIBMBEDTLS_SRCS		:= $(addprefix ${MBEDTLS_DIR}/library/,	\
- 					rsa_internal.c				\
- 					x509.c 					\
- 					x509_crt.c 				\
-+					constant_time.c 			\
- 					)
- 
- # The platform may define the variable 'TF_MBEDTLS_KEY_ALG' to select the key
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
deleted file mode 100644
index cdabd1b..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-fiptool: respect OPENSSL_DIR
-
-fiptool links to libcrypto, so as with the other tools it should respect
-OPENSSL_DIR for include/library paths.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/Makefile b/Makefile
-index ec6f88585..2d3b9fc26 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1388,7 +1388,7 @@ fwu_fip: ${BUILD_PLAT}/${FWU_FIP_NAME}
- 
- ${FIPTOOL}: FORCE
- ifdef UNIX_MK
--	${Q}${MAKE} CPPFLAGS="-DVERSION='\"${VERSION_STRING}\"'" FIPTOOL=${FIPTOOL} --no-print-directory -C ${FIPTOOLPATH}
-+	${Q}${MAKE} CPPFLAGS="-DVERSION='\"${VERSION_STRING}\"'" FIPTOOL=${FIPTOOL} OPENSSL_DIR=${OPENSSL_DIR} --no-print-directory -C ${FIPTOOLPATH}
- else
- # Clear the MAKEFLAGS as we do not want
- # to pass the gnumake flags to nmake.
-diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
-index 11d2e7b0b..7c2a08379 100644
---- a/tools/fiptool/Makefile
-+++ b/tools/fiptool/Makefile
-@@ -12,6 +12,8 @@ FIPTOOL ?= fiptool${BIN_EXT}
- PROJECT := $(notdir ${FIPTOOL})
- OBJECTS := fiptool.o tbbr_config.o
- V ?= 0
-+OPENSSL_DIR := /usr
-+
- 
- override CPPFLAGS += -D_GNU_SOURCE -D_XOPEN_SOURCE=700
- HOSTCCFLAGS := -Wall -Werror -pedantic -std=c99
-@@ -20,7 +22,7 @@ ifeq (${DEBUG},1)
- else
-   HOSTCCFLAGS += -O2
- endif
--LDLIBS := -lcrypto
-+LDLIBS := -L${OPENSSL_DIR}/lib -lcrypto
- 
- ifeq (${V},0)
-   Q := @
-@@ -28,7 +30,7 @@ else
-   Q :=
- endif
- 
--INCLUDE_PATHS := -I../../include/tools_share
-+INCLUDE_PATHS := -I../../include/tools_share  -I${OPENSSL_DIR}/include
- 
- HOSTCC ?= gcc
- 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
similarity index 94%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
index 2da6116..e4d3880 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
@@ -8,8 +8,8 @@ inherit deploy
 COMPATIBLE_MACHINE ?= "invalid"
 
 SRC_URI = "git://git.trustedfirmware.org/TF-A/tf-a-tests.git;protocol=https;branch=master"
-# post v2.6 snapshot
-SRCREV ?= "af5a517ae9f295455122109100fe5d55668e8eaf"
+# v2.7 snapshot
+SRCREV ?= "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
 PV .= "+git${SRCPV}"
 
 DEPENDS += "optee-os"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 510a7d4..dfb5675 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -5,9 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit deploy
 
-SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master \
-           file://ssl.patch \
-	    file://build-deps-upgrade-to-mbed-TLS-2.28.0.patch"
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
similarity index 85%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
index 89a9214..537ec32 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
@@ -1,7 +1,7 @@
 require trusted-firmware-a.inc
 
-# TF-A v2.6
-SRCREV_tfa = "a1f02f4f3daae7e21ee58b4c93ec3e46b8f28d15"
+# TF-A v2.7
+SRCREV_tfa = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
 
 LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
 
-- 
2.25.1


