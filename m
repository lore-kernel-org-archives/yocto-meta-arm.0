Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A39C19F4F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 15:47:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19110.1714492033165915937
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 08:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3995F2F4;
	Tue, 30 Apr 2024 08:47:39 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.39.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E2413F793;
	Tue, 30 Apr 2024 08:47:11 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-a: corstone1000: Remove unused NS_SHARED_RAM region
Date: Tue, 30 Apr 2024 16:46:54 +0100
Message-Id: <20240430154654.26833-4-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430154654.26833-1-harsimransingh.tungal@arm.com>
References: <20240430154654.26833-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 15:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5654

From: Emekcan Aras <emekcan.aras@arm.com>

After enabling additional features in Trusted Services, the size of BL32
image (OP-TEE + Trusted Services SPs) is larger now. To create more space
in secure RAM for BL32 image, this patch removes NS_SHARED_RAM region whi=
ch
is not currently used by corstone1000 platform.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...0-remove-unused-NS_SHARED_RAM-region.patch | 92 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-corsto=
ne1000-remove-unused-NS_SHARED_RAM-region.patch
new file mode 100644
index 00000000..60282048
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004=
-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch
@@ -0,0 +1,92 @@
+From 19600e6718e1a5b2ac8ec27d471acdafce0e433e Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Thu, 25 Apr 2024 11:30:58 +0100
+Subject: [PATCH] fix(corstone1000): remove unused NS_SHARED_RAM region
+
+After enabling additional features in Trusted Services, the size of BL32=
 image
+(OP-TEE + Trusted Services SPs) is larger now. To create more space in s=
ecure RAM=20
+for BL32 image, this patch removes NS_SHARED_RAM region which is not cur=
rently used by
+corstone1000 platform.
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+Upstream-Status: Pending
+---
+ .../corstone1000/common/corstone1000_plat.c   |  1 -
+ .../common/include/platform_def.h             | 19 +------------------
+ 2 files changed, 1 insertion(+), 19 deletions(-)
+
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/pl=
at/arm/board/corstone1000/common/corstone1000_plat.c
+index ed3801caa..a9475859a 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
+@@ -23,7 +23,6 @@
+=20
+ const mmap_region_t plat_arm_mmap[] =3D {
+ 	ARM_MAP_SHARED_RAM,
+-	ARM_MAP_NS_SHARED_RAM,
+ 	ARM_MAP_NS_DRAM1,
+ 	CORSTONE1000_MAP_DEVICE,
+ 	CORSTONE1000_EXTERNAL_FLASH,
+diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
+index 442d187f0..18fce4486 100644
+--- a/plat/arm/board/corstone1000/common/include/platform_def.h
++++ b/plat/arm/board/corstone1000/common/include/platform_def.h
+@@ -90,9 +90,6 @@
+  *	partition size: 176 KB
+  *	content: BL2
+  *
+- * <ARM_NS_SHARED_RAM_BASE> =3D <ARM_TRUSTED_SRAM_BASE> + 1 MB
+- *	partition size: 512 KB
+- *	content: BL33 (u-boot)
+  */
+=20
+ /* DDR memory */
+@@ -117,11 +114,7 @@
+ /* The remaining Trusted SRAM is used to load the BL images */
+ #define TOTAL_SRAM_SIZE		(SZ_4M)  /* 4 MB */
+=20
+-/* Last 512KB of CVM is allocated for shared RAM as an example openAMP =
*/
+-#define ARM_NS_SHARED_RAM_SIZE	(512 * SZ_1K)
+-
+ #define PLAT_ARM_TRUSTED_SRAM_SIZE	(TOTAL_SRAM_SIZE - \
+-					 ARM_NS_SHARED_RAM_SIZE - \
+ 					 ARM_SHARED_RAM_SIZE)
+=20
+ #define PLAT_ARM_MAX_BL2_SIZE	(180 * SZ_1K)  /* 180 KB */
+@@ -160,11 +153,6 @@
+=20
+ /* NS memory */
+=20
+-/* The last 512KB of the SRAM is allocated as shared memory */
+-#define ARM_NS_SHARED_RAM_BASE	(ARM_TRUSTED_SRAM_BASE + TOTAL_SRAM_SIZE=
 - \
+-				 (PLAT_ARM_MAX_BL31_SIZE + \
+-				  PLAT_ARM_MAX_BL32_SIZE))
+-
+ #define BL33_BASE		ARM_DRAM1_BASE
+ #define PLAT_ARM_MAX_BL33_SIZE	(12 * SZ_1M)  /* 12 MB*/
+ #define BL33_LIMIT		(ARM_DRAM1_BASE + PLAT_ARM_MAX_BL33_SIZE)
+@@ -266,7 +254,7 @@
+ #define PLAT_ARM_TRUSTED_MAILBOX_BASE	ARM_TRUSTED_SRAM_BASE
+ #define PLAT_ARM_NSTIMER_FRAME_ID	U(1)
+=20
+-#define PLAT_ARM_NS_IMAGE_BASE		(ARM_NS_SHARED_RAM_BASE)
++#define PLAT_ARM_NS_IMAGE_BASE		(BL33_BASE)
+
+ #define PLAT_PHY_ADDR_SPACE_SIZE	(1ULL << 32)
+ #define PLAT_VIRT_ADDR_SPACE_SIZE	(1ULL << 32)
+@@ -295,11 +283,6 @@
+ 				ARM_SHARED_RAM_SIZE, \
+ 				MT_MEMORY | MT_RW | MT_SECURE)
+=20
+-#define ARM_MAP_NS_SHARED_RAM	MAP_REGION_FLAT( \
+-				ARM_NS_SHARED_RAM_BASE, \
+-				ARM_NS_SHARED_RAM_SIZE, \
+-				MT_MEMORY | MT_RW | MT_NS)
+-
+ #define ARM_MAP_NS_DRAM1	MAP_REGION_FLAT( \
+ 				ARM_NS_DRAM1_BASE, \
+ 				ARM_NS_DRAM1_SIZE, \
+--=20
+2.25.1
+
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index e061b944..a61c74b4 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -7,6 +7,7 @@ SRC_URI:append =3D " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
 	file://0002-fix-corstone1000-pass-spsr-value-explicitly.patch \
 	file://0003-fix-spmd-remove-EL3-interrupt-registration.patch \
+	file://0004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch \
        "
=20
 TFA_DEBUG =3D "1"
--=20
2.25.1


