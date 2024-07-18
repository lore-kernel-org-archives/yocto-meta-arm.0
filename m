Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244E6C3DA63
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:42:21 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.15307.1721310136661654450
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 06:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=j0+zZxg0;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e991fb456so332612e87.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721310135; x=1721914935; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fb+sqzyIkk1uITAyzgbXN+GCDoGxelVsujfJHwmbCGg=;
        b=j0+zZxg0HleVDp5dMVUq7mpJGmdrHGL1IzNeDRarTAKLQe3NE0aDg7DuSLRrLiYGWv
         VhZwuoI6Jed1teABxomnJfr8a+GdmiVVZ17tFgUmtii7Zng05a+xBiS+O6KM9dokyPZ7
         ctIrGMiXYjuG3vbgtbqaMrjo+wfzCr3Geo4g+uvpWVKyKRToMEbfUi7eVSup8wCx3bWp
         dwm2/Q9wDovPJ20NplpcgD5+wfeKjj6mC+99Q5YUkCUgrh2WN5qTJHafO8/cLCkVG/VY
         WyXBjHJOqUitivLvTGnz3U+6I0OD6oZoB1DhUVZsONxRXLfgKTKDeb3PrLEAFGNDO9WU
         jgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310135; x=1721914935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fb+sqzyIkk1uITAyzgbXN+GCDoGxelVsujfJHwmbCGg=;
        b=aDPdEn3meKLPoBi0Mvhw7NwZ0h++6dpx409n4dwb2uiNRwkAMXSyjap9df6zTsvjIp
         LxUZWUsFR5uPEoUI1H1k9UVUV/k7UDvzHshXdyGPNCxtzRfbF3KxBK1xSWP9H+qQblPP
         JgSvf3/dhJXpSxBN7vUvqQzTg9raCi9aBDtilG+YYlYUP+WXFbY+dW4wMOJ6YGKwXVqD
         vmFH3+DjjACjTKp1YBmIatkwYZUgr6vamHnLL7jUF6TavVyEC87aulJov5YxQfsOpfW3
         NGAV/l0mdxJ96RnFlFDapm5fx5iGlCwAkWfOadqWZ39ycRnZtkAQxwnubYm5/LojjCeR
         2mJg==
X-Gm-Message-State: AOJu0YzmZ/O30xhNY28qKEXdMFiIRKMDpWeVPmVPDd9CfVOY1bX3xydh
	XGqab1NgPvIsjn7lqaJbLdQxn0L+DjNXYf3MHLMRegPV3HqTWU6LIrj0ASDauQprdo5A+4O/oF6
	f
X-Google-Smtp-Source: AGHT+IGc0KfTyDsERKAlHuSUj0WgLHfbqDtJQyqU9EViwbQl2f30i/7pR+UbLhTfC/ZaSPWSl2lJgg==
X-Received: by 2002:a05:6512:3a83:b0:52e:941d:ade8 with SMTP id 2adb3069b0e04-52ef07028d9mr332707e87.9.1721310134821;
        Thu, 18 Jul 2024 06:42:14 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef05c81865sm3219511fa.10.2024.07.18.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:42:14 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/4] optee-os: remove absolute paths
Date: Thu, 18 Jul 2024 16:41:50 +0300
Message-ID: <20240718134152.38721-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718134152.38721-1-mikko.rapeli@linaro.org>
References: <20240718134152.38721-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 13:42:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5896

Change optee-os build scripts to not use absolute
build time paths in generated header files and scripts.

One patch is backport from master/4.3 and the other has been
submitted.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...not-use-full-path-to-generate-guard-.patch | 45 +++++++++++++++++++
 ....mk-remove-absolute-build-time-paths.patch | 32 +++++++++++++
 .../recipes-security/optee/optee-os_4.2.0.bb  |  4 +-
 3 files changed, 80 insertions(+), 1 deletion(-)
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
index 00000000..af41599c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-remove-absolute-build-time-paths.patch
@@ -0,0 +1,32 @@
+From f881f1b42be0b1e53c0f9a0a663adbc11fa2f320 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 18 Jul 2024 07:54:18 +0000
+Subject: [PATCH] mk/compile.mk: remove absolute build time paths
+
+Some generated files get a __FILE_ID__ which include absolute
+build time paths. Remove the paths and use plain file name.
+Fixes yocto QA check.
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ mk/compile.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/6950]
+
+diff --git a/mk/compile.mk b/mk/compile.mk
+index b3d807ba4..85b4dab64 100644
+--- a/mk/compile.mk
++++ b/mk/compile.mk
+@@ -120,7 +120,7 @@ comp-cppflags-$2 = $$(filter-out $$(CPPFLAGS_REMOVE) $$(cppflags-remove) \
+ 		      $$(addprefix -I,$$(incdirs-$2)) \
+ 		      $$(cppflags$$(comp-sm-$2)) \
+ 		      $$(cppflags-lib$$(comp-lib-$2)) $$(cppflags-$2)) \
+-		      -D__FILE_ID__=$$(subst -,_,$$(subst /,_,$$(subst .,_,$1)))
++		      -D__FILE_ID__=$$(subst -,_,$$(subst /,_,$$(subst .,_,$$(notdir $1))))
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


