Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0D7C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:22:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11004.1639401761868098612
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 05:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 798221FB;
	Mon, 13 Dec 2021 05:22:41 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 564DB3F793;
	Mon, 13 Dec 2021 05:22:40 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 3/4] arm-bsp/u-boot: corstone1000: arm_ffa: removing the cast
 when using binary OR on FIELD_PREP macros
Date: Mon, 13 Dec 2021 13:22:26 +0000
Message-Id: <20211213132227.5490-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213132227.5490-1-abdellatif.elkhlifi@arm.com>
References: <20211213132227.5490-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 13:22:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2640

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

When the GENMASK used is above 16-bits wide a u16 cast will cause
loss of data.

This commit fixes that.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Change-Id: I72e5e42971a50ce167500a92cc529c5cb3ff781f
---
 ...t-when-using-binary-OR-on-FIELD_PREP.patch | 42 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch
new file mode 100644
index 0000000..e57336c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 8907d857321de362ee545d3c86e39e9b49380c70 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Sat, 11 Dec 2021 21:05:10 +0000
+Subject: [PATCH] arm_ffa: removing the cast when using binary OR on FIELD_PREP
+ macros
+
+When the GENMASK used is above 16-bits wide a u16 cast will cause
+loss of data.
+
+This commit fixes that.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ drivers/arm-ffa/arm_ffa_prv.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/arm-ffa/arm_ffa_prv.h b/drivers/arm-ffa/arm_ffa_prv.h
+index 38ea4ba83e..d0db3ef508 100644
+--- a/drivers/arm-ffa/arm_ffa_prv.h
++++ b/drivers/arm-ffa/arm_ffa_prv.h
+@@ -40,13 +40,13 @@
+ 
+ #define PREP_SELF_ENDPOINT_ID_MASK		GENMASK(31, 16)
+ #define PREP_SELF_ENDPOINT_ID(x)		\
+-			((u16)(FIELD_PREP(PREP_SELF_ENDPOINT_ID_MASK, (x))))
++			(FIELD_PREP(PREP_SELF_ENDPOINT_ID_MASK, (x)))
+ 
+ /* Partition endpoint ID mask  (partition with which u-boot communicates with) */
+ 
+ #define PREP_PART_ENDPOINT_ID_MASK		GENMASK(15, 0)
+ #define PREP_PART_ENDPOINT_ID(x)		\
+-			((u16)(FIELD_PREP(PREP_PART_ENDPOINT_ID_MASK, (x))))
++			(FIELD_PREP(PREP_PART_ENDPOINT_ID_MASK, (x)))
+ 
+ /* The FF-A SMC function prototype definition */
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 903efcb..57b26a0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -48,6 +48,7 @@ SRC_URI:append:corstone1000 = " \
       file://0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch \
       file://0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch \
       file://0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch \
+      file://0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch \
       "
 
 #
-- 
2.17.1


