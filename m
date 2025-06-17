Return-Path: <yogesh.wani@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74891C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:30:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23866.1750177827356953079
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 09:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: yogesh.wani@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00620150C;
	Tue, 17 Jun 2025 09:30:06 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.84.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B01E3F58B;
	Tue, 17 Jun 2025 09:30:26 -0700 (PDT)
From: Yogesh Wani <yogesh.wani@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Yogesh Wani <yogesh.wani@arm.com>
Subject: [PATCH 1/1] arm/trusted-firmware-m: Remove duplicate config in the cmake file.
Date: Tue, 17 Jun 2025 17:30:11 +0100
Message-ID: <20250617163011.2238429-2-yogesh.wani@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617163011.2238429-1-yogesh.wani@arm.com>
References: <20250617163011.2238429-1-yogesh.wani@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 16:30:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6563

The PS_NUM_ASSET is duplicated in the cmake.config and the config_tfm_tar=
get.h file
under corstone-1000. The commit removes the one from the cmake.config and=
 keeps the
one in the header file.

The whole rationale behind this is for the vendor to be able to override =
the
configuration using the cmake file.

Signed-off-by: Yogesh Wani <yogesh.wani@arm.com>
---
 ...e-duplicate-configuration-parameters.patch | 30 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0023-Platform-CS1000-Remove-duplicate-configuration-parameters.=
patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0023-Platform-CS1000-Remove-duplicate-configuration-parameters.patch b=
/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0023-Plat=
form-CS1000-Remove-duplicate-configuration-parameters.patch
new file mode 100644
index 00000000..76761c9a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0023=
-Platform-CS1000-Remove-duplicate-configuration-parameters.patch
@@ -0,0 +1,30 @@
+From 456a58e4cb06c9cbdaadfc3d2e54ef21ec8405fc Mon Sep 17 00:00:00 2001
+From: Yogesh Wani <yogesh.wani@arm.com>
+Date: Wed, 7 May 2025 16:51:27 +0000
+Subject: [PATCH] Remove duplicate configuration parameters for corstone-=
1000
+
+The PS_NUM_ASSET is duplicated in the cmake.config and the
+config_tfm_target.h file under corstone-1000. The commit removes
+the one from the cmake.config and keeps the one in the header file.
+
+The whole rationale behind this is for the vendor to be able
+to override the configuration using the cmake file.
+
+Signed-off-by: Yogesh Wani <yogesh.wani@arm.com>
+Upstream-Status: Submitted
+---
+ platform/ext/target/arm/corstone1000/config.cmake | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
+index 6a805a1220..708bacaedf 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -68,4 +68,3 @@ endif()
+ # Platform-specific configurations
+ set(CONFIG_TFM_USE_TRUSTZONE            OFF)
+ set(TFM_MULTI_CORE_TOPOLOGY             ON)
+-set(PS_NUM_ASSETS                       "40"        CACHE STRING    "Th=
e maximum number of assets to be stored in the Protected Storage area")
+--
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index c79ac2e3..e3a07b72 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -41,6 +41,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0020-Platform-CS1000-Validate-both-metadata-replicas.patch \
     file://0021-platform-corstone1000-add-unique-guid-for-mps3.patch \
     file://0022-CC312-alignment-of-cc312-differences.patch \
+    file://0023-Platform-CS1000-Remove-duplicate-configuration-parameter=
s.patch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"

