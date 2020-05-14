Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.674.1589489272328448594
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 13:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B44DF40C26;
	Thu, 14 May 2020 20:47:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxTuq2Oiv7uX; Thu, 14 May 2020 20:47:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C43C40951;
	Thu, 14 May 2020 20:47:50 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 427BD17316D;
	Thu, 14 May 2020 16:47:49 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 3/4] trusted-firmware-a: install/deploy multiple variants of the target
Date: Thu, 14 May 2020 16:47:28 -0400
Message-Id: <1589489249-5459-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589489249-5459-1-git-send-email-denis@denix.org>
References: <1589489249-5459-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Installing and deploying .bin and .elf shouldn't be mutually exclusive.
There are scenarios where both can be useful - .bin for booting and .elf
for debugging.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a.inc        | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 25d5179..f5b5bc1 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -116,29 +116,39 @@ do_install() {
 
     install -d -m 755 ${D}/firmware
     for atfbin in ${TFA_INSTALL_TARGET}; do
+        processes="0"
         if [ "$atfbin" = "all" ]; then
             # Target all is not handled by default
             bberror "all as TFA_INSTALL_TARGET is not handled by do_install"
             bberror "Please specify valid targets in TFA_INSTALL_TARGET or"
             bberror "rewrite or turn off do_install"
             exit 1
-        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
+        fi
+
+        if [ -f $BUILD_PLAT/$atfbin.bin ]; then
             echo "Install $atfbin.bin"
             install -m 0644 $BUILD_PLAT/$atfbin.bin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
-        elif [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
+            processes="1"
+        fi
+        if [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
             echo "Install $atfbin.elf"
             install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
-        elif [ -f $BUILD_PLAT/$atfbin ]; then
+            processes="1"
+        fi
+        if [ -f $BUILD_PLAT/$atfbin ]; then
             echo "Install $atfbin"
             install -m 0644 $BUILD_PLAT/$atfbin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}
-        elif [ "$atfbin" = "dtbs" ]; then
+            processes="1"
+        fi
+
+        if [ "$atfbin" = "dtbs" ]; then
             echo "dtbs install, skipped"
         elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
             echo "Tools $atfbin install, skipped"
-        else
+        elif [ "$processed" = "0" ]; then
             bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
             exit 1
         fi
-- 
2.7.4

