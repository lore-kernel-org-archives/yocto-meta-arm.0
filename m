Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEEAC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 10:16:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6650.1646129783570695125
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 02:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23177106F;
	Tue,  1 Mar 2022 02:16:23 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.20.159])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BED023F73D;
	Tue,  1 Mar 2022 02:16:21 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 1/2] arm-bsp/linux-yocto: upgrade corstone1000 to 5.15
Date: Tue,  1 Mar 2022 10:16:08 +0000
Message-Id: <20220301101609.40783-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301101609.40783-1-emekcan.aras@arm.com>
References: <20220301101609.40783-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Mar 2022 10:16:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3079

From: Emekcan Aras <Emekcan.Aras@arm.com>

Update linux-yocto to the latest version for cs1k.
There is a bug in the kernel version 5.15. Following
patch is applied to fix this issue and will be
upstreamed soon (https://lkml.org/lkml/2022/2/18/475).

Signed-off-by: Emekcan Aras emekcan.aras@arm.com
---
 .../conf/machine/include/corstone1000.inc     |    3 +-
 ...rong-label-in-macro-__init_el2_gicv3.patch |   47 +
 ...-usb-isp1760-fix-strict-typechecking.patch |  191 --
 ...0-move-to-regmap-for-register-access.patch | 2333 -----------------
 ...3-usb-isp1760-use-relaxed-primitives.patch |   64 -
 ...remove-platform-data-struct-and-code.patch |   62 -
 ...cd-refactor-mempool-config-and-setup.patch |  304 ---
 ...0006-usb-isp1760-use-dr_mode-binding.patch |   78 -
 ...-usb-isp1760-add-support-for-isp1763.patch | 1894 -------------
 ...indings-usb-nxp-isp1760-add-bindings.patch |   99 -
 ...0009-usb-isp1763-add-peripheral-mode.patch |  303 ---
 ...ccc-Add-SMCCC-TRNG-function-call-IDs.patch |   69 -
 ...smccc-Introduce-SMCCC-TRNG-framework.patch |  103 -
 ...v1.2-extended-input-output-registers.patch |  192 --
 ...A-bus-support-for-device-enumeration.patch |  423 ---
 ...a-Add-initial-Arm-FFA-driver-support.patch |  422 ---
 ...for-SMCCC-as-transport-to-ffa-driver.patch |  119 -
 ...up-in-kernel-users-of-FFA-partitions.patch |  410 ---
 ..._ffa-Add-support-for-MEM_-interfaces.patch |  409 ---
 ...ure-drivers-provide-a-probe-function.patch |   40 -
 ...ware-arm_ffa-Simplify-probe-function.patch |   38 -
 ...rmware-arm_ffa-Fix-the-comment-style.patch |   41 -
 ...ble-ffa_linux_errmap-buffer-overflow.patch |   46 -
 ...760-udc-Provide-missing-description-.patch |   41 -
 ...Fix-meaningless-check-in-isp1763_run.patch |   38 -
 ...sp1760-remove-debug-message-as-error.patch |   32 -
 ...-do-not-sleep-in-field-register-poll.patch |   58 -
 ...rk-cache-initialization-error-handli.patch |   55 -
 ...re-return-value-for-bus-change-patte.patch |   55 -
 ...-check-maxpacketsize-before-using-it.patch |   40 -
 ...0029-usb-isp1760-do-not-reset-retval.patch |   36 -
 ...0-do-not-shift-in-uninitialized-slot.patch |   61 -
 ...clean-never-read-udc_enabled-warning.patch |   52 -
 ...p1760-fix-memory-pool-initialization.patch |   36 -
 ...0033-usb-isp1760-fix-qtd-fill-length.patch |   38 -
 ...write-to-status-and-address-register.patch |   90 -
 ...isp1760-use-the-right-irq-status-bit.patch |   72 -
 ...-isp1760-otg-control-register-access.patch |  134 -
 ...A_VERSION-compatibility-checks.patch.patch |  101 -
 .../linux/files/corstone1000/defconfig        |    1 -
 .../linux/linux-arm-platforms.inc             |   38 +-
 41 files changed, 50 insertions(+), 8618 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0001-arm64-Correct-wrong-label-in-macro-__init_el2_gicv3.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0001-usb-isp1760-fix-strict-typechecking.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0002-usb-isp1760-move-to-regmap-for-register-access.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0003-usb-isp1760-use-relaxed-primitives.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0004-usb-isp1760-remove-platform-data-struct-and-code.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0005-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0006-usb-isp1760-use-dr_mode-binding.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0007-usb-isp1760-add-support-for-isp1763.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0008-dt-bindings-usb-nxp-isp1760-add-bindings.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0009-usb-isp1763-add-peripheral-mode.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0010-firmware-smccc-Add-SMCCC-TRNG-function-call-IDs.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0011-firmware-smccc-Introduce-SMCCC-TRNG-framework.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0012-arm64-smccc-Add-support-for-SMCCCv1.2-extended-input-output-register=
s.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0013-firmware-arm_ffa-Add-initial-FFA-bus-support-for-device-enumeration.=
patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0014-firmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0015-firmware-arm_ffa-Add-support-for-SMCCC-as-transport-to-ffa-driver.pa=
tch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0016-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-partitions.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0017-firmware-arm_ffa-Add-support-for-MEM_-interfaces.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0018-firmware-arm_ffa-Ensure-drivers-provide-a-probe-function.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0019-firmware-arm_ffa-Simplify-probe-function.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0020-firmware-arm_ffa-Fix-the-comment-style.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0021-firmware-arm_ffa-Fix-a-possible-ffa_linux_errmap-buffer-overflow.pat=
ch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0022-usb-isp1760-isp1760-udc-Provide-missing-description-.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0023-usb-isp1760-Fix-meaningless-check-in-isp1763_run.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0024-usb-isp1760-remove-debug-message-as-error.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0025-usb-isp1760-do-not-sleep-in-field-register-poll.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0026-usb-isp1760-rework-cache-initialization-error-handli.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0027-usb-isp1760-ignore-return-value-for-bus-change-patte.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0028-usb-isp1760-check-maxpacketsize-before-using-it.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0029-usb-isp1760-do-not-reset-retval.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0030-usb-isp1760-do-not-shift-in-uninitialized-slot.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0031-usb-isp1760-clean-never-read-udc_enabled-warning.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0032-usb-isp1760-fix-memory-pool-initialization.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0033-usb-isp1760-fix-qtd-fill-length.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0034-usb-isp1760-write-to-status-and-address-register.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0035-usb-isp1760-use-the-right-irq-status-bit.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0036-usb-isp1760-otg-control-register-access.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
0037-firmware-arm_ffa-setting-the-FFA_VERSION-compatibility-checks.patch.=
patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index f9d301e4..1af74bd0 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -45,7 +45,7 @@ EXTRA_IMAGEDEPENDS +=3D "secure-partitions"
=20
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto =3D "5.10%"
+PREFERRED_VERSION_linux-yocto =3D "5.15%"
 KERNEL_IMAGETYPE =3D "Image"
=20
 INITRAMFS_IMAGE_BUNDLE ?=3D "1"
@@ -63,3 +63,4 @@ SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
 WKS_FILE ?=3D "corstone1000-image.corstone1000.wks"
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-ar=
m64-Correct-wrong-label-in-macro-__init_el2_gicv3.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone1000/0001-arm64-Correct-wrong-label-in-m=
acro-__init_el2_gicv3.patch
new file mode 100644
index 00000000..1d205ade
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-arm64-Cor=
rect-wrong-label-in-macro-__init_el2_gicv3.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 5bad687c47aa1958042e34695824da44cf28d6ff Mon Sep 17 00:00:00 2001
+From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
+Date: Mon, 14 Feb 2022 18:56:43 +0100
+Subject: [PATCH] arm64: Correct wrong label in macro __init_el2_gicv3
+
+In commit:
+
+  114945d84a30a5fe ("arm64: Fix labels in el2_setup macros")
+
+We renamed a label from '1' to '.Lskip_gicv3_\@', but failed to update
+a branch to it, which now targets a later label also called '1'.
+
+The branch is taken rarely, when GICv3 is present but SRE is disabled
+at EL3, causing a boot-time crash.
+
+Update the caller to the new label name.
+
+Fixes: 114945d84a30 ("arm64: Fix labels in el2_setup macros")
+Cc: <stable@vger.kernel.org> # 5.12.x
+Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
+Link: https://lore.kernel.org/r/20220214175643.21931-1-joakim.tjernlund@=
infinera.com
+Reviewed-by: Mark Rutland <mark.rutland@arm.com>
+Reviewed-by: Marc Zyngier <maz@kernel.org>
+Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
+---
+ arch/arm64/include/asm/el2_setup.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm=
/el2_setup.h
+index 3198acb2aad8..7f3c87f7a0ce 100644
+--- a/arch/arm64/include/asm/el2_setup.h
++++ b/arch/arm64/include/asm/el2_setup.h
+@@ -106,7 +106,7 @@
+ 	msr_s	SYS_ICC_SRE_EL2, x0
+ 	isb					// Make sure SRE is now set
+ 	mrs_s	x0, SYS_ICC_SRE_EL2		// Read SRE back,
+-	tbz	x0, #0, 1f			// and check that it sticks
++	tbz	x0, #0, .Lskip_gicv3_\@		// and check that it sticks
+ 	msr_s	SYS_ICH_HCR_EL2, xzr		// Reset ICC_HCR_EL2 to defaults
+ .Lskip_gicv3_\@:
+ .endm
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-us=
b-isp1760-fix-strict-typechecking.patch b/meta-arm-bsp/recipes-kernel/lin=
ux/files/corstone1000/0001-usb-isp1760-fix-strict-typechecking.patch
deleted file mode 100644
index 1b1cb962..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0001-usb-isp17=
60-fix-strict-typechecking.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From abfabc8ae3bd625f57fa35d25f2435bb6465a3b1 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 13 May 2021 09:47:09 +0100
-Subject: [PATCH 01/23] usb: isp1760: fix strict typechecking
-
-There are a lot of pre-existing typechecking warnings around the
-access and assign of elements of ptd structure of __dw type.
-
-sparse: warning: invalid assignment: |=3D
-sparse:    left side has type restricted __dw
-sparse:    right side has type unsigned int
-
-or
-
-warning: restricted __dw degrades to integer
-
-or
-
-sparse: warning: incorrect type in assignment (different base types)
-sparse:    expected restricted __dw [usertype] dw4
-sparse:    got unsigned int [assigned] [usertype] usof
-
-To handle this, annotate conversions along the {TO,FROM}_DW* macros
-and some assignments and function arguments.
-
-This clean up completely all sparse warnings for this driver.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210513084717.2487366-2-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 92 ++++++++++++++++---------------
- 1 file changed, 47 insertions(+), 45 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 33ae656c4b68..0e0a4b01c710 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -66,44 +66,46 @@ struct ptd {
- #define ATL_PTD_OFFSET		0x0c00
- #define PAYLOAD_OFFSET		0x1000
-=20
--
--/* ATL */
--/* DW0 */
--#define DW0_VALID_BIT			1
--#define FROM_DW0_VALID(x)		((x) & 0x01)
--#define TO_DW0_LENGTH(x)		(((u32) x) << 3)
--#define TO_DW0_MAXPACKET(x)		(((u32) x) << 18)
--#define TO_DW0_MULTI(x)			(((u32) x) << 29)
--#define TO_DW0_ENDPOINT(x)		(((u32)	x) << 31)
-+#define TO_DW(x)	((__force __dw)x)
-+#define TO_U32(x)	((__force u32)x)
-+
-+ /* ATL */
-+ /* DW0 */
-+#define DW0_VALID_BIT			TO_DW(1)
-+#define FROM_DW0_VALID(x)		(TO_U32(x) & 0x01)
-+#define TO_DW0_LENGTH(x)		TO_DW((((u32)x) << 3))
-+#define TO_DW0_MAXPACKET(x)		TO_DW((((u32)x) << 18))
-+#define TO_DW0_MULTI(x)			TO_DW((((u32)x) << 29))
-+#define TO_DW0_ENDPOINT(x)		TO_DW((((u32)x) << 31))
- /* DW1 */
--#define TO_DW1_DEVICE_ADDR(x)		(((u32) x) << 3)
--#define TO_DW1_PID_TOKEN(x)		(((u32) x) << 10)
--#define DW1_TRANS_BULK			((u32) 2 << 12)
--#define DW1_TRANS_INT			((u32) 3 << 12)
--#define DW1_TRANS_SPLIT			((u32) 1 << 14)
--#define DW1_SE_USB_LOSPEED		((u32) 2 << 16)
--#define TO_DW1_PORT_NUM(x)		(((u32) x) << 18)
--#define TO_DW1_HUB_NUM(x)		(((u32) x) << 25)
-+#define TO_DW1_DEVICE_ADDR(x)		TO_DW((((u32)x) << 3))
-+#define TO_DW1_PID_TOKEN(x)		TO_DW((((u32)x) << 10))
-+#define DW1_TRANS_BULK			TO_DW(((u32)2 << 12))
-+#define DW1_TRANS_INT			TO_DW(((u32)3 << 12))
-+#define DW1_TRANS_SPLIT			TO_DW(((u32)1 << 14))
-+#define DW1_SE_USB_LOSPEED		TO_DW(((u32)2 << 16))
-+#define TO_DW1_PORT_NUM(x)		TO_DW((((u32)x) << 18))
-+#define TO_DW1_HUB_NUM(x)		TO_DW((((u32)x) << 25))
- /* DW2 */
--#define TO_DW2_DATA_START_ADDR(x)	(((u32) x) << 8)
--#define TO_DW2_RL(x)			((x) << 25)
--#define FROM_DW2_RL(x)			(((x) >> 25) & 0xf)
-+#define TO_DW2_DATA_START_ADDR(x)	TO_DW((((u32)x) << 8))
-+#define TO_DW2_RL(x)			TO_DW(((x) << 25))
-+#define FROM_DW2_RL(x)			((TO_U32(x) >> 25) & 0xf)
- /* DW3 */
--#define FROM_DW3_NRBYTESTRANSFERRED(x)		((x) & 0x7fff)
--#define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	((x) & 0x07ff)
--#define TO_DW3_NAKCOUNT(x)		((x) << 19)
--#define FROM_DW3_NAKCOUNT(x)		(((x) >> 19) & 0xf)
--#define TO_DW3_CERR(x)			((x) << 23)
--#define FROM_DW3_CERR(x)		(((x) >> 23) & 0x3)
--#define TO_DW3_DATA_TOGGLE(x)		((x) << 25)
--#define FROM_DW3_DATA_TOGGLE(x)		(((x) >> 25) & 0x1)
--#define TO_DW3_PING(x)			((x) << 26)
--#define FROM_DW3_PING(x)		(((x) >> 26) & 0x1)
--#define DW3_ERROR_BIT			(1 << 28)
--#define DW3_BABBLE_BIT			(1 << 29)
--#define DW3_HALT_BIT			(1 << 30)
--#define DW3_ACTIVE_BIT			(1 << 31)
--#define FROM_DW3_ACTIVE(x)		(((x) >> 31) & 0x01)
-+#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x7fff)
-+#define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	TO_U32((x) & 0x07ff)
-+#define TO_DW3_NAKCOUNT(x)		TO_DW(((x) << 19))
-+#define FROM_DW3_NAKCOUNT(x)		((TO_U32(x) >> 19) & 0xf)
-+#define TO_DW3_CERR(x)			TO_DW(((x) << 23))
-+#define FROM_DW3_CERR(x)		((TO_U32(x) >> 23) & 0x3)
-+#define TO_DW3_DATA_TOGGLE(x)		TO_DW(((x) << 25))
-+#define FROM_DW3_DATA_TOGGLE(x)		((TO_U32(x) >> 25) & 0x1)
-+#define TO_DW3_PING(x)			TO_DW(((x) << 26))
-+#define FROM_DW3_PING(x)		((TO_U32(x) >> 26) & 0x1)
-+#define DW3_ERROR_BIT			TO_DW((1 << 28))
-+#define DW3_BABBLE_BIT			TO_DW((1 << 29))
-+#define DW3_HALT_BIT			TO_DW((1 << 30))
-+#define DW3_ACTIVE_BIT			TO_DW((1 << 31))
-+#define FROM_DW3_ACTIVE(x)		((TO_U32(x) >> 31) & 0x01)
-=20
- #define INT_UNDERRUN			(1 << 2)
- #define INT_BABBLE			(1 << 1)
-@@ -292,12 +294,12 @@ static void ptd_write(void __iomem *base, u32 ptd_=
offset, u32 slot,
- 								struct ptd *ptd)
- {
- 	mem_writes8(base, ptd_offset + slot*sizeof(*ptd) + sizeof(ptd->dw0),
--						&ptd->dw1, 7*sizeof(ptd->dw1));
-+		    (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
- 	/* Make sure dw0 gets written last (after other dw's and after payload=
)
- 	   since it contains the enable bit */
- 	wmb();
--	mem_writes8(base, ptd_offset + slot*sizeof(*ptd), &ptd->dw0,
--							sizeof(ptd->dw0));
-+	mem_writes8(base, ptd_offset + slot * sizeof(*ptd),
-+		    (__force u32 *)&ptd->dw0, sizeof(ptd->dw0));
- }
-=20
-=20
-@@ -553,7 +555,7 @@ static void create_ptd_atl(struct isp1760_qh *qh,
- 	ptd->dw0 |=3D TO_DW0_ENDPOINT(usb_pipeendpoint(qtd->urb->pipe));
-=20
- 	/* DW1 */
--	ptd->dw1 =3D usb_pipeendpoint(qtd->urb->pipe) >> 1;
-+	ptd->dw1 =3D TO_DW((usb_pipeendpoint(qtd->urb->pipe) >> 1));
- 	ptd->dw1 |=3D TO_DW1_DEVICE_ADDR(usb_pipedevice(qtd->urb->pipe));
- 	ptd->dw1 |=3D TO_DW1_PID_TOKEN(qtd->packet_type);
-=20
-@@ -575,7 +577,7 @@ static void create_ptd_atl(struct isp1760_qh *qh,
- 		/* SE bit for Split INT transfers */
- 		if (usb_pipeint(qtd->urb->pipe) &&
- 				(qtd->urb->dev->speed =3D=3D USB_SPEED_LOW))
--			ptd->dw1 |=3D 2 << 16;
-+			ptd->dw1 |=3D DW1_SE_USB_LOSPEED;
-=20
- 		rl =3D 0;
- 		nak =3D 0;
-@@ -647,14 +649,14 @@ static void transform_add_int(struct isp1760_qh *q=
h,
- 		 * that number come from? 0xff seems to work fine...
- 		 */
- 		/* ptd->dw5 =3D 0x1c; */
--		ptd->dw5 =3D 0xff; /* Execute Complete Split on any uFrame */
-+		ptd->dw5 =3D TO_DW(0xff); /* Execute Complete Split on any uFrame */
- 	}
-=20
- 	period =3D period >> 1;/* Ensure equal or shorter period than requeste=
d */
- 	period &=3D 0xf8; /* Mask off too large values and lowest unused 3 bit=
s */
-=20
--	ptd->dw2 |=3D period;
--	ptd->dw4 =3D usof;
-+	ptd->dw2 |=3D TO_DW(period);
-+	ptd->dw4 =3D TO_DW(usof);
- }
-=20
- static void create_ptd_int(struct isp1760_qh *qh,
-@@ -977,10 +979,10 @@ static void schedule_ptds(struct usb_hcd *hcd)
- static int check_int_transfer(struct usb_hcd *hcd, struct ptd *ptd,
- 								struct urb *urb)
- {
--	__dw dw4;
-+	u32 dw4;
- 	int i;
-=20
--	dw4 =3D ptd->dw4;
-+	dw4 =3D TO_U32(ptd->dw4);
- 	dw4 >>=3D 8;
-=20
- 	/* FIXME: ISP1761 datasheet does not say what to do with these. Do we
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-us=
b-isp1760-move-to-regmap-for-register-access.patch b/meta-arm-bsp/recipes=
-kernel/linux/files/corstone1000/0002-usb-isp1760-move-to-regmap-for-regi=
ster-access.patch
deleted file mode 100644
index a3862968..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-usb-isp17=
60-move-to-regmap-for-register-access.patch
+++ /dev/null
@@ -1,2333 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 1da9e1c06873350c99ba49a052f92de85f2c69f2 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 13 May 2021 09:47:10 +0100
-Subject: [PATCH 02/23] usb: isp1760: move to regmap for register access
-
-Rework access to registers and memory to use regmap framework.
-No change in current feature or way of work is intended with this
-change.
-
-This will allow to reuse this driver with other IP of this family,
-for example isp1763, with little changes and effort.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210513084717.2487366-3-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/Kconfig        |   1 +
- drivers/usb/isp1760/isp1760-core.c | 239 +++++++++++++---
- drivers/usb/isp1760/isp1760-core.h |  38 ++-
- drivers/usb/isp1760/isp1760-hcd.c  | 445 +++++++++++++++--------------
- drivers/usb/isp1760/isp1760-hcd.h  |  18 +-
- drivers/usb/isp1760/isp1760-if.c   |   4 +-
- drivers/usb/isp1760/isp1760-regs.h | 338 ++++++++++------------
- drivers/usb/isp1760/isp1760-udc.c  | 227 ++++++++++-----
- drivers/usb/isp1760/isp1760-udc.h  |  10 +-
- 9 files changed, 789 insertions(+), 531 deletions(-)
-
-diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
-index b1022cc490a2..d23853f601b1 100644
---- a/drivers/usb/isp1760/Kconfig
-+++ b/drivers/usb/isp1760/Kconfig
-@@ -3,6 +3,7 @@
- config USB_ISP1760
- 	tristate "NXP ISP 1760/1761 support"
- 	depends on USB || USB_GADGET
-+	select REGMAP_MMIO
- 	help
- 	  Say Y or M here if your system as an ISP1760 USB host controller
- 	  or an ISP1761 USB dual-role controller.
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-index fdeb4cf97cc5..c79ba98df9f9 100644
---- a/drivers/usb/isp1760/isp1760-core.c
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -15,6 +15,7 @@
- #include <linux/io.h>
- #include <linux/kernel.h>
- #include <linux/module.h>
-+#include <linux/regmap.h>
- #include <linux/slab.h>
- #include <linux/usb.h>
-=20
-@@ -25,8 +26,8 @@
-=20
- static void isp1760_init_core(struct isp1760_device *isp)
- {
--	u32 otgctrl;
--	u32 hwmode;
-+	struct isp1760_hcd *hcd =3D &isp->hcd;
-+	struct isp1760_udc *udc =3D &isp->udc;
-=20
- 	/* Low-level chip reset */
- 	if (isp->rst_gpio) {
-@@ -39,24 +40,22 @@ static void isp1760_init_core(struct isp1760_device =
*isp)
- 	 * Reset the host controller, including the CPU interface
- 	 * configuration.
- 	 */
--	isp1760_write32(isp->regs, HC_RESET_REG, SW_RESET_RESET_ALL);
-+	isp1760_field_set(hcd->fields, SW_RESET_RESET_ALL);
- 	msleep(100);
-=20
- 	/* Setup HW Mode Control: This assumes a level active-low interrupt */
--	hwmode =3D HW_DATA_BUS_32BIT;
--
- 	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
--		hwmode &=3D ~HW_DATA_BUS_32BIT;
-+		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
- 	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
--		hwmode |=3D HW_ANA_DIGI_OC;
-+		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
- 	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
--		hwmode |=3D HW_DACK_POL_HIGH;
-+		isp1760_field_set(hcd->fields, HW_DACK_POL_HIGH);
- 	if (isp->devflags & ISP1760_FLAG_DREQ_POL_HIGH)
--		hwmode |=3D HW_DREQ_POL_HIGH;
-+		isp1760_field_set(hcd->fields, HW_DREQ_POL_HIGH);
- 	if (isp->devflags & ISP1760_FLAG_INTR_POL_HIGH)
--		hwmode |=3D HW_INTR_HIGH_ACT;
-+		isp1760_field_set(hcd->fields, HW_INTR_HIGH_ACT);
- 	if (isp->devflags & ISP1760_FLAG_INTR_EDGE_TRIG)
--		hwmode |=3D HW_INTR_EDGE_TRIG;
-+		isp1760_field_set(hcd->fields, HW_INTR_EDGE_TRIG);
-=20
- 	/*
- 	 * The ISP1761 has a dedicated DC IRQ line but supports sharing the HC
-@@ -65,18 +64,10 @@ static void isp1760_init_core(struct isp1760_device =
*isp)
- 	 * spurious interrupts during HCD registration.
- 	 */
- 	if (isp->devflags & ISP1760_FLAG_ISP1761) {
--		isp1760_write32(isp->regs, DC_MODE, 0);
--		hwmode |=3D HW_COMN_IRQ;
-+		isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
-+		isp1760_field_set(hcd->fields, HW_COMN_IRQ);
- 	}
-=20
--	/*
--	 * We have to set this first in case we're in 16-bit mode.
--	 * Write it twice to ensure correct upper bits if switching
--	 * to 16-bit mode.
--	 */
--	isp1760_write32(isp->regs, HC_HW_MODE_CTRL, hwmode);
--	isp1760_write32(isp->regs, HC_HW_MODE_CTRL, hwmode);
--
- 	/*
- 	 * PORT 1 Control register of the ISP1760 is the OTG control register
- 	 * on ISP1761.
-@@ -85,14 +76,15 @@ static void isp1760_init_core(struct isp1760_device =
*isp)
- 	 * when OTG is requested.
- 	 */
- 	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
--	    (isp->devflags & ISP1760_FLAG_OTG_EN))
--		otgctrl =3D ((HW_DM_PULLDOWN | HW_DP_PULLDOWN) << 16)
--			| HW_OTG_DISABLE;
--	else
--		otgctrl =3D (HW_SW_SEL_HC_DC << 16)
--			| (HW_VBUS_DRV | HW_SEL_CP_EXT);
--
--	isp1760_write32(isp->regs, HC_PORT1_CTRL, otgctrl);
-+	    (isp->devflags & ISP1760_FLAG_OTG_EN)) {
-+		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
-+		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
-+		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
-+	} else {
-+		isp1760_field_set(hcd->fields, HW_SW_SEL_HC_DC);
-+		isp1760_field_set(hcd->fields, HW_VBUS_DRV);
-+		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
-+	}
-=20
- 	dev_info(isp->dev, "bus width: %u, oc: %s\n",
- 		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
-@@ -101,16 +93,158 @@ static void isp1760_init_core(struct isp1760_devic=
e *isp)
-=20
- void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
- {
--	isp1760_write32(isp->regs, HW_OTG_CTRL_SET,
--			enable ? HW_DP_PULLUP : HW_DP_PULLUP << 16);
-+	struct isp1760_udc *udc =3D &isp->udc;
-+
-+	if (enable)
-+		isp1760_field_set(udc->fields, HW_DP_PULLUP);
-+	else
-+		isp1760_field_set(udc->fields, HW_DP_PULLUP_CLEAR);
- }
-=20
-+static const struct regmap_range isp176x_hc_volatile_ranges[] =3D {
-+	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
-+	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
-+	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_ATL_IRQ_MASK_AND),
-+};
-+
-+static const struct regmap_access_table isp176x_hc_volatile_table =3D {
-+	.yes_ranges	=3D isp176x_hc_volatile_ranges,
-+	.n_yes_ranges	=3D ARRAY_SIZE(isp176x_hc_volatile_ranges),
-+};
-+
-+static struct regmap_config isp1760_hc_regmap_conf =3D {
-+	.name =3D "isp1760-hc",
-+	.reg_bits =3D 16,
-+	.reg_stride =3D 4,
-+	.val_bits =3D 32,
-+	.fast_io =3D true,
-+	.max_register =3D ISP176x_HC_MEMORY,
-+	.volatile_table =3D &isp176x_hc_volatile_table,
-+};
-+
-+static const struct reg_field isp1760_hc_reg_fields[] =3D {
-+	[HCS_PPC]		=3D REG_FIELD(ISP176x_HC_HCSPARAMS, 4, 4),
-+	[HCS_N_PORTS]		=3D REG_FIELD(ISP176x_HC_HCSPARAMS, 0, 3),
-+	[HCC_ISOC_CACHE]	=3D REG_FIELD(ISP176x_HC_HCCPARAMS, 7, 7),
-+	[HCC_ISOC_THRES]	=3D REG_FIELD(ISP176x_HC_HCCPARAMS, 4, 6),
-+	[CMD_LRESET]		=3D REG_FIELD(ISP176x_HC_USBCMD, 7, 7),
-+	[CMD_RESET]		=3D REG_FIELD(ISP176x_HC_USBCMD, 1, 1),
-+	[CMD_RUN]		=3D REG_FIELD(ISP176x_HC_USBCMD, 0, 0),
-+	[STS_PCD]		=3D REG_FIELD(ISP176x_HC_USBSTS, 2, 2),
-+	[HC_FRINDEX]		=3D REG_FIELD(ISP176x_HC_FRINDEX, 0, 13),
-+	[FLAG_CF]		=3D REG_FIELD(ISP176x_HC_CONFIGFLAG, 0, 0),
-+	[PORT_OWNER]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 13, 13),
-+	[PORT_POWER]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 12, 12),
-+	[PORT_LSTATUS]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 10, 11),
-+	[PORT_RESET]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 8, 8),
-+	[PORT_SUSPEND]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 7, 7),
-+	[PORT_RESUME]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 6, 6),
-+	[PORT_PE]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 2, 2),
-+	[PORT_CSC]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 1, 1),
-+	[PORT_CONNECT]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 0, 0),
-+	[ALL_ATX_RESET]		=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 31, 31),
-+	[HW_ANA_DIGI_OC]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 15, 15),
-+	[HW_COMN_IRQ]		=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 10, 10),
-+	[HW_DATA_BUS_WIDTH]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 8, 8),
-+	[HW_DACK_POL_HIGH]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 6, 6),
-+	[HW_DREQ_POL_HIGH]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 5, 5),
-+	[HW_INTR_HIGH_ACT]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 2, 2),
-+	[HW_INTR_EDGE_TRIG]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 1, 1),
-+	[HW_GLOBAL_INTR_EN]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 0, 0),
-+	[SW_RESET_RESET_ALL]	=3D REG_FIELD(ISP176x_HC_RESET, 0, 0),
-+	[INT_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
-+	[ATL_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
-+	[MEM_BANK_SEL]		=3D REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
-+	[MEM_START_ADDR]	=3D REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
-+	[HC_INT_ENABLE]		=3D REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 8),
-+};
-+
-+static const struct regmap_range isp176x_dc_volatile_ranges[] =3D {
-+	regmap_reg_range(ISP176x_DC_EPMAXPKTSZ, ISP176x_DC_EPTYPE),
-+	regmap_reg_range(ISP176x_DC_BUFLEN, ISP176x_DC_EPINDEX),
-+	regmap_reg_range(ISP1761_DC_OTG_CTRL_SET, ISP1761_DC_OTG_CTRL_CLEAR),
-+};
-+
-+static const struct regmap_access_table isp176x_dc_volatile_table =3D {
-+	.yes_ranges	=3D isp176x_dc_volatile_ranges,
-+	.n_yes_ranges	=3D ARRAY_SIZE(isp176x_dc_volatile_ranges),
-+};
-+
-+static struct regmap_config isp1761_dc_regmap_conf =3D {
-+	.name =3D "isp1761-dc",
-+	.reg_bits =3D 16,
-+	.reg_stride =3D 4,
-+	.val_bits =3D 32,
-+	.fast_io =3D true,
-+	.max_register =3D ISP1761_DC_OTG_CTRL_CLEAR,
-+	.volatile_table =3D &isp176x_dc_volatile_table,
-+};
-+
-+static const struct reg_field isp1761_dc_reg_fields[] =3D {
-+	[DC_DEVEN]		=3D REG_FIELD(ISP176x_DC_ADDRESS, 7, 7),
-+	[DC_DEVADDR]		=3D REG_FIELD(ISP176x_DC_ADDRESS, 0, 6),
-+	[DC_VBUSSTAT]		=3D REG_FIELD(ISP176x_DC_MODE, 8, 8),
-+	[DC_SFRESET]		=3D REG_FIELD(ISP176x_DC_MODE, 4, 4),
-+	[DC_GLINTENA]		=3D REG_FIELD(ISP176x_DC_MODE, 3, 3),
-+	[DC_CDBGMOD_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 6, 6),
-+	[DC_DDBGMODIN_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 4, 4),
-+	[DC_DDBGMODOUT_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 2, 2),
-+	[DC_INTPOL]		=3D REG_FIELD(ISP176x_DC_INTCONF, 0, 0),
-+	[DC_IEPRXTX_7]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 25, 25),
-+	[DC_IEPRXTX_6]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 23, 23),
-+	[DC_IEPRXTX_5]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 21, 21),
-+	[DC_IEPRXTX_4]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 19, 19),
-+	[DC_IEPRXTX_3]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 17, 17),
-+	[DC_IEPRXTX_2]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 15, 15),
-+	[DC_IEPRXTX_1]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 13, 13),
-+	[DC_IEPRXTX_0]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 11, 11),
-+	[DC_IEP0SETUP]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 8, 8),
-+	[DC_IEVBUS]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 7, 7),
-+	[DC_IEHS_STA]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 5, 5),
-+	[DC_IERESM]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 4, 4),
-+	[DC_IESUSP]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 3, 3),
-+	[DC_IEBRST]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 0, 0),
-+	[DC_EP0SETUP]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 5, 5),
-+	[DC_ENDPIDX]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 1, 4),
-+	[DC_EPDIR]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 0, 0),
-+	[DC_CLBUF]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 4, 4),
-+	[DC_VENDP]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 3, 3),
-+	[DC_DSEN]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 2, 2),
-+	[DC_STATUS]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 1, 1),
-+	[DC_STALL]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 0, 0),
-+	[DC_BUFLEN]		=3D REG_FIELD(ISP176x_DC_BUFLEN, 0, 15),
-+	[DC_FFOSZ]		=3D REG_FIELD(ISP176x_DC_EPMAXPKTSZ, 0, 10),
-+	[DC_EPENABLE]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 3, 3),
-+	[DC_ENDPTYP]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
-+	[DC_UFRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
-+	[DC_FRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
-+	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
-+	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
-+	[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
-+	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
-+	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
-+	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
-+	[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
-+	[HW_OTG_DISABLE_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10=
),
-+	[HW_SW_SEL_HC_DC_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7)=
,
-+	[HW_VBUS_DRV_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
-+	[HW_SEL_CP_EXT_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
-+	[HW_DM_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
-+	[HW_DP_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
-+	[HW_DP_PULLUP_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
-+};
-+
- int isp1760_register(struct resource *mem, int irq, unsigned long irqfl=
ags,
- 		     struct device *dev, unsigned int devflags)
- {
- 	struct isp1760_device *isp;
-+	struct isp1760_hcd *hcd;
-+	struct isp1760_udc *udc;
- 	bool udc_disabled =3D !(devflags & ISP1760_FLAG_ISP1761);
-+	struct regmap_field *f;
-+	void __iomem *base;
- 	int ret;
-+	int i;
-=20
- 	/*
- 	 * If neither the HCD not the UDC is enabled return an error, as no
-@@ -126,19 +260,52 @@ int isp1760_register(struct resource *mem, int irq=
, unsigned long irqflags,
-=20
- 	isp->dev =3D dev;
- 	isp->devflags =3D devflags;
-+	hcd =3D &isp->hcd;
-+	udc =3D &isp->udc;
-+
-+	if (devflags & ISP1760_FLAG_BUS_WIDTH_16) {
-+		isp1760_hc_regmap_conf.val_bits =3D 16;
-+		isp1761_dc_regmap_conf.val_bits =3D 16;
-+	}
-=20
- 	isp->rst_gpio =3D devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
- 	if (IS_ERR(isp->rst_gpio))
- 		return PTR_ERR(isp->rst_gpio);
-=20
--	isp->regs =3D devm_ioremap_resource(dev, mem);
--	if (IS_ERR(isp->regs))
--		return PTR_ERR(isp->regs);
-+	hcd->base =3D devm_ioremap_resource(dev, mem);
-+	if (IS_ERR(hcd->base))
-+		return PTR_ERR(hcd->base);
-+
-+	hcd->regs =3D devm_regmap_init_mmio(dev, base, &isp1760_hc_regmap_conf=
);
-+	if (IS_ERR(hcd->regs))
-+		return PTR_ERR(hcd->regs);
-+
-+	for (i =3D 0; i < HC_FIELD_MAX; i++) {
-+		f =3D devm_regmap_field_alloc(dev, hcd->regs,
-+					    isp1760_hc_reg_fields[i]);
-+		if (IS_ERR(f))
-+			return PTR_ERR(f);
-+
-+		hcd->fields[i] =3D f;
-+	}
-+
-+	udc->regs =3D devm_regmap_init_mmio(dev, base, &isp1761_dc_regmap_conf=
);
-+	if (IS_ERR(udc->regs))
-+		return PTR_ERR(udc->regs);
-+
-+	for (i =3D 0; i < DC_FIELD_MAX; i++) {
-+		f =3D devm_regmap_field_alloc(dev, udc->regs,
-+					    isp1761_dc_reg_fields[i]);
-+		if (IS_ERR(f))
-+			return PTR_ERR(f);
-+
-+		udc->fields[i] =3D f;
-+	}
-=20
- 	isp1760_init_core(isp);
-=20
- 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
--		ret =3D isp1760_hcd_register(&isp->hcd, isp->regs, mem, irq,
-+		ret =3D isp1760_hcd_register(hcd, mem, irq,
- 					   irqflags | IRQF_SHARED, dev);
- 		if (ret < 0)
- 			return ret;
-@@ -147,7 +314,7 @@ int isp1760_register(struct resource *mem, int irq, =
unsigned long irqflags,
- 	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && !udc_disabled) {
- 		ret =3D isp1760_udc_register(isp, irq, irqflags);
- 		if (ret < 0) {
--			isp1760_hcd_unregister(&isp->hcd);
-+			isp1760_hcd_unregister(hcd);
- 			return ret;
- 		}
- 	}
-diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/is=
p1760-core.h
-index d9a0a4cc467c..8fec6395f19f 100644
---- a/drivers/usb/isp1760/isp1760-core.h
-+++ b/drivers/usb/isp1760/isp1760-core.h
-@@ -14,6 +14,7 @@
- #define _ISP1760_CORE_H_
-=20
- #include <linux/ioport.h>
-+#include <linux/regmap.h>
-=20
- #include "isp1760-hcd.h"
- #include "isp1760-udc.h"
-@@ -38,7 +39,6 @@ struct gpio_desc;
- struct isp1760_device {
- 	struct device *dev;
-=20
--	void __iomem *regs;
- 	unsigned int devflags;
- 	struct gpio_desc *rst_gpio;
-=20
-@@ -52,14 +52,42 @@ void isp1760_unregister(struct device *dev);
-=20
- void isp1760_set_pullup(struct isp1760_device *isp, bool enable);
-=20
--static inline u32 isp1760_read32(void __iomem *base, u32 reg)
-+static inline u32 isp1760_field_read(struct regmap_field **fields, u32 =
field)
- {
--	return readl(base + reg);
-+	unsigned int val;
-+
-+	regmap_field_read(fields[field], &val);
-+
-+	return val;
-+}
-+
-+static inline void isp1760_field_write(struct regmap_field **fields, u3=
2 field,
-+				       u32 val)
-+{
-+	regmap_field_write(fields[field], val);
-+}
-+
-+static inline void isp1760_field_set(struct regmap_field **fields, u32 =
field)
-+{
-+	isp1760_field_write(fields, field, 0xFFFFFFFF);
- }
-=20
--static inline void isp1760_write32(void __iomem *base, u32 reg, u32 val=
)
-+static inline void isp1760_field_clear(struct regmap_field **fields, u3=
2 field)
- {
--	writel(val, base + reg);
-+	isp1760_field_write(fields, field, 0);
- }
-=20
-+static inline u32 isp1760_reg_read(struct regmap *regs, u32 reg)
-+{
-+	unsigned int val;
-+
-+	regmap_read(regs, reg, &val);
-+
-+	return val;
-+}
-+
-+static inline void isp1760_reg_write(struct regmap *regs, u32 reg, u32 =
val)
-+{
-+	regmap_write(regs, reg, val);
-+}
- #endif
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 0e0a4b01c710..20d142140574 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -66,6 +66,11 @@ struct ptd {
- #define ATL_PTD_OFFSET		0x0c00
- #define PAYLOAD_OFFSET		0x1000
-=20
-+#define ISP_BANK_0		0x00
-+#define ISP_BANK_1		0x01
-+#define ISP_BANK_2		0x02
-+#define ISP_BANK_3		0x03
-+
- #define TO_DW(x)	((__force __dw)x)
- #define TO_U32(x)	((__force u32)x)
-=20
-@@ -161,16 +166,59 @@ struct urb_listitem {
- };
-=20
- /*
-- * Access functions for isp176x registers (addresses 0..0x03FF).
-+ * Access functions for isp176x registers regmap fields
-  */
--static u32 reg_read32(void __iomem *base, u32 reg)
-+static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	return isp1760_field_read(priv->fields, field);
-+}
-+
-+static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	isp1760_field_write(priv->fields, field, val);
-+}
-+
-+static void isp1760_hcd_set(struct usb_hcd *hcd, u32 field)
-+{
-+	isp1760_hcd_write(hcd, field, 0xFFFFFFFF);
-+}
-+
-+static void isp1760_hcd_clear(struct usb_hcd *hcd, u32 field)
-+{
-+	isp1760_hcd_write(hcd, field, 0);
-+}
-+
-+static int isp1760_hcd_set_poll_timeout(struct usb_hcd *hcd, u32 field,
-+					u32 timeout_us)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	unsigned int val;
-+
-+	isp1760_hcd_set(hcd, field);
-+
-+	return regmap_field_read_poll_timeout(priv->fields[field], val, 1, 1,
-+					      timeout_us);
-+}
-+
-+static int isp1760_hcd_clear_poll_timeout(struct usb_hcd *hcd, u32 fiel=
d,
-+					  u32 timeout_us)
- {
--	return isp1760_read32(base, reg);
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	unsigned int val;
-+
-+	isp1760_hcd_clear(hcd, field);
-+
-+	return regmap_field_read_poll_timeout(priv->fields[field], val, 0, 1,
-+					      timeout_us);
- }
-=20
--static void reg_write32(void __iomem *base, u32 reg, u32 val)
-+static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
- {
--	isp1760_write32(base, reg, val);
-+	return !!isp1760_hcd_read(hcd, field);
- }
-=20
- /*
-@@ -233,12 +281,15 @@ static void bank_reads8(void __iomem *src_base, u3=
2 src_offset, u32 bank_addr,
- 	}
- }
-=20
--static void mem_reads8(void __iomem *src_base, u32 src_offset, void *ds=
t,
--								u32 bytes)
-+static void mem_reads8(struct usb_hcd *hcd, void __iomem *src_base,
-+		       u32 src_offset, void *dst, u32 bytes)
- {
--	reg_write32(src_base, HC_MEMORY_REG, src_offset + ISP_BANK(0));
-+	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
-+	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
-+
- 	ndelay(90);
--	bank_reads8(src_base, src_offset, ISP_BANK(0), dst, bytes);
-+
-+	bank_reads8(src_base, src_offset, ISP_BANK_0, dst, bytes);
- }
-=20
- static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
-@@ -280,14 +331,15 @@ static void mem_writes8(void __iomem *dst_base, u3=
2 dst_offset,
-  * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFSET,
-  * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32.
-  */
--static void ptd_read(void __iomem *base, u32 ptd_offset, u32 slot,
--								struct ptd *ptd)
-+static void ptd_read(struct usb_hcd *hcd, void __iomem *base,
-+		     u32 ptd_offset, u32 slot, struct ptd *ptd)
- {
--	reg_write32(base, HC_MEMORY_REG,
--				ISP_BANK(0) + ptd_offset + slot*sizeof(*ptd));
-+	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
-+	isp1760_hcd_write(hcd, MEM_START_ADDR,
-+			  ptd_offset + slot * sizeof(*ptd));
- 	ndelay(90);
--	bank_reads8(base, ptd_offset + slot*sizeof(*ptd), ISP_BANK(0),
--						(void *) ptd, sizeof(*ptd));
-+	bank_reads8(base, ptd_offset + slot * sizeof(*ptd), ISP_BANK_0,
-+		    (void *)ptd, sizeof(*ptd));
- }
-=20
- static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
-@@ -379,34 +431,15 @@ static void free_mem(struct usb_hcd *hcd, struct i=
sp1760_qtd *qtd)
- 	qtd->payload_addr =3D 0;
- }
-=20
--static int handshake(struct usb_hcd *hcd, u32 reg,
--		      u32 mask, u32 done, int usec)
--{
--	u32 result;
--	int ret;
--
--	ret =3D readl_poll_timeout_atomic(hcd->regs + reg, result,
--					((result & mask) =3D=3D done ||
--					 result =3D=3D U32_MAX), 1, usec);
--	if (result =3D=3D U32_MAX)
--		return -ENODEV;
--
--	return ret;
--}
--
- /* reset a non-running (STS_HALT =3D=3D 1) controller */
- static int ehci_reset(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-=20
--	u32 command =3D reg_read32(hcd->regs, HC_USBCMD);
--
--	command |=3D CMD_RESET;
--	reg_write32(hcd->regs, HC_USBCMD, command);
- 	hcd->state =3D HC_STATE_HALT;
- 	priv->next_statechange =3D jiffies;
-=20
--	return handshake(hcd, HC_USBCMD, CMD_RESET, 0, 250 * 1000);
-+	return isp1760_hcd_set_poll_timeout(hcd, CMD_RESET, 250 * 1000);
- }
-=20
- static struct isp1760_qh *qh_alloc(gfp_t flags)
-@@ -434,8 +467,10 @@ static void qh_free(struct isp1760_qh *qh)
- /* one-time init, only for memory state */
- static int priv_init(struct usb_hcd *hcd)
- {
--	struct isp1760_hcd		*priv =3D hcd_to_priv(hcd);
--	u32			hcc_params;
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 isoc_cache;
-+	u32 isoc_thres;
-+
- 	int i;
-=20
- 	spin_lock_init(&priv->lock);
-@@ -450,12 +485,14 @@ static int priv_init(struct usb_hcd *hcd)
- 	priv->periodic_size =3D DEFAULT_I_TDPS;
-=20
- 	/* controllers may cache some of the periodic schedule ... */
--	hcc_params =3D reg_read32(hcd->regs, HC_HCCPARAMS);
-+	isoc_cache =3D isp1760_hcd_read(hcd, HCC_ISOC_CACHE);
-+	isoc_thres =3D isp1760_hcd_read(hcd, HCC_ISOC_THRES);
-+
- 	/* full frame cache */
--	if (HCC_ISOC_CACHE(hcc_params))
-+	if (isoc_cache)
- 		priv->i_thresh =3D 8;
- 	else /* N microframes cached */
--		priv->i_thresh =3D 2 + HCC_ISOC_THRES(hcc_params);
-+		priv->i_thresh =3D 2 + isoc_thres;
-=20
- 	return 0;
- }
-@@ -464,12 +501,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	int result;
--	u32 scratch, hwmode;
-+	u32 scratch;
-+
-+	isp1760_reg_write(priv->regs, ISP176x_HC_SCRATCH, 0xdeadbabe);
-=20
--	reg_write32(hcd->regs, HC_SCRATCH_REG, 0xdeadbabe);
- 	/* Change bus pattern */
--	scratch =3D reg_read32(hcd->regs, HC_CHIP_ID_REG);
--	scratch =3D reg_read32(hcd->regs, HC_SCRATCH_REG);
-+	scratch =3D isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
-+	scratch =3D isp1760_reg_read(priv->regs, ISP176x_HC_SCRATCH);
- 	if (scratch !=3D 0xdeadbabe) {
- 		dev_err(hcd->self.controller, "Scratch test failed.\n");
- 		return -ENODEV;
-@@ -483,10 +521,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
- 	 * the host controller through the EHCI USB Command register. The devi=
ce
- 	 * has been reset in core code anyway, so this shouldn't matter.
- 	 */
--	reg_write32(hcd->regs, HC_BUFFER_STATUS_REG, 0);
--	reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
--	reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
--	reg_write32(hcd->regs, HC_ISO_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_BUFFER_STATUS, 0);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
-+			  NO_TRANSFER_ACTIVE);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
-+			  NO_TRANSFER_ACTIVE);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP,
-+			  NO_TRANSFER_ACTIVE);
-=20
- 	result =3D ehci_reset(hcd);
- 	if (result)
-@@ -495,14 +536,11 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
- 	/* Step 11 passed */
-=20
- 	/* ATL reset */
--	hwmode =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL) & ~ALL_ATX_RESET;
--	reg_write32(hcd->regs, HC_HW_MODE_CTRL, hwmode | ALL_ATX_RESET);
-+	isp1760_hcd_set(hcd, ALL_ATX_RESET);
- 	mdelay(10);
--	reg_write32(hcd->regs, HC_HW_MODE_CTRL, hwmode);
-+	isp1760_hcd_clear(hcd, ALL_ATX_RESET);
-=20
--	reg_write32(hcd->regs, HC_INTERRUPT_ENABLE, INTERRUPT_ENABLE_MASK);
--
--	priv->hcs_params =3D reg_read32(hcd->regs, HC_HCSPARAMS);
-+	isp1760_hcd_set(hcd, HC_INT_ENABLE);
-=20
- 	return priv_init(hcd);
- }
-@@ -732,12 +770,12 @@ static void start_bus_transfer(struct usb_hcd *hcd=
, u32 ptd_offset, int slot,
-=20
- 	/* Make sure done map has not triggered from some unlinked transfer */
- 	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
--		priv->atl_done_map |=3D reg_read32(hcd->regs,
--						HC_ATL_PTD_DONEMAP_REG);
-+		priv->atl_done_map |=3D isp1760_reg_read(priv->regs,
-+						ISP176x_HC_ATL_PTD_DONEMAP);
- 		priv->atl_done_map &=3D ~(1 << slot);
- 	} else {
--		priv->int_done_map |=3D reg_read32(hcd->regs,
--						HC_INT_PTD_DONEMAP_REG);
-+		priv->int_done_map |=3D isp1760_reg_read(priv->regs,
-+					       ISP176x_HC_INT_PTD_DONEMAP);
- 		priv->int_done_map &=3D ~(1 << slot);
- 	}
-=20
-@@ -746,16 +784,20 @@ static void start_bus_transfer(struct usb_hcd *hcd=
, u32 ptd_offset, int slot,
- 	slots[slot].timestamp =3D jiffies;
- 	slots[slot].qtd =3D qtd;
- 	slots[slot].qh =3D qh;
--	ptd_write(hcd->regs, ptd_offset, slot, ptd);
-+	ptd_write(priv->base, ptd_offset, slot, ptd);
-=20
- 	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
--		skip_map =3D reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
-+		skip_map =3D isp1760_reg_read(priv->regs,
-+					    ISP176x_HC_ATL_PTD_SKIPMAP);
- 		skip_map &=3D ~(1 << qh->slot);
--		reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, skip_map);
-+		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
-+				  skip_map);
- 	} else {
--		skip_map =3D reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
-+		skip_map =3D isp1760_reg_read(priv->regs,
-+					    ISP176x_HC_INT_PTD_SKIPMAP);
- 		skip_map &=3D ~(1 << qh->slot);
--		reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, skip_map);
-+		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
-+				  skip_map);
- 	}
- }
-=20
-@@ -768,9 +810,10 @@ static int is_short_bulk(struct isp1760_qtd *qtd)
- static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
- 						struct list_head *urb_list)
- {
--	int last_qtd;
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	struct isp1760_qtd *qtd, *qtd_next;
- 	struct urb_listitem *urb_listitem;
-+	int last_qtd;
-=20
- 	list_for_each_entry_safe(qtd, qtd_next, &qh->qtd_list, qtd_list) {
- 		if (qtd->status < QTD_XFER_COMPLETE)
-@@ -785,9 +828,10 @@ static void collect_qtds(struct usb_hcd *hcd, struc=
t isp1760_qh *qh,
- 			if (qtd->actual_length) {
- 				switch (qtd->packet_type) {
- 				case IN_PID:
--					mem_reads8(hcd->regs, qtd->payload_addr,
--							qtd->data_buffer,
--							qtd->actual_length);
-+					mem_reads8(hcd, priv->base,
-+						   qtd->payload_addr,
-+						   qtd->data_buffer,
-+						   qtd->actual_length);
- 					fallthrough;
- 				case OUT_PID:
- 					qtd->urb->actual_length +=3D
-@@ -875,8 +919,8 @@ static void enqueue_qtds(struct usb_hcd *hcd, struct=
 isp1760_qh *qh)
- 			if ((qtd->length) &&
- 			    ((qtd->packet_type =3D=3D SETUP_PID) ||
- 			     (qtd->packet_type =3D=3D OUT_PID))) {
--				mem_writes8(hcd->regs, qtd->payload_addr,
--						qtd->data_buffer, qtd->length);
-+				mem_writes8(priv->base, qtd->payload_addr,
-+					    qtd->data_buffer, qtd->length);
- 			}
-=20
- 			qtd->status =3D QTD_PAYLOAD_ALLOC;
-@@ -1076,9 +1120,9 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 	int modified;
- 	int skip_map;
-=20
--	skip_map =3D reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
-+	skip_map =3D isp1760_reg_read(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP);
- 	priv->int_done_map &=3D ~skip_map;
--	skip_map =3D reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
-+	skip_map =3D isp1760_reg_read(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP);
- 	priv->atl_done_map &=3D ~skip_map;
-=20
- 	modified =3D priv->int_done_map || priv->atl_done_map;
-@@ -1096,7 +1140,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 				continue;
- 			}
- 			ptd_offset =3D INT_PTD_OFFSET;
--			ptd_read(hcd->regs, INT_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, priv->base, INT_PTD_OFFSET, slot, &ptd);
- 			state =3D check_int_transfer(hcd, &ptd,
- 							slots[slot].qtd->urb);
- 		} else {
-@@ -1111,7 +1155,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 				continue;
- 			}
- 			ptd_offset =3D ATL_PTD_OFFSET;
--			ptd_read(hcd->regs, ATL_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
- 			state =3D check_atl_transfer(hcd, &ptd,
- 							slots[slot].qtd->urb);
- 		}
-@@ -1136,7 +1180,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
-=20
- 			qtd->status =3D QTD_XFER_COMPLETE;
- 			if (list_is_last(&qtd->qtd_list, &qh->qtd_list) ||
--							is_short_bulk(qtd))
-+			    is_short_bulk(qtd))
- 				qtd =3D NULL;
- 			else
- 				qtd =3D list_entry(qtd->qtd_list.next,
-@@ -1212,13 +1256,15 @@ static irqreturn_t isp1760_irq(struct usb_hcd *h=
cd)
- 	if (!(hcd->state & HC_STATE_RUNNING))
- 		goto leave;
-=20
--	imask =3D reg_read32(hcd->regs, HC_INTERRUPT_REG);
-+	imask =3D isp1760_reg_read(priv->regs, ISP176x_HC_INTERRUPT);
- 	if (unlikely(!imask))
- 		goto leave;
--	reg_write32(hcd->regs, HC_INTERRUPT_REG, imask); /* Clear */
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INTERRUPT, imask); /* Clear *=
/
-=20
--	priv->int_done_map |=3D reg_read32(hcd->regs, HC_INT_PTD_DONEMAP_REG);
--	priv->atl_done_map |=3D reg_read32(hcd->regs, HC_ATL_PTD_DONEMAP_REG);
-+	priv->int_done_map |=3D isp1760_reg_read(priv->regs,
-+					       ISP176x_HC_INT_PTD_DONEMAP);
-+	priv->atl_done_map |=3D isp1760_reg_read(priv->regs,
-+					       ISP176x_HC_ATL_PTD_DONEMAP);
-=20
- 	handle_done_ptds(hcd);
-=20
-@@ -1273,7 +1319,7 @@ static void errata2_function(struct timer_list *un=
used)
- 		if (priv->atl_slots[slot].qh && time_after(jiffies,
- 					priv->atl_slots[slot].timestamp +
- 					msecs_to_jiffies(SLOT_TIMEOUT))) {
--			ptd_read(hcd->regs, ATL_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
- 			if (!FROM_DW0_VALID(ptd.dw0) &&
- 					!FROM_DW3_ACTIVE(ptd.dw3))
- 				priv->atl_done_map |=3D 1 << slot;
-@@ -1290,9 +1336,8 @@ static void errata2_function(struct timer_list *un=
used)
-=20
- static int isp1760_run(struct usb_hcd *hcd)
- {
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	int retval;
--	u32 temp;
--	u32 command;
- 	u32 chipid;
-=20
- 	hcd->uses_new_polling =3D 1;
-@@ -1300,23 +1345,20 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	hcd->state =3D HC_STATE_RUNNING;
-=20
- 	/* Set PTD interrupt AND & OR maps */
--	reg_write32(hcd->regs, HC_ATL_IRQ_MASK_AND_REG, 0);
--	reg_write32(hcd->regs, HC_ATL_IRQ_MASK_OR_REG, 0xffffffff);
--	reg_write32(hcd->regs, HC_INT_IRQ_MASK_AND_REG, 0);
--	reg_write32(hcd->regs, HC_INT_IRQ_MASK_OR_REG, 0xffffffff);
--	reg_write32(hcd->regs, HC_ISO_IRQ_MASK_AND_REG, 0);
--	reg_write32(hcd->regs, HC_ISO_IRQ_MASK_OR_REG, 0xffffffff);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_AND, 0);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_OR, 0xffffffff);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_AND, 0);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_OR, 0xffffffff);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_AND, 0);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_OR, 0xffffffff);
- 	/* step 23 passed */
-=20
--	temp =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL);
--	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp | HW_GLOBAL_INTR_EN);
-+	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
-=20
--	command =3D reg_read32(hcd->regs, HC_USBCMD);
--	command &=3D ~(CMD_LRESET|CMD_RESET);
--	command |=3D CMD_RUN;
--	reg_write32(hcd->regs, HC_USBCMD, command);
-+	isp1760_hcd_clear(hcd, CMD_LRESET);
-+	isp1760_hcd_clear(hcd, CMD_RESET);
-=20
--	retval =3D handshake(hcd, HC_USBCMD, CMD_RUN, CMD_RUN, 250 * 1000);
-+	retval =3D isp1760_hcd_set_poll_timeout(hcd, CMD_RUN, 250 * 1000);
- 	if (retval)
- 		return retval;
-=20
-@@ -1326,9 +1368,8 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	 * the semaphore while doing so.
- 	 */
- 	down_write(&ehci_cf_port_reset_rwsem);
--	reg_write32(hcd->regs, HC_CONFIGFLAG, FLAG_CF);
-=20
--	retval =3D handshake(hcd, HC_CONFIGFLAG, FLAG_CF, FLAG_CF, 250 * 1000)=
;
-+	retval =3D isp1760_hcd_set_poll_timeout(hcd, FLAG_CF, 250 * 1000);
- 	up_write(&ehci_cf_port_reset_rwsem);
- 	if (retval)
- 		return retval;
-@@ -1338,21 +1379,22 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	errata2_timer.expires =3D jiffies + msecs_to_jiffies(SLOT_CHECK_PERIOD=
);
- 	add_timer(&errata2_timer);
-=20
--	chipid =3D reg_read32(hcd->regs, HC_CHIP_ID_REG);
-+	chipid =3D isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
- 	dev_info(hcd->self.controller, "USB ISP %04x HW rev. %d started\n",
- 					chipid & 0xffff, chipid >> 16);
-=20
- 	/* PTD Register Init Part 2, Step 28 */
-=20
- 	/* Setup registers controlling PTD checking */
--	reg_write32(hcd->regs, HC_ATL_PTD_LASTPTD_REG, 0x80000000);
--	reg_write32(hcd->regs, HC_INT_PTD_LASTPTD_REG, 0x80000000);
--	reg_write32(hcd->regs, HC_ISO_PTD_LASTPTD_REG, 0x00000001);
--	reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, 0xffffffff);
--	reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, 0xffffffff);
--	reg_write32(hcd->regs, HC_ISO_PTD_SKIPMAP_REG, 0xffffffff);
--	reg_write32(hcd->regs, HC_BUFFER_STATUS_REG,
--						ATL_BUF_FILL | INT_BUF_FILL);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_LASTPTD, 0x80000000);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_LASTPTD, 0x80000000);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_LASTPTD, 0x00000001);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP, 0xffffffff);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP, 0xffffffff);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP, 0xffffffff);
-+
-+	isp1760_hcd_set(hcd, ATL_BUF_FILL);
-+	isp1760_hcd_set(hcd, INT_BUF_FILL);
-=20
- 	/* GRR this is run-once init(), being done every time the HC starts.
- 	 * So long as they're part of class devices, we can't do it init()
-@@ -1586,15 +1628,19 @@ static void kill_transfer(struct usb_hcd *hcd, s=
truct urb *urb,
- 	/* We need to forcefully reclaim the slot since some transfers never
- 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
- 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
--		skip_map =3D reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
-+		skip_map =3D isp1760_reg_read(priv->regs,
-+					    ISP176x_HC_ATL_PTD_SKIPMAP);
- 		skip_map |=3D (1 << qh->slot);
--		reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, skip_map);
-+		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
-+				  skip_map);
- 		priv->atl_slots[qh->slot].qh =3D NULL;
- 		priv->atl_slots[qh->slot].qtd =3D NULL;
- 	} else {
--		skip_map =3D reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
-+		skip_map =3D isp1760_reg_read(priv->regs,
-+					    ISP176x_HC_INT_PTD_SKIPMAP);
- 		skip_map |=3D (1 << qh->slot);
--		reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, skip_map);
-+		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
-+				  skip_map);
- 		priv->int_slots[qh->slot].qh =3D NULL;
- 		priv->int_slots[qh->slot].qtd =3D NULL;
- 	}
-@@ -1707,8 +1753,7 @@ static void isp1760_endpoint_disable(struct usb_hc=
d *hcd,
- static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	u32 temp, status =3D 0;
--	u32 mask;
-+	u32 status =3D 0;
- 	int retval =3D 1;
- 	unsigned long flags;
-=20
-@@ -1718,17 +1763,13 @@ static int isp1760_hub_status_data(struct usb_hc=
d *hcd, char *buf)
-=20
- 	/* init status to no-changes */
- 	buf[0] =3D 0;
--	mask =3D PORT_CSC;
-=20
- 	spin_lock_irqsave(&priv->lock, flags);
--	temp =3D reg_read32(hcd->regs, HC_PORTSC1);
-=20
--	if (temp & PORT_OWNER) {
--		if (temp & PORT_CSC) {
--			temp &=3D ~PORT_CSC;
--			reg_write32(hcd->regs, HC_PORTSC1, temp);
--			goto done;
--		}
-+	if (isp1760_hcd_is_set(hcd, PORT_OWNER) &&
-+	    isp1760_hcd_is_set(hcd, PORT_CSC)) {
-+		isp1760_hcd_clear(hcd, PORT_CSC);
-+		goto done;
- 	}
-=20
- 	/*
-@@ -1737,11 +1778,9 @@ static int isp1760_hub_status_data(struct usb_hcd=
 *hcd, char *buf)
- 	 * high-speed device is switched over to the companion
- 	 * controller by the user.
- 	 */
--
--	if ((temp & mask) !=3D 0
--			|| ((temp & PORT_RESUME) !=3D 0
--				&& time_after_eq(jiffies,
--					priv->reset_done))) {
-+	if (isp1760_hcd_is_set(hcd, PORT_CSC) ||
-+	    (isp1760_hcd_is_set(hcd, PORT_RESUME) &&
-+	     time_after_eq(jiffies, priv->reset_done))) {
- 		buf [0] |=3D 1 << (0 + 1);
- 		status =3D STS_PCD;
- 	}
-@@ -1754,9 +1793,11 @@ static int isp1760_hub_status_data(struct usb_hcd=
 *hcd, char *buf)
- static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
- 		struct usb_hub_descriptor *desc)
- {
--	int ports =3D HCS_N_PORTS(priv->hcs_params);
-+	int ports;
- 	u16 temp;
-=20
-+	ports =3D isp1760_hcd_read(priv->hcd, HCS_N_PORTS);
-+
- 	desc->bDescriptorType =3D USB_DT_HUB;
- 	/* priv 1.0, 2.3.9 says 20ms max */
- 	desc->bPwrOn2PwrGood =3D 10;
-@@ -1772,7 +1813,7 @@ static void isp1760_hub_descriptor(struct isp1760_=
hcd *priv,
-=20
- 	/* per-port overcurrent reporting */
- 	temp =3D HUB_CHAR_INDV_PORT_OCPM;
--	if (HCS_PPC(priv->hcs_params))
-+	if (isp1760_hcd_is_set(priv->hcd, HCS_PPC))
- 		/* per-port power control */
- 		temp |=3D HUB_CHAR_INDV_PORT_LPSM;
- 	else
-@@ -1783,38 +1824,37 @@ static void isp1760_hub_descriptor(struct isp176=
0_hcd *priv,
-=20
- #define	PORT_WAKE_BITS	(PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
-=20
--static int check_reset_complete(struct usb_hcd *hcd, int index,
--		int port_status)
-+static void check_reset_complete(struct usb_hcd *hcd, int index)
- {
--	if (!(port_status & PORT_CONNECT))
--		return port_status;
-+	if (!(isp1760_hcd_is_set(hcd, PORT_CONNECT)))
-+		return;
-=20
- 	/* if reset finished and it's still not enabled -- handoff */
--	if (!(port_status & PORT_PE)) {
--
-+	if (!isp1760_hcd_is_set(hcd, PORT_PE)) {
- 		dev_info(hcd->self.controller,
--					"port %d full speed --> companion\n",
--					index + 1);
-+			 "port %d full speed --> companion\n", index + 1);
-=20
--		port_status |=3D PORT_OWNER;
--		port_status &=3D ~PORT_RWC_BITS;
--		reg_write32(hcd->regs, HC_PORTSC1, port_status);
-+		isp1760_hcd_set(hcd, PORT_OWNER);
-=20
--	} else
-+		isp1760_hcd_clear(hcd, PORT_CSC);
-+	} else {
- 		dev_info(hcd->self.controller, "port %d high speed\n",
--								index + 1);
-+			 index + 1);
-+	}
-=20
--	return port_status;
-+	return;
- }
-=20
- static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
- 		u16 wValue, u16 wIndex, char *buf, u16 wLength)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	int ports =3D HCS_N_PORTS(priv->hcs_params);
--	u32 temp, status;
-+	u32 status;
- 	unsigned long flags;
- 	int retval =3D 0;
-+	int ports;
-+
-+	ports =3D isp1760_hcd_read(hcd, HCS_N_PORTS);
-=20
- 	/*
- 	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
-@@ -1839,7 +1879,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		if (!wIndex || wIndex > ports)
- 			goto error;
- 		wIndex--;
--		temp =3D reg_read32(hcd->regs, HC_PORTSC1);
-=20
- 		/*
- 		 * Even if OWNER is set, so the port is owned by the
-@@ -1850,22 +1889,22 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
-=20
- 		switch (wValue) {
- 		case USB_PORT_FEAT_ENABLE:
--			reg_write32(hcd->regs, HC_PORTSC1, temp & ~PORT_PE);
-+			isp1760_hcd_clear(hcd, PORT_PE);
- 			break;
- 		case USB_PORT_FEAT_C_ENABLE:
- 			/* XXX error? */
- 			break;
- 		case USB_PORT_FEAT_SUSPEND:
--			if (temp & PORT_RESET)
-+			if (isp1760_hcd_is_set(hcd, PORT_RESET))
- 				goto error;
-=20
--			if (temp & PORT_SUSPEND) {
--				if ((temp & PORT_PE) =3D=3D 0)
-+			if (isp1760_hcd_is_set(hcd, PORT_SUSPEND)) {
-+				if (!isp1760_hcd_is_set(hcd, PORT_PE))
- 					goto error;
- 				/* resume signaling for 20 msec */
--				temp &=3D ~(PORT_RWC_BITS);
--				reg_write32(hcd->regs, HC_PORTSC1,
--							temp | PORT_RESUME);
-+				isp1760_hcd_clear(hcd, PORT_CSC);
-+				isp1760_hcd_set(hcd, PORT_RESUME);
-+
- 				priv->reset_done =3D jiffies +
- 					msecs_to_jiffies(USB_RESUME_TIMEOUT);
- 			}
-@@ -1874,12 +1913,11 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 			/* we auto-clear this feature */
- 			break;
- 		case USB_PORT_FEAT_POWER:
--			if (HCS_PPC(priv->hcs_params))
--				reg_write32(hcd->regs, HC_PORTSC1,
--							temp & ~PORT_POWER);
-+			if (isp1760_hcd_is_set(hcd, HCS_PPC))
-+				isp1760_hcd_clear(hcd, PORT_POWER);
- 			break;
- 		case USB_PORT_FEAT_C_CONNECTION:
--			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_CSC);
-+			isp1760_hcd_set(hcd, PORT_CSC);
- 			break;
- 		case USB_PORT_FEAT_C_OVER_CURRENT:
- 			/* XXX error ?*/
-@@ -1890,7 +1928,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		default:
- 			goto error;
- 		}
--		reg_read32(hcd->regs, HC_USBCMD);
-+		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
- 		break;
- 	case GetHubDescriptor:
- 		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *)
-@@ -1905,15 +1943,14 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 			goto error;
- 		wIndex--;
- 		status =3D 0;
--		temp =3D reg_read32(hcd->regs, HC_PORTSC1);
-=20
- 		/* wPortChange bits */
--		if (temp & PORT_CSC)
-+		if (isp1760_hcd_is_set(hcd, PORT_CSC))
- 			status |=3D USB_PORT_STAT_C_CONNECTION << 16;
-=20
-=20
- 		/* whoever resumes must GetPortStatus to complete it!! */
--		if (temp & PORT_RESUME) {
-+		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
- 			dev_err(hcd->self.controller, "Port resume should be skipped.\n");
-=20
- 			/* Remote Wakeup received? */
-@@ -1932,35 +1969,31 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 				priv->reset_done =3D 0;
-=20
- 				/* stop resume signaling */
--				temp =3D reg_read32(hcd->regs, HC_PORTSC1);
--				reg_write32(hcd->regs, HC_PORTSC1,
--					temp & ~(PORT_RWC_BITS | PORT_RESUME));
--				retval =3D handshake(hcd, HC_PORTSC1,
--					   PORT_RESUME, 0, 2000 /* 2msec */);
-+				isp1760_hcd_clear(hcd, PORT_CSC);
-+
-+				retval =3D isp1760_hcd_clear_poll_timeout(hcd,
-+							  PORT_RESUME, 2000);
- 				if (retval !=3D 0) {
- 					dev_err(hcd->self.controller,
- 						"port %d resume error %d\n",
- 						wIndex + 1, retval);
- 					goto error;
- 				}
--				temp &=3D ~(PORT_SUSPEND|PORT_RESUME|(3<<10));
- 			}
- 		}
-=20
- 		/* whoever resets must GetPortStatus to complete it!! */
--		if ((temp & PORT_RESET)
--				&& time_after_eq(jiffies,
--					priv->reset_done)) {
-+		if (isp1760_hcd_is_set(hcd, PORT_RESET) &&
-+		    time_after_eq(jiffies, priv->reset_done)) {
- 			status |=3D USB_PORT_STAT_C_RESET << 16;
- 			priv->reset_done =3D 0;
-=20
- 			/* force reset to complete */
--			reg_write32(hcd->regs, HC_PORTSC1, temp & ~PORT_RESET);
- 			/* REVISIT:  some hardware needs 550+ usec to clear
- 			 * this bit; seems too long to spin routinely...
- 			 */
--			retval =3D handshake(hcd, HC_PORTSC1,
--					PORT_RESET, 0, 750);
-+			retval =3D isp1760_hcd_clear_poll_timeout(hcd, PORT_RESET,
-+								750);
- 			if (retval !=3D 0) {
- 				dev_err(hcd->self.controller, "port %d reset error %d\n",
- 						wIndex + 1, retval);
-@@ -1968,8 +2001,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 			}
-=20
- 			/* see what we found out */
--			temp =3D check_reset_complete(hcd, wIndex,
--					reg_read32(hcd->regs, HC_PORTSC1));
-+			check_reset_complete(hcd, wIndex);
- 		}
- 		/*
- 		 * Even if OWNER is set, there's no harm letting hub_wq
-@@ -1977,21 +2009,22 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 		 * for PORT_POWER anyway).
- 		 */
-=20
--		if (temp & PORT_OWNER)
-+		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
- 			dev_err(hcd->self.controller, "PORT_OWNER is set\n");
-=20
--		if (temp & PORT_CONNECT) {
-+		if (isp1760_hcd_is_set(hcd, PORT_CONNECT)) {
- 			status |=3D USB_PORT_STAT_CONNECTION;
- 			/* status may be from integrated TT */
- 			status |=3D USB_PORT_STAT_HIGH_SPEED;
- 		}
--		if (temp & PORT_PE)
-+		if (isp1760_hcd_is_set(hcd, PORT_PE))
- 			status |=3D USB_PORT_STAT_ENABLE;
--		if (temp & (PORT_SUSPEND|PORT_RESUME))
-+		if (isp1760_hcd_is_set(hcd, PORT_SUSPEND) &&
-+		    isp1760_hcd_is_set(hcd, PORT_RESUME))
- 			status |=3D USB_PORT_STAT_SUSPEND;
--		if (temp & PORT_RESET)
-+		if (isp1760_hcd_is_set(hcd, PORT_RESET))
- 			status |=3D USB_PORT_STAT_RESET;
--		if (temp & PORT_POWER)
-+		if (isp1760_hcd_is_set(hcd, PORT_POWER))
- 			status |=3D USB_PORT_STAT_POWER;
-=20
- 		put_unaligned(cpu_to_le32(status), (__le32 *) buf);
-@@ -2011,41 +2044,39 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 		if (!wIndex || wIndex > ports)
- 			goto error;
- 		wIndex--;
--		temp =3D reg_read32(hcd->regs, HC_PORTSC1);
--		if (temp & PORT_OWNER)
-+		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
- 			break;
-=20
--/*		temp &=3D ~PORT_RWC_BITS; */
- 		switch (wValue) {
- 		case USB_PORT_FEAT_ENABLE:
--			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_PE);
-+			isp1760_hcd_set(hcd, PORT_PE);
- 			break;
-=20
- 		case USB_PORT_FEAT_SUSPEND:
--			if ((temp & PORT_PE) =3D=3D 0
--					|| (temp & PORT_RESET) !=3D 0)
-+			if (!isp1760_hcd_is_set(hcd, PORT_PE) ||
-+			    isp1760_hcd_is_set(hcd, PORT_RESET))
- 				goto error;
-=20
--			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_SUSPEND);
-+			isp1760_hcd_set(hcd, PORT_SUSPEND);
- 			break;
- 		case USB_PORT_FEAT_POWER:
--			if (HCS_PPC(priv->hcs_params))
--				reg_write32(hcd->regs, HC_PORTSC1,
--							temp | PORT_POWER);
-+			if (isp1760_hcd_is_set(hcd, HCS_PPC))
-+				isp1760_hcd_set(hcd, PORT_POWER);
- 			break;
- 		case USB_PORT_FEAT_RESET:
--			if (temp & PORT_RESUME)
-+			if (isp1760_hcd_is_set(hcd, PORT_RESUME))
- 				goto error;
- 			/* line status bits may report this as low speed,
- 			 * which can be fine if this root hub has a
- 			 * transaction translator built in.
- 			 */
--			if ((temp & (PORT_PE|PORT_CONNECT)) =3D=3D PORT_CONNECT
--					&& PORT_USB11(temp)) {
--				temp |=3D PORT_OWNER;
-+			if ((isp1760_hcd_is_set(hcd, PORT_CONNECT) &&
-+			     !isp1760_hcd_is_set(hcd, PORT_PE)) &&
-+			    (isp1760_hcd_read(hcd, PORT_LSTATUS) =3D=3D 1)) {
-+				isp1760_hcd_set(hcd, PORT_OWNER);
- 			} else {
--				temp |=3D PORT_RESET;
--				temp &=3D ~PORT_PE;
-+				isp1760_hcd_set(hcd, PORT_RESET);
-+				isp1760_hcd_clear(hcd, PORT_PE);
-=20
- 				/*
- 				 * caller must wait, then call GetPortStatus
-@@ -2054,12 +2085,11 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 				priv->reset_done =3D jiffies +
- 					msecs_to_jiffies(50);
- 			}
--			reg_write32(hcd->regs, HC_PORTSC1, temp);
- 			break;
- 		default:
- 			goto error;
- 		}
--		reg_read32(hcd->regs, HC_USBCMD);
-+		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
- 		break;
-=20
- 	default:
-@@ -2076,14 +2106,13 @@ static int isp1760_get_frame(struct usb_hcd *hcd=
)
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	u32 fr;
-=20
--	fr =3D reg_read32(hcd->regs, HC_FRINDEX);
-+	fr =3D isp1760_hcd_read(hcd, HC_FRINDEX);
- 	return (fr >> 3) % priv->periodic_size;
- }
-=20
- static void isp1760_stop(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	u32 temp;
-=20
- 	del_timer(&errata2_timer);
-=20
-@@ -2094,24 +2123,19 @@ static void isp1760_stop(struct usb_hcd *hcd)
- 	spin_lock_irq(&priv->lock);
- 	ehci_reset(hcd);
- 	/* Disable IRQ */
--	temp =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL);
--	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INTR_EN);
-+	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
- 	spin_unlock_irq(&priv->lock);
-=20
--	reg_write32(hcd->regs, HC_CONFIGFLAG, 0);
-+	isp1760_hcd_clear(hcd, FLAG_CF);
- }
-=20
- static void isp1760_shutdown(struct usb_hcd *hcd)
- {
--	u32 command, temp;
--
- 	isp1760_stop(hcd);
--	temp =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL);
--	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INTR_EN);
-=20
--	command =3D reg_read32(hcd->regs, HC_USBCMD);
--	command &=3D ~CMD_RUN;
--	reg_write32(hcd->regs, HC_USBCMD, command);
-+	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
-+
-+	isp1760_hcd_clear(hcd, CMD_RUN);
- }
-=20
- static void isp1760_clear_tt_buffer_complete(struct usb_hcd *hcd,
-@@ -2184,8 +2208,8 @@ void isp1760_deinit_kmem_cache(void)
- 	kmem_cache_destroy(urb_listitem_cachep);
- }
-=20
--int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *regs,
--			 struct resource *mem, int irq, unsigned long irqflags,
-+int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem=
,
-+			 int irq, unsigned long irqflags,
- 			 struct device *dev)
- {
- 	struct usb_hcd *hcd;
-@@ -2202,7 +2226,6 @@ int isp1760_hcd_register(struct isp1760_hcd *priv,=
 void __iomem *regs,
- 	init_memory(priv);
-=20
- 	hcd->irq =3D irq;
--	hcd->regs =3D regs;
- 	hcd->rsrc_start =3D mem->start;
- 	hcd->rsrc_len =3D resource_size(mem);
-=20
-diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp=
1760-hcd.h
-index f1bb2deb1ccf..34e1899e52c4 100644
---- a/drivers/usb/isp1760/isp1760-hcd.h
-+++ b/drivers/usb/isp1760/isp1760-hcd.h
-@@ -3,6 +3,9 @@
- #define _ISP1760_HCD_H_
-=20
- #include <linux/spinlock.h>
-+#include <linux/regmap.h>
-+
-+#include "isp1760-regs.h"
-=20
- struct isp1760_qh;
- struct isp1760_qtd;
-@@ -48,10 +51,13 @@ enum isp1760_queue_head_types {
- };
-=20
- struct isp1760_hcd {
--#ifdef CONFIG_USB_ISP1760_HCD
- 	struct usb_hcd		*hcd;
-=20
--	u32 hcs_params;
-+	void __iomem		*base;
-+
-+	struct regmap		*regs;
-+	struct regmap_field	*fields[HC_FIELD_MAX];
-+
- 	spinlock_t		lock;
- 	struct isp1760_slotinfo	atl_slots[32];
- 	int			atl_done_map;
-@@ -66,20 +72,18 @@ struct isp1760_hcd {
- 	unsigned		i_thresh;
- 	unsigned long		reset_done;
- 	unsigned long		next_statechange;
--#endif
- };
-=20
- #ifdef CONFIG_USB_ISP1760_HCD
--int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *regs,
--			 struct resource *mem, int irq, unsigned long irqflags,
--			 struct device *dev);
-+int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem=
,
-+			 int irq, unsigned long irqflags, struct device *dev);
- void isp1760_hcd_unregister(struct isp1760_hcd *priv);
-=20
- int isp1760_init_kmem_once(void);
- void isp1760_deinit_kmem_cache(void);
- #else
- static inline int isp1760_hcd_register(struct isp1760_hcd *priv,
--				       void __iomem *regs, struct resource *mem,
-+				       struct resource *mem,
- 				       int irq, unsigned long irqflags,
- 				       struct device *dev)
- {
-diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1=
760-if.c
-index ccd30f835888..abfba9f5ec23 100644
---- a/drivers/usb/isp1760/isp1760-if.c
-+++ b/drivers/usb/isp1760/isp1760-if.c
-@@ -75,9 +75,9 @@ static int isp1761_pci_init(struct pci_dev *dev)
- 		/*by default host is in 16bit mode, so
- 		 * io operations at this stage must be 16 bit
- 		 * */
--		writel(0xface, iobase + HC_SCRATCH_REG);
-+		writel(0xface, iobase + ISP176x_HC_SCRATCH);
- 		udelay(100);
--		reg_data =3D readl(iobase + HC_SCRATCH_REG) & 0x0000ffff;
-+		reg_data =3D readl(iobase + ISP176x_HC_SCRATCH) & 0x0000ffff;
- 		retry_count--;
- 	}
-=20
-diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/is=
p1760-regs.h
-index fedc4f5cded0..0d5262c37c5b 100644
---- a/drivers/usb/isp1760/isp1760-regs.h
-+++ b/drivers/usb/isp1760/isp1760-regs.h
-@@ -10,218 +10,182 @@
-  *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-  */
-=20
--#ifndef _ISP1760_REGS_H_
--#define _ISP1760_REGS_H_
-+#ifndef _ISP176x_REGS_H_
-+#define _ISP176x_REGS_H_
-=20
- /* --------------------------------------------------------------------=
---------
-  * Host Controller
-  */
-=20
- /* EHCI capability registers */
--#define HC_CAPLENGTH		0x000
--#define HC_LENGTH(p)		(((p) >> 00) & 0x00ff)	/* bits 7:0 */
--#define HC_VERSION(p)		(((p) >> 16) & 0xffff)	/* bits 31:16 */
--
--#define HC_HCSPARAMS		0x004
--#define HCS_INDICATOR(p)	((p) & (1 << 16))	/* true: has port indicators=
 */
--#define HCS_PPC(p)		((p) & (1 << 4))	/* true: port power control */
--#define HCS_N_PORTS(p)		(((p) >> 0) & 0xf)	/* bits 3:0, ports on HC */
--
--#define HC_HCCPARAMS		0x008
--#define HCC_ISOC_CACHE(p)       ((p) & (1 << 7))	/* true: can cache iso=
c frame */
--#define HCC_ISOC_THRES(p)       (((p) >> 4) & 0x7)	/* bits 6:4, uframes=
 cached */
-+#define ISP176x_HC_CAPLENGTH		0x000
-+#define ISP176x_HC_VERSION		0x002
-+#define ISP176x_HC_HCSPARAMS		0x004
-+#define ISP176x_HC_HCCPARAMS		0x008
-=20
- /* EHCI operational registers */
--#define HC_USBCMD		0x020
--#define CMD_LRESET		(1 << 7)		/* partial reset (no ports, etc) */
--#define CMD_RESET		(1 << 1)		/* reset HC not bus */
--#define CMD_RUN			(1 << 0)		/* start/stop HC */
--
--#define HC_USBSTS		0x024
--#define STS_PCD			(1 << 2)		/* port change detect */
--
--#define HC_FRINDEX		0x02c
--
--#define HC_CONFIGFLAG		0x060
--#define FLAG_CF			(1 << 0)		/* true: we'll support "high speed" */
--
--#define HC_PORTSC1		0x064
--#define PORT_OWNER		(1 << 13)		/* true: companion hc owns this port */
--#define PORT_POWER		(1 << 12)		/* true: has power (see PPC) */
--#define PORT_USB11(x)		(((x) & (3 << 10)) =3D=3D (1 << 10))	/* USB 1.1 =
device */
--#define PORT_RESET		(1 << 8)		/* reset port */
--#define PORT_SUSPEND		(1 << 7)		/* suspend port */
--#define PORT_RESUME		(1 << 6)		/* resume it */
--#define PORT_PE			(1 << 2)		/* port enable */
--#define PORT_CSC		(1 << 1)		/* connect status change */
--#define PORT_CONNECT		(1 << 0)		/* device connected */
--#define PORT_RWC_BITS		(PORT_CSC)
--
--#define HC_ISO_PTD_DONEMAP_REG	0x130
--#define HC_ISO_PTD_SKIPMAP_REG	0x134
--#define HC_ISO_PTD_LASTPTD_REG	0x138
--#define HC_INT_PTD_DONEMAP_REG	0x140
--#define HC_INT_PTD_SKIPMAP_REG	0x144
--#define HC_INT_PTD_LASTPTD_REG	0x148
--#define HC_ATL_PTD_DONEMAP_REG	0x150
--#define HC_ATL_PTD_SKIPMAP_REG	0x154
--#define HC_ATL_PTD_LASTPTD_REG	0x158
-+#define ISP176x_HC_USBCMD		0x020
-+#define ISP176x_HC_USBSTS		0x024
-+#define ISP176x_HC_FRINDEX		0x02c
-+
-+#define ISP176x_HC_CONFIGFLAG		0x060
-+#define ISP176x_HC_PORTSC1		0x064
-+
-+#define ISP176x_HC_ISO_PTD_DONEMAP	0x130
-+#define ISP176x_HC_ISO_PTD_SKIPMAP	0x134
-+#define ISP176x_HC_ISO_PTD_LASTPTD	0x138
-+#define ISP176x_HC_INT_PTD_DONEMAP	0x140
-+#define ISP176x_HC_INT_PTD_SKIPMAP	0x144
-+#define ISP176x_HC_INT_PTD_LASTPTD	0x148
-+#define ISP176x_HC_ATL_PTD_DONEMAP	0x150
-+#define ISP176x_HC_ATL_PTD_SKIPMAP	0x154
-+#define ISP176x_HC_ATL_PTD_LASTPTD	0x158
-=20
- /* Configuration Register */
--#define HC_HW_MODE_CTRL		0x300
--#define ALL_ATX_RESET		(1 << 31)
--#define HW_ANA_DIGI_OC		(1 << 15)
--#define HW_DEV_DMA		(1 << 11)
--#define HW_COMN_IRQ		(1 << 10)
--#define HW_COMN_DMA		(1 << 9)
--#define HW_DATA_BUS_32BIT	(1 << 8)
--#define HW_DACK_POL_HIGH	(1 << 6)
--#define HW_DREQ_POL_HIGH	(1 << 5)
--#define HW_INTR_HIGH_ACT	(1 << 2)
--#define HW_INTR_EDGE_TRIG	(1 << 1)
--#define HW_GLOBAL_INTR_EN	(1 << 0)
--
--#define HC_CHIP_ID_REG		0x304
--#define HC_SCRATCH_REG		0x308
--
--#define HC_RESET_REG		0x30c
--#define SW_RESET_RESET_HC	(1 << 1)
--#define SW_RESET_RESET_ALL	(1 << 0)
--
--#define HC_BUFFER_STATUS_REG	0x334
--#define ISO_BUF_FILL		(1 << 2)
--#define INT_BUF_FILL		(1 << 1)
--#define ATL_BUF_FILL		(1 << 0)
--
--#define HC_MEMORY_REG		0x33c
--#define ISP_BANK(x)		((x) << 16)
--
--#define HC_PORT1_CTRL		0x374
--#define PORT1_POWER		(3 << 3)
--#define PORT1_INIT1		(1 << 7)
--#define PORT1_INIT2		(1 << 23)
--#define HW_OTG_CTRL_SET		0x374
--#define HW_OTG_CTRL_CLR		0x376
--#define HW_OTG_DISABLE		(1 << 10)
--#define HW_OTG_SE0_EN		(1 << 9)
--#define HW_BDIS_ACON_EN		(1 << 8)
--#define HW_SW_SEL_HC_DC		(1 << 7)
--#define HW_VBUS_CHRG		(1 << 6)
--#define HW_VBUS_DISCHRG		(1 << 5)
--#define HW_VBUS_DRV		(1 << 4)
--#define HW_SEL_CP_EXT		(1 << 3)
--#define HW_DM_PULLDOWN		(1 << 2)
--#define HW_DP_PULLDOWN		(1 << 1)
--#define HW_DP_PULLUP		(1 << 0)
-+#define ISP176x_HC_HW_MODE_CTRL		0x300
-+#define ISP176x_HC_CHIP_ID		0x304
-+#define ISP176x_HC_SCRATCH		0x308
-+#define ISP176x_HC_RESET		0x30c
-+#define ISP176x_HC_BUFFER_STATUS	0x334
-+#define ISP176x_HC_MEMORY		0x33c
-=20
- /* Interrupt Register */
--#define HC_INTERRUPT_REG	0x310
--
--#define HC_INTERRUPT_ENABLE	0x314
--#define HC_ISO_INT		(1 << 9)
--#define HC_ATL_INT		(1 << 8)
--#define HC_INTL_INT		(1 << 7)
--#define HC_EOT_INT		(1 << 3)
--#define HC_SOT_INT		(1 << 1)
--#define INTERRUPT_ENABLE_MASK	(HC_INTL_INT | HC_ATL_INT)
--
--#define HC_ISO_IRQ_MASK_OR_REG	0x318
--#define HC_INT_IRQ_MASK_OR_REG	0x31c
--#define HC_ATL_IRQ_MASK_OR_REG	0x320
--#define HC_ISO_IRQ_MASK_AND_REG	0x324
--#define HC_INT_IRQ_MASK_AND_REG	0x328
--#define HC_ATL_IRQ_MASK_AND_REG	0x32c
-+#define ISP176x_HC_INTERRUPT		0x310
-+#define ISP176x_HC_INTERRUPT_ENABLE	0x314
-+#define ISP176x_HC_ISO_IRQ_MASK_OR	0x318
-+#define ISP176x_HC_INT_IRQ_MASK_OR	0x31c
-+#define ISP176x_HC_ATL_IRQ_MASK_OR	0x320
-+#define ISP176x_HC_ISO_IRQ_MASK_AND	0x324
-+#define ISP176x_HC_INT_IRQ_MASK_AND	0x328
-+#define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
-+
-+enum isp176x_host_controller_fields {
-+	/* HC_HCSPARAMS */
-+	HCS_PPC, HCS_N_PORTS,
-+	/* HC_HCCPARAMS */
-+	HCC_ISOC_CACHE, HCC_ISOC_THRES,
-+	/* HC_USBCMD */
-+	CMD_LRESET, CMD_RESET, CMD_RUN,
-+	/* HC_USBSTS */
-+	STS_PCD,
-+	/* HC_FRINDEX */
-+	HC_FRINDEX,
-+	/* HC_CONFIGFLAG */
-+	FLAG_CF,
-+	/* HC_PORTSC1 */
-+	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
-+	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
-+	/* HC_HW_MODE_CTRL */
-+	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_DMA,
-+	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HIGH_AC=
T,
-+	HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
-+	/* HC_RESET */
-+	SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
-+	/* HC_BUFFER_STATUS */
-+	INT_BUF_FILL, ATL_BUF_FILL,
-+	/* HC_MEMORY */
-+	MEM_BANK_SEL, MEM_START_ADDR,
-+	/* HC_INTERRUPT_ENABLE */
-+	HC_INT_ENABLE,
-+	/* Last element */
-+	HC_FIELD_MAX,
-+};
-=20
- /* --------------------------------------------------------------------=
---------
-  * Peripheral Controller
-  */
-=20
--/* Initialization Registers */
--#define DC_ADDRESS			0x0200
--#define DC_DEVEN			(1 << 7)
--
--#define DC_MODE				0x020c
--#define DC_DMACLKON			(1 << 9)
--#define DC_VBUSSTAT			(1 << 8)
--#define DC_CLKAON			(1 << 7)
--#define DC_SNDRSU			(1 << 6)
--#define DC_GOSUSP			(1 << 5)
--#define DC_SFRESET			(1 << 4)
--#define DC_GLINTENA			(1 << 3)
--#define DC_WKUPCS			(1 << 2)
--
--#define DC_INTCONF			0x0210
--#define DC_CDBGMOD_ACK_NAK		(0 << 6)
--#define DC_CDBGMOD_ACK			(1 << 6)
--#define DC_CDBGMOD_ACK_1NAK		(2 << 6)
--#define DC_DDBGMODIN_ACK_NAK		(0 << 4)
--#define DC_DDBGMODIN_ACK		(1 << 4)
--#define DC_DDBGMODIN_ACK_1NAK		(2 << 4)
--#define DC_DDBGMODOUT_ACK_NYET_NAK	(0 << 2)
--#define DC_DDBGMODOUT_ACK_NYET		(1 << 2)
--#define DC_DDBGMODOUT_ACK_NYET_1NAK	(2 << 2)
--#define DC_INTLVL			(1 << 1)
--#define DC_INTPOL			(1 << 0)
--
--#define DC_DEBUG			0x0212
--#define DC_INTENABLE			0x0214
- #define DC_IEPTX(n)			(1 << (11 + 2 * (n)))
- #define DC_IEPRX(n)			(1 << (10 + 2 * (n)))
- #define DC_IEPRXTX(n)			(3 << (10 + 2 * (n)))
--#define DC_IEP0SETUP			(1 << 8)
--#define DC_IEVBUS			(1 << 7)
--#define DC_IEDMA			(1 << 6)
--#define DC_IEHS_STA			(1 << 5)
--#define DC_IERESM			(1 << 4)
--#define DC_IESUSP			(1 << 3)
--#define DC_IEPSOF			(1 << 2)
--#define DC_IESOF			(1 << 1)
--#define DC_IEBRST			(1 << 0)
-+
-+#define ISP176x_DC_CDBGMOD_ACK		BIT(6)
-+#define ISP176x_DC_DDBGMODIN_ACK	BIT(4)
-+#define ISP176x_DC_DDBGMODOUT_ACK	BIT(2)
-+
-+#define ISP176x_DC_IEP0SETUP		BIT(8)
-+#define ISP176x_DC_IEVBUS		BIT(7)
-+#define ISP176x_DC_IEHS_STA		BIT(5)
-+#define ISP176x_DC_IERESM		BIT(4)
-+#define ISP176x_DC_IESUSP		BIT(3)
-+#define ISP176x_DC_IEBRST		BIT(0)
-+
-+#define ISP176x_DC_ENDPTYP_ISOC		0x01
-+#define ISP176x_DC_ENDPTYP_BULK		0x02
-+#define ISP176x_DC_ENDPTYP_INTERRUPT	0x03
-+
-+/* Initialization Registers */
-+#define ISP176x_DC_ADDRESS		0x0200
-+#define ISP176x_DC_MODE			0x020c
-+#define ISP176x_DC_INTCONF		0x0210
-+#define ISP176x_DC_DEBUG		0x0212
-+#define ISP176x_DC_INTENABLE		0x0214
-=20
- /* Data Flow Registers */
--#define DC_EPINDEX			0x022c
--#define DC_EP0SETUP			(1 << 5)
--#define DC_ENDPIDX(n)			((n) << 1)
--#define DC_EPDIR			(1 << 0)
--
--#define DC_CTRLFUNC			0x0228
--#define DC_CLBUF			(1 << 4)
--#define DC_VENDP			(1 << 3)
--#define DC_DSEN				(1 << 2)
--#define DC_STATUS			(1 << 1)
--#define DC_STALL			(1 << 0)
--
--#define DC_DATAPORT			0x0220
--#define DC_BUFLEN			0x021c
--#define DC_DATACOUNT_MASK		0xffff
--#define DC_BUFSTAT			0x021e
--#define DC_EPMAXPKTSZ			0x0204
--
--#define DC_EPTYPE			0x0208
--#define DC_NOEMPKT			(1 << 4)
--#define DC_EPENABLE			(1 << 3)
--#define DC_DBLBUF			(1 << 2)
--#define DC_ENDPTYP_ISOC			(1 << 0)
--#define DC_ENDPTYP_BULK			(2 << 0)
--#define DC_ENDPTYP_INTERRUPT		(3 << 0)
-+#define ISP176x_DC_EPMAXPKTSZ		0x0204
-+#define ISP176x_DC_EPTYPE		0x0208
-+
-+#define ISP176x_DC_BUFLEN		0x021c
-+#define ISP176x_DC_BUFSTAT		0x021e
-+#define ISP176x_DC_DATAPORT		0x0220
-+
-+#define ISP176x_DC_CTRLFUNC		0x0228
-+#define ISP176x_DC_EPINDEX		0x022c
-+
-+#define ISP1761_DC_OTG_CTRL_SET		0x374
-+#define ISP1761_DC_OTG_CTRL_CLEAR	0x376
-=20
- /* DMA Registers */
--#define DC_DMACMD			0x0230
--#define DC_DMATXCOUNT			0x0234
--#define DC_DMACONF			0x0238
--#define DC_DMAHW			0x023c
--#define DC_DMAINTREASON			0x0250
--#define DC_DMAINTEN			0x0254
--#define DC_DMAEP			0x0258
--#define DC_DMABURSTCOUNT		0x0264
-+#define ISP176x_DC_DMACMD		0x0230
-+#define ISP176x_DC_DMATXCOUNT		0x0234
-+#define ISP176x_DC_DMACONF		0x0238
-+#define ISP176x_DC_DMAHW		0x023c
-+#define ISP176x_DC_DMAINTREASON		0x0250
-+#define ISP176x_DC_DMAINTEN		0x0254
-+#define ISP176x_DC_DMAEP		0x0258
-+#define ISP176x_DC_DMABURSTCOUNT	0x0264
-=20
- /* General Registers */
--#define DC_INTERRUPT			0x0218
--#define DC_CHIPID			0x0270
--#define DC_FRAMENUM			0x0274
--#define DC_SCRATCH			0x0278
--#define DC_UNLOCKDEV			0x027c
--#define DC_INTPULSEWIDTH		0x0280
--#define DC_TESTMODE			0x0284
-+#define ISP176x_DC_INTERRUPT		0x0218
-+#define ISP176x_DC_CHIPID		0x0270
-+#define ISP176x_DC_FRAMENUM		0x0274
-+#define ISP176x_DC_SCRATCH		0x0278
-+#define ISP176x_DC_UNLOCKDEV		0x027c
-+#define ISP176x_DC_INTPULSEWIDTH	0x0280
-+#define ISP176x_DC_TESTMODE		0x0284
-+
-+enum isp176x_device_controller_fields {
-+	/* DC_ADDRESS */
-+	DC_DEVEN, DC_DEVADDR,
-+	/* DC_MODE */
-+	DC_VBUSSTAT, DC_SFRESET, DC_GLINTENA,
-+	/* DC_INTCONF */
-+	DC_CDBGMOD_ACK, DC_DDBGMODIN_ACK, DC_DDBGMODOUT_ACK, DC_INTPOL,
-+	/* DC_INTENABLE */
-+	DC_IEPRXTX_7, DC_IEPRXTX_6, DC_IEPRXTX_5, DC_IEPRXTX_4, DC_IEPRXTX_3,
-+	DC_IEPRXTX_2, DC_IEPRXTX_1, DC_IEPRXTX_0,
-+	DC_IEP0SETUP, DC_IEVBUS, DC_IEHS_STA, DC_IERESM, DC_IESUSP, DC_IEBRST,
-+	/* DC_EPINDEX */
-+	DC_EP0SETUP, DC_ENDPIDX, DC_EPDIR,
-+	/* DC_CTRLFUNC */
-+	DC_CLBUF, DC_VENDP, DC_DSEN, DC_STATUS, DC_STALL,
-+	/* DC_BUFLEN */
-+	DC_BUFLEN,
-+	/* DC_EPMAXPKTSZ */
-+	DC_FFOSZ,
-+	/* DC_EPTYPE */
-+	DC_EPENABLE, DC_ENDPTYP,
-+	/* DC_FRAMENUM */
-+	DC_FRAMENUM, DC_UFRAMENUM,
-+	/* HW_OTG_CTRL_SET */
-+	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
-+	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP,
-+	/* HW_OTG_CTRL_CLR */
-+	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
-+	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
-+	HW_DP_PULLUP_CLEAR,
-+	/* Last element */
-+	DC_FIELD_MAX,
-+};
-=20
- #endif
-diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp=
1760-udc.c
-index 1714b2258b54..1e2ca43fb152 100644
---- a/drivers/usb/isp1760/isp1760-udc.c
-+++ b/drivers/usb/isp1760/isp1760-udc.c
-@@ -45,16 +45,62 @@ static inline struct isp1760_request *req_to_udc_req=
(struct usb_request *req)
- 	return container_of(req, struct isp1760_request, req);
- }
-=20
--static inline u32 isp1760_udc_read(struct isp1760_udc *udc, u16 reg)
-+static u32 isp1760_udc_read(struct isp1760_udc *udc, u16 field)
- {
--	return isp1760_read32(udc->regs, reg);
-+	return isp1760_field_read(udc->fields, field);
- }
-=20
--static inline void isp1760_udc_write(struct isp1760_udc *udc, u16 reg, =
u32 val)
-+static void isp1760_udc_write(struct isp1760_udc *udc, u16 field, u32 v=
al)
- {
--	isp1760_write32(udc->regs, reg, val);
-+	isp1760_field_write(udc->fields, field, val);
- }
-=20
-+static u32 isp1760_udc_read_raw(struct isp1760_udc *udc, u16 reg)
-+{
-+	__le32 val;
-+
-+	regmap_raw_read(udc->regs, reg, &val, 4);
-+
-+	return le32_to_cpu(val);
-+}
-+
-+static u16 isp1760_udc_read_raw16(struct isp1760_udc *udc, u16 reg)
-+{
-+	__le16 val;
-+
-+	regmap_raw_read(udc->regs, reg, &val, 2);
-+
-+	return le16_to_cpu(val);
-+}
-+
-+static void isp1760_udc_write_raw(struct isp1760_udc *udc, u16 reg, u32=
 val)
-+{
-+	__le32 val_le =3D cpu_to_le32(val);
-+
-+	regmap_raw_write(udc->regs, reg, &val_le, 4);
-+}
-+
-+static void isp1760_udc_write_raw16(struct isp1760_udc *udc, u16 reg, u=
16 val)
-+{
-+	__le16 val_le =3D cpu_to_le16(val);
-+
-+	regmap_raw_write(udc->regs, reg, &val_le, 2);
-+}
-+
-+static void isp1760_udc_set(struct isp1760_udc *udc, u32 field)
-+{
-+	isp1760_udc_write(udc, field, 0xFFFFFFFF);
-+}
-+
-+static void isp1760_udc_clear(struct isp1760_udc *udc, u32 field)
-+{
-+	isp1760_udc_write(udc, field, 0);
-+}
-+
-+static bool isp1760_udc_is_set(struct isp1760_udc *udc, u32 field)
-+{
-+	return !!isp1760_udc_read(udc, field);
-+}
- /* --------------------------------------------------------------------=
---------
-  * Endpoint Management
-  */
-@@ -75,11 +121,15 @@ static struct isp1760_ep *isp1760_udc_find_ep(struc=
t isp1760_udc *udc,
- 	return NULL;
- }
-=20
--static void __isp1760_udc_select_ep(struct isp1760_ep *ep, int dir)
-+static void __isp1760_udc_select_ep(struct isp1760_udc *udc,
-+				    struct isp1760_ep *ep, int dir)
- {
--	isp1760_udc_write(ep->udc, DC_EPINDEX,
--			  DC_ENDPIDX(ep->addr & USB_ENDPOINT_NUMBER_MASK) |
--			  (dir =3D=3D USB_DIR_IN ? DC_EPDIR : 0));
-+	isp1760_udc_write(udc, DC_ENDPIDX, ep->addr & USB_ENDPOINT_NUMBER_MASK=
);
-+
-+	if (dir =3D=3D USB_DIR_IN)
-+		isp1760_udc_set(udc, DC_EPDIR);
-+	else
-+		isp1760_udc_clear(udc, DC_EPDIR);
- }
-=20
- /**
-@@ -93,9 +143,10 @@ static void __isp1760_udc_select_ep(struct isp1760_e=
p *ep, int dir)
-  *
-  * Called with the UDC spinlock held.
-  */
--static void isp1760_udc_select_ep(struct isp1760_ep *ep)
-+static void isp1760_udc_select_ep(struct isp1760_udc *udc,
-+				  struct isp1760_ep *ep)
- {
--	__isp1760_udc_select_ep(ep, ep->addr & USB_ENDPOINT_DIR_MASK);
-+	__isp1760_udc_select_ep(udc, ep, ep->addr & USB_ENDPOINT_DIR_MASK);
- }
-=20
- /* Called with the UDC spinlock held. */
-@@ -108,9 +159,13 @@ static void isp1760_udc_ctrl_send_status(struct isp=
1760_ep *ep, int dir)
- 	 * the direction opposite to the data stage data packets, we thus need
- 	 * to select the OUT/IN endpoint for IN/OUT transfers.
- 	 */
--	isp1760_udc_write(udc, DC_EPINDEX, DC_ENDPIDX(0) |
--			  (dir =3D=3D USB_DIR_IN ? 0 : DC_EPDIR));
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STATUS);
-+	if (dir =3D=3D USB_DIR_IN)
-+		isp1760_udc_clear(udc, DC_EPDIR);
-+	else
-+		isp1760_udc_set(udc, DC_EPDIR);
-+
-+	isp1760_udc_write(udc, DC_ENDPIDX, 1);
-+	isp1760_udc_set(udc, DC_STATUS);
-=20
- 	/*
- 	 * The hardware will terminate the request automatically and go back t=
o
-@@ -157,10 +212,10 @@ static void isp1760_udc_ctrl_send_stall(struct isp=
1760_ep *ep)
- 	spin_lock_irqsave(&udc->lock, flags);
-=20
- 	/* Stall both the IN and OUT endpoints. */
--	__isp1760_udc_select_ep(ep, USB_DIR_OUT);
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STALL);
--	__isp1760_udc_select_ep(ep, USB_DIR_IN);
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STALL);
-+	__isp1760_udc_select_ep(udc, ep, USB_DIR_OUT);
-+	isp1760_udc_set(udc, DC_STALL);
-+	__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
-+	isp1760_udc_set(udc, DC_STALL);
-=20
- 	/* A protocol stall completes the control transaction. */
- 	udc->ep0_state =3D ISP1760_CTRL_SETUP;
-@@ -181,8 +236,8 @@ static bool isp1760_udc_receive(struct isp1760_ep *e=
p,
- 	u32 *buf;
- 	int i;
-=20
--	isp1760_udc_select_ep(ep);
--	len =3D isp1760_udc_read(udc, DC_BUFLEN) & DC_DATACOUNT_MASK;
-+	isp1760_udc_select_ep(udc, ep);
-+	len =3D isp1760_udc_read(udc, DC_BUFLEN);
-=20
- 	dev_dbg(udc->isp->dev, "%s: received %u bytes (%u/%u done)\n",
- 		__func__, len, req->req.actual, req->req.length);
-@@ -198,7 +253,7 @@ static bool isp1760_udc_receive(struct isp1760_ep *e=
p,
- 		 * datasheet doesn't clearly document how this should be
- 		 * handled.
- 		 */
--		isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
-+		isp1760_udc_set(udc, DC_CLBUF);
- 		return false;
- 	}
-=20
-@@ -209,9 +264,9 @@ static bool isp1760_udc_receive(struct isp1760_ep *e=
p,
- 	 * the next packet might be removed from the FIFO.
- 	 */
- 	for (i =3D len; i > 2; i -=3D 4, ++buf)
--		*buf =3D le32_to_cpu(isp1760_udc_read(udc, DC_DATAPORT));
-+		*buf =3D isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
- 	if (i > 0)
--		*(u16 *)buf =3D le16_to_cpu(readw(udc->regs + DC_DATAPORT));
-+		*(u16 *)buf =3D isp1760_udc_read_raw16(udc, ISP176x_DC_DATAPORT);
-=20
- 	req->req.actual +=3D len;
-=20
-@@ -253,7 +308,7 @@ static void isp1760_udc_transmit(struct isp1760_ep *=
ep,
- 		__func__, req->packet_size, req->req.actual,
- 		req->req.length);
-=20
--	__isp1760_udc_select_ep(ep, USB_DIR_IN);
-+	__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
-=20
- 	if (req->packet_size)
- 		isp1760_udc_write(udc, DC_BUFLEN, req->packet_size);
-@@ -265,14 +320,14 @@ static void isp1760_udc_transmit(struct isp1760_ep=
 *ep,
- 	 * the FIFO for this kind of conditions, but doesn't seem to work.
- 	 */
- 	for (i =3D req->packet_size; i > 2; i -=3D 4, ++buf)
--		isp1760_udc_write(udc, DC_DATAPORT, cpu_to_le32(*buf));
-+		isp1760_udc_write_raw(udc, ISP176x_DC_DATAPORT, *buf);
- 	if (i > 0)
--		writew(cpu_to_le16(*(u16 *)buf), udc->regs + DC_DATAPORT);
-+		isp1760_udc_write_raw16(udc, ISP176x_DC_DATAPORT, *(u16 *)buf);
-=20
- 	if (ep->addr =3D=3D 0)
--		isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
-+		isp1760_udc_set(udc, DC_DSEN);
- 	if (!req->packet_size)
--		isp1760_udc_write(udc, DC_CTRLFUNC, DC_VENDP);
-+		isp1760_udc_set(udc, DC_VENDP);
- }
-=20
- static void isp1760_ep_rx_ready(struct isp1760_ep *ep)
-@@ -408,19 +463,24 @@ static int __isp1760_udc_set_halt(struct isp1760_e=
p *ep, bool halt)
- 		return -EINVAL;
- 	}
-=20
--	isp1760_udc_select_ep(ep);
--	isp1760_udc_write(udc, DC_CTRLFUNC, halt ? DC_STALL : 0);
-+	isp1760_udc_select_ep(udc, ep);
-+
-+	if (halt)
-+		isp1760_udc_set(udc, DC_STALL);
-+	else
-+		isp1760_udc_clear(udc, DC_STALL);
-=20
- 	if (ep->addr =3D=3D 0) {
- 		/* When halting the control endpoint, stall both IN and OUT. */
--		__isp1760_udc_select_ep(ep, USB_DIR_IN);
--		isp1760_udc_write(udc, DC_CTRLFUNC, halt ? DC_STALL : 0);
-+		__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
-+		if (halt)
-+			isp1760_udc_set(udc, DC_STALL);
-+		else
-+			isp1760_udc_clear(udc, DC_STALL);
- 	} else if (!halt) {
- 		/* Reset the data PID by cycling the endpoint enable bit. */
--		u16 eptype =3D isp1760_udc_read(udc, DC_EPTYPE);
--
--		isp1760_udc_write(udc, DC_EPTYPE, eptype & ~DC_EPENABLE);
--		isp1760_udc_write(udc, DC_EPTYPE, eptype);
-+		isp1760_udc_clear(udc, DC_EPENABLE);
-+		isp1760_udc_set(udc, DC_EPENABLE);
-=20
- 		/*
- 		 * Disabling the endpoint emptied the transmit FIFO, fill it
-@@ -479,12 +539,14 @@ static int isp1760_udc_get_status(struct isp1760_u=
dc *udc,
- 		return -EINVAL;
- 	}
-=20
--	isp1760_udc_write(udc, DC_EPINDEX, DC_ENDPIDX(0) | DC_EPDIR);
-+	isp1760_udc_set(udc, DC_EPDIR);
-+	isp1760_udc_write(udc, DC_ENDPIDX, 1);
-+
- 	isp1760_udc_write(udc, DC_BUFLEN, 2);
-=20
--	writew(cpu_to_le16(status), udc->regs + DC_DATAPORT);
-+	isp1760_udc_write_raw16(udc, ISP176x_DC_DATAPORT, status);
-=20
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
-+	isp1760_udc_set(udc, DC_DSEN);
-=20
- 	dev_dbg(udc->isp->dev, "%s: status 0x%04x\n", __func__, status);
-=20
-@@ -508,7 +570,8 @@ static int isp1760_udc_set_address(struct isp1760_ud=
c *udc, u16 addr)
- 	usb_gadget_set_state(&udc->gadget, addr ? USB_STATE_ADDRESS :
- 			     USB_STATE_DEFAULT);
-=20
--	isp1760_udc_write(udc, DC_ADDRESS, DC_DEVEN | addr);
-+	isp1760_udc_write(udc, DC_DEVADDR, addr);
-+	isp1760_udc_set(udc, DC_DEVEN);
-=20
- 	spin_lock(&udc->lock);
- 	isp1760_udc_ctrl_send_status(&udc->ep[0], USB_DIR_OUT);
-@@ -650,9 +713,9 @@ static void isp1760_ep0_setup(struct isp1760_udc *ud=
c)
-=20
- 	spin_lock(&udc->lock);
-=20
--	isp1760_udc_write(udc, DC_EPINDEX, DC_EP0SETUP);
-+	isp1760_udc_set(udc, DC_EP0SETUP);
-=20
--	count =3D isp1760_udc_read(udc, DC_BUFLEN) & DC_DATACOUNT_MASK;
-+	count =3D isp1760_udc_read(udc, DC_BUFLEN);
- 	if (count !=3D sizeof(req)) {
- 		spin_unlock(&udc->lock);
-=20
-@@ -663,8 +726,8 @@ static void isp1760_ep0_setup(struct isp1760_udc *ud=
c)
- 		return;
- 	}
-=20
--	req.data[0] =3D isp1760_udc_read(udc, DC_DATAPORT);
--	req.data[1] =3D isp1760_udc_read(udc, DC_DATAPORT);
-+	req.data[0] =3D isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
-+	req.data[1] =3D isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
-=20
- 	if (udc->ep0_state !=3D ISP1760_CTRL_SETUP) {
- 		spin_unlock(&udc->lock);
-@@ -732,13 +795,13 @@ static int isp1760_ep_enable(struct usb_ep *ep,
-=20
- 	switch (usb_endpoint_type(desc)) {
- 	case USB_ENDPOINT_XFER_ISOC:
--		type =3D DC_ENDPTYP_ISOC;
-+		type =3D ISP176x_DC_ENDPTYP_ISOC;
- 		break;
- 	case USB_ENDPOINT_XFER_BULK:
--		type =3D DC_ENDPTYP_BULK;
-+		type =3D ISP176x_DC_ENDPTYP_BULK;
- 		break;
- 	case USB_ENDPOINT_XFER_INT:
--		type =3D DC_ENDPTYP_INTERRUPT;
-+		type =3D ISP176x_DC_ENDPTYP_INTERRUPT;
- 		break;
- 	case USB_ENDPOINT_XFER_CONTROL:
- 	default:
-@@ -755,10 +818,13 @@ static int isp1760_ep_enable(struct usb_ep *ep,
- 	uep->halted =3D false;
- 	uep->wedged =3D false;
-=20
--	isp1760_udc_select_ep(uep);
--	isp1760_udc_write(udc, DC_EPMAXPKTSZ, uep->maxpacket);
-+	isp1760_udc_select_ep(udc, uep);
-+
-+	isp1760_udc_write(udc, DC_FFOSZ, uep->maxpacket);
- 	isp1760_udc_write(udc, DC_BUFLEN, uep->maxpacket);
--	isp1760_udc_write(udc, DC_EPTYPE, DC_EPENABLE | type);
-+
-+	isp1760_udc_write(udc, DC_ENDPTYP, type);
-+	isp1760_udc_set(udc, DC_EPENABLE);
-=20
- 	spin_unlock_irqrestore(&udc->lock, flags);
-=20
-@@ -786,8 +852,9 @@ static int isp1760_ep_disable(struct usb_ep *ep)
- 	uep->desc =3D NULL;
- 	uep->maxpacket =3D 0;
-=20
--	isp1760_udc_select_ep(uep);
--	isp1760_udc_write(udc, DC_EPTYPE, 0);
-+	isp1760_udc_select_ep(udc, uep);
-+	isp1760_udc_clear(udc, DC_EPENABLE);
-+	isp1760_udc_clear(udc, DC_ENDPTYP);
-=20
- 	/* TODO Synchronize with the IRQ handler */
-=20
-@@ -864,8 +931,8 @@ static int isp1760_ep_queue(struct usb_ep *ep, struc=
t usb_request *_req,
-=20
- 		case ISP1760_CTRL_DATA_OUT:
- 			list_add_tail(&req->queue, &uep->queue);
--			__isp1760_udc_select_ep(uep, USB_DIR_OUT);
--			isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
-+			__isp1760_udc_select_ep(udc, uep, USB_DIR_OUT);
-+			isp1760_udc_set(udc, DC_DSEN);
- 			break;
-=20
- 		case ISP1760_CTRL_STATUS:
-@@ -1025,14 +1092,14 @@ static void isp1760_ep_fifo_flush(struct usb_ep =
*ep)
-=20
- 	spin_lock_irqsave(&udc->lock, flags);
-=20
--	isp1760_udc_select_ep(uep);
-+	isp1760_udc_select_ep(udc, uep);
-=20
- 	/*
- 	 * Set the CLBUF bit twice to flush both buffers in case double
- 	 * buffering is enabled.
- 	 */
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
-+	isp1760_udc_set(udc, DC_CLBUF);
-+	isp1760_udc_set(udc, DC_CLBUF);
-=20
- 	spin_unlock_irqrestore(&udc->lock, flags);
- }
-@@ -1091,19 +1158,22 @@ static void isp1760_udc_init_hw(struct isp1760_u=
dc *udc)
- 	 * ACK tokens only (and NYET for the out pipe). The default
- 	 * configuration also generates an interrupt on the first NACK token.
- 	 */
--	isp1760_udc_write(udc, DC_INTCONF, DC_CDBGMOD_ACK | DC_DDBGMODIN_ACK |
--			  DC_DDBGMODOUT_ACK_NYET);
--
--	isp1760_udc_write(udc, DC_INTENABLE, DC_IEPRXTX(7) | DC_IEPRXTX(6) |
--			  DC_IEPRXTX(5) | DC_IEPRXTX(4) | DC_IEPRXTX(3) |
--			  DC_IEPRXTX(2) | DC_IEPRXTX(1) | DC_IEPRXTX(0) |
--			  DC_IEP0SETUP | DC_IEVBUS | DC_IERESM | DC_IESUSP |
--			  DC_IEHS_STA | DC_IEBRST);
-+	isp1760_reg_write(udc->regs, ISP176x_DC_INTCONF,
-+			  ISP176x_DC_CDBGMOD_ACK | ISP176x_DC_DDBGMODIN_ACK |
-+			  ISP176x_DC_DDBGMODOUT_ACK);
-+
-+	isp1760_reg_write(udc->regs, ISP176x_DC_INTENABLE, DC_IEPRXTX(7) |
-+			  DC_IEPRXTX(6) | DC_IEPRXTX(5) | DC_IEPRXTX(4) |
-+			  DC_IEPRXTX(3) | DC_IEPRXTX(2) | DC_IEPRXTX(1) |
-+			  DC_IEPRXTX(0) | ISP176x_DC_IEP0SETUP |
-+			  ISP176x_DC_IEVBUS | ISP176x_DC_IERESM |
-+			  ISP176x_DC_IESUSP | ISP176x_DC_IEHS_STA |
-+			  ISP176x_DC_IEBRST);
-=20
- 	if (udc->connected)
- 		isp1760_set_pullup(udc->isp, true);
-=20
--	isp1760_udc_write(udc, DC_ADDRESS, DC_DEVEN);
-+	isp1760_udc_set(udc, DC_DEVEN);
- }
-=20
- static void isp1760_udc_reset(struct isp1760_udc *udc)
-@@ -1152,7 +1222,7 @@ static int isp1760_udc_get_frame(struct usb_gadget=
 *gadget)
- {
- 	struct isp1760_udc *udc =3D gadget_to_udc(gadget);
-=20
--	return isp1760_udc_read(udc, DC_FRAMENUM) & ((1 << 11) - 1);
-+	return isp1760_udc_read(udc, DC_FRAMENUM);
- }
-=20
- static int isp1760_udc_wakeup(struct usb_gadget *gadget)
-@@ -1219,7 +1289,7 @@ static int isp1760_udc_start(struct usb_gadget *ga=
dget,
- 	usb_gadget_set_state(&udc->gadget, USB_STATE_ATTACHED);
-=20
- 	/* DMA isn't supported yet, don't enable the DMA clock. */
--	isp1760_udc_write(udc, DC_MODE, DC_GLINTENA);
-+	isp1760_udc_set(udc, DC_GLINTENA);
-=20
- 	isp1760_udc_init_hw(udc);
-=20
-@@ -1238,7 +1308,7 @@ static int isp1760_udc_stop(struct usb_gadget *gad=
get)
-=20
- 	del_timer_sync(&udc->vbus_timer);
-=20
--	isp1760_udc_write(udc, DC_MODE, 0);
-+	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
-=20
- 	spin_lock_irqsave(&udc->lock, flags);
- 	udc->driver =3D NULL;
-@@ -1266,9 +1336,9 @@ static irqreturn_t isp1760_udc_irq(int irq, void *=
dev)
- 	unsigned int i;
- 	u32 status;
-=20
--	status =3D isp1760_udc_read(udc, DC_INTERRUPT)
--	       & isp1760_udc_read(udc, DC_INTENABLE);
--	isp1760_udc_write(udc, DC_INTERRUPT, status);
-+	status =3D isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
-+	       & isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
-+	isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
-=20
- 	if (status & DC_IEVBUS) {
- 		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
-@@ -1313,7 +1383,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *=
dev)
- 		dev_dbg(udc->isp->dev, "%s(SUSP)\n", __func__);
-=20
- 		spin_lock(&udc->lock);
--		if (!(isp1760_udc_read(udc, DC_MODE) & DC_VBUSSTAT))
-+		if (!isp1760_udc_is_set(udc, DC_VBUSSTAT))
- 			isp1760_udc_disconnect(udc);
- 		else
- 			isp1760_udc_suspend(udc);
-@@ -1335,7 +1405,7 @@ static void isp1760_udc_vbus_poll(struct timer_lis=
t *t)
-=20
- 	spin_lock_irqsave(&udc->lock, flags);
-=20
--	if (!(isp1760_udc_read(udc, DC_MODE) & DC_VBUSSTAT))
-+	if (!(isp1760_udc_is_set(udc, DC_VBUSSTAT)))
- 		isp1760_udc_disconnect(udc);
- 	else if (udc->gadget.state >=3D USB_STATE_POWERED)
- 		mod_timer(&udc->vbus_timer,
-@@ -1412,9 +1482,9 @@ static int isp1760_udc_init(struct isp1760_udc *ud=
c)
- 	 * register, and reading the scratch register value back. The chip ID
- 	 * and scratch register contents must match the expected values.
- 	 */
--	isp1760_udc_write(udc, DC_SCRATCH, 0xbabe);
--	chipid =3D isp1760_udc_read(udc, DC_CHIPID);
--	scratch =3D isp1760_udc_read(udc, DC_SCRATCH);
-+	isp1760_reg_write(udc->regs, ISP176x_DC_SCRATCH, 0xbabe);
-+	chipid =3D isp1760_reg_read(udc->regs, ISP176x_DC_CHIPID);
-+	scratch =3D isp1760_reg_read(udc->regs, ISP176x_DC_SCRATCH);
-=20
- 	if (scratch !=3D 0xbabe) {
- 		dev_err(udc->isp->dev,
-@@ -1429,9 +1499,9 @@ static int isp1760_udc_init(struct isp1760_udc *ud=
c)
- 	}
-=20
- 	/* Reset the device controller. */
--	isp1760_udc_write(udc, DC_MODE, DC_SFRESET);
-+	isp1760_udc_set(udc, DC_SFRESET);
- 	usleep_range(10000, 11000);
--	isp1760_udc_write(udc, DC_MODE, 0);
-+	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
- 	usleep_range(10000, 11000);
-=20
- 	return 0;
-@@ -1445,7 +1515,6 @@ int isp1760_udc_register(struct isp1760_device *is=
p, int irq,
-=20
- 	udc->irq =3D -1;
- 	udc->isp =3D isp;
--	udc->regs =3D isp->regs;
-=20
- 	spin_lock_init(&udc->lock);
- 	timer_setup(&udc->vbus_timer, isp1760_udc_vbus_poll, 0);
-diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp=
1760-udc.h
-index d2df650d54e9..a49096c0ac8e 100644
---- a/drivers/usb/isp1760/isp1760-udc.h
-+++ b/drivers/usb/isp1760/isp1760-udc.h
-@@ -17,6 +17,8 @@
- #include <linux/timer.h>
- #include <linux/usb/gadget.h>
-=20
-+#include "isp1760-regs.h"
-+
- struct isp1760_device;
- struct isp1760_udc;
-=20
-@@ -48,7 +50,7 @@ struct isp1760_ep {
-  * struct isp1760_udc - UDC state information
-  * irq: IRQ number
-  * irqname: IRQ name (as passed to request_irq)
-- * regs: Base address of the UDC registers
-+ * regs: regmap for UDC registers
-  * driver: Gadget driver
-  * gadget: Gadget device
-  * lock: Protects driver, vbus_timer, ep, ep0_*, DC_EPINDEX register
-@@ -59,12 +61,13 @@ struct isp1760_ep {
-  * connected: Tracks gadget driver bus connection state
-  */
- struct isp1760_udc {
--#ifdef CONFIG_USB_ISP1761_UDC
- 	struct isp1760_device *isp;
-=20
- 	int irq;
- 	char *irqname;
--	void __iomem *regs;
-+
-+	struct regmap *regs;
-+	struct regmap_field *fields[DC_FIELD_MAX];
-=20
- 	struct usb_gadget_driver *driver;
- 	struct usb_gadget gadget;
-@@ -81,7 +84,6 @@ struct isp1760_udc {
- 	bool connected;
-=20
- 	unsigned int devstatus;
--#endif
- };
-=20
- #ifdef CONFIG_USB_ISP1761_UDC
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-us=
b-isp1760-use-relaxed-primitives.patch b/meta-arm-bsp/recipes-kernel/linu=
x/files/corstone1000/0003-usb-isp1760-use-relaxed-primitives.patch
deleted file mode 100644
index 2e2e97aa..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-usb-isp17=
60-use-relaxed-primitives.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 03e28d5233d50fb2a27fa02d032e77974d03eb2b Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 13 May 2021 09:47:11 +0100
-Subject: [PATCH 03/23] usb: isp1760: use relaxed primitives
-
-Use io relaxed access memory primitives to satisfy strict type
-checking (__force).
-
-This will fix some existing sparse warnings:
-sparse: warning: cast to restricted __le32
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210513084717.2487366-4-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 20d142140574..2cc0555e029d 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -246,7 +246,7 @@ static void bank_reads8(void __iomem *src_base, u32 =
src_offset, u32 bank_addr,
-=20
- 	if (src_offset < PAYLOAD_OFFSET) {
- 		while (bytes >=3D 4) {
--			*dst =3D le32_to_cpu(__raw_readl(src));
-+			*dst =3D readl_relaxed(src);
- 			bytes -=3D 4;
- 			src++;
- 			dst++;
-@@ -267,7 +267,7 @@ static void bank_reads8(void __iomem *src_base, u32 =
src_offset, u32 bank_addr,
- 	 * allocated.
- 	 */
- 	if (src_offset < PAYLOAD_OFFSET)
--		val =3D le32_to_cpu(__raw_readl(src));
-+		val =3D readl_relaxed(src);
- 	else
- 		val =3D __raw_readl(src);
-=20
-@@ -301,7 +301,7 @@ static void mem_writes8(void __iomem *dst_base, u32 =
dst_offset,
-=20
- 	if (dst_offset < PAYLOAD_OFFSET) {
- 		while (bytes >=3D 4) {
--			__raw_writel(cpu_to_le32(*src), dst);
-+			writel_relaxed(*src, dst);
- 			bytes -=3D 4;
- 			src++;
- 			dst++;
-@@ -322,7 +322,7 @@ static void mem_writes8(void __iomem *dst_base, u32 =
dst_offset,
- 	 */
-=20
- 	if (dst_offset < PAYLOAD_OFFSET)
--		__raw_writel(cpu_to_le32(*src), dst);
-+		writel_relaxed(*src, dst);
- 	else
- 		__raw_writel(*src, dst);
- }
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-us=
b-isp1760-remove-platform-data-struct-and-code.patch b/meta-arm-bsp/recip=
es-kernel/linux/files/corstone1000/0004-usb-isp1760-remove-platform-data-=
struct-and-code.patch
deleted file mode 100644
index b8a3fabc..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-usb-isp17=
60-remove-platform-data-struct-and-code.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From f9a88370e6751c68a8f0d1c3f23100ca20596249 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 13 May 2021 09:47:12 +0100
-Subject: [PATCH 04/23] usb: isp1760: remove platform data struct and cod=
e
-
-Since the removal of the Blackfin port with:
-commit 4ba66a976072 ("arch: remove blackfin port")
-
-No one is using or referencing this header and platform data struct.
-Remove them.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210513084717.2487366-5-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-if.c | 20 +++-----------------
- 1 file changed, 3 insertions(+), 17 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1=
760-if.c
-index abfba9f5ec23..fb6701608cd8 100644
---- a/drivers/usb/isp1760/isp1760-if.c
-+++ b/drivers/usb/isp1760/isp1760-if.c
-@@ -16,7 +16,6 @@
- #include <linux/of.h>
- #include <linux/platform_device.h>
- #include <linux/slab.h>
--#include <linux/usb/isp1760.h>
- #include <linux/usb/hcd.h>
-=20
- #include "isp1760-core.h"
-@@ -225,22 +224,9 @@ static int isp1760_plat_probe(struct platform_devic=
e *pdev)
-=20
- 		if (of_property_read_bool(dp, "dreq-polarity"))
- 			devflags |=3D ISP1760_FLAG_DREQ_POL_HIGH;
--	} else if (dev_get_platdata(&pdev->dev)) {
--		struct isp1760_platform_data *pdata =3D
--			dev_get_platdata(&pdev->dev);
--
--		if (pdata->is_isp1761)
--			devflags |=3D ISP1760_FLAG_ISP1761;
--		if (pdata->bus_width_16)
--			devflags |=3D ISP1760_FLAG_BUS_WIDTH_16;
--		if (pdata->port1_otg)
--			devflags |=3D ISP1760_FLAG_OTG_EN;
--		if (pdata->analog_oc)
--			devflags |=3D ISP1760_FLAG_ANALOG_OC;
--		if (pdata->dack_polarity_high)
--			devflags |=3D ISP1760_FLAG_DACK_POL_HIGH;
--		if (pdata->dreq_polarity_high)
--			devflags |=3D ISP1760_FLAG_DREQ_POL_HIGH;
-+	} else {
-+		pr_err("isp1760: no platform data\n");
-+		return -ENXIO;
- 	}
-=20
- 	ret =3D isp1760_register(mem_res, irq_res->start, irqflags, &pdev->dev=
,
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-us=
b-isp1760-hcd-refactor-mempool-config-and-setup.patch b/meta-arm-bsp/reci=
pes-kernel/linux/files/corstone1000/0005-usb-isp1760-hcd-refactor-mempool=
-config-and-setup.patch
deleted file mode 100644
index 238c1bd4..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-usb-isp17=
60-hcd-refactor-mempool-config-and-setup.patch
+++ /dev/null
@@ -1,304 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From a74f639c5b5618e2c9f311c93bc3e7405de8ca85 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 13 May 2021 09:47:13 +0100
-Subject: [PATCH 05/23] usb: isp1760: hcd: refactor mempool config and se=
tup
-
-In preparation to support other family member IP, which may have
-different memory layout. Drop macros and setup a configuration
-struct.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210513084717.2487366-6-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-core.c | 21 ++++++++
- drivers/usb/isp1760/isp1760-hcd.c  | 83 ++++++++++++++++++++----------
- drivers/usb/isp1760/isp1760-hcd.h  | 37 ++++++-------
- 3 files changed, 92 insertions(+), 49 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-index c79ba98df9f9..35a7667e411c 100644
---- a/drivers/usb/isp1760/isp1760-core.c
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -101,6 +101,25 @@ void isp1760_set_pullup(struct isp1760_device *isp,=
 bool enable)
- 		isp1760_field_set(udc->fields, HW_DP_PULLUP_CLEAR);
- }
-=20
-+/*
-+ * 60kb divided in:
-+ * - 32 blocks @ 256  bytes
-+ * - 20 blocks @ 1024 bytes
-+ * -  4 blocks @ 8192 bytes
-+ */
-+static const struct isp1760_memory_layout isp176x_memory_conf =3D {
-+	.blocks[0]		=3D 32,
-+	.blocks_size[0]		=3D 256,
-+	.blocks[1]		=3D 20,
-+	.blocks_size[1]		=3D 1024,
-+	.blocks[2]		=3D 4,
-+	.blocks_size[2]		=3D 8192,
-+
-+	.ptd_num		=3D 32,
-+	.payload_blocks		=3D 32 + 20 + 4,
-+	.payload_area_size	=3D 0xf000,
-+};
-+
- static const struct regmap_range isp176x_hc_volatile_ranges[] =3D {
- 	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
- 	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
-@@ -302,6 +321,8 @@ int isp1760_register(struct resource *mem, int irq, =
unsigned long irqflags,
- 		udc->fields[i] =3D f;
- 	}
-=20
-+	hcd->memory_layout =3D &isp176x_memory_conf;
-+
- 	isp1760_init_core(isp);
-=20
- 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 2cc0555e029d..a65f5f917ebe 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -358,39 +358,29 @@ static void ptd_write(void __iomem *base, u32 ptd_=
offset, u32 slot,
- /* memory management of the 60kb on the chip from 0x1000 to 0xffff */
- static void init_memory(struct isp1760_hcd *priv)
- {
--	int i, curr;
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+	int i, j, curr;
- 	u32 payload_addr;
-=20
- 	payload_addr =3D PAYLOAD_OFFSET;
--	for (i =3D 0; i < BLOCK_1_NUM; i++) {
--		priv->memory_pool[i].start =3D payload_addr;
--		priv->memory_pool[i].size =3D BLOCK_1_SIZE;
--		priv->memory_pool[i].free =3D 1;
--		payload_addr +=3D priv->memory_pool[i].size;
--	}
--
--	curr =3D i;
--	for (i =3D 0; i < BLOCK_2_NUM; i++) {
--		priv->memory_pool[curr + i].start =3D payload_addr;
--		priv->memory_pool[curr + i].size =3D BLOCK_2_SIZE;
--		priv->memory_pool[curr + i].free =3D 1;
--		payload_addr +=3D priv->memory_pool[curr + i].size;
--	}
-=20
--	curr =3D i;
--	for (i =3D 0; i < BLOCK_3_NUM; i++) {
--		priv->memory_pool[curr + i].start =3D payload_addr;
--		priv->memory_pool[curr + i].size =3D BLOCK_3_SIZE;
--		priv->memory_pool[curr + i].free =3D 1;
--		payload_addr +=3D priv->memory_pool[curr + i].size;
-+	for (i =3D 0, curr =3D 0; i < ARRAY_SIZE(mem->blocks); i++) {
-+		for (j =3D 0; j < mem->blocks[i]; j++, curr++) {
-+			priv->memory_pool[curr + j].start =3D payload_addr;
-+			priv->memory_pool[curr + j].size =3D mem->blocks_size[i];
-+			priv->memory_pool[curr + j].free =3D 1;
-+			payload_addr +=3D priv->memory_pool[curr + j].size;
-+		}
- 	}
-=20
--	WARN_ON(payload_addr - priv->memory_pool[0].start > PAYLOAD_AREA_SIZE)=
;
-+	WARN_ON(payload_addr - priv->memory_pool[0].start >
-+		mem->payload_area_size);
- }
-=20
- static void alloc_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
- 	int i;
-=20
- 	WARN_ON(qtd->payload_addr);
-@@ -398,7 +388,7 @@ static void alloc_mem(struct usb_hcd *hcd, struct is=
p1760_qtd *qtd)
- 	if (!qtd->length)
- 		return;
-=20
--	for (i =3D 0; i < BLOCKS; i++) {
-+	for (i =3D 0; i < mem->payload_blocks; i++) {
- 		if (priv->memory_pool[i].size >=3D qtd->length &&
- 				priv->memory_pool[i].free) {
- 			priv->memory_pool[i].free =3D 0;
-@@ -411,12 +401,13 @@ static void alloc_mem(struct usb_hcd *hcd, struct =
isp1760_qtd *qtd)
- static void free_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
- 	int i;
-=20
- 	if (!qtd->payload_addr)
- 		return;
-=20
--	for (i =3D 0; i < BLOCKS; i++) {
-+	for (i =3D 0; i < mem->payload_blocks; i++) {
- 		if (priv->memory_pool[i].start =3D=3D qtd->payload_addr) {
- 			WARN_ON(priv->memory_pool[i].free);
- 			priv->memory_pool[i].free =3D 1;
-@@ -1407,8 +1398,6 @@ static int qtd_fill(struct isp1760_qtd *qtd, void =
*databuffer, size_t len)
- {
- 	qtd->data_buffer =3D databuffer;
-=20
--	if (len > MAX_PAYLOAD_SIZE)
--		len =3D MAX_PAYLOAD_SIZE;
- 	qtd->length =3D len;
-=20
- 	return qtd->length;
-@@ -1432,6 +1421,8 @@ static void qtd_list_free(struct list_head *qtd_li=
st)
- static void packetize_urb(struct usb_hcd *hcd,
- 		struct urb *urb, struct list_head *head, gfp_t flags)
- {
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
- 	struct isp1760_qtd *qtd;
- 	void *buf;
- 	int len, maxpacketsize;
-@@ -1484,6 +1475,10 @@ static void packetize_urb(struct usb_hcd *hcd,
- 		qtd =3D qtd_alloc(flags, urb, packet_type);
- 		if (!qtd)
- 			goto cleanup;
-+
-+		if (len > mem->blocks_size[ISP176x_BLOCK_NUM - 1])
-+			len =3D mem->blocks_size[ISP176x_BLOCK_NUM - 1];
-+
- 		this_qtd_len =3D qtd_fill(qtd, buf, len);
- 		list_add_tail(&qtd->qtd_list, head);
-=20
-@@ -2212,6 +2207,7 @@ int isp1760_hcd_register(struct isp1760_hcd *priv,=
 struct resource *mem,
- 			 int irq, unsigned long irqflags,
- 			 struct device *dev)
- {
-+	const struct isp1760_memory_layout *mem_layout =3D priv->memory_layout=
;
- 	struct usb_hcd *hcd;
- 	int ret;
-=20
-@@ -2223,6 +2219,28 @@ int isp1760_hcd_register(struct isp1760_hcd *priv=
, struct resource *mem,
-=20
- 	priv->hcd =3D hcd;
-=20
-+	priv->memory_pool =3D kcalloc(mem_layout->payload_blocks,
-+				    sizeof(struct isp1760_memory_chunk),
-+				    GFP_KERNEL);
-+	if (!priv->memory_pool) {
-+		ret =3D -ENOMEM;
-+		goto put_hcd;
-+	}
-+
-+	priv->atl_slots =3D kcalloc(mem_layout->ptd_num,
-+				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
-+	if (!priv->atl_slots) {
-+		ret =3D -ENOMEM;
-+		goto free_mem_pool;
-+	}
-+
-+	priv->int_slots =3D kcalloc(mem_layout->ptd_num,
-+				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
-+	if (!priv->int_slots) {
-+		ret =3D -ENOMEM;
-+		goto free_atl_slots;
-+	}
-+
- 	init_memory(priv);
-=20
- 	hcd->irq =3D irq;
-@@ -2234,13 +2252,19 @@ int isp1760_hcd_register(struct isp1760_hcd *pri=
v, struct resource *mem,
-=20
- 	ret =3D usb_add_hcd(hcd, irq, irqflags);
- 	if (ret)
--		goto error;
-+		goto free_int_slots;
-=20
- 	device_wakeup_enable(hcd->self.controller);
-=20
- 	return 0;
-=20
--error:
-+free_int_slots:
-+	kfree(priv->int_slots);
-+free_atl_slots:
-+	kfree(priv->atl_slots);
-+free_mem_pool:
-+	kfree(priv->memory_pool);
-+put_hcd:
- 	usb_put_hcd(hcd);
- 	return ret;
- }
-@@ -2252,4 +2276,7 @@ void isp1760_hcd_unregister(struct isp1760_hcd *pr=
iv)
-=20
- 	usb_remove_hcd(priv->hcd);
- 	usb_put_hcd(priv->hcd);
-+	kfree(priv->atl_slots);
-+	kfree(priv->int_slots);
-+	kfree(priv->memory_pool);
- }
-diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp=
1760-hcd.h
-index 34e1899e52c4..9d2427ce3f1a 100644
---- a/drivers/usb/isp1760/isp1760-hcd.h
-+++ b/drivers/usb/isp1760/isp1760-hcd.h
-@@ -12,24 +12,6 @@ struct isp1760_qtd;
- struct resource;
- struct usb_hcd;
-=20
--/*
-- * 60kb divided in:
-- * - 32 blocks @ 256  bytes
-- * - 20 blocks @ 1024 bytes
-- * -  4 blocks @ 8192 bytes
-- */
--
--#define BLOCK_1_NUM 32
--#define BLOCK_2_NUM 20
--#define BLOCK_3_NUM 4
--
--#define BLOCK_1_SIZE 256
--#define BLOCK_2_SIZE 1024
--#define BLOCK_3_SIZE 8192
--#define BLOCKS (BLOCK_1_NUM + BLOCK_2_NUM + BLOCK_3_NUM)
--#define MAX_PAYLOAD_SIZE BLOCK_3_SIZE
--#define PAYLOAD_AREA_SIZE 0xf000
--
- struct isp1760_slotinfo {
- 	struct isp1760_qh *qh;
- 	struct isp1760_qtd *qtd;
-@@ -37,6 +19,17 @@ struct isp1760_slotinfo {
- };
-=20
- /* chip memory management */
-+#define ISP176x_BLOCK_NUM 3
-+
-+struct isp1760_memory_layout {
-+	unsigned int blocks[ISP176x_BLOCK_NUM];
-+	unsigned int blocks_size[ISP176x_BLOCK_NUM];
-+
-+	unsigned int ptd_num;
-+	unsigned int payload_blocks;
-+	unsigned int payload_area_size;
-+};
-+
- struct isp1760_memory_chunk {
- 	unsigned int start;
- 	unsigned int size;
-@@ -58,12 +51,14 @@ struct isp1760_hcd {
- 	struct regmap		*regs;
- 	struct regmap_field	*fields[HC_FIELD_MAX];
-=20
-+	const struct isp1760_memory_layout	*memory_layout;
-+
- 	spinlock_t		lock;
--	struct isp1760_slotinfo	atl_slots[32];
-+	struct isp1760_slotinfo	*atl_slots;
- 	int			atl_done_map;
--	struct isp1760_slotinfo	int_slots[32];
-+	struct isp1760_slotinfo	*int_slots;
- 	int			int_done_map;
--	struct isp1760_memory_chunk memory_pool[BLOCKS];
-+	struct isp1760_memory_chunk *memory_pool;
- 	struct list_head	qh_list[QH_END];
-=20
- 	/* periodic schedule support */
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-us=
b-isp1760-use-dr_mode-binding.patch b/meta-arm-bsp/recipes-kernel/linux/f=
iles/corstone1000/0006-usb-isp1760-use-dr_mode-binding.patch
deleted file mode 100644
index e6965350..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-usb-isp17=
60-use-dr_mode-binding.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 3eb96e04be9918afa54b64fac943de86a9798bda Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 13 May 2021 09:47:14 +0100
-Subject: [PATCH 06/23] usb: isp1760: use dr_mode binding
-
-There is already a binding to describe the dual role mode (dr_mode),
-use that instead of defining a new one (port1-otg).
-
-Update driver code and devicetree files that use that port1-otg
-binding.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210513084717.2487366-7-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-core.c | 3 +--
- drivers/usb/isp1760/isp1760-core.h | 2 +-
- drivers/usb/isp1760/isp1760-if.c   | 5 +++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-index 35a7667e411c..0aeeb12d3bfe 100644
---- a/drivers/usb/isp1760/isp1760-core.c
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -73,10 +73,9 @@ static void isp1760_init_core(struct isp1760_device *=
isp)
- 	 * on ISP1761.
- 	 *
- 	 * TODO: Really support OTG. For now we configure port 1 in device mod=
e
--	 * when OTG is requested.
- 	 */
- 	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
--	    (isp->devflags & ISP1760_FLAG_OTG_EN)) {
-+	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
- 		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
- 		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
- 		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
-diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/is=
p1760-core.h
-index 8fec6395f19f..7a6755d68d41 100644
---- a/drivers/usb/isp1760/isp1760-core.h
-+++ b/drivers/usb/isp1760/isp1760-core.h
-@@ -28,7 +28,7 @@ struct gpio_desc;
-  * a sane default configuration.
-  */
- #define ISP1760_FLAG_BUS_WIDTH_16	0x00000002 /* 16-bit data bus width *=
/
--#define ISP1760_FLAG_OTG_EN		0x00000004 /* Port 1 supports OTG */
-+#define ISP1760_FLAG_PERIPHERAL_EN	0x00000004 /* Port 1 supports Periph=
eral mode*/
- #define ISP1760_FLAG_ANALOG_OC		0x00000008 /* Analog overcurrent */
- #define ISP1760_FLAG_DACK_POL_HIGH	0x00000010 /* DACK active high */
- #define ISP1760_FLAG_DREQ_POL_HIGH	0x00000020 /* DREQ active high */
-diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1=
760-if.c
-index fb6701608cd8..cb3e4d782315 100644
---- a/drivers/usb/isp1760/isp1760-if.c
-+++ b/drivers/usb/isp1760/isp1760-if.c
-@@ -17,6 +17,7 @@
- #include <linux/platform_device.h>
- #include <linux/slab.h>
- #include <linux/usb/hcd.h>
-+#include <linux/usb/otg.h>
-=20
- #include "isp1760-core.h"
- #include "isp1760-regs.h"
-@@ -213,8 +214,8 @@ static int isp1760_plat_probe(struct platform_device=
 *pdev)
- 		if (bus_width =3D=3D 16)
- 			devflags |=3D ISP1760_FLAG_BUS_WIDTH_16;
-=20
--		if (of_property_read_bool(dp, "port1-otg"))
--			devflags |=3D ISP1760_FLAG_OTG_EN;
-+		if (usb_get_dr_mode(&pdev->dev) =3D=3D USB_DR_MODE_PERIPHERAL)
-+			devflags |=3D ISP1760_FLAG_PERIPHERAL_EN;
-=20
- 		if (of_property_read_bool(dp, "analog-oc"))
- 			devflags |=3D ISP1760_FLAG_ANALOG_OC;
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0007-us=
b-isp1760-add-support-for-isp1763.patch b/meta-arm-bsp/recipes-kernel/lin=
ux/files/corstone1000/0007-usb-isp1760-add-support-for-isp1763.patch
deleted file mode 100644
index 78a483c7..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0007-usb-isp17=
60-add-support-for-isp1763.patch
+++ /dev/null
@@ -1,1894 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 60d789f3bfbb7428e6ba2949de70a6db8e12e8fa Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 13 May 2021 09:47:15 +0100
-Subject: [PATCH 07/23] usb: isp1760: add support for isp1763
-
-isp1763 have some differences from the isp1760, 8 bit address for
-registers and 16 bit for values, no bulk access to memory addresses,
-16 PTD's instead of 32.
-
-Following the regmap work done before add the registers, memory access
-and add the functions to support differences in setup sequences.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210513084717.2487366-8-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/Kconfig        |   4 +-
- drivers/usb/isp1760/isp1760-core.c | 301 ++++++++++++--
- drivers/usb/isp1760/isp1760-core.h |   4 +
- drivers/usb/isp1760/isp1760-hcd.c  | 627 ++++++++++++++++++++++-------
- drivers/usb/isp1760/isp1760-hcd.h  |   6 +-
- drivers/usb/isp1760/isp1760-if.c   |  12 +-
- drivers/usb/isp1760/isp1760-regs.h |  95 ++++-
- drivers/usb/isp1760/isp1760-udc.c  |   2 +
- drivers/usb/isp1760/isp1760-udc.h  |   2 +
- 9 files changed, 849 insertions(+), 204 deletions(-)
-
-diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
-index d23853f601b1..2ed2b73291d1 100644
---- a/drivers/usb/isp1760/Kconfig
-+++ b/drivers/usb/isp1760/Kconfig
-@@ -1,11 +1,11 @@
- # SPDX-License-Identifier: GPL-2.0
-=20
- config USB_ISP1760
--	tristate "NXP ISP 1760/1761 support"
-+	tristate "NXP ISP 1760/1761/1763 support"
- 	depends on USB || USB_GADGET
- 	select REGMAP_MMIO
- 	help
--	  Say Y or M here if your system as an ISP1760 USB host controller
-+	  Say Y or M here if your system as an ISP1760/1763 USB host controlle=
r
- 	  or an ISP1761 USB dual-role controller.
-=20
- 	  This driver does not support isochronous transfers or OTG.
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-index 0aeeb12d3bfe..1d847f13abab 100644
---- a/drivers/usb/isp1760/isp1760-core.c
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -2,12 +2,14 @@
- /*
-  * Driver for the NXP ISP1760 chip
-  *
-+ * Copyright 2021 Linaro, Rui Miguel Silva
-  * Copyright 2014 Laurent Pinchart
-  * Copyright 2007 Sebastian Siewior
-  *
-  * Contacts:
-  *	Sebastian Siewior <bigeasy@linutronix.de>
-  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-+ *	Rui Miguel Silva <rui.silva@linaro.org>
-  */
-=20
- #include <linux/delay.h>
-@@ -24,7 +26,7 @@
- #include "isp1760-regs.h"
- #include "isp1760-udc.h"
-=20
--static void isp1760_init_core(struct isp1760_device *isp)
-+static int isp1760_init_core(struct isp1760_device *isp)
- {
- 	struct isp1760_hcd *hcd =3D &isp->hcd;
- 	struct isp1760_udc *udc =3D &isp->udc;
-@@ -44,8 +46,15 @@ static void isp1760_init_core(struct isp1760_device *=
isp)
- 	msleep(100);
-=20
- 	/* Setup HW Mode Control: This assumes a level active-low interrupt */
-+	if ((isp->devflags & ISP1760_FLAG_ANALOG_OC) && hcd->is_isp1763) {
-+		dev_err(isp->dev, "isp1763 analog overcurrent not available\n");
-+		return -EINVAL;
-+	}
-+
- 	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
- 		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
-+	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_8)
-+		isp1760_field_set(hcd->fields, HW_DATA_BUS_WIDTH);
- 	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
- 		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
- 	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
-@@ -85,9 +94,14 @@ static void isp1760_init_core(struct isp1760_device *=
isp)
- 		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
- 	}
-=20
--	dev_info(isp->dev, "bus width: %u, oc: %s\n",
-+	dev_info(isp->dev, "%s bus width: %u, oc: %s\n",
-+		 hcd->is_isp1763 ? "isp1763" : "isp1760",
-+		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_8 ? 8 :
- 		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
-+		 hcd->is_isp1763 ? "not available" :
- 		 isp->devflags & ISP1760_FLAG_ANALOG_OC ? "analog" : "digital");
-+
-+	return 0;
- }
-=20
- void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
-@@ -101,6 +115,8 @@ void isp1760_set_pullup(struct isp1760_device *isp, =
bool enable)
- }
-=20
- /*
-+ * ISP1760/61:
-+ *
-  * 60kb divided in:
-  * - 32 blocks @ 256  bytes
-  * - 20 blocks @ 1024 bytes
-@@ -114,15 +130,36 @@ static const struct isp1760_memory_layout isp176x_=
memory_conf =3D {
- 	.blocks[2]		=3D 4,
- 	.blocks_size[2]		=3D 8192,
-=20
--	.ptd_num		=3D 32,
-+	.slot_num		=3D 32,
- 	.payload_blocks		=3D 32 + 20 + 4,
- 	.payload_area_size	=3D 0xf000,
- };
-=20
-+/*
-+ * ISP1763:
-+ *
-+ * 20kb divided in:
-+ * - 8 blocks @ 256  bytes
-+ * - 2 blocks @ 1024 bytes
-+ * - 4 blocks @ 4096 bytes
-+ */
-+static const struct isp1760_memory_layout isp1763_memory_conf =3D {
-+	.blocks[0]		=3D 8,
-+	.blocks_size[0]		=3D 256,
-+	.blocks[1]		=3D 2,
-+	.blocks_size[1]		=3D 1024,
-+	.blocks[2]		=3D 4,
-+	.blocks_size[2]		=3D 4096,
-+
-+	.slot_num		=3D 16,
-+	.payload_blocks		=3D 8 + 2 + 4,
-+	.payload_area_size	=3D 0x5000,
-+};
-+
- static const struct regmap_range isp176x_hc_volatile_ranges[] =3D {
- 	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
- 	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
--	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_ATL_IRQ_MASK_AND),
-+	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_OTG_CTRL_CLEAR),
- };
-=20
- static const struct regmap_access_table isp176x_hc_volatile_table =3D {
-@@ -130,13 +167,13 @@ static const struct regmap_access_table isp176x_hc=
_volatile_table =3D {
- 	.n_yes_ranges	=3D ARRAY_SIZE(isp176x_hc_volatile_ranges),
- };
-=20
--static struct regmap_config isp1760_hc_regmap_conf =3D {
-+static const struct regmap_config isp1760_hc_regmap_conf =3D {
- 	.name =3D "isp1760-hc",
- 	.reg_bits =3D 16,
- 	.reg_stride =3D 4,
- 	.val_bits =3D 32,
- 	.fast_io =3D true,
--	.max_register =3D ISP176x_HC_MEMORY,
-+	.max_register =3D ISP176x_HC_OTG_CTRL_CLEAR,
- 	.volatile_table =3D &isp176x_hc_volatile_table,
- };
-=20
-@@ -151,6 +188,15 @@ static const struct reg_field isp1760_hc_reg_fields=
[] =3D {
- 	[STS_PCD]		=3D REG_FIELD(ISP176x_HC_USBSTS, 2, 2),
- 	[HC_FRINDEX]		=3D REG_FIELD(ISP176x_HC_FRINDEX, 0, 13),
- 	[FLAG_CF]		=3D REG_FIELD(ISP176x_HC_CONFIGFLAG, 0, 0),
-+	[HC_ISO_PTD_DONEMAP]	=3D REG_FIELD(ISP176x_HC_ISO_PTD_DONEMAP, 0, 31),
-+	[HC_ISO_PTD_SKIPMAP]	=3D REG_FIELD(ISP176x_HC_ISO_PTD_SKIPMAP, 0, 31),
-+	[HC_ISO_PTD_LASTPTD]	=3D REG_FIELD(ISP176x_HC_ISO_PTD_LASTPTD, 0, 31),
-+	[HC_INT_PTD_DONEMAP]	=3D REG_FIELD(ISP176x_HC_INT_PTD_DONEMAP, 0, 31),
-+	[HC_INT_PTD_SKIPMAP]	=3D REG_FIELD(ISP176x_HC_INT_PTD_SKIPMAP, 0, 31),
-+	[HC_INT_PTD_LASTPTD]	=3D REG_FIELD(ISP176x_HC_INT_PTD_LASTPTD, 0, 31),
-+	[HC_ATL_PTD_DONEMAP]	=3D REG_FIELD(ISP176x_HC_ATL_PTD_DONEMAP, 0, 31),
-+	[HC_ATL_PTD_SKIPMAP]	=3D REG_FIELD(ISP176x_HC_ATL_PTD_SKIPMAP, 0, 31),
-+	[HC_ATL_PTD_LASTPTD]	=3D REG_FIELD(ISP176x_HC_ATL_PTD_LASTPTD, 0, 31),
- 	[PORT_OWNER]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 13, 13),
- 	[PORT_POWER]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 12, 12),
- 	[PORT_LSTATUS]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 10, 11),
-@@ -169,18 +215,135 @@ static const struct reg_field isp1760_hc_reg_fiel=
ds[] =3D {
- 	[HW_INTR_HIGH_ACT]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 2, 2),
- 	[HW_INTR_EDGE_TRIG]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 1, 1),
- 	[HW_GLOBAL_INTR_EN]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 0, 0),
-+	[HC_CHIP_REV]		=3D REG_FIELD(ISP176x_HC_CHIP_ID, 16, 31),
-+	[HC_CHIP_ID_HIGH]	=3D REG_FIELD(ISP176x_HC_CHIP_ID, 8, 15),
-+	[HC_CHIP_ID_LOW]	=3D REG_FIELD(ISP176x_HC_CHIP_ID, 0, 7),
-+	[HC_SCRATCH]		=3D REG_FIELD(ISP176x_HC_SCRATCH, 0, 31),
- 	[SW_RESET_RESET_ALL]	=3D REG_FIELD(ISP176x_HC_RESET, 0, 0),
-+	[ISO_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 2, 2),
- 	[INT_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
- 	[ATL_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
- 	[MEM_BANK_SEL]		=3D REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
- 	[MEM_START_ADDR]	=3D REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
--	[HC_INT_ENABLE]		=3D REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 8),
-+	[HC_INTERRUPT]		=3D REG_FIELD(ISP176x_HC_INTERRUPT, 0, 9),
-+	[HC_ATL_IRQ_ENABLE]	=3D REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 8, 8),
-+	[HC_INT_IRQ_ENABLE]	=3D REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 7),
-+	[HC_ISO_IRQ_MASK_OR]	=3D REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_OR, 0, 31),
-+	[HC_INT_IRQ_MASK_OR]	=3D REG_FIELD(ISP176x_HC_INT_IRQ_MASK_OR, 0, 31),
-+	[HC_ATL_IRQ_MASK_OR]	=3D REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_OR, 0, 31),
-+	[HC_ISO_IRQ_MASK_AND]	=3D REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_AND, 0, 31=
),
-+	[HC_INT_IRQ_MASK_AND]	=3D REG_FIELD(ISP176x_HC_INT_IRQ_MASK_AND, 0, 31=
),
-+	[HC_ATL_IRQ_MASK_AND]	=3D REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_AND, 0, 31=
),
-+	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 10, 10),
-+	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 7, 7),
-+	[HW_VBUS_DRV]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 4, 4),
-+	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 3, 3),
-+	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 2, 2),
-+	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 1, 1),
-+	[HW_DP_PULLUP]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 0, 0),
-+	[HW_OTG_DISABLE_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 10, 10=
),
-+	[HW_SW_SEL_HC_DC_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 7, 7)=
,
-+	[HW_VBUS_DRV_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 4, 4),
-+	[HW_SEL_CP_EXT_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 3, 3),
-+	[HW_DM_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 2, 2),
-+	[HW_DP_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 1, 1),
-+	[HW_DP_PULLUP_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 0, 0),
-+};
-+
-+static const struct reg_field isp1763_hc_reg_fields[] =3D {
-+	[CMD_LRESET]		=3D REG_FIELD(ISP1763_HC_USBCMD, 7, 7),
-+	[CMD_RESET]		=3D REG_FIELD(ISP1763_HC_USBCMD, 1, 1),
-+	[CMD_RUN]		=3D REG_FIELD(ISP1763_HC_USBCMD, 0, 0),
-+	[STS_PCD]		=3D REG_FIELD(ISP1763_HC_USBSTS, 2, 2),
-+	[HC_FRINDEX]		=3D REG_FIELD(ISP1763_HC_FRINDEX, 0, 13),
-+	[FLAG_CF]		=3D REG_FIELD(ISP1763_HC_CONFIGFLAG, 0, 0),
-+	[HC_ISO_PTD_DONEMAP]	=3D REG_FIELD(ISP1763_HC_ISO_PTD_DONEMAP, 0, 15),
-+	[HC_ISO_PTD_SKIPMAP]	=3D REG_FIELD(ISP1763_HC_ISO_PTD_SKIPMAP, 0, 15),
-+	[HC_ISO_PTD_LASTPTD]	=3D REG_FIELD(ISP1763_HC_ISO_PTD_LASTPTD, 0, 15),
-+	[HC_INT_PTD_DONEMAP]	=3D REG_FIELD(ISP1763_HC_INT_PTD_DONEMAP, 0, 15),
-+	[HC_INT_PTD_SKIPMAP]	=3D REG_FIELD(ISP1763_HC_INT_PTD_SKIPMAP, 0, 15),
-+	[HC_INT_PTD_LASTPTD]	=3D REG_FIELD(ISP1763_HC_INT_PTD_LASTPTD, 0, 15),
-+	[HC_ATL_PTD_DONEMAP]	=3D REG_FIELD(ISP1763_HC_ATL_PTD_DONEMAP, 0, 15),
-+	[HC_ATL_PTD_SKIPMAP]	=3D REG_FIELD(ISP1763_HC_ATL_PTD_SKIPMAP, 0, 15),
-+	[HC_ATL_PTD_LASTPTD]	=3D REG_FIELD(ISP1763_HC_ATL_PTD_LASTPTD, 0, 15),
-+	[PORT_OWNER]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 13, 13),
-+	[PORT_POWER]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 12, 12),
-+	[PORT_LSTATUS]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 10, 11),
-+	[PORT_RESET]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 8, 8),
-+	[PORT_SUSPEND]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 7, 7),
-+	[PORT_RESUME]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 6, 6),
-+	[PORT_PE]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 2, 2),
-+	[PORT_CSC]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 1, 1),
-+	[PORT_CONNECT]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 0, 0),
-+	[HW_DATA_BUS_WIDTH]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 4, 4),
-+	[HW_DACK_POL_HIGH]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 6, 6),
-+	[HW_DREQ_POL_HIGH]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 5, 5),
-+	[HW_INTF_LOCK]		=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 3, 3),
-+	[HW_INTR_HIGH_ACT]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 2, 2),
-+	[HW_INTR_EDGE_TRIG]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 1, 1),
-+	[HW_GLOBAL_INTR_EN]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 0, 0),
-+	[SW_RESET_RESET_ATX]	=3D REG_FIELD(ISP1763_HC_RESET, 3, 3),
-+	[SW_RESET_RESET_ALL]	=3D REG_FIELD(ISP1763_HC_RESET, 0, 0),
-+	[HC_CHIP_ID_HIGH]	=3D REG_FIELD(ISP1763_HC_CHIP_ID, 0, 15),
-+	[HC_CHIP_ID_LOW]	=3D REG_FIELD(ISP1763_HC_CHIP_REV, 8, 15),
-+	[HC_CHIP_REV]		=3D REG_FIELD(ISP1763_HC_CHIP_REV, 0, 7),
-+	[HC_SCRATCH]		=3D REG_FIELD(ISP1763_HC_SCRATCH, 0, 15),
-+	[ISO_BUF_FILL]		=3D REG_FIELD(ISP1763_HC_BUFFER_STATUS, 2, 2),
-+	[INT_BUF_FILL]		=3D REG_FIELD(ISP1763_HC_BUFFER_STATUS, 1, 1),
-+	[ATL_BUF_FILL]		=3D REG_FIELD(ISP1763_HC_BUFFER_STATUS, 0, 0),
-+	[MEM_START_ADDR]	=3D REG_FIELD(ISP1763_HC_MEMORY, 0, 15),
-+	[HC_DATA]		=3D REG_FIELD(ISP1763_HC_DATA, 0, 15),
-+	[HC_INTERRUPT]		=3D REG_FIELD(ISP1763_HC_INTERRUPT, 0, 10),
-+	[HC_ATL_IRQ_ENABLE]	=3D REG_FIELD(ISP1763_HC_INTERRUPT_ENABLE, 8, 8),
-+	[HC_INT_IRQ_ENABLE]	=3D REG_FIELD(ISP1763_HC_INTERRUPT_ENABLE, 7, 7),
-+	[HC_ISO_IRQ_MASK_OR]	=3D REG_FIELD(ISP1763_HC_ISO_IRQ_MASK_OR, 0, 15),
-+	[HC_INT_IRQ_MASK_OR]	=3D REG_FIELD(ISP1763_HC_INT_IRQ_MASK_OR, 0, 15),
-+	[HC_ATL_IRQ_MASK_OR]	=3D REG_FIELD(ISP1763_HC_ATL_IRQ_MASK_OR, 0, 15),
-+	[HC_ISO_IRQ_MASK_AND]	=3D REG_FIELD(ISP1763_HC_ISO_IRQ_MASK_AND, 0, 15=
),
-+	[HC_INT_IRQ_MASK_AND]	=3D REG_FIELD(ISP1763_HC_INT_IRQ_MASK_AND, 0, 15=
),
-+	[HC_ATL_IRQ_MASK_AND]	=3D REG_FIELD(ISP1763_HC_ATL_IRQ_MASK_AND, 0, 15=
),
-+	[HW_HC_2_DIS]		=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 15, 15),
-+	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 10, 10),
-+	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 7, 7),
-+	[HW_VBUS_DRV]		=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 4, 4),
-+	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 3, 3),
-+	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 2, 2),
-+	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 1, 1),
-+	[HW_DP_PULLUP]		=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 0, 0),
-+	[HW_HC_2_DIS_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 15, 15),
-+	[HW_OTG_DISABLE_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 10, 10=
),
-+	[HW_SW_SEL_HC_DC_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 7, 7)=
,
-+	[HW_VBUS_DRV_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 4, 4),
-+	[HW_SEL_CP_EXT_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 3, 3),
-+	[HW_DM_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 2, 2),
-+	[HW_DP_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 1, 1),
-+	[HW_DP_PULLUP_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 0, 0),
-+};
-+
-+static const struct regmap_range isp1763_hc_volatile_ranges[] =3D {
-+	regmap_reg_range(ISP1763_HC_USBCMD, ISP1763_HC_ATL_PTD_LASTPTD),
-+	regmap_reg_range(ISP1763_HC_BUFFER_STATUS, ISP1763_HC_DATA),
-+	regmap_reg_range(ISP1763_HC_INTERRUPT, ISP1763_HC_OTG_CTRL_CLEAR),
-+};
-+
-+static const struct regmap_access_table isp1763_hc_volatile_table =3D {
-+	.yes_ranges	=3D isp1763_hc_volatile_ranges,
-+	.n_yes_ranges	=3D ARRAY_SIZE(isp1763_hc_volatile_ranges),
-+};
-+
-+static const struct regmap_config isp1763_hc_regmap_conf =3D {
-+	.name =3D "isp1763-hc",
-+	.reg_bits =3D 8,
-+	.reg_stride =3D 2,
-+	.val_bits =3D 16,
-+	.fast_io =3D true,
-+	.max_register =3D ISP1763_HC_OTG_CTRL_CLEAR,
-+	.volatile_table =3D &isp1763_hc_volatile_table,
- };
-=20
- static const struct regmap_range isp176x_dc_volatile_ranges[] =3D {
- 	regmap_reg_range(ISP176x_DC_EPMAXPKTSZ, ISP176x_DC_EPTYPE),
- 	regmap_reg_range(ISP176x_DC_BUFLEN, ISP176x_DC_EPINDEX),
--	regmap_reg_range(ISP1761_DC_OTG_CTRL_SET, ISP1761_DC_OTG_CTRL_CLEAR),
- };
-=20
- static const struct regmap_access_table isp176x_dc_volatile_table =3D {
-@@ -188,13 +351,13 @@ static const struct regmap_access_table isp176x_dc=
_volatile_table =3D {
- 	.n_yes_ranges	=3D ARRAY_SIZE(isp176x_dc_volatile_ranges),
- };
-=20
--static struct regmap_config isp1761_dc_regmap_conf =3D {
-+static const struct regmap_config isp1761_dc_regmap_conf =3D {
- 	.name =3D "isp1761-dc",
- 	.reg_bits =3D 16,
- 	.reg_stride =3D 4,
- 	.val_bits =3D 32,
- 	.fast_io =3D true,
--	.max_register =3D ISP1761_DC_OTG_CTRL_CLEAR,
-+	.max_register =3D ISP176x_DC_TESTMODE,
- 	.volatile_table =3D &isp176x_dc_volatile_table,
- };
-=20
-@@ -236,31 +399,84 @@ static const struct reg_field isp1761_dc_reg_field=
s[] =3D {
- 	[DC_ENDPTYP]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
- 	[DC_UFRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
- 	[DC_FRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
--	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
--	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
--	[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
--	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
--	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
--	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
--	[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
--	[HW_OTG_DISABLE_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10=
),
--	[HW_SW_SEL_HC_DC_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7)=
,
--	[HW_VBUS_DRV_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
--	[HW_SEL_CP_EXT_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
--	[HW_DM_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
--	[HW_DP_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
--	[HW_DP_PULLUP_CLEAR]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
-+	[DC_CHIP_ID_HIGH]	=3D REG_FIELD(ISP176x_DC_CHIPID, 16, 31),
-+	[DC_CHIP_ID_LOW]	=3D REG_FIELD(ISP176x_DC_CHIPID, 0, 15),
-+	[DC_SCRATCH]		=3D REG_FIELD(ISP176x_DC_SCRATCH, 0, 15),
-+};
-+
-+static const struct regmap_range isp1763_dc_volatile_ranges[] =3D {
-+	regmap_reg_range(ISP1763_DC_EPMAXPKTSZ, ISP1763_DC_EPTYPE),
-+	regmap_reg_range(ISP1763_DC_BUFLEN, ISP1763_DC_EPINDEX),
-+};
-+
-+static const struct regmap_access_table isp1763_dc_volatile_table =3D {
-+	.yes_ranges	=3D isp1763_dc_volatile_ranges,
-+	.n_yes_ranges	=3D ARRAY_SIZE(isp1763_dc_volatile_ranges),
-+};
-+
-+static const struct reg_field isp1763_dc_reg_fields[] =3D {
-+	[DC_DEVEN]		=3D REG_FIELD(ISP1763_DC_ADDRESS, 7, 7),
-+	[DC_DEVADDR]		=3D REG_FIELD(ISP1763_DC_ADDRESS, 0, 6),
-+	[DC_VBUSSTAT]		=3D REG_FIELD(ISP1763_DC_MODE, 8, 8),
-+	[DC_SFRESET]		=3D REG_FIELD(ISP1763_DC_MODE, 4, 4),
-+	[DC_GLINTENA]		=3D REG_FIELD(ISP1763_DC_MODE, 3, 3),
-+	[DC_CDBGMOD_ACK]	=3D REG_FIELD(ISP1763_DC_INTCONF, 6, 6),
-+	[DC_DDBGMODIN_ACK]	=3D REG_FIELD(ISP1763_DC_INTCONF, 4, 4),
-+	[DC_DDBGMODOUT_ACK]	=3D REG_FIELD(ISP1763_DC_INTCONF, 2, 2),
-+	[DC_INTPOL]		=3D REG_FIELD(ISP1763_DC_INTCONF, 0, 0),
-+	[DC_IEPRXTX_7]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 25, 25),
-+	[DC_IEPRXTX_6]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 23, 23),
-+	[DC_IEPRXTX_5]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 21, 21),
-+	[DC_IEPRXTX_4]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 19, 19),
-+	[DC_IEPRXTX_3]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 17, 17),
-+	[DC_IEPRXTX_2]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 15, 15),
-+	[DC_IEPRXTX_1]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 13, 13),
-+	[DC_IEPRXTX_0]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 11, 11),
-+	[DC_IEP0SETUP]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 8, 8),
-+	[DC_IEVBUS]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 7, 7),
-+	[DC_IEHS_STA]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 5, 5),
-+	[DC_IERESM]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 4, 4),
-+	[DC_IESUSP]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 3, 3),
-+	[DC_IEBRST]		=3D REG_FIELD(ISP1763_DC_INTENABLE, 0, 0),
-+	[DC_EP0SETUP]		=3D REG_FIELD(ISP1763_DC_EPINDEX, 5, 5),
-+	[DC_ENDPIDX]		=3D REG_FIELD(ISP1763_DC_EPINDEX, 1, 4),
-+	[DC_EPDIR]		=3D REG_FIELD(ISP1763_DC_EPINDEX, 0, 0),
-+	[DC_CLBUF]		=3D REG_FIELD(ISP1763_DC_CTRLFUNC, 4, 4),
-+	[DC_VENDP]		=3D REG_FIELD(ISP1763_DC_CTRLFUNC, 3, 3),
-+	[DC_DSEN]		=3D REG_FIELD(ISP1763_DC_CTRLFUNC, 2, 2),
-+	[DC_STATUS]		=3D REG_FIELD(ISP1763_DC_CTRLFUNC, 1, 1),
-+	[DC_STALL]		=3D REG_FIELD(ISP1763_DC_CTRLFUNC, 0, 0),
-+	[DC_BUFLEN]		=3D REG_FIELD(ISP1763_DC_BUFLEN, 0, 15),
-+	[DC_FFOSZ]		=3D REG_FIELD(ISP1763_DC_EPMAXPKTSZ, 0, 10),
-+	[DC_EPENABLE]		=3D REG_FIELD(ISP1763_DC_EPTYPE, 3, 3),
-+	[DC_ENDPTYP]		=3D REG_FIELD(ISP1763_DC_EPTYPE, 0, 1),
-+	[DC_UFRAMENUM]		=3D REG_FIELD(ISP1763_DC_FRAMENUM, 11, 13),
-+	[DC_FRAMENUM]		=3D REG_FIELD(ISP1763_DC_FRAMENUM, 0, 10),
-+	[DC_CHIP_ID_HIGH]	=3D REG_FIELD(ISP1763_DC_CHIPID_HIGH, 0, 15),
-+	[DC_CHIP_ID_LOW]	=3D REG_FIELD(ISP1763_DC_CHIPID_LOW, 0, 15),
-+	[DC_SCRATCH]		=3D REG_FIELD(ISP1763_DC_SCRATCH, 0, 15),
-+};
-+
-+static const struct regmap_config isp1763_dc_regmap_conf =3D {
-+	.name =3D "isp1763-dc",
-+	.reg_bits =3D 8,
-+	.reg_stride =3D 2,
-+	.val_bits =3D 16,
-+	.fast_io =3D true,
-+	.max_register =3D ISP1763_DC_TESTMODE,
-+	.volatile_table =3D &isp1763_dc_volatile_table,
- };
-=20
- int isp1760_register(struct resource *mem, int irq, unsigned long irqfl=
ags,
- 		     struct device *dev, unsigned int devflags)
- {
-+	bool udc_disabled =3D !(devflags & ISP1760_FLAG_ISP1761);
-+	const struct regmap_config *hc_regmap;
-+	const struct reg_field *hc_reg_fields;
- 	struct isp1760_device *isp;
- 	struct isp1760_hcd *hcd;
- 	struct isp1760_udc *udc;
--	bool udc_disabled =3D !(devflags & ISP1760_FLAG_ISP1761);
- 	struct regmap_field *f;
--	void __iomem *base;
- 	int ret;
- 	int i;
-=20
-@@ -281,9 +497,19 @@ int isp1760_register(struct resource *mem, int irq,=
 unsigned long irqflags,
- 	hcd =3D &isp->hcd;
- 	udc =3D &isp->udc;
-=20
--	if (devflags & ISP1760_FLAG_BUS_WIDTH_16) {
--		isp1760_hc_regmap_conf.val_bits =3D 16;
--		isp1761_dc_regmap_conf.val_bits =3D 16;
-+	hcd->is_isp1763 =3D !!(devflags & ISP1760_FLAG_ISP1763);
-+
-+	if (!hcd->is_isp1763 && (devflags & ISP1760_FLAG_BUS_WIDTH_8)) {
-+		dev_err(dev, "isp1760/61 do not support data width 8\n");
-+		return -EINVAL;
-+	}
-+
-+	if (hcd->is_isp1763) {
-+		hc_regmap =3D &isp1763_hc_regmap_conf;
-+		hc_reg_fields =3D &isp1763_hc_reg_fields[0];
-+	} else {
-+		hc_regmap =3D &isp1760_hc_regmap_conf;
-+		hc_reg_fields =3D &isp1760_hc_reg_fields[0];
- 	}
-=20
- 	isp->rst_gpio =3D devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
-@@ -294,20 +520,20 @@ int isp1760_register(struct resource *mem, int irq=
, unsigned long irqflags,
- 	if (IS_ERR(hcd->base))
- 		return PTR_ERR(hcd->base);
-=20
--	hcd->regs =3D devm_regmap_init_mmio(dev, base, &isp1760_hc_regmap_conf=
);
-+	hcd->regs =3D devm_regmap_init_mmio(dev, hcd->base, hc_regmap);
- 	if (IS_ERR(hcd->regs))
- 		return PTR_ERR(hcd->regs);
-=20
- 	for (i =3D 0; i < HC_FIELD_MAX; i++) {
--		f =3D devm_regmap_field_alloc(dev, hcd->regs,
--					    isp1760_hc_reg_fields[i]);
-+		f =3D devm_regmap_field_alloc(dev, hcd->regs, hc_reg_fields[i]);
- 		if (IS_ERR(f))
- 			return PTR_ERR(f);
-=20
- 		hcd->fields[i] =3D f;
- 	}
-=20
--	udc->regs =3D devm_regmap_init_mmio(dev, base, &isp1761_dc_regmap_conf=
);
-+	udc->regs =3D devm_regmap_init_mmio(dev, hcd->base,
-+					  &isp1761_dc_regmap_conf);
- 	if (IS_ERR(udc->regs))
- 		return PTR_ERR(udc->regs);
-=20
-@@ -320,9 +546,14 @@ int isp1760_register(struct resource *mem, int irq,=
 unsigned long irqflags,
- 		udc->fields[i] =3D f;
- 	}
-=20
--	hcd->memory_layout =3D &isp176x_memory_conf;
-+	if (hcd->is_isp1763)
-+		hcd->memory_layout =3D &isp1763_memory_conf;
-+	else
-+		hcd->memory_layout =3D &isp176x_memory_conf;
-=20
--	isp1760_init_core(isp);
-+	ret =3D isp1760_init_core(isp);
-+	if (ret < 0)
-+		return ret;
-=20
- 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
- 		ret =3D isp1760_hcd_register(hcd, mem, irq,
-diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/is=
p1760-core.h
-index 7a6755d68d41..91e0ee3992a7 100644
---- a/drivers/usb/isp1760/isp1760-core.h
-+++ b/drivers/usb/isp1760/isp1760-core.h
-@@ -2,12 +2,14 @@
- /*
-  * Driver for the NXP ISP1760 chip
-  *
-+ * Copyright 2021 Linaro, Rui Miguel Silva
-  * Copyright 2014 Laurent Pinchart
-  * Copyright 2007 Sebastian Siewior
-  *
-  * Contacts:
-  *	Sebastian Siewior <bigeasy@linutronix.de>
-  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-+ *	Rui Miguel Silva <rui.silva@linaro.org>
-  */
-=20
- #ifndef _ISP1760_CORE_H_
-@@ -35,6 +37,8 @@ struct gpio_desc;
- #define ISP1760_FLAG_ISP1761		0x00000040 /* Chip is ISP1761 */
- #define ISP1760_FLAG_INTR_POL_HIGH	0x00000080 /* Interrupt polarity act=
ive high */
- #define ISP1760_FLAG_INTR_EDGE_TRIG	0x00000100 /* Interrupt edge trigge=
red */
-+#define ISP1760_FLAG_ISP1763		0x00000200 /* Chip is ISP1763 */
-+#define ISP1760_FLAG_BUS_WIDTH_8	0x00000400 /* 8-bit data bus width */
-=20
- struct isp1760_device {
- 	struct device *dev;
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index a65f5f917ebe..016a54ea76f4 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -11,6 +11,8 @@
-  *
-  * (c) 2011 Arvid Brodin <arvid.brodin@enea.com>
-  *
-+ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
-+ *
-  */
- #include <linux/gpio/consumer.h>
- #include <linux/module.h>
-@@ -44,6 +46,9 @@ static inline struct isp1760_hcd *hcd_to_priv(struct u=
sb_hcd *hcd)
- 	return *(struct isp1760_hcd **)hcd->hcd_priv;
- }
-=20
-+#define dw_to_le32(x)	(cpu_to_le32((__force u32)x))
-+#define le32_to_dw(x)	((__force __dw)(le32_to_cpu(x)))
-+
- /* urb state*/
- #define DELETE_URB		(0x0008)
- #define NO_TRANSFER_ACTIVE	(0xffffffff)
-@@ -60,6 +65,18 @@ struct ptd {
- 	__dw dw6;
- 	__dw dw7;
- };
-+
-+struct ptd_le32 {
-+	__le32 dw0;
-+	__le32 dw1;
-+	__le32 dw2;
-+	__le32 dw3;
-+	__le32 dw4;
-+	__le32 dw5;
-+	__le32 dw6;
-+	__le32 dw7;
-+};
-+
- #define PTD_OFFSET		0x0400
- #define ISO_PTD_OFFSET		0x0400
- #define INT_PTD_OFFSET		0x0800
-@@ -96,7 +113,7 @@ struct ptd {
- #define TO_DW2_RL(x)			TO_DW(((x) << 25))
- #define FROM_DW2_RL(x)			((TO_U32(x) >> 25) & 0xf)
- /* DW3 */
--#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x7fff)
-+#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x3fff)
- #define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	TO_U32((x) & 0x07ff)
- #define TO_DW3_NAKCOUNT(x)		TO_DW(((x) << 19))
- #define FROM_DW3_NAKCOUNT(x)		((TO_U32(x) >> 19) & 0xf)
-@@ -123,7 +140,7 @@ struct ptd {
- /* Errata 1 */
- #define RL_COUNTER	(0)
- #define NAK_COUNTER	(0)
--#define ERR_COUNTER	(2)
-+#define ERR_COUNTER	(3)
-=20
- struct isp1760_qtd {
- 	u8 packet_type;
-@@ -165,6 +182,18 @@ struct urb_listitem {
- 	struct urb *urb;
- };
-=20
-+static const u32 isp1763_hc_portsc1_fields[] =3D {
-+	[PORT_OWNER]		=3D BIT(13),
-+	[PORT_POWER]		=3D BIT(12),
-+	[PORT_LSTATUS]		=3D BIT(10),
-+	[PORT_RESET]		=3D BIT(8),
-+	[PORT_SUSPEND]		=3D BIT(7),
-+	[PORT_RESUME]		=3D BIT(6),
-+	[PORT_PE]		=3D BIT(2),
-+	[PORT_CSC]		=3D BIT(1),
-+	[PORT_CONNECT]		=3D BIT(0),
-+};
-+
- /*
-  * Access functions for isp176x registers regmap fields
-  */
-@@ -175,10 +204,30 @@ static u32 isp1760_hcd_read(struct usb_hcd *hcd, u=
32 field)
- 	return isp1760_field_read(priv->fields, field);
- }
-=20
-+/*
-+ * We need, in isp1763, to write directly the values to the portsc1
-+ * register so it will make the other values to trigger.
-+ */
-+static void isp1760_hcd_portsc1_set_clear(struct isp1760_hcd *priv, u32=
 field,
-+					  u32 val)
-+{
-+	u32 bit =3D isp1763_hc_portsc1_fields[field];
-+	u32 port_status =3D readl(priv->base + ISP1763_HC_PORTSC1);
-+
-+	if (val)
-+		writel(port_status | bit, priv->base + ISP1763_HC_PORTSC1);
-+	else
-+		writel(port_status & ~bit, priv->base + ISP1763_HC_PORTSC1);
-+}
-+
- static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-=20
-+	if (unlikely(priv->is_isp1763 &&
-+		     (field >=3D PORT_OWNER && field <=3D PORT_CONNECT)))
-+		return isp1760_hcd_portsc1_set_clear(priv, field, val);
-+
- 	isp1760_field_write(priv->fields, field, val);
- }
-=20
-@@ -192,28 +241,40 @@ static void isp1760_hcd_clear(struct usb_hcd *hcd,=
 u32 field)
- 	isp1760_hcd_write(hcd, field, 0);
- }
-=20
--static int isp1760_hcd_set_poll_timeout(struct usb_hcd *hcd, u32 field,
--					u32 timeout_us)
-+static int isp1760_hcd_set_and_wait(struct usb_hcd *hcd, u32 field,
-+				    u32 timeout_us)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 val;
-+
-+	isp1760_hcd_set(hcd, field);
-+
-+	return regmap_field_read_poll_timeout(priv->fields[field], val,
-+					      val, 10, timeout_us);
-+}
-+
-+static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field=
,
-+					 u32 timeout_us)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	unsigned int val;
-+	u32 val;
-=20
- 	isp1760_hcd_set(hcd, field);
-=20
--	return regmap_field_read_poll_timeout(priv->fields[field], val, 1, 1,
--					      timeout_us);
-+	return regmap_field_read_poll_timeout(priv->fields[field], val,
-+					      !val, 10, timeout_us);
- }
-=20
--static int isp1760_hcd_clear_poll_timeout(struct usb_hcd *hcd, u32 fiel=
d,
--					  u32 timeout_us)
-+static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
-+				      u32 timeout_us)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	unsigned int val;
-+	u32 val;
-=20
- 	isp1760_hcd_clear(hcd, field);
-=20
--	return regmap_field_read_poll_timeout(priv->fields[field], val, 0, 1,
--					      timeout_us);
-+	return regmap_field_read_poll_timeout(priv->fields[field], val,
-+					      !val, 10, timeout_us);
- }
-=20
- static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
-@@ -221,12 +282,32 @@ static bool isp1760_hcd_is_set(struct usb_hcd *hcd=
, u32 field)
- 	return !!isp1760_hcd_read(hcd, field);
- }
-=20
-+static bool isp1760_hcd_ppc_is_set(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (priv->is_isp1763)
-+		return true;
-+
-+	return isp1760_hcd_is_set(hcd, HCS_PPC);
-+}
-+
-+static u32 isp1760_hcd_n_ports(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (priv->is_isp1763)
-+		return 1;
-+
-+	return isp1760_hcd_read(hcd, HCS_N_PORTS);
-+}
-+
- /*
-  * Access functions for isp176x memory (offset >=3D 0x0400).
-  *
-  * bank_reads8() reads memory locations prefetched by an earlier write =
to
-  * HC_MEMORY_REG (see isp176x datasheet). Unless you want to do fancy m=
ulti-
-- * bank optimizations, you should use the more generic mem_reads8() bel=
ow.
-+ * bank optimizations, you should use the more generic mem_read() below=
.
-  *
-  * For access to ptd memory, use the specialized ptd_read() and ptd_wri=
te()
-  * below.
-@@ -281,19 +362,59 @@ static void bank_reads8(void __iomem *src_base, u3=
2 src_offset, u32 bank_addr,
- 	}
- }
-=20
--static void mem_reads8(struct usb_hcd *hcd, void __iomem *src_base,
--		       u32 src_offset, void *dst, u32 bytes)
-+static void isp1760_mem_read(struct usb_hcd *hcd, u32 src_offset, void =
*dst,
-+			     u32 bytes)
- {
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
- 	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
- 	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
-+	ndelay(100);
-=20
--	ndelay(90);
-+	bank_reads8(priv->base, src_offset, ISP_BANK_0, dst, bytes);
-+}
-=20
--	bank_reads8(src_base, src_offset, ISP_BANK_0, dst, bytes);
-+/*
-+ * ISP1763 does not have the banks direct host controller memory access=
,
-+ * needs to use the HC_DATA register. Add data read/write according to =
this,
-+ * and also adjust 16bit access.
-+ */
-+static void isp1763_mem_read(struct usb_hcd *hcd, u16 srcaddr,
-+			     u16 *dstptr, u32 bytes)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	/* Write the starting device address to the hcd memory register */
-+	isp1760_reg_write(priv->regs, ISP1763_HC_MEMORY, srcaddr);
-+	ndelay(100); /* Delay between consecutive access */
-+
-+	/* As long there are at least 16-bit to read ... */
-+	while (bytes >=3D 2) {
-+		*dstptr =3D __raw_readw(priv->base + ISP1763_HC_DATA);
-+		bytes -=3D 2;
-+		dstptr++;
-+	}
-+
-+	/* If there are no more bytes to read, return */
-+	if (bytes <=3D 0)
-+		return;
-+
-+	*((u8 *)dstptr) =3D (u8)(readw(priv->base + ISP1763_HC_DATA) & 0xFF);
-+}
-+
-+static void mem_read(struct usb_hcd *hcd, u32 src_offset, __u32 *dst,
-+		     u32 bytes)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (!priv->is_isp1763)
-+		return isp1760_mem_read(hcd, src_offset, (u16 *)dst, bytes);
-+
-+	isp1763_mem_read(hcd, (u16)src_offset, (u16 *)dst, bytes);
- }
-=20
--static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
--						__u32 const *src, u32 bytes)
-+static void isp1760_mem_write(void __iomem *dst_base, u32 dst_offset,
-+			      __u32 const *src, u32 bytes)
- {
- 	__u32 __iomem *dst;
-=20
-@@ -327,33 +448,136 @@ static void mem_writes8(void __iomem *dst_base, u=
32 dst_offset,
- 		__raw_writel(*src, dst);
- }
-=20
-+static void isp1763_mem_write(struct usb_hcd *hcd, u16 dstaddr, u16 *sr=
c,
-+			      u32 bytes)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	/* Write the starting device address to the hcd memory register */
-+	isp1760_reg_write(priv->regs, ISP1763_HC_MEMORY, dstaddr);
-+	ndelay(100); /* Delay between consecutive access */
-+
-+	while (bytes >=3D 2) {
-+		/* Get and write the data; then adjust the data ptr and len */
-+		__raw_writew(*src, priv->base + ISP1763_HC_DATA);
-+		bytes -=3D 2;
-+		src++;
-+	}
-+
-+	/* If there are no more bytes to process, return */
-+	if (bytes <=3D 0)
-+		return;
-+
-+	/*
-+	 * The only way to get here is if there is a single byte left,
-+	 * get it and write it to the data reg;
-+	 */
-+	writew(*((u8 *)src), priv->base + ISP1763_HC_DATA);
-+}
-+
-+static void mem_write(struct usb_hcd *hcd, u32 dst_offset, __u32 *src,
-+		      u32 bytes)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (!priv->is_isp1763)
-+		return isp1760_mem_write(priv->base, dst_offset, src, bytes);
-+
-+	isp1763_mem_write(hcd, dst_offset, (u16 *)src, bytes);
-+}
-+
- /*
-  * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFSET,
-  * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32.
-  */
--static void ptd_read(struct usb_hcd *hcd, void __iomem *base,
--		     u32 ptd_offset, u32 slot, struct ptd *ptd)
-+static void isp1760_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 s=
lot,
-+			     struct ptd *ptd)
- {
-+	u16 src_offset =3D ptd_offset + slot * sizeof(*ptd);
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
- 	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
--	isp1760_hcd_write(hcd, MEM_START_ADDR,
--			  ptd_offset + slot * sizeof(*ptd));
-+	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
- 	ndelay(90);
--	bank_reads8(base, ptd_offset + slot * sizeof(*ptd), ISP_BANK_0,
--		    (void *)ptd, sizeof(*ptd));
-+
-+	bank_reads8(priv->base, src_offset, ISP_BANK_0, (void *)ptd,
-+		    sizeof(*ptd));
-+}
-+
-+static void isp1763_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 s=
lot,
-+			     struct ptd *ptd)
-+{
-+	u16 src_offset =3D ptd_offset + slot * sizeof(*ptd);
-+	struct ptd_le32 le32_ptd;
-+
-+	isp1763_mem_read(hcd, src_offset, (u16 *)&le32_ptd, sizeof(le32_ptd));
-+	/* Normalize the data obtained */
-+	ptd->dw0 =3D le32_to_dw(le32_ptd.dw0);
-+	ptd->dw1 =3D le32_to_dw(le32_ptd.dw1);
-+	ptd->dw2 =3D le32_to_dw(le32_ptd.dw2);
-+	ptd->dw3 =3D le32_to_dw(le32_ptd.dw3);
-+	ptd->dw4 =3D le32_to_dw(le32_ptd.dw4);
-+	ptd->dw5 =3D le32_to_dw(le32_ptd.dw5);
-+	ptd->dw6 =3D le32_to_dw(le32_ptd.dw6);
-+	ptd->dw7 =3D le32_to_dw(le32_ptd.dw7);
-+}
-+
-+static void ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
-+		     struct ptd *ptd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (!priv->is_isp1763)
-+		return isp1760_ptd_read(hcd, ptd_offset, slot, ptd);
-+
-+	isp1763_ptd_read(hcd, ptd_offset, slot, ptd);
-+}
-+
-+static void isp1763_ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 =
slot,
-+			      struct ptd *cpu_ptd)
-+{
-+	u16 dst_offset =3D ptd_offset + slot * sizeof(*cpu_ptd);
-+	struct ptd_le32 ptd;
-+
-+	ptd.dw0 =3D dw_to_le32(cpu_ptd->dw0);
-+	ptd.dw1 =3D dw_to_le32(cpu_ptd->dw1);
-+	ptd.dw2 =3D dw_to_le32(cpu_ptd->dw2);
-+	ptd.dw3 =3D dw_to_le32(cpu_ptd->dw3);
-+	ptd.dw4 =3D dw_to_le32(cpu_ptd->dw4);
-+	ptd.dw5 =3D dw_to_le32(cpu_ptd->dw5);
-+	ptd.dw6 =3D dw_to_le32(cpu_ptd->dw6);
-+	ptd.dw7 =3D dw_to_le32(cpu_ptd->dw7);
-+
-+	isp1763_mem_write(hcd, dst_offset,  (u16 *)&ptd.dw0,
-+			  8 * sizeof(ptd.dw0));
- }
-=20
--static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
--								struct ptd *ptd)
-+static void isp1760_ptd_write(void __iomem *base, u32 ptd_offset, u32 s=
lot,
-+			      struct ptd *ptd)
- {
--	mem_writes8(base, ptd_offset + slot*sizeof(*ptd) + sizeof(ptd->dw0),
--		    (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
--	/* Make sure dw0 gets written last (after other dw's and after payload=
)
--	   since it contains the enable bit */
-+	u32 dst_offset =3D ptd_offset + slot * sizeof(*ptd);
-+
-+	/*
-+	 * Make sure dw0 gets written last (after other dw's and after payload=
)
-+	 *  since it contains the enable bit
-+	 */
-+	isp1760_mem_write(base, dst_offset + sizeof(ptd->dw0),
-+			  (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
- 	wmb();
--	mem_writes8(base, ptd_offset + slot * sizeof(*ptd),
--		    (__force u32 *)&ptd->dw0, sizeof(ptd->dw0));
-+	isp1760_mem_write(base, dst_offset, (__force u32 *)&ptd->dw0,
-+			  sizeof(ptd->dw0));
- }
-=20
-+static void ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
-+		      struct ptd *ptd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (!priv->is_isp1763)
-+		return isp1760_ptd_write(priv->base, ptd_offset, slot, ptd);
-+
-+	isp1763_ptd_write(hcd, ptd_offset, slot, ptd);
-+}
-=20
- /* memory management of the 60kb on the chip from 0x1000 to 0xffff */
- static void init_memory(struct isp1760_hcd *priv)
-@@ -430,7 +654,7 @@ static int ehci_reset(struct usb_hcd *hcd)
- 	hcd->state =3D HC_STATE_HALT;
- 	priv->next_statechange =3D jiffies;
-=20
--	return isp1760_hcd_set_poll_timeout(hcd, CMD_RESET, 250 * 1000);
-+	return isp1760_hcd_set_and_wait_swap(hcd, CMD_RESET, 250 * 1000);
- }
-=20
- static struct isp1760_qh *qh_alloc(gfp_t flags)
-@@ -461,7 +685,6 @@ static int priv_init(struct usb_hcd *hcd)
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	u32 isoc_cache;
- 	u32 isoc_thres;
--
- 	int i;
-=20
- 	spin_lock_init(&priv->lock);
-@@ -475,6 +698,11 @@ static int priv_init(struct usb_hcd *hcd)
- 	 */
- 	priv->periodic_size =3D DEFAULT_I_TDPS;
-=20
-+	if (priv->is_isp1763) {
-+		priv->i_thresh =3D 2;
-+		return 0;
-+	}
-+
- 	/* controllers may cache some of the periodic schedule ... */
- 	isoc_cache =3D isp1760_hcd_read(hcd, HCC_ISOC_CACHE);
- 	isoc_thres =3D isp1760_hcd_read(hcd, HCC_ISOC_THRES);
-@@ -491,16 +719,24 @@ static int priv_init(struct usb_hcd *hcd)
- static int isp1760_hc_setup(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 atx_reset;
- 	int result;
- 	u32 scratch;
-+	u32 pattern;
-=20
--	isp1760_reg_write(priv->regs, ISP176x_HC_SCRATCH, 0xdeadbabe);
-+	if (priv->is_isp1763)
-+		pattern =3D 0xcafe;
-+	else
-+		pattern =3D 0xdeadcafe;
-+
-+	isp1760_hcd_write(hcd, HC_SCRATCH, pattern);
-=20
- 	/* Change bus pattern */
--	scratch =3D isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
--	scratch =3D isp1760_reg_read(priv->regs, ISP176x_HC_SCRATCH);
--	if (scratch !=3D 0xdeadbabe) {
--		dev_err(hcd->self.controller, "Scratch test failed.\n");
-+	scratch =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-+	dev_err(hcd->self.controller, "Scratch test 0x%08x\n", scratch);
-+	scratch =3D isp1760_hcd_read(hcd, HC_SCRATCH);
-+	if (scratch !=3D pattern) {
-+		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n", scratc=
h);
- 		return -ENODEV;
- 	}
-=20
-@@ -512,13 +748,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
- 	 * the host controller through the EHCI USB Command register. The devi=
ce
- 	 * has been reset in core code anyway, so this shouldn't matter.
- 	 */
--	isp1760_reg_write(priv->regs, ISP176x_HC_BUFFER_STATUS, 0);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
--			  NO_TRANSFER_ACTIVE);
--	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
--			  NO_TRANSFER_ACTIVE);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP,
--			  NO_TRANSFER_ACTIVE);
-+	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
-+	isp1760_hcd_clear(hcd, INT_BUF_FILL);
-+	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
-=20
- 	result =3D ehci_reset(hcd);
- 	if (result)
-@@ -527,11 +763,26 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
- 	/* Step 11 passed */
-=20
- 	/* ATL reset */
--	isp1760_hcd_set(hcd, ALL_ATX_RESET);
-+	if (priv->is_isp1763)
-+		atx_reset =3D SW_RESET_RESET_ATX;
-+	else
-+		atx_reset =3D ALL_ATX_RESET;
-+
-+	isp1760_hcd_set(hcd, atx_reset);
- 	mdelay(10);
--	isp1760_hcd_clear(hcd, ALL_ATX_RESET);
-+	isp1760_hcd_clear(hcd, atx_reset);
-=20
--	isp1760_hcd_set(hcd, HC_INT_ENABLE);
-+	if (priv->is_isp1763) {
-+		isp1760_hcd_set(hcd, HW_OTG_DISABLE);
-+		isp1760_hcd_set(hcd, HW_SW_SEL_HC_DC_CLEAR);
-+		isp1760_hcd_set(hcd, HW_HC_2_DIS_CLEAR);
-+		mdelay(10);
-+
-+		isp1760_hcd_set(hcd, HW_INTF_LOCK);
-+	}
-+
-+	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
-+	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
-=20
- 	return priv_init(hcd);
- }
-@@ -751,45 +1002,45 @@ static void start_bus_transfer(struct usb_hcd *hc=
d, u32 ptd_offset, int slot,
- 				struct ptd *ptd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
- 	int skip_map;
-=20
--	WARN_ON((slot < 0) || (slot > 31));
-+	WARN_ON((slot < 0) || (slot > mem->slot_num - 1));
- 	WARN_ON(qtd->length && !qtd->payload_addr);
- 	WARN_ON(slots[slot].qtd);
- 	WARN_ON(slots[slot].qh);
- 	WARN_ON(qtd->status !=3D QTD_PAYLOAD_ALLOC);
-=20
-+	if (priv->is_isp1763)
-+		ndelay(100);
-+
- 	/* Make sure done map has not triggered from some unlinked transfer */
- 	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
--		priv->atl_done_map |=3D isp1760_reg_read(priv->regs,
--						ISP176x_HC_ATL_PTD_DONEMAP);
-+		skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
-+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP,
-+				  skip_map | (1 << slot));
-+		priv->atl_done_map |=3D isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
- 		priv->atl_done_map &=3D ~(1 << slot);
- 	} else {
--		priv->int_done_map |=3D isp1760_reg_read(priv->regs,
--					       ISP176x_HC_INT_PTD_DONEMAP);
-+		skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
-+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP,
-+				  skip_map | (1 << slot));
-+		priv->int_done_map |=3D isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
- 		priv->int_done_map &=3D ~(1 << slot);
- 	}
-=20
-+	skip_map &=3D ~(1 << slot);
- 	qh->slot =3D slot;
- 	qtd->status =3D QTD_XFER_STARTED;
- 	slots[slot].timestamp =3D jiffies;
- 	slots[slot].qtd =3D qtd;
- 	slots[slot].qh =3D qh;
--	ptd_write(priv->base, ptd_offset, slot, ptd);
-+	ptd_write(hcd, ptd_offset, slot, ptd);
-=20
--	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
--		skip_map =3D isp1760_reg_read(priv->regs,
--					    ISP176x_HC_ATL_PTD_SKIPMAP);
--		skip_map &=3D ~(1 << qh->slot);
--		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
--				  skip_map);
--	} else {
--		skip_map =3D isp1760_reg_read(priv->regs,
--					    ISP176x_HC_INT_PTD_SKIPMAP);
--		skip_map &=3D ~(1 << qh->slot);
--		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
--				  skip_map);
--	}
-+	if (ptd_offset =3D=3D ATL_PTD_OFFSET)
-+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
-+	else
-+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
- }
-=20
- static int is_short_bulk(struct isp1760_qtd *qtd)
-@@ -801,7 +1052,6 @@ static int is_short_bulk(struct isp1760_qtd *qtd)
- static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
- 						struct list_head *urb_list)
- {
--	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	struct isp1760_qtd *qtd, *qtd_next;
- 	struct urb_listitem *urb_listitem;
- 	int last_qtd;
-@@ -819,10 +1069,9 @@ static void collect_qtds(struct usb_hcd *hcd, stru=
ct isp1760_qh *qh,
- 			if (qtd->actual_length) {
- 				switch (qtd->packet_type) {
- 				case IN_PID:
--					mem_reads8(hcd, priv->base,
--						   qtd->payload_addr,
--						   qtd->data_buffer,
--						   qtd->actual_length);
-+					mem_read(hcd, qtd->payload_addr,
-+						 qtd->data_buffer,
-+						 qtd->actual_length);
- 					fallthrough;
- 				case OUT_PID:
- 					qtd->urb->actual_length +=3D
-@@ -866,6 +1115,8 @@ static void collect_qtds(struct usb_hcd *hcd, struc=
t isp1760_qh *qh,
- static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+	int slot_num =3D mem->slot_num;
- 	int ptd_offset;
- 	struct isp1760_slotinfo *slots;
- 	int curr_slot, free_slot;
-@@ -892,7 +1143,7 @@ static void enqueue_qtds(struct usb_hcd *hcd, struc=
t isp1760_qh *qh)
- 	}
-=20
- 	free_slot =3D -1;
--	for (curr_slot =3D 0; curr_slot < 32; curr_slot++) {
-+	for (curr_slot =3D 0; curr_slot < slot_num; curr_slot++) {
- 		if ((free_slot =3D=3D -1) && (slots[curr_slot].qtd =3D=3D NULL))
- 			free_slot =3D curr_slot;
- 		if (slots[curr_slot].qh =3D=3D qh)
-@@ -907,11 +1158,10 @@ static void enqueue_qtds(struct usb_hcd *hcd, str=
uct isp1760_qh *qh)
- 			if ((qtd->length) && (!qtd->payload_addr))
- 				break;
-=20
--			if ((qtd->length) &&
--			    ((qtd->packet_type =3D=3D SETUP_PID) ||
--			     (qtd->packet_type =3D=3D OUT_PID))) {
--				mem_writes8(priv->base, qtd->payload_addr,
--					    qtd->data_buffer, qtd->length);
-+			if (qtd->length && (qtd->packet_type =3D=3D SETUP_PID ||
-+					    qtd->packet_type =3D=3D OUT_PID)) {
-+				mem_write(hcd, qtd->payload_addr,
-+					  qtd->data_buffer, qtd->length);
- 			}
-=20
- 			qtd->status =3D QTD_PAYLOAD_ALLOC;
-@@ -924,7 +1174,7 @@ static void enqueue_qtds(struct usb_hcd *hcd, struc=
t isp1760_qh *qh)
- 					"available for transfer\n", __func__);
- */
- 			/* Start xfer for this endpoint if not already done */
--			if ((curr_slot > 31) && (free_slot > -1)) {
-+			if ((curr_slot > slot_num - 1) && (free_slot > -1)) {
- 				if (usb_pipeint(qtd->urb->pipe))
- 					create_ptd_int(qh, qtd, &ptd);
- 				else
-@@ -1111,9 +1361,9 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 	int modified;
- 	int skip_map;
-=20
--	skip_map =3D isp1760_reg_read(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP);
-+	skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
- 	priv->int_done_map &=3D ~skip_map;
--	skip_map =3D isp1760_reg_read(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP);
-+	skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
- 	priv->atl_done_map &=3D ~skip_map;
-=20
- 	modified =3D priv->int_done_map || priv->atl_done_map;
-@@ -1131,7 +1381,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 				continue;
- 			}
- 			ptd_offset =3D INT_PTD_OFFSET;
--			ptd_read(hcd, priv->base, INT_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, INT_PTD_OFFSET, slot, &ptd);
- 			state =3D check_int_transfer(hcd, &ptd,
- 							slots[slot].qtd->urb);
- 		} else {
-@@ -1146,7 +1396,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 				continue;
- 			}
- 			ptd_offset =3D ATL_PTD_OFFSET;
--			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, ATL_PTD_OFFSET, slot, &ptd);
- 			state =3D check_atl_transfer(hcd, &ptd,
- 							slots[slot].qtd->urb);
- 		}
-@@ -1239,27 +1489,30 @@ static void handle_done_ptds(struct usb_hcd *hcd=
)
- static irqreturn_t isp1760_irq(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	u32 imask;
- 	irqreturn_t irqret =3D IRQ_NONE;
-+	u32 int_reg;
-+	u32 imask;
-=20
- 	spin_lock(&priv->lock);
-=20
- 	if (!(hcd->state & HC_STATE_RUNNING))
- 		goto leave;
-=20
--	imask =3D isp1760_reg_read(priv->regs, ISP176x_HC_INTERRUPT);
-+	imask =3D isp1760_hcd_read(hcd, HC_INTERRUPT);
- 	if (unlikely(!imask))
- 		goto leave;
--	isp1760_reg_write(priv->regs, ISP176x_HC_INTERRUPT, imask); /* Clear *=
/
-=20
--	priv->int_done_map |=3D isp1760_reg_read(priv->regs,
--					       ISP176x_HC_INT_PTD_DONEMAP);
--	priv->atl_done_map |=3D isp1760_reg_read(priv->regs,
--					       ISP176x_HC_ATL_PTD_DONEMAP);
-+	int_reg =3D priv->is_isp1763 ? ISP1763_HC_INTERRUPT :
-+		ISP176x_HC_INTERRUPT;
-+	isp1760_reg_write(priv->regs, int_reg, imask);
-+
-+	priv->int_done_map |=3D isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
-+	priv->atl_done_map |=3D isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
-=20
- 	handle_done_ptds(hcd);
-=20
- 	irqret =3D IRQ_HANDLED;
-+
- leave:
- 	spin_unlock(&priv->lock);
-=20
-@@ -1300,17 +1553,18 @@ static void errata2_function(struct timer_list *=
unused)
- {
- 	struct usb_hcd *hcd =3D errata2_timer_hcd;
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
- 	int slot;
- 	struct ptd ptd;
- 	unsigned long spinflags;
-=20
- 	spin_lock_irqsave(&priv->lock, spinflags);
-=20
--	for (slot =3D 0; slot < 32; slot++)
-+	for (slot =3D 0; slot < mem->slot_num; slot++)
- 		if (priv->atl_slots[slot].qh && time_after(jiffies,
- 					priv->atl_slots[slot].timestamp +
- 					msecs_to_jiffies(SLOT_TIMEOUT))) {
--			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, ATL_PTD_OFFSET, slot, &ptd);
- 			if (!FROM_DW0_VALID(ptd.dw0) &&
- 					!FROM_DW3_ACTIVE(ptd.dw3))
- 				priv->atl_done_map |=3D 1 << slot;
-@@ -1325,23 +1579,113 @@ static void errata2_function(struct timer_list =
*unused)
- 	add_timer(&errata2_timer);
- }
-=20
-+static int isp1763_run(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	int retval;
-+	u32 chipid_h;
-+	u32 chipid_l;
-+	u32 chip_rev;
-+	u32 ptd_atl_int;
-+	u32 ptd_iso;
-+
-+	hcd->uses_new_polling =3D 1;
-+	hcd->state =3D HC_STATE_RUNNING;
-+
-+	chipid_h =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-+	chipid_l =3D isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
-+	chip_rev =3D isp1760_hcd_read(hcd, HC_CHIP_REV);
-+	dev_info(hcd->self.controller, "USB ISP %02x%02x HW rev. %d started\n"=
,
-+		 chipid_h, chipid_l, chip_rev);
-+
-+	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
-+	isp1760_hcd_clear(hcd, INT_BUF_FILL);
-+	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
-+	ndelay(100);
-+	isp1760_hcd_clear(hcd, HC_ATL_PTD_DONEMAP);
-+	isp1760_hcd_clear(hcd, HC_INT_PTD_DONEMAP);
-+	isp1760_hcd_clear(hcd, HC_ISO_PTD_DONEMAP);
-+
-+	isp1760_hcd_set(hcd, HW_OTG_DISABLE);
-+	isp1760_reg_write(priv->regs, ISP1763_HC_OTG_CTRL_CLEAR, BIT(7));
-+	isp1760_reg_write(priv->regs, ISP1763_HC_OTG_CTRL_CLEAR, BIT(15));
-+	mdelay(10);
-+
-+	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
-+	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
-+
-+	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
-+
-+	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
-+	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
-+	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
-+	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
-+	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
-+
-+	ptd_atl_int =3D 0x8000;
-+	ptd_iso =3D 0x0001;
-+
-+	isp1760_hcd_write(hcd, HC_ATL_PTD_LASTPTD, ptd_atl_int);
-+	isp1760_hcd_write(hcd, HC_INT_PTD_LASTPTD, ptd_atl_int);
-+	isp1760_hcd_write(hcd, HC_ISO_PTD_LASTPTD, ptd_iso);
-+
-+	isp1760_hcd_set(hcd, ATL_BUF_FILL);
-+	isp1760_hcd_set(hcd, INT_BUF_FILL);
-+
-+	isp1760_hcd_clear(hcd, CMD_LRESET);
-+	isp1760_hcd_clear(hcd, CMD_RESET);
-+
-+	retval =3D isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
-+	if (retval)
-+		return retval;
-+
-+	down_write(&ehci_cf_port_reset_rwsem);
-+	retval =3D isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
-+	up_write(&ehci_cf_port_reset_rwsem);
-+	retval =3D 0;
-+	if (retval)
-+		return retval;
-+
-+	return 0;
-+}
-+
- static int isp1760_run(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	int retval;
--	u32 chipid;
-+	u32 chipid_h;
-+	u32 chipid_l;
-+	u32 chip_rev;
-+	u32 ptd_atl_int;
-+	u32 ptd_iso;
-+
-+	/*
-+	 * ISP1763 have some differences in the setup and order to enable
-+	 * the ports, disable otg, setup buffers, and ATL, INT, ISO status.
-+	 * So, just handle it a separate sequence.
-+	 */
-+	if (priv->is_isp1763)
-+		return isp1763_run(hcd);
-=20
- 	hcd->uses_new_polling =3D 1;
-=20
- 	hcd->state =3D HC_STATE_RUNNING;
-=20
- 	/* Set PTD interrupt AND & OR maps */
--	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_AND, 0);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_OR, 0xffffffff);
--	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_AND, 0);
--	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_OR, 0xffffffff);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_AND, 0);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_OR, 0xffffffff);
-+	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
-+	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
-+	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
-+	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
-+	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
-+
- 	/* step 23 passed */
-=20
- 	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
-@@ -1349,7 +1693,7 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	isp1760_hcd_clear(hcd, CMD_LRESET);
- 	isp1760_hcd_clear(hcd, CMD_RESET);
-=20
--	retval =3D isp1760_hcd_set_poll_timeout(hcd, CMD_RUN, 250 * 1000);
-+	retval =3D isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
- 	if (retval)
- 		return retval;
-=20
-@@ -1360,7 +1704,7 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	 */
- 	down_write(&ehci_cf_port_reset_rwsem);
-=20
--	retval =3D isp1760_hcd_set_poll_timeout(hcd, FLAG_CF, 250 * 1000);
-+	retval =3D isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
- 	up_write(&ehci_cf_port_reset_rwsem);
- 	if (retval)
- 		return retval;
-@@ -1370,19 +1714,25 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	errata2_timer.expires =3D jiffies + msecs_to_jiffies(SLOT_CHECK_PERIOD=
);
- 	add_timer(&errata2_timer);
-=20
--	chipid =3D isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
--	dev_info(hcd->self.controller, "USB ISP %04x HW rev. %d started\n",
--					chipid & 0xffff, chipid >> 16);
-+	chipid_h =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-+	chipid_l =3D isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
-+	chip_rev =3D isp1760_hcd_read(hcd, HC_CHIP_REV);
-+	dev_info(hcd->self.controller, "USB ISP %02x%02x HW rev. %d started\n"=
,
-+		 chipid_h, chipid_l, chip_rev);
-=20
- 	/* PTD Register Init Part 2, Step 28 */
-=20
- 	/* Setup registers controlling PTD checking */
--	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_LASTPTD, 0x80000000);
--	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_LASTPTD, 0x80000000);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_LASTPTD, 0x00000001);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP, 0xffffffff);
--	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP, 0xffffffff);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP, 0xffffffff);
-+	ptd_atl_int =3D 0x80000000;
-+	ptd_iso =3D 0x00000001;
-+
-+	isp1760_hcd_write(hcd, HC_ATL_PTD_LASTPTD, ptd_atl_int);
-+	isp1760_hcd_write(hcd, HC_INT_PTD_LASTPTD, ptd_atl_int);
-+	isp1760_hcd_write(hcd, HC_ISO_PTD_LASTPTD, ptd_iso);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
-=20
- 	isp1760_hcd_set(hcd, ATL_BUF_FILL);
- 	isp1760_hcd_set(hcd, INT_BUF_FILL);
-@@ -1623,19 +1973,16 @@ static void kill_transfer(struct usb_hcd *hcd, s=
truct urb *urb,
- 	/* We need to forcefully reclaim the slot since some transfers never
- 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
- 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
--		skip_map =3D isp1760_reg_read(priv->regs,
--					    ISP176x_HC_ATL_PTD_SKIPMAP);
-+		skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
- 		skip_map |=3D (1 << qh->slot);
--		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
--				  skip_map);
-+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
-+		ndelay(100);
- 		priv->atl_slots[qh->slot].qh =3D NULL;
- 		priv->atl_slots[qh->slot].qtd =3D NULL;
- 	} else {
--		skip_map =3D isp1760_reg_read(priv->regs,
--					    ISP176x_HC_INT_PTD_SKIPMAP);
-+		skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
- 		skip_map |=3D (1 << qh->slot);
--		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
--				  skip_map);
-+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
- 		priv->int_slots[qh->slot].qh =3D NULL;
- 		priv->int_slots[qh->slot].qtd =3D NULL;
- 	}
-@@ -1791,7 +2138,7 @@ static void isp1760_hub_descriptor(struct isp1760_=
hcd *priv,
- 	int ports;
- 	u16 temp;
-=20
--	ports =3D isp1760_hcd_read(priv->hcd, HCS_N_PORTS);
-+	ports =3D isp1760_hcd_n_ports(priv->hcd);
-=20
- 	desc->bDescriptorType =3D USB_DT_HUB;
- 	/* priv 1.0, 2.3.9 says 20ms max */
-@@ -1808,7 +2155,7 @@ static void isp1760_hub_descriptor(struct isp1760_=
hcd *priv,
-=20
- 	/* per-port overcurrent reporting */
- 	temp =3D HUB_CHAR_INDV_PORT_OCPM;
--	if (isp1760_hcd_is_set(priv->hcd, HCS_PPC))
-+	if (isp1760_hcd_ppc_is_set(priv->hcd))
- 		/* per-port power control */
- 		temp |=3D HUB_CHAR_INDV_PORT_LPSM;
- 	else
-@@ -1849,7 +2196,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 	int retval =3D 0;
- 	int ports;
-=20
--	ports =3D isp1760_hcd_read(hcd, HCS_N_PORTS);
-+	ports =3D isp1760_hcd_n_ports(hcd);
-=20
- 	/*
- 	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
-@@ -1908,7 +2255,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 			/* we auto-clear this feature */
- 			break;
- 		case USB_PORT_FEAT_POWER:
--			if (isp1760_hcd_is_set(hcd, HCS_PPC))
-+			if (isp1760_hcd_ppc_is_set(hcd))
- 				isp1760_hcd_clear(hcd, PORT_POWER);
- 			break;
- 		case USB_PORT_FEAT_C_CONNECTION:
-@@ -1923,7 +2270,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		default:
- 			goto error;
- 		}
--		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
-+		isp1760_hcd_read(hcd, CMD_RUN);
- 		break;
- 	case GetHubDescriptor:
- 		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *)
-@@ -1943,7 +2290,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		if (isp1760_hcd_is_set(hcd, PORT_CSC))
- 			status |=3D USB_PORT_STAT_C_CONNECTION << 16;
-=20
--
- 		/* whoever resumes must GetPortStatus to complete it!! */
- 		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
- 			dev_err(hcd->self.controller, "Port resume should be skipped.\n");
-@@ -1966,7 +2312,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 				/* stop resume signaling */
- 				isp1760_hcd_clear(hcd, PORT_CSC);
-=20
--				retval =3D isp1760_hcd_clear_poll_timeout(hcd,
-+				retval =3D isp1760_hcd_clear_and_wait(hcd,
- 							  PORT_RESUME, 2000);
- 				if (retval !=3D 0) {
- 					dev_err(hcd->self.controller,
-@@ -1987,11 +2333,11 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 			/* REVISIT:  some hardware needs 550+ usec to clear
- 			 * this bit; seems too long to spin routinely...
- 			 */
--			retval =3D isp1760_hcd_clear_poll_timeout(hcd, PORT_RESET,
--								750);
-+			retval =3D isp1760_hcd_clear_and_wait(hcd, PORT_RESET,
-+							    750);
- 			if (retval !=3D 0) {
- 				dev_err(hcd->self.controller, "port %d reset error %d\n",
--						wIndex + 1, retval);
-+					wIndex + 1, retval);
- 				goto error;
- 			}
-=20
-@@ -2039,6 +2385,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		if (!wIndex || wIndex > ports)
- 			goto error;
- 		wIndex--;
-+
- 		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
- 			break;
-=20
-@@ -2055,7 +2402,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 			isp1760_hcd_set(hcd, PORT_SUSPEND);
- 			break;
- 		case USB_PORT_FEAT_POWER:
--			if (isp1760_hcd_is_set(hcd, HCS_PPC))
-+			if (isp1760_hcd_ppc_is_set(hcd))
- 				isp1760_hcd_set(hcd, PORT_POWER);
- 			break;
- 		case USB_PORT_FEAT_RESET:
-@@ -2084,7 +2431,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		default:
- 			goto error;
- 		}
--		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
- 		break;
-=20
- 	default:
-@@ -2219,22 +2565,14 @@ int isp1760_hcd_register(struct isp1760_hcd *pri=
v, struct resource *mem,
-=20
- 	priv->hcd =3D hcd;
-=20
--	priv->memory_pool =3D kcalloc(mem_layout->payload_blocks,
--				    sizeof(struct isp1760_memory_chunk),
--				    GFP_KERNEL);
--	if (!priv->memory_pool) {
--		ret =3D -ENOMEM;
--		goto put_hcd;
--	}
--
--	priv->atl_slots =3D kcalloc(mem_layout->ptd_num,
-+	priv->atl_slots =3D kcalloc(mem_layout->slot_num,
- 				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
- 	if (!priv->atl_slots) {
- 		ret =3D -ENOMEM;
--		goto free_mem_pool;
-+		goto put_hcd;
- 	}
-=20
--	priv->int_slots =3D kcalloc(mem_layout->ptd_num,
-+	priv->int_slots =3D kcalloc(mem_layout->slot_num,
- 				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
- 	if (!priv->int_slots) {
- 		ret =3D -ENOMEM;
-@@ -2262,8 +2600,6 @@ int isp1760_hcd_register(struct isp1760_hcd *priv,=
 struct resource *mem,
- 	kfree(priv->int_slots);
- free_atl_slots:
- 	kfree(priv->atl_slots);
--free_mem_pool:
--	kfree(priv->memory_pool);
- put_hcd:
- 	usb_put_hcd(hcd);
- 	return ret;
-@@ -2278,5 +2614,4 @@ void isp1760_hcd_unregister(struct isp1760_hcd *pr=
iv)
- 	usb_put_hcd(priv->hcd);
- 	kfree(priv->atl_slots);
- 	kfree(priv->int_slots);
--	kfree(priv->memory_pool);
- }
-diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp=
1760-hcd.h
-index 9d2427ce3f1a..ee3063a34de3 100644
---- a/drivers/usb/isp1760/isp1760-hcd.h
-+++ b/drivers/usb/isp1760/isp1760-hcd.h
-@@ -19,13 +19,14 @@ struct isp1760_slotinfo {
- };
-=20
- /* chip memory management */
-+#define ISP176x_BLOCK_MAX (32 + 20 + 4)
- #define ISP176x_BLOCK_NUM 3
-=20
- struct isp1760_memory_layout {
- 	unsigned int blocks[ISP176x_BLOCK_NUM];
- 	unsigned int blocks_size[ISP176x_BLOCK_NUM];
-=20
--	unsigned int ptd_num;
-+	unsigned int slot_num;
- 	unsigned int payload_blocks;
- 	unsigned int payload_area_size;
- };
-@@ -51,6 +52,7 @@ struct isp1760_hcd {
- 	struct regmap		*regs;
- 	struct regmap_field	*fields[HC_FIELD_MAX];
-=20
-+	bool			is_isp1763;
- 	const struct isp1760_memory_layout	*memory_layout;
-=20
- 	spinlock_t		lock;
-@@ -58,7 +60,7 @@ struct isp1760_hcd {
- 	int			atl_done_map;
- 	struct isp1760_slotinfo	*int_slots;
- 	int			int_done_map;
--	struct isp1760_memory_chunk *memory_pool;
-+	struct isp1760_memory_chunk memory_pool[ISP176x_BLOCK_MAX];
- 	struct list_head	qh_list[QH_END];
-=20
- 	/* periodic schedule support */
-diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1=
760-if.c
-index cb3e4d782315..7cc349c0b2ad 100644
---- a/drivers/usb/isp1760/isp1760-if.c
-+++ b/drivers/usb/isp1760/isp1760-if.c
-@@ -7,6 +7,7 @@
-  * - PDEV (generic platform device centralized driver model)
-  *
-  * (c) 2007 Sebastian Siewior <bigeasy@linutronix.de>
-+ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
-  *
-  */
-=20
-@@ -209,10 +210,18 @@ static int isp1760_plat_probe(struct platform_devi=
ce *pdev)
- 		if (of_device_is_compatible(dp, "nxp,usb-isp1761"))
- 			devflags |=3D ISP1760_FLAG_ISP1761;
-=20
--		/* Some systems wire up only 16 of the 32 data lines */
-+		if (of_device_is_compatible(dp, "nxp,usb-isp1763"))
-+			devflags |=3D ISP1760_FLAG_ISP1763;
-+
-+		/*
-+		 * Some systems wire up only 8 of 16 data lines or
-+		 * 16 of the 32 data lines
-+		 */
- 		of_property_read_u32(dp, "bus-width", &bus_width);
- 		if (bus_width =3D=3D 16)
- 			devflags |=3D ISP1760_FLAG_BUS_WIDTH_16;
-+		else if (bus_width =3D=3D 8)
-+			devflags |=3D ISP1760_FLAG_BUS_WIDTH_8;
-=20
- 		if (usb_get_dr_mode(&pdev->dev) =3D=3D USB_DR_MODE_PERIPHERAL)
- 			devflags |=3D ISP1760_FLAG_PERIPHERAL_EN;
-@@ -250,6 +259,7 @@ static int isp1760_plat_remove(struct platform_devic=
e *pdev)
- static const struct of_device_id isp1760_of_match[] =3D {
- 	{ .compatible =3D "nxp,usb-isp1760", },
- 	{ .compatible =3D "nxp,usb-isp1761", },
-+	{ .compatible =3D "nxp,usb-isp1763", },
- 	{ },
- };
- MODULE_DEVICE_TABLE(of, isp1760_of_match);
-diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/is=
p1760-regs.h
-index 0d5262c37c5b..4f632cbbbd1f 100644
---- a/drivers/usb/isp1760/isp1760-regs.h
-+++ b/drivers/usb/isp1760/isp1760-regs.h
-@@ -2,12 +2,14 @@
- /*
-  * Driver for the NXP ISP1760 chip
-  *
-+ * Copyright 2021 Linaro, Rui Miguel Silva
-  * Copyright 2014 Laurent Pinchart
-  * Copyright 2007 Sebastian Siewior
-  *
-  * Contacts:
-  *     Sebastian Siewior <bigeasy@linutronix.de>
-  *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-+ *     Rui Miguel Silva <rui.silva@linaro.org>
-  */
-=20
- #ifndef _ISP176x_REGS_H_
-@@ -17,8 +19,8 @@
-  * Host Controller
-  */
-=20
-+/* ISP1760/31 */
- /* EHCI capability registers */
--#define ISP176x_HC_CAPLENGTH		0x000
- #define ISP176x_HC_VERSION		0x002
- #define ISP176x_HC_HCSPARAMS		0x004
- #define ISP176x_HC_HCCPARAMS		0x008
-@@ -59,7 +61,13 @@
- #define ISP176x_HC_INT_IRQ_MASK_AND	0x328
- #define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
-=20
-+#define ISP176x_HC_OTG_CTRL_SET		0x374
-+#define ISP176x_HC_OTG_CTRL_CLEAR	0x376
-+
- enum isp176x_host_controller_fields {
-+	/* HC_PORTSC1 */
-+	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
-+	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
- 	/* HC_HCSPARAMS */
- 	HCS_PPC, HCS_N_PORTS,
- 	/* HC_HCCPARAMS */
-@@ -72,25 +80,86 @@ enum isp176x_host_controller_fields {
- 	HC_FRINDEX,
- 	/* HC_CONFIGFLAG */
- 	FLAG_CF,
--	/* HC_PORTSC1 */
--	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
--	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
-+	/* ISO/INT/ATL PTD */
-+	HC_ISO_PTD_DONEMAP, HC_ISO_PTD_SKIPMAP, HC_ISO_PTD_LASTPTD,
-+	HC_INT_PTD_DONEMAP, HC_INT_PTD_SKIPMAP, HC_INT_PTD_LASTPTD,
-+	HC_ATL_PTD_DONEMAP, HC_ATL_PTD_SKIPMAP, HC_ATL_PTD_LASTPTD,
- 	/* HC_HW_MODE_CTRL */
- 	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_DMA,
- 	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HIGH_AC=
T,
--	HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
-+	HW_INTF_LOCK, HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
-+	/* HC_CHIP_ID */
-+	HC_CHIP_ID_HIGH, HC_CHIP_ID_LOW, HC_CHIP_REV,
-+	/* HC_SCRATCH */
-+	HC_SCRATCH,
- 	/* HC_RESET */
--	SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
-+	SW_RESET_RESET_ATX, SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
- 	/* HC_BUFFER_STATUS */
--	INT_BUF_FILL, ATL_BUF_FILL,
-+	ISO_BUF_FILL, INT_BUF_FILL, ATL_BUF_FILL,
- 	/* HC_MEMORY */
- 	MEM_BANK_SEL, MEM_START_ADDR,
-+	/* HC_DATA */
-+	HC_DATA,
-+	/* HC_INTERRUPT */
-+	HC_INTERRUPT,
- 	/* HC_INTERRUPT_ENABLE */
--	HC_INT_ENABLE,
-+	HC_INT_IRQ_ENABLE, HC_ATL_IRQ_ENABLE,
-+	/* INTERRUPT MASKS */
-+	HC_ISO_IRQ_MASK_OR, HC_INT_IRQ_MASK_OR, HC_ATL_IRQ_MASK_OR,
-+	HC_ISO_IRQ_MASK_AND, HC_INT_IRQ_MASK_AND, HC_ATL_IRQ_MASK_AND,
-+	/* HW_OTG_CTRL_SET */
-+	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
-+	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP, HW_HC_2_DIS,
-+	/* HW_OTG_CTRL_CLR */
-+	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
-+	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
-+	HW_DP_PULLUP_CLEAR, HW_HC_2_DIS_CLEAR,
- 	/* Last element */
- 	HC_FIELD_MAX,
- };
-=20
-+/* ISP1763 */
-+/* EHCI operational registers */
-+#define ISP1763_HC_USBCMD		0x8c
-+#define ISP1763_HC_USBSTS		0x90
-+#define ISP1763_HC_FRINDEX		0x98
-+
-+#define ISP1763_HC_CONFIGFLAG		0x9c
-+#define ISP1763_HC_PORTSC1		0xa0
-+
-+#define ISP1763_HC_ISO_PTD_DONEMAP	0xa4
-+#define ISP1763_HC_ISO_PTD_SKIPMAP	0xa6
-+#define ISP1763_HC_ISO_PTD_LASTPTD	0xa8
-+#define ISP1763_HC_INT_PTD_DONEMAP	0xaa
-+#define ISP1763_HC_INT_PTD_SKIPMAP	0xac
-+#define ISP1763_HC_INT_PTD_LASTPTD	0xae
-+#define ISP1763_HC_ATL_PTD_DONEMAP	0xb0
-+#define ISP1763_HC_ATL_PTD_SKIPMAP	0xb2
-+#define ISP1763_HC_ATL_PTD_LASTPTD	0xb4
-+
-+/* Configuration Register */
-+#define ISP1763_HC_HW_MODE_CTRL		0xb6
-+#define ISP1763_HC_CHIP_REV		0x70
-+#define ISP1763_HC_CHIP_ID		0x72
-+#define ISP1763_HC_SCRATCH		0x78
-+#define ISP1763_HC_RESET		0xb8
-+#define ISP1763_HC_BUFFER_STATUS	0xba
-+#define ISP1763_HC_MEMORY		0xc4
-+#define ISP1763_HC_DATA			0xc6
-+
-+/* Interrupt Register */
-+#define ISP1763_HC_INTERRUPT		0xd4
-+#define ISP1763_HC_INTERRUPT_ENABLE	0xd6
-+#define ISP1763_HC_ISO_IRQ_MASK_OR	0xd8
-+#define ISP1763_HC_INT_IRQ_MASK_OR	0xda
-+#define ISP1763_HC_ATL_IRQ_MASK_OR	0xdc
-+#define ISP1763_HC_ISO_IRQ_MASK_AND	0xde
-+#define ISP1763_HC_INT_IRQ_MASK_AND	0xe0
-+#define ISP1763_HC_ATL_IRQ_MASK_AND	0xe2
-+
-+#define ISP1763_HC_OTG_CTRL_SET		0xe4
-+#define ISP1763_HC_OTG_CTRL_CLEAR	0xe6
-+
- /* --------------------------------------------------------------------=
---------
-  * Peripheral Controller
-  */
-@@ -132,9 +201,6 @@ enum isp176x_host_controller_fields {
- #define ISP176x_DC_CTRLFUNC		0x0228
- #define ISP176x_DC_EPINDEX		0x022c
-=20
--#define ISP1761_DC_OTG_CTRL_SET		0x374
--#define ISP1761_DC_OTG_CTRL_CLEAR	0x376
--
- /* DMA Registers */
- #define ISP176x_DC_DMACMD		0x0230
- #define ISP176x_DC_DMATXCOUNT		0x0234
-@@ -177,13 +243,6 @@ enum isp176x_device_controller_fields {
- 	DC_EPENABLE, DC_ENDPTYP,
- 	/* DC_FRAMENUM */
- 	DC_FRAMENUM, DC_UFRAMENUM,
--	/* HW_OTG_CTRL_SET */
--	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
--	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP,
--	/* HW_OTG_CTRL_CLR */
--	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
--	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
--	HW_DP_PULLUP_CLEAR,
- 	/* Last element */
- 	DC_FIELD_MAX,
- };
-diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp=
1760-udc.c
-index 1e2ca43fb152..30efc9d32506 100644
---- a/drivers/usb/isp1760/isp1760-udc.c
-+++ b/drivers/usb/isp1760/isp1760-udc.c
-@@ -2,10 +2,12 @@
- /*
-  * Driver for the NXP ISP1761 device controller
-  *
-+ * Copyright 2021 Linaro, Rui Miguel Silva
-  * Copyright 2014 Ideas on Board Oy
-  *
-  * Contacts:
-  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-+ *	Rui Miguel Silva <rui.silva@linaro.org>
-  */
-=20
- #include <linux/interrupt.h>
-diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp=
1760-udc.h
-index a49096c0ac8e..f2ab5929cc9f 100644
---- a/drivers/usb/isp1760/isp1760-udc.h
-+++ b/drivers/usb/isp1760/isp1760-udc.h
-@@ -2,10 +2,12 @@
- /*
-  * Driver for the NXP ISP1761 device controller
-  *
-+ * Copyright 2021 Linaro, Rui Miguel Silva
-  * Copyright 2014 Ideas on Board Oy
-  *
-  * Contacts:
-  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-+ *	Rui Miguel Silva <rui.silva@linaro.org>
-  */
-=20
- #ifndef _ISP1760_UDC_H_
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0008-dt=
-bindings-usb-nxp-isp1760-add-bindings.patch b/meta-arm-bsp/recipes-kerne=
l/linux/files/corstone1000/0008-dt-bindings-usb-nxp-isp1760-add-bindings.=
patch
deleted file mode 100644
index 88a701c3..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0008-dt-bindin=
gs-usb-nxp-isp1760-add-bindings.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From e7a990e00cb13ce66d4008e3b77e8507be0c2e27 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 13 May 2021 09:47:16 +0100
-Subject: [PATCH 8/9] dt-bindings: usb: nxp,isp1760: add bindings
-
-The nxp,isp1760 driver is old in the tree, but did not had a bindings
-entry, since I am extend it to support isp1763 in the same family, use
-this to add a proper yaml bindings file.
-
-Reviewed-by: Rob Herring <robh@kernel.org>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210513084717.2487366-9-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- .../devicetree/bindings/usb/nxp,isp1760.yaml  | 69 +++++++++++++++++++
- 1 file changed, 69 insertions(+)
- create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.ya=
ml
-
-diff --git a/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml b/Do=
cumentation/devicetree/bindings/usb/nxp,isp1760.yaml
-new file mode 100644
-index 000000000000..a88f99adfe8e
---- /dev/null
-+++ b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
-@@ -0,0 +1,69 @@
-+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-+%YAML 1.2
-+---
-+$id: http://devicetree.org/schemas/usb/nxp,isp1760.yaml#
-+$schema: http://devicetree.org/meta-schemas/core.yaml#
-+
-+title: NXP ISP1760 family controller bindings
-+
-+maintainers:
-+  - Sebastian Siewior <bigeasy@linutronix.de>
-+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-+
-+description: |
-+  NXP ISP1760 family, which includes ISP1760/1761/1763 devicetree contr=
oller
-+  bindings
-+
-+properties:
-+  compatible:
-+    enum:
-+      - nxp,usb-isp1760
-+      - nxp,usb-isp1761
-+      - nxp,usb-isp1763
-+  reg:
-+    maxItems: 1
-+
-+  interrupts:
-+    minItems: 1
-+    maxItems: 2
-+    items:
-+      - description: Host controller interrupt
-+      - description: Device controller interrupt in isp1761
-+
-+  interrupt-names:
-+    minItems: 1
-+    maxItems: 2
-+    items:
-+      - const: host
-+      - const: peripheral
-+
-+  bus-width:
-+    description:
-+      Number of data lines.
-+    enum: [8, 16, 32]
-+    default: 32
-+
-+  dr_mode:
-+    enum:
-+      - host
-+      - peripheral
-+
-+required:
-+  - compatible
-+  - reg
-+  - interrupts
-+
-+additionalProperties: false
-+
-+examples:
-+  - |
-+    #include <dt-bindings/interrupt-controller/arm-gic.h>
-+    usb@40200000 {
-+        compatible =3D "nxp,usb-isp1763";
-+        reg =3D <0x40200000 0x100000>;
-+        interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-+        bus-width =3D <16>;
-+        dr_mode =3D "host";
-+    };
-+
-+...
---=20
-2.32.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0009-us=
b-isp1763-add-peripheral-mode.patch b/meta-arm-bsp/recipes-kernel/linux/f=
iles/corstone1000/0009-usb-isp1763-add-peripheral-mode.patch
deleted file mode 100644
index 7b06c913..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0009-usb-isp17=
63-add-peripheral-mode.patch
+++ /dev/null
@@ -1,303 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From d369c9187c1897ce5339716354ce47b2c2f67352 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 13 May 2021 09:47:17 +0100
-Subject: [PATCH 08/23] usb: isp1763: add peripheral mode
-
-Besides the already host mode support add peripheral mode support for
-the isp1763 IP from the isp1760 family.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210513084717.2487366-10-rui.silva@lina=
ro.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-core.c | 25 +++++++++++------
- drivers/usb/isp1760/isp1760-regs.h | 42 ++++++++++++++++++++++++++++
- drivers/usb/isp1760/isp1760-udc.c  | 45 ++++++++++++++++++++++--------
- drivers/usb/isp1760/isp1760-udc.h  |  1 +
- 4 files changed, 94 insertions(+), 19 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-index 1d847f13abab..ff07e2890692 100644
---- a/drivers/usb/isp1760/isp1760-core.c
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -83,7 +83,8 @@ static int isp1760_init_core(struct isp1760_device *is=
p)
- 	 *
- 	 * TODO: Really support OTG. For now we configure port 1 in device mod=
e
- 	 */
--	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
-+	if (((isp->devflags & ISP1760_FLAG_ISP1761) ||
-+	     (isp->devflags & ISP1760_FLAG_ISP1763)) &&
- 	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
- 		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
- 		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
-@@ -470,13 +471,15 @@ static const struct regmap_config isp1763_dc_regma=
p_conf =3D {
- int isp1760_register(struct resource *mem, int irq, unsigned long irqfl=
ags,
- 		     struct device *dev, unsigned int devflags)
- {
--	bool udc_disabled =3D !(devflags & ISP1760_FLAG_ISP1761);
- 	const struct regmap_config *hc_regmap;
- 	const struct reg_field *hc_reg_fields;
-+	const struct regmap_config *dc_regmap;
-+	const struct reg_field *dc_reg_fields;
- 	struct isp1760_device *isp;
- 	struct isp1760_hcd *hcd;
- 	struct isp1760_udc *udc;
- 	struct regmap_field *f;
-+	bool udc_enabled;
- 	int ret;
- 	int i;
-=20
-@@ -484,8 +487,11 @@ int isp1760_register(struct resource *mem, int irq,=
 unsigned long irqflags,
- 	 * If neither the HCD not the UDC is enabled return an error, as no
- 	 * device would be registered.
- 	 */
-+	udc_enabled =3D ((devflags & ISP1760_FLAG_ISP1763) ||
-+		       (devflags & ISP1760_FLAG_ISP1761));
-+
- 	if ((!IS_ENABLED(CONFIG_USB_ISP1760_HCD) || usb_disabled()) &&
--	    (!IS_ENABLED(CONFIG_USB_ISP1761_UDC) || udc_disabled))
-+	    (!IS_ENABLED(CONFIG_USB_ISP1761_UDC) || !udc_enabled))
- 		return -ENODEV;
-=20
- 	isp =3D devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
-@@ -498,6 +504,7 @@ int isp1760_register(struct resource *mem, int irq, =
unsigned long irqflags,
- 	udc =3D &isp->udc;
-=20
- 	hcd->is_isp1763 =3D !!(devflags & ISP1760_FLAG_ISP1763);
-+	udc->is_isp1763 =3D !!(devflags & ISP1760_FLAG_ISP1763);
-=20
- 	if (!hcd->is_isp1763 && (devflags & ISP1760_FLAG_BUS_WIDTH_8)) {
- 		dev_err(dev, "isp1760/61 do not support data width 8\n");
-@@ -507,9 +514,13 @@ int isp1760_register(struct resource *mem, int irq,=
 unsigned long irqflags,
- 	if (hcd->is_isp1763) {
- 		hc_regmap =3D &isp1763_hc_regmap_conf;
- 		hc_reg_fields =3D &isp1763_hc_reg_fields[0];
-+		dc_regmap =3D &isp1763_dc_regmap_conf;
-+		dc_reg_fields =3D &isp1763_dc_reg_fields[0];
- 	} else {
- 		hc_regmap =3D &isp1760_hc_regmap_conf;
- 		hc_reg_fields =3D &isp1760_hc_reg_fields[0];
-+		dc_regmap =3D &isp1761_dc_regmap_conf;
-+		dc_reg_fields =3D &isp1761_dc_reg_fields[0];
- 	}
-=20
- 	isp->rst_gpio =3D devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
-@@ -532,14 +543,12 @@ int isp1760_register(struct resource *mem, int irq=
, unsigned long irqflags,
- 		hcd->fields[i] =3D f;
- 	}
-=20
--	udc->regs =3D devm_regmap_init_mmio(dev, hcd->base,
--					  &isp1761_dc_regmap_conf);
-+	udc->regs =3D devm_regmap_init_mmio(dev, hcd->base, dc_regmap);
- 	if (IS_ERR(udc->regs))
- 		return PTR_ERR(udc->regs);
-=20
- 	for (i =3D 0; i < DC_FIELD_MAX; i++) {
--		f =3D devm_regmap_field_alloc(dev, udc->regs,
--					    isp1761_dc_reg_fields[i]);
-+		f =3D devm_regmap_field_alloc(dev, udc->regs, dc_reg_fields[i]);
- 		if (IS_ERR(f))
- 			return PTR_ERR(f);
-=20
-@@ -562,7 +571,7 @@ int isp1760_register(struct resource *mem, int irq, =
unsigned long irqflags,
- 			return ret;
- 	}
-=20
--	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && !udc_disabled) {
-+	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && udc_enabled) {
- 		ret =3D isp1760_udc_register(isp, irq, irqflags);
- 		if (ret < 0) {
- 			isp1760_hcd_unregister(hcd);
-diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/is=
p1760-regs.h
-index 4f632cbbbd1f..94ea60c20b2a 100644
---- a/drivers/usb/isp1760/isp1760-regs.h
-+++ b/drivers/usb/isp1760/isp1760-regs.h
-@@ -243,8 +243,50 @@ enum isp176x_device_controller_fields {
- 	DC_EPENABLE, DC_ENDPTYP,
- 	/* DC_FRAMENUM */
- 	DC_FRAMENUM, DC_UFRAMENUM,
-+	/* DC_CHIP_ID */
-+	DC_CHIP_ID_HIGH, DC_CHIP_ID_LOW,
-+	/* DC_SCRATCH */
-+	DC_SCRATCH,
- 	/* Last element */
- 	DC_FIELD_MAX,
- };
-=20
-+/* ISP1763 */
-+/* Initialization Registers */
-+#define ISP1763_DC_ADDRESS		0x00
-+#define ISP1763_DC_MODE			0x0c
-+#define ISP1763_DC_INTCONF		0x10
-+#define ISP1763_DC_INTENABLE		0x14
-+
-+/* Data Flow Registers */
-+#define ISP1763_DC_EPMAXPKTSZ		0x04
-+#define ISP1763_DC_EPTYPE		0x08
-+
-+#define ISP1763_DC_BUFLEN		0x1c
-+#define ISP1763_DC_BUFSTAT		0x1e
-+#define ISP1763_DC_DATAPORT		0x20
-+
-+#define ISP1763_DC_CTRLFUNC		0x28
-+#define ISP1763_DC_EPINDEX		0x2c
-+
-+/* DMA Registers */
-+#define ISP1763_DC_DMACMD		0x30
-+#define ISP1763_DC_DMATXCOUNT		0x34
-+#define ISP1763_DC_DMACONF		0x38
-+#define ISP1763_DC_DMAHW		0x3c
-+#define ISP1763_DC_DMAINTREASON		0x50
-+#define ISP1763_DC_DMAINTEN		0x54
-+#define ISP1763_DC_DMAEP		0x58
-+#define ISP1763_DC_DMABURSTCOUNT	0x64
-+
-+/* General Registers */
-+#define ISP1763_DC_INTERRUPT		0x18
-+#define ISP1763_DC_CHIPID_LOW		0x70
-+#define ISP1763_DC_CHIPID_HIGH		0x72
-+#define ISP1763_DC_FRAMENUM		0x74
-+#define ISP1763_DC_SCRATCH		0x78
-+#define ISP1763_DC_UNLOCKDEV		0x7c
-+#define ISP1763_DC_INTPULSEWIDTH	0x80
-+#define ISP1763_DC_TESTMODE		0x84
-+
- #endif
-diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp=
1760-udc.c
-index 30efc9d32506..3e05e3605435 100644
---- a/drivers/usb/isp1760/isp1760-udc.c
-+++ b/drivers/usb/isp1760/isp1760-udc.c
-@@ -1151,6 +1151,10 @@ static void isp1760_udc_disconnect(struct isp1760=
_udc *udc)
-=20
- static void isp1760_udc_init_hw(struct isp1760_udc *udc)
- {
-+	u32 intconf =3D udc->is_isp1763 ? ISP1763_DC_INTCONF : ISP176x_DC_INTC=
ONF;
-+	u32 intena =3D udc->is_isp1763 ? ISP1763_DC_INTENABLE :
-+						ISP176x_DC_INTENABLE;
-+
- 	/*
- 	 * The device controller currently shares its interrupt with the host
- 	 * controller, the DC_IRQ polarity and signaling mode are ignored. Set
-@@ -1160,11 +1164,11 @@ static void isp1760_udc_init_hw(struct isp1760_u=
dc *udc)
- 	 * ACK tokens only (and NYET for the out pipe). The default
- 	 * configuration also generates an interrupt on the first NACK token.
- 	 */
--	isp1760_reg_write(udc->regs, ISP176x_DC_INTCONF,
-+	isp1760_reg_write(udc->regs, intconf,
- 			  ISP176x_DC_CDBGMOD_ACK | ISP176x_DC_DDBGMODIN_ACK |
- 			  ISP176x_DC_DDBGMODOUT_ACK);
-=20
--	isp1760_reg_write(udc->regs, ISP176x_DC_INTENABLE, DC_IEPRXTX(7) |
-+	isp1760_reg_write(udc->regs, intena, DC_IEPRXTX(7) |
- 			  DC_IEPRXTX(6) | DC_IEPRXTX(5) | DC_IEPRXTX(4) |
- 			  DC_IEPRXTX(3) | DC_IEPRXTX(2) | DC_IEPRXTX(1) |
- 			  DC_IEPRXTX(0) | ISP176x_DC_IEP0SETUP |
-@@ -1304,13 +1308,14 @@ static int isp1760_udc_start(struct usb_gadget *=
gadget,
- static int isp1760_udc_stop(struct usb_gadget *gadget)
- {
- 	struct isp1760_udc *udc =3D gadget_to_udc(gadget);
-+	u32 mode_reg =3D udc->is_isp1763 ? ISP1763_DC_MODE : ISP176x_DC_MODE;
- 	unsigned long flags;
-=20
- 	dev_dbg(udc->isp->dev, "%s\n", __func__);
-=20
- 	del_timer_sync(&udc->vbus_timer);
-=20
--	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
-+	isp1760_reg_write(udc->regs, mode_reg, 0);
-=20
- 	spin_lock_irqsave(&udc->lock, flags);
- 	udc->driver =3D NULL;
-@@ -1332,15 +1337,30 @@ static const struct usb_gadget_ops isp1760_udc_o=
ps =3D {
-  * Interrupt Handling
-  */
-=20
-+static u32 isp1760_udc_irq_get_status(struct isp1760_udc *udc)
-+{
-+	u32 status;
-+
-+	if (udc->is_isp1763) {
-+		status =3D isp1760_reg_read(udc->regs, ISP1763_DC_INTERRUPT)
-+			& isp1760_reg_read(udc->regs, ISP1763_DC_INTENABLE);
-+		isp1760_reg_write(udc->regs, ISP1763_DC_INTERRUPT, status);
-+	} else {
-+		status =3D isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
-+			& isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
-+		isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
-+	}
-+
-+	return status;
-+}
-+
- static irqreturn_t isp1760_udc_irq(int irq, void *dev)
- {
- 	struct isp1760_udc *udc =3D dev;
- 	unsigned int i;
- 	u32 status;
-=20
--	status =3D isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
--	       & isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
--	isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
-+	status =3D isp1760_udc_irq_get_status(udc);
-=20
- 	if (status & DC_IEVBUS) {
- 		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
-@@ -1475,6 +1495,7 @@ static void isp1760_udc_init_eps(struct isp1760_ud=
c *udc)
-=20
- static int isp1760_udc_init(struct isp1760_udc *udc)
- {
-+	u32 mode_reg =3D udc->is_isp1763 ? ISP1763_DC_MODE : ISP176x_DC_MODE;
- 	u16 scratch;
- 	u32 chipid;
-=20
-@@ -1484,9 +1505,10 @@ static int isp1760_udc_init(struct isp1760_udc *u=
dc)
- 	 * register, and reading the scratch register value back. The chip ID
- 	 * and scratch register contents must match the expected values.
- 	 */
--	isp1760_reg_write(udc->regs, ISP176x_DC_SCRATCH, 0xbabe);
--	chipid =3D isp1760_reg_read(udc->regs, ISP176x_DC_CHIPID);
--	scratch =3D isp1760_reg_read(udc->regs, ISP176x_DC_SCRATCH);
-+	isp1760_udc_write(udc, DC_SCRATCH, 0xbabe);
-+	chipid =3D isp1760_udc_read(udc, DC_CHIP_ID_HIGH) << 16;
-+	chipid |=3D isp1760_udc_read(udc, DC_CHIP_ID_LOW);
-+	scratch =3D isp1760_udc_read(udc, DC_SCRATCH);
-=20
- 	if (scratch !=3D 0xbabe) {
- 		dev_err(udc->isp->dev,
-@@ -1495,7 +1517,8 @@ static int isp1760_udc_init(struct isp1760_udc *ud=
c)
- 		return -ENODEV;
- 	}
-=20
--	if (chipid !=3D 0x00011582 && chipid !=3D 0x00158210) {
-+	if (chipid !=3D 0x00011582 && chipid !=3D 0x00158210 &&
-+	    chipid !=3D 0x00176320) {
- 		dev_err(udc->isp->dev, "udc: invalid chip ID 0x%08x\n", chipid);
- 		return -ENODEV;
- 	}
-@@ -1503,7 +1526,7 @@ static int isp1760_udc_init(struct isp1760_udc *ud=
c)
- 	/* Reset the device controller. */
- 	isp1760_udc_set(udc, DC_SFRESET);
- 	usleep_range(10000, 11000);
--	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
-+	isp1760_reg_write(udc->regs, mode_reg, 0);
- 	usleep_range(10000, 11000);
-=20
- 	return 0;
-diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp=
1760-udc.h
-index f2ab5929cc9f..22044e86bc0e 100644
---- a/drivers/usb/isp1760/isp1760-udc.h
-+++ b/drivers/usb/isp1760/isp1760-udc.h
-@@ -84,6 +84,7 @@ struct isp1760_udc {
- 	u16 ep0_length;
-=20
- 	bool connected;
-+	bool is_isp1763;
-=20
- 	unsigned int devstatus;
- };
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0010-fi=
rmware-smccc-Add-SMCCC-TRNG-function-call-IDs.patch b/meta-arm-bsp/recipe=
s-kernel/linux/files/corstone1000/0010-firmware-smccc-Add-SMCCC-TRNG-func=
tion-call-IDs.patch
deleted file mode 100644
index 56efe4d6..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0010-firmware-=
smccc-Add-SMCCC-TRNG-function-call-IDs.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 67c6bb56b649590a3f59c2a92331aa4e83d4534c Mon Sep 17 00:00:00 2001
-From: Ard Biesheuvel <ardb@kernel.org>
-Date: Wed, 6 Jan 2021 10:34:49 +0000
-Subject: [PATCH] firmware: smccc: Add SMCCC TRNG function call IDs
-
-The ARM architected TRNG firmware interface, described in ARM spec
-DEN0098, define an ARM SMCCC based interface to a true random number
-generator, provided by firmware.
-
-Add the definitions of the SMCCC functions as defined by the spec.
-
-Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
-Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
-Link: https://lore.kernel.org/r/20210106103453.152275-2-andre.przywara@a=
rm.com
-Signed-off-by: Will Deacon <will@kernel.org>
----
- include/linux/arm-smccc.h | 31 +++++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
-
-diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index f860645f6512..62c54234576c 100644
---- a/include/linux/arm-smccc.h
-+++ b/include/linux/arm-smccc.h
-@@ -102,6 +102,37 @@
- 			   ARM_SMCCC_OWNER_STANDARD_HYP,	\
- 			   0x21)
-=20
-+/* TRNG entropy source calls (defined by ARM DEN0098) */
-+#define ARM_SMCCC_TRNG_VERSION					\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
-+			   ARM_SMCCC_SMC_32,			\
-+			   ARM_SMCCC_OWNER_STANDARD,		\
-+			   0x50)
-+
-+#define ARM_SMCCC_TRNG_FEATURES					\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
-+			   ARM_SMCCC_SMC_32,			\
-+			   ARM_SMCCC_OWNER_STANDARD,		\
-+			   0x51)
-+
-+#define ARM_SMCCC_TRNG_GET_UUID					\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
-+			   ARM_SMCCC_SMC_32,			\
-+			   ARM_SMCCC_OWNER_STANDARD,		\
-+			   0x52)
-+
-+#define ARM_SMCCC_TRNG_RND32					\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
-+			   ARM_SMCCC_SMC_32,			\
-+			   ARM_SMCCC_OWNER_STANDARD,		\
-+			   0x53)
-+
-+#define ARM_SMCCC_TRNG_RND64					\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
-+			   ARM_SMCCC_SMC_64,			\
-+			   ARM_SMCCC_OWNER_STANDARD,		\
-+			   0x53)
-+
- /*
-  * Return codes defined in ARM DEN 0070A
-  * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0011-fi=
rmware-smccc-Introduce-SMCCC-TRNG-framework.patch b/meta-arm-bsp/recipes-=
kernel/linux/files/corstone1000/0011-firmware-smccc-Introduce-SMCCC-TRNG-=
framework.patch
deleted file mode 100644
index 44140fae..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0011-firmware-=
smccc-Introduce-SMCCC-TRNG-framework.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From a37e31fc97efe7f7c68cb381cf4390e472c09061 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Wed, 6 Jan 2021 10:34:50 +0000
-Subject: [PATCH] firmware: smccc: Introduce SMCCC TRNG framework
-
-The ARM DEN0098 document describe an SMCCC based firmware service to
-deliver hardware generated random numbers. Its existence is advertised
-according to the SMCCC v1.1 specification.
-
-Add a (dummy) call to probe functions implemented in each architecture
-(ARM and arm64), to determine the existence of this interface.
-For now this return false, but this will be overwritten by each
-architecture's support patch.
-
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
-Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
-Signed-off-by: Will Deacon <will@kernel.org>
----
- arch/arm/include/asm/archrandom.h   | 10 ++++++++++
- arch/arm64/include/asm/archrandom.h | 12 ++++++++++++
- drivers/firmware/smccc/smccc.c      |  6 ++++++
- 3 files changed, 28 insertions(+)
- create mode 100644 arch/arm/include/asm/archrandom.h
-
-diff --git a/arch/arm/include/asm/archrandom.h b/arch/arm/include/asm/ar=
chrandom.h
-new file mode 100644
-index 000000000000..a8e84ca5c2ee
---- /dev/null
-+++ b/arch/arm/include/asm/archrandom.h
-@@ -0,0 +1,10 @@
-+/* SPDX-License-Identifier: GPL-2.0 */
-+#ifndef _ASM_ARCHRANDOM_H
-+#define _ASM_ARCHRANDOM_H
-+
-+static inline bool __init smccc_probe_trng(void)
-+{
-+	return false;
-+}
-+
-+#endif /* _ASM_ARCHRANDOM_H */
-diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/as=
m/archrandom.h
-index ffb1a40d5475..abe07c21da8e 100644
---- a/arch/arm64/include/asm/archrandom.h
-+++ b/arch/arm64/include/asm/archrandom.h
-@@ -8,6 +8,11 @@
- #include <linux/kernel.h>
- #include <asm/cpufeature.h>
-=20
-+static inline bool __init smccc_probe_trng(void)
-+{
-+	return false;
-+}
-+
- static inline bool __arm64_rndr(unsigned long *v)
- {
- 	bool ok;
-@@ -79,5 +84,12 @@ arch_get_random_seed_long_early(unsigned long *v)
- }
- #define arch_get_random_seed_long_early arch_get_random_seed_long_early
-=20
-+#else /* !CONFIG_ARCH_RANDOM */
-+
-+static inline bool __init smccc_probe_trng(void)
-+{
-+	return false;
-+}
-+
- #endif /* CONFIG_ARCH_RANDOM */
- #endif /* _ASM_ARCHRANDOM_H */
-diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smc=
cc.c
-index 00c88b809c0c..d52bfc5ed5e4 100644
---- a/drivers/firmware/smccc/smccc.c
-+++ b/drivers/firmware/smccc/smccc.c
-@@ -5,16 +5,22 @@
-=20
- #define pr_fmt(fmt) "smccc: " fmt
-=20
-+#include <linux/cache.h>
- #include <linux/init.h>
- #include <linux/arm-smccc.h>
-+#include <asm/archrandom.h>
-=20
- static u32 smccc_version =3D ARM_SMCCC_VERSION_1_0;
- static enum arm_smccc_conduit smccc_conduit =3D SMCCC_CONDUIT_NONE;
-=20
-+bool __ro_after_init smccc_trng_available =3D false;
-+
- void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit =
conduit)
- {
- 	smccc_version =3D version;
- 	smccc_conduit =3D conduit;
-+
-+	smccc_trng_available =3D smccc_probe_trng();
- }
-=20
- enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void)
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0012-ar=
m64-smccc-Add-support-for-SMCCCv1.2-extended-input-output-registers.patch=
 b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0012-arm64-smccc-=
Add-support-for-SMCCCv1.2-extended-input-output-registers.patch
deleted file mode 100644
index c338a501..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0012-arm64-smc=
cc-Add-support-for-SMCCCv1.2-extended-input-output-registers.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 3fdc0cb59d97f87e2cc708d424f1538e31744286 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Tue, 18 May 2021 17:36:18 +0100
-Subject: [PATCH] arm64: smccc: Add support for SMCCCv1.2 extended input/=
output
- registers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-SMCCC v1.2 allows x8-x17 to be used as parameter registers and x4=E2=80=94=
x17
-to be used as result registers in SMC64/HVC64. Arm Firmware Framework
-for Armv8-A specification makes use of x0-x7 as parameter and result
-registers. There are other users like Hyper-V who intend to use beyond
-x0-x7 as well.
-
-Current SMCCC interface in the kernel just use x0-x7 as parameter and
-x0-x3 as result registers as required by SMCCCv1.0. Let us add new
-interface to support this extended set of input/output registers namely
-x0-x17 as both parameter and result registers.
-
-Acked-by: Mark Rutland <mark.rutland@arm.com>
-Tested-by: Michael Kelley <mikelley@microsoft.com>
-Reviewed-by: Michael Kelley <mikelley@microsoft.com>
-Cc: Will Deacon <will@kernel.org>
-Cc: Catalin Marinas <catalin.marinas@arm.com>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-Reviewed-by: Mark Brown <broonie@kernel.org>
-Link: https://lore.kernel.org/r/20210518163618.43950-1-sudeep.holla@arm.=
com
-Signed-off-by: Will Deacon <will@kernel.org>
----
- arch/arm64/kernel/asm-offsets.c |  9 ++++++
- arch/arm64/kernel/smccc-call.S  | 57 +++++++++++++++++++++++++++++++++
- include/linux/arm-smccc.h       | 55 +++++++++++++++++++++++++++++++
- 3 files changed, 121 insertions(+)
-
-diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-off=
sets.c
-index 0cb34ccb6e73..74321bc9a459 100644
---- a/arch/arm64/kernel/asm-offsets.c
-+++ b/arch/arm64/kernel/asm-offsets.c
-@@ -138,6 +138,15 @@ int main(void)
-   DEFINE(ARM_SMCCC_RES_X2_OFFS,		offsetof(struct arm_smccc_res, a2));
-   DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id))=
;
-   DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, s=
tate));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X0_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a0));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X2_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a2));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X4_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a4));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X6_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a6));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X8_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a8));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X10_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a10));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X12_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a12));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X14_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a14));
-+  DEFINE(ARM_SMCCC_1_2_REGS_X16_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a16));
-   BLANK();
-   DEFINE(HIBERN_PBE_ORIG,	offsetof(struct pbe, orig_address));
-   DEFINE(HIBERN_PBE_ADDR,	offsetof(struct pbe, address));
-diff --git a/arch/arm64/kernel/smccc-call.S b/arch/arm64/kernel/smccc-ca=
ll.S
-index d62447964ed9..2def9d0dd3dd 100644
---- a/arch/arm64/kernel/smccc-call.S
-+++ b/arch/arm64/kernel/smccc-call.S
-@@ -43,3 +43,60 @@ SYM_FUNC_START(__arm_smccc_hvc)
- 	SMCCC	hvc
- SYM_FUNC_END(__arm_smccc_hvc)
- EXPORT_SYMBOL(__arm_smccc_hvc)
-+
-+	.macro SMCCC_1_2 instr
-+	/* Save `res` and free a GPR that won't be clobbered */
-+	stp     x1, x19, [sp, #-16]!
-+
-+	/* Ensure `args` won't be clobbered while loading regs in next step */
-+	mov	x19, x0
-+
-+	/* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
-+	ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
-+	ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
-+	ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
-+	ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
-+	ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
-+	ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
-+	ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
-+	ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
-+	ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
-+
-+	\instr #0
-+
-+	/* Load the `res` from the stack */
-+	ldr	x19, [sp]
-+
-+	/* Store the registers x0 - x17 into the result structure */
-+	stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
-+	stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
-+	stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
-+	stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
-+	stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
-+	stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
-+	stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
-+	stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
-+	stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
-+
-+	/* Restore original x19 */
-+	ldp     xzr, x19, [sp], #16
-+	ret
-+.endm
-+
-+/*
-+ * void arm_smccc_1_2_hvc(const struct arm_smccc_1_2_regs *args,
-+ *			  struct arm_smccc_1_2_regs *res);
-+ */
-+SYM_FUNC_START(arm_smccc_1_2_hvc)
-+	SMCCC_1_2 hvc
-+SYM_FUNC_END(arm_smccc_1_2_hvc)
-+EXPORT_SYMBOL(arm_smccc_1_2_hvc)
-+
-+/*
-+ * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
-+ *			  struct arm_smccc_1_2_regs *res);
-+ */
-+SYM_FUNC_START(arm_smccc_1_2_smc)
-+	SMCCC_1_2 smc
-+SYM_FUNC_END(arm_smccc_1_2_smc)
-+EXPORT_SYMBOL(arm_smccc_1_2_smc)
-diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index 6861489a1890..5cef2b8b0479 100644
---- a/include/linux/arm-smccc.h
-+++ b/include/linux/arm-smccc.h
-@@ -227,6 +227,61 @@ struct arm_smccc_res {
- 	unsigned long a3;
- };
-=20
-+#ifdef CONFIG_ARM64
-+/**
-+ * struct arm_smccc_1_2_regs - Arguments for or Results from SMC/HVC ca=
ll
-+ * @a0-a17 argument values from registers 0 to 17
-+ */
-+struct arm_smccc_1_2_regs {
-+	unsigned long a0;
-+	unsigned long a1;
-+	unsigned long a2;
-+	unsigned long a3;
-+	unsigned long a4;
-+	unsigned long a5;
-+	unsigned long a6;
-+	unsigned long a7;
-+	unsigned long a8;
-+	unsigned long a9;
-+	unsigned long a10;
-+	unsigned long a11;
-+	unsigned long a12;
-+	unsigned long a13;
-+	unsigned long a14;
-+	unsigned long a15;
-+	unsigned long a16;
-+	unsigned long a17;
-+};
-+
-+/**
-+ * arm_smccc_1_2_hvc() - make HVC calls
-+ * @args: arguments passed via struct arm_smccc_1_2_regs
-+ * @res: result values via struct arm_smccc_1_2_regs
-+ *
-+ * This function is used to make HVC calls following SMC Calling Conven=
tion
-+ * v1.2 or above. The content of the supplied param are copied from the
-+ * structure to registers prior to the HVC instruction. The return valu=
es
-+ * are updated with the content from registers on return from the HVC
-+ * instruction.
-+ */
-+asmlinkage void arm_smccc_1_2_hvc(const struct arm_smccc_1_2_regs *args=
,
-+				  struct arm_smccc_1_2_regs *res);
-+
-+/**
-+ * arm_smccc_1_2_smc() - make SMC calls
-+ * @args: arguments passed via struct arm_smccc_1_2_regs
-+ * @res: result values via struct arm_smccc_1_2_regs
-+ *
-+ * This function is used to make SMC calls following SMC Calling Conven=
tion
-+ * v1.2 or above. The content of the supplied param are copied from the
-+ * structure to registers prior to the SMC instruction. The return valu=
es
-+ * are updated with the content from registers on return from the SMC
-+ * instruction.
-+ */
-+asmlinkage void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args=
,
-+				  struct arm_smccc_1_2_regs *res);
-+#endif
-+
- /**
-  * struct arm_smccc_quirk - Contains quirk information
-  * @id: quirk identification
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0013-fi=
rmware-arm_ffa-Add-initial-FFA-bus-support-for-device-enumeration.patch b=
/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0013-firmware-arm_f=
fa-Add-initial-FFA-bus-support-for-device-enumeration.patch
deleted file mode 100644
index 511d63e5..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0013-firmware-=
arm_ffa-Add-initial-FFA-bus-support-for-device-enumeration.patch
+++ /dev/null
@@ -1,423 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From e781858488b918e30a6ff28e9eab6058b787e3b3 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 21 May 2021 16:10:29 +0100
-Subject: [PATCH] firmware: arm_ffa: Add initial FFA bus support for devi=
ce
- enumeration
-
-The Arm FF for Armv8-A specification has concept of endpoints or
-partitions. In the Normal world, a partition could be a VM when
-the Virtualization extension is enabled or the kernel itself.
-
-In order to handle multiple partitions, we can create a FFA device for
-each such partition on a dedicated FFA bus. Similarly, different drivers
-requiring FFA transport can be registered on the same bus. We can match
-the device and drivers using UUID. This is mostly for the in-kernel
-users with FFA drivers.
-
-Link: https://lore.kernel.org/r/20210521151033.181846-2-sudeep.holla@arm=
.com
-Tested-by: Jens Wiklander <jens.wiklander@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
----
- MAINTAINERS                       |   7 +
- drivers/firmware/Kconfig          |   1 +
- drivers/firmware/Makefile         |   1 +
- drivers/firmware/arm_ffa/Kconfig  |  16 +++
- drivers/firmware/arm_ffa/Makefile |   4 +
- drivers/firmware/arm_ffa/bus.c    | 207 ++++++++++++++++++++++++++++++
- include/linux/arm_ffa.h           |  91 +++++++++++++
- 7 files changed, 327 insertions(+)
- create mode 100644 drivers/firmware/arm_ffa/Kconfig
- create mode 100644 drivers/firmware/arm_ffa/Makefile
- create mode 100644 drivers/firmware/arm_ffa/bus.c
- create mode 100644 include/linux/arm_ffa.h
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index bd7aff0c120f..3b8ab94cf697 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -7069,6 +7069,13 @@ F:	include/linux/firewire.h
- F:	include/uapi/linux/firewire*.h
- F:	tools/firewire/
-=20
-+FIRMWARE FRAMEWORK FOR ARMV8-A
-+M:	Sudeep Holla <sudeep.holla@arm.com>
-+L:	linux-arm-kernel@lists.infradead.org
-+S:	Maintained
-+F:	drivers/firmware/arm_ffa/
-+F:	include/linux/arm_ffa.h
-+
- FIRMWARE LOADER (request_firmware)
- M:	Luis Chamberlain <mcgrof@kernel.org>
- L:	linux-kernel@vger.kernel.org
-diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
-index db0ea2d2d75a..b53ac9fc7704 100644
---- a/drivers/firmware/Kconfig
-+++ b/drivers/firmware/Kconfig
-@@ -296,6 +296,7 @@ config TURRIS_MOX_RWTM
- 	  other manufacturing data and also utilize the Entropy Bit Generator
- 	  for hardware random number generation.
-=20
-+source "drivers/firmware/arm_ffa/Kconfig"
- source "drivers/firmware/broadcom/Kconfig"
- source "drivers/firmware/google/Kconfig"
- source "drivers/firmware/efi/Kconfig"
-diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
-index 5e013b6a3692..546ac8e7f6d0 100644
---- a/drivers/firmware/Makefile
-+++ b/drivers/firmware/Makefile
-@@ -22,6 +22,7 @@ obj-$(CONFIG_TI_SCI_PROTOCOL)	+=3D ti_sci.o
- obj-$(CONFIG_TRUSTED_FOUNDATIONS) +=3D trusted_foundations.o
- obj-$(CONFIG_TURRIS_MOX_RWTM)	+=3D turris-mox-rwtm.o
-=20
-+obj-y				+=3D arm_ffa/
- obj-y				+=3D arm_scmi/
- obj-y				+=3D broadcom/
- obj-y				+=3D meson/
-diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm_ffa=
/Kconfig
-new file mode 100644
-index 000000000000..261a3660650a
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/Kconfig
-@@ -0,0 +1,16 @@
-+# SPDX-License-Identifier: GPL-2.0-only
-+config ARM_FFA_TRANSPORT
-+	tristate "Arm Firmware Framework for Armv8-A"
-+	depends on OF
-+	depends on ARM64
-+	default n
-+	help
-+	  This Firmware Framework(FF) for Arm A-profile processors describes
-+	  interfaces that standardize communication between the various
-+	  software images which includes communication between images in
-+	  the Secure world and Normal world. It also leverages the
-+	  virtualization extension to isolate software images provided
-+	  by an ecosystem of vendors from each other.
-+
-+	  This driver provides interface for all the client drivers making
-+	  use of the features offered by ARM FF-A.
-diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ff=
a/Makefile
-new file mode 100644
-index 000000000000..bfe4323a8784
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/Makefile
-@@ -0,0 +1,4 @@
-+# SPDX-License-Identifier: GPL-2.0-only
-+ffa-bus-y =3D bus.o
-+ffa-module-objs :=3D $(ffa-bus-y)
-+obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
-diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/b=
us.c
-new file mode 100644
-index 000000000000..a17874bed946
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/bus.c
-@@ -0,0 +1,207 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-+
-+#include <linux/arm_ffa.h>
-+#include <linux/device.h>
-+#include <linux/fs.h>
-+#include <linux/kernel.h>
-+#include <linux/module.h>
-+#include <linux/slab.h>
-+#include <linux/types.h>
-+
-+static int ffa_device_match(struct device *dev, struct device_driver *d=
rv)
-+{
-+	const struct ffa_device_id *id_table;
-+	struct ffa_device *ffa_dev;
-+
-+	id_table =3D to_ffa_driver(drv)->id_table;
-+	ffa_dev =3D to_ffa_dev(dev);
-+
-+	while (!uuid_is_null(&id_table->uuid)) {
-+		if (uuid_equal(&ffa_dev->uuid, &id_table->uuid))
-+			return 1;
-+		id_table++;
-+	}
-+
-+	return 0;
-+}
-+
-+static int ffa_device_probe(struct device *dev)
-+{
-+	struct ffa_driver *ffa_drv =3D to_ffa_driver(dev->driver);
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	if (!ffa_device_match(dev, dev->driver))
-+		return -ENODEV;
-+
-+	return ffa_drv->probe(ffa_dev);
-+}
-+
-+static int ffa_device_uevent(struct device *dev, struct kobj_uevent_env=
 *env)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	return add_uevent_var(env, "MODALIAS=3Darm_ffa:%04x:%pUb",
-+			      ffa_dev->vm_id, &ffa_dev->uuid);
-+}
-+
-+static ssize_t partition_id_show(struct device *dev,
-+				 struct device_attribute *attr, char *buf)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	return sprintf(buf, "0x%04x\n", ffa_dev->vm_id);
-+}
-+static DEVICE_ATTR_RO(partition_id);
-+
-+static ssize_t uuid_show(struct device *dev, struct device_attribute *a=
ttr,
-+			 char *buf)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	return sprintf(buf, "%pUb\n", &ffa_dev->uuid);
-+}
-+static DEVICE_ATTR_RO(uuid);
-+
-+static struct attribute *ffa_device_attributes_attrs[] =3D {
-+	&dev_attr_partition_id.attr,
-+	&dev_attr_uuid.attr,
-+	NULL,
-+};
-+ATTRIBUTE_GROUPS(ffa_device_attributes);
-+
-+struct bus_type ffa_bus_type =3D {
-+	.name		=3D "arm_ffa",
-+	.match		=3D ffa_device_match,
-+	.probe		=3D ffa_device_probe,
-+	.uevent		=3D ffa_device_uevent,
-+	.dev_groups	=3D ffa_device_attributes_groups,
-+};
-+EXPORT_SYMBOL_GPL(ffa_bus_type);
-+
-+int ffa_driver_register(struct ffa_driver *driver, struct module *owner=
,
-+			const char *mod_name)
-+{
-+	int ret;
-+
-+	driver->driver.bus =3D &ffa_bus_type;
-+	driver->driver.name =3D driver->name;
-+	driver->driver.owner =3D owner;
-+	driver->driver.mod_name =3D mod_name;
-+
-+	ret =3D driver_register(&driver->driver);
-+	if (!ret)
-+		pr_debug("registered new ffa driver %s\n", driver->name);
-+
-+	return ret;
-+}
-+EXPORT_SYMBOL_GPL(ffa_driver_register);
-+
-+void ffa_driver_unregister(struct ffa_driver *driver)
-+{
-+	driver_unregister(&driver->driver);
-+}
-+EXPORT_SYMBOL_GPL(ffa_driver_unregister);
-+
-+static void ffa_release_device(struct device *dev)
-+{
-+	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-+
-+	kfree(ffa_dev);
-+}
-+
-+static int __ffa_devices_unregister(struct device *dev, void *data)
-+{
-+	ffa_release_device(dev);
-+
-+	return 0;
-+}
-+
-+static void ffa_devices_unregister(void)
-+{
-+	bus_for_each_dev(&ffa_bus_type, NULL, NULL,
-+			 __ffa_devices_unregister);
-+}
-+
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev)
-+{
-+	bool valid =3D false;
-+	struct device *dev =3D NULL;
-+	struct ffa_device *tmp_dev;
-+
-+	do {
-+		dev =3D bus_find_next_device(&ffa_bus_type, dev);
-+		tmp_dev =3D to_ffa_dev(dev);
-+		if (tmp_dev =3D=3D ffa_dev) {
-+			valid =3D true;
-+			break;
-+		}
-+		put_device(dev);
-+	} while (dev);
-+
-+	put_device(dev);
-+
-+	return valid;
-+}
-+
-+struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
-+{
-+	int ret;
-+	struct device *dev;
-+	struct ffa_device *ffa_dev;
-+
-+	ffa_dev =3D kzalloc(sizeof(*ffa_dev), GFP_KERNEL);
-+	if (!ffa_dev)
-+		return NULL;
-+
-+	dev =3D &ffa_dev->dev;
-+	dev->bus =3D &ffa_bus_type;
-+	dev->release =3D ffa_release_device;
-+	dev_set_name(&ffa_dev->dev, "arm-ffa-%04x", vm_id);
-+
-+	ffa_dev->vm_id =3D vm_id;
-+	uuid_copy(&ffa_dev->uuid, uuid);
-+
-+	ret =3D device_register(&ffa_dev->dev);
-+	if (ret) {
-+		dev_err(dev, "unable to register device %s err=3D%d\n",
-+			dev_name(dev), ret);
-+		put_device(dev);
-+		return NULL;
-+	}
-+
-+	return ffa_dev;
-+}
-+EXPORT_SYMBOL_GPL(ffa_device_register);
-+
-+void ffa_device_unregister(struct ffa_device *ffa_dev)
-+{
-+	if (!ffa_dev)
-+		return;
-+
-+	device_unregister(&ffa_dev->dev);
-+}
-+EXPORT_SYMBOL_GPL(ffa_device_unregister);
-+
-+static int __init arm_ffa_bus_init(void)
-+{
-+	return bus_register(&ffa_bus_type);
-+}
-+module_init(arm_ffa_bus_init);
-+
-+static void __exit arm_ffa_bus_exit(void)
-+{
-+	ffa_devices_unregister();
-+	bus_unregister(&ffa_bus_type);
-+}
-+
-+module_exit(arm_ffa_bus_exit);
-+
-+MODULE_ALIAS("arm-ffa-bus");
-+MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
-+MODULE_DESCRIPTION("Arm FF-A bus driver");
-+MODULE_LICENSE("GPL v2");
-diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
-new file mode 100644
-index 000000000000..331ff62c9873
---- /dev/null
-+++ b/include/linux/arm_ffa.h
-@@ -0,0 +1,91 @@
-+/* SPDX-License-Identifier: GPL-2.0-only */
-+/*
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#ifndef _LINUX_ARM_FFA_H
-+#define _LINUX_ARM_FFA_H
-+
-+#include <linux/cdev.h>
-+#include <linux/device.h>
-+#include <linux/module.h>
-+#include <linux/types.h>
-+#include <linux/uuid.h>
-+
-+/* FFA Bus/Device/Driver related */
-+struct ffa_device {
-+	int vm_id;
-+	uuid_t uuid;
-+	struct device dev;
-+};
-+
-+#define to_ffa_dev(d) container_of(d, struct ffa_device, dev)
-+
-+struct ffa_device_id {
-+	uuid_t uuid;
-+};
-+
-+struct ffa_driver {
-+	const char *name;
-+	int (*probe)(struct ffa_device *sdev);
-+	void (*remove)(struct ffa_device *sdev);
-+	const struct ffa_device_id *id_table;
-+
-+	struct device_driver driver;
-+};
-+
-+#define to_ffa_driver(d) container_of(d, struct ffa_driver, driver)
-+
-+static inline void ffa_dev_set_drvdata(struct ffa_device *fdev, void *d=
ata)
-+{
-+	fdev->dev.driver_data =3D data;
-+}
-+
-+#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
-+struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id);
-+void ffa_device_unregister(struct ffa_device *ffa_dev);
-+int ffa_driver_register(struct ffa_driver *driver, struct module *owner=
,
-+			const char *mod_name);
-+void ffa_driver_unregister(struct ffa_driver *driver);
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev);
-+
-+#else
-+static inline
-+struct ffa_device *ffa_device_register(const uuid_t *uuid, int vm_id)
-+{
-+	return NULL;
-+}
-+
-+static inline void ffa_device_unregister(struct ffa_device *dev) {}
-+
-+static inline int
-+ffa_driver_register(struct ffa_driver *driver, struct module *owner,
-+		    const char *mod_name)
-+{
-+	return -EINVAL;
-+}
-+
-+static inline void ffa_driver_unregister(struct ffa_driver *driver) {}
-+
-+static inline
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev) { return false; }
-+
-+#endif /* CONFIG_ARM_FFA_TRANSPORT */
-+
-+#define ffa_register(driver) \
-+	ffa_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
-+#define ffa_unregister(driver) \
-+	ffa_driver_unregister(driver)
-+
-+/**
-+ * module_ffa_driver() - Helper macro for registering a psa_ffa driver
-+ * @__ffa_driver: ffa_driver structure
-+ *
-+ * Helper macro for psa_ffa drivers to set up proper module init / exit
-+ * functions.  Replaces module_init() and module_exit() and keeps peopl=
e from
-+ * printing pointless things to the kernel log when their driver is loa=
ded.
-+ */
-+#define module_ffa_driver(__ffa_driver)	\
-+	module_driver(__ffa_driver, ffa_register, ffa_unregister)
-+
-+#endif /* _LINUX_ARM_FFA_H */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0014-fi=
rmware-arm_ffa-Add-initial-Arm-FFA-driver-support.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone1000/0014-firmware-arm_ffa-Add-initial-A=
rm-FFA-driver-support.patch
deleted file mode 100644
index c0dcfdc3..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0014-firmware-=
arm_ffa-Add-initial-Arm-FFA-driver-support.patch
+++ /dev/null
@@ -1,422 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 3bbfe9871005f38df2955b2e125933edf1d2feef Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 21 May 2021 16:10:30 +0100
-Subject: [PATCH] firmware: arm_ffa: Add initial Arm FFA driver support
-
-This just add a basic driver that sets up the transport(e.g. SMCCC),
-checks the FFA version implemented, get the partition ID for self and
-sets up the Tx/Rx buffers for communication.
-
-Link: https://lore.kernel.org/r/20210521151033.181846-3-sudeep.holla@arm=
.com
-Tested-by: Jens Wiklander <jens.wiklander@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
----
- drivers/firmware/arm_ffa/Makefile |   3 +-
- drivers/firmware/arm_ffa/bus.c    |  14 +-
- drivers/firmware/arm_ffa/common.h |  24 +++
- drivers/firmware/arm_ffa/driver.c | 311 ++++++++++++++++++++++++++++++
- 4 files changed, 341 insertions(+), 11 deletions(-)
- create mode 100644 drivers/firmware/arm_ffa/common.h
- create mode 100644 drivers/firmware/arm_ffa/driver.c
-
-diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ff=
a/Makefile
-index bfe4323a8784..82d0d35c5324 100644
---- a/drivers/firmware/arm_ffa/Makefile
-+++ b/drivers/firmware/arm_ffa/Makefile
-@@ -1,4 +1,5 @@
- # SPDX-License-Identifier: GPL-2.0-only
- ffa-bus-y =3D bus.o
--ffa-module-objs :=3D $(ffa-bus-y)
-+ffa-driver-y =3D driver.o
-+ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y)
- obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
-diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/b=
us.c
-index a17874bed946..ae1eada5dc0c 100644
---- a/drivers/firmware/arm_ffa/bus.c
-+++ b/drivers/firmware/arm_ffa/bus.c
-@@ -13,6 +13,8 @@
- #include <linux/slab.h>
- #include <linux/types.h>
-=20
-+#include "common.h"
-+
- static int ffa_device_match(struct device *dev, struct device_driver *d=
rv)
- {
- 	const struct ffa_device_id *id_table;
-@@ -187,21 +189,13 @@ void ffa_device_unregister(struct ffa_device *ffa_=
dev)
- }
- EXPORT_SYMBOL_GPL(ffa_device_unregister);
-=20
--static int __init arm_ffa_bus_init(void)
-+int arm_ffa_bus_init(void)
- {
- 	return bus_register(&ffa_bus_type);
- }
--module_init(arm_ffa_bus_init);
-=20
--static void __exit arm_ffa_bus_exit(void)
-+void arm_ffa_bus_exit(void)
- {
- 	ffa_devices_unregister();
- 	bus_unregister(&ffa_bus_type);
- }
--
--module_exit(arm_ffa_bus_exit);
--
--MODULE_ALIAS("arm-ffa-bus");
--MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
--MODULE_DESCRIPTION("Arm FF-A bus driver");
--MODULE_LICENSE("GPL v2");
-diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ff=
a/common.h
-new file mode 100644
-index 000000000000..2d3a32f67d5d
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/common.h
-@@ -0,0 +1,24 @@
-+/* SPDX-License-Identifier: GPL-2.0 */
-+/*
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#ifndef _FFA_COMMON_H
-+#define _FFA_COMMON_H
-+
-+#include <linux/arm-smccc.h>
-+#include <linux/err.h>
-+
-+typedef struct arm_smccc_1_2_regs ffa_value_t;
-+
-+typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
-+
-+int arm_ffa_bus_init(void);
-+void arm_ffa_bus_exit(void);
-+
-+static inline int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
-+{
-+	return -EOPNOTSUPP;
-+}
-+
-+#endif /* _FFA_COMMON_H */
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-new file mode 100644
-index 000000000000..4846f079dca0
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -0,0 +1,311 @@
-+// SPDX-License-Identifier: GPL-2.0-only
-+/*
-+ * Arm Firmware Framework for ARMv8-A(FFA) interface driver
-+ *
-+ * The Arm FFA specification[1] describes a software architecture to
-+ * leverages the virtualization extension to isolate software images
-+ * provided by an ecosystem of vendors from each other and describes
-+ * interfaces that standardize communication between the various softwa=
re
-+ * images including communication between images in the Secure world an=
d
-+ * Normal world. Any Hypervisor could use the FFA interfaces to enable
-+ * communication between VMs it manages.
-+ *
-+ * The Hypervisor a.k.a Partition managers in FFA terminology can assig=
n
-+ * system resources(Memory regions, Devices, CPU cycles) to the partiti=
ons
-+ * and manage isolation amongst them.
-+ *
-+ * [1] https://developer.arm.com/docs/den0077/latest
-+ *
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#define DRIVER_NAME "ARM FF-A"
-+#define pr_fmt(fmt) DRIVER_NAME ": " fmt
-+
-+#include <linux/arm_ffa.h>
-+#include <linux/bitfield.h>
-+#include <linux/io.h>
-+#include <linux/module.h>
-+#include <linux/slab.h>
-+
-+#include "common.h"
-+
-+#define FFA_DRIVER_VERSION	FFA_VERSION_1_0
-+
-+#define FFA_SMC(calling_convention, func_num)				\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
-+			   ARM_SMCCC_OWNER_STANDARD, (func_num))
-+
-+#define FFA_SMC_32(func_num)	FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
-+#define FFA_SMC_64(func_num)	FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
-+
-+#define FFA_ERROR			FFA_SMC_32(0x60)
-+#define FFA_SUCCESS			FFA_SMC_32(0x61)
-+#define FFA_INTERRUPT			FFA_SMC_32(0x62)
-+#define FFA_VERSION			FFA_SMC_32(0x63)
-+#define FFA_FEATURES			FFA_SMC_32(0x64)
-+#define FFA_RX_RELEASE			FFA_SMC_32(0x65)
-+#define FFA_RXTX_MAP			FFA_SMC_32(0x66)
-+#define FFA_FN64_RXTX_MAP		FFA_SMC_64(0x66)
-+#define FFA_RXTX_UNMAP			FFA_SMC_32(0x67)
-+#define FFA_PARTITION_INFO_GET		FFA_SMC_32(0x68)
-+#define FFA_ID_GET			FFA_SMC_32(0x69)
-+#define FFA_MSG_POLL			FFA_SMC_32(0x6A)
-+#define FFA_MSG_WAIT			FFA_SMC_32(0x6B)
-+#define FFA_YIELD			FFA_SMC_32(0x6C)
-+#define FFA_RUN				FFA_SMC_32(0x6D)
-+#define FFA_MSG_SEND			FFA_SMC_32(0x6E)
-+#define FFA_MSG_SEND_DIRECT_REQ		FFA_SMC_32(0x6F)
-+#define FFA_FN64_MSG_SEND_DIRECT_REQ	FFA_SMC_64(0x6F)
-+#define FFA_MSG_SEND_DIRECT_RESP	FFA_SMC_32(0x70)
-+#define FFA_FN64_MSG_SEND_DIRECT_RESP	FFA_SMC_64(0x70)
-+#define FFA_MEM_DONATE			FFA_SMC_32(0x71)
-+#define FFA_FN64_MEM_DONATE		FFA_SMC_64(0x71)
-+#define FFA_MEM_LEND			FFA_SMC_32(0x72)
-+#define FFA_FN64_MEM_LEND		FFA_SMC_64(0x72)
-+#define FFA_MEM_SHARE			FFA_SMC_32(0x73)
-+#define FFA_FN64_MEM_SHARE		FFA_SMC_64(0x73)
-+#define FFA_MEM_RETRIEVE_REQ		FFA_SMC_32(0x74)
-+#define FFA_FN64_MEM_RETRIEVE_REQ	FFA_SMC_64(0x74)
-+#define FFA_MEM_RETRIEVE_RESP		FFA_SMC_32(0x75)
-+#define FFA_MEM_RELINQUISH		FFA_SMC_32(0x76)
-+#define FFA_MEM_RECLAIM			FFA_SMC_32(0x77)
-+#define FFA_MEM_OP_PAUSE		FFA_SMC_32(0x78)
-+#define FFA_MEM_OP_RESUME		FFA_SMC_32(0x79)
-+#define FFA_MEM_FRAG_RX			FFA_SMC_32(0x7A)
-+#define FFA_MEM_FRAG_TX			FFA_SMC_32(0x7B)
-+#define FFA_NORMAL_WORLD_RESUME		FFA_SMC_32(0x7C)
-+
-+/*
-+ * For some calls it is necessary to use SMC64 to pass or return 64-bit=
 values.
-+ * For such calls FFA_FN_NATIVE(name) will choose the appropriate
-+ * (native-width) function ID.
-+ */
-+#ifdef CONFIG_64BIT
-+#define FFA_FN_NATIVE(name)	FFA_FN64_##name
-+#else
-+#define FFA_FN_NATIVE(name)	FFA_##name
-+#endif
-+
-+/* FFA error codes. */
-+#define FFA_RET_SUCCESS            (0)
-+#define FFA_RET_NOT_SUPPORTED      (-1)
-+#define FFA_RET_INVALID_PARAMETERS (-2)
-+#define FFA_RET_NO_MEMORY          (-3)
-+#define FFA_RET_BUSY               (-4)
-+#define FFA_RET_INTERRUPTED        (-5)
-+#define FFA_RET_DENIED             (-6)
-+#define FFA_RET_RETRY              (-7)
-+#define FFA_RET_ABORTED            (-8)
-+
-+#define MAJOR_VERSION_MASK	GENMASK(30, 16)
-+#define MINOR_VERSION_MASK	GENMASK(15, 0)
-+#define MAJOR_VERSION(x)	((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
-+#define MINOR_VERSION(x)	((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
-+#define PACK_VERSION_INFO(major, minor)			\
-+	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
-+	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
-+#define FFA_VERSION_1_0		PACK_VERSION_INFO(1, 0)
-+#define FFA_MIN_VERSION		FFA_VERSION_1_0
-+
-+#define SENDER_ID_MASK		GENMASK(31, 16)
-+#define RECEIVER_ID_MASK	GENMASK(15, 0)
-+#define SENDER_ID(x)		((u16)(FIELD_GET(SENDER_ID_MASK, (x))))
-+#define RECEIVER_ID(x)		((u16)(FIELD_GET(RECEIVER_ID_MASK, (x))))
-+#define PACK_TARGET_INFO(s, r)		\
-+	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
-+
-+/**
-+ * FF-A specification mentions explicitly about '4K pages'. This should
-+ * not be confused with the kernel PAGE_SIZE, which is the translation
-+ * granule kernel is configured and may be one among 4K, 16K and 64K.
-+ */
-+#define FFA_PAGE_SIZE		SZ_4K
-+/*
-+ * Keeping RX TX buffer size as 4K for now
-+ * 64K may be preferred to keep it min a page in 64K PAGE_SIZE config
-+ */
-+#define RXTX_BUFFER_SIZE	SZ_4K
-+
-+static ffa_fn *invoke_ffa_fn;
-+
-+static const int ffa_linux_errmap[] =3D {
-+	/* better than switch case as long as return value is continuous */
-+	0,		/* FFA_RET_SUCCESS */
-+	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
-+	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
-+	-ENOMEM,	/* FFA_RET_NO_MEMORY */
-+	-EBUSY,		/* FFA_RET_BUSY */
-+	-EINTR,		/* FFA_RET_INTERRUPTED */
-+	-EACCES,	/* FFA_RET_DENIED */
-+	-EAGAIN,	/* FFA_RET_RETRY */
-+	-ECANCELED,	/* FFA_RET_ABORTED */
-+};
-+
-+static inline int ffa_to_linux_errno(int errno)
-+{
-+	if (errno < FFA_RET_SUCCESS && errno >=3D -ARRAY_SIZE(ffa_linux_errmap=
))
-+		return ffa_linux_errmap[-errno];
-+	return -EINVAL;
-+}
-+
-+struct ffa_drv_info {
-+	u32 version;
-+	u16 vm_id;
-+	struct mutex rx_lock; /* lock to protect Rx buffer */
-+	struct mutex tx_lock; /* lock to protect Tx buffer */
-+	void *rx_buffer;
-+	void *tx_buffer;
-+};
-+
-+static struct ffa_drv_info *drv_info;
-+
-+static int ffa_version_check(u32 *version)
-+{
-+	ffa_value_t ver;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_VERSION, .a1 =3D FFA_DRIVER_VERSION,
-+		      }, &ver);
-+
-+	if (ver.a0 =3D=3D FFA_RET_NOT_SUPPORTED) {
-+		pr_info("FFA_VERSION returned not supported\n");
-+		return -EOPNOTSUPP;
-+	}
-+
-+	if (ver.a0 < FFA_MIN_VERSION || ver.a0 > FFA_DRIVER_VERSION) {
-+		pr_err("Incompatible version %d.%d found\n",
-+		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0));
-+		return -EINVAL;
-+	}
-+
-+	*version =3D ver.a0;
-+	pr_info("Version %d.%d found\n", MAJOR_VERSION(ver.a0),
-+		MINOR_VERSION(ver.a0));
-+	return 0;
-+}
-+
-+static int ffa_rxtx_map(phys_addr_t tx_buf, phys_addr_t rx_buf, u32 pg_=
cnt)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_FN_NATIVE(RXTX_MAP),
-+		      .a1 =3D tx_buf, .a2 =3D rx_buf, .a3 =3D pg_cnt,
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	return 0;
-+}
-+
-+static int ffa_rxtx_unmap(u16 vm_id)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_RXTX_UNMAP, .a1 =3D PACK_TARGET_INFO(vm_id, 0),
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	return 0;
-+}
-+
-+#define VM_ID_MASK	GENMASK(15, 0)
-+static int ffa_id_get(u16 *vm_id)
-+{
-+	ffa_value_t id;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_ID_GET,
-+		      }, &id);
-+
-+	if (id.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)id.a2);
-+
-+	*vm_id =3D FIELD_GET(VM_ID_MASK, (id.a2));
-+
-+	return 0;
-+}
-+
-+static int __init ffa_init(void)
-+{
-+	int ret;
-+
-+	ret =3D ffa_transport_init(&invoke_ffa_fn);
-+	if (ret)
-+		return ret;
-+
-+	ret =3D arm_ffa_bus_init();
-+	if (ret)
-+		return ret;
-+
-+	drv_info =3D kzalloc(sizeof(*drv_info), GFP_KERNEL);
-+	if (!drv_info) {
-+		ret =3D -ENOMEM;
-+		goto ffa_bus_exit;
-+	}
-+
-+	ret =3D ffa_version_check(&drv_info->version);
-+	if (ret)
-+		goto free_drv_info;
-+
-+	if (ffa_id_get(&drv_info->vm_id)) {
-+		pr_err("failed to obtain VM id for self\n");
-+		ret =3D -ENODEV;
-+		goto free_drv_info;
-+	}
-+
-+	drv_info->rx_buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL=
);
-+	if (!drv_info->rx_buffer) {
-+		ret =3D -ENOMEM;
-+		goto free_pages;
-+	}
-+
-+	drv_info->tx_buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL=
);
-+	if (!drv_info->tx_buffer) {
-+		ret =3D -ENOMEM;
-+		goto free_pages;
-+	}
-+
-+	ret =3D ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
-+			   virt_to_phys(drv_info->rx_buffer),
-+			   RXTX_BUFFER_SIZE / FFA_PAGE_SIZE);
-+	if (ret) {
-+		pr_err("failed to register FFA RxTx buffers\n");
-+		goto free_pages;
-+	}
-+
-+	mutex_init(&drv_info->rx_lock);
-+	mutex_init(&drv_info->tx_lock);
-+
-+	return 0;
-+free_pages:
-+	if (drv_info->tx_buffer)
-+		free_pages_exact(drv_info->tx_buffer, RXTX_BUFFER_SIZE);
-+	free_pages_exact(drv_info->rx_buffer, RXTX_BUFFER_SIZE);
-+free_drv_info:
-+	kfree(drv_info);
-+ffa_bus_exit:
-+	arm_ffa_bus_exit();
-+	return ret;
-+}
-+subsys_initcall(ffa_init);
-+
-+static void __exit ffa_exit(void)
-+{
-+	ffa_rxtx_unmap(drv_info->vm_id);
-+	free_pages_exact(drv_info->tx_buffer, RXTX_BUFFER_SIZE);
-+	free_pages_exact(drv_info->rx_buffer, RXTX_BUFFER_SIZE);
-+	kfree(drv_info);
-+	arm_ffa_bus_exit();
-+}
-+module_exit(ffa_exit);
-+
-+MODULE_ALIAS("arm-ffa");
-+MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
-+MODULE_DESCRIPTION("Arm FF-A interface driver");
-+MODULE_LICENSE("GPL v2");
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0015-fi=
rmware-arm_ffa-Add-support-for-SMCCC-as-transport-to-ffa-driver.patch b/m=
eta-arm-bsp/recipes-kernel/linux/files/corstone1000/0015-firmware-arm_ffa=
-Add-support-for-SMCCC-as-transport-to-ffa-driver.patch
deleted file mode 100644
index 0d0298cb..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0015-firmware-=
arm_ffa-Add-support-for-SMCCC-as-transport-to-ffa-driver.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 714be77e976a4b013b935b3223b2ef68856084d0 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 21 May 2021 16:10:31 +0100
-Subject: [PATCH] firmware: arm_ffa: Add support for SMCCC as transport t=
o FFA
- driver
-
-There are requests to keep the transport separate in order to allow
-other possible transports like virtio. So let us keep the SMCCC transpor=
t
-specific routines abstracted.
-
-It is kept simple for now. Once we add another transport, we can develop
-better abstraction.
-
-Link: https://lore.kernel.org/r/20210521151033.181846-4-sudeep.holla@arm=
.com
-Tested-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
----
- drivers/firmware/arm_ffa/Kconfig  |  5 ++++
- drivers/firmware/arm_ffa/Makefile |  3 ++-
- drivers/firmware/arm_ffa/common.h |  4 ++++
- drivers/firmware/arm_ffa/smccc.c  | 39 +++++++++++++++++++++++++++++++
- 4 files changed, 50 insertions(+), 1 deletion(-)
- create mode 100644 drivers/firmware/arm_ffa/smccc.c
-
-diff --git a/drivers/firmware/arm_ffa/Kconfig b/drivers/firmware/arm_ffa=
/Kconfig
-index 261a3660650a..5e3ae5cf82e8 100644
---- a/drivers/firmware/arm_ffa/Kconfig
-+++ b/drivers/firmware/arm_ffa/Kconfig
-@@ -14,3 +14,8 @@ config ARM_FFA_TRANSPORT
-=20
- 	  This driver provides interface for all the client drivers making
- 	  use of the features offered by ARM FF-A.
-+
-+config ARM_FFA_SMCCC
-+	bool
-+	default ARM_FFA_TRANSPORT
-+	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
-diff --git a/drivers/firmware/arm_ffa/Makefile b/drivers/firmware/arm_ff=
a/Makefile
-index 82d0d35c5324..9d9f37523200 100644
---- a/drivers/firmware/arm_ffa/Makefile
-+++ b/drivers/firmware/arm_ffa/Makefile
-@@ -1,5 +1,6 @@
- # SPDX-License-Identifier: GPL-2.0-only
- ffa-bus-y =3D bus.o
- ffa-driver-y =3D driver.o
--ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y)
-+ffa-transport-$(CONFIG_ARM_FFA_SMCCC) +=3D smccc.o
-+ffa-module-objs :=3D $(ffa-bus-y) $(ffa-driver-y) $(ffa-transport-y)
- obj-$(CONFIG_ARM_FFA_TRANSPORT) =3D ffa-module.o
-diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ff=
a/common.h
-index 2d3a32f67d5d..f24754a59f47 100644
---- a/drivers/firmware/arm_ffa/common.h
-+++ b/drivers/firmware/arm_ffa/common.h
-@@ -16,9 +16,13 @@ typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
- int arm_ffa_bus_init(void);
- void arm_ffa_bus_exit(void);
-=20
-+#ifdef CONFIG_ARM_FFA_SMCCC
-+int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
-+#else
- static inline int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
- {
- 	return -EOPNOTSUPP;
- }
-+#endif
-=20
- #endif /* _FFA_COMMON_H */
-diff --git a/drivers/firmware/arm_ffa/smccc.c b/drivers/firmware/arm_ffa=
/smccc.c
-new file mode 100644
-index 000000000000..4d85bfff0a4e
---- /dev/null
-+++ b/drivers/firmware/arm_ffa/smccc.c
-@@ -0,0 +1,39 @@
-+// SPDX-License-Identifier: GPL-2.0-only
-+/*
-+ * Copyright (C) 2021 ARM Ltd.
-+ */
-+
-+#include <linux/printk.h>
-+
-+#include "common.h"
-+
-+static void __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
-+{
-+	arm_smccc_1_2_smc(&args, res);
-+}
-+
-+static void __arm_ffa_fn_hvc(ffa_value_t args, ffa_value_t *res)
-+{
-+	arm_smccc_1_2_hvc(&args, res);
-+}
-+
-+int __init ffa_transport_init(ffa_fn **invoke_ffa_fn)
-+{
-+	enum arm_smccc_conduit conduit;
-+
-+	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
-+		return -EOPNOTSUPP;
-+
-+	conduit =3D arm_smccc_1_1_get_conduit();
-+	if (conduit =3D=3D SMCCC_CONDUIT_NONE) {
-+		pr_err("%s: invalid SMCCC conduit\n", __func__);
-+		return -EOPNOTSUPP;
-+	}
-+
-+	if (conduit =3D=3D SMCCC_CONDUIT_SMC)
-+		*invoke_ffa_fn =3D __arm_ffa_fn_smc;
-+	else
-+		*invoke_ffa_fn =3D __arm_ffa_fn_hvc;
-+
-+	return 0;
-+}
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0016-fi=
rmware-arm_ffa-Setup-in-kernel-users-of-FFA-partitions.patch b/meta-arm-b=
sp/recipes-kernel/linux/files/corstone1000/0016-firmware-arm_ffa-Setup-in=
-kernel-users-of-FFA-partitions.patch
deleted file mode 100644
index 975c62e4..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0016-firmware-=
arm_ffa-Setup-in-kernel-users-of-FFA-partitions.patch
+++ /dev/null
@@ -1,410 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From d0c0bce831223b08e5bade2cefc93c3ddb790796 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 21 May 2021 16:10:32 +0100
-Subject: [PATCH] firmware: arm_ffa: Setup in-kernel users of FFA partiti=
ons
-
-Parse the FFA nodes from the device-tree and register all the partitions
-whose services will be used in the kernel.
-
-In order to also enable in-kernel users of FFA interface, let us add
-simple set of operations for such devices.
-
-The in-kernel users are registered without the character device interfac=
e.
-
-Link: https://lore.kernel.org/r/20210521151033.181846-5-sudeep.holla@arm=
.com
-Tested-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
----
- drivers/firmware/arm_ffa/bus.c    |   9 ++
- drivers/firmware/arm_ffa/common.h |   3 +
- drivers/firmware/arm_ffa/driver.c | 221 ++++++++++++++++++++++++++++++
- include/linux/arm_ffa.h           |  39 +++++-
- 4 files changed, 271 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/b=
us.c
-index ae1eada5dc0c..83166e02b191 100644
---- a/drivers/firmware/arm_ffa/bus.c
-+++ b/drivers/firmware/arm_ffa/bus.c
-@@ -24,6 +24,15 @@ static int ffa_device_match(struct device *dev, struc=
t device_driver *drv)
- 	ffa_dev =3D to_ffa_dev(dev);
-=20
- 	while (!uuid_is_null(&id_table->uuid)) {
-+		/*
-+		 * FF-A v1.0 doesn't provide discovery of UUIDs, just the
-+		 * partition IDs, so fetch the partitions IDs for this
-+		 * id_table UUID and assign the UUID to the device if the
-+		 * partition ID matches
-+		 */
-+		if (uuid_is_null(&ffa_dev->uuid))
-+			ffa_device_match_uuid(ffa_dev, &id_table->uuid);
-+
- 		if (uuid_equal(&ffa_dev->uuid, &id_table->uuid))
- 			return 1;
- 		id_table++;
-diff --git a/drivers/firmware/arm_ffa/common.h b/drivers/firmware/arm_ff=
a/common.h
-index f24754a59f47..d6eccf1fd3f6 100644
---- a/drivers/firmware/arm_ffa/common.h
-+++ b/drivers/firmware/arm_ffa/common.h
-@@ -6,6 +6,7 @@
- #ifndef _FFA_COMMON_H
- #define _FFA_COMMON_H
-=20
-+#include <linux/arm_ffa.h>
- #include <linux/arm-smccc.h>
- #include <linux/err.h>
-=20
-@@ -15,6 +16,8 @@ typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
-=20
- int arm_ffa_bus_init(void);
- void arm_ffa_bus_exit(void);
-+bool ffa_device_is_valid(struct ffa_device *ffa_dev);
-+void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uu=
id);
-=20
- #ifdef CONFIG_ARM_FFA_SMCCC
- int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index 4846f079dca0..85b9bbdbeabe 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -24,9 +24,12 @@
-=20
- #include <linux/arm_ffa.h>
- #include <linux/bitfield.h>
-+#include <linux/device.h>
- #include <linux/io.h>
-+#include <linux/kernel.h>
- #include <linux/module.h>
- #include <linux/slab.h>
-+#include <linux/uuid.h>
-=20
- #include "common.h"
-=20
-@@ -185,6 +188,22 @@ static int ffa_version_check(u32 *version)
- 	return 0;
- }
-=20
-+static int ffa_rx_release(void)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_RX_RELEASE,
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	/* check for ret.a0 =3D=3D FFA_RX_RELEASE ? */
-+
-+	return 0;
-+}
-+
- static int ffa_rxtx_map(phys_addr_t tx_buf, phys_addr_t rx_buf, u32 pg_=
cnt)
- {
- 	ffa_value_t ret;
-@@ -214,6 +233,65 @@ static int ffa_rxtx_unmap(u16 vm_id)
- 	return 0;
- }
-=20
-+/* buffer must be sizeof(struct ffa_partition_info) * num_partitions */
-+static int
-+__ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
-+			 struct ffa_partition_info *buffer, int num_partitions)
-+{
-+	int count;
-+	ffa_value_t partition_info;
-+
-+	mutex_lock(&drv_info->rx_lock);
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_PARTITION_INFO_GET,
-+		      .a1 =3D uuid0, .a2 =3D uuid1, .a3 =3D uuid2, .a4 =3D uuid3,
-+		      }, &partition_info);
-+
-+	if (partition_info.a0 =3D=3D FFA_ERROR) {
-+		mutex_unlock(&drv_info->rx_lock);
-+		return ffa_to_linux_errno((int)partition_info.a2);
-+	}
-+
-+	count =3D partition_info.a2;
-+
-+	if (buffer && count <=3D num_partitions)
-+		memcpy(buffer, drv_info->rx_buffer, sizeof(*buffer) * count);
-+
-+	ffa_rx_release();
-+
-+	mutex_unlock(&drv_info->rx_lock);
-+
-+	return count;
-+}
-+
-+/* buffer is allocated and caller must free the same if returned count =
> 0 */
-+static int
-+ffa_partition_probe(const uuid_t *uuid, struct ffa_partition_info **buf=
fer)
-+{
-+	int count;
-+	u32 uuid0_4[4];
-+	struct ffa_partition_info *pbuf;
-+
-+	export_uuid((u8 *)uuid0_4, uuid);
-+	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
-+					 uuid0_4[3], NULL, 0);
-+	if (count <=3D 0)
-+		return count;
-+
-+	pbuf =3D kcalloc(count, sizeof(*pbuf), GFP_KERNEL);
-+	if (!pbuf)
-+		return -ENOMEM;
-+
-+	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
-+					 uuid0_4[3], pbuf, count);
-+	if (count <=3D 0)
-+		kfree(pbuf);
-+	else
-+		*buffer =3D pbuf;
-+
-+	return count;
-+}
-+
- #define VM_ID_MASK	GENMASK(15, 0)
- static int ffa_id_get(u16 *vm_id)
- {
-@@ -231,6 +309,147 @@ static int ffa_id_get(u16 *vm_id)
- 	return 0;
- }
-=20
-+static int ffa_msg_send_direct_req(u16 src_id, u16 dst_id, bool mode_32=
bit,
-+				   struct ffa_send_direct_data *data)
-+{
-+	u32 req_id, resp_id, src_dst_ids =3D PACK_TARGET_INFO(src_id, dst_id);
-+	ffa_value_t ret;
-+
-+	if (mode_32bit) {
-+		req_id =3D FFA_MSG_SEND_DIRECT_REQ;
-+		resp_id =3D FFA_MSG_SEND_DIRECT_RESP;
-+	} else {
-+		req_id =3D FFA_FN_NATIVE(MSG_SEND_DIRECT_REQ);
-+		resp_id =3D FFA_FN_NATIVE(MSG_SEND_DIRECT_RESP);
-+	}
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D req_id, .a1 =3D src_dst_ids, .a2 =3D 0,
-+		      .a3 =3D data->data0, .a4 =3D data->data1, .a5 =3D data->data2,
-+		      .a6 =3D data->data3, .a7 =3D data->data4,
-+		      }, &ret);
-+
-+	while (ret.a0 =3D=3D FFA_INTERRUPT)
-+		invoke_ffa_fn((ffa_value_t){
-+			      .a0 =3D FFA_RUN, .a1 =3D ret.a1,
-+			      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	if (ret.a0 =3D=3D resp_id) {
-+		data->data0 =3D ret.a3;
-+		data->data1 =3D ret.a4;
-+		data->data2 =3D ret.a5;
-+		data->data3 =3D ret.a6;
-+		data->data4 =3D ret.a7;
-+		return 0;
-+	}
-+
-+	return -EINVAL;
-+}
-+
-+static u32 ffa_api_version_get(void)
-+{
-+	return drv_info->version;
-+}
-+
-+static int ffa_partition_info_get(const char *uuid_str,
-+				  struct ffa_partition_info *buffer)
-+{
-+	int count;
-+	uuid_t uuid;
-+	struct ffa_partition_info *pbuf;
-+
-+	if (uuid_parse(uuid_str, &uuid)) {
-+		pr_err("invalid uuid (%s)\n", uuid_str);
-+		return -ENODEV;
-+	}
-+
-+	count =3D ffa_partition_probe(&uuid_null, &pbuf);
-+	if (count <=3D 0)
-+		return -ENOENT;
-+
-+	memcpy(buffer, pbuf, sizeof(*pbuf) * count);
-+	kfree(pbuf);
-+	return 0;
-+}
-+
-+static void ffa_mode_32bit_set(struct ffa_device *dev)
-+{
-+	dev->mode_32bit =3D true;
-+}
-+
-+static int ffa_sync_send_receive(struct ffa_device *dev,
-+				 struct ffa_send_direct_data *data)
-+{
-+	return ffa_msg_send_direct_req(drv_info->vm_id, dev->vm_id,
-+				       dev->mode_32bit, data);
-+}
-+
-+static const struct ffa_dev_ops ffa_ops =3D {
-+	.api_version_get =3D ffa_api_version_get,
-+	.partition_info_get =3D ffa_partition_info_get,
-+	.mode_32bit_set =3D ffa_mode_32bit_set,
-+	.sync_send_receive =3D ffa_sync_send_receive,
-+};
-+
-+const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
-+{
-+	if (ffa_device_is_valid(dev))
-+		return &ffa_ops;
-+
-+	return NULL;
-+}
-+EXPORT_SYMBOL_GPL(ffa_dev_ops_get);
-+
-+void ffa_device_match_uuid(struct ffa_device *ffa_dev, const uuid_t *uu=
id)
-+{
-+	int count, idx;
-+	struct ffa_partition_info *pbuf, *tpbuf;
-+
-+	count =3D ffa_partition_probe(uuid, &pbuf);
-+	if (count <=3D 0)
-+		return;
-+
-+	for (idx =3D 0, tpbuf =3D pbuf; idx < count; idx++, tpbuf++)
-+		if (tpbuf->id =3D=3D ffa_dev->vm_id)
-+			uuid_copy(&ffa_dev->uuid, uuid);
-+	kfree(pbuf);
-+}
-+
-+static void ffa_setup_partitions(void)
-+{
-+	int count, idx;
-+	struct ffa_device *ffa_dev;
-+	struct ffa_partition_info *pbuf, *tpbuf;
-+
-+	count =3D ffa_partition_probe(&uuid_null, &pbuf);
-+	if (count <=3D 0) {
-+		pr_info("%s: No partitions found, error %d\n", __func__, count);
-+		return;
-+	}
-+
-+	for (idx =3D 0, tpbuf =3D pbuf; idx < count; idx++, tpbuf++) {
-+		/* Note that the &uuid_null parameter will require
-+		 * ffa_device_match() to find the UUID of this partition id
-+		 * with help of ffa_device_match_uuid(). Once the FF-A spec
-+		 * is updated to provide correct UUID here for each partition
-+		 * as part of the discovery API, we need to pass the
-+		 * discovered UUID here instead.
-+		 */
-+		ffa_dev =3D ffa_device_register(&uuid_null, tpbuf->id);
-+		if (!ffa_dev) {
-+			pr_err("%s: failed to register partition ID 0x%x\n",
-+			       __func__, tpbuf->id);
-+			continue;
-+		}
-+
-+		ffa_dev_set_drvdata(ffa_dev, drv_info);
-+	}
-+	kfree(pbuf);
-+}
-+
- static int __init ffa_init(void)
- {
- 	int ret;
-@@ -282,6 +501,8 @@ static int __init ffa_init(void)
- 	mutex_init(&drv_info->rx_lock);
- 	mutex_init(&drv_info->tx_lock);
-=20
-+	ffa_setup_partitions();
-+
- 	return 0;
- free_pages:
- 	if (drv_info->tx_buffer)
-diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
-index 331ff62c9873..d672673fc621 100644
---- a/include/linux/arm_ffa.h
-+++ b/include/linux/arm_ffa.h
-@@ -6,7 +6,6 @@
- #ifndef _LINUX_ARM_FFA_H
- #define _LINUX_ARM_FFA_H
-=20
--#include <linux/cdev.h>
- #include <linux/device.h>
- #include <linux/module.h>
- #include <linux/types.h>
-@@ -15,6 +14,7 @@
- /* FFA Bus/Device/Driver related */
- struct ffa_device {
- 	int vm_id;
-+	bool mode_32bit;
- 	uuid_t uuid;
- 	struct device dev;
- };
-@@ -48,6 +48,7 @@ int ffa_driver_register(struct ffa_driver *driver, str=
uct module *owner,
- 			const char *mod_name);
- void ffa_driver_unregister(struct ffa_driver *driver);
- bool ffa_device_is_valid(struct ffa_device *ffa_dev);
-+const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev);
-=20
- #else
- static inline
-@@ -70,6 +71,11 @@ static inline void ffa_driver_unregister(struct ffa_d=
river *driver) {}
- static inline
- bool ffa_device_is_valid(struct ffa_device *ffa_dev) { return false; }
-=20
-+static inline
-+const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
-+{
-+	return NULL;
-+}
- #endif /* CONFIG_ARM_FFA_TRANSPORT */
-=20
- #define ffa_register(driver) \
-@@ -88,4 +94,35 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev) =
{ return false; }
- #define module_ffa_driver(__ffa_driver)	\
- 	module_driver(__ffa_driver, ffa_register, ffa_unregister)
-=20
-+/* FFA transport related */
-+struct ffa_partition_info {
-+	u16 id;
-+	u16 exec_ctxt;
-+/* partition supports receipt of direct requests */
-+#define FFA_PARTITION_DIRECT_RECV	BIT(0)
-+/* partition can send direct requests. */
-+#define FFA_PARTITION_DIRECT_SEND	BIT(1)
-+/* partition can send and receive indirect messages. */
-+#define FFA_PARTITION_INDIRECT_MSG	BIT(2)
-+	u32 properties;
-+};
-+
-+/* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via regi=
sters */
-+struct ffa_send_direct_data {
-+	unsigned long data0; /* w3/x3 */
-+	unsigned long data1; /* w4/x4 */
-+	unsigned long data2; /* w5/x5 */
-+	unsigned long data3; /* w6/x6 */
-+	unsigned long data4; /* w7/x7 */
-+};
-+
-+struct ffa_dev_ops {
-+	u32 (*api_version_get)(void);
-+	int (*partition_info_get)(const char *uuid_str,
-+				  struct ffa_partition_info *buffer);
-+	void (*mode_32bit_set)(struct ffa_device *dev);
-+	int (*sync_send_receive)(struct ffa_device *dev,
-+				 struct ffa_send_direct_data *data);
-+};
-+
- #endif /* _LINUX_ARM_FFA_H */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0017-fi=
rmware-arm_ffa-Add-support-for-MEM_-interfaces.patch b/meta-arm-bsp/recip=
es-kernel/linux/files/corstone1000/0017-firmware-arm_ffa-Add-support-for-=
MEM_-interfaces.patch
deleted file mode 100644
index d1a3e938..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0017-firmware-=
arm_ffa-Add-support-for-MEM_-interfaces.patch
+++ /dev/null
@@ -1,409 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From cc2195fe536c28e192df5d07e6dd277af36814b4 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 21 May 2021 16:10:33 +0100
-Subject: [PATCH] firmware: arm_ffa: Add support for MEM_* interfaces
-
-Most of the MEM_* APIs share the same parameters, so they can be
-generalised. Currently only MEM_SHARE is implemented and the user space
-interface for that is not added yet.
-
-Link: https://lore.kernel.org/r/20210521151033.181846-6-sudeep.holla@arm=
.com
-Tested-by: Jens Wiklander <jens.wiklander@linaro.org>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
----
- drivers/firmware/arm_ffa/driver.c | 199 ++++++++++++++++++++++++++++++
- include/linux/arm_ffa.h           | 139 +++++++++++++++++++++
- 2 files changed, 338 insertions(+)
-
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index 85b9bbdbeabe..b1edb4b2e94a 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -28,6 +28,8 @@
- #include <linux/io.h>
- #include <linux/kernel.h>
- #include <linux/module.h>
-+#include <linux/mm.h>
-+#include <linux/scatterlist.h>
- #include <linux/slab.h>
- #include <linux/uuid.h>
-=20
-@@ -349,6 +351,192 @@ static int ffa_msg_send_direct_req(u16 src_id, u16=
 dst_id, bool mode_32bit,
- 	return -EINVAL;
- }
-=20
-+static int ffa_mem_first_frag(u32 func_id, phys_addr_t buf, u32 buf_sz,
-+			      u32 frag_len, u32 len, u64 *handle)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D func_id, .a1 =3D len, .a2 =3D frag_len,
-+		      .a3 =3D buf, .a4 =3D buf_sz,
-+		      }, &ret);
-+
-+	while (ret.a0 =3D=3D FFA_MEM_OP_PAUSE)
-+		invoke_ffa_fn((ffa_value_t){
-+			      .a0 =3D FFA_MEM_OP_RESUME,
-+			      .a1 =3D ret.a1, .a2 =3D ret.a2,
-+			      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	if (ret.a0 !=3D FFA_SUCCESS)
-+		return -EOPNOTSUPP;
-+
-+	if (handle)
-+		*handle =3D PACK_HANDLE(ret.a2, ret.a3);
-+
-+	return frag_len;
-+}
-+
-+static int ffa_mem_next_frag(u64 handle, u32 frag_len)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_MEM_FRAG_TX,
-+		      .a1 =3D HANDLE_LOW(handle), .a2 =3D HANDLE_HIGH(handle),
-+		      .a3 =3D frag_len,
-+		      }, &ret);
-+
-+	while (ret.a0 =3D=3D FFA_MEM_OP_PAUSE)
-+		invoke_ffa_fn((ffa_value_t){
-+			      .a0 =3D FFA_MEM_OP_RESUME,
-+			      .a1 =3D ret.a1, .a2 =3D ret.a2,
-+			      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	if (ret.a0 !=3D FFA_MEM_FRAG_RX)
-+		return -EOPNOTSUPP;
-+
-+	return ret.a3;
-+}
-+
-+static int
-+ffa_transmit_fragment(u32 func_id, phys_addr_t buf, u32 buf_sz, u32 fra=
g_len,
-+		      u32 len, u64 *handle, bool first)
-+{
-+	if (!first)
-+		return ffa_mem_next_frag(*handle, frag_len);
-+
-+	return ffa_mem_first_frag(func_id, buf, buf_sz, frag_len, len, handle)=
;
-+}
-+
-+static u32 ffa_get_num_pages_sg(struct scatterlist *sg)
-+{
-+	u32 num_pages =3D 0;
-+
-+	do {
-+		num_pages +=3D sg->length / FFA_PAGE_SIZE;
-+	} while ((sg =3D sg_next(sg)));
-+
-+	return num_pages;
-+}
-+
-+static int
-+ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
-+		       struct ffa_mem_ops_args *args)
-+{
-+	int rc =3D 0;
-+	bool first =3D true;
-+	phys_addr_t addr =3D 0;
-+	struct ffa_composite_mem_region *composite;
-+	struct ffa_mem_region_addr_range *constituents;
-+	struct ffa_mem_region_attributes *ep_mem_access;
-+	struct ffa_mem_region *mem_region =3D buffer;
-+	u32 idx, frag_len, length, buf_sz =3D 0, num_entries =3D sg_nents(args=
->sg);
-+
-+	mem_region->tag =3D args->tag;
-+	mem_region->flags =3D args->flags;
-+	mem_region->sender_id =3D drv_info->vm_id;
-+	mem_region->attributes =3D FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK |
-+				 FFA_MEM_INNER_SHAREABLE;
-+	ep_mem_access =3D &mem_region->ep_mem_access[0];
-+
-+	for (idx =3D 0; idx < args->nattrs; idx++, ep_mem_access++) {
-+		ep_mem_access->receiver =3D args->attrs[idx].receiver;
-+		ep_mem_access->attrs =3D args->attrs[idx].attrs;
-+		ep_mem_access->composite_off =3D COMPOSITE_OFFSET(args->nattrs);
-+	}
-+	mem_region->ep_count =3D args->nattrs;
-+
-+	composite =3D buffer + COMPOSITE_OFFSET(args->nattrs);
-+	composite->total_pg_cnt =3D ffa_get_num_pages_sg(args->sg);
-+	composite->addr_range_cnt =3D num_entries;
-+
-+	length =3D COMPOSITE_CONSTITUENTS_OFFSET(args->nattrs, num_entries);
-+	frag_len =3D COMPOSITE_CONSTITUENTS_OFFSET(args->nattrs, 0);
-+	if (frag_len > max_fragsize)
-+		return -ENXIO;
-+
-+	if (!args->use_txbuf) {
-+		addr =3D virt_to_phys(buffer);
-+		buf_sz =3D max_fragsize / FFA_PAGE_SIZE;
-+	}
-+
-+	constituents =3D buffer + frag_len;
-+	idx =3D 0;
-+	do {
-+		if (frag_len =3D=3D max_fragsize) {
-+			rc =3D ffa_transmit_fragment(func_id, addr, buf_sz,
-+						   frag_len, length,
-+						   &args->g_handle, first);
-+			if (rc < 0)
-+				return -ENXIO;
-+
-+			first =3D false;
-+			idx =3D 0;
-+			frag_len =3D 0;
-+			constituents =3D buffer;
-+		}
-+
-+		if ((void *)constituents - buffer > max_fragsize) {
-+			pr_err("Memory Region Fragment > Tx Buffer size\n");
-+			return -EFAULT;
-+		}
-+
-+		constituents->address =3D sg_phys(args->sg);
-+		constituents->pg_cnt =3D args->sg->length / FFA_PAGE_SIZE;
-+		constituents++;
-+		frag_len +=3D sizeof(struct ffa_mem_region_addr_range);
-+	} while ((args->sg =3D sg_next(args->sg)));
-+
-+	return ffa_transmit_fragment(func_id, addr, buf_sz, frag_len,
-+				     length, &args->g_handle, first);
-+}
-+
-+static int ffa_memory_ops(u32 func_id, struct ffa_mem_ops_args *args)
-+{
-+	int ret;
-+	void *buffer;
-+
-+	if (!args->use_txbuf) {
-+		buffer =3D alloc_pages_exact(RXTX_BUFFER_SIZE, GFP_KERNEL);
-+		if (!buffer)
-+			return -ENOMEM;
-+	} else {
-+		buffer =3D drv_info->tx_buffer;
-+		mutex_lock(&drv_info->tx_lock);
-+	}
-+
-+	ret =3D ffa_setup_and_transmit(func_id, buffer, RXTX_BUFFER_SIZE, args=
);
-+
-+	if (args->use_txbuf)
-+		mutex_unlock(&drv_info->tx_lock);
-+	else
-+		free_pages_exact(buffer, RXTX_BUFFER_SIZE);
-+
-+	return ret < 0 ? ret : 0;
-+}
-+
-+static int ffa_memory_reclaim(u64 g_handle, u32 flags)
-+{
-+	ffa_value_t ret;
-+
-+	invoke_ffa_fn((ffa_value_t){
-+		      .a0 =3D FFA_MEM_RECLAIM,
-+		      .a1 =3D HANDLE_LOW(g_handle), .a2 =3D HANDLE_HIGH(g_handle),
-+		      .a3 =3D flags,
-+		      }, &ret);
-+
-+	if (ret.a0 =3D=3D FFA_ERROR)
-+		return ffa_to_linux_errno((int)ret.a2);
-+
-+	return 0;
-+}
-+
- static u32 ffa_api_version_get(void)
- {
- 	return drv_info->version;
-@@ -387,11 +575,22 @@ static int ffa_sync_send_receive(struct ffa_device=
 *dev,
- 				       dev->mode_32bit, data);
- }
-=20
-+static int
-+ffa_memory_share(struct ffa_device *dev, struct ffa_mem_ops_args *args)
-+{
-+	if (dev->mode_32bit)
-+		return ffa_memory_ops(FFA_MEM_SHARE, args);
-+
-+	return ffa_memory_ops(FFA_FN_NATIVE(MEM_SHARE), args);
-+}
-+
- static const struct ffa_dev_ops ffa_ops =3D {
- 	.api_version_get =3D ffa_api_version_get,
- 	.partition_info_get =3D ffa_partition_info_get,
- 	.mode_32bit_set =3D ffa_mode_32bit_set,
- 	.sync_send_receive =3D ffa_sync_send_receive,
-+	.memory_reclaim =3D ffa_memory_reclaim,
-+	.memory_share =3D ffa_memory_share,
- };
-=20
- const struct ffa_dev_ops *ffa_dev_ops_get(struct ffa_device *dev)
-diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
-index d672673fc621..505c679b6a9b 100644
---- a/include/linux/arm_ffa.h
-+++ b/include/linux/arm_ffa.h
-@@ -116,6 +116,142 @@ struct ffa_send_direct_data {
- 	unsigned long data4; /* w7/x7 */
- };
-=20
-+struct ffa_mem_region_addr_range {
-+	/* The base IPA of the constituent memory region, aligned to 4 kiB */
-+	u64 address;
-+	/* The number of 4 kiB pages in the constituent memory region. */
-+	u32 pg_cnt;
-+	u32 reserved;
-+};
-+
-+struct ffa_composite_mem_region {
-+	/*
-+	 * The total number of 4 kiB pages included in this memory region. Thi=
s
-+	 * must be equal to the sum of page counts specified in each
-+	 * `struct ffa_mem_region_addr_range`.
-+	 */
-+	u32 total_pg_cnt;
-+	/* The number of constituents included in this memory region range */
-+	u32 addr_range_cnt;
-+	u64 reserved;
-+	/** An array of `addr_range_cnt` memory region constituents. */
-+	struct ffa_mem_region_addr_range constituents[];
-+};
-+
-+struct ffa_mem_region_attributes {
-+	/* The ID of the VM to which the memory is being given or shared. */
-+	u16 receiver;
-+	/*
-+	 * The permissions with which the memory region should be mapped in th=
e
-+	 * receiver's page table.
-+	 */
-+#define FFA_MEM_EXEC		BIT(3)
-+#define FFA_MEM_NO_EXEC		BIT(2)
-+#define FFA_MEM_RW		BIT(1)
-+#define FFA_MEM_RO		BIT(0)
-+	u8 attrs;
-+	/*
-+	 * Flags used during FFA_MEM_RETRIEVE_REQ and FFA_MEM_RETRIEVE_RESP
-+	 * for memory regions with multiple borrowers.
-+	 */
-+#define FFA_MEM_RETRIEVE_SELF_BORROWER	BIT(0)
-+	u8 flag;
-+	u32 composite_off;
-+	/*
-+	 * Offset in bytes from the start of the outer `ffa_memory_region` to
-+	 * an `struct ffa_mem_region_addr_range`.
-+	 */
-+	u64 reserved;
-+};
-+
-+struct ffa_mem_region {
-+	/* The ID of the VM/owner which originally sent the memory region */
-+	u16 sender_id;
-+#define FFA_MEM_NORMAL		BIT(5)
-+#define FFA_MEM_DEVICE		BIT(4)
-+
-+#define FFA_MEM_WRITE_BACK	(3 << 2)
-+#define FFA_MEM_NON_CACHEABLE	(1 << 2)
-+
-+#define FFA_DEV_nGnRnE		(0 << 2)
-+#define FFA_DEV_nGnRE		(1 << 2)
-+#define FFA_DEV_nGRE		(2 << 2)
-+#define FFA_DEV_GRE		(3 << 2)
-+
-+#define FFA_MEM_NON_SHAREABLE	(0)
-+#define FFA_MEM_OUTER_SHAREABLE	(2)
-+#define FFA_MEM_INNER_SHAREABLE	(3)
-+	u8 attributes;
-+	u8 reserved_0;
-+/*
-+ * Clear memory region contents after unmapping it from the sender and
-+ * before mapping it for any receiver.
-+ */
-+#define FFA_MEM_CLEAR			BIT(0)
-+/*
-+ * Whether the hypervisor may time slice the memory sharing or retrieva=
l
-+ * operation.
-+ */
-+#define FFA_TIME_SLICE_ENABLE		BIT(1)
-+
-+#define FFA_MEM_RETRIEVE_TYPE_IN_RESP	(0 << 3)
-+#define FFA_MEM_RETRIEVE_TYPE_SHARE	(1 << 3)
-+#define FFA_MEM_RETRIEVE_TYPE_LEND	(2 << 3)
-+#define FFA_MEM_RETRIEVE_TYPE_DONATE	(3 << 3)
-+
-+#define FFA_MEM_RETRIEVE_ADDR_ALIGN_HINT	BIT(9)
-+#define FFA_MEM_RETRIEVE_ADDR_ALIGN(x)		((x) << 5)
-+	/* Flags to control behaviour of the transaction. */
-+	u32 flags;
-+#define HANDLE_LOW_MASK		GENMASK_ULL(31, 0)
-+#define HANDLE_HIGH_MASK	GENMASK_ULL(63, 32)
-+#define HANDLE_LOW(x)		((u32)(FIELD_GET(HANDLE_LOW_MASK, (x))))
-+#define	HANDLE_HIGH(x)		((u32)(FIELD_GET(HANDLE_HIGH_MASK, (x))))
-+
-+#define PACK_HANDLE(l, h)		\
-+	(FIELD_PREP(HANDLE_LOW_MASK, (l)) | FIELD_PREP(HANDLE_HIGH_MASK, (h)))
-+	/*
-+	 * A globally-unique ID assigned by the hypervisor for a region
-+	 * of memory being sent between VMs.
-+	 */
-+	u64 handle;
-+	/*
-+	 * An implementation defined value associated with the receiver and th=
e
-+	 * memory region.
-+	 */
-+	u64 tag;
-+	u32 reserved_1;
-+	/*
-+	 * The number of `ffa_mem_region_attributes` entries included in this
-+	 * transaction.
-+	 */
-+	u32 ep_count;
-+	/*
-+	 * An array of endpoint memory access descriptors.
-+	 * Each one specifies a memory region offset, an endpoint and the
-+	 * attributes with which this memory region should be mapped in that
-+	 * endpoint's page table.
-+	 */
-+	struct ffa_mem_region_attributes ep_mem_access[];
-+};
-+
-+#define	COMPOSITE_OFFSET(x)	\
-+	(offsetof(struct ffa_mem_region, ep_mem_access[x]))
-+#define CONSTITUENTS_OFFSET(x)	\
-+	(offsetof(struct ffa_composite_mem_region, constituents[x]))
-+#define COMPOSITE_CONSTITUENTS_OFFSET(x, y)	\
-+	(COMPOSITE_OFFSET(x) + CONSTITUENTS_OFFSET(y))
-+
-+struct ffa_mem_ops_args {
-+	bool use_txbuf;
-+	u32 nattrs;
-+	u32 flags;
-+	u64 tag;
-+	u64 g_handle;
-+	struct scatterlist *sg;
-+	struct ffa_mem_region_attributes *attrs;
-+};
-+
- struct ffa_dev_ops {
- 	u32 (*api_version_get)(void);
- 	int (*partition_info_get)(const char *uuid_str,
-@@ -123,6 +259,9 @@ struct ffa_dev_ops {
- 	void (*mode_32bit_set)(struct ffa_device *dev);
- 	int (*sync_send_receive)(struct ffa_device *dev,
- 				 struct ffa_send_direct_data *data);
-+	int (*memory_reclaim)(u64 g_handle, u32 flags);
-+	int (*memory_share)(struct ffa_device *dev,
-+			    struct ffa_mem_ops_args *args);
- };
-=20
- #endif /* _LINUX_ARM_FFA_H */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0018-fi=
rmware-arm_ffa-Ensure-drivers-provide-a-probe-function.patch b/meta-arm-b=
sp/recipes-kernel/linux/files/corstone1000/0018-firmware-arm_ffa-Ensure-d=
rivers-provide-a-probe-function.patch
deleted file mode 100644
index 3ecd28a3..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0018-firmware-=
arm_ffa-Ensure-drivers-provide-a-probe-function.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 92743071464fca5acbbe812d9a0d88de3eaaad36 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Uwe=3D20Kleine-K=3DC3=3DB6nig?=3D <u.kleine-koenig@pen=
gutronix.de>
-Date: Mon, 21 Jun 2021 22:16:51 +0200
-Subject: [PATCH] firmware: arm_ffa: Ensure drivers provide a probe funct=
ion
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-The bus probe callback calls the driver callback without further
-checking. Better be safe than sorry and refuse registration of a driver
-without a probe function to prevent a NULL pointer exception.
-
-Link: https://lore.kernel.org/r/20210621201652.127611-1-u.kleine-koenig@=
pengutronix.de
-Fixes: e781858488b9 ("firmware: arm_ffa: Add initial FFA bus support for=
 device enumeration")
-Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
----
- drivers/firmware/arm_ffa/bus.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/b=
us.c
-index 83166e02b191..d2cc24319626 100644
---- a/drivers/firmware/arm_ffa/bus.c
-+++ b/drivers/firmware/arm_ffa/bus.c
-@@ -99,6 +99,9 @@ int ffa_driver_register(struct ffa_driver *driver, str=
uct module *owner,
- {
- 	int ret;
-=20
-+	if (!driver->probe)
-+		return -EINVAL;
-+
- 	driver->driver.bus =3D &ffa_bus_type;
- 	driver->driver.name =3D driver->name;
- 	driver->driver.owner =3D owner;
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0019-fi=
rmware-arm_ffa-Simplify-probe-function.patch b/meta-arm-bsp/recipes-kerne=
l/linux/files/corstone1000/0019-firmware-arm_ffa-Simplify-probe-function.=
patch
deleted file mode 100644
index 13035d80..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0019-firmware-=
arm_ffa-Simplify-probe-function.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From e362547addc39e4bb18ad5bdfd59ce4d512d0c08 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Uwe=3D20Kleine-K=3DC3=3DB6nig?=3D <u.kleine-koenig@pen=
gutronix.de>
-Date: Mon, 21 Jun 2021 22:16:52 +0200
-Subject: [PATCH] firmware: arm_ffa: Simplify probe function
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-When the driver core calls the probe callback it already checked that
-the devices match, so there is no need to call the match callback again.
-
-Link: https://lore.kernel.org/r/20210621201652.127611-2-u.kleine-koenig@=
pengutronix.de
-Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
----
- drivers/firmware/arm_ffa/bus.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/b=
us.c
-index d2cc24319626..00fe595a5bc8 100644
---- a/drivers/firmware/arm_ffa/bus.c
-+++ b/drivers/firmware/arm_ffa/bus.c
-@@ -46,9 +46,6 @@ static int ffa_device_probe(struct device *dev)
- 	struct ffa_driver *ffa_drv =3D to_ffa_driver(dev->driver);
- 	struct ffa_device *ffa_dev =3D to_ffa_dev(dev);
-=20
--	if (!ffa_device_match(dev, dev->driver))
--		return -ENODEV;
--
- 	return ffa_drv->probe(ffa_dev);
- }
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0020-fi=
rmware-arm_ffa-Fix-the-comment-style.patch b/meta-arm-bsp/recipes-kernel/=
linux/files/corstone1000/0020-firmware-arm_ffa-Fix-the-comment-style.patc=
h
deleted file mode 100644
index 0850c1c5..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0020-firmware-=
arm_ffa-Fix-the-comment-style.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From ba684a31d3626c86cd9097e12d6ed57d224d077d Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Tue, 22 Jun 2021 17:22:02 +0100
-Subject: [PATCH] firmware: arm_ffa: Fix the comment style
-
-clang produces the following warning:
-
-    drivers/firmware/arm_ffa/driver.c:123: warning: expecting
-    prototype for FF(). Prototype was for FFA_PAGE_SIZE() instead
-
-    This comment starts with '/**', but isn't a kernel-doc comment.
-    Refer Documentation/doc-guide/kernel-doc.rst
-
-Fix the same by removing the kernel-doc style comment here.
-
-Link: https://lore.kernel.org/r/20210622162202.3485866-1-sudeep.holla@ar=
m.com
-Reported-by: kernel test robot <lkp@intel.com>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
----
- drivers/firmware/arm_ffa/driver.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index b1edb4b2e94a..88b822575ac4 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -120,7 +120,7 @@
- #define PACK_TARGET_INFO(s, r)		\
- 	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
-=20
--/**
-+/*
-  * FF-A specification mentions explicitly about '4K pages'. This should
-  * not be confused with the kernel PAGE_SIZE, which is the translation
-  * granule kernel is configured and may be one among 4K, 16K and 64K.
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0021-fi=
rmware-arm_ffa-Fix-a-possible-ffa_linux_errmap-buffer-overflow.patch b/me=
ta-arm-bsp/recipes-kernel/linux/files/corstone1000/0021-firmware-arm_ffa-=
Fix-a-possible-ffa_linux_errmap-buffer-overflow.patch
deleted file mode 100644
index 5575952a..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0021-firmware-=
arm_ffa-Fix-a-possible-ffa_linux_errmap-buffer-overflow.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From dd925db6f07556061c11ab1fbfa4a0145ae6b438 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Wed, 7 Jul 2021 14:47:39 +0100
-Subject: [PATCH] firmware: arm_ffa: Fix a possible ffa_linux_errmap buff=
er
- overflow
-
-The ffa_linux_errmap buffer access index is supposed to range from 0-8
-but it ranges from 1-9 instead. It reads one element out of bounds. It
-also changes the success into -EINVAL though ffa_to_linux_errno is never
-used in case of success, it is expected to work for success case too.
-
-It is slightly confusing code as the negative of the error code
-is used as index to the buffer. Fix it by negating it at the start and
-make it more readable.
-
-Link: https://lore.kernel.org/r/20210707134739.1869481-1-sudeep.holla@ar=
m.com
-Reported-by: kernel test robot <lkp@intel.com>
-Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
----
- drivers/firmware/arm_ffa/driver.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index 88b822575ac4..c9fb56afbcb4 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -149,8 +149,10 @@ static const int ffa_linux_errmap[] =3D {
-=20
- static inline int ffa_to_linux_errno(int errno)
- {
--	if (errno < FFA_RET_SUCCESS && errno >=3D -ARRAY_SIZE(ffa_linux_errmap=
))
--		return ffa_linux_errmap[-errno];
-+	int err_idx =3D -errno;
-+
-+	if (err_idx >=3D 0 && err_idx < ARRAY_SIZE(ffa_linux_errmap))
-+		return ffa_linux_errmap[err_idx];
- 	return -EINVAL;
- }
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0022-us=
b-isp1760-isp1760-udc-Provide-missing-description-.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/files/corstone1000/0022-usb-isp1760-isp1760-udc-Provi=
de-missing-description-.patch
deleted file mode 100644
index 7e855956..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0022-usb-isp17=
60-isp1760-udc-Provide-missing-description-.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.15]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 8268acfe1cc967dbe9fbb05b5f07a19675a81cff Mon Sep 17 00:00:00 2001
-From: Lee Jones <lee.jones@linaro.org>
-Date: Wed, 26 May 2021 14:00:19 +0100
-Subject: [PATCH 09/23] usb: isp1760: isp1760-udc: Provide missing descri=
ption
- for 'udc' param
-
-Fixes the following W=3D1 kernel build warning(s):
-
- drivers/usb/isp1760/isp1760-udc.c:150: warning: Function parameter or m=
ember 'udc' not described in 'isp1760_udc_select_ep'
-
-Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-Cc: Rui Miguel Silva <rui.silva@linaro.org>
-Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-Cc: linux-usb@vger.kernel.org
-Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>
-Signed-off-by: Lee Jones <lee.jones@linaro.org>
-Link: https://lore.kernel.org/r/20210526130037.856068-7-lee.jones@linaro=
.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/usb/isp1760/isp1760-udc.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp=
1760-udc.c
-index 3e05e3605435..a78da59d6417 100644
---- a/drivers/usb/isp1760/isp1760-udc.c
-+++ b/drivers/usb/isp1760/isp1760-udc.c
-@@ -137,6 +137,7 @@ static void __isp1760_udc_select_ep(struct isp1760_u=
dc *udc,
- /**
-  * isp1760_udc_select_ep - Select an endpoint for register access
-  * @ep: The endpoint
-+ * @udc: Reference to the device controller
-  *
-  * The ISP1761 endpoint registers are banked. This function selects the=
 target
-  * endpoint for banked register access. The selection remains valid unt=
il the
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0023-us=
b-isp1760-Fix-meaningless-check-in-isp1763_run.patch b/meta-arm-bsp/recip=
es-kernel/linux/files/corstone1000/0023-usb-isp1760-Fix-meaningless-check=
-in-isp1763_run.patch
deleted file mode 100644
index a194d7b7..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0023-usb-isp17=
60-Fix-meaningless-check-in-isp1763_run.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.15]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 5f4dee73a4bc25a7781a5406b49439bc640981c2 Mon Sep 17 00:00:00 2001
-From: Tong Tiangen <tongtiangen@huawei.com>
-Date: Fri, 11 Jun 2021 09:40:55 +0800
-Subject: [PATCH 10/23] usb: isp1760: Fix meaningless check in isp1763_ru=
n()
-
-Remove attribution to retval before check, which make it completely
-meaningless, and does't check what it was supposed: the return
-value of the timed function to set up configuration flag.
-
-Fixes: 60d789f3bfbb ("usb: isp1760: add support for isp1763")
-Tested-by: Rui Miguel Silva <rui.silva@linaro.org>
-Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>
-Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
-Link: https://lore.kernel.org/r/20210611014055.68551-1-tongtiangen@huawe=
i.com
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 016a54ea76f4..27168b4a4ef2 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -1648,7 +1648,6 @@ static int isp1763_run(struct usb_hcd *hcd)
- 	down_write(&ehci_cf_port_reset_rwsem);
- 	retval =3D isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
- 	up_write(&ehci_cf_port_reset_rwsem);
--	retval =3D 0;
- 	if (retval)
- 		return retval;
-=20
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0024-us=
b-isp1760-remove-debug-message-as-error.patch b/meta-arm-bsp/recipes-kern=
el/linux/files/corstone1000/0024-usb-isp1760-remove-debug-message-as-erro=
r.patch
deleted file mode 100644
index 10ccfd7a..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0024-usb-isp17=
60-remove-debug-message-as-error.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.15]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 7de14c88272c05d86fce83a5cead36832ce3a424 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 27 Jul 2021 11:05:14 +0100
-Subject: [PATCH 11/23] usb: isp1760: remove debug message as error
-
-Remove debug message leftover from the boot error buffer.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210727100516.4190681-2-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 27168b4a4ef2..a745c4c2b773 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -733,7 +733,6 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
-=20
- 	/* Change bus pattern */
- 	scratch =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
--	dev_err(hcd->self.controller, "Scratch test 0x%08x\n", scratch);
- 	scratch =3D isp1760_hcd_read(hcd, HC_SCRATCH);
- 	if (scratch !=3D pattern) {
- 		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n", scratc=
h);
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0025-us=
b-isp1760-do-not-sleep-in-field-register-poll.patch b/meta-arm-bsp/recipe=
s-kernel/linux/files/corstone1000/0025-usb-isp1760-do-not-sleep-in-field-=
register-poll.patch
deleted file mode 100644
index ab6627e3..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0025-usb-isp17=
60-do-not-sleep-in-field-register-poll.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 41f673183862a183d4ea0522c045fabfbd1b28c8 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 27 Jul 2021 11:05:15 +0100
-Subject: [PATCH 12/23] usb: isp1760: do not sleep in field register poll
-
-When polling for a setup or clear of a register field we were sleeping
-in atomic context but using a very tight sleep interval.
-
-Since the use cases for this poll mechanism are only in setup and
-stop paths, and in practice this poll is not used most of the times
-but needs to be there to comply to hardware setup times, remove the
-sleep time and make the poll loop tighter.
-
-Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210727100516.4190681-3-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index a745c4c2b773..a018394d54f8 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -250,7 +250,7 @@ static int isp1760_hcd_set_and_wait(struct usb_hcd *=
hcd, u32 field,
- 	isp1760_hcd_set(hcd, field);
-=20
- 	return regmap_field_read_poll_timeout(priv->fields[field], val,
--					      val, 10, timeout_us);
-+					      val, 0, timeout_us);
- }
-=20
- static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field=
,
-@@ -262,7 +262,7 @@ static int isp1760_hcd_set_and_wait_swap(struct usb_=
hcd *hcd, u32 field,
- 	isp1760_hcd_set(hcd, field);
-=20
- 	return regmap_field_read_poll_timeout(priv->fields[field], val,
--					      !val, 10, timeout_us);
-+					      !val, 0, timeout_us);
- }
-=20
- static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
-@@ -274,7 +274,7 @@ static int isp1760_hcd_clear_and_wait(struct usb_hcd=
 *hcd, u32 field,
- 	isp1760_hcd_clear(hcd, field);
-=20
- 	return regmap_field_read_poll_timeout(priv->fields[field], val,
--					      !val, 10, timeout_us);
-+					      !val, 0, timeout_us);
- }
-=20
- static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0026-us=
b-isp1760-rework-cache-initialization-error-handli.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/files/corstone1000/0026-usb-isp1760-rework-cache-init=
ialization-error-handli.patch
deleted file mode 100644
index d03d6471..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0026-usb-isp17=
60-rework-cache-initialization-error-handli.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.15]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From cbbdb3fe0d974d655c87c3e6ba2990d5496b9f82 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 27 Jul 2021 11:05:16 +0100
-Subject: [PATCH 13/23] usb: isp1760: rework cache initialization error
- handling
-
-If we fail to create qtd cache we were not destroying the
-urb_listitem, rework the error handling logic to cope with that.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210727100516.4190681-4-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 16 +++++++++++-----
- 1 file changed, 11 insertions(+), 5 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index a018394d54f8..825be736be33 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -2527,17 +2527,23 @@ int __init isp1760_init_kmem_once(void)
- 			SLAB_MEM_SPREAD, NULL);
-=20
- 	if (!qtd_cachep)
--		return -ENOMEM;
-+		goto destroy_urb_listitem;
-=20
- 	qh_cachep =3D kmem_cache_create("isp1760_qh", sizeof(struct isp1760_qh=
),
- 			0, SLAB_TEMPORARY | SLAB_MEM_SPREAD, NULL);
-=20
--	if (!qh_cachep) {
--		kmem_cache_destroy(qtd_cachep);
--		return -ENOMEM;
--	}
-+	if (!qh_cachep)
-+		goto destroy_qtd;
-=20
- 	return 0;
-+
-+destroy_qtd:
-+	kmem_cache_destroy(qtd_cachep);
-+
-+destroy_urb_listitem:
-+	kmem_cache_destroy(urb_listitem_cachep);
-+
-+	return -ENOMEM;
- }
-=20
- void isp1760_deinit_kmem_cache(void)
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0027-us=
b-isp1760-ignore-return-value-for-bus-change-patte.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/files/corstone1000/0027-usb-isp1760-ignore-return-val=
ue-for-bus-change-patte.patch
deleted file mode 100644
index 354291a9..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0027-usb-isp17=
60-ignore-return-value-for-bus-change-patte.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.15]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 8472896f39cfab2d8fec9ca746070aaf02609169 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 19 Aug 2021 19:09:25 +0100
-Subject: [PATCH 14/23] usb: isp1760: ignore return value for bus change
- pattern
-
-We do not care about the return value of that read between the
-scratch register write and read, we really just want to make sure that
-the pattern in the bus get changed to make sure we are testing
-correctly the scratch pattern.
-
-Clang-analyzer complains about the never read scratch variable:
->> drivers/usb/isp1760/isp1760-hcd.c:735:2: warning: Value stored to 'sc=
ratch' is never read [clang-analyzer-deadcode.DeadStores]
-    scratch =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-
-Just ignore the return value of that CHIP_ID_HIGH read, add more
-information to the comment above why we are doing this. And as at it,
-just do a small format change in the error message bellow.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210819180929.1327349-2-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 825be736be33..2a21fe5aa7a8 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -731,11 +731,15 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
-=20
- 	isp1760_hcd_write(hcd, HC_SCRATCH, pattern);
-=20
--	/* Change bus pattern */
--	scratch =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-+	/*
-+	 * we do not care about the read value here we just want to
-+	 * change bus pattern.
-+	 */
-+	isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
- 	scratch =3D isp1760_hcd_read(hcd, HC_SCRATCH);
- 	if (scratch !=3D pattern) {
--		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n", scratc=
h);
-+		dev_err(hcd->self.controller, "Scratch test failed. 0x%08x\n",
-+			scratch);
- 		return -ENODEV;
- 	}
-=20
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0028-us=
b-isp1760-check-maxpacketsize-before-using-it.patch b/meta-arm-bsp/recipe=
s-kernel/linux/files/corstone1000/0028-usb-isp1760-check-maxpacketsize-be=
fore-using-it.patch
deleted file mode 100644
index 67c3585a..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0028-usb-isp17=
60-check-maxpacketsize-before-using-it.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.15]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 8e58b7710d6634ed46ae26fedb8459f84f08fd51 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 19 Aug 2021 19:09:26 +0100
-Subject: [PATCH 15/23] usb: isp1760: check maxpacketsize before using it
-
-When checking if we need one more packet on a bulk pipe we may, even
-though not probable at all, get there with a zero maxpacketsize.
-In that case for sure no packet, no even a one more, will be
-allocated.
-
-This will clean the clang-analyzer warning:
-drivers/usb/isp1760/isp1760-hcd.c:1856:38: warning: Division by zero [cl=
ang-analyzer-core.DivideZero]
-                                && !(urb->transfer_buffer_length %
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210819180929.1327349-3-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 2a21fe5aa7a8..5c947a1eae49 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -1854,7 +1854,7 @@ static void packetize_urb(struct usb_hcd *hcd,
- 				packet_type =3D OUT_PID;
- 			else
- 				packet_type =3D IN_PID;
--		} else if (usb_pipebulk(urb->pipe)
-+		} else if (usb_pipebulk(urb->pipe) && maxpacketsize
- 				&& (urb->transfer_flags & URB_ZERO_PACKET)
- 				&& !(urb->transfer_buffer_length %
- 							maxpacketsize)) {
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0029-us=
b-isp1760-do-not-reset-retval.patch b/meta-arm-bsp/recipes-kernel/linux/f=
iles/corstone1000/0029-usb-isp1760-do-not-reset-retval.patch
deleted file mode 100644
index ccf3248c..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0029-usb-isp17=
60-do-not-reset-retval.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.15]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 5e4cd1b6556302fe6a457e525c256cbef3563543 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 19 Aug 2021 19:09:27 +0100
-Subject: [PATCH 16/23] usb: isp1760: do not reset retval
-
-We do not really need to reset retval before get used bellow.
-This will avoid the clang-analyzer warning:
-
-drivers/usb/isp1760/isp1760-hcd.c:1919:2: warning: Value stored to 'retv=
al' is never read [clang-analyzer-deadcode.DeadStores]
-        retval =3D 0;
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210819180929.1327349-4-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 5c947a1eae49..aed2714ce0cf 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -1919,7 +1919,6 @@ static int isp1760_urb_enqueue(struct usb_hcd *hcd=
, struct urb *urb,
- 	if (list_empty(&new_qtds))
- 		return -ENOMEM;
-=20
--	retval =3D 0;
- 	spin_lock_irqsave(&priv->lock, spinflags);
-=20
- 	if (!test_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags)) {
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0030-us=
b-isp1760-do-not-shift-in-uninitialized-slot.patch b/meta-arm-bsp/recipes=
-kernel/linux/files/corstone1000/0030-usb-isp1760-do-not-shift-in-uniniti=
alized-slot.patch
deleted file mode 100644
index 1de6c697..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0030-usb-isp17=
60-do-not-shift-in-uninitialized-slot.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.15]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 7d1d3882fd9da1ee42fe3ad3a5ffd41fb8204380 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 19 Aug 2021 19:09:28 +0100
-Subject: [PATCH 17/23] usb: isp1760: do not shift in uninitialized slot
-
-Even though it is not expected, and would trigger a WARN_ON, killing a
-transfer in a uninitialized slot this sequence is warned by clang
-analyzer, twice:
-
-drivers/usb/isp1760/isp1760-hcd.c:1976:18: warning: The result of the le=
ft shift is undefined because the right operand is negative [clang-analyz=
er-core.UndefinedBinaryOperatorResult]
-                skip_map |=3D (1 << qh->slot);
-drivers/usb/isp1760/isp1760-hcd.c:1983:18: warning: The result of the le=
ft shift is undefined because the right operand is negative [clang-analyz=
er-core.UndefinedBinaryOperatorResult]
-                skip_map |=3D (1 << qh->slot);
-
-Only set skip map if slot is active.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210819180929.1327349-5-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 18 +++++++++++-------
- 1 file changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index aed2714ce0cf..bf8ab3fe2e5a 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -1974,16 +1974,20 @@ static void kill_transfer(struct usb_hcd *hcd, s=
truct urb *urb,
- 	/* We need to forcefully reclaim the slot since some transfers never
- 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
- 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
--		skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
--		skip_map |=3D (1 << qh->slot);
--		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
--		ndelay(100);
-+		if (qh->slot !=3D -1) {
-+			skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
-+			skip_map |=3D (1 << qh->slot);
-+			isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
-+			ndelay(100);
-+		}
- 		priv->atl_slots[qh->slot].qh =3D NULL;
- 		priv->atl_slots[qh->slot].qtd =3D NULL;
- 	} else {
--		skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
--		skip_map |=3D (1 << qh->slot);
--		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
-+		if (qh->slot !=3D -1) {
-+			skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
-+			skip_map |=3D (1 << qh->slot);
-+			isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
-+		}
- 		priv->int_slots[qh->slot].qh =3D NULL;
- 		priv->int_slots[qh->slot].qtd =3D NULL;
- 	}
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0031-us=
b-isp1760-clean-never-read-udc_enabled-warning.patch b/meta-arm-bsp/recip=
es-kernel/linux/files/corstone1000/0031-usb-isp1760-clean-never-read-udc_=
enabled-warning.patch
deleted file mode 100644
index 7d908dec..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0031-usb-isp17=
60-clean-never-read-udc_enabled-warning.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.15]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From de940244e8987a76d73fb2b0057ecd494cbfeefd Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 19 Aug 2021 19:09:29 +0100
-Subject: [PATCH 18/23] usb: isp1760: clean never read udc_enabled warnin=
g
-
-When CONFIG_USB_ISP1761_UDC is not enabled the udc_enabled variable is
-never used since it is short circuited before in the logic operations.
-
-This would trigger the following warning by clang analyzer:
-
-drivers/usb/isp1760/isp1760-core.c:490:2: warning: Value stored to 'udc_=
enabled' is never read [clang-analyzer-deadcode.DeadStores]
-        udc_enabled =3D ((devflags & ISP1760_FLAG_ISP1763) ||
-        ^
-drivers/usb/isp1760/isp1760-core.c:490:2: note: Value stored to 'udc_ena=
bled' is never read
-
-Just swap the other of the operands in the logic operations.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Link: https://lore.kernel.org/r/20210819180929.1327349-6-rui.silva@linar=
o.org
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- drivers/usb/isp1760/isp1760-core.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-index ff07e2890692..cb70f9d63cdd 100644
---- a/drivers/usb/isp1760/isp1760-core.c
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -491,7 +491,7 @@ int isp1760_register(struct resource *mem, int irq, =
unsigned long irqflags,
- 		       (devflags & ISP1760_FLAG_ISP1761));
-=20
- 	if ((!IS_ENABLED(CONFIG_USB_ISP1760_HCD) || usb_disabled()) &&
--	    (!IS_ENABLED(CONFIG_USB_ISP1761_UDC) || !udc_enabled))
-+	    (!udc_enabled || !IS_ENABLED(CONFIG_USB_ISP1761_UDC)))
- 		return -ENODEV;
-=20
- 	isp =3D devm_kzalloc(dev, sizeof(*isp), GFP_KERNEL);
-@@ -571,7 +571,7 @@ int isp1760_register(struct resource *mem, int irq, =
unsigned long irqflags,
- 			return ret;
- 	}
-=20
--	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && udc_enabled) {
-+	if (udc_enabled && IS_ENABLED(CONFIG_USB_ISP1761_UDC)) {
- 		ret =3D isp1760_udc_register(isp, irq, irqflags);
- 		if (ret < 0) {
- 			isp1760_hcd_unregister(hcd);
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0032-us=
b-isp1760-fix-memory-pool-initialization.patch b/meta-arm-bsp/recipes-ker=
nel/linux/files/corstone1000/0032-usb-isp1760-fix-memory-pool-initializat=
ion.patch
deleted file mode 100644
index 6277d8a9..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0032-usb-isp17=
60-fix-memory-pool-initialization.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From d36713c344e0c963178e417911d2cd867597d2f0 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Fri, 27 Aug 2021 01:27:40 +0100
-Subject: [PATCH 19/23] usb: isp1760: fix memory pool initialization
-
-The loops to setup the memory pool were skipping some
-blocks, that was not visible on the ISP1763 because it has
-fewer blocks than the ISP1761. But won testing on that IP
-from the family that would be an issue.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index bf8ab3fe2e5a..b3a55c5d2155 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -588,8 +588,8 @@ static void init_memory(struct isp1760_hcd *priv)
-=20
- 	payload_addr =3D PAYLOAD_OFFSET;
-=20
--	for (i =3D 0, curr =3D 0; i < ARRAY_SIZE(mem->blocks); i++) {
--		for (j =3D 0; j < mem->blocks[i]; j++, curr++) {
-+	for (i =3D 0, curr =3D 0; i < ARRAY_SIZE(mem->blocks); i++, curr +=3D =
j) {
-+		for (j =3D 0; j < mem->blocks[i]; j++) {
- 			priv->memory_pool[curr + j].start =3D payload_addr;
- 			priv->memory_pool[curr + j].size =3D mem->blocks_size[i];
- 			priv->memory_pool[curr + j].free =3D 1;
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0033-us=
b-isp1760-fix-qtd-fill-length.patch b/meta-arm-bsp/recipes-kernel/linux/f=
iles/corstone1000/0033-usb-isp1760-fix-qtd-fill-length.patch
deleted file mode 100644
index ee913bc6..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0033-usb-isp17=
60-fix-qtd-fill-length.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From fc22c0fb49d7858b3c7b8bd2a8e041263280e230 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 25 Aug 2021 00:10:02 +0100
-Subject: [PATCH 20/23] usb: isp1760: fix qtd fill length
-
-When trying to send bulks bigger than the biggest block size
-we need to split them over several qtd. Fix this limiting the
-maximum qtd size to largest block size.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index b3a55c5d2155..fba21122bb00 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -1829,9 +1829,11 @@ static void packetize_urb(struct usb_hcd *hcd,
- 			goto cleanup;
-=20
- 		if (len > mem->blocks_size[ISP176x_BLOCK_NUM - 1])
--			len =3D mem->blocks_size[ISP176x_BLOCK_NUM - 1];
-+			this_qtd_len =3D mem->blocks_size[ISP176x_BLOCK_NUM - 1];
-+		else
-+			this_qtd_len =3D len;
-=20
--		this_qtd_len =3D qtd_fill(qtd, buf, len);
-+		this_qtd_len =3D qtd_fill(qtd, buf, this_qtd_len);
- 		list_add_tail(&qtd->qtd_list, head);
-=20
- 		len -=3D this_qtd_len;
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0034-us=
b-isp1760-write-to-status-and-address-register.patch b/meta-arm-bsp/recip=
es-kernel/linux/files/corstone1000/0034-usb-isp1760-write-to-status-and-a=
ddress-register.patch
deleted file mode 100644
index 7b8d8457..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0034-usb-isp17=
60-write-to-status-and-address-register.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From a5dca0d8c66fb40ef372b596cbcfad45112fa050 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 24 Aug 2021 09:37:27 +0100
-Subject: [PATCH 21/23] usb: isp1760: write to status and address registe=
r
-
-We were already writing directly the port status register to
-trigger changes in isp1763. The same is needed in other IP
-from the family, including also to setup the read address
-before reading from device.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/usb/isp1760/isp1760-hcd.c | 23 +++++++++++------------
- 1 file changed, 11 insertions(+), 12 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index fba21122bb00..79d571f1429b 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -182,7 +182,7 @@ struct urb_listitem {
- 	struct urb *urb;
- };
-=20
--static const u32 isp1763_hc_portsc1_fields[] =3D {
-+static const u32 isp176x_hc_portsc1_fields[] =3D {
- 	[PORT_OWNER]		=3D BIT(13),
- 	[PORT_POWER]		=3D BIT(12),
- 	[PORT_LSTATUS]		=3D BIT(10),
-@@ -205,27 +205,28 @@ static u32 isp1760_hcd_read(struct usb_hcd *hcd, u=
32 field)
- }
-=20
- /*
-- * We need, in isp1763, to write directly the values to the portsc1
-+ * We need, in isp176x, to write directly the values to the portsc1
-  * register so it will make the other values to trigger.
-  */
- static void isp1760_hcd_portsc1_set_clear(struct isp1760_hcd *priv, u32=
 field,
- 					  u32 val)
- {
--	u32 bit =3D isp1763_hc_portsc1_fields[field];
--	u32 port_status =3D readl(priv->base + ISP1763_HC_PORTSC1);
-+	u32 bit =3D isp176x_hc_portsc1_fields[field];
-+	u16 portsc1_reg =3D priv->is_isp1763 ? ISP1763_HC_PORTSC1 :
-+		ISP176x_HC_PORTSC1;
-+	u32 port_status =3D readl(priv->base + portsc1_reg);
-=20
- 	if (val)
--		writel(port_status | bit, priv->base + ISP1763_HC_PORTSC1);
-+		writel(port_status | bit, priv->base + portsc1_reg);
- 	else
--		writel(port_status & ~bit, priv->base + ISP1763_HC_PORTSC1);
-+		writel(port_status & ~bit, priv->base + portsc1_reg);
- }
-=20
- static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-=20
--	if (unlikely(priv->is_isp1763 &&
--		     (field >=3D PORT_OWNER && field <=3D PORT_CONNECT)))
-+	if (unlikely((field >=3D PORT_OWNER && field <=3D PORT_CONNECT)))
- 		return isp1760_hcd_portsc1_set_clear(priv, field, val);
-=20
- 	isp1760_field_write(priv->fields, field, val);
-@@ -367,8 +368,7 @@ static void isp1760_mem_read(struct usb_hcd *hcd, u3=
2 src_offset, void *dst,
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-=20
--	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
--	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_MEMORY, src_offset);
- 	ndelay(100);
-=20
- 	bank_reads8(priv->base, src_offset, ISP_BANK_0, dst, bytes);
-@@ -496,8 +496,7 @@ static void isp1760_ptd_read(struct usb_hcd *hcd, u3=
2 ptd_offset, u32 slot,
- 	u16 src_offset =3D ptd_offset + slot * sizeof(*ptd);
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-=20
--	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
--	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_MEMORY, src_offset);
- 	ndelay(90);
-=20
- 	bank_reads8(priv->base, src_offset, ISP_BANK_0, (void *)ptd,
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0035-us=
b-isp1760-use-the-right-irq-status-bit.patch b/meta-arm-bsp/recipes-kerne=
l/linux/files/corstone1000/0035-usb-isp1760-use-the-right-irq-status-bit.=
patch
deleted file mode 100644
index 8faad8f8..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0035-usb-isp17=
60-use-the-right-irq-status-bit.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 8f238acb1dada56dc6898a6ce2551feed0e6e8c2 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 25 Aug 2021 00:36:55 +0100
-Subject: [PATCH 22/23] usb: isp1760: use the right irq status bit
-
-Instead of using the fields enum values to check interrupts
-trigged, use the correct bit values.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/usb/isp1760/isp1760-udc.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp=
1760-udc.c
-index a78da59d6417..5cafd23345ca 100644
---- a/drivers/usb/isp1760/isp1760-udc.c
-+++ b/drivers/usb/isp1760/isp1760-udc.c
-@@ -1363,7 +1363,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *=
dev)
-=20
- 	status =3D isp1760_udc_irq_get_status(udc);
-=20
--	if (status & DC_IEVBUS) {
-+	if (status & ISP176x_DC_IEVBUS) {
- 		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
- 		/* The VBUS interrupt is only triggered when VBUS appears. */
- 		spin_lock(&udc->lock);
-@@ -1371,7 +1371,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *=
dev)
- 		spin_unlock(&udc->lock);
- 	}
-=20
--	if (status & DC_IEBRST) {
-+	if (status & ISP176x_DC_IEBRST) {
- 		dev_dbg(udc->isp->dev, "%s(BRST)\n", __func__);
-=20
- 		isp1760_udc_reset(udc);
-@@ -1391,18 +1391,18 @@ static irqreturn_t isp1760_udc_irq(int irq, void=
 *dev)
- 		}
- 	}
-=20
--	if (status & DC_IEP0SETUP) {
-+	if (status & ISP176x_DC_IEP0SETUP) {
- 		dev_dbg(udc->isp->dev, "%s(EP0SETUP)\n", __func__);
-=20
- 		isp1760_ep0_setup(udc);
- 	}
-=20
--	if (status & DC_IERESM) {
-+	if (status & ISP176x_DC_IERESM) {
- 		dev_dbg(udc->isp->dev, "%s(RESM)\n", __func__);
- 		isp1760_udc_resume(udc);
- 	}
-=20
--	if (status & DC_IESUSP) {
-+	if (status & ISP176x_DC_IESUSP) {
- 		dev_dbg(udc->isp->dev, "%s(SUSP)\n", __func__);
-=20
- 		spin_lock(&udc->lock);
-@@ -1413,7 +1413,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *=
dev)
- 		spin_unlock(&udc->lock);
- 	}
-=20
--	if (status & DC_IEHS_STA) {
-+	if (status & ISP176x_DC_IEHS_STA) {
- 		dev_dbg(udc->isp->dev, "%s(HS_STA)\n", __func__);
- 		udc->gadget.speed =3D USB_SPEED_HIGH;
- 	}
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0036-us=
b-isp1760-otg-control-register-access.patch b/meta-arm-bsp/recipes-kernel=
/linux/files/corstone1000/0036-usb-isp1760-otg-control-register-access.pa=
tch
deleted file mode 100644
index e7ddc89a..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0036-usb-isp17=
60-otg-control-register-access.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-Upstream-Status: Accepted [merged with kernel 5.14.9]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 6ccc598ff04d7f7babcbf194b5a0913119abb702 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Fri, 27 Aug 2021 08:22:26 +0100
-Subject: [PATCH 23/23] usb: isp1760: otg control register access
-
-The set/clear of the otg control values is done writing to
-two different 16bit registers, however we setup the regmap
-width for isp1760/61 to 32bit value bits.
-
-So, just access the clear register address (0x376)as the high
-part of the otg control register set (0x374), and write the
-values in one go to make sure they get clear/set.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/usb/isp1760/isp1760-core.c | 50 ++++++++++++++++--------------
- drivers/usb/isp1760/isp1760-regs.h | 16 ++++++++++
- 2 files changed, 42 insertions(+), 24 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-index cb70f9d63cdd..d1d9a7d5da17 100644
---- a/drivers/usb/isp1760/isp1760-core.c
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -30,6 +30,7 @@ static int isp1760_init_core(struct isp1760_device *is=
p)
- {
- 	struct isp1760_hcd *hcd =3D &isp->hcd;
- 	struct isp1760_udc *udc =3D &isp->udc;
-+	u32 otg_ctrl;
-=20
- 	/* Low-level chip reset */
- 	if (isp->rst_gpio) {
-@@ -83,16 +84,17 @@ static int isp1760_init_core(struct isp1760_device *=
isp)
- 	 *
- 	 * TODO: Really support OTG. For now we configure port 1 in device mod=
e
- 	 */
--	if (((isp->devflags & ISP1760_FLAG_ISP1761) ||
--	     (isp->devflags & ISP1760_FLAG_ISP1763)) &&
--	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
--		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
--		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
--		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
--	} else {
--		isp1760_field_set(hcd->fields, HW_SW_SEL_HC_DC);
--		isp1760_field_set(hcd->fields, HW_VBUS_DRV);
--		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
-+	if (isp->devflags & ISP1760_FLAG_ISP1761) {
-+		if (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN) {
-+			otg_ctrl =3D (ISP176x_HW_DM_PULLDOWN_CLEAR |
-+				    ISP176x_HW_DP_PULLDOWN_CLEAR |
-+				    ISP176x_HW_OTG_DISABLE);
-+		} else {
-+			otg_ctrl =3D (ISP176x_HW_SW_SEL_HC_DC_CLEAR |
-+				    ISP176x_HW_VBUS_DRV |
-+				    ISP176x_HW_SEL_CP_EXT);
-+		}
-+		isp1760_reg_write(hcd->regs, ISP176x_HC_OTG_CTRL, otg_ctrl);
- 	}
-=20
- 	dev_info(isp->dev, "%s bus width: %u, oc: %s\n",
-@@ -235,20 +237,20 @@ static const struct reg_field isp1760_hc_reg_field=
s[] =3D {
- 	[HC_ISO_IRQ_MASK_AND]	=3D REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_AND, 0, 31=
),
- 	[HC_INT_IRQ_MASK_AND]	=3D REG_FIELD(ISP176x_HC_INT_IRQ_MASK_AND, 0, 31=
),
- 	[HC_ATL_IRQ_MASK_AND]	=3D REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_AND, 0, 31=
),
--	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 10, 10),
--	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 7, 7),
--	[HW_VBUS_DRV]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 4, 4),
--	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 3, 3),
--	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 2, 2),
--	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 1, 1),
--	[HW_DP_PULLUP]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 0, 0),
--	[HW_OTG_DISABLE_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 10, 10=
),
--	[HW_SW_SEL_HC_DC_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 7, 7)=
,
--	[HW_VBUS_DRV_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 4, 4),
--	[HW_SEL_CP_EXT_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 3, 3),
--	[HW_DM_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 2, 2),
--	[HW_DP_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 1, 1),
--	[HW_DP_PULLUP_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 0, 0),
-+	[HW_OTG_DISABLE_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 26, 26),
-+	[HW_SW_SEL_HC_DC_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 23, 23),
-+	[HW_VBUS_DRV_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 20, 20),
-+	[HW_SEL_CP_EXT_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 19, 19),
-+	[HW_DM_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 18, 18),
-+	[HW_DP_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 17, 17),
-+	[HW_DP_PULLUP_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 16, 16),
-+	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 10, 10),
-+	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 7, 7),
-+	[HW_VBUS_DRV]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 4, 4),
-+	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 3, 3),
-+	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 2, 2),
-+	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 1, 1),
-+	[HW_DP_PULLUP]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL, 0, 0),
- };
-=20
- static const struct reg_field isp1763_hc_reg_fields[] =3D {
-diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/is=
p1760-regs.h
-index 94ea60c20b2a..3a6751197e97 100644
---- a/drivers/usb/isp1760/isp1760-regs.h
-+++ b/drivers/usb/isp1760/isp1760-regs.h
-@@ -61,6 +61,7 @@
- #define ISP176x_HC_INT_IRQ_MASK_AND	0x328
- #define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
-=20
-+#define ISP176x_HC_OTG_CTRL		0x374
- #define ISP176x_HC_OTG_CTRL_SET		0x374
- #define ISP176x_HC_OTG_CTRL_CLEAR	0x376
-=20
-@@ -179,6 +180,21 @@ enum isp176x_host_controller_fields {
- #define ISP176x_DC_IESUSP		BIT(3)
- #define ISP176x_DC_IEBRST		BIT(0)
-=20
-+#define ISP176x_HW_OTG_DISABLE_CLEAR	BIT(26)
-+#define ISP176x_HW_SW_SEL_HC_DC_CLEAR	BIT(23)
-+#define ISP176x_HW_VBUS_DRV_CLEAR	BIT(20)
-+#define ISP176x_HW_SEL_CP_EXT_CLEAR	BIT(19)
-+#define ISP176x_HW_DM_PULLDOWN_CLEAR	BIT(18)
-+#define ISP176x_HW_DP_PULLDOWN_CLEAR	BIT(17)
-+#define ISP176x_HW_DP_PULLUP_CLEAR	BIT(16)
-+#define ISP176x_HW_OTG_DISABLE		BIT(10)
-+#define ISP176x_HW_SW_SEL_HC_DC		BIT(7)
-+#define ISP176x_HW_VBUS_DRV		BIT(4)
-+#define ISP176x_HW_SEL_CP_EXT		BIT(3)
-+#define ISP176x_HW_DM_PULLDOWN		BIT(2)
-+#define ISP176x_HW_DP_PULLDOWN		BIT(1)
-+#define ISP176x_HW_DP_PULLUP		BIT(0)
-+
- #define ISP176x_DC_ENDPTYP_ISOC		0x01
- #define ISP176x_DC_ENDPTYP_BULK		0x02
- #define ISP176x_DC_ENDPTYP_INTERRUPT	0x03
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0037-fi=
rmware-arm_ffa-setting-the-FFA_VERSION-compatibility-checks.patch.patch b=
/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0037-firmware-arm_f=
fa-setting-the-FFA_VERSION-compatibility-checks.patch.patch
deleted file mode 100644
index f5e5b81e..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0037-firmware-=
arm_ffa-setting-the-FFA_VERSION-compatibility-checks.patch.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 045c5da54595303c8bfec54fa5bbae10fdf9f5f5 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Wed, 25 Aug 2021 11:24:35 +0100
-Subject: [PATCH 1/3] firmware: arm_ffa: setting the FFA_VERSION compatib=
ility
- checks
-
-This commit aligns the FF-A versions checks according to the
-FF-A specification v1.0.
-
-The compatibility of the version number (x.y) of the caller with
-the version number (a.b) of the callee can be defined as:
-
-    If x =3D=3D a and y <=3D b, then the versions are compatible.
-    Otherwise, versions are incompatible.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- drivers/firmware/arm_ffa/driver.c | 41 ++++++++++++++++++++++---------
- 1 file changed, 30 insertions(+), 11 deletions(-)
-
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index c9fb56afbcb4..0044c928d9f2 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -105,13 +105,14 @@
-=20
- #define MAJOR_VERSION_MASK	GENMASK(30, 16)
- #define MINOR_VERSION_MASK	GENMASK(15, 0)
--#define MAJOR_VERSION(x)	((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
--#define MINOR_VERSION(x)	((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
-+#define GET_FFA_MAJOR_VERSION(x)	((u16)(FIELD_GET(MAJOR_VERSION_MASK, (=
x))))
-+#define GET_FFA_MINOR_VERSION(x)	((u16)(FIELD_GET(MINOR_VERSION_MASK, (=
x))))
- #define PACK_VERSION_INFO(major, minor)			\
- 	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
- 	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
--#define FFA_VERSION_1_0		PACK_VERSION_INFO(1, 0)
--#define FFA_MIN_VERSION		FFA_VERSION_1_0
-+#define FFA_MAJOR_VERSION		(1)
-+#define FFA_MINOR_VERSION		(0)
-+#define FFA_VERSION_1_0		PACK_VERSION_INFO(FFA_MAJOR_VERSION, FFA_MINOR=
_VERSION)
-=20
- #define SENDER_ID_MASK		GENMASK(31, 16)
- #define RECEIVER_ID_MASK	GENMASK(15, 0)
-@@ -170,26 +171,44 @@ static struct ffa_drv_info *drv_info;
- static int ffa_version_check(u32 *version)
- {
- 	ffa_value_t ver;
-+	u16 major, minor;
-=20
- 	invoke_ffa_fn((ffa_value_t){
- 		      .a0 =3D FFA_VERSION, .a1 =3D FFA_DRIVER_VERSION,
- 		      }, &ver);
-=20
-+
- 	if (ver.a0 =3D=3D FFA_RET_NOT_SUPPORTED) {
--		pr_info("FFA_VERSION returned not supported\n");
-+		pr_err("A Firmware Framework implementation does not exist\n");
- 		return -EOPNOTSUPP;
- 	}
-=20
--	if (ver.a0 < FFA_MIN_VERSION || ver.a0 > FFA_DRIVER_VERSION) {
--		pr_err("Incompatible version %d.%d found\n",
--		       MAJOR_VERSION(ver.a0), MINOR_VERSION(ver.a0));
--		return -EINVAL;
-+	major =3D GET_FFA_MAJOR_VERSION(ver.a0);
-+	minor =3D GET_FFA_MINOR_VERSION(ver.a0);
-+
-+	if ((major !=3D FFA_MAJOR_VERSION) || (minor < FFA_MINOR_VERSION)) {
-+		pr_err("Versions are incompatible\n"
-+		"FF-A driver version: %d.%d\n"
-+		"FF-A framework version: %d.%d\n",
-+				FFA_MAJOR_VERSION,
-+				FFA_MINOR_VERSION,
-+				major,
-+				minor);
-+		return -EPROTONOSUPPORT;
- 	}
-=20
-+	pr_info("Versions are compatible\n"
-+	"FF-A driver version: %d.%d\n"
-+	"FF-A framework version: %d.%d\n",
-+					FFA_MAJOR_VERSION,
-+					FFA_MINOR_VERSION,
-+					major,
-+					minor);
-+
- 	*version =3D ver.a0;
--	pr_info("Version %d.%d found\n", MAJOR_VERSION(ver.a0),
--		MINOR_VERSION(ver.a0));
-+
- 	return 0;
-+
- }
-=20
- static int ffa_rx_release(void)
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconf=
ig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
index c402ca23..5f0a7e91 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -37,7 +37,6 @@ CONFIG_NETDEVICES=3Dy
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_AQUANTIA is not set
 # CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_VENDOR_AURORA is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CADENCE is not set
 # CONFIG_NET_VENDOR_CAVIUM is not set
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index c68060af..2ea47bc3 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -39,43 +39,7 @@ LINUX_KERNEL_TYPE:corstone1000 =3D "standard"
 #disabling the rootfs cpio file compression so it is not compressed twic=
e when bundled with the kernel
 KERNEL_EXTRA_ARGS:corstone1000 +=3D "CONFIG_INITRAMFS_COMPRESSION_NONE=3D=
y"
 SRC_URI:append:corstone1000 =3D " \
-           file://0001-usb-isp1760-fix-strict-typechecking.patch \
-           file://0002-usb-isp1760-move-to-regmap-for-register-access.pa=
tch \
-           file://0003-usb-isp1760-use-relaxed-primitives.patch \
-           file://0004-usb-isp1760-remove-platform-data-struct-and-code.=
patch \
-           file://0005-usb-isp1760-hcd-refactor-mempool-config-and-setup=
.patch \
-           file://0006-usb-isp1760-use-dr_mode-binding.patch \
-           file://0007-usb-isp1760-add-support-for-isp1763.patch \
-           file://0008-dt-bindings-usb-nxp-isp1760-add-bindings.patch \
-           file://0009-usb-isp1763-add-peripheral-mode.patch \
-           file://0010-firmware-smccc-Add-SMCCC-TRNG-function-call-IDs.p=
atch \
-           file://0011-firmware-smccc-Introduce-SMCCC-TRNG-framework.pat=
ch \
-           file://0012-arm64-smccc-Add-support-for-SMCCCv1.2-extended-in=
put-output-registers.patch \
-           file://0013-firmware-arm_ffa-Add-initial-FFA-bus-support-for-=
device-enumeration.patch \
-           file://0014-firmware-arm_ffa-Add-initial-Arm-FFA-driver-suppo=
rt.patch \
-           file://0015-firmware-arm_ffa-Add-support-for-SMCCC-as-transpo=
rt-to-ffa-driver.patch \
-           file://0016-firmware-arm_ffa-Setup-in-kernel-users-of-FFA-par=
titions.patch \
-           file://0017-firmware-arm_ffa-Add-support-for-MEM_-interfaces.=
patch \
-           file://0018-firmware-arm_ffa-Ensure-drivers-provide-a-probe-f=
unction.patch \
-           file://0019-firmware-arm_ffa-Simplify-probe-function.patch \
-           file://0020-firmware-arm_ffa-Fix-the-comment-style.patch \
-           file://0021-firmware-arm_ffa-Fix-a-possible-ffa_linux_errmap-=
buffer-overflow.patch \
-           file://0022-usb-isp1760-isp1760-udc-Provide-missing-descripti=
on-.patch \
-           file://0023-usb-isp1760-Fix-meaningless-check-in-isp1763_run.=
patch \
-           file://0024-usb-isp1760-remove-debug-message-as-error.patch \
-           file://0025-usb-isp1760-do-not-sleep-in-field-register-poll.p=
atch \
-           file://0026-usb-isp1760-rework-cache-initialization-error-han=
dli.patch \
-           file://0027-usb-isp1760-ignore-return-value-for-bus-change-pa=
tte.patch \
-           file://0028-usb-isp1760-check-maxpacketsize-before-using-it.p=
atch \
-           file://0029-usb-isp1760-do-not-reset-retval.patch \
-           file://0030-usb-isp1760-do-not-shift-in-uninitialized-slot.pa=
tch \
-           file://0031-usb-isp1760-clean-never-read-udc_enabled-warning.=
patch \
-           file://0032-usb-isp1760-fix-memory-pool-initialization.patch =
\
-           file://0033-usb-isp1760-fix-qtd-fill-length.patch \
-           file://0034-usb-isp1760-write-to-status-and-address-register.=
patch \
-           file://0035-usb-isp1760-use-the-right-irq-status-bit.patch \
-           file://0036-usb-isp1760-otg-control-register-access.patch \
-           file://0037-firmware-arm_ffa-setting-the-FFA_VERSION-compatib=
ility-checks.patch.patch \
+           file://0001-arm64-Correct-wrong-label-in-macro-__init_el2_gic=
v3.patch \
            file://defconfig  \
         "
=20
--=20
2.25.1


