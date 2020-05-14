Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.673.1589489272328277683
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 13:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC86A40951;
	Thu, 14 May 2020 20:47:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-2IzOa4C1Ei; Thu, 14 May 2020 20:47:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9DEF740C15;
	Thu, 14 May 2020 20:47:50 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3FF76173169;
	Thu, 14 May 2020 16:47:49 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2 2/4] trusted-firmware-a: add support for SPD (Secure Payload Dispatcher) services
Date: Thu, 14 May 2020 16:47:27 -0400
Message-Id: <1589489249-5459-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589489249-5459-1-git-send-email-denis@denix.org>
References: <1589489249-5459-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Some platforms use Secure Payload Dispatcher - allow selecting one with TFA_SPD.

Official SPD description:
/*******************************************************************************
 * This is the Secure Payload Dispatcher (SPD). The dispatcher is meant to be a
 * plug-in component to the Secure Monitor, registered as a runtime service. The
 * SPD is expected to be a functional extension of the Secure Payload (SP) that
 * executes in Secure EL1. The Secure Monitor will delegate all SMCs targeting
 * the Trusted OS/Applications range to the dispatcher. The SPD will either
 * handle the request locally or delegate it to the Secure Payload. It is also
 * responsible for initialising and maintaining communication with the SP.
 ******************************************************************************/

Clean other EXTRA_OEMAKE to remove leading space not needed with +=

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - replace boolean index trick

 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 899b778..25d5179 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -16,6 +16,11 @@ TFA_PLATFORM ?= "invalid"
 # Leave empty for default behavior
 TFA_BOARD ?= ""
 
+# Some platforms use SPD (Secure Payload Dispatcher) services
+# Few options are "opteed", "tlkd", "trusty", "tspd"...
+# Leave empty to not use SPD
+TFA_SPD ?= ""
+
 # Build for debug (set TFA_DEBUG to 1 to activate)
 TFA_DEBUG ?= "0"
 
@@ -73,16 +78,19 @@ EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
 EXTRA_OEMAKE += "${@'TARGET_BOARD=${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
 BUILD_DIR = "${TFA_PLATFORM}${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
 
+# Handle TFA_SPD parameter
+EXTRA_OEMAKE += "${@'SPD=${TFA_SPD}' if d.getVar('TFA_SPD') else ''}"
+
 # Handle TFA_DEBUG parameter
-EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', ' DEBUG=${TFA_DEBUG}', '', d)}"
+EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', 'DEBUG=${TFA_DEBUG}', '', d)}"
 
 # Handle MBEDTLS
-EXTRA_OEMAKE += "${@bb.utils.contains('TFA_MBEDTLS', '1', ' MBEDTLS_DIR=${TFA_MBEDTLS_DIR}', '', d)}"
+EXTRA_OEMAKE += "${@bb.utils.contains('TFA_MBEDTLS', '1', 'MBEDTLS_DIR=${TFA_MBEDTLS_DIR}', '', d)}"
 
 # Uboot support
 DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
 do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
-EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
+EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
 
 # The following hack is needed to fit properly in yocto build environment
 # TFA is forcing the host compiler and its flags in the Makefile using :=
-- 
2.7.4

