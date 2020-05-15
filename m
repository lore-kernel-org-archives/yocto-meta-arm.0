Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.5623.1589506584815188815
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 18:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4BBC040C1D;
	Fri, 15 May 2020 01:36:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GBrdnF0ipokl; Fri, 15 May 2020 01:36:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 22B9240A46;
	Fri, 15 May 2020 01:36:21 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D0BE6173145;
	Thu, 14 May 2020 21:36:20 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jdmason@kudzu.us>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Date: Thu, 14 May 2020 21:36:20 -0400
Message-Id: <1589506580-40706-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Jon Mason <jdmason@kudzu.us>

Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
and Cortex-M processors from ARM. This toolchain is required to build
Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
some firmware for the M0 coprocessor.

This was originally taken from meta-rockchip, but has been modified from
mailing list feedback.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v3 changes:
* rename recipe to not contain -native in the name
* fix typo in "subsidiaries" word
* use SUMMARY instead of DESCRIPTION
* remove inherit native
* add FILES_${PN} for nativesdk package
* add extra INSANE_SKIP_${PN} due to prebuilt binary package

 .../gcc-arm-none-eabi_9-2019-q4-major.bb           | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
new file mode 100644
index 0000000..84f6dba
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
@@ -0,0 +1,39 @@
+# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
+
+PROVIDES = "virtual/arm-none-eabi-gcc"
+
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-x86_64-linux.tar.bz2"
+
+SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
+SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+COMPATIBLE_HOST = "x86_64.*-linux"
+
+do_install() {
+    install -d ${D}${datadir}/arm-none-eabi/
+    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
+
+    install -d ${D}${bindir}
+    # Symlink all executables into bindir
+    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
+        lnr $f ${D}${bindir}/$(basename $f)
+    done
+}
+
+FILES_${PN} = "${datadir} ${bindir}"
+
+INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
+
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

