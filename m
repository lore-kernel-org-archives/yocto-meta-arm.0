Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D671CC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 15:47:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19108.1714492031216180167
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 08:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5511C2F4;
	Tue, 30 Apr 2024 08:47:37 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.39.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12CCB3F793;
	Tue, 30 Apr 2024 08:47:09 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 2/3] arm-bsp/u-boot: corstone1000: Enable UEFI secure boot
Date: Tue, 30 Apr 2024 16:46:53 +0100
Message-Id: <20240430154654.26833-3-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430154654.26833-1-harsimransingh.tungal@arm.com>
References: <20240430154654.26833-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 15:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5653

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This change enables the UEFI secure boot and its related configurations
for corstone1000

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...corstone1000-Enable-UEFI-Secure-boot.patch | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
048-corstone1000-Enable-UEFI-Secure-boot.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 4b45fbbf..82049c43 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -63,6 +63,7 @@ SRC_URI:append =3D " \
     file://0045-efi-corstone1000-fwu-update-RPC-ABI.patch			  \
     file://0046-Corstone1000-Change-MMCOMM-buffer-location.patch		  \
     file://0047-corstone1000-dts-add-external-system-node.patch \
+    file://0048-corstone1000-Enable-UEFI-Secure-boot.patch 			  \
     "
=20
 do_configure:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-cor=
stone1000-Enable-UEFI-Secure-boot.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/corstone1000/0048-corstone1000-Enable-UEFI-Secure-boot.patch
new file mode 100644
index 00000000..1e91249a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0048-corstone10=
00-Enable-UEFI-Secure-boot.patch
@@ -0,0 +1,28 @@
+From b2ef7318686d13cfa2ac76d6f2d69c17135328df Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 11 Apr 2024 13:35:54 +0000
+Subject: [PATCH] corstone1000: Enable UEFI Secure boot
+
+Enable secure boot and related configurations for corstone1000
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ configs/corstone1000_defconfig | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 8770b474e2..0ecba096d5 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -80,3 +80,7 @@ CONFIG_EFI_SET_TIME=3Dy
+ CONFIG_EFI_GET_TIME=3Dy
+ CONFIG_VIRTIO_NET=3Dy
+ CONFIG_VIRTIO_MMIO=3Dy
++CONFIG_EFI_SECURE_BOOT=3Dy
++CONFIG_FIT_SIGNATURE=3Dy
++CONFIG_EFI_LOADER=3Dy
++CONFIG_CMD_NVEDIT_EFI=3Dy
+--=20
+2.34.1
+
--=20
2.25.1


