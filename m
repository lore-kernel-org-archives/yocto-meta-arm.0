Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B68AC41513
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 15:35:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27966.1719934544240801367
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jul 2024 08:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A13BF367;
	Tue,  2 Jul 2024 08:36:04 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.38.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E90863F766;
	Tue,  2 Jul 2024 08:35:38 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-a: corstone1000: fix compilation issue for FVP multicore
Date: Tue,  2 Jul 2024 16:35:29 +0100
Message-Id: <20240702153529.19530-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240702153529.19530-1-harsimransingh.tungal@arm.com>
References: <20240702153529.19530-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Jul 2024 15:35:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5859

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Include platform header file in order to remove compiler warnings.
Due to GCC upgrades to 14.1, some warnings are being treated as errors.
This change resolves TF-A compilation issue when FVP multicore
is enabled.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...one1000-include-platform-header-file.patch | 28 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0007-feat-corstone1000-include-platform-header-file.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0007-feat-corstone1000-include-platform-header-file.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-a/files/corstone1000/0007-feat-corstone10=
00-include-platform-header-file.patch
new file mode 100644
index 00000000..13310143
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0007=
-feat-corstone1000-include-platform-header-file.patch
@@ -0,0 +1,28 @@
+From 8070bf4a89492727b6da3fb7bdec61748eae1d7d Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Tue, 2 Jul 2024 12:49:12 +0000
+Subject: [PATCH] fix(corstone1000): include platform header file
+
+Include platform.h file in order to remove compiler warnings
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/29727]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ plat/arm/board/corstone1000/common/corstone1000_pm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
+index 979243317..9babe5b11 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
+@@ -8,6 +8,7 @@
+ #include <plat/arm/common/plat_arm.h>
+ #include <platform_def.h>
+ #include <drivers/arm/gicv2.h>
++#include <plat/common/platform.h>
+ /**********************************************************************=
*********
+  * Export the platform handlers via plat_arm_psci_pm_ops. The ARM Stand=
ard
+  * platform layer will take care of registering the handlers with PSCI.
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index c53bc6cd..3e7be142 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -10,6 +10,7 @@ SRC_URI:append =3D " \
 	file://0004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch \
 	file://0005-fix-corstone1000-clean-the-cache-and-disable-interru.patch =
\
 	file://0006-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch =
\
+	file://0007-feat-corstone1000-include-platform-header-file.patch \
        "
=20
 TFA_DEBUG =3D "1"
--=20
2.25.1


