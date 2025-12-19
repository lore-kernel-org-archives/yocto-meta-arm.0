Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895E9D78787
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 15:15:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18841.1766157347296507723
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 07:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 771C9FEC;
	Fri, 19 Dec 2025 07:15:39 -0800 (PST)
Received: from benbal01-01.budapest.arm.com (ubul2.budapest.arm.com [10.42.55.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2A903F73F;
	Fri, 19 Dec 2025 07:15:45 -0800 (PST)
From: Bence Balogh <bence.balogh@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH] arm/trusted-firmware-a: Include *.dtb in package
Date: Fri, 19 Dec 2025 15:15:27 +0000
Message-ID: <20251219151528.2727586-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Dec 2025 15:15:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6808

The TF-A can install files with dtb extension. This is not handled in
the firmware.bbclass so append it here.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 49d7eaf5..321a8907 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -229,6 +229,10 @@ do_install() {
     done
 }
=20
+# The firmware.bbclass only adds *.bin files by default but TF-A could i=
nstall
+# files with dtb extension
+FILES:${PN} +=3D "${FIRMWARE_DIR}/*.dtb"
+
 # Skip QA check for relocations in .text of elf binaries
 INSANE_SKIP:${PN}-dbg +=3D "textrel"
 # Build paths are currently embedded

