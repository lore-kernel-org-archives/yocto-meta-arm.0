Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2614.1589412624464215538
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 16:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF5FF40BA6;
	Wed, 13 May 2020 23:30:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxu_D7OluqMj; Wed, 13 May 2020 23:30:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6F8D40B89;
	Wed, 13 May 2020 23:30:22 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 95D22173145;
	Wed, 13 May 2020 19:30:21 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/2] trusted-firmware-a: support multi-board platforms
Date: Wed, 13 May 2020 19:30:19 -0400
Message-Id: <1589412620-56223-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Some platforms can have multiple board configurations, passed as TARGET_BOARD=""
that also becomes an extra directory level in the build output hierarchy.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 4b5da7a..b88b514 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -12,6 +12,10 @@ COMPATIBLE_MACHINE ?= "invalid"
 # Platform must be set for each machine
 TFA_PLATFORM ?= "invalid"
 
+# Some platforms can have multiple board configurations
+# Leave empty for default behavior
+TFA_BOARD ?= ""
+
 # Build for debug (set TFA_DEBUG to 1 to activate)
 TFA_DEBUG ?= "0"
 
@@ -65,6 +69,10 @@ DEPENDS_append = " dtc-native openssl-native"
 # Add platform parameter
 EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
 
+# Handle TFA_BOARD parameter
+EXTRA_OEMAKE += "${@['', 'TARGET_BOARD=${TFA_BOARD}'][bool(d.getVar('TFA_BOARD'))]}"
+BUILD_DIR = "${@['${TFA_PLATFORM}', '${TFA_PLATFORM}/${TFA_BOARD}'][bool(d.getVar('TFA_BOARD'))]}"
+
 # Handle TFA_DEBUG parameter
 EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', ' DEBUG=${TFA_DEBUG}', '', d)}"
 
@@ -93,9 +101,9 @@ do_compile[cleandirs] = "${B}"
 
 do_install() {
     if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
-        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
+        BUILD_PLAT=${B}/${BUILD_DIR}/debug/
     else
-        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
+        BUILD_PLAT=${B}/${BUILD_DIR}/release/
     fi
 
     install -d -m 755 ${D}/firmware
-- 
2.7.4

