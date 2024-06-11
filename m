Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79926C27C77
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 15:05:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11937.1718118324499562454
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jun 2024 08:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B2516F3
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 08:05:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CDAA73F64C
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 08:05:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm/u-boot: remove obsolete qemuarm patch
Date: Tue, 11 Jun 2024 15:05:16 +0000
Message-Id: <20240611150519.1940896-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611150519.1940896-1-ross.burton@arm.com>
References: <20240611150519.1940896-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 15:05:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5797

This has been obsoleted by "arm: enable support for QEMU firmware tables"
upstream, in v2024.04.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...rm-make-QFW-MMIO-implied-on-qemu-arm.patch | 34 -------------------
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  5 +--
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/0001-qemu-arm-make=
-QFW-MMIO-implied-on-qemu-arm.patch

diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/0001-qemu-arm-make-QFW-MM=
IO-implied-on-qemu-arm.patch b/meta-arm/recipes-bsp/u-boot/u-boot/0001-qe=
mu-arm-make-QFW-MMIO-implied-on-qemu-arm.patch
deleted file mode 100644
index 8d3b32f8..00000000
--- a/meta-arm/recipes-bsp/u-boot/u-boot/0001-qemu-arm-make-QFW-MMIO-impl=
ied-on-qemu-arm.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 67bb1f111c4668c4dfdc40547cb83fc6c1f010e9 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jdmason@kudzu.us>
-Date: Thu, 26 Jan 2023 11:46:33 -0500
-Subject: [PATCH] qemu: arm: make QFW, MMIO implied on qemu-arm
-
-There are instances when one would not want QFW enabled, like running
-alternative firmware.  Make this choice optional instead of forced by
-using the implied keyword.
-
-Signed-off-by: Jon Mason <jdmason@kudzu.us>
-Upstream-Status: Pending [Not submitted to upstream yet]
-
----
- board/emulation/qemu-arm/Kconfig | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/board/emulation/qemu-arm/Kconfig b/board/emulation/qemu-arm=
/Kconfig
-index ed9949651c4b..93f6f74d5bcc 100644
---- a/board/emulation/qemu-arm/Kconfig
-+++ b/board/emulation/qemu-arm/Kconfig
-@@ -5,8 +5,8 @@ config TEXT_BASE
-=20
- config BOARD_SPECIFIC_OPTIONS # dummy
- 	def_bool y
--	select CMD_QFW
--	select QFW_MMIO
-+	imply CMD_QFW
-+	imply QFW_MMIO
- 	imply VIRTIO_MMIO
- 	imply VIRTIO_PCI
- 	imply VIRTIO_NET
---=20
-2.30.2
-
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm/rec=
ipes-bsp/u-boot/u-boot_%.bbappend
index 58d66e1d..0683a783 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,7 +1,4 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
 SRC_URI:append:qemuarm64-secureboot =3D " file://qemuarm64.cfg"
-SRC_URI:append:qemuarm-secureboot =3D " \
-    file://0001-qemu-arm-make-QFW-MMIO-implied-on-qemu-arm.patch \
-    file://qemuarm.cfg \
-    "
+SRC_URI:append:qemuarm-secureboot =3D " file://qemuarm.cfg"
--=20
2.34.1


