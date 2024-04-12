Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12271C00A94
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:05:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.43374.1712916337597033895
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 03:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 868E71596;
	Fri, 12 Apr 2024 03:06:06 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.83.142])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79B573F64C;
	Fri, 12 Apr 2024 03:05:36 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/3] arm-bsp/u-boot: corstone1000: Change MMCOMM buffer location
Date: Fri, 12 Apr 2024 11:05:25 +0100
Message-Id: <20240412100527.991610-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412100527.991610-1-emekcan.aras@arm.com>
References: <20240412100527.991610-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Apr 2024 10:05:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5536

From: Emekcan Aras <emekcan.aras@arm.com>

MM Communicate buffer is accessed by normal world but at the moment
it's allocated in the secure ram. This moves mm communicate buffer
to the DDR and also fixes the capsule buffer size since it cannot be
more than the bank size.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...ne1000-Change-MMCOMM-buffer-location.patch | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
045-Corstone1000-Change-MMCOMM-buffer-location.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index c0a029e9..b5e53818 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -60,6 +60,7 @@ SRC_URI:append =3D " \
     file://0042-corstone1000-enable-virtio-net-support.patch		  \
     file://0043-firmware-psci-Fix-bind_smccc_features-psci-check.patch		=
  \
     file://0044-corstone1000-set-unique-GUID-for-fvp-and-mps3.patch		  \
+    file://0045-Corstone1000-Change-MMCOMM-buffer-location.patch		  \
     "
=20
 do_configure:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-Cor=
stone1000-Change-MMCOMM-buffer-location.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0045-Corstone1000-Change-MMCOMM-buffer-locatio=
n.patch
new file mode 100644
index 00000000..500db81e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-Corstone10=
00-Change-MMCOMM-buffer-location.patch
@@ -0,0 +1,47 @@
+From 7721d33dfc87b40db72cefa399c46b25b1255247 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 3 Apr 2024 14:02:42 +0100
+Subject: [PATCH] Corstone1000: Change MMCOMM buffer location
+
+MM Communicate buffer is accessed by normal world but at the moment
+it's allocated in the secure ram. This moves mm communicate buffer
+to the DDR and also fixes the capsule buffer size since it cannot be
+more than the bank size.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ configs/corstone1000_defconfig | 2 +-
+ include/configs/corstone1000.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 8770b474e2..ae164be030 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -62,7 +62,7 @@ CONFIG_NVMXIP_QSPI=3Dy
+ CONFIG_EFI_MM_COMM_TEE=3Dy
+ CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
+ CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
+-CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
++CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x81FFF000
+ CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
+ CONFIG_EFI_CAPSULE_FIRMWARE_FIT=3Dy
+ CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
+index 8622565a87..fe5b064c85 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -31,7 +31,7 @@
+ #define PREP_SEPROXY_EVT(x)	(FIELD_PREP(PREP_SEPROXY_EVT_MASK, (x)))
+=20
+ /* Size in 4KB pages of the EFI capsule buffer */
+-#define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
++#define CORSTONE1000_CAPSULE_BUFFER_SIZE	(4096) /* 16 MB */
+=20
+ /* Capsule GUID */
+ #define EFI_CORSTONE1000_CAPSULE_ID_GUID \
+--=20
+2.25.1
+
+
--=20
2.25.1


