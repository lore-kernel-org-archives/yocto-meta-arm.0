Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.7176.1589870088185597267
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 23:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A85040C06;
	Tue, 19 May 2020 06:34:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbbbUEjvzOA8; Tue, 19 May 2020 06:34:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6345740A9E;
	Tue, 19 May 2020 06:34:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1B39A17316F;
	Tue, 19 May 2020 02:34:46 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] trusted-firmware-a: re-enable generation of packages
Date: Tue, 19 May 2020 02:34:45 -0400
Message-Id: <1589870085-51773-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

There is no need to inherit nopackages. Even when the output binaries are being
consumed from deploy or sysroot, and the main binary package is not meant to be
installed in the rootfs, package generation is still useful for SDK use cases
and as a way to distribute sources (e.g. src.rpm/SRPM) in Distros.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index c9c5710..fe9a4e0 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -5,7 +5,7 @@ PROVIDES = "virtual/trusted-firmware-a"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit deploy nopackages
+inherit deploy
 
 COMPATIBLE_MACHINE ?= "invalid"
 
@@ -158,7 +158,10 @@ do_install() {
     done
 }
 
+FILES_${PN} = "/firmware"
 SYSROOT_DIRS += "/firmware"
+# Skip QA check for relocations in .text of elf binaries
+INSANE_SKIP_${PN} = "textrel"
 
 do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-- 
2.7.4

