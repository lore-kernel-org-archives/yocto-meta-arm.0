Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F112AD15DB0
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 15:22:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48753.1729524158093819646
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 08:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BC1CDA7
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Oct 2024 08:23:07 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 03BFB3F528
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Oct 2024 08:22:36 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH kirkstone] arm/linux-yocto: disable CONFIG_MTD_NAND_FSL_IFC
Date: Mon, 21 Oct 2024 11:22:35 -0400
Message-Id: <20241021152235.73736-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Oct 2024 15:22:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6218

Linux stable kernel v5.15.166 added commit e59386c300198385d8bf33336de3b8=
c165d20d00,
which modifies the depends for the Freescale IFC NAND controller.  See
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dlinux-5.15.y&id=3De59386c300198385d8bf33336de3b8c165d20d00

Because of this change, do_kernel_configcheck is logging an warning
about values not matching.  To address this issue, disable it manually
in a config fragment, but only for the affected machines in meta-arm.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/files/no-fsl-ifc-nand.cfg | 1 +
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc   | 6 +++++-
 .../recipes-kernel/linux/linux-yocto/no-fsl-ifc-nand.cfg    | 1 +
 meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend        | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/no-fsl-ifc-na=
nd.cfg
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/no-fsl-ifc-=
nand.cfg

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/no-fsl-ifc-nand.cfg =
b/meta-arm-bsp/recipes-kernel/linux/files/no-fsl-ifc-nand.cfg
new file mode 100644
index 000000000000..85f956a12e71
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/no-fsl-ifc-nand.cfg
@@ -0,0 +1 @@
+CONFIG_MTD_NAND_FSL_IFC=3Dn
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index fc7df03aa436..eee26a384c35 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -91,7 +91,10 @@ COMPATIBLE_MACHINE:juno =3D "juno"
 KBUILD_DEFCONFIG:juno =3D "defconfig"
 KCONFIG_MODE:juno =3D "--alldefconfig"
 FILESEXTRAPATHS:prepend:juno :=3D "${ARMBSPFILESPATHS}"
-SRC_URI:append:juno =3D " file://juno-dts-mhu-doorbell.patch"
+SRC_URI:append:juno =3D " \
+    file://juno-dts-mhu-doorbell.patch \
+    file://no-fsl-ifc-nand.cfg \
+    "
=20
 #
 # Musca B1/S2 can't run Linux
@@ -116,6 +119,7 @@ SRC_URI:append:n1sdp =3D " \
     file://enable-realtek-R8169.cfg \
     file://enable-usb_conn_gpio.cfg \
     file://usb_xhci_pci_renesas.cfg \
+    file://no-fsl-ifc-nand.cfg \
     "
 # Since we use the intree defconfig and the preempt-rt turns off some co=
nfigs
 # do_kernel_configcheck will display warnings. So, lets disable it.
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/no-fsl-ifc-nand.cf=
g b/meta-arm/recipes-kernel/linux/linux-yocto/no-fsl-ifc-nand.cfg
new file mode 100644
index 000000000000..85f956a12e71
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/no-fsl-ifc-nand.cfg
@@ -0,0 +1 @@
+CONFIG_MTD_NAND_FSL_IFC=3Dn
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-=
arm/recipes-kernel/linux/linux-yocto_%.bbappend
index 53ff4ac804ae..d827561c0df2 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -4,6 +4,7 @@ COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D " \
     file://tcpci.cfg \
+    file://no-fsl-ifc-nand.cfg \
     "
=20
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot =3D "${ARMFILESPATHS}"
--=20
2.39.5 (Apple Git-154)


