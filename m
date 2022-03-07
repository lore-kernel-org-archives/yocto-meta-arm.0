Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9C6C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 15:58:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.28206.1646668697945275316
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 07:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DA9F152B
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Mar 2022 07:58:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1732E3F766
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Mar 2022 07:58:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/linux-yocto: remove upstreamed corstone1000 patch
Date: Mon,  7 Mar 2022 15:58:15 +0000
Message-Id: <20220307155815.2814399-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Mar 2022 15:58:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3120

This patch is now merged upstream in 7285daac, 5.15.25 onwards.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...rong-label-in-macro-__init_el2_gicv3.patch | 47 -------------------
 .../linux/linux-arm-platforms.inc             |  1 -
 2 files changed, 48 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0001-arm64-Correct-wrong-label-in-macro-__init_el2_gicv3.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-ar=
m64-Correct-wrong-label-in-macro-__init_el2_gicv3.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone1000/0001-arm64-Correct-wrong-label-in-m=
acro-__init_el2_gicv3.patch
deleted file mode 100644
index b0ede372..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-arm64-Cor=
rect-wrong-label-in-macro-__init_el2_gicv3.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: Backport [4f6de676d94ee8ddfc2e7e7cd935fc7cb2feff3a]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 5bad687c47aa1958042e34695824da44cf28d6ff Mon Sep 17 00:00:00 2001
-From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
-Date: Mon, 14 Feb 2022 18:56:43 +0100
-Subject: [PATCH] arm64: Correct wrong label in macro __init_el2_gicv3
-
-In commit:
-
-  114945d84a30a5fe ("arm64: Fix labels in el2_setup macros")
-
-We renamed a label from '1' to '.Lskip_gicv3_\@', but failed to update
-a branch to it, which now targets a later label also called '1'.
-
-The branch is taken rarely, when GICv3 is present but SRE is disabled
-at EL3, causing a boot-time crash.
-
-Update the caller to the new label name.
-
-Fixes: 114945d84a30 ("arm64: Fix labels in el2_setup macros")
-Cc: <stable@vger.kernel.org> # 5.12.x
-Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
-Link: https://lore.kernel.org/r/20220214175643.21931-1-joakim.tjernlund@=
infinera.com
-Reviewed-by: Mark Rutland <mark.rutland@arm.com>
-Reviewed-by: Marc Zyngier <maz@kernel.org>
-Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
----
- arch/arm64/include/asm/el2_setup.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm=
/el2_setup.h
-index 3198acb2aad8..7f3c87f7a0ce 100644
---- a/arch/arm64/include/asm/el2_setup.h
-+++ b/arch/arm64/include/asm/el2_setup.h
-@@ -106,7 +106,7 @@
- 	msr_s	SYS_ICC_SRE_EL2, x0
- 	isb					// Make sure SRE is now set
- 	mrs_s	x0, SYS_ICC_SRE_EL2		// Read SRE back,
--	tbz	x0, #0, 1f			// and check that it sticks
-+	tbz	x0, #0, .Lskip_gicv3_\@		// and check that it sticks
- 	msr_s	SYS_ICH_HCR_EL2, xzr		// Reset ICC_HCR_EL2 to defaults
- .Lskip_gicv3_\@:
- .endm
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 2ea47bc3..95ecfd53 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -39,7 +39,6 @@ LINUX_KERNEL_TYPE:corstone1000 =3D "standard"
 #disabling the rootfs cpio file compression so it is not compressed twic=
e when bundled with the kernel
 KERNEL_EXTRA_ARGS:corstone1000 +=3D "CONFIG_INITRAMFS_COMPRESSION_NONE=3D=
y"
 SRC_URI:append:corstone1000 =3D " \
-           file://0001-arm64-Correct-wrong-label-in-macro-__init_el2_gic=
v3.patch \
            file://defconfig  \
         "
=20
--=20
2.25.1


