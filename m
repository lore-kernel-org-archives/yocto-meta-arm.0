Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.3078.1628285789433222954
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Aug 2021 14:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=jk9EWUPE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id js7so5669722qvb.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Aug 2021 14:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UnA1GhOzGzRMy2ALhEAx9/OsW1EPDKSZSBm1Q68drqQ=;
        b=jk9EWUPE45hac7qU4XbJ2ZUql1U2rErhwU2lipG9987+p2jRO54jSKHjxdQZcEXdLI
         tNgqyLGEYwmGwBle5mXXZPCz4CccfLdJr6BZzGHO8JT6oexZRg+iLi1/AuZ6vRx/Cr1g
         l605QNNgi73wSFjeVuMEAgAT1oXhkVg8Y2nMhNBYj8x87YW52rX4Yhg1dCv8v2E8kNlN
         q2EwuEvowJBlmw+mSxOUr/4SpgCHm13IVYiarZzLD9JJkz8WH3hhowy8kPM6nrWIstdu
         ObgJoZparHgXVW/WucWGhpMAox+Mp66rKwCimaGAJVT/3zGbN6WQ1HHPosBn0MdYaCkn
         3PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UnA1GhOzGzRMy2ALhEAx9/OsW1EPDKSZSBm1Q68drqQ=;
        b=tPwdJXXtKcONyuysXr+KIxUNkz9rsJjdVJmnWNiHB9y0CngxTer0IHrrBDVajwFYHB
         3YrpdGhj7GxooxPkq3AT6kV7dI/vfM1aQjb2/9JUnN6H+pPSW49BuKGRwTEYEstGrCj3
         NiEixdsZYCOScYbXPce/KZB3VkoUCfQXakVObJ3Zj/gY7IG03Pih137I7LYbQsRRgHIb
         ZllAkYDSGL2ruG40qy6Rl3ixywCNvkFF/JdIQymxV6q2Z/JVLnXQD8SZi9aNcpA18ax9
         5tUR9/aUkhAEBof0dKlCZF46sdmEu1J3VhoNKI0z8fyo2KARdB6EJ9kw+C8+gsjVFA4m
         c7Cw==
X-Gm-Message-State: AOAM5307Ms1n/PX4lmfkTv80I+ArbuXQ4r+VcDZgamPyaSm8usbztB76
	Ld+tAXRtIJ4LNddxU0OUZm+XEcU88vsg5g==
X-Google-Smtp-Source: ABdhPJzvQ/B+oxRVWPSdOcbTpCQUBNULfqwpIvQc6PMdoK9+mSzOEhoGI/Xy3qbrBV/i10vagO4ueQ==
X-Received: by 2002:a05:6214:2b0b:: with SMTP id jx11mr12955581qvb.17.1628285788568;
        Fri, 06 Aug 2021 14:36:28 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:59e3:c3e7:7bac:fd79])
        by smtp.gmail.com with ESMTPSA id t26sm3811453qtc.44.2021.08.06.14.36.28
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:36:28 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] corstone500: clean-up kernel entries
Date: Fri,  6 Aug 2021 17:36:22 -0400
Message-Id: <20210806213624.22981-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210806213624.22981-1-jon.mason@arm.com>
References: <20210806213624.22981-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct an override syntax issue with the kernel and move the relevant
kernel entries from the machine config to the kernel include file to
match the other machines in meta-arm-bsp

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf                | 5 +----
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 3 +++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index b1191377d19c..401c74660575 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -4,7 +4,6 @@
 
 require conf/machine/include/tune-cortexa5.inc
 
-#
 # Corstone-500 is built against poky-tiny distro.
 # poky-tiny sets PREFERRED_PROVIDER_virtual/kernel to linux-yocto-tiny.
 # Since distro config is evaluated after the machine config, we need to
@@ -12,10 +11,8 @@ require conf/machine/include/tune-cortexa5.inc
 # PREFERRED_PROVIDER_virtual/kernel specified in the machine config will
 # apply.
 #
-PREFERRED_PROVIDER_virtual/kernel_forcevariable = "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.3%"
-KBUILD_DEFCONFIG = "multi_v7_defconfig"
-KCONFIG_MODE = "--alldefconfig"
 
 PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index e66fd5fba1ff..113662796610 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -24,6 +24,9 @@ SRCREV:arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 # Corstone-500 KMACHINE
 #
 COMPATIBLE_MACHINE:corstone500 = "corstone500"
+KMACHINE:corstone500 = "corstone500"
+KBUILD_DEFCONFIG:corstone500  = "multi_v7_defconfig"
+KCONFIG_MODE:corstone500 = "--alldefconfig"
 
 #
 # FVP BASE KMACHINE
-- 
2.20.1

