Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95884ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 16:45:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.1620.1662482744073572260
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 09:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ma2PQcW0;
 spf=pass (domain: linaro.org, ip: 209.85.221.51,
 mailfrom: rui.silva@linaro.org)
Received: by mail-wr1-f51.google.com with SMTP id b16so16346226wru.7
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 09:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=iwsjMHv+TP+PzFPLPKWk4X7m3Kfn8ybuHu9R74AgM3c=;
        b=ma2PQcW0fkOz8U4TtOZ6ig2p3hY2XTmS4E/kVTH6EW6bIcLavhktDGU5OPFNe2Vfi0
         Iln3Vwrk5i8NbIrShn3lZSkrRH5+JIMOe25wxZpoNGvrWLFhZI9DwcLiC/pXrQd79zHG
         0I8CR3UctSPYuMo2XkhGzmoIZgxl7jpawiG8X/9b9GoHR569StknAlzObqLZYIEqyzK0
         wxsHZPH9t1l6QnxDrwFQ5sW0nJNKy2J2dgAXjZAXpr8hF9WcBeBUlCEqyjack1Yd94bY
         xHC3gWCVoQli4mdH8gEW+iZL4kf87qS8BESFvyGOdmy0yZ4MVIWCaR3jgpBOj2qSEQwY
         s/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=iwsjMHv+TP+PzFPLPKWk4X7m3Kfn8ybuHu9R74AgM3c=;
        b=KFmY9B0TrZIuyn24aeeofpEdgxsf6vs6tReldnSEDYqijYp9YHhFjKXjAbn7WUBC6D
         rCZ7iUaQOsLUrN3vLlDirx+y6QqiCK24jLRMyiGH0Q25uwIeMxnuh03wKh8AxkbxQoKz
         hwpFiTQ6z4T2OB78ip7tz/GYGNPeOMIyc/YF6z9r4LHCGfOV/ujU8RL/4NCkeyjO1B+4
         WdTOsYN7gZL5hE3ltmgwETTvsjvYcMZ/w5iY/pIC7FojoMG/4KCyjBHTGrrY1k6HxY0z
         x8eGZ7O0TJZSk5blj7hibmVicqtGPX9rzxr2NAPp9uTtO0SAZs/FM3cUm6YaSg2Ldvi1
         00FA==
X-Gm-Message-State: ACgBeo0PdnCWaJijoZobeEbBb5y+jv5qvVGLvCna8w0niHXWX5HEQB4I
	tR3pR/h9LgEGtHGq6umyPy1hyXc1Ywo8yMqc
X-Google-Smtp-Source: 
 AA6agR5Qa+CShPpzHrQYaTLlqm/EvetZP5c5QTA9k5MAYbv7RNdUKj7lcIKBf1JUabDWJI87ojRdUg==
X-Received: by 2002:a05:6000:1f99:b0:226:e714:c7b2 with SMTP id
 bw25-20020a0560001f9900b00226e714c7b2mr19318847wrb.229.1662482742073;
        Tue, 06 Sep 2022 09:45:42 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003a607e395ebsm27891440wmq.9.2022.09.06.09.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 09:45:41 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH] arm-bsp: trusted-services: fix openamp build
Date: Tue,  6 Sep 2022 17:45:38 +0100
Message-Id: <20220906164538.1503942-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Sep 2022 16:45:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3741

With the latest gcc, there were some unresolved symbols on
opemamp linkage, add the implementation of that symbol for the
outline of atomics.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 ...mic-outline-to-fix-build-for-opemamp.patch | 44 +++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0049-Add-atomic-outline-to-fix-build-for-opemamp.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0049-Add-atomic-outline-to-fix-build-for-opemamp.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0049-Add-atomic-outline-to-fix-build-for-opemamp.patch
new file mode 100644
index 000000000000..649b967818d8
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0049-Add-atomic-outline-to-fix-build-for-opemamp.patch
@@ -0,0 +1,44 @@
+From 0d8394ee5c52e97e82ebe4641cf0d9ebcbe147ff Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 6 Sep 2022 16:47:06 +0100
+Subject: [PATCH] Add atomic outline to fix build for opemamp
+
+Add memory model 5 atomic ouline support (_sync) to fix
+missing symbol when compiling with recent gcc (12.2).
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+---
+ deployments/se-proxy/opteesp/lse.S | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/deployments/se-proxy/opteesp/lse.S b/deployments/se-proxy/opteesp/lse.S
+index 840683a6671a..8e466d65fc2b 100644
+--- a/deployments/se-proxy/opteesp/lse.S
++++ b/deployments/se-proxy/opteesp/lse.S
+@@ -5,6 +5,7 @@
+ 
+ .text
+ .globl __aarch64_cas4_acq_rel
++.globl __aarch64_cas4_sync
+ 
+ __aarch64_cas4_acq_rel:
+ 	mov	w16, w0
+@@ -16,4 +17,12 @@ __aarch64_cas4_acq_rel:
+ 	cbnz	w17, 0b
+ 1:	ret
+ 
++__aarch64_cas4_sync:
++	mov	w16, w0
++	ldxr	w0, [x2]
++	cmp	w0, w16
++0:	bne	1f
+ 
++	stlxr	w17, w1, [x2]
++	cbnz	w17, 0b
++1:	ret
+-- 
+2.37.3
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index b04863fcfaa5..9d1c3272687e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -60,6 +60,7 @@ SRC_URI:append = " \
 		  file://0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch \
 		  file://0003-corstone1000-port-crypto-config.patch;patchdir=../psa-arch-tests \
                   file://0048-Fix-UEFI-get_variable-with-small-buffer.patch \
+                  file://0049-Add-atomic-outline-to-fix-build-for-opemamp.patch \
                   "
 
 SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=development;name=mbedtls;destsuffix=git/mbedtls"
-- 
2.37.3


