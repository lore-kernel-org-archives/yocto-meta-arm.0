Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75DDCA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 21:27:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.248.1757712446822034425
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 14:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 240F7292B
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:27:18 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 454943F694
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:27:26 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-a: remove unreferenced patches
Date: Fri, 12 Sep 2025 17:27:25 -0400
Message-Id: <20250912212725.95249-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250912212725.95249-1-jon.mason@arm.com>
References: <20250912212725.95249-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 21:27:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6709

These patches were moved to meta-arm-bsp for tf-a recipes that have since
been removed.  Remove them now.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-handle-secure-SGI-at-EL1-for-OP-TEE.patch | 33 -------------------
 ...ot.c-ignore-TPM-error-and-continue-w.patch | 33 -------------------
 2 files changed, 66 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/000=
1-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/000=
1-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-fix-z=
ynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch b/meta-arm-bsp/recipes-bs=
p/trusted-firmware-a/files/0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-O=
P-TEE.patch
deleted file mode 100644
index 3dcc2de81c2f..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-fix-zynqmp-h=
andle-secure-SGI-at-EL1-for-OP-TEE.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f5b2fa90e0c0324f31e72429e7a7382f49a25912 Mon Sep 17 00:00:00 2001
-From: Shen Jiamin <shen_jiamin@comp.nus.edu.sg>
-Date: Wed, 24 Jul 2024 18:58:55 +0800
-Subject: [PATCH] fix(zynqmp): handle secure SGI at EL1 for OP-TEE
-
-OP-TEE requires SGIs to be handled at S-EL1. The
-Makefile was not properly setting the flag
-GICV2_G0_FOR_EL3 to 0 when the SPD is OP-TEE.
-
-Change-Id: I256afa37ddf4ad4a154c43d51807de670c3689bb
-Signed-off-by: Shen Jiamin <shen_jiamin@comp.nus.edu.sg>
----
- plat/xilinx/zynqmp/platform.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Upstream-Status: Backport
-
-diff --git a/plat/xilinx/zynqmp/platform.mk b/plat/xilinx/zynqmp/platfor=
m.mk
-index c340009d0..22eceb621 100644
---- a/plat/xilinx/zynqmp/platform.mk
-+++ b/plat/xilinx/zynqmp/platform.mk
-@@ -21,7 +21,7 @@ ENABLE_LTO :=3D 1
- EL3_EXCEPTION_HANDLING :=3D $(SDEI_SUPPORT)
-=20
- # pncd SPD requires secure SGI to be handled at EL1
--ifeq (${SPD}, $(filter ${SPD},pncd tspd))
-+ifeq (${SPD}, $(filter ${SPD},pncd tspd opteed))
- ifeq (${ZYNQMP_WDT_RESTART},1)
- $(error "Error: ZYNQMP_WDT_RESTART and SPD=3Dpncd are incompatible")
- endif
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-qemu_=
measured_boot.c-ignore-TPM-error-and-continue-w.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-a/files/0001-qemu_measured_boot.c-ignore-TPM-err=
or-and-continue-w.patch
deleted file mode 100644
index 75103332e32e..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-qemu_measure=
d_boot.c-ignore-TPM-error-and-continue-w.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b91c651e6d596cfe27448b19c8fb2f1168493827 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Mon, 15 Jan 2024 09:26:56 +0000
-Subject: [PATCH] qemu_measured_boot.c: ignore TPM error and continue wit=
h boot
-
-If firmware is configured with TPM support but it's missing
-on HW, e.g. swtpm not started and/or configured with qemu,
-then continue booting. Missing TPM is not a fatal error.
-Enables testing boot without TPM device to see that
-missing TPM is detected further up the SW stack and correct
-fallback actions are taken.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- plat/qemu/qemu/qemu_measured_boot.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/plat/qemu/qemu/qemu_measured_boot.c b/plat/qemu/qemu/qemu_m=
easured_boot.c
-index 76a4da17e6a9..ec7f44d3720d 100644
---- a/plat/qemu/qemu/qemu_measured_boot.c
-+++ b/plat/qemu/qemu/qemu_measured_boot.c
-@@ -80,7 +80,8 @@ void bl2_plat_mboot_finish(void)
- 		 * Note: In QEMU platform, OP-TEE uses nt_fw_config to get the
- 		 * secure Event Log buffer address.
- 		 */
--		panic();
-+		ERROR("Ignoring TPM errors, continuing without\n");
-+		return;
- 	}
-=20
- 	/* Copy Event Log to Non-secure memory */
--=20
2.39.5 (Apple Git-154)


