Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01D8C54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52249.1673521387147767806
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 03:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD39FAD7;
	Thu, 12 Jan 2023 03:03:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6591E3F67D;
	Thu, 12 Jan 2023 03:03:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 10/10] arm-bsp/u-boot: Corstone1000: bump to v2022.10
Date: Thu, 12 Jan 2023 11:02:57 +0000
Message-Id: <20230112110257.2070363-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 11:03:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4273

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Upgrade to v2022.10

This includes Corstone-1000 out of tree patches.

FF-A patches are the latest sent to U-Boot mailing list (v8).

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |    2 +-
 ...upport-for-SMCCCv1.2-x0-x17-registe.patch} |   55 +-
 ...d-add-load-command-for-memory-mapped.patch |  186 -
 ...add-support-to-corstone1000-platform.patch |  682 ---
 ...ntroduce-uuid_str_to_le_bin-function.patch |  132 +
 ...introduce-Arm-FF-A-low-level-driver.patch} |  908 ++--
 ...3-usb-common-move-urb-code-to-common.patch |  498 ---
 ...0004-arm_ffa-efi-unmap-RX-TX-buffers.patch |   73 +
 .../0004-usb-add-isp1760-family-driver.patch  | 3806 -----------------
 ...05-arm_ffa-introduce-armffa-command.patch} |   72 +-
 ...ne1000-enable-isp1763-usb-controller.patch |   49 -
 ...a-introduce-the-FF-A-Sandbox-driver.patch} |  139 +-
 ...ear-the-Xn-registers-after-SMC-calls.patch |   59 -
 ...e-Sandbox-test-cases-for-UCLASS_FFA.patch} |   74 +-
 ...troduce-armffa-command-Sandbox-test.patch} |   42 +-
 ...oduce-be_uuid_str_to_le_bin-function.patch |  127 -
 ...efi-introduce-FF-A-MM-communication.patch} |  316 +-
 ...corstone1000-enable-MM-communication.patch |   76 +
 ...ne1000-introduce-EFI-capsule-update.patch} |   66 +-
 ...00-fix-unrecognized-filesystem-type.patch} |    4 +-
 ...one1000-pass-interface-id-and-buffe.patch} |   10 +-
 ...tone1000-pass-interface-id-and-kern.patch} |   12 +-
 ...stone1000-enable-FF-A-and-MM-support.patch |   53 -
 ...ne1000-remove-guid-check-from-corst.patch} |    6 +-
 ...te-ESRT-table-if-EFI_ESRT-config-op.patch} |    6 +-
 ...000-Update-FFA-shared-buffer-address.patch |   34 -
 ...add-get_image_info-for-corstone1000.patch} |    4 +-
 ...ootcomplete-message-to-secure-encla.patch} |   20 +-
 ...ll-pointer-exception-with-get_image.patch} |    4 +-
 ...020-arm-corstone1000-add-mmc-for-fvp.patch |   99 +
 ...ne1000-add-compressed-kernel-support.patch |   33 +
 ...-external-sys-driver-to-device-tree.patch} |   13 +-
 ...-rpmsg-client-to-u-boot-device-tree.patch} |    8 +-
 ... 0024-arm-corstone1000-esrt-support.patch} |   33 +-
 ...er-FF-A-bus-before-raising-EFI-start.patch |   50 +
 ...026-arm-corstone1000-add-mmc-for-fvp.patch |  149 -
 ...ne1000-enable-distro-booting-command.patch |   27 +
 ...corstone1000-use-a-compressed-kernel.patch |   34 -
 ...-support-for-32-bit-direct-messaging.patch |  182 -
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   57 +-
 40 files changed, 1369 insertions(+), 6831 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0006-arm64-s=
mccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch =3D> 0001-arm64-smccc=
-add-support-for-SMCCCv1.2-x0-x17-registe.patch} (78%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
001-cmd-load-add-load-command-for-memory-mapped.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
002-arm-add-support-to-corstone1000-platform.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
002-lib-uuid-introduce-uuid_str_to_le_bin-function.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0009-arm_ffa=
-introduce-Arm-FF-A-low-level-driver.patch =3D> 0003-arm_ffa-introduce-Ar=
m-FF-A-low-level-driver.patch} (69%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
003-usb-common-move-urb-code-to-common.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
004-arm_ffa-efi-unmap-RX-TX-buffers.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
004-usb-add-isp1760-family-driver.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0010-arm_ffa=
-introduce-armffa-command.patch =3D> 0005-arm_ffa-introduce-armffa-comman=
d.patch} (83%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
005-corstone1000-enable-isp1763-usb-controller.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0011-arm_ffa=
-introduce-the-FF-A-Sandbox-driver.patch =3D> 0006-arm_ffa-introduce-the-=
FF-A-Sandbox-driver.patch} (91%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
007-arm64-smccc-clear-the-Xn-registers-after-SMC-calls.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0012-arm_ffa=
-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch =3D> 0007-arm_ffa-intr=
oduce-Sandbox-test-cases-for-UCLASS_FFA.patch} (85%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0013-arm_ffa=
-introduce-armffa-command-Sandbox-test.patch =3D> 0008-arm_ffa-introduce-=
armffa-command-Sandbox-test.patch} (67%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
008-lib-uuid-introduce-be_uuid_str_to_le_bin-function.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0014-arm_ffa=
-introduce-FF-A-MM-communication.patch =3D> 0009-arm_ffa-efi-introduce-FF=
-A-MM-communication.patch} (61%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
010-arm_ffa-efi-corstone1000-enable-MM-communication.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0016-efi-cor=
stone1000-introduce-EFI-capsule-update.patch =3D> 0011-efi-corstone1000-i=
ntroduce-EFI-capsule-update.patch} (83%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0018-arm-cor=
stone1000-fix-unrecognized-filesystem-type.patch =3D> 0012-arm-corstone10=
00-fix-unrecognized-filesystem-type.patch} (86%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0019-efi_cap=
sule-corstone1000-pass-interface-id-and-buffe.patch =3D> 0013-efi_capsule=
-corstone1000-pass-interface-id-and-buffe.patch} (89%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0020-efi_boo=
ttime-corstone1000-pass-interface-id-and-kern.patch =3D> 0014-efi_boottim=
e-corstone1000-pass-interface-id-and-kern.patch} (86%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
015-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0021-efi_loa=
der-corstone1000-remove-guid-check-from-corst.patch =3D> 0015-efi_loader-=
corstone1000-remove-guid-check-from-corst.patch} (90%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0022-efi_loa=
der-populate-ESRT-table-if-EFI_ESRT-config-op.patch =3D> 0016-efi_loader-=
populate-ESRT-table-if-EFI_ESRT-config-op.patch} (86%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
017-corstone1000-Update-FFA-shared-buffer-address.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0023-efi_fir=
mware-add-get_image_info-for-corstone1000.patch =3D> 0017-efi_firmware-ad=
d-get_image_info-for-corstone1000.patch} (96%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0024-efi_loa=
der-send-bootcomplete-message-to-secure-encla.patch =3D> 0018-efi_loader-=
send-bootcomplete-message-to-secure-encla.patch} (91%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0025-efi_loa=
der-fix-null-pointer-exception-with-get_image.patch =3D> 0019-efi_loader-=
fix-null-pointer-exception-with-get_image.patch} (94%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
020-arm-corstone1000-add-mmc-for-fvp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
021-corstone1000-add-compressed-kernel-support.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0028-Introdu=
ce-external-sys-driver-to-device-tree.patch =3D> 0022-Introduce-external-=
sys-driver-to-device-tree.patch} (74%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0029-Add-mhu=
-and-rpmsg-client-to-u-boot-device-tree.patch =3D> 0023-Add-mhu-and-rpmsg=
-client-to-u-boot-device-tree.patch} (92%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0030-arm-cor=
stone1000-esrt-support.patch =3D> 0024-arm-corstone1000-esrt-support.patc=
h} (92%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
025-efi_setup-discover-FF-A-bus-before-raising-EFI-start.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
026-arm-corstone1000-add-mmc-for-fvp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
026-corstone1000-enable-distro-booting-command.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
027-corstone1000-use-a-compressed-kernel.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
031-ffa-add-support-for-32-bit-direct-messaging.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index ff00e3f1..d5d6418d 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -22,7 +22,7 @@ TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-RS=
A-3072_1.pem"
 RE_IMAGE_OFFSET =3D "0x1000"
=20
 # u-boot
-PREFERRED_VERSION_u-boot ?=3D "2022.07"
+PREFERRED_VERSION_u-boot ?=3D "2022.10"
 EXTRA_IMAGEDEPENDS +=3D "u-boot"
=20
 UBOOT_CONFIG ??=3D "EFI"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm=
64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0001-arm64-smccc-add-support-for-SMC=
CCv1.2-x0-x17-registe.patch
similarity index 78%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm6=
4-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm64-=
smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch
index 01cd5615..837f8a92 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm64-smcc=
c-add-support-for-SMCCCv1.2-x0-x17-registe.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm64-smcc=
c-add-support-for-SMCCCv1.2-x0-x17-registe.patch
@@ -1,7 +1,7 @@
-From 7afe2370bc24b9003be8184fbd3169ebca03165a Mon Sep 17 00:00:00 2001
+From 584e4952dca726c3dc9df319dffb37a518b65c14 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 29 Jul 2022 13:06:19 +0100
-Subject: [PATCH 06/26] arm64: smccc: add support for SMCCCv1.2 x0-x17
+Subject: [PATCH 01/25] arm64: smccc: add support for SMCCCv1.2 x0-x17
  registers
=20
 add support for x0-x17 registers used by the SMC calls
@@ -16,13 +16,19 @@ arm64: smccc: Add support for SMCCCv1.2 extended inpu=
t/output registers
 [1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4=
c6?token=3D
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
-
----
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
=20
 Changelog:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
+v7:
+
+* improve indentation of ARM_SMCCC_1_2_REGS_Xn_OFFS
+
 v4:
=20
 * rename the commit title and improve description
@@ -33,11 +39,11 @@ v3:
 * port x0-x17 registers support from linux kernel as defined by SMCCCv1.=
2
   commit title:
       arm64: smccc: add Xn registers support used by SMC calls
-
+---
  arch/arm/cpu/armv8/smccc-call.S | 53 +++++++++++++++++++++++++++++++++
- arch/arm/lib/asm-offsets.c      | 13 ++++++++
+ arch/arm/lib/asm-offsets.c      | 14 +++++++++
  include/linux/arm-smccc.h       | 43 ++++++++++++++++++++++++++
- 3 files changed, 109 insertions(+)
+ 3 files changed, 110 insertions(+)
=20
 diff --git a/arch/arm/cpu/armv8/smccc-call.S b/arch/arm/cpu/armv8/smccc-=
call.S
 index dc92b28777..ec6f299bc9 100644
@@ -108,38 +114,39 @@ index dc92b28777..ec6f299bc9 100644
 +
 +#endif
 diff --git a/arch/arm/lib/asm-offsets.c b/arch/arm/lib/asm-offsets.c
-index 22fd541f9a..b6bd1b32b0 100644
+index 22fd541f9a..db6d7ed234 100644
 --- a/arch/arm/lib/asm-offsets.c
 +++ b/arch/arm/lib/asm-offsets.c
-@@ -9,6 +9,8 @@
+@@ -9,6 +9,9 @@
   * generate asm statements containing #defines,
   * compile this file to assembler, and then extract the
   * #defines from the assembly-language output.
 + *
 + * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
   */
 =20
  #include <common.h>
-@@ -117,6 +119,17 @@ int main(void)
+@@ -117,6 +120,17 @@ int main(void)
  	DEFINE(ARM_SMCCC_RES_X2_OFFS, offsetof(struct arm_smccc_res, a2));
  	DEFINE(ARM_SMCCC_QUIRK_ID_OFFS, offsetof(struct arm_smccc_quirk, id));
  	DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS, offsetof(struct arm_smccc_quirk, st=
ate));
-+	#ifdef CONFIG_ARM64
-+		DEFINE(ARM_SMCCC_1_2_REGS_X0_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a0));
-+		DEFINE(ARM_SMCCC_1_2_REGS_X2_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a2));
-+		DEFINE(ARM_SMCCC_1_2_REGS_X4_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a4));
-+		DEFINE(ARM_SMCCC_1_2_REGS_X6_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a6));
-+		DEFINE(ARM_SMCCC_1_2_REGS_X8_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a8));
-+		DEFINE(ARM_SMCCC_1_2_REGS_X10_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a10));
-+		DEFINE(ARM_SMCCC_1_2_REGS_X12_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a12));
-+		DEFINE(ARM_SMCCC_1_2_REGS_X14_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a14));
-+		DEFINE(ARM_SMCCC_1_2_REGS_X16_OFFS,	offsetof(struct arm_smccc_1_2_reg=
s, a16));
-+	#endif
++#ifdef CONFIG_ARM64
++	DEFINE(ARM_SMCCC_1_2_REGS_X0_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a0));
++	DEFINE(ARM_SMCCC_1_2_REGS_X2_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a2));
++	DEFINE(ARM_SMCCC_1_2_REGS_X4_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a4));
++	DEFINE(ARM_SMCCC_1_2_REGS_X6_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a6));
++	DEFINE(ARM_SMCCC_1_2_REGS_X8_OFFS,	offsetof(struct arm_smccc_1_2_regs,=
 a8));
++	DEFINE(ARM_SMCCC_1_2_REGS_X10_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a10));
++	DEFINE(ARM_SMCCC_1_2_REGS_X12_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a12));
++	DEFINE(ARM_SMCCC_1_2_REGS_X14_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a14));
++	DEFINE(ARM_SMCCC_1_2_REGS_X16_OFFS,	offsetof(struct arm_smccc_1_2_regs=
, a16));
++#endif
  #endif
 =20
  	return 0;
 diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index 7f2be23394..dae58d3476 100644
+index e1d09884a1..9105031d55 100644
 --- a/include/linux/arm-smccc.h
 +++ b/include/linux/arm-smccc.h
 @@ -1,6 +1,8 @@
@@ -151,7 +158,7 @@ index 7f2be23394..dae58d3476 100644
   */
  #ifndef __LINUX_ARM_SMCCC_H
  #define __LINUX_ARM_SMCCC_H
-@@ -66,6 +68,47 @@ struct arm_smccc_res {
+@@ -70,6 +72,47 @@ struct arm_smccc_res {
  	unsigned long a3;
  };
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd=
-load-add-load-command-for-memory-mapped.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0001-cmd-load-add-load-command-for-memory-map=
ped.patch
deleted file mode 100644
index 4d7c51fc..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-cmd-load-a=
dd-load-command-for-memory-mapped.patch
+++ /dev/null
@@ -1,186 +0,0 @@
-From 910760408430de32ad08b1e5ddf894cc9f2f3d0c Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 24 Jun 2021 09:25:00 +0100
-Subject: [PATCH 01/26] cmd: load: add load command for memory mapped
-
-cp.b is used a lot as a way to load binaries to memory and execute
-them, however we may need to integrate this with the efi subsystem to
-set it up as a bootdev.
-
-So, introduce a loadm command that will be consistent with the other
-loadX commands and will call the efi API's.
-
-ex: loadm $kernel_addr $kernel_addr_r $kernel_size
-
-with this a kernel with CONFIG_EFI_STUB enabled will be loaded and
-then subsequently booted with bootefi command.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Accepted [2022.10-rc1]
----
- README                           |  1 +
- cmd/Kconfig                      |  6 ++++
- cmd/bootefi.c                    | 12 ++++++++
- cmd/load.c                       | 48 ++++++++++++++++++++++++++++++++
- include/efi_loader.h             |  2 ++
- lib/efi_loader/efi_device_path.c |  9 ++++++
- 6 files changed, 78 insertions(+)
-
-diff --git a/README b/README
-index b7ab6e5070..cd76f95e74 100644
---- a/README
-+++ b/README
-@@ -2578,6 +2578,7 @@ rarpboot- boot image via network using RARP/TFTP p=
rotocol
- diskboot- boot from IDE devicebootd   - boot default, i.e., run 'bootcm=
d'
- loads	- load S-Record file over serial line
- loadb	- load binary file over serial line (kermit mode)
-+loadm   - load binary blob from source address to destination address
- md	- memory display
- mm	- memory modify (auto-incrementing)
- nm	- memory modify (constant address)
-diff --git a/cmd/Kconfig b/cmd/Kconfig
-index 09193b61b9..ba2f321ae9 100644
---- a/cmd/Kconfig
-+++ b/cmd/Kconfig
-@@ -1143,6 +1143,12 @@ config CMD_LOADB
- 	help
- 	  Load a binary file over serial line.
-=20
-+config CMD_LOADM
-+	bool "loadm"
-+	default y
-+	help
-+	  Load a binary over memory mapped.
-+
- config CMD_LOADS
- 	bool "loads"
- 	default y
-diff --git a/cmd/bootefi.c b/cmd/bootefi.c
-index 827fcd97df..37ce659fa1 100644
---- a/cmd/bootefi.c
-+++ b/cmd/bootefi.c
-@@ -34,6 +34,18 @@ static struct efi_device_path *bootefi_device_path;
- static void *image_addr;
- static size_t image_size;
-=20
-+/**
-+ * efi_get_image_parameters() - return image parameters
-+ *
-+ * @img_addr:		address of loaded image in memory
-+ * @img_size:		size of loaded image
-+ */
-+void efi_get_image_parameters(void **img_addr, size_t *img_size)
-+{
-+	*img_addr =3D image_addr;
-+	*img_size =3D image_size;
-+}
-+
- /**
-  * efi_clear_bootdev() - clear boot device
-  */
-diff --git a/cmd/load.c b/cmd/load.c
-index 7e4a552d90..1224a7f85b 100644
---- a/cmd/load.c
-+++ b/cmd/load.c
-@@ -1063,6 +1063,44 @@ static ulong load_serial_ymodem(ulong offset, int=
 mode)
-=20
- #endif
-=20
-+#if defined(CONFIG_CMD_LOADM)
-+static int do_load_memory_bin(struct cmd_tbl *cmdtp, int flag, int argc=
,
-+			      char *const argv[])
-+{
-+	ulong	addr, dest, size;
-+	void	*src, *dst;
-+
-+	if (argc !=3D 4)
-+		return CMD_RET_USAGE;
-+
-+	addr =3D simple_strtoul(argv[1], NULL, 16);
-+
-+	dest =3D simple_strtoul(argv[2], NULL, 16);
-+
-+	size =3D simple_strtoul(argv[3], NULL, 16);
-+
-+	if (!size) {
-+		printf("loadm: can not load zero bytes\n");
-+		return 1;
-+	}
-+
-+	src =3D map_sysmem(addr, size);
-+	dst =3D map_sysmem(dest, size);
-+
-+	memcpy(dst, src, size);
-+
-+	unmap_sysmem(src);
-+	unmap_sysmem(dst);
-+
-+	if (IS_ENABLED(CONFIG_CMD_BOOTEFI))
-+		efi_set_bootdev("Mem", "", "", map_sysmem(dest, 0), size);
-+
-+	printf("loaded bin to memory: size: %lu\n", size);
-+
-+	return 0;
-+}
-+#endif
-+
- /* --------------------------------------------------------------------=
 */
-=20
- #if defined(CONFIG_CMD_LOADS)
-@@ -1137,3 +1175,13 @@ U_BOOT_CMD(
- );
-=20
- #endif	/* CONFIG_CMD_LOADB */
-+
-+#if defined(CONFIG_CMD_LOADM)
-+U_BOOT_CMD(
-+	loadm, 4, 0,	do_load_memory_bin,
-+	"load binary blob from source address to destination address",
-+	"[src_addr] [dst_addr] [size]\n"
-+	"     - load a binary blob from one memory location to other"
-+	" from src_addr to dst_addr by size bytes"
-+);
-+#endif /* CONFIG_CMD_LOADM */
-diff --git a/include/efi_loader.h b/include/efi_loader.h
-index 11930fbea8..5b41985244 100644
---- a/include/efi_loader.h
-+++ b/include/efi_loader.h
-@@ -591,6 +591,8 @@ efi_status_t efi_load_pe(struct efi_loaded_image_obj=
 *handle,
- void efi_save_gd(void);
- /* Call this to relocate the runtime section to an address space */
- void efi_runtime_relocate(ulong offset, struct efi_mem_desc *map);
-+/* Call this to get image parameters */
-+void efi_get_image_parameters(void **img_addr, size_t *img_size);
- /* Add a new object to the object list. */
- void efi_add_handle(efi_handle_t obj);
- /* Create handle */
-diff --git a/lib/efi_loader/efi_device_path.c b/lib/efi_loader/efi_devic=
e_path.c
-index 171661b897..2493d74326 100644
---- a/lib/efi_loader/efi_device_path.c
-+++ b/lib/efi_loader/efi_device_path.c
-@@ -1158,6 +1158,8 @@ efi_status_t efi_dp_from_name(const char *dev, con=
st char *devnr,
- {
- 	struct blk_desc *desc =3D NULL;
- 	struct disk_partition fs_partition;
-+	size_t image_size;
-+	void *image_addr;
- 	int part =3D 0;
- 	char *filename;
- 	char *s;
-@@ -1173,6 +1175,13 @@ efi_status_t efi_dp_from_name(const char *dev, co=
nst char *devnr,
- 	} else if (!strcmp(dev, "Uart")) {
- 		if (device)
- 			*device =3D efi_dp_from_uart();
-+	} else if (!strcmp(dev, "Mem")) {
-+		efi_get_image_parameters(&image_addr, &image_size);
-+
-+		if (device)
-+			*device =3D efi_dp_from_mem(EFI_RESERVED_MEMORY_TYPE,
-+						  (uintptr_t)image_addr,
-+						  image_size);
- 	} else {
- 		part =3D blk_get_device_part_str(dev, devnr, &desc, &fs_partition,
- 					       1);
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm=
-add-support-to-corstone1000-platform.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0002-arm-add-support-to-corstone1000-platform.pa=
tch
deleted file mode 100644
index 4c7c9b14..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-add-su=
pport-to-corstone1000-platform.patch
+++ /dev/null
@@ -1,682 +0,0 @@
-From 3523b1bac430f10f02a31f7d013ea369e29656be Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 15 Feb 2022 09:44:10 +0000
-Subject: [PATCH 02/26] arm: add support to corstone1000 platform
-
-Corstone1000 is a platform from arm, which includes pre
-verified Corstone SSE710 sub-system that combines Cortex-A and
-Cortex-M processors [0].
-
-This code adds the support for the Cortex-A35 implementation
-at host side, it contains also the necessary bits to support
-the Corstone 1000 FVP (Fixed Virtual Platform) [1] and also the
-FPGA MPS3 board implementation of this platform. [2]
-
-0: https://documentation-service.arm.com/static/619e02b1f45f0b1fbf3a8f16
-1: https://developer.arm.com/tools-and-software/open-source-software/arm=
-platforms-software/arm-ecosystem-fvps
-2: https://documentation-service.arm.com/static/61f3f4d7fa8173727a1b71bf
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Accepted [2022.10-rc1]
----
- arch/arm/Kconfig                         |   8 ++
- arch/arm/dts/Makefile                    |   3 +
- arch/arm/dts/corstone1000-fvp.dts        |  23 +++
- arch/arm/dts/corstone1000-mps3.dts       |  32 +++++
- arch/arm/dts/corstone1000.dtsi           | 169 +++++++++++++++++++++++
- board/armltd/corstone1000/Kconfig        |  12 ++
- board/armltd/corstone1000/MAINTAINERS    |   7 +
- board/armltd/corstone1000/Makefile       |   7 +
- board/armltd/corstone1000/corstone1000.c | 125 +++++++++++++++++
- configs/corstone1000_defconfig           |  80 +++++++++++
- include/configs/corstone1000.h           |  86 ++++++++++++
- 11 files changed, 552 insertions(+)
- create mode 100644 arch/arm/dts/corstone1000-fvp.dts
- create mode 100644 arch/arm/dts/corstone1000-mps3.dts
- create mode 100644 arch/arm/dts/corstone1000.dtsi
- create mode 100644 board/armltd/corstone1000/Kconfig
- create mode 100644 board/armltd/corstone1000/MAINTAINERS
- create mode 100644 board/armltd/corstone1000/Makefile
- create mode 100644 board/armltd/corstone1000/corstone1000.c
- create mode 100644 configs/corstone1000_defconfig
- create mode 100644 include/configs/corstone1000.h
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 9898c7d68e..2fc2b7d20f 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -1347,6 +1347,12 @@ config ARCH_VEXPRESS64
- 	select ENV_IS_IN_FLASH if MTD
- 	imply DISTRO_DEFAULTS
-=20
-+config TARGET_CORSTONE1000
-+	bool "Support Corstone1000 Platform"
-+	select ARM64
-+	select PL01X_SERIAL
-+	select DM
-+
- config TARGET_TOTAL_COMPUTE
- 	bool "Support Total Compute Platform"
- 	select ARM64
-@@ -2295,6 +2301,8 @@ source "arch/arm/mach-npcm/Kconfig"
-=20
- source "board/armltd/total_compute/Kconfig"
-=20
-+source "board/armltd/corstone1000/Kconfig"
-+
- source "board/bosch/shc/Kconfig"
- source "board/bosch/guardian/Kconfig"
- source "board/Marvell/octeontx/Kconfig"
-diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
-index a7e0d9f6c0..8c8f15b6a8 100644
---- a/arch/arm/dts/Makefile
-+++ b/arch/arm/dts/Makefile
-@@ -1265,6 +1265,9 @@ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) +=3D lpc32=
50-ea3250.dtb
-=20
- dtb-$(CONFIG_ARCH_QEMU) +=3D qemu-arm.dtb qemu-arm64.dtb
-=20
-+dtb-$(CONFIG_TARGET_CORSTONE1000) +=3D corstone1000-mps3.dtb \
-+				     corstone1000-fvp.dtb
-+
- include $(srctree)/scripts/Makefile.dts
-=20
- targets +=3D $(dtb-y)
-diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
-new file mode 100644
-index 0000000000..1fcc137a49
---- /dev/null
-+++ b/arch/arm/dts/corstone1000-fvp.dts
-@@ -0,0 +1,23 @@
-+// SPDX-License-Identifier: GPL-2.0 or MIT
-+/*
-+ * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ * Copyright (c) 2022, Linaro Limited. All rights reserved.
-+ *
-+ */
-+
-+/dts-v1/;
-+
-+#include "corstone1000.dtsi"
-+
-+/ {
-+	model =3D "ARM Corstone1000 FVP (Fixed Virtual Platform)";
-+	compatible =3D "arm,corstone1000-fvp";
-+
-+	smsc: ethernet@4010000 {
-+		compatible =3D "smsc,lan91c111";
-+		reg =3D <0x40100000 0x10000>;
-+		phy-mode =3D "mii";
-+		interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
-+		reg-io-width =3D <2>;
-+	};
-+};
-diff --git a/arch/arm/dts/corstone1000-mps3.dts b/arch/arm/dts/corstone1=
000-mps3.dts
-new file mode 100644
-index 0000000000..e3146747c2
---- /dev/null
-+++ b/arch/arm/dts/corstone1000-mps3.dts
-@@ -0,0 +1,32 @@
-+// SPDX-License-Identifier: GPL-2.0 or MIT
-+/*
-+ * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ * Copyright (c) 2022, Linaro Limited. All rights reserved.
-+ *
-+ */
-+
-+/dts-v1/;
-+
-+#include "corstone1000.dtsi"
-+
-+/ {
-+	model =3D "ARM Corstone1000 FPGA MPS3 board";
-+	compatible =3D "arm,corstone1000-mps3";
-+
-+	smsc: ethernet@4010000 {
-+		compatible =3D "smsc,lan9220", "smsc,lan9115";
-+		reg =3D <0x40100000 0x10000>;
-+		phy-mode =3D "mii";
-+		interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
-+		reg-io-width =3D <2>;
-+		smsc,irq-push-pull;
-+	};
-+
-+	usb_host: usb@40200000 {
-+		compatible =3D "nxp,usb-isp1763";
-+		reg =3D <0x40200000 0x100000>;
-+		interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-+		bus-width =3D <16>;
-+		dr_mode =3D "host";
-+	};
-+};
-diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-new file mode 100644
-index 0000000000..d0194aa893
---- /dev/null
-+++ b/arch/arm/dts/corstone1000.dtsi
-@@ -0,0 +1,169 @@
-+// SPDX-License-Identifier: GPL-2.0 or MIT
-+/*
-+ * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ * Copyright (c) 2022, Linaro Limited. All rights reserved.
-+ *
-+ */
-+
-+#include <dt-bindings/interrupt-controller/arm-gic.h>
-+
-+/ {
-+	interrupt-parent =3D <&gic>;
-+	#address-cells =3D <1>;
-+	#size-cells =3D <1>;
-+
-+	aliases {
-+		serial0 =3D &uart0;
-+		serial1 =3D &uart1;
-+	};
-+
-+	chosen {
-+		stdout-path =3D "serial0:115200n8";
-+	};
-+
-+	cpus {
-+		#address-cells =3D <1>;
-+		#size-cells =3D <0>;
-+
-+		cpu: cpu@0 {
-+			device_type =3D "cpu";
-+			compatible =3D "arm,cortex-a35";
-+			reg =3D <0>;
-+			next-level-cache =3D <&L2_0>;
-+		};
-+	};
-+
-+	memory@88200000 {
-+		device_type =3D "memory";
-+		reg =3D <0x88200000 0x77e00000>;
-+	};
-+
-+	gic: interrupt-controller@1c000000 {
-+		compatible =3D "arm,gic-400";
-+		#interrupt-cells =3D <3>;
-+		#address-cells =3D <0>;
-+		interrupt-controller;
-+		reg =3D	<0x1c010000 0x1000>,
-+			<0x1c02f000 0x2000>,
-+			<0x1c04f000 0x1000>,
-+			<0x1c06f000 0x2000>;
-+		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) |
-+			      IRQ_TYPE_LEVEL_LOW)>;
-+	};
-+
-+	L2_0: l2-cache0 {
-+		compatible =3D "cache";
-+		cache-level =3D <2>;
-+		cache-size =3D <0x80000>;
-+		cache-line-size =3D <64>;
-+		cache-sets =3D <1024>;
-+	};
-+
-+	refclk100mhz: refclk100mhz {
-+		compatible =3D "fixed-clock";
-+		#clock-cells =3D <0>;
-+		clock-frequency =3D <100000000>;
-+		clock-output-names =3D "apb_pclk";
-+	};
-+
-+	smbclk: refclk24mhzx2 {
-+		/* Reference 24MHz clock x 2 */
-+		compatible =3D "fixed-clock";
-+		#clock-cells =3D <0>;
-+		clock-frequency =3D <48000000>;
-+		clock-output-names =3D "smclk";
-+	};
-+
-+	timer {
-+		compatible =3D "arm,armv8-timer";
-+		interrupts =3D	<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) |
-+				 IRQ_TYPE_LEVEL_LOW)>,
-+				<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) |
-+				 IRQ_TYPE_LEVEL_LOW)>,
-+				<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) |
-+				 IRQ_TYPE_LEVEL_LOW)>,
-+				<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) |
-+				 IRQ_TYPE_LEVEL_LOW)>;
-+	};
-+
-+	uartclk: uartclk {
-+		/* UART clock - 50MHz */
-+		compatible =3D "fixed-clock";
-+		#clock-cells =3D <0>;
-+		clock-frequency =3D <50000000>;
-+		clock-output-names =3D "uartclk";
-+	};
-+
-+	psci {
-+		compatible =3D "arm,psci-1.0", "arm,psci-0.2";
-+		method =3D "smc";
-+	};
-+
-+	soc {
-+		compatible =3D "simple-bus";
-+		#address-cells =3D <1>;
-+		#size-cells =3D <1>;
-+		interrupt-parent =3D <&gic>;
-+		ranges;
-+
-+		timer@1a220000 {
-+			compatible =3D "arm,armv7-timer-mem";
-+			reg =3D <0x1a220000 0x1000>;
-+			#address-cells =3D <1>;
-+			#size-cells =3D <1>;
-+			clock-frequency =3D <50000000>;
-+			ranges;
-+
-+			frame@1a230000 {
-+				frame-number =3D <0>;
-+				interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-+				reg =3D <0x1a230000 0x1000>;
-+			};
-+		};
-+
-+		uart0: serial@1a510000 {
-+			compatible =3D "arm,pl011", "arm,primecell";
-+			reg =3D <0x1a510000 0x1000>;
-+			interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
-+			clocks =3D <&uartclk>, <&refclk100mhz>;
-+			clock-names =3D "uartclk", "apb_pclk";
-+		};
-+
-+		uart1: serial@1a520000 {
-+			compatible =3D "arm,pl011", "arm,primecell";
-+			reg =3D <0x1a520000 0x1000>;
-+			interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-+			clocks =3D <&uartclk>, <&refclk100mhz>;
-+			clock-names =3D "uartclk", "apb_pclk";
-+		};
-+
-+		mhu_hse1: mailbox@1b820000 {
-+			compatible =3D "arm,mhuv2-tx", "arm,primecell";
-+			reg =3D <0x1b820000 0x1000>;
-+			clocks =3D <&refclk100mhz>;
-+			clock-names =3D "apb_pclk";
-+			interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-+			#mbox-cells =3D <2>;
-+			arm,mhuv2-protocols =3D <0 0>;
-+			secure-status =3D "okay";     /* secure-world-only */
-+			status =3D "disabled";
-+		};
-+
-+		mhu_seh1: mailbox@1b830000 {
-+			compatible =3D "arm,mhuv2-rx", "arm,primecell";
-+			reg =3D <0x1b830000 0x1000>;
-+			clocks =3D <&refclk100mhz>;
-+			clock-names =3D "apb_pclk";
-+			interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-+			#mbox-cells =3D <2>;
-+			arm,mhuv2-protocols =3D <0 0>;
-+			secure-status =3D "okay";     /* secure-world-only */
-+			status =3D "disabled";
-+		};
-+	};
-+
-+	arm_ffa: arm_ffa {
-+		compatible =3D "arm,ffa";
-+		method =3D "smc";
-+	};
-+};
-diff --git a/board/armltd/corstone1000/Kconfig b/board/armltd/corstone10=
00/Kconfig
-new file mode 100644
-index 0000000000..709674d4cf
---- /dev/null
-+++ b/board/armltd/corstone1000/Kconfig
-@@ -0,0 +1,12 @@
-+if TARGET_CORSTONE1000
-+
-+config SYS_BOARD
-+	default "corstone1000"
-+
-+config SYS_VENDOR
-+	default "armltd"
-+
-+config SYS_CONFIG_NAME
-+	default "corstone1000"
-+
-+endif
-diff --git a/board/armltd/corstone1000/MAINTAINERS b/board/armltd/corsto=
ne1000/MAINTAINERS
-new file mode 100644
-index 0000000000..8c905686de
---- /dev/null
-+++ b/board/armltd/corstone1000/MAINTAINERS
-@@ -0,0 +1,7 @@
-+CORSTONE1000 BOARD
-+M:	Rui Miguel Silva <rui.silva@linaro.org>
-+M:	Vishnu Banavath <vishnu.banavath@arm.com>
-+S:	Maintained
-+F:	board/armltd/corstone1000/
-+F:	include/configs/corstone1000.h
-+F:	configs/corstone1000_defconfig
-diff --git a/board/armltd/corstone1000/Makefile b/board/armltd/corstone1=
000/Makefile
-new file mode 100644
-index 0000000000..77a82c2892
---- /dev/null
-+++ b/board/armltd/corstone1000/Makefile
-@@ -0,0 +1,7 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# (C) Copyright 2022 Arm Limited
-+# (C) Copyright 2022 Linaro
-+# Rui Miguel Silva <rui.silva@linaro.org>
-+
-+obj-y	:=3D corstone1000.o
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-new file mode 100644
-index 0000000000..2fa485ff37
---- /dev/null
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -0,0 +1,125 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * (C) Copyright 2022 Linaro
-+ * Rui Miguel Silva <rui.silva@linaro.org>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <dm/platform_data/serial_pl01x.h>
-+#include <asm/armv8/mmu.h>
-+#include <asm/global_data.h>
-+
-+
-+static const struct pl01x_serial_plat serial_plat =3D {
-+	.base =3D V2M_UART0,
-+	.type =3D TYPE_PL011,
-+	.clock =3D CONFIG_PL011_CLOCK,
-+};
-+
-+U_BOOT_DRVINFO(corstone1000_serials) =3D {
-+	.name =3D "serial_pl01x",
-+	.plat =3D &serial_plat,
-+};
-+
-+static struct mm_region corstone1000_mem_map[] =3D {
-+	{
-+		/* CVM */
-+		.virt =3D 0x02000000UL,
-+		.phys =3D 0x02000000UL,
-+		.size =3D 0x02000000UL,
-+		.attrs =3D PTE_BLOCK_MEMTYPE(MT_NORMAL) |
-+			 PTE_BLOCK_INNER_SHARE
-+	}, {
-+		/* QSPI */
-+		.virt =3D 0x08000000UL,
-+		.phys =3D 0x08000000UL,
-+		.size =3D 0x08000000UL,
-+		.attrs =3D PTE_BLOCK_MEMTYPE(MT_NORMAL) |
-+			 PTE_BLOCK_INNER_SHARE
-+	}, {
-+		/* Host Peripherals */
-+		.virt =3D 0x1A000000UL,
-+		.phys =3D 0x1A000000UL,
-+		.size =3D 0x26000000UL,
-+		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+			 PTE_BLOCK_NON_SHARE |
-+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+        }, {
-+                /* USB */
-+                .virt =3D 0x40200000UL,
-+                .phys =3D 0x40200000UL,
-+                .size =3D 0x00100000UL,
-+                .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+                         PTE_BLOCK_NON_SHARE |
-+                         PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+	}, {
-+                 /* ethernet */
-+                .virt =3D 0x40100000UL,
-+                .phys =3D 0x40100000UL,
-+                .size =3D 0x00100000UL,
-+                .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+                         PTE_BLOCK_NON_SHARE |
-+                         PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+	}, {
-+		/* OCVM */
-+		.virt =3D 0x80000000UL,
-+		.phys =3D 0x80000000UL,
-+		.size =3D 0x80000000UL,
-+		.attrs =3D PTE_BLOCK_MEMTYPE(MT_NORMAL) |
-+			 PTE_BLOCK_INNER_SHARE
-+	}, {
-+		/* List terminator */
-+		0,
-+	}
-+};
-+
-+struct mm_region *mem_map =3D corstone1000_mem_map;
-+
-+void set_dfu_alt_info(char *interface, char *devstr)
-+{
-+}
-+
-+int board_init(void)
-+{
-+	return 0;
-+}
-+
-+int dram_init(void)
-+{
-+	gd->ram_size =3D PHYS_SDRAM_1_SIZE;
-+
-+	return 0;
-+}
-+
-+int dram_init_banksize(void)
-+{
-+	gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
-+	gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
-+
-+	return 0;
-+}
-+
-+/*
-+ * Board specific ethernet initialization routine.
-+ * */
-+int board_eth_init(struct bd_info *bis)
-+{
-+	int rc =3D 0;
-+
-+#ifndef CONFIG_DM_ETH
-+#ifdef CONFIG_SMC91111
-+	rc =3D smc91111_initialize(0, CONFIG_SMC91111_BASE);
-+#endif
-+#ifdef CONFIG_SMC911X
-+	rc =3D smc911x_initialize(0, CONFIG_SMC911X_BASE);
-+#endif
-+#endif
-+
-+	return rc;
-+}
-+
-+void reset_cpu(ulong addr)
-+{
-+}
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-new file mode 100644
-index 0000000000..02f931b0d4
---- /dev/null
-+++ b/configs/corstone1000_defconfig
-@@ -0,0 +1,80 @@
-+CONFIG_ARM=3Dy
-+CONFIG_TARGET_CORSTONE1000=3Dy
-+CONFIG_SYS_TEXT_BASE=3D0x80000000
-+CONFIG_SYS_MALLOC_F_LEN=3D0x2000
-+CONFIG_SYS_MALLOC_LEN=3D0x2000000
-+CONFIG_SYS_LOAD_ADDR=3D0x82100000
-+CONFIG_NR_DRAM_BANKS=3D1
-+CONFIG_IDENT_STRING=3D" corstone1000 aarch64 "
-+CONFIG_FIT=3Dy
-+CONFIG_BOOTDELAY=3D3
-+CONFIG_USE_BOOTARGS=3Dy
-+CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
-+CONFIG_LOGLEVEL=3D7
-+# CONFIG_DISPLAY_CPUINFO is not set
-+# CONFIG_DISPLAY_BOARDINFO is not set
-+CONFIG_HUSH_PARSER=3Dy
-+CONFIG_SYS_PROMPT=3D"corstone1000# "
-+# CONFIG_CMD_CONSOLE is not set
-+CONFIG_CMD_BOOTZ=3Dy
-+CONFIG_CMD_BOOTM=3Dy
-+CONFIG_CMD_LOADM=3Dy
-+CONFIG_CMD_BOOTEFI=3Dy
-+CONFIG_EFI_LOADER=3Dy
-+CONFIG_EFI_PARTITION=3Dy
-+CONFIG_CMD_BOOTEFI_HELLO_COMPILE=3Dy
-+CONFIG_CMD_BOOTEFI_HELLO=3Dy
-+# CONFIG_CMD_XIMG is not set
-+# CONFIG_CMD_ENV_EXISTS is not set
-+CONFIG_CMD_NVEDIT_EFI=3Dy
-+# CONFIG_CMD_LOADS is not set
-+CONFIG_CMD_USB=3Dy
-+CONFIG_CMD_ITEST=3Dy
-+# CONFIG_CMD_SETEXPR is not set
-+# CONFIG_CMD_NFS is not set
-+CONFIG_CMD_MII=3Dy
-+CONFIG_CMD_CACHE=3Dy
-+CONFIG_CMD_EFIDEBUG=3Dy
-+CONFIG_CMD_FAT=3Dy
-+CONFIG_OF_CONTROL=3Dy
-+CONFIG_REGMAP=3Dy
-+# CONFIG_MMC is not set
-+CONFIG_DM_SERIAL=3Dy
-+CONFIG_USB=3Dy
-+CONFIG_DM_USB=3Dy
-+CONFIG_USB_STORAGE=3Dy
-+CONFIG_EFI_MM_COMM_TEE=3Dy
-+# CONFIG_OPTEE is not set
-+# CONFIG_GENERATE_SMBIOS_TABLE is not set
-+# CONFIG_HEXDUMP is not set
-+CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
-+CONFIG_EFI_CAPSULE_ON_DISK=3Dy
-+# CONFIG_EFI_CAPSULE_ON_DISK_EARLY is not set
-+# CONFIG_EFI_CAPSULE_AUTHENTICATE is not set
-+CONFIG_EFI_HAVE_CAPSULE_SUPPORT=3Dy
-+CONFIG_EFI_CAPSULE_FIRMWARE_FIT=3Dy
-+CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
-+CONFIG_EFI_SECURE_BOOT=3Dy
-+CONFIG_DM_RTC=3Dy
-+CONFIG_CMD_RTC=3Dy
-+CONFIG_EFI_GET_TIME=3Dy
-+CONFIG_EFI_SET_TIME=3Dy
-+CONFIG_RTC_EMULATION=3Dy
-+CONFIG_PSCI_RESET=3Dy
-+CONFIG_DISTRO_DEFAULTS=3Dy
-+CONFIG_CMD_DHCP=3Dy
-+CONFIG_SMC911X=3Dy
-+CONFIG_SMC911X_BASE=3D0x40100000
-+CONFIG_DM_ETH=3Dy
-+CONFIG_PHY_SMSC=3Dy
-+CONFIG_CMD_BOOTEFI_SELFTEST=3Dy
-+CONFIG_CMD_TIME=3Dy
-+CONFIG_CMD_GETTIME=3Dy
-+CONFIG_NET_RANDOM_ETHADDR=3Dy
-+CONFIG_VERSION_VARIABLE=3Dy
-+CONFIG_PHYLIB=3Dy
-+CONFIG_PHY=3Dy
-+CONFIG_RAM=3Dy
-+CONFIG_ERRNO_STR=3Dy
-+CONFIG_CMD_EDITENV=3Dy
-+CONFIG_MISC=3Dy
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-new file mode 100644
-index 0000000000..cf166f107e
---- /dev/null
-+++ b/include/configs/corstone1000.h
-@@ -0,0 +1,86 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * (C) Copyright 2022 Linaro
-+ * Rui Miguel Silva <rui.silva@linaro.org>
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ *
-+ * Configuration for Corstone1000. Parts were derived from other ARM
-+ * configurations.
-+ */
-+
-+#ifndef __CORSTONE1000_H
-+#define __CORSTONE1000_H
-+
-+#include <linux/sizes.h>
-+
-+#define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
-+#define CONFIG_SKIP_LOWLEVEL_INIT
-+
-+#define CONFIG_SYS_HZ		1000
-+
-+#define V2M_SRAM0		0x02000000
-+#define V2M_QSPI		0x08000000
-+
-+#define V2M_DEBUG		0x10000000
-+#define V2M_BASE_PERIPH		0x1A000000
-+
-+#define V2M_BASE		0x80000000
-+
-+#define V2M_PERIPH_OFFSET(x)	(x << 16)
-+
-+#define V2M_SYSID		(V2M_BASE_PERIPH)
-+#define V2M_SYSCTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
-+
-+#define V2M_COUNTER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
-+#define V2M_COUNTER_READ	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
-+
-+#define V2M_TIMER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
-+#define V2M_TIMER_BASE0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
-+
-+#define V2M_UART0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(81))
-+#define V2M_UART1		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(82))
-+
-+#define CONFIG_PL011_CLOCK	50000000
-+
-+/* Physical Memory Map */
-+#define PHYS_SDRAM_1		(V2M_BASE)
-+#define PHYS_SDRAM_1_SIZE	0x80000000
-+
-+#define CONFIG_ENV_SECT_SIZE	SZ_64K
-+
-+#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
-+
-+/* Monitor Command Prompt */
-+#define CONFIG_SYS_CBSIZE	512	/* Console I/O Buffer Size */
-+#define CONFIG_SYS_MAXARGS	64	/* max command args */
-+
-+#define CONFIG_EXTRA_ENV_SETTINGS							\
-+				"usb_pgood_delay=3D250\0"					\
-+				"boot_bank_flag=3D0x08002000\0"				\
-+				"kernel_addr_bank_0=3D0x083EE000\0"			\
-+				"kernel_addr_bank_1=3D0x0936E000\0"			\
-+				"retrieve_kernel_load_addr=3D"				\
-+					"if itest.l *${boot_bank_flag} =3D=3D 0; then "	\
-+					    "setenv kernel_addr $kernel_addr_bank_0;"	\
-+					"else "						\
-+					    "setenv kernel_addr $kernel_addr_bank_1;"	\
-+					"fi;"						\
-+					"\0"						\
-+				"kernel_addr_r=3D0x88200000\0"				\
-+				"fdt_high=3D0xffffffff\0"
-+
-+/*
-+ * config_distro_bootcmd define the boot command to distro_bootcmd, but=
 we here
-+ * want to first try to load a kernel if exists, override that config t=
hen
-+ */
-+#undef CONFIG_BOOTCOMMAND
-+
-+#define CONFIG_BOOTCOMMAND								\
-+				"run retrieve_kernel_load_addr;"			\
-+				"echo Loading kernel from $kernel_addr to memory ... ;"	\
-+				"loadm $kernel_addr $kernel_addr_r 0xc00000;"		\
-+				"usb start; usb reset;"					\
-+				"run distro_bootcmd;"					\
-+				"bootefi $kernel_addr_r $fdtcontroladdr;"
-+#endif
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib=
-uuid-introduce-uuid_str_to_le_bin-function.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0002-lib-uuid-introduce-uuid_str_to_le_bin=
-function.patch
new file mode 100644
index 00000000..1b043dd5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib-uuid-i=
ntroduce-uuid_str_to_le_bin-function.patch
@@ -0,0 +1,132 @@
+From b226e6000de0b1f55d56c1193d1fde028d64abd3 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 4 Aug 2022 16:46:47 +0100
+Subject: [PATCH 02/25] lib: uuid: introduce uuid_str_to_le_bin function
+
+convert UUID string to little endian binary data
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
+
+Changelog:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+v8:
+
+* use simple_strtoull() in uuid_str_to_le_bin() to support 32-bit platfo=
rms
+
+v7:
+
+* rename be_uuid_str_to_le_bin() to uuid_str_to_le_bin()
+* make uuid_str_to_le_bin() implementation similar to uuid_str_to_bin()
+  by using same APIs
+
+v4:
+
+* rename ffa_uuid_str_to_bin to be_uuid_str_to_le_bin and put in
+  a standalone commit (the current)
+
+v3:
+
+* introduce ffa_uuid_str_to_bin (provided by
+  arm_ffa: introduce Arm FF-A low-level driver)
+---
+ include/uuid.h |  8 ++++++++
+ lib/uuid.c     | 46 ++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 54 insertions(+)
+
+diff --git a/include/uuid.h b/include/uuid.h
+index 4a4883d3b5..293a8eb0a5 100644
+--- a/include/uuid.h
++++ b/include/uuid.h
+@@ -2,6 +2,8 @@
+ /*
+  * Copyright (C) 2014 Samsung Electronics
+  * Przemyslaw Marczak <p.marczak@samsung.com>
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+ #ifndef __UUID_H__
+ #define __UUID_H__
+@@ -44,4 +46,10 @@ int uuid_guid_get_bin(const char *guid_str, unsigned =
char *guid_bin);
+ const char *uuid_guid_get_str(const unsigned char *guid_bin);
+ void gen_rand_uuid(unsigned char *uuid_bin);
+ void gen_rand_uuid_str(char *uuid_str, int str_format);
++
++/**
++ * uuid_str_to_le_bin - Converts a UUID string to little endian binary =
data
++ */
++int uuid_str_to_le_bin(const char *uuid_str, unsigned char *uuid_bin);
++
+ #endif
+diff --git a/lib/uuid.c b/lib/uuid.c
+index 465e1ac38f..d29f561a70 100644
+--- a/lib/uuid.c
++++ b/lib/uuid.c
+@@ -1,6 +1,8 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+  * Copyright 2011 Calxeda, Inc.
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+=20
+ #include <common.h>
+@@ -346,6 +348,50 @@ int uuid_str_to_bin(const char *uuid_str, unsigned =
char *uuid_bin,
+ 	return 0;
+ }
+=20
++/**
++ * uuid_str_to_le_bin() - Convert string UUID to little endian binary d=
ata.
++ * @uuid_str:	pointer to UUID string
++ * @uuid_bin:	pointer to allocated array for little endian output [16B]
++ *
++ * UUID string is 36 characters (36 bytes):
++ *
++ * xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
++ *
++ * where x is a hexadecimal character. Fields are separated by '-'s.
++ * When converting to a little endian binary UUID, the string fields ar=
e reversed.
++ *
++ * Return:
++ *
++ *    uuid_bin filled with little endian UUID data
++ *    On success 0 is returned. Otherwise, failure code.
++ */
++int uuid_str_to_le_bin(const char *uuid_str, unsigned char *uuid_bin)
++{
++	u16 tmp16;
++	u32 tmp32;
++	u64 tmp64;
++
++	if (!uuid_str_valid(uuid_str) || !uuid_bin)
++		return -EINVAL;
++
++	tmp32 =3D cpu_to_le32(hextoul(uuid_str, NULL));
++	memcpy(uuid_bin, &tmp32, 4);
++
++	tmp16 =3D cpu_to_le16(hextoul(uuid_str + 9, NULL));
++	memcpy(uuid_bin + 4, &tmp16, 2);
++
++	tmp16 =3D cpu_to_le16(hextoul(uuid_str + 14, NULL));
++	memcpy(uuid_bin + 6, &tmp16, 2);
++
++	tmp16 =3D cpu_to_le16(hextoul(uuid_str + 19, NULL));
++	memcpy(uuid_bin + 8, &tmp16, 2);
++
++	tmp64 =3D cpu_to_le64(simple_strtoull(uuid_str + 24, NULL, 16));
++	memcpy(uuid_bin + 10, &tmp64, 6);
++
++	return 0;
++}
++
+ /*
+  * uuid_bin_to_str() - convert big endian binary data to string UUID or=
 GUID.
+  *
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm=
_ffa-introduce-Arm-FF-A-low-level-driver.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0003-arm_ffa-introduce-Arm-FF-A-low-level-dri=
ver.patch
similarity index 69%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_=
ffa-introduce-Arm-FF-A-low-level-driver.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ff=
a-introduce-Arm-FF-A-low-level-driver.patch
index 64653b30..774af445 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-in=
troduce-Arm-FF-A-low-level-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-in=
troduce-Arm-FF-A-low-level-driver.patch
@@ -1,11 +1,11 @@
-From 4729efd57e260b8c02d8cd1c30a443d29885dbd1 Mon Sep 17 00:00:00 2001
+From 93e3267b19c5c5d27664ef133121db4b678ad72d Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 15 Aug 2022 15:00:44 +0100
-Subject: [PATCH 09/26] arm_ffa: introduce Arm FF-A low-level driver
+Date: Tue, 29 Nov 2022 14:40:05 +0000
+Subject: [PATCH 03/25] arm_ffa: introduce Arm FF-A low-level driver
=20
-Add the driver implementing Arm Firmware Framework for Armv8-A v1.0
+Add the core driver implementing Arm Firmware Framework for Armv8-A v1.0
=20
-The Firmware Framework for Arm A-profile processors (FF-A)
+The Firmware Framework for Arm A-profile processors (FF-A v1.0) [1]
 describes interfaces (ABIs) that standardize communication
 between the Secure World and Normal World leveraging TrustZone
 technology.
@@ -14,10 +14,16 @@ This driver uses 64-bit registers as per SMCCCv1.2 sp=
ec and comes
 on top of the SMCCC layer. The driver provides the FF-A ABIs needed for
 querying the FF-A framework from the secure world.
=20
-32-bit version of the ABIs is supported and 64-bit version of FFA_RXTX_M=
AP
-and FFA_MSG_SEND_DIRECT_{REQ, RESP}.
+The driver uses SMC32 calling convention which means using the first
+32-bit data of the Xn registers.
=20
-In u-boot FF-A design, FF-A is considered as a discoverable bus.
+All supported ABIs come with their 32-bit version except FFA_RXTX_MAP
+which has 64-bit version supported.
+
+Both 32-bit and 64-bit direct messaging are supported which allows both
+32-bit and 64-bit clients to use the FF-A bus.
+
+In U-Boot FF-A design, FF-A is considered as a discoverable bus.
 The Secure World is considered as one entity to communicate with
 using the FF-A bus. FF-A communication is handled by one device and
 one instance (the bus). This FF-A driver takes care of all the
@@ -31,16 +37,45 @@ Exported operations:
 - sync_send_receive
 - rxtx_unmap
=20
-This implementation provides an optional feature to copy the driver data
-to EFI runtime area.
+For more details please refer to the driver documentation [2].
+
+[1]: https://developer.arm.com/documentation/den0077/latest/
+[2]: doc/arch/arm64.ffa.rst
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
----
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
=20
 Changelog:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
+v8:
+
+* make ffa_get_partitions_info() second argument to be an SP count in bo=
th
+  modes
+* update ffa_bus_prvdata_get() to return a pointer rather than a pointer
+  address
+* remove packing from ffa_partition_info and ffa_send_direct_data struct=
ures
+* pass the FF-A bus device to the bus operations
+
+v7:
+
+* add support for 32-bit direct messaging
+* rename be_uuid_str_to_le_bin() to uuid_str_to_le_bin()
+* improve the declaration of error handling mapping
+* stating in doc/arch/arm64.ffa.rst that EFI runtime is not supported
+
+v6:
+
+* drop use of EFI runtime support (We decided with Linaro to add this la=
ter)
+* drop discovery from initcalls (discovery will be on demand by FF-A use=
rs)
+* set the alignment of the RX/TX buffers to the larger translation granu=
le size
+* move FF-A RX/TX buffers unmapping at ExitBootServices() to a separate =
commit
+* update the documentation and move it to doc/arch/arm64.ffa.rst
+
 v4:
=20
 * add doc/README.ffa.drv
@@ -52,16 +87,16 @@ v4:
 * replacing panics with an error log and returning an error code
 * improving features discovery in FFA_FEATURES by introducing
   rxtx_min_pages private data field
-* add ffa_remove and ffa_bind functions
+* add ffa_remove and ffa_unbind functions
 * improve how the driver behaves when bus discovery is done more than
   once
=20
 v3:
=20
-* align the interfaces of the u-boot FF-A driver with those in the linux
+* align the interfaces of the U-Boot FF-A driver with those in the linux
   FF-A driver
 * remove the FF-A helper layer
-* make the u-boot FF-A driver independent from EFI
+* make the U-Boot FF-A driver independent from EFI
 * provide an optional config that enables copying the driver data to EFI
   runtime section at ExitBootServices service
 * use 64-bit version of FFA_RXTX_MAP, FFA_MSG_SEND_DIRECT_{REQ, RESP}
@@ -74,113 +109,105 @@ v2:
 v1:
=20
 * introduce FF-A bus driver with device tree support
-
- MAINTAINERS                                   |    7 +
- common/board_r.c                              |    7 +
- doc/README.ffa.drv                            |  160 ++
- drivers/Kconfig                               |    2 +
- drivers/Makefile                              |    1 +
- drivers/firmware/arm-ffa/Kconfig              |   39 +
- drivers/firmware/arm-ffa/Makefile             |    7 +
- drivers/firmware/arm-ffa/arm-ffa-uclass.c     |   16 +
- drivers/firmware/arm-ffa/arm_ffa_prv.h        |  196 +++
- drivers/firmware/arm-ffa/core.c               | 1344 +++++++++++++++++
- .../arm-ffa/efi_ffa_runtime_data_mgr.c        |   94 ++
- include/arm_ffa.h                             |  127 ++
- include/dm/uclass-id.h                        |    1 +
- lib/efi_loader/efi_boottime.c                 |   12 +
- 14 files changed, 2013 insertions(+)
- create mode 100644 doc/README.ffa.drv
+---
+ MAINTAINERS                               |    7 +
+ doc/arch/arm64.ffa.rst                    |  218 ++++
+ doc/arch/index.rst                        |    1 +
+ drivers/Kconfig                           |    2 +
+ drivers/Makefile                          |    1 +
+ drivers/firmware/arm-ffa/Kconfig          |   30 +
+ drivers/firmware/arm-ffa/Makefile         |    6 +
+ drivers/firmware/arm-ffa/arm-ffa-uclass.c |   16 +
+ drivers/firmware/arm-ffa/arm_ffa_prv.h    |  200 ++++
+ drivers/firmware/arm-ffa/core.c           | 1315 +++++++++++++++++++++
+ include/arm_ffa.h                         |   97 ++
+ include/dm/uclass-id.h                    |    4 +
+ 12 files changed, 1897 insertions(+)
+ create mode 100644 doc/arch/arm64.ffa.rst
  create mode 100644 drivers/firmware/arm-ffa/Kconfig
  create mode 100644 drivers/firmware/arm-ffa/Makefile
  create mode 100644 drivers/firmware/arm-ffa/arm-ffa-uclass.c
  create mode 100644 drivers/firmware/arm-ffa/arm_ffa_prv.h
  create mode 100644 drivers/firmware/arm-ffa/core.c
- create mode 100644 drivers/firmware/arm-ffa/efi_ffa_runtime_data_mgr.c
  create mode 100644 include/arm_ffa.h
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 7f27ff4c20..e760b4ca3a 100644
+index 83346183ee..734fcb10c4 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -244,6 +244,13 @@ F:	board/CZ.NIC/
- F:	configs/turris_*_defconfig
- F:	include/configs/turris_*.h
+@@ -248,6 +248,13 @@ F:	drivers/net/cortina_ni.h
+ F:	drivers/net/phy/ca_phy.c
+ F:	configs/cortina_presidio-asic-pnand_defconfig
 =20
 +ARM FF-A
 +M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 +S:	Maintained
-+F:	doc/README.ffa.drv
++F:	doc/arch/arm64.ffa.rst
 +F:	drivers/firmware/arm-ffa/
 +F:	include/arm_ffa.h
 +
  ARM FREESCALE IMX
  M:	Stefano Babic <sbabic@denx.de>
  M:	Fabio Estevam <festevam@gmail.com>
-diff --git a/common/board_r.c b/common/board_r.c
-index 6f4aca2077..c75634286b 100644
---- a/common/board_r.c
-+++ b/common/board_r.c
-@@ -63,6 +63,10 @@
- #include <efi_loader.h>
- #include <relocate.h>
-=20
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+#include <arm_ffa.h>
-+#endif
-+
- DECLARE_GLOBAL_DATA_PTR;
-=20
- ulong monitor_flash_len;
-@@ -779,6 +783,9 @@ static init_fnc_t init_sequence_r[] =3D {
- 	INIT_FUNC_WATCHDOG_RESET
- 	initr_net,
- #endif
-+#ifdef CONFIG_ARM_FFA_TRANSPORT
-+	ffa_bus_discover,
-+#endif
- #ifdef CONFIG_POST
- 	initr_post,
- #endif
-diff --git a/doc/README.ffa.drv b/doc/README.ffa.drv
+diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
 new file mode 100644
-index 0000000000..1c0a33deb8
+index 0000000000..dfcec82e45
 --- /dev/null
-+++ b/doc/README.ffa.drv
-@@ -0,0 +1,160 @@
++++ b/doc/arch/arm64.ffa.rst
+@@ -0,0 +1,218 @@
++.. SPDX-License-Identifier: GPL-2.0+
++
 +Arm FF-A Driver
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 +
-+Introduction
-+--------------------
++Summary
++-------
 +
 +FF-A stands for Firmware Framework for Arm A-profile processors.
 +
-+FF-A specifies interfaces that enable a pair of software sandboxes to c=
ommunicate with each other. A sandbox aka partition could
-+be a VM in the Normal or Secure world, an application in S-EL0, or a Tr=
usted OS in S-EL1.
++FF-A specifies interfaces that enable a pair of software sandboxes to
++communicate with each other. A sandbox aka partition could
++be a VM in the Normal or Secure world, an application in S-EL0, or a
++Trusted OS in S-EL1.
 +
-+This FF-A driver implements the interfaces to communicate with partitio=
ns in the Secure world aka Secure partitions (SPs).
++This FF-A driver implements the interfaces to communicate with partitio=
ns in
++the Secure world aka Secure partitions (SPs).
 +
-+The driver specifically focuses on communicating with SPs that isolate =
portions of EFI runtime services that must run in a
-+protected environment which is inaccessible by the Host OS or Hyperviso=
r. Examples of such services are set/get variables.
++The driver specifically focuses on communicating with SPs that isolate =
portions
++of EFI runtime services that must run in a protected environment which =
is
++inaccessible by the Host OS or Hypervisor. Examples of such services ar=
e
++set/get variables.
 +
 +FF-A driver uses the SMC ABIs defined by the FF-A specification to:
 +
-+- Discover the presence of SPs of interest.
-+- Access an SP's service through communication protocols e.g. EFI MM co=
mmunication protocol.
++- Discover the presence of SPs of interest
++- Access an SP's service through communication protocols
++  e.g. EFI MM communication protocol
++
++At this stage of development the FF-A driver supports EFI boot time onl=
y.
++
++Runtime support will be added in future developments.
 +
 +FF-A and SMC specifications
 +-------------------------------------------
 +
-+The current implementation of the driver relies on FF-A specification v=
1.0 and uses SMC32 calling convention.
++The current implementation of the driver relies on FF-A specification v=
1.0
++and uses SMC32 calling convention which means using the first 32-bit da=
ta of the
++Xn registers.
 +
-+The driver has been tested with Optee OS which supports SMC32 for most =
of the SMC ABIs.
++At this stage we only need the FF-A v1.0 features.
 +
-+For more details please refer to: https://developer.arm.com/documentati=
on/den0077/a/?lang=3Den
++The driver has been tested with OP-TEE which supports SMC32 calling con=
vention.
++
++For more details please refer to the FF-A v1.0 spec:
++https://documentation-service.arm.com/static/5fb7e8a6ca04df4095c1d65e?t=
oken=3D
++
++Hypervisors are supported if they are configured to trap SMC calls.
 +
 +The FF-A driver uses 64-bit registers as per SMCCCv1.2 specification.
 +
-+For more details please refer to: https://documentation-service.arm.com=
/static/5f8edaeff86e16515cdbe4c6?token=3D
++For more details please refer to the SMC Calling Convention v1.2 spec:
++https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6?t=
oken=3D
 +
 +Supported hardware
 +--------------------------------
@@ -191,60 +218,90 @@ index 0000000000..1c0a33deb8
 +----------------------
 +
 +CONFIG_ARM_FFA_TRANSPORT
-+    Enables the FF-A bus driver. Turn this on if you want to use FF-A c=
ommunication.
-+
-+CONFIG_ARM_FFA_EFI_RUNTIME_MODE
-+    Optional config that enables EFI runtime support for FF-A data and =
code.
-+    ffa_copy_runtime_data allows to copy the FF-A driver data structure=
s to EFI runtime data section.
-+    Turning the config on makes ffa_copy_runtime_data available for use=
 and the driver code placed at EFI runtime code section.
-+    Call ffa_copy_runtime_data at the event on which you want the FF-A =
data to be copied (example: at ExitBootServices).
++    Enables the FF-A bus driver. Turn this on if you want to use FF-A
++    communication.
 +
 +CONFIG_SANDBOX_FFA
-+    Enables FF-A Sandbox driver. This emulates the FF-A ABIs handling u=
nder Sandbox and provides
-+    functional tests for FF-A.
++    Enables FF-A Sandbox driver. This emulates the FF-A ABIs handling u=
nder
++    Sandbox and provides functional tests for FF-A.
 +
 +FF-A ABIs under the hood
 +---------------------------------------
 +
-+Invoking an FF-A ABI involves providing to the secure world/hypervisor =
the expected arguments from the ABI.
++Invoking an FF-A ABI involves providing to the secure world/hypervisor =
the
++expected arguments from the ABI.
 +
-+The ABI arguments are stored in x0 to x7 registers. Then, an SMC instru=
ction is executed.
++The ABI arguments are stored in x0 to x7 registers. Then, an SMC instru=
ction
++is executed.
 +
-+At the secure side level or hypervisor the ABI is handled at a higher e=
xception level and the arguments are read and processed.
++At the secure side level or hypervisor the ABI is handled at a higher e=
xception
++level and the arguments are read and processed.
 +
-+The response is put back through x0 to x7 registers and control is givi=
ng back to the u-boot FF-A driver (non secure world).
++The response is put back through x0 to x7 registers and control is give=
n back
++to the U-Boot FF-A driver (non-secure world).
 +
 +The driver reads the response and processes it accordingly.
 +
 +This methodology applies to all the FF-A ABIs in the driver.
 +
-+FF-A bus discovery in u-boot
++FF-A bus discovery in U-Boot
 +-------------------------------------------
 +
-+When CONFIG_ARM_FFA_TRANSPORT is enabled, the FF-A bus is automatically=
 discovered at initcall level (after u-boot relocation).
++When CONFIG_ARM_FFA_TRANSPORT is enabled, the FF-A bus is discovered on
++demand by the clients (users).
++
++Clients can discover the FF-A bus using ffa_bus_discover() API which tr=
iggers the
++discovery process.
 +
-+The function that triggers the discovery process is ffa_bus_discover.
++ffa_bus_discover() creates, binds and probes the arm_ffa device using
++device_{bind, probe} APIs.
 +
-+ffa_bus_discover creates, binds and probes the arm_ffa device using dev=
ice_{bind, probe} APIs.
++The discovery process consists in communicating with secure world (or h=
ypervisor)
++and querying specific data.
 +
-+When the device is probed, ffa_probe is called which tries to communica=
te with the secure world or hypervisor.
++The discovery process takes place during the arm_ffa device probing whi=
ch is
++handled by ffa_probe().
 +
-+The FF-A bus is usable when these checks succeed:
++The FF-A bus discovery is successful and the bus is ready for use when =
these
++operations succeed:
 +
 +- querying the FF-A framework version
-+- querying from secure world the u-boot endpoint ID
-+- querying from secure world the supported features of the specified FF=
-A calls
++- querying from secure world the U-Boot endpoint ID
++- querying from secure world the RX/TX mapping  features
 +- mapping the RX/TX buffers
 +- querying from secure world all the partitions information
 +
-+Probing fails when any of these operations fail. The FF-A bus discovery=
 succeeds when probing is successful.
++Discovery failure results in a probing failure and the arm_ffa device i=
s
++destroyed.
 +
-+When discovery fails the arm_ffa device is destroyed.
++Requirements for clients
++-------------------------------------
++
++When using the FF-A bus with EFI, clients must:
++
++- Query SPs in EFI boot time mode using the service UUID.
++- Unmap RX/TX buffers before EFI runtime mode starts.
++
++The RX/TX buffers are only available at EFI boot time. Querying partiti=
ons is
++done at boot time and data is cached for future use.
++
++RX/TX buffers should be unmapped by the user before EFI runtime mode
++starts. The driver provides a bus operation for that: rxtx_unmap()
++
++If  RX/TX buffers created by U-Boot are not unmapped and by
++consequence becoming available at EFI runtime, secure world will get co=
nfused
++about RX/TX buffers ownership (U-Boot vs kernel).
++
++When invoking FF-A direct messaging, clients should specify which ABI p=
rotocol
++they want to use (32-bit vs 64-bit). Selecting the protocol means using
++the 32-bit or 64-bit version of FFA_MSG_SEND_DIRECT_{REQ, RESP}.
++The calling convention stays the same: SMC32.
 +
 +The bus driver layer
 +------------------------------
 +
-+The driver comes on top of the SMCCC layer and is implemented in driver=
s/firmware/arm-ffa/core.c
++The driver comes on top of the SMCCC layer and is implemented in
++drivers/firmware/arm-ffa/core.c
 +
 +The driver provides the following features:
 +
@@ -260,6 +317,8 @@ index 0000000000..1c0a33deb8
 +FFA_ERROR
 +FFA_SUCCESS
 +FFA_INTERRUPT
++FFA_MSG_SEND_DIRECT_REQ
++FFA_MSG_SEND_DIRECT_RESP
 +
 +- Support for the 64-bit version of the following ABIs:
 +
@@ -269,8 +328,9 @@ index 0000000000..1c0a33deb8
 +
 +- Processing the received data from the secure world/hypervisor and cac=
hing it
 +
-+- Hiding from upper layers the FF-A protocol and registers details. Upp=
er layers focus on exchanged data,
-+the driver takes care of how to transport that to the secure world/hype=
rvisor using FF-A.
++- Hiding from upper layers the FF-A protocol and registers details. Upp=
er
++  layers focus on exchanged data, the driver takes care of how to trans=
port
++  that to the secure world/hypervisor using FF-A
 +
 +- The driver provides callbacks to be used by clients to access the FF-=
A bus:
 +
@@ -278,18 +338,19 @@ index 0000000000..1c0a33deb8
 +sync_send_receive
 +rxtx_unmap
 +
-+- FF-A bus discovery at initcalls level (after u-boot relocation). The =
bus is up and running if the FF-A framework is responsive and compatible =
with the driver.
++- FF-A bus discovery makes sure FF-A framework is responsive and compat=
ible
++  with the driver
 +
-+- When EFI is enabled, unmap the RX/TX buffers at ExitBootServices() le=
vel.
-+
-+- When CONFIG_ARM_FFA_EFI_RUNTIME_MODE enabled, ffa_copy_runtime_data f=
unction is available for use.
++- FF-A bus can be compiled and used without EFI
 +
 +Using armffa command
 +-----------------------------------
 +
-+armffa is a command showcasing how to use the FF-A driver and how to in=
voke its operations.
++armffa is an implementation defined command showcasing how to use the F=
F-A driver and how to invoke
++its operations.
 +
-+This provides a guidance to the client developers on how to call the FF=
-A bus interfaces.
++This provides a guidance to the client developers on how to call the FF=
-A bus
++interfaces.
 +
 +Usage:
 +
@@ -308,8 +369,24 @@ index 0000000000..1c0a33deb8
 +        devlist
 +
 +            displays the arm_ffa device info
++
++Contributors
++------------
++   * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+diff --git a/doc/arch/index.rst b/doc/arch/index.rst
+index 792d9182c3..8d1ab0ad4e 100644
+--- a/doc/arch/index.rst
++++ b/doc/arch/index.rst
+@@ -8,6 +8,7 @@ Architecture-specific doc
+=20
+    arc
+    arm64
++   arm64.ffa
+    m68k
+    mips
+    nios2
 diff --git a/drivers/Kconfig b/drivers/Kconfig
-index b26ca8cf70..4a602517bf 100644
+index 8b6fead351..b06b1ae481 100644
 --- a/drivers/Kconfig
 +++ b/drivers/Kconfig
 @@ -6,6 +6,8 @@ source "drivers/core/Kconfig"
@@ -322,10 +399,10 @@ index b26ca8cf70..4a602517bf 100644
 =20
  source "drivers/axi/Kconfig"
 diff --git a/drivers/Makefile b/drivers/Makefile
-index 67c8af7442..77db8736e6 100644
+index eba9940231..c3bfad94ac 100644
 --- a/drivers/Makefile
 +++ b/drivers/Makefile
-@@ -109,6 +109,7 @@ obj-y +=3D iommu/
+@@ -110,6 +110,7 @@ obj-y +=3D iommu/
  obj-y +=3D smem/
  obj-y +=3D thermal/
  obj-$(CONFIG_TEE) +=3D tee/
@@ -335,10 +412,10 @@ index 67c8af7442..77db8736e6 100644
  obj-$(CONFIG_W1) +=3D w1/
 diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
 new file mode 100644
-index 0000000000..aceb61cf49
+index 0000000000..e4914b9bc7
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/Kconfig
-@@ -0,0 +1,39 @@
+@@ -0,0 +1,30 @@
 +# SPDX-License-Identifier: GPL-2.0
 +
 +config ARM_FFA_TRANSPORT
@@ -360,37 +437,27 @@ index 0000000000..aceb61cf49
 +
 +	  https://developer.arm.com/documentation/den0077/a/?lang=3Den
 +
-+	  In u-boot FF-A design, FF-A is considered as a discoverable bus.
++	  In U-Boot FF-A design, FF-A is considered as a discoverable bus.
 +	  The Secure World is considered as one entity to communicate with
 +	  using the FF-A bus.
 +	  FF-A communication is handled by one device and one instance (the bu=
s).
 +	  This FF-A driver takes care of all the interactions between Normal w=
orld
 +	  and Secure World.
 +
-+	  For more details about the FF-A driver, please refer to doc/README.f=
fa.drv
++	  For more details about the FF-A driver, please refer to doc/arch/arm=
64.ffa.rst
 +
-+config ARM_FFA_EFI_RUNTIME_MODE
-+	bool "Enable EFI runtime support for FF-A data and code"
-+	depends on ARM_FFA_TRANSPORT && EFI_LOADER
-+	help
-+	  Allows FF-A driver data structures and code to be accessible at EFI =
runtime.
-+	  FF-A data is copied by ffa_copy_runtime_data function.
-+	  The driver Code needed at runtime is placed at EFI runtime code sect=
ion.
-+	  Turning this on makes ffa_copy_runtime_data available for use and th=
e driver
-+	  code placed at EFI runtime code section.
 diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
 new file mode 100644
-index 0000000000..0b9b0a61b4
+index 0000000000..043a8915be
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/Makefile
-@@ -0,0 +1,7 @@
+@@ -0,0 +1,6 @@
 +# SPDX-License-Identifier: GPL-2.0+
 +#
-+# (C) Copyright 2022 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+#
++# (C) Copyright 2022
++# Abdellatif El Khlifi, Arm Limited, abdellatif.elkhlifi@arm.com.
 +
 +obj-y +=3D arm-ffa-uclass.o core.o
-+obj-$(CONFIG_ARM_FFA_EFI_RUNTIME_MODE) +=3D efi_ffa_runtime_data_mgr.o
 diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
 new file mode 100644
 index 0000000000..7d9695d289
@@ -415,10 +482,10 @@ index 0000000000..7d9695d289
 +};
 diff --git a/drivers/firmware/arm-ffa/arm_ffa_prv.h b/drivers/firmware/a=
rm-ffa/arm_ffa_prv.h
 new file mode 100644
-index 0000000000..7bc90f7f66
+index 0000000000..4eea7dc036
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/arm_ffa_prv.h
-@@ -0,0 +1,196 @@
+@@ -0,0 +1,200 @@
 +/* SPDX-License-Identifier: GPL-2.0+ */
 +/*
 + * (C) Copyright 2022 ARM Limited
@@ -485,27 +552,36 @@ index 0000000000..7bc90f7f66
 +#define FFA_SMC_64(func_num)				FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
 +
 +enum ffa_abis {
-+	FFA_ERROR					=3D 0x60,
-+	FFA_SUCCESS					=3D 0x61,
-+	FFA_INTERRUPT				=3D 0x62,
-+	FFA_VERSION					=3D 0x63,
-+	FFA_FEATURES				=3D 0x64,
-+	FFA_RX_RELEASE				=3D 0x65,
-+	FFA_RXTX_MAP				=3D 0x66,
-+	FFA_RXTX_UNMAP			=3D 0x67,
-+	FFA_PARTITION_INFO_GET		=3D 0x68,
-+	FFA_ID_GET					=3D 0x69,
-+	FFA_RUN						=3D 0x6D,
-+	FFA_MSG_SEND_DIRECT_REQ	=3D 0x6F,
-+	FFA_MSG_SEND_DIRECT_RESP	=3D 0x70,
++	FFA_ERROR                 =3D 0x60,
++	FFA_SUCCESS               =3D 0x61,
++	FFA_INTERRUPT             =3D 0x62,
++	FFA_VERSION               =3D 0x63,
++	FFA_FEATURES              =3D 0x64,
++	FFA_RX_RELEASE            =3D 0x65,
++	FFA_RXTX_MAP              =3D 0x66,
++	FFA_RXTX_UNMAP            =3D 0x67,
++	FFA_PARTITION_INFO_GET    =3D 0x68,
++	FFA_ID_GET                =3D 0x69,
++	FFA_RUN                   =3D 0x6D,
++	FFA_MSG_SEND_DIRECT_REQ   =3D 0x6F,
++	FFA_MSG_SEND_DIRECT_RESP  =3D 0x70,
 +
 +	/* to be updated when adding new FFA IDs */
-+	FFA_FIRST_ID =3D FFA_ERROR, /* lowest number ID*/
-+	FFA_LAST_ID =3D FFA_MSG_SEND_DIRECT_RESP, /* highest number ID*/
++	FFA_FIRST_ID              =3D FFA_ERROR, /* lowest number ID*/
++	FFA_LAST_ID               =3D FFA_MSG_SEND_DIRECT_RESP, /* highest num=
ber ID*/
 +};
 +
-+/* number of the errors supported by the FF-A specification */
-+#define MAX_NUMBER_FFA_ERR 9
++enum ffa_abi_errcode {
++	NOT_SUPPORTED =3D 1,
++	INVALID_PARAMETERS,
++	NO_MEMORY,
++	BUSY,
++	INTERRUPTED,
++	DENIED,
++	RETRY,
++	ABORTED,
++	MAX_NUMBER_FFA_ERR
++};
 +
 +/* container structure and helper macros to map between an FF-A error a=
nd relevant error log */
 +struct ffa_abi_errmap {
@@ -605,22 +681,17 @@ index 0000000000..7bc90f7f66
 +};
 +
 +/**
-+ * ffa_device_get - create, bind and probe the arm_ffa device
-+ */
-+int ffa_device_get(void);
-+
-+/**
 + * ffa_bus_prvdata_get - bus driver private data getter
 + */
-+struct ffa_prvdata **ffa_bus_prvdata_get(void);
++struct ffa_prvdata *ffa_bus_prvdata_get(void);
 +
 +#endif
 diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/=
core.c
 new file mode 100644
-index 0000000000..41c7b96e68
+index 0000000000..0b1f8e6a07
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/core.c
-@@ -0,0 +1,1344 @@
+@@ -0,0 +1,1315 @@
 +// SPDX-License-Identifier: GPL-2.0+
 +/*
 + * (C) Copyright 2022 ARM Limited
@@ -644,115 +715,83 @@ index 0000000000..41c7b96e68
 +DECLARE_GLOBAL_DATA_PTR;
 +
 +/**
-+ * The device private data structure containing all the resident
++ * The device private data structure containing all the
 + * data read from secure world
 + */
-+__ffa_runtime_data struct ffa_prvdata *ffa_priv_data;
++struct ffa_prvdata *ffa_priv_data;
 +
 +/* Error mapping declarations */
 +
-+__ffa_runtime_data int ffa_to_std_errmap[MAX_NUMBER_FFA_ERR] =3D {
-+	0,
-+	-EOPNOTSUPP,	/* NOT_SUPPORTED */
-+	-EINVAL,	/* INVALID_PARAMETERS */
-+	-ENOMEM,	/* NO_MEMORY */
-+	-EBUSY,		/* BUSY */
-+	-EINTR,		/* INTERRUPTED */
-+	-EACCES,	/* DENIED */
-+	-EAGAIN,	/* RETRY */
-+	-ECANCELED,	/* ABORTED */
++int ffa_to_std_errmap[MAX_NUMBER_FFA_ERR] =3D {
++	[NOT_SUPPORTED] =3D -EOPNOTSUPP,
++	[INVALID_PARAMETERS] =3D -EINVAL,
++	[NO_MEMORY] =3D -ENOMEM,
++	[BUSY] =3D -EBUSY,
++	[INTERRUPTED] =3D -EINTR,
++	[DENIED] =3D -EACCES,
++	[RETRY] =3D -EAGAIN,
++	[ABORTED] =3D -ECANCELED,
 +};
 +
 +struct ffa_abi_errmap err_msg_map[FFA_ERRMAP_COUNT] =3D {
 +	[FFA_ID_TO_ERRMAP_ID(FFA_VERSION)] =3D {
 +		{
-+			"",
++			[NOT_SUPPORTED] =3D
 +			"NOT_SUPPORTED: A Firmware Framework implementation does not exist",
-+			"", /* INVALID_PARAMETERS */
-+			"", /* NO_MEMORY */
-+			"", /* BUSY */
-+			"", /* INTERRUPTED */
-+			"", /* DENIED */
-+			"", /* RETRY */
-+			"", /* ABORTED */
 +		},
 +	},
 +	[FFA_ID_TO_ERRMAP_ID(FFA_ID_GET)] =3D {
 +		{
-+			"",
++			[NOT_SUPPORTED] =3D
 +			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
-+			"", /* INVALID_PARAMETERS */
-+			"", /* NO_MEMORY */
-+			"", /* BUSY */
-+			"", /* INTERRUPTED */
-+			"", /* DENIED */
-+			"", /* RETRY */
-+			"", /* ABORTED */
 +		},
 +	},
 +	[FFA_ID_TO_ERRMAP_ID(FFA_FEATURES)] =3D {
 +		{
-+			"",
++			[NOT_SUPPORTED] =3D
 +			"NOT_SUPPORTED: FFA_RXTX_MAP is not implemented at this FF-A instanc=
e",
-+			"", /* INVALID_PARAMETERS */
-+			"", /* NO_MEMORY */
-+			"", /* BUSY */
-+			"", /* INTERRUPTED */
-+			"", /* DENIED */
-+			"", /* RETRY */
-+			"", /* ABORTED */
 +		},
 +	},
 +	[FFA_ID_TO_ERRMAP_ID(FFA_PARTITION_INFO_GET)] =3D {
 +		{
-+			"",
++			[NOT_SUPPORTED] =3D
 +			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
++			[INVALID_PARAMETERS] =3D
 +			"INVALID_PARAMETERS: Unrecognized UUID",
++			[NO_MEMORY] =3D
 +			"NO_MEMORY: Results cannot fit in RX buffer of the caller",
++			[BUSY] =3D
 +			"BUSY: RX buffer of the caller is not free",
-+			"", /* INTERRUPTED */
++			[DENIED] =3D
 +			"DENIED: Callee is not in a state to handle this request",
-+			"", /* RETRY */
-+			"", /* ABORTED */
 +		},
 +	},
 +	[FFA_ID_TO_ERRMAP_ID(FFA_RXTX_UNMAP)] =3D {
-+			{
-+			"",
++		{
++			[NOT_SUPPORTED] =3D
 +			"NOT_SUPPORTED: FFA_RXTX_UNMAP is not implemented at this FF-A insta=
nce",
++			[INVALID_PARAMETERS] =3D
 +			"INVALID_PARAMETERS: No buffer pair registered on behalf of the call=
er",
-+			"", /* NO_MEMORY */
-+			"", /* BUSY */
-+			"", /* INTERRUPTED */
-+			"", /* DENIED */
-+			"", /* RETRY */
-+			"", /* ABORTED */
 +		},
 +	},
 +	[FFA_ID_TO_ERRMAP_ID(FFA_RX_RELEASE)] =3D {
-+			{
-+			"",
++		{
++			[NOT_SUPPORTED] =3D
 +			"NOT_SUPPORTED: FFA_RX_RELEASE is not implemented at this FF-A insta=
nce",
-+			"", /* INVALID_PARAMETERS */
-+			"", /* NO_MEMORY */
-+			"", /* BUSY */
-+			"", /* INTERRUPTED */
++			[DENIED] =3D
 +			"DENIED: Caller did not have ownership of the RX buffer",
-+			"", /* RETRY */
-+			"", /* ABORTED */
 +		},
 +	},
 +	[FFA_ID_TO_ERRMAP_ID(FFA_RXTX_MAP)] =3D {
-+			{
-+			"",
++		{
++			[NOT_SUPPORTED] =3D
 +			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
++			[INVALID_PARAMETERS] =3D
 +			"INVALID_PARAMETERS: Field(s) in input parameters incorrectly encode=
d",
++			[NO_MEMORY] =3D
 +			"NO_MEMORY: Not enough memory",
-+			"", /* BUSY */
-+			"", /* INTERRUPTED */
++			[DENIED] =3D
 +			"DENIED: Buffer pair already registered",
-+			"", /* RETRY */
-+			"", /* ABORTED */
 +		},
 +	},
 +};
@@ -761,14 +800,14 @@ index 0000000000..41c7b96e68
 + * ffa_to_std_errno - convert FF-A error code to standard error code
 + * @ffa_errno:	Error code returned by the FF-A ABI
 + *
-+ * This runtime function maps the given FF-A error code as specified
++ * This function maps the given FF-A error code as specified
 + * by the spec to a u-boot standard error code.
 + *
 + * Return:
 + *
 + * The standard error code on success. . Otherwise, failure
 + */
-+__ffa_runtime int ffa_to_std_errno(int ffa_errno)
++int ffa_to_std_errno(int ffa_errno)
 +{
 +	int err_idx =3D -ffa_errno;
 +
@@ -783,7 +822,7 @@ index 0000000000..41c7b96e68
 + * @ffa_id:	FF-A ABI ID
 + * @ffa_errno:	Error code returned by the FF-A ABI
 + *
-+ * This boot time function maps the FF-A error code to the error log re=
levant to the
++ * This function maps the FF-A error code to the error log relevant to =
the
 + * selected FF-A ABI. Then the error log is printed.
 + *
 + * Return:
@@ -806,7 +845,7 @@ index 0000000000..41c7b96e68
 +	if (abi_idx < 0 || abi_idx >=3D FFA_ERRMAP_COUNT)
 +		return -EINVAL;
 +
-+	if (!err_msg_map[abi_idx].err_str || !err_msg_map[abi_idx].err_str[err=
_idx])
++	if (!err_msg_map[abi_idx].err_str[err_idx])
 +		return -EINVAL;
 +
 +	ffa_err("%s", err_msg_map[abi_idx].err_str[err_idx]);
@@ -822,7 +861,7 @@ index 0000000000..41c7b96e68
 + * ffa_remove_device - removes the arm_ffa device
 + * @dev:	the device to be removed
 + *
-+ * This boot time function makes sure the arm_ffa device is removed
++ * This function makes sure the arm_ffa device is removed
 + * No need to free the kmalloced data when the device is destroyed.
 + * It's automatically done by devm management by
 + * device_remove() -> device_free() -> devres_release_probe().
@@ -861,26 +900,24 @@ index 0000000000..41c7b96e68
 +
 +/**
 + * ffa_device_get - create, bind and probe the arm_ffa device
++ * @pdev: the address of a device pointer (to be filled when the arm_ff=
a bus device is created
++ *       successfully)
 + *
-+ * This boot time function makes sure the arm_ffa device is
++ * This function makes sure the arm_ffa device is
 + * created, bound to this driver, probed and ready to use.
-+ * Arm FF-A transport is implemented through a single u-boot
++ * Arm FF-A transport is implemented through a single U-Boot
 + * device managing the FF-A bus (arm_ffa).
 + *
 + * Return:
 + *
 + * 0 on success. Otherwise, failure
 + */
-+int ffa_device_get(void)
++int ffa_device_get(struct udevice **pdev)
 +{
 +	int ret;
 +	struct udevice *dev =3D NULL;
 +
-+	ret =3D device_bind(dm_root(),
-+			  DM_DRIVER_GET(arm_ffa),
-+			  FFA_DRV_NAME,
-+			  NULL,
-+			  ofnode_null(),
++	ret =3D device_bind(dm_root(), DM_DRIVER_GET(arm_ffa), FFA_DRV_NAME, N=
ULL, ofnode_null(),
 +			  &dev);
 +	if (ret)
 +		return ret;
@@ -893,13 +930,16 @@ index 0000000000..41c7b96e68
 +		return ret;
 +	}
 +
++	if (pdev)
++		*pdev =3D dev;
++
 +	return 0;
 +}
 +
 +/**
 + * ffa_get_version - FFA_VERSION handler function
 + *
-+ * This is the boot time function that implements FFA_VERSION FF-A func=
tion
++ * This function implements FFA_VERSION FF-A function
 + * to get from the secure world the FF-A framework version
 + *
 + * Return:
@@ -913,18 +953,17 @@ index 0000000000..41c7b96e68
 +	int ffa_errno;
 +
 +	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_VERSION),
-+			.a1 =3D FFA_VERSION_1_0, .a2 =3D 0, .a3 =3D 0, .a4 =3D 0, .a5 =3D 0,=
 .a6 =3D 0, .a7 =3D 0,
++			.a0 =3D FFA_SMC_32(FFA_VERSION), .a1 =3D FFA_VERSION_1_0,
 +			}, &res);
 +
-+	ffa_errno =3D (int)res.a0;
++	ffa_errno =3D res.a0;
 +	if (ffa_errno < 0) {
 +		ffa_print_error_log(FFA_VERSION, ffa_errno);
 +		return ffa_to_std_errno(ffa_errno);
 +	}
 +
-+	major =3D GET_FFA_MAJOR_VERSION((u32)res.a0);
-+	minor =3D GET_FFA_MINOR_VERSION((u32)res.a0);
++	major =3D GET_FFA_MAJOR_VERSION(res.a0);
++	minor =3D GET_FFA_MINOR_VERSION(res.a0);
 +
 +	ffa_info("FF-A driver %d.%d\nFF-A framework %d.%d",
 +		 FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
@@ -932,7 +971,7 @@ index 0000000000..41c7b96e68
 +	if ((major =3D=3D FFA_MAJOR_VERSION && minor >=3D FFA_MINOR_VERSION)) =
{
 +		ffa_info("Versions are compatible ");
 +
-+		ffa_priv_data->fwk_version =3D (u32)res.a0;
++		ffa_priv_data->fwk_version =3D res.a0;
 +
 +		return 0;
 +	}
@@ -946,7 +985,7 @@ index 0000000000..41c7b96e68
 +/**
 + * ffa_get_endpoint_id - FFA_ID_GET handler function
 + *
-+ * This is the boot time function that implements FFA_ID_GET FF-A funct=
ion
++ * This function implements FFA_ID_GET FF-A function
 + * to get from the secure world u-boot endpoint ID
 + *
 + * Return:
@@ -960,7 +999,6 @@ index 0000000000..41c7b96e68
 +
 +	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
 +			.a0 =3D FFA_SMC_32(FFA_ID_GET),
-+			.a1 =3D 0, .a2 =3D 0, .a3 =3D 0, .a4 =3D 0, .a5 =3D 0, .a6 =3D 0, .a=
7 =3D 0,
 +			}, &res);
 +
 +	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
@@ -970,7 +1008,7 @@ index 0000000000..41c7b96e68
 +		return 0;
 +	}
 +
-+	ffa_errno =3D (int)res.a2;
++	ffa_errno =3D res.a2;
 +
 +	ffa_print_error_log(FFA_ID_GET, ffa_errno);
 +
@@ -981,7 +1019,7 @@ index 0000000000..41c7b96e68
 + * ffa_set_rxtx_buffers_pages_cnt - sets the minimum number of pages in=
 each of the RX/TX buffers
 + * @prop_field: properties field obtained from FFA_FEATURES ABI
 + *
-+ * This boot time function sets the minimum number of pages
++ * This function sets the minimum number of pages
 + *  in each of the RX/TX buffers in the private data structure
 + *
 + * Return:
@@ -1015,7 +1053,7 @@ index 0000000000..41c7b96e68
 +/**
 + * ffa_get_rxtx_map_features - FFA_FEATURES handler function with FFA_R=
XTX_MAP argument
 + *
-+ * This is the boot time function that implements FFA_FEATURES FF-A fun=
ction
++ * This function implements FFA_FEATURES FF-A function
 + * to retrieve the FFA_RXTX_MAP features
 + *
 + * Return:
@@ -1030,13 +1068,12 @@ index 0000000000..41c7b96e68
 +	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
 +			.a0 =3D FFA_SMC_32(FFA_FEATURES),
 +			.a1 =3D FFA_SMC_64(FFA_RXTX_MAP),
-+			.a2 =3D 0, .a3 =3D 0, .a4 =3D 0, .a5 =3D 0, .a6 =3D 0, .a7 =3D 0,
 +			}, &res);
 +
 +	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS))
-+		return ffa_set_rxtx_buffers_pages_cnt((u32)res.a2);
++		return ffa_set_rxtx_buffers_pages_cnt(res.a2);
 +
-+	ffa_errno =3D (int)res.a2;
++	ffa_errno =3D res.a2;
 +	ffa_print_error_log(FFA_FEATURES, ffa_errno);
 +
 +	return ffa_to_std_errno(ffa_errno);
@@ -1045,7 +1082,7 @@ index 0000000000..41c7b96e68
 +/**
 + * ffa_free_rxtx_buffers - frees the RX/TX buffers
 + *
-+ * This is the boot time function used to free the RX/TX buffers
++ * This  function  frees the RX/TX buffers
 + *
 + */
 +static void ffa_free_rxtx_buffers(void)
@@ -1066,7 +1103,7 @@ index 0000000000..41c7b96e68
 +/**
 + * ffa_alloc_rxtx_buffers - allocates the RX/TX buffers
 + *
-+ * This is the boot time function used by ffa_map_rxtx_buffers to alloc=
ate
++ * This function is used by ffa_map_rxtx_buffers to allocate
 + * the RX/TX buffers before mapping them. The allocated memory is physi=
cally
 + * contiguous since memalign ends up calling malloc which allocates
 + * contiguous memory in u-boot.
@@ -1084,9 +1121,12 @@ index 0000000000..41c7b96e68
 +
 +	bytes =3D ffa_priv_data->pair.rxtx_min_pages * SZ_4K;
 +
-+	/* RX/TX buffers addresses should be PAGE_SIZE aligned */
++	/*
++	 * The alignment of the RX and TX buffers must be equal
++	 * to the larger translation granule size
++	 */
 +
-+	ffa_priv_data->pair.rxbuf =3D (u64)memalign(PAGE_SIZE, bytes);
++	ffa_priv_data->pair.rxbuf =3D (u64)memalign(bytes, bytes);
 +	if (!ffa_priv_data->pair.rxbuf) {
 +		ffa_err("failure to allocate RX buffer");
 +		return -ENOBUFS;
@@ -1094,7 +1134,7 @@ index 0000000000..41c7b96e68
 +
 +	ffa_info("RX buffer at virtual address 0x%llx", ffa_priv_data->pair.rx=
buf);
 +
-+	ffa_priv_data->pair.txbuf =3D (u64)memalign(PAGE_SIZE, bytes);
++	ffa_priv_data->pair.txbuf =3D (u64)memalign(bytes, bytes);
 +	if (!ffa_priv_data->pair.txbuf) {
 +		free((void *)ffa_priv_data->pair.rxbuf);
 +		ffa_priv_data->pair.rxbuf =3D 0;
@@ -1116,7 +1156,7 @@ index 0000000000..41c7b96e68
 +/**
 + * ffa_map_rxtx_buffers - FFA_RXTX_MAP handler function
 + *
-+ * This is the boot time function that implements FFA_RXTX_MAP FF-A fun=
ction
++ * This function implements FFA_RXTX_MAP FF-A function
 + * to map the RX/TX buffers
 + *
 + * Return:
@@ -1136,7 +1176,7 @@ index 0000000000..41c7b96e68
 +	/*
 +	 * we need to pass the physical addresses of the RX/TX buffers
 +	 * in u-boot physical/virtual mapping is 1:1
-+	 *no need to convert from virtual to physical
++	 * no need to convert from virtual to physical
 +	 */
 +
 +	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
@@ -1144,7 +1184,6 @@ index 0000000000..41c7b96e68
 +			.a1 =3D ffa_priv_data->pair.txbuf,
 +			.a2 =3D ffa_priv_data->pair.rxbuf,
 +			.a3 =3D ffa_priv_data->pair.rxtx_min_pages,
-+			.a4 =3D 0, .a5 =3D 0, .a6 =3D 0, .a7 =3D 0,
 +			}, &res);
 +
 +	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
@@ -1152,7 +1191,7 @@ index 0000000000..41c7b96e68
 +		return 0;
 +	}
 +
-+	ffa_errno =3D (int)res.a2;
++	ffa_errno =3D res.a2;
 +	ffa_print_error_log(FFA_RXTX_MAP, ffa_errno);
 +
 +	ffa_free_rxtx_buffers();
@@ -1162,15 +1201,16 @@ index 0000000000..41c7b96e68
 +
 +/**
 + * ffa_unmap_rxtx_buffers - FFA_RXTX_UNMAP handler function
++ *	@dev: The arm_ffa bus device
 + *
-+ * This is the boot time function that implements FFA_RXTX_UNMAP FF-A f=
unction
++ * This function implements FFA_RXTX_UNMAP FF-A function
 + * to unmap the RX/TX buffers
 + *
 + * Return:
 + *
 + * 0 on success. Otherwise, failure
 + */
-+static int ffa_unmap_rxtx_buffers(void)
++static int ffa_unmap_rxtx_buffers(struct udevice *dev)
 +{
 +	ffa_value_t res =3D {0};
 +	int ffa_errno;
@@ -1178,7 +1218,6 @@ index 0000000000..41c7b96e68
 +	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
 +			.a0 =3D FFA_SMC_32(FFA_RXTX_UNMAP),
 +			.a1 =3D PREP_SELF_ENDPOINT_ID(ffa_priv_data->id),
-+			.a2 =3D 0, .a3 =3D 0, .a4 =3D 0, .a5 =3D 0, .a6 =3D 0, .a7 =3D 0,
 +			}, &res);
 +
 +	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
@@ -1186,7 +1225,7 @@ index 0000000000..41c7b96e68
 +		return 0;
 +	}
 +
-+	ffa_errno =3D (int)res.a2;
++	ffa_errno =3D res.a2;
 +	ffa_print_error_log(FFA_RXTX_UNMAP, ffa_errno);
 +
 +	return ffa_to_std_errno(ffa_errno);
@@ -1195,7 +1234,7 @@ index 0000000000..41c7b96e68
 +/**
 + * ffa_release_rx_buffer - FFA_RX_RELEASE handler function
 + *
-+ * This is the boot time function that invokes FFA_RX_RELEASE FF-A func=
tion
++ * This function invokes FFA_RX_RELEASE FF-A function
 + * to release the ownership of the RX buffer
 + *
 + * Return:
@@ -1209,13 +1248,12 @@ index 0000000000..41c7b96e68
 +
 +	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
 +			.a0 =3D FFA_SMC_32(FFA_RX_RELEASE),
-+			.a1 =3D 0, .a2 =3D 0, .a3 =3D 0, .a4 =3D 0, .a5 =3D 0, .a6 =3D 0, .a=
7 =3D 0,
 +			}, &res);
 +
 +	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS))
 +		return 0;
 +
-+	ffa_errno =3D (int)res.a2;
++	ffa_errno =3D res.a2;
 +	ffa_print_error_log(FFA_RX_RELEASE, ffa_errno);
 +
 +	return ffa_to_std_errno(ffa_errno);
@@ -1226,20 +1264,20 @@ index 0000000000..41c7b96e68
 + * @uuid1: first UUID
 + * @uuid2: second UUID
 + *
-+ * This is a boot time function used by ffa_read_partitions_info to sea=
rch
++ * This function is used by ffa_read_partitions_info to search
 + * for a UUID in the partitions descriptors table
 + *
 + * Return:
 + *
 + * 1 when UUIDs match. Otherwise, 0
 + */
-+int ffa_uuid_are_identical(const struct ffa_partition_uuid *uuid1,
-+			   const struct ffa_partition_uuid *uuid2)
++bool ffa_uuid_are_identical(const struct ffa_partition_uuid *uuid1,
++			    const struct ffa_partition_uuid *uuid2)
 +{
 +	if (!uuid1 || !uuid2)
 +		return 0;
 +
-+	return (!memcmp(uuid1, uuid2, sizeof(struct ffa_partition_uuid)));
++	return !memcmp(uuid1, uuid2, sizeof(struct ffa_partition_uuid));
 +}
 +
 +/**
@@ -1248,7 +1286,7 @@ index 0000000000..41c7b96e68
 + * @count: The number of partitions queried
 + * @part_uuid: Pointer to the partition(s) UUID
 + *
-+ * This is the boot time function that reads the partitions information
++ * This function reads the partitions information
 + * returned by the FFA_PARTITION_INFO_GET and saves it in the private
 + * data structure.
 + *
@@ -1288,8 +1326,8 @@ index 0000000000..41c7b96e68
 +			return -ENOMEM;
 +		}
 +
-+		ffa_priv_data->partitions.descs =3D (struct ffa_partition_desc *)
-+			devm_kmalloc(ffa_priv_data->dev, data_bytes, __GFP_ZERO);
++		ffa_priv_data->partitions.descs =3D devm_kmalloc(ffa_priv_data->dev, =
data_bytes,
++							       __GFP_ZERO);
 +		if (!ffa_priv_data->partitions.descs) {
 +			ffa_err("cannot  allocate partitions data buffer");
 +			return -ENOMEM;
@@ -1357,7 +1395,7 @@ index 0000000000..41c7b96e68
 + * @part_uuid: Pointer to the partition(s) UUID
 + * @pcount: Pointer to the number of partitions variable filled when qu=
erying
 + *
-+ * This is the boot time function that executes the FFA_PARTITION_INFO_=
GET
++ * This function executes the FFA_PARTITION_INFO_GET
 + * to query the partitions data. Then, it calls ffa_read_partitions_inf=
o
 + * to save the data in the private data structure.
 + *
@@ -1398,9 +1436,6 @@ index 0000000000..41c7b96e68
 +			.a2 =3D query_uuid.a2,
 +			.a3 =3D query_uuid.a3,
 +			.a4 =3D query_uuid.a4,
-+			.a5 =3D 0,
-+			.a6 =3D 0,
-+			.a7 =3D 0,
 +			}, &res);
 +
 +	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
@@ -1435,7 +1470,7 @@ index 0000000000..41c7b96e68
 +		return ret;
 +	}
 +
-+	ffa_errno =3D (int)res.a2;
++	ffa_errno =3D res.a2;
 +	ffa_print_error_log(FFA_PARTITION_INFO_GET, ffa_errno);
 +
 +	return ffa_to_std_errno(ffa_errno);
@@ -1448,19 +1483,21 @@ index 0000000000..41c7b96e68
 + * Mode 1: When getting from the driver the number of
 + *	secure partitions:
 + *	@uuid_str: pointer to the UUID string
-+ *	@parts_size: pointer to the variable that contains the number of par=
titions
++ *	@sp_count: pointer to the variable that contains the number of parti=
tions
 + *			 The variable will be set by the driver
 + *	@buffer: NULL
 + *
 + * Mode 2: When requesting the driver to return the
 + *	partitions information:
++ *	@dev: The arm_ffa bus device
 + *	@uuid_str: pointer to the UUID string
-+ *	@parts_size: pointer to the size of the SPs information buffer in by=
tes
++ *	@sp_count: pointer to the variable that contains the number of empty=
 partition descriptors
++ *			 The variable will be read by the driver
 + *	@buffer: pointer to SPs information buffer
-+ *		(allocated by the client).
++ *		(allocated by the client and contains empty @sp_count descriptors).
 + *		The buffer will be filled by the driver
 + *
-+ * This is the boot time function that queries the secure partition dat=
a from
++ * This function queries the secure partition data from
 + * the private data structure. If not found, it invokes FFA_PARTITION_I=
NFO_GET
 + * FF-A function to query the partition information from secure world.
 + *
@@ -1491,27 +1528,25 @@ index 0000000000..41c7b96e68
 + *
 + * Return:
 + *
-+ * @parts_size: When pointing to the number of partitions variable, the=
 number is
++ * @sp_count: When pointing to the number of partitions variable, the n=
umber is
 + * set by the driver.
 + * When pointing to the partitions information buffer size, the buffer =
will be
 + * filled by the driver.
 + *
 + * On success 0 is returned. Otherwise, failure
 + */
-+static int ffa_get_partitions_info(const char *uuid_str,
-+				   u32 *parts_size, struct ffa_partition_info *buffer)
++static int ffa_get_partitions_info(struct udevice *dev, const char *uui=
d_str,
++				   u32 *sp_count, struct ffa_partition_info *buffer)
 +{
 +	/*
 +	 * fill_data:
 +	 * 0: return the SP count
 +	 * 1: fill SP data and return it to the caller
-+	 * -1: undefined mode
 +	 */
-+	int fill_data =3D -1;
++	bool fill_data =3D 0;
 +	u32 desc_idx, client_desc_idx;
 +	struct ffa_partition_uuid part_uuid =3D {0};
-+	u32 client_desc_max_cnt;
-+	u32 parts_found =3D 0;
++	u32 sp_found =3D 0;
 +
 +	if (!ffa_priv_data->partitions.count || !ffa_priv_data->partitions.des=
cs) {
 +		ffa_err("no partition installed");
@@ -1523,12 +1558,12 @@ index 0000000000..41c7b96e68
 +		return -EINVAL;
 +	}
 +
-+	if (!parts_size) {
++	if (!sp_count) {
 +		ffa_err("no size/count provided");
 +		return -EINVAL;
 +	}
 +
-+	if (be_uuid_str_to_le_bin(uuid_str, (unsigned char *)&part_uuid)) {
++	if (uuid_str_to_le_bin(uuid_str, (unsigned char *)&part_uuid)) {
 +		ffa_err("invalid UUID");
 +		return -EINVAL;
 +	}
@@ -1540,19 +1575,13 @@ index 0000000000..41c7b96e68
 +
 +		ffa_info("Preparing for checking partitions count");
 +
-+	} else if ((*parts_size >=3D sizeof(struct ffa_partition_info)) &&
-+		   !(*parts_size % sizeof(struct ffa_partition_info))) {
++	} else if (*sp_count) {
 +		/* Mode 2: retrieving the partitions information */
 +
 +		fill_data =3D 1;
 +
 +		client_desc_idx =3D 0;
 +
-+		/*
-+		 * number of empty descriptors preallocated by the caller
-+		 */
-+		client_desc_max_cnt =3D *parts_size / sizeof(struct ffa_partition_inf=
o);
-+
 +		ffa_info("Preparing for filling partitions info");
 +
 +	} else {
@@ -1573,14 +1602,14 @@ index 0000000000..41c7b96e68
 +			ffa_info("Partition ID %x matches the provided UUID",
 +				 ffa_priv_data->partitions.descs[desc_idx].info.id);
 +
-+			parts_found++;
++			sp_found++;
 +
 +			if (fill_data) {
 +				/*
 +				 * trying to fill the partition info in the input buffer
 +				 */
 +
-+				if (client_desc_idx < client_desc_max_cnt) {
++				if (client_desc_idx < *sp_count) {
 +					buffer[client_desc_idx++] =3D
 +						ffa_priv_data->partitions.descs[desc_idx].info;
 +					continue;
@@ -1592,27 +1621,28 @@ index 0000000000..41c7b96e68
 +		}
 +	}
 +
-+	if (!parts_found) {
++	if (!sp_found) {
 +		int ret;
 +
 +		ffa_info("No partition found. Querying framework ...");
 +
-+		ret =3D ffa_query_partitions_info(&part_uuid, &parts_found);
++		ret =3D ffa_query_partitions_info(&part_uuid, &sp_found);
 +
 +		if (ret =3D=3D 0) {
 +			if (!fill_data) {
-+				*parts_size =3D parts_found;
++				*sp_count =3D sp_found;
 +
 +				ffa_info("Number of partition(s) found matching the UUID: %d",
-+					 parts_found);
++					 sp_found);
 +			} else {
 +				/*
 +				 * If SPs data detected, they are already in the private data
 +				 * structure, retry searching SP data again to return them
 +				 *  to the caller
 +				 */
-+				if (parts_found)
-+					ret =3D ffa_get_partitions_info(uuid_str, parts_size, buffer);
++				if (sp_found)
++					ret =3D ffa_get_partitions_info(dev, uuid_str, sp_count,
++								      buffer);
 +				else
 +					ret =3D -ENODATA;
 +			}
@@ -1623,7 +1653,7 @@ index 0000000000..41c7b96e68
 +
 +	/* partition(s) found */
 +	if (!fill_data)
-+		*parts_size =3D parts_found;
++		*sp_count =3D sp_found;
 +
 +	return 0;
 +}
@@ -1631,7 +1661,7 @@ index 0000000000..41c7b96e68
 +/**
 + * ffa_cache_partitions_info - Queries and saves all secure partitions =
data
 + *
-+ * This is a boot time function that invokes FFA_PARTITION_INFO_GET FF-=
A
++ * This function invokes FFA_PARTITION_INFO_GET FF-A
 + * function to query from secure world all partitions information.
 + *
 + * The FFA_PARTITION_INFO_GET call is issued with nil UUID as an argume=
nt.
@@ -1653,10 +1683,12 @@ index 0000000000..41c7b96e68
 +
 +/**
 + * ffa_msg_send_direct_req - FFA_MSG_SEND_DIRECT_{REQ,RESP} handler fun=
ction
++ * @dev: The arm_ffa bus device
 + * @dst_part_id: destination partition ID
 + * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
 + *
-+ * This is the runtime function that implements FFA_MSG_SEND_DIRECT_{RE=
Q,RESP}
++ * This function implements FFA_MSG_SEND_DIRECT_{REQ,RESP}
 + * FF-A functions.
 + *
 + * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
@@ -1671,10 +1703,12 @@ index 0000000000..41c7b96e68
 + *
 + * 0 on success. Otherwise, failure
 + */
-+static int __ffa_runtime ffa_msg_send_direct_req(u16 dst_part_id, struc=
t ffa_send_direct_data *msg)
++static int ffa_msg_send_direct_req(struct udevice *dev, u16 dst_part_id=
,
++				   struct ffa_send_direct_data *msg, bool is_smc64)
 +{
 +	ffa_value_t res =3D {0};
 +	int ffa_errno;
++	u64 req_mode, resp_mode;
 +
 +	if (!ffa_priv_data || !ffa_priv_data->invoke_ffa_fn)
 +		return -EINVAL;
@@ -1683,8 +1717,16 @@ index 0000000000..41c7b96e68
 +	if (!ffa_priv_data->partitions.count || !ffa_priv_data->partitions.des=
cs)
 +		return -ENODEV;
 +
++	if (is_smc64) {
++		req_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ);
++		resp_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
++	} else {
++		req_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_REQ);
++		resp_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_RESP);
++	}
++
 +	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ),
++			.a0 =3D req_mode,
 +			.a1 =3D PREP_SELF_ENDPOINT_ID(ffa_priv_data->id) |
 +				PREP_PART_ENDPOINT_ID(dst_part_id),
 +			.a2 =3D 0,
@@ -1698,7 +1740,7 @@ index 0000000000..41c7b96e68
 +	while (res.a0 =3D=3D FFA_SMC_32(FFA_INTERRUPT))
 +		ffa_priv_data->invoke_ffa_fn((ffa_value_t){
 +			.a0 =3D FFA_SMC_32(FFA_RUN),
-+			.a1 =3D res.a1, .a2 =3D 0, .a3 =3D 0, .a4 =3D 0, .a5 =3D 0, .a6 =3D =
0, .a7 =3D 0,
++			.a1 =3D res.a1,
 +			}, &res);
 +
 +	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
@@ -1706,7 +1748,7 @@ index 0000000000..41c7b96e68
 +		return 0;
 +	}
 +
-+	if (res.a0 =3D=3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP)) {
++	if (res.a0 =3D=3D resp_mode) {
 +		/*
 +		 * Message sent with response
 +		 * extract the return data
@@ -1720,7 +1762,7 @@ index 0000000000..41c7b96e68
 +		return 0;
 +	}
 +
-+	ffa_errno =3D (int)res.a2;
++	ffa_errno =3D res.a2;
 +	return ffa_to_std_errno(ffa_errno);
 +}
 +
@@ -1733,7 +1775,7 @@ index 0000000000..41c7b96e68
 + *
 + * Return: void
 + */
-+void __ffa_runtime __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
++void __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
 +{
 +	arm_smccc_1_2_smc(&args, res);
 +}
@@ -1741,7 +1783,7 @@ index 0000000000..41c7b96e68
 +/**
 + * ffa_set_smc_conduit - Set the SMC conduit
 + *
-+ * This boot time function selects the SMC conduit by setting the drive=
r invoke function
++ * This function selects the SMC conduit by setting the driver invoke f=
unction
 + * to SMC assembly function
 + *
 + * Return:
@@ -1779,7 +1821,7 @@ index 0000000000..41c7b96e68
 + * ffa_alloc_prvdata - allocate the driver main data structure and sets=
 the device
 + * @dev:	the arm_ffa device
 + *
-+ * This boot time function creates the main data structure embedding al=
l the driver data.
++ * This function creates the main data structure embedding all the driv=
er data.
 + *
 + * Return:
 + *
@@ -1879,7 +1921,7 @@ index 0000000000..41c7b96e68
 +{
 +	ffa_info("removing the device");
 +
-+	ffa_unmap_rxtx_buffers();
++	ffa_unmap_rxtx_buffers(dev);
 +
 +	if (ffa_priv_data->pair.rxbuf || ffa_priv_data->pair.txbuf)
 +		ffa_free_rxtx_buffers();
@@ -1908,9 +1950,9 @@ index 0000000000..41c7b96e68
 + * ffa_bus_ops_get - bus driver operations getter
 + *
 + * Return:
-+ * This runtime function returns a pointer to the driver operations str=
ucture
++ * This function returns a pointer to the driver operations structure
 + */
-+const struct ffa_bus_ops * __ffa_runtime ffa_bus_ops_get(void)
++const struct ffa_bus_ops *ffa_bus_ops_get(void)
 +{
 +	return &ffa_priv_data->ffa_ops;
 +}
@@ -1919,20 +1961,20 @@ index 0000000000..41c7b96e68
 + * ffa_bus_prvdata_get - bus driver private data getter
 + *
 + * Return:
-+ * This boot time function returns a pointer to the main private data s=
tructure
++ * This function returns a pointer to the main private data structure
 + */
-+struct ffa_prvdata **ffa_bus_prvdata_get(void)
++struct ffa_prvdata *ffa_bus_prvdata_get(void)
 +{
-+	return &ffa_priv_data;
++	return ffa_priv_data;
 +}
 +
 +/**
-+ * ffa_bus_discover - discover FF-A bus and probe the arm_ffa device
++ * ffa_bus_discover - discover FF-A bus and probe arm_ffa device
++ * @pdev: the address of a device pointer (to be filled when the arm_ff=
a bus device is created
++ *       successfully)
 + *
-+ * This boot time function makes sure the FF-A bus is discoverable.
-+ * Then, the arm_ffa device is probed and ready to use.
-+ * This function is called automatically at initcalls
-+ * level (after u-boot relocation).
++ * This function makes sure the FF-A bus is discoverable.
++ * When probing succeeds FF-A discovery is done. The arm_ffa device is =
ready to use.
 + *
 + * When the bus was already discovered successfully the discovery will =
not run again.
 + *
@@ -1944,12 +1986,12 @@ index 0000000000..41c7b96e68
 + *
 + * 0 on success. Otherwise, failure
 + */
-+int ffa_bus_discover(void)
++int ffa_bus_discover(struct udevice **pdev)
 +{
 +	int ret =3D 0;
 +
-+	if (!ffa_priv_data)
-+		ret =3D ffa_device_get();
++	if (!ffa_priv_data) {
++		ret =3D ffa_device_get(pdev);
 +
 +	return ret;
 +}
@@ -1965,112 +2007,12 @@ index 0000000000..41c7b96e68
 +	.remove		=3D ffa_remove,
 +	.unbind		=3D ffa_unbind,
 +};
-diff --git a/drivers/firmware/arm-ffa/efi_ffa_runtime_data_mgr.c b/drive=
rs/firmware/arm-ffa/efi_ffa_runtime_data_mgr.c
-new file mode 100644
-index 0000000000..c76cf2147b
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/efi_ffa_runtime_data_mgr.c
-@@ -0,0 +1,94 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include "arm_ffa_prv.h"
-+
-+/**
-+ * ffa_copy_runtime_data - copy the private data structure  to the runt=
ime area
-+ *
-+ * This boot time function copies the arm_ffa driver data structures in=
cluding
-+ *  partitions data to the EFI runtime data section.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+efi_status_t ffa_copy_runtime_data(void)
-+{
-+	efi_status_t efi_ret;
-+	efi_uintn_t prvdata_pages;
-+	efi_uintn_t descs_pages;
-+	struct ffa_prvdata **prvdata =3D NULL; /* Pointer to the current struc=
ture */
-+	struct ffa_prvdata *runtime_prvdata =3D NULL; /* Pointer to the struct=
ure runtime copy */
-+	u64 runtime_descs =3D 0;
-+
-+	prvdata =3D ffa_bus_prvdata_get();
-+
-+	printf("INFO: EFI: FFA: prv data area at 0x%llx\n", (u64)prvdata);
-+
-+	/* allocate private data runtime area */
-+
-+	prvdata_pages =3D efi_size_in_pages(sizeof(struct ffa_prvdata));
-+	efi_ret =3D efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES,
-+				     EFI_RUNTIME_SERVICES_DATA,
-+				     prvdata_pages,
-+				     (u64 *)&runtime_prvdata);
-+
-+	if (efi_ret !=3D EFI_SUCCESS) {
-+		printf("ERROR: EFI: FFA: allocating runtime data (err: 0x%lx, addr 0x=
%llx)\n",
-+		       efi_ret, (u64)runtime_prvdata);
-+
-+		return efi_ret;
-+	}
-+
-+	printf("INFO: EFI: FFA: runtime data area at 0x%llx\n", (u64)runtime_p=
rvdata);
-+
-+	if (!runtime_prvdata)
-+		return EFI_INVALID_PARAMETER;
-+
-+	/* allocate the partition data runtime area */
-+
-+	descs_pages =3D efi_size_in_pages((*prvdata)->partitions.count *
-+					sizeof(struct ffa_partition_desc));
-+	efi_ret =3D efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES,
-+				     EFI_RUNTIME_SERVICES_DATA,
-+				     descs_pages,
-+				     &runtime_descs);
-+
-+	if (efi_ret !=3D EFI_SUCCESS) {
-+		printf("ERROR: EFI: FFA: allocating runtime SPs data (err: 0x%lx, add=
r 0x%llx)\n",
-+		       efi_ret, runtime_descs);
-+
-+		efi_free_pages((u64)runtime_prvdata, prvdata_pages);
-+
-+		return efi_ret;
-+	}
-+
-+	printf("INFO: EFI: FFA: SPs runtime area at 0x%llx\n", (u64)runtime_de=
scs);
-+
-+	if (!runtime_descs)
-+		return EFI_INVALID_PARAMETER;
-+
-+	*runtime_prvdata =3D **prvdata;
-+
-+	runtime_prvdata->dev =3D NULL;
-+	runtime_prvdata->ffa_ops.partition_info_get =3D NULL;
-+	runtime_prvdata->ffa_ops.rxtx_unmap =3D NULL;
-+	runtime_prvdata->partitions.descs =3D (struct ffa_partition_desc *)run=
time_descs;
-+	runtime_prvdata->pair.rxbuf =3D 0;
-+	runtime_prvdata->pair.txbuf =3D 0;
-+
-+	/*
-+	 * Update the private data structure pointer in the driver
-+	 * no need to free the old structure. devm takes care of that
-+	 */
-+	*prvdata =3D runtime_prvdata;
-+
-+	printf("INFO: EFI: FFA: runtime prv data now at 0x%llx , SPs count %d\=
n",
-+	       (u64)*prvdata, (*prvdata)->partitions.count);
-+
-+	return 0;
-+}
 diff --git a/include/arm_ffa.h b/include/arm_ffa.h
 new file mode 100644
-index 0000000000..f17b100497
+index 0000000000..74b16174c2
 --- /dev/null
 +++ b/include/arm_ffa.h
-@@ -0,0 +1,127 @@
+@@ -0,0 +1,97 @@
 +/* SPDX-License-Identifier: GPL-2.0+ */
 +/*
 + * (C) Copyright 2022 ARM Limited
@@ -2103,7 +2045,7 @@ index 0000000000..f17b100497
 + * Data structure containing information about partitions instantiated =
in the system
 + * This structure is filled with the data queried by FFA_PARTITION_INFO=
_GET
 + */
-+struct  __packed ffa_partition_info {
++struct ffa_partition_info {
 +	u16 id;
 +	u16 exec_ctxt;
 +/* partition supports receipt of direct requests */
@@ -2125,7 +2067,7 @@ index 0000000000..f17b100497
 + */
 +
 +/* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via regi=
sters */
-+struct __packed ffa_send_direct_data {
++struct ffa_send_direct_data {
 +	unsigned long data0; /* w3/x3 */
 +	unsigned long data1; /* w4/x4 */
 +	unsigned long data2; /* w5/x5 */
@@ -2133,30 +2075,7 @@ index 0000000000..f17b100497
 +	unsigned long data4; /* w7/x7 */
 +};
 +
-+#if CONFIG_IS_ENABLED(ARM_FFA_EFI_RUNTIME_MODE)
-+
-+#include <efi_loader.h>
-+
-+/*
-+ *  __ffa_runtime - controls whether functions are
-+ * available after calling the EFI ExitBootServices service.
-+ * Functions tagged with these keywords are resident (available at boot=
 time and
-+ * at runtime)
-+ */
-+
-+#define __ffa_runtime_data __efi_runtime_data
-+#define __ffa_runtime __efi_runtime
-+
-+#else
-+
-+/*
-+ *  The FF-A driver is independent from EFI
-+ */
-+
-+#define __ffa_runtime_data
-+#define __ffa_runtime
-+
-+#endif
++struct udevice;
 +
 +/**
 + * struct ffa_bus_ops - The driver operations structure
@@ -2168,10 +2087,12 @@ index 0000000000..f17b100497
 + * This structure is EFI runtime resident.
 + */
 +struct ffa_bus_ops {
-+	int (*partition_info_get)(const char *uuid_str,
-+				  u32 *parts_size, struct ffa_partition_info *buffer);
-+	int (*sync_send_receive)(u16 dst_part_id, struct ffa_send_direct_data =
*msg);
-+	int (*rxtx_unmap)(void);
++	int (*partition_info_get)(struct udevice *dev, const char *uuid_str,
++				  u32 *sp_count, struct ffa_partition_info *buffer);
++	int (*sync_send_receive)(struct udevice *dev, u16 dst_part_id,
++				 struct ffa_send_direct_data *msg,
++				 bool is_smc64);
++	int (*rxtx_unmap)(struct udevice *dev);
 +};
 +
 +/**
@@ -2181,65 +2102,36 @@ index 0000000000..f17b100497
 +/**
 + * ffa_bus_ops_get - driver operations getter
 + */
-+const struct ffa_bus_ops * __ffa_runtime ffa_bus_ops_get(void);
++const struct ffa_bus_ops *ffa_bus_ops_get(void);
 +
 +/**
 + * ffa_bus_discover - discover FF-A bus and probes the arm_ffa device
 + */
-+int ffa_bus_discover(void);
-+
-+#if CONFIG_IS_ENABLED(ARM_FFA_EFI_RUNTIME_MODE)
-+
-+/**
-+ * ffa_copy_runtime_data - copy the private data structure and the SPs =
data to the runtime area
-+ */
-+efi_status_t ffa_copy_runtime_data(void);
-+
-+#endif
++int ffa_bus_discover(struct udevice **pdev);
 +
 +#endif
 diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
-index 3ba69ad9a0..7324418245 100644
+index a432e43871..5dd698b7a9 100644
 --- a/include/dm/uclass-id.h
 +++ b/include/dm/uclass-id.h
-@@ -55,6 +55,7 @@ enum uclass_id {
+@@ -4,6 +4,9 @@
+  *
+  * (C) Copyright 2012
+  * Pavel Herrmann <morpheus.ibis@gmail.com>
++ *
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+=20
+ #ifndef _DM_UCLASS_ID_H
+@@ -55,6 +58,7 @@ enum uclass_id {
  	UCLASS_EFI_MEDIA,	/* Devices provided by UEFI firmware */
  	UCLASS_ETH,		/* Ethernet device */
  	UCLASS_ETH_PHY,		/* Ethernet PHY device */
 +	UCLASS_FFA,		/* Arm Firmware Framework for Armv8-A */
  	UCLASS_FIRMWARE,	/* Firmware */
+ 	UCLASS_FUZZING_ENGINE,	/* Fuzzing engine */
  	UCLASS_FS_FIRMWARE_LOADER,		/* Generic loader */
- 	UCLASS_GPIO,		/* Bank of general-purpose I/O pins */
-diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 4da64b5d29..0ec002ac8b 100644
---- a/lib/efi_loader/efi_boottime.c
-+++ b/lib/efi_loader/efi_boottime.c
-@@ -23,6 +23,10 @@
- #include <asm/setjmp.h>
- #include <linux/libfdt_env.h>
-=20
-+#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
-+#include <arm_ffa.h>
-+#endif
-+
- DECLARE_GLOBAL_DATA_PTR;
-=20
- /* Task priority level */
-@@ -2173,6 +2177,14 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
- 		dm_remove_devices_flags(DM_REMOVE_ACTIVE_ALL);
- 	}
-=20
-+#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
-+		/* unmap FF-A RX/TX buffers */
-+		if (ffa_bus_ops_get()->rxtx_unmap())
-+			debug("[efi_boottime][ERROR]: can not unmap FF-A RX/TX buffers\n");
-+		else
-+			debug("[efi_boottime][INFO]: FF-A RX/TX buffers unmapped\n");
-+#endif
-+
- 	/* Patch out unsupported runtime function */
- 	efi_runtime_detach();
-=20
 --=20
 2.17.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb=
-common-move-urb-code-to-common.patch b/meta-arm-bsp/recipes-bsp/u-boot/u=
-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
deleted file mode 100644
index 7e726fea..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common=
-move-urb-code-to-common.patch
+++ /dev/null
@@ -1,498 +0,0 @@
-From 178da5bee196f44c4c10e9804674fe5ac0bc1176 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Mon, 28 Jun 2021 23:20:55 +0100
-Subject: [PATCH 03/26] usb: common: move urb code to common
-
-Move urb code from musb only use to a more common scope, so other
-drivers in the future can use the handling of urb in usb.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Accepted [2022.10-rc1]
----
- drivers/usb/common/Makefile                   |   2 +
- drivers/usb/common/usb_urb.c                  | 160 ++++++++++++++++++
- drivers/usb/host/r8a66597-hcd.c               |  30 +---
- drivers/usb/musb-new/musb_core.c              |   2 +-
- drivers/usb/musb-new/musb_host.c              |   2 +-
- drivers/usb/musb-new/musb_host.h              |   2 +-
- drivers/usb/musb-new/musb_uboot.c             |  38 +----
- drivers/usb/musb-new/musb_uboot.h             |   2 +-
- .../linux/usb/usb_urb_compat.h                |  46 ++++-
- include/usb_defs.h                            |  32 ++++
- 10 files changed, 240 insertions(+), 76 deletions(-)
- create mode 100644 drivers/usb/common/usb_urb.c
- rename drivers/usb/musb-new/usb-compat.h =3D> include/linux/usb/usb_urb=
_compat.h (60%)
-
-diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
-index 3bedbf213f..dc05cb0a50 100644
---- a/drivers/usb/common/Makefile
-+++ b/drivers/usb/common/Makefile
-@@ -4,5 +4,7 @@
- #
-=20
- obj-$(CONFIG_$(SPL_)DM_USB) +=3D common.o
-+obj-$(CONFIG_USB_MUSB_HCD) +=3D usb_urb.o
-+obj-$(CONFIG_USB_MUSB_UDC) +=3D usb_urb.o
- obj-$(CONFIG_USB_EHCI_FSL) +=3D fsl-dt-fixup.o fsl-errata.o
- obj-$(CONFIG_USB_XHCI_FSL) +=3D fsl-dt-fixup.o fsl-errata.o
-diff --git a/drivers/usb/common/usb_urb.c b/drivers/usb/common/usb_urb.c
-new file mode 100644
-index 0000000000..be3b6b9f32
---- /dev/null
-+++ b/drivers/usb/common/usb_urb.c
-@@ -0,0 +1,160 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Common code for usb urb handling, based on the musb-new code
-+ *
-+ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
-+ *
-+ */
-+
-+#include <dm/device.h>
-+#include <dm/device_compat.h>
-+#include <linux/usb/usb_urb_compat.h>
-+
-+#include <time.h>
-+#include <usb.h>
-+
-+#if CONFIG_IS_ENABLED(DM_USB)
-+struct usb_device *usb_dev_get_parent(struct usb_device *udev)
-+{
-+	struct udevice *parent =3D udev->dev->parent;
-+
-+	/*
-+	 * When called from usb-uclass.c: usb_scan_device() udev->dev points
-+	 * to the parent udevice, not the actual udevice belonging to the
-+	 * udev as the device is not instantiated yet.
-+	 *
-+	 * If dev is an usb-bus, then we are called from usb_scan_device() for
-+	 * an usb-device plugged directly into the root port, return NULL.
-+	 */
-+	if (device_get_uclass_id(udev->dev) =3D=3D UCLASS_USB)
-+		return NULL;
-+
-+	/*
-+	 * If these 2 are not the same we are being called from
-+	 * usb_scan_device() and udev itself is the parent.
-+	 */
-+	if (dev_get_parent_priv(udev->dev) !=3D udev)
-+		return udev;
-+
-+	/* We are being called normally, use the parent pointer */
-+	if (device_get_uclass_id(parent) =3D=3D UCLASS_USB_HUB)
-+		return dev_get_parent_priv(parent);
-+
-+	return NULL;
-+}
-+#else
-+struct usb_device *usb_dev_get_parent(struct usb_device *udev)
-+{
-+	return udev->parent;
-+}
-+#endif
-+
-+static void usb_urb_complete(struct urb *urb)
-+{
-+	urb->dev->status &=3D ~USB_ST_NOT_PROC;
-+	urb->dev->act_len =3D urb->actual_length;
-+
-+	if (urb->status =3D=3D -EINPROGRESS)
-+		urb->status =3D 0;
-+}
-+
-+void usb_urb_fill(struct urb *urb, struct usb_host_endpoint *hep,
-+		  struct usb_device *dev, int endpoint_type,
-+		  unsigned long pipe, void *buffer, int len,
-+		  struct devrequest *setup, int interval)
-+{
-+	int epnum =3D usb_pipeendpoint(pipe);
-+	int is_in =3D usb_pipein(pipe);
-+	u16 maxpacketsize =3D is_in ? dev->epmaxpacketin[epnum] :
-+					dev->epmaxpacketout[epnum];
-+
-+	memset(urb, 0, sizeof(struct urb));
-+	memset(hep, 0, sizeof(struct usb_host_endpoint));
-+	INIT_LIST_HEAD(&hep->urb_list);
-+	INIT_LIST_HEAD(&urb->urb_list);
-+	urb->ep =3D hep;
-+	urb->complete =3D usb_urb_complete;
-+	urb->status =3D -EINPROGRESS;
-+	urb->dev =3D dev;
-+	urb->pipe =3D pipe;
-+	urb->transfer_buffer =3D buffer;
-+	urb->transfer_dma =3D (unsigned long)buffer;
-+	urb->transfer_buffer_length =3D len;
-+	urb->setup_packet =3D (unsigned char *)setup;
-+
-+	urb->ep->desc.wMaxPacketSize =3D __cpu_to_le16(maxpacketsize);
-+	urb->ep->desc.bmAttributes =3D endpoint_type;
-+	urb->ep->desc.bEndpointAddress =3D ((is_in ? USB_DIR_IN : USB_DIR_OUT)=
 |
-+					  epnum);
-+	urb->ep->desc.bInterval =3D interval;
-+}
-+
-+int usb_urb_submit(struct usb_hcd *hcd, struct urb *urb)
-+{
-+	const struct usb_urb_ops *ops =3D hcd->urb_ops;
-+	unsigned long timeout;
-+	int ret;
-+
-+	if (!ops)
-+		return -EINVAL;
-+
-+	ret =3D ops->urb_enqueue(hcd, urb, 0);
-+	if (ret < 0) {
-+		printf("Failed to enqueue URB to controller\n");
-+		return ret;
-+	}
-+
-+	timeout =3D get_timer(0) + USB_TIMEOUT_MS(urb->pipe);
-+	do {
-+		if (ctrlc())
-+			return -EIO;
-+		ops->isr(0, hcd);
-+	} while (urb->status =3D=3D -EINPROGRESS && get_timer(0) < timeout);
-+
-+	if (urb->status =3D=3D -EINPROGRESS)
-+		ops->urb_dequeue(hcd, urb, -ETIME);
-+
-+	return urb->status;
-+}
-+
-+int usb_urb_submit_control(struct usb_hcd *hcd, struct urb *urb,
-+			   struct usb_host_endpoint *hep,
-+			   struct usb_device *dev, unsigned long pipe,
-+			   void *buffer, int len, struct devrequest *setup,
-+			   int interval, enum usb_device_speed speed)
-+{
-+	const struct usb_urb_ops *ops =3D hcd->urb_ops;
-+
-+	usb_urb_fill(urb, hep, dev, USB_ENDPOINT_XFER_CONTROL, pipe, buffer,
-+		     len, setup, 0);
-+
-+	/* Fix speed for non hub-attached devices */
-+	if (!usb_dev_get_parent(dev)) {
-+		dev->speed =3D speed;
-+		if (ops->hub_control)
-+			return ops->hub_control(hcd, dev, pipe, buffer, len,
-+						setup);
-+	}
-+
-+	return usb_urb_submit(hcd, urb);
-+}
-+
-+int usb_urb_submit_bulk(struct usb_hcd *hcd, struct urb *urb,
-+			struct usb_host_endpoint *hep, struct usb_device *dev,
-+			unsigned long pipe, void *buffer, int len)
-+{
-+	usb_urb_fill(urb, hep, dev, USB_ENDPOINT_XFER_BULK, pipe, buffer, len,
-+		     NULL, 0);
-+
-+	return usb_urb_submit(hcd, urb);
-+}
-+
-+int usb_urb_submit_irq(struct usb_hcd *hcd, struct urb *urb,
-+		       struct usb_host_endpoint *hep, struct usb_device *dev,
-+		       unsigned long pipe, void *buffer, int len, int interval)
-+{
-+	usb_urb_fill(urb, hep, dev, USB_ENDPOINT_XFER_INT, pipe, buffer, len,
-+		     NULL, interval);
-+
-+	return usb_urb_submit(hcd, urb);
-+}
-diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597=
-hcd.c
-index f1fc93f3d4..3ccbc16da3 100644
---- a/drivers/usb/host/r8a66597-hcd.c
-+++ b/drivers/usb/host/r8a66597-hcd.c
-@@ -14,6 +14,7 @@
- #include <dm/device_compat.h>
- #include <linux/delay.h>
- #include <linux/iopoll.h>
-+#include <linux/usb/usb_urb_compat.h>
- #include <power/regulator.h>
-=20
- #include "r8a66597.h"
-@@ -24,35 +25,6 @@
- #define R8A66597_DPRINT(...)
- #endif
-=20
--static inline struct usb_device *usb_dev_get_parent(struct usb_device *=
udev)
--{
--	struct udevice *parent =3D udev->dev->parent;
--
--	/*
--	 * When called from usb-uclass.c: usb_scan_device() udev->dev points
--	 * to the parent udevice, not the actual udevice belonging to the
--	 * udev as the device is not instantiated yet.
--	 *
--	 * If dev is an usb-bus, then we are called from usb_scan_device() for
--	 * an usb-device plugged directly into the root port, return NULL.
--	 */
--	if (device_get_uclass_id(udev->dev) =3D=3D UCLASS_USB)
--		return NULL;
--
--	/*
--	 * If these 2 are not the same we are being called from
--	 * usb_scan_device() and udev itself is the parent.
--	 */
--	if (dev_get_parent_priv(udev->dev) !=3D udev)
--		return udev;
--
--	/* We are being called normally, use the parent pointer */
--	if (device_get_uclass_id(parent) =3D=3D UCLASS_USB_HUB)
--		return dev_get_parent_priv(parent);
--
--	return NULL;
--}
--
- static void get_hub_data(struct usb_device *dev, u16 *hub_devnum, u16 *=
hubport)
- {
- 	struct usb_device *parent =3D usb_dev_get_parent(dev);
-diff --git a/drivers/usb/musb-new/musb_core.c b/drivers/usb/musb-new/mus=
b_core.c
-index 18d9bc805f..fc7af7484e 100644
---- a/drivers/usb/musb-new/musb_core.c
-+++ b/drivers/usb/musb-new/musb_core.c
-@@ -89,9 +89,9 @@
- #include <linux/usb/ch9.h>
- #include <linux/usb/gadget.h>
- #include <linux/usb/musb.h>
-+#include <linux/usb/usb_urb_compat.h>
- #include <asm/io.h>
- #include "linux-compat.h"
--#include "usb-compat.h"
- #endif
-=20
- #include "musb_core.h"
-diff --git a/drivers/usb/musb-new/musb_host.c b/drivers/usb/musb-new/mus=
b_host.c
-index acb2d40f3b..e5905d90d6 100644
---- a/drivers/usb/musb-new/musb_host.c
-+++ b/drivers/usb/musb-new/musb_host.c
-@@ -26,8 +26,8 @@
- #include <dm/device_compat.h>
- #include <usb.h>
- #include <linux/bug.h>
-+#include <linux/usb/usb_urb_compat.h>
- #include "linux-compat.h"
--#include "usb-compat.h"
- #endif
-=20
- #include "musb_core.h"
-diff --git a/drivers/usb/musb-new/musb_host.h b/drivers/usb/musb-new/mus=
b_host.h
-index afc8fa35a7..5a604bdb0c 100644
---- a/drivers/usb/musb-new/musb_host.h
-+++ b/drivers/usb/musb-new/musb_host.h
-@@ -10,7 +10,7 @@
- #ifndef _MUSB_HOST_H
- #define _MUSB_HOST_H
- #ifdef __UBOOT__
--#include "usb-compat.h"
-+#include <linux/usb/usb_urb_compat.h>
- #endif
-=20
- static inline struct usb_hcd *musb_to_hcd(struct musb *musb)
-diff --git a/drivers/usb/musb-new/musb_uboot.c b/drivers/usb/musb-new/mu=
sb_uboot.c
-index 61ff68def2..d186facc7e 100644
---- a/drivers/usb/musb-new/musb_uboot.c
-+++ b/drivers/usb/musb-new/musb_uboot.c
-@@ -8,10 +8,10 @@
- #include <linux/errno.h>
- #include <linux/usb/ch9.h>
- #include <linux/usb/gadget.h>
-+#include <linux/usb/usb_urb_compat.h>
-=20
- #include <usb.h>
- #include "linux-compat.h"
--#include "usb-compat.h"
- #include "musb_core.h"
- #include "musb_host.h"
- #include "musb_gadget.h"
-@@ -453,39 +453,3 @@ struct musb *musb_register(struct musb_hdrc_platfor=
m_data *plat, void *bdata,
-=20
- 	return *musbp;
- }
--
--#if CONFIG_IS_ENABLED(DM_USB)
--struct usb_device *usb_dev_get_parent(struct usb_device *udev)
--{
--	struct udevice *parent =3D udev->dev->parent;
--
--	/*
--	 * When called from usb-uclass.c: usb_scan_device() udev->dev points
--	 * to the parent udevice, not the actual udevice belonging to the
--	 * udev as the device is not instantiated yet.
--	 *
--	 * If dev is an usb-bus, then we are called from usb_scan_device() for
--	 * an usb-device plugged directly into the root port, return NULL.
--	 */
--	if (device_get_uclass_id(udev->dev) =3D=3D UCLASS_USB)
--		return NULL;
--
--	/*
--	 * If these 2 are not the same we are being called from
--	 * usb_scan_device() and udev itself is the parent.
--	 */
--	if (dev_get_parent_priv(udev->dev) !=3D udev)
--		return udev;
--
--	/* We are being called normally, use the parent pointer */
--	if (device_get_uclass_id(parent) =3D=3D UCLASS_USB_HUB)
--		return dev_get_parent_priv(parent);
--
--	return NULL;
--}
--#else
--struct usb_device *usb_dev_get_parent(struct usb_device *udev)
--{
--	return udev->parent;
--}
--#endif
-diff --git a/drivers/usb/musb-new/musb_uboot.h b/drivers/usb/musb-new/mu=
sb_uboot.h
-index 18282efccc..6b162f03b1 100644
---- a/drivers/usb/musb-new/musb_uboot.h
-+++ b/drivers/usb/musb-new/musb_uboot.h
-@@ -8,8 +8,8 @@
- #define __MUSB_UBOOT_H__
-=20
- #include <usb.h>
-+#include <linux/usb/usb_urb_compat.h>
- #include "linux-compat.h"
--#include "usb-compat.h"
- #include "musb_core.h"
-=20
- struct musb_host_data {
-diff --git a/drivers/usb/musb-new/usb-compat.h b/include/linux/usb/usb_u=
rb_compat.h
-similarity index 60%
-rename from drivers/usb/musb-new/usb-compat.h
-rename to include/linux/usb/usb_urb_compat.h
-index df68c9220a..5ed96fa64e 100644
---- a/drivers/usb/musb-new/usb-compat.h
-+++ b/include/linux/usb/usb_urb_compat.h
-@@ -1,16 +1,31 @@
--#ifndef __USB_COMPAT_H__
--#define __USB_COMPAT_H__
-+#ifndef __USB_URB_COMPAT_H__
-+#define __USB_URB_COMPAT_H__
-=20
--#include "usb.h"
-+#include <linux/compat.h>
-+#include <usb.h>
-=20
- struct udevice;
-+struct urb;
-+struct usb_hcd;
-+
-+
-+struct usb_urb_ops {
-+	int (*urb_enqueue)(struct usb_hcd *hcd, struct urb *urb,
-+			   gfp_t mem_flags);
-+	int (*urb_dequeue)(struct usb_hcd *hcd, struct urb *urb, int status);
-+	int (*hub_control)(struct usb_hcd *hcd, struct usb_device *dev,
-+			   unsigned long pipe, void *buffer, int len,
-+			   struct devrequest *setup);
-+	irqreturn_t (*isr)(int irq, void *priv);
-+};
-=20
- struct usb_hcd {
- 	void *hcd_priv;
-+	const struct usb_urb_ops *urb_ops;
- };
-=20
- struct usb_host_endpoint {
--	struct usb_endpoint_descriptor		desc;
-+	struct usb_endpoint_descriptor desc;
- 	struct list_head urb_list;
- 	void *hcpriv;
- };
-@@ -23,8 +38,6 @@ struct usb_host_endpoint {
- #define URB_SHORT_NOT_OK	0x0001	/* report short reads as errors */
- #define URB_ZERO_PACKET		0x0040	/* Finish bulk OUT with short packet */
-=20
--struct urb;
--
- typedef void (*usb_complete_t)(struct urb *);
-=20
- struct urb {
-@@ -76,4 +89,25 @@ static inline int usb_hcd_unmap_urb_for_dma(struct us=
b_hcd *hcd,
-  */
- struct usb_device *usb_dev_get_parent(struct usb_device *udev);
-=20
-+int usb_urb_submit_control(struct usb_hcd *hcd, struct urb *urb,
-+			   struct usb_host_endpoint *hep,
-+			   struct usb_device *dev, unsigned long pipe,
-+			   void *buffer, int len, struct devrequest *setup,
-+			   int interval, enum usb_device_speed speed);
-+
-+int usb_urb_submit_bulk(struct usb_hcd *hcd, struct urb *urb,
-+			struct usb_host_endpoint *hep, struct usb_device *dev,
-+			unsigned long pipe, void *buffer, int len);
-+
-+int usb_urb_submit_irq(struct usb_hcd *hcd, struct urb *urb,
-+		       struct usb_host_endpoint *hep, struct usb_device *dev,
-+		       unsigned long pipe, void *buffer, int len, int interval);
-+
-+void usb_urb_fill(struct urb *urb, struct usb_host_endpoint *hep,
-+		  struct usb_device *dev, int endpoint_type,
-+		  unsigned long pipe, void *buffer, int len,
-+		  struct devrequest *setup, int interval);
-+
-+int usb_urb_submit(struct usb_hcd *hcd, struct urb *urb);
-+
- #endif /* __USB_COMPAT_H__ */
-diff --git a/include/usb_defs.h b/include/usb_defs.h
-index 6dd2c997f9..ec00161710 100644
---- a/include/usb_defs.h
-+++ b/include/usb_defs.h
-@@ -81,6 +81,32 @@
- #define EndpointOutRequest \
- 	((USB_DIR_OUT | USB_TYPE_STANDARD | USB_RECIP_INTERFACE) << 8)
-=20
-+/* class requests from the USB 2.0 hub spec, table 11-15 */
-+#define HUB_CLASS_REQ(dir, type, request) ((((dir) | (type)) << 8) | (r=
equest))
-+/* GetBusState and SetHubDescriptor are optional, omitted */
-+#define ClearHubFeature		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_HUB, \
-+					      USB_REQ_CLEAR_FEATURE)
-+#define ClearPortFeature	HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, \
-+					      USB_REQ_CLEAR_FEATURE)
-+#define GetHubDescriptor	HUB_CLASS_REQ(USB_DIR_IN, USB_RT_HUB, \
-+					      USB_REQ_GET_DESCRIPTOR)
-+#define GetHubStatus		HUB_CLASS_REQ(USB_DIR_IN, USB_RT_HUB, \
-+					      USB_REQ_GET_STATUS)
-+#define GetPortStatus		HUB_CLASS_REQ(USB_DIR_IN, USB_RT_PORT, \
-+					      USB_REQ_GET_STATUS)
-+#define SetHubFeature		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_HUB, \
-+					      USB_REQ_SET_FEATURE)
-+#define SetPortFeature		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, \
-+					      USB_REQ_SET_FEATURE)
-+#define ClearTTBuffer		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, \
-+					      HUB_CLEAR_TT_BUFFER)
-+#define ResetTT			HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, \
-+					      HUB_RESET_TT)
-+#define GetTTState		HUB_CLASS_REQ(USB_DIR_IN, USB_RT_PORT, \
-+					      HUB_GET_TT_STATE)
-+#define StopTT			HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, \
-+					      HUB_STOP_TT)
-+
- /* Descriptor types */
- #define USB_DT_DEVICE        0x01
- #define USB_DT_CONFIG        0x02
-@@ -289,10 +315,16 @@
- #define USB_SS_PORT_STAT_C_CONFIG_ERROR	0x0080
-=20
- /* wHubCharacteristics (masks) */
-+#define HUB_CHAR_COMMON_OCPM        0x0000 /* All ports Over-Current re=
porting */
-+#define HUB_CHAR_INDV_PORT_LPSM     0x0001 /* per-port power control */
-+#define HUB_CHAR_NO_LPSM            0x0002 /* no power switching */
- #define HUB_CHAR_LPSM               0x0003
- #define HUB_CHAR_COMPOUND           0x0004
-+#define HUB_CHAR_INDV_PORT_OCPM     0x0008 /* per-port Over-current rep=
orting */
-+#define HUB_CHAR_NO_OCPM            0x0010 /* No Over-current Protectio=
n support */
- #define HUB_CHAR_OCPM               0x0018
- #define HUB_CHAR_TTTT               0x0060 /* TT Think Time mask */
-+#define HUB_CHAR_PORTIND            0x0080 /* per-port indicators (LEDs=
) */
-=20
- /*
-  * Hub Status & Hub Change bit masks
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm=
_ffa-efi-unmap-RX-TX-buffers.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-bo=
ot/corstone1000/0004-arm_ffa-efi-unmap-RX-TX-buffers.patch
new file mode 100644
index 00000000..f20cc28e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-ef=
i-unmap-RX-TX-buffers.patch
@@ -0,0 +1,73 @@
+From 3035651bfc0dcdfd48d28acff6efe2f29bbe9439 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 6 Oct 2022 15:04:25 +0100
+Subject: [PATCH 04/25] arm_ffa: efi: unmap RX/TX buffers
+
+unmap RX/TX buffers at ExitBootServices()
+
+Unmapping the RX/TX buffers created by u-boot is needed before EFI
+runtime.
+
+At EFI runtime the linux kernel takes care of allocating its own RX/TX
+buffers and registering them with the secure world.
+
+Secure world should be using the RX/TX buffers created by the kernel.
+So, RX/TX buffers created by u-boot must be unmapped.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
+
+Changelog:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+v8: pass NULL device pointer to the FF-A bus operation
+v7: replace debug() by log_err()
+---
+ lib/efi_loader/efi_boottime.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
+index 6f7333638a..caa64028be 100644
+--- a/lib/efi_loader/efi_boottime.c
++++ b/lib/efi_loader/efi_boottime.c
+@@ -3,6 +3,9 @@
+  * EFI application boot time services
+  *
+  * Copyright (c) 2016 Alexander Graf
++ *
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+=20
+ #include <common.h>
+@@ -23,6 +26,10 @@
+ #include <asm/setjmp.h>
+ #include <linux/libfdt_env.h>
+=20
++#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
++#include <arm_ffa.h>
++#endif
++
+ DECLARE_GLOBAL_DATA_PTR;
+=20
+ /* Task priority level */
+@@ -2178,6 +2185,12 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
+ 		dm_remove_devices_flags(DM_REMOVE_ACTIVE_ALL);
+ 	}
+=20
++#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
++		/* unmap FF-A RX/TX buffers */
++		if (ffa_bus_ops_get()->rxtx_unmap(NULL))
++			log_err("Can't unmap FF-A RX/TX buffers\n");
++#endif
++
+ 	/* Patch out unsupported runtime function */
+ 	efi_runtime_detach();
+=20
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb=
-add-isp1760-family-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0004-usb-add-isp1760-family-driver.patch
deleted file mode 100644
index 794389e3..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-is=
p1760-family-driver.patch
+++ /dev/null
@@ -1,3806 +0,0 @@
-From 83ba88292211394ce6b3a21fbc0f702dae543290 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Mon, 28 Jun 2021 23:31:25 +0100
-Subject: [PATCH 04/26] usb: add isp1760 family driver
-
-ISP1760/61/63 are a family of usb controllers, blah, blah, more info
-here.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Accepted [2022.10-rc1]
----
- Makefile                            |    1 +
- drivers/usb/Kconfig                 |    2 +
- drivers/usb/common/Makefile         |    1 +
- drivers/usb/isp1760/Kconfig         |   12 +
- drivers/usb/isp1760/Makefile        |    6 +
- drivers/usb/isp1760/isp1760-core.c  |  378 ++++
- drivers/usb/isp1760/isp1760-core.h  |   96 +
- drivers/usb/isp1760/isp1760-hcd.c   | 2574 +++++++++++++++++++++++++++
- drivers/usb/isp1760/isp1760-hcd.h   |   82 +
- drivers/usb/isp1760/isp1760-if.c    |  127 ++
- drivers/usb/isp1760/isp1760-regs.h  |  292 +++
- drivers/usb/isp1760/isp1760-uboot.c |   76 +
- drivers/usb/isp1760/isp1760-uboot.h |   27 +
- 13 files changed, 3674 insertions(+)
- create mode 100644 drivers/usb/isp1760/Kconfig
- create mode 100644 drivers/usb/isp1760/Makefile
- create mode 100644 drivers/usb/isp1760/isp1760-core.c
- create mode 100644 drivers/usb/isp1760/isp1760-core.h
- create mode 100644 drivers/usb/isp1760/isp1760-hcd.c
- create mode 100644 drivers/usb/isp1760/isp1760-hcd.h
- create mode 100644 drivers/usb/isp1760/isp1760-if.c
- create mode 100644 drivers/usb/isp1760/isp1760-regs.h
- create mode 100644 drivers/usb/isp1760/isp1760-uboot.c
- create mode 100644 drivers/usb/isp1760/isp1760-uboot.h
-
-diff --git a/Makefile b/Makefile
-index 98867fbe06..67851020f5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -841,6 +841,7 @@ libs-y +=3D drivers/usb/host/
- libs-y +=3D drivers/usb/mtu3/
- libs-y +=3D drivers/usb/musb/
- libs-y +=3D drivers/usb/musb-new/
-+libs-y +=3D drivers/usb/isp1760/
- libs-y +=3D drivers/usb/phy/
- libs-y +=3D drivers/usb/ulpi/
- ifdef CONFIG_POST
-diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
-index ab1d061bd0..bbe07be02c 100644
---- a/drivers/usb/Kconfig
-+++ b/drivers/usb/Kconfig
-@@ -78,6 +78,8 @@ source "drivers/usb/musb/Kconfig"
-=20
- source "drivers/usb/musb-new/Kconfig"
-=20
-+source "drivers/usb/isp1760/Kconfig"
-+
- source "drivers/usb/emul/Kconfig"
-=20
- source "drivers/usb/phy/Kconfig"
-diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
-index dc05cb0a50..f08b064d24 100644
---- a/drivers/usb/common/Makefile
-+++ b/drivers/usb/common/Makefile
-@@ -4,6 +4,7 @@
- #
-=20
- obj-$(CONFIG_$(SPL_)DM_USB) +=3D common.o
-+obj-$(CONFIG_USB_ISP1760) +=3D usb_urb.o
- obj-$(CONFIG_USB_MUSB_HCD) +=3D usb_urb.o
- obj-$(CONFIG_USB_MUSB_UDC) +=3D usb_urb.o
- obj-$(CONFIG_USB_EHCI_FSL) +=3D fsl-dt-fixup.o fsl-errata.o
-diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
-new file mode 100644
-index 0000000000..993d71e74c
---- /dev/null
-+++ b/drivers/usb/isp1760/Kconfig
-@@ -0,0 +1,12 @@
-+# SPDX-License-Identifier: GPL-2.0
-+
-+config USB_ISP1760
-+	tristate "NXP ISP 1760/1761/1763 support"
-+	select DM_USB
-+	select USB_HOST
-+	help
-+	  Say Y or M here if your system as an ISP1760/1761/1763 USB host
-+	  controller.
-+
-+	  This USB controller is usually attached to a non-DMA-Master
-+	  capable bus.
-diff --git a/drivers/usb/isp1760/Makefile b/drivers/usb/isp1760/Makefile
-new file mode 100644
-index 0000000000..2c809c01b1
---- /dev/null
-+++ b/drivers/usb/isp1760/Makefile
-@@ -0,0 +1,6 @@
-+# SPDX-License-Identifier: GPL-2.0
-+isp1760-y :=3D isp1760-core.o isp1760-if.o isp1760-uboot.o isp1760-hcd.=
o
-+
-+#isp1760-hcd.o
-+
-+obj-$(CONFIG_USB_ISP1760) +=3D isp1760.o
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-new file mode 100644
-index 0000000000..3080595549
---- /dev/null
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -0,0 +1,378 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Driver for the NXP ISP1760 chip
-+ *
-+ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
-+ *
-+ * This is based on linux kernel driver, original developed:
-+ * Copyright 2014 Laurent Pinchart
-+ * Copyright 2007 Sebastian Siewior
-+ *
-+ */
-+
-+#include <dm.h>
-+#include <dm/device-internal.h>
-+#include <dm/device_compat.h>
-+#include <dm/devres.h>
-+#include <linux/compat.h>
-+#include <linux/delay.h>
-+#include <linux/io.h>
-+#include <linux/kernel.h>
-+#include <regmap.h>
-+#include <usb.h>
-+
-+#include "isp1760-core.h"
-+#include "isp1760-hcd.h"
-+#include "isp1760-regs.h"
-+
-+#define msleep(a) udelay(a * 1000)
-+
-+static int isp1760_init_core(struct isp1760_device *isp)
-+{
-+	struct isp1760_hcd *hcd =3D &isp->hcd;
-+
-+	/*
-+	 * Reset the host controller, including the CPU interface
-+	 * configuration.
-+	 */
-+	isp1760_field_set(hcd->fields, SW_RESET_RESET_ALL);
-+	msleep(100);
-+
-+	/* Setup HW Mode Control: This assumes a level active-low interrupt */
-+	if ((isp->devflags & ISP1760_FLAG_ANALOG_OC) && hcd->is_isp1763)
-+		return -EINVAL;
-+
-+	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
-+		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
-+	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_8)
-+		isp1760_field_set(hcd->fields, HW_DATA_BUS_WIDTH);
-+	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
-+		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
-+	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
-+		isp1760_field_set(hcd->fields, HW_DACK_POL_HIGH);
-+	if (isp->devflags & ISP1760_FLAG_DREQ_POL_HIGH)
-+		isp1760_field_set(hcd->fields, HW_DREQ_POL_HIGH);
-+	if (isp->devflags & ISP1760_FLAG_INTR_POL_HIGH)
-+		isp1760_field_set(hcd->fields, HW_INTR_HIGH_ACT);
-+	if (isp->devflags & ISP1760_FLAG_INTR_EDGE_TRIG)
-+		isp1760_field_set(hcd->fields, HW_INTR_EDGE_TRIG);
-+
-+	/*
-+	 * The ISP1761 has a dedicated DC IRQ line but supports sharing the HC
-+	 * IRQ line for both the host and device controllers. Hardcode IRQ
-+	 * sharing for now and disable the DC interrupts globally to avoid
-+	 * spurious interrupts during HCD registration.
-+	 */
-+	if (isp->devflags & ISP1760_FLAG_ISP1761) {
-+		isp1760_reg_write(hcd->regs, ISP176x_DC_MODE, 0);
-+		isp1760_field_set(hcd->fields, HW_COMN_IRQ);
-+	}
-+
-+	/*
-+	 * PORT 1 Control register of the ISP1760 is the OTG control register
-+	 * on ISP1761.
-+	 *
-+	 * TODO: Really support OTG. For now we configure port 1 in device mod=
e
-+	 */
-+	if (((isp->devflags & ISP1760_FLAG_ISP1761) ||
-+	     (isp->devflags & ISP1760_FLAG_ISP1763)) &&
-+	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
-+		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
-+		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
-+		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
-+	} else {
-+		isp1760_field_set(hcd->fields, HW_SW_SEL_HC_DC);
-+		isp1760_field_set(hcd->fields, HW_VBUS_DRV);
-+		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
-+	}
-+
-+	printf( "%s bus width: %u, oc: %s\n",
-+		 hcd->is_isp1763 ? "isp1763" : "isp1760",
-+		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_8 ? 8 :
-+		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
-+		 hcd->is_isp1763 ? "not available" :
-+		 isp->devflags & ISP1760_FLAG_ANALOG_OC ? "analog" : "digital");
-+
-+	return 0;
-+}
-+
-+void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
-+{
-+	struct isp1760_hcd *hcd =3D &isp->hcd;
-+
-+	if (enable)
-+		isp1760_field_set(hcd->fields, HW_DP_PULLUP);
-+	else
-+		isp1760_field_set(hcd->fields, HW_DP_PULLUP_CLEAR);
-+}
-+
-+/*
-+ * ISP1760/61:
-+ *
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
-+	.slot_num		=3D 32,
-+	.payload_blocks		=3D 32 + 20 + 4,
-+	.payload_area_size	=3D 0xf000,
-+};
-+
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
-+static const struct regmap_config isp1760_hc_regmap_conf =3D {
-+	.width =3D REGMAP_SIZE_16,
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
-+	[HC_ISO_PTD_DONEMAP]	=3D REG_FIELD(ISP176x_HC_ISO_PTD_DONEMAP, 0, 31),
-+	[HC_ISO_PTD_SKIPMAP]	=3D REG_FIELD(ISP176x_HC_ISO_PTD_SKIPMAP, 0, 31),
-+	[HC_ISO_PTD_LASTPTD]	=3D REG_FIELD(ISP176x_HC_ISO_PTD_LASTPTD, 0, 31),
-+	[HC_INT_PTD_DONEMAP]	=3D REG_FIELD(ISP176x_HC_INT_PTD_DONEMAP, 0, 31),
-+	[HC_INT_PTD_SKIPMAP]	=3D REG_FIELD(ISP176x_HC_INT_PTD_SKIPMAP, 0, 31),
-+	[HC_INT_PTD_LASTPTD]	=3D REG_FIELD(ISP176x_HC_INT_PTD_LASTPTD, 0, 31),
-+	[HC_ATL_PTD_DONEMAP]	=3D REG_FIELD(ISP176x_HC_ATL_PTD_DONEMAP, 0, 31),
-+	[HC_ATL_PTD_SKIPMAP]	=3D REG_FIELD(ISP176x_HC_ATL_PTD_SKIPMAP, 0, 31),
-+	[HC_ATL_PTD_LASTPTD]	=3D REG_FIELD(ISP176x_HC_ATL_PTD_LASTPTD, 0, 31),
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
-+	[HC_CHIP_REV]		=3D REG_FIELD(ISP176x_HC_CHIP_ID, 16, 31),
-+	[HC_CHIP_ID_HIGH]	=3D REG_FIELD(ISP176x_HC_CHIP_ID, 8, 15),
-+	[HC_CHIP_ID_LOW]	=3D REG_FIELD(ISP176x_HC_CHIP_ID, 0, 7),
-+	[HC_SCRATCH]		=3D REG_FIELD(ISP176x_HC_SCRATCH, 0, 31),
-+	[SW_RESET_RESET_ALL]	=3D REG_FIELD(ISP176x_HC_RESET, 0, 0),
-+	[ISO_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 2, 2),
-+	[INT_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
-+	[ATL_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
-+	[MEM_BANK_SEL]		=3D REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
-+	[MEM_START_ADDR]	=3D REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
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
-+static const struct regmap_config isp1763_hc_regmap_conf =3D {
-+	.width =3D REGMAP_SIZE_16,
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
-+int isp1760_register(struct isp1760_device *isp, struct resource *mem, =
int irq,
-+		     unsigned long irqflags)
-+{
-+	const struct regmap_config *hc_regmap;
-+	const struct reg_field *hc_reg_fields;
-+	struct isp1760_hcd *hcd;
-+	struct regmap_field *f;
-+	unsigned int devflags;
-+	struct udevice *dev;
-+	int ret;
-+	int i;
-+
-+	hcd =3D &isp->hcd;
-+	devflags =3D isp->devflags;
-+	dev =3D isp->dev;
-+
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
-+	}
-+
-+	hcd->base =3D devm_ioremap(dev, mem->start, resource_size(mem));
-+	if (IS_ERR(hcd->base))
-+		return PTR_ERR(hcd->base);
-+
-+	hcd->regs =3D devm_regmap_init(dev, NULL, NULL, hc_regmap);
-+	if (IS_ERR(hcd->regs))
-+		return PTR_ERR(hcd->regs);
-+
-+	for (i =3D 0; i < HC_FIELD_MAX; i++) {
-+		f =3D devm_regmap_field_alloc(dev, hcd->regs, hc_reg_fields[i]);
-+		if (IS_ERR(f))
-+			return PTR_ERR(f);
-+
-+		hcd->fields[i] =3D f;
-+	}
-+
-+	if (hcd->is_isp1763)
-+		hcd->memory_layout =3D &isp1763_memory_conf;
-+	else
-+		hcd->memory_layout =3D &isp176x_memory_conf;
-+
-+	ret =3D isp1760_init_core(isp);
-+	if (ret < 0)
-+		return ret;
-+
-+	hcd->dev =3D dev;
-+
-+	ret =3D isp1760_hcd_register(hcd, mem, irq, irqflags, dev);
-+	if (ret < 0)
-+		return ret;
-+
-+	ret =3D isp1760_hcd_lowlevel_init(hcd);
-+	if (ret < 0)
-+		return ret;
-+
-+	dev_set_drvdata(dev, isp);
-+
-+	return 0;
-+}
-+
-+void isp1760_unregister(struct isp1760_device *isp)
-+{
-+	isp1760_hcd_unregister(&isp->hcd);
-+
-+	return;
-+}
-diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/is=
p1760-core.h
-new file mode 100644
-index 0000000000..0a60e30b5f
---- /dev/null
-+++ b/drivers/usb/isp1760/isp1760-core.h
-@@ -0,0 +1,96 @@
-+/* SPDX-License-Identifier: GPL-2.0 */
-+/*
-+ * Driver for the NXP ISP1760 chip
-+ *
-+ * Copyright 2021 Linaro, Rui Miguel Silva
-+ * Copyright 2014 Laurent Pinchart
-+ * Copyright 2007 Sebastian Siewior
-+ *
-+ * Contacts:
-+ *	Sebastian Siewior <bigeasy@linutronix.de>
-+ *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-+ *	Rui Miguel Silva <rui.silva@linaro.org>
-+ */
-+
-+#ifndef _ISP1760_CORE_H_
-+#define _ISP1760_CORE_H_
-+
-+#include <linux/compat.h>
-+#include <linux/ioport.h>
-+#include <regmap.h>
-+
-+#include "isp1760-hcd.h"
-+
-+struct device;
-+struct gpio_desc;
-+
-+/*
-+ * Device flags that can vary from board to board.  All of these
-+ * indicate the most "atypical" case, so that a devflags of 0 is
-+ * a sane default configuration.
-+ */
-+#define ISP1760_FLAG_BUS_WIDTH_16	0x00000002 /* 16-bit data bus width *=
/
-+#define ISP1760_FLAG_PERIPHERAL_EN	0x00000004 /* Port 1 supports Periph=
eral mode*/
-+#define ISP1760_FLAG_ANALOG_OC		0x00000008 /* Analog overcurrent */
-+#define ISP1760_FLAG_DACK_POL_HIGH	0x00000010 /* DACK active high */
-+#define ISP1760_FLAG_DREQ_POL_HIGH	0x00000020 /* DREQ active high */
-+#define ISP1760_FLAG_ISP1761		0x00000040 /* Chip is ISP1761 */
-+#define ISP1760_FLAG_INTR_POL_HIGH	0x00000080 /* Interrupt polarity act=
ive high */
-+#define ISP1760_FLAG_INTR_EDGE_TRIG	0x00000100 /* Interrupt edge trigge=
red */
-+#define ISP1760_FLAG_ISP1763		0x00000200 /* Chip is ISP1763 */
-+#define ISP1760_FLAG_BUS_WIDTH_8	0x00000400 /* 8-bit data bus width */
-+
-+struct isp1760_device {
-+	struct udevice *dev;
-+
-+	unsigned int devflags;
-+	struct gpio_desc *rst_gpio;
-+
-+	struct isp1760_hcd hcd;
-+};
-+
-+int isp1760_register(struct isp1760_device *isp, struct resource *mem, =
int irq,
-+		     unsigned long irqflags);
-+void isp1760_unregister(struct isp1760_device *isp);
-+
-+void isp1760_set_pullup(struct isp1760_device *isp, bool enable);
-+
-+static inline u32 isp1760_field_read(struct regmap_field **fields, u32 =
field)
-+{
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
-+}
-+
-+static inline void isp1760_field_clear(struct regmap_field **fields, u3=
2 field)
-+{
-+	isp1760_field_write(fields, field, 0);
-+}
-+
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
-+#endif
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-new file mode 100644
-index 0000000000..b1d86dd69b
---- /dev/null
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -0,0 +1,2574 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Driver for the NXP ISP1760 chip
-+ *
-+ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
-+ *
-+ */
-+
-+#include <hexdump.h>
-+#include <common.h>
-+#include <asm/cache.h>
-+#include <cpu_func.h>
-+#include <dm.h>
-+#include <dm/device-internal.h>
-+#include <dm/device_compat.h>
-+#include <linux/bug.h>
-+#include <linux/kernel.h>
-+#include <linux/list.h>
-+#include <linux/usb/usb_urb_compat.h>
-+#include <usb.h>
-+#include <linux/io.h>
-+#include <linux/iopoll.h>
-+#include <asm/unaligned.h>
-+
-+#include "isp1760-core.h"
-+#include "isp1760-hcd.h"
-+#include "isp1760-regs.h"
-+#include "isp1760-uboot.h"
-+
-+static struct kmem_cache *qtd_cachep;
-+static struct kmem_cache *qh_cachep;
-+static struct kmem_cache *urb_listitem_cachep;
-+
-+typedef void (packet_enqueue)(struct usb_hcd *hcd, struct isp1760_qh *q=
h,
-+			      struct isp1760_qtd *qtd);
-+
-+static inline struct isp1760_hcd *hcd_to_priv(struct usb_hcd *hcd)
-+{
-+	return hcd->hcd_priv;
-+}
-+
-+#define dw_to_le32(x)	(cpu_to_le32((__force u32)x))
-+#define le32_to_dw(x)	((__force __dw)(le32_to_cpu(x)))
-+
-+/* urb state*/
-+#define DELETE_URB		(0x0008)
-+#define NO_TRANSFER_ACTIVE	(0xffffffff)
-+
-+/* Philips Proprietary Transfer Descriptor (PTD) */
-+typedef __u32 __bitwise __dw;
-+struct ptd {
-+	__dw dw0;
-+	__dw dw1;
-+	__dw dw2;
-+	__dw dw3;
-+	__dw dw4;
-+	__dw dw5;
-+	__dw dw6;
-+	__dw dw7;
-+};
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
-+#define PTD_OFFSET		0x0400
-+#define ISO_PTD_OFFSET		0x0400
-+#define INT_PTD_OFFSET		0x0800
-+#define ATL_PTD_OFFSET		0x0c00
-+#define PAYLOAD_OFFSET		0x1000
-+
-+#define ISP_BANK_0		0x00
-+#define ISP_BANK_1		0x01
-+#define ISP_BANK_2		0x02
-+#define ISP_BANK_3		0x03
-+
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
-+/* DW1 */
-+#define TO_DW1_DEVICE_ADDR(x)		TO_DW((((u32)x) << 3))
-+#define TO_DW1_PID_TOKEN(x)		TO_DW((((u32)x) << 10))
-+#define DW1_TRANS_BULK			TO_DW(((u32)2 << 12))
-+#define DW1_TRANS_INT			TO_DW(((u32)3 << 12))
-+#define DW1_TRANS_SPLIT			TO_DW(((u32)1 << 14))
-+#define DW1_SE_USB_LOSPEED		TO_DW(((u32)2 << 16))
-+#define TO_DW1_PORT_NUM(x)		TO_DW((((u32)x) << 18))
-+#define TO_DW1_HUB_NUM(x)		TO_DW((((u32)x) << 25))
-+/* DW2 */
-+#define TO_DW2_DATA_START_ADDR(x)	TO_DW((((u32)x) << 8))
-+#define TO_DW2_RL(x)			TO_DW(((x) << 25))
-+#define FROM_DW2_RL(x)			((TO_U32(x) >> 25) & 0xf)
-+/* DW3 */
-+#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x3fff)
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
-+
-+#define INT_UNDERRUN			(1 << 2)
-+#define INT_BABBLE			(1 << 1)
-+#define INT_EXACT			(1 << 0)
-+
-+#define SETUP_PID	(2)
-+#define IN_PID		(1)
-+#define OUT_PID		(0)
-+
-+/* Errata 1 */
-+#define RL_COUNTER	(0)
-+#define NAK_COUNTER	(0)
-+#define ERR_COUNTER	(3)
-+
-+struct isp1760_qtd {
-+	u8 packet_type;
-+	void *data_buffer;
-+	u32 payload_addr;
-+
-+	/* the rest is HCD-private */
-+	struct list_head qtd_list;
-+	struct urb *urb;
-+	size_t length;
-+	size_t actual_length;
-+
-+	/* QTD_ENQUEUED:	waiting for transfer (inactive) */
-+	/* QTD_PAYLOAD_ALLOC:	chip mem has been allocated for payload */
-+	/* QTD_XFER_STARTED:	valid ptd has been written to isp176x - only
-+				interrupt handler may touch this qtd! */
-+	/* QTD_XFER_COMPLETE:	payload has been transferred successfully */
-+	/* QTD_RETIRE:		transfer error/abort qtd */
-+#define QTD_ENQUEUED		0
-+#define QTD_PAYLOAD_ALLOC	1
-+#define QTD_XFER_STARTED	2
-+#define QTD_XFER_COMPLETE	3
-+#define QTD_RETIRE		4
-+	u32 status;
-+};
-+
-+/* Queue head, one for each active endpoint */
-+struct isp1760_qh {
-+	struct list_head qh_list;
-+	struct list_head qtd_list;
-+	int epnum;
-+	u32 toggle;
-+	u32 ping;
-+	int slot;
-+	int tt_buffer_dirty;	/* See USB2.0 spec section 11.17.5 */
-+};
-+
-+struct urb_listitem {
-+	struct list_head urb_list;
-+	struct urb *urb;
-+};
-+
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
-+static struct descriptor {
-+	struct usb_device_descriptor device;
-+	struct usb_config_descriptor config;
-+	struct usb_interface_descriptor interface;
-+	struct usb_endpoint_descriptor endpoint;
-+} __packed rh_descriptor =3D {
-+	{
-+		/* usb 2.0 root hub device descriptor */
-+		0x12,       /*  __u8  bLength; */
-+		USB_DT_DEVICE, /* __u8 bDescriptorType; Device */
-+		0x0002, /*  __le16 bcdUSB; v2.0 */
-+
-+		0x09,       /*  __u8  bDeviceClass; HUB_CLASSCODE */
-+		0x00,       /*  __u8  bDeviceSubClass; */
-+		0x00,       /*  __u8  bDeviceProtocol; [ usb 2.0 no TT ] */
-+		0x40,       /*  __u8  bMaxPacketSize0; 64 Bytes */
-+
-+		0x6b1d,     /*  __le16 idVendor; Linux Foundation 0x1d6b */
-+		0x0200,     /*  __le16 idProduct; device 0x0002 */
-+		0x0001,     /*  __le16 bcdDevice */
-+
-+		0x03,       /*  __u8  iManufacturer; */
-+		0x02,       /*  __u8  iProduct; */
-+		0x01,       /*  __u8  iSerialNumber; */
-+		0x01        /*  __u8  bNumConfigurations; */
-+	}, {
-+		/* one configuration */
-+		0x09,       /*  __u8  bLength; */
-+		USB_DT_CONFIG, /* __u8 bDescriptorType; Configuration */
-+		0x1900,     /*  __le16 wTotalLength; */
-+		0x01,       /*  __u8  bNumInterfaces; (1) */
-+		0x01,       /*  __u8  bConfigurationValue; */
-+		0x00,       /*  __u8  iConfiguration; */
-+		0xc0,       /*  __u8  bmAttributes;
-+					Bit 7: must be set,
-+					6: Self-powered,
-+					5: Remote wakeup,
-+					4..0: resvd */
-+		0x00,       /*  __u8  MaxPower; */
-+	}, {
-+		/* one interface */
-+		0x09,       /*  __u8  if_bLength; */
-+		USB_DT_INTERFACE, /* __u8 if_bDescriptorType; Interface */
-+		0x00,       /*  __u8  if_bInterfaceNumber; */
-+		0x00,       /*  __u8  if_bAlternateSetting; */
-+		0x01,       /*  __u8  if_bNumEndpoints; */
-+		0x09,       /*  __u8  if_bInterfaceClass; HUB_CLASSCODE */
-+		0x00,       /*  __u8  if_bInterfaceSubClass; */
-+		0x00,       /*  __u8  if_bInterfaceProtocol; [usb1.1 or single tt] */
-+		0x00,       /*  __u8  if_iInterface; */
-+	}, {
-+		/* one endpoint (status change endpoint) */
-+		0x07,       /*  __u8  ep_bLength; */
-+		USB_DT_ENDPOINT, /* __u8 ep_bDescriptorType; Endpoint */
-+		0x81,       /*  __u8  ep_bEndpointAddress; IN Endpoint 1 */
-+		0x03,       /*  __u8  ep_bmAttributes; Interrupt */
-+			/* __le16 ep_wMaxPacketSize; 1 + (MAX_ROOT_PORTS / 8)
-+			* see hub.c:hub_configure() for details. */
-+		(USB_MAXCHILDREN + 1 + 7) / 8, 0x00,
-+		0x0c        /*  __u8  ep_bInterval; (256ms -- usb 2.0 spec) */
-+	},
-+};
-+
-+/*
-+ * Access functions for isp176x registers regmap fields
-+ */
-+static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	return isp1760_field_read(priv->fields, field);
-+}
-+
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
-+static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (unlikely(priv->is_isp1763 &&
-+		     (field >=3D PORT_OWNER && field <=3D PORT_CONNECT)))
-+		return isp1760_hcd_portsc1_set_clear(priv, field, val);
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
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 val;
-+
-+	isp1760_hcd_set(hcd, field);
-+
-+	return regmap_field_read_poll_timeout(priv->fields[field], val,
-+					      !val, 10, timeout_us);
-+}
-+
-+static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
-+				      u32 timeout_us)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 val;
-+
-+	isp1760_hcd_clear(hcd, field);
-+
-+	return regmap_field_read_poll_timeout(priv->fields[field], val,
-+					      !val, 10, timeout_us);
-+}
-+
-+static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
-+{
-+	return !!isp1760_hcd_read(hcd, field);
-+}
-+
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
-+/*
-+ * Access functions for isp176x memory (offset >=3D 0x0400).
-+ *
-+ * bank_reads8() reads memory locations prefetched by an earlier write =
to
-+ * HC_MEMORY_REG (see isp176x datasheet). Unless you want to do fancy m=
ulti-
-+ * bank optimizations, you should use the more generic mem_read() below=
.
-+ *
-+ * For access to ptd memory, use the specialized ptd_read() and ptd_wri=
te()
-+ * below.
-+ *
-+ * These functions copy via MMIO data to/from the device. memcpy_{to|fr=
om}io()
-+ * doesn't quite work because some people have to enforce 32-bit access
-+ */
-+static void bank_reads8(void __iomem *src_base, u32 src_offset, u32 ban=
k_addr,
-+							__u32 *dst, u32 bytes)
-+{
-+	__u32 __iomem *src;
-+	u32 val;
-+	__u8 *src_byteptr;
-+	__u8 *dst_byteptr;
-+
-+	src =3D src_base + (bank_addr | src_offset);
-+
-+	if (src_offset < PAYLOAD_OFFSET) {
-+		while (bytes >=3D 4) {
-+			*dst =3D readl_relaxed(src);
-+			bytes -=3D 4;
-+			src++;
-+			dst++;
-+		}
-+	} else {
-+		while (bytes >=3D 4) {
-+			*dst =3D __raw_readl(src);
-+			bytes -=3D 4;
-+			src++;
-+			dst++;
-+		}
-+	}
-+
-+	if (!bytes)
-+		return;
-+
-+	/* in case we have 3, 2 or 1 by left. The dst buffer may not be fully
-+	 * allocated.
-+	 */
-+	if (src_offset < PAYLOAD_OFFSET)
-+		val =3D readl_relaxed(src);
-+	else
-+		val =3D __raw_readl(src);
-+
-+	dst_byteptr =3D (void *) dst;
-+	src_byteptr =3D (void *) &val;
-+	while (bytes > 0) {
-+		*dst_byteptr =3D *src_byteptr;
-+		dst_byteptr++;
-+		src_byteptr++;
-+		bytes--;
-+	}
-+}
-+
-+static void isp1760_mem_read(struct usb_hcd *hcd, u32 src_offset, void =
*dst,
-+			     u32 bytes)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
-+	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
-+	ndelay(100);
-+
-+	bank_reads8(priv->base, src_offset, ISP_BANK_0, dst, bytes);
-+}
-+
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
-+}
-+
-+static void isp1760_mem_write(void __iomem *dst_base, u32 dst_offset,
-+			      __u32 const *src, u32 bytes)
-+{
-+	__u32 __iomem *dst;
-+
-+	dst =3D dst_base + dst_offset;
-+
-+	if (dst_offset < PAYLOAD_OFFSET) {
-+		while (bytes >=3D 4) {
-+			writel_relaxed(*src, dst);
-+			bytes -=3D 4;
-+			src++;
-+			dst++;
-+		}
-+	} else {
-+		while (bytes >=3D 4) {
-+			__raw_writel(*src, dst);
-+			bytes -=3D 4;
-+			src++;
-+			dst++;
-+		}
-+	}
-+
-+	if (!bytes)
-+		return;
-+	/* in case we have 3, 2 or 1 bytes left. The buffer is allocated and t=
he
-+	 * extra bytes should not be read by the HW.
-+	 */
-+
-+	if (dst_offset < PAYLOAD_OFFSET)
-+		writel_relaxed(*src, dst);
-+	else
-+		__raw_writel(*src, dst);
-+}
-+
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
-+/*
-+ * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFSET,
-+ * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32.
-+ */
-+static void isp1760_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 s=
lot,
-+			     struct ptd *ptd)
-+{
-+	u16 src_offset =3D ptd_offset + slot * sizeof(*ptd);
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
-+	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
-+	ndelay(90);
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
-+}
-+
-+static void isp1760_ptd_write(void __iomem *base, u32 ptd_offset, u32 s=
lot,
-+			      struct ptd *ptd)
-+{
-+	u32 dst_offset =3D ptd_offset + slot * sizeof(*ptd);
-+
-+	/*
-+	 * Make sure dw0 gets written last (after other dw's and after payload=
)
-+	 *  since it contains the enable bit
-+	 */
-+	isp1760_mem_write(base, dst_offset + sizeof(ptd->dw0),
-+			  (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
-+	wmb();
-+	isp1760_mem_write(base, dst_offset, (__force u32 *)&ptd->dw0,
-+			  sizeof(ptd->dw0));
-+}
-+
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
-+
-+/* memory management of the 60kb on the chip from 0x1000 to 0xffff */
-+static void init_memory(struct isp1760_hcd *priv)
-+{
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+	int i, j, curr;
-+	u32 payload_addr;
-+
-+	payload_addr =3D PAYLOAD_OFFSET;
-+
-+	for (i =3D 0, curr =3D 0; i < ARRAY_SIZE(mem->blocks); i++) {
-+		for (j =3D 0; j < mem->blocks[i]; j++, curr++) {
-+			priv->memory_pool[curr + j].start =3D payload_addr;
-+			priv->memory_pool[curr + j].size =3D mem->blocks_size[i];
-+			priv->memory_pool[curr + j].free =3D 1;
-+			payload_addr +=3D priv->memory_pool[curr + j].size;
-+		}
-+	}
-+
-+	WARN_ON(payload_addr - priv->memory_pool[0].start >
-+		mem->payload_area_size);
-+}
-+
-+static void alloc_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+	int i;
-+
-+	WARN_ON(qtd->payload_addr);
-+
-+	if (!qtd->length)
-+		return;
-+
-+	for (i =3D 0; i < mem->payload_blocks; i++) {
-+		if (priv->memory_pool[i].size >=3D qtd->length &&
-+				priv->memory_pool[i].free) {
-+			priv->memory_pool[i].free =3D 0;
-+			qtd->payload_addr =3D priv->memory_pool[i].start;
-+			return;
-+		}
-+	}
-+}
-+
-+static void free_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+	int i;
-+
-+	if (!qtd->payload_addr)
-+		return;
-+
-+	for (i =3D 0; i < mem->payload_blocks; i++) {
-+		if (priv->memory_pool[i].start =3D=3D qtd->payload_addr) {
-+			WARN_ON(priv->memory_pool[i].free);
-+			priv->memory_pool[i].free =3D 1;
-+			qtd->payload_addr =3D 0;
-+			return;
-+		}
-+	}
-+
-+	WARN_ON(1);
-+	qtd->payload_addr =3D 0;
-+}
-+
-+/* reset a non-running (STS_HALT =3D=3D 1) controller */
-+static int ehci_reset(struct usb_hcd *hcd)
-+{
-+	return isp1760_hcd_set_and_wait_swap(hcd, CMD_RESET, 250 * 1000);
-+}
-+
-+static struct isp1760_qh *qh_alloc(gfp_t flags)
-+{
-+	struct isp1760_qh *qh;
-+
-+	qh =3D kmem_cache_alloc(qh_cachep, flags);
-+	if (!qh)
-+		return NULL;
-+
-+	memset(qh, '\0', qh_cachep->sz);
-+	INIT_LIST_HEAD(&qh->qh_list);
-+	INIT_LIST_HEAD(&qh->qtd_list);
-+	qh->slot =3D -1;
-+
-+	return qh;
-+}
-+
-+static void qh_free(struct isp1760_qh *qh)
-+{
-+	WARN_ON(!list_empty(&qh->qtd_list));
-+	WARN_ON(qh->slot > -1);
-+	kmem_cache_free(qh_cachep, qh);
-+}
-+
-+/* one-time init, only for memory state */
-+static int priv_init(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 isoc_cache;
-+	u32 isoc_thres;
-+	int i;
-+
-+	spin_lock_init(&priv->lock);
-+
-+	for (i =3D 0; i < QH_END; i++)
-+		INIT_LIST_HEAD(&priv->qh_list[i]);
-+
-+	/*
-+	 * hw default: 1K periodic list heads, one per frame.
-+	 * periodic_size can shrink by USBCMD update if hcc_params allows.
-+	 */
-+	priv->periodic_size =3D DEFAULT_I_TDPS;
-+
-+	if (priv->is_isp1763) {
-+		priv->i_thresh =3D 2;
-+		return 0;
-+	}
-+
-+	/* controllers may cache some of the periodic schedule ... */
-+	isoc_cache =3D isp1760_hcd_read(hcd, HCC_ISOC_CACHE);
-+	isoc_thres =3D isp1760_hcd_read(hcd, HCC_ISOC_THRES);
-+
-+	/* full frame cache */
-+	if (isoc_cache)
-+		priv->i_thresh =3D 8;
-+	else /* N microframes cached */
-+		priv->i_thresh =3D 2 + isoc_thres;
-+
-+	return 0;
-+}
-+
-+static int isp1760_hc_setup(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 atx_reset;
-+	int result;
-+	u32 scratch;
-+	u32 pattern;
-+
-+	if (priv->is_isp1763)
-+		pattern =3D 0xcafe;
-+	else
-+		pattern =3D 0xdeadcafe;
-+
-+	isp1760_hcd_write(hcd, HC_SCRATCH, pattern);
-+
-+	/* Change bus pattern */
-+	scratch =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-+	scratch =3D isp1760_hcd_read(hcd, HC_SCRATCH);
-+	if (scratch !=3D pattern) {
-+		printf("Scratch test failed. 0x%08x\n", scratch);
-+		return -ENODEV;
-+	}
-+
-+	/*
-+	 * The RESET_HC bit in the SW_RESET register is supposed to reset the
-+	 * host controller without touching the CPU interface registers, but a=
t
-+	 * least on the ISP1761 it seems to behave as the RESET_ALL bit and
-+	 * reset the whole device. We thus can't use it here, so let's reset
-+	 * the host controller through the EHCI USB Command register. The devi=
ce
-+	 * has been reset in core code anyway, so this shouldn't matter.
-+	 */
-+	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
-+	isp1760_hcd_clear(hcd, INT_BUF_FILL);
-+	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
-+
-+	result =3D ehci_reset(hcd);
-+	if (result)
-+		return result;
-+
-+	/* Step 11 passed */
-+
-+	/* ATL reset */
-+	if (priv->is_isp1763)
-+		atx_reset =3D SW_RESET_RESET_ATX;
-+	else
-+		atx_reset =3D ALL_ATX_RESET;
-+
-+	isp1760_hcd_set(hcd, atx_reset);
-+	mdelay(10);
-+	isp1760_hcd_clear(hcd, atx_reset);
-+
-+	if (priv->is_isp1763) {
-+		isp1760_hcd_set(hcd, HW_OTG_DISABLE);
-+		isp1760_hcd_set(hcd, HW_SW_SEL_HC_DC_CLEAR);
-+		isp1760_hcd_set(hcd, HW_HC_2_DIS_CLEAR);
-+		isp1760_hcd_set(hcd, HW_DM_PULLDOWN);
-+		isp1760_hcd_set(hcd, HW_DP_PULLDOWN);
-+		mdelay(10);
-+
-+		isp1760_hcd_set(hcd, HW_INTF_LOCK);
-+	}
-+
-+	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
-+	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
-+
-+	return priv_init(hcd);
-+}
-+
-+static u32 base_to_chip(u32 base)
-+{
-+	return ((base - 0x400) >> 3);
-+}
-+
-+static int last_qtd_of_urb(struct isp1760_qtd *qtd, struct isp1760_qh *=
qh)
-+{
-+	struct urb *urb;
-+
-+	if (list_is_last(&qtd->qtd_list, &qh->qtd_list))
-+		return 1;
-+
-+	urb =3D qtd->urb;
-+	qtd =3D list_entry(qtd->qtd_list.next, typeof(*qtd), qtd_list);
-+
-+	return (qtd->urb !=3D urb);
-+}
-+
-+/* magic numbers that can affect system performance */
-+#define	EHCI_TUNE_CERR		3	/* 0-3 qtd retries; 0 =3D=3D don't stop */
-+#define	EHCI_TUNE_RL_HS		4	/* nak throttle; see 4.9 */
-+#define	EHCI_TUNE_RL_TT		0
-+#define	EHCI_TUNE_MULT_HS	1	/* 1-3 transactions/uframe; 4.10.3 */
-+#define	EHCI_TUNE_MULT_TT	1
-+#define	EHCI_TUNE_FLS		2	/* (small) 256 frame schedule */
-+
-+static void create_ptd_atl(struct isp1760_qh *qh, struct isp1760_qtd *q=
td,
-+			   struct ptd *ptd)
-+{
-+	u32 maxpacket;
-+	u32 multi;
-+	u32 rl =3D RL_COUNTER;
-+	u32 nak =3D NAK_COUNTER;
-+	u8 portnr;
-+	u8 hubaddr;
-+
-+	memset(ptd, 0, sizeof(*ptd));
-+
-+	/* according to 3.6.2, max packet len can not be > 0x400 */
-+	maxpacket =3D usb_maxpacket(qtd->urb->dev, qtd->urb->pipe);
-+	multi =3D  1 + ((maxpacket >> 11) & 0x3);
-+	maxpacket &=3D 0x7ff;
-+
-+	/* DW0 */
-+	ptd->dw0 =3D DW0_VALID_BIT;
-+	ptd->dw0 |=3D TO_DW0_LENGTH(qtd->length);
-+	ptd->dw0 |=3D TO_DW0_MAXPACKET(maxpacket);
-+	ptd->dw0 |=3D TO_DW0_ENDPOINT(usb_pipeendpoint(qtd->urb->pipe));
-+
-+	/* DW1 */
-+	ptd->dw1 =3D TO_DW((usb_pipeendpoint(qtd->urb->pipe) >> 1));
-+	ptd->dw1 |=3D TO_DW1_DEVICE_ADDR(usb_pipedevice(qtd->urb->pipe));
-+	ptd->dw1 |=3D TO_DW1_PID_TOKEN(qtd->packet_type);
-+
-+	if (usb_pipebulk(qtd->urb->pipe))
-+		ptd->dw1 |=3D DW1_TRANS_BULK;
-+	else if  (usb_pipeint(qtd->urb->pipe))
-+		ptd->dw1 |=3D DW1_TRANS_INT;
-+
-+	if (qtd->urb->dev->speed !=3D USB_SPEED_HIGH) {
-+		/* split transaction */
-+
-+		ptd->dw1 |=3D DW1_TRANS_SPLIT;
-+		if (qtd->urb->dev->speed =3D=3D USB_SPEED_LOW)
-+			ptd->dw1 |=3D DW1_SE_USB_LOSPEED;
-+
-+		if (!qtd->urb->dev->dev->parent_priv_) {
-+			portnr =3D qtd->urb->dev->portnr;
-+			hubaddr =3D qtd->urb->dev->devnum;
-+		} else {
-+			usb_find_usb2_hub_address_port(qtd->urb->dev, &hubaddr,
-+						       &portnr);
-+		}
-+
-+		ptd->dw1 |=3D TO_DW1_PORT_NUM(portnr);
-+		ptd->dw1 |=3D TO_DW1_HUB_NUM(hubaddr);
-+
-+		/* SE bit for Split INT transfers */
-+		if (usb_pipeint(qtd->urb->pipe) &&
-+				(qtd->urb->dev->speed =3D=3D USB_SPEED_LOW))
-+			ptd->dw1 |=3D DW1_SE_USB_LOSPEED;
-+
-+		rl =3D 0;
-+		nak =3D 0;
-+	} else {
-+		ptd->dw0 |=3D TO_DW0_MULTI(multi);
-+		if (usb_pipecontrol(qtd->urb->pipe) ||
-+						usb_pipebulk(qtd->urb->pipe))
-+			ptd->dw3 |=3D TO_DW3_PING(qh->ping);
-+	}
-+	/* DW2 */
-+	ptd->dw2 =3D 0;
-+	ptd->dw2 |=3D TO_DW2_DATA_START_ADDR(base_to_chip(qtd->payload_addr));
-+	ptd->dw2 |=3D TO_DW2_RL(rl);
-+
-+	/* DW3 */
-+	ptd->dw3 |=3D TO_DW3_NAKCOUNT(nak);
-+	ptd->dw3 |=3D TO_DW3_DATA_TOGGLE(qh->toggle);
-+
-+	if (usb_pipecontrol(qtd->urb->pipe)) {
-+		if (qtd->data_buffer =3D=3D qtd->urb->setup_packet) {
-+			ptd->dw3 &=3D ~TO_DW3_DATA_TOGGLE(1);
-+		} else if (last_qtd_of_urb(qtd, qh)) {
-+			ptd->dw3 |=3D TO_DW3_DATA_TOGGLE(1);
-+		}
-+	}
-+
-+	ptd->dw3 |=3D DW3_ACTIVE_BIT;
-+	/* Cerr */
-+	ptd->dw3 |=3D TO_DW3_CERR(ERR_COUNTER);
-+}
-+
-+static void transform_add_int(struct isp1760_qh *qh, struct isp1760_qtd=
 *qtd,
-+			      struct ptd *ptd)
-+{
-+	struct usb_host_endpoint *hep =3D qtd->urb->ep;
-+	struct usb_endpoint_descriptor *epd =3D &hep->desc;
-+	u32 usof;
-+	u32 period;
-+
-+	/*
-+	 * Most of this is guessing. ISP1761 datasheet is quite unclear, and
-+	 * the algorithm from the original Philips driver code, which was
-+	 * pretty much used in this driver before as well, is quite horrendous
-+	 * and, i believe, incorrect. The code below follows the datasheet and
-+	 * USB2.0 spec as far as I can tell, and plug/unplug seems to be much
-+	 * more reliable this way (fingers crossed...).
-+	 */
-+
-+	if (qtd->urb->dev->speed =3D=3D USB_SPEED_HIGH) {
-+		/* urb->interval is in units of microframes (1/8 ms) */
-+		period =3D epd->bInterval >> 3;
-+
-+		if (epd->bInterval > 4)
-+			usof =3D 0x01; /* One bit set =3D>
-+						interval 1 ms * uFrame-match */
-+		else if (epd->bInterval > 2)
-+			usof =3D 0x22; /* Two bits set =3D> interval 1/2 ms */
-+		else if (epd->bInterval > 1)
-+			usof =3D 0x55; /* Four bits set =3D> interval 1/4 ms */
-+		else
-+			usof =3D 0xff; /* All bits set =3D> interval 1/8 ms */
-+	} else {
-+		/* urb->interval is in units of frames (1 ms) */
-+		period =3D epd->bInterval;
-+		usof =3D 0x0f;		/* Execute Start Split on any of the
-+					   four first uFrames */
-+
-+		/*
-+		 * First 8 bits in dw5 is uSCS and "specifies which uSOF the
-+		 * complete split needs to be sent. Valid only for IN." Also,
-+		 * "All bits can be set to one for every transfer." (p 82,
-+		 * ISP1761 data sheet.) 0x1c is from Philips driver. Where did
-+		 * that number come from? 0xff seems to work fine...
-+		 */
-+		/* ptd->dw5 =3D 0x1c; */
-+		ptd->dw5 =3D TO_DW(0xff); /* Execute Complete Split on any uFrame */
-+	}
-+
-+	period =3D period >> 1;/* Ensure equal or shorter period than requeste=
d */
-+	period &=3D 0xf8; /* Mask off too large values and lowest unused 3 bit=
s */
-+
-+	ptd->dw2 |=3D TO_DW(period);
-+	ptd->dw4 =3D TO_DW(usof);
-+}
-+
-+static void create_ptd_int(struct isp1760_qh *qh, struct isp1760_qtd *q=
td,
-+			   struct ptd *ptd)
-+{
-+	create_ptd_atl(qh, qtd, ptd);
-+	transform_add_int(qh, qtd, ptd);
-+}
-+
-+static void isp1760_urb_done(struct usb_hcd *hcd, struct urb *urb)
-+{
-+	if (usb_pipein(urb->pipe) && usb_pipetype(urb->pipe) !=3D PIPE_CONTROL=
) {
-+		void *ptr;
-+		for (ptr =3D urb->transfer_buffer;
-+		     ptr < urb->transfer_buffer + urb->transfer_buffer_length;
-+		     ptr +=3D PAGE_SIZE)
-+			flush_dcache_range((unsigned  long)ptr,
-+					   (unsigned long)ptr + PAGE_SIZE);
-+	}
-+
-+	/* complete() can reenter this HCD */
-+	usb_hcd_unlink_urb_from_ep(hcd, urb);
-+	usb_hcd_giveback_urb(hcd, urb, urb->status);
-+}
-+
-+static struct isp1760_qtd *qtd_alloc(gfp_t flags, struct urb *urb,
-+				     u8 packet_type)
-+{
-+	struct isp1760_qtd *qtd;
-+
-+	qtd =3D kmem_cache_alloc(qtd_cachep, flags);
-+	if (!qtd)
-+		return NULL;
-+
-+	memset(qtd, '\0', sizeof(*qtd));
-+	INIT_LIST_HEAD(&qtd->qtd_list);
-+	qtd->urb =3D urb;
-+	qtd->packet_type =3D packet_type;
-+	qtd->status =3D QTD_ENQUEUED;
-+	qtd->actual_length =3D 0;
-+
-+	return qtd;
-+}
-+
-+static void qtd_free(struct isp1760_qtd *qtd)
-+{
-+	WARN_ON(qtd->payload_addr);
-+	kmem_cache_free(qtd_cachep, qtd);
-+}
-+
-+static void start_bus_transfer(struct usb_hcd *hcd, u32 ptd_offset, int=
 slot,
-+				struct isp1760_slotinfo *slots,
-+				struct isp1760_qtd *qtd, struct isp1760_qh *qh,
-+				struct ptd *ptd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+	int skip_map;
-+
-+	WARN_ON((slot < 0) || (slot > mem->slot_num - 1));
-+	WARN_ON(qtd->length && !qtd->payload_addr);
-+	WARN_ON(slots[slot].qtd);
-+	WARN_ON(slots[slot].qh);
-+	WARN_ON(qtd->status !=3D QTD_PAYLOAD_ALLOC);
-+
-+	if (priv->is_isp1763)
-+		ndelay(100);
-+
-+	/* Make sure done map has not triggered from some unlinked transfer */
-+	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
-+		skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
-+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP,
-+				  skip_map | (1 << slot));
-+		priv->atl_done_map |=3D isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
-+		priv->atl_done_map &=3D ~(1 << slot);
-+	} else {
-+		skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
-+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP,
-+				  skip_map | (1 << slot));
-+		priv->int_done_map |=3D isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
-+		priv->int_done_map &=3D ~(1 << slot);
-+	}
-+
-+	skip_map &=3D ~(1 << slot);
-+	qh->slot =3D slot;
-+	qtd->status =3D QTD_XFER_STARTED;
-+	slots[slot].qtd =3D qtd;
-+	slots[slot].qh =3D qh;
-+
-+	ptd_write(hcd, ptd_offset, slot, ptd);
-+
-+	if (ptd_offset =3D=3D ATL_PTD_OFFSET)
-+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
-+	else
-+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
-+}
-+
-+static int is_short_bulk(struct isp1760_qtd *qtd)
-+{
-+	return (usb_pipebulk(qtd->urb->pipe) &&
-+					(qtd->actual_length < qtd->length));
-+}
-+
-+static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
-+						struct list_head *urb_list)
-+{
-+	struct isp1760_qtd *qtd, *qtd_next;
-+	struct urb_listitem *urb_listitem;
-+	int last_qtd;
-+
-+	list_for_each_entry_safe(qtd, qtd_next, &qh->qtd_list, qtd_list) {
-+		if (qtd->status < QTD_XFER_COMPLETE)
-+			break;
-+
-+		last_qtd =3D last_qtd_of_urb(qtd, qh);
-+
-+		if ((!last_qtd) && (qtd->status =3D=3D QTD_RETIRE))
-+			qtd_next->status =3D QTD_RETIRE;
-+
-+		if (qtd->status =3D=3D QTD_XFER_COMPLETE) {
-+			if (qtd->actual_length) {
-+				switch (qtd->packet_type) {
-+				case IN_PID:
-+					mem_read(hcd, qtd->payload_addr,
-+						 qtd->data_buffer,
-+						 qtd->actual_length);
-+					fallthrough;
-+				case OUT_PID:
-+					qtd->urb->actual_length +=3D
-+							qtd->actual_length;
-+					fallthrough;
-+				case SETUP_PID:
-+					break;
-+				}
-+			}
-+
-+			if (is_short_bulk(qtd)) {
-+				if (qtd->urb->transfer_flags & URB_SHORT_NOT_OK)
-+					qtd->urb->status =3D -EREMOTEIO;
-+				if (!last_qtd)
-+					qtd_next->status =3D QTD_RETIRE;
-+			}
-+		}
-+
-+		if (qtd->payload_addr)
-+			free_mem(hcd, qtd);
-+
-+		if (last_qtd) {
-+			if ((qtd->status =3D=3D QTD_RETIRE) &&
-+					(qtd->urb->status =3D=3D -EINPROGRESS))
-+				qtd->urb->status =3D -EPIPE;
-+			/* Defer calling of urb_done() since it releases lock */
-+			urb_listitem =3D kmem_cache_alloc(urb_listitem_cachep,
-+								GFP_ATOMIC);
-+			if (unlikely(!urb_listitem))
-+				break; /* Try again on next call */
-+			urb_listitem->urb =3D qtd->urb;
-+			list_add_tail(&urb_listitem->urb_list, urb_list);
-+		}
-+
-+		list_del(&qtd->qtd_list);
-+		qtd_free(qtd);
-+	}
-+}
-+
-+#define ENQUEUE_DEPTH	2
-+static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+	int slot_num =3D mem->slot_num;
-+	int ptd_offset;
-+	struct isp1760_slotinfo *slots;
-+	int curr_slot, free_slot;
-+	int n;
-+	struct ptd ptd;
-+	struct isp1760_qtd *qtd;
-+
-+	if (unlikely(list_empty(&qh->qtd_list)))
-+		return;
-+
-+	/* Make sure this endpoint's TT buffer is clean before queueing ptds *=
/
-+	if (qh->tt_buffer_dirty)
-+		return;
-+
-+	if (usb_pipeint(list_entry(qh->qtd_list.next, struct isp1760_qtd,
-+				   qtd_list)->urb->pipe)) {
-+		ptd_offset =3D INT_PTD_OFFSET;
-+		slots =3D priv->int_slots;
-+	} else {
-+		ptd_offset =3D ATL_PTD_OFFSET;
-+		slots =3D priv->atl_slots;
-+	}
-+
-+	free_slot =3D -1;
-+	for (curr_slot =3D 0; curr_slot < slot_num; curr_slot++) {
-+		if ((free_slot =3D=3D -1) && (slots[curr_slot].qtd =3D=3D NULL))
-+			free_slot =3D curr_slot;
-+		if (slots[curr_slot].qh =3D=3D qh)
-+			break;
-+	}
-+
-+	n =3D 0;
-+	list_for_each_entry(qtd, &qh->qtd_list, qtd_list) {
-+		if (qtd->status =3D=3D QTD_ENQUEUED) {
-+			WARN_ON(qtd->payload_addr);
-+			alloc_mem(hcd, qtd);
-+			if ((qtd->length) && (!qtd->payload_addr))
-+				break;
-+
-+			if (qtd->length && (qtd->packet_type =3D=3D SETUP_PID ||
-+					    qtd->packet_type =3D=3D OUT_PID)) {
-+				mem_write(hcd, qtd->payload_addr,
-+					  qtd->data_buffer, qtd->length);
-+			}
-+
-+			qtd->status =3D QTD_PAYLOAD_ALLOC;
-+		}
-+
-+		if (qtd->status =3D=3D QTD_PAYLOAD_ALLOC) {
-+/*
-+			if ((curr_slot > 31) && (free_slot =3D=3D -1))
-+				printf("%s: No slot "
-+					"available for transfer\n", __func__);
-+*/
-+			/* Start xfer for this endpoint if not already done */
-+			if ((curr_slot > slot_num - 1) && (free_slot > -1)) {
-+				if (usb_pipeint(qtd->urb->pipe))
-+					create_ptd_int(qh, qtd, &ptd);
-+				else
-+					create_ptd_atl(qh, qtd, &ptd);
-+
-+				start_bus_transfer(hcd, ptd_offset, free_slot,
-+							slots, qtd, qh, &ptd);
-+				curr_slot =3D free_slot;
-+			}
-+
-+			n++;
-+			if (n >=3D ENQUEUE_DEPTH)
-+				break;
-+		}
-+	}
-+}
-+
-+static void schedule_ptds(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv;
-+	struct isp1760_qh *qh, *qh_next;
-+	struct list_head *ep_queue;
-+	LIST_HEAD(urb_list);
-+	struct urb_listitem *urb_listitem, *urb_listitem_next;
-+	int i;
-+
-+	if (!hcd) {
-+		WARN_ON(1);
-+		return;
-+	}
-+
-+	priv =3D hcd_to_priv(hcd);
-+
-+	/*
-+	 * check finished/retired xfers, transfer payloads, call urb_done()
-+	 */
-+	for (i =3D 0; i < QH_END; i++) {
-+		ep_queue =3D &priv->qh_list[i];
-+		list_for_each_entry_safe(qh, qh_next, ep_queue, qh_list)
-+			collect_qtds(hcd, qh, &urb_list);
-+	}
-+
-+	list_for_each_entry_safe(urb_listitem, urb_listitem_next, &urb_list,
-+				 urb_list) {
-+		isp1760_urb_done(hcd, urb_listitem->urb);
-+		kmem_cache_free(urb_listitem_cachep, urb_listitem);
-+	}
-+
-+	/*
-+	 * Schedule packets for transfer.
-+	 *
-+	 * According to USB2.0 specification:
-+	 *
-+	 * 1st prio: interrupt xfers, up to 80 % of bandwidth
-+	 * 2nd prio: control xfers
-+	 * 3rd prio: bulk xfers
-+	 *
-+	 * ... but let's use a simpler scheme here (mostly because ISP1761 doc
-+	 * is very unclear on how to prioritize traffic):
-+	 *
-+	 * 1) Enqueue any queued control transfers, as long as payload chip me=
m
-+	 *    and PTD ATL slots are available.
-+	 * 2) Enqueue any queued INT transfers, as long as payload chip mem
-+	 *    and PTD INT slots are available.
-+	 * 3) Enqueue any queued bulk transfers, as long as payload chip mem
-+	 *    and PTD ATL slots are available.
-+	 *
-+	 * Use double buffering (ENQUEUE_DEPTH=3D=3D2) as a compromise between
-+	 * conservation of chip mem and performance.
-+	 *
-+	 * I'm sure this scheme could be improved upon!
-+	 */
-+	for (i =3D 0; i < QH_END; i++) {
-+		ep_queue =3D &priv->qh_list[i];
-+		list_for_each_entry_safe(qh, qh_next, ep_queue, qh_list)
-+			enqueue_qtds(hcd, qh);
-+	}
-+}
-+
-+#define PTD_STATE_QTD_DONE	1
-+#define PTD_STATE_QTD_RELOAD	2
-+#define PTD_STATE_URB_RETIRE	3
-+
-+static int check_int_transfer(struct usb_hcd *hcd, struct ptd *ptd,
-+								struct urb *urb)
-+{
-+	u32 dw4;
-+	int i;
-+
-+	dw4 =3D TO_U32(ptd->dw4);
-+	dw4 >>=3D 8;
-+
-+	/* FIXME: ISP1761 datasheet does not say what to do with these. Do we
-+	   need to handle these errors? Is it done in hardware? */
-+	if (ptd->dw3 & DW3_HALT_BIT) {
-+
-+		urb->status =3D -EPROTO; /* Default unknown error */
-+
-+		for (i =3D 0; i < 8; i++) {
-+			switch (dw4 & 0x7) {
-+			case INT_UNDERRUN:
-+				printf("underrun during uFrame %d\n", i);
-+				urb->status =3D -ECOMM; /* Could not write data */
-+				break;
-+			case INT_EXACT:
-+				printf("transaction error uFrame %d\n", i);
-+				urb->status =3D -EPROTO; /* timeout, bad CRC, PID
-+							  error etc. */
-+				break;
-+			case INT_BABBLE:
-+				printf("babble error during uFrame %d\n", i);
-+				urb->status =3D -EOVERFLOW;
-+				break;
-+			}
-+			dw4 >>=3D 3;
-+		}
-+
-+		return PTD_STATE_URB_RETIRE;
-+	}
-+
-+	return PTD_STATE_QTD_DONE;
-+}
-+
-+static int check_atl_transfer(struct usb_hcd *hcd, struct ptd *ptd,
-+			      struct urb *urb)
-+{
-+	WARN_ON(!ptd);
-+	if (ptd->dw3 & DW3_HALT_BIT) {
-+		if (ptd->dw3 & DW3_BABBLE_BIT)
-+			urb->status =3D -EOVERFLOW;
-+		else if (FROM_DW3_CERR(ptd->dw3))
-+			urb->status =3D -EPIPE;  /* Stall */
-+		else
-+			urb->status =3D -EPROTO; /* Unknown */
-+
-+		/* usefull debug
-+		printf("%s: ptd error:\n"
-+			"        dw0: %08x dw1: %08x dw2: %08x dw3: %08x\n"
-+			"        dw4: %08x dw5: %08x dw6: %08x dw7: %08x\n",
-+			__func__,
-+			ptd->dw0, ptd->dw1, ptd->dw2, ptd->dw3,
-+			ptd->dw4, ptd->dw5, ptd->dw6, ptd->dw7);
-+		*/
-+
-+		return PTD_STATE_URB_RETIRE;
-+	}
-+
-+	/* Transfer Error, *but* active and no HALT -> reload */
-+	if ((ptd->dw3 & DW3_ERROR_BIT) && (ptd->dw3 & DW3_ACTIVE_BIT))
-+		return PTD_STATE_QTD_RELOAD;
-+
-+	/*
-+	* NAKs are handled in HW by the chip. Usually if the
-+	* device is not able to send data fast enough.
-+	* This happens mostly on slower hardware.
-+	*/
-+	if (!FROM_DW3_NAKCOUNT(ptd->dw3) && (ptd->dw3 & DW3_ACTIVE_BIT))
-+		return PTD_STATE_QTD_RELOAD;
-+
-+	return PTD_STATE_QTD_DONE;
-+}
-+
-+static void handle_done_ptds(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	struct isp1760_slotinfo *slots;
-+	struct isp1760_qtd *qtd;
-+	struct isp1760_qh *qh;
-+	struct ptd ptd;
-+	u32 ptd_offset;
-+	int modified;
-+	int skip_map;
-+	int state;
-+	int slot;
-+
-+	skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
-+	priv->int_done_map &=3D ~skip_map;
-+	skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
-+	priv->atl_done_map &=3D ~skip_map;
-+
-+	modified =3D priv->int_done_map || priv->atl_done_map;
-+
-+	while (priv->int_done_map || priv->atl_done_map) {
-+		if (priv->int_done_map) {
-+			/* INT ptd */
-+			slot =3D __ffs(priv->int_done_map);
-+			priv->int_done_map &=3D ~(1 << slot);
-+			slots =3D priv->int_slots;
-+			/* This should not trigger, and could be removed if
-+			   noone have any problems with it triggering: */
-+			if (!slots[slot].qh) {
-+				WARN_ON(1);
-+				continue;
-+			}
-+			ptd_offset =3D INT_PTD_OFFSET;
-+			ptd_read(hcd, INT_PTD_OFFSET, slot, &ptd);
-+			state =3D check_int_transfer(hcd, &ptd,
-+						   slots[slot].qtd->urb);
-+		} else {
-+			/* ATL ptd */
-+			slot =3D __ffs(priv->atl_done_map);
-+			priv->atl_done_map &=3D ~(1 << slot);
-+			slots =3D priv->atl_slots;
-+			/* This should not trigger, and could be removed if
-+			   noone have any problems with it triggering: */
-+			if (!slots[slot].qh) {
-+				WARN_ON(1);
-+				continue;
-+			}
-+			ptd_offset =3D ATL_PTD_OFFSET;
-+			ptd_read(hcd, ATL_PTD_OFFSET, slot, &ptd);
-+			state =3D check_atl_transfer(hcd, &ptd,
-+						   slots[slot].qtd->urb);
-+		}
-+
-+		qtd =3D slots[slot].qtd;
-+		slots[slot].qtd =3D NULL;
-+		qh =3D slots[slot].qh;
-+		slots[slot].qh =3D NULL;
-+		qh->slot =3D -1;
-+
-+		WARN_ON(qtd->status !=3D QTD_XFER_STARTED);
-+
-+		switch (state) {
-+		case PTD_STATE_QTD_DONE:
-+			if ((usb_pipeint(qtd->urb->pipe)) &&
-+			    (qtd->urb->dev->speed !=3D USB_SPEED_HIGH))
-+				qtd->actual_length =3D
-+				       FROM_DW3_SCS_NRBYTESTRANSFERRED(ptd.dw3);
-+			else
-+				qtd->actual_length =3D
-+					FROM_DW3_NRBYTESTRANSFERRED(ptd.dw3);
-+
-+			qtd->status =3D QTD_XFER_COMPLETE;
-+
-+			if (list_is_last(&qtd->qtd_list, &qh->qtd_list) ||
-+			    is_short_bulk(qtd))
-+				qtd =3D NULL;
-+			else
-+				qtd =3D list_entry(qtd->qtd_list.next,
-+							typeof(*qtd), qtd_list);
-+
-+			qh->toggle =3D FROM_DW3_DATA_TOGGLE(ptd.dw3);
-+			qh->ping =3D FROM_DW3_PING(ptd.dw3);
-+
-+			break;
-+
-+		case PTD_STATE_QTD_RELOAD: /* QTD_RETRY, for atls only */
-+			qtd->status =3D QTD_PAYLOAD_ALLOC;
-+			ptd.dw0 |=3D DW0_VALID_BIT;
-+			/* RL counter =3D ERR counter */
-+			ptd.dw3 &=3D ~TO_DW3_NAKCOUNT(0xf);
-+			ptd.dw3 |=3D TO_DW3_NAKCOUNT(FROM_DW2_RL(ptd.dw2));
-+			ptd.dw3 &=3D ~TO_DW3_CERR(3);
-+			ptd.dw3 |=3D TO_DW3_CERR(ERR_COUNTER);
-+
-+			qh->toggle =3D FROM_DW3_DATA_TOGGLE(ptd.dw3);
-+			qh->ping =3D FROM_DW3_PING(ptd.dw3);
-+			break;
-+
-+		case PTD_STATE_URB_RETIRE:
-+			qtd->status =3D QTD_RETIRE;
-+			qtd =3D NULL;
-+			qh->toggle =3D 0;
-+			qh->ping =3D 0;
-+			break;
-+
-+		default:
-+			WARN_ON(1);
-+			continue;
-+		}
-+
-+		if (qtd && (qtd->status =3D=3D QTD_PAYLOAD_ALLOC)) {
-+			if (slots =3D=3D priv->int_slots) {
-+				if (state =3D=3D PTD_STATE_QTD_RELOAD)
-+					dev_err(priv->dev,
-+						"%s: PTD_STATE_QTD_RELOAD on "
-+						"interrupt packet\n", __func__);
-+				if (state !=3D PTD_STATE_QTD_RELOAD)
-+					create_ptd_int(qh, qtd, &ptd);
-+			} else {
-+				if (state !=3D PTD_STATE_QTD_RELOAD)
-+					create_ptd_atl(qh, qtd, &ptd);
-+			}
-+
-+			start_bus_transfer(hcd, ptd_offset, slot, slots, qtd,
-+				qh, &ptd);
-+		}
-+	}
-+
-+	if (modified)
-+		schedule_ptds(hcd);
-+}
-+
-+static irqreturn_t isp1760_irq(int irq, void *__hci)
-+{
-+	struct usb_hcd *hcd =3D __hci;
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	irqreturn_t irqret =3D IRQ_NONE;
-+	u32 int_reg;
-+	u32 imask;
-+
-+	imask =3D isp1760_hcd_read(hcd, HC_INTERRUPT);
-+	if (unlikely(!imask))
-+		return irqret;
-+
-+	int_reg =3D priv->is_isp1763 ? ISP1763_HC_INTERRUPT :
-+		ISP176x_HC_INTERRUPT;
-+	isp1760_reg_write(priv->regs, int_reg, imask);
-+
-+	priv->int_done_map |=3D isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
-+	priv->atl_done_map |=3D isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
-+
-+	handle_done_ptds(hcd);
-+
-+	irqret =3D IRQ_HANDLED;
-+
-+	return irqret;
-+}
-+
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
-+	chipid_h =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-+	chipid_l =3D isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
-+	chip_rev =3D isp1760_hcd_read(hcd, HC_CHIP_REV);
-+	printf("USB ISP %02x%02x HW rev. %d started\n", chipid_h,
-+	       chipid_l, chip_rev);
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
-+static int isp1760_run(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	int retval;
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
-+
-+	/* Set PTD interrupt AND & OR maps */
-+	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
-+	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
-+	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
-+	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
-+	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
-+
-+	/* step 23 passed */
-+
-+	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
-+
-+	isp1760_hcd_clear(hcd, CMD_LRESET);
-+	isp1760_hcd_clear(hcd, CMD_RESET);
-+
-+	retval =3D isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
-+	if (retval)
-+		return retval;
-+
-+	/*
-+	 * XXX
-+	 * Spec says to write FLAG_CF as last config action, priv code grabs
-+	 * the semaphore while doing so.
-+	 */
-+	down_write(&ehci_cf_port_reset_rwsem);
-+
-+	retval =3D isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
-+	up_write(&ehci_cf_port_reset_rwsem);
-+	if (retval)
-+		return retval;
-+
-+	chipid_h =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-+	chipid_l =3D isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
-+	chip_rev =3D isp1760_hcd_read(hcd, HC_CHIP_REV);
-+	dev_info(priv->dev, "USB ISP %02x%02x HW rev. %d started\n",
-+		 chipid_h, chipid_l, chip_rev);
-+
-+	/* PTD Register Init Part 2, Step 28 */
-+
-+	/* Setup registers controlling PTD checking */
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
-+
-+	isp1760_hcd_set(hcd, ATL_BUF_FILL);
-+	isp1760_hcd_set(hcd, INT_BUF_FILL);
-+
-+	/* GRR this is run-once init(), being done every time the HC starts.
-+	 * So long as they're part of class devices, we can't do it init()
-+	 * since the class device isn't created that early.
-+	 */
-+	return 0;
-+}
-+
-+static int qtd_fill(struct isp1760_qtd *qtd, void *databuffer, size_t l=
en)
-+{
-+	qtd->data_buffer =3D databuffer;
-+
-+	qtd->length =3D len;
-+
-+	return qtd->length;
-+}
-+
-+static void qtd_list_free(struct list_head *qtd_list)
-+{
-+	struct isp1760_qtd *qtd, *qtd_next;
-+
-+	list_for_each_entry_safe(qtd, qtd_next, qtd_list, qtd_list) {
-+		list_del(&qtd->qtd_list);
-+		qtd_free(qtd);
-+	}
-+}
-+
-+/*
-+ * Packetize urb->transfer_buffer into list of packets of size wMaxPack=
etSize.
-+ * Also calculate the PID type (SETUP/IN/OUT) for each packet.
-+ */
-+#define max_packet(wMaxPacketSize) ((wMaxPacketSize) & 0x07ff)
-+static void packetize_urb(struct usb_hcd *hcd,
-+		struct urb *urb, struct list_head *head, gfp_t flags)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+	struct isp1760_qtd *qtd;
-+	void *buf;
-+	int len, maxpacketsize;
-+	u8 packet_type;
-+
-+	/*
-+	 * URBs map to sequences of QTDs:  one logical transaction
-+	 */
-+
-+	if (!urb->transfer_buffer && urb->transfer_buffer_length) {
-+		/* XXX This looks like usb storage / SCSI bug */
-+		dev_err(priv->dev, "buf is null, dma is %08lx len is %d\n",
-+			(long unsigned)urb->transfer_dma,
-+			urb->transfer_buffer_length);
-+		WARN_ON(1);
-+	}
-+
-+	if (usb_pipein(urb->pipe))
-+		packet_type =3D IN_PID;
-+	else
-+		packet_type =3D OUT_PID;
-+
-+	if (usb_pipecontrol(urb->pipe)) {
-+		qtd =3D qtd_alloc(flags, urb, SETUP_PID);
-+		if (!qtd)
-+			goto cleanup;
-+		qtd_fill(qtd, urb->setup_packet, sizeof(struct usb_ctrlrequest));
-+		list_add_tail(&qtd->qtd_list, head);
-+
-+		/* for zero length DATA stages, STATUS is always IN */
-+		if (urb->transfer_buffer_length =3D=3D 0)
-+			packet_type =3D IN_PID;
-+	}
-+
-+	maxpacketsize =3D max_packet(usb_maxpacket(urb->dev, urb->pipe));
-+
-+	/*
-+	 * buffer gets wrapped in one or more qtds;
-+	 * last one may be "short" (including zero len)
-+	 * and may serve as a control status ack
-+	 */
-+	buf =3D urb->transfer_buffer;
-+	len =3D urb->transfer_buffer_length;
-+
-+	for (;;) {
-+		int this_qtd_len;
-+
-+		qtd =3D qtd_alloc(flags, urb, packet_type);
-+		if (!qtd)
-+			goto cleanup;
-+
-+		if (len > mem->blocks_size[ISP176x_BLOCK_NUM - 1])
-+			len =3D mem->blocks_size[ISP176x_BLOCK_NUM - 1];
-+
-+		this_qtd_len =3D qtd_fill(qtd, buf, len);
-+		list_add_tail(&qtd->qtd_list, head);
-+
-+		len -=3D this_qtd_len;
-+		buf +=3D this_qtd_len;
-+
-+		if (len <=3D 0)
-+			break;
-+	}
-+
-+	/*
-+	 * control requests may need a terminating data "status" ack;
-+	 * bulk ones may need a terminating short packet (zero length).
-+	 */
-+	if (urb->transfer_buffer_length !=3D 0) {
-+		int one_more =3D 0;
-+
-+		if (usb_pipecontrol(urb->pipe)) {
-+			one_more =3D 1;
-+			if (packet_type =3D=3D IN_PID)
-+				packet_type =3D OUT_PID;
-+			else
-+				packet_type =3D IN_PID;
-+		} else if (usb_pipebulk(urb->pipe)
-+			   && (urb->transfer_flags & URB_ZERO_PACKET)
-+			   && !(urb->transfer_buffer_length %
-+				maxpacketsize)) {
-+			one_more =3D 1;
-+		}
-+		if (one_more) {
-+			qtd =3D qtd_alloc(flags, urb, packet_type);
-+			if (!qtd)
-+				goto cleanup;
-+
-+			/* never any data in such packets */
-+			qtd_fill(qtd, NULL, 0);
-+			list_add_tail(&qtd->qtd_list, head);
-+		}
-+	}
-+
-+	return;
-+
-+cleanup:
-+	qtd_list_free(head);
-+}
-+
-+static int isp1760_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
-+			       gfp_t mem_flags)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	struct isp1760_qh *qh =3D NULL;
-+	struct list_head *ep_queue;
-+	LIST_HEAD(new_qtds);
-+	int qh_in_queue;
-+	int retval;
-+	int epnum;
-+
-+	switch (usb_pipetype(urb->pipe)) {
-+	case PIPE_CONTROL:
-+		ep_queue =3D &priv->qh_list[QH_CONTROL];
-+		break;
-+	case PIPE_BULK:
-+		ep_queue =3D &priv->qh_list[QH_BULK];
-+		break;
-+	case PIPE_INTERRUPT:
-+		ep_queue =3D &priv->qh_list[QH_INTERRUPT];
-+		break;
-+	case PIPE_ISOCHRONOUS:
-+		printf("isochronous USB packets not yet supported\n");
-+		return -EPIPE;
-+	default:
-+		printf("unknown pipe type\n");
-+		return -EPIPE;
-+	}
-+
-+	if (usb_pipein(urb->pipe))
-+		urb->actual_length =3D 0;
-+
-+	packetize_urb(hcd, urb, &new_qtds, mem_flags);
-+	if (list_empty(&new_qtds))
-+		return -ENOMEM;
-+
-+	retval =3D usb_hcd_link_urb_to_ep(hcd, urb);
-+	if (retval) {
-+		qtd_list_free(&new_qtds);
-+		goto out;
-+	}
-+
-+	epnum =3D usb_pipeendpoint(urb->pipe);
-+
-+	qh_in_queue =3D 0;
-+	list_for_each_entry(qh, ep_queue, qh_list) {
-+		if (qh->epnum =3D=3D epnum) {
-+			qh_in_queue =3D 1;
-+			break;
-+		}
-+	}
-+
-+	if (!qh_in_queue) {
-+		qh =3D qh_alloc(GFP_ATOMIC);
-+		if (!qh) {
-+			retval =3D -ENOMEM;
-+			usb_hcd_unlink_urb_from_ep(hcd, urb);
-+			qtd_list_free(&new_qtds);
-+			goto out;
-+		}
-+
-+		qh->epnum =3D epnum;
-+		list_add_tail(&qh->qh_list, ep_queue);
-+		urb->ep->hcpriv =3D qh;
-+	}
-+
-+	list_splice_tail(&new_qtds, &qh->qtd_list);
-+	schedule_ptds(hcd);
-+
-+out:
-+	return retval;
-+}
-+
-+static void kill_transfer(struct usb_hcd *hcd, struct urb *urb,
-+		struct isp1760_qh *qh)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	int skip_map;
-+
-+	WARN_ON(qh->slot =3D=3D -1);
-+
-+	/* We need to forcefully reclaim the slot since some transfers never
-+	   return, e.g. interrupt transfers and NAKed bulk transfers. */
-+	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
-+		skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
-+		skip_map |=3D (1 << qh->slot);
-+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
-+		ndelay(100);
-+		priv->atl_slots[qh->slot].qh =3D NULL;
-+		priv->atl_slots[qh->slot].qtd =3D NULL;
-+	} else {
-+		skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
-+		skip_map |=3D (1 << qh->slot);
-+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
-+		priv->int_slots[qh->slot].qh =3D NULL;
-+		priv->int_slots[qh->slot].qtd =3D NULL;
-+	}
-+
-+	qh->slot =3D -1;
-+}
-+
-+/*
-+ * Retire the qtds beginning at 'qtd' and belonging all to the same urb=
, killing
-+ * any active transfer belonging to the urb in the process.
-+ */
-+static void dequeue_urb_from_qtd(struct usb_hcd *hcd, struct isp1760_qh=
 *qh,
-+				 struct isp1760_qtd *qtd)
-+{
-+	struct urb *urb;
-+	int urb_was_running;
-+
-+	urb =3D qtd->urb;
-+	urb_was_running =3D 0;
-+	list_for_each_entry_from(qtd, &qh->qtd_list, qtd_list) {
-+		if (qtd->urb !=3D urb)
-+			break;
-+
-+		if (qtd->status >=3D QTD_XFER_STARTED)
-+			urb_was_running =3D 1;
-+		if (last_qtd_of_urb(qtd, qh) &&
-+					(qtd->status >=3D QTD_XFER_COMPLETE))
-+			urb_was_running =3D 0;
-+
-+		if (qtd->status =3D=3D QTD_XFER_STARTED)
-+			kill_transfer(hcd, urb, qh);
-+		qtd->status =3D QTD_RETIRE;
-+	}
-+}
-+
-+int isp1760_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int statu=
s)
-+{
-+	struct isp1760_qtd *qtd;
-+	struct isp1760_qh *qh;
-+	int retval =3D 0;
-+
-+	retval =3D usb_hcd_check_unlink_urb(hcd, urb, status);
-+	if (retval)
-+		goto out;
-+
-+	qh =3D urb->ep->hcpriv;
-+	if (!qh) {
-+		retval =3D -EINVAL;
-+		goto out;
-+	}
-+
-+	list_for_each_entry(qtd, &qh->qtd_list, qtd_list)
-+		if (qtd->urb =3D=3D urb) {
-+			dequeue_urb_from_qtd(hcd, qh, qtd);
-+			list_move(&qtd->qtd_list, &qh->qtd_list);
-+			break;
-+		}
-+
-+	urb->status =3D status;
-+	schedule_ptds(hcd);
-+
-+out:
-+	return retval;
-+}
-+
-+static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
-+				   struct usb_hub_descriptor *desc)
-+{
-+	int ports;
-+	u16 temp;
-+
-+	ports =3D isp1760_hcd_n_ports(priv->hcd);
-+
-+	desc->bDescriptorType =3D USB_DT_HUB;
-+	/* priv 1.0, 2.3.9 says 20ms max */
-+	desc->bPwrOn2PwrGood =3D 10;
-+	desc->bHubContrCurrent =3D 0;
-+
-+	desc->bNbrPorts =3D ports;
-+	temp =3D 1 + (ports / 8);
-+	desc->bLength =3D 7 + 2 * temp;
-+
-+	/* ports removable, and usb 1.0 legacy PortPwrCtrlMask */
-+	memset(&desc->u.hs.DeviceRemovable[0], 0, temp);
-+	memset(&desc->u.hs.DeviceRemovable[temp], 0xff, temp);
-+
-+	/* per-port overcurrent reporting */
-+	temp =3D HUB_CHAR_INDV_PORT_OCPM;
-+	if (isp1760_hcd_ppc_is_set(priv->hcd))
-+		/* per-port power control */
-+		temp |=3D HUB_CHAR_INDV_PORT_LPSM;
-+	else
-+		/* no power switching */
-+		temp |=3D HUB_CHAR_NO_LPSM;
-+	desc->wHubCharacteristics =3D cpu_to_le16(temp);
-+}
-+
-+#define	PORT_WAKE_BITS	(PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
-+
-+static void check_reset_complete(struct usb_hcd *hcd, int index)
-+{
-+	if (!(isp1760_hcd_is_set(hcd, PORT_CONNECT)))
-+		return;
-+
-+	/* if reset finished and it's still not enabled -- handoff */
-+	if (!isp1760_hcd_is_set(hcd, PORT_PE)) {
-+		printf("port %d full speed --> companion\n", index + 1);
-+
-+		isp1760_hcd_set(hcd, PORT_OWNER);
-+
-+		isp1760_hcd_clear(hcd, PORT_CSC);
-+	} else {
-+		printf("port %d high speed\n", index + 1);
-+	}
-+
-+	return;
-+}
-+
-+static int isp1760_hub_control(struct usb_hcd *hcd, struct usb_device *=
dev,
-+			       unsigned long pipe, void *buffer, int length,
-+			       struct devrequest *setup)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u16 typeReq, wValue, wIndex;
-+	unsigned long flags;
-+	char *buf =3D buffer;
-+	void *src =3D NULL;
-+	int src_len =3D 0;
-+	int retval =3D 0;
-+	u32 status;
-+	int ports;
-+
-+	if (!setup)
-+		return -EINVAL;
-+
-+	ports =3D isp1760_hcd_n_ports(hcd);
-+
-+	typeReq =3D setup->request | (setup->requesttype << 8);
-+	wValue =3D le16_to_cpu(setup->value);
-+	wIndex =3D le16_to_cpu(setup->index);
-+
-+	/*
-+	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
-+	 * HCS_INDICATOR may say we can change LEDs to off/amber/green.
-+	 * (track current state ourselves) ... blink for diagnostics,
-+	 * power, "this is the one", etc.  EHCI spec supports this.
-+	 */
-+
-+	switch (typeReq) {
-+	case DeviceOutRequest | USB_REQ_SET_ADDRESS:
-+		break;
-+	case DeviceOutRequest | USB_REQ_SET_CONFIGURATION:
-+		/* Nothing to do */
-+		break;
-+	case DeviceRequest | USB_REQ_GET_DESCRIPTOR:
-+		switch (wValue & 0xff00) {
-+		case USB_DT_DEVICE << 8:
-+			src =3D &rh_descriptor.device;
-+			src_len =3D 0x12;
-+			break;
-+		case USB_DT_CONFIG << 8:
-+			src =3D &rh_descriptor.config;
-+			src_len =3D 0x09;
-+			break;
-+		case USB_DT_STRING << 8:
-+			switch (wValue & 0xff) {
-+			case 0:	/* Language */
-+				src =3D "\4\3\19\4";
-+				src_len =3D 4;
-+				break;
-+			case 1:	/* Vendor String  */
-+				src =3D "\16\3U\0-\0B\0o\0o\0t\0";
-+				src_len =3D 14;
-+				break;
-+			case 2:	/* Product Name */
-+				src =3D "\52\3I\0S\0P\0-\0 "
-+					 "\0H\0o\0s\0t\0 "
-+					 "\0C\0o\0n\0t\0r\0o\0l\0l\0e\0r\0";
-+				src_len =3D 42;
-+				break;
-+			default:
-+				goto error;
-+			}
-+			break;
-+		}
-+		break;
-+	case ClearHubFeature:
-+		switch (wValue) {
-+		case C_HUB_LOCAL_POWER:
-+		case C_HUB_OVER_CURRENT:
-+			/* no hub-wide feature/status flags */
-+			break;
-+		default:
-+			goto error;
-+		}
-+		break;
-+	case ClearPortFeature:
-+		if (!wIndex || wIndex > ports)
-+			goto error;
-+		wIndex--;
-+
-+		/*
-+		 * Even if OWNER is set, so the port is owned by the
-+		 * companion controller, hub_wq needs to be able to clear
-+		 * the port-change status bits (especially
-+		 * USB_PORT_STAT_C_CONNECTION).
-+		 */
-+
-+		switch (wValue) {
-+		case USB_PORT_FEAT_ENABLE:
-+			isp1760_hcd_clear(hcd, PORT_PE);
-+			break;
-+		case USB_PORT_FEAT_C_ENABLE:
-+			/* XXX error? */
-+			break;
-+		case USB_PORT_FEAT_SUSPEND:
-+			if (isp1760_hcd_is_set(hcd, PORT_RESET))
-+				goto error;
-+
-+			if (isp1760_hcd_is_set(hcd, PORT_SUSPEND)) {
-+				if (!isp1760_hcd_is_set(hcd, PORT_PE))
-+					goto error;
-+				/* resume signaling for 20 msec */
-+				isp1760_hcd_clear(hcd, PORT_CSC);
-+				isp1760_hcd_set(hcd, PORT_RESUME);
-+
-+				priv->reset_done =3D get_timer(0) + 40;
-+			}
-+			break;
-+		case USB_PORT_FEAT_C_SUSPEND:
-+			/* we auto-clear this feature */
-+			break;
-+		case USB_PORT_FEAT_POWER:
-+			if (isp1760_hcd_ppc_is_set(hcd))
-+				isp1760_hcd_clear(hcd, PORT_POWER);
-+			break;
-+		case USB_PORT_FEAT_C_CONNECTION:
-+			isp1760_hcd_set(hcd, PORT_CSC);
-+			break;
-+		case USB_PORT_FEAT_C_OVER_CURRENT:
-+			/* XXX error ?*/
-+			break;
-+		case USB_PORT_FEAT_C_RESET:
-+			/* GetPortStatus clears reset */
-+			break;
-+		default:
-+			goto error;
-+		}
-+		isp1760_hcd_read(hcd, CMD_RUN);
-+		break;
-+	case GetHubDescriptor:
-+		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *) buf);
-+		break;
-+	case GetHubStatus:
-+		/* no hub-wide feature/status flags */
-+		memset(buf, 0, 4);
-+		break;
-+	case GetPortStatus:
-+		if (!wIndex || wIndex > ports)
-+			goto error;
-+		wIndex--;
-+		status =3D 0;
-+
-+		/* wPortChange bits */
-+		if (isp1760_hcd_is_set(hcd, PORT_CSC))
-+			status |=3D USB_PORT_STAT_C_CONNECTION << 16;
-+
-+		/* whoever resumes must GetPortStatus to complete it!! */
-+		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
-+			status |=3D USB_PORT_STAT_C_SUSPEND << 16;
-+
-+			if (!priv->reset_done) {
-+				priv->reset_done =3D get_timer(0) + 20;
-+			} else if (get_timer(0) > priv->reset_done) {
-+				/* stop resume signaling */
-+				isp1760_hcd_clear(hcd, PORT_CSC);
-+
-+				retval =3D isp1760_hcd_clear_and_wait(hcd,
-+								    PORT_RESUME, 2000);
-+				if (retval !=3D 0) {
-+					printf("port %d resume error %d\n",
-+					       wIndex + 1, retval);
-+					goto error;
-+				}
-+			}
-+		}
-+
-+		/* whoever resets must GetPortStatus to complete it!! */
-+		if (isp1760_hcd_is_set(hcd, PORT_RESET) &&
-+		    get_timer(0) > priv->reset_done) {
-+			status |=3D USB_PORT_STAT_C_RESET << 16;
-+			priv->reset_done =3D 0;
-+
-+			/* force reset to complete */
-+			/* REVISIT:  some hardware needs 550+ usec to clear
-+			 * this bit; seems too long to spin routinely...
-+			 */
-+			retval =3D isp1760_hcd_clear_and_wait(hcd, PORT_RESET,
-+							    750);
-+			if (retval !=3D 0) {
-+				printf("port %d reset error %d\n", wIndex + 1,
-+				       retval);
-+				goto error;
-+			}
-+
-+			/* see what we found out */
-+			check_reset_complete(hcd, wIndex);
-+		}
-+		/*
-+		 * Even if OWNER is set, there's no harm letting hub_wq
-+		 * see the wPortStatus values (they should all be 0 except
-+		 * for PORT_POWER anyway).
-+		 */
-+
-+		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
-+			printf("PORT_OWNER is set\n");
-+
-+		if (isp1760_hcd_is_set(hcd, PORT_CONNECT)) {
-+			status |=3D USB_PORT_STAT_CONNECTION;
-+
-+			/* status may be from integrated TT */
-+			status |=3D USB_PORT_STAT_HIGH_SPEED;
-+		}
-+		if (isp1760_hcd_is_set(hcd, PORT_PE))
-+			status |=3D USB_PORT_STAT_ENABLE;
-+		if (isp1760_hcd_is_set(hcd, PORT_SUSPEND) &&
-+		    isp1760_hcd_is_set(hcd, PORT_RESUME))
-+			status |=3D USB_PORT_STAT_SUSPEND;
-+		if (isp1760_hcd_is_set(hcd, PORT_RESET))
-+			status |=3D USB_PORT_STAT_RESET;
-+		if (isp1760_hcd_is_set(hcd, PORT_POWER))
-+			status |=3D USB_PORT_STAT_POWER;
-+
-+		put_unaligned(cpu_to_le32(status), (__le32 *) buf);
-+		break;
-+	case SetHubFeature:
-+		switch (wValue) {
-+		case C_HUB_LOCAL_POWER:
-+		case C_HUB_OVER_CURRENT:
-+			/* no hub-wide feature/status flags */
-+			break;
-+		default:
-+			goto error;
-+		}
-+		break;
-+	case SetPortFeature:
-+		wIndex &=3D 0xff;
-+		if (!wIndex || wIndex > ports)
-+			goto error;
-+		wIndex--;
-+
-+		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
-+			break;
-+
-+		switch (wValue) {
-+		case USB_PORT_FEAT_ENABLE:
-+			isp1760_hcd_set(hcd, PORT_PE);
-+			break;
-+
-+		case USB_PORT_FEAT_SUSPEND:
-+			if (!isp1760_hcd_is_set(hcd, PORT_PE) ||
-+			    isp1760_hcd_is_set(hcd, PORT_RESET))
-+				goto error;
-+
-+			isp1760_hcd_set(hcd, PORT_SUSPEND);
-+			break;
-+		case USB_PORT_FEAT_POWER:
-+			if (isp1760_hcd_ppc_is_set(hcd))
-+				isp1760_hcd_set(hcd, PORT_POWER);
-+			break;
-+		case USB_PORT_FEAT_RESET:
-+			if (isp1760_hcd_is_set(hcd, PORT_RESUME))
-+				goto error;
-+			/* line status bits may report this as low speed,
-+			 * which can be fine if this root hub has a
-+			 * transaction translator built in.
-+			 */
-+			if ((isp1760_hcd_is_set(hcd, PORT_CONNECT) &&
-+			     !isp1760_hcd_is_set(hcd, PORT_PE)) &&
-+			    (isp1760_hcd_read(hcd, PORT_LSTATUS) =3D=3D 1)) {
-+				isp1760_hcd_set(hcd, PORT_OWNER);
-+			} else {
-+				isp1760_hcd_set(hcd, PORT_RESET);
-+				isp1760_hcd_clear(hcd, PORT_PE);
-+
-+				priv->reset_done =3D get_timer(0) + 50;
-+			}
-+			break;
-+		default:
-+			goto error;
-+		}
-+		break;
-+
-+	default:
-+		printf("root: unknown request: 0x%0x\n", typeReq);
-+		goto error;
-+	}
-+	spin_unlock_irqrestore(&priv->lock, flags);
-+
-+	if (src_len) {
-+		length =3D min(src_len, length);
-+
-+		if (src !=3D NULL && length > 0)
-+			memcpy(buffer, src, length);
-+		else
-+			printf("zero copy USB descriptor\n");
-+	}
-+
-+	dev->act_len =3D length;
-+	dev->status =3D 0;
-+
-+	return 0;
-+
-+error:
-+	/* "stall" on error */
-+	dev->act_len =3D 0;
-+	dev->status =3D USB_ST_STALLED;
-+	return -EPIPE;
-+}
-+
-+#ifndef __UBOOT__
-+static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
-+{
-+	u32 status =3D 0;
-+	int retval =3D 1;
-+
-+	/* init status to no-changes */
-+	buf[0] =3D 0;
-+
-+	if (isp1760_hcd_is_set(hcd, PORT_OWNER) &&
-+	    isp1760_hcd_is_set(hcd, PORT_CSC)) {
-+		isp1760_hcd_clear(hcd, PORT_CSC);
-+		goto done;
-+	}
-+
-+done:
-+	return status ? retval : 0;
-+}
-+
-+static void isp1760_endpoint_disable(struct usb_hcd *hcd,
-+		struct usb_host_endpoint *ep)
-+{
-+	struct isp1760_qh *qh, *qh_iter;
-+	unsigned long spinflags;
-+	int i;
-+
-+	qh =3D ep->hcpriv;
-+	if (!qh)
-+		return;
-+
-+	WARN_ON(!list_empty(&qh->qtd_list));
-+
-+	for (i =3D 0; i < QH_END; i++)
-+		list_for_each_entry(qh_iter, &priv->qh_list[i], qh_list)
-+			if (qh_iter =3D=3D qh) {
-+				list_del(&qh_iter->qh_list);
-+				i =3D QH_END;
-+				break;
-+			}
-+	qh_free(qh);
-+	ep->hcpriv =3D NULL;
-+
-+	schedule_ptds(hcd);
-+}
-+
-+static int isp1760_get_frame(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 fr;
-+
-+	fr =3D isp1760_hcd_read(hcd, HC_FRINDEX);
-+	return (fr >> 3) % priv->periodic_size;
-+}
-+
-+static void isp1760_stop(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	msleep(20);
-+
-+	spin_lock_irq(&priv->lock);
-+	ehci_reset(hcd);
-+	/* Disable IRQ */
-+	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
-+	spin_unlock_irq(&priv->lock);
-+
-+	isp1760_hcd_clear(hcd, FLAG_CF);
-+}
-+
-+static void isp1760_shutdown(struct usb_hcd *hcd)
-+{
-+	isp1760_stop(hcd);
-+
-+	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
-+
-+	isp1760_hcd_clear(hcd, CMD_RUN);
-+}
-+
-+static void isp1760_clear_tt_buffer_complete(struct usb_hcd *hcd,
-+						struct usb_host_endpoint *ep)
-+{
-+	struct isp1760_qh *qh =3D ep->hcpriv;
-+	unsigned long spinflags;
-+
-+	if (!qh)
-+		return;
-+
-+	qh->tt_buffer_dirty =3D 0;
-+	schedule_ptds(hcd);
-+}
-+
-+
-+static const struct hc_driver isp1760_hc_driver =3D {
-+	.description		=3D "isp1760-hcd",
-+	.product_desc		=3D "NXP ISP1760 USB Host Controller",
-+	.hcd_priv_size		=3D sizeof(struct isp1760_hcd *),
-+	.irq			=3D isp1760_irq,
-+	.flags			=3D HCD_MEMORY | HCD_USB2,
-+	.reset			=3D isp1760_hc_setup,
-+	.start			=3D isp1760_run,
-+	.stop			=3D isp1760_stop,
-+	.shutdown		=3D isp1760_shutdown,
-+	.urb_enqueue		=3D isp1760_urb_enqueue,
-+	.urb_dequeue		=3D isp1760_urb_dequeue,
-+	.endpoint_disable	=3D isp1760_endpoint_disable,
-+	.get_frame_number	=3D isp1760_get_frame,
-+	.hub_status_data	=3D isp1760_hub_status_data,
-+	.hub_control		=3D isp1760_hub_control,
-+	.clear_tt_buffer_complete	=3D isp1760_clear_tt_buffer_complete,
-+};
-+#endif // __UBOOT__
-+
-+int __init isp1760_init_kmem_once(void)
-+{
-+	urb_listitem_cachep =3D kmem_cache_create("isp1760_urb_listitem",
-+			sizeof(struct urb_listitem), 0, SLAB_TEMPORARY |
-+			SLAB_MEM_SPREAD, NULL);
-+
-+	if (!urb_listitem_cachep)
-+		return -ENOMEM;
-+
-+	qtd_cachep =3D kmem_cache_create("isp1760_qtd",
-+			sizeof(struct isp1760_qtd), 0, SLAB_TEMPORARY |
-+			SLAB_MEM_SPREAD, NULL);
-+
-+	if (!qtd_cachep)
-+		return -ENOMEM;
-+
-+	qh_cachep =3D kmem_cache_create("isp1760_qh", sizeof(struct isp1760_qh=
),
-+			0, SLAB_TEMPORARY | SLAB_MEM_SPREAD, NULL);
-+
-+	if (!qh_cachep) {
-+		kmem_cache_destroy(qtd_cachep);
-+		return -ENOMEM;
-+	}
-+
-+	return 0;
-+}
-+
-+void isp1760_deinit_kmem_cache(void)
-+{
-+	kmem_cache_destroy(qtd_cachep);
-+	kmem_cache_destroy(qh_cachep);
-+	kmem_cache_destroy(urb_listitem_cachep);
-+}
-+
-+int isp1760_hcd_lowlevel_init(struct isp1760_hcd *priv)
-+{
-+	int ret;
-+
-+	ret =3D isp1760_hc_setup(priv->hcd);
-+	if (ret < 0)
-+		return ret;
-+
-+	ret =3D isp1760_run(priv->hcd);
-+	if (ret < 0)
-+		return ret;
-+
-+	return 0;
-+}
-+
-+static const struct usb_urb_ops isp1760_urb_ops =3D {
-+	.urb_enqueue =3D isp1760_urb_enqueue,
-+	.urb_dequeue =3D isp1760_urb_dequeue,
-+	.hub_control =3D isp1760_hub_control,
-+	.isr =3D isp1760_irq,
-+};
-+
-+int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem=
,
-+			 int irq, unsigned long irqflags,
-+			 struct udevice *dev)
-+{
-+	const struct isp1760_memory_layout *mem_layout =3D priv->memory_layout=
;
-+	struct isp1760_host_data *host =3D dev_get_priv(dev);
-+	struct usb_hcd *hcd =3D &host->hcd;
-+	int ret;
-+
-+	priv->hcd =3D hcd;
-+
-+	hcd->hcd_priv =3D priv;
-+
-+	priv->hcd =3D hcd;
-+
-+	hcd->urb_ops =3D &isp1760_urb_ops;
-+
-+	priv->atl_slots =3D kcalloc(mem_layout->slot_num,
-+				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
-+	if (!priv->atl_slots)
-+		return -ENOMEM;
-+
-+	priv->int_slots =3D kcalloc(mem_layout->slot_num,
-+				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
-+	if (!priv->int_slots) {
-+		ret =3D -ENOMEM;
-+		goto free_atl_slots;
-+	}
-+
-+	host->host_speed =3D USB_SPEED_HIGH;
-+
-+	init_memory(priv);
-+
-+	return 0;
-+
-+free_atl_slots:
-+	kfree(priv->atl_slots);
-+
-+	return ret;
-+}
-+
-+void isp1760_hcd_unregister(struct isp1760_hcd *priv)
-+{
-+	struct isp1760_qh *qh, *qh_next;
-+	int i;
-+
-+	for (i =3D 0; i < QH_END; i++)
-+		list_for_each_entry_safe(qh, qh_next, &priv->qh_list[i],
-+					 qh_list) {
-+			qtd_list_free(&qh->qtd_list);
-+			list_del(&qh->qh_list);
-+			qh_free(qh);
-+		}
-+
-+	kfree(priv->atl_slots);
-+	kfree(priv->int_slots);
-+}
-diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp=
1760-hcd.h
-new file mode 100644
-index 0000000000..00f5ca8c1f
---- /dev/null
-+++ b/drivers/usb/isp1760/isp1760-hcd.h
-@@ -0,0 +1,82 @@
-+/* SPDX-License-Identifier: GPL-2.0 */
-+#ifndef _ISP1760_HCD_H_
-+#define _ISP1760_HCD_H_
-+
-+#include <regmap.h>
-+
-+#include "isp1760-regs.h"
-+
-+struct isp1760_qh;
-+struct isp1760_qtd;
-+struct resource;
-+struct usb_hcd;
-+
-+struct isp1760_slotinfo {
-+	struct isp1760_qh *qh;
-+	struct isp1760_qtd *qtd;
-+	unsigned long timestamp;
-+};
-+
-+/* chip memory management */
-+#define ISP176x_BLOCK_MAX (32 + 20 + 4)
-+#define ISP176x_BLOCK_NUM 3
-+
-+struct isp1760_memory_layout {
-+	unsigned int blocks[ISP176x_BLOCK_NUM];
-+	unsigned int blocks_size[ISP176x_BLOCK_NUM];
-+
-+	unsigned int slot_num;
-+	unsigned int payload_blocks;
-+	unsigned int payload_area_size;
-+};
-+
-+struct isp1760_memory_chunk {
-+	unsigned int start;
-+	unsigned int size;
-+	unsigned int free;
-+};
-+
-+enum isp1760_queue_head_types {
-+	QH_CONTROL,
-+	QH_BULK,
-+	QH_INTERRUPT,
-+	QH_END
-+};
-+
-+struct isp1760_hcd {
-+	struct usb_hcd		*hcd;
-+	struct udevice		*dev;
-+
-+	void __iomem		*base;
-+
-+	struct regmap		*regs;
-+	struct regmap_field	*fields[HC_FIELD_MAX];
-+
-+	bool			is_isp1763;
-+	const struct isp1760_memory_layout	*memory_layout;
-+
-+	spinlock_t		lock;
-+	struct isp1760_slotinfo	*atl_slots;
-+	int			atl_done_map;
-+	struct isp1760_slotinfo	*int_slots;
-+	int			int_done_map;
-+	struct isp1760_memory_chunk memory_pool[ISP176x_BLOCK_MAX];
-+	struct list_head	qh_list[QH_END];
-+
-+	/* periodic schedule support */
-+#define	DEFAULT_I_TDPS		1024
-+	unsigned		periodic_size;
-+	unsigned		i_thresh;
-+	unsigned long		reset_done;
-+	unsigned long		next_statechange;
-+};
-+
-+int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem=
,
-+			 int irq, unsigned long irqflags, struct udevice *dev);
-+void isp1760_hcd_unregister(struct isp1760_hcd *priv);
-+int isp1760_hcd_lowlevel_init(struct isp1760_hcd *priv);
-+
-+int isp1760_init_kmem_once(void);
-+void isp1760_deinit_kmem_cache(void);
-+
-+#endif /* _ISP1760_HCD_H_ */
-diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1=
760-if.c
-new file mode 100644
-index 0000000000..c610da6b23
---- /dev/null
-+++ b/drivers/usb/isp1760/isp1760-if.c
-@@ -0,0 +1,127 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
-+ *
-+ * based on original code from:
-+ * (c) 2007 Sebastian Siewior <bigeasy@linutronix.de>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <dm/device-internal.h>
-+#include <dm/device_compat.h>
-+#include <dm/devres.h>
-+#include <dm/lists.h>
-+#include <linux/bug.h>
-+#include <linux/io.h>
-+#include <linux/kernel.h>
-+#include <linux/usb/otg.h>
-+#include <log.h>
-+#include <usb.h>
-+
-+#include "isp1760-core.h"
-+#include "isp1760-regs.h"
-+#include "isp1760-uboot.h"
-+
-+
-+static int isp1760_of_to_plat(struct udevice *dev)
-+{
-+	struct isp1760_device *isp =3D dev_get_plat(dev);
-+	unsigned int devflags =3D 0;
-+	u32 bus_width =3D 0;
-+	ofnode dp;
-+
-+
-+	if (!dev_has_ofnode(dev)) {
-+		/* select isp1763 as the default device */
-+		devflags =3D ISP1760_FLAG_ISP1763 | ISP1760_FLAG_BUS_WIDTH_16;
-+		pr_err("isp1760: no platform data\n");
-+		goto isp_setup;
-+	}
-+
-+	dp =3D dev_ofnode(dev);
-+
-+	if (ofnode_device_is_compatible(dp, "nxp,usb-isp1761"))
-+		devflags |=3D ISP1760_FLAG_ISP1761;
-+
-+	if (ofnode_device_is_compatible(dp, "nxp,usb-isp1763"))
-+		devflags |=3D ISP1760_FLAG_ISP1763;
-+
-+	/*
-+	* Some systems wire up only 8 of 16 data lines or
-+	* 16 of the 32 data lines
-+	*/
-+	bus_width =3D ofnode_read_u32_default(dp, "bus-width", 16);
-+	if (bus_width =3D=3D 16)
-+		devflags |=3D ISP1760_FLAG_BUS_WIDTH_16;
-+	else if (bus_width =3D=3D 8)
-+		devflags |=3D ISP1760_FLAG_BUS_WIDTH_8;
-+
-+	if (usb_get_dr_mode(dev_ofnode(dev)) =3D=3D USB_DR_MODE_PERIPHERAL)
-+		devflags |=3D ISP1760_FLAG_PERIPHERAL_EN;
-+
-+	if (ofnode_read_bool(dp, "analog-oc"))
-+		devflags |=3D ISP1760_FLAG_ANALOG_OC;
-+
-+	if (ofnode_read_bool(dp, "dack-polarity"))
-+		devflags |=3D ISP1760_FLAG_DACK_POL_HIGH;
-+
-+	if (ofnode_read_bool(dp, "dreq-polarity"))
-+		devflags |=3D ISP1760_FLAG_DREQ_POL_HIGH;
-+
-+isp_setup:
-+	isp->devflags =3D devflags;
-+	isp->dev =3D dev;
-+
-+	return 0;
-+}
-+
-+static int isp1760_plat_probe(struct udevice *dev)
-+{
-+	struct isp1760_device *isp =3D dev_get_plat(dev);
-+	struct resource mem_res;
-+	struct resource irq_res;
-+	int ret;
-+
-+	dev_read_resource(dev, 0, &mem_res);
-+	dev_read_resource(dev, 1, &irq_res);
-+
-+	isp1760_init_kmem_once();
-+
-+	ret =3D isp1760_register(isp, &mem_res, irq_res.start, irq_res.flags);
-+	if (ret < 0) {
-+		isp1760_deinit_kmem_cache();
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-+
-+static int isp1760_plat_remove(struct udevice *dev)
-+{
-+	struct isp1760_device *isp =3D dev_get_plat(dev);
-+
-+	isp1760_deinit_kmem_cache();
-+	isp1760_unregister(isp);
-+
-+	return 0;
-+}
-+
-+static const struct udevice_id isp1760_ids[] =3D {
-+	{ .compatible =3D "nxp,usb-isp1760", },
-+	{ .compatible =3D "nxp,usb-isp1761", },
-+	{ .compatible =3D "nxp,usb-isp1763", },
-+	{ },
-+};
-+
-+U_BOOT_DRIVER(isp1760) =3D {
-+	.name		=3D "isp1760",
-+	.id		=3D UCLASS_USB,
-+	.of_match	=3D isp1760_ids,
-+	.of_to_plat	=3D isp1760_of_to_plat,
-+	.ops		=3D &isp1760_usb_ops,
-+	.probe		=3D isp1760_plat_probe,
-+	.remove		=3D isp1760_plat_remove,
-+	.plat_auto	=3D sizeof(struct isp1760_device),
-+	.priv_auto	=3D sizeof(struct isp1760_host_data),
-+};
-diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/is=
p1760-regs.h
-new file mode 100644
-index 0000000000..94ea60c20b
---- /dev/null
-+++ b/drivers/usb/isp1760/isp1760-regs.h
-@@ -0,0 +1,292 @@
-+/* SPDX-License-Identifier: GPL-2.0 */
-+/*
-+ * Driver for the NXP ISP1760 chip
-+ *
-+ * Copyright 2021 Linaro, Rui Miguel Silva
-+ * Copyright 2014 Laurent Pinchart
-+ * Copyright 2007 Sebastian Siewior
-+ *
-+ * Contacts:
-+ *     Sebastian Siewior <bigeasy@linutronix.de>
-+ *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-+ *     Rui Miguel Silva <rui.silva@linaro.org>
-+ */
-+
-+#ifndef _ISP176x_REGS_H_
-+#define _ISP176x_REGS_H_
-+
-+/* --------------------------------------------------------------------=
---------
-+ * Host Controller
-+ */
-+
-+/* ISP1760/31 */
-+/* EHCI capability registers */
-+#define ISP176x_HC_VERSION		0x002
-+#define ISP176x_HC_HCSPARAMS		0x004
-+#define ISP176x_HC_HCCPARAMS		0x008
-+
-+/* EHCI operational registers */
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
-+
-+/* Configuration Register */
-+#define ISP176x_HC_HW_MODE_CTRL		0x300
-+#define ISP176x_HC_CHIP_ID		0x304
-+#define ISP176x_HC_SCRATCH		0x308
-+#define ISP176x_HC_RESET		0x30c
-+#define ISP176x_HC_BUFFER_STATUS	0x334
-+#define ISP176x_HC_MEMORY		0x33c
-+
-+/* Interrupt Register */
-+#define ISP176x_HC_INTERRUPT		0x310
-+#define ISP176x_HC_INTERRUPT_ENABLE	0x314
-+#define ISP176x_HC_ISO_IRQ_MASK_OR	0x318
-+#define ISP176x_HC_INT_IRQ_MASK_OR	0x31c
-+#define ISP176x_HC_ATL_IRQ_MASK_OR	0x320
-+#define ISP176x_HC_ISO_IRQ_MASK_AND	0x324
-+#define ISP176x_HC_INT_IRQ_MASK_AND	0x328
-+#define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
-+
-+#define ISP176x_HC_OTG_CTRL_SET		0x374
-+#define ISP176x_HC_OTG_CTRL_CLEAR	0x376
-+
-+enum isp176x_host_controller_fields {
-+	/* HC_PORTSC1 */
-+	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
-+	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
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
-+	/* ISO/INT/ATL PTD */
-+	HC_ISO_PTD_DONEMAP, HC_ISO_PTD_SKIPMAP, HC_ISO_PTD_LASTPTD,
-+	HC_INT_PTD_DONEMAP, HC_INT_PTD_SKIPMAP, HC_INT_PTD_LASTPTD,
-+	HC_ATL_PTD_DONEMAP, HC_ATL_PTD_SKIPMAP, HC_ATL_PTD_LASTPTD,
-+	/* HC_HW_MODE_CTRL */
-+	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_DMA,
-+	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HIGH_AC=
T,
-+	HW_INTF_LOCK, HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
-+	/* HC_CHIP_ID */
-+	HC_CHIP_ID_HIGH, HC_CHIP_ID_LOW, HC_CHIP_REV,
-+	/* HC_SCRATCH */
-+	HC_SCRATCH,
-+	/* HC_RESET */
-+	SW_RESET_RESET_ATX, SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
-+	/* HC_BUFFER_STATUS */
-+	ISO_BUF_FILL, INT_BUF_FILL, ATL_BUF_FILL,
-+	/* HC_MEMORY */
-+	MEM_BANK_SEL, MEM_START_ADDR,
-+	/* HC_DATA */
-+	HC_DATA,
-+	/* HC_INTERRUPT */
-+	HC_INTERRUPT,
-+	/* HC_INTERRUPT_ENABLE */
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
-+	/* Last element */
-+	HC_FIELD_MAX,
-+};
-+
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
-+/* --------------------------------------------------------------------=
---------
-+ * Peripheral Controller
-+ */
-+
-+#define DC_IEPTX(n)			(1 << (11 + 2 * (n)))
-+#define DC_IEPRX(n)			(1 << (10 + 2 * (n)))
-+#define DC_IEPRXTX(n)			(3 << (10 + 2 * (n)))
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
-+
-+/* Data Flow Registers */
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
-+/* DMA Registers */
-+#define ISP176x_DC_DMACMD		0x0230
-+#define ISP176x_DC_DMATXCOUNT		0x0234
-+#define ISP176x_DC_DMACONF		0x0238
-+#define ISP176x_DC_DMAHW		0x023c
-+#define ISP176x_DC_DMAINTREASON		0x0250
-+#define ISP176x_DC_DMAINTEN		0x0254
-+#define ISP176x_DC_DMAEP		0x0258
-+#define ISP176x_DC_DMABURSTCOUNT	0x0264
-+
-+/* General Registers */
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
-+	/* DC_CHIP_ID */
-+	DC_CHIP_ID_HIGH, DC_CHIP_ID_LOW,
-+	/* DC_SCRATCH */
-+	DC_SCRATCH,
-+	/* Last element */
-+	DC_FIELD_MAX,
-+};
-+
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
-+#endif
-diff --git a/drivers/usb/isp1760/isp1760-uboot.c b/drivers/usb/isp1760/i=
sp1760-uboot.c
-new file mode 100644
-index 0000000000..7635210fe2
---- /dev/null
-+++ b/drivers/usb/isp1760/isp1760-uboot.c
-@@ -0,0 +1,76 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Driver for the NXP ISP1760 chip
-+ *
-+ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
-+ *
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <dm/device-internal.h>
-+#include <dm/device_compat.h>
-+#include <dm/devres.h>
-+#include <dm/lists.h>
-+#include <linux/bug.h>
-+#include <linux/io.h>
-+#include <linux/kernel.h>
-+#include <linux/usb/otg.h>
-+#include <linux/usb/usb_urb_compat.h>
-+#include <log.h>
-+#include <usb.h>
-+
-+#include "isp1760-core.h"
-+#include "isp1760-hcd.h"
-+#include "isp1760-regs.h"
-+#include "isp1760-uboot.h"
-+
-+static int isp1760_msg_submit_control(struct udevice *dev,
-+				      struct usb_device *udev,
-+				      unsigned long pipe, void *buffer,
-+				      int length, struct devrequest *setup)
-+{
-+	struct isp1760_host_data *host =3D dev_get_priv(dev);
-+
-+	return usb_urb_submit_control(&host->hcd, &host->urb, &host->hep, udev=
,
-+				      pipe, buffer, length, setup, 0,
-+				      host->host_speed);
-+}
-+
-+static int isp1760_msg_submit_bulk(struct udevice *dev, struct usb_devi=
ce *udev,
-+				   unsigned long pipe, void *buffer, int length)
-+{
-+	struct isp1760_host_data *host =3D dev_get_priv(dev);
-+
-+	return usb_urb_submit_bulk(&host->hcd, &host->urb, &host->hep, udev,
-+				   pipe, buffer, length);
-+}
-+
-+static int isp1760_msg_submit_irq(struct udevice *dev, struct usb_devic=
e *udev,
-+				  unsigned long pipe, void *buffer, int length,
-+				  int interval, bool nonblock)
-+{
-+	struct isp1760_host_data *host =3D dev_get_priv(dev);
-+
-+	return usb_urb_submit_irq(&host->hcd, &host->urb, &host->hep, udev,
-+				  pipe, buffer, length, interval);
-+}
-+
-+static int isp1760_get_max_xfer_size(struct udevice *dev, size_t *size)
-+{
-+	struct isp1760_host_data *host =3D dev_get_priv(dev);
-+	struct isp1760_hcd *priv =3D host->hcd.hcd_priv;
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+
-+	*size =3D mem->blocks_size[ISP176x_BLOCK_NUM - 1];
-+
-+	return 0;
-+}
-+
-+
-+struct dm_usb_ops isp1760_usb_ops =3D {
-+	.control		=3D isp1760_msg_submit_control,
-+	.bulk			=3D isp1760_msg_submit_bulk,
-+	.interrupt		=3D isp1760_msg_submit_irq,
-+	.get_max_xfer_size	=3D isp1760_get_max_xfer_size,
-+};
-diff --git a/drivers/usb/isp1760/isp1760-uboot.h b/drivers/usb/isp1760/i=
sp1760-uboot.h
-new file mode 100644
-index 0000000000..2486de6f9e
---- /dev/null
-+++ b/drivers/usb/isp1760/isp1760-uboot.h
-@@ -0,0 +1,27 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Driver for the NXP ISP1760 chip
-+ *
-+ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
-+ *
-+ */
-+
-+#ifndef __ISP1760_UBOOT_H__
-+#define __ISP1760_UBOOT_H__
-+
-+#include <linux/usb/usb_urb_compat.h>
-+#include <usb.h>
-+
-+#include "isp1760-core.h"
-+
-+struct isp1760_host_data {
-+	struct isp1760_hcd *priv;
-+	struct usb_hcd hcd;
-+	enum usb_device_speed host_speed;
-+	struct usb_host_endpoint hep;
-+	struct urb urb;
-+};
-+
-+extern struct dm_usb_ops isp1760_usb_ops;
-+
-+#endif
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm=
_ffa-introduce-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0005-arm_ffa-introduce-armffa-command.patch
similarity index 83%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_=
ffa-introduce-armffa-command.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ff=
a-introduce-armffa-command.patch
index f52f88dd..44afdd56 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-in=
troduce-armffa-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-in=
troduce-armffa-command.patch
@@ -1,20 +1,35 @@
-From a09ed2542f4d991fef61bd51f87d373f44ad1ff3 Mon Sep 17 00:00:00 2001
+From e9ec690a3f0d34631729a17c1734d66111e768e1 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 6 Jun 2022 12:46:38 +0100
-Subject: [PATCH 10/26] arm_ffa: introduce armffa command
+Subject: [PATCH 05/25] arm_ffa: introduce armffa command
=20
 Provide armffa command showcasing the use of the FF-A driver
=20
 The armffa command allows to query secure partitions data from
-the secure world and exchanging messages with the partitions.
+the secure world and exchanging messages with the partitions
+using 64-bit FF-A direct messaging.
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
----
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
=20
 Changelog:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
+v8:
+
+* update partition_info_get() second argument to be an SP count
+* pass NULL device pointer to the FF-A bus discovery and operations
+
+v7:
+
+* adapt do_ffa_dev_list() following the recent update on
+  uclass_first_device/uclass_next_device functions (they return void now=
)
+* set armffa command to use 64-bit direct messaging
+
 v4:
=20
 * remove pattern data in do_ffa_msg_send_direct_req
@@ -32,32 +47,32 @@ v2:
 v1:
=20
 * introduce armffa command
-
+---
  MAINTAINERS                      |   1 +
  cmd/Kconfig                      |  10 ++
  cmd/Makefile                     |   2 +
- cmd/armffa.c                     | 242 +++++++++++++++++++++++++++++++
+ cmd/armffa.c                     | 237 +++++++++++++++++++++++++++++++
  drivers/firmware/arm-ffa/Kconfig |   1 +
- 5 files changed, 256 insertions(+)
+ 5 files changed, 251 insertions(+)
  create mode 100644 cmd/armffa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index e760b4ca3a..9f0a1b7387 100644
+index 734fcb10c4..d50bdddea8 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -247,6 +247,7 @@ F:	include/configs/turris_*.h
+@@ -251,6 +251,7 @@ F:	configs/cortina_presidio-asic-pnand_defconfig
  ARM FF-A
  M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
  S:	Maintained
 +F:	cmd/armffa.c
- F:	doc/README.ffa.drv
+ F:	doc/arch/arm64.ffa.rst
  F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
 diff --git a/cmd/Kconfig b/cmd/Kconfig
-index ba2f321ae9..090e668125 100644
+index 0e0be94f41..013d4c3da7 100644
 --- a/cmd/Kconfig
 +++ b/cmd/Kconfig
-@@ -873,6 +873,16 @@ endmenu
+@@ -912,6 +912,16 @@ endmenu
 =20
  menu "Device access commands"
 =20
@@ -75,7 +90,7 @@ index ba2f321ae9..090e668125 100644
  	#depends on FLASH_CFI_DRIVER
  	bool "armflash"
 diff --git a/cmd/Makefile b/cmd/Makefile
-index 5e43a1e022..e40f52f1e4 100644
+index 6e87522b62..979c6d59df 100644
 --- a/cmd/Makefile
 +++ b/cmd/Makefile
 @@ -12,6 +12,8 @@ obj-y +=3D panic.o
@@ -89,10 +104,10 @@ index 5e43a1e022..e40f52f1e4 100644
  obj-$(CONFIG_CMD_AES) +=3D aes.o
 diff --git a/cmd/armffa.c b/cmd/armffa.c
 new file mode 100644
-index 0000000000..9b56e8a830
+index 0000000000..d2e8687bfb
 --- /dev/null
 +++ b/cmd/armffa.c
-@@ -0,0 +1,242 @@
+@@ -0,0 +1,237 @@
 +// SPDX-License-Identifier: GPL-2.0+
 +/*
 + * (C) Copyright 2022 ARM Limited
@@ -126,7 +141,7 @@ index 0000000000..9b56e8a830
 +static int do_ffa_get_singular_partition_info(struct cmd_tbl *cmdtp, in=
t flag, int argc,
 +					      char *const argv[])
 +{
-+	u32 count =3D 0, size =3D 0;
++	u32 count =3D 0;
 +	int ret;
 +	struct ffa_partition_info *parts_info;
 +	u32 info_idx;
@@ -135,7 +150,7 @@ index 0000000000..9b56e8a830
 +		return -EINVAL;
 +
 +	/* Mode 1: getting the number of secure partitions */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(argv[0], &count, NULL);
++	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, argv[0], &count, N=
ULL);
 +	if (ret !=3D 0) {
 +		ffa_err("Failure in querying partitions count (error code: %d)", ret)=
;
 +		return ret;
@@ -157,13 +172,11 @@ index 0000000000..9b56e8a830
 +	if (!parts_info)
 +		return -EINVAL;
 +
-+	size =3D count * sizeof(struct ffa_partition_info);
-+
 +	/*
 +	 * ask the driver to fill the buffer with the SPs info
 +	 */
 +
-+	ret =3D ffa_bus_ops_get()->partition_info_get(argv[0], &size, parts_in=
fo);
++	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, argv[0], &count, p=
arts_info);
 +	if (ret !=3D 0) {
 +		ffa_err("Failure in querying partition(s) info (error code: %d)", ret=
);
 +		free(parts_info);
@@ -224,7 +237,7 @@ index 0000000000..9b56e8a830
 +		return -EINVAL;
 +	}
 +
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
++	ret =3D ffa_bus_ops_get()->sync_send_receive(NULL, part_id, &msg, 1);
 +	if (ret =3D=3D 0) {
 +		u8 cnt;
 +
@@ -257,16 +270,13 @@ index 0000000000..9b56e8a830
 +int do_ffa_dev_list(struct cmd_tbl *cmdtp, int flag, int argc, char *co=
nst argv[])
 +{
 +	struct udevice *dev =3D NULL;
-+	int i, ret;
++	int i;
 +
 +	ffa_info("arm_ffa uclass entries:");
 +
-+	for (i =3D 0, ret =3D uclass_first_device(UCLASS_FFA, &dev);
++	for (i =3D 0, uclass_first_device(UCLASS_FFA, &dev);
 +	     dev;
-+	     ret =3D uclass_next_device(&dev), i++) {
-+		if (ret)
-+			break;
-+
++	     uclass_next_device(&dev), i++) {
 +		ffa_info("entry %d - instance %08x, ops %08x, plat %08x",
 +			 i,
 +			 (u32)map_to_sysmem(dev),
@@ -274,7 +284,7 @@ index 0000000000..9b56e8a830
 +			 (u32)map_to_sysmem(dev_get_plat(dev)));
 +	}
 +
-+	return cmd_process_error(cmdtp, ret);
++	return 0;
 +}
 +
 +static struct cmd_tbl armffa_commands[] =3D {
@@ -315,7 +325,7 @@ index 0000000000..9b56e8a830
 +	if (!armffa_cmd || argc > armffa_cmd->maxargs)
 +		return CMD_RET_USAGE;
 +
-+	ret =3D ffa_bus_discover();
++	ret =3D ffa_bus_discover(NULL);
 +	if (ret !=3D 0)
 +		return cmd_process_error(cmdtp, ret);
 +
@@ -336,7 +346,7 @@ index 0000000000..9b56e8a830
 +	   "devlist\n"
 +	   "	 - displays the arm_ffa device info\n");
 diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index aceb61cf49..40b467b0a5 100644
+index e4914b9bc7..be4df89d23 100644
 --- a/drivers/firmware/arm-ffa/Kconfig
 +++ b/drivers/firmware/arm-ffa/Kconfig
 @@ -4,6 +4,7 @@ config ARM_FFA_TRANSPORT
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-cor=
stone1000-enable-isp1763-usb-controller.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-usb-controlle=
r.patch
deleted file mode 100644
index 6ebba568..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone10=
00-enable-isp1763-usb-controller.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 8717357eff3f4172c74f0b10078c31cdff9bcc41 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 3 Mar 2022 16:52:02 +0000
-Subject: [PATCH 05/26] corstone1000: enable isp1763 usb controller
-
-MPS3 board have a ISP1763 usb controller, add the
-correspondent mmio area and enable it to be used for mass
-storage access for example.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Accepted [2022.10-rc1]
----
- configs/corstone1000_defconfig | 1 +
- include/configs/corstone1000.h | 6 ++++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 02f931b0d4..e573fe6fe6 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -42,6 +42,7 @@ CONFIG_REGMAP=3Dy
- CONFIG_DM_SERIAL=3Dy
- CONFIG_USB=3Dy
- CONFIG_DM_USB=3Dy
-+CONFIG_USB_ISP1760=3Dy
- CONFIG_USB_STORAGE=3Dy
- CONFIG_EFI_MM_COMM_TEE=3Dy
- # CONFIG_OPTEE is not set
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index cf166f107e..8ba0effb0a 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -55,7 +55,13 @@
- #define CONFIG_SYS_CBSIZE	512	/* Console I/O Buffer Size */
- #define CONFIG_SYS_MAXARGS	64	/* max command args */
-=20
-+#define BOOT_TARGET_DEVICES(func) \
-+	func(USB, usb, 0)
-+
-+#include <config_distro_bootcmd.h>
-+
- #define CONFIG_EXTRA_ENV_SETTINGS							\
-+				BOOTENV							\
- 				"usb_pgood_delay=3D250\0"					\
- 				"boot_bank_flag=3D0x08002000\0"				\
- 				"kernel_addr_bank_0=3D0x083EE000\0"			\
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm=
_ffa-introduce-the-FF-A-Sandbox-driver.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0006-arm_ffa-introduce-the-FF-A-Sandbox-driver.=
patch
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm_=
ffa-introduce-the-FF-A-Sandbox-driver.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ff=
a-introduce-the-FF-A-Sandbox-driver.patch
index 739f7810..9d86dd5c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-arm_ffa-in=
troduce-the-FF-A-Sandbox-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-in=
troduce-the-FF-A-Sandbox-driver.patch
@@ -1,7 +1,7 @@
-From 553b57e39808ef04bc6aa54e0324f92b0175e476 Mon Sep 17 00:00:00 2001
+From 6d28dcdc36ad87b6987c7f920e06165c74eca59d Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 6 Jun 2022 12:55:08 +0100
-Subject: [PATCH 11/26] arm_ffa: introduce the FF-A Sandbox driver
+Date: Tue, 29 Nov 2022 14:44:36 +0000
+Subject: [PATCH 06/25] arm_ffa: introduce the FF-A Sandbox driver
=20
 Provide a Sandbox driver to emulate the FF-A ABIs
=20
@@ -12,67 +12,63 @@ The Sandbox driver provides operations allowing the t=
est
 application to read the status of all the inspected ABIs
 and perform functional tests based on that.
=20
+sandbox driver supports only 64-bit direct messaging.
+
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
----
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
=20
 Changelog:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
+v8: update ffa_bus_prvdata_get() to return a pointer rather than
+    a pointer address
+
+v7: state that sandbox driver supports only 64-bit direct messaging
+
 v4: align sandbox driver with the new FF-A driver interfaces
- and new way of error handling
+    and new way of error handling
=20
 v1: introduce the sandbox driver
-
+---
  MAINTAINERS                                   |   1 +
- common/board_r.c                              |   2 +-
  configs/sandbox64_defconfig                   |   2 +
  configs/sandbox_defconfig                     |   2 +
  doc/arch/sandbox.rst                          |   1 +
- drivers/firmware/arm-ffa/Kconfig              |  10 +-
+ drivers/firmware/arm-ffa/Kconfig              |   9 +-
  drivers/firmware/arm-ffa/Makefile             |   1 +
  drivers/firmware/arm-ffa/arm_ffa_prv.h        |  15 +-
- drivers/firmware/arm-ffa/core.c               |  24 +-
+ drivers/firmware/arm-ffa/core.c               |  22 +-
  drivers/firmware/arm-ffa/sandbox.c            | 659 ++++++++++++++++++
  .../firmware/arm-ffa/sandbox_arm_ffa_prv.h    | 144 ++++
  include/arm_ffa.h                             |   2 +-
  include/sandbox_arm_ffa.h                     |  91 +++
  lib/efi_loader/efi_boottime.c                 |   2 +-
- 14 files changed, 941 insertions(+), 15 deletions(-)
+ 13 files changed, 938 insertions(+), 13 deletions(-)
  create mode 100644 drivers/firmware/arm-ffa/sandbox.c
  create mode 100644 drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h
  create mode 100644 include/sandbox_arm_ffa.h
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 9f0a1b7387..96157db6b6 100644
+index d50bdddea8..23cebbd526 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -251,6 +251,7 @@ F:	cmd/armffa.c
- F:	doc/README.ffa.drv
+@@ -255,6 +255,7 @@ F:	cmd/armffa.c
+ F:	doc/arch/arm64.ffa.rst
  F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
 +F:	include/sandbox_arm_ffa.h
 =20
  ARM FREESCALE IMX
  M:	Stefano Babic <sbabic@denx.de>
-diff --git a/common/board_r.c b/common/board_r.c
-index c75634286b..f838cd5958 100644
---- a/common/board_r.c
-+++ b/common/board_r.c
-@@ -783,7 +783,7 @@ static init_fnc_t init_sequence_r[] =3D {
- 	INIT_FUNC_WATCHDOG_RESET
- 	initr_net,
- #endif
--#ifdef CONFIG_ARM_FFA_TRANSPORT
-+#if defined(CONFIG_ARM_FFA_TRANSPORT) && !defined(CONFIG_SANDBOX_FFA)
- 	ffa_bus_discover,
- #endif
- #ifdef CONFIG_POST
 diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
-index d7f22b39ae..78bc5aaa96 100644
+index 290d1506c2..36e6448968 100644
 --- a/configs/sandbox64_defconfig
 +++ b/configs/sandbox64_defconfig
-@@ -250,3 +250,5 @@ CONFIG_TEST_FDTDEC=3Dy
+@@ -248,3 +248,5 @@ CONFIG_TEST_FDTDEC=3Dy
  CONFIG_UNIT_TEST=3Dy
  CONFIG_UT_TIME=3Dy
  CONFIG_UT_DM=3Dy
@@ -80,10 +76,10 @@ index d7f22b39ae..78bc5aaa96 100644
 +CONFIG_SANDBOX_FFA=3Dy
 \ No newline at end of file
 diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
-index c509a924e6..8942aa7157 100644
+index ab5d3f19bf..8bf3848788 100644
 --- a/configs/sandbox_defconfig
 +++ b/configs/sandbox_defconfig
-@@ -327,3 +327,5 @@ CONFIG_TEST_FDTDEC=3Dy
+@@ -328,3 +328,5 @@ CONFIG_TEST_FDTDEC=3Dy
  CONFIG_UNIT_TEST=3Dy
  CONFIG_UT_TIME=3Dy
  CONFIG_UT_DM=3Dy
@@ -103,7 +99,7 @@ index 068d4a3be4..5d7e1b2c48 100644
  - Chrome OS EC
  - GPIO
 diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index 40b467b0a5..263481de96 100644
+index be4df89d23..b86f16d778 100644
 --- a/drivers/firmware/arm-ffa/Kconfig
 +++ b/drivers/firmware/arm-ffa/Kconfig
 @@ -2,8 +2,8 @@
@@ -117,27 +113,26 @@ index 40b467b0a5..263481de96 100644
  	select CMD_ARMFFA
  	select LIB_UUID
  	select DEVRES
-@@ -38,3 +38,9 @@ config ARM_FFA_EFI_RUNTIME_MODE
- 	  The driver Code needed at runtime is placed at EFI runtime code sect=
ion.
- 	  Turning this on makes ffa_copy_runtime_data available for use and th=
e driver
- 	  code placed at EFI runtime code section.
-+
+@@ -29,3 +29,8 @@ config ARM_FFA_TRANSPORT
+=20
+ 	  For more details about the FF-A driver, please refer to doc/arch/arm=
64.ffa.rst
+=20
 +config SANDBOX_FFA
 +	bool "FF-A Sandbox driver"
 +	depends on ARM_FFA_TRANSPORT && SANDBOX
 +	help
 +	  This emulates the FF-A handling under Sandbox and allows to test the=
 FF-A driver
 diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
-index 0b9b0a61b4..d50060b836 100644
+index 043a8915be..0d21d6b47a 100644
 --- a/drivers/firmware/arm-ffa/Makefile
 +++ b/drivers/firmware/arm-ffa/Makefile
-@@ -5,3 +5,4 @@
+@@ -4,3 +4,4 @@
+ # Abdellatif El Khlifi, Arm Limited, abdellatif.elkhlifi@arm.com.
 =20
  obj-y +=3D arm-ffa-uclass.o core.o
- obj-$(CONFIG_ARM_FFA_EFI_RUNTIME_MODE) +=3D efi_ffa_runtime_data_mgr.o
 +obj-$(CONFIG_SANDBOX_FFA) +=3D sandbox.o
 diff --git a/drivers/firmware/arm-ffa/arm_ffa_prv.h b/drivers/firmware/a=
rm-ffa/arm_ffa_prv.h
-index 7bc90f7f66..3e0d4c112c 100644
+index 4eea7dc036..bbc8b87069 100644
 --- a/drivers/firmware/arm-ffa/arm_ffa_prv.h
 +++ b/drivers/firmware/arm-ffa/arm_ffa_prv.h
 @@ -19,6 +19,16 @@
@@ -157,7 +152,7 @@ index 7bc90f7f66..3e0d4c112c 100644
  /* FF-A driver version definitions */
 =20
  #define MAJOR_VERSION_MASK		GENMASK(30, 16)
-@@ -94,11 +104,6 @@ struct ffa_abi_errmap {
+@@ -103,11 +113,6 @@ struct ffa_abi_errmap {
  #define FFA_ERRMAP_COUNT (FFA_LAST_ID - FFA_FIRST_ID + 1)
  #define FFA_ID_TO_ERRMAP_ID(ffa_id) ((ffa_id) - FFA_FIRST_ID)
 =20
@@ -170,10 +165,10 @@ index 7bc90f7f66..3e0d4c112c 100644
   * struct ffa_partition_uuid - 16 bytes UUID transmitted by FFA_PARTITI=
ON_INFO_GET
   * @a1-4:	32-bit words access to the UUID data
 diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/=
core.c
-index 41c7b96e68..caba10caae 100644
+index 0b1f8e6a07..560603b28b 100644
 --- a/drivers/firmware/arm-ffa/core.c
 +++ b/drivers/firmware/arm-ffa/core.c
-@@ -1101,6 +1101,7 @@ static int __ffa_runtime ffa_msg_send_direct_req(u=
16 dst_part_id, struct ffa_sen
+@@ -1072,6 +1072,7 @@ static int ffa_msg_send_direct_req(struct udevice =
*dev, u16 dst_part_id,
  	return ffa_to_std_errno(ffa_errno);
  }
 =20
@@ -181,7 +176,7 @@ index 41c7b96e68..caba10caae 100644
  /**
   * __arm_ffa_fn_smc - SMC wrapper
   * @args: FF-A ABI arguments to be copied to Xn registers
-@@ -1114,6 +1115,7 @@ void __ffa_runtime __arm_ffa_fn_smc(ffa_value_t ar=
gs, ffa_value_t *res)
+@@ -1085,6 +1086,7 @@ void __arm_ffa_fn_smc(ffa_value_t args, ffa_value_=
t *res)
  {
  	arm_smccc_1_2_smc(&args, res);
  }
@@ -189,7 +184,7 @@ index 41c7b96e68..caba10caae 100644
 =20
  /**
   * ffa_set_smc_conduit - Set the SMC conduit
-@@ -1127,7 +1129,12 @@ void __ffa_runtime __arm_ffa_fn_smc(ffa_value_t a=
rgs, ffa_value_t *res)
+@@ -1098,7 +1100,12 @@ void __arm_ffa_fn_smc(ffa_value_t args, ffa_value=
_t *res)
   */
  static int ffa_set_smc_conduit(void)
  {
@@ -203,19 +198,19 @@ index 41c7b96e68..caba10caae 100644
 =20
  	if (!ffa_priv_data->invoke_ffa_fn) {
  		ffa_err("failure to set the invoke function");
-@@ -1304,17 +1311,18 @@ struct ffa_prvdata **ffa_bus_prvdata_get(void)
+@@ -1275,17 +1282,18 @@ struct ffa_prvdata *ffa_bus_prvdata_get(void)
  }
 =20
  /**
-- * ffa_bus_discover - discover FF-A bus and probe the arm_ffa device
+- * ffa_bus_discover - discover FF-A bus and probe arm_ffa device
 + * ffa_bus_discover - discover FF-A bus and probe arm_ffa and sandbox_a=
rm_ffa devices
+  * @pdev: the address of a device pointer (to be filled when the arm_ff=
a bus device is created
+  *       successfully)
   *
-  * This boot time function makes sure the FF-A bus is discoverable.
-- * Then, the arm_ffa device is probed and ready to use.
-+ * Then, the arm_ffa and sandbox_arm_ffa devices are ready to use.
-+ *
-  * This function is called automatically at initcalls
-  * level (after u-boot relocation).
+  * This function makes sure the FF-A bus is discoverable.
+- * When probing succeeds FF-A discovery is done. The arm_ffa device is =
ready to use.
++ * When probing succeeds FF-A discovery is done. The arm_ffa and sandbo=
x_arm_ffa devices
++ * are ready to use.
   *
   * When the bus was already discovered successfully the discovery will =
not run again.
   *
@@ -225,13 +220,9 @@ index 41c7b96e68..caba10caae 100644
   * All FF-A clients should use the arm_ffa device to use the FF-A trans=
port.
   *
   * Return:
-@@ -1325,9 +1333,15 @@ int ffa_bus_discover(void)
- {
- 	int ret =3D 0;
-=20
--	if (!ffa_priv_data)
-+	if (!ffa_priv_data) {
- 		ret =3D ffa_device_get();
+@@ -1299,6 +1307,12 @@ int ffa_bus_discover(struct udevice **pdev)
+ 	if (!ffa_priv_data) {
+ 		ret =3D ffa_device_get(pdev);
 =20
 +#if CONFIG_IS_ENABLED(SANDBOX_FFA)
 +		if (ret =3D=3D 0)
@@ -244,7 +235,7 @@ index 41c7b96e68..caba10caae 100644
 =20
 diff --git a/drivers/firmware/arm-ffa/sandbox.c b/drivers/firmware/arm-f=
fa/sandbox.c
 new file mode 100644
-index 0000000000..16e1fdc809
+index 0000000000..16f1ca926e
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/sandbox.c
 @@ -0,0 +1,659 @@
@@ -680,7 +671,7 @@ index 0000000000..16e1fdc809
 + * @{a0-a7} , res: The SMC call arguments and return structure.
 + *
 + * This is the function that emulates FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ * FF-A functions.
++ * FF-A functions. Only SMC 64-bit is supported in Sandbox.
 + *
 + * Emulating interrupts is not supported. So, FFA_RUN and FFA_INTERRUPT=
 are not supported.
 + * In case of success FFA_MSG_SEND_DIRECT_RESP is returned with default=
 pattern data (0xff).
@@ -743,13 +734,13 @@ index 0000000000..16e1fdc809
 +	if (!func_data)
 +		return -EINVAL;
 +
-+	if (!func_data->data0 || func_data->data0_size !=3D sizeof(struct ffa_=
prvdata **))
++	if (!func_data->data0 || func_data->data0_size !=3D sizeof(struct ffa_=
prvdata *))
 +		return -EINVAL;
 +
-+	if (!func_data->data1 || func_data->data1_size !=3D sizeof(struct sand=
box_ffa_prvdata **))
++	if (!func_data->data1 || func_data->data1_size !=3D sizeof(struct sand=
box_ffa_prvdata *))
 +		return -EINVAL;
 +
-+	*((struct ffa_prvdata **)func_data->data0) =3D *(ffa_bus_prvdata_get()=
);
++	*((struct ffa_prvdata **)func_data->data0) =3D ffa_bus_prvdata_get();
 +	*((struct sandbox_ffa_prvdata **)func_data->data1) =3D &sandbox_ffa_pr=
iv_data;
 +
 +	return 0;
@@ -1058,17 +1049,17 @@ index 0000000000..4db57f5092
 +
 +#endif
 diff --git a/include/arm_ffa.h b/include/arm_ffa.h
-index f17b100497..665413a0c5 100644
+index 74b16174c2..b88904fe50 100644
 --- a/include/arm_ffa.h
 +++ b/include/arm_ffa.h
-@@ -111,7 +111,7 @@ struct ffa_bus_ops {
- const struct ffa_bus_ops * __ffa_runtime ffa_bus_ops_get(void);
+@@ -90,7 +90,7 @@ struct ffa_bus_ops {
+ const struct ffa_bus_ops *ffa_bus_ops_get(void);
 =20
  /**
 - * ffa_bus_discover - discover FF-A bus and probes the arm_ffa device
 + * ffa_bus_discover - discover FF-A bus and probes the arm_ffa and sand=
box_arm_ffa devices
   */
- int ffa_bus_discover(void);
+ int ffa_bus_discover(struct udevice **pdev);
 =20
 diff --git a/include/sandbox_arm_ffa.h b/include/sandbox_arm_ffa.h
 new file mode 100644
@@ -1168,18 +1159,18 @@ index 0000000000..d5df16f282
 +
 +#endif
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 0ec002ac8b..8fa9a58d76 100644
+index caa64028be..1099ccc800 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
-@@ -2177,7 +2177,7 @@ static efi_status_t EFIAPI efi_exit_boot_services(=
efi_handle_t image_handle,
+@@ -2185,7 +2185,7 @@ static efi_status_t EFIAPI efi_exit_boot_services(=
efi_handle_t image_handle,
  		dm_remove_devices_flags(DM_REMOVE_ACTIVE_ALL);
  	}
 =20
 -#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
 +#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT) && !CONFIG_IS_ENABLED(SANDBOX_=
FFA)
  		/* unmap FF-A RX/TX buffers */
- 		if (ffa_bus_ops_get()->rxtx_unmap())
- 			debug("[efi_boottime][ERROR]: can not unmap FF-A RX/TX buffers\n");
+ 		if (ffa_bus_ops_get()->rxtx_unmap(NULL))
+ 			log_err("Can't unmap FF-A RX/TX buffers\n");
 --=20
 2.17.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm=
64-smccc-clear-the-Xn-registers-after-SMC-calls.patch b/meta-arm-bsp/reci=
pes-bsp/u-boot/u-boot/corstone1000/0007-arm64-smccc-clear-the-Xn-register=
s-after-SMC-calls.patch
deleted file mode 100644
index cedac061..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm64-smcc=
c-clear-the-Xn-registers-after-SMC-calls.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 83f9da30247c2d021658bc1b595c59ecc35eadf5 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Fri, 29 Jul 2022 13:07:43 +0100
-Subject: [PATCH 07/26] arm64: smccc: clear the Xn registers after SMC ca=
lls
-
-set to zero the x0-x17 registers
-
-As per the SMCCC v1.2 spec, unused result and scratch registers can leak
-information after an SMC call. We can mitigate against this risk by
-returning zero in each register.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
----
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v4:
-
-* move the clearing code into a new macro: clear_gp_regs
-
-v3:
-
-* clear the Xn registers after SMC calls
-
- arch/arm/cpu/armv8/smccc-call.S | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/arch/arm/cpu/armv8/smccc-call.S b/arch/arm/cpu/armv8/smccc-=
call.S
-index ec6f299bc9..32f3eb8eeb 100644
---- a/arch/arm/cpu/armv8/smccc-call.S
-+++ b/arch/arm/cpu/armv8/smccc-call.S
-@@ -50,6 +50,12 @@ ENDPROC(__arm_smccc_hvc)
-=20
- #ifdef CONFIG_ARM64
-=20
-+	.macro	clear_gp_regs
-+	.irp	n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17
-+	mov	x\n, xzr
-+	.endr
-+	.endm
-+
- 	.macro SMCCC_1_2 instr
- 	/* Save `res` and free a GPR that won't be clobbered */
- 	stp     x1, x19, [sp, #-16]!
-@@ -84,6 +90,9 @@ ENDPROC(__arm_smccc_hvc)
- 	stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
- 	stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
-=20
-+	/* x0-x17 registers can leak information after an SMC or HVC call. Let=
's clear them */
-+	clear_gp_regs
-+
- 	/* Restore original x19 */
- 	ldp     xzr, x19, [sp], #16
- 	ret
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm=
_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introduce-Sandbox-test-c=
ases-for-UCLASS_FFA.patch
similarity index 85%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm_=
ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ff=
a-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch
index edc5ed60..62f6e434 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm_ffa-in=
troduce-Sandbox-test-cases-for-UCLASS_FFA.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-in=
troduce-Sandbox-test-cases-for-UCLASS_FFA.patch
@@ -1,7 +1,7 @@
-From dbc51066367481b5a45ce24f91571f83a022576e Mon Sep 17 00:00:00 2001
+From de26427c9f9b450ab4a18352fa51f46b3b585bc1 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 6 Jun 2022 17:26:06 +0100
-Subject: [PATCH 12/26] arm_ffa: introduce Sandbox test cases for UCLASS_=
FFA
+Subject: [PATCH 07/25] arm_ffa: introduce Sandbox test cases for UCLASS_=
FFA
=20
 Add functional test cases for the FF-A core driver
=20
@@ -9,28 +9,38 @@ These tests rely on the FF-A Sandbox driver which helps=
 in
  inspecting the FF-A core driver.
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
----
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
=20
 Changelog:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
+v8:
+
+  * update partition_info_get() second argument to be an SP count
+  * pass NULL device pointer to the FF-A bus discovery and operations
+
+v7: set the tests to use 64-bit direct messaging
+
 v4: align sandbox tests with the new FF-A driver interfaces
  and new way of error handling
=20
 v1: introduce sandbox tests
-
+---
  MAINTAINERS      |   1 +
- test/dm/Makefile |   1 +
- test/dm/ffa.c    | 394 +++++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 396 insertions(+)
+ test/dm/Makefile |   2 +
+ test/dm/ffa.c    | 392 +++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 395 insertions(+)
  create mode 100644 test/dm/ffa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 96157db6b6..e5b71b0ade 100644
+index 23cebbd526..e682db8d8f 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -252,6 +252,7 @@ F:	doc/README.ffa.drv
+@@ -256,6 +256,7 @@ F:	doc/arch/arm64.ffa.rst
  F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
  F:	include/sandbox_arm_ffa.h
@@ -39,10 +49,18 @@ index 96157db6b6..e5b71b0ade 100644
  ARM FREESCALE IMX
  M:	Stefano Babic <sbabic@denx.de>
 diff --git a/test/dm/Makefile b/test/dm/Makefile
-index f0a7c97e3d..f96f848046 100644
+index 7543df8823..e5a791768e 100644
 --- a/test/dm/Makefile
 +++ b/test/dm/Makefile
-@@ -79,6 +79,7 @@ obj-$(CONFIG_POWER_DOMAIN) +=3D power-domain.o
+@@ -1,6 +1,7 @@
+ # SPDX-License-Identifier: GPL-2.0+
+ #
+ # Copyright (c) 2013 Google, Inc
++# (C) Copyright 2022 ARM Limited
+=20
+ obj-$(CONFIG_UT_DM) +=3D test-dm.o
+=20
+@@ -81,6 +82,7 @@ obj-$(CONFIG_POWER_DOMAIN) +=3D power-domain.o
  obj-$(CONFIG_ACPI_PMC) +=3D pmc.o
  obj-$(CONFIG_DM_PMIC) +=3D pmic.o
  obj-$(CONFIG_DM_PWM) +=3D pwm.o
@@ -52,10 +70,10 @@ index f0a7c97e3d..f96f848046 100644
  obj-y +=3D regmap.o
 diff --git a/test/dm/ffa.c b/test/dm/ffa.c
 new file mode 100644
-index 0000000000..052d5fc3f4
+index 0000000000..128d8626a7
 --- /dev/null
 +++ b/test/dm/ffa.c
-@@ -0,0 +1,394 @@
+@@ -0,0 +1,392 @@
 +// SPDX-License-Identifier: GPL-2.0+
 +/*
 + * Functional tests for UCLASS_FFA  class
@@ -228,7 +246,7 @@ index 0000000000..052d5fc3f4
 +	struct ffa_send_direct_data msg =3D {0};
 +	u8 cnt;
 +
-+	ut_assertok(ffa_bus_ops_get()->sync_send_receive(part_id, &msg));
++	ut_assertok(ffa_bus_ops_get()->sync_send_receive(NULL, part_id, &msg, =
1));
 +
 +	for (cnt =3D 0; cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64=
); cnt++)
 +		ut_assertok(((u64 *)&msg)[cnt] !=3D 0xffffffffffffffff);
@@ -240,7 +258,7 @@ index 0000000000..052d5fc3f4
 +				     struct sandbox_ffa_prvdata *sdx_prvdata,
 +				     struct unit_test_state *uts)
 +{
-+	u32 count =3D 0, size =3D 0;
++	u32 count =3D 0;
 +	struct ffa_partition_info *parts_info;
 +	u32 info_idx, exp_info_idx;
 +	int ret;
@@ -248,7 +266,7 @@ index 0000000000..052d5fc3f4
 +	/*
 +	 * get from the driver the count of the SPs matching the UUID
 +	 */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(service_uuid, &count, NU=
LL);
++	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, service_uuid, &cou=
nt, NULL);
 +	/* make sure partitions are detected */
 +	ut_assertok(ret !=3D 0);
 +	ut_assertok(count !=3D SANDBOX_SP_COUNT_PER_VALID_SERVICE);
@@ -261,12 +279,10 @@ index 0000000000..052d5fc3f4
 +	parts_info =3D calloc(count, sizeof(struct ffa_partition_info));
 +	ut_assertok(!parts_info);
 +
-+	size =3D count * sizeof(struct ffa_partition_info);
-+
 +	/*
 +	 * ask the driver to fill the buffer with the SPs info
 +	 */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(service_uuid, &size, par=
ts_info);
++	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, service_uuid, &cou=
nt, parts_info);
 +	if (ret !=3D 0) {
 +		free(parts_info);
 +		ut_assertok(ret !=3D 0);
@@ -317,7 +333,7 @@ index 0000000000..052d5fc3f4
 +	int ret;
 +
 +	/*  test probing FF-A devices */
-+	ut_assertok(ffa_bus_discover());
++	ut_assertok(ffa_bus_discover(NULL));
 +
 +	/* get a pointer to the FF-A core and sandbox drivers private data */
 +	func_data.data0 =3D &prvdata;
@@ -374,7 +390,7 @@ index 0000000000..052d5fc3f4
 +	ut_assertok(check_rxbuf_release_flag(rxbuf_flag, uts));
 +
 +	/* test FFA_RXTX_UNMAP */
-+	ut_assertok(ffa_bus_ops_get()->rxtx_unmap());
++	ut_assertok(ffa_bus_ops_get()->rxtx_unmap(NULL));
 +
 +	rxbuf_flag =3D 1;
 +	ut_assertok(sandbox_ffa_query_core_state(FFA_RXTX_UNMAP, &func_data));
@@ -399,7 +415,7 @@ index 0000000000..052d5fc3f4
 +	u16 part_id =3D 0;
 +
 +	/*  test probing FF-A devices */
-+	ut_assertok(ffa_bus_discover());
++	ut_assertok(ffa_bus_discover(NULL));
 +
 +	/* get a pointer to the FF-A core and sandbox drivers private data */
 +	func_data.data0 =3D &prvdata;
@@ -418,32 +434,32 @@ index 0000000000..052d5fc3f4
 +	ut_assertok(check_sandbox_dev(sdx_prvdata, uts));
 +
 +	/* query partitions count using  invalid arguments  */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(unvalid_svc_uuid, NULL, =
NULL);
++	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, unvalid_svc_uuid, =
NULL, NULL);
 +	ut_assertok(ret !=3D -EINVAL);
 +
 +	/* query partitions count using an invalid UUID  string */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(unvalid_svc_uuid_str, &c=
ount, NULL);
++	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, unvalid_svc_uuid_s=
tr, &count, NULL);
 +	ut_assertok(ret !=3D -EINVAL);
 +
 +	/* query partitions count using an invalid UUID (no matching SP) */
 +	count =3D 0;
-+	ret =3D ffa_bus_ops_get()->partition_info_get(unvalid_svc_uuid, &count=
, NULL);
++	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, unvalid_svc_uuid, =
&count, NULL);
 +	ut_assertok(count !=3D 0);
 +
 +	/* query partitions count using a valid UUID  */
 +	count =3D 0;
-+	ret =3D ffa_bus_ops_get()->partition_info_get(valid_svc_uuid, &count, =
NULL);
++	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, valid_svc_uuid, &c=
ount, NULL);
 +	/* make sure partitions are detected */
 +	ut_assertok(ret !=3D 0);
 +	ut_assertok(count !=3D SANDBOX_SP_COUNT_PER_VALID_SERVICE);
 +
 +	/* send data to an invalid partition */
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
++	ret =3D ffa_bus_ops_get()->sync_send_receive(NULL, part_id, &msg, 1);
 +	ut_assertok(ret !=3D -EINVAL);
 +
 +	/* send data to a valid partition */
 +	part_id =3D prvdata->partitions.descs[0].info.id;
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
++	ret =3D ffa_bus_ops_get()->sync_send_receive(NULL, part_id, &msg, 1);
 +	ut_assertok(ret !=3D 0);
 +
 +	return CMD_RET_SUCCESS;
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm=
_ffa-introduce-armffa-command-Sandbox-test.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0008-arm_ffa-introduce-armffa-command-Sandb=
ox-test.patch
similarity index 67%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm_=
ffa-introduce-armffa-command-Sandbox-test.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ff=
a-introduce-armffa-command-Sandbox-test.patch
index 9722677c..db0d4b0b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-arm_ffa-in=
troduce-armffa-command-Sandbox-test.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-in=
troduce-armffa-command-Sandbox-test.patch
@@ -1,13 +1,16 @@
-From 5be8c1d52045cbdc1adf79299792a6a49fef66c3 Mon Sep 17 00:00:00 2001
+From 5507189fe37f1243d685c59ea52fa5643d3cc50c Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 6 Jun 2022 17:30:44 +0100
-Subject: [PATCH 13/26] arm_ffa: introduce armffa command Sandbox test
+Date: Tue, 29 Nov 2022 14:48:34 +0000
+Subject: [PATCH 08/25] arm_ffa: introduce armffa command Sandbox test
=20
 Add Sandbox test for the armffa command
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
----
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
=20
 Changelog:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -15,18 +18,18 @@ Changelog:
 v4: drop use of helper APIs
=20
 v1: introduce armffa command sandbox test
-
+---
  MAINTAINERS       |  1 +
- test/cmd/Makefile |  1 +
- test/cmd/armffa.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ test/cmd/Makefile |  2 ++
+ test/cmd/armffa.c | 39 +++++++++++++++++++++++++++++++++++++++
  3 files changed, 42 insertions(+)
  create mode 100644 test/cmd/armffa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index e5b71b0ade..505fffff14 100644
+index e682db8d8f..72f01769c9 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -252,6 +252,7 @@ F:	doc/README.ffa.drv
+@@ -256,6 +256,7 @@ F:	doc/arch/arm64.ffa.rst
  F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
  F:	include/sandbox_arm_ffa.h
@@ -35,20 +38,28 @@ index e5b71b0ade..505fffff14 100644
 =20
  ARM FREESCALE IMX
 diff --git a/test/cmd/Makefile b/test/cmd/Makefile
-index a59adb1e6d..d9dc0809d6 100644
+index c331757425..19e9d0a995 100644
 --- a/test/cmd/Makefile
 +++ b/test/cmd/Makefile
-@@ -11,3 +11,4 @@ obj-$(CONFIG_CMD_MEM_SEARCH) +=3D mem_search.o
+@@ -1,6 +1,7 @@
+ # SPDX-License-Identifier: GPL-2.0+
+ #
+ # Copyright (c) 2013 Google, Inc
++# (C) Copyright 2022 ARM Limited
+=20
+ ifdef CONFIG_HUSH_PARSER
+ obj-$(CONFIG_CONSOLE_RECORD) +=3D test_echo.o
+@@ -13,3 +14,4 @@ obj-$(CONFIG_CMD_MEM_SEARCH) +=3D mem_search.o
  obj-$(CONFIG_CMD_PINMUX) +=3D pinmux.o
  obj-$(CONFIG_CMD_PWM) +=3D pwm.o
  obj-$(CONFIG_CMD_SETEXPR) +=3D setexpr.o
 +obj-$(CONFIG_SANDBOX_FFA) +=3D armffa.o
 diff --git a/test/cmd/armffa.c b/test/cmd/armffa.c
 new file mode 100644
-index 0000000000..531f82066e
+index 0000000000..e04363ba63
 --- /dev/null
 +++ b/test/cmd/armffa.c
-@@ -0,0 +1,40 @@
+@@ -0,0 +1,39 @@
 +// SPDX-License-Identifier: GPL-2.0+
 +/*
 + * Test for armffa command
@@ -58,7 +69,6 @@ index 0000000000..531f82066e
 + */
 +
 +#include <common.h>
-+#include <dm.h>
 +#include <dm/test.h>
 +#include <sandbox_arm_ffa.h>
 +#include <string.h>
@@ -72,7 +82,7 @@ index 0000000000..531f82066e
 +{
 +	char ping_cmd[PING_CMD_SIZE] =3D {0};
 +
-+	ut_assertok(ffa_bus_discover());
++	ut_assertok(ffa_bus_discover(NULL));
 +
 +	/* armffa getpart <UUID> */
 +	ut_assertok(run_command("armffa getpart " SANDBOX_SERVICE1_UUID, 0));
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-lib=
-uuid-introduce-be_uuid_str_to_le_bin-function.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0008-lib-uuid-introduce-be_uuid_str_to_=
le_bin-function.patch
deleted file mode 100644
index 769209b9..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-lib-uuid-i=
ntroduce-be_uuid_str_to_le_bin-function.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From af17d357674393565c8be15f21c86cba972963e7 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 4 Aug 2022 16:46:47 +0100
-Subject: [PATCH 08/26] lib: uuid: introduce be_uuid_str_to_le_bin functi=
on
-
-convert big endian UUID string to little endian buffer
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
----
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v4:
-
-* rename ffa_uuid_str_to_bin to be_uuid_str_to_le_bin and put in
-  a standalone commit (the current)
-
-v3:
-
-* introduce ffa_uuid_str_to_bin (provided by
-  arm_ffa: introduce Arm FF-A low-level driver)
-
- include/uuid.h |  6 +++++
- lib/uuid.c     | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 69 insertions(+)
-
-diff --git a/include/uuid.h b/include/uuid.h
-index 4a4883d3b5..5355230b5e 100644
---- a/include/uuid.h
-+++ b/include/uuid.h
-@@ -44,4 +44,10 @@ int uuid_guid_get_bin(const char *guid_str, unsigned =
char *guid_bin);
- const char *uuid_guid_get_str(const unsigned char *guid_bin);
- void gen_rand_uuid(unsigned char *uuid_bin);
- void gen_rand_uuid_str(char *uuid_str, int str_format);
-+
-+/**
-+ * be_uuid_str_to_le_bin - Converts a big endian UUID string to a littl=
e endian buffer
-+ */
-+int be_uuid_str_to_le_bin(const char *uuid_str, unsigned char *uuid_bin=
);
-+
- #endif
-diff --git a/lib/uuid.c b/lib/uuid.c
-index 284f8113ff..d0fa51d0bf 100644
---- a/lib/uuid.c
-+++ b/lib/uuid.c
-@@ -1,6 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0+
- /*
-  * Copyright 2011 Calxeda, Inc.
-+ * Copyright 2022 ARM Limited
-  */
-=20
- #include <common.h>
-@@ -342,6 +343,68 @@ int uuid_str_to_bin(const char *uuid_str, unsigned =
char *uuid_bin,
- 	return 0;
- }
-=20
-+/**
-+ * be_uuid_str_to_le_bin - Converts a big endian UUID string to a littl=
e endian buffer
-+ * @uuid_str:	UUID string in big endian format (36 bytes wide + '/0')
-+ * @uuid_bin:	preallocated 16 bytes UUID buffer in little endian format
-+ *
-+ * UUID string is 36 characters (36 bytes):
-+ *
-+ * xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
-+ * be		     be	     be	      be      be
-+ *
-+ * where x is a hexadecimal character. Fields are separated by '-'s.
-+ * When converting to a binary UUID, these endianness rules apply:
-+ *     be: means the field in the string is considered a big endian hex=
 number
-+ *	   and should be converted to little endian binary format
-+ *
-+ * Return:
-+ *
-+ *    uuid_bin filled with little endian UUID data
-+ *    On success 0 is returned. Otherwise, failure code.
-+ */
-+int be_uuid_str_to_le_bin(const char *uuid_str, unsigned char *uuid_bin=
)
-+{
-+	u16 tmp16 =3D 0;
-+	u32 tmp32 =3D 0;
-+	u64 tmp64 =3D 0;
-+
-+	if (!uuid_str_valid(uuid_str) || !uuid_bin)
-+		return -EINVAL;
-+
-+	/*
-+	 * reverse bytes from big to little endian
-+	 */
-+	tmp32 =3D simple_strtoul(uuid_str, NULL, 16);
-+	memcpy(uuid_bin, &tmp32, 4);
-+
-+	/*
-+	 * reverse bytes from big to little endian
-+	 */
-+	tmp16 =3D simple_strtoul(uuid_str + 9, NULL, 16);
-+	memcpy(uuid_bin + 4, &tmp16, 2);
-+
-+	/*
-+	 * reverse bytes from big to little endian
-+	 */
-+	tmp16 =3D simple_strtoul(uuid_str + 14, NULL, 16);
-+	memcpy(uuid_bin + 6, &tmp16, 2);
-+
-+	/*
-+	 * reverse bytes from big to little endian
-+	 */
-+	tmp16 =3D simple_strtoul(uuid_str + 19, NULL, 16);
-+	memcpy(uuid_bin + 8, &tmp16, 2);
-+
-+	/*
-+	 * reverse bytes from big to little endian
-+	 */
-+	tmp64 =3D simple_strtoull(uuid_str + 24, NULL, 16);
-+	memcpy(uuid_bin + 10, (char *)&tmp64, 6);
-+
-+	return 0;
-+}
-+
- /*
-  * uuid_bin_to_str() - convert big endian binary data to string UUID or=
 GUID.
-  *
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm=
_ffa-introduce-FF-A-MM-communication.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0009-arm_ffa-efi-introduce-FF-A-MM-communication.=
patch
similarity index 61%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm_=
ffa-introduce-FF-A-MM-communication.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ff=
a-efi-introduce-FF-A-MM-communication.patch
index 04e55576..e9ffd6bb 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-arm_ffa-in=
troduce-FF-A-MM-communication.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-ef=
i-introduce-FF-A-MM-communication.patch
@@ -1,12 +1,10 @@
-From b3c7d84dcde6ee1cbc13e10664d24ffa220f5fb3 Mon Sep 17 00:00:00 2001
+From cefc1d101c62e62e66f9cbf1775defde7d2c3d27 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 15 Aug 2022 15:12:49 +0100
-Subject: [PATCH 14/26] arm_ffa: introduce FF-A MM communication
+Subject: [PATCH 09/25] arm_ffa: efi: introduce FF-A MM communication
=20
 Add MM communication support using FF-A transport
=20
-Access an SP's service through EFI MM communication protocol.
-
 This feature allows accessing MM partitions services through
 EFI MM communication protocol. MM partitions such as StandAlonneMM
 or smm-gateway secure partitions which reside in secure world.
@@ -26,18 +24,41 @@ buffer with the response data.
 The response data is copied back to the communication buffer and
 consumed by the EFI subsystem.
=20
-FF-A driver private data is copied to EFI runtime section at
-ExitBootServices(). This garantees secure world partitions data are
-available at EFI runtime level.
+MM communication protocol supports FF-A 64-bit direct messaging.
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
----
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
=20
 Changelog:
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
+v8:
+
+* isolate the compilation choices between FF-A and OP-TEE
+* update partition_info_get() second argument to be an SP count
+* pass NULL device pointer to the FF-A bus discovery and operations
+
+v7:
+
+* set the MM door bell event to use 64-bit direct messaging
+* issue a compile time error when one of these macros are not found :
+  FFA_SHARED_MM_BUFFER_SIZE, FFA_SHARED_MM_BUFFER_OFFSET, FFA_SHARED_MM_=
BUFFER_ADDR
+* make mm_sp_svc_uuid static
+* replace EINVAL with ENOMEM in ffa_discover_mm_sp_id() when calloc() fa=
ils
+* improve use of unmap_sysmem() in ffa_mm_communicate()
+
+v6:
+
+* add FF-A runtime discovery at MM communication level
+* drop EFI runtime support for FF-A MM communication
+* revert the changes in include/mm_communication.h for
+  efi_mm_communicate_header and smm_variable_access structures
+
 v4:
=20
 * use the new FF-A driver interfaces
@@ -45,7 +66,7 @@ v4:
 * copy FF-A driver private data to EFI runtime section at
   ExitBootServices()
 * drop use of FFA_ERR_STAT_SUCCESS error code
-* replace EFI_BUFFER_TOO_SMALL by EFI_OUT_OF_RESOURCES
+* replace EFI_BUFFER_TOO_SMALL with EFI_OUT_OF_RESOURCES
   in ffa_mm_communicate(). No need for efi_memcpy_runtime() anymore
 * revert the error log in mm_communicate() in case of failure
 * remove packed attribute from efi_mm_communicate_header and
@@ -58,93 +79,26 @@ v2:
 v1:
=20
 * introduce FF-A MM communication
-
- arch/arm/cpu/armv8/cache.S        |  16 ++
- arch/arm/cpu/armv8/cache_v8.c     |   3 +-
- include/mm_communication.h        |   7 +-
+---
+ include/mm_communication.h        |   5 +
  lib/efi_loader/Kconfig            |  14 +-
- lib/efi_loader/efi_boottime.c     |   7 +
- lib/efi_loader/efi_variable_tee.c | 261 +++++++++++++++++++++++++++++-
- 6 files changed, 299 insertions(+), 9 deletions(-)
+ lib/efi_loader/efi_variable_tee.c | 294 +++++++++++++++++++++++++++++-
+ 3 files changed, 307 insertions(+), 6 deletions(-)
=20
-diff --git a/arch/arm/cpu/armv8/cache.S b/arch/arm/cpu/armv8/cache.S
-index d1cee23437..f69ef64ed6 100644
---- a/arch/arm/cpu/armv8/cache.S
-+++ b/arch/arm/cpu/armv8/cache.S
-@@ -21,7 +21,11 @@
-  * x1: 0 clean & invalidate, 1 invalidate only
-  * x2~x9: clobbered
-  */
-+#ifdef CONFIG_EFI_LOADER
-+.pushsection .text.efi_runtime, "ax"
-+#else
- .pushsection .text.__asm_dcache_level, "ax"
-+#endif
- ENTRY(__asm_dcache_level)
- 	lsl	x12, x0, #1
- 	msr	csselr_el1, x12		/* select cache level */
-@@ -65,7 +69,11 @@ ENDPROC(__asm_dcache_level)
-  *
-  * flush or invalidate all data cache by SET/WAY.
-  */
-+#ifdef CONFIG_EFI_LOADER
-+.pushsection .text.efi_runtime, "ax"
-+#else
- .pushsection .text.__asm_dcache_all, "ax"
-+#endif
- ENTRY(__asm_dcache_all)
- 	mov	x1, x0
- 	dsb	sy
-@@ -109,7 +117,11 @@ ENTRY(__asm_flush_dcache_all)
- ENDPROC(__asm_flush_dcache_all)
- .popsection
-=20
-+#ifdef CONFIG_EFI_LOADER
-+.pushsection .text.efi_runtime, "ax"
-+#else
- .pushsection .text.__asm_invalidate_dcache_all, "ax"
-+#endif
- ENTRY(__asm_invalidate_dcache_all)
- 	mov	x0, #0x1
- 	b	__asm_dcache_all
-@@ -182,7 +194,11 @@ ENTRY(__asm_invalidate_icache_all)
- ENDPROC(__asm_invalidate_icache_all)
- .popsection
-=20
-+#ifdef CONFIG_EFI_LOADER
-+.pushsection .text.efi_runtime, "ax"
-+#else
- .pushsection .text.__asm_invalidate_l3_dcache, "ax"
-+#endif
- WEAK(__asm_invalidate_l3_dcache)
- 	mov	x0, #0			/* return status as success */
- 	ret
-diff --git a/arch/arm/cpu/armv8/cache_v8.c b/arch/arm/cpu/armv8/cache_v8=
.c
-index e4736e5643..afbc487fa1 100644
---- a/arch/arm/cpu/armv8/cache_v8.c
-+++ b/arch/arm/cpu/armv8/cache_v8.c
-@@ -9,6 +9,7 @@
-=20
- #include <common.h>
- #include <cpu_func.h>
-+#include <efi_loader.h>
- #include <hang.h>
- #include <log.h>
- #include <asm/cache.h>
-@@ -445,7 +446,7 @@ __weak void mmu_setup(void)
- /*
-  * Performs a invalidation of the entire data cache at all levels
-  */
--void invalidate_dcache_all(void)
-+void __efi_runtime invalidate_dcache_all(void)
- {
- 	__asm_invalidate_dcache_all();
- 	__asm_invalidate_l3_dcache();
 diff --git a/include/mm_communication.h b/include/mm_communication.h
-index e65fbde60d..32dc5dbac8 100644
+index e65fbde60d..d409bed777 100644
 --- a/include/mm_communication.h
 +++ b/include/mm_communication.h
-@@ -13,6 +13,9 @@
+@@ -6,6 +6,8 @@
+  *  Copyright (c) 2017, Intel Corporation. All rights reserved.
+  *  Copyright (C) 2020 Linaro Ltd. <sughosh.ganu@linaro.org>
+  *  Copyright (C) 2020 Linaro Ltd. <ilias.apalodimas@linaro.org>
++ * (C) Copyright 2022 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+=20
+ #ifndef _MM_COMMUNICATION_H_
+@@ -13,6 +15,9 @@
 =20
  #include <part_efi.h>
 =20
@@ -154,29 +108,11 @@ index e65fbde60d..32dc5dbac8 100644
  /*
   * Interface to the pseudo Trusted Application (TA), which provides a
   * communication channel with the Standalone MM (Management Mode)
-@@ -43,7 +46,7 @@
-  * To avoid confusion in interpreting frames, the communication buffer =
should
-  * always begin with efi_mm_communicate_header.
-  */
--struct __packed efi_mm_communicate_header {
-+struct efi_mm_communicate_header {
- 	efi_guid_t header_guid;
- 	size_t     message_len;
- 	u8         data[];
-@@ -145,7 +148,7 @@ struct smm_variable_communicate_header {
-  * Defined in EDK2 as SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE.
-  *
-  */
--struct smm_variable_access {
-+struct __packed smm_variable_access {
- 	efi_guid_t  guid;
- 	efi_uintn_t data_size;
- 	efi_uintn_t name_size;
 diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
-index e3f2402d0e..2a6d70f862 100644
+index b8fb2701a7..d292f57244 100644
 --- a/lib/efi_loader/Kconfig
 +++ b/lib/efi_loader/Kconfig
-@@ -60,13 +60,23 @@ config EFI_VARIABLE_FILE_STORE
+@@ -61,13 +61,23 @@ config EFI_VARIABLE_FILE_STORE
  	  stored as file /ubootefi.var on the EFI system partition.
 =20
  config EFI_MM_COMM_TEE
@@ -202,29 +138,24 @@ index e3f2402d0e..2a6d70f862 100644
  config EFI_VARIABLE_NO_STORE
  	bool "Don't persist non-volatile UEFI variables"
  	help
-diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 8fa9a58d76..cede7826bd 100644
---- a/lib/efi_loader/efi_boottime.c
-+++ b/lib/efi_loader/efi_boottime.c
-@@ -2185,6 +2185,13 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
- 			debug("[efi_boottime][INFO]: FF-A RX/TX buffers unmapped\n");
- #endif
-=20
-+#if CONFIG_IS_ENABLED(ARM_FFA_EFI_RUNTIME_MODE) && !CONFIG_IS_ENABLED(S=
ANDBOX_FFA)
-+		if (ffa_copy_runtime_data())
-+			printf("ERROR: EFI: FFA: copying runtime data\n");
-+		else
-+			printf("INFO: EFI: FFA: runtime data copied\n");
-+#endif
-+
- 	/* Patch out unsupported runtime function */
- 	efi_runtime_detach();
-=20
 diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_vari=
able_tee.c
-index dfef18435d..7d9d577281 100644
+index dfef18435d..3933a24e8c 100644
 --- a/lib/efi_loader/efi_variable_tee.c
 +++ b/lib/efi_loader/efi_variable_tee.c
-@@ -15,6 +15,36 @@
+@@ -4,9 +4,12 @@
+  *
+  *  Copyright (C) 2019 Linaro Ltd. <sughosh.ganu@linaro.org>
+  *  Copyright (C) 2019 Linaro Ltd. <ilias.apalodimas@linaro.org>
++ *  Copyright (C) 2022 ARM Limited
++ *  Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+=20
+ #include <common.h>
++#include <dm.h>
+ #include <efi.h>
+ #include <efi_api.h>
+ #include <efi_loader.h>
+@@ -15,6 +18,36 @@
  #include <malloc.h>
  #include <mm_communication.h>
 =20
@@ -235,33 +166,33 @@ index dfef18435d..7d9d577281 100644
 +#include <mapmem.h>
 +
 +#ifndef FFA_SHARED_MM_BUFFER_SIZE
-+#warning "FFA_SHARED_MM_BUFFER_SIZE must be defined in include/configs/=
<board>.h"
++#error "FFA_SHARED_MM_BUFFER_SIZE must be defined in include/configs/<b=
oard>.h"
 +#define FFA_SHARED_MM_BUFFER_SIZE 0
 +#endif
 +
 +#ifndef FFA_SHARED_MM_BUFFER_OFFSET
-+#warning "FFA_SHARED_MM_BUFFER_OFFSET must be defined in include/config=
s/<board>.h"
++#error "FFA_SHARED_MM_BUFFER_OFFSET must be defined in include/configs/=
<board>.h"
 +#define FFA_SHARED_MM_BUFFER_OFFSET 0
 +#endif
 +
 +#ifndef FFA_SHARED_MM_BUFFER_ADDR
-+#warning "FFA_SHARED_MM_BUFFER_ADDR must be defined in include/configs/=
<board>.h"
++#error "FFA_SHARED_MM_BUFFER_ADDR must be defined in include/configs/<b=
oard>.h"
 +#define FFA_SHARED_MM_BUFFER_ADDR 0
 +#endif
 +
 +/* MM return codes */
 +#define MM_SUCCESS (0)
 +
-+const char *mm_sp_svc_uuid =3D MM_SP_UUID;
++static const char *mm_sp_svc_uuid =3D MM_SP_UUID;
 +
-+static __efi_runtime_data u16 mm_sp_id;
++static u16 mm_sp_id;
 +
 +#endif
 +
  extern struct efi_var_file __efi_runtime_data *efi_var_buf;
  static efi_uintn_t max_buffer_size;	/* comm + var + func + data */
  static efi_uintn_t max_payload_size;	/* func + data */
-@@ -24,6 +54,7 @@ struct mm_connection {
+@@ -24,6 +57,7 @@ struct mm_connection {
  	u32 session;
  };
 =20
@@ -269,7 +200,7 @@ index dfef18435d..7d9d577281 100644
  /**
   * get_connection() - Retrieve OP-TEE session for a specific UUID.
   *
-@@ -143,16 +174,227 @@ static efi_status_t optee_mm_communicate(void *co=
mm_buf, ulong dsize)
+@@ -143,13 +177,248 @@ static efi_status_t optee_mm_communicate(void *co=
mm_buf, ulong dsize)
 =20
  	return ret;
  }
@@ -290,7 +221,7 @@ index dfef18435d..7d9d577281 100644
 + *
 + * 0 on success
 + */
-+static int __efi_runtime ffa_notify_mm_sp(void)
++static int ffa_notify_mm_sp(void)
 +{
 +	struct ffa_send_direct_data msg =3D {0};
 +	int ret;
@@ -301,7 +232,7 @@ index dfef18435d..7d9d577281 100644
 +
 +	msg.data0 =3D FFA_SHARED_MM_BUFFER_OFFSET; /* x3 */
 +
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(mm_sp_id, &msg);
++	ret =3D ffa_bus_ops_get()->sync_send_receive(NULL, mm_sp_id, &msg, 1);
 +	if (ret !=3D 0)
 +		return ret;
 +
@@ -330,7 +261,7 @@ index dfef18435d..7d9d577281 100644
 + */
 +static int ffa_discover_mm_sp_id(void)
 +{
-+	u32 count =3D 0, size =3D 0;
++	u32 count =3D 0;
 +	int ret;
 +	struct ffa_partition_info *parts_info;
 +
@@ -340,7 +271,7 @@ index dfef18435d..7d9d577281 100644
 +	/*
 +	 * get from the driver the count of the SPs matching the UUID
 +	 */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(mm_sp_svc_uuid, &count, =
NULL);
++	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, mm_sp_svc_uuid, &c=
ount, NULL);
 +	if (ret !=3D 0) {
 +		log_err("EFI: Failure in querying partitions count (error code: %d)\n=
", ret);
 +		return ret;
@@ -358,18 +289,16 @@ index dfef18435d..7d9d577281 100644
 +
 +	log_info("EFI: Pre-allocating %d partition(s) info structures\n", coun=
t);
 +
-+	parts_info =3D calloc(count, sizeof(struct ffa_partition_info));
++	parts_info =3D calloc(count, sizeof(*parts_info));
 +	if (!parts_info)
-+		return -EINVAL;
-+
-+	size =3D count * sizeof(struct ffa_partition_info);
++		return -ENOMEM;
 +
 +	/*
 +	 * ask the driver to fill the
 +	 * buffer with the SPs info
 +	 */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(mm_sp_svc_uuid, &size, p=
arts_info);
-+	if (ret !=3D 0) {
++	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, mm_sp_svc_uuid, &c=
ount, parts_info);
++	if (ret) {
 +		log_err("EFI: Failure in querying partition(s) info (error code: %d)\=
n", ret);
 +		free(parts_info);
 +		return ret;
@@ -404,10 +333,11 @@ index dfef18435d..7d9d577281 100644
 + *
 + * EFI status code
 + */
-+static efi_status_t __efi_runtime ffa_mm_communicate(void *comm_buf, ul=
ong comm_buf_size)
++static efi_status_t ffa_mm_communicate(void *comm_buf, ulong comm_buf_s=
ize)
 +{
 +	ulong tx_data_size;
 +	int ffa_ret;
++	efi_status_t efi_ret;
 +	struct efi_mm_communicate_header *mm_hdr;
 +	void *virt_shared_buf;
 +
@@ -429,7 +359,7 @@ index dfef18435d..7d9d577281 100644
 +	/* Copy the data to the shared buffer */
 +
 +	virt_shared_buf =3D (void *)map_sysmem((phys_addr_t)FFA_SHARED_MM_BUFF=
ER_ADDR, 0);
-+	efi_memcpy_runtime(virt_shared_buf, comm_buf, tx_data_size);
++	memcpy(virt_shared_buf, comm_buf, tx_data_size);
 +
 +	/*
 +	 * The secure world might have cache disabled for
@@ -444,8 +374,6 @@ index dfef18435d..7d9d577281 100644
 +	/* Announce there is data in the shared buffer */
 +
 +	ffa_ret =3D ffa_notify_mm_sp();
-+	if (ffa_ret)
-+		unmap_sysmem(virt_shared_buf);
 +
 +	switch (ffa_ret) {
 +	case 0:
@@ -457,30 +385,57 @@ index dfef18435d..7d9d577281 100644
 +			sizeof(size_t);
 +
 +		if (rx_data_size > comm_buf_size) {
-+			unmap_sysmem(virt_shared_buf);
-+			return EFI_OUT_OF_RESOURCES;
++			efi_ret =3D EFI_OUT_OF_RESOURCES;
++			break;
 +		}
 +
-+		efi_memcpy_runtime(comm_buf, virt_shared_buf, rx_data_size);
-+		unmap_sysmem(virt_shared_buf);
-+
-+		return EFI_SUCCESS;
++		memcpy(comm_buf, virt_shared_buf, rx_data_size);
++		efi_ret =3D EFI_SUCCESS;
++		break;
 +	}
 +	case -EINVAL:
-+		return EFI_DEVICE_ERROR;
++		efi_ret =3D EFI_DEVICE_ERROR;
++		break;
 +	case -EPERM:
-+		return EFI_INVALID_PARAMETER;
++		efi_ret =3D EFI_INVALID_PARAMETER;
++		break;
 +	case -EACCES:
-+		return EFI_ACCESS_DENIED;
++		efi_ret =3D EFI_ACCESS_DENIED;
++		break;
 +	case -EBUSY:
-+		return EFI_OUT_OF_RESOURCES;
++		efi_ret =3D EFI_OUT_OF_RESOURCES;
++		break;
 +	default:
-+		return EFI_ACCESS_DENIED;
++		efi_ret =3D EFI_ACCESS_DENIED;
 +	}
++
++	unmap_sysmem(virt_shared_buf);
++	return efi_ret;
 +}
 +#endif
 +
 +/**
++ * select_ffa_mm_comms() - checks FF-A support availability
++ *
++ * Making sure FF-A is compiled in. If that's the case try to discover
++ * the FF-A bus.
++ *
++ * Return:
++ *
++ * 0: FF-A ready for use. Otherwise, failure
++ */
++static efi_status_t select_ffa_mm_comms(void)
++{
++	efi_status_t ret =3D EFI_UNSUPPORTED;
++#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
++	ret =3D ffa_bus_discover(NULL);
++	if (ret)
++		ret =3D EFI_NOT_READY;
++#endif
++	return ret;
++}
++
++/**
 + * mm_communicate() - Adjust the communication buffer to the MM SP and =
send
   * it to OP-TEE
   *
@@ -488,31 +443,34 @@ index dfef18435d..7d9d577281 100644
 + * @comm_buf:		locally allocated communication buffer
   * @dsize:		buffer size
 + *
-+ * The MM SP (also called partition) can be StandAlonneMM or smm-gatewa=
y.
++ * The SP (also called partition) can be any MM SP such as  StandAlonne=
MM or smm-gateway.
 + * The comm_buf format is the same for both partitions.
 + * When using the u-boot OP-TEE driver, StandAlonneMM is supported.
-+ * When using the u-boot FF-A  driver, StandAlonneMM and smm-gateway ar=
e supported.
++ * When using the u-boot FF-A  driver, any MM SP is supported.
 + *
   * Return:		status code
   */
--static efi_status_t mm_communicate(u8 *comm_buf, efi_uintn_t dsize)
-+static efi_status_t __efi_runtime mm_communicate(u8 *comm_buf, efi_uint=
n_t dsize)
- {
- 	efi_status_t ret;
- 	struct efi_mm_communicate_header *mm_hdr;
-@@ -162,7 +404,11 @@ static efi_status_t mm_communicate(u8 *comm_buf, ef=
i_uintn_t dsize)
+ static efi_status_t mm_communicate(u8 *comm_buf, efi_uintn_t dsize)
+@@ -162,7 +431,17 @@ static efi_status_t mm_communicate(u8 *comm_buf, ef=
i_uintn_t dsize)
  	mm_hdr =3D (struct efi_mm_communicate_header *)comm_buf;
  	var_hdr =3D (struct smm_variable_communicate_header *)mm_hdr->data;
 =20
-+	#if (IS_ENABLED(CONFIG_OPTEE))
- 	ret =3D optee_mm_communicate(comm_buf, dsize);
-+	#elif (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+	ret =3D ffa_mm_communicate(comm_buf, dsize);
-+	#endif
+-	ret =3D optee_mm_communicate(comm_buf, dsize);
++	ret =3D select_ffa_mm_comms();
++	if (ret !=3D EFI_SUCCESS) {
++#if (IS_ENABLED(CONFIG_OPTEE))
++		ret =3D optee_mm_communicate(comm_buf, dsize);
++#endif
++	} else {
++#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
++		ret =3D ffa_mm_communicate(comm_buf, dsize);
++#endif
++	}
++
  	if (ret !=3D EFI_SUCCESS) {
  		log_err("%s failed!\n", __func__);
  		return ret;
-@@ -258,6 +504,13 @@ efi_status_t EFIAPI get_max_payload(efi_uintn_t *si=
ze)
+@@ -258,6 +537,13 @@ efi_status_t EFIAPI get_max_payload(efi_uintn_t *si=
ze)
  		goto out;
  	}
  	*size =3D var_payload->size;
@@ -526,7 +484,7 @@ index dfef18435d..7d9d577281 100644
  	/*
  	 * There seems to be a bug in EDK2 miscalculating the boundaries and
  	 * size checks, so deduct 2 more bytes to fulfill this requirement. Fi=
x
-@@ -697,7 +950,7 @@ void efi_variables_boot_exit_notify(void)
+@@ -697,7 +983,7 @@ void efi_variables_boot_exit_notify(void)
  		ret =3D EFI_NOT_FOUND;
 =20
  	if (ret !=3D EFI_SUCCESS)
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm=
_ffa-efi-corstone1000-enable-MM-communication.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-efi-corstone1000-enable-MM-=
communication.patch
new file mode 100644
index 00000000..1dfc19b1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-ef=
i-corstone1000-enable-MM-communication.patch
@@ -0,0 +1,76 @@
+From 46cadb787a3b13da39419706fae7d1ba703f4b68 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 23 Sep 2022 15:17:21 +0100
+Subject: [PATCH 10/25] arm_ffa: efi: corstone1000: enable MM communicati=
on
+
+turn on EFI MM communication
+
+On corstone1000 platform MM communication between u-boot
+and the secure world (Optee) is done using the FF-A bus.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
+
+Changelog:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+v8:
+
+* drop OP-TEE configs from Corstone-1000 defconfig
+
+v7:
+
+* improve the definition of FFA_SHARED_MM_BUFFER_ADDR and
+  FFA_SHARED_MM_BUFFER_OFFSET
+* update FFA_SHARED_MM_BUFFER_ADDR value
+
+v6:
+
+* corstone-1000: enable optee driver
+* corstone-1000: remove CONFIG_ARM_FFA_EFI_RUNTIME_MODE from the defconf=
ig
+
+v4:
+
+* corstone-1000: turn on EFI MM communication
+---
+ configs/corstone1000_defconfig | 2 ++
+ include/configs/corstone1000.h | 9 +++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index ed2e0fe70a..c26f99e7e5 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -52,3 +52,5 @@ CONFIG_DM_SERIAL=3Dy
+ CONFIG_USB=3Dy
+ CONFIG_USB_ISP1760=3Dy
+ CONFIG_ERRNO_STR=3Dy
++CONFIG_EFI_MM_COMM_TEE=3Dy
++CONFIG_ARM_FFA_TRANSPORT=3Dy
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
+index 8e0230c135..0362d29ac2 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -14,6 +14,15 @@
+=20
+ #include <linux/sizes.h>
+=20
++#define FFA_SHARED_MM_BUFFER_SIZE	SZ_4K /* 4 KB */
++
++/*
++ * shared buffer physical address used for communication between
++ * u-boot and the MM SP
++ */
++#define FFA_SHARED_MM_BUFFER_ADDR	0x02000000UL
++#define FFA_SHARED_MM_BUFFER_OFFSET	0
++
+ #define V2M_BASE		0x80000000
+=20
+ #define CONFIG_PL011_CLOCK	50000000
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi=
-corstone1000-introduce-EFI-capsule-update.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule=
-update.patch
similarity index 83%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi-=
corstone1000-introduce-EFI-capsule-update.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-co=
rstone1000-introduce-EFI-capsule-update.patch
index 291d15d3..57f1b9a2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi-corsto=
ne1000-introduce-EFI-capsule-update.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-introduce-EFI-capsule-update.patch
@@ -1,7 +1,7 @@
-From 10e155a677192731481ebe7f302e2d9ad790346a Mon Sep 17 00:00:00 2001
+From 7702c4aeda51011be95ecbaab0dc2e7373d04286 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 28 Jul 2022 15:01:55 +0100
-Subject: [PATCH 16/26] efi: corstone1000: introduce EFI capsule update
+Date: Tue, 29 Nov 2022 15:11:27 +0000
+Subject: [PATCH 11/25] efi: corstone1000: introduce EFI capsule update
=20
 This commit provides capsule update feature for Corstone1000.
=20
@@ -22,15 +22,43 @@ Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhl=
ifi@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Upstream-Status: Pending [Not submitted to upstream yet]
 ---
- include/configs/corstone1000.h |  18 +++++
- include/efi_loader.h           |   4 +-
- lib/efi_loader/efi_boottime.c  |  36 ++++++++++
- lib/efi_loader/efi_capsule.c   | 124 ++++++++++++++++++++++++++++++++-
- lib/efi_loader/efi_setup.c     |  15 ++++
- 5 files changed, 193 insertions(+), 4 deletions(-)
+ board/armltd/corstone1000/corstone1000.c |   4 +
+ configs/corstone1000_defconfig           |   3 +
+ include/configs/corstone1000.h           |  18 ++++
+ include/efi_loader.h                     |   4 +-
+ lib/efi_loader/efi_boottime.c            |  36 +++++++
+ lib/efi_loader/efi_capsule.c             | 124 ++++++++++++++++++++++-
+ lib/efi_loader/efi_setup.c               |  15 +++
+ 7 files changed, 200 insertions(+), 4 deletions(-)
=20
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index 4f4b96a095..76816f8f4e 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -66,6 +66,10 @@ static struct mm_region corstone1000_mem_map[] =3D {
+=20
+ struct mm_region *mem_map =3D corstone1000_mem_map;
+=20
++void set_dfu_alt_info(char *interface, char *devstr)
++{
++}
++
+ int board_init(void)
+ {
+ 	return 0;
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index c26f99e7e5..c72d027711 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -54,3 +54,6 @@ CONFIG_USB_ISP1760=3Dy
+ CONFIG_ERRNO_STR=3Dy
+ CONFIG_EFI_MM_COMM_TEE=3Dy
+ CONFIG_ARM_FFA_TRANSPORT=3Dy
++CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
++CONFIG_EFI_CAPSULE_FIRMWARE_FIT=3Dy
++CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 5960c6b4be..fe5ec0adcd 100644
+index 0362d29ac2..4d20090c9b 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -14,6 +14,24 @@
@@ -59,10 +87,10 @@ index 5960c6b4be..fe5ec0adcd 100644
 =20
  /*
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index 5b41985244..796419b69b 100644
+index 545ba06d94..773c4f6310 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
-@@ -984,11 +984,11 @@ extern const struct efi_firmware_management_protoc=
ol efi_fmp_fit;
+@@ -993,11 +993,11 @@ extern const struct efi_firmware_management_protoc=
ol efi_fmp_fit;
  extern const struct efi_firmware_management_protocol efi_fmp_raw;
 =20
  /* Capsule update */
@@ -77,10 +105,10 @@ index 5b41985244..796419b69b 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index cede7826bd..9bf2596597 100644
+index 1099ccc800..d9eed33ac8 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
-@@ -2095,6 +2095,33 @@ static void efi_exit_caches(void)
+@@ -2103,6 +2103,33 @@ static void efi_exit_caches(void)
  #endif
  }
 =20
@@ -106,7 +134,7 @@ index cede7826bd..9bf2596597 100644
 +	msg.data0 =3D CORSTONE1000_SEPROXY_UPDATE_SVC_ID; /* x3 */
 +	msg.data2 =3D CORSTONE1000_KERNEL_STARTED_EVT; /* x5 */
 +
-+	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg);
++	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
 +}
 +
 +#endif
@@ -114,7 +142,7 @@ index cede7826bd..9bf2596597 100644
  /**
   * efi_exit_boot_services() - stop all boot services
   * @image_handle: handle of the loaded image
-@@ -2210,6 +2237,15 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
+@@ -2209,6 +2236,15 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
  	/* Recalculate CRC32 */
  	efi_update_table_header_crc32(&systab.hdr);
 =20
@@ -131,7 +159,7 @@ index cede7826bd..9bf2596597 100644
  	efi_set_watchdog(0);
  	WATCHDOG_RESET();
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index a6b98f066a..c0f3427a60 100644
+index a6b98f066a..636b61f0ad 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -25,6 +25,14 @@
@@ -221,7 +249,7 @@ index a6b98f066a..c0f3427a60 100644
 +	msg.data1 =3D capsule_image_size; /* x4 */
 +	msg.data2 =3D CORSTONE1000_BUFFER_READY_EVT; /* x5 */
 +
-+	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg);
++	return ffa_bus_ops_get()->sync_send_receive(NULL, CORSTONE1000_SEPROXY=
_PART_ID, &msg, 0);
 +}
 +#endif
 +
@@ -301,7 +329,7 @@ index a6b98f066a..c0f3427a60 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 492ecf4cb1..bfd4687e10 100644
+index c633fcd91e..443f409906 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -16,6 +16,13 @@
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm=
-corstone1000-fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-fix-unrecognized-=
filesystem-type.patch
similarity index 86%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm-=
corstone1000-fix-unrecognized-filesystem-type.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-co=
rstone1000-fix-unrecognized-filesystem-type.patch
index 1a28d6ca..9b12ee9a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
@@ -1,7 +1,7 @@
-From 3f8d35ccbb0d59d4820b81f7f939ada95b3cd92c Mon Sep 17 00:00:00 2001
+From 71162273e8a6b28a6aaf8635cff752419d09a293 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Mar 2022 15:56:09 +0000
-Subject: [PATCH 18/26] arm: corstone1000: fix unrecognized filesystem ty=
pe
+Subject: [PATCH 12/25] arm: corstone1000: fix unrecognized filesystem ty=
pe
=20
 Some usb sticks are not recognized by usb, just add a
 delay before checking status.
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi=
_capsule-corstone1000-pass-interface-id-and-buffe.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_capsule-corstone1000-pass-i=
nterface-id-and-buffe.patch
similarity index 89%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_=
capsule-corstone1000-pass-interface-id-and-buffe.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_ca=
psule-corstone1000-pass-interface-id-and-buffe.patch
index 3d8a6216..9334b804 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_capsul=
e-corstone1000-pass-interface-id-and-buffe.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_capsul=
e-corstone1000-pass-interface-id-and-buffe.patch
@@ -1,7 +1,7 @@
-From 3bb5826af8e3891617d41a30419de0ce089f9fc3 Mon Sep 17 00:00:00 2001
+From f8ccaf53dec63d57bab2f86b822f9fb3ed06d132 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 10 Dec 2021 20:03:35 +0000
-Subject: [PATCH 19/26] efi_capsule: corstone1000: pass interface id and =
buffer
+Subject: [PATCH 13/25] efi_capsule: corstone1000: pass interface id and =
buffer
  event id using register w4
=20
 Initially the interface/event IDs are passed to the SP using register
@@ -23,7 +23,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  2 files changed, 13 insertions(+), 4 deletions(-)
=20
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 2d89a8966e..4637dd5d5d 100644
+index 4d20090c9b..77f96e87a1 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -24,6 +24,12 @@
@@ -40,7 +40,7 @@ index 2d89a8966e..4637dd5d5d 100644
  #define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
 =20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index c0f3427a60..bf8bd68256 100644
+index 636b61f0ad..c22b9b5aa0 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -28,6 +28,8 @@
@@ -67,7 +67,7 @@ index c0f3427a60..bf8bd68256 100644
 +	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
 +		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w4 */
 =20
- 	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg);
+ 	return ffa_bus_ops_get()->sync_send_receive(NULL, CORSTONE1000_SEPROXY=
_PART_ID, &msg, 0);
  }
 --=20
 2.17.1
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi=
_boottime-corstone1000-pass-interface-id-and-kern.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0014-efi_boottime-corstone1000-pass-=
interface-id-and-kern.patch
similarity index 86%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_=
boottime-corstone1000-pass-interface-id-and-kern.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_bo=
ottime-corstone1000-pass-interface-id-and-kern.patch
index db2ff32c..a8d2c817 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-efi_bootti=
me-corstone1000-pass-interface-id-and-kern.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_bootti=
me-corstone1000-pass-interface-id-and-kern.patch
@@ -1,7 +1,7 @@
-From 668fe40ccb0db5542ef333cd4655511dbb8572f9 Mon Sep 17 00:00:00 2001
+From e4e7ccc77a4e6930a768cc1c1f6daf8907ac16c3 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 10 Dec 2021 20:10:41 +0000
-Subject: [PATCH 20/26] efi_boottime: corstone1000: pass interface id and
+Subject: [PATCH 14/25] efi_boottime: corstone1000: pass interface id and
  kernel event id using register w4
=20
 Initially the interface/event IDs are passed to the SP using register
@@ -22,10 +22,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 10 insertions(+), 3 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 9bf2596597..de815484d2 100644
+index d9eed33ac8..88f2d050be 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
-@@ -27,6 +27,11 @@
+@@ -30,6 +30,11 @@
  #include <arm_ffa.h>
  #endif
 =20
@@ -37,7 +37,7 @@ index 9bf2596597..de815484d2 100644
  DECLARE_GLOBAL_DATA_PTR;
 =20
  /* Task priority level */
-@@ -2112,10 +2117,12 @@ static int efi_corstone1000_kernel_started_event=
(void)
+@@ -2120,10 +2125,12 @@ static int efi_corstone1000_kernel_started_event=
(void)
  	log_debug("[%s]\n", __func__);
 =20
  	/*
@@ -51,7 +51,7 @@ index 9bf2596597..de815484d2 100644
 +	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
 +		PREP_SEPROXY_EVT(CORSTONE1000_KERNEL_STARTED_EVT); /* w4 */
 =20
- 	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg);
+ 	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
  }
 --=20
 2.17.1
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-arm=
_ffa-corstone1000-enable-FF-A-and-MM-support.patch b/meta-arm-bsp/recipes=
-bsp/u-boot/u-boot/corstone1000/0015-arm_ffa-corstone1000-enable-FF-A-and=
-MM-support.patch
deleted file mode 100644
index dcc3ea7a..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-arm_ffa-co=
rstone1000-enable-FF-A-and-MM-support.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 01d1487cebc37834e2a5d259e0417a610539a0f5 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 9 Jun 2022 12:47:35 +0100
-Subject: [PATCH 15/26] arm_ffa: corstone1000: enable FF-A and MM support
-
-This commit allows corstone1000 platform to perform
-MM communication between u-boot and the secure world
-using FF-A transport.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
220926101723.9965-1-abdellatif.elkhlifi@arm.com/]
----
- configs/corstone1000_defconfig | 2 ++
- include/configs/corstone1000.h | 9 +++++++++
- 2 files changed, 11 insertions(+)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index e573fe6fe6..c299dda49f 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -44,6 +44,8 @@ CONFIG_USB=3Dy
- CONFIG_DM_USB=3Dy
- CONFIG_USB_ISP1760=3Dy
- CONFIG_USB_STORAGE=3Dy
-+CONFIG_ARM_FFA_TRANSPORT=3Dy
-+CONFIG_ARM_FFA_EFI_RUNTIME_MODE=3Dy
- CONFIG_EFI_MM_COMM_TEE=3Dy
- # CONFIG_OPTEE is not set
- # CONFIG_GENERATE_SMBIOS_TABLE is not set
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 8ba0effb0a..5960c6b4be 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -14,6 +14,15 @@
-=20
- #include <linux/sizes.h>
-=20
-+#define FFA_SHARED_MM_BUFFER_SIZE	SZ_4K /* 4 KB */
-+
-+/*
-+ * shared buffer physical address used for communication between
-+ * u-boot and the MM SP
-+ */
-+#define FFA_SHARED_MM_BUFFER_ADDR	(0x023F8000)
-+#define FFA_SHARED_MM_BUFFER_OFFSET	(0)
-+
- #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
- #define CONFIG_SKIP_LOWLEVEL_INIT
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi=
_loader-corstone1000-remove-guid-check-from-corst.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader-corstone1000-remove-=
guid-check-from-corst.patch
similarity index 90%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi_=
loader-corstone1000-remove-guid-check-from-corst.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_lo=
ader-corstone1000-remove-guid-check-from-corst.patch
index 38ef1c08..d028e3ed 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
@@ -1,7 +1,7 @@
-From 4d7fd850347dbea10a73cd5cf6eb518607118414 Mon Sep 17 00:00:00 2001
+From caf6c4ec65fd0a5e945dd790f2369acd163d1daf Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 11 Dec 2021 13:23:55 +0000
-Subject: [PATCH 21/26] efi_loader: corstone1000: remove guid check from
+Subject: [PATCH 15/25] efi_loader: corstone1000: remove guid check from
  corstone1000 config option
=20
 Use generic fmp guid and no separte check is required for
@@ -15,7 +15,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 1 insertion(+), 15 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index bf8bd68256..5db9d30d53 100644
+index c22b9b5aa0..0eee3c2d4c 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -646,12 +646,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi=
_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader-populate-ESRT-table-=
if-EFI_ESRT-config-op.patch
similarity index 86%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_=
loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_lo=
ader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
index 3cedaa7a..934476ba 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
@@ -1,7 +1,7 @@
-From 720e5ada733b0f7b019baaec57d74603a9dff67e Mon Sep 17 00:00:00 2001
+From 41a2c8bb23e587e9abe7b8bc62db1a93c0e5d841 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:49:02 +0000
-Subject: [PATCH 22/26] efi_loader: populate ESRT table if EFI_ESRT confi=
g
+Subject: [PATCH 16/25] efi_loader: populate ESRT table if EFI_ESRT confi=
g
  option is set
=20
 This change is to call efi_esrt_populate function if CONFIG_EFI_ESRT
@@ -15,7 +15,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 7 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 5db9d30d53..65e2fc8296 100644
+index 0eee3c2d4c..94dc0dfe3d 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -668,6 +668,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-cor=
stone1000-Update-FFA-shared-buffer-address.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0017-corstone1000-Update-FFA-shared-buffer-=
address.patch
deleted file mode 100644
index 7f5464c8..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-corstone10=
00-Update-FFA-shared-buffer-address.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a84f6be14f1bb31edea987fc02efd5a079a28db1 Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Wed, 17 Nov 2021 15:28:06 +0000
-Subject: [PATCH 17/26] corstone1000: Update FFA shared buffer address
-
-FFA shared buffer address changed to 0x02000000.
-
-The existing address 0x023F8000 is currently being used by
-Optee so the virtual address returned to the SMM gateway is 0x0000.
-So the buffer is moved to 0x02000000.
-
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- include/configs/corstone1000.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index fe5ec0adcd..2d89a8966e 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -38,7 +38,7 @@
-  * shared buffer physical address used for communication between
-  * u-boot and the MM SP
-  */
--#define FFA_SHARED_MM_BUFFER_ADDR	(0x023F8000)
-+#define FFA_SHARED_MM_BUFFER_ADDR	(0x02000000)
- #define FFA_SHARED_MM_BUFFER_OFFSET	(0)
-=20
- #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi=
_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0017-efi_firmware-add-get_image_info-for=
-corstone1000.patch
similarity index 96%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_=
firmware-add-get_image_info-for-corstone1000.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_fi=
rmware-add-get_image_info-for-corstone1000.patch
index f6aafa35..2c0ad250 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
@@ -1,7 +1,7 @@
-From 2cad562823976134f201d6e2ef187bf103e17d1e Mon Sep 17 00:00:00 2001
+From 323df950c63af6d1a9ba5bd16f4f9d9348e9afc2 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:50:25 +0000
-Subject: [PATCH 23/26] efi_firmware: add get_image_info for corstone1000
+Subject: [PATCH 17/25] efi_firmware: add get_image_info for corstone1000
=20
 This change is to populate get_image_info which eventually
 will be populated in ESRT table
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-efi=
_loader-send-bootcomplete-message-to-secure-encla.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0018-efi_loader-send-bootcomplete-me=
ssage-to-secure-encla.patch
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-efi_=
loader-send-bootcomplete-message-to-secure-encla.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-efi_lo=
ader-send-bootcomplete-message-to-secure-encla.patch
index 35f5cb23..e95609a3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-efi_loader=
-send-bootcomplete-message-to-secure-encla.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-efi_loader=
-send-bootcomplete-message-to-secure-encla.patch
@@ -1,7 +1,7 @@
-From 709e5d8ff07474f840f1d34d3077135f77795452 Mon Sep 17 00:00:00 2001
+From 7bf9c380c63726b7de8316e9c743cb06c9bc7842 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Mon, 15 Aug 2022 15:46:18 +0100
-Subject: [PATCH 24/26] efi_loader: send bootcomplete message to secure e=
nclave
+Subject: [PATCH 18/25] efi_loader: send bootcomplete message to secure e=
nclave
=20
 On corstone1000 platform, Secure Enclave will be expecting
 an event from uboot when it performs capsule update. Previously,
@@ -21,7 +21,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  4 files changed, 41 insertions(+), 45 deletions(-)
=20
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 4637dd5d5d..333b1d93b6 100644
+index 77f96e87a1..4cf1170ffb 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -22,7 +22,7 @@
@@ -34,10 +34,10 @@ index 4637dd5d5d..333b1d93b6 100644
  #define PREP_SEPROXY_SVC_ID_MASK	GENMASK(31, 16)
  #define PREP_SEPROXY_SVC_ID(x)	 (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (=
x)))
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index de815484d2..cede7826bd 100644
+index 88f2d050be..1099ccc800 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
-@@ -27,11 +27,6 @@
+@@ -30,11 +30,6 @@
  #include <arm_ffa.h>
  #endif
 =20
@@ -49,7 +49,7 @@ index de815484d2..cede7826bd 100644
  DECLARE_GLOBAL_DATA_PTR;
 =20
  /* Task priority level */
-@@ -2100,35 +2095,6 @@ static void efi_exit_caches(void)
+@@ -2108,35 +2103,6 @@ static void efi_exit_caches(void)
  #endif
  }
 =20
@@ -77,7 +77,7 @@ index de815484d2..cede7826bd 100644
 -	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
 -		PREP_SEPROXY_EVT(CORSTONE1000_KERNEL_STARTED_EVT); /* w4 */
 -
--	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg);
+-	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
 -}
 -
 -#endif
@@ -85,7 +85,7 @@ index de815484d2..cede7826bd 100644
  /**
   * efi_exit_boot_services() - stop all boot services
   * @image_handle: handle of the loaded image
-@@ -2244,15 +2210,6 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
+@@ -2243,15 +2209,6 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
  	/* Recalculate CRC32 */
  	efi_update_table_header_crc32(&systab.hdr);
 =20
@@ -115,7 +115,7 @@ index af43d4502f..25f427b936 100644
  	}
 =20
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index bfd4687e10..6c9e14c37e 100644
+index 443f409906..c154eb0e9d 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -17,6 +17,9 @@
@@ -156,7 +156,7 @@ index bfd4687e10..6c9e14c37e 100644
 +	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
 +			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w4 */
 +
-+	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg);
++	return ffa_bus_ops_get()->sync_send_receive(NULL, CORSTONE1000_SEPROXY=
_PART_ID, &msg, 0);
 +}
 +#endif
 +
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi=
_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0019-efi_loader-fix-null-pointer-exc=
eption-with-get_image.patch
similarity index 94%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_=
loader-fix-null-pointer-exception-with-get_image.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_lo=
ader-fix-null-pointer-exception-with-get_image.patch
index dc9063ac..e9bf495f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
@@ -1,7 +1,7 @@
-From 456e616401b02a579e9ea5ec3e5ab1d1c884b389 Mon Sep 17 00:00:00 2001
+From 28e7a47c7021b7d321bb6e4dbe1bd7d2ceb8aa6d Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 14 Jan 2022 15:24:18 +0000
-Subject: [PATCH 25/26] efi_loader: fix null pointer exception with
+Subject: [PATCH 19/25] efi_loader: fix null pointer exception with
  get_image_info
=20
 get_img_info API implemented for corstone1000 target does not
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm=
-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0020-arm-corstone1000-add-mmc-for-fvp.patch
new file mode 100644
index 00000000..87432599
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm-corsto=
ne1000-add-mmc-for-fvp.patch
@@ -0,0 +1,99 @@
+From d662633cb8e90144969790b8abf047a3f777e47a Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 30 Nov 2022 15:37:22 +0000
+Subject: [PATCH 20/25] arm:corstone1000: add mmc for fvp
+
+Enable support mmc/sdcard for the corstone1000 FVP.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ board/armltd/corstone1000/corstone1000.c | 28 +++++++++++++++++++-----
+ configs/corstone1000_defconfig           |  8 ++++++-
+ include/configs/corstone1000.h           |  4 +++-
+ 3 files changed, 32 insertions(+), 8 deletions(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index 76816f8f4e..d6ca6e8961 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -38,19 +38,35 @@ static struct mm_region corstone1000_mem_map[] =3D {
+ 	}, {
+ 		/* USB */
+ 		.virt =3D 0x40200000UL,
+-		.phys =3D 0x40200000UL,
++			.phys =3D 0x40200000UL,
++			.size =3D 0x00100000UL,
++			.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++				PTE_BLOCK_NON_SHARE |
++				PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	}, {
++		/* MMC0 */
++		.virt =3D 0x40300000UL,
++		.phys =3D 0x40300000UL,
+ 		.size =3D 0x00100000UL,
+ 		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+-			PTE_BLOCK_NON_SHARE |
+-			PTE_BLOCK_PXN | PTE_BLOCK_UXN
++				 PTE_BLOCK_NON_SHARE |
++				 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+ 	}, {
+ 		/* ethernet */
+ 		.virt =3D 0x40100000UL,
+-		.phys =3D 0x40100000UL,
++			.phys =3D 0x40100000UL,
++			.size =3D 0x00100000UL,
++			.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++				PTE_BLOCK_NON_SHARE |
++				PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	}, {
++		/* MMC1 */
++		.virt =3D 0x50000000UL,
++		.phys =3D 0x50000000UL,
+ 		.size =3D 0x00100000UL,
+ 		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+-			PTE_BLOCK_NON_SHARE |
+-			PTE_BLOCK_PXN | PTE_BLOCK_UXN
++				 PTE_BLOCK_NON_SHARE |
++				 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+ 	}, {
+ 		/* OCVM */
+ 		.virt =3D 0x80000000UL,
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index c72d027711..336da67a8d 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -40,7 +40,13 @@ CONFIG_VERSION_VARIABLE=3Dy
+ CONFIG_NET_RANDOM_ETHADDR=3Dy
+ CONFIG_REGMAP=3Dy
+ CONFIG_MISC=3Dy
+-# CONFIG_MMC is not set
++CONFIG_CLK=3Dy
++CONFIG_CMD_MMC=3Dy
++CONFIG_DM_MMC=3Dy
++CONFIG_ARM_PL180_MMCI=3Dy
++CONFIG_MMC_SDHCI_ADMA_HELPERS=3Dy
++CONFIG_MMC_WRITE=3Dy
++CONFIG_DM_GPIO=3Dy
+ CONFIG_PHYLIB=3Dy
+ CONFIG_PHY_SMSC=3Dy
+ CONFIG_SMC911X=3Dy
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
+index 4cf1170ffb..1f28a0f6c0 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -58,7 +58,9 @@
+ #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
+=20
+ #define BOOT_TARGET_DEVICES(func) \
+-	func(USB, usb, 0)
++	func(USB, usb, 0) \
++	func(MMC, mmc, 0) \
++	func(MMC, mmc, 1)
+=20
+ #include <config_distro_bootcmd.h>
+=20
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-cor=
stone1000-add-compressed-kernel-support.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0021-corstone1000-add-compressed-kernel-suppor=
t.patch
new file mode 100644
index 00000000..d2375239
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corstone10=
00-add-compressed-kernel-support.patch
@@ -0,0 +1,33 @@
+From 37ee9a07d168b43bde17b2ce3dbf637905af5bf2 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Wed, 30 Nov 2022 18:59:59 +0000
+Subject: [PATCH 21/25] corstone1000: add compressed kernel support
+
+The corstone1000 kernel has become too large to fit in the available
+storage.  Swtiching to a compressed kernel avoids the problem, but
+requires uncompressing it.  Add this decompression to the default boot
+instructions.
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ configs/corstone1000_defconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 336da67a8d..eeb207aa5f 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -15,7 +15,7 @@ CONFIG_FIT=3Dy
+ CONFIG_BOOTDELAY=3D3
+ CONFIG_USE_BOOTARGS=3Dy
+ CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
+-CONFIG_BOOTCOMMAND=3D"run retrieve_kernel_load_addr; echo Loading kerne=
l from $kernel_addr to memory ... ; loadm $kernel_addr $kernel_addr_r 0xc=
00000; usb start; usb reset; run distro_bootcmd; bootefi $kernel_addr_r $=
fdtcontroladdr;"
++CONFIG_BOOTCOMMAND=3D"run retrieve_kernel_load_addr; echo Loading kerne=
l from $kernel_addr to memory ... ; unzip $kernel_addr 0x90000000; loadm =
0x90000000 $kernel_addr_r 0xf00000; usb start; usb reset; run distro_boot=
cmd; bootefi $kernel_addr_r $fdtcontroladdr;"
+ CONFIG_CONSOLE_RECORD=3Dy
+ CONFIG_LOGLEVEL=3D7
+ # CONFIG_DISPLAY_CPUINFO is not set
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-Int=
roduce-external-sys-driver-to-device-tree.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0022-Introduce-external-sys-driver-to-device=
-tree.patch
similarity index 74%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-Intr=
oduce-external-sys-driver-to-device-tree.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Introd=
uce-external-sys-driver-to-device-tree.patch
index bd9a6cf6..91af4262 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-Introduce-=
external-sys-driver-to-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Introduce-=
external-sys-driver-to-device-tree.patch
@@ -1,7 +1,7 @@
-From 83f16fe96a86b00f7a4b7c4c4f7416119b80eddd Mon Sep 17 00:00:00 2001
+From a3fae205de2fd6d2abdb8afca6475267c16e9e29 Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
-Date: Fri, 19 Aug 2022 16:04:48 +0100
-Subject: [PATCH] Introduce external sys driver to device-tree
+Date: Wed, 30 Nov 2022 19:02:26 +0000
+Subject: [PATCH 22/25] Introduce external sys driver to device-tree
=20
 It adds external sys driver binding to u-boot
 device tree.
@@ -13,10 +13,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 7 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index d0194aa893..19b6e3ea72 100644
+index 4e46826f88..2c7185e139 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
-@@ -160,6 +160,13 @@
+@@ -160,5 +160,12 @@
  			secure-status =3D "okay";     /* secure-world-only */
  			status =3D "disabled";
  		};
@@ -28,8 +28,7 @@ index d0194aa893..19b6e3ea72 100644
 +			reg-names =3D "rstreg", "streg";
 +		};
  	};
-=20
- 	arm_ffa: arm_ffa {
+ };
 --=20
 2.17.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-Add=
-mhu-and-rpmsg-client-to-u-boot-device-tree.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0023-Add-mhu-and-rpmsg-client-to-u-boot-de=
vice-tree.patch
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-Add-=
mhu-and-rpmsg-client-to-u-boot-device-tree.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add-mh=
u-and-rpmsg-client-to-u-boot-device-tree.patch
index 57bdef45..04cbf764 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-Add-mhu-an=
d-rpmsg-client-to-u-boot-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add-mhu-an=
d-rpmsg-client-to-u-boot-device-tree.patch
@@ -1,7 +1,7 @@
-From a1b8b91a43cfa9dbaa2d907a6d9629da6f93fa3e Mon Sep 17 00:00:00 2001
+From 55e2bc835be50b23ef04066b950bbe75c0065d19 Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Mon, 12 Sep 2022 15:47:06 +0100
-Subject: [PATCH] Add mhu and rpmsg client to u-boot device tree
+Subject: [PATCH 23/25] Add mhu and rpmsg client to u-boot device tree
=20
 Adds external system controller and mhu driver to u-boot
 device tree. This enables communication between host and
@@ -10,11 +10,11 @@ the external system.
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
 ---
- arch/arm/dts/corstone1000.dtsi | 50 ++++++++++++++++++++++++++++++++
+ arch/arm/dts/corstone1000.dtsi | 50 ++++++++++++++++++++++++++++++++++
  1 file changed, 50 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 19b6e3ea72..61dd6c432c 100644
+index 2c7185e139..61e0c33247 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -161,6 +161,56 @@
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-arm=
-corstone1000-esrt-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0024-arm-corstone1000-esrt-support.patch
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-arm-=
corstone1000-esrt-support.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-co=
rstone1000-esrt-support.patch
index 2db5c2a1..160ff8a4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-arm-corsto=
ne1000-esrt-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corsto=
ne1000-esrt-support.patch
@@ -1,7 +1,7 @@
-From d8fca6ebd5917df9a12dbf1da6a97f99af06eee9 Mon Sep 17 00:00:00 2001
+From 475f787ba7351282ca3ce0fcf9badc01821cd8a3 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
-Date: Fri, 19 Aug 2022 09:18:33 +0100
-Subject: [PATCH] arm/corstone1000: esrt support
+Date: Wed, 30 Nov 2022 19:11:43 +0000
+Subject: [PATCH 24/25] arm/corstone1000: esrt support
=20
 The implementation is platform specific and would require
 change in future.
@@ -15,14 +15,14 @@ Upstream-Status: Inappropriate [Redesign of FMP proto=
col for ESRT and Capsule up
 ---
  include/efi_api.h             |   2 +-
  lib/efi_loader/efi_firmware.c | 133 ++++++++++++++++++++++++++++++++++
- lib/efi_loader/efi_setup.c    |  16 ++--
- 3 files changed, 142 insertions(+), 9 deletions(-)
+ lib/efi_loader/efi_setup.c    |  17 +++--
+ 3 files changed, 143 insertions(+), 9 deletions(-)
=20
 diff --git a/include/efi_api.h b/include/efi_api.h
-index 83c01085fd..26899afd01 100644
+index 9bb0d44ac8..fcf2643e14 100644
 --- a/include/efi_api.h
 +++ b/include/efi_api.h
-@@ -2014,7 +2014,7 @@ struct efi_firmware_image_descriptor {
+@@ -2030,7 +2030,7 @@ struct efi_firmware_image_descriptor {
  	u32 last_attempt_status;
  	u64 hardware_instance;
  	efi_firmware_image_dep_t *dependencies;
@@ -185,13 +185,14 @@ index 28d9a19edb..aa4af8036b 100644
  	.set_image =3D efi_firmware_fit_set_image,
  	.check_image =3D efi_firmware_check_image_unsupported,
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 6c9e14c37e..6ccda175ff 100644
+index c154eb0e9d..63329bbff8 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
-@@ -168,13 +168,6 @@ static efi_status_t efi_init_capsule(void)
+@@ -167,14 +167,6 @@ static efi_status_t efi_init_capsule(void)
+ 	efi_status_t ret =3D EFI_SUCCESS;
 =20
  #if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
- 	int ffa_ret;
+-	int ffa_ret;
 -
 -	ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
 -	if (ffa_ret)
@@ -202,11 +203,10 @@ index 6c9e14c37e..6ccda175ff 100644
  	ret =3D efi_corstone1000_alloc_capsule_shared_buf();
  	if (ret !=3D EFI_SUCCESS) {
  		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n"=
);
-@@ -306,7 +299,14 @@ efi_status_t efi_init_obj_list(void)
- 		if (ret !=3D EFI_SUCCESS)
- 			goto out;
- 	}
--
+@@ -308,6 +300,15 @@ efi_status_t efi_init_obj_list(void)
+ 	if (ret !=3D EFI_SUCCESS)
+ 		goto out;
+=20
 +#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
 +		int ffa_ret;
 +		ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
@@ -215,9 +215,10 @@ index 6c9e14c37e..6ccda175ff 100644
 +		else
 +			debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n")=
;
 +#endif
++
  	/* Initialize variable services */
  	ret =3D efi_init_variables();
  	if (ret !=3D EFI_SUCCESS)
 --=20
-2.25.1
+2.17.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi=
_setup-discover-FF-A-bus-before-raising-EFI-start.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0025-efi_setup-discover-FF-A-bus-bef=
ore-raising-EFI-start.patch
new file mode 100644
index 00000000..6c177864
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_setup-=
discover-FF-A-bus-before-raising-EFI-start.patch
@@ -0,0 +1,50 @@
+From de5994cda7a35317f12dc1cedb28cae1b932283a Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 30 Nov 2022 19:14:52 +0000
+Subject: [PATCH 25/25] efi_setup: discover FF-A bus before raising EFI s=
tarted
+ event
+
+add FF-A discovery to efi_corstone1000_uboot_efi_started_event()
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ lib/efi_loader/efi_setup.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
+index 63329bbff8..cf8abe3af0 100644
+--- a/lib/efi_loader/efi_setup.c
++++ b/lib/efi_loader/efi_setup.c
+@@ -142,9 +142,16 @@ static efi_status_t efi_init_secure_boot(void)
+ static int efi_corstone1000_uboot_efi_started_event(void)
+ {
+ 	struct ffa_send_direct_data msg =3D {0};
++	int ret;
+=20
+ 	log_debug("[%s]\n", __func__);
+=20
++	ret =3D ffa_bus_discover(NULL);
++	if (ret !=3D 0) {
++		log_err("failure to discover FF-A bus\n");
++		return ret;
++	}
++
+ 	/*
+ 	 * setting the kernel started  event arguments:
+ 	 * setting capsule update interface ID(31:16)
+@@ -304,9 +311,9 @@ efi_status_t efi_init_obj_list(void)
+ 		int ffa_ret;
+ 		ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
+ 		if (ffa_ret)
+-			debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update s=
ervice\n");
++			log_err("Failure to notify SE Proxy FW update service\n");
+ 		else
+-			debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n")=
;
++			debug("SE Proxy FW update service notified\n");
+ #endif
+=20
+ 	/* Initialize variable services */
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-arm=
-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0026-arm-corstone1000-add-mmc-for-fvp.patch
deleted file mode 100644
index d4bf6520..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-arm-corsto=
ne1000-add-mmc-for-fvp.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From 5e4c819c7ab0841429016c098106615b33486c8b Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 5 Apr 2022 10:24:38 +0100
-Subject: [PATCH 26/26] arm:corstone1000: add mmc for fvp
-
-Enable support mmc/sdcard for the corstone1000 FVP.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- arch/arm/dts/corstone1000-fvp.dts        | 28 +++++++++++++++
- board/armltd/corstone1000/corstone1000.c | 46 ++++++++++++++++--------
- configs/corstone1000_defconfig           |  8 ++++-
- include/configs/corstone1000.h           |  4 ++-
- 4 files changed, 69 insertions(+), 17 deletions(-)
-
-diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
-index 1fcc137a49..26b0f1b3ce 100644
---- a/arch/arm/dts/corstone1000-fvp.dts
-+++ b/arch/arm/dts/corstone1000-fvp.dts
-@@ -20,4 +20,32 @@
- 		interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
- 		reg-io-width =3D <2>;
- 	};
-+
-+	vmmc_v3_3d: fixed_v3_3d {
-+		compatible =3D "regulator-fixed";
-+		regulator-name =3D "vmmc_supply";
-+		regulator-min-microvolt =3D <3300000>;
-+		regulator-max-microvolt =3D <3300000>;
-+		regulator-always-on;
-+	};
-+
-+	sdmmc0: mmc@40300000 {
-+		compatible =3D "arm,pl18x", "arm,primecell";
-+		reg =3D <0x40300000 0x1000>;
-+		interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-+		max-frequency =3D <12000000>;
-+		vmmc-supply =3D <&vmmc_v3_3d>;
-+		clocks =3D <&smbclk>, <&refclk100mhz>;
-+		clock-names =3D "smclk", "apb_pclk";
-+	};
-+
-+	sdmmc1: mmc@50000000 {
-+		compatible =3D "arm,pl18x", "arm,primecell";
-+		reg =3D <0x50000000 0x10000>;
-+		interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-+		max-frequency =3D <12000000>;
-+		vmmc-supply =3D <&vmmc_v3_3d>;
-+		clocks =3D <&smbclk>, <&refclk100mhz>;
-+		clock-names =3D "smclk", "apb_pclk";
-+	};
- };
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 2fa485ff37..3d537d7a90 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -46,22 +46,38 @@ static struct mm_region corstone1000_mem_map[] =3D {
- 		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
- 			 PTE_BLOCK_NON_SHARE |
- 			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
--        }, {
--                /* USB */
--                .virt =3D 0x40200000UL,
--                .phys =3D 0x40200000UL,
--                .size =3D 0x00100000UL,
--                .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
--                         PTE_BLOCK_NON_SHARE |
--                         PTE_BLOCK_PXN | PTE_BLOCK_UXN
- 	}, {
--                 /* ethernet */
--                .virt =3D 0x40100000UL,
--                .phys =3D 0x40100000UL,
--                .size =3D 0x00100000UL,
--                .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
--                         PTE_BLOCK_NON_SHARE |
--                         PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+		/* USB */
-+		.virt =3D 0x40200000UL,
-+			.phys =3D 0x40200000UL,
-+			.size =3D 0x00100000UL,
-+			.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+				PTE_BLOCK_NON_SHARE |
-+				PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+	}, {
-+		/* MMC0 */
-+		.virt =3D 0x40300000UL,
-+		.phys =3D 0x40300000UL,
-+		.size =3D 0x00100000UL,
-+		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+				 PTE_BLOCK_NON_SHARE |
-+				 PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+	}, {
-+		/* ethernet */
-+		.virt =3D 0x40100000UL,
-+			.phys =3D 0x40100000UL,
-+			.size =3D 0x00100000UL,
-+			.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+				PTE_BLOCK_NON_SHARE |
-+				PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+	}, {
-+		/* MMC1 */
-+		.virt =3D 0x50000000UL,
-+		.phys =3D 0x50000000UL,
-+		.size =3D 0x00100000UL,
-+		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+				 PTE_BLOCK_NON_SHARE |
-+				 PTE_BLOCK_PXN | PTE_BLOCK_UXN
- 	}, {
- 		/* OCVM */
- 		.virt =3D 0x80000000UL,
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index c299dda49f..76e07fc20c 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -38,7 +38,13 @@ CONFIG_CMD_EFIDEBUG=3Dy
- CONFIG_CMD_FAT=3Dy
- CONFIG_OF_CONTROL=3Dy
- CONFIG_REGMAP=3Dy
--# CONFIG_MMC is not set
-+CONFIG_CLK=3Dy
-+CONFIG_CMD_MMC=3Dy
-+CONFIG_DM_MMC=3Dy
-+CONFIG_ARM_PL180_MMCI=3Dy
-+CONFIG_MMC_SDHCI_ADMA_HELPERS=3Dy
-+CONFIG_MMC_WRITE=3Dy
-+CONFIG_DM_GPIO=3Dy
- CONFIG_DM_SERIAL=3Dy
- CONFIG_USB=3Dy
- CONFIG_DM_USB=3Dy
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 333b1d93b6..815239590e 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -89,7 +89,9 @@
- #define CONFIG_SYS_MAXARGS	64	/* max command args */
-=20
- #define BOOT_TARGET_DEVICES(func) \
--	func(USB, usb, 0)
-+	func(USB, usb, 0) \
-+	func(MMC, mmc, 0) \
-+	func(MMC, mmc, 1)
-=20
- #include <config_distro_bootcmd.h>
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-cor=
stone1000-enable-distro-booting-command.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0026-corstone1000-enable-distro-booting-comman=
d.patch
new file mode 100644
index 00000000..a88180da
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-enable-distro-booting-command.patch
@@ -0,0 +1,27 @@
+From 15778524604652db60f704a772b6815d0f4305bf Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 5 Dec 2022 17:02:32 +0000
+Subject: [PATCH] corstone1000: enable distro booting command
+
+enable distro_bootcmd
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ include/configs/corstone1000.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
+index 1f28a0f6c0..548856b970 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -64,5 +64,6 @@
+=20
+ #include <config_distro_bootcmd.h>
+=20
++#define CONFIG_EXTRA_ENV_SETTINGS BOOTENV
+=20
+ #endif
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-cor=
stone1000-use-a-compressed-kernel.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/corstone1000/0027-corstone1000-use-a-compressed-kernel.patch
deleted file mode 100644
index 59000cd5..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-use-a-compressed-kernel.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 26c8a8528b794dbaba49bcf3e1bae8a1e15a8448 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Thu, 25 Aug 2022 11:21:28 +0100
-Subject: [PATCH] corstone1000: add compressed kernel support
-
-The corstone1000 kernel has become too large to fit in the available
-storage.  Swtiching to a compressed kernel avoids the problem, but
-requires uncompressing it.  Add this decompression to the default boot
-instructions.
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- include/configs/corstone1000.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 815239590e..a8aa105fe6 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -120,7 +120,8 @@
- #define CONFIG_BOOTCOMMAND								\
- 				"run retrieve_kernel_load_addr;"			\
- 				"echo Loading kernel from $kernel_addr to memory ... ;"	\
--				"loadm $kernel_addr $kernel_addr_r 0xc00000;"		\
-+				"unzip $kernel_addr 0x90000000;"	\
-+				"loadm 0x90000000 $kernel_addr_r 0xf00000;"		\
- 				"usb start; usb reset;"					\
- 				"run distro_bootcmd;"					\
- 				"bootefi $kernel_addr_r $fdtcontroladdr;"
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-ffa=
-add-support-for-32-bit-direct-messaging.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0031-ffa-add-support-for-32-bit-direct-messag=
ing.patch
deleted file mode 100644
index ac0638e0..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-ffa-add-su=
pport-for-32-bit-direct-messaging.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-From 6cb8e5f83d53357fbc6e58c2c5c5a3450654f9e6 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Wed, 19 Oct 2022 17:51:10 +0100
-Subject: [PATCH] arm_ffa: add support for 32-bit direct messaging
-
-add 32-bit mode for FFA_MSG_SEND_DIRECT_REQ and FFA_MSG_SEND_DIRECT_RESP
-
-Tested-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- cmd/armffa.c                       |  2 +-
- drivers/firmware/arm-ffa/core.c    | 17 ++++++++++++++---
- drivers/firmware/arm-ffa/sandbox.c |  2 +-
- include/arm_ffa.h                  |  2 +-
- lib/efi_loader/efi_capsule.c       |  2 +-
- lib/efi_loader/efi_setup.c         |  2 +-
- lib/efi_loader/efi_variable_tee.c  |  2 +-
- test/dm/ffa.c                      |  6 +++---
- 8 files changed, 23 insertions(+), 12 deletions(-)
-=E2=80=8B
-diff --git a/cmd/armffa.c b/cmd/armffa.c
-index 9b56e8a830..9842b99181 100644
---- a/cmd/armffa.c
-+++ b/cmd/armffa.c
-@@ -129,7 +129,7 @@ int  do_ffa_msg_send_direct_req(struct cmd_tbl *cmdt=
p, int flag, int argc,
- 		return -EINVAL;
- 	}
-=20
--	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg, 1);
- 	if (ret =3D=3D 0) {
- 		u8 cnt;
-=20
-diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/=
core.c
-index caba10caae..ba1ba59937 100644
---- a/drivers/firmware/arm-ffa/core.c
-+++ b/drivers/firmware/arm-ffa/core.c
-@@ -1032,6 +1032,7 @@ static int ffa_cache_partitions_info(void)
-  * ffa_msg_send_direct_req - FFA_MSG_SEND_DIRECT_{REQ,RESP} handler fun=
ction
-  * @dst_part_id: destination partition ID
-  * @msg: pointer to the message data preallocated by the client (in/out=
)
-+ * @is_smc64: select 64-bit or 32-bit FF-A ABI
-  *
-  * This is the runtime function that implements FFA_MSG_SEND_DIRECT_{RE=
Q,RESP}
-  * FF-A functions.
-@@ -1048,10 +1049,12 @@ static int ffa_cache_partitions_info(void)
-  *
-  * 0 on success. Otherwise, failure
-  */
--static int __ffa_runtime ffa_msg_send_direct_req(u16 dst_part_id, struc=
t ffa_send_direct_data *msg)
-+static int __ffa_runtime ffa_msg_send_direct_req(u16 dst_part_id, struc=
t ffa_send_direct_data *msg,
-+						 u8 is_smc64)
- {
- 	ffa_value_t res =3D {0};
- 	int ffa_errno;
-+	u64 req_mode, resp_mode;
-=20
- 	if (!ffa_priv_data || !ffa_priv_data->invoke_ffa_fn)
- 		return -EINVAL;
-@@ -1060,8 +1063,16 @@ static int __ffa_runtime ffa_msg_send_direct_req(=
u16 dst_part_id, struct ffa_sen
- 	if (!ffa_priv_data->partitions.count || !ffa_priv_data->partitions.des=
cs)
- 		return -ENODEV;
-=20
-+	if(is_smc64) {
-+		req_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ);
-+		resp_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
-+	} else {
-+		req_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_REQ);
-+		resp_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_RESP);
-+	}
-+
- 	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
--			.a0 =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ),
-+			.a0 =3D req_mode,
- 			.a1 =3D PREP_SELF_ENDPOINT_ID(ffa_priv_data->id) |
- 				PREP_PART_ENDPOINT_ID(dst_part_id),
- 			.a2 =3D 0,
-@@ -1083,7 +1094,7 @@ static int __ffa_runtime ffa_msg_send_direct_req(u=
16 dst_part_id, struct ffa_sen
- 		return 0;
- 	}
-=20
--	if (res.a0 =3D=3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP)) {
-+	if (res.a0 =3D=3D resp_mode){
- 		/*
- 		 * Message sent with response
- 		 * extract the return data
-diff --git a/drivers/firmware/arm-ffa/sandbox.c b/drivers/firmware/arm-f=
fa/sandbox.c
-index 16e1fdc809..8e8549441d 100644
---- a/drivers/firmware/arm-ffa/sandbox.c
-+++ b/drivers/firmware/arm-ffa/sandbox.c
-@@ -430,7 +430,7 @@ static int sandbox_ffa_sp_valid(u16 part_id)
-  * @{a0-a7} , res: The SMC call arguments and return structure.
-  *
-  * This is the function that emulates FFA_MSG_SEND_DIRECT_{REQ,RESP}
-- * FF-A functions.
-+ * FF-A functions. Only SMC 64-bit is supported in Sandbox.
-  *
-  * Emulating interrupts is not supported. So, FFA_RUN and FFA_INTERRUPT=
 are not supported.
-  * In case of success FFA_MSG_SEND_DIRECT_RESP is returned with default=
 pattern data (0xff).
-diff --git a/include/arm_ffa.h b/include/arm_ffa.h
-index 665413a0c5..4a7c59ff28 100644
---- a/include/arm_ffa.h
-+++ b/include/arm_ffa.h
-@@ -97,7 +97,7 @@ struct __packed ffa_send_direct_data {
- struct ffa_bus_ops {
- 	int (*partition_info_get)(const char *uuid_str,
- 				  u32 *parts_size, struct ffa_partition_info *buffer);
--	int (*sync_send_receive)(u16 dst_part_id, struct ffa_send_direct_data =
*msg);
-+	int (*sync_send_receive)(u16 dst_part_id, struct ffa_send_direct_data =
*msg, u8 is_smc64);
- 	int (*rxtx_unmap)(void);
- };
-=20
-diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 65e2fc8296..c479c53d04 100644
---- a/lib/efi_loader/efi_capsule.c
-+++ b/lib/efi_loader/efi_capsule.c
-@@ -591,7 +591,7 @@ static int __efi_runtime efi_corstone1000_buffer_rea=
dy_event(u32 capsule_image_s
- 	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
- 		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w4 */
-=20
--	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg);
-+	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
- }
- #endif
-=20
-diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 6ccda175ff..416af8d663 100644
---- a/lib/efi_loader/efi_setup.c
-+++ b/lib/efi_loader/efi_setup.c
-@@ -153,7 +153,7 @@ static int efi_corstone1000_uboot_efi_started_event(=
void)
- 	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
- 			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w4 */
-=20
--	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg);
-+	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
- }
- #endif
-=20
-diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_vari=
able_tee.c
-index 7d9d577281..05f3c02911 100644
---- a/lib/efi_loader/efi_variable_tee.c
-+++ b/lib/efi_loader/efi_variable_tee.c
-@@ -201,7 +201,7 @@ static int __efi_runtime ffa_notify_mm_sp(void)
-=20
- 	msg.data0 =3D FFA_SHARED_MM_BUFFER_OFFSET; /* x3 */
-=20
--	ret =3D ffa_bus_ops_get()->sync_send_receive(mm_sp_id, &msg);
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(mm_sp_id, &msg, 1);
- 	if (ret !=3D 0)
- 		return ret;
-=20
-diff --git a/test/dm/ffa.c b/test/dm/ffa.c
-index 052d5fc3f4..14b19cf71e 100644
---- a/test/dm/ffa.c
-+++ b/test/dm/ffa.c
-@@ -170,7 +170,7 @@ static int  test_ffa_msg_send_direct_req(u16 part_id=
, struct unit_test_state *ut
- 	struct ffa_send_direct_data msg =3D {0};
- 	u8 cnt;
-=20
--	ut_assertok(ffa_bus_ops_get()->sync_send_receive(part_id, &msg));
-+	ut_assertok(ffa_bus_ops_get()->sync_send_receive(part_id, &msg, 1));
-=20
- 	for (cnt =3D 0; cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64=
); cnt++)
- 		ut_assertok(((u64 *)&msg)[cnt] !=3D 0xffffffffffffffff);
-@@ -380,12 +380,12 @@ static int dm_test_ffa_nack(struct unit_test_state=
 *uts)
- 	ut_assertok(count !=3D SANDBOX_SP_COUNT_PER_VALID_SERVICE);
-=20
- 	/* send data to an invalid partition */
--	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg, 1);
- 	ut_assertok(ret !=3D -EINVAL);
-=20
- 	/* send data to a valid partition */
- 	part_id =3D prvdata->partitions.descs[0].info.id;
--	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg);
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(part_id, &msg, 1);
- 	ut_assertok(ret !=3D 0);
-=20
- 	return CMD_RET_SUCCESS;
---=20
-2.17.1
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 6144e97a..5e46f487 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -18,37 +18,32 @@ EXTRA_OEMAKE:append:corstone1000 =3D ' DEVICE_TREE=3D=
${CORSTONE1000_DEVICE_TREE}'
 SYSROOT_DIRS:append:corstone1000 =3D " /boot"
=20
 SRC_URI:append:corstone1000 =3D " \
-        file://0001-cmd-load-add-load-command-for-memory-mapped.patch   =
              \
-        file://0002-arm-add-support-to-corstone1000-platform.patch		    =
  \
-        file://0003-usb-common-move-urb-code-to-common.patch			      \
-        file://0004-usb-add-isp1760-family-driver.patch				      \
-        file://0005-corstone1000-enable-isp1763-usb-controller.patch		  =
    \
-        file://0006-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe=
.patch	      \
-        file://0007-arm64-smccc-clear-the-Xn-registers-after-SMC-calls.p=
atch	      \
-        file://0008-lib-uuid-introduce-be_uuid_str_to_le_bin-function.pa=
tch	      \
-        file://0009-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch		 =
     \
-        file://0010-arm_ffa-introduce-armffa-command.patch			      \
-        file://0011-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch		   =
   \
-        file://0012-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.=
patch	      \
-        file://0013-arm_ffa-introduce-armffa-command-Sandbox-test.patch	=
	      \
-        file://0014-arm_ffa-introduce-FF-A-MM-communication.patch		     =
 \
-        file://0015-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patc=
h	      \
-        file://0016-efi-corstone1000-introduce-EFI-capsule-update.patch	=
	      \
-	file://0017-corstone1000-Update-FFA-shared-buffer-address.patch		      =
\
-	file://0018-arm-corstone1000-fix-unrecognized-filesystem-type.patch	   =
   \
-	file://0019-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch	=
      \
-	file://0020-efi_boottime-corstone1000-pass-interface-id-and-kern.patch	=
      \
-        file://0021-efi_loader-corstone1000-remove-guid-check-from-corst=
.patch	      \
-        file://0022-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op=
.patch	      \
-        file://0023-efi_firmware-add-get_image_info-for-corstone1000.pat=
ch	      \
-        file://0024-efi_loader-send-bootcomplete-message-to-secure-encla=
.patch	      \
-        file://0025-efi_loader-fix-null-pointer-exception-with-get_image=
.patch	      \
-        file://0026-arm-corstone1000-add-mmc-for-fvp.patch			      \
-        file://0027-corstone1000-use-a-compressed-kernel.patch \
-        file://0028-Introduce-external-sys-driver-to-device-tree.patch \
-        file://0029-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch=
 \
-        file://0030-arm-corstone1000-esrt-support.patch \
-        file://0031-ffa-add-support-for-32-bit-direct-messaging.patch  \
+        file://0001-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe=
.patch          \=20
+        file://0002-lib-uuid-introduce-uuid_str_to_le_bin-function.patch=
		\=20
+        file://0003-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch			=
\=20
+        file://0004-arm_ffa-efi-unmap-RX-TX-buffers.patch				\=20
+        file://0005-arm_ffa-introduce-armffa-command.patch				\=20
+        file://0006-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch			\=20
+        file://0007-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.=
patch		\=20
+        file://0008-arm_ffa-introduce-armffa-command-Sandbox-test.patch	=
		\=20
+        file://0009-arm_ffa-efi-introduce-FF-A-MM-communication.patch			=
\=20
+        file://0010-arm_ffa-efi-corstone1000-enable-MM-communication.pat=
ch		\=20
+        file://0011-efi-corstone1000-introduce-EFI-capsule-update.patch	=
		\=20
+        file://0012-arm-corstone1000-fix-unrecognized-filesystem-type.pa=
tch		\=20
+        file://0013-efi_capsule-corstone1000-pass-interface-id-and-buffe=
.patch		\=20
+        file://0014-efi_boottime-corstone1000-pass-interface-id-and-kern=
.patch		\=20
+        file://0015-efi_loader-corstone1000-remove-guid-check-from-corst=
.patch		\=20
+        file://0016-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op=
.patch		\=20
+        file://0017-efi_firmware-add-get_image_info-for-corstone1000.pat=
ch		\=20
+        file://0018-efi_loader-send-bootcomplete-message-to-secure-encla=
.patch		\=20
+        file://0019-efi_loader-fix-null-pointer-exception-with-get_image=
.patch		\=20
+        file://0020-arm-corstone1000-add-mmc-for-fvp.patch				\=20
+        file://0021-corstone1000-add-compressed-kernel-support.patch			\=
=20
+        file://0022-Introduce-external-sys-driver-to-device-tree.patch		=
	\=20
+        file://0023-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch=
		\=20
+        file://0024-arm-corstone1000-esrt-support.patch					\=20
+        file://0025-efi_setup-discover-FF-A-bus-before-raising-EFI-start=
.patch		\=20
+        file://0026-corstone1000-enable-distro-booting-command.patch    =
                    \
         "
=20
 #
--=20
2.34.1


