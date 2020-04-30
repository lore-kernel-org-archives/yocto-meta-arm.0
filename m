Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1231.1588219833952183035
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 21:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 60F6540B0A;
	Thu, 30 Apr 2020 04:10:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DmOj24c0P85; Thu, 30 Apr 2020 04:10:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4346F40C1F;
	Thu, 30 Apr 2020 04:10:32 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E5D0B172CFF;
	Thu, 30 Apr 2020 00:10:30 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 4/4] external-arm-toolchain: drop unnecessary RDEPENDS on bash
Date: Thu, 30 Apr 2020 00:10:28 -0400
Message-Id: <1588219828-34791-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588219828-34791-1-git-send-email-denis@denix.org>
References: <1588219828-34791-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

The 2 scripts that still have /bin/bash shebang are ldd and tzselect. But
it seems upstream had fixed all bashisms in those scripts in recent years
and OE-Core versions of those scripts use /bin/sh already.

Dropping these unnecessary RDEPENDS on bash actually significantly prunes
dependency tree for simple BSP builds like u-boot, etc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb                 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index adb2fdd..af75e6a 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -114,6 +114,8 @@ do_install() {
 	rm -rf ${D}${bindir}/gdbserver
 	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/tzselect
 	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/ldd
+	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
+	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
 
 	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
 
@@ -421,9 +423,6 @@ FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_catchsegv = "${bindir}/catchsegv"
 RDEPENDS_catchsegv = "libsegfault"
 
-RDEPENDS_ldd = "bash"
-RDEPENDS_tzcode = "bash"
-
 # From libgfortran.inc:
 
 FILES_libgfortran = "${libdir}/libgfortran.so.*"
-- 
2.7.4

