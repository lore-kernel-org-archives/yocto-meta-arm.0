Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.12796.1592208437672124676
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 01:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0CA8040A46;
	Mon, 15 Jun 2020 08:07:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rowGZdcNoe-D; Mon, 15 Jun 2020 08:07:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E5EBD40B96;
	Mon, 15 Jun 2020 08:07:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A241117320C;
	Mon, 15 Jun 2020 04:07:15 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/4] external-arm-toolchain-versions: set per-components license based on version
Date: Mon, 15 Jun 2020 04:07:11 -0400
Message-Id: <1592208433-28086-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592208433-28086-1-git-send-email-denis@denix.org>
References: <1592208433-28086-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

This code is upstreamed from meta-arago layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../include/external-arm-toolchain-versions.inc    | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
index a89f2f0..6121adf 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
@@ -126,6 +126,20 @@ def eat_get_bfd_version(d):
         first_line = stdout.splitlines()[0]
         return first_line.split()[-1]
 
+# Licenses set for main components of the toolchain:
+# (g)libc is always LGPL version 2 (or later)
+# gcc has switched from GPL version 2 (or later) to version 3 (or later) after 4.2.1,
+#    see this announcement - http://gcc.gnu.org/ml/gcc-announce/2007/msg00003.html
+# libgcc and libstdc++ always had exceptions to GPL called Runtime Library Exception, but
+#    it was based on GPL version 2 (or later), until new GPL version 3 (or later) exception
+#    was introduced on 27 Jan 2009 - http://gcc.gnu.org/ml/gcc-announce/2009/msg00000.html
+#    and http://www.gnu.org/licenses/gcc-exception.html, which was several days after
+#    gcc 4.3.3 was released - http://gcc.gnu.org/releases.html
+# gdb/gdbserver version 6.6 was the last one under GPL version 2 (or later), according
+#    to the release schedule - http://www.gnu.org/software/gdb/schedule/
+# binutils version 2.17 was the last one under GPL version 2 (or later), according
+#    to the published releases - http://ftp.gnu.org/gnu/binutils/
+
 python external_arm_toolchain_version_handler () {
     if not isinstance(e, bb.event.ConfigParsed):
         return
@@ -139,5 +153,19 @@ python external_arm_toolchain_version_handler () {
     d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
     d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
     d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
+
+    lc_libc = "LGPL-2.1"
+    lc_gcc = ["GPL-3.0", "GPL-2.0"][eat_get_gcc_version(ld) <= "4.2.1"]
+    lc_rle = ["GPL-3.0-with-GCC-exception", "GPL-2.0-with-GCC-exception"][eat_get_gcc_version(ld) <= "4.3.3"]
+    lc_gdb = ["GPL-3.0", "GPL-2.0"][eat_get_gdb_version(ld) <= "6.6"]
+    lc_bfd = ["GPL-3.0", "GPL-2.0"][eat_get_bfd_version(ld) <= "2.17"]
+
+    d.setVar('EAT_LIBC_LICENSE', lc_libc)
+    d.setVar('EAT_GCC_LICENSE', lc_gcc)
+    d.setVar('EAT_RLE_LICENSE', lc_rle)
+    d.setVar('EAT_GDB_LICENSE', lc_gdb)
+    d.setVar('EAT_BFD_LICENSE', lc_bfd)
+
+    d.setVar('EAT_LICENSE', "%s & %s & %s & %s & %s" % (lc_libc, lc_gcc, lc_rle, lc_gdb, lc_bfd))
 }
 addhandler external_arm_toolchain_version_handler
-- 
2.7.4

