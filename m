Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1691EC369AD
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 09:02:36 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.10935.1727254950482159133
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 02:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HFlAUKG9;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f761cfa5e6so70729201fa.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727254949; x=1727859749; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgE9b1GOYWEx/nLuh8HIIswyS1tqOnOtR25YN/EKsvQ=;
        b=HFlAUKG9D59niEoTsn2GM9U+AtWIRH6XLIlig+IuMC+0Eso8gDOuJN/deCMZruSRCm
         i+V8jjzY7ZehZlPrYYWep/DGEegpf52upVgUlBOGrZOAXYGDJ3NKsXhSyYH3V0lKj0Ld
         3slPOTdKHNS8bxkU8X4NQoBo49qwIEMYmBwcKfU/df+OnYbI4NMeyZ9Enf0pa0aiETaT
         +MFzKKSxbxFQ0UASBnE4BqyKd0hX22VSiN+llOYiA4MdtawlvrUusG7HaTWIgS5+CE9D
         U3RhL5W7T2OHMmx9j0IGG61dB+Sx1kfInDfsjnfLNpqhSqK+A/rJSQ4Ozn+6Lu7AxEx3
         zYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727254949; x=1727859749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgE9b1GOYWEx/nLuh8HIIswyS1tqOnOtR25YN/EKsvQ=;
        b=Logh8QnTonTDLAldOAG0jSRgI2/uV8ztRmLPhSWQr4gqEHv6H4nl9r8jrA+cJmhliK
         iElIGEV7epj6PS8H10KfS6pVVV2Db1G4+MC2CRhFzLmCzCFbLjpAWQhtrBe7SraGT2c5
         Rg1IWm/AVEmsm8oOxQ4s666H/ca2q80TwkwZbQtqL86a08yJJ6YSSV5t+wyguwQDGk1v
         OT+dO0181PhSNVGU89EG6fb5002U4icXwX8vJDNxeLQ52WAgHp1SBYLz7lypz5Hq5BvA
         oOIXtqvcV+FvAqoXQ6m95u156OaWMmhb87XvyGPl5ZGg+ZomiYdeBuWJnupmtWFyjtDy
         Dx5Q==
X-Gm-Message-State: AOJu0YyrrDhTwLCOzb7SlLdYlLYpB9irAUdPfLq6W1sYa1B0N2WZ9Hn4
	TkKXYk9YaLNY3Co9G93ixdPUibyPX5+q1bX6VYkp4ZtUp521rDEIjNJc03sZH82zcChX6SCQj1S
	KhWI=
X-Google-Smtp-Source: AGHT+IH65aOBy+pWSQgmmygYQdZf2FSqKQq1IwbDajinSWcCC5qZMlZe2maqSiJUuI+lInz5WnYXEg==
X-Received: by 2002:a2e:a594:0:b0:2f6:6198:1d01 with SMTP id 38308e7fff4ca-2f91ca5929cmr14563511fa.37.1727254948417;
        Wed, 25 Sep 2024 02:02:28 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289ef7fsm4686501fa.119.2024.09.25.02.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:02:25 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>
Subject: [PATCH 1/4] arm/optee: update to 4.3.0
Date: Wed, 25 Sep 2024 12:01:44 +0300
Message-ID: <20240925090147.66618-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925090147.66618-1-mikko.rapeli@linaro.org>
References: <20240925090147.66618-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 09:02:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6103

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


