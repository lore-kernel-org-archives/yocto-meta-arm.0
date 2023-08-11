Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95309C001DE
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 13:57:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.43376.1691762222944784829
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Aug 2023 06:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC7AB113E;
	Fri, 11 Aug 2023 06:57:44 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.30.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A96A73F64C;
	Fri, 11 Aug 2023 06:57:00 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Jon.Mason@arm.com,
	Drew.Reed@arm.com,
	Xueliang.Zhong@arm.com,
	Emekcan.Aras@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH] arm-bsp/u-boot: corstone1000: detect the kernel size automatically
Date: Fri, 11 Aug 2023 14:56:51 +0100
Message-Id: <20230811135651.1691251-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Aug 2023 13:57:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4951

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

use filesize environment variable to read the size of the unzipped initra=
mfs bundle

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...one1000-detect-inflated-kernel-size.patch} | 20 +++++++++----------
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0033-Increas=
e-the-unzipped-Kernel-size.patch =3D> 0033-corstone1000-detect-inflated-k=
ernel-size.patch} (63%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-Inc=
rease-the-unzipped-Kernel-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-=
boot/corstone1000/0033-corstone1000-detect-inflated-kernel-size.patch
similarity index 63%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-Incr=
ease-the-unzipped-Kernel-size.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corsto=
ne1000-detect-inflated-kernel-size.patch
index 63c42c70..9fd5b33b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-Increase-t=
he-unzipped-Kernel-size.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corstone10=
00-detect-inflated-kernel-size.patch
@@ -1,29 +1,29 @@
-From df23489adcba1cdcbcb4fefbed0896fc1f408700 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 2 Aug 2023 17:07:05 +0100
-Subject: [PATCH] Increase the unzipped Kernel size
+From b57e05e95735b9b58e81b7a67f483b645c56811e Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 11 Aug 2023 10:41:19 +0100
+Subject: [PATCH] corstone1000: detect inflated kernel size
=20
-Increases the unzipped kernel size for corstone1000.
+use filesize variable set by unzip command
=20
 Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 ---
  configs/corstone1000_defconfig | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index a0af413de8..54a5bca354 100644
+index b6b1ccdd78..8a10bca069 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -15,7 +15,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
+@@ -17,7 +17,7 @@ CONFIG_FIT=3Dy
  CONFIG_BOOTDELAY=3D3
  CONFIG_USE_BOOTARGS=3Dy
  CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
 -CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r 0xf00=
000; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $fd=
tcontroladdr;"
-+CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r 0xfb0=
000; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $fd=
tcontroladdr;"
++CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r $file=
size; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $f=
dtcontroladdr;"
  CONFIG_CONSOLE_RECORD=3Dy
  CONFIG_LOGLEVEL=3D7
  # CONFIG_DISPLAY_CPUINFO is not set
 --=20
-2.17.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 6c0d4904..389f236e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -50,7 +50,7 @@ SRC_URI:append:corstone1000 =3D " \
 	file://0030-corstone1000-boot-index-from-active.patch			  \
 	file://0031-corstone1000-enable-PSCI-reset.patch			  \
 	file://0032-Enable-EFI-set-get-time-services.patch			  \
-	file://0033-Increase-the-unzipped-Kernel-size.patch			  \
+	file://0033-corstone1000-detect-inflated-kernel-size.patch			  \
         "
=20
 #
--=20
2.25.1


