Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.675.1592526946412082394
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 17:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9A116407DA;
	Fri, 19 Jun 2020 00:35:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFcE-lJLAlpW; Fri, 19 Jun 2020 00:35:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7C05E40B96;
	Fri, 19 Jun 2020 00:35:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 62F0817320C;
	Thu, 18 Jun 2020 20:35:43 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v3 1/5] external-arm-toolchain-versions: also collect binutils/bfd version
Date: Thu, 18 Jun 2020 20:35:33 -0400
Message-Id: <1592526937-38479-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592526937-38479-1-git-send-email-denis@denix.org>
References: <1592526937-38479-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

To be used by SDK packaging for binutils cross.

This code is upstreamed from meta-arago layer.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/external-arm-toolchain-versions.inc    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
index 5c40af2..a89f2f0 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
@@ -117,6 +117,15 @@ def eat_get_gdb_version(d):
         first_line = stdout.splitlines()[0]
         return first_line.split()[-1]
 
+def eat_get_bfd_version(d):
+    try:
+        stdout, stderr = eat_run(d, 'as', '--version')
+    except bb.process.CmdError:
+        return 'UNKNOWN'
+    else:
+        first_line = stdout.splitlines()[0]
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
-- 
2.7.4

