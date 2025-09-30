Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9434CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 15:48:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.28793.1759247295409407756
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 08:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D60272B;
	Tue, 30 Sep 2025 08:48:06 -0700 (PDT)
Received: from e121095.cambridge.arm.com (e121095.arm.com [10.1.198.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DCF73F59E;
	Tue, 30 Sep 2025 08:48:14 -0700 (PDT)
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 1/1] arm/trusted-firmware-a: Re-enable BL31 console by default
Date: Tue, 30 Sep 2025 16:47:57 +0100
Message-ID: <20250930154758.2465614-1-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Sep 2025 15:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6722

Backport Trusted Firmware-A patch to re-enable the BL31
console during early boot.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 ...re-enable-console-by-default-in-BL31.patch | 46 +++++++++++++++++++
 .../trusted-firmware-a_2.13.0.bb              |  4 ++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fi=
x-arm-re-enable-console-by-default-in-BL31.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fix-arm-r=
e-enable-console-by-default-in-BL31.patch b/meta-arm/recipes-bsp/trusted-=
firmware-a/files/0001-fix-arm-re-enable-console-by-default-in-BL31.patch
new file mode 100644
index 00000000..f5b8d538
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fix-arm-re-enabl=
e-console-by-default-in-BL31.patch
@@ -0,0 +1,46 @@
+From de4640579c5318ba08ec57531ef87d63f5574557 Mon Sep 17 00:00:00 2001
+From: Chris Kay <chris.kay@arm.com>
+Date: Thu, 21 Aug 2025 14:16:25 +0100
+Subject: [PATCH] fix(arm): re-enable console by default in BL31
+
+In c997a8d, the common `arm_bl31_early_platform_setup` function
+underwent a consolidation of two large preprocessor branches that were
+conditional on whether or not Transfer List support is enabled.
+
+This function would initialise the console via `arm_console_boot_init`
+*only* if Transfer List support was disabled. During the consolidation,
+this call was removed, such that the behaviour was the same for both
+branches.
+
+However, the common `bl31_early_platform_setup2` implementation was not
+updated to reflect this change, and so platforms that a) relied on this
+common implementation and b) did not enable Transfer List support no
+longer initialise the console in BL31.
+
+This change ensures that the common implementation correctly initialises
+the console during early BL31 boot.
+
+Change-Id: I332af3932ac70382fbf7a5434c0008807f38f86c
+Signed-off-by: Chris Kay <chris.kay@arm.com>
+Upstream-Status: Backport [de4640579c5318ba08ec57531ef87d63f5574557]
+---
+ plat/arm/common/arm_bl31_setup.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/plat/arm/common/arm_bl31_setup.c b/plat/arm/common/arm_bl31=
_setup.c
+index 8ac984fd1..e7dc70bdb 100644
+--- a/plat/arm/common/arm_bl31_setup.c
++++ b/plat/arm/common/arm_bl31_setup.c
+@@ -343,6 +343,9 @@ void __init arm_bl31_early_platform_setup(u_register=
_t arg0, u_register_t arg1,
+ void bl31_early_platform_setup2(u_register_t arg0, u_register_t arg1,
+ 		u_register_t arg2, u_register_t arg3)
+ {
++	/* Initialize the console to provide early debug support */
++	arm_console_boot_init();
++
+ 	arm_bl31_early_platform_setup(arg0, arg1, arg2, arg3);
+=20
+ 	/*
+--=20
+2.43.0
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.13.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
3.0.bb
index 5c99446e..3de30bca 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.b=
b
@@ -13,3 +13,7 @@ SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.g=
it;name=3Dmbedtls;protocol=3Dht
 SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
+
+SRC_URI +=3D "\
+    file://0001-fix-arm-re-enable-console-by-default-in-BL31.patch \
+"

