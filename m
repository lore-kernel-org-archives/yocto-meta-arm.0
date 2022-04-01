Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95335C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 14:41:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.11437.1648824102529955348
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 07:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EIHHuEeY;
 spf=pass (domain: linaro.org, ip: 209.85.128.48,
 mailfrom: rui.silva@linaro.org)
Received: by mail-wm1-f48.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so1625882wme.0
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oKQSietgt8HSw8cQjZ0N/z0GPG4Um9elWfvCDJszoNE=;
        b=EIHHuEeYgWPTaQSMCIwB1rrUGHvxMKJYviQ1VqDToynkU82AOxfFvVdCR7zaRjOT5U
         bj2ccjPXyTx1AhAYpj1XT5Z2QgaH9NZzv9CuiLSWAR+dAcwh4CNWw2dd4H9Sx6V0dnh1
         +0bBRvt52fK5P+qqb4CdIaW2Ao/3T4MRNMuTmOGGNfkAt7a/SuYaNFjs3g2iG8ptKkSU
         b0FK2S08fuYmdQPCq8sICzXtrrBSjT4ktb0ww5vwvoiWF1n+jLMIyRzjT6gqNlU0M344
         QQVcYaNS2meg8ehqJCxkLgeJSIdL1LutFqPraMvT5ppzbWQigxFezSxTIMwr9X7ZeCtK
         ZdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oKQSietgt8HSw8cQjZ0N/z0GPG4Um9elWfvCDJszoNE=;
        b=KuGM44f2QkT6QOypiaq2iGhLia4jiAAa0DUpwTOTu1u/oguAIAgOtRp4s9gw0EwL6T
         VWE401CtB8orMuxrwajbtNz1NwlfuKpVBgjyYhi5Fjg/ulKfXLRnGeDFerv+8ZXCAEDN
         FENPhMlGZrA6cY2EzG3pZRQyOA4h3Pa4UVbHyG/F2XhKB/C1lYDnSYXCSKbfMWECuKro
         bK985nIQf+mid4F6Cf2F6IV/jiqlOn9PHzou6YqBJ/fwZFpfsAfHB5M2gdXIZE/OoBpI
         gE/sPafes0+1M9Ig1HCSo25y3uCJt6zww5L1W1yXaJi1o+JzB7cZQpQDTNF6ks1Sqbz3
         B9CA==
X-Gm-Message-State: AOAM532WrKFQmYqc9+dM+uXK88U0QrplIL9rnIspUrYA5nHl76Z68suf
	wnSZbQfTAxnSFuTwkZfb+V9JsCrHx5cerQ==
X-Google-Smtp-Source: 
 ABdhPJwMkNdN9NJ5N4N9BOGsnciPy9O4wEy0vk2syJLYYDeiapLn5unl00FuleblToua4QBSh46ncA==
X-Received: by 2002:a05:600c:3c8c:b0:38e:4c59:6852 with SMTP id
 bg12-20020a05600c3c8c00b0038e4c596852mr5600321wmb.194.1648824100827;
        Fri, 01 Apr 2022 07:41:40 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b00203ff46f802sm3144144wrn.36.2022.04.01.07.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:41:40 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 3/4] kas/ci: add corstone500 platform
Date: Fri,  1 Apr 2022 15:41:27 +0100
Message-Id: <20220401144128.3517236-4-rui.silva@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401144128.3517236-1-rui.silva@linaro.org>
References: <20220401144128.3517236-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Apr 2022 14:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3228

Add kas and ci, including testimage support for corstone500
platform. And for all to work add also the FVP setup.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .gitlab-ci.yml                             |  5 +++
 ci/corstone500.yml                         | 12 ++++++
 kas/corstone500.yml                        | 47 ++++++++++++++++++++++
 meta-arm-bsp/conf/machine/corstone500.conf | 11 +++++
 4 files changed, 75 insertions(+)
 create mode 100644 kas/corstone500.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 21fcd43f768f..67739f3968b4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -72,6 +72,11 @@ update-repos:
 
 corstone500:
   extends: .build
+  parallel:
+    matrix:
+      - TESTING: testimage
+  tags:
+    - x86_64
 
 corstone1000-fvp:
   extends: .build
diff --git a/ci/corstone500.yml b/ci/corstone500.yml
index 510a2ffb4ca7..ef78cacdf7fd 100644
--- a/ci/corstone500.yml
+++ b/ci/corstone500.yml
@@ -3,4 +3,16 @@ header:
   includes:
     - ci/base.yml
 
+local_conf_header:
+  testimagefvp: |
+    INHERIT += "fvpboot"
+    IMAGE_FEATURES:remove = " ssh-server-dropbear"
+  perf: |
+
 machine: corstone500
+
+distro: poky-tiny
+
+target:
+  - core-image-minimal
+  - perf
diff --git a/kas/corstone500.yml b/kas/corstone500.yml
new file mode 100644
index 000000000000..a454a469b7d2
--- /dev/null
+++ b/kas/corstone500.yml
@@ -0,0 +1,47 @@
+header:
+  version: 11
+
+distro: poky-tiny
+
+defaults:
+  repos:
+    refspec: master
+
+repos:
+  meta-arm:
+    layers:
+      meta-arm:
+      meta-arm-bsp:
+      meta-arm-toolchain:
+
+  poky:
+    url: https://git.yoctoproject.org/git/poky
+    refspec: master
+    layers:
+      meta:
+      meta-poky:
+      meta-yocto-bsp:
+
+  meta-openembedded:
+    url: https://git.openembedded.org/meta-openembedded
+    refspec: master
+    layers:
+      meta-oe:
+      meta-python:
+
+local_conf_header:
+  base: |
+    CONF_VERSION = "2"
+    PACKAGE_CLASSES = "package_ipk"
+    LICENSE_FLAGS_ACCEPTED += "armcompiler"
+    BB_NUMBER_THREADS ?= "16"
+    PARALLEL_MAKE ?= "-j16"
+    PACKAGECONFIG:append:pn-perf = " coresight"
+  fvp-config: |
+    IMAGE_CLASSES:append = " ${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'fvpboot', '', d)}"
+    LICENSE_FLAGS_ACCEPTED:append = " Arm-FVP-EULA"
+
+machine: corstone500
+
+target:
+  - core-image-minimal
diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index 2d939d19cfad..526fff78ec34 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -32,3 +32,14 @@ PREFERRED_VERSION_u-boot ?= "2022.01"
 WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
 
 WKS_FILE ?= "core-image-minimal.corstone500.wks"
+
+TEST_TARGET = "OEFVPTarget"
+TEST_SUITES = "noop"
+
+FVP_PROVIDER ?= "fvp-corstone500-native"
+FVP_EXE ?= "FVP_Corstone-500"
+FVP_CONFIG[board.flashloader0.fname] ?= "${DEPLOY_DIR_IMAGE}/bl1.bin"
+FVP_DATA ?= "css.cluster.cpu0=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic.nopt@0x80000000"
+FVP_CONSOLE ?= "terminal_0"
+FVP_TERMINALS[css.terminal_0] ?= "console"
+FVP_TERMINALS[css.terminal_1] ?= ""
-- 
2.35.1


