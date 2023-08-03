Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D71C001E0
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 07:18:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8806.1691047111039431656
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 00:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84DA2113E;
	Thu,  3 Aug 2023 00:19:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D4973F6C4;
	Thu,  3 Aug 2023 00:18:29 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/u-boot: corstone1000: increase the kernel size
Date: Thu,  3 Aug 2023 08:18:17 +0100
Message-Id: <20230803071817.3406603-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Aug 2023 07:18:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4929

From: Emekcan Aras <emekcan.aras@arm.com>

The unzipped kernel size increased due to recent changes in oe master.
Since corstone1000 sets a fixed kernel size, this should be increased to
boot the platform correctly.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...33-Increase-the-unzipped-Kernel-size.patch | 29 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
033-Increase-the-unzipped-Kernel-size.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-Inc=
rease-the-unzipped-Kernel-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-=
boot/corstone1000/0033-Increase-the-unzipped-Kernel-size.patch
new file mode 100644
index 00000000..63c42c70
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-Increase-t=
he-unzipped-Kernel-size.patch
@@ -0,0 +1,29 @@
+From df23489adcba1cdcbcb4fefbed0896fc1f408700 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 2 Aug 2023 17:07:05 +0100
+Subject: [PATCH] Increase the unzipped Kernel size
+
+Increases the unzipped kernel size for corstone1000.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ configs/corstone1000_defconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index a0af413de8..54a5bca354 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -15,7 +15,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
+ CONFIG_BOOTDELAY=3D3
+ CONFIG_USE_BOOTARGS=3Dy
+ CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
+-CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r 0xf00=
000; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $fd=
tcontroladdr;"
++CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r 0xfb0=
000; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $fd=
tcontroladdr;"
+ CONFIG_CONSOLE_RECORD=3Dy
+ CONFIG_LOGLEVEL=3D7
+ # CONFIG_DISPLAY_CPUINFO is not set
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 41d2830f..6c0d4904 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -50,6 +50,7 @@ SRC_URI:append:corstone1000 =3D " \
 	file://0030-corstone1000-boot-index-from-active.patch			  \
 	file://0031-corstone1000-enable-PSCI-reset.patch			  \
 	file://0032-Enable-EFI-set-get-time-services.patch			  \
+	file://0033-Increase-the-unzipped-Kernel-size.patch			  \
         "
=20
 #
--=20
2.34.1


