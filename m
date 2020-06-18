Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2325.1592464870652537367
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 00:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1D81640B7F;
	Thu, 18 Jun 2020 07:21:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEdc4Yuy_Ggr; Thu, 18 Jun 2020 07:21:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A35FD40AD5;
	Thu, 18 Jun 2020 07:21:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 49BAB1707D8;
	Thu, 18 Jun 2020 03:21:07 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Sumit Garg <sumit.garg@linaro.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v4 5/5] external-arm-toolchain: Add specific licenses for individual packages
Date: Thu, 18 Jun 2020 03:21:07 -0400
Message-Id: <1592464867-12851-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Sumit Garg <sumit.garg@linaro.org>

Add license.inc file to state license of various packages provided by
pre-built Arm toolchain.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
This uses new EAT_*_LICENSE defines from external-arm-toolchain-versions.inc

 .../external-arm-toolchain.bb                      |  4 +-
 .../external-arm-toolchain/license.inc             | 73 ++++++++++++++++++++++
 2 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 14a585f..7d59d8e 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -1,9 +1,9 @@
 require recipes-core/glibc/glibc-package.inc
 
+require license.inc
+
 INHIBIT_DEFAULT_DEPS = "1"
 
-# License applies to this recipe code, not the toolchain itself
-LICENSE = "MIT"
 LIC_FILES_CHKSUM = "\
 	file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
 	file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
new file mode 100644
index 0000000..53641b4
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
@@ -0,0 +1,73 @@
+LICENSE = "${EAT_LICENSE}"
+
+LICENSE_${PN} = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-dev = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-doc = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-dbg = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-pic = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-utils = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-mtrace = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-gconv = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-extra-nss = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-thread-db = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-pcprofile = "${EAT_LIBC_LICENSE}"
+LICENSE_${PN}-staticdev = "${EAT_LIBC_LICENSE}"
+LICENSE_catchsegv = "${EAT_LIBC_LICENSE}"
+LICENSE_glibc-extra-nss = "${EAT_LIBC_LICENSE}"
+LICENSE_glibc-thread-db = "${EAT_LIBC_LICENSE}"
+
+LICENSE_libmemusage = "${EAT_LIBC_LICENSE}"
+LICENSE_libsegfault = "${EAT_LIBC_LICENSE}"
+LICENSE_libsotruss = "${EAT_LIBC_LICENSE}"
+LICENSE_sln = "${EAT_LIBC_LICENSE}"
+LICENSE_nscd = "${EAT_LIBC_LICENSE}"
+LICENSE_ldd = "${EAT_LIBC_LICENSE}"
+
+LICENSE_libasan-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libasan = "${EAT_RLE_LICENSE}"
+LICENSE_libasan-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_libatomic-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libatomic = "${EAT_RLE_LICENSE}"
+LICENSE_libatomic-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_libg2c-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libg2c = "${EAT_RLE_LICENSE}"
+LICENSE_libgcc-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libgcc = "${EAT_RLE_LICENSE}"
+LICENSE_libgfortran-dbg = "${EAT_RLE_LICENSE}"
+LICENSE_libgfortran-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libgfortran = "${EAT_RLE_LICENSE}"
+LICENSE_libgfortran-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_libgomp-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libgomp = "${EAT_RLE_LICENSE}"
+LICENSE_libgomp-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_libitm-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libitm = "${EAT_RLE_LICENSE}"
+LICENSE_libitm-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_liblsan-dev = "${EAT_RLE_LICENSE}"
+LICENSE_liblsan = "${EAT_RLE_LICENSE}"
+LICENSE_liblsan-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_libmudflap-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libmudflap = "${EAT_RLE_LICENSE}"
+LICENSE_libmudflap-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_libquadmath-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libquadmath = "${EAT_RLE_LICENSE}"
+LICENSE_libquadmath-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_libssp-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libssp = "${EAT_RLE_LICENSE}"
+LICENSE_libssp-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_libstdc++-dbg = "${EAT_RLE_LICENSE}"
+LICENSE_libstdc++-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libstdc++ = "${EAT_RLE_LICENSE}"
+LICENSE_libstdc++-precompile-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libstdc++-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_libtsan-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libtsan = "${EAT_RLE_LICENSE}"
+LICENSE_libtsan-staticdev = "${EAT_RLE_LICENSE}"
+LICENSE_libubsan-dev = "${EAT_RLE_LICENSE}"
+LICENSE_libubsan = "${EAT_RLE_LICENSE}"
+LICENSE_libubsan-staticdev = "${EAT_RLE_LICENSE}"
+
+LICENSE_linux-libc-headers-dev = "GPLv2"
+LICENSE_linux-libc-headers = "GPLv2"
+
+LICENSE_gdbserver = "${EAT_GDB_LICENSE}"
-- 
2.7.4

