Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077F0C41513
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 17:26:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21436.1717003560814821166
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 May 2024 10:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD8CB1424;
	Wed, 29 May 2024 10:26:24 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.86.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E773B3F792;
	Wed, 29 May 2024 10:25:59 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH scarthgap 1/1] arm-bsp/trusted-firmware-m: corstone1000: remove capsule update reset
Date: Wed, 29 May 2024 19:25:40 +0200
Message-Id: <20240529172540.699780-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240529172540.699780-1-bence.balogh@arm.com>
References: <20240529172540.699780-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 May 2024 17:26:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5774

From: Bence Balogh <bence.balogh@arm.com>

The reset has to be removed from the TF-M side after capsule update
because it caused data abort exceptions on the host side.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...00-Remove-reset-after-capsule-update.patch | 28 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0012-corstone1000-Remove-reset-after-capsule-update.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-corstone1000-Remove-reset-after-capsule-update.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-corstone1000-Re=
move-reset-after-capsule-update.patch
new file mode 100644
index 00000000..8ffd567b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-corstone1000-Remove-reset-after-capsule-update.patch
@@ -0,0 +1,28 @@
+From 78db43f80676f8038b35edd6674d22fb5ff85c12 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Mon, 27 May 2024 17:11:31 +0200
+Subject: [PATCH] corstone1000: Remove reset after capsule update
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/29065]
+---
+ .../target/arm/corstone1000/services/src/tfm_platform_system.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/services/src/tfm_platf=
orm_system.c b/platform/ext/target/arm/corstone1000/services/src/tfm_plat=
form_system.c
+index 41305ed966..1e837ce3b5 100644
+--- a/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
++++ b/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
+@@ -28,9 +28,6 @@ enum tfm_platform_err_t tfm_platform_hal_ioctl(tfm_pla=
tform_ioctl_req_t request,
+=20
+         case IOCTL_CORSTONE1000_FWU_FLASH_IMAGES:
+             result =3D corstone1000_fwu_flash_image();
+-            if (!result) {
+-                NVIC_SystemReset();
+-            }
+             break;
+=20
+         case IOCTL_CORSTONE1000_FWU_HOST_ACK:
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index eafb1fc7..dcba79ef 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -28,6 +28,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0009-platform-corstone1000-Increase-RSE_COMMS-buffer-size.pat=
ch \
     file://0010-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
     file://0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patc=
h \
+    file://0012-corstone1000-Remove-reset-after-capsule-update.patch \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.25.1


