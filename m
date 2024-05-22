Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF40C25B7F
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 16:05:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1292.1716393900492295664
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 May 2024 09:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B03B1480;
	Wed, 22 May 2024 09:05:24 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.84.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 917723F766;
	Wed, 22 May 2024 09:04:59 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH scarthgap 3/5] arm-bsp/trusted-firmware-m: corstone1000: increase PS sizes
Date: Wed, 22 May 2024 18:04:41 +0200
Message-Id: <20240522160443.89173-4-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240522160443.89173-1-bence.balogh@arm.com>
References: <20240522160443.89173-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 May 2024 16:05:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5758

From: Bence Balogh <bence.balogh@arm.com>

The private authenticated variable changes increased the variables
metadata. The PS max asset size and related buffer sizes have to be
increased because of this.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...ne1000-Increase-buffers-for-EFI-vars.patch | 45 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-Platform-c=
orstone1000-Increase-buffers-for-EFI-vars.patch
new file mode 100644
index 00000000..abf70389
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch
@@ -0,0 +1,45 @@
+From d7725e629c9ba93523589cc9d8af3186db19d4e8 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 15 May 2024 22:37:51 +0200
+Subject: [PATCH] Platform: corstone1000: Increase buffers for EFI vars
+
+The UEFI variables are stored in the Protected Storage. The size of
+the variables metadata have been increased so the related buffer sizes
+have to be increased.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending
+---
+ .../ext/target/arm/corstone1000/config_tfm_target.h | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
+index 2eb0924770..6ee823a7dc 100644
+--- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
++++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2022, Arm Limited. All rights reserved.
++ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -24,4 +24,15 @@
+ #undef ITS_MAX_ASSET_SIZE
+ #define ITS_MAX_ASSET_SIZE   2048
+=20
++/* The maximum asset size to be stored in the Protected Storage */
++#undef PS_MAX_ASSET_SIZE
++#define PS_MAX_ASSET_SIZE   2592
++
++/* This is needed to be able to process the EFI variables during PS wri=
tes. */
++#undef CRYPTO_ENGINE_BUF_SIZE
++#define CRYPTO_ENGINE_BUF_SIZE 0x5000
++
++/* This is also has to be increased to fit the EFI variables into the i=
ovecs. */
++#undef CRYPTO_IOVEC_BUFFER_SIZE
++#define CRYPTO_IOVEC_BUFFER_SIZE    6000
+ #endif /* __CONFIG_TFM_TARGET_H__ */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 1e835b6f..55cfee5c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -27,6 +27,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0008-Platform-CS1000-Replace-OpenAMP-with-RSE_COMMS.patch \
     file://0009-platform-CS1000-Increase-RSE_COMMS-buffer-size.patch \
     file://0010-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
+    file://0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patc=
h \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.25.1


