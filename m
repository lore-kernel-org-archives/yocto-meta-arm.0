Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6971C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 15:20:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.461.1714144825583209247
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 08:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 385BC1596;
	Fri, 26 Apr 2024 08:20:53 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.64.236])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8680D3F73F;
	Fri, 26 Apr 2024 08:20:24 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 2/3] arm-bsp/u-boot: corstone1000: add external system DTS node
Date: Fri, 26 Apr 2024 16:20:13 +0100
Message-Id: <20240426152014.356666-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426152014.356666-1-abdellatif.elkhlifi@arm.com>
References: <20240426152014.356666-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Apr 2024 15:20:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5616

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

describe the external system as a remoteproc node in the device tree

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  5 +--
 ...efi-corstone1000-fwu-update-RPC-ABI.patch} |  0
 ...e1000-Change-MMCOMM-buffer-location.patch} |  0
 ...one1000-dts-add-external-system-node.patch | 34 +++++++++++++++++++
 4 files changed, 37 insertions(+), 2 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0044-efi-cor=
stone1000-fwu-update-RPC-ABI.patch =3D> 0045-efi-corstone1000-fwu-update-=
RPC-ABI.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0045-Corston=
e1000-Change-MMCOMM-buffer-location.patch =3D> 0046-Corstone1000-Change-M=
MCOMM-buffer-location.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
047-corstone1000-dts-add-external-system-node.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 43c19b84..4b45fbbf 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -60,8 +60,9 @@ SRC_URI:append =3D " \
     file://0042-corstone1000-enable-virtio-net-support.patch		  \
     file://0043-firmware-psci-Fix-bind_smccc_features-psci-check.patch		=
  \
     file://0044-corstone1000-set-unique-GUID-for-fvp-and-mps3.patch		  \
-    file://0045-Corstone1000-Change-MMCOMM-buffer-location.patch		  \
-    file://0044-efi-corstone1000-fwu-update-RPC-ABI.patch			  \
+    file://0045-efi-corstone1000-fwu-update-RPC-ABI.patch			  \
+    file://0046-Corstone1000-Change-MMCOMM-buffer-location.patch		  \
+    file://0047-corstone1000-dts-add-external-system-node.patch \
     "
=20
 do_configure:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-efi=
-corstone1000-fwu-update-RPC-ABI.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0045-efi-corstone1000-fwu-update-RPC-ABI.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-efi-=
corstone1000-fwu-update-RPC-ABI.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-efi-co=
rstone1000-fwu-update-RPC-ABI.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-Cor=
stone1000-Change-MMCOMM-buffer-location.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0046-Corstone1000-Change-MMCOMM-buffer-locatio=
n.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-Cors=
tone1000-Change-MMCOMM-buffer-location.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-Corsto=
ne1000-Change-MMCOMM-buffer-location.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-cor=
stone1000-dts-add-external-system-node.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0047-corstone1000-dts-add-external-system-node.=
patch
new file mode 100644
index 00000000..1c873001
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-corstone10=
00-dts-add-external-system-node.patch
@@ -0,0 +1,34 @@
+From 03df80671f1f2102b04baa810b59ffb6edaece0b Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 18 Mar 2024 17:00:56 +0000
+Subject: [PATCH] corstone1000: dts: add external system node
+
+add the external system node
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ arch/arm/dts/corstone1000.dtsi | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
+index 077673dd44..5cc4c26bac 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -122,6 +122,13 @@
+ 		interrupt-parent =3D <&gic>;
+ 		ranges;
+=20
++		extsys0: remoteproc@1a010310 {
++			compatible =3D "arm,corstone1000-extsys";
++			reg =3D <0x1a010310 0x4>, <0x1a010314 0x4>;
++			reg-names =3D "reset-control", "reset-status";
++			firmware-name =3D "es_flashfw.elf";
++		};
++
+ 		timer@1a220000 {
+ 			compatible =3D "arm,armv7-timer-mem";
+ 			reg =3D <0x1a220000 0x1000>;
+--=20
+2.25.1
+
--=20
2.25.1


