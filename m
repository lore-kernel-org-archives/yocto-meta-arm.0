Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8958.1589964440627335371
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 May 2020 01:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EAD7D40C14;
	Wed, 20 May 2020 08:47:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TBRFmQIQTqHu; Wed, 20 May 2020 08:47:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CAF1B403F2;
	Wed, 20 May 2020 08:47:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8AFCB1731F4;
	Wed, 20 May 2020 04:47:18 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] arm-toolchain: gcc-aarch64-none-elf: Add recipe
Date: Wed, 20 May 2020 04:47:18 -0400
Message-Id: <1589964438-6924-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Adds a recipe to pull down the prebuilt GCC for compiling bare-metal targets
for Aarch64 processors from ARM.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gcc-aarch64-none-elf_9.2-2019.12.bb            | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
new file mode 100644
index 0000000..2ec0f9c
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
@@ -0,0 +1,38 @@
+# Copyright (C) 2020 Texas Instruments Inc.
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Baremetal GCC for Aarch64 processors"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "file://share/doc/gcc/GNU-Free-Documentation-License.html;md5=cc1e9a49a59ce7e6ae5ef37cd16eca0c"
+
+PROVIDES = "virtual/aarch64-none-elf-gcc"
+
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-${PV}-x86_64-aarch64-none-elf.tar.xz"
+
+SRC_URI[sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
+
+S = "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
+
+COMPATIBLE_HOST = "x86_64.*-linux"
+
+do_install() {
+    install -d ${D}${datadir}/aarch64-none-elf/
+    cp -r ${S}/. ${D}${datadir}/aarch64-none-elf/
+
+    install -d ${D}${bindir}
+    # Symlink all executables into bindir
+    for f in ${D}${datadir}/aarch64-none-elf/bin/aarch64-none-elf-*; do
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

