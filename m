Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CBDCCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 11:12:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8921.1762513978031478601
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 03:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E035E1516;
	Fri,  7 Nov 2025 03:12:49 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.85.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F6DD3F63F;
	Fri,  7 Nov 2025 03:12:56 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/3] arm-bsp/u-boot:corstone1000: Use 32-bit cells for reserved-memory node
Date: Fri,  7 Nov 2025 11:12:50 +0000
Message-ID: <20251107111252.25711-2-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251107111252.25711-1-hugues.kambampiana@arm.com>
References: <20251107111252.25711-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Nov 2025 11:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6760

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Switch the *reserved-memory* node from two-cell (64-bit) encoding to
one-cell (32-bit) encoding and adjust the `reg` property accordingly
to make reserved-memory node format compatible with rest of the dts.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  5 +++
 ...-use-32-bit-cells-for-reserved-memor.patch | 39 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
040-corstone1000-dts-use-32-bit-cells-for-reserved-memor.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index d39169d7..b33a5bcb 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -69,6 +69,11 @@ SRC_URI:append =3D " \
     file://0038-corstone1000-enable-OF_UPSTREAM-device-tree-support.patc=
h \
 "
=20
+# Use 32 bit cells for reserved-memory node in dts
+SRC_URI:append =3D " \
+    file://0040-corstone1000-dts-use-32-bit-cells-for-reserved-memor.pat=
ch \
+"
+
 uboot_configure_config:append() {
    openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout $=
{B}/CRT.key -out $builddir/CRT.crt -nodes -days 365
 }
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cor=
stone1000-dts-use-32-bit-cells-for-reserved-memor.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0040-corstone1000-dts-use-32-bit-cel=
ls-for-reserved-memor.patch
new file mode 100644
index 00000000..a450e6d2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone10=
00-dts-use-32-bit-cells-for-reserved-memor.patch
@@ -0,0 +1,39 @@
+From 25c478492b889fe857c7e1a3fa2c43ff956a36bb Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Wed, 24 Sep 2025 13:42:25 +0000
+Subject: [PATCH 1/2] corstone1000: dts: use 32-bit cells for /reserved-m=
emory
+ node
+
+Switch the *reserved-memory* node from two-cell (64-bit) encoding to
+one-cell (32-bit) encoding and adjust the `reg` property accordingly
+to make reserved-memory node format compatible with rest of the dts.
+
+Upstream-Status: Pending
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ arch/arm/dts/corstone1000-u-boot.dtsi | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/dts/corstone1000-u-boot.dtsi b/arch/arm/dts/corsto=
ne1000-u-boot.dtsi
+index 023109fb6a7..92c493c5692 100644
+--- a/arch/arm/dts/corstone1000-u-boot.dtsi
++++ b/arch/arm/dts/corstone1000-u-boot.dtsi
+@@ -18,12 +18,12 @@
+ 	};
+=20
+ 	reserved-memory {
+-		#address-cells =3D <2>;
+-		#size-cells =3D <2>;
++		#address-cells =3D <1>;
++		#size-cells =3D <1>;
+ 		ranges;
+=20
+ 		smem_mem: smem_region@88000000 {
+-			reg =3D <0x0 0x88000000 0x0 0x100000>;
++			reg =3D <0x88000000 0x100000>;
+ 			no-map;
+ 		};
+ 	};
+--=20
+2.43.0
+

