Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9EEC369C2
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 10:04:36 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.12233.1727258671824516183
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 03:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BVDFlFnf;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53568ffc525so7701635e87.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 03:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727258670; x=1727863470; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgE9b1GOYWEx/nLuh8HIIswyS1tqOnOtR25YN/EKsvQ=;
        b=BVDFlFnf/S4QOCaQsNPKerr7Z4TdymdWxF/CmBRhmDLO/aRZmZtxSENouwPkxAsAAV
         deyIVy3AP4r6BoTch1230ZHRN9ckXyDUd4p0piLa+u2/fptbVFXD37NfjYOcZ23HSo3e
         agcEc2LD8YFVF+BS/iMcKF7x0ZhroHDmFIm2nvadNEIDC68M4YRHWZXP9fv1pVcKfzNt
         SgQFS0+xgNKFGd/PmeclWR+3f6MYCjkZA+TT01f2qTiN93pCFtoAW32AHBinQy9hzNQJ
         rZFf0gC2mixKgoafzt0ofUHAjn5gqeqzkXxIZfGz2pg5gFYHt2CJ3IA73TuQBygzpAGX
         8Y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258670; x=1727863470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgE9b1GOYWEx/nLuh8HIIswyS1tqOnOtR25YN/EKsvQ=;
        b=qiFcr6oj5f/sfDuDvkhf31uF605ic24FKAZXqKgpMypxhDOF2PSlOauh3DpEuCiTsE
         wW3u7ZPjwvMWOIvWCUvE7IAEHSRMU7XcPY/vS/fZx6O4fqVURO0p7QZVTqkzWVteMcvm
         rew72gzRipcuvZ/aHdn9+KP7P39SgpgyZf+Es79UwF8sHnKZOGC/yr7A6FK7IMxLrnr7
         qnsbQ3sKBqe0a6YruT5GKgP5U+ncWg+RJOTJV4mgumkOjbcIl/QDZtM0yFd9NXsioyKT
         xr2Gc3eRPhOd+yjC4vqikIZA1BJOp9BjbNy3KE7HvuDuqH7CiozEmmK9kU1JILmMAJl9
         N0hA==
X-Gm-Message-State: AOJu0YysQwTVXzGQrDvNxZwykFZRlWGj230afzO8VPuPJ9m+V+R1whsR
	GgUXXr3Oh5TdCRK0ivesjyEfJk8ml6uAcf1XYj6lnKYs/KqRBrS5SmEU5HEYfHGp8vfh88tK5NB
	NGWk=
X-Google-Smtp-Source: AGHT+IEYEVYlH3kWTHUj+3y+j3af2U07+PwwIYakQ/RUaY7pEUuNzg0u2zfA3TZpB4xs47f7TNoUJA==
X-Received: by 2002:a05:6512:304c:b0:535:3d15:e709 with SMTP id 2adb3069b0e04-5387048ba52mr1042201e87.12.1727258669571;
        Wed, 25 Sep 2024 03:04:29 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d9d9sm478631e87.253.2024.09.25.03.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:04:27 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>
Subject: [PATCH v2 1/4] arm/optee: update to 4.3.0
Date: Wed, 25 Sep 2024 13:04:11 +0300
Message-ID: <20240925100414.73073-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925100414.73073-1-mikko.rapeli@linaro.org>
References: <20240925100414.73073-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 10:04:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6109

From: Jon Mason <jon.mason@arm.com>

Update OP-TEE to version 4.3.0
NOTE: the license file in optee-test changed, but the license is the
same (commit a748f5fcd9ec8a574dc86a5aa56d05bc6ac174e7).  They chose to
change the URL of the licenses in question to be "LICENSE-GPL" and
"LICENSE-BSD".

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-client_4.2.0.bb => optee-client_4.3.0.bb} |  2 +-
 ...mples_4.2.0.bb => optee-examples_4.3.0.bb} |  0
 ...it_4.2.0.bb => optee-os-tadevkit_4.3.0.bb} |  0
 ...not-use-full-path-to-generate-guard-.patch | 45 -------------------
 .../{optee-os_4.2.0.bb => optee-os_4.3.0.bb}  |  3 +-
 ...stats-remove-unneeded-stat.h-include.patch | 34 --------------
 ...ptee-test_4.2.0.bb => optee-test_4.3.0.bb} |  4 +-
 7 files changed, 4 insertions(+), 84 deletions(-)
 rename meta-arm/recipes-security/optee/{optee-client_4.2.0.bb => optee-client_4.3.0.bb} (71%)
 rename meta-arm/recipes-security/optee/{optee-examples_4.2.0.bb => optee-examples_4.3.0.bb} (100%)
 rename meta-arm/recipes-security/optee/{optee-os-tadevkit_4.2.0.bb => optee-os-tadevkit_4.3.0.bb} (100%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch
 rename meta-arm/recipes-security/optee/{optee-os_4.2.0.bb => optee-os_4.3.0.bb} (77%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-xtest-stats-remove-unneeded-stat.h-include.patch
 rename meta-arm/recipes-security/optee/{optee-test_4.2.0.bb => optee-test_4.3.0.bb} (78%)

diff --git a/meta-arm/recipes-security/optee/optee-client_4.2.0.bb b/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
similarity index 71%
rename from meta-arm/recipes-security/optee/optee-client_4.2.0.bb
rename to meta-arm/recipes-security/optee/optee-client_4.3.0.bb
index 56494e4c..4a088004 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
@@ -1,6 +1,6 @@
 require recipes-security/optee/optee-client.inc
 
-SRCREV = "3eac340a781c00ccd61b151b0e9c22a8c6e9f9f0"
+SRCREV = "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
 
 inherit pkgconfig
 DEPENDS += "util-linux"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.2.0.bb b/meta-arm/recipes-security/optee/optee-examples_4.3.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-examples_4.2.0.bb
rename to meta-arm/recipes-security/optee/optee-examples_4.3.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_4.3.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_4.2.0.bb
rename to meta-arm/recipes-security/optee/optee-os-tadevkit_4.3.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch b/meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch
deleted file mode 100644
index 29719b45..00000000
--- a/meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c8a2a6529dc3ff609281ef4fe5c5bc949c805b5c Mon Sep 17 00:00:00 2001
-From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
-Date: Thu, 6 Jun 2024 11:42:46 +0200
-Subject: [PATCH] checkconf.mk: do not use full path to generate guard symbol
- in conf.h
-
-The combination of building with -g3 (which emits definitions of all
-defined preprocessor macros to the debug info) and using a full path
-to define the name of this preprocessor guard means that the output is
-not binary reproducible across different build hosts. For example, in
-my Yocto build, the string
-
-  __home_ravi_yocto_tmp_glibc_work_stm32mp135fdk_oe_linux_gnueabi_optee_os_stm32mp_3_19_0_stm32mp_r1_1_build_stm32mp135f_dk_include_generated_conf_h_
-
-appears in several build artifacts. Another developer or buildbot
-would not build in some /home/ravi/... directory.
-
-In order to increase binary reproducibility, only use the path sans
-the $(out-dir)/ prefix of the conf.h file.
-
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
----
- mk/checkconf.mk | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Upstream-Status: Backport [c8a2a6529dc3ff609281ef4fe5c5bc949c805b5c]
-
-diff --git a/mk/checkconf.mk b/mk/checkconf.mk
-index 449b1c2b8..bb08d6b15 100644
---- a/mk/checkconf.mk
-+++ b/mk/checkconf.mk
-@@ -17,7 +17,8 @@ define check-conf-h
- 	cnf='$(strip $(foreach var,				\
- 		$(call cfg-vars-by-prefix,$1),			\
- 		$(call cfg-make-define,$(var))))';		\
--	guard="_`echo $@ | tr -- -/.+ _`_";			\
-+	guardpath="$(patsubst $(out-dir)/%,%,$@)"		\
-+	guard="_`echo "$${guardpath}" | tr -- -/.+ _`_";	\
- 	mkdir -p $(dir $@);					\
- 	echo "#ifndef $${guard}" >$@.tmp;			\
- 	echo "#define $${guard}" >>$@.tmp;			\
--- 
-2.34.1
-
diff --git a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb b/meta-arm/recipes-security/optee/optee-os_4.3.0.bb
similarity index 77%
rename from meta-arm/recipes-security/optee/optee-os_4.2.0.bb
rename to meta-arm/recipes-security/optee/optee-os_4.3.0.bb
index 33c19f2f..cfd926b0 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.3.0.bb
@@ -4,10 +4,9 @@ DEPENDS += "dtc-native"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-SRCREV = "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
+SRCREV = "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"
 SRC_URI += " \
     file://0003-optee-enable-clang-support.patch \
-    file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
     file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
     file://0001-compile.mk-use-CFLAGS-from-environment.patch \
     file://0002-link.mk-use-CFLAGS-with-version.o.patch \
diff --git a/meta-arm/recipes-security/optee/optee-test/0001-xtest-stats-remove-unneeded-stat.h-include.patch b/meta-arm/recipes-security/optee/optee-test/0001-xtest-stats-remove-unneeded-stat.h-include.patch
deleted file mode 100644
index 581c6db3..00000000
--- a/meta-arm/recipes-security/optee/optee-test/0001-xtest-stats-remove-unneeded-stat.h-include.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 236ebb968a298fa5d461e734559ad8a13b667eb6 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Wed, 24 Jan 2024 11:35:50 -0500
-Subject: [PATCH] xtest: stats: remove unneeded stat.h include
-
-Hack to work around musl compile error:
-
-| In file included from optee-test/4.1.0/recipe-sysroot/usr/include/sys/stat.h:23,
-|                  from optee-test/4.1.0/git/host/xtest/stats.c:17:
-| optee-test/4.1.0/recipe-sysroot/usr/include/bits/stat.h:17:26: error: expected identifier or '(' before '[' token
-|    17 |         unsigned __unused[2];
-|       |                          ^
-
-stat.h is not needed, since it is not being used in this file.  So
-removing it.
-
-Upstream-Status: Inappropriate [https://github.com/OP-TEE/optee_test/issues/722]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
----
- host/xtest/stats.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/host/xtest/stats.c b/host/xtest/stats.c
-index fb16d55586da..05aa3adac611 100644
---- a/host/xtest/stats.c
-+++ b/host/xtest/stats.c
-@@ -14,7 +14,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <sys/stat.h>
- #include <sys/types.h>
- #include <tee_client_api.h>
- #include <unistd.h>
diff --git a/meta-arm/recipes-security/optee/optee-test_4.2.0.bb b/meta-arm/recipes-security/optee/optee-test_4.3.0.bb
similarity index 78%
rename from meta-arm/recipes-security/optee/optee-test_4.2.0.bb
rename to meta-arm/recipes-security/optee/optee-test_4.3.0.bb
index 6317a72f..44846fef 100644
--- a/meta-arm/recipes-security/optee/optee-test_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_4.3.0.bb
@@ -1,7 +1,7 @@
 require recipes-security/optee/optee-test.inc
 
-SRCREV = "526d5bac1b65f907f67c05cd07beca72fbab88dd"
-SRC_URI += "file://0001-xtest-stats-remove-unneeded-stat.h-include.patch"
+SRCREV = "9d4c4fb9638fb533211037016b6da12fbbcc4bb6"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
 
 # Include ffa_spmc test group if the SPMC test is enabled.
 # Supported after op-tee v3.20
-- 
2.34.1


