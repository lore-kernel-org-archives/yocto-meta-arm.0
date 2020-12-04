Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web10.15668.1607095758913045973
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 07:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4999142F
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6139F3F718
	for <meta-arm@lists.yoctoproject.org>; Fri,  4 Dec 2020 07:29:18 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][dunfell 14/17] external-arm-toolchain-versions: also collect binutils/bfd version
Date: Fri,  4 Dec 2020 15:29:02 +0000
Message-Id: <20201204152905.1160276-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@ti.com>

To be used by SDK packaging for binutils cross.

This code is upstreamed from meta-arago layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../distro/include/external-arm-toolchain-versions.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchai=
n-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-tool=
chain-versions.inc
index 5c40af2..a89f2f0 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versi=
ons.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versi=
ons.inc
@@ -117,6 +117,15 @@ def eat_get_gdb_version(d):
         first_line =3D stdout.splitlines()[0]
         return first_line.split()[-1]
=20
+def eat_get_bfd_version(d):
+    try:
+        stdout, stderr =3D eat_run(d, 'as', '--version')
+    except bb.process.CmdError:
+        return 'UNKNOWN'
+    else:
+        first_line =3D stdout.splitlines()[0]
+        return first_line.split()[-1]
+
 python external_arm_toolchain_version_handler () {
     if not isinstance(e, bb.event.ConfigParsed):
         return
@@ -129,5 +138,6 @@ python external_arm_toolchain_version_handler () {
     d.setVar('EAT_VER_LIBC', eat_get_libc_version(ld))
     d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
     d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
+    d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
 }
 addhandler external_arm_toolchain_version_handler
--=20
2.25.1

