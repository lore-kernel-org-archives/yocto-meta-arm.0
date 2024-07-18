Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCDBC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 12:07:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13555.1721304428865734229
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 05:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1CF61477;
	Thu, 18 Jul 2024 05:07:33 -0700 (PDT)
Received: from PW05BKJD.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDB233F766;
	Thu, 18 Jul 2024 05:07:07 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-m: corstone1000: Increase PS size
Date: Thu, 18 Jul 2024 13:06:43 +0100
Message-Id: <20240718120643.1181-2-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718120643.1181-1-ali.oezaslan@arm.com>
References: <20240718120643.1181-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jul 2024 12:07:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5894

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

Increase the size of PS storage in Secure Flash.

The SecureBoot and Security Interface Extension (SIE) tests for MPS3
are failing when the Secure Flash runs out of memory. The frequency
of the errors is at least 50-60%. The aim of this is to increase
the size of PS storage in Secure Flash, so as to minimize
the possibilities of it to run out of memory.

FLASH_PS_AREA_SIZE is increased.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
---
 ...tone1000-Increase-flash-PS-area-size.patch | 34 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-platform-corstone1000-Increase-flash-PS-area-size.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-platform-corstone1000-Increase-flash-PS-area-size.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-platform-cor=
stone1000-Increase-flash-PS-area-size.patch
new file mode 100644
index 00000000..cbf8ea66
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-platform-corstone1000-Increase-flash-PS-area-size.patch
@@ -0,0 +1,34 @@
+From f7082b1d74a7056fff11bc21142a14f7f7b4635b Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Mon, 15 Jul 2024 13:03:24 +0000
+Subject: [PATCH 1/1] platform: corstone1000: Increase flash PS area size
+
+Aim of this is to increase the size of PS storage in Secure Flash.
+
+Increasing the size minimize the possibilities of it to run out
+of memory.
+
+FLASH_PS_AREA_SIZE is increased.
+
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ platform/ext/target/arm/corstone1000/partition/flash_layout.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index 568c8de28..b163b9c31 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -194,7 +194,7 @@
+=20
+ #define FLASH_PS_AREA_OFFSET            (FLASH_ITS_AREA_OFFSET + \
+                                          FLASH_ITS_AREA_SIZE)
+-#define FLASH_PS_AREA_SIZE              (16 * SECURE_FLASH_SECTOR_SIZE)
++#define FLASH_PS_AREA_SIZE              (96 * SECURE_FLASH_SECTOR_SIZE)
+=20
+ /* OTP_definitions */
+ #define FLASH_OTP_NV_COUNTERS_AREA_OFFSET (FLASH_PS_AREA_OFFSET + \
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 96f805a4..ffbd6657 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -32,6 +32,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0012-corstone1000-Remove-reset-after-capsule-update.patch \
     file://0013-platform-CS1000-Add-multicore-support-for-FVP.patch \
     file://0014-Platform-Corstone1000-switch-to-metadata-v2.patch \
+    file://0015-platform-corstone1000-Increase-flash-PS-area-size.patch =
\
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.34.1


