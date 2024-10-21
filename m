Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC53D15DAD
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 15:21:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.49299.1729524114458874569
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 08:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEC8CFEC
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Oct 2024 08:22:23 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 000B03F528
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Oct 2024 08:21:53 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH scarthgap 2/2] arm/linux-yocto: disable CONFIG_MTD_NAND_FSL_IFC
Date: Mon, 21 Oct 2024 11:21:52 -0400
Message-Id: <20241021152152.73664-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241021152152.73664-1-jon.mason@arm.com>
References: <20241021152152.73664-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Oct 2024 15:21:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6216

Linux stable kernel v6.6.44 added commit c22649e217457d732a51112aaa8721a0=
e79e2c30,
which modifies the depends for the Freescale IFC NAND controller.  See
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dlinux-6.6.y&id=3Dc22649e217457d732a51112aaa8721a0e79e2c30

Because of this change, do_kernel_configcheck is logging an warning
about values not matching.  To address this issue, disable it manually
in a config fragment, but only for the affected machines in meta-arm.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/files/no-fsl-ifc-nand.cfg | 1 +
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc   | 4 ++++
 2 files changed, 5 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/no-fsl-ifc-na=
nd.cfg

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
index e2b261f515ff..82966db761bd 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -78,6 +78,9 @@ SRC_URI:append:fvp-base =3D " \
 #
 COMPATIBLE_MACHINE:juno =3D "juno"
 FILESEXTRAPATHS:prepend:juno :=3D "${ARMBSPFILESPATHS}"
+SRC_URI:append:juno =3D " \
+    file://no-fsl-ifc-nand.cfg \
+    "
=20
 #
 # Musca B1/S2 can't run Linux
@@ -104,6 +107,7 @@ SRC_URI:append:n1sdp =3D " \
     file://enable-realtek-R8169.cfg \
     file://enable-usb_conn_gpio.cfg \
     file://usb_xhci_pci_renesas.cfg \
+    file://no-fsl-ifc-nand.cfg \
     "
 # Since we use the intree defconfig and the preempt-rt turns off some co=
nfigs
 # do_kernel_configcheck will display warnings. So, lets disable it.
--=20
2.39.5 (Apple Git-154)


