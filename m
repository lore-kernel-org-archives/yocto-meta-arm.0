Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90736ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 03:24:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.3740.1663903444292933612
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 20:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KY6kk+qz;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so7065527pjb.0
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 20:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9TXF/4NqVsxPxjTKmz+ZeGEsMArkdPJaPH4zgIP4rNU=;
        b=KY6kk+qz7cp4EsNPpPEYdLCeJRfi+HKu79d/GESpvOpo/hkdJTKSRQ2gqzMRkRYYB5
         KVmYQ+pKPSBzqRfL2KgMfs2t9uo6qV94eO5IkUBmtJPChcfumuYIyXqT3DN+rlfGSLiR
         N2APushFvHWJ1/RjFsYh+T73aAViBcoCdlKzIOzKkJ96+agff1RirUqjgpQzDOI+Km6X
         LYOKheBTh4UjZrLwjoRS/FSXPaoVzPE87CU+1d+zK+XT52DqrABB8Gb2GufRqEGx8eQC
         kfUA4oHiaC7T45y8+7mFF/lsAN5TvgKhjuWNCvs9qzZieHg2RfJuROZB6shgw5BphTaJ
         WGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9TXF/4NqVsxPxjTKmz+ZeGEsMArkdPJaPH4zgIP4rNU=;
        b=7wSg0zIH2Ph6I+w5mKWNH3vhgUmRbC4EQClrlVnqwPrEynonHxjCcc+ya9mFiT77YG
         Zffhvi3W8y1oxox96JVbpIKM0lYRBMQZYSdbzhQL0bZ6wLIa+9H2erbs9tC+GHhk/Rtl
         6MRYxO4OX+jAU9xTpTlRr7+0bwGTtAGBF3kkhdxHvYfdBbmsKf5mrV7OGRUskpQ67mc0
         zE8HjpG55WOEyrp2TXpnnMsP/Kcz9flh7uRZojrxiCgDsrvJ+/eUyf0I+jhizPCgEULr
         bWSm7kOw77mgeLPmEKnHmv1o2I73Xm9YPDAN+kAXHHX1itAUvueqtoSTYBJsjFums4hs
         381Q==
X-Gm-Message-State: ACrzQf3bCYvVFkPJwbjxbXYCqHdKBz+AEgj3aOKOavQ4QQcdh4xeZYjJ
	d6IpYtpSdJVaNvKOQckiYsMCb1zAjrp4kQ==
X-Google-Smtp-Source: 
 AMsMyM5hKVA4nMCkRjW73tRQPG4fkNNn+KB1un+dnfL0IatKqvOcQr9u2Ptuvs9CWuYlcbqRRBpb9g==
X-Received: by 2002:a17:90b:3505:b0:203:b7b1:2bc3 with SMTP id
 ls5-20020a17090b350500b00203b7b12bc3mr16359468pjb.242.1663903443389;
        Thu, 22 Sep 2022 20:24:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::dee7])
        by smtp.gmail.com with ESMTPSA id
 v127-20020a622f85000000b0053818255880sm5144350pfv.193.2022.09.22.20.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 20:24:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] hafnium: Add a fix for clang-15 errors
Date: Thu, 22 Sep 2022 20:24:00 -0700
Message-Id: <20220923032400.2890392-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 03:24:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3816

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-with-clang-15.patch        | 100 ++++++++++++++++++
 meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb   |   7 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.patch

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.patch
new file mode 100644
index 0000000..c376a9c
--- /dev/null
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.patch
@@ -0,0 +1,100 @@
+From 1a84b72df8e749665733c3489f605264ccc63d73 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 22 Sep 2022 19:13:49 -0700
+Subject: [PATCH] Fix build with clang-15
+
+Clang-15 warns about prototypes a bit harder
+Remove unused variable suites_in_image
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/hftest/common.c                                    | 2 --
+ test/vmapi/arch/aarch64/gicv3/gicv3.c                   | 2 +-
+ test/vmapi/arch/aarch64/gicv3/inc/gicv3.h               | 2 +-
+ test/vmapi/arch/aarch64/gicv3/timer_secondary.c         | 2 +-
+ test/vmapi/el0_partitions/services/interruptible.c      | 2 +-
+ test/vmapi/el0_partitions/services/interruptible_echo.c | 2 +-
+ 6 files changed, 5 insertions(+), 7 deletions(-)
+
+--- a/test/hftest/common.c
++++ b/test/hftest/common.c
+@@ -67,7 +67,6 @@ void hftest_json(void)
+ {
+ 	const char *suite = NULL;
+ 	size_t i;
+-	size_t suites_in_image = 0;
+ 	size_t tests_in_suite = 0;
+ 
+ 	HFTEST_LOG("{");
+@@ -81,7 +80,6 @@ void hftest_json(void)
+ 				HFTEST_LOG("    },");
+ 			}
+ 			/* Move onto new suite. */
+-			++suites_in_image;
+ 			suite = test->suite;
+ 			tests_in_suite = 0;
+ 			HFTEST_LOG("    {");
+--- a/test/vmapi/arch/aarch64/gicv3/gicv3.c
++++ b/test/vmapi/arch/aarch64/gicv3/gicv3.c
+@@ -42,7 +42,7 @@ static void irq(void)
+ 	dlog("primary IRQ %d ended\n", interrupt_id);
+ }
+ 
+-void system_setup()
++void system_setup(void)
+ {
+ 	const uint32_t mode = MM_MODE_R | MM_MODE_W | MM_MODE_D;
+ 	hftest_mm_identity_map((void *)GICD_BASE, PAGE_SIZE, mode);
+--- a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
++++ b/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
+@@ -30,4 +30,4 @@ extern void *recv_buffer;
+ 
+ extern volatile uint32_t last_interrupt_id;
+ 
+-void system_setup();
++void system_setup(void);
+--- a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
++++ b/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
+@@ -55,7 +55,7 @@ TEAR_DOWN(timer_secondary_ffa)
+ 	EXPECT_FFA_ERROR(ffa_rx_release(), FFA_DENIED);
+ }
+ 
+-static void timer_busywait_secondary()
++static void timer_busywait_secondary(void)
+ {
+ 	const char message[] = "loop 0099999";
+ 	const char expected_response[] = "Got IRQ 03.";
+--- a/test/vmapi/el0_partitions/services/interruptible.c
++++ b/test/vmapi/el0_partitions/services/interruptible.c
+@@ -43,7 +43,7 @@ static void irq(void)
+  * Try to receive a message from the mailbox, blocking if necessary, and
+  * retrying if interrupted.
+  */
+-static struct ffa_value mailbox_receive_retry()
++static struct ffa_value mailbox_receive_retry(void)
+ {
+ 	struct ffa_value received;
+ 
+--- a/test/vmapi/el0_partitions/services/interruptible_echo.c
++++ b/test/vmapi/el0_partitions/services/interruptible_echo.c
+@@ -32,7 +32,7 @@ static void irq(void)
+  * Try to receive a message from the mailbox, blocking if necessary, and
+  * retrying if interrupted.
+  */
+-static struct ffa_value mailbox_receive_retry()
++static struct ffa_value mailbox_receive_retry(void)
+ {
+ 	struct ffa_value received;
+ 
+--- a/test/vmapi/primary_with_secondaries/services/interruptible.c
++++ b/test/vmapi/primary_with_secondaries/services/interruptible.c
+@@ -40,7 +40,7 @@ static void irq(void)
+  * Try to receive a message from the mailbox, blocking if necessary, and
+  * retrying if interrupted.
+  */
+-struct ffa_value mailbox_receive_retry()
++struct ffa_value mailbox_receive_retry(void)
+ {
+ 	struct ffa_value received;
+ 
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
index f64b396..d90f747 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
@@ -7,12 +7,17 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=782b40c14bad5294672c500501edc103"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit deploy python3native pkgconfig
+
+CLANGNATIVE = ""
+CLANGNATIVE:runtime-llvm = "clang-native"
+
+inherit deploy python3native pkgconfig ${CLANGNATIVE}
 
 SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https;branch=master \
            file://0001-define-_Noreturn-if-needed.patch \
            file://host-ld.patch \
            file://pkg-config-native.patch;patchdir=third_party/linux \
+           file://0001-Fix-build-with-clang-15.patch \
           "
 SRCREV = "79e9522d26fc2a88a44af149034acc27312b73a1"
 S = "${WORKDIR}/git"
-- 
2.37.3


