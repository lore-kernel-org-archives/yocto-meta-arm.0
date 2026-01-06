Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996CCCD0406
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 16:59:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94601.1767718760499688045
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 08:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0008B497
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jan 2026 08:59:12 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C9073F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jan 2026 08:59:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] meta-arm/oeqa: ignore initrd warning in qemuarm64-secureboot
Date: Tue,  6 Jan 2026 16:59:14 +0000
Message-ID: <20260106165915.1001317-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jan 2026 16:59:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6817

With kernel 6.18 the kernel will now warn if it tries to run a command
from a ramdisk but it cannot be found[1]. This happens with the
qemuarm64-secureboot machine (but not qemuarm64) because u-boot appears
to be populating the devicetree with a ramdisk entry:

    loading kernel to address 40400000 size 1702a00
      1  qfw          ready   qfw          0  qfw
    ** Booting bootflow 'qfw' with qfw
    ## Flattened Device Tree blob at 7e659890
       Booting using the fdt blob at 0x7e659890
    Working FDT set to 7e659890
       Loading Ramdisk to 7bcfd000, end 7d3ffa00 ... OK
       Loading Device Tree to 000000007d621000, end 000000007d626534 ... =
OK
    Working FDT set to 7d621000

    Starting kernel ...

The kernel tries to mount and boot this ramdisk but fails because it
isn't a valid initrd or initramfs. The boot continues as usual, but this
warning in the logs triggers parselogs.

Until the boot flow is properly resolved, ignore the message.

[1] linux 98aa4d5d242d ("init/main.c: add warning when file specified in =
rdinit is inaccessible")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../runtime/cases/parselogs-ignores-qemuarm64-secureboot.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64-=
secureboot.txt b/meta-arm/lib/oeqa/runtime/cases/parselogs-ignores-qemuar=
m64-secureboot.txt
index 92de01b66a..f6555d9157 100644
--- a/meta-arm/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64-secureb=
oot.txt
+++ b/meta-arm/lib/oeqa/runtime/cases/parselogs-ignores-qemuarm64-secureb=
oot.txt
@@ -1,3 +1,8 @@
 optee: Failed to initialize async notifications: -95
 ARM FF-A: Failed to register driver sched callback -95
 ARM FF-A: Notification setup failed -95, not enabled
+
+# u-boot appears to be telling the kernel via devicetree that it has an =
initrd,
+# but it doesnt. The blob appears to be the same size as the kernel, whi=
ch is
+# interesting. Until this is resolved, ignore the warning.
+check access for rdinit=3D/init failed: -2, ignoring
--=20
2.43.0


