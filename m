Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.683.1592526946416665410
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 17:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9EBAD40B96;
	Fri, 19 Jun 2020 00:35:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZGbigp-JirH; Fri, 19 Jun 2020 00:35:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 821BC40BEF;
	Fri, 19 Jun 2020 00:35:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 653EC17320F;
	Thu, 18 Jun 2020 20:35:43 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v3 2/4] external-arm-toolchain-versions: set per-component toolchain licenses
Date: Thu, 18 Jun 2020 20:35:34 -0400
Message-Id: <1592526937-38479-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592526937-38479-1-git-send-email-denis@denix.org>
References: <1592526937-38479-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

This code is upstreamed from meta-arago layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../distro/include/external-arm-toolchain-versions.inc     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
index a89f2f0..9d4f967 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
@@ -139,5 +139,19 @@ python external_arm_toolchain_version_handler () {
     d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
     d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
     d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
+
+    lc_libc = "LGPL-2.1"
+    lc_gcc = "GPL-3.0"
+    lc_rle = "GPL-3.0-with-GCC-exception"
+    lc_gdb = "GPL-3.0"
+    lc_bfd = "GPL-3.0"
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

