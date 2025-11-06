Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742B0CCFA1B
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 14:24:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16650.1762439074163386927
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 06:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10E991515
	for <meta-arm@lists.yoctoproject.org>; Thu,  6 Nov 2025 06:24:26 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7554C3F66E
	for <meta-arm@lists.yoctoproject.org>; Thu,  6 Nov 2025 06:24:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm-bsp/trusted-firmware-a: change documentation links to point at rendered docs
Date: Thu,  6 Nov 2025 14:24:29 +0000
Message-ID: <20251106142430.614591-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106142430.614591-1-ross.burton@arm.com>
References: <20251106142430.614591-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Nov 2025 14:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6754

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend
index e80279d63b..02c88148de 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
@@ -52,14 +52,14 @@ EXTRA_OEMAKE:append:qemuarm64-secureboot =3D "${@bb.u=
tils.contains('MACHINE_FEATUR
=20
 do_compile:append:qemuarm64-secureboot() {
     # Create a secure flash image for booting AArch64 Qemu. See:
-    # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/d=
ocs/plat/qemu.rst
+    # https://trustedfirmware-a.readthedocs.io/en/latest/plat/qemu.html
     dd if=3D${BUILD_DIR}/bl1.bin of=3D${BUILD_DIR}/flash.bin bs=3D4096 c=
onv=3Dnotrunc
     dd if=3D${BUILD_DIR}/fip.bin of=3D${BUILD_DIR}/flash.bin seek=3D64 b=
s=3D4096 conv=3Dnotrunc
 }
=20
 do_compile:append:qemuarm-secureboot() {
     # Create a secure flash image for booting AArch64 Qemu. See:
-    # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/d=
ocs/plat/qemu.rst
+    # https://trustedfirmware-a.readthedocs.io/en/latest/plat/qemu.html
     dd if=3D${BUILD_DIR}/bl1.bin of=3D${BUILD_DIR}/flash.bin bs=3D4096 c=
onv=3Dnotrunc
     dd if=3D${BUILD_DIR}/fip.bin of=3D${BUILD_DIR}/flash.bin seek=3D64 b=
s=3D4096 conv=3Dnotrunc
 }
--=20
2.43.0


