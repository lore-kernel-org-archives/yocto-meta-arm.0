Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFB2C52CDC
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 10:25:29 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.14643.1722335123397162505
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jul 2024 03:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wowhFMGC;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efa9500e0so5353297e87.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722335121; x=1722939921; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSOE2MsV/c0fwuFEGs9OB1elEGnFWRjfRaXYzMiqzq4=;
        b=wowhFMGCpjM+t/rg1QixYrHTdngFXUWXG/NADgA07M1HXFjhtwzGCOvk49SOI8kQOI
         bu5DzLufHinvjCxh559x5IIxXWlPeZv00hMW/gVJ837Kq87O/rItL9dWaVHMQ/nCQcD1
         SaycvYUP1nf4uDp1vMd447UTPweilhMzuijLZEwNNgpF18ozHPNpC8+b9U4lwomiDDjl
         EZSUKZDcjkNYETeQGvJaOuHvZjzC7AxUjqcBItYmJIAcLVw0YRsSH/kD4jaAk6EXUmBH
         dyrFabtsyEKsrObWRVFcrw+0U+aTEq/T3T351i8XkjTRMOA0nQLPuXTl/TtQQLuMhlCq
         BCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335121; x=1722939921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSOE2MsV/c0fwuFEGs9OB1elEGnFWRjfRaXYzMiqzq4=;
        b=tWn+kfBTi91qs+b8QTKclt2qWg3QYaE6sB/QOp1pGeK/nTnnPhMO79uYSIcYEA9iP6
         NZCxvVUDTXuv9yREVFZKtIdVzRHnbyv2yEyPU0RamH9ZFIvlqRsYB8inFYITjroOg1fb
         9zO4OADr95fGGedSdiB2KvcQu3wov/FAVH7Hb9sErtTBYLI+vxHFzT7vPRPWBrWvqMHZ
         KpHNqOWjRyqfGm+QWMC9QcfQP13SBAv/Z7TBFaIJz619YJfQ3Bu7yPV3z4b1Gt3LAWHn
         aKyG5Dp/1OZAbfvsyXLuuSh3SQTSN/HmhIJapGxHoBFEYFIUCpEgSmPbfrBsRdZbMO3b
         29Qg==
X-Gm-Message-State: AOJu0Yz7FJsoMra1izpy858vJt8FNg0C4A0g84/lhfB4uIJzJIWlLYqX
	3EHhr8NcvDtJG+bM1fqCK7xEZuFptciT0epFlc2wWgZJu1aePElmDZVyK2HdrZNbxW1yqp6JNdB
	P
X-Google-Smtp-Source: AGHT+IEIlCsoNKrx/dJWdhRnPKXUNxDNrIc3DQPXP13D8Dls7/JDknPQ6mS6zaoM7anYvNWfUQpuYw==
X-Received: by 2002:a05:6512:3e15:b0:52c:e28f:4da6 with SMTP id 2adb3069b0e04-5309b2c54fbmr8213269e87.51.1722335121487;
        Tue, 30 Jul 2024 03:25:21 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bc4a46sm1861969e87.17.2024.07.30.03.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:25:20 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 2/4] optee-os: remove absolute paths
Date: Tue, 30 Jul 2024 13:24:57 +0300
Message-ID: <20240730102459.148826-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730102459.148826-1-mikko.rapeli@linaro.org>
References: <20240730102459.148826-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Jul 2024 10:25:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5929

Change optee-os build scripts to not use absolute
build time paths in generated header files and scripts.

Two patches are backports from master/4.3.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...not-use-full-path-to-generate-guard-.patch | 45 ++++++++++++++++
 ....mk-remove-absolute-build-time-paths.patch | 53 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.2.0.bb  |  4 +-
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-remove-absolute-build-time-paths.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch b/meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch
new file mode 100644
index 00000000..29719b45
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch
@@ -0,0 +1,45 @@
+From c8a2a6529dc3ff609281ef4fe5c5bc949c805b5c Mon Sep 17 00:00:00 2001
+From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
+Date: Thu, 6 Jun 2024 11:42:46 +0200
+Subject: [PATCH] checkconf.mk: do not use full path to generate guard symbol
+ in conf.h
+
+The combination of building with -g3 (which emits definitions of all
+defined preprocessor macros to the debug info) and using a full path
+to define the name of this preprocessor guard means that the output is
+not binary reproducible across different build hosts. For example, in
+my Yocto build, the string
+
+  __home_ravi_yocto_tmp_glibc_work_stm32mp135fdk_oe_linux_gnueabi_optee_os_stm32mp_3_19_0_stm32mp_r1_1_build_stm32mp135f_dk_include_generated_conf_h_
+
+appears in several build artifacts. Another developer or buildbot
+would not build in some /home/ravi/... directory.
+
+In order to increase binary reproducibility, only use the path sans
+the $(out-dir)/ prefix of the conf.h file.
+
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
+---
+ mk/checkconf.mk | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Upstream-Status: Backport [c8a2a6529dc3ff609281ef4fe5c5bc949c805b5c]
+
+diff --git a/mk/checkconf.mk b/mk/checkconf.mk
+index 449b1c2b8..bb08d6b15 100644
+--- a/mk/checkconf.mk
++++ b/mk/checkconf.mk
+@@ -17,7 +17,8 @@ define check-conf-h
+ 	cnf='$(strip $(foreach var,				\
+ 		$(call cfg-vars-by-prefix,$1),			\
+ 		$(call cfg-make-define,$(var))))';		\
+-	guard="_`echo $@ | tr -- -/.+ _`_";			\
++	guardpath="$(patsubst $(out-dir)/%,%,$@)"		\
++	guard="_`echo "$${guardpath}" | tr -- -/.+ _`_";	\
+ 	mkdir -p $(dir $@);					\
+ 	echo "#ifndef $${guard}" >$@.tmp;			\
+ 	echo "#define $${guard}" >>$@.tmp;			\
+-- 
+2.34.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-remove-absolute-build-time-paths.patch b/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-remove-absolute-build-time-paths.patch
new file mode 100644
index 00000000..63fb63a2
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-remove-absolute-build-time-paths.patch
@@ -0,0 +1,53 @@
+From 29b84ae5b277b85cd7244acde077694e6643fcde Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 18 Jul 2024 07:54:18 +0000
+Subject: [PATCH] mk/compile.mk: remove absolute build time paths
+
+Some generated files get a __FILE_ID__ which include absolute
+build time paths. Remove the paths and use plain file name.
+Fixes yocto QA check.
+
+Problem/bug:
+
+$ strings ../image/lib/firmware/tee.elf | grep mikko
+__FILE_ID__
+_home_mikko_build_core_ta_pub_key_c
+__FILE_ID__
+_home_mikko_build_core_ldelf_hex_c
+__FILE_ID__
+_home_mikko_build_core_early_ta_fd02c9da_306c_48c7_a49c_bbd827ae86ee_c
+
+With this patch:
+
+$ strings ../image/lib/firmware/tee.elf | grep mikko
+$ strings ../image/lib/firmware/tee.elf | grep FILE_ID | egrep \
+"core_ta_pub_key_c|core_ldelf_hex_c|core_early_ta_fd02c9da_306c_4"
+__FILE_ID__ core_ta_pub_key_c
+__FILE_ID__ core_ldelf_hex_c
+__FILE_ID__ core_early_ta_fd02c9da_306c_48c7_a49c_bbd827ae86ee_c
+
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ mk/compile.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport
+
+diff --git a/mk/compile.mk b/mk/compile.mk
+index b3d807ba4..338535bf3 100644
+--- a/mk/compile.mk
++++ b/mk/compile.mk
+@@ -120,7 +120,7 @@ comp-cppflags-$2 = $$(filter-out $$(CPPFLAGS_REMOVE) $$(cppflags-remove) \
+ 		      $$(addprefix -I,$$(incdirs-$2)) \
+ 		      $$(cppflags$$(comp-sm-$2)) \
+ 		      $$(cppflags-lib$$(comp-lib-$2)) $$(cppflags-$2)) \
+-		      -D__FILE_ID__=$$(subst -,_,$$(subst /,_,$$(subst .,_,$1)))
++		      -D__FILE_ID__=$$(subst -,_,$$(subst /,_,$$(subst .,_,$$(patsubst $$(out-dir)/%,%,$1))))
+ 
+ comp-flags-$2 += -MD -MF $$(comp-dep-$2) -MT $$@
+ comp-flags-$2 += $$(comp-cppflags-$2)
+-- 
+2.34.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb b/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
index 8ae219f4..cee024af 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
@@ -7,4 +7,6 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 SRCREV = "12d7c4ee4642d2d761e39fbcf21a06fb77141dea"
 SRC_URI += " \
     file://0003-optee-enable-clang-support.patch \
-   "
+    file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
+    file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
+"
-- 
2.34.1


