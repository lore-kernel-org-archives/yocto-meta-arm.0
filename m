Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web12.15607.1607095758947983822
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 474A2143D
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7DB73F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:18 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 15/17] external-arm-toolchain-versions: set per-component toolchain licenses
Date: Fri,  4 Dec 2020 15:29:03 +0000
Message-Id: <20201204152905.1160276-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@ti.com>

This code is upstreamed from meta-arago layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../include/external-arm-toolchain-versions.inc    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchai=
n-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-tool=
chain-versions.inc
index a89f2f0..9d4f967 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versi=
ons.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versi=
ons.inc
@@ -139,5 +139,19 @@ python external_arm_toolchain_version_handler () {
     d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
     d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
     d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
+
+    lc_libc =3D "LGPL-2.1"
+    lc_gcc =3D "GPL-3.0"
+    lc_rle =3D "GPL-3.0-with-GCC-exception"
+    lc_gdb =3D "GPL-3.0"
+    lc_bfd =3D "GPL-3.0"
+
+    d.setVar('EAT_LIBC_LICENSE', lc_libc)
+    d.setVar('EAT_GCC_LICENSE', lc_gcc)
+    d.setVar('EAT_RLE_LICENSE', lc_rle)
+    d.setVar('EAT_GDB_LICENSE', lc_gdb)
+    d.setVar('EAT_BFD_LICENSE', lc_bfd)
+
+    d.setVar('EAT_LICENSE', "%s & %s & %s & %s & %s" % (lc_libc, lc_gcc,=
 lc_rle, lc_gdb, lc_bfd))
 }
 addhandler external_arm_toolchain_version_handler
--=20
2.25.1

