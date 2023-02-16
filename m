Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4794EC64ED8
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 10:56:59 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.7425.1676545008322861254
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 02:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSbwS-009BTI-VD; Thu, 16 Feb 2023 12:56:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSbwS-000cYS-Lp; Thu, 16 Feb 2023 12:56:44 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/4] meta-arm-bsp/conf: switch from :append to +=
Date: Thu, 16 Feb 2023 12:56:37 +0200
Message-Id: <20230216105640.147967-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216105640.147967-1-mikko.rapeli@linaro.org>
References: <20230216105640.147967-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230216105640.147967-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 10:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4402

:append is hard to override in product specific layers so use +=
when possible.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm-bsp/conf/machine/corstone500.conf         | 2 +-
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf  | 4 ++--
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 2 +-
 meta-arm-bsp/conf/machine/n1sdp.conf               | 2 +-
 meta-arm-bsp/conf/machine/sgi575.conf              | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index a599660c..0ade230c 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -29,7 +29,7 @@ UBOOT_IMAGE_LOADADDRESS = "0x84000000"
 PREFERRED_VERSION_u-boot ?= "2023.01"
 
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
-WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
+WKS_FILE_DEPENDS += "${EXTRA_IMAGEDEPENDS}"
 
 WKS_FILE ?= "core-image-minimal.corstone500.wks"
 
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 0c2ea122..b4ca1259 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -18,11 +18,11 @@ UBOOT_MACHINE ?= "vexpress_aemv8r_defconfig"
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
-IMAGE_CLASSES:append = " fvpboot"
+IMAGE_CLASSES += "fvpboot"
 IMAGE_FSTYPES += "wic"
 WKS_FILE ?= "efi-disk.wks.in"
 EFI_PROVIDER ?= "grub-efi"
-MACHINE_FEATURES:append = " efi"
+MACHINE_FEATURES += "efi"
 
 # As this is a virtual target that will not be used in the real world there is
 # no need for real SSH keys.
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 7f25cd54..36beb2e0 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -70,7 +70,7 @@ PACKAGE_EXCLUDE = "kernel-image-*"
 SERIAL_CONSOLES ?= "115200;ttyAMA0"
 
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
-WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
+WKS_FILE_DEPENDS += "${EXTRA_IMAGEDEPENDS}"
 
 WKS_FILE ?= "corstone1000-image.corstone1000.wks"
 
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 581e6af0..7544ad13 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -15,7 +15,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 # Set default WKS
 WKS_FILE ?= "n1sdp-efidisk.wks"
 IMAGE_EFI_BOOT_FILES ?= "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
-WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
+WKS_FILE_DEPENDS += "${EXTRA_IMAGEDEPENDS}"
 
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
index 3c2c94b6..b48e05e5 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -21,4 +21,4 @@ MACHINE_FEATURES += "efi"
 IMAGE_FSTYPES += "cpio.gz wic"
 
 WKS_FILE ?= "sgi575-efidisk.wks"
-WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
+WKS_FILE_DEPENDS += "${EXTRA_IMAGEDEPENDS}"
-- 
2.34.1


