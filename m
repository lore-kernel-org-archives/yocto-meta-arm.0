Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BC7C43219
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 17:58:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.64845.1638208689881862078
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 09:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8418112FC;
	Mon, 29 Nov 2021 09:58:09 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52FC73F5A1;
	Mon, 29 Nov 2021 09:58:08 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 05/10] arm-bsp/linux: setting the FFA_VERSION
 compatibility checks
Date: Mon, 29 Nov 2021 17:57:44 +0000
Message-Id: <20211129175749.10391-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
References: <20211129175749.10391-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 17:58:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2485

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit introduces a new kernel patch that aligns the FF-A
versions checks according to the FF-A specification v1.0.

Without this fix, the FF-A bus fails to initialize when the FF-A
framework is version 1.1 (comes with the latest TF-A).

The bus driver which is v1.0 rejects the framework v1.1 despite
the fact they are compatible according to the specification.

This kernel patch changes the logic of the version checking based on
the specification.

Change-Id: If9d7b6c0d5e24e73d4f42c6532cd56ff2d05fcec
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...A_VERSION-compatibility-checks.patch.patch | 101 ++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0037-firmware-arm_ffa-setting-the-FFA_VERSION-compatibility-checks.patch.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0037-firmware-arm_ffa-setting-the-FFA_VERSION-compatibility-checks.patch.patch b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0037-firmware-arm_ffa-setting-the-FFA_VERSION-compatibility-checks.patch.patch
new file mode 100644
index 0000000..f5e5b81
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0037-firmware-arm_ffa-setting-the-FFA_VERSION-compatibility-checks.patch.patch
@@ -0,0 +1,101 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 045c5da54595303c8bfec54fa5bbae10fdf9f5f5 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 25 Aug 2021 11:24:35 +0100
+Subject: [PATCH 1/3] firmware: arm_ffa: setting the FFA_VERSION compatibility
+ checks
+
+This commit aligns the FF-A versions checks according to the
+FF-A specification v1.0.
+
+The compatibility of the version number (x.y) of the caller with
+the version number (a.b) of the callee can be defined as:
+
+    If x == a and y <= b, then the versions are compatible.
+    Otherwise, versions are incompatible.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ drivers/firmware/arm_ffa/driver.c | 41 ++++++++++++++++++++++---------
+ 1 file changed, 30 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
+index c9fb56afbcb4..0044c928d9f2 100644
+--- a/drivers/firmware/arm_ffa/driver.c
++++ b/drivers/firmware/arm_ffa/driver.c
+@@ -105,13 +105,14 @@
+ 
+ #define MAJOR_VERSION_MASK	GENMASK(30, 16)
+ #define MINOR_VERSION_MASK	GENMASK(15, 0)
+-#define MAJOR_VERSION(x)	((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
+-#define MINOR_VERSION(x)	((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
++#define GET_FFA_MAJOR_VERSION(x)	((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
++#define GET_FFA_MINOR_VERSION(x)	((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
+ #define PACK_VERSION_INFO(major, minor)			\
+ 	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
+ 	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
+-#define FFA_VERSION_1_0		PACK_VERSION_INFO(1, 0)
+-#define FFA_MIN_VERSION		FFA_VERSION_1_0
++#define FFA_MAJOR_VERSION		(1)
++#define FFA_MINOR_VERSION		(0)
++#define FFA_VERSION_1_0		PACK_VERSION_INFO(FFA_MAJOR_VERSION, FFA_MINOR_VERSION)
+ 
+ #define SENDER_ID_MASK		GENMASK(31, 16)
+ #define RECEIVER_ID_MASK	GENMASK(15, 0)
+@@ -170,26 +171,44 @@ static struct ffa_drv_info *drv_info;
+ static int ffa_version_check(u32 *version)
+ {
+ 	ffa_value_t ver;
++	u16 major, minor;
+ 
+ 	invoke_ffa_fn((ffa_value_t){
+ 		      .a0 = FFA_VERSION, .a1 = FFA_DRIVER_VERSION,
+ 		      }, &ver);
+ 
++
+ 	if (ver.a0 == FFA_RET_NOT_SUPPORTED) {
+-		pr_info("FFA_VERSION returned not supported\n");
++		pr_err("A Firmware Framework implementation does not exist\n");
+ 		return -EOPNOTSUPP;
+ 	}
+ 
+-	if (ver.a0 < FFA_MIN_VERSION || ver.a0 > FFA_DRIVER_VERSION) {
+-		pr_err("Incompatible version %d.%d found\n",
+-		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0));
+-		return -EINVAL;
++	major = GET_FFA_MAJOR_VERSION(ver.a0);
++	minor = GET_FFA_MINOR_VERSION(ver.a0);
++
++	if ((major != FFA_MAJOR_VERSION) || (minor < FFA_MINOR_VERSION)) {
++		pr_err("Versions are incompatible\n"
++		"FF-A driver version: %d.%d\n"
++		"FF-A framework version: %d.%d\n",
++				FFA_MAJOR_VERSION,
++				FFA_MINOR_VERSION,
++				major,
++				minor);
++		return -EPROTONOSUPPORT;
+ 	}
+ 
++	pr_info("Versions are compatible\n"
++	"FF-A driver version: %d.%d\n"
++	"FF-A framework version: %d.%d\n",
++					FFA_MAJOR_VERSION,
++					FFA_MINOR_VERSION,
++					major,
++					minor);
++
+ 	*version = ver.a0;
+-	pr_info("Version %d.%d found\n", MAJOR_VERSION(ver.a0),
+-		MINOR_VERSION(ver.a0));
++
+ 	return 0;
++
+ }
+ 
+ static int ffa_rx_release(void)
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index f4b5604..49f92ce 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -128,6 +128,7 @@ SRC_URI:append:corstone1000 = " \
            file://0034-usb-isp1760-write-to-status-and-address-register.patch \
            file://0035-usb-isp1760-use-the-right-irq-status-bit.patch \
            file://0036-usb-isp1760-otg-control-register-access.patch \
+           file://0037-firmware-arm_ffa-setting-the-FFA_VERSION-compatibility-checks.patch.patch \
            file://defconfig  \
         "
 
-- 
2.17.1


