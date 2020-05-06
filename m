Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2176.1588731348698652400
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 May 2020 19:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C9BAF40A93;
	Wed,  6 May 2020 02:15:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkFDeXxA7BRz; Wed,  6 May 2020 02:15:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B157940C13;
	Wed,  6 May 2020 02:15:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6CE49172D0E;
	Tue,  5 May 2020 22:15:46 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/4] gcc-arm: remove extra binary aliases when TCMODE=external-arm
Date: Tue,  5 May 2020 22:15:32 -0400
Message-Id: <1588731334-4919-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588731334-4919-1-git-send-email-denis@denix.org>
References: <1588731334-4919-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

When TCMODE=external-arm, TARGET_SYS!=EAT_TARGET_SYS and gcc installs extra
binary aliases, which could lead to QA errors:

ERROR: gcc-arm-9.2-r2019.12 do_package: QA Issue: gcc: Files/directories were installed but not shipped in any package:
  /usr/bin/arm-poky-linux-gnueabi-arm-none-linux-gnueabihf-g++
  /usr/bin/arm-poky-linux-gnueabi-arm-none-linux-gnueabihf-gcc
  /usr/bin/arm-poky-linux-gnueabi-arm-none-linux-gnueabihf-gcc-ar
  /usr/bin/arm-poky-linux-gnueabi-arm-none-linux-gnueabihf-gcc-ranlib
  /usr/bin/arm-poky-linux-gnueabi-arm-none-linux-gnueabihf-gcc-nm
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
gcc: 5 installed and not shipped files. [installed-vs-shipped]
ERROR: gcc-arm-9.2-r2019.12 do_package: Fatal QA errors found, failing task.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
index 55f40e1..5599743 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
@@ -15,3 +15,13 @@ do_install_prepend_class-target () {
 		install ${STAGING_LIBDIR}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
 	fi
 }
+
+# When TCMODE="external-arm" and TARGET_SYS is different from EAT_TARGET_SYS,
+# gcc installs additional aliases as ${TARGET_SYS}-${EAT_TARGET_SYS}-gcc, etc.
+# Since those are not packaged and not too useful, let's remove them to avoid
+# QA issues
+do_install_append () {
+	for f in g++ gcc gcc-ar gcc-ranlib gcc-nm; do
+		rm -f ${D}${bindir}/${TARGET_SYS}-${EAT_TARGET_SYS}-$f
+	done
+}
-- 
2.7.4

