Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7E9EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 10:43:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4443.1689936209829733765
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jul 2023 03:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C197C2F4;
	Fri, 21 Jul 2023 03:44:12 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.0.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 434943F738;
	Fri, 21 Jul 2023 03:43:27 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 2/2] arm-bsp/u-boot: corstone1000: upgrade to v2023.07
Date: Fri, 21 Jul 2023 11:43:15 +0100
Message-Id: <20230721104315.73907-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230721104315.73907-1-abdellatif.elkhlifi@arm.com>
References: <20230721104315.73907-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jul 2023 10:43:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4915

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Port Corstone-1000 patches to U-Boot v2023.07
Include the latest FF-A patchset sent to the mailing list (v15).

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |    2 +-
 ...ccc-add-support-for-SMCCCv1.2-x0-x1.patch} |   80 +-
 ...-introduce-uuid_str_to_le_bin-funct.patch} |   71 +-
 ...d-introduce-testcase-for-uuid_str_to.patch |   94 +
 ...-introduce-Arm-FF-A-low-level-driver.patch | 2139 -----------------
 ...5-arm_ffa-introduce-Arm-FF-A-support.patch | 2132 ++++++++++++++++
 ...0004-arm_ffa-efi-unmap-RX-TX-buffers.patch |   74 -
 ...v15-arm_ffa-introduce-armffa-command.patch |  436 ++++
 ...005-arm_ffa-introduce-armffa-command.patch |  364 ---
 ...m_ffa-introduce-sandbox-FF-A-support.patch | 1314 ++++++++++
 ...fa-introduce-the-FF-A-Sandbox-driver.patch | 1164 ---------
 ...-introduce-sandbox-test-cases-for-UC.patch |  341 +++
 ...ce-Sandbox-test-cases-for-UCLASS_FFA.patch |  472 ----
 ...introduce-armffa-command-Sandbox-te.patch} |   65 +-
 ...efi-introduce-FF-A-MM-communication.patch} |  369 ++-
 ...-efi-corstone1000-enable-MM-communic.patch |   33 +
 ...corstone1000-enable-MM-communication.patch |   86 -
 ...00-fwu-introduce-EFI-capsule-update.patch} |  223 +-
 ...000-fix-unrecognized-filesystem-type.patch |    4 +-
 ...tone1000-pass-interface-id-and-buffe.patch |   74 -
 ...ne1000-remove-guid-check-from-corst.patch} |   10 +-
 ...stone1000-pass-interface-id-and-kern.patch |   58 -
 ...te-ESRT-table-if-EFI_ESRT-config-op.patch} |    8 +-
 ...add-get_image_info-for-corstone1000.patch} |    4 +-
 ...ll-pointer-exception-with-get_image.patch} |    8 +-
 ...17-arm-corstone1000-add-mmc-for-fvp.patch} |   25 +-
 ...e1000-add-compressed-kernel-support.patch} |    8 +-
 ...bootcomplete-message-to-secure-encla.patch |  183 --
 ...-external-sys-driver-to-device-tree.patch} |    8 +-
 ...-rpmsg-client-to-u-boot-device-tree.patch} |    8 +-
 ... 0021-arm-corstone1000-esrt-support.patch} |   22 +-
 ...e1000-enable-distro-booting-command.patch} |   12 +-
 ...one1000-add-fwu-metadata-store-info.patch} |    4 +-
 ...ata-make-sure-structures-are-packed.patch} |    4 +-
 .../0025-corstone1000-add-boot-index.patch    |   42 +
 ...er-FF-A-bus-before-raising-EFI-start.patch |   51 -
 ...djust-boot-bank-and-kernel-location.patch} |    4 +-
 ...dd-nvmxip-fwu-mdata-and-gpt-options.patch} |   65 +-
 ...ip-introduce-NVM-XIP-block-storage-e.patch |  455 ----
 ...mtd-nvmxip-introduce-QSPI-XIP-driver.patch |  271 ---
 ... 0028-nvmxip-move-header-to-include.patch} |    8 +-
 ...0-set-kernel_addr-based-on-boot_idx.patch} |   20 +-
 ...64-fix-return-unsigned-long-in-readq.patch |   45 -
 ...corstone1000-boot-index-from-active.patch} |   19 +-
 ...andbox64-add-support-for-NVMXIP-QSPI.patch |  161 --
 ...00-add-NVM-XIP-QSPI-device-tree-node.patch |   42 -
 ...0031-corstone1000-enable-PSCI-reset.patch} |   27 +-
 ...32-Enable-EFI-set-get-time-services.patch} |   27 +-
 ...64-add-a-test-case-for-UCLASS_NVMXIP.patch |  219 --
 .../0035-corstone1000-add-boot-index.patch    |   33 -
 ...ion-warnings-in-fwu_plat_get_bootidx.patch |   47 -
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   75 +-
 52 files changed, 4942 insertions(+), 6568 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0001-arm64-s=
mccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch =3D> 0001-FF-A-v15-ar=
m64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch} (79%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0002-lib-uui=
d-introduce-uuid_str_to_le_bin-function.patch =3D> 0002-FF-A-v15-lib-uuid=
-introduce-uuid_str_to_le_bin-funct.patch} (64%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
003-FF-A-v15-lib-uuid-introduce-testcase-for-uuid_str_to.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
003-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-support.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
004-arm_ffa-efi-unmap-RX-TX-buffers.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
005-FF-A-v15-arm_ffa-introduce-armffa-command.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
005-arm_ffa-introduce-armffa-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
006-FF-A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
006-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
007-FF-A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
007-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0008-arm_ffa=
-introduce-armffa-command-Sandbox-test.patch =3D> 0008-FF-A-v15-arm_ffa-i=
ntroduce-armffa-command-Sandbox-te.patch} (58%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0009-arm_ffa=
-efi-introduce-FF-A-MM-communication.patch =3D> 0009-FF-A-v15-arm_ffa-efi=
-introduce-FF-A-MM-communication.patch} (57%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
010-FF-A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
010-arm_ffa-efi-corstone1000-enable-MM-communication.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0011-efi-cor=
stone1000-introduce-EFI-capsule-update.patch =3D> 0011-efi-corstone1000-f=
wu-introduce-EFI-capsule-update.patch} (66%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
013-efi_capsule-corstone1000-pass-interface-id-and-buffe.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0015-efi_loa=
der-corstone1000-remove-guid-check-from-corst.patch =3D> 0013-efi_loader-=
corstone1000-remove-guid-check-from-corst.patch} (83%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
014-efi_boottime-corstone1000-pass-interface-id-and-kern.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0016-efi_loa=
der-populate-ESRT-table-if-EFI_ESRT-config-op.patch =3D> 0014-efi_loader-=
populate-ESRT-table-if-EFI_ESRT-config-op.patch} (80%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0017-efi_fir=
mware-add-get_image_info-for-corstone1000.patch =3D> 0015-efi_firmware-ad=
d-get_image_info-for-corstone1000.patch} (96%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0019-efi_loa=
der-fix-null-pointer-exception-with-get_image.patch =3D> 0016-efi_loader-=
fix-null-pointer-exception-with-get_image.patch} (91%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0020-arm-cor=
stone1000-add-mmc-for-fvp.patch =3D> 0017-arm-corstone1000-add-mmc-for-fv=
p.patch} (81%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0021-corston=
e1000-add-compressed-kernel-support.patch =3D> 0018-corstone1000-add-comp=
ressed-kernel-support.patch} (87%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
018-efi_loader-send-bootcomplete-message-to-secure-encla.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0022-Introdu=
ce-external-sys-driver-to-device-tree.patch =3D> 0019-Introduce-external-=
sys-driver-to-device-tree.patch} (81%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0023-Add-mhu=
-and-rpmsg-client-to-u-boot-device-tree.patch =3D> 0020-Add-mhu-and-rpmsg=
-client-to-u-boot-device-tree.patch} (92%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0024-arm-cor=
stone1000-esrt-support.patch =3D> 0021-arm-corstone1000-esrt-support.patc=
h} (91%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0026-corston=
e1000-enable-distro-booting-command.patch =3D> 0022-corstone1000-enable-d=
istro-booting-command.patch} (72%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0033-corston=
e1000-add-fwu-metadata-store-info.patch =3D> 0023-corstone1000-add-fwu-me=
tadata-store-info.patch} (87%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0034-fwu_met=
adata-make-sure-structures-are-packed.patch =3D> 0024-fwu_metadata-make-s=
ure-structures-are-packed.patch} (90%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
025-corstone1000-add-boot-index.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
025-efi_setup-discover-FF-A-bus-before-raising-EFI-start.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0036-corston=
e1000-adjust-boot-bank-and-kernel-location.patch =3D> 0026-corstone1000-a=
djust-boot-bank-and-kernel-location.patch} (89%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0037-corston=
e1000-add-nvmxip-fwu-mdata-and-gpt-options.patch =3D> 0027-corstone1000-a=
dd-nvmxip-fwu-mdata-and-gpt-options.patch} (63%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
027-drivers-mtd-nvmxip-introduce-NVM-XIP-block-storage-e.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
028-drivers-mtd-nvmxip-introduce-QSPI-XIP-driver.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0038-nvmxip-=
move-header-to-include.patch =3D> 0028-nvmxip-move-header-to-include.patc=
h} (82%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0039-corston=
e1000-set-kernel_addr-based-on-boot_idx.patch =3D> 0029-corstone1000-set-=
kernel_addr-based-on-boot_idx.patch} (89%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
029-sandbox64-fix-return-unsigned-long-in-readq.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-corston=
e1000-boot-index-from-active.patch =3D> 0030-corstone1000-boot-index-from=
-active.patch} (64%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
030-sandbox64-add-support-for-NVMXIP-QSPI.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
031-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0041-corston=
e1000-enable-PSCI-reset.patch =3D> 0031-corstone1000-enable-PSCI-reset.pa=
tch} (50%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0042-Enable-=
EFI-set-get-time-services.patch =3D> 0032-Enable-EFI-set-get-time-service=
s.patch} (52%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
035-corstone1000-add-boot-index.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
043-corstone1000-fix-compilation-warnings-in-fwu_plat_get_bootidx.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 8a2e2a02..da668c95 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -22,7 +22,7 @@ TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-RS=
A-3072_1.pem"
 RE_IMAGE_OFFSET =3D "0x1000"
=20
 # u-boot
-PREFERRED_VERSION_u-boot ?=3D "2023.01"
+PREFERRED_VERSION_u-boot ?=3D "2023.07"
 EXTRA_IMAGEDEPENDS +=3D "u-boot"
=20
 UBOOT_CONFIG ??=3D "EFI"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm=
64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v15-arm64-smccc-add-suppor=
t-for-SMCCCv1.2-x0-x1.patch
similarity index 79%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm6=
4-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v=
15-arm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch
index 23f50198..df633e2f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm64-smcc=
c-add-support-for-SMCCCv1.2-x0-x17-registe.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-FF-A-v15-a=
rm64-smccc-add-support-for-SMCCCv1.2-x0-x1.patch
@@ -1,8 +1,8 @@
-From 5ce8bf4ad1aeb2657a7ab83c46eeb2cdaa56cfd4 Mon Sep 17 00:00:00 2001
+From b79722ade56bd49cf9e7d9b47b6256599c8cdb36 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 29 Jul 2022 13:06:19 +0100
-Subject: [PATCH 01/42] arm64: smccc: add support for SMCCCv1.2 x0-x17
- registers
+Subject: [PATCH 01/33] FF-A v15: arm64: smccc: add support for SMCCCv1.2
+ x0-x17 registers
=20
 add support for x0-x17 registers used by the SMC calls
=20
@@ -16,51 +16,35 @@ arm64: smccc: Add support for SMCCCv1.2 extended inpu=
t/output registers
 [1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4=
c6?token=3D
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
 Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Reviewed-by: Simon Glass <sjg@chromium.org>
 Cc: Tom Rini <trini@konsulko.com>
-Cc: Simon Glass <sjg@chromium.org>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v7:
-
-* improve indentation of ARM_SMCCC_1_2_REGS_Xn_OFFS
-
-v4:
-
-* rename the commit title and improve description
-  new commit title: the current
-
-v3:
-
-* port x0-x17 registers support from linux kernel as defined by SMCCCv1.=
2
-  commit title:
-      arm64: smccc: add Xn registers support used by SMC calls
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
 ---
- arch/arm/cpu/armv8/smccc-call.S | 53 +++++++++++++++++++++++++++++++++
- arch/arm/lib/asm-offsets.c      | 14 +++++++++
- include/linux/arm-smccc.h       | 43 ++++++++++++++++++++++++++
- 3 files changed, 110 insertions(+)
+ arch/arm/cpu/armv8/smccc-call.S | 57 ++++++++++++++++++++++++++++++++-
+ arch/arm/lib/asm-offsets.c      | 16 +++++++++
+ include/linux/arm-smccc.h       | 45 ++++++++++++++++++++++++++
+ 3 files changed, 117 insertions(+), 1 deletion(-)
=20
 diff --git a/arch/arm/cpu/armv8/smccc-call.S b/arch/arm/cpu/armv8/smccc-=
call.S
-index dc92b28777..ec6f299bc9 100644
+index dc92b28777..93f66d3366 100644
 --- a/arch/arm/cpu/armv8/smccc-call.S
 +++ b/arch/arm/cpu/armv8/smccc-call.S
-@@ -1,6 +1,8 @@
+@@ -1,7 +1,11 @@
  /* SPDX-License-Identifier: GPL-2.0 */
  /*
   * Copyright (c) 2015, Linaro Limited
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
+- */
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++*/
  #include <linux/linkage.h>
  #include <linux/arm-smccc.h>
-@@ -45,3 +47,54 @@ ENDPROC(__arm_smccc_smc)
+ #include <generated/asm-offsets.h>
+@@ -45,3 +49,54 @@ ENDPROC(__arm_smccc_smc)
  ENTRY(__arm_smccc_hvc)
  	SMCCC	hvc
  ENDPROC(__arm_smccc_hvc)
@@ -116,20 +100,22 @@ index dc92b28777..ec6f299bc9 100644
 +
 +#endif
 diff --git a/arch/arm/lib/asm-offsets.c b/arch/arm/lib/asm-offsets.c
-index 22fd541f9a..db6d7ed234 100644
+index 6de0ce9152..181a8ac4c2 100644
 --- a/arch/arm/lib/asm-offsets.c
 +++ b/arch/arm/lib/asm-offsets.c
-@@ -9,6 +9,9 @@
+@@ -9,6 +9,11 @@
   * generate asm statements containing #defines,
   * compile this file to assembler, and then extract the
   * #defines from the assembly-language output.
 + *
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
   */
 =20
  #include <common.h>
-@@ -117,6 +120,17 @@ int main(void)
+@@ -90,6 +95,17 @@ int main(void)
  	DEFINE(ARM_SMCCC_RES_X2_OFFS, offsetof(struct arm_smccc_res, a2));
  	DEFINE(ARM_SMCCC_QUIRK_ID_OFFS, offsetof(struct arm_smccc_quirk, id));
  	DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS, offsetof(struct arm_smccc_quirk, st=
ate));
@@ -148,19 +134,21 @@ index 22fd541f9a..db6d7ed234 100644
 =20
  	return 0;
 diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index e1d09884a1..9105031d55 100644
+index e1d09884a1..f44e9e8f93 100644
 --- a/include/linux/arm-smccc.h
 +++ b/include/linux/arm-smccc.h
-@@ -1,6 +1,8 @@
+@@ -1,6 +1,10 @@
  /* SPDX-License-Identifier: GPL-2.0 */
  /*
   * Copyright (c) 2015, Linaro Limited
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
   */
  #ifndef __LINUX_ARM_SMCCC_H
  #define __LINUX_ARM_SMCCC_H
-@@ -70,6 +72,47 @@ struct arm_smccc_res {
+@@ -70,6 +74,47 @@ struct arm_smccc_res {
  	unsigned long a3;
  };
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib=
-uuid-introduce-uuid_str_to_le_bin-function.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0002-FF-A-v15-lib-uuid-introduce-uuid_str_=
to_le_bin-funct.patch
similarity index 64%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib-=
uuid-introduce-uuid_str_to_le_bin-function.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-FF-A-v=
15-lib-uuid-introduce-uuid_str_to_le_bin-funct.patch
index 5c0c61e5..550be6be 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib-uuid-i=
ntroduce-uuid_str_to_le_bin-function.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-FF-A-v15-l=
ib-uuid-introduce-uuid_str_to_le_bin-funct.patch
@@ -1,84 +1,69 @@
-From 1dcebf6f57e3490f7b3e2464b4114b993dd70c7c Mon Sep 17 00:00:00 2001
+From 43137871fcc46513eea1480cd78ad091763578f0 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 4 Aug 2022 16:46:47 +0100
-Subject: [PATCH 02/42] lib: uuid: introduce uuid_str_to_le_bin function
+Subject: [PATCH 02/33] FF-A v15: lib: uuid: introduce uuid_str_to_le_bin
+ function
=20
 convert UUID string to little endian binary data
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
 Cc: Tom Rini <trini@konsulko.com>
-Cc: Simon Glass <sjg@chromium.org>
 Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
 Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v8:
-
-* use simple_strtoull() in uuid_str_to_le_bin() to support 32-bit platfo=
rms
-
-v7:
-
-* rename be_uuid_str_to_le_bin() to uuid_str_to_le_bin()
-* make uuid_str_to_le_bin() implementation similar to uuid_str_to_bin()
-  by using same APIs
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
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
 ---
- include/uuid.h |  8 ++++++++
- lib/uuid.c     | 46 ++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 54 insertions(+)
+ include/uuid.h | 15 +++++++++++++++
+ lib/uuid.c     | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 63 insertions(+)
=20
 diff --git a/include/uuid.h b/include/uuid.h
-index 4a4883d3b5..293a8eb0a5 100644
+index 4a4883d3b5..89b93e642b 100644
 --- a/include/uuid.h
 +++ b/include/uuid.h
-@@ -2,6 +2,8 @@
+@@ -2,6 +2,10 @@
  /*
   * Copyright (C) 2014 Samsung Electronics
   * Przemyslaw Marczak <p.marczak@samsung.com>
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
   */
  #ifndef __UUID_H__
  #define __UUID_H__
-@@ -44,4 +46,10 @@ int uuid_guid_get_bin(const char *guid_str, unsigned =
char *guid_bin);
+@@ -44,4 +48,15 @@ int uuid_guid_get_bin(const char *guid_str, unsigned =
char *guid_bin);
  const char *uuid_guid_get_str(const unsigned char *guid_bin);
  void gen_rand_uuid(unsigned char *uuid_bin);
  void gen_rand_uuid_str(char *uuid_str, int str_format);
 +
 +/**
-+ * uuid_str_to_le_bin - Converts a UUID string to little endian binary =
data
++ * uuid_str_to_le_bin() - Convert string UUID to little endian binary d=
ata.
++ * @uuid_str:	pointer to UUID string
++ * @uuid_bin:	pointer to allocated array for little endian output [16B]
++ * Return:
++ *    uuid_bin filled with little endian UUID data
++ *    On success 0 is returned. Otherwise, failure code.
 + */
 +int uuid_str_to_le_bin(const char *uuid_str, unsigned char *uuid_bin);
 +
  #endif
 diff --git a/lib/uuid.c b/lib/uuid.c
-index 465e1ac38f..d29f561a70 100644
+index 96e1af3c8b..45f325d964 100644
 --- a/lib/uuid.c
 +++ b/lib/uuid.c
-@@ -1,6 +1,8 @@
+@@ -1,6 +1,10 @@
  // SPDX-License-Identifier: GPL-2.0+
  /*
   * Copyright 2011 Calxeda, Inc.
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
   */
 =20
  #include <common.h>
-@@ -346,6 +348,50 @@ int uuid_str_to_bin(const char *uuid_str, unsigned =
char *uuid_bin,
+@@ -354,6 +358,50 @@ int uuid_str_to_bin(const char *uuid_str, unsigned =
char *uuid_bin,
  	return 0;
  }
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-FF-=
A-v15-lib-uuid-introduce-testcase-for-uuid_str_to.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0003-FF-A-v15-lib-uuid-introduce-tes=
tcase-for-uuid_str_to.patch
new file mode 100644
index 00000000..bbd4e048
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-FF-A-v15-l=
ib-uuid-introduce-testcase-for-uuid_str_to.patch
@@ -0,0 +1,94 @@
+From 80fd758cb55f8b44078b4535284ea132b0d5a944 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 27 Mar 2023 16:24:29 +0100
+Subject: [PATCH 03/33] FF-A v15: lib: uuid: introduce testcase for
+ uuid_str_to_le_bin
+
+provide a test case
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+Cc: Tom Rini <trini@konsulko.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
+---
+ MAINTAINERS       |  5 +++++
+ test/lib/Makefile |  1 +
+ test/lib/uuid.c   | 41 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 47 insertions(+)
+ create mode 100644 test/lib/uuid.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 3bf60c4643..a1122afb01 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -1632,3 +1632,8 @@ S:	Maintained
+ F:	arch/arm/dts/ls1021a-twr-u-boot.dtsi
+ F:	drivers/crypto/fsl/
+ F:	include/fsl_sec.h
++
++UUID testing
++M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++S:	Maintained
++F:	test/lib/uuid.c
+diff --git a/test/lib/Makefile b/test/lib/Makefile
+index e0bd9e04e8..e75a263e6a 100644
+--- a/test/lib/Makefile
++++ b/test/lib/Makefile
+@@ -22,6 +22,7 @@ obj-$(CONFIG_AES) +=3D test_aes.o
+ obj-$(CONFIG_GETOPT) +=3D getopt.o
+ obj-$(CONFIG_CRC8) +=3D test_crc8.o
+ obj-$(CONFIG_UT_LIB_CRYPT) +=3D test_crypt.o
++obj-$(CONFIG_LIB_UUID) +=3D uuid.o
+ else
+ obj-$(CONFIG_SANDBOX) +=3D kconfig_spl.o
+ endif
+diff --git a/test/lib/uuid.c b/test/lib/uuid.c
+new file mode 100644
+index 0000000000..e24331a136
+--- /dev/null
++++ b/test/lib/uuid.c
+@@ -0,0 +1,41 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Functional tests for UCLASS_FFA  class
++ *
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <uuid.h>
++#include <test/lib.h>
++#include <test/test.h>
++#include <test/ut.h>
++
++/* test UUID */
++#define TEST_SVC_UUID	"ed32d533-4209-99e6-2d72-cdd998a79cc0"
++
++#define UUID_SIZE 16
++
++/* The UUID binary data (little-endian format) */
++static const u8 ref_uuid_bin[UUID_SIZE] =3D {
++	0x33, 0xd5, 0x32, 0xed,
++	0x09, 0x42, 0xe6, 0x99,
++	0x72, 0x2d, 0xc0, 0x9c,
++	0xa7, 0x98, 0xd9, 0xcd
++};
++
++static int lib_test_uuid_to_le(struct unit_test_state *uts)
++{
++	const char *uuid_str =3D TEST_SVC_UUID;
++	u8 ret_uuid_bin[UUID_SIZE] =3D {0};
++
++	ut_assertok(uuid_str_to_le_bin(uuid_str, ret_uuid_bin));
++	ut_asserteq_mem(ref_uuid_bin, ret_uuid_bin, UUID_SIZE);
++
++	return 0;
++}
++
++LIB_TEST(lib_test_uuid_to_le, 0);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm=
_ffa-introduce-Arm-FF-A-low-level-driver.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0003-arm_ffa-introduce-Arm-FF-A-low-level-dri=
ver.patch
deleted file mode 100644
index f76c74b6..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-in=
troduce-Arm-FF-A-low-level-driver.patch
+++ /dev/null
@@ -1,2139 +0,0 @@
-From 77cf1f517f6d92d5e3efb40d8335adb03b289525 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Tue, 29 Nov 2022 14:40:05 +0000
-Subject: [PATCH 03/42] arm_ffa: introduce Arm FF-A low-level driver
-
-Add the core driver implementing Arm Firmware Framework for Armv8-A v1.0
-
-The Firmware Framework for Arm A-profile processors (FF-A v1.0) [1]
-describes interfaces (ABIs) that standardize communication
-between the Secure World and Normal World leveraging TrustZone
-technology.
-
-This driver uses 64-bit registers as per SMCCCv1.2 spec and comes
-on top of the SMCCC layer. The driver provides the FF-A ABIs needed for
-querying the FF-A framework from the secure world.
-
-The driver uses SMC32 calling convention which means using the first
-32-bit data of the Xn registers.
-
-All supported ABIs come with their 32-bit version except FFA_RXTX_MAP
-which has 64-bit version supported.
-
-Both 32-bit and 64-bit direct messaging are supported which allows both
-32-bit and 64-bit clients to use the FF-A bus.
-
-In U-Boot FF-A design, FF-A is considered as a discoverable bus.
-The Secure World is considered as one entity to communicate with
-using the FF-A bus. FF-A communication is handled by one device and
-one instance (the bus). This FF-A driver takes care of all the
-interactions between Normal world and Secure World.
-
-The driver exports its operations to be used by upper layers.
-
-Exported operations:
-
-- partition_info_get
-- sync_send_receive
-- rxtx_unmap
-
-For more details please refer to the driver documentation [2].
-
-[1]: https://developer.arm.com/documentation/den0077/latest/
-[2]: doc/arch/arm64.ffa.rst
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Simon Glass <sjg@chromium.org>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v8:
-
-* make ffa_get_partitions_info() second argument to be an SP count in bo=
th
-  modes
-* update ffa_bus_prvdata_get() to return a pointer rather than a pointer
-  address
-* remove packing from ffa_partition_info and ffa_send_direct_data struct=
ures
-* pass the FF-A bus device to the bus operations
-
-v7:
-
-* add support for 32-bit direct messaging
-* rename be_uuid_str_to_le_bin() to uuid_str_to_le_bin()
-* improve the declaration of error handling mapping
-* stating in doc/arch/arm64.ffa.rst that EFI runtime is not supported
-
-v6:
-
-* drop use of EFI runtime support (We decided with Linaro to add this la=
ter)
-* drop discovery from initcalls (discovery will be on demand by FF-A use=
rs)
-* set the alignment of the RX/TX buffers to the larger translation granu=
le size
-* move FF-A RX/TX buffers unmapping at ExitBootServices() to a separate =
commit
-* update the documentation and move it to doc/arch/arm64.ffa.rst
-
-v4:
-
-* add doc/README.ffa.drv
-* moving the FF-A driver work to drivers/firmware/arm-ffa
-* use less #ifdefs in lib/efi_loader/efi_boottime.c and replace
-  #if defined by #if CONFIG_IS_ENABLED
-* improving error handling by mapping the FF-A errors to standard errors
-  and logs
-* replacing panics with an error log and returning an error code
-* improving features discovery in FFA_FEATURES by introducing
-  rxtx_min_pages private data field
-* add ffa_remove and ffa_unbind functions
-* improve how the driver behaves when bus discovery is done more than
-  once
-
-v3:
-
-* align the interfaces of the U-Boot FF-A driver with those in the linux
-  FF-A driver
-* remove the FF-A helper layer
-* make the U-Boot FF-A driver independent from EFI
-* provide an optional config that enables copying the driver data to EFI
-  runtime section at ExitBootServices service
-* use 64-bit version of FFA_RXTX_MAP, FFA_MSG_SEND_DIRECT_{REQ, RESP}
-
-v2:
-
-* make FF-A bus discoverable using device_{bind, probe} APIs
-* remove device tree support
-
-v1:
-
-* introduce FF-A bus driver with device tree support
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- MAINTAINERS                               |    7 +
- doc/arch/arm64.ffa.rst                    |  218 ++++
- doc/arch/index.rst                        |    1 +
- drivers/Kconfig                           |    2 +
- drivers/Makefile                          |    1 +
- drivers/firmware/arm-ffa/Kconfig          |   30 +
- drivers/firmware/arm-ffa/Makefile         |    6 +
- drivers/firmware/arm-ffa/arm-ffa-uclass.c |   16 +
- drivers/firmware/arm-ffa/arm_ffa_prv.h    |  200 ++++
- drivers/firmware/arm-ffa/core.c           | 1315 +++++++++++++++++++++
- include/arm_ffa.h                         |   97 ++
- include/dm/uclass-id.h                    |    4 +
- 12 files changed, 1897 insertions(+)
- create mode 100644 doc/arch/arm64.ffa.rst
- create mode 100644 drivers/firmware/arm-ffa/Kconfig
- create mode 100644 drivers/firmware/arm-ffa/Makefile
- create mode 100644 drivers/firmware/arm-ffa/arm-ffa-uclass.c
- create mode 100644 drivers/firmware/arm-ffa/arm_ffa_prv.h
- create mode 100644 drivers/firmware/arm-ffa/core.c
- create mode 100644 include/arm_ffa.h
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 3fc4cd0f12..509619d31c 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -264,6 +264,13 @@ F:	drivers/net/cortina_ni.h
- F:	drivers/net/phy/ca_phy.c
- F:	configs/cortina_presidio-asic-pnand_defconfig
-=20
-+ARM FF-A
-+M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+S:	Maintained
-+F:	doc/arch/arm64.ffa.rst
-+F:	drivers/firmware/arm-ffa/
-+F:	include/arm_ffa.h
-+
- ARM FREESCALE IMX
- M:	Stefano Babic <sbabic@denx.de>
- M:	Fabio Estevam <festevam@gmail.com>
-diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
-new file mode 100644
-index 0000000000..dfcec82e45
---- /dev/null
-+++ b/doc/arch/arm64.ffa.rst
-@@ -0,0 +1,218 @@
-+.. SPDX-License-Identifier: GPL-2.0+
-+
-+Arm FF-A Driver
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+Summary
-+-------
-+
-+FF-A stands for Firmware Framework for Arm A-profile processors.
-+
-+FF-A specifies interfaces that enable a pair of software sandboxes to
-+communicate with each other. A sandbox aka partition could
-+be a VM in the Normal or Secure world, an application in S-EL0, or a
-+Trusted OS in S-EL1.
-+
-+This FF-A driver implements the interfaces to communicate with partitio=
ns in
-+the Secure world aka Secure partitions (SPs).
-+
-+The driver specifically focuses on communicating with SPs that isolate =
portions
-+of EFI runtime services that must run in a protected environment which =
is
-+inaccessible by the Host OS or Hypervisor. Examples of such services ar=
e
-+set/get variables.
-+
-+FF-A driver uses the SMC ABIs defined by the FF-A specification to:
-+
-+- Discover the presence of SPs of interest
-+- Access an SP's service through communication protocols
-+  e.g. EFI MM communication protocol
-+
-+At this stage of development the FF-A driver supports EFI boot time onl=
y.
-+
-+Runtime support will be added in future developments.
-+
-+FF-A and SMC specifications
-+-------------------------------------------
-+
-+The current implementation of the driver relies on FF-A specification v=
1.0
-+and uses SMC32 calling convention which means using the first 32-bit da=
ta of the
-+Xn registers.
-+
-+At this stage we only need the FF-A v1.0 features.
-+
-+The driver has been tested with OP-TEE which supports SMC32 calling con=
vention.
-+
-+For more details please refer to the FF-A v1.0 spec:
-+https://documentation-service.arm.com/static/5fb7e8a6ca04df4095c1d65e?t=
oken=3D
-+
-+Hypervisors are supported if they are configured to trap SMC calls.
-+
-+The FF-A driver uses 64-bit registers as per SMCCCv1.2 specification.
-+
-+For more details please refer to the SMC Calling Convention v1.2 spec:
-+https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6?t=
oken=3D
-+
-+Supported hardware
-+--------------------------------
-+
-+Aarch64 plaforms
-+
-+Configuration
-+----------------------
-+
-+CONFIG_ARM_FFA_TRANSPORT
-+    Enables the FF-A bus driver. Turn this on if you want to use FF-A
-+    communication.
-+
-+CONFIG_SANDBOX_FFA
-+    Enables FF-A Sandbox driver. This emulates the FF-A ABIs handling u=
nder
-+    Sandbox and provides functional tests for FF-A.
-+
-+FF-A ABIs under the hood
-+---------------------------------------
-+
-+Invoking an FF-A ABI involves providing to the secure world/hypervisor =
the
-+expected arguments from the ABI.
-+
-+The ABI arguments are stored in x0 to x7 registers. Then, an SMC instru=
ction
-+is executed.
-+
-+At the secure side level or hypervisor the ABI is handled at a higher e=
xception
-+level and the arguments are read and processed.
-+
-+The response is put back through x0 to x7 registers and control is give=
n back
-+to the U-Boot FF-A driver (non-secure world).
-+
-+The driver reads the response and processes it accordingly.
-+
-+This methodology applies to all the FF-A ABIs in the driver.
-+
-+FF-A bus discovery in U-Boot
-+-------------------------------------------
-+
-+When CONFIG_ARM_FFA_TRANSPORT is enabled, the FF-A bus is discovered on
-+demand by the clients (users).
-+
-+Clients can discover the FF-A bus using ffa_bus_discover() API which tr=
iggers the
-+discovery process.
-+
-+ffa_bus_discover() creates, binds and probes the arm_ffa device using
-+device_{bind, probe} APIs.
-+
-+The discovery process consists in communicating with secure world (or h=
ypervisor)
-+and querying specific data.
-+
-+The discovery process takes place during the arm_ffa device probing whi=
ch is
-+handled by ffa_probe().
-+
-+The FF-A bus discovery is successful and the bus is ready for use when =
these
-+operations succeed:
-+
-+- querying the FF-A framework version
-+- querying from secure world the U-Boot endpoint ID
-+- querying from secure world the RX/TX mapping  features
-+- mapping the RX/TX buffers
-+- querying from secure world all the partitions information
-+
-+Discovery failure results in a probing failure and the arm_ffa device i=
s
-+destroyed.
-+
-+Requirements for clients
-+-------------------------------------
-+
-+When using the FF-A bus with EFI, clients must:
-+
-+- Query SPs in EFI boot time mode using the service UUID.
-+- Unmap RX/TX buffers before EFI runtime mode starts.
-+
-+The RX/TX buffers are only available at EFI boot time. Querying partiti=
ons is
-+done at boot time and data is cached for future use.
-+
-+RX/TX buffers should be unmapped by the user before EFI runtime mode
-+starts. The driver provides a bus operation for that: rxtx_unmap()
-+
-+If  RX/TX buffers created by U-Boot are not unmapped and by
-+consequence becoming available at EFI runtime, secure world will get co=
nfused
-+about RX/TX buffers ownership (U-Boot vs kernel).
-+
-+When invoking FF-A direct messaging, clients should specify which ABI p=
rotocol
-+they want to use (32-bit vs 64-bit). Selecting the protocol means using
-+the 32-bit or 64-bit version of FFA_MSG_SEND_DIRECT_{REQ, RESP}.
-+The calling convention stays the same: SMC32.
-+
-+The bus driver layer
-+------------------------------
-+
-+The driver comes on top of the SMCCC layer and is implemented in
-+drivers/firmware/arm-ffa/core.c
-+
-+The driver provides the following features:
-+
-+- Support for the 32-bit version of the following ABIs:
-+
-+FFA_VERSION
-+FFA_ID_GET
-+FFA_FEATURES
-+FFA_PARTITION_INFO_GET
-+FFA_RXTX_UNMAP
-+FFA_RX_RELEASE
-+FFA_RUN
-+FFA_ERROR
-+FFA_SUCCESS
-+FFA_INTERRUPT
-+FFA_MSG_SEND_DIRECT_REQ
-+FFA_MSG_SEND_DIRECT_RESP
-+
-+- Support for the 64-bit version of the following ABIs:
-+
-+FFA_RXTX_MAP
-+FFA_MSG_SEND_DIRECT_REQ
-+FFA_MSG_SEND_DIRECT_RESP
-+
-+- Processing the received data from the secure world/hypervisor and cac=
hing it
-+
-+- Hiding from upper layers the FF-A protocol and registers details. Upp=
er
-+  layers focus on exchanged data, the driver takes care of how to trans=
port
-+  that to the secure world/hypervisor using FF-A
-+
-+- The driver provides callbacks to be used by clients to access the FF-=
A bus:
-+
-+partition_info_get
-+sync_send_receive
-+rxtx_unmap
-+
-+- FF-A bus discovery makes sure FF-A framework is responsive and compat=
ible
-+  with the driver
-+
-+- FF-A bus can be compiled and used without EFI
-+
-+Using armffa command
-+-----------------------------------
-+
-+armffa is an implementation defined command showcasing how to use the F=
F-A driver and how to invoke
-+its operations.
-+
-+This provides a guidance to the client developers on how to call the FF=
-A bus
-+interfaces.
-+
-+Usage:
-+
-+armffa <sub-command> <arguments>
-+
-+sub-commands:
-+
-+        getpart <partition UUID>
-+
-+            lists the partition(s) info
-+
-+        ping <partition ID>
-+
-+            sends a data pattern to the specified partition
-+
-+        devlist
-+
-+            displays the arm_ffa device info
-+
-+Contributors
-+------------
-+   * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-diff --git a/doc/arch/index.rst b/doc/arch/index.rst
-index b3e85f9bf3..cf1cfc9287 100644
---- a/doc/arch/index.rst
-+++ b/doc/arch/index.rst
-@@ -8,6 +8,7 @@ Architecture-specific doc
-=20
-    arc
-    arm64
-+   arm64.ffa
-    m68k
-    mips
-    nios2
-diff --git a/drivers/Kconfig b/drivers/Kconfig
-index 75ac149d31..ff75b7c3f8 100644
---- a/drivers/Kconfig
-+++ b/drivers/Kconfig
-@@ -6,6 +6,8 @@ source "drivers/core/Kconfig"
-=20
- source "drivers/adc/Kconfig"
-=20
-+source "drivers/firmware/arm-ffa/Kconfig"
-+
- source "drivers/ata/Kconfig"
-=20
- source "drivers/axi/Kconfig"
-diff --git a/drivers/Makefile b/drivers/Makefile
-index 6f1de58e00..28c8f538c8 100644
---- a/drivers/Makefile
-+++ b/drivers/Makefile
-@@ -112,6 +112,7 @@ obj-y +=3D iommu/
- obj-y +=3D smem/
- obj-y +=3D thermal/
- obj-$(CONFIG_TEE) +=3D tee/
-+obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D firmware/arm-ffa/
- obj-y +=3D axi/
- obj-y +=3D ufs/
- obj-$(CONFIG_W1) +=3D w1/
-diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-new file mode 100644
-index 0000000000..e4914b9bc7
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/Kconfig
-@@ -0,0 +1,30 @@
-+# SPDX-License-Identifier: GPL-2.0
-+
-+config ARM_FFA_TRANSPORT
-+	bool "Enable Arm Firmware Framework for Armv8-A driver"
-+	depends on DM && ARM64
-+	select ARM_SMCCC
-+	select LIB_UUID
-+	select DEVRES
-+	help
-+	  The Firmware Framework for Arm A-profile processors (FF-A)
-+	  describes interfaces (ABIs) that standardize communication
-+	  between the Secure World and Normal World leveraging TrustZone
-+	  technology.
-+
-+	  This driver is based on FF-A specification v1.0 and uses SMC32
-+	  calling convention.
-+
-+	  FF-A specification:
-+
-+	  https://developer.arm.com/documentation/den0077/a/?lang=3Den
-+
-+	  In U-Boot FF-A design, FF-A is considered as a discoverable bus.
-+	  The Secure World is considered as one entity to communicate with
-+	  using the FF-A bus.
-+	  FF-A communication is handled by one device and one instance (the bu=
s).
-+	  This FF-A driver takes care of all the interactions between Normal w=
orld
-+	  and Secure World.
-+
-+	  For more details about the FF-A driver, please refer to doc/arch/arm=
64.ffa.rst
-+
-diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
-new file mode 100644
-index 0000000000..043a8915be
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/Makefile
-@@ -0,0 +1,6 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# (C) Copyright 2022
-+# Abdellatif El Khlifi, Arm Limited, abdellatif.elkhlifi@arm.com.
-+
-+obj-y +=3D arm-ffa-uclass.o core.o
-diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
-new file mode 100644
-index 0000000000..7d9695d289
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
-@@ -0,0 +1,16 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <asm/global_data.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+UCLASS_DRIVER(ffa) =3D {
-+	.name		=3D "ffa",
-+	.id		=3D UCLASS_FFA,
-+};
-diff --git a/drivers/firmware/arm-ffa/arm_ffa_prv.h b/drivers/firmware/a=
rm-ffa/arm_ffa_prv.h
-new file mode 100644
-index 0000000000..4eea7dc036
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/arm_ffa_prv.h
-@@ -0,0 +1,200 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __ARM_FFA_PRV_H
-+#define __ARM_FFA_PRV_H
-+
-+#include <arm_ffa.h>
-+#include <linux/bitfield.h>
-+#include <linux/bitops.h>
-+#include <linux/arm-smccc.h>
-+
-+/*
-+ * This header is private. It is exclusively used by the FF-A driver
-+ */
-+
-+/* FF-A core driver name */
-+#define FFA_DRV_NAME "arm_ffa"
-+
-+/* FF-A driver version definitions */
-+
-+#define MAJOR_VERSION_MASK		GENMASK(30, 16)
-+#define MINOR_VERSION_MASK		GENMASK(15, 0)
-+#define GET_FFA_MAJOR_VERSION(x)		\
-+				((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
-+#define GET_FFA_MINOR_VERSION(x)		\
-+				((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
-+#define PACK_VERSION_INFO(major, minor)			\
-+	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
-+	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
-+
-+#define FFA_MAJOR_VERSION		(1)
-+#define FFA_MINOR_VERSION		(0)
-+#define FFA_VERSION_1_0		\
-+			PACK_VERSION_INFO(FFA_MAJOR_VERSION, FFA_MINOR_VERSION)
-+
-+/* Endpoint ID mask (u-boot endpoint ID) */
-+
-+#define GET_SELF_ENDPOINT_ID_MASK		GENMASK(15, 0)
-+#define GET_SELF_ENDPOINT_ID(x)		\
-+			((u16)(FIELD_GET(GET_SELF_ENDPOINT_ID_MASK, (x))))
-+
-+#define PREP_SELF_ENDPOINT_ID_MASK		GENMASK(31, 16)
-+#define PREP_SELF_ENDPOINT_ID(x)		\
-+			(FIELD_PREP(PREP_SELF_ENDPOINT_ID_MASK, (x)))
-+
-+/* Partition endpoint ID mask  (partition with which u-boot communicate=
s with) */
-+
-+#define PREP_PART_ENDPOINT_ID_MASK		GENMASK(15, 0)
-+#define PREP_PART_ENDPOINT_ID(x)		\
-+			(FIELD_PREP(PREP_PART_ENDPOINT_ID_MASK, (x)))
-+
-+/*
-+ * Definitions of the Arm FF-A interfaces supported by the Arm FF-A dri=
ver
-+ */
-+
-+#define FFA_SMC(calling_convention, func_num)				\
-+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
-+			   ARM_SMCCC_OWNER_STANDARD, (func_num))
-+
-+#define FFA_SMC_32(func_num)				FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
-+#define FFA_SMC_64(func_num)				FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
-+
-+enum ffa_abis {
-+	FFA_ERROR                 =3D 0x60,
-+	FFA_SUCCESS               =3D 0x61,
-+	FFA_INTERRUPT             =3D 0x62,
-+	FFA_VERSION               =3D 0x63,
-+	FFA_FEATURES              =3D 0x64,
-+	FFA_RX_RELEASE            =3D 0x65,
-+	FFA_RXTX_MAP              =3D 0x66,
-+	FFA_RXTX_UNMAP            =3D 0x67,
-+	FFA_PARTITION_INFO_GET    =3D 0x68,
-+	FFA_ID_GET                =3D 0x69,
-+	FFA_RUN                   =3D 0x6D,
-+	FFA_MSG_SEND_DIRECT_REQ   =3D 0x6F,
-+	FFA_MSG_SEND_DIRECT_RESP  =3D 0x70,
-+
-+	/* to be updated when adding new FFA IDs */
-+	FFA_FIRST_ID              =3D FFA_ERROR, /* lowest number ID*/
-+	FFA_LAST_ID               =3D FFA_MSG_SEND_DIRECT_RESP, /* highest num=
ber ID*/
-+};
-+
-+enum ffa_abi_errcode {
-+	NOT_SUPPORTED =3D 1,
-+	INVALID_PARAMETERS,
-+	NO_MEMORY,
-+	BUSY,
-+	INTERRUPTED,
-+	DENIED,
-+	RETRY,
-+	ABORTED,
-+	MAX_NUMBER_FFA_ERR
-+};
-+
-+/* container structure and helper macros to map between an FF-A error a=
nd relevant error log */
-+struct ffa_abi_errmap {
-+	char *err_str[MAX_NUMBER_FFA_ERR];
-+};
-+
-+#define FFA_ERRMAP_COUNT (FFA_LAST_ID - FFA_FIRST_ID + 1)
-+#define FFA_ID_TO_ERRMAP_ID(ffa_id) ((ffa_id) - FFA_FIRST_ID)
-+
-+/* The FF-A SMC function definitions */
-+
-+typedef struct arm_smccc_1_2_regs ffa_value_t;
-+typedef void (*invoke_ffa_fn_t)(ffa_value_t args, ffa_value_t *res);
-+
-+/*
-+ * struct ffa_partition_uuid - 16 bytes UUID transmitted by FFA_PARTITI=
ON_INFO_GET
-+ * @a1-4:	32-bit words access to the UUID data
-+ *
-+ */
-+struct ffa_partition_uuid {
-+	u32 a1; /* w1 */
-+	u32 a2; /* w2 */
-+	u32 a3; /* w3 */
-+	u32 a4; /* w4 */
-+};
-+
-+/**
-+ * enum ffa_rxtx_buf_sizes - minimum sizes supported
-+ * for the RX/TX buffers
-+ */
-+enum ffa_rxtx_buf_sizes {
-+	RXTX_4K,
-+	RXTX_64K,
-+	RXTX_16K
-+};
-+
-+/**
-+ * struct ffa_rxtxpair - structure hosting the RX/TX buffers virtual ad=
dresses
-+ * @rxbuf:	virtual address of the RX buffer
-+ * @txbuf:	virtual address of the TX buffer
-+ * @rxtx_min_pages:	RX/TX buffers minimum size in pages
-+ *
-+ * Data structure hosting the virtual addresses of the mapped RX/TX buf=
fers
-+ * These addresses are used by the FF-A functions that use the RX/TX bu=
ffers
-+ */
-+struct ffa_rxtxpair {
-+	u64 rxbuf; /* virtual address */
-+	u64 txbuf; /* virtual address */
-+	size_t rxtx_min_pages; /* minimum number of pages in each of the RX/TX=
 buffers */
-+};
-+
-+/**
-+ * struct ffa_partition_desc - the secure partition descriptor
-+ * @info:	partition information
-+ * @sp_uuid:	the secure partition UUID
-+ *
-+ * Each partition has its descriptor containing the partitions informat=
ion and the UUID
-+ */
-+struct ffa_partition_desc {
-+	struct ffa_partition_info info;
-+	struct ffa_partition_uuid sp_uuid;
-+};
-+
-+/**
-+ * struct ffa_partitions - descriptors for all secure partitions
-+ * @count:	The number of partitions descriptors
-+ * @descs	The partitions descriptors table
-+ *
-+ * This data structure contains the partitions descriptors table
-+ */
-+struct ffa_partitions {
-+	u32 count;
-+	struct ffa_partition_desc *descs; /* virtual address */
-+};
-+
-+/**
-+ * struct ffa_prvdata - the driver private data structure
-+ *
-+ * @dev:	The arm_ffa device under u-boot driver model
-+ * @ffa_ops:	The driver operations structure
-+ * @fwk_version:	FF-A framework version
-+ * @id:	u-boot endpoint ID
-+ * @partitions:	The partitions descriptors structure
-+ * @pair:	The RX/TX buffers pair
-+ * @invoke_ffa_fn:	The function executing the FF-A function
-+ *
-+ * The driver data structure hosting all resident data.
-+ */
-+struct ffa_prvdata {
-+	struct udevice *dev;
-+	struct ffa_bus_ops ffa_ops;
-+	u32 fwk_version;
-+	u16 id;
-+	struct ffa_partitions partitions;
-+	struct ffa_rxtxpair pair;
-+	invoke_ffa_fn_t invoke_ffa_fn;
-+};
-+
-+/**
-+ * ffa_bus_prvdata_get - bus driver private data getter
-+ */
-+struct ffa_prvdata *ffa_bus_prvdata_get(void);
-+
-+#endif
-diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/=
core.c
-new file mode 100644
-index 0000000000..0b1f8e6a07
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/core.c
-@@ -0,0 +1,1315 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include "arm_ffa_prv.h"
-+#include <asm/global_data.h>
-+#include <common.h>
-+#include <dm.h>
-+#include <dm/device-internal.h>
-+#include <dm/devres.h>
-+#include <dm/root.h>
-+#include <linux/errno.h>
-+#include <linux/sizes.h>
-+#include <log.h>
-+#include <malloc.h>
-+#include <string.h>
-+#include <uuid.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+/**
-+ * The device private data structure containing all the
-+ * data read from secure world
-+ */
-+struct ffa_prvdata *ffa_priv_data;
-+
-+/* Error mapping declarations */
-+
-+int ffa_to_std_errmap[MAX_NUMBER_FFA_ERR] =3D {
-+	[NOT_SUPPORTED] =3D -EOPNOTSUPP,
-+	[INVALID_PARAMETERS] =3D -EINVAL,
-+	[NO_MEMORY] =3D -ENOMEM,
-+	[BUSY] =3D -EBUSY,
-+	[INTERRUPTED] =3D -EINTR,
-+	[DENIED] =3D -EACCES,
-+	[RETRY] =3D -EAGAIN,
-+	[ABORTED] =3D -ECANCELED,
-+};
-+
-+struct ffa_abi_errmap err_msg_map[FFA_ERRMAP_COUNT] =3D {
-+	[FFA_ID_TO_ERRMAP_ID(FFA_VERSION)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: A Firmware Framework implementation does not exist",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_ID_GET)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_FEATURES)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: FFA_RXTX_MAP is not implemented at this FF-A instanc=
e",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_PARTITION_INFO_GET)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
-+			[INVALID_PARAMETERS] =3D
-+			"INVALID_PARAMETERS: Unrecognized UUID",
-+			[NO_MEMORY] =3D
-+			"NO_MEMORY: Results cannot fit in RX buffer of the caller",
-+			[BUSY] =3D
-+			"BUSY: RX buffer of the caller is not free",
-+			[DENIED] =3D
-+			"DENIED: Callee is not in a state to handle this request",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_RXTX_UNMAP)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: FFA_RXTX_UNMAP is not implemented at this FF-A insta=
nce",
-+			[INVALID_PARAMETERS] =3D
-+			"INVALID_PARAMETERS: No buffer pair registered on behalf of the call=
er",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_RX_RELEASE)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: FFA_RX_RELEASE is not implemented at this FF-A insta=
nce",
-+			[DENIED] =3D
-+			"DENIED: Caller did not have ownership of the RX buffer",
-+		},
-+	},
-+	[FFA_ID_TO_ERRMAP_ID(FFA_RXTX_MAP)] =3D {
-+		{
-+			[NOT_SUPPORTED] =3D
-+			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
-+			[INVALID_PARAMETERS] =3D
-+			"INVALID_PARAMETERS: Field(s) in input parameters incorrectly encode=
d",
-+			[NO_MEMORY] =3D
-+			"NO_MEMORY: Not enough memory",
-+			[DENIED] =3D
-+			"DENIED: Buffer pair already registered",
-+		},
-+	},
-+};
-+
-+/**
-+ * ffa_to_std_errno - convert FF-A error code to standard error code
-+ * @ffa_errno:	Error code returned by the FF-A ABI
-+ *
-+ * This function maps the given FF-A error code as specified
-+ * by the spec to a u-boot standard error code.
-+ *
-+ * Return:
-+ *
-+ * The standard error code on success. . Otherwise, failure
-+ */
-+int ffa_to_std_errno(int ffa_errno)
-+{
-+	int err_idx =3D -ffa_errno;
-+
-+	/* map the FF-A error code to the standard u-boot error code */
-+	if (err_idx > 0 && err_idx < MAX_NUMBER_FFA_ERR)
-+		return ffa_to_std_errmap[err_idx];
-+	return -EINVAL;
-+}
-+
-+/**
-+ * ffa_print_error_log - print the error log corresponding to the selec=
ted FF-A ABI
-+ * @ffa_id:	FF-A ABI ID
-+ * @ffa_errno:	Error code returned by the FF-A ABI
-+ *
-+ * This function maps the FF-A error code to the error log relevant to =
the
-+ * selected FF-A ABI. Then the error log is printed.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. . Otherwise, failure
-+ */
-+int ffa_print_error_log(u32 ffa_id, int ffa_errno)
-+{
-+	int err_idx =3D -ffa_errno, abi_idx =3D 0;
-+
-+	/* map the FF-A error code to the corresponding error log */
-+
-+	if (err_idx <=3D 0 || err_idx >=3D MAX_NUMBER_FFA_ERR)
-+		return -EINVAL;
-+
-+	if (ffa_id < FFA_FIRST_ID || ffa_id > FFA_LAST_ID)
-+		return -EINVAL;
-+
-+	abi_idx =3D FFA_ID_TO_ERRMAP_ID(ffa_id);
-+	if (abi_idx < 0 || abi_idx >=3D FFA_ERRMAP_COUNT)
-+		return -EINVAL;
-+
-+	if (!err_msg_map[abi_idx].err_str[err_idx])
-+		return -EINVAL;
-+
-+	ffa_err("%s", err_msg_map[abi_idx].err_str[err_idx]);
-+
-+	return 0;
-+}
-+
-+/*
-+ * Driver core functions
-+ */
-+
-+/**
-+ * ffa_remove_device - removes the arm_ffa device
-+ * @dev:	the device to be removed
-+ *
-+ * This function makes sure the arm_ffa device is removed
-+ * No need to free the kmalloced data when the device is destroyed.
-+ * It's automatically done by devm management by
-+ * device_remove() -> device_free() -> devres_release_probe().
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_remove_device(struct udevice *dev)
-+{
-+	int ret;
-+
-+	if (!dev) {
-+		ffa_err("no udevice found");
-+		return -ENODEV;
-+	}
-+
-+	ret =3D device_remove(dev, DM_REMOVE_NORMAL);
-+	if (ret) {
-+		ffa_err("unable to remove. err:%d\n", ret);
-+		return ret;
-+	}
-+
-+	ffa_info("device removed and freed");
-+
-+	ret =3D device_unbind(dev);
-+	if (ret) {
-+		ffa_err("unable to unbind. err:%d\n", ret);
-+		return ret;
-+	}
-+
-+	ffa_info("device unbound");
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_device_get - create, bind and probe the arm_ffa device
-+ * @pdev: the address of a device pointer (to be filled when the arm_ff=
a bus device is created
-+ *       successfully)
-+ *
-+ * This function makes sure the arm_ffa device is
-+ * created, bound to this driver, probed and ready to use.
-+ * Arm FF-A transport is implemented through a single U-Boot
-+ * device managing the FF-A bus (arm_ffa).
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_device_get(struct udevice **pdev)
-+{
-+	int ret;
-+	struct udevice *dev =3D NULL;
-+
-+	ret =3D device_bind(dm_root(), DM_DRIVER_GET(arm_ffa), FFA_DRV_NAME, N=
ULL, ofnode_null(),
-+			  &dev);
-+	if (ret)
-+		return ret;
-+
-+	/* The FF-A bus discovery succeeds when probing is successful */
-+	ret =3D device_probe(dev);
-+	if (ret) {
-+		ffa_err("arm_ffa device probing failed");
-+		ffa_remove_device(dev);
-+		return ret;
-+	}
-+
-+	if (pdev)
-+		*pdev =3D dev;
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_get_version - FFA_VERSION handler function
-+ *
-+ * This function implements FFA_VERSION FF-A function
-+ * to get from the secure world the FF-A framework version
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_get_version(void)
-+{
-+	u16 major, minor;
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+
-+	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_VERSION), .a1 =3D FFA_VERSION_1_0,
-+			}, &res);
-+
-+	ffa_errno =3D res.a0;
-+	if (ffa_errno < 0) {
-+		ffa_print_error_log(FFA_VERSION, ffa_errno);
-+		return ffa_to_std_errno(ffa_errno);
-+	}
-+
-+	major =3D GET_FFA_MAJOR_VERSION(res.a0);
-+	minor =3D GET_FFA_MINOR_VERSION(res.a0);
-+
-+	ffa_info("FF-A driver %d.%d\nFF-A framework %d.%d",
-+		 FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
-+
-+	if ((major =3D=3D FFA_MAJOR_VERSION && minor >=3D FFA_MINOR_VERSION)) =
{
-+		ffa_info("Versions are compatible ");
-+
-+		ffa_priv_data->fwk_version =3D res.a0;
-+
-+		return 0;
-+	}
-+
-+	ffa_err("versions are incompatible\nExpected: %d.%d , Found: %d.%d\n",
-+		FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
-+
-+	return -EPROTONOSUPPORT;
-+}
-+
-+/**
-+ * ffa_get_endpoint_id - FFA_ID_GET handler function
-+ *
-+ * This function implements FFA_ID_GET FF-A function
-+ * to get from the secure world u-boot endpoint ID
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_get_endpoint_id(void)
-+{
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+
-+	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_ID_GET),
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-+		ffa_priv_data->id =3D GET_SELF_ENDPOINT_ID((u32)res.a2);
-+		ffa_info("endpoint ID is %u", ffa_priv_data->id);
-+
-+		return 0;
-+	}
-+
-+	ffa_errno =3D res.a2;
-+
-+	ffa_print_error_log(FFA_ID_GET, ffa_errno);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_set_rxtx_buffers_pages_cnt - sets the minimum number of pages in=
 each of the RX/TX buffers
-+ * @prop_field: properties field obtained from FFA_FEATURES ABI
-+ *
-+ * This function sets the minimum number of pages
-+ *  in each of the RX/TX buffers in the private data structure
-+ *
-+ * Return:
-+ *
-+ * buf_4k_pages points to the returned number of pages
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_set_rxtx_buffers_pages_cnt(u32 prop_field)
-+{
-+	if (!ffa_priv_data)
-+		return -EINVAL;
-+
-+	switch (prop_field) {
-+	case RXTX_4K:
-+		ffa_priv_data->pair.rxtx_min_pages =3D 1;
-+		break;
-+	case RXTX_16K:
-+		ffa_priv_data->pair.rxtx_min_pages =3D 4;
-+		break;
-+	case RXTX_64K:
-+		ffa_priv_data->pair.rxtx_min_pages =3D 16;
-+		break;
-+	default:
-+		ffa_err("RX/TX buffer size not supported");
-+		return -EINVAL;
-+	}
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_get_rxtx_map_features - FFA_FEATURES handler function with FFA_R=
XTX_MAP argument
-+ *
-+ * This function implements FFA_FEATURES FF-A function
-+ * to retrieve the FFA_RXTX_MAP features
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_get_rxtx_map_features(void)
-+{
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+
-+	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_FEATURES),
-+			.a1 =3D FFA_SMC_64(FFA_RXTX_MAP),
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS))
-+		return ffa_set_rxtx_buffers_pages_cnt(res.a2);
-+
-+	ffa_errno =3D res.a2;
-+	ffa_print_error_log(FFA_FEATURES, ffa_errno);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_free_rxtx_buffers - frees the RX/TX buffers
-+ *
-+ * This  function  frees the RX/TX buffers
-+ *
-+ */
-+static void ffa_free_rxtx_buffers(void)
-+{
-+	ffa_info("Freeing RX/TX buffers");
-+
-+	if (ffa_priv_data->pair.rxbuf) {
-+		free((void *)ffa_priv_data->pair.rxbuf);
-+		ffa_priv_data->pair.rxbuf =3D 0;
-+	}
-+
-+	if (ffa_priv_data->pair.txbuf) {
-+		free((void *)ffa_priv_data->pair.txbuf);
-+		ffa_priv_data->pair.txbuf =3D 0;
-+	}
-+}
-+
-+/**
-+ * ffa_alloc_rxtx_buffers - allocates the RX/TX buffers
-+ *
-+ * This function is used by ffa_map_rxtx_buffers to allocate
-+ * the RX/TX buffers before mapping them. The allocated memory is physi=
cally
-+ * contiguous since memalign ends up calling malloc which allocates
-+ * contiguous memory in u-boot.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_alloc_rxtx_buffers(void)
-+{
-+	u64 bytes;
-+
-+	ffa_info("Using %lu 4KB page(s) for RX/TX buffers size",
-+		 ffa_priv_data->pair.rxtx_min_pages);
-+
-+	bytes =3D ffa_priv_data->pair.rxtx_min_pages * SZ_4K;
-+
-+	/*
-+	 * The alignment of the RX and TX buffers must be equal
-+	 * to the larger translation granule size
-+	 */
-+
-+	ffa_priv_data->pair.rxbuf =3D (u64)memalign(bytes, bytes);
-+	if (!ffa_priv_data->pair.rxbuf) {
-+		ffa_err("failure to allocate RX buffer");
-+		return -ENOBUFS;
-+	}
-+
-+	ffa_info("RX buffer at virtual address 0x%llx", ffa_priv_data->pair.rx=
buf);
-+
-+	ffa_priv_data->pair.txbuf =3D (u64)memalign(bytes, bytes);
-+	if (!ffa_priv_data->pair.txbuf) {
-+		free((void *)ffa_priv_data->pair.rxbuf);
-+		ffa_priv_data->pair.rxbuf =3D 0;
-+		ffa_err("failure to allocate the TX buffer");
-+		return -ENOBUFS;
-+	}
-+
-+	ffa_info("TX buffer at virtual address 0x%llx", ffa_priv_data->pair.tx=
buf);
-+
-+	/*
-+	 * make sure the buffers are cleared before use
-+	 */
-+	memset((void *)ffa_priv_data->pair.rxbuf, 0, bytes);
-+	memset((void *)ffa_priv_data->pair.txbuf, 0, bytes);
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_map_rxtx_buffers - FFA_RXTX_MAP handler function
-+ *
-+ * This function implements FFA_RXTX_MAP FF-A function
-+ * to map the RX/TX buffers
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_map_rxtx_buffers(void)
-+{
-+	int ret;
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+
-+	ret =3D ffa_alloc_rxtx_buffers();
-+	if (ret)
-+		return ret;
-+
-+	/*
-+	 * we need to pass the physical addresses of the RX/TX buffers
-+	 * in u-boot physical/virtual mapping is 1:1
-+	 * no need to convert from virtual to physical
-+	 */
-+
-+	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_64(FFA_RXTX_MAP),
-+			.a1 =3D ffa_priv_data->pair.txbuf,
-+			.a2 =3D ffa_priv_data->pair.rxbuf,
-+			.a3 =3D ffa_priv_data->pair.rxtx_min_pages,
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-+		ffa_info("RX/TX buffers mapped");
-+		return 0;
-+	}
-+
-+	ffa_errno =3D res.a2;
-+	ffa_print_error_log(FFA_RXTX_MAP, ffa_errno);
-+
-+	ffa_free_rxtx_buffers();
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_unmap_rxtx_buffers - FFA_RXTX_UNMAP handler function
-+ *	@dev: The arm_ffa bus device
-+ *
-+ * This function implements FFA_RXTX_UNMAP FF-A function
-+ * to unmap the RX/TX buffers
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_unmap_rxtx_buffers(struct udevice *dev)
-+{
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+
-+	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_RXTX_UNMAP),
-+			.a1 =3D PREP_SELF_ENDPOINT_ID(ffa_priv_data->id),
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-+		ffa_free_rxtx_buffers();
-+		return 0;
-+	}
-+
-+	ffa_errno =3D res.a2;
-+	ffa_print_error_log(FFA_RXTX_UNMAP, ffa_errno);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_release_rx_buffer - FFA_RX_RELEASE handler function
-+ *
-+ * This function invokes FFA_RX_RELEASE FF-A function
-+ * to release the ownership of the RX buffer
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_release_rx_buffer(void)
-+{
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+
-+	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_RX_RELEASE),
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS))
-+		return 0;
-+
-+	ffa_errno =3D res.a2;
-+	ffa_print_error_log(FFA_RX_RELEASE, ffa_errno);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_uuid_are_identical - checks whether two given UUIDs are identica=
l
-+ * @uuid1: first UUID
-+ * @uuid2: second UUID
-+ *
-+ * This function is used by ffa_read_partitions_info to search
-+ * for a UUID in the partitions descriptors table
-+ *
-+ * Return:
-+ *
-+ * 1 when UUIDs match. Otherwise, 0
-+ */
-+bool ffa_uuid_are_identical(const struct ffa_partition_uuid *uuid1,
-+			    const struct ffa_partition_uuid *uuid2)
-+{
-+	if (!uuid1 || !uuid2)
-+		return 0;
-+
-+	return !memcmp(uuid1, uuid2, sizeof(struct ffa_partition_uuid));
-+}
-+
-+/**
-+ * ffa_read_partitions_info - reads the data queried by FFA_PARTITION_I=
NFO_GET
-+ *							and saves it in the private structure
-+ * @count: The number of partitions queried
-+ * @part_uuid: Pointer to the partition(s) UUID
-+ *
-+ * This function reads the partitions information
-+ * returned by the FFA_PARTITION_INFO_GET and saves it in the private
-+ * data structure.
-+ *
-+ * Return:
-+ *
-+ * The private data structure is updated with the partition(s) informat=
ion
-+ * 0 is returned on success. Otherwise, failure
-+ */
-+static int ffa_read_partitions_info(u32 count, struct ffa_partition_uui=
d *part_uuid)
-+{
-+	if (!count) {
-+		ffa_err("no partition detected");
-+		return -ENODATA;
-+	}
-+
-+	ffa_info("Reading partitions data from the RX buffer");
-+
-+	if (!part_uuid) {
-+		/*
-+		 * querying information of all partitions
-+		 */
-+		u64 buf_bytes;
-+		u64 data_bytes;
-+		u32 desc_idx;
-+		struct ffa_partition_info *parts_info;
-+
-+		data_bytes =3D count * sizeof(struct ffa_partition_desc);
-+
-+		buf_bytes =3D ffa_priv_data->pair.rxtx_min_pages * SZ_4K;
-+
-+		if (data_bytes > buf_bytes) {
-+			ffa_err("partitions data size exceeds the RX buffer size:");
-+			ffa_err("    sizes in bytes: data %llu , RX buffer %llu ",
-+				data_bytes,
-+				buf_bytes);
-+
-+			return -ENOMEM;
-+		}
-+
-+		ffa_priv_data->partitions.descs =3D devm_kmalloc(ffa_priv_data->dev, =
data_bytes,
-+							       __GFP_ZERO);
-+		if (!ffa_priv_data->partitions.descs) {
-+			ffa_err("cannot  allocate partitions data buffer");
-+			return -ENOMEM;
-+		}
-+
-+		parts_info =3D (struct ffa_partition_info *)ffa_priv_data->pair.rxbuf=
;
-+
-+		for (desc_idx =3D 0 ; desc_idx < count ; desc_idx++) {
-+			ffa_priv_data->partitions.descs[desc_idx].info =3D
-+				parts_info[desc_idx];
-+
-+			ffa_info("Partition ID %x : info cached",
-+				 ffa_priv_data->partitions.descs[desc_idx].info.id);
-+		}
-+
-+		ffa_priv_data->partitions.count =3D count;
-+
-+		ffa_info("%d partition(s) found and cached", count);
-+
-+	} else {
-+		u32 rx_desc_idx, cached_desc_idx;
-+		struct ffa_partition_info *parts_info;
-+		u8 desc_found;
-+
-+		parts_info =3D (struct ffa_partition_info *)ffa_priv_data->pair.rxbuf=
;
-+
-+		/*
-+		 * search for the SP IDs read from the RX buffer
-+		 * in the already cached SPs.
-+		 * Update the UUID when ID found.
-+		 */
-+		for (rx_desc_idx =3D 0; rx_desc_idx < count ; rx_desc_idx++) {
-+			desc_found =3D 0;
-+
-+			/*
-+			 * search the current ID in the cached partitions
-+			 */
-+			for (cached_desc_idx =3D 0;
-+			     cached_desc_idx < ffa_priv_data->partitions.count;
-+			     cached_desc_idx++) {
-+				/*
-+				 * save the UUID
-+				 */
-+				if (ffa_priv_data->partitions.descs[cached_desc_idx].info.id =3D=3D
-+				    parts_info[rx_desc_idx].id) {
-+					ffa_priv_data->partitions.descs[cached_desc_idx].sp_uuid =3D
-+						*part_uuid;
-+
-+					desc_found =3D 1;
-+					break;
-+				}
-+			}
-+
-+			if (!desc_found)
-+				return -ENODATA;
-+		}
-+	}
-+
-+	return  0;
-+}
-+
-+/**
-+ * ffa_query_partitions_info - invokes FFA_PARTITION_INFO_GET and saves=
 partitions data
-+ *
-+ * @part_uuid: Pointer to the partition(s) UUID
-+ * @pcount: Pointer to the number of partitions variable filled when qu=
erying
-+ *
-+ * This function executes the FFA_PARTITION_INFO_GET
-+ * to query the partitions data. Then, it calls ffa_read_partitions_inf=
o
-+ * to save the data in the private data structure.
-+ *
-+ * After reading the data the RX buffer is released using ffa_release_r=
x_buffer
-+ *
-+ * Return:
-+ *
-+ * When part_uuid is NULL, all partitions data are retrieved from secur=
e world
-+ * When part_uuid is non NULL, data for partitions matching the given U=
UID are
-+ * retrieved and the number of partitions is returned
-+ * 0 is returned on success. Otherwise, failure
-+ */
-+static int ffa_query_partitions_info(struct ffa_partition_uuid *part_uu=
id,
-+				     u32 *pcount)
-+{
-+	struct ffa_partition_uuid query_uuid =3D {0};
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+
-+	/*
-+	 * If a UUID is specified. Information for one or more
-+	 * partitions in the system is queried. Otherwise, information
-+	 * for all installed partitions is queried
-+	 */
-+
-+	if (part_uuid) {
-+		if (!pcount)
-+			return -EINVAL;
-+
-+		query_uuid =3D *part_uuid;
-+	} else if (pcount) {
-+		return -EINVAL;
-+	}
-+
-+	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_PARTITION_INFO_GET),
-+			.a1 =3D query_uuid.a1,
-+			.a2 =3D query_uuid.a2,
-+			.a3 =3D query_uuid.a3,
-+			.a4 =3D query_uuid.a4,
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-+		int ret;
-+
-+		/*
-+		 * res.a2 contains the count of partition information descriptors
-+		 * populated in the RX buffer
-+		 */
-+		if (res.a2) {
-+			ret =3D ffa_read_partitions_info((u32)res.a2, part_uuid);
-+			if (ret) {
-+				ffa_err("failed to read partition(s) data , error (%d)", ret);
-+				ffa_release_rx_buffer();
-+				return -EINVAL;
-+			}
-+		}
-+
-+		/*
-+		 * return the SP count (when querying using a UUID)
-+		 */
-+		if (pcount)
-+			*pcount =3D (u32)res.a2;
-+
-+		/*
-+		 * After calling FFA_PARTITION_INFO_GET the buffer ownership
-+		 * is assigned to the consumer (u-boot). So, we need to give
-+		 * the ownership back to the SPM or hypervisor
-+		 */
-+		ret =3D ffa_release_rx_buffer();
-+
-+		return ret;
-+	}
-+
-+	ffa_errno =3D res.a2;
-+	ffa_print_error_log(FFA_PARTITION_INFO_GET, ffa_errno);
-+
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * ffa_get_partitions_info - FFA_PARTITION_INFO_GET handler function
-+ *
-+ * The passed arguments:
-+ * Mode 1: When getting from the driver the number of
-+ *	secure partitions:
-+ *	@uuid_str: pointer to the UUID string
-+ *	@sp_count: pointer to the variable that contains the number of parti=
tions
-+ *			 The variable will be set by the driver
-+ *	@buffer: NULL
-+ *
-+ * Mode 2: When requesting the driver to return the
-+ *	partitions information:
-+ *	@dev: The arm_ffa bus device
-+ *	@uuid_str: pointer to the UUID string
-+ *	@sp_count: pointer to the variable that contains the number of empty=
 partition descriptors
-+ *			 The variable will be read by the driver
-+ *	@buffer: pointer to SPs information buffer
-+ *		(allocated by the client and contains empty @sp_count descriptors).
-+ *		The buffer will be filled by the driver
-+ *
-+ * This function queries the secure partition data from
-+ * the private data structure. If not found, it invokes FFA_PARTITION_I=
NFO_GET
-+ * FF-A function to query the partition information from secure world.
-+ *
-+ * A client of the FF-A driver should know the UUID of the service it w=
ants to
-+ * access. It should use the UUID to request the FF-A driver to provide=
 the
-+ * partition(s) information of the service. The FF-A driver uses
-+ * PARTITION_INFO_GET to obtain this information. This is implemented t=
hrough
-+ * ffa_get_partitions_info function.
-+ * A new FFA_PARTITION_INFO_GET call is issued (first one performed thr=
ough
-+ * ffa_cache_partitions_info) allowing to retrieve the partition(s) inf=
ormation.
-+ * They are not saved (already done). We only update the UUID in the ca=
ched area.
-+ * This assumes that partitions data does not change in the secure worl=
d.
-+ * Otherwise u-boot will have an outdated partition data. The benefit o=
f caching
-+ * the information in the FF-A driver is to accommodate discovery after
-+ * ExitBootServices().
-+ *
-+ * When invoked through a client request, ffa_get_partitions_info shoul=
d be
-+ * called twice. First call is to get from the driver the number of sec=
ure
-+ * partitions (SPs) associated to a particular UUID.
-+ * Then, the caller (client) allocates the buffer to host the SPs data =
and
-+ * issues a 2nd call. Then, the driver fills the SPs data in the pre-al=
located
-+ * buffer.
-+ *
-+ * To achieve the mechanism described above, ffa_get_partitions_info us=
es the
-+ * following functions:
-+ *		ffa_read_partitions_info
-+ *		ffa_query_partitions_info
-+ *
-+ * Return:
-+ *
-+ * @sp_count: When pointing to the number of partitions variable, the n=
umber is
-+ * set by the driver.
-+ * When pointing to the partitions information buffer size, the buffer =
will be
-+ * filled by the driver.
-+ *
-+ * On success 0 is returned. Otherwise, failure
-+ */
-+static int ffa_get_partitions_info(struct udevice *dev, const char *uui=
d_str,
-+				   u32 *sp_count, struct ffa_partition_info *buffer)
-+{
-+	/*
-+	 * fill_data:
-+	 * 0: return the SP count
-+	 * 1: fill SP data and return it to the caller
-+	 */
-+	bool fill_data =3D 0;
-+	u32 desc_idx, client_desc_idx;
-+	struct ffa_partition_uuid part_uuid =3D {0};
-+	u32 sp_found =3D 0;
-+
-+	if (!ffa_priv_data->partitions.count || !ffa_priv_data->partitions.des=
cs) {
-+		ffa_err("no partition installed");
-+		return -EINVAL;
-+	}
-+
-+	if (!uuid_str) {
-+		ffa_err("no UUID provided");
-+		return -EINVAL;
-+	}
-+
-+	if (!sp_count) {
-+		ffa_err("no size/count provided");
-+		return -EINVAL;
-+	}
-+
-+	if (uuid_str_to_le_bin(uuid_str, (unsigned char *)&part_uuid)) {
-+		ffa_err("invalid UUID");
-+		return -EINVAL;
-+	}
-+
-+	if (!buffer) {
-+		/* Mode 1: getting the number of secure partitions */
-+
-+		fill_data =3D 0;
-+
-+		ffa_info("Preparing for checking partitions count");
-+
-+	} else if (*sp_count) {
-+		/* Mode 2: retrieving the partitions information */
-+
-+		fill_data =3D 1;
-+
-+		client_desc_idx =3D 0;
-+
-+		ffa_info("Preparing for filling partitions info");
-+
-+	} else {
-+		ffa_err("invalid function arguments provided");
-+		return -EINVAL;
-+	}
-+
-+	ffa_info("Searching partitions using the provided UUID");
-+
-+	/*
-+	 * search in the cached partitions
-+	 */
-+	for (desc_idx =3D 0;
-+	     desc_idx < ffa_priv_data->partitions.count;
-+	     desc_idx++) {
-+		if (ffa_uuid_are_identical(&ffa_priv_data->partitions.descs[desc_idx]=
.sp_uuid,
-+					   &part_uuid)) {
-+			ffa_info("Partition ID %x matches the provided UUID",
-+				 ffa_priv_data->partitions.descs[desc_idx].info.id);
-+
-+			sp_found++;
-+
-+			if (fill_data) {
-+				/*
-+				 * trying to fill the partition info in the input buffer
-+				 */
-+
-+				if (client_desc_idx < *sp_count) {
-+					buffer[client_desc_idx++] =3D
-+						ffa_priv_data->partitions.descs[desc_idx].info;
-+					continue;
-+				}
-+
-+				ffa_err("failed to fill the current descriptor client buffer full")=
;
-+				return -ENOBUFS;
-+			}
-+		}
-+	}
-+
-+	if (!sp_found) {
-+		int ret;
-+
-+		ffa_info("No partition found. Querying framework ...");
-+
-+		ret =3D ffa_query_partitions_info(&part_uuid, &sp_found);
-+
-+		if (ret =3D=3D 0) {
-+			if (!fill_data) {
-+				*sp_count =3D sp_found;
-+
-+				ffa_info("Number of partition(s) found matching the UUID: %d",
-+					 sp_found);
-+			} else {
-+				/*
-+				 * If SPs data detected, they are already in the private data
-+				 * structure, retry searching SP data again to return them
-+				 *  to the caller
-+				 */
-+				if (sp_found)
-+					ret =3D ffa_get_partitions_info(dev, uuid_str, sp_count,
-+								      buffer);
-+				else
-+					ret =3D -ENODATA;
-+			}
-+		}
-+
-+		return ret;
-+	}
-+
-+	/* partition(s) found */
-+	if (!fill_data)
-+		*sp_count =3D sp_found;
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_cache_partitions_info - Queries and saves all secure partitions =
data
-+ *
-+ * This function invokes FFA_PARTITION_INFO_GET FF-A
-+ * function to query from secure world all partitions information.
-+ *
-+ * The FFA_PARTITION_INFO_GET call is issued with nil UUID as an argume=
nt.
-+ * All installed partitions information are returned. We cache them in =
the
-+ * resident private data structure and we keep the UUID field empty
-+ * (in FF-A 1.0 UUID is not provided by the partition descriptor)
-+ *
-+ * This function is called at the device probing level.
-+ * ffa_cache_partitions_info uses ffa_query_partitions_info to get the =
data
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_cache_partitions_info(void)
-+{
-+	return ffa_query_partitions_info(NULL, NULL);
-+}
-+
-+/**
-+ * ffa_msg_send_direct_req - FFA_MSG_SEND_DIRECT_{REQ,RESP} handler fun=
ction
-+ * @dev: The arm_ffa bus device
-+ * @dst_part_id: destination partition ID
-+ * @msg: pointer to the message data preallocated by the client (in/out=
)
-+ * @is_smc64: select 64-bit or 32-bit FF-A ABI
-+ *
-+ * This function implements FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ * FF-A functions.
-+ *
-+ * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
-+ * The response from the secure partition is handled by reading the
-+ * FFA_MSG_SEND_DIRECT_RESP arguments.
-+ *
-+ * The maximum size of the data that can be exchanged is 40 bytes which=
 is
-+ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
-+ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_msg_send_direct_req(struct udevice *dev, u16 dst_part_id=
,
-+				   struct ffa_send_direct_data *msg, bool is_smc64)
-+{
-+	ffa_value_t res =3D {0};
-+	int ffa_errno;
-+	u64 req_mode, resp_mode;
-+
-+	if (!ffa_priv_data || !ffa_priv_data->invoke_ffa_fn)
-+		return -EINVAL;
-+
-+	/* No partition installed */
-+	if (!ffa_priv_data->partitions.count || !ffa_priv_data->partitions.des=
cs)
-+		return -ENODEV;
-+
-+	if (is_smc64) {
-+		req_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ);
-+		resp_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
-+	} else {
-+		req_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_REQ);
-+		resp_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_RESP);
-+	}
-+
-+	ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D req_mode,
-+			.a1 =3D PREP_SELF_ENDPOINT_ID(ffa_priv_data->id) |
-+				PREP_PART_ENDPOINT_ID(dst_part_id),
-+			.a2 =3D 0,
-+			.a3 =3D msg->data0,
-+			.a4 =3D msg->data1,
-+			.a5 =3D msg->data2,
-+			.a6 =3D msg->data3,
-+			.a7 =3D msg->data4,
-+			}, &res);
-+
-+	while (res.a0 =3D=3D FFA_SMC_32(FFA_INTERRUPT))
-+		ffa_priv_data->invoke_ffa_fn((ffa_value_t){
-+			.a0 =3D FFA_SMC_32(FFA_RUN),
-+			.a1 =3D res.a1,
-+			}, &res);
-+
-+	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
-+		/* Message sent with no response */
-+		return 0;
-+	}
-+
-+	if (res.a0 =3D=3D resp_mode) {
-+		/*
-+		 * Message sent with response
-+		 * extract the return data
-+		 */
-+		msg->data0 =3D res.a3;
-+		msg->data1 =3D res.a4;
-+		msg->data2 =3D res.a5;
-+		msg->data3 =3D res.a6;
-+		msg->data4 =3D res.a7;
-+
-+		return 0;
-+	}
-+
-+	ffa_errno =3D res.a2;
-+	return ffa_to_std_errno(ffa_errno);
-+}
-+
-+/**
-+ * __arm_ffa_fn_smc - SMC wrapper
-+ * @args: FF-A ABI arguments to be copied to Xn registers
-+ * @res: FF-A ABI return data to be copied from Xn registers
-+ *
-+ * Calls low level SMC assembly function
-+ *
-+ * Return: void
-+ */
-+void __arm_ffa_fn_smc(ffa_value_t args, ffa_value_t *res)
-+{
-+	arm_smccc_1_2_smc(&args, res);
-+}
-+
-+/**
-+ * ffa_set_smc_conduit - Set the SMC conduit
-+ *
-+ * This function selects the SMC conduit by setting the driver invoke f=
unction
-+ * to SMC assembly function
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_set_smc_conduit(void)
-+{
-+	ffa_priv_data->invoke_ffa_fn =3D __arm_ffa_fn_smc;
-+
-+	if (!ffa_priv_data->invoke_ffa_fn) {
-+		ffa_err("failure to set the invoke function");
-+		return -EINVAL;
-+	}
-+
-+	ffa_info("Conduit is SMC");
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_set_bus_ops - Set the bus driver operations
-+ *
-+ * Setting the driver callbacks.
-+ *
-+ */
-+static void ffa_set_bus_ops(void)
-+{
-+	ffa_priv_data->ffa_ops.partition_info_get =3D ffa_get_partitions_info;
-+	ffa_priv_data->ffa_ops.sync_send_receive =3D ffa_msg_send_direct_req;
-+	ffa_priv_data->ffa_ops.rxtx_unmap =3D ffa_unmap_rxtx_buffers;
-+}
-+
-+/**
-+ * ffa_alloc_prvdata - allocate the driver main data structure and sets=
 the device
-+ * @dev:	the arm_ffa device
-+ *
-+ * This function creates the main data structure embedding all the driv=
er data.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_alloc_prvdata(struct udevice *dev)
-+{
-+	if (!dev) {
-+		ffa_err("no udevice found");
-+		return -ENODEV;
-+	}
-+
-+	/* The device is registered with the DM. Let's create the driver main =
data structure*/
-+
-+	ffa_priv_data =3D devm_kmalloc(dev, sizeof(struct ffa_prvdata), __GFP_=
ZERO);
-+	if (!ffa_priv_data) {
-+		ffa_err("can not allocate the driver main data structure");
-+		return -ENOMEM;
-+	}
-+
-+	ffa_priv_data->dev =3D dev;
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_probe - The driver probe function
-+ * @dev:	the arm_ffa device
-+ *
-+ * Probing is done at boot time and triggered by the uclass device disc=
overy.
-+ * At probe level the following actions are done:
-+ *	- setting the conduit
-+ *	- querying the FF-A framework version
-+ *	- querying from secure world the u-boot endpoint ID
-+ *	- querying from secure world the supported features of FFA_RXTX_MAP
-+ *	- mapping the RX/TX buffers
-+ *	- querying from secure world all the partitions information
-+ *
-+ * All data queried from secure world is saved in the resident private =
data structure.
-+ *
-+ * The probe will fail if either FF-A framework is not detected or the
-+ * FF-A requests are not behaving correctly. This ensures that the
-+ * driver is not installed and its operations are not exported to the c=
lients.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int ffa_probe(struct udevice *dev)
-+{
-+	int ret;
-+
-+	ret =3D ffa_alloc_prvdata(dev);
-+	if (ret !=3D 0)
-+		return ret;
-+
-+	ffa_set_bus_ops();
-+
-+	ret =3D ffa_set_smc_conduit();
-+	if (ret !=3D 0)
-+		return ret;
-+
-+	ret =3D ffa_get_version();
-+	if (ret !=3D 0)
-+		return ret;
-+
-+	ret =3D ffa_get_endpoint_id();
-+	if (ret !=3D 0)
-+		return ret;
-+
-+	ret =3D ffa_get_rxtx_map_features();
-+	if (ret !=3D 0)
-+		return ret;
-+
-+	ret =3D ffa_map_rxtx_buffers();
-+	if (ret !=3D 0)
-+		return ret;
-+
-+	ret =3D ffa_cache_partitions_info();
-+	if (ret !=3D 0) {
-+		ffa_free_rxtx_buffers();
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_remove - The driver remove function
-+ * @dev:	the arm_ffa device
-+ * When the device is about to be removed ,  unmap the RX/TX buffers an=
d free the memory
-+ * Return:
-+ *
-+ * 0 on success.
-+ */
-+static int ffa_remove(struct udevice *dev)
-+{
-+	ffa_info("removing the device");
-+
-+	ffa_unmap_rxtx_buffers(dev);
-+
-+	if (ffa_priv_data->pair.rxbuf || ffa_priv_data->pair.txbuf)
-+		ffa_free_rxtx_buffers();
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_unbind - The driver unbind function
-+ * @dev:	the arm_ffa device
-+ * After the device is removed and memory freed the device is unbound
-+ * Return:
-+ *
-+ * 0 on success.
-+ */
-+static int ffa_unbind(struct udevice *dev)
-+{
-+	ffa_info("unbinding the device , private data already released");
-+
-+	ffa_priv_data =3D NULL;
-+
-+	return 0;
-+}
-+
-+/**
-+ * ffa_bus_ops_get - bus driver operations getter
-+ *
-+ * Return:
-+ * This function returns a pointer to the driver operations structure
-+ */
-+const struct ffa_bus_ops *ffa_bus_ops_get(void)
-+{
-+	return &ffa_priv_data->ffa_ops;
-+}
-+
-+/**
-+ * ffa_bus_prvdata_get - bus driver private data getter
-+ *
-+ * Return:
-+ * This function returns a pointer to the main private data structure
-+ */
-+struct ffa_prvdata *ffa_bus_prvdata_get(void)
-+{
-+	return ffa_priv_data;
-+}
-+
-+/**
-+ * ffa_bus_discover - discover FF-A bus and probe arm_ffa device
-+ * @pdev: the address of a device pointer (to be filled when the arm_ff=
a bus device is created
-+ *       successfully)
-+ *
-+ * This function makes sure the FF-A bus is discoverable.
-+ * When probing succeeds FF-A discovery is done. The arm_ffa device is =
ready to use.
-+ *
-+ * When the bus was already discovered successfully the discovery will =
not run again.
-+ *
-+ * Arm FF-A transport is implemented through arm_ffa u-boot device mana=
ging the FF-A
-+ * communication.
-+ * All FF-A clients should use the arm_ffa device to use the FF-A trans=
port.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int ffa_bus_discover(struct udevice **pdev)
-+{
-+	int ret =3D 0;
-+
-+	if (!ffa_priv_data) {
-+		ret =3D ffa_device_get(pdev);
-+
-+	return ret;
-+}
-+
-+/**
-+ * Declaring the arm_ffa driver under UCLASS_FFA
-+ */
-+
-+U_BOOT_DRIVER(arm_ffa) =3D {
-+	.name		=3D FFA_DRV_NAME,
-+	.id		=3D UCLASS_FFA,
-+	.probe		=3D ffa_probe,
-+	.remove		=3D ffa_remove,
-+	.unbind		=3D ffa_unbind,
-+};
-diff --git a/include/arm_ffa.h b/include/arm_ffa.h
-new file mode 100644
-index 0000000000..74b16174c2
---- /dev/null
-+++ b/include/arm_ffa.h
-@@ -0,0 +1,97 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __ARM_FFA_H
-+#define __ARM_FFA_H
-+
-+#include <linux/printk.h>
-+
-+/*
-+ * This header is public. It can be used by clients to access
-+ * data structures and definitions they need
-+ */
-+
-+/*
-+ * Macros for displaying logs
-+ */
-+
-+#define ffa_info(fmt, ...)  pr_info("[FFA] " fmt "\n", ##__VA_ARGS__)
-+#define ffa_err(fmt, ...)  pr_err("[FFA] " fmt "\n", ##__VA_ARGS__)
-+
-+/*
-+ * struct ffa_partition_info - Partition information descriptor
-+ * @id:	Partition ID
-+ * @exec_ctxt:	Execution context count
-+ * @properties:	Partition properties
-+ *
-+ * Data structure containing information about partitions instantiated =
in the system
-+ * This structure is filled with the data queried by FFA_PARTITION_INFO=
_GET
-+ */
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
-+/*
-+ * struct ffa_send_direct_data - Data structure hosting the data
-+ *                                       used by FFA_MSG_SEND_DIRECT_{R=
EQ,RESP}
-+ * @data0-4:	Data read/written from/to x3-x7 registers
-+ *
-+ * Data structure containing the data to be sent by FFA_MSG_SEND_DIRECT=
_REQ
-+ * or read from FFA_MSG_SEND_DIRECT_RESP
-+ */
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
-+struct udevice;
-+
-+/**
-+ * struct ffa_bus_ops - The driver operations structure
-+ * @partition_info_get:	callback for the FFA_PARTITION_INFO_GET
-+ * @sync_send_receive:	callback for the FFA_MSG_SEND_DIRECT_REQ
-+ * @rxtx_unmap:	callback for the FFA_RXTX_UNMAP
-+ *
-+ * The data structure providing all the operations supported by the dri=
ver.
-+ * This structure is EFI runtime resident.
-+ */
-+struct ffa_bus_ops {
-+	int (*partition_info_get)(struct udevice *dev, const char *uuid_str,
-+				  u32 *sp_count, struct ffa_partition_info *buffer);
-+	int (*sync_send_receive)(struct udevice *dev, u16 dst_part_id,
-+				 struct ffa_send_direct_data *msg,
-+				 bool is_smc64);
-+	int (*rxtx_unmap)(struct udevice *dev);
-+};
-+
-+/**
-+ * The device driver and the Uclass driver public functions
-+ */
-+
-+/**
-+ * ffa_bus_ops_get - driver operations getter
-+ */
-+const struct ffa_bus_ops *ffa_bus_ops_get(void);
-+
-+/**
-+ * ffa_bus_discover - discover FF-A bus and probes the arm_ffa device
-+ */
-+int ffa_bus_discover(struct udevice **pdev);
-+
-+#endif
-diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
-index 376f741cc2..fa08a66ac8 100644
---- a/include/dm/uclass-id.h
-+++ b/include/dm/uclass-id.h
-@@ -4,6 +4,9 @@
-  *
-  * (C) Copyright 2012
-  * Pavel Herrmann <morpheus.ibis@gmail.com>
-+ *
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
-=20
- #ifndef _DM_UCLASS_ID_H
-@@ -55,6 +58,7 @@ enum uclass_id {
- 	UCLASS_EFI_MEDIA,	/* Devices provided by UEFI firmware */
- 	UCLASS_ETH,		/* Ethernet device */
- 	UCLASS_ETH_PHY,		/* Ethernet PHY device */
-+	UCLASS_FFA,		/* Arm Firmware Framework for Armv8-A */
- 	UCLASS_FIRMWARE,	/* Firmware */
- 	UCLASS_FPGA,		/* FPGA device */
- 	UCLASS_FUZZING_ENGINE,	/* Fuzzing engine */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-FF-=
A-v15-arm_ffa-introduce-Arm-FF-A-support.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-supp=
ort.patch
new file mode 100644
index 00000000..f0d67639
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-FF-A-v15-a=
rm_ffa-introduce-Arm-FF-A-support.patch
@@ -0,0 +1,2132 @@
+From e8b71ec24884a0c973ac663e6802ff529a8be349 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 17 Jul 2023 15:11:43 +0100
+Subject: [PATCH 04/33] FF-A v15: arm_ffa: introduce Arm FF-A support
+
+Add Arm FF-A support implementing Arm Firmware Framework for Armv8-A v1.=
0
+
+The Firmware Framework for Arm A-profile processors (FF-A v1.0) [1]
+describes interfaces (ABIs) that standardize communication
+between the Secure World and Normal World leveraging TrustZone
+technology.
+
+This driver uses 64-bit registers as per SMCCCv1.2 spec and comes
+on top of the SMCCC layer. The driver provides the FF-A ABIs needed for
+querying the FF-A framework from the secure world.
+
+The driver uses SMC32 calling convention which means using the first
+32-bit data of the Xn registers.
+
+All supported ABIs come with their 32-bit version except FFA_RXTX_MAP
+which has 64-bit version supported.
+
+Both 32-bit and 64-bit direct messaging are supported which allows both
+32-bit and 64-bit clients to use the FF-A bus.
+
+FF-A is a discoverable bus and similar to architecture features.
+FF-A bus is discovered using ARM_SMCCC_FEATURES mechanism performed
+by the PSCI driver.
+
+Clients are able to probe then use the FF-A bus by calling the DM class
+searching APIs (e.g: uclass_first_device).
+
+The Secure World is considered as one entity to communicate with
+using the FF-A bus. FF-A communication is handled by one device and
+one instance (the bus). This FF-A driver takes care of all the
+interactions between Normal world and Secure World.
+
+The driver exports its operations to be used by upper layers.
+
+Exported operations:
+
+- ffa_partition_info_get
+- ffa_sync_send_receive
+- ffa_rxtx_unmap
+
+Generic FF-A methods are implemented in the Uclass (arm-ffa-uclass.c).
+Arm specific methods are implemented in the Arm driver (arm-ffa.c).
+
+For more details please refer to the driver documentation [2].
+
+[1]: https://developer.arm.com/documentation/den0077/latest/
+[2]: doc/arch/arm64.ffa.rst
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
+---
+ MAINTAINERS                                   |    8 +
+ doc/arch/arm64.ffa.rst                        |  238 ++++
+ doc/arch/index.rst                            |    1 +
+ drivers/Makefile                              |    1 +
+ drivers/firmware/Kconfig                      |    1 +
+ drivers/firmware/arm-ffa/Kconfig              |   36 +
+ drivers/firmware/arm-ffa/Makefile             |    8 +
+ drivers/firmware/arm-ffa/arm-ffa-uclass.c     | 1065 +++++++++++++++++
+ drivers/firmware/arm-ffa/arm-ffa.c            |  104 ++
+ .../firmware/arm-ffa/sandbox_arm_ffa_priv.h   |   14 +
+ include/arm_ffa.h                             |  213 ++++
+ include/arm_ffa_priv.h                        |  246 ++++
+ include/dm/uclass-id.h                        |    6 +
+ 13 files changed, 1941 insertions(+)
+ create mode 100644 doc/arch/arm64.ffa.rst
+ create mode 100644 drivers/firmware/arm-ffa/Kconfig
+ create mode 100644 drivers/firmware/arm-ffa/Makefile
+ create mode 100644 drivers/firmware/arm-ffa/arm-ffa-uclass.c
+ create mode 100644 drivers/firmware/arm-ffa/arm-ffa.c
+ create mode 100644 drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h
+ create mode 100644 include/arm_ffa.h
+ create mode 100644 include/arm_ffa_priv.h
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index a1122afb01..9c5ebf312c 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -266,6 +266,14 @@ F:	drivers/net/cortina_ni.h
+ F:	drivers/net/phy/ca_phy.c
+ F:	configs/cortina_presidio-asic-pnand_defconfig
+=20
++ARM FF-A
++M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++S:	Maintained
++F:	doc/arch/arm64.ffa.rst
++F:	drivers/firmware/arm-ffa/
++F:	include/arm_ffa.h
++F:	include/sandbox_arm_ffa.h
++
+ ARM FREESCALE IMX
+ M:	Stefano Babic <sbabic@denx.de>
+ M:	Fabio Estevam <festevam@gmail.com>
+diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
+new file mode 100644
+index 0000000000..4f817f053c
+--- /dev/null
++++ b/doc/arch/arm64.ffa.rst
+@@ -0,0 +1,238 @@
++.. SPDX-License-Identifier: GPL-2.0+
++
++Arm FF-A Support
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++Summary
++-------
++
++FF-A stands for Firmware Framework for Arm A-profile processors.
++
++FF-A specifies interfaces that enable a pair of software execution envi=
ronments aka partitions to
++communicate with each other. A partition could be a VM in the Normal or=
 Secure world, an
++application in S-EL0, or a Trusted OS in S-EL1.
++
++The U-Boot FF-A support (the bus) implements the interfaces to communic=
ate
++with partitions in the Secure world aka Secure partitions (SPs).
++
++The FF-A support specifically focuses on communicating with SPs that
++isolate portions of EFI runtime services that must run in a protected
++environment which is inaccessible by the Host OS or Hypervisor.
++Examples of such services are set/get variables.
++
++The FF-A support uses the SMC ABIs defined by the FF-A specification to=
:
++
++- Discover the presence of SPs of interest
++- Access an SP's service through communication protocols
++  e.g. EFI MM communication protocol
++
++At this stage of development only EFI boot-time services are supported.
++Runtime support will be added in future developments.
++
++The U-Boot FF-A support provides the following parts:
++
++- A Uclass driver providing generic FF-A methods.
++- An Arm FF-A device driver providing Arm-specific methods and reusing =
the Uclass methods.
++
++FF-A and SMC specifications
++-------------------------------------------
++
++The current implementation of the U-Boot FF-A support relies on
++`FF-A v1.0 specification`_ and uses SMC32 calling convention which
++means using the first 32-bit data of the Xn registers.
++
++At this stage we only need the FF-A v1.0 features.
++
++The FF-A support has been tested with OP-TEE which supports SMC32 calli=
ng
++convention.
++
++Hypervisors are supported if they are configured to trap SMC calls.
++
++The FF-A support uses 64-bit registers as per `SMC Calling Convention v=
1.2 specification`_.
++
++Supported hardware
++--------------------------------
++
++Aarch64 plaforms
++
++Configuration
++----------------------
++
++CONFIG_ARM_FFA_TRANSPORT
++    Enables the FF-A support. Turn this on if you want to use FF-A
++    communication.
++    When using an Arm 64-bit platform, the Arm FF-A driver will be used=
.
++
++FF-A ABIs under the hood
++---------------------------------------
++
++Invoking an FF-A ABI involves providing to the secure world/hypervisor =
the
++expected arguments from the ABI.
++
++On an Arm 64-bit platform, the ABI arguments are stored in x0 to x7 reg=
isters.
++Then, an SMC instruction is executed.
++
++At the secure side level or hypervisor the ABI is handled at a higher e=
xception
++level and the arguments are read and processed.
++
++The response is put back through x0 to x7 registers and control is give=
n back
++to the U-Boot Arm FF-A driver (non-secure world).
++
++The driver reads the response and processes it accordingly.
++
++This methodology applies to all the FF-A ABIs.
++
++FF-A bus discovery on Arm 64-bit platforms
++---------------------------------------------
++
++When CONFIG_ARM_FFA_TRANSPORT is enabled, the FF-A bus is considered as
++an architecture feature and discovered using ARM_SMCCC_FEATURES mechani=
sm.
++This discovery mechanism is performed by the PSCI driver.
++
++The PSCI driver comes with a PSCI device tree node which is the root no=
de for all
++architecture features including FF-A bus.
++
++::
++
++   =3D> dm tree
++
++    Class     Index  Probed  Driver                Name
++   -----------------------------------------------------------
++   ...
++    firmware      0  [ + ]   psci                      |-- psci
++    ffa                   0  [   ]   arm_ffa               |   `-- arm_=
ffa
++   ...
++
++The PSCI driver is bound to the PSCI device and when probed it tries to=
 discover
++the architecture features by calling a callback the features drivers pr=
ovide.
++
++In case of FF-A, the callback is arm_ffa_is_supported() which tries to =
discover the
++FF-A framework by querying the FF-A framework version from secure world=
 using
++FFA_VERSION ABI. When discovery is successful, the ARM_SMCCC_FEATURES
++mechanism creates a U-Boot device for the FF-A bus and binds the Arm FF=
-A driver
++with the device using device_bind_driver().
++
++At this stage the FF-A bus is registered with the DM and can be interac=
ted with using
++the DM APIs.
++
++Clients are able to probe then use the FF-A bus by calling uclass_first=
_device().
++Please refer to the armffa command implementation as an example of how =
to probe
++and interact with the FF-A bus.
++
++When calling uclass_first_device(), the FF-A driver is probed and ends =
up calling
++ffa_do_probe() provided by the Uclass which does the following:
++
++    - saving the FF-A framework version in uc_priv
++    - querying from secure world the u-boot endpoint ID
++    - querying from secure world the supported features of FFA_RXTX_MAP
++    - mapping the RX/TX buffers
++    - querying from secure world all the partitions information
++
++When one of the above actions fails, probing fails and the driver stays=
 not active
++and can be probed again if needed.
++
++Requirements for clients
++-------------------------------------
++
++When using the FF-A bus with EFI, clients must query the SPs they are l=
ooking for
++during EFI boot-time mode using the service UUID.
++
++The RX/TX buffers are only available at EFI boot-time. Querying partiti=
ons is
++done at boot time and data is cached for future use.
++
++RX/TX buffers should be unmapped before EFI runtime mode starts.
++The driver provides a bus operation for that called ffa_rxtx_unmap().
++
++The user should call ffa_rxtx_unmap() to unmap the RX/TX buffers when r=
equired
++(e.g: at efi_exit_boot_services()).
++
++The Linux kernel allocates its own RX/TX buffers. To be able to registe=
r these kernel buffers
++with secure world, the U-Boot's RX/TX buffers should be unmapped before=
 EFI runtime starts.
++
++When invoking FF-A direct messaging, clients should specify which ABI p=
rotocol
++they want to use (32-bit vs 64-bit). Selecting the protocol means using
++the 32-bit or 64-bit version of FFA_MSG_SEND_DIRECT_{REQ, RESP}.
++The calling convention between U-Boot and the secure world stays the sa=
me: SMC32.
++
++Requirements for user drivers
++-------------------------------------
++
++Users who want to implement their custom FF-A device driver while reusi=
ng the FF-A Uclass can do so
++by implementing their own invoke_ffa_fn() in the user driver.
++
++The bus driver layer
++------------------------------
++
++FF-A support comes on top of the SMCCC layer and is implemented by the =
FF-A Uclass drivers/firmware/arm-ffa/arm-ffa-uclass.c
++
++The following features are provided:
++
++- Support for the 32-bit version of the following ABIs:
++
++    - FFA_VERSION
++    - FFA_ID_GET
++    - FFA_FEATURES
++    - FFA_PARTITION_INFO_GET
++    - FFA_RXTX_UNMAP
++    - FFA_RX_RELEASE
++    - FFA_RUN
++    - FFA_ERROR
++    - FFA_SUCCESS
++    - FFA_INTERRUPT
++    - FFA_MSG_SEND_DIRECT_REQ
++    - FFA_MSG_SEND_DIRECT_RESP
++
++- Support for the 64-bit version of the following ABIs:
++
++    - FFA_RXTX_MAP
++    - FFA_MSG_SEND_DIRECT_REQ
++    - FFA_MSG_SEND_DIRECT_RESP
++
++- Processing the received data from the secure world/hypervisor and cac=
hing it
++
++- Hiding from upper layers the FF-A protocol and registers details. Upp=
er
++  layers focus on exchanged data, FF-A support takes care of how to tra=
nsport
++  that to the secure world/hypervisor using FF-A
++
++- FF-A support provides driver operations to be used by upper layers:
++
++    - ffa_partition_info_get
++    - ffa_sync_send_receive
++    - ffa_rxtx_unmap
++
++- FF-A bus discovery makes sure FF-A framework is responsive and compat=
ible
++  with the driver
++
++- FF-A bus can be compiled and used without EFI
++
++Example of boot logs with FF-A enabled
++--------------------------------------
++
++For example, when using FF-A with Corstone-1000 the logs are as follows=
:
++
++::
++
++   U-Boot 2023.01 (May 10 2023 - 11:08:07 +0000) corstone1000 aarch64
++
++   DRAM:  2 GiB
++   Arm FF-A framework discovery
++   FF-A driver 1.0
++   FF-A framework 1.0
++   FF-A versions are compatible
++   ...
++   FF-A driver 1.0
++   FF-A framework 1.0
++   FF-A versions are compatible
++   EFI: MM partition ID 0x8003
++   ...
++   EFI stub: Booting Linux Kernel...
++   ...
++   Linux version 6.1.9-yocto-standard (oe-user@oe-host) (aarch64-poky-l=
inux-musl-gcc (GCC) 12.2.0, GNU ld (GNU Binutils) 2.40.202301193
++   Machine model: ARM Corstone1000 FPGA MPS3 board
++
++Contributors
++------------
++   * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++
++.. _`FF-A v1.0 specification`: https://documentation-service.arm.com/st=
atic/5fb7e8a6ca04df4095c1d65e
++.. _`SMC Calling Convention v1.2 specification`: https://documentation-=
service.arm.com/static/5f8edaeff86e16515cdbe4c6
+diff --git a/doc/arch/index.rst b/doc/arch/index.rst
+index b8da4b8c8e..2f916f4026 100644
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
+diff --git a/drivers/Makefile b/drivers/Makefile
+index 29be78a3f2..6094fac50d 100644
+--- a/drivers/Makefile
++++ b/drivers/Makefile
+@@ -114,6 +114,7 @@ obj-y +=3D iommu/
+ obj-y +=3D smem/
+ obj-y +=3D thermal/
+ obj-$(CONFIG_TEE) +=3D tee/
++obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D firmware/arm-ffa/
+ obj-y +=3D axi/
+ obj-y +=3D ufs/
+ obj-$(CONFIG_W1) +=3D w1/
+diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
+index eae1c8ddc9..8789b1ea14 100644
+--- a/drivers/firmware/Kconfig
++++ b/drivers/firmware/Kconfig
+@@ -45,4 +45,5 @@ config ARM_SMCCC_FEATURES
+ 	  the PSCI driver is always probed and binds dirvers registered to the=
 Arm SMCCC
+ 	  services if any and reported as supported by the SMCCC firmware.
+=20
++source "drivers/firmware/arm-ffa/Kconfig"
+ source "drivers/firmware/scmi/Kconfig"
+diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
+new file mode 100644
+index 0000000000..9200c8028b
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/Kconfig
+@@ -0,0 +1,36 @@
++# SPDX-License-Identifier: GPL-2.0
++
++config ARM_FFA_TRANSPORT
++	bool "Enable Arm Firmware Framework for Armv8-A driver"
++	depends on DM && ARM64
++	select ARM_SMCCC
++	select ARM_SMCCC_FEATURES
++	select LIB_UUID
++	select DEVRES
++	help
++	  The Firmware Framework for Arm A-profile processors (FF-A)
++	  describes interfaces (ABIs) that standardize communication
++	  between the Secure World and Normal World leveraging TrustZone
++	  technology.
++
++	  The FF-A support in U-Boot is based on FF-A specification v1.0 and u=
ses SMC32
++	  calling convention.
++
++	  FF-A specification:
++
++	  https://developer.arm.com/documentation/den0077/a/?lang=3Den
++
++	  In U-Boot FF-A design, FF-A is considered as a discoverable bus.
++	  FF-A bus is discovered using ARM_SMCCC_FEATURES mechanism performed
++	  by the PSCI driver.
++	  The Secure World is considered as one entity to communicate with
++	  using the FF-A bus.
++	  FF-A communication is handled by one device and one instance (the bu=
s).
++	  The FF-A support on U-Boot  takes care of all the interactions betwe=
en Normal
++	  world and Secure World.
++
++	  Generic FF-A methods are implemented in the Uclass (arm-ffa-uclass.c=
).
++	  Arm specific methods are implemented in the Arm driver (arm-ffa.c).
++
++	  For more details about the FF-A support, please refer to doc/arch/ar=
m64.ffa.rst
++
+diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
+new file mode 100644
+index 0000000000..11b1766285
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/Makefile
+@@ -0,0 +1,8 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
++#
++# Authors:
++#   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++
++obj-y +=3D arm-ffa-uclass.o arm-ffa.o
+diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
+new file mode 100644
+index 0000000000..ffa9d81fa7
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
+@@ -0,0 +1,1065 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++#include <common.h>
++#include <arm_ffa.h>
++#include <arm_ffa_priv.h>
++#include <dm.h>
++#include <log.h>
++#include <malloc.h>
++#include <string.h>
++#include <uuid.h>
++#include <asm/global_data.h>
++#include <dm/device-internal.h>
++#include <dm/devres.h>
++#include <dm/root.h>
++#include <linux/errno.h>
++#include <linux/sizes.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++/* Error mapping declarations */
++
++int ffa_to_std_errmap[MAX_NUMBER_FFA_ERR] =3D {
++	[NOT_SUPPORTED] =3D -EOPNOTSUPP,
++	[INVALID_PARAMETERS] =3D -EINVAL,
++	[NO_MEMORY] =3D -ENOMEM,
++	[BUSY] =3D -EBUSY,
++	[INTERRUPTED] =3D -EINTR,
++	[DENIED] =3D -EACCES,
++	[RETRY] =3D -EAGAIN,
++	[ABORTED] =3D -ECANCELED,
++};
++
++static struct ffa_abi_errmap err_msg_map[FFA_ERRMAP_COUNT] =3D {
++	[FFA_ID_TO_ERRMAP_ID(FFA_VERSION)] =3D {
++		{
++			[NOT_SUPPORTED] =3D
++			"NOT_SUPPORTED: A Firmware Framework implementation does not exist",
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_ID_GET)] =3D {
++		{
++			[NOT_SUPPORTED] =3D
++			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_FEATURES)] =3D {
++		{
++			[NOT_SUPPORTED] =3D
++			"NOT_SUPPORTED: FFA_RXTX_MAP is not implemented at this FF-A instanc=
e",
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_PARTITION_INFO_GET)] =3D {
++		{
++			[NOT_SUPPORTED] =3D
++			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
++			[INVALID_PARAMETERS] =3D
++			"INVALID_PARAMETERS: Unrecognized UUID",
++			[NO_MEMORY] =3D
++			"NO_MEMORY: Results cannot fit in RX buffer of the caller",
++			[BUSY] =3D
++			"BUSY: RX buffer of the caller is not free",
++			[DENIED] =3D
++			"DENIED: Callee is not in a state to handle this request",
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_RXTX_UNMAP)] =3D {
++		{
++			[NOT_SUPPORTED] =3D
++			"NOT_SUPPORTED: FFA_RXTX_UNMAP is not implemented at this FF-A insta=
nce",
++			[INVALID_PARAMETERS] =3D
++			"INVALID_PARAMETERS: No buffer pair registered on behalf of the call=
er",
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_RX_RELEASE)] =3D {
++		{
++			[NOT_SUPPORTED] =3D
++			"NOT_SUPPORTED: FFA_RX_RELEASE is not implemented at this FF-A insta=
nce",
++			[DENIED] =3D
++			"DENIED: Caller did not have ownership of the RX buffer",
++		},
++	},
++	[FFA_ID_TO_ERRMAP_ID(FFA_RXTX_MAP)] =3D {
++		{
++			[NOT_SUPPORTED] =3D
++			"NOT_SUPPORTED: This function is not implemented at this FF-A instan=
ce",
++			[INVALID_PARAMETERS] =3D
++			"INVALID_PARAMETERS: Field(s) in input parameters incorrectly encode=
d",
++			[NO_MEMORY] =3D
++			"NO_MEMORY: Not enough memory",
++			[DENIED] =3D
++			"DENIED: Buffer pair already registered",
++		},
++	},
++};
++
++/**
++ * ffa_to_std_errno() - convert FF-A error code to standard error code
++ * @ffa_errno:	Error code returned by the FF-A ABI
++ *
++ * Map the given FF-A error code as specified
++ * by the spec to a u-boot standard error code.
++ *
++ * Return:
++ *
++ * The standard error code on success. . Otherwise, failure
++ */
++static int ffa_to_std_errno(int ffa_errno)
++{
++	int err_idx =3D -ffa_errno;
++
++	/* Map the FF-A error code to the standard u-boot error code */
++	if (err_idx > 0 && err_idx < MAX_NUMBER_FFA_ERR)
++		return ffa_to_std_errmap[err_idx];
++	return -EINVAL;
++}
++
++/**
++ * ffa_print_error_log() - print the error log corresponding to the sel=
ected FF-A ABI
++ * @ffa_id:	FF-A ABI ID
++ * @ffa_errno:	Error code returned by the FF-A ABI
++ *
++ * Map the FF-A error code to the error log relevant to the
++ * selected FF-A ABI. Then the error log is printed.
++ *
++ * Return:
++ *
++ * 0 on success. . Otherwise, failure
++ */
++static int ffa_print_error_log(u32 ffa_id, int ffa_errno)
++{
++	int err_idx =3D -ffa_errno, abi_idx =3D 0;
++
++	/* Map the FF-A error code to the corresponding error log */
++
++	if (err_idx <=3D 0 || err_idx >=3D MAX_NUMBER_FFA_ERR)
++		return -EINVAL;
++
++	if (ffa_id < FFA_FIRST_ID || ffa_id > FFA_LAST_ID)
++		return -EINVAL;
++
++	abi_idx =3D FFA_ID_TO_ERRMAP_ID(ffa_id);
++	if (abi_idx < 0 || abi_idx >=3D FFA_ERRMAP_COUNT)
++		return -EINVAL;
++
++	if (!err_msg_map[abi_idx].err_str[err_idx])
++		return -EINVAL;
++
++	log_err("%s\n", err_msg_map[abi_idx].err_str[err_idx]);
++
++	return 0;
++}
++
++/* FF-A ABIs implementation (U-Boot side) */
++
++/**
++ * invoke_ffa_fn() - SMC wrapper
++ * @args: FF-A ABI arguments to be copied to Xn registers
++ * @res: FF-A ABI return data to be copied from Xn registers
++ *
++ * Calls low level SMC implementation.
++ * This function should be implemented by the user driver.
++ */
++void __weak invoke_ffa_fn(ffa_value_t args, ffa_value_t *res)
++{
++}
++
++/**
++ * ffa_get_version_hdlr() - FFA_VERSION handler function
++ * @dev: The FF-A bus device
++ *
++ * Implement FFA_VERSION FF-A function
++ * to get from the secure world the FF-A framework version
++ * FFA_VERSION is used to discover the FF-A framework.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_get_version_hdlr(struct udevice *dev)
++{
++	u16 major, minor;
++	ffa_value_t res =3D {0};
++	int ffa_errno;
++	struct ffa_priv *uc_priv;
++
++	invoke_ffa_fn((ffa_value_t){
++			.a0 =3D FFA_SMC_32(FFA_VERSION), .a1 =3D FFA_VERSION_1_0,
++			}, &res);
++
++	ffa_errno =3D res.a0;
++	if (ffa_errno < 0) {
++		ffa_print_error_log(FFA_VERSION, ffa_errno);
++		return ffa_to_std_errno(ffa_errno);
++	}
++
++	major =3D GET_FFA_MAJOR_VERSION(res.a0);
++	minor =3D GET_FFA_MINOR_VERSION(res.a0);
++
++	log_info("FF-A driver %d.%d\nFF-A framework %d.%d\n",
++		 FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
++
++	if (major =3D=3D FFA_MAJOR_VERSION && minor >=3D FFA_MINOR_VERSION) {
++		log_info("FF-A versions are compatible\n");
++
++		if (dev) {
++			uc_priv =3D dev_get_uclass_priv(dev);
++			if (uc_priv)
++				uc_priv->fwk_version =3D res.a0;
++		}
++
++		return 0;
++	}
++
++	log_err("versions are incompatible\nExpected: %d.%d , Found: %d.%d\n",
++		FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
++
++	return -EPROTONOSUPPORT;
++}
++
++/**
++ * ffa_get_endpoint_id() - FFA_ID_GET handler function
++ * @dev: The FF-A bus device
++ *
++ * Implement FFA_ID_GET FF-A function
++ * to get from the secure world u-boot endpoint ID
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_get_endpoint_id(struct udevice *dev)
++{
++	ffa_value_t res =3D {0};
++	int ffa_errno;
++	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
++
++	invoke_ffa_fn((ffa_value_t){
++			.a0 =3D FFA_SMC_32(FFA_ID_GET),
++			}, &res);
++
++	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
++		uc_priv->id =3D GET_SELF_ENDPOINT_ID((u32)res.a2);
++		log_debug("FF-A endpoint ID is %u\n", uc_priv->id);
++
++		return 0;
++	}
++
++	ffa_errno =3D res.a2;
++
++	ffa_print_error_log(FFA_ID_GET, ffa_errno);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_set_rxtx_buffers_pages_cnt() - set the minimum number of pages i=
n each of the RX/TX buffers
++ * @dev: The FF-A bus device
++ * @prop_field: properties field obtained from FFA_FEATURES ABI
++ *
++ * Set the minimum number of pages in each of the RX/TX buffers in uc_p=
riv
++ *
++ * Return:
++ *
++ * rxtx_min_pages field contains the returned number of pages
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_set_rxtx_buffers_pages_cnt(struct udevice *dev, u32 prop=
_field)
++{
++	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
++
++	switch (prop_field) {
++	case RXTX_4K:
++		uc_priv->pair.rxtx_min_pages =3D 1;
++		break;
++	case RXTX_16K:
++		uc_priv->pair.rxtx_min_pages =3D 4;
++		break;
++	case RXTX_64K:
++		uc_priv->pair.rxtx_min_pages =3D 16;
++		break;
++	default:
++		log_err("RX/TX buffer size not supported\n");
++		return -EINVAL;
++	}
++
++	return 0;
++}
++
++/**
++ * ffa_get_rxtx_map_features_hdlr() - FFA_FEATURES handler function wit=
h FFA_RXTX_MAP argument
++ * @dev: The FF-A bus device
++ *
++ * Implement FFA_FEATURES FF-A function to retrieve the FFA_RXTX_MAP fe=
atures
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_get_rxtx_map_features_hdlr(struct udevice *dev)
++{
++	ffa_value_t res =3D {0};
++	int ffa_errno;
++
++	invoke_ffa_fn((ffa_value_t){
++			.a0 =3D FFA_SMC_32(FFA_FEATURES),
++			.a1 =3D FFA_SMC_64(FFA_RXTX_MAP),
++			}, &res);
++
++	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS))
++		return ffa_set_rxtx_buffers_pages_cnt(dev, res.a2);
++
++	ffa_errno =3D res.a2;
++	ffa_print_error_log(FFA_FEATURES, ffa_errno);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_free_rxtx_buffers() - free the RX/TX buffers
++ * @dev: The FF-A bus device
++ *
++ * Free the RX/TX buffers
++ */
++static void ffa_free_rxtx_buffers(struct udevice *dev)
++{
++	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
++
++	log_debug("Freeing FF-A RX/TX buffers\n");
++
++	if (uc_priv->pair.rxbuf) {
++		free(uc_priv->pair.rxbuf);
++		uc_priv->pair.rxbuf =3D NULL;
++	}
++
++	if (uc_priv->pair.txbuf) {
++		free(uc_priv->pair.txbuf);
++		uc_priv->pair.txbuf =3D NULL;
++	}
++}
++
++/**
++ * ffa_alloc_rxtx_buffers() - allocate the RX/TX buffers
++ * @dev: The FF-A bus device
++ *
++ * Used by ffa_map_rxtx_buffers to allocate
++ * the RX/TX buffers before mapping them. The allocated memory is physi=
cally
++ * contiguous since memalign ends up calling malloc which allocates
++ * contiguous memory in u-boot.
++ * The size of the memory allocated is the minimum allowed.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_alloc_rxtx_buffers(struct udevice *dev)
++{
++	u64 bytes;
++	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
++
++	log_debug("Using %lu 4KB page(s) for FF-A RX/TX buffers size\n",
++		  uc_priv->pair.rxtx_min_pages);
++
++	bytes =3D uc_priv->pair.rxtx_min_pages * SZ_4K;
++
++	/*
++	 * The alignment of the RX and TX buffers must be equal
++	 * to the larger translation granule size
++	 * Assumption: Memory allocated with memalign is always physically con=
tiguous
++	 */
++
++	uc_priv->pair.rxbuf =3D memalign(bytes, bytes);
++	if (!uc_priv->pair.rxbuf) {
++		log_err("failure to allocate RX buffer\n");
++		return -ENOBUFS;
++	}
++
++	log_debug("FF-A RX buffer at virtual address %p\n", uc_priv->pair.rxbu=
f);
++
++	uc_priv->pair.txbuf =3D memalign(bytes, bytes);
++	if (!uc_priv->pair.txbuf) {
++		free(uc_priv->pair.rxbuf);
++		uc_priv->pair.rxbuf =3D NULL;
++		log_err("failure to allocate the TX buffer\n");
++		return -ENOBUFS;
++	}
++
++	log_debug("FF-A TX buffer at virtual address %p\n", uc_priv->pair.txbu=
f);
++
++	/* Make sure the buffers are cleared before use */
++	memset(uc_priv->pair.rxbuf, 0, bytes);
++	memset(uc_priv->pair.txbuf, 0, bytes);
++
++	return 0;
++}
++
++/**
++ * ffa_map_rxtx_buffers_hdlr() - FFA_RXTX_MAP handler function
++ * @dev: The FF-A bus device
++ *
++ * Implement FFA_RXTX_MAP FF-A function to map the RX/TX buffers
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_map_rxtx_buffers_hdlr(struct udevice *dev)
++{
++	int ret;
++	ffa_value_t res =3D {0};
++	int ffa_errno;
++	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
++
++	ret =3D ffa_alloc_rxtx_buffers(dev);
++	if (ret)
++		return ret;
++
++	/*
++	 * we need to pass the physical addresses of the RX/TX buffers
++	 * in u-boot physical/virtual mapping is 1:1
++	 * no need to convert from virtual to physical
++	 */
++
++	invoke_ffa_fn((ffa_value_t){
++			.a0 =3D FFA_SMC_64(FFA_RXTX_MAP),
++			.a1 =3D map_to_sysmem(uc_priv->pair.txbuf),
++			.a2 =3D map_to_sysmem(uc_priv->pair.rxbuf),
++			.a3 =3D uc_priv->pair.rxtx_min_pages,
++			}, &res);
++
++	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
++		log_debug("FF-A RX/TX buffers mapped\n");
++		return 0;
++	}
++
++	ffa_errno =3D res.a2;
++	ffa_print_error_log(FFA_RXTX_MAP, ffa_errno);
++
++	ffa_free_rxtx_buffers(dev);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_unmap_rxtx_buffers_hdlr() - FFA_RXTX_UNMAP handler function
++ * @dev: The FF-A bus device
++ *
++ * Implement FFA_RXTX_UNMAP FF-A function to unmap the RX/TX buffers
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_unmap_rxtx_buffers_hdlr(struct udevice *dev)
++{
++	ffa_value_t res =3D {0};
++	int ffa_errno;
++	struct ffa_priv *uc_priv;
++
++	log_debug("unmapping FF-A RX/TX buffers\n");
++
++	uc_priv =3D dev_get_uclass_priv(dev);
++
++	invoke_ffa_fn((ffa_value_t){
++			.a0 =3D FFA_SMC_32(FFA_RXTX_UNMAP),
++			.a1 =3D PREP_SELF_ENDPOINT_ID(uc_priv->id),
++			}, &res);
++
++	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
++		ffa_free_rxtx_buffers(dev);
++		return 0;
++	}
++
++	ffa_errno =3D res.a2;
++	ffa_print_error_log(FFA_RXTX_UNMAP, ffa_errno);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_release_rx_buffer_hdlr() - FFA_RX_RELEASE handler function
++ * @dev: The FF-A bus device
++ *
++ * Invoke FFA_RX_RELEASE FF-A function to release the ownership of the =
RX buffer
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_release_rx_buffer_hdlr(struct udevice *dev)
++{
++	ffa_value_t res =3D {0};
++	int ffa_errno;
++
++	invoke_ffa_fn((ffa_value_t){
++			.a0 =3D FFA_SMC_32(FFA_RX_RELEASE),
++			}, &res);
++
++	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS))
++		return 0;
++
++	ffa_errno =3D res.a2;
++	ffa_print_error_log(FFA_RX_RELEASE, ffa_errno);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_uuid_are_identical() - check whether two given UUIDs are identic=
al
++ * @uuid1: first UUID
++ * @uuid2: second UUID
++ *
++ * Used by ffa_read_partitions_info to search for a UUID in the partiti=
ons descriptors table
++ *
++ * Return:
++ *
++ * 1 when UUIDs match. Otherwise, 0
++ */
++static bool ffa_uuid_are_identical(const struct ffa_partition_uuid *uui=
d1,
++				   const struct ffa_partition_uuid *uuid2)
++{
++	if (!uuid1 || !uuid2)
++		return 0;
++
++	return !memcmp(uuid1, uuid2, sizeof(struct ffa_partition_uuid));
++}
++
++/**
++ * ffa_read_partitions_info() - read queried partition data
++ * @dev: The FF-A bus device
++ * @count: The number of partitions queried
++ * @part_uuid: Pointer to the partition(s) UUID
++ *
++ * Read the partitions information returned by the FFA_PARTITION_INFO_G=
ET and saves it in uc_priv
++ *
++ * Return:
++ *
++ * uc_priv is updated with the partition(s) information
++ * 0 is returned on success. Otherwise, failure
++ */
++static int ffa_read_partitions_info(struct udevice *dev, u32 count,
++				    struct ffa_partition_uuid *part_uuid)
++{
++	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
++
++	if (!count) {
++		log_err("no partition detected\n");
++		return -ENODATA;
++	}
++
++	log_debug("Reading FF-A partitions data from the RX buffer\n");
++
++	if (!part_uuid) {
++		/* Querying information of all partitions */
++		u64 buf_bytes;
++		u64 data_bytes;
++		u32 desc_idx;
++		struct ffa_partition_info *parts_info;
++
++		data_bytes =3D count * sizeof(struct ffa_partition_desc);
++
++		buf_bytes =3D uc_priv->pair.rxtx_min_pages * SZ_4K;
++
++		if (data_bytes > buf_bytes) {
++			log_err("partitions data size exceeds the RX buffer size:\n");
++			log_err("    sizes in bytes: data %llu , RX buffer %llu\n",
++				data_bytes,
++				buf_bytes);
++
++			return -ENOMEM;
++		}
++
++		uc_priv->partitions.descs =3D devm_kmalloc(dev, data_bytes, __GFP_ZER=
O);
++		if (!uc_priv->partitions.descs) {
++			log_err("cannot  allocate partitions data buffer\n");
++			return -ENOMEM;
++		}
++
++		parts_info =3D uc_priv->pair.rxbuf;
++
++		for (desc_idx =3D 0 ; desc_idx < count ; desc_idx++) {
++			uc_priv->partitions.descs[desc_idx].info =3D
++				parts_info[desc_idx];
++
++			log_debug("FF-A partition ID %x : info cached\n",
++				  uc_priv->partitions.descs[desc_idx].info.id);
++		}
++
++		uc_priv->partitions.count =3D count;
++
++		log_debug("%d FF-A partition(s) found and cached\n", count);
++
++	} else {
++		u32 rx_desc_idx, cached_desc_idx;
++		struct ffa_partition_info *parts_info;
++		u8 desc_found;
++
++		parts_info =3D uc_priv->pair.rxbuf;
++
++		/*
++		 * Search for the SP IDs read from the RX buffer
++		 * in the already cached SPs.
++		 * Update the UUID when ID found.
++		 */
++		for (rx_desc_idx =3D 0; rx_desc_idx < count ; rx_desc_idx++) {
++			desc_found =3D 0;
++
++			/* Search the current ID in the cached partitions */
++			for (cached_desc_idx =3D 0;
++			     cached_desc_idx < uc_priv->partitions.count;
++			     cached_desc_idx++) {
++				/* Save the UUID */
++				if (uc_priv->partitions.descs[cached_desc_idx].info.id =3D=3D
++				    parts_info[rx_desc_idx].id) {
++					uc_priv->partitions.descs[cached_desc_idx].sp_uuid =3D
++						*part_uuid;
++
++					desc_found =3D 1;
++					break;
++				}
++			}
++
++			if (!desc_found)
++				return -ENODATA;
++		}
++	}
++
++	return  0;
++}
++
++/**
++ * ffa_query_partitions_info() - invoke FFA_PARTITION_INFO_GET and save=
 partitions data
++ * @dev: The FF-A bus device
++ * @part_uuid: Pointer to the partition(s) UUID
++ * @pcount: Pointer to the number of partitions variable filled when qu=
erying
++ *
++ * Execute the FFA_PARTITION_INFO_GET to query the partitions data.
++ * Then, call ffa_read_partitions_info to save the data in uc_priv.
++ *
++ * After reading the data the RX buffer is released using ffa_release_r=
x_buffer
++ *
++ * Return:
++ *
++ * When part_uuid is NULL, all partitions data are retrieved from secur=
e world
++ * When part_uuid is non NULL, data for partitions matching the given U=
UID are
++ * retrieved and the number of partitions is returned
++ * 0 is returned on success. Otherwise, failure
++ */
++static int ffa_query_partitions_info(struct udevice *dev, struct ffa_pa=
rtition_uuid *part_uuid,
++				     u32 *pcount)
++{
++	struct ffa_partition_uuid query_uuid =3D {0};
++	ffa_value_t res =3D {0};
++	int ffa_errno;
++
++	/*
++	 * If a UUID is specified. Information for one or more
++	 * partitions in the system is queried. Otherwise, information
++	 * for all installed partitions is queried
++	 */
++
++	if (part_uuid) {
++		if (!pcount)
++			return -EINVAL;
++
++		query_uuid =3D *part_uuid;
++	} else if (pcount) {
++		return -EINVAL;
++	}
++
++	invoke_ffa_fn((ffa_value_t){
++			.a0 =3D FFA_SMC_32(FFA_PARTITION_INFO_GET),
++			.a1 =3D query_uuid.a1,
++			.a2 =3D query_uuid.a2,
++			.a3 =3D query_uuid.a3,
++			.a4 =3D query_uuid.a4,
++			}, &res);
++
++	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
++		int ret;
++
++		/*
++		 * res.a2 contains the count of partition information descriptors
++		 * populated in the RX buffer
++		 */
++		if (res.a2) {
++			ret =3D ffa_read_partitions_info(dev, (u32)res.a2, part_uuid);
++			if (ret) {
++				log_err("failed reading SP(s) data , err (%d)\n", ret);
++				ffa_release_rx_buffer_hdlr(dev);
++				return -EINVAL;
++			}
++		}
++
++		/* Return the SP count (when querying using a UUID) */
++		if (pcount)
++			*pcount =3D (u32)res.a2;
++
++		/*
++		 * After calling FFA_PARTITION_INFO_GET the buffer ownership
++		 * is assigned to the consumer (u-boot). So, we need to give
++		 * the ownership back to the SPM or hypervisor
++		 */
++		ret =3D ffa_release_rx_buffer_hdlr(dev);
++
++		return ret;
++	}
++
++	ffa_errno =3D res.a2;
++	ffa_print_error_log(FFA_PARTITION_INFO_GET, ffa_errno);
++
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/**
++ * ffa_get_partitions_info_hdlr() - FFA_PARTITION_INFO_GET handler func=
tion
++ *	@uuid_str: pointer to the UUID string
++ *	@sp_count: address of the variable containing the number of partitio=
ns matching the UUID
++ *			 The variable is set by the driver
++ *	@sp_descs: address of the descriptors of the partitions matching the=
 UUID
++ *			 The address is set by the driver
++ *
++ * Return the number of partitions and their descriptors matching the U=
UID
++ *
++ * Query the secure partition data from uc_priv.
++ * If not found, invoke FFA_PARTITION_INFO_GET FF-A function to query t=
he partition information
++ * from secure world.
++ *
++ * A client of the FF-A driver should know the UUID of the service it w=
ants to
++ * access. It should use the UUID to request the FF-A driver to provide=
 the
++ * partition(s) information of the service. The FF-A driver uses
++ * PARTITION_INFO_GET to obtain this information. This is implemented t=
hrough
++ * ffa_get_partitions_info_hdlr() function.
++ * If the partition(s) matching the UUID found, the partition(s) inform=
ation and the
++ * number are returned.
++ * If no partition matching the UUID is found in the cached area, a new=
 FFA_PARTITION_INFO_GET
++ * call is issued.
++ * If not done yet, the UUID is updated in the cached area.
++ * This assumes that partitions data does not change in the secure worl=
d.
++ * Otherwise u-boot will have an outdated partition data. The benefit o=
f caching
++ * the information in the FF-A driver is to accommodate discovery after
++ * ExitBootServices().
++ *
++ * Return:
++ *
++ * @sp_count: the number of partitions
++ * @sp_descs: address of the partitions descriptors
++ *
++ * On success 0 is returned. Otherwise, failure
++ */
++int ffa_get_partitions_info_hdlr(struct udevice *dev, const char *uuid_=
str,
++				 u32 *sp_count, struct ffa_partition_desc **sp_descs)
++{
++	u32 i;
++	struct ffa_partition_uuid part_uuid =3D {0};
++	struct ffa_priv *uc_priv;
++	struct ffa_partition_desc *rx_descs;
++
++	uc_priv =3D dev_get_uclass_priv(dev);
++
++	if (!uc_priv->partitions.count || !uc_priv->partitions.descs) {
++		log_err("no partition installed\n");
++		return -EINVAL;
++	}
++
++	if (!uuid_str) {
++		log_err("no UUID provided\n");
++		return -EINVAL;
++	}
++
++	if (!sp_count) {
++		log_err("no count argument provided\n");
++		return -EINVAL;
++	}
++
++	if (!sp_descs) {
++		log_err("no info argument provided\n");
++		return -EINVAL;
++	}
++
++	if (uuid_str_to_le_bin(uuid_str, (unsigned char *)&part_uuid)) {
++		log_err("invalid UUID\n");
++		return -EINVAL;
++	}
++
++	log_debug("Searching FF-A partitions using the provided UUID\n");
++
++	*sp_count =3D 0;
++	*sp_descs =3D uc_priv->pair.rxbuf;
++	rx_descs =3D *sp_descs;
++
++	/* Search in the cached partitions */
++	for (i =3D 0; i < uc_priv->partitions.count; i++)
++		if (ffa_uuid_are_identical(&uc_priv->partitions.descs[i].sp_uuid,
++					   &part_uuid)) {
++			log_debug("FF-A partition ID %x matches the provided UUID\n",
++				  uc_priv->partitions.descs[i].info.id);
++
++			(*sp_count)++;
++			*rx_descs++ =3D uc_priv->partitions.descs[i];
++			}
++
++	if (!(*sp_count)) {
++		int ret;
++
++		log_debug("No FF-A partition found. Querying framework ...\n");
++
++		ret =3D ffa_query_partitions_info(dev, &part_uuid, sp_count);
++
++		if (!ret) {
++			log_debug("Number of FF-A partition(s) matching the UUID: %d\n", *sp=
_count);
++
++			if (*sp_count)
++				ret =3D ffa_get_partitions_info_hdlr(dev, uuid_str, sp_count,
++								   sp_descs);
++			else
++				ret =3D -ENODATA;
++		}
++
++		return ret;
++	}
++
++	return 0;
++}
++
++/**
++ * ffa_cache_partitions_info() - Query and saves all secure partitions =
data
++ * @dev: The FF-A bus device
++ *
++ * Invoke FFA_PARTITION_INFO_GET FF-A function to query from secure wor=
ld
++ * all partitions information.
++ *
++ * The FFA_PARTITION_INFO_GET call is issued with nil UUID as an argume=
nt.
++ * All installed partitions information are returned. We cache them in =
uc_priv
++ * and we keep the UUID field empty (in FF-A 1.0 UUID is not provided b=
y the partition descriptor)
++ *
++ * Called at the device probing level.
++ * ffa_cache_partitions_info uses ffa_query_partitions_info to get the =
data
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_cache_partitions_info(struct udevice *dev)
++{
++	return ffa_query_partitions_info(dev, NULL, NULL);
++}
++
++/**
++ * ffa_msg_send_direct_req_hdlr() - FFA_MSG_SEND_DIRECT_{REQ,RESP} hand=
ler function
++ * @dev: The FF-A bus device
++ * @dst_part_id: destination partition ID
++ * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
++ *
++ * Implement FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ * FF-A functions.
++ *
++ * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
++ * The response from the secure partition is handled by reading the
++ * FFA_MSG_SEND_DIRECT_RESP arguments.
++ *
++ * The maximum size of the data that can be exchanged is 40 bytes which=
 is
++ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
++ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_msg_send_direct_req_hdlr(struct udevice *dev, u16 dst_part_id,
++				 struct ffa_send_direct_data *msg, bool is_smc64)
++{
++	ffa_value_t res =3D {0};
++	int ffa_errno;
++	u64 req_mode, resp_mode;
++	struct ffa_priv *uc_priv;
++
++	uc_priv =3D dev_get_uclass_priv(dev);
++
++	/* No partition installed */
++	if (!uc_priv->partitions.count || !uc_priv->partitions.descs)
++		return -ENODEV;
++
++	if (is_smc64) {
++		req_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ);
++		resp_mode =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
++	} else {
++		req_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_REQ);
++		resp_mode =3D FFA_SMC_32(FFA_MSG_SEND_DIRECT_RESP);
++	}
++
++	invoke_ffa_fn((ffa_value_t){
++			.a0 =3D req_mode,
++			.a1 =3D PREP_SELF_ENDPOINT_ID(uc_priv->id) |
++				PREP_PART_ENDPOINT_ID(dst_part_id),
++			.a2 =3D 0,
++			.a3 =3D msg->data0,
++			.a4 =3D msg->data1,
++			.a5 =3D msg->data2,
++			.a6 =3D msg->data3,
++			.a7 =3D msg->data4,
++			}, &res);
++
++	while (res.a0 =3D=3D FFA_SMC_32(FFA_INTERRUPT))
++		invoke_ffa_fn((ffa_value_t){
++			.a0 =3D FFA_SMC_32(FFA_RUN),
++			.a1 =3D res.a1,
++			}, &res);
++
++	if (res.a0 =3D=3D FFA_SMC_32(FFA_SUCCESS)) {
++		/* Message sent with no response */
++		return 0;
++	}
++
++	if (res.a0 =3D=3D resp_mode) {
++		/* Message sent with response extract the return data */
++		msg->data0 =3D res.a3;
++		msg->data1 =3D res.a4;
++		msg->data2 =3D res.a5;
++		msg->data3 =3D res.a6;
++		msg->data4 =3D res.a7;
++
++		return 0;
++	}
++
++	ffa_errno =3D res.a2;
++	return ffa_to_std_errno(ffa_errno);
++}
++
++/* FF-A driver operations (used by clients for communicating with FF-A)=
*/
++
++/**
++ * ffa_partition_info_get() - FFA_PARTITION_INFO_GET driver operation
++ *	@uuid_str: pointer to the UUID string
++ *	@sp_count: address of the variable containing the number of partitio=
ns matching the UUID
++ *			 The variable is set by the driver
++ *	@sp_descs: address of the descriptors of the partitions matching the=
 UUID
++ *			 The address is set by the driver
++ *
++ * Driver operation for FFA_PARTITION_INFO_GET.
++ * Please see ffa_get_partitions_info_hdlr() description for more detai=
ls.
++ *
++ * Return:
++ *
++ * @sp_count: the number of partitions
++ * @sp_descs: address of the partitions descriptors
++ *
++ * On success 0 is returned. Otherwise, failure
++ */
++int ffa_partition_info_get(struct udevice *dev, const char *uuid_str,
++			   u32 *sp_count, struct ffa_partition_desc **sp_descs)
++{
++	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
++
++	if (!ops->partition_info_get)
++		return -ENOSYS;
++
++	return ops->partition_info_get(dev, uuid_str, sp_count, sp_descs);
++}
++
++/**
++ * ffa_sync_send_receive() - FFA_MSG_SEND_DIRECT_{REQ,RESP} driver oper=
ation
++ * @dev: The FF-A bus device
++ * @dst_part_id: destination partition ID
++ * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
++ *
++ * Driver operation for FFA_MSG_SEND_DIRECT_{REQ,RESP}.
++ * Please see ffa_msg_send_direct_req_hdlr() description for more detai=
ls.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_sync_send_receive(struct udevice *dev, u16 dst_part_id,
++			  struct ffa_send_direct_data *msg, bool is_smc64)
++{
++	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
++
++	if (!ops->sync_send_receive)
++		return -ENOSYS;
++
++	return ops->sync_send_receive(dev, dst_part_id, msg, is_smc64);
++}
++
++/**
++ * ffa_rxtx_unmap() - FFA_RXTX_UNMAP driver operation
++ * @dev: The FF-A bus device
++ *
++ * Driver operation for FFA_RXTX_UNMAP.
++ * Please see ffa_unmap_rxtx_buffers_hdlr() description for more detail=
s.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_rxtx_unmap(struct udevice *dev)
++{
++	struct ffa_bus_ops *ops =3D ffa_get_ops(dev);
++
++	if (!ops->rxtx_unmap)
++		return -ENOSYS;
++
++	return ops->rxtx_unmap(dev);
++}
++
++/**
++ * ffa_do_probe() - probing FF-A framework
++ * @dev:	the FF-A bus device (arm_ffa)
++ *
++ * Probing is triggered on demand by clients searching for the uclass.
++ * At probe level the following actions are done:
++ *	- saving the FF-A framework version in uc_priv
++ *	- querying from secure world the u-boot endpoint ID
++ *	- querying from secure world the supported features of FFA_RXTX_MAP
++ *	- mapping the RX/TX buffers
++ *	- querying from secure world all the partitions information
++ *
++ * All data queried from secure world is saved in uc_priv.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_do_probe(struct udevice *dev)
++{
++	int ret;
++
++	ret =3D ffa_get_version_hdlr(dev);
++	if (ret)
++		return ret;
++
++	ret =3D ffa_get_endpoint_id(dev);
++	if (ret)
++		return ret;
++
++	ret =3D ffa_get_rxtx_map_features_hdlr(dev);
++	if (ret)
++		return ret;
++
++	ret =3D ffa_map_rxtx_buffers_hdlr(dev);
++	if (ret)
++		return ret;
++
++	ret =3D ffa_cache_partitions_info(dev);
++	if (ret) {
++		ffa_unmap_rxtx_buffers_hdlr(dev);
++		return ret;
++	}
++
++	return 0;
++}
++
++UCLASS_DRIVER(ffa) =3D {
++	.name			=3D "ffa",
++	.id			=3D UCLASS_FFA,
++	.pre_probe		=3D ffa_do_probe,
++	.pre_remove		=3D ffa_unmap_rxtx_buffers_hdlr,
++	.per_device_auto	=3D sizeof(struct ffa_priv)
++};
+diff --git a/drivers/firmware/arm-ffa/arm-ffa.c b/drivers/firmware/arm-f=
fa/arm-ffa.c
+new file mode 100644
+index 0000000000..68df75bd9e
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/arm-ffa.c
+@@ -0,0 +1,104 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <arm_ffa.h>
++#include <arm_ffa_priv.h>
++#include <dm.h>
++#include <log.h>
++#include <asm/global_data.h>
++#include <dm/device-internal.h>
++#include <linux/errno.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++/**
++ * invoke_ffa_fn() - SMC wrapper
++ * @args: FF-A ABI arguments to be copied to Xn registers
++ * @res: FF-A ABI return data to be copied from Xn registers
++ *
++ * Calls low level SMC assembly function
++ */
++void invoke_ffa_fn(ffa_value_t args, ffa_value_t *res)
++{
++	arm_smccc_1_2_smc(&args, res);
++}
++
++/**
++ * arm_ffa_discover() - perform FF-A discovery
++ * @dev: The Arm FF-A bus device (arm_ffa)
++ * Try to discover the FF-A framework. Discovery is performed by
++ * querying the FF-A framework version from secure world using the FFA_=
VERSION ABI.
++ * Return:
++ *
++ * true on success. Otherwise, false.
++ */
++static bool arm_ffa_discover(struct udevice *dev)
++{
++	int ret;
++
++	log_info("Arm FF-A framework discovery\n");
++
++	ret =3D ffa_get_version_hdlr(dev);
++	if (ret)
++		return false;
++
++	return true;
++}
++
++/**
++ * arm_ffa_is_supported() - FF-A bus discovery callback
++ * @invoke_fn: legacy SMC invoke function (not used)
++ *
++ * Perform FF-A discovery by calling arm_ffa_discover().
++ * Discovery is performed by querying the FF-A framework version from
++ * secure world using the FFA_VERSION ABI.
++ *
++ * The FF-A driver is registered as an SMCCC feature driver. So, featur=
es discovery
++ * callbacks are called by the PSCI driver (PSCI device is the SMCCC fe=
atures
++ * root device).
++ *
++ * The FF-A driver supports the SMCCCv1.2 extended input/output registe=
rs.
++ * So, the legacy SMC invocation is not used.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static bool arm_ffa_is_supported(void (*invoke_fn)(ulong a0, ulong a1,
++						   ulong a2, ulong a3,
++						   ulong a4, ulong a5,
++						   ulong a6, ulong a7,
++						   struct arm_smccc_res *res))
++{
++	return arm_ffa_discover(NULL);
++}
++
++/* Arm FF-A driver operations */
++
++static const struct ffa_bus_ops ffa_ops =3D {
++	.partition_info_get =3D ffa_get_partitions_info_hdlr,
++	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
++	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
++};
++
++/* Registering the FF-A driver as an SMCCC feature driver */
++
++ARM_SMCCC_FEATURE_DRIVER(arm_ffa) =3D {
++	.driver_name =3D FFA_DRV_NAME,
++	.is_supported =3D arm_ffa_is_supported,
++};
++
++/* Declaring the FF-A driver under UCLASS_FFA */
++
++U_BOOT_DRIVER(arm_ffa) =3D {
++	.name		=3D FFA_DRV_NAME,
++	.id		=3D UCLASS_FFA,
++	.flags		=3D DM_REMOVE_OS_PREPARE,
++	.ops		=3D &ffa_ops,
++};
+diff --git a/drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h b/drivers/f=
irmware/arm-ffa/sandbox_arm_ffa_priv.h
+new file mode 100644
+index 0000000000..4338f9c9b1
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h
+@@ -0,0 +1,14 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __SANDBOX_ARM_FFA_PRV_H
++#define __SANDBOX_ARM_FFA_PRV_H
++
++/* Future sandbox support private declarations */
++
++#endif
+diff --git a/include/arm_ffa.h b/include/arm_ffa.h
+new file mode 100644
+index 0000000000..db9b1be995
+--- /dev/null
++++ b/include/arm_ffa.h
+@@ -0,0 +1,213 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __ARM_FFA_H
++#define __ARM_FFA_H
++
++#include <linux/printk.h>
++
++/*
++ * This header is public. It can be used by clients to access
++ * data structures and definitions they need
++ */
++
++/*
++ * struct ffa_partition_info - Partition information descriptor
++ * @id:	Partition ID
++ * @exec_ctxt:	Execution context count
++ * @properties:	Partition properties
++ *
++ * Data structure containing information about partitions instantiated =
in the system
++ * This structure is filled with the data queried by FFA_PARTITION_INFO=
_GET
++ */
++struct ffa_partition_info {
++	u16 id;
++	u16 exec_ctxt;
++/* partition supports receipt of direct requests */
++#define FFA_PARTITION_DIRECT_RECV	BIT(0)
++/* partition can send direct requests. */
++#define FFA_PARTITION_DIRECT_SEND	BIT(1)
++/* partition can send and receive indirect messages. */
++#define FFA_PARTITION_INDIRECT_MSG	BIT(2)
++	u32 properties;
++};
++
++/*
++ * struct ffa_partition_uuid - 16 bytes UUID transmitted by FFA_PARTITI=
ON_INFO_GET
++ * @a1-4:	32-bit words access to the UUID data
++ *
++ */
++struct ffa_partition_uuid {
++	u32 a1; /* w1 */
++	u32 a2; /* w2 */
++	u32 a3; /* w3 */
++	u32 a4; /* w4 */
++};
++
++/**
++ * struct ffa_partition_desc - the secure partition descriptor
++ * @info:	partition information
++ * @sp_uuid:	the secure partition UUID
++ *
++ * Each partition has its descriptor containing the partitions informat=
ion and the UUID
++ */
++struct ffa_partition_desc {
++	struct ffa_partition_info info;
++	struct ffa_partition_uuid sp_uuid;
++};
++
++/*
++ * struct ffa_send_direct_data - Data structure hosting the data
++ *                                       used by FFA_MSG_SEND_DIRECT_{R=
EQ,RESP}
++ * @data0-4:	Data read/written from/to x3-x7 registers
++ *
++ * Data structure containing the data to be sent by FFA_MSG_SEND_DIRECT=
_REQ
++ * or read from FFA_MSG_SEND_DIRECT_RESP
++ */
++
++/* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via regi=
sters */
++struct ffa_send_direct_data {
++	ulong data0; /* w3/x3 */
++	ulong data1; /* w4/x4 */
++	ulong data2; /* w5/x5 */
++	ulong data3; /* w6/x6 */
++	ulong data4; /* w7/x7 */
++};
++
++struct udevice;
++
++/**
++ * struct ffa_bus_ops - Operations for FF-A
++ * @partition_info_get:	callback for the FFA_PARTITION_INFO_GET
++ * @sync_send_receive:	callback for the FFA_MSG_SEND_DIRECT_REQ
++ * @rxtx_unmap:	callback for the FFA_RXTX_UNMAP
++ *
++ * The data structure providing all the operations supported by the dri=
ver.
++ * This structure is EFI runtime resident.
++ */
++struct ffa_bus_ops {
++	int (*partition_info_get)(struct udevice *dev, const char *uuid_str,
++				  u32 *sp_count, struct ffa_partition_desc **sp_descs);
++	int (*sync_send_receive)(struct udevice *dev, u16 dst_part_id,
++				 struct ffa_send_direct_data *msg,
++				 bool is_smc64);
++	int (*rxtx_unmap)(struct udevice *dev);
++};
++
++#define ffa_get_ops(dev)        ((struct ffa_bus_ops *)(dev)->driver->o=
ps)
++
++/**
++ * ffa_rxtx_unmap() - FFA_RXTX_UNMAP driver operation
++ * Please see ffa_unmap_rxtx_buffers_hdlr() description for more detail=
s.
++ */
++int ffa_rxtx_unmap(struct udevice *dev);
++
++/**
++ * ffa_unmap_rxtx_buffers_hdlr() - FFA_RXTX_UNMAP handler function
++ * @dev: The arm_ffa bus device
++ *
++ * This function implements FFA_RXTX_UNMAP FF-A function
++ * to unmap the RX/TX buffers
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_unmap_rxtx_buffers_hdlr(struct udevice *dev);
++
++/**
++ * ffa_sync_send_receive() - FFA_MSG_SEND_DIRECT_{REQ,RESP} driver oper=
ation
++ * Please see ffa_msg_send_direct_req_hdlr() description for more detai=
ls.
++ */
++int ffa_sync_send_receive(struct udevice *dev, u16 dst_part_id,
++			  struct ffa_send_direct_data *msg, bool is_smc64);
++
++/**
++ * ffa_msg_send_direct_req_hdlr() - FFA_MSG_SEND_DIRECT_{REQ,RESP} hand=
ler function
++ * @dev: The arm_ffa bus device
++ * @dst_part_id: destination partition ID
++ * @msg: pointer to the message data preallocated by the client (in/out=
)
++ * @is_smc64: select 64-bit or 32-bit FF-A ABI
++ *
++ * This function implements FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ * FF-A functions.
++ *
++ * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
++ * The response from the secure partition is handled by reading the
++ * FFA_MSG_SEND_DIRECT_RESP arguments.
++ *
++ * The maximum size of the data that can be exchanged is 40 bytes which=
 is
++ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
++ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_msg_send_direct_req_hdlr(struct udevice *dev, u16 dst_part_id,
++				 struct ffa_send_direct_data *msg, bool is_smc64);
++
++/**
++ * ffa_partition_info_get() - FFA_PARTITION_INFO_GET driver operation
++ * Please see ffa_get_partitions_info_hdlr() description for more detai=
ls.
++ */
++int ffa_partition_info_get(struct udevice *dev, const char *uuid_str,
++			   u32 *sp_count, struct ffa_partition_desc **sp_descs);
++
++/**
++ * ffa_get_partitions_info_hdlr() - FFA_PARTITION_INFO_GET handler func=
tion
++ *	@uuid_str: pointer to the UUID string
++ *	@sp_count: address of the variable containing the number of partitio=
ns matching the UUID
++ *			 The variable is set by the driver
++ *	@sp_descs: address of the descriptors of the partitions matching the=
 UUID
++ *			 The address is set by the driver
++ *
++ * Return the number of partitions and their descriptors matching the U=
UID
++ *
++ * Query the secure partition data from uc_priv.
++ * If not found, invoke FFA_PARTITION_INFO_GET
++ * FF-A function to query the partition information from secure world.
++ *
++ * A client of the FF-A driver should know the UUID of the service it w=
ants to
++ * access. It should use the UUID to request the FF-A driver to provide=
 the
++ * partition(s) information of the service. The FF-A driver uses
++ * PARTITION_INFO_GET to obtain this information. This is implemented t=
hrough
++ * ffa_get_partitions_info_hdlr() function.
++ * A new FFA_PARTITION_INFO_GET call is issued (first one performed thr=
ough
++ * ffa_cache_partitions_info) allowing to retrieve the partition(s) inf=
ormation.
++ * They are not saved (already done). We only update the UUID in the ca=
ched area.
++ * This assumes that partitions data does not change in the secure worl=
d.
++ * Otherwise u-boot will have an outdated partition data. The benefit o=
f caching
++ * the information in the FF-A driver is to accommodate discovery after
++ * ExitBootServices().
++ *
++ * Return:
++ *
++ * @sp_count: the number of partitions
++ * @sp_descs: address of the partitions descriptors
++ *
++ * On success 0 is returned. Otherwise, failure
++ */
++int ffa_get_partitions_info_hdlr(struct udevice *dev, const char *uuid_=
str,
++				 u32 *sp_count, struct ffa_partition_desc **sp_descs);
++
++struct ffa_priv;
++
++/**
++ * ffa_set_smc_conduit() - Set the SMC conduit
++ * @dev: The FF-A bus device
++ *
++ * Selects the SMC conduit by setting the FF-A ABI invoke function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_set_smc_conduit(struct udevice *dev);
++
++#endif
+diff --git a/include/arm_ffa_priv.h b/include/arm_ffa_priv.h
+new file mode 100644
+index 0000000000..d564c33c64
+--- /dev/null
++++ b/include/arm_ffa_priv.h
+@@ -0,0 +1,246 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __ARM_FFA_PRV_H
++#define __ARM_FFA_PRV_H
++
++#include <mapmem.h>
++#include <linux/bitfield.h>
++#include <linux/bitops.h>
++
++/* This header is exclusively used by the FF-A Uclass and FF-A driver(s=
) */
++
++/* Arm FF-A driver name */
++#define FFA_DRV_NAME "arm_ffa"
++
++/* The FF-A SMC function definitions */
++
++#if CONFIG_IS_ENABLED(SANDBOX)
++
++/* Providing Arm SMCCC declarations to sandbox */
++
++/**
++ * struct sandbox_smccc_1_2_regs - emulated SMC call arguments or resul=
ts
++ * @a0-a17 argument values from registers 0 to 17
++ */
++struct sandbox_smccc_1_2_regs {
++	ulong a0;
++	ulong a1;
++	ulong a2;
++	ulong a3;
++	ulong a4;
++	ulong a5;
++	ulong a6;
++	ulong a7;
++	ulong a8;
++	ulong a9;
++	ulong a10;
++	ulong a11;
++	ulong a12;
++	ulong a13;
++	ulong a14;
++	ulong a15;
++	ulong a16;
++	ulong a17;
++};
++
++typedef struct sandbox_smccc_1_2_regs ffa_value_t;
++
++#define ARM_SMCCC_FAST_CALL		1UL
++#define ARM_SMCCC_OWNER_STANDARD	4
++#define ARM_SMCCC_SMC_32		0
++#define ARM_SMCCC_SMC_64		1
++#define ARM_SMCCC_TYPE_SHIFT		31
++#define ARM_SMCCC_CALL_CONV_SHIFT	30
++#define ARM_SMCCC_OWNER_MASK		0x3f
++#define ARM_SMCCC_OWNER_SHIFT		24
++#define ARM_SMCCC_FUNC_MASK		0xffff
++
++#define ARM_SMCCC_CALL_VAL(type, calling_convention, owner, func_num) \
++	(((type) << ARM_SMCCC_TYPE_SHIFT) | \
++	((calling_convention) << ARM_SMCCC_CALL_CONV_SHIFT) | \
++	(((owner) & ARM_SMCCC_OWNER_MASK) << ARM_SMCCC_OWNER_SHIFT) | \
++	((func_num) & ARM_SMCCC_FUNC_MASK))
++
++#else
++/* CONFIG_ARM64 */
++#include <linux/arm-smccc.h>
++typedef struct arm_smccc_1_2_regs ffa_value_t;
++#endif
++
++/* Defining the function pointer type for the function executing the FF=
-A ABIs */
++typedef void (*invoke_ffa_fn_t)(ffa_value_t args, ffa_value_t *res);
++
++/* FF-A driver version definitions */
++
++#define MAJOR_VERSION_MASK		GENMASK(30, 16)
++#define MINOR_VERSION_MASK		GENMASK(15, 0)
++#define GET_FFA_MAJOR_VERSION(x)		\
++				((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
++#define GET_FFA_MINOR_VERSION(x)		\
++				((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
++#define PACK_VERSION_INFO(major, minor)			\
++	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
++	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
++
++#define FFA_MAJOR_VERSION		(1)
++#define FFA_MINOR_VERSION		(0)
++#define FFA_VERSION_1_0		\
++			PACK_VERSION_INFO(FFA_MAJOR_VERSION, FFA_MINOR_VERSION)
++
++/* Endpoint ID mask (u-boot endpoint ID) */
++
++#define GET_SELF_ENDPOINT_ID_MASK		GENMASK(15, 0)
++#define GET_SELF_ENDPOINT_ID(x)		\
++			((u16)(FIELD_GET(GET_SELF_ENDPOINT_ID_MASK, (x))))
++
++#define PREP_SELF_ENDPOINT_ID_MASK		GENMASK(31, 16)
++#define PREP_SELF_ENDPOINT_ID(x)		\
++			(FIELD_PREP(PREP_SELF_ENDPOINT_ID_MASK, (x)))
++
++/* Partition endpoint ID mask  (partition with which u-boot communicate=
s with) */
++
++#define PREP_PART_ENDPOINT_ID_MASK		GENMASK(15, 0)
++#define PREP_PART_ENDPOINT_ID(x)		\
++			(FIELD_PREP(PREP_PART_ENDPOINT_ID_MASK, (x)))
++
++/* Definitions of the Arm FF-A interfaces supported by the Arm FF-A dri=
ver */
++
++#define FFA_SMC(calling_convention, func_num)				\
++	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
++			   ARM_SMCCC_OWNER_STANDARD, (func_num))
++
++#define FFA_SMC_32(func_num)				FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
++#define FFA_SMC_64(func_num)				FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
++
++enum ffa_abis {
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
++	FFA_RUN                   =3D 0x6d,
++	FFA_MSG_SEND_DIRECT_REQ   =3D 0x6f,
++	FFA_MSG_SEND_DIRECT_RESP  =3D 0x70,
++
++	/* To be updated when adding new FFA IDs */
++	FFA_FIRST_ID              =3D FFA_ERROR, /* Lowest number ID */
++	FFA_LAST_ID               =3D FFA_MSG_SEND_DIRECT_RESP, /* Highest num=
ber ID */
++};
++
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
++
++extern int ffa_to_std_errmap[MAX_NUMBER_FFA_ERR];
++
++/* Container structure and helper macros to map between an FF-A error a=
nd relevant error log */
++struct ffa_abi_errmap {
++	char *err_str[MAX_NUMBER_FFA_ERR];
++};
++
++#define FFA_ERRMAP_COUNT (FFA_LAST_ID - FFA_FIRST_ID + 1)
++#define FFA_ID_TO_ERRMAP_ID(ffa_id) ((ffa_id) - FFA_FIRST_ID)
++
++/**
++ * enum ffa_rxtx_buf_sizes - minimum sizes supported
++ * for the RX/TX buffers
++ */
++enum ffa_rxtx_buf_sizes {
++	RXTX_4K,
++	RXTX_64K,
++	RXTX_16K
++};
++
++/**
++ * struct ffa_rxtxpair - Hosts the RX/TX buffers virtual addresses
++ * @rxbuf:	virtual address of the RX buffer
++ * @txbuf:	virtual address of the TX buffer
++ * @rxtx_min_pages:	RX/TX buffers minimum size in pages
++ *
++ * Hosts the virtual addresses of the mapped RX/TX buffers
++ * These addresses are used by the FF-A functions that use the RX/TX bu=
ffers
++ */
++struct ffa_rxtxpair {
++	void *rxbuf; /* Virtual address returned by memalign */
++	void *txbuf; /* Virtual address returned by memalign */
++	size_t rxtx_min_pages; /* Minimum number of pages in each of the RX/TX=
 buffers */
++};
++
++struct ffa_partition_desc;
++
++/**
++ * struct ffa_partitions - descriptors for all secure partitions
++ * @count:	The number of partitions descriptors
++ * @descs	The partitions descriptors table
++ *
++ * Contains the partitions descriptors table
++ */
++struct ffa_partitions {
++	u32 count;
++	struct ffa_partition_desc *descs; /* Virtual address */
++};
++
++/**
++ * struct ffa_priv - the driver private data structure
++ *
++ * @fwk_version:	FF-A framework version
++ * @emul:	FF-A sandbox emulator
++ * @id:	u-boot endpoint ID
++ * @partitions:	The partitions descriptors structure
++ * @pair:	The RX/TX buffers pair
++ *
++ * The device private data structure containing all the
++ * data read from secure world.
++ */
++struct ffa_priv {
++	u32 fwk_version;
++	struct udevice *emul;
++	u16 id;
++	struct ffa_partitions partitions;
++	struct ffa_rxtxpair pair;
++};
++
++/**
++ * ffa_get_version_hdlr() - FFA_VERSION handler function
++ * @dev: The FF-A bus device
++ *
++ * Implement FFA_VERSION FF-A function
++ * to get from the secure world the FF-A framework version
++ * FFA_VERSION is used to discover the FF-A framework.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int ffa_get_version_hdlr(struct udevice *dev);
++
++/**
++ * invoke_ffa_fn() - SMC wrapper
++ * @args: FF-A ABI arguments to be copied to Xn registers
++ * @res: FF-A ABI return data to be copied from Xn registers
++ *
++ * Calls low level SMC implementation.
++ * This function should be implemented by the user driver.
++ */
++void invoke_ffa_fn(ffa_value_t args, ffa_value_t *res);
++
++#endif
+diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
+index 307ad6931c..3c6af2e3d2 100644
+--- a/include/dm/uclass-id.h
++++ b/include/dm/uclass-id.h
+@@ -4,6 +4,11 @@
+  *
+  * (C) Copyright 2012
+  * Pavel Herrmann <morpheus.ibis@gmail.com>
++ *
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+=20
+ #ifndef _DM_UCLASS_ID_H
+@@ -57,6 +62,7 @@ enum uclass_id {
+ 	UCLASS_ETH,		/* Ethernet device */
+ 	UCLASS_ETH_PHY,		/* Ethernet PHY device */
+ 	UCLASS_EXTCON,		/* External Connector Class */
++	UCLASS_FFA,		/* Arm Firmware Framework for Armv8-A */
+ 	UCLASS_FIRMWARE,	/* Firmware */
+ 	UCLASS_FPGA,		/* FPGA device */
+ 	UCLASS_FUZZING_ENGINE,	/* Fuzzing engine */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm=
_ffa-efi-unmap-RX-TX-buffers.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-bo=
ot/corstone1000/0004-arm_ffa-efi-unmap-RX-TX-buffers.patch
deleted file mode 100644
index 3a3dae83..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-ef=
i-unmap-RX-TX-buffers.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From b09b391e33e024a18842dfdc99282d0050cc5fcb Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 6 Oct 2022 15:04:25 +0100
-Subject: [PATCH 04/42] arm_ffa: efi: unmap RX/TX buffers
-
-unmap RX/TX buffers at ExitBootServices()
-
-Unmapping the RX/TX buffers created by u-boot is needed before EFI
-runtime.
-
-At EFI runtime the linux kernel takes care of allocating its own RX/TX
-buffers and registering them with the secure world.
-
-Secure world should be using the RX/TX buffers created by the kernel.
-So, RX/TX buffers created by u-boot must be unmapped.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Simon Glass <sjg@chromium.org>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v8: pass NULL device pointer to the FF-A bus operation
-v7: replace debug() by log_err()
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- lib/efi_loader/efi_boottime.c | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index e65ca6a4cb..3481f2afe7 100644
---- a/lib/efi_loader/efi_boottime.c
-+++ b/lib/efi_loader/efi_boottime.c
-@@ -3,6 +3,9 @@
-  * EFI application boot time services
-  *
-  * Copyright (c) 2016 Alexander Graf
-+ *
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-  */
-=20
- #include <common.h>
-@@ -23,6 +26,10 @@
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
-@@ -2178,6 +2185,12 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
- 		dm_remove_devices_flags(DM_REMOVE_ACTIVE_ALL);
- 	}
-=20
-+#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
-+		/* unmap FF-A RX/TX buffers */
-+		if (ffa_bus_ops_get()->rxtx_unmap(NULL))
-+			log_err("Can't unmap FF-A RX/TX buffers\n");
-+#endif
-+
- 	/* Patch out unsupported runtime function */
- 	efi_runtime_detach();
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-FF-=
A-v15-arm_ffa-introduce-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0005-FF-A-v15-arm_ffa-introduce-armffa-command.=
patch
new file mode 100644
index 00000000..aeb4bb90
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-FF-A-v15-a=
rm_ffa-introduce-armffa-command.patch
@@ -0,0 +1,436 @@
+From 3eb4fb19777383f5f05b7ce74da141f53ffc4374 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 10 May 2023 17:27:01 +0100
+Subject: [PATCH 05/33] FF-A v15: arm_ffa: introduce armffa command
+
+Provide armffa command showcasing the use of the U-Boot FF-A support
+
+armffa is a command showcasing how to invoke FF-A operations.
+This provides a guidance to the client developers on how to
+call the FF-A bus interfaces. The command also allows to gather secure
+partitions information and ping these  partitions. The command is also
+helpful in testing the communication with secure partitions.
+
+For more details please refer to the command documentation [1].
+
+[1]: doc/usage/cmd/armffa.rst
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
+---
+ MAINTAINERS                      |   2 +
+ cmd/Kconfig                      |  10 ++
+ cmd/Makefile                     |   1 +
+ cmd/armffa.c                     | 202 +++++++++++++++++++++++++++++++
+ doc/arch/arm64.ffa.rst           |   7 ++
+ doc/usage/cmd/armffa.rst         |  93 ++++++++++++++
+ doc/usage/index.rst              |   1 +
+ drivers/firmware/arm-ffa/Kconfig |   1 +
+ 8 files changed, 317 insertions(+)
+ create mode 100644 cmd/armffa.c
+ create mode 100644 doc/usage/cmd/armffa.rst
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 9c5ebf312c..4ae82229fc 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -269,7 +269,9 @@ F:	configs/cortina_presidio-asic-pnand_defconfig
+ ARM FF-A
+ M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+ S:	Maintained
++F:	cmd/armffa.c
+ F:	doc/arch/arm64.ffa.rst
++F:	doc/usage/cmd/armffa.rst
+ F:	drivers/firmware/arm-ffa/
+ F:	include/arm_ffa.h
+ F:	include/sandbox_arm_ffa.h
+diff --git a/cmd/Kconfig b/cmd/Kconfig
+index 02e54f1e50..79b4f8367a 100644
+--- a/cmd/Kconfig
++++ b/cmd/Kconfig
+@@ -935,6 +935,16 @@ endmenu
+=20
+ menu "Device access commands"
+=20
++config CMD_ARMFFA
++	bool "Arm FF-A test command"
++	depends on ARM_FFA_TRANSPORT
++	help
++	  Provides a test command for the FF-A support
++	  supported options:
++		- Listing the partition(s) info
++		- Sending a data pattern to the specified partition
++		- Displaying the arm_ffa device info
++
+ config CMD_ARMFLASH
+ 	#depends on FLASH_CFI_DRIVER
+ 	bool "armflash"
+diff --git a/cmd/Makefile b/cmd/Makefile
+index 6c37521b4e..7d20a85a46 100644
+--- a/cmd/Makefile
++++ b/cmd/Makefile
+@@ -12,6 +12,7 @@ obj-y +=3D panic.o
+ obj-y +=3D version.o
+=20
+ # command
++obj-$(CONFIG_CMD_ARMFFA) +=3D armffa.o
+ obj-$(CONFIG_CMD_2048) +=3D 2048.o
+ obj-$(CONFIG_CMD_ACPI) +=3D acpi.o
+ obj-$(CONFIG_CMD_ADDRMAP) +=3D addrmap.o
+diff --git a/cmd/armffa.c b/cmd/armffa.c
+new file mode 100644
+index 0000000000..7e6eafc03a
+--- /dev/null
++++ b/cmd/armffa.c
+@@ -0,0 +1,202 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++#include <common.h>
++#include <arm_ffa.h>
++#include <command.h>
++#include <dm.h>
++#include <mapmem.h>
++#include <stdlib.h>
++#include <asm/io.h>
++
++/* Select the right physical address formatting according to the platfo=
rm */
++#ifdef CONFIG_PHYS_64BIT
++#define PhysAddrLength "ll"
++#else
++#define PhysAddrLength ""
++#endif
++#define PHYS_ADDR_LN "%" PhysAddrLength "x"
++
++/**
++ * ffa_get_dev() - Return the FF-A device
++ * @devp:	pointer to the FF-A device
++ *
++ * Search for the FF-A device.
++ *
++ * Return:
++ * 0 on success. Otherwise, failure
++ */
++static int ffa_get_dev(struct udevice **devp)
++{
++	int ret;
++
++	ret =3D uclass_first_device_err(UCLASS_FFA, devp);
++	if (ret) {
++		log_err("Cannot find FF-A bus device\n");
++		return ret;
++	}
++
++	return 0;
++}
++
++/**
++ * do_ffa_getpart() - implementation of the getpart subcommand
++ * @cmdtp:		Command Table
++ * @flag:		flags
++ * @argc:		number of arguments
++ * @argv:		arguments
++ *
++ * Query a secure partition information. The secure partition UUID is p=
rovided
++ * as an argument. The function uses the arm_ffa driver
++ * partition_info_get operation which implements FFA_PARTITION_INFO_GET
++ * ABI to retrieve the data. The input UUID string is expected to be in=
 big
++ * endian format.
++ *
++ * Return:
++ *
++ * CMD_RET_SUCCESS: on success, otherwise failure
++ */
++static int do_ffa_getpart(struct cmd_tbl *cmdtp, int flag, int argc,
++			  char *const argv[])
++{
++	u32 count =3D 0;
++	int ret;
++	struct ffa_partition_desc *descs;
++	u32 i;
++	struct udevice *dev;
++
++	if (argc !=3D 2) {
++		log_err("Missing argument\n");
++		return CMD_RET_USAGE;
++	}
++
++	ret =3D ffa_get_dev(&dev);
++	if (ret)
++		return CMD_RET_FAILURE;
++
++	/* Ask the driver to fill the buffer with the SPs info */
++
++	ret =3D ffa_partition_info_get(dev, argv[1], &count, &descs);
++	if (ret) {
++		log_err("Failure in querying partition(s) info (error code: %d)\n", r=
et);
++		return CMD_RET_FAILURE;
++	}
++
++	/* SPs found , show the partition information */
++	for (i =3D 0; i < count ; i++) {
++		log_info("Partition: id =3D %x , exec_ctxt %x , properties %x\n",
++			 descs[i].info.id,
++			 descs[i].info.exec_ctxt,
++			 descs[i].info.properties);
++	}
++
++	return CMD_RET_SUCCESS;
++}
++
++/**
++ * do_ffa_ping() - implementation of the ping subcommand
++ * @cmdtp:		Command Table
++ * @flag:		flags
++ * @argc:		number of arguments
++ * @argv:		arguments
++ *
++ * Send data to a secure partition. The secure partition UUID is provid=
ed
++ * as an argument. Use the arm_ffa driver sync_send_receive operation
++ * which implements FFA_MSG_SEND_DIRECT_{REQ,RESP} ABIs to send/receive=
 data.
++ *
++ * Return:
++ *
++ * CMD_RET_SUCCESS: on success, otherwise failure
++ */
++static int do_ffa_ping(struct cmd_tbl *cmdtp, int flag, int argc, char =
*const argv[])
++{
++	struct ffa_send_direct_data msg =3D {
++			.data0 =3D 0xaaaaaaaa,
++			.data1 =3D 0xbbbbbbbb,
++			.data2 =3D 0xcccccccc,
++			.data3 =3D 0xdddddddd,
++			.data4 =3D 0xeeeeeeee,
++	};
++	u16 part_id;
++	int ret;
++	struct udevice *dev;
++
++	if (argc !=3D 2) {
++		log_err("Missing argument\n");
++		return CMD_RET_USAGE;
++	}
++
++	part_id =3D strtoul(argv[1], NULL, 16);
++	if (!part_id) {
++		log_err("Partition ID can not be 0\n");
++		return CMD_RET_USAGE;
++	}
++
++	ret =3D ffa_get_dev(&dev);
++	if (ret)
++		return CMD_RET_FAILURE;
++
++	ret =3D ffa_sync_send_receive(dev, part_id, &msg, 1);
++	if (!ret) {
++		u8 cnt;
++
++		log_info("SP response:\n[LSB]\n");
++		for (cnt =3D 0;
++		     cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64);
++		     cnt++)
++			log_info("%llx\n", ((u64 *)&msg)[cnt]);
++		return CMD_RET_SUCCESS;
++	}
++
++	log_err("Sending direct request error (%d)\n", ret);
++	return CMD_RET_FAILURE;
++}
++
++/**
++ *do_ffa_devlist() - implementation of the devlist subcommand
++ * @cmdtp: [in]		Command Table
++ * @flag:		flags
++ * @argc:		number of arguments
++ * @argv:		arguments
++ *
++ * Query the device belonging to the UCLASS_FFA
++ * class.
++ *
++ * Return:
++ *
++ * CMD_RET_SUCCESS: on success, otherwise failure
++ */
++static int do_ffa_devlist(struct cmd_tbl *cmdtp, int flag, int argc, ch=
ar *const argv[])
++{
++	struct udevice *dev;
++	int ret;
++
++	ret =3D ffa_get_dev(&dev);
++	if (ret)
++		return CMD_RET_FAILURE;
++
++	log_info("device %s, addr " PHYS_ADDR_LN ", driver %s, ops " PHYS_ADDR=
_LN "\n",
++		 dev->name,
++		 map_to_sysmem(dev),
++		 dev->driver->name,
++		 map_to_sysmem(dev->driver->ops));
++
++	return CMD_RET_SUCCESS;
++}
++
++static char armffa_help_text[] =3D
++	"getpart <partition UUID>\n"
++	"       - lists the partition(s) info\n"
++	"ping <partition ID>\n"
++	"       - sends a data pattern to the specified partition\n"
++	"devlist\n"
++	"       - displays information about the FF-A device/driver\n";
++
++U_BOOT_CMD_WITH_SUBCMDS(armffa, "Arm FF-A test command", armffa_help_te=
xt,
++			U_BOOT_SUBCMD_MKENT(getpart, 2, 1, do_ffa_getpart),
++			U_BOOT_SUBCMD_MKENT(ping, 2, 1, do_ffa_ping),
++			U_BOOT_SUBCMD_MKENT(devlist, 1, 1, do_ffa_devlist));
+diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
+index 4f817f053c..aefd527447 100644
+--- a/doc/arch/arm64.ffa.rst
++++ b/doc/arch/arm64.ffa.rst
+@@ -205,6 +205,13 @@ The following features are provided:
+=20
+ - FF-A bus can be compiled and used without EFI
+=20
++The armffa command
++-----------------------------------
++
++armffa is a command showcasing how to use the FF-A bus and how to invok=
e the driver operations.
++
++Please refer the command documentation at :doc:`../usage/cmd/armffa`
++
+ Example of boot logs with FF-A enabled
+ --------------------------------------
+=20
+diff --git a/doc/usage/cmd/armffa.rst b/doc/usage/cmd/armffa.rst
+new file mode 100644
+index 0000000000..3d422686c1
+--- /dev/null
++++ b/doc/usage/cmd/armffa.rst
+@@ -0,0 +1,93 @@
++.. SPDX-License-Identifier: GPL-2.0+:
++
++armffa command
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++Synopsis
++--------
++
++::
++
++   armffa [sub-command] [arguments]
++
++   sub-commands:
++
++        getpart [partition UUID]
++
++            lists the partition(s) info
++
++        ping [partition ID]
++
++            sends a data pattern to the specified partition
++
++        devlist
++
++            displays information about the FF-A device/driver
++
++Description
++-----------
++
++armffa is a command showcasing how to use the FF-A bus and how to invok=
e its operations.
++
++This provides a guidance to the client developers on how to call the FF=
-A bus interfaces.
++
++The command also allows to gather secure partitions information and pin=
g these  partitions.
++
++The command is also helpful in testing the communication with secure pa=
rtitions.
++
++Example
++-------
++
++The following examples are run on Corstone-1000 platform.
++
++* ping
++
++::
++
++   corstone1000# armffa ping 0x8003
++   SP response:
++   [LSB]
++   fffffffe
++   0
++   0
++   0
++   0
++
++* ping (failure case)
++
++::
++
++   corstone1000# armffa ping 0
++   Sending direct request error (-22)
++
++* getpart
++
++::
++
++   corstone1000# armffa getpart 33d532ed-e699-0942-c09c-a798d9cd722d
++   Partition: id =3D 8003 , exec_ctxt 1 , properties 3
++
++* getpart (failure case)
++
++::
++
++   corstone1000# armffa getpart 33d532ed-e699-0942-c09c-a798d9cd7221
++   INVALID_PARAMETERS: Unrecognized UUID
++   Failure in querying partitions count (error code: -22)
++
++* devlist
++
++::
++
++   corstone1000# armffa devlist
++   device name arm_ffa, dev 00000000fdf41c30, driver name arm_ffa, ops =
00000000fffc0e98
++
++Configuration
++-------------
++
++The command is available if CONFIG_CMD_ARMFFA=3Dy and CONFIG_ARM_FFA_TR=
ANSPORT=3Dy.
++
++Return value
++------------
++
++The return value $? is 0 (true) on success, 1 (false) on failure.
+diff --git a/doc/usage/index.rst b/doc/usage/index.rst
+index 388e59f173..e462de2806 100644
+--- a/doc/usage/index.rst
++++ b/doc/usage/index.rst
+@@ -22,6 +22,7 @@ Shell commands
+=20
+    cmd/acpi
+    cmd/addrmap
++   cmd/armffa
+    cmd/askenv
+    cmd/base
+    cmd/bdinfo
+diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
+index 9200c8028b..a7d5392859 100644
+--- a/drivers/firmware/arm-ffa/Kconfig
++++ b/drivers/firmware/arm-ffa/Kconfig
+@@ -5,6 +5,7 @@ config ARM_FFA_TRANSPORT
+ 	depends on DM && ARM64
+ 	select ARM_SMCCC
+ 	select ARM_SMCCC_FEATURES
++	imply CMD_ARMFFA
+ 	select LIB_UUID
+ 	select DEVRES
+ 	help
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm=
_ffa-introduce-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0005-arm_ffa-introduce-armffa-command.patch
deleted file mode 100644
index b00e3d9f..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-in=
troduce-armffa-command.patch
+++ /dev/null
@@ -1,364 +0,0 @@
-From f3bc86a7ec63c0454577cb6712395c577b2cfd66 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 6 Jun 2022 12:46:38 +0100
-Subject: [PATCH 05/42] arm_ffa: introduce armffa command
-
-Provide armffa command showcasing the use of the FF-A driver
-
-The armffa command allows to query secure partitions data from
-the secure world and exchanging messages with the partitions
-using 64-bit FF-A direct messaging.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Simon Glass <sjg@chromium.org>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v8:
-
-* update partition_info_get() second argument to be an SP count
-* pass NULL device pointer to the FF-A bus discovery and operations
-
-v7:
-
-* adapt do_ffa_dev_list() following the recent update on
-  uclass_first_device/uclass_next_device functions (they return void now=
)
-* set armffa command to use 64-bit direct messaging
-
-v4:
-
-* remove pattern data in do_ffa_msg_send_direct_req
-
-v3:
-
-* use the new driver interfaces (partition_info_get, sync_send_receive)
-  in armffa command
-
-v2:
-
-* replace use of ffa_helper_init_device function by
- ffa_helper_bus_discover
-
-v1:
-
-* introduce armffa command
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- MAINTAINERS                      |   1 +
- cmd/Kconfig                      |  10 ++
- cmd/Makefile                     |   2 +
- cmd/armffa.c                     | 237 +++++++++++++++++++++++++++++++
- drivers/firmware/arm-ffa/Kconfig |   1 +
- 5 files changed, 251 insertions(+)
- create mode 100644 cmd/armffa.c
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 509619d31c..61ce6c436f 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -267,6 +267,7 @@ F:	configs/cortina_presidio-asic-pnand_defconfig
- ARM FF-A
- M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
- S:	Maintained
-+F:	cmd/armffa.c
- F:	doc/arch/arm64.ffa.rst
- F:	drivers/firmware/arm-ffa/
- F:	include/arm_ffa.h
-diff --git a/cmd/Kconfig b/cmd/Kconfig
-index b2d7598717..7d0a40e8ac 100644
---- a/cmd/Kconfig
-+++ b/cmd/Kconfig
-@@ -924,6 +924,16 @@ endmenu
-=20
- menu "Device access commands"
-=20
-+config CMD_ARMFFA
-+	bool "Arm FF-A test command"
-+	depends on ARM_FFA_TRANSPORT
-+	help
-+	  Provides a test command for the Arm FF-A driver
-+	  supported options:
-+		- Listing the partition(s) info
-+		- Sending a data pattern to the specified partition
-+		- Displaying the arm_ffa device info
-+
- config CMD_ARMFLASH
- 	#depends on FLASH_CFI_DRIVER
- 	bool "armflash"
-diff --git a/cmd/Makefile b/cmd/Makefile
-index 0b6a96c1d9..c757f1647d 100644
---- a/cmd/Makefile
-+++ b/cmd/Makefile
-@@ -12,6 +12,8 @@ obj-y +=3D panic.o
- obj-y +=3D version.o
-=20
- # command
-+
-+obj-$(CONFIG_CMD_ARMFFA) +=3D armffa.o
- obj-$(CONFIG_CMD_ACPI) +=3D acpi.o
- obj-$(CONFIG_CMD_ADDRMAP) +=3D addrmap.o
- obj-$(CONFIG_CMD_AES) +=3D aes.o
-diff --git a/cmd/armffa.c b/cmd/armffa.c
-new file mode 100644
-index 0000000000..d2e8687bfb
---- /dev/null
-+++ b/cmd/armffa.c
-@@ -0,0 +1,237 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <arm_ffa.h>
-+#include <asm/io.h>
-+#include <common.h>
-+#include <command.h>
-+#include <dm.h>
-+#include <mapmem.h>
-+#include <stdlib.h>
-+
-+/**
-+ * do_ffa_get_singular_partition_info - implementation of the getpart s=
ubcommand
-+ * @cmdtp:		Command Table
-+ * @flag:		flags
-+ * @argc:		number of arguments
-+ * @argv:		arguments
-+ *
-+ * This function queries the secure partition information which the UUI=
D is provided
-+ * as an argument. The function uses the arm_ffa driver partition_info_=
get operation
-+ * to retrieve the data.
-+ * The input UUID string is expected to be in big endian format.
-+ *
-+ * Return:
-+ *
-+ * CMD_RET_SUCCESS: on success, otherwise failure
-+ */
-+static int do_ffa_get_singular_partition_info(struct cmd_tbl *cmdtp, in=
t flag, int argc,
-+					      char *const argv[])
-+{
-+	u32 count =3D 0;
-+	int ret;
-+	struct ffa_partition_info *parts_info;
-+	u32 info_idx;
-+
-+	if (argc !=3D 1)
-+		return -EINVAL;
-+
-+	/* Mode 1: getting the number of secure partitions */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, argv[0], &count, N=
ULL);
-+	if (ret !=3D 0) {
-+		ffa_err("Failure in querying partitions count (error code: %d)", ret)=
;
-+		return ret;
-+	}
-+
-+	if (!count) {
-+		ffa_info("No secure partition found");
-+		return ret;
-+	}
-+
-+	/*
-+	 * pre-allocate a buffer to be filled by the driver
-+	 * with ffa_partition_info structs
-+	 */
-+
-+	ffa_info("Pre-allocating %d partition(s) info structures", count);
-+
-+	parts_info =3D calloc(count, sizeof(struct ffa_partition_info));
-+	if (!parts_info)
-+		return -EINVAL;
-+
-+	/*
-+	 * ask the driver to fill the buffer with the SPs info
-+	 */
-+
-+	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, argv[0], &count, p=
arts_info);
-+	if (ret !=3D 0) {
-+		ffa_err("Failure in querying partition(s) info (error code: %d)", ret=
);
-+		free(parts_info);
-+		return ret;
-+	}
-+
-+	/*
-+	 * SPs found , show the partition information
-+	 */
-+	for (info_idx =3D 0; info_idx < count ; info_idx++) {
-+		ffa_info("Partition: id =3D 0x%x , exec_ctxt 0x%x , properties 0x%x",
-+			 parts_info[info_idx].id,
-+			 parts_info[info_idx].exec_ctxt,
-+			 parts_info[info_idx].properties);
-+	}
-+
-+	free(parts_info);
-+
-+	return 0;
-+}
-+
-+/**
-+ * do_ffa_msg_send_direct_req - implementation of the ping subcommand
-+ * @cmdtp:		Command Table
-+ * @flag:		flags
-+ * @argc:		number of arguments
-+ * @argv:		arguments
-+ *
-+ * This function sends data to the secure partition which the ID is pro=
vided
-+ * as an argument. The function uses the arm_ffa driver sync_send_recei=
ve operation
-+ * to send data.
-+ *
-+ * Return:
-+ *
-+ * CMD_RET_SUCCESS: on success, otherwise failure
-+ */
-+int  do_ffa_msg_send_direct_req(struct cmd_tbl *cmdtp, int flag, int ar=
gc,
-+				char *const argv[])
-+{
-+	struct ffa_send_direct_data msg =3D {
-+			.data0 =3D 0xaaaaaaaa,
-+			.data1 =3D 0xbbbbbbbb,
-+			.data2 =3D 0xcccccccc,
-+			.data3 =3D 0xdddddddd,
-+			.data4 =3D 0xeeeeeeee,
-+	};
-+	u16 part_id;
-+	int ret;
-+
-+	if (argc !=3D 1)
-+		return -EINVAL;
-+
-+	errno =3D 0;
-+	part_id =3D strtoul(argv[0], NULL, 16);
-+
-+	if (errno) {
-+		ffa_err("Invalid partition ID");
-+		return -EINVAL;
-+	}
-+
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(NULL, part_id, &msg, 1);
-+	if (ret =3D=3D 0) {
-+		u8 cnt;
-+
-+		ffa_info("SP response:\n[LSB]");
-+		for (cnt =3D 0;
-+		     cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64);
-+		     cnt++)
-+			ffa_info("0x%llx", ((u64 *)&msg)[cnt]);
-+	} else {
-+		ffa_err("Sending direct request error (%d)", ret);
-+	}
-+
-+	return ret;
-+}
-+
-+/**
-+ *do_ffa_dev_list - implementation of the devlist subcommand
-+ * @cmdtp: [in]		Command Table
-+ * @flag:		flags
-+ * @argc:		number of arguments
-+ * @argv:		arguments
-+ *
-+ * This function queries the devices belonging to the UCLASS_FFA
-+ * class. Currently, one device is expected to show up: the arm_ffa dev=
ice
-+ *
-+ * Return:
-+ *
-+ * CMD_RET_SUCCESS: on success, otherwise failure
-+ */
-+int do_ffa_dev_list(struct cmd_tbl *cmdtp, int flag, int argc, char *co=
nst argv[])
-+{
-+	struct udevice *dev =3D NULL;
-+	int i;
-+
-+	ffa_info("arm_ffa uclass entries:");
-+
-+	for (i =3D 0, uclass_first_device(UCLASS_FFA, &dev);
-+	     dev;
-+	     uclass_next_device(&dev), i++) {
-+		ffa_info("entry %d - instance %08x, ops %08x, plat %08x",
-+			 i,
-+			 (u32)map_to_sysmem(dev),
-+			 (u32)map_to_sysmem(dev->driver->ops),
-+			 (u32)map_to_sysmem(dev_get_plat(dev)));
-+	}
-+
-+	return 0;
-+}
-+
-+static struct cmd_tbl armffa_commands[] =3D {
-+	U_BOOT_CMD_MKENT(getpart, 1, 1, do_ffa_get_singular_partition_info, ""=
, ""),
-+	U_BOOT_CMD_MKENT(ping, 1, 1, do_ffa_msg_send_direct_req, "", ""),
-+	U_BOOT_CMD_MKENT(devlist, 0, 1, do_ffa_dev_list, "", ""),
-+};
-+
-+/**
-+ * do_armffa - the armffa command main function
-+ * @cmdtp:	Command Table
-+ * @flag:		flags
-+ * @argc:		number of arguments
-+ * @argv:		arguments
-+ *
-+ * This function identifies which armffa subcommand to run.
-+ * Then, it makes sure the arm_ffa device is probed and
-+ * ready for use.
-+ * Then, it runs the subcommand.
-+ *
-+ * Return:
-+ *
-+ * CMD_RET_SUCCESS: on success, otherwise failure
-+ */
-+static int do_armffa(struct cmd_tbl *cmdtp, int flag, int argc, char *c=
onst argv[])
-+{
-+	struct cmd_tbl *armffa_cmd;
-+	int ret;
-+
-+	if (argc < 2)
-+		return CMD_RET_USAGE;
-+
-+	armffa_cmd =3D find_cmd_tbl(argv[1], armffa_commands, ARRAY_SIZE(armff=
a_commands));
-+
-+	argc -=3D 2;
-+	argv +=3D 2;
-+
-+	if (!armffa_cmd || argc > armffa_cmd->maxargs)
-+		return CMD_RET_USAGE;
-+
-+	ret =3D ffa_bus_discover(NULL);
-+	if (ret !=3D 0)
-+		return cmd_process_error(cmdtp, ret);
-+
-+	if (!ffa_bus_ops_get())
-+		return -EINVAL;
-+
-+	ret =3D armffa_cmd->cmd(armffa_cmd, flag, argc, argv);
-+
-+	return cmd_process_error(armffa_cmd, ret);
-+}
-+
-+U_BOOT_CMD(armffa, 4, 1, do_armffa,
-+	   "Arm FF-A operations test command",
-+	   "getpart <partition UUID>\n"
-+	   "	 - lists the partition(s) info\n"
-+	   "ping <partition ID>\n"
-+	   "	 - sends a data pattern to the specified partition\n"
-+	   "devlist\n"
-+	   "	 - displays the arm_ffa device info\n");
-diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index e4914b9bc7..be4df89d23 100644
---- a/drivers/firmware/arm-ffa/Kconfig
-+++ b/drivers/firmware/arm-ffa/Kconfig
-@@ -4,6 +4,7 @@ config ARM_FFA_TRANSPORT
- 	bool "Enable Arm Firmware Framework for Armv8-A driver"
- 	depends on DM && ARM64
- 	select ARM_SMCCC
-+	select CMD_ARMFFA
- 	select LIB_UUID
- 	select DEVRES
- 	help
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-FF-=
A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch b/meta-arm-bsp/recipes=
-bsp/u-boot/u-boot/corstone1000/0006-FF-A-v15-arm_ffa-introduce-sandbox-F=
F-A-support.patch
new file mode 100644
index 00000000..4f94b722
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-FF-A-v15-a=
rm_ffa-introduce-sandbox-FF-A-support.patch
@@ -0,0 +1,1314 @@
+From 4f104ef6804ffd6483d166840d113630be85edb0 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 17 Jul 2023 15:18:58 +0100
+Subject: [PATCH 06/33] FF-A v15: arm_ffa: introduce sandbox FF-A support
+
+Emulate Secure World's FF-A ABIs and allow testing U-Boot FF-A support
+
+Features of the sandbox FF-A support:
+
+- Introduce an FF-A emulator
+- Introduce an FF-A device driver for FF-A comms with emulated Secure Wo=
rld
+- Provides test methods allowing to read the status of the inspected ABI=
s
+
+The sandbox FF-A emulator supports only 64-bit direct messaging.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
+---
+ MAINTAINERS                                   |   3 +-
+ arch/sandbox/dts/sandbox.dtsi                 |   9 +
+ arch/sandbox/dts/test.dts                     |   9 +
+ arch/sandbox/include/asm/sandbox_arm_ffa.h    |  72 ++
+ .../include/asm/sandbox_arm_ffa_priv.h        | 121 +++
+ configs/sandbox64_defconfig                   |   2 +
+ configs/sandbox_defconfig                     |   2 +
+ doc/arch/arm64.ffa.rst                        |  19 +-
+ doc/arch/sandbox/sandbox.rst                  |   1 +
+ drivers/firmware/arm-ffa/Kconfig              |  13 +-
+ drivers/firmware/arm-ffa/Makefile             |  10 +-
+ drivers/firmware/arm-ffa/ffa-emul-uclass.c    | 720 ++++++++++++++++++
+ .../firmware/arm-ffa/sandbox_arm_ffa_priv.h   |  14 -
+ drivers/firmware/arm-ffa/sandbox_ffa.c        | 110 +++
+ include/dm/uclass-id.h                        |   1 +
+ 15 files changed, 1084 insertions(+), 22 deletions(-)
+ create mode 100644 arch/sandbox/include/asm/sandbox_arm_ffa.h
+ create mode 100644 arch/sandbox/include/asm/sandbox_arm_ffa_priv.h
+ create mode 100644 drivers/firmware/arm-ffa/ffa-emul-uclass.c
+ delete mode 100644 drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h
+ create mode 100644 drivers/firmware/arm-ffa/sandbox_ffa.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 4ae82229fc..679a3acdd8 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -269,12 +269,13 @@ F:	configs/cortina_presidio-asic-pnand_defconfig
+ ARM FF-A
+ M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+ S:	Maintained
++F:	arch/sandbox/include/asm/sandbox_arm_ffa.h
++F:	arch/sandbox/include/asm/sandbox_arm_ffa_priv.h
+ F:	cmd/armffa.c
+ F:	doc/arch/arm64.ffa.rst
+ F:	doc/usage/cmd/armffa.rst
+ F:	drivers/firmware/arm-ffa/
+ F:	include/arm_ffa.h
+-F:	include/sandbox_arm_ffa.h
+=20
+ ARM FREESCALE IMX
+ M:	Stefano Babic <sbabic@denx.de>
+diff --git a/arch/sandbox/dts/sandbox.dtsi b/arch/sandbox/dts/sandbox.dt=
si
+index 30a305c4d2..94a08814b8 100644
+--- a/arch/sandbox/dts/sandbox.dtsi
++++ b/arch/sandbox/dts/sandbox.dtsi
+@@ -445,6 +445,15 @@
+ 	thermal {
+ 		compatible =3D "sandbox,thermal";
+ 	};
++
++	arm-ffa-emul {
++		compatible =3D "sandbox,arm-ffa-emul";
++
++		sandbox-arm-ffa {
++				compatible =3D "sandbox,arm-ffa";
++		};
++	};
++
+ };
+=20
+ &cros_ec {
+diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
+index ff9f9222e6..c6807ee031 100644
+--- a/arch/sandbox/dts/test.dts
++++ b/arch/sandbox/dts/test.dts
+@@ -1820,6 +1820,15 @@
+ 	extcon {
+ 		compatible =3D "sandbox,extcon";
+ 	};
++
++	arm-ffa-emul {
++		compatible =3D "sandbox,arm-ffa-emul";
++
++		sandbox-arm-ffa {
++			compatible =3D "sandbox,arm-ffa";
++		};
++	};
++
+ };
+=20
+ #include "sandbox_pmic.dtsi"
+diff --git a/arch/sandbox/include/asm/sandbox_arm_ffa.h b/arch/sandbox/i=
nclude/asm/sandbox_arm_ffa.h
+new file mode 100644
+index 0000000000..be2790f496
+--- /dev/null
++++ b/arch/sandbox/include/asm/sandbox_arm_ffa.h
+@@ -0,0 +1,72 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __SANDBOX_ARM_FFA_H
++#define __SANDBOX_ARM_FFA_H
++
++#include <arm_ffa.h>
++
++/*
++ * This header provides public sandbox FF-A emulator declarations
++ * and declarations needed by FF-A sandbox clients
++ */
++
++/* UUIDs strings of the emulated services */
++#define SANDBOX_SERVICE1_UUID	"ed32d533-4209-99e6-2d72-cdd998a79cc0"
++#define SANDBOX_SERVICE2_UUID	"ed32d544-4209-99e6-2d72-cdd998a79cc0"
++
++/* IDs of the emulated secure partitions (SPs) */
++#define SANDBOX_SP1_ID 0x1245
++#define SANDBOX_SP2_ID 0x9836
++#define SANDBOX_SP3_ID 0x6452
++#define SANDBOX_SP4_ID 0x7814
++
++/* Invalid service UUID (no matching SP) */
++#define SANDBOX_SERVICE3_UUID	"55d532ed-0942-e699-722d-c09ca798d9cd"
++
++/* Invalid service UUID (invalid UUID string format) */
++#define SANDBOX_SERVICE4_UUID	"32ed-0942-e699-722d-c09ca798d9cd"
++
++/* Number of valid services */
++#define SANDBOX_SP_COUNT_PER_VALID_SERVICE	2
++
++/**
++ * struct ffa_sandbox_data - query ABI state data structure
++ * @data0_size:	size of the first argument
++ * @data0:	pointer to the first argument
++ * @data1_size>:	size of the second argument
++ * @data1:	pointer to the second argument
++ *
++ * Used to pass various types of data with different sizes between
++ * the test cases and the sandbox emulator.
++ * The data is for querying FF-A ABIs state.
++ */
++struct ffa_sandbox_data {
++	u32 data0_size; /* size of the first argument */
++	void *data0; /* pointer to the first argument */
++	u32 data1_size; /* size of the second argument */
++	void *data1; /* pointer to the second argument */
++};
++
++/* The sandbox FF-A  emulator public functions */
++
++/**
++ * sandbox_query_ffa_emul_state() - Inspect the FF-A ABIs
++ * @queried_func_id:	The FF-A function to be queried
++ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
++ *
++ * Query the status of FF-A ABI specified in the input argument.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int sandbox_query_ffa_emul_state(u32 queried_func_id,
++				 struct ffa_sandbox_data *func_data);
++
++#endif
+diff --git a/arch/sandbox/include/asm/sandbox_arm_ffa_priv.h b/arch/sand=
box/include/asm/sandbox_arm_ffa_priv.h
+new file mode 100644
+index 0000000000..b0881822d7
+--- /dev/null
++++ b/arch/sandbox/include/asm/sandbox_arm_ffa_priv.h
+@@ -0,0 +1,121 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __SANDBOX_ARM_FFA_PRV_H
++#define __SANDBOX_ARM_FFA_PRV_H
++
++#include <arm_ffa_priv.h>
++
++/* This header is exclusively used by the Sandbox FF-A driver and emula=
tor */
++
++/* Non-secure physical FF-A instance */
++#define NS_PHYS_ENDPOINT_ID (0)
++
++#define GET_NS_PHYS_ENDPOINT_ID_MASK		GENMASK(31, 16)
++#define GET_NS_PHYS_ENDPOINT_ID(x)		\
++			((u16)(FIELD_GET(GET_NS_PHYS_ENDPOINT_ID_MASK, (x))))
++
++/* Helper macro for reading the destination partition ID */
++#define GET_DST_SP_ID_MASK		GENMASK(15, 0)
++#define GET_DST_SP_ID(x)		\
++			((u16)(FIELD_GET(GET_DST_SP_ID_MASK, (x))))
++
++/* Helper macro for setting the source partition ID */
++#define PREP_SRC_SP_ID_MASK		GENMASK(31, 16)
++#define PREP_SRC_SP_ID(x)		\
++			(FIELD_PREP(PREP_SRC_SP_ID_MASK, (x)))
++
++/* Helper macro for setting the destination endpoint ID */
++#define PREP_NS_PHYS_ENDPOINT_ID_MASK		GENMASK(15, 0)
++#define PREP_NS_PHYS_ENDPOINT_ID(x)		\
++			(FIELD_PREP(PREP_NS_PHYS_ENDPOINT_ID_MASK, (x)))
++
++/*  RX/TX buffers minimum size */
++#define RXTX_BUFFERS_MIN_SIZE (RXTX_4K)
++#define RXTX_BUFFERS_MIN_PAGES (1)
++
++/* MBZ registers info */
++
++/* x1-x7 MBZ */
++#define FFA_X1X7_MBZ_CNT (7)
++#define FFA_X1X7_MBZ_REG_START (&res->a1)
++
++/* x4-x7 MBZ */
++#define FFA_X4X7_MBZ_CNT (4)
++#define FFA_X4X7_MBZ_REG_START (&res->a4)
++
++/* x3-x7 MBZ */
++#define FFA_X3X7_MBZ_CNT (5)
++#define FFA_X3_MBZ_REG_START (&res->a3)
++
++/* number of emulated FF-A secure partitions (SPs) */
++#define SANDBOX_PARTITIONS_CNT (4)
++
++/* Binary data of the emulated services UUIDs */
++
++/* service 1  UUID binary data (little-endian format) */
++#define SANDBOX_SERVICE1_UUID_A1	0xed32d533
++#define SANDBOX_SERVICE1_UUID_A2	0x99e64209
++#define SANDBOX_SERVICE1_UUID_A3	0x9cc02d72
++#define SANDBOX_SERVICE1_UUID_A4	0xcdd998a7
++
++/* service 2  UUID binary data (little-endian format) */
++#define SANDBOX_SERVICE2_UUID_A1	0xed32d544
++#define SANDBOX_SERVICE2_UUID_A2	0x99e64209
++#define SANDBOX_SERVICE2_UUID_A3	0x9cc02d72
++#define SANDBOX_SERVICE2_UUID_A4	0xcdd998a7
++
++/**
++ * struct ffa_rxtxpair_info - structure hosting the RX/TX buffers flags
++ * @rxbuf_owned:	RX buffer ownership flag (the owner is non secure worl=
d)
++ * @rxbuf_mapped:	RX buffer mapping flag
++ * @txbuf_owned	TX buffer ownership flag
++ * @txbuf_mapped:	TX buffer mapping flag
++ * @rxtx_buf_size:	RX/TX buffers size
++ *
++ * Hosts the ownership/mapping flags of the RX/TX buffers
++ * When a buffer is owned/mapped its corresponding flag is set to 1 oth=
erwise 0.
++ */
++struct ffa_rxtxpair_info {
++	u8 rxbuf_owned;
++	u8 rxbuf_mapped;
++	u8 txbuf_owned;
++	u8 txbuf_mapped;
++	u32 rxtx_buf_size;
++};
++
++/**
++ * struct sandbox_ffa_emul - emulator data
++ *
++ * @fwk_version:	FF-A framework version
++ * @id:	u-boot endpoint ID
++ * @partitions:	The partitions descriptors structure
++ * @pair:	The RX/TX buffers pair
++ * @pair_info:	The RX/TX buffers pair flags and size
++ * @test_ffa_data:	The data of the FF-A bus under test
++ *
++ * Hosts all the emulated secure world data.
++ */
++struct sandbox_ffa_emul {
++	u32 fwk_version;
++	u16 id;
++	struct ffa_partitions partitions;
++	struct ffa_rxtxpair pair;
++	struct ffa_rxtxpair_info pair_info;
++};
++
++/**
++ * ffa_emul_find() - Finds the FF-A emulator
++ * @dev:	the sandbox FF-A device (sandbox-arm-ffa)
++ * @emulp:	the FF-A emulator device (sandbox-ffa-emul)
++ * Return:
++ * 0 on success. Otherwise, failure
++ */
++int ffa_emul_find(struct udevice *dev, struct udevice **emulp);
++
++#endif
+diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
+index 98b3e0cda4..2db69b8e52 100644
+--- a/configs/sandbox64_defconfig
++++ b/configs/sandbox64_defconfig
+@@ -260,3 +260,5 @@ CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
+ CONFIG_UNIT_TEST=3Dy
+ CONFIG_UT_TIME=3Dy
+ CONFIG_UT_DM=3Dy
++CONFIG_NVMXIP_QSPI=3Dy
++CONFIG_ARM_FFA_TRANSPORT=3Dy
+diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
+index 1ec44d5b33..f77733377d 100644
+--- a/configs/sandbox_defconfig
++++ b/configs/sandbox_defconfig
+@@ -344,3 +344,5 @@ CONFIG_TEST_FDTDEC=3Dy
+ CONFIG_UNIT_TEST=3Dy
+ CONFIG_UT_TIME=3Dy
+ CONFIG_UT_DM=3Dy
++CONFIG_CMD_2048=3Dy
++CONFIG_ARM_FFA_TRANSPORT=3Dy
+diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
+index aefd527447..b7c754fa3d 100644
+--- a/doc/arch/arm64.ffa.rst
++++ b/doc/arch/arm64.ffa.rst
+@@ -33,6 +33,10 @@ The U-Boot FF-A support provides the following parts:
+=20
+ - A Uclass driver providing generic FF-A methods.
+ - An Arm FF-A device driver providing Arm-specific methods and reusing =
the Uclass methods.
++- A sandbox emulator for Arm FF-A, emulates the FF-A side of the Secure=
 World and provides
++  FF-A ABIs inspection methods.
++- An FF-A sandbox device driver for FF-A communication with the emulate=
d Secure World.
++  The driver leverages the FF-A Uclass to establish FF-A communication.
+=20
+ FF-A and SMC specifications
+ -------------------------------------------
+@@ -62,6 +66,7 @@ CONFIG_ARM_FFA_TRANSPORT
+     Enables the FF-A support. Turn this on if you want to use FF-A
+     communication.
+     When using an Arm 64-bit platform, the Arm FF-A driver will be used=
.
++    When using sandbox, the sandbox FF-A emulator and FF-A sandbox driv=
er will be used.
+=20
+ FF-A ABIs under the hood
+ ---------------------------------------
+@@ -98,10 +103,8 @@ architecture features including FF-A bus.
+=20
+     Class     Index  Probed  Driver                Name
+    -----------------------------------------------------------
+-   ...
+     firmware      0  [ + ]   psci                      |-- psci
+     ffa                   0  [   ]   arm_ffa               |   `-- arm_=
ffa
+-   ...
+=20
+ The PSCI driver is bound to the PSCI device and when probed it tries to=
 discover
+ the architecture features by calling a callback the features drivers pr=
ovide.
+@@ -205,6 +208,18 @@ The following features are provided:
+=20
+ - FF-A bus can be compiled and used without EFI
+=20
++Relationship between the sandbox emulator and the FF-A device
++---------------------------------------------------------------
++
++::
++
++   =3D> dm tree
++
++    Class     Index  Probed  Driver                Name
++   -----------------------------------------------------------
++   ffa_emul      0  [ + ]   sandbox_ffa_emul      `-- arm-ffa-emul
++    ffa                  0  [    ]   sandbox_arm_ffa               `-- =
sandbox-arm-ffa
++
+ The armffa command
+ -----------------------------------
+=20
+diff --git a/doc/arch/sandbox/sandbox.rst b/doc/arch/sandbox/sandbox.rst
+index 77ca6bc4cc..a3631de749 100644
+--- a/doc/arch/sandbox/sandbox.rst
++++ b/doc/arch/sandbox/sandbox.rst
+@@ -200,6 +200,7 @@ Supported Drivers
+=20
+ U-Boot sandbox supports these emulations:
+=20
++- Arm FF-A
+ - Block devices
+ - Chrome OS EC
+ - GPIO
+diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
+index a7d5392859..d75f8b53fd 100644
+--- a/drivers/firmware/arm-ffa/Kconfig
++++ b/drivers/firmware/arm-ffa/Kconfig
+@@ -2,9 +2,9 @@
+=20
+ config ARM_FFA_TRANSPORT
+ 	bool "Enable Arm Firmware Framework for Armv8-A driver"
+-	depends on DM && ARM64
+-	select ARM_SMCCC
+-	select ARM_SMCCC_FEATURES
++	depends on DM && (ARM64 || SANDBOX)
++	select ARM_SMCCC if !SANDBOX
++	select ARM_SMCCC_FEATURES if !SANDBOX
+ 	imply CMD_ARMFFA
+ 	select LIB_UUID
+ 	select DEVRES
+@@ -33,5 +33,10 @@ config ARM_FFA_TRANSPORT
+ 	  Generic FF-A methods are implemented in the Uclass (arm-ffa-uclass.c=
).
+ 	  Arm specific methods are implemented in the Arm driver (arm-ffa.c).
+=20
+-	  For more details about the FF-A support, please refer to doc/arch/ar=
m64.ffa.rst
++	  FF-A sandbox is provided to run FF-A under sandbox and allows to tes=
t the FF-A Uclass.
++	  Sandbox support includes an emulator for Arm FF-A which emulates the=
 FF-A side of
++	  the Secure World and provides FF-A ABIs inspection methods (ffa-emul=
-uclass.c).
++	  An FF-A sandbox driver is also provided for FF-A communication with =
the emulated
++	  Secure World (sandbox_ffa.c).
+=20
++	  For more details about the FF-A support, please refer to doc/arch/ar=
m64.ffa.rst
+diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
+index 11b1766285..318123a7f4 100644
+--- a/drivers/firmware/arm-ffa/Makefile
++++ b/drivers/firmware/arm-ffa/Makefile
+@@ -5,4 +5,12 @@
+ # Authors:
+ #   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+=20
+-obj-y +=3D arm-ffa-uclass.o arm-ffa.o
++# build the generic FF-A methods
++obj-y +=3D arm-ffa-uclass.o
++ifeq ($(CONFIG_SANDBOX),y)
++# build the FF-A sandbox emulator and driver
++obj-y +=3D ffa-emul-uclass.o sandbox_ffa.o
++else
++# build the Arm64 FF-A driver
++obj-y +=3D arm-ffa.o
++endif
+diff --git a/drivers/firmware/arm-ffa/ffa-emul-uclass.c b/drivers/firmwa=
re/arm-ffa/ffa-emul-uclass.c
+new file mode 100644
+index 0000000000..5562bbaac3
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/ffa-emul-uclass.c
+@@ -0,0 +1,720 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++#include <common.h>
++#include <dm.h>
++#include <mapmem.h>
++#include <string.h>
++#include <asm/global_data.h>
++#include <asm/sandbox_arm_ffa.h>
++#include <asm/sandbox_arm_ffa_priv.h>
++#include <dm/device-internal.h>
++#include <dm/lists.h>
++#include <dm/root.h>
++#include <linux/errno.h>
++#include <linux/sizes.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++/* The partitions (SPs) table */
++static struct ffa_partition_desc sandbox_partitions[SANDBOX_PARTITIONS_=
CNT] =3D {
++	{
++		.info =3D { .id =3D SANDBOX_SP1_ID, .exec_ctxt =3D 0x5687, .propertie=
s =3D 0x89325621 },
++		.sp_uuid =3D {
++			.a1 =3D SANDBOX_SERVICE1_UUID_A1,
++			.a2 =3D SANDBOX_SERVICE1_UUID_A2,
++			.a3 =3D SANDBOX_SERVICE1_UUID_A3,
++			.a4 =3D SANDBOX_SERVICE1_UUID_A4,
++		}
++	},
++	{
++		.info =3D { .id =3D SANDBOX_SP3_ID, .exec_ctxt =3D 0x7687, .propertie=
s =3D 0x23325621 },
++		.sp_uuid =3D {
++			.a1 =3D SANDBOX_SERVICE2_UUID_A1,
++			.a2 =3D SANDBOX_SERVICE2_UUID_A2,
++			.a3 =3D SANDBOX_SERVICE2_UUID_A3,
++			.a4 =3D SANDBOX_SERVICE2_UUID_A4,
++		}
++	},
++	{
++		.info =3D { .id =3D SANDBOX_SP2_ID, .exec_ctxt =3D 0x9587, .propertie=
s =3D 0x45325621 },
++		.sp_uuid =3D {
++			.a1 =3D SANDBOX_SERVICE1_UUID_A1,
++			.a2 =3D SANDBOX_SERVICE1_UUID_A2,
++			.a3 =3D SANDBOX_SERVICE1_UUID_A3,
++			.a4 =3D SANDBOX_SERVICE1_UUID_A4,
++		}
++	},
++	{
++		.info =3D { .id =3D SANDBOX_SP4_ID, .exec_ctxt =3D 0x1487, .propertie=
s =3D 0x70325621 },
++		.sp_uuid =3D {
++			.a1 =3D SANDBOX_SERVICE2_UUID_A1,
++			.a2 =3D SANDBOX_SERVICE2_UUID_A2,
++			.a3 =3D SANDBOX_SERVICE2_UUID_A3,
++			.a4 =3D SANDBOX_SERVICE2_UUID_A4,
++		}
++	}
++
++};
++
++/* The emulator functions */
++
++/**
++ * sandbox_ffa_version() - Emulated FFA_VERSION handler function
++ * @emul: The sandbox FF-A emulator device
++ * @pargs: The SMC call input arguments a0-a7
++ * @res:  The SMC return data
++ *
++ * Emulate FFA_VERSION FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++
++static int sandbox_ffa_version(struct udevice *emul, ffa_value_t *pargs=
, ffa_value_t *res)
++{
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	priv->fwk_version =3D FFA_VERSION_1_0;
++	res->a0 =3D priv->fwk_version;
++
++	/* x1-x7 MBZ */
++	memset(FFA_X1X7_MBZ_REG_START, 0, FFA_X1X7_MBZ_CNT * sizeof(ulong));
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_id_get() - Emulated FFA_ID_GET handler function
++ * @emul: The sandbox FF-A emulator device
++ * @pargs: The SMC call input arguments a0-a7
++ * @res:  The SMC return data
++ *
++ * Emulate FFA_ID_GET FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_id_get(struct udevice *emul, ffa_value_t *pargs,=
 ffa_value_t *res)
++{
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
++	res->a1 =3D 0;
++
++	priv->id =3D NS_PHYS_ENDPOINT_ID;
++	res->a2 =3D priv->id;
++
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_features() - Emulated FFA_FEATURES handler function
++ * @pargs: The SMC call input arguments a0-a7
++ * @res:  The SMC return data
++ *
++ * Emulate FFA_FEATURES FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_features(ffa_value_t *pargs, ffa_value_t *res)
++{
++	res->a1 =3D 0;
++
++	if (pargs->a1 =3D=3D FFA_SMC_64(FFA_RXTX_MAP)) {
++		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
++		res->a2 =3D RXTX_BUFFERS_MIN_SIZE;
++		res->a3 =3D 0;
++		/* x4-x7 MBZ */
++		memset(FFA_X4X7_MBZ_REG_START, 0, FFA_X4X7_MBZ_CNT * sizeof(ulong));
++		return 0;
++	}
++
++	res->a0 =3D FFA_SMC_32(FFA_ERROR);
++	res->a2 =3D -NOT_SUPPORTED;
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++	log_err("FF-A interface %lx not implemented\n", pargs->a1);
++
++	return ffa_to_std_errmap[NOT_SUPPORTED];
++}
++
++/**
++ * sandbox_ffa_partition_info_get() - Emulated FFA_PARTITION_INFO_GET h=
andler
++ * @emul: The sandbox FF-A emulator device
++ * @pargs: The SMC call input arguments a0-a7
++ * @res:  The SMC return data
++ *
++ * Emulate FFA_PARTITION_INFO_GET FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_partition_info_get(struct udevice *emul, ffa_val=
ue_t *pargs,
++					  ffa_value_t *res)
++{
++	struct ffa_partition_info *rxbuf_desc_info =3D NULL;
++	u32 descs_cnt;
++	u32 descs_size_bytes;
++	int ret;
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	res->a0 =3D FFA_SMC_32(FFA_ERROR);
++
++	if (!priv->pair.rxbuf) {
++		res->a2 =3D -DENIED;
++		ret =3D ffa_to_std_errmap[DENIED];
++		goto cleanup;
++	}
++
++	if (priv->pair_info.rxbuf_owned) {
++		res->a2 =3D -BUSY;
++		ret =3D ffa_to_std_errmap[BUSY];
++		goto cleanup;
++	}
++
++	if (!priv->partitions.descs) {
++		priv->partitions.descs =3D sandbox_partitions;
++		priv->partitions.count =3D SANDBOX_PARTITIONS_CNT;
++	}
++
++	descs_size_bytes =3D SANDBOX_PARTITIONS_CNT *
++		sizeof(struct ffa_partition_desc);
++
++	/* Abort if the RX buffer size is smaller than the descs buffer size *=
/
++	if ((priv->pair_info.rxtx_buf_size * SZ_4K) < descs_size_bytes) {
++		res->a2 =3D -NO_MEMORY;
++		ret =3D ffa_to_std_errmap[NO_MEMORY];
++		goto cleanup;
++	}
++
++	rxbuf_desc_info =3D priv->pair.rxbuf;
++
++	/* No UUID specified. Return the information of all partitions */
++	if (!pargs->a1 && !pargs->a2 && !pargs->a3 && !pargs->a4) {
++		for (descs_cnt =3D 0; descs_cnt < SANDBOX_PARTITIONS_CNT; descs_cnt++=
)
++			*(rxbuf_desc_info++) =3D priv->partitions.descs[descs_cnt].info;
++
++		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
++		res->a2 =3D SANDBOX_PARTITIONS_CNT;
++		/* Transfer ownership to the consumer: the non secure world */
++		priv->pair_info.rxbuf_owned =3D 1;
++		ret =3D 0;
++
++		goto cleanup;
++	}
++
++	/* A UUID specified. Return the info of all SPs matching the UUID */
++
++	for (descs_cnt =3D 0 ; descs_cnt < SANDBOX_PARTITIONS_CNT ; descs_cnt+=
+)
++		if (pargs->a1 =3D=3D priv->partitions.descs[descs_cnt].sp_uuid.a1 &&
++		    pargs->a2 =3D=3D priv->partitions.descs[descs_cnt].sp_uuid.a2 &&
++		    pargs->a3 =3D=3D priv->partitions.descs[descs_cnt].sp_uuid.a3 &&
++		    pargs->a4 =3D=3D priv->partitions.descs[descs_cnt].sp_uuid.a4) {
++			*(rxbuf_desc_info++) =3D priv->partitions.descs[descs_cnt].info;
++		}
++
++	if (rxbuf_desc_info !=3D priv->pair.rxbuf) {
++		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
++		/* Store the partitions count */
++		res->a2 =3D (ulong)
++			(rxbuf_desc_info - (struct ffa_partition_info *)
++			 priv->pair.rxbuf);
++		ret =3D 0;
++
++		/* Transfer ownership to the consumer: the non secure world */
++		priv->pair_info.rxbuf_owned =3D 1;
++	} else {
++		/* Unrecognized UUID */
++		res->a2 =3D -INVALID_PARAMETERS;
++		ret =3D ffa_to_std_errmap[INVALID_PARAMETERS];
++	}
++
++cleanup:
++
++	log_err("FFA_PARTITION_INFO_GET (%ld)\n", res->a2);
++
++	res->a1 =3D 0;
++
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++
++	return ret;
++}
++
++/**
++ * sandbox_ffa_rxtx_map() - Emulated FFA_RXTX_MAP handler
++ * @emul: The sandbox FF-A emulator device
++ * @pargs: The SMC call input arguments a0-a7
++ * @res:  The SMC return data
++ *
++ * Emulate FFA_RXTX_MAP FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_rxtx_map(struct udevice *emul, ffa_value_t *parg=
s, ffa_value_t *res)
++{
++	int ret;
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	res->a0 =3D FFA_SMC_32(FFA_ERROR);
++
++	if (priv->pair.txbuf && priv->pair.rxbuf) {
++		res->a2 =3D -DENIED;
++		ret =3D ffa_to_std_errmap[DENIED];
++		goto feedback;
++	}
++
++	if (pargs->a3 >=3D RXTX_BUFFERS_MIN_PAGES && pargs->a1 && pargs->a2) {
++		priv->pair.txbuf =3D map_sysmem(pargs->a1, 0);
++		priv->pair.rxbuf =3D map_sysmem(pargs->a2, 0);
++		priv->pair_info.rxtx_buf_size =3D pargs->a3;
++		priv->pair_info.rxbuf_mapped =3D 1;
++		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
++		res->a2 =3D 0;
++		ret =3D 0;
++		goto feedback;
++	}
++
++	if (!pargs->a1 || !pargs->a2) {
++		res->a2 =3D -INVALID_PARAMETERS;
++		ret =3D ffa_to_std_errmap[INVALID_PARAMETERS];
++	} else {
++		res->a2 =3D -NO_MEMORY;
++		ret =3D ffa_to_std_errmap[NO_MEMORY];
++	}
++
++	log_err("Error in FFA_RXTX_MAP arguments (%d)\n",
++		(int)res->a2);
++
++feedback:
++
++	res->a1 =3D 0;
++
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++
++	return ret;
++}
++
++/**
++ * sandbox_ffa_rxtx_unmap() - Emulated FFA_RXTX_UNMAP handler
++ * @emul: The sandbox FF-A emulator device
++ * @pargs: The SMC call input arguments a0-a7
++ * @res:  The SMC return data
++ *
++ * Emulate FFA_RXTX_UNMAP FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_rxtx_unmap(struct udevice *emul, ffa_value_t *pa=
rgs, ffa_value_t *res)
++{
++	int ret;
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	res->a0 =3D FFA_SMC_32(FFA_ERROR);
++	res->a2 =3D -INVALID_PARAMETERS;
++	ret =3D ffa_to_std_errmap[INVALID_PARAMETERS];
++
++	if (GET_NS_PHYS_ENDPOINT_ID(pargs->a1) !=3D priv->id)
++		goto feedback;
++
++	if (priv->pair.txbuf && priv->pair.rxbuf) {
++		priv->pair.txbuf =3D 0;
++		priv->pair.rxbuf =3D 0;
++		priv->pair_info.rxtx_buf_size =3D 0;
++		priv->pair_info.rxbuf_mapped =3D 0;
++		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
++		res->a2 =3D 0;
++		ret =3D 0;
++		goto feedback;
++	}
++
++	log_err("No buffer pair registered on behalf of the caller\n");
++
++feedback:
++
++	res->a1 =3D 0;
++
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++
++	return ret;
++}
++
++/**
++ * sandbox_ffa_rx_release() - Emulated FFA_RX_RELEASE handler
++ * @emul: The sandbox FF-A emulator device
++ * @pargs: The SMC call input arguments a0-a7
++ * @res:  The SMC return data
++ *
++ * Emulate FFA_RX_RELEASE FF-A function.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_rx_release(struct udevice *emul, ffa_value_t *pa=
rgs, ffa_value_t *res)
++{
++	int ret;
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	if (!priv->pair_info.rxbuf_owned) {
++		res->a0 =3D FFA_SMC_32(FFA_ERROR);
++		res->a2 =3D -DENIED;
++		ret =3D ffa_to_std_errmap[DENIED];
++	} else {
++		priv->pair_info.rxbuf_owned =3D 0;
++		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
++		res->a2 =3D 0;
++		ret =3D 0;
++	}
++
++	res->a1 =3D 0;
++
++	/* x3-x7 MBZ */
++	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++
++	return ret;
++}
++
++/**
++ * sandbox_ffa_sp_valid() - Check SP validity
++ * @emul: The sandbox FF-A emulator device
++ * @part_id:	partition ID to check
++ *
++ * Search the input ID in the descriptors table.
++ *
++ * Return:
++ *
++ * 1 on success (Partition found). Otherwise, failure
++ */
++static int sandbox_ffa_sp_valid(struct udevice *emul, u16 part_id)
++{
++	u32 descs_cnt;
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	for (descs_cnt =3D 0 ; descs_cnt < SANDBOX_PARTITIONS_CNT ; descs_cnt+=
+)
++		if (priv->partitions.descs[descs_cnt].info.id =3D=3D part_id)
++			return 1;
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_msg_send_direct_req() - Emulated FFA_MSG_SEND_DIRECT_{RE=
Q,RESP} handler
++ * @emul: The sandbox FF-A emulator device
++ * @pargs: The SMC call input arguments a0-a7
++ * @res:  The SMC return data
++ *
++ * Emulate FFA_MSG_SEND_DIRECT_{REQ,RESP} FF-A ABIs.
++ * Only SMC 64-bit is supported in Sandbox.
++ *
++ * Emulating interrupts is not supported. So, FFA_RUN and FFA_INTERRUPT=
 are not
++ * supported. In case of success FFA_MSG_SEND_DIRECT_RESP is returned w=
ith
++ * default pattern data (0xff).
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_msg_send_direct_req(struct udevice *emul,
++					   ffa_value_t *pargs, ffa_value_t *res)
++{
++	u16 part_id;
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	part_id =3D GET_DST_SP_ID(pargs->a1);
++
++	if (GET_NS_PHYS_ENDPOINT_ID(pargs->a1) !=3D priv->id ||
++	    !sandbox_ffa_sp_valid(emul, part_id) || pargs->a2) {
++		res->a0 =3D FFA_SMC_32(FFA_ERROR);
++		res->a1 =3D 0;
++		res->a2 =3D -INVALID_PARAMETERS;
++
++		/* x3-x7 MBZ */
++		memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(ulong));
++
++		return ffa_to_std_errmap[INVALID_PARAMETERS];
++	}
++
++	res->a0 =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
++
++	res->a1 =3D PREP_SRC_SP_ID(part_id) |
++		PREP_NS_PHYS_ENDPOINT_ID(priv->id);
++
++	res->a2 =3D 0;
++
++	/* Return 0xff bytes as a response */
++	res->a3 =3D -1UL;
++	res->a4 =3D -1UL;
++	res->a5 =3D -1UL;
++	res->a6 =3D -1UL;
++	res->a7 =3D -1UL;
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_get_rxbuf_flags() - Read the mapping/ownership flags
++ * @emul: The sandbox FF-A emulator device
++ * @queried_func_id:	The FF-A function to be queried
++ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
++ *
++ * Query the status flags of the following emulated
++ * ABIs: FFA_RXTX_MAP, FFA_RXTX_UNMAP, FFA_RX_RELEASE.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_get_rxbuf_flags(struct udevice *emul, u32 querie=
d_func_id,
++				       struct ffa_sandbox_data *func_data)
++{
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	if (!func_data)
++		return -EINVAL;
++
++	if (!func_data->data0 || func_data->data0_size !=3D sizeof(u8))
++		return -EINVAL;
++
++	switch (queried_func_id) {
++	case FFA_RXTX_MAP:
++	case FFA_RXTX_UNMAP:
++		*((u8 *)func_data->data0) =3D priv->pair_info.rxbuf_mapped;
++		return 0;
++	case FFA_RX_RELEASE:
++		*((u8 *)func_data->data0) =3D priv->pair_info.rxbuf_owned;
++		return 0;
++	default:
++		log_err("The querried FF-A interface flag (%d) undefined\n",
++			queried_func_id);
++		return -EINVAL;
++	}
++}
++
++/**
++ * sandbox_ffa_get_fwk_version() - Return the FFA framework version
++ * @emul: The sandbox FF-A emulator device
++ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
++ *
++ * Return the FFA framework version read from the FF-A emulator data.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_get_fwk_version(struct udevice *emul, struct ffa=
_sandbox_data *func_data)
++{
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	if (!func_data)
++		return -EINVAL;
++
++	if (!func_data->data0 ||
++	    func_data->data0_size !=3D sizeof(priv->fwk_version))
++		return -EINVAL;
++
++	*((u32 *)func_data->data0) =3D priv->fwk_version;
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_get_parts() - Return the address of partitions data
++ * @emul: The sandbox FF-A emulator device
++ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
++ *
++ * Return the address of partitions data read from the FF-A emulator da=
ta.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_get_parts(struct udevice *emul, struct ffa_sandb=
ox_data *func_data)
++{
++	struct sandbox_ffa_emul *priv =3D dev_get_priv(emul);
++
++	if (!func_data)
++		return -EINVAL;
++
++	if (!func_data->data0 ||
++	    func_data->data0_size !=3D sizeof(struct ffa_partitions *))
++		return -EINVAL;
++
++	*((struct ffa_partitions **)func_data->data0) =3D &priv->partitions;
++
++	return 0;
++}
++
++/**
++ * sandbox_query_ffa_emul_state() - Inspect the FF-A ABIs
++ * @queried_func_id:	The FF-A function to be queried
++ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
++ *
++ * Query the status of FF-A ABI specified in the input argument.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++int sandbox_query_ffa_emul_state(u32 queried_func_id,
++				 struct ffa_sandbox_data *func_data)
++{
++	struct udevice *emul;
++	int ret;
++
++	ret =3D uclass_first_device_err(UCLASS_FFA_EMUL, &emul);
++	if (ret) {
++		log_err("Cannot find FF-A emulator during querying state\n");
++		return ret;
++	}
++
++	switch (queried_func_id) {
++	case FFA_RXTX_MAP:
++	case FFA_RXTX_UNMAP:
++	case FFA_RX_RELEASE:
++		return sandbox_ffa_get_rxbuf_flags(emul, queried_func_id, func_data);
++	case FFA_VERSION:
++		return sandbox_ffa_get_fwk_version(emul, func_data);
++	case FFA_PARTITION_INFO_GET:
++		return sandbox_ffa_get_parts(emul, func_data);
++	default:
++		log_err("Undefined FF-A interface (%d)\n",
++			queried_func_id);
++		return -EINVAL;
++	}
++}
++
++/**
++ * sandbox_arm_ffa_smccc_smc() - FF-A SMC call emulation
++ * @args:	the SMC call arguments
++ * @res:	the SMC call returned data
++ *
++ * Emulate the FF-A ABIs SMC call.
++ * The emulated FF-A ABI is identified and invoked.
++ * FF-A emulation is based on the FF-A specification 1.0
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure.
++ * FF-A protocol error codes are returned using the registers arguments=
 as
++ * described by the specification
++ */
++void sandbox_arm_ffa_smccc_smc(ffa_value_t *args, ffa_value_t *res)
++{
++	int ret =3D 0;
++	struct udevice *emul;
++
++	ret =3D uclass_first_device_err(UCLASS_FFA_EMUL, &emul);
++	if (ret) {
++		log_err("Cannot find FF-A emulator during SMC emulation\n");
++		return;
++	}
++
++	switch (args->a0) {
++	case FFA_SMC_32(FFA_VERSION):
++		ret =3D sandbox_ffa_version(emul, args, res);
++		break;
++	case FFA_SMC_32(FFA_PARTITION_INFO_GET):
++		ret =3D sandbox_ffa_partition_info_get(emul, args, res);
++		break;
++	case FFA_SMC_32(FFA_RXTX_UNMAP):
++		ret =3D sandbox_ffa_rxtx_unmap(emul, args, res);
++		break;
++	case FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ):
++		ret =3D sandbox_ffa_msg_send_direct_req(emul, args, res);
++		break;
++	case FFA_SMC_32(FFA_ID_GET):
++		ret =3D sandbox_ffa_id_get(emul, args, res);
++		break;
++	case FFA_SMC_32(FFA_FEATURES):
++		ret =3D sandbox_ffa_features(args, res);
++		break;
++	case FFA_SMC_64(FFA_RXTX_MAP):
++		ret =3D sandbox_ffa_rxtx_map(emul, args, res);
++		break;
++	case FFA_SMC_32(FFA_RX_RELEASE):
++		ret =3D sandbox_ffa_rx_release(emul, args, res);
++		break;
++	default:
++		log_err("Undefined FF-A interface (%lx)\n",
++			args->a0);
++	}
++
++	if (ret !=3D 0)
++		log_err("FF-A ABI internal failure (%d)\n", ret);
++}
++
++/**
++ * invoke_ffa_fn() - SMC wrapper
++ * @args: FF-A ABI arguments to be copied to Xn registers
++ * @res: FF-A ABI return data to be copied from Xn registers
++ *
++ * Calls the emulated SMC call.
++ */
++void invoke_ffa_fn(ffa_value_t args, ffa_value_t *res)
++{
++	sandbox_arm_ffa_smccc_smc(&args, res);
++}
++
++/**
++ * ffa_emul_find() - Find the FF-A emulator
++ * @dev:	the sandbox FF-A device (sandbox-arm-ffa)
++ * @emulp:	the FF-A emulator device (sandbox-ffa-emul)
++ *
++ * Search for the FF-A emulator and returns its device pointer.
++ *
++ * Return:
++ * 0 on success. Otherwise, failure
++ */
++int ffa_emul_find(struct udevice *dev, struct udevice **emulp)
++{
++	int ret;
++
++	ret =3D uclass_first_device_err(UCLASS_FFA_EMUL, emulp);
++	if (ret) {
++		log_err("Cannot find FF-A emulator\n");
++		return ret;
++	}
++
++	log_info("FF-A emulator ready to use\n");
++
++	return 0;
++}
++
++UCLASS_DRIVER(ffa_emul) =3D {
++	.name		=3D "ffa_emul",
++	.id		=3D UCLASS_FFA_EMUL,
++	.post_bind =3D dm_scan_fdt_dev,
++};
++
++static const struct udevice_id sandbox_ffa_emul_ids[] =3D {
++	{ .compatible =3D "sandbox,arm-ffa-emul" },
++	{ }
++};
++
++/* Declaring the sandbox FF-A emulator under UCLASS_FFA_EMUL */
++U_BOOT_DRIVER(sandbox_ffa_emul) =3D {
++	.name		=3D "sandbox_ffa_emul",
++	.id		=3D UCLASS_FFA_EMUL,
++	.of_match	=3D sandbox_ffa_emul_ids,
++	.priv_auto	=3D sizeof(struct sandbox_ffa_emul),
++};
+diff --git a/drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h b/drivers/f=
irmware/arm-ffa/sandbox_arm_ffa_priv.h
+deleted file mode 100644
+index 4338f9c9b1..0000000000
+--- a/drivers/firmware/arm-ffa/sandbox_arm_ffa_priv.h
++++ /dev/null
+@@ -1,14 +0,0 @@
+-/* SPDX-License-Identifier: GPL-2.0+ */
+-/*
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
+- *
+- * Authors:
+- *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+- */
+-
+-#ifndef __SANDBOX_ARM_FFA_PRV_H
+-#define __SANDBOX_ARM_FFA_PRV_H
+-
+-/* Future sandbox support private declarations */
+-
+-#endif
+diff --git a/drivers/firmware/arm-ffa/sandbox_ffa.c b/drivers/firmware/a=
rm-ffa/sandbox_ffa.c
+new file mode 100644
+index 0000000000..ef9491ccea
+--- /dev/null
++++ b/drivers/firmware/arm-ffa/sandbox_ffa.c
+@@ -0,0 +1,110 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++#include <common.h>
++#include <arm_ffa.h>
++#include <dm.h>
++#include <log.h>
++#include <asm/global_data.h>
++#include <asm/sandbox_arm_ffa_priv.h>
++#include <dm/device-internal.h>
++#include <linux/errno.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++/**
++ * sandbox_ffa_discover() - perform sandbox FF-A discovery
++ * @dev: The sandbox FF-A bus device
++ * Try to discover the FF-A framework. Discovery is performed by
++ * querying the FF-A framework version from secure world using the FFA_=
VERSION ABI.
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int sandbox_ffa_discover(struct udevice *dev)
++{
++	int ret;
++	struct udevice *emul;
++
++	log_info("Emulated FF-A framework discovery\n");
++
++	ret =3D ffa_emul_find(dev, &emul);
++	if (ret) {
++		log_err("Cannot find FF-A emulator\n");
++		return ret;
++	}
++
++	ret =3D ffa_get_version_hdlr(dev);
++	if (ret)
++		return ret;
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_probe() - The sandbox FF-A driver probe function
++ * @dev:	the sandbox-arm-ffa device
++ * Save the emulator device in uc_priv.
++ * Return:
++ *
++ * 0 on success.
++ */
++static int sandbox_ffa_probe(struct udevice *dev)
++{
++	int ret;
++	struct ffa_priv *uc_priv =3D dev_get_uclass_priv(dev);
++
++	ret =3D uclass_first_device_err(UCLASS_FFA_EMUL, &uc_priv->emul);
++	if (ret) {
++		log_err("Cannot find FF-A emulator\n");
++		return ret;
++	}
++
++	return 0;
++}
++
++/**
++ * sandbox_ffa_bind() - The sandbox FF-A driver bind function
++ * @dev:	the sandbox-arm-ffa device
++ * Try to discover the emulated FF-A bus.
++ * Return:
++ *
++ * 0 on success.
++ */
++static int sandbox_ffa_bind(struct udevice *dev)
++{
++	int ret;
++
++	ret =3D sandbox_ffa_discover(dev);
++	if (ret)
++		return ret;
++
++	return 0;
++}
++
++/* Sandbox Arm FF-A emulator operations */
++
++static const struct ffa_bus_ops sandbox_ffa_ops =3D {
++	.partition_info_get =3D ffa_get_partitions_info_hdlr,
++	.sync_send_receive =3D ffa_msg_send_direct_req_hdlr,
++	.rxtx_unmap =3D ffa_unmap_rxtx_buffers_hdlr,
++};
++
++static const struct udevice_id sandbox_ffa_id[] =3D {
++	{ "sandbox,arm-ffa", 0 },
++	{ },
++};
++
++/* Declaring the sandbox FF-A driver under UCLASS_FFA */
++U_BOOT_DRIVER(sandbox_arm_ffa) =3D {
++	.name		=3D "sandbox_arm_ffa",
++	.of_match =3D sandbox_ffa_id,
++	.id		=3D UCLASS_FFA,
++	.bind		=3D sandbox_ffa_bind,
++	.probe		=3D sandbox_ffa_probe,
++	.ops		=3D &sandbox_ffa_ops,
++};
+diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
+index 3c6af2e3d2..0432c95c9e 100644
+--- a/include/dm/uclass-id.h
++++ b/include/dm/uclass-id.h
+@@ -63,6 +63,7 @@ enum uclass_id {
+ 	UCLASS_ETH_PHY,		/* Ethernet PHY device */
+ 	UCLASS_EXTCON,		/* External Connector Class */
+ 	UCLASS_FFA,		/* Arm Firmware Framework for Armv8-A */
++	UCLASS_FFA_EMUL,		/* sandbox FF-A device emulator */
+ 	UCLASS_FIRMWARE,	/* Firmware */
+ 	UCLASS_FPGA,		/* FPGA device */
+ 	UCLASS_FUZZING_ENGINE,	/* Fuzzing engine */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm=
_ffa-introduce-the-FF-A-Sandbox-driver.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0006-arm_ffa-introduce-the-FF-A-Sandbox-driver.=
patch
deleted file mode 100644
index 8c3892f0..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-in=
troduce-the-FF-A-Sandbox-driver.patch
+++ /dev/null
@@ -1,1164 +0,0 @@
-From 301430b7c8dceebe349b82c598097628da733090 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Tue, 29 Nov 2022 14:44:36 +0000
-Subject: [PATCH 06/42] arm_ffa: introduce the FF-A Sandbox driver
-
-Provide a Sandbox driver to emulate the FF-A ABIs
-
-The emulated ABIs are those supported by the FF-A core driver
-and according to FF-A specification v1.0.
-
-The Sandbox driver provides operations allowing the test
-application to read the status of all the inspected ABIs
-and perform functional tests based on that.
-
-sandbox driver supports only 64-bit direct messaging.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Simon Glass <sjg@chromium.org>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v8: update ffa_bus_prvdata_get() to return a pointer rather than
-    a pointer address
-
-v7: state that sandbox driver supports only 64-bit direct messaging
-
-v4: align sandbox driver with the new FF-A driver interfaces
-    and new way of error handling
-
-v1: introduce the sandbox driver
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- MAINTAINERS                                   |   1 +
- configs/sandbox64_defconfig                   |   2 +
- configs/sandbox_defconfig                     |   2 +
- drivers/firmware/arm-ffa/Kconfig              |   9 +-
- drivers/firmware/arm-ffa/Makefile             |   1 +
- drivers/firmware/arm-ffa/arm_ffa_prv.h        |  15 +-
- drivers/firmware/arm-ffa/core.c               |  22 +-
- drivers/firmware/arm-ffa/sandbox.c            | 659 ++++++++++++++++++
- .../firmware/arm-ffa/sandbox_arm_ffa_prv.h    | 144 ++++
- include/arm_ffa.h                             |   2 +-
- include/sandbox_arm_ffa.h                     |  91 +++
- lib/efi_loader/efi_boottime.c                 |   2 +-
- 12 files changed, 937 insertions(+), 13 deletions(-)
- create mode 100644 drivers/firmware/arm-ffa/sandbox.c
- create mode 100644 drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h
- create mode 100644 include/sandbox_arm_ffa.h
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 61ce6c436f..297d165f84 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -271,6 +271,7 @@ F:	cmd/armffa.c
- F:	doc/arch/arm64.ffa.rst
- F:	drivers/firmware/arm-ffa/
- F:	include/arm_ffa.h
-+F:	include/sandbox_arm_ffa.h
-=20
- ARM FREESCALE IMX
- M:	Stefano Babic <sbabic@denx.de>
-diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
-index ba45ac0b71..4b8a1ec42b 100644
---- a/configs/sandbox64_defconfig
-+++ b/configs/sandbox64_defconfig
-@@ -259,3 +259,5 @@ CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
- CONFIG_UNIT_TEST=3Dy
- CONFIG_UT_TIME=3Dy
- CONFIG_UT_DM=3Dy
-+CONFIG_ARM_FFA_TRANSPORT=3Dy
-+CONFIG_SANDBOX_FFA=3Dy
-\ No newline at end of file
-diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
-index be46cae7aa..650f06ae61 100644
---- a/configs/sandbox_defconfig
-+++ b/configs/sandbox_defconfig
-@@ -334,3 +334,5 @@ CONFIG_TEST_FDTDEC=3Dy
- CONFIG_UNIT_TEST=3Dy
- CONFIG_UT_TIME=3Dy
- CONFIG_UT_DM=3Dy
-+CONFIG_ARM_FFA_TRANSPORT=3Dy
-+CONFIG_SANDBOX_FFA=3Dy
-\ No newline at end of file
-diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index be4df89d23..b86f16d778 100644
---- a/drivers/firmware/arm-ffa/Kconfig
-+++ b/drivers/firmware/arm-ffa/Kconfig
-@@ -2,8 +2,8 @@
-=20
- config ARM_FFA_TRANSPORT
- 	bool "Enable Arm Firmware Framework for Armv8-A driver"
--	depends on DM && ARM64
--	select ARM_SMCCC
-+	depends on DM && (ARM64 || SANDBOX)
-+	select ARM_SMCCC if !SANDBOX
- 	select CMD_ARMFFA
- 	select LIB_UUID
- 	select DEVRES
-@@ -29,3 +29,8 @@ config ARM_FFA_TRANSPORT
-=20
- 	  For more details about the FF-A driver, please refer to doc/arch/arm=
64.ffa.rst
-=20
-+config SANDBOX_FFA
-+	bool "FF-A Sandbox driver"
-+	depends on ARM_FFA_TRANSPORT && SANDBOX
-+	help
-+	  This emulates the FF-A handling under Sandbox and allows to test the=
 FF-A driver
-diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
-index 043a8915be..0d21d6b47a 100644
---- a/drivers/firmware/arm-ffa/Makefile
-+++ b/drivers/firmware/arm-ffa/Makefile
-@@ -4,3 +4,4 @@
- # Abdellatif El Khlifi, Arm Limited, abdellatif.elkhlifi@arm.com.
-=20
- obj-y +=3D arm-ffa-uclass.o core.o
-+obj-$(CONFIG_SANDBOX_FFA) +=3D sandbox.o
-diff --git a/drivers/firmware/arm-ffa/arm_ffa_prv.h b/drivers/firmware/a=
rm-ffa/arm_ffa_prv.h
-index 4eea7dc036..bbc8b87069 100644
---- a/drivers/firmware/arm-ffa/arm_ffa_prv.h
-+++ b/drivers/firmware/arm-ffa/arm_ffa_prv.h
-@@ -19,6 +19,16 @@
- /* FF-A core driver name */
- #define FFA_DRV_NAME "arm_ffa"
-=20
-+/* The FF-A SMC function definitions */
-+
-+#if CONFIG_IS_ENABLED(SANDBOX_FFA)
-+#include "sandbox_arm_ffa.h"
-+#else
-+typedef struct arm_smccc_1_2_regs ffa_value_t;
-+#endif
-+
-+typedef void (*invoke_ffa_fn_t)(ffa_value_t args, ffa_value_t *res);
-+
- /* FF-A driver version definitions */
-=20
- #define MAJOR_VERSION_MASK		GENMASK(30, 16)
-@@ -103,11 +113,6 @@ struct ffa_abi_errmap {
- #define FFA_ERRMAP_COUNT (FFA_LAST_ID - FFA_FIRST_ID + 1)
- #define FFA_ID_TO_ERRMAP_ID(ffa_id) ((ffa_id) - FFA_FIRST_ID)
-=20
--/* The FF-A SMC function definitions */
--
--typedef struct arm_smccc_1_2_regs ffa_value_t;
--typedef void (*invoke_ffa_fn_t)(ffa_value_t args, ffa_value_t *res);
--
- /*
-  * struct ffa_partition_uuid - 16 bytes UUID transmitted by FFA_PARTITI=
ON_INFO_GET
-  * @a1-4:	32-bit words access to the UUID data
-diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/=
core.c
-index 0b1f8e6a07..560603b28b 100644
---- a/drivers/firmware/arm-ffa/core.c
-+++ b/drivers/firmware/arm-ffa/core.c
-@@ -1072,6 +1072,7 @@ static int ffa_msg_send_direct_req(struct udevice =
*dev, u16 dst_part_id,
- 	return ffa_to_std_errno(ffa_errno);
- }
-=20
-+#if !CONFIG_IS_ENABLED(SANDBOX_FFA)
- /**
-  * __arm_ffa_fn_smc - SMC wrapper
-  * @args: FF-A ABI arguments to be copied to Xn registers
-@@ -1085,6 +1086,7 @@ void __arm_ffa_fn_smc(ffa_value_t args, ffa_value_=
t *res)
- {
- 	arm_smccc_1_2_smc(&args, res);
- }
-+#endif
-=20
- /**
-  * ffa_set_smc_conduit - Set the SMC conduit
-@@ -1098,7 +1100,12 @@ void __arm_ffa_fn_smc(ffa_value_t args, ffa_value=
_t *res)
-  */
- static int ffa_set_smc_conduit(void)
- {
--	ffa_priv_data->invoke_ffa_fn =3D __arm_ffa_fn_smc;
-+#if CONFIG_IS_ENABLED(SANDBOX_FFA)
-+		ffa_priv_data->invoke_ffa_fn =3D sandbox_arm_ffa_smccc_smc;
-+		ffa_info("Using SMC emulation");
-+#else
-+		ffa_priv_data->invoke_ffa_fn =3D __arm_ffa_fn_smc;
-+#endif
-=20
- 	if (!ffa_priv_data->invoke_ffa_fn) {
- 		ffa_err("failure to set the invoke function");
-@@ -1275,17 +1282,18 @@ struct ffa_prvdata *ffa_bus_prvdata_get(void)
- }
-=20
- /**
-- * ffa_bus_discover - discover FF-A bus and probe arm_ffa device
-+ * ffa_bus_discover - discover FF-A bus and probe arm_ffa and sandbox_a=
rm_ffa devices
-  * @pdev: the address of a device pointer (to be filled when the arm_ff=
a bus device is created
-  *       successfully)
-  *
-  * This function makes sure the FF-A bus is discoverable.
-- * When probing succeeds FF-A discovery is done. The arm_ffa device is =
ready to use.
-+ * When probing succeeds FF-A discovery is done. The arm_ffa and sandbo=
x_arm_ffa devices
-+ * are ready to use.
-  *
-  * When the bus was already discovered successfully the discovery will =
not run again.
-  *
-  * Arm FF-A transport is implemented through arm_ffa u-boot device mana=
ging the FF-A
-- * communication.
-+ * communication. In Sandbox mode sandbox_arm_ffa is used to test arm_f=
fa driver.
-  * All FF-A clients should use the arm_ffa device to use the FF-A trans=
port.
-  *
-  * Return:
-@@ -1299,6 +1307,12 @@ int ffa_bus_discover(struct udevice **pdev)
- 	if (!ffa_priv_data) {
- 		ret =3D ffa_device_get(pdev);
-=20
-+#if CONFIG_IS_ENABLED(SANDBOX_FFA)
-+		if (ret =3D=3D 0)
-+			ret =3D sandbox_ffa_device_get();
-+#endif
-+	}
-+
- 	return ret;
- }
-=20
-diff --git a/drivers/firmware/arm-ffa/sandbox.c b/drivers/firmware/arm-f=
fa/sandbox.c
-new file mode 100644
-index 0000000000..16f1ca926e
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/sandbox.c
-@@ -0,0 +1,659 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include "sandbox_arm_ffa_prv.h"
-+#include <asm/global_data.h>
-+#include <common.h>
-+#include <dm.h>
-+#include <dm/device-internal.h>
-+#include <dm/root.h>
-+#include <linux/errno.h>
-+#include <linux/sizes.h>
-+#include <mapmem.h>
-+#include <string.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+/**
-+ * The device private data structure containing all the emulated secure=
 world data
-+ */
-+static struct sandbox_ffa_prvdata  sandbox_ffa_priv_data =3D {0};
-+
-+/* The partitions (SPs) table */
-+static struct ffa_partition_desc sandbox_partitions[SANDBOX_PARTITIONS_=
CNT] =3D {
-+	{
-+		.info =3D { .id =3D SANDBOX_SP1_ID, .exec_ctxt =3D 0x5687, .propertie=
s =3D 0x89325621 },
-+		.sp_uuid =3D {
-+			.a1 =3D SANDBOX_SERVICE1_UUID_A1,
-+			.a2 =3D SANDBOX_SERVICE1_UUID_A2,
-+			.a3 =3D SANDBOX_SERVICE1_UUID_A3,
-+			.a4 =3D SANDBOX_SERVICE1_UUID_A4,
-+		}
-+	},
-+	{
-+		.info =3D { .id =3D SANDBOX_SP2_ID, .exec_ctxt =3D 0x9587, .propertie=
s =3D 0x45325621 },
-+		.sp_uuid =3D {
-+			.a1 =3D SANDBOX_SERVICE2_UUID_A1,
-+			.a2 =3D SANDBOX_SERVICE2_UUID_A2,
-+			.a3 =3D SANDBOX_SERVICE2_UUID_A3,
-+			.a4 =3D SANDBOX_SERVICE2_UUID_A4,
-+		}
-+	},
-+	{
-+		.info =3D { .id =3D SANDBOX_SP3_ID, .exec_ctxt =3D 0x7687, .propertie=
s =3D 0x23325621 },
-+		.sp_uuid =3D {
-+			.a1 =3D SANDBOX_SERVICE1_UUID_A1,
-+			.a2 =3D SANDBOX_SERVICE1_UUID_A2,
-+			.a3 =3D SANDBOX_SERVICE1_UUID_A3,
-+			.a4 =3D SANDBOX_SERVICE1_UUID_A4,
-+		}
-+	},
-+	{
-+		.info =3D { .id =3D SANDBOX_SP4_ID, .exec_ctxt =3D 0x1487, .propertie=
s =3D 0x70325621 },
-+		.sp_uuid =3D {
-+			.a1 =3D SANDBOX_SERVICE2_UUID_A1,
-+			.a2 =3D SANDBOX_SERVICE2_UUID_A2,
-+			.a3 =3D SANDBOX_SERVICE2_UUID_A3,
-+			.a4 =3D SANDBOX_SERVICE2_UUID_A4,
-+		}
-+	}
-+
-+};
-+
-+/*
-+ * Driver functions
-+ */
-+
-+/**
-+ * sandbox_ffa_get_device - probes the sandbox_arm_ffa device
-+ *
-+ * This function makes sure the sandbox_arm_ffa device is probed
-+ * This function makes sure the sandbox_arm_ffa device is
-+ * created, bound to this driver, probed and ready to use.
-+ *
-+ * sandbox_arm_ffa depends on arm_ffa device. This dependency is
-+ * handled by ffa_bus_discover function. arm_ffa is probed first then
-+ * sandbox_arm_ffa.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int sandbox_ffa_device_get(void)
-+{
-+	int ret;
-+
-+	if (sandbox_ffa_priv_data.dev)
-+		return 0;
-+
-+	ret =3D device_bind(dm_root(),
-+			  DM_DRIVER_GET(sandbox_arm_ffa),
-+			  FFA_SANDBOX_DRV_NAME,
-+			  NULL,
-+			  ofnode_null(),
-+			  &sandbox_ffa_priv_data.dev);
-+	if (ret) {
-+		sandbox_ffa_priv_data.dev =3D NULL;
-+		return ret;
-+	}
-+
-+	ret =3D device_probe(sandbox_ffa_priv_data.dev);
-+	if (ret) {
-+		ffa_err("[Sandbox] can not probe  the device");
-+		device_unbind(sandbox_ffa_priv_data.dev);
-+		sandbox_ffa_priv_data.dev =3D NULL;
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_version - Emulated FFA_VERSION handler function
-+ * @{a0-a7} , res: The SMC call arguments and return structure.
-+ *
-+ * This is the function that emulates FFA_VERSION FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+SANDBOX_SMC_FFA_ABI(ffa_version)
-+{
-+	sandbox_ffa_priv_data.fwk_version =3D FFA_VERSION_1_0;
-+	res->a0 =3D sandbox_ffa_priv_data.fwk_version;
-+
-+	/* x1-x7 MBZ */
-+	memset(FFA_X1X7_MBZ_REG_START, 0, FFA_X1X7_MBZ_CNT * sizeof(unsigned l=
ong));
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_id_get - Emulated FFA_ID_GET handler function
-+ * @{a0-a7} , res: The SMC call arguments and return structure.
-+ *
-+ * This is the function that emulates FFA_ID_GET FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+SANDBOX_SMC_FFA_ABI(ffa_id_get)
-+{
-+	res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+	res->a1 =3D 0;
-+
-+	sandbox_ffa_priv_data.id =3D NS_PHYS_ENDPOINT_ID;
-+	res->a2 =3D sandbox_ffa_priv_data.id;
-+
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(unsigned lon=
g));
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_features - Emulated FFA_FEATURES handler function
-+ * @{a0-a7} , res: The SMC call arguments and return structure.
-+ *
-+ * This is the function that emulates FFA_FEATURES FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+SANDBOX_SMC_FFA_ABI(ffa_features)
-+{
-+	if (pargs->a1 =3D=3D FFA_SMC_64(FFA_RXTX_MAP)) {
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		res->a2 =3D RXTX_BUFFERS_MIN_SIZE;
-+		res->a3 =3D 0;
-+		/* x4-x7 MBZ */
-+		memset(FFA_X4X7_MBZ_REG_START,
-+		       0, FFA_X4X7_MBZ_CNT * sizeof(unsigned long));
-+	} else {
-+		res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+		res->a2 =3D FFA_ERR_STAT_NOT_SUPPORTED;
-+		/* x3-x7 MBZ */
-+		memset(FFA_X3_MBZ_REG_START,
-+		       0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
-+		ffa_err("[Sandbox] FF-A interface 0x%lx not implemented", pargs->a1);
-+	}
-+
-+	res->a1 =3D 0;
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_partition_info_get - Emulated FFA_PARTITION_INFO_GET han=
dler function
-+ * @{a0-a7} , res: The SMC call arguments and return structure.
-+ *
-+ * This is the function that emulates FFA_PARTITION_INFO_GET FF-A funct=
ion.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+SANDBOX_SMC_FFA_ABI(ffa_partition_info_get)
-+{
-+	struct ffa_partition_info *rxbuf_desc_info =3D NULL;
-+	u32 descs_cnt;
-+	u32 descs_size_bytes;
-+
-+	res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+
-+	if (!sandbox_ffa_priv_data.pair.rxbuf) {
-+		res->a2 =3D FFA_ERR_STAT_DENIED;
-+		goto cleanup;
-+	}
-+
-+	if (sandbox_ffa_priv_data.pair_info.rxbuf_owned) {
-+		res->a2 =3D FFA_ERR_STAT_BUSY;
-+		goto cleanup;
-+	}
-+
-+	if (!sandbox_ffa_priv_data.partitions.descs) {
-+		sandbox_ffa_priv_data.partitions.descs =3D sandbox_partitions;
-+		sandbox_ffa_priv_data.partitions.count =3D SANDBOX_PARTITIONS_CNT;
-+	}
-+
-+	descs_size_bytes =3D SANDBOX_PARTITIONS_CNT * sizeof(struct ffa_partit=
ion_desc);
-+
-+	/* Abort if the RX buffer size is smaller than the descriptors buffer =
size */
-+	if ((sandbox_ffa_priv_data.pair_info.rxtx_buf_size * SZ_4K) < descs_si=
ze_bytes) {
-+		res->a2 =3D FFA_ERR_STAT_NO_MEMORY;
-+		goto cleanup;
-+	}
-+
-+	rxbuf_desc_info =3D (struct ffa_partition_info *)sandbox_ffa_priv_data=
.pair.rxbuf;
-+
-+	/* No UUID specified. Return the information of all partitions */
-+	if (!pargs->a1 && !pargs->a2 && !pargs->a3 && !pargs->a4) {
-+		for (descs_cnt =3D 0 ; descs_cnt < SANDBOX_PARTITIONS_CNT ; descs_cnt=
++)
-+			*(rxbuf_desc_info++) =3D
-+				sandbox_ffa_priv_data.partitions.descs[descs_cnt].info;
-+
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		res->a2 =3D SANDBOX_PARTITIONS_CNT;
-+		/* transfer ownership to the consumer: the non secure world */
-+		sandbox_ffa_priv_data.pair_info.rxbuf_owned =3D 1;
-+
-+		goto cleanup;
-+	}
-+
-+	/*
-+	 * A UUID is specified. Return the information of all partitions match=
ing
-+	 * the UUID
-+	 */
-+
-+	for (descs_cnt =3D 0 ; descs_cnt < SANDBOX_PARTITIONS_CNT ; descs_cnt+=
+)
-+		if (pargs->a1 =3D=3D sandbox_ffa_priv_data.partitions.descs[descs_cnt=
].sp_uuid.a1 &&
-+		    pargs->a2 =3D=3D sandbox_ffa_priv_data.partitions.descs[descs_cnt=
].sp_uuid.a2 &&
-+		    pargs->a3 =3D=3D sandbox_ffa_priv_data.partitions.descs[descs_cnt=
].sp_uuid.a3 &&
-+		    pargs->a4 =3D=3D sandbox_ffa_priv_data.partitions.descs[descs_cnt=
].sp_uuid.a4) {
-+			*(rxbuf_desc_info++) =3D
-+				sandbox_ffa_priv_data.partitions.descs[descs_cnt].info;
-+		}
-+
-+	if (rxbuf_desc_info !=3D ((struct ffa_partition_info *)sandbox_ffa_pri=
v_data.pair.rxbuf)) {
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		/* store the partitions count */
-+		res->a2 =3D (unsigned long)
-+			(rxbuf_desc_info - (struct ffa_partition_info *)
-+			 sandbox_ffa_priv_data.pair.rxbuf);
-+
-+		/* transfer ownership to the consumer: the non secure world */
-+		sandbox_ffa_priv_data.pair_info.rxbuf_owned =3D 1;
-+	} else {
-+		/* Unrecognized UUID */
-+		res->a2 =3D FFA_ERR_STAT_INVALID_PARAMETERS;
-+	}
-+
-+cleanup:
-+
-+	ffa_err("[Sandbox] FFA_PARTITION_INFO_GET (%ld)", res->a2);
-+
-+	res->a1 =3D 0;
-+
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START, 0, FFA_X3X7_MBZ_CNT * sizeof(unsigned lon=
g));
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_rxtx_map - Emulated FFA_RXTX_MAP handler function
-+ * @{a0-a7} , res: The SMC call arguments and return structure.
-+ *
-+ * This is the function that emulates FFA_RXTX_MAP FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+SANDBOX_SMC_FFA_ABI(ffa_rxtx_map)
-+{
-+	res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+
-+	if (sandbox_ffa_priv_data.pair.txbuf && sandbox_ffa_priv_data.pair.rxb=
uf) {
-+		res->a2 =3D FFA_ERR_STAT_DENIED;
-+		goto feedback;
-+	}
-+
-+	if (pargs->a3 >=3D RXTX_BUFFERS_MIN_PAGES && pargs->a1 && pargs->a2) {
-+		sandbox_ffa_priv_data.pair.txbuf =3D pargs->a1;
-+		sandbox_ffa_priv_data.pair.rxbuf =3D pargs->a2;
-+		sandbox_ffa_priv_data.pair_info.rxtx_buf_size =3D pargs->a3;
-+		sandbox_ffa_priv_data.pair_info.rxbuf_mapped =3D 1;
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		res->a2 =3D 0;
-+		goto feedback;
-+	}
-+
-+	if (!pargs->a1 || !pargs->a2)
-+		res->a2 =3D FFA_ERR_STAT_INVALID_PARAMETERS;
-+	else
-+		res->a2 =3D FFA_ERR_STAT_NO_MEMORY;
-+
-+	ffa_err("[Sandbox] error in FFA_RXTX_MAP arguments (%d)", (int)res->a2=
);
-+
-+feedback:
-+
-+	res->a1 =3D 0;
-+
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START,
-+	       0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_rxtx_unmap - Emulated FFA_RXTX_UNMAP handler function
-+ * @{a0-a7} , res: The SMC call arguments and return structure.
-+ *
-+ * This is the function that emulates FFA_RXTX_UNMAP FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+SANDBOX_SMC_FFA_ABI(ffa_rxtx_unmap)
-+{
-+	res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+	res->a2 =3D FFA_ERR_STAT_INVALID_PARAMETERS;
-+
-+	if (GET_NS_PHYS_ENDPOINT_ID(pargs->a1) !=3D sandbox_ffa_priv_data.id)
-+		goto feedback;
-+
-+	if (sandbox_ffa_priv_data.pair.txbuf && sandbox_ffa_priv_data.pair.rxb=
uf) {
-+		sandbox_ffa_priv_data.pair.txbuf =3D 0;
-+		sandbox_ffa_priv_data.pair.rxbuf =3D 0;
-+		sandbox_ffa_priv_data.pair_info.rxtx_buf_size =3D 0;
-+		sandbox_ffa_priv_data.pair_info.rxbuf_mapped =3D 0;
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		res->a2 =3D 0;
-+		goto feedback;
-+	}
-+
-+	ffa_err("[Sandbox] No buffer pair registered on behalf of the caller")=
;
-+
-+feedback:
-+
-+	res->a1 =3D 0;
-+
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START,
-+	       0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_rx_release - Emulated FFA_RX_RELEASE handler function
-+ * @{a0-a7} , res: The SMC call arguments and return structure.
-+ *
-+ * This is the function that emulates FFA_RX_RELEASE FF-A function.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+SANDBOX_SMC_FFA_ABI(ffa_rx_release)
-+{
-+	if (!sandbox_ffa_priv_data.pair_info.rxbuf_owned) {
-+		res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+		res->a2 =3D FFA_ERR_STAT_DENIED;
-+	} else {
-+		sandbox_ffa_priv_data.pair_info.rxbuf_owned =3D 0;
-+		res->a0 =3D FFA_SMC_32(FFA_SUCCESS);
-+		res->a2 =3D 0;
-+	}
-+
-+	res->a1 =3D 0;
-+
-+	/* x3-x7 MBZ */
-+	memset(FFA_X3_MBZ_REG_START,
-+	       0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_sp_valid - Checks SP validity
-+ * @part_id: partition ID to check
-+ *
-+ * This is the function searches the input ID in the descriptors table.
-+ *
-+ * Return:
-+ *
-+ * 1 on success (Partition found). Otherwise, failure
-+ */
-+static int sandbox_ffa_sp_valid(u16 part_id)
-+{
-+	u32 descs_cnt;
-+
-+	for (descs_cnt =3D 0 ; descs_cnt < SANDBOX_PARTITIONS_CNT ; descs_cnt+=
+)
-+		if (sandbox_ffa_priv_data.partitions.descs[descs_cnt].info.id =3D=3D =
part_id)
-+			return 1;
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_msg_send_direct_req - Emulated FFA_MSG_SEND_DIRECT_{REQ,=
RESP} handler function
-+ * @{a0-a7} , res: The SMC call arguments and return structure.
-+ *
-+ * This is the function that emulates FFA_MSG_SEND_DIRECT_{REQ,RESP}
-+ * FF-A functions. Only SMC 64-bit is supported in Sandbox.
-+ *
-+ * Emulating interrupts is not supported. So, FFA_RUN and FFA_INTERRUPT=
 are not supported.
-+ * In case of success FFA_MSG_SEND_DIRECT_RESP is returned with default=
 pattern data (0xff).
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+SANDBOX_SMC_FFA_ABI(ffa_msg_send_direct_req)
-+{
-+	u16 part_id;
-+
-+	part_id =3D GET_DST_SP_ID(pargs->a1);
-+
-+	if ((GET_NS_PHYS_ENDPOINT_ID(pargs->a1) !=3D sandbox_ffa_priv_data.id)=
 ||
-+	    !sandbox_ffa_sp_valid(part_id) ||
-+		pargs->a2) {
-+		res->a0 =3D FFA_SMC_32(FFA_ERROR);
-+		res->a1 =3D 0;
-+		res->a2 =3D FFA_ERR_STAT_INVALID_PARAMETERS;
-+
-+		/* x3-x7 MBZ */
-+		memset(FFA_X3_MBZ_REG_START,
-+		       0, FFA_X3X7_MBZ_CNT * sizeof(unsigned long));
-+
-+		return 0;
-+	}
-+
-+	res->a0 =3D FFA_SMC_64(FFA_MSG_SEND_DIRECT_RESP);
-+
-+	res->a1 =3D PREP_SRC_SP_ID(part_id) |
-+		PREP_NS_PHYS_ENDPOINT_ID(sandbox_ffa_priv_data.id);
-+
-+	res->a2 =3D 0;
-+
-+	/*
-+	 * return 0xff bytes as a response
-+	 */
-+	res->a3 =3D 0xffffffffffffffff;
-+	res->a4 =3D 0xffffffffffffffff;
-+	res->a5 =3D 0xffffffffffffffff;
-+	res->a6 =3D 0xffffffffffffffff;
-+	res->a7 =3D 0xffffffffffffffff;
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_get_prv_data - Returns the pointer to FF-A core pivate d=
ata
-+ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
-+ *
-+ * This is the handler that returns the address of the FF-A core pivate=
 data.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_get_prv_data(struct ffa_sandbox_data *func_data)
-+{
-+	if (!func_data)
-+		return -EINVAL;
-+
-+	if (!func_data->data0 || func_data->data0_size !=3D sizeof(struct ffa_=
prvdata *))
-+		return -EINVAL;
-+
-+	if (!func_data->data1 || func_data->data1_size !=3D sizeof(struct sand=
box_ffa_prvdata *))
-+		return -EINVAL;
-+
-+	*((struct ffa_prvdata **)func_data->data0) =3D ffa_bus_prvdata_get();
-+	*((struct sandbox_ffa_prvdata **)func_data->data1) =3D &sandbox_ffa_pr=
iv_data;
-+
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_get_rxbuf_flags - Reading the mapping/ownership flags
-+ * @queried_func_id:	The FF-A function to be queried
-+ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
-+ *
-+ * This is the handler that queries the status flags of the following e=
mulated ABIs:
-+ * FFA_RXTX_MAP, FFA_RXTX_UNMAP, FFA_RX_RELEASE
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_get_rxbuf_flags(u32 queried_func_id, struct ffa_=
sandbox_data *func_data)
-+{
-+	if (!func_data)
-+		return -EINVAL;
-+
-+	if (!func_data->data0 || func_data->data0_size !=3D sizeof(u8))
-+		return -EINVAL;
-+
-+	switch (queried_func_id) {
-+	case FFA_RXTX_MAP:
-+	case FFA_RXTX_UNMAP:
-+		*((u8 *)func_data->data0) =3D sandbox_ffa_priv_data.pair_info.rxbuf_m=
apped;
-+		return 0;
-+	case FFA_RX_RELEASE:
-+		*((u8 *)func_data->data0) =3D sandbox_ffa_priv_data.pair_info.rxbuf_o=
wned;
-+		return 0;
-+	default:
-+		ffa_err("[Sandbox] The querried  FF-A interface flag (%d) undefined",
-+			queried_func_id);
-+		return -EINVAL;
-+	}
-+}
-+
-+/**
-+ * sandbox_ffa_query_core_state - The driver dispatcher function
-+ * @queried_func_id:	The FF-A function to be queried
-+ * @func_data:  Pointer to the FF-A function arguments container struct=
ure
-+ *
-+ * Queries the status of FF-A ABI specified in the input argument.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+int sandbox_ffa_query_core_state(u32 queried_func_id, struct ffa_sandbo=
x_data *func_data)
-+{
-+	switch (queried_func_id) {
-+	case FFA_VERSION:
-+	case FFA_ID_GET:
-+	case FFA_FEATURES:
-+		return sandbox_ffa_get_prv_data(func_data);
-+	case FFA_RXTX_MAP:
-+	case FFA_RXTX_UNMAP:
-+	case FFA_RX_RELEASE:
-+		return sandbox_ffa_get_rxbuf_flags(queried_func_id, func_data);
-+	default:
-+		ffa_err("[Sandbox] The querried  FF-A interface (%d) undefined", quer=
ied_func_id);
-+		return -EINVAL;
-+	}
-+}
-+
-+/**
-+ * sandbox_arm_ffa_smccc_smc - FF-A SMC call emulation
-+ * @args:	the SMC call arguments
-+ * @res:	the SMC call returned data
-+ *
-+ * Sandbox driver emulates the FF-A ABIs SMC call using this function.
-+ * The emulated FF-A ABI is identified and invoked.
-+ * FF-A emulation is based on the FF-A specification 1.0
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure.
-+ * FF-A protocol error codes are returned using the registers arguments=
 as described
-+ * by the specification
-+ */
-+void sandbox_arm_ffa_smccc_smc(ffa_value_t args, ffa_value_t *res)
-+{
-+	int ret =3D 0;
-+
-+	switch (args.a0) {
-+	case FFA_SMC_32(FFA_VERSION):
-+		ret =3D sandbox_ffa_version(&args, res);
-+		break;
-+	case FFA_SMC_32(FFA_PARTITION_INFO_GET):
-+		ret =3D sandbox_ffa_partition_info_get(&args, res);
-+		break;
-+	case FFA_SMC_32(FFA_RXTX_UNMAP):
-+		ret =3D sandbox_ffa_rxtx_unmap(&args, res);
-+		break;
-+	case FFA_SMC_64(FFA_MSG_SEND_DIRECT_REQ):
-+		ret =3D sandbox_ffa_msg_send_direct_req(&args, res);
-+		break;
-+	case FFA_SMC_32(FFA_ID_GET):
-+		ret =3D sandbox_ffa_id_get(&args, res);
-+		break;
-+	case FFA_SMC_32(FFA_FEATURES):
-+		ret =3D sandbox_ffa_features(&args, res);
-+		break;
-+	case FFA_SMC_64(FFA_RXTX_MAP):
-+		ret =3D sandbox_ffa_rxtx_map(&args, res);
-+		break;
-+	case FFA_SMC_32(FFA_RX_RELEASE):
-+		ret =3D sandbox_ffa_rx_release(&args, res);
-+		break;
-+	default:
-+		ffa_err("[Sandbox] Undefined FF-A interface (0x%lx)", args.a0);
-+	}
-+
-+	if (ret !=3D 0)
-+		ffa_err("[Sandbox] FF-A ABI internal failure  (%d)", ret);
-+}
-+
-+/**
-+ * sandbox_ffa_probe - The driver probe function
-+ * @dev:	the sandbox_arm_ffa device
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_probe(struct udevice *dev)
-+{
-+	return 0;
-+}
-+
-+/**
-+ * sandbox_ffa_remove - The driver remove function
-+ * @dev:	the sandbox_arm_ffa device
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int sandbox_ffa_remove(struct udevice *dev)
-+{
-+	ffa_info("[Sandbox] removing the device");
-+	memset(&sandbox_ffa_priv_data, 0, sizeof(sandbox_ffa_priv_data));
-+	return 0;
-+}
-+
-+/**
-+ * Declaring the sandbox_arm_ffa driver under UCLASS_FFA
-+ */
-+U_BOOT_DRIVER(sandbox_arm_ffa) =3D {
-+	.name		=3D FFA_SANDBOX_DRV_NAME,
-+	.id		=3D UCLASS_FFA,
-+	.probe		=3D sandbox_ffa_probe,
-+	.remove		=3D sandbox_ffa_remove,
-+};
-diff --git a/drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h b/drivers/fi=
rmware/arm-ffa/sandbox_arm_ffa_prv.h
-new file mode 100644
-index 0000000000..4db57f5092
---- /dev/null
-+++ b/drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h
-@@ -0,0 +1,144 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __SANDBOX_ARM_FFA_PRV_H
-+#define __SANDBOX_ARM_FFA_PRV_H
-+
-+#include "arm_ffa_prv.h"
-+#include <sandbox_arm_ffa.h>
-+
-+/*
-+ * This header is private. It is exclusively used by the Sandbox FF-A d=
river
-+ */
-+
-+/* FF-A core driver name */
-+#define FFA_SANDBOX_DRV_NAME "sandbox_arm_ffa"
-+
-+/* FF-A ABIs internal error codes (as defined by the spec) */
-+
-+#define FFA_ERR_STAT_NOT_SUPPORTED	-1
-+#define FFA_ERR_STAT_INVALID_PARAMETERS	-2
-+#define FFA_ERR_STAT_NO_MEMORY	-3
-+#define FFA_ERR_STAT_BUSY	-4
-+#define FFA_ERR_STAT_DENIED	-6
-+
-+/* Providing Arm SMCCC declarations to sandbox */
-+
-+#define ARM_SMCCC_FAST_CALL		1UL
-+#define ARM_SMCCC_OWNER_STANDARD	4
-+#define ARM_SMCCC_SMC_32		0
-+#define ARM_SMCCC_SMC_64		1
-+#define ARM_SMCCC_TYPE_SHIFT		31
-+#define ARM_SMCCC_CALL_CONV_SHIFT	30
-+#define ARM_SMCCC_OWNER_MASK		0x3F
-+#define ARM_SMCCC_OWNER_SHIFT		24
-+#define ARM_SMCCC_FUNC_MASK		0xFFFF
-+
-+#define ARM_SMCCC_CALL_VAL(type, calling_convention, owner, func_num) \
-+	(((type) << ARM_SMCCC_TYPE_SHIFT) | \
-+	((calling_convention) << ARM_SMCCC_CALL_CONV_SHIFT) | \
-+	(((owner) & ARM_SMCCC_OWNER_MASK) << ARM_SMCCC_OWNER_SHIFT) | \
-+	((func_num) & ARM_SMCCC_FUNC_MASK))
-+
-+/* Non-secure physical FF-A instance */
-+#define NS_PHYS_ENDPOINT_ID (0)
-+
-+#define GET_NS_PHYS_ENDPOINT_ID_MASK		GENMASK(31, 16)
-+#define GET_NS_PHYS_ENDPOINT_ID(x)		\
-+			((u16)(FIELD_GET(GET_NS_PHYS_ENDPOINT_ID_MASK, (x))))
-+
-+/* Helper macro for reading the destination partition ID */
-+#define GET_DST_SP_ID_MASK		GENMASK(15, 0)
-+#define GET_DST_SP_ID(x)		\
-+			((u16)(FIELD_GET(GET_DST_SP_ID_MASK, (x))))
-+
-+/* Helper macro for setting the source partition ID */
-+#define PREP_SRC_SP_ID_MASK		GENMASK(31, 16)
-+#define PREP_SRC_SP_ID(x)		\
-+			(FIELD_PREP(PREP_SRC_SP_ID_MASK, (x)))
-+
-+/* Helper macro for setting the destination endpoint ID */
-+#define PREP_NS_PHYS_ENDPOINT_ID_MASK		GENMASK(15, 0)
-+#define PREP_NS_PHYS_ENDPOINT_ID(x)		\
-+			(FIELD_PREP(PREP_NS_PHYS_ENDPOINT_ID_MASK, (x)))
-+
-+/*  RX/TX buffers minimum size */
-+#define RXTX_BUFFERS_MIN_SIZE (RXTX_4K)
-+#define RXTX_BUFFERS_MIN_PAGES (1)
-+
-+/* MBZ registers info */
-+
-+/* x1-x7 MBZ */
-+#define FFA_X1X7_MBZ_CNT (7)
-+#define FFA_X1X7_MBZ_REG_START (&res->a1)
-+
-+/* x4-x7 MBZ */
-+#define FFA_X4X7_MBZ_CNT (4)
-+#define FFA_X4X7_MBZ_REG_START (&res->a4)
-+
-+/* x3-x7 MBZ */
-+#define FFA_X3X7_MBZ_CNT (5)
-+#define FFA_X3_MBZ_REG_START (&res->a3)
-+
-+/* secure partitions count */
-+#define SANDBOX_PARTITIONS_CNT (4)
-+
-+/* service 1  UUID binary data (little-endian format) */
-+#define SANDBOX_SERVICE1_UUID_A1	0xed32d533
-+#define SANDBOX_SERVICE1_UUID_A2	0x99e64209
-+#define SANDBOX_SERVICE1_UUID_A3	0x9cc02d72
-+#define SANDBOX_SERVICE1_UUID_A4	0xcdd998a7
-+
-+/* service 2  UUID binary data (little-endian format) */
-+#define SANDBOX_SERVICE2_UUID_A1	0xed32d544
-+#define SANDBOX_SERVICE2_UUID_A2	0x99e64209
-+#define SANDBOX_SERVICE2_UUID_A3	0x9cc02d72
-+#define SANDBOX_SERVICE2_UUID_A4	0xcdd998a7
-+
-+/**
-+ * struct ffa_rxtxpair_info - structure hosting the RX/TX buffers flags
-+ * @rxbuf_owned:	RX buffer ownership flag (the owner is non secure worl=
d: the consumer)
-+ * @rxbuf_mapped:	RX buffer mapping flag
-+ * @txbuf_owned	TX buffer ownership flag
-+ * @txbuf_mapped:	TX buffer mapping flag
-+ * @rxtx_buf_size:	RX/TX buffers size as set by the FF-A core driver
-+ *
-+ * Data structure hosting the ownership/mapping flags of the RX/TX buff=
ers
-+ * When a buffer is owned/mapped its corresponding flag is set to 1 oth=
erwise 0.
-+ */
-+struct ffa_rxtxpair_info {
-+	u8 rxbuf_owned;
-+	u8 rxbuf_mapped;
-+	u8 txbuf_owned;
-+	u8 txbuf_mapped;
-+	u32 rxtx_buf_size;
-+};
-+
-+/**
-+ * struct sandbox_ffa_prvdata - the driver private data structure
-+ *
-+ * @dev:	The arm_ffa device under u-boot driver model
-+ * @fwk_version:	FF-A framework version
-+ * @id:	u-boot endpoint ID
-+ * @partitions:	The partitions descriptors structure
-+ * @pair:	The RX/TX buffers pair
-+ * @pair_info:	The RX/TX buffers pair flags and size
-+ * @conduit:	The selected conduit
-+ *
-+ * The driver data structure hosting all the emulated secure world data=
.
-+ */
-+struct sandbox_ffa_prvdata {
-+	struct udevice *dev;
-+	u32 fwk_version;
-+	u16 id;
-+	struct ffa_partitions partitions;
-+	struct ffa_rxtxpair pair;
-+	struct ffa_rxtxpair_info pair_info;
-+};
-+
-+#define SANDBOX_SMC_FFA_ABI(ffabi) static int sandbox_##ffabi(ffa_value=
_t *pargs, ffa_value_t *res)
-+
-+#endif
-diff --git a/include/arm_ffa.h b/include/arm_ffa.h
-index 74b16174c2..b88904fe50 100644
---- a/include/arm_ffa.h
-+++ b/include/arm_ffa.h
-@@ -90,7 +90,7 @@ struct ffa_bus_ops {
- const struct ffa_bus_ops *ffa_bus_ops_get(void);
-=20
- /**
-- * ffa_bus_discover - discover FF-A bus and probes the arm_ffa device
-+ * ffa_bus_discover - discover FF-A bus and probes the arm_ffa and sand=
box_arm_ffa devices
-  */
- int ffa_bus_discover(struct udevice **pdev);
-=20
-diff --git a/include/sandbox_arm_ffa.h b/include/sandbox_arm_ffa.h
-new file mode 100644
-index 0000000000..d5df16f282
---- /dev/null
-+++ b/include/sandbox_arm_ffa.h
-@@ -0,0 +1,91 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __SANDBOX_ARM_FFA_H
-+#define __SANDBOX_ARM_FFA_H
-+
-+#include <arm_ffa.h>
-+
-+/**
-+ * struct sandbox_smccc_1_2_regs - Arguments for or Results from emulat=
ed SMC call
-+ * @a0-a17 argument values from registers 0 to 17
-+ */
-+struct sandbox_smccc_1_2_regs {
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
-+typedef struct sandbox_smccc_1_2_regs ffa_value_t;
-+
-+/* UUIDs of services supported by the sandbox driver */
-+#define SANDBOX_SERVICE1_UUID	"ed32d533-4209-99e6-2d72-cdd998a79cc0"
-+#define SANDBOX_SERVICE2_UUID	"ed32d544-4209-99e6-2d72-cdd998a79cc0"
-+#define SANDBOX_SP1_ID 0x1245
-+#define SANDBOX_SP2_ID 0x9836
-+#define SANDBOX_SP3_ID 0x6452
-+#define SANDBOX_SP4_ID 0x7814
-+
-+/* invalid service UUID (no matching SP) */
-+#define SANDBOX_SERVICE3_UUID	"55d532ed-0942-e699-722d-c09ca798d9cd"
-+
-+/* invalid service UUID (invalid UUID string format) */
-+#define SANDBOX_SERVICE4_UUID	"32ed-0942-e699-722d-c09ca798d9cd"
-+
-+#define SANDBOX_SP_COUNT_PER_VALID_SERVICE	2
-+
-+/**
-+ * struct ffa_sandbox_data - generic data structure used to exchange
-+ *						data between test cases and the sandbox driver
-+ * @data0_size:	size of the first argument
-+ * @data0:	pointer to the first argument
-+ * @data1_size>:	size of the second argument
-+ * @data1:	pointer to the second argument
-+ *
-+ * Using this structure sandbox test cases can pass various types of da=
ta with different sizes.
-+ */
-+struct ffa_sandbox_data {
-+	u32 data0_size; /* size of the first argument */
-+	void *data0; /* pointer to the first argument */
-+	u32 data1_size; /* size of the second argument */
-+	void *data1; /* pointer to the second argument */
-+};
-+
-+/**
-+ * The sandbox driver public functions
-+ */
-+
-+/**
-+ * sandbox_ffa_query_core_state - Queries the status of FF-A ABIs
-+ */
-+int sandbox_ffa_query_core_state(u32 queried_func_id, struct ffa_sandbo=
x_data *func_data);
-+
-+/**
-+ * sandbox_ffa_get_device - create, bind and probe the sandbox_arm_ffa =
device
-+ */
-+int sandbox_ffa_device_get(void);
-+
-+/**
-+ * sandbox_arm_ffa_smccc_smc - FF-A SMC call emulation
-+ */
-+void sandbox_arm_ffa_smccc_smc(ffa_value_t args, ffa_value_t *res);
-+
-+#endif
-diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 3481f2afe7..fea4eb7a34 100644
---- a/lib/efi_loader/efi_boottime.c
-+++ b/lib/efi_loader/efi_boottime.c
-@@ -2185,7 +2185,7 @@ static efi_status_t EFIAPI efi_exit_boot_services(=
efi_handle_t image_handle,
- 		dm_remove_devices_flags(DM_REMOVE_ACTIVE_ALL);
- 	}
-=20
--#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT)
-+#if CONFIG_IS_ENABLED(ARM_FFA_TRANSPORT) && !CONFIG_IS_ENABLED(SANDBOX_=
FFA)
- 		/* unmap FF-A RX/TX buffers */
- 		if (ffa_bus_ops_get()->rxtx_unmap(NULL))
- 			log_err("Can't unmap FF-A RX/TX buffers\n");
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-FF-=
A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0007-FF-A-v15-arm_ffa-introduce-sand=
box-test-cases-for-UC.patch
new file mode 100644
index 00000000..966c32bd
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-FF-A-v15-a=
rm_ffa-introduce-sandbox-test-cases-for-UC.patch
@@ -0,0 +1,341 @@
+From 00d0d8edf47430e3069e7c1dfa7a5bb7bb36bd49 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 10 May 2023 17:34:55 +0100
+Subject: [PATCH 07/33] FF-A v15: arm_ffa: introduce sandbox test cases f=
or
+ UCLASS_FFA
+
+Add functional test cases for the FF-A support
+
+These tests rely on the FF-A sandbox emulator and FF-A
+sandbox driver which help in inspecting the FF-A communication.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+Cc: Tom Rini <trini@konsulko.com>
+Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Cc: Jens Wiklander <jens.wiklander@linaro.org>
+Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
+---
+ MAINTAINERS            |   1 +
+ doc/arch/arm64.ffa.rst |   1 +
+ test/dm/Makefile       |   3 +-
+ test/dm/ffa.c          | 261 +++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 265 insertions(+), 1 deletion(-)
+ create mode 100644 test/dm/ffa.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 679a3acdd8..ccd7859c88 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -276,6 +276,7 @@ F:	doc/arch/arm64.ffa.rst
+ F:	doc/usage/cmd/armffa.rst
+ F:	drivers/firmware/arm-ffa/
+ F:	include/arm_ffa.h
++F:	test/dm/ffa.c
+=20
+ ARM FREESCALE IMX
+ M:	Stefano Babic <sbabic@denx.de>
+diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
+index b7c754fa3d..325fb80346 100644
+--- a/doc/arch/arm64.ffa.rst
++++ b/doc/arch/arm64.ffa.rst
+@@ -37,6 +37,7 @@ The U-Boot FF-A support provides the following parts:
+   FF-A ABIs inspection methods.
+ - An FF-A sandbox device driver for FF-A communication with the emulate=
d Secure World.
+   The driver leverages the FF-A Uclass to establish FF-A communication.
++- Sandbox FF-A test cases.
+=20
+ FF-A and SMC specifications
+ -------------------------------------------
+diff --git a/test/dm/Makefile b/test/dm/Makefile
+index 3799b1ae8f..7ed00733c1 100644
+--- a/test/dm/Makefile
++++ b/test/dm/Makefile
+@@ -1,7 +1,7 @@
+ # SPDX-License-Identifier: GPL-2.0+
+ #
+ # Copyright (c) 2013 Google, Inc
+-# Copyright 2023 Arm Limited and/or its affiliates <open-source-office@=
arm.com>
++# Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
+=20
+ obj-$(CONFIG_UT_DM) +=3D test-dm.o
+=20
+@@ -92,6 +92,7 @@ obj-$(CONFIG_POWER_DOMAIN) +=3D power-domain.o
+ obj-$(CONFIG_ACPI_PMC) +=3D pmc.o
+ obj-$(CONFIG_DM_PMIC) +=3D pmic.o
+ obj-$(CONFIG_DM_PWM) +=3D pwm.o
++obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D ffa.o
+ obj-$(CONFIG_QFW) +=3D qfw.o
+ obj-$(CONFIG_RAM) +=3D ram.o
+ obj-y +=3D regmap.o
+diff --git a/test/dm/ffa.c b/test/dm/ffa.c
+new file mode 100644
+index 0000000000..6912666bb4
+--- /dev/null
++++ b/test/dm/ffa.c
+@@ -0,0 +1,261 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Functional tests for UCLASS_FFA  class
++ *
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <console.h>
++#include <dm.h>
++#include <asm/sandbox_arm_ffa.h>
++#include <asm/sandbox_arm_ffa_priv.h>
++#include <dm/test.h>
++#include <test/test.h>
++#include <test/ut.h>
++
++/* Functional tests for the UCLASS_FFA */
++
++static int check_fwk_version(struct ffa_priv *uc_priv, struct unit_test=
_state *uts)
++{
++	struct ffa_sandbox_data func_data;
++	u32 fwk_version =3D 0;
++
++	func_data.data0 =3D &fwk_version;
++	func_data.data0_size =3D sizeof(fwk_version);
++	ut_assertok(sandbox_query_ffa_emul_state(FFA_VERSION, &func_data));
++	ut_asserteq(uc_priv->fwk_version, fwk_version);
++
++	return 0;
++}
++
++static int check_endpoint_id(struct ffa_priv *uc_priv, struct unit_test=
_state *uts)
++{
++	ut_asserteq(0, uc_priv->id);
++
++	return 0;
++}
++
++static int check_rxtxbuf(struct ffa_priv *uc_priv, struct unit_test_sta=
te *uts)
++{
++	ut_assertnonnull(uc_priv->pair.rxbuf);
++	ut_assertnonnull(uc_priv->pair.txbuf);
++
++	return 0;
++}
++
++static int check_features(struct ffa_priv *uc_priv, struct unit_test_st=
ate *uts)
++{
++	ut_assert(uc_priv->pair.rxtx_min_pages =3D=3D RXTX_4K ||
++		  uc_priv->pair.rxtx_min_pages =3D=3D RXTX_16K ||
++		  uc_priv->pair.rxtx_min_pages =3D=3D RXTX_64K);
++
++	return 0;
++}
++
++static int check_rxbuf_mapped_flag(u32 queried_func_id,
++				   u8 rxbuf_mapped,
++				   struct unit_test_state *uts)
++{
++	switch (queried_func_id) {
++	case FFA_RXTX_MAP:
++		ut_asserteq(1, rxbuf_mapped);
++		break;
++	case FFA_RXTX_UNMAP:
++		ut_asserteq(0, rxbuf_mapped);
++		break;
++	default:
++		ut_assert(false);
++	}
++
++	return 0;
++}
++
++static int check_rxbuf_release_flag(u8 rxbuf_owned, struct unit_test_st=
ate *uts)
++{
++	ut_asserteq(0, rxbuf_owned);
++
++	return 0;
++}
++
++static int  test_ffa_msg_send_direct_req(u16 part_id, struct unit_test_=
state *uts)
++{
++	struct ffa_send_direct_data msg;
++	u8 cnt;
++	struct udevice *dev;
++
++	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
++
++	ut_assertok(ffa_sync_send_receive(dev, part_id, &msg, 1));
++
++	for (cnt =3D 0; cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64=
); cnt++)
++		ut_asserteq_64(-1UL, ((u64 *)&msg)[cnt]);
++
++	return 0;
++}
++
++static int test_partitions_and_comms(const char *service_uuid,
++				     struct unit_test_state *uts)
++{
++	struct ffa_partition_desc *descs;
++	u32 count, i, j, valid_sps =3D 0;
++	struct udevice *dev;
++	struct ffa_sandbox_data func_data;
++	struct ffa_partitions *partitions;
++
++	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
++
++	/* Get from the driver the count and information of the SPs matching t=
he UUID */
++	ut_assertok(ffa_partition_info_get(dev, service_uuid, &count, &descs))=
;
++
++	/* Make sure the count is correct */
++	ut_asserteq(SANDBOX_SP_COUNT_PER_VALID_SERVICE, count);
++
++	/* SPs found , verify the partitions information */
++
++	func_data.data0 =3D &partitions;
++	func_data.data0_size =3D sizeof(struct ffa_partitions *);
++	ut_assertok(sandbox_query_ffa_emul_state(FFA_PARTITION_INFO_GET, &func=
_data));
++
++	for (i =3D 0; i < count ; i++) {
++		for (j =3D 0;
++		     j < partitions->count;
++		     j++) {
++			if (descs[i].info.id =3D=3D
++			   partitions->descs[j].info.id) {
++				valid_sps++;
++				ut_asserteq_mem(&descs[i],
++						&partitions->descs[j],
++						sizeof(struct ffa_partition_desc));
++				/* Send and receive data from the current partition */
++				test_ffa_msg_send_direct_req(descs[i].info.id, uts);
++			}
++		}
++	}
++
++	/* Verify expected partitions found in the emulated secure world */
++	ut_asserteq(SANDBOX_SP_COUNT_PER_VALID_SERVICE, valid_sps);
++
++	return 0;
++}
++
++static int dm_test_ffa_ack(struct unit_test_state *uts)
++{
++	struct ffa_priv *uc_priv;
++	struct ffa_sandbox_data func_data;
++	u8 rxbuf_flag =3D 0;
++	const char *svc1_uuid =3D SANDBOX_SERVICE1_UUID;
++	const char *svc2_uuid =3D SANDBOX_SERVICE2_UUID;
++	struct udevice *dev;
++
++	/* Test probing the sandbox FF-A bus */
++	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
++
++	/* Get a pointer to the sandbox FF-A bus private data */
++	uc_priv =3D dev_get_uclass_priv(dev);
++
++	/* Make sure the private data pointer is retrieved */
++	ut_assertnonnull(uc_priv);
++
++	/* Test FFA_VERSION */
++	check_fwk_version(uc_priv, uts);
++
++	/* Test FFA_ID_GET */
++	check_endpoint_id(uc_priv, uts);
++
++	/* Test FFA_FEATURES */
++	check_features(uc_priv, uts);
++
++	/*  Test RX/TX buffers */
++	check_rxtxbuf(uc_priv, uts);
++
++	/* Test FFA_RXTX_MAP */
++	func_data.data0 =3D &rxbuf_flag;
++	func_data.data0_size =3D sizeof(rxbuf_flag);
++
++	rxbuf_flag =3D 0;
++	sandbox_query_ffa_emul_state(FFA_RXTX_MAP, &func_data);
++	check_rxbuf_mapped_flag(FFA_RXTX_MAP, rxbuf_flag, uts);
++
++	/* FFA_PARTITION_INFO_GET / FFA_MSG_SEND_DIRECT_REQ */
++	test_partitions_and_comms(svc1_uuid, uts);
++
++	/* Test FFA_RX_RELEASE */
++	rxbuf_flag =3D 1;
++	sandbox_query_ffa_emul_state(FFA_RX_RELEASE, &func_data);
++	check_rxbuf_release_flag(rxbuf_flag, uts);
++
++	/* FFA_PARTITION_INFO_GET / FFA_MSG_SEND_DIRECT_REQ */
++	test_partitions_and_comms(svc2_uuid, uts);
++
++	/* Test FFA_RX_RELEASE */
++	rxbuf_flag =3D 1;
++	ut_assertok(sandbox_query_ffa_emul_state(FFA_RX_RELEASE, &func_data));
++	check_rxbuf_release_flag(rxbuf_flag, uts);
++
++	return 0;
++}
++
++DM_TEST(dm_test_ffa_ack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
++
++static int dm_test_ffa_nack(struct unit_test_state *uts)
++{
++	struct ffa_priv *uc_priv;
++	const char *valid_svc_uuid =3D SANDBOX_SERVICE1_UUID;
++	const char *unvalid_svc_uuid =3D SANDBOX_SERVICE3_UUID;
++	const char *unvalid_svc_uuid_str =3D SANDBOX_SERVICE4_UUID;
++	struct ffa_send_direct_data msg;
++	int ret;
++	u32 count;
++	u16 part_id =3D 0;
++	struct udevice *dev;
++	struct ffa_partition_desc *descs =3D NULL;
++
++	/* Test probing the sandbox FF-A bus */
++	ut_assertok(uclass_first_device_err(UCLASS_FFA, &dev));
++
++	/* Get a pointer to the sandbox FF-A bus private data */
++	uc_priv =3D dev_get_uclass_priv(dev);
++
++	/* Make sure the private data pointer is retrieved */
++	ut_assertnonnull(uc_priv);
++
++	/* Query partitions count using  invalid arguments */
++	ret =3D ffa_partition_info_get(dev, NULL, NULL, NULL);
++	ut_asserteq(-EINVAL, ret);
++	ret =3D ffa_partition_info_get(dev, unvalid_svc_uuid, NULL, NULL);
++	ut_asserteq(-EINVAL, ret);
++	ret =3D ffa_partition_info_get(dev, unvalid_svc_uuid, &count, NULL);
++	ut_asserteq(-EINVAL, ret);
++
++	/* Query partitions count using an invalid UUID  string */
++	ret =3D ffa_partition_info_get(dev, unvalid_svc_uuid_str, &count, &des=
cs);
++	ut_asserteq(-EINVAL, ret);
++
++	/* Query partitions count using an invalid UUID (no matching SP) */
++	count =3D 0;
++	ret =3D ffa_partition_info_get(dev, unvalid_svc_uuid, &count, &descs);
++	ut_asserteq(0, count);
++
++	/* Query partitions data using a valid UUID */
++	count =3D 0;
++	ut_assertok(ffa_partition_info_get(dev, valid_svc_uuid, &count, &descs=
));
++	/* Make sure partitions are detected */
++	ut_asserteq(SANDBOX_SP_COUNT_PER_VALID_SERVICE, count);
++	ut_assertnonnull(descs);
++
++	/* Send data to an invalid partition */
++	ret =3D ffa_sync_send_receive(dev, part_id, &msg, 1);
++	ut_asserteq(-EINVAL, ret);
++
++	/* Send data to a valid partition */
++	part_id =3D uc_priv->partitions.descs[0].info.id;
++	ut_assertok(ffa_sync_send_receive(dev, part_id, &msg, 1));
++
++	return 0;
++}
++
++DM_TEST(dm_test_ffa_nack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm=
_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introduce-Sandbox-test-c=
ases-for-UCLASS_FFA.patch
deleted file mode 100644
index d248e8b0..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-in=
troduce-Sandbox-test-cases-for-UCLASS_FFA.patch
+++ /dev/null
@@ -1,472 +0,0 @@
-From 3664fe7503cbc4348bbd7bcb8fbf7e1db332ac5d Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 6 Jun 2022 17:26:06 +0100
-Subject: [PATCH 07/42] arm_ffa: introduce Sandbox test cases for UCLASS_=
FFA
-
-Add functional test cases for the FF-A core driver
-
-These tests rely on the FF-A Sandbox driver which helps in
- inspecting the FF-A core driver.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Simon Glass <sjg@chromium.org>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v8:
-
-  * update partition_info_get() second argument to be an SP count
-  * pass NULL device pointer to the FF-A bus discovery and operations
-
-v7: set the tests to use 64-bit direct messaging
-
-v4: align sandbox tests with the new FF-A driver interfaces
- and new way of error handling
-
-v1: introduce sandbox tests
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- MAINTAINERS      |   1 +
- test/dm/Makefile |   2 +
- test/dm/ffa.c    | 392 +++++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 395 insertions(+)
- create mode 100644 test/dm/ffa.c
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 297d165f84..c1d3d4ae1c 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -272,6 +272,7 @@ F:	doc/arch/arm64.ffa.rst
- F:	drivers/firmware/arm-ffa/
- F:	include/arm_ffa.h
- F:	include/sandbox_arm_ffa.h
-+F:	test/dm/ffa.c
-=20
- ARM FREESCALE IMX
- M:	Stefano Babic <sbabic@denx.de>
-diff --git a/test/dm/Makefile b/test/dm/Makefile
-index 7a79b6e1a2..85e99e1c12 100644
---- a/test/dm/Makefile
-+++ b/test/dm/Makefile
-@@ -1,6 +1,7 @@
- # SPDX-License-Identifier: GPL-2.0+
- #
- # Copyright (c) 2013 Google, Inc
-+# (C) Copyright 2022 ARM Limited
-=20
- obj-$(CONFIG_UT_DM) +=3D test-dm.o
-=20
-@@ -85,6 +86,7 @@ obj-$(CONFIG_POWER_DOMAIN) +=3D power-domain.o
- obj-$(CONFIG_ACPI_PMC) +=3D pmc.o
- obj-$(CONFIG_DM_PMIC) +=3D pmic.o
- obj-$(CONFIG_DM_PWM) +=3D pwm.o
-+obj-$(CONFIG_SANDBOX_FFA) +=3D ffa.o
- obj-$(CONFIG_QFW) +=3D qfw.o
- obj-$(CONFIG_RAM) +=3D ram.o
- obj-y +=3D regmap.o
-diff --git a/test/dm/ffa.c b/test/dm/ffa.c
-new file mode 100644
-index 0000000000..128d8626a7
---- /dev/null
-+++ b/test/dm/ffa.c
-@@ -0,0 +1,392 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Functional tests for UCLASS_FFA  class
-+ *
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <console.h>
-+#include <dm.h>
-+#include <dm/test.h>
-+#include "../../drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h"
-+#include <sandbox_arm_ffa.h>
-+#include <test/test.h>
-+#include <test/ut.h>
-+
-+/* Macros */
-+
-+#define LOG_MSG_SZ (100)
-+#define LOG_CMD_SZ (LOG_MSG_SZ * 2)
-+
-+/* Functional tests for the UCLASS_FFA */
-+
-+static int dm_test_ffa_log(struct unit_test_state *uts, char *msg)
-+{
-+	char cmd[LOG_CMD_SZ] =3D {0};
-+
-+	console_record_reset();
-+
-+	snprintf(cmd, LOG_CMD_SZ, "echo \"%s\"", msg);
-+	run_command(cmd, 0);
-+
-+	ut_assert_console_end();
-+
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static int check_fwk_version(struct ffa_prvdata *prvdata, struct sandbo=
x_ffa_prvdata *sdx_prvdata,
-+			     struct unit_test_state *uts)
-+{
-+	if (prvdata->fwk_version !=3D sdx_prvdata->fwk_version) {
-+		char msg[LOG_MSG_SZ] =3D {0};
-+
-+		snprintf(msg, LOG_MSG_SZ,
-+			 "[%s]: Error: framework version: core =3D 0x%x , sandbox  =3D 0x%x"=
, __func__,
-+			 prvdata->fwk_version,
-+			sdx_prvdata->fwk_version);
-+
-+		dm_test_ffa_log(uts, msg);
-+		return CMD_RET_FAILURE;
-+	}
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static int check_endpoint_id(struct ffa_prvdata *prvdata, struct unit_t=
est_state *uts)
-+{
-+	if (prvdata->id) {
-+		char msg[LOG_MSG_SZ] =3D {0};
-+
-+		snprintf(msg, LOG_MSG_SZ,
-+			 "[%s]: Error: endpoint id: core =3D 0x%x", __func__, prvdata->id);
-+		dm_test_ffa_log(uts, msg);
-+		return CMD_RET_FAILURE;
-+	}
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static int check_core_dev(struct ffa_prvdata *prvdata, struct unit_test=
_state *uts)
-+{
-+	if (!prvdata->dev) {
-+		char msg[LOG_MSG_SZ] =3D {0};
-+
-+		snprintf(msg, LOG_MSG_SZ, "[%s]: Error: core device NULL", __func__);
-+		dm_test_ffa_log(uts, msg);
-+		return CMD_RET_FAILURE;
-+	}
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static int check_sandbox_dev(struct sandbox_ffa_prvdata *sdx_prvdata, s=
truct unit_test_state *uts)
-+{
-+	if (!sdx_prvdata->dev) {
-+		char msg[LOG_MSG_SZ] =3D {0};
-+
-+		snprintf(msg, LOG_MSG_SZ, "[%s]: Error: sandbox device NULL", __func_=
_);
-+		dm_test_ffa_log(uts, msg);
-+		return CMD_RET_FAILURE;
-+	}
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static int check_rxtxbuf(struct ffa_prvdata *prvdata, struct unit_test_=
state *uts)
-+{
-+	if (!prvdata->pair.rxbuf && prvdata->pair.txbuf) {
-+		char msg[LOG_MSG_SZ] =3D {0};
-+
-+		snprintf(msg, LOG_MSG_SZ, "[%s]: Error: rxbuf =3D 0x%llx txbuf =3D 0x=
%llx", __func__,
-+			 prvdata->pair.rxbuf,
-+			 prvdata->pair.txbuf);
-+		dm_test_ffa_log(uts, msg);
-+		return CMD_RET_FAILURE;
-+	}
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static int check_features(struct ffa_prvdata *prvdata, struct unit_test=
_state *uts)
-+{
-+	char msg[LOG_MSG_SZ] =3D {0};
-+
-+	if (prvdata->pair.rxtx_min_pages !=3D RXTX_4K &&
-+	    prvdata->pair.rxtx_min_pages !=3D RXTX_16K &&
-+	    prvdata->pair.rxtx_min_pages !=3D RXTX_64K) {
-+		snprintf(msg,
-+			 LOG_MSG_SZ,
-+			 "[%s]: Error: FFA_RXTX_MAP features =3D 0x%lx",
-+			 __func__,
-+			 prvdata->pair.rxtx_min_pages);
-+		dm_test_ffa_log(uts, msg);
-+		return CMD_RET_FAILURE;
-+	}
-+
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static int check_rxbuf_mapped_flag(u32 queried_func_id,
-+				   u8 rxbuf_mapped,
-+				   struct unit_test_state *uts)
-+{
-+	char msg[LOG_MSG_SZ] =3D {0};
-+
-+	switch (queried_func_id) {
-+	case FFA_RXTX_MAP:
-+	{
-+		if (rxbuf_mapped)
-+			return CMD_RET_SUCCESS;
-+		break;
-+	}
-+	case FFA_RXTX_UNMAP:
-+	{
-+		if (!rxbuf_mapped)
-+			return CMD_RET_SUCCESS;
-+		break;
-+	}
-+	default:
-+		return CMD_RET_FAILURE;
-+	}
-+
-+	snprintf(msg, LOG_MSG_SZ, "[%s]: Error: %s mapping issue", __func__,
-+		 (queried_func_id =3D=3D FFA_RXTX_MAP ? "FFA_RXTX_MAP" : "FFA_RXTX_UN=
MAP"));
-+	dm_test_ffa_log(uts, msg);
-+
-+	return CMD_RET_FAILURE;
-+}
-+
-+static int check_rxbuf_release_flag(u8 rxbuf_owned, struct unit_test_st=
ate *uts)
-+{
-+	if (rxbuf_owned) {
-+		char msg[LOG_MSG_SZ] =3D {0};
-+
-+		snprintf(msg, LOG_MSG_SZ, "[%s]: Error: RX buffer not released", __fu=
nc__);
-+		dm_test_ffa_log(uts, msg);
-+		return CMD_RET_FAILURE;
-+	}
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static int  test_ffa_msg_send_direct_req(u16 part_id, struct unit_test_=
state *uts)
-+{
-+	struct ffa_send_direct_data msg =3D {0};
-+	u8 cnt;
-+
-+	ut_assertok(ffa_bus_ops_get()->sync_send_receive(NULL, part_id, &msg, =
1));
-+
-+	for (cnt =3D 0; cnt < sizeof(struct ffa_send_direct_data) / sizeof(u64=
); cnt++)
-+		ut_assertok(((u64 *)&msg)[cnt] !=3D 0xffffffffffffffff);
-+
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static int test_partitions_and_comms(const char *service_uuid,
-+				     struct sandbox_ffa_prvdata *sdx_prvdata,
-+				     struct unit_test_state *uts)
-+{
-+	u32 count =3D 0;
-+	struct ffa_partition_info *parts_info;
-+	u32 info_idx, exp_info_idx;
-+	int ret;
-+
-+	/*
-+	 * get from the driver the count of the SPs matching the UUID
-+	 */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, service_uuid, &cou=
nt, NULL);
-+	/* make sure partitions are detected */
-+	ut_assertok(ret !=3D 0);
-+	ut_assertok(count !=3D SANDBOX_SP_COUNT_PER_VALID_SERVICE);
-+
-+	/*
-+	 * pre-allocate a buffer to be filled by the driver
-+	 * with	 ffa_partition_info structs
-+	 */
-+
-+	parts_info =3D calloc(count, sizeof(struct ffa_partition_info));
-+	ut_assertok(!parts_info);
-+
-+	/*
-+	 * ask the driver to fill the buffer with the SPs info
-+	 */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, service_uuid, &cou=
nt, parts_info);
-+	if (ret !=3D 0) {
-+		free(parts_info);
-+		ut_assertok(ret !=3D 0);
-+	}
-+
-+	/*
-+	 * SPs found , verify the partitions information
-+	 */
-+
-+	ret =3D CMD_RET_FAILURE;
-+
-+	for (info_idx =3D 0; info_idx < count ; info_idx++) {
-+		for (exp_info_idx =3D 0;
-+		     exp_info_idx < sdx_prvdata->partitions.count;
-+		     exp_info_idx++) {
-+			if (parts_info[info_idx].id =3D=3D
-+			   sdx_prvdata->partitions.descs[exp_info_idx].info.id) {
-+				ret =3D memcmp(&parts_info[info_idx],
-+					     &sdx_prvdata->partitions.descs[exp_info_idx]
-+					     .info,
-+					     sizeof(struct ffa_partition_info));
-+				if (ret)
-+					free(parts_info);
-+				ut_assertok(ret !=3D 0);
-+				/* send and receive data from the current partition */
-+				test_ffa_msg_send_direct_req(parts_info[info_idx].id, uts);
-+			}
-+			ret =3D CMD_RET_SUCCESS;
-+		}
-+	}
-+
-+	free(parts_info);
-+
-+	/* Verify  expected partitions found in the emulated secure world*/
-+	ut_assertok(ret !=3D CMD_RET_SUCCESS);
-+
-+	return CMD_RET_SUCCESS;
-+}
-+
-+static int dm_test_ffa_ack(struct unit_test_state *uts)
-+{
-+	struct ffa_prvdata *prvdata =3D NULL;
-+	struct sandbox_ffa_prvdata *sdx_prvdata =3D NULL;
-+	struct ffa_sandbox_data func_data =3D {0};
-+	u8 rxbuf_flag =3D 0;
-+	const char *svc1_uuid =3D SANDBOX_SERVICE1_UUID;
-+	const char *svc2_uuid =3D SANDBOX_SERVICE2_UUID;
-+	int ret;
-+
-+	/*  test probing FF-A devices */
-+	ut_assertok(ffa_bus_discover(NULL));
-+
-+	/* get a pointer to the FF-A core and sandbox drivers private data */
-+	func_data.data0 =3D &prvdata;
-+	func_data.data0_size =3D sizeof(prvdata);
-+	func_data.data1 =3D &sdx_prvdata;
-+	func_data.data1_size =3D sizeof(sdx_prvdata);
-+
-+	ut_assertok(sandbox_ffa_query_core_state(FFA_VERSION, &func_data));
-+
-+	/* make sure private data pointers are retrieved */
-+	ut_assertok(prvdata =3D=3D 0);
-+	ut_assertok(sdx_prvdata =3D=3D 0);
-+
-+	/* make sure dev devices created */
-+	ut_assertok(check_core_dev(prvdata, uts));
-+	ut_assertok(check_sandbox_dev(sdx_prvdata, uts));
-+
-+	/* test FFA_VERSION */
-+	ut_assertok(check_fwk_version(prvdata, sdx_prvdata, uts));
-+
-+	/* test FFA_ID_GET */
-+	ut_assertok(check_endpoint_id(prvdata, uts));
-+
-+	/* test FFA_FEATURES */
-+	ut_assertok(check_features(prvdata, uts));
-+
-+	/*  test core RX/TX buffers */
-+	ut_assertok(check_rxtxbuf(prvdata, uts));
-+
-+	/* test FFA_RXTX_MAP */
-+	func_data.data0 =3D &rxbuf_flag;
-+	func_data.data0_size =3D sizeof(rxbuf_flag);
-+
-+	rxbuf_flag =3D 0;
-+	ut_assertok(sandbox_ffa_query_core_state(FFA_RXTX_MAP, &func_data));
-+	ut_assertok(check_rxbuf_mapped_flag(FFA_RXTX_MAP, rxbuf_flag, uts));
-+
-+	/* FFA_PARTITION_INFO_GET / FFA_MSG_SEND_DIRECT_REQ */
-+	ret =3D test_partitions_and_comms(svc1_uuid, sdx_prvdata, uts);
-+	ut_assertok(ret !=3D CMD_RET_SUCCESS);
-+
-+	/* test FFA_RX_RELEASE */
-+	rxbuf_flag =3D 1;
-+	ut_assertok(sandbox_ffa_query_core_state(FFA_RX_RELEASE, &func_data));
-+	ut_assertok(check_rxbuf_release_flag(rxbuf_flag, uts));
-+
-+	/* FFA_PARTITION_INFO_GET / FFA_MSG_SEND_DIRECT_REQ */
-+	ret =3D test_partitions_and_comms(svc2_uuid, sdx_prvdata, uts);
-+	ut_assertok(ret !=3D CMD_RET_SUCCESS);
-+
-+	/* test FFA_RX_RELEASE */
-+	rxbuf_flag =3D 1;
-+	ut_assertok(sandbox_ffa_query_core_state(FFA_RX_RELEASE, &func_data));
-+	ut_assertok(check_rxbuf_release_flag(rxbuf_flag, uts));
-+
-+	/* test FFA_RXTX_UNMAP */
-+	ut_assertok(ffa_bus_ops_get()->rxtx_unmap(NULL));
-+
-+	rxbuf_flag =3D 1;
-+	ut_assertok(sandbox_ffa_query_core_state(FFA_RXTX_UNMAP, &func_data));
-+	ut_assertok(check_rxbuf_mapped_flag(FFA_RXTX_UNMAP, rxbuf_flag, uts));
-+
-+	return CMD_RET_SUCCESS;
-+}
-+
-+DM_TEST(dm_test_ffa_ack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
-+
-+static int dm_test_ffa_nack(struct unit_test_state *uts)
-+{
-+	struct ffa_prvdata *prvdata =3D NULL;
-+	struct sandbox_ffa_prvdata *sdx_prvdata =3D NULL;
-+	struct ffa_sandbox_data func_data =3D {0};
-+	const char *valid_svc_uuid =3D SANDBOX_SERVICE1_UUID;
-+	const char *unvalid_svc_uuid =3D SANDBOX_SERVICE3_UUID;
-+	const char *unvalid_svc_uuid_str =3D SANDBOX_SERVICE4_UUID;
-+	struct ffa_send_direct_data msg =3D {0};
-+	int ret;
-+	u32 count =3D 0;
-+	u16 part_id =3D 0;
-+
-+	/*  test probing FF-A devices */
-+	ut_assertok(ffa_bus_discover(NULL));
-+
-+	/* get a pointer to the FF-A core and sandbox drivers private data */
-+	func_data.data0 =3D &prvdata;
-+	func_data.data0_size =3D sizeof(prvdata);
-+	func_data.data1 =3D &sdx_prvdata;
-+	func_data.data1_size =3D sizeof(sdx_prvdata);
-+
-+	ut_assertok(sandbox_ffa_query_core_state(FFA_VERSION, &func_data));
-+
-+	/* make sure private data pointers are retrieved */
-+	ut_assertok(prvdata =3D=3D 0);
-+	ut_assertok(sdx_prvdata =3D=3D 0);
-+
-+	/* make sure dev devices created */
-+	ut_assertok(check_core_dev(prvdata, uts));
-+	ut_assertok(check_sandbox_dev(sdx_prvdata, uts));
-+
-+	/* query partitions count using  invalid arguments  */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, unvalid_svc_uuid, =
NULL, NULL);
-+	ut_assertok(ret !=3D -EINVAL);
-+
-+	/* query partitions count using an invalid UUID  string */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, unvalid_svc_uuid_s=
tr, &count, NULL);
-+	ut_assertok(ret !=3D -EINVAL);
-+
-+	/* query partitions count using an invalid UUID (no matching SP) */
-+	count =3D 0;
-+	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, unvalid_svc_uuid, =
&count, NULL);
-+	ut_assertok(count !=3D 0);
-+
-+	/* query partitions count using a valid UUID  */
-+	count =3D 0;
-+	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, valid_svc_uuid, &c=
ount, NULL);
-+	/* make sure partitions are detected */
-+	ut_assertok(ret !=3D 0);
-+	ut_assertok(count !=3D SANDBOX_SP_COUNT_PER_VALID_SERVICE);
-+
-+	/* send data to an invalid partition */
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(NULL, part_id, &msg, 1);
-+	ut_assertok(ret !=3D -EINVAL);
-+
-+	/* send data to a valid partition */
-+	part_id =3D prvdata->partitions.descs[0].info.id;
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(NULL, part_id, &msg, 1);
-+	ut_assertok(ret !=3D 0);
-+
-+	return CMD_RET_SUCCESS;
-+}
-+
-+DM_TEST(dm_test_ffa_nack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm=
_ffa-introduce-armffa-command-Sandbox-test.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0008-FF-A-v15-arm_ffa-introduce-armffa-comm=
and-Sandbox-te.patch
similarity index 58%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_=
ffa-introduce-armffa-command-Sandbox-test.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-FF-A-v=
15-arm_ffa-introduce-armffa-command-Sandbox-te.patch
index d5842827..05b5e4d1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-in=
troduce-armffa-command-Sandbox-test.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-FF-A-v15-a=
rm_ffa-introduce-armffa-command-Sandbox-te.patch
@@ -1,105 +1,92 @@
-From 5af272d2bb2a7a8c8a4732c8d598dd1713856949 Mon Sep 17 00:00:00 2001
+From 78547a9f322b981a93bbeeb48b3eda1d2ab35cd0 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Tue, 29 Nov 2022 14:48:34 +0000
-Subject: [PATCH 08/42] arm_ffa: introduce armffa command Sandbox test
+Date: Fri, 23 Jun 2023 13:44:10 +0100
+Subject: [PATCH 08/33] FF-A v15: arm_ffa: introduce armffa command Sandb=
ox
+ test
=20
 Add Sandbox test for the armffa command
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
 Cc: Tom Rini <trini@konsulko.com>
-Cc: Simon Glass <sjg@chromium.org>
 Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
 Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v4: drop use of helper APIs
-
-v1: introduce armffa command sandbox test
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
 ---
  MAINTAINERS       |  1 +
  test/cmd/Makefile |  2 ++
- test/cmd/armffa.c | 39 +++++++++++++++++++++++++++++++++++++++
- 3 files changed, 42 insertions(+)
+ test/cmd/armffa.c | 33 +++++++++++++++++++++++++++++++++
+ 3 files changed, 36 insertions(+)
  create mode 100644 test/cmd/armffa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index c1d3d4ae1c..a2f60a3b93 100644
+index ccd7859c88..885d91fe5c 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -272,6 +272,7 @@ F:	doc/arch/arm64.ffa.rst
+@@ -276,6 +276,7 @@ F:	doc/arch/arm64.ffa.rst
+ F:	doc/usage/cmd/armffa.rst
  F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
- F:	include/sandbox_arm_ffa.h
 +F:	test/cmd/armffa.c
  F:	test/dm/ffa.c
 =20
  ARM FREESCALE IMX
 diff --git a/test/cmd/Makefile b/test/cmd/Makefile
-index bc961df3dc..21aa6d740e 100644
+index 055adc65a2..1d1dbb4fbc 100644
 --- a/test/cmd/Makefile
 +++ b/test/cmd/Makefile
 @@ -1,6 +1,7 @@
  # SPDX-License-Identifier: GPL-2.0+
  #
  # Copyright (c) 2013 Google, Inc
-+# (C) Copyright 2022 ARM Limited
++# Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
 =20
  ifdef CONFIG_HUSH_PARSER
  obj-$(CONFIG_CONSOLE_RECORD) +=3D test_echo.o
-@@ -18,6 +19,7 @@ obj-$(CONFIG_CMD_PINMUX) +=3D pinmux.o
- obj-$(CONFIG_CMD_PWM) +=3D pwm.o
+@@ -23,6 +24,7 @@ obj-$(CONFIG_CMD_SEAMA) +=3D seama.o
  ifdef CONFIG_SANDBOX
+ obj-$(CONFIG_CMD_READ) +=3D rw.o
  obj-$(CONFIG_CMD_SETEXPR) +=3D setexpr.o
-+obj-$(CONFIG_SANDBOX_FFA) +=3D armffa.o
++obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D armffa.o
  endif
  obj-$(CONFIG_CMD_TEMPERATURE) +=3D temperature.o
  obj-$(CONFIG_CMD_WGET) +=3D wget.o
 diff --git a/test/cmd/armffa.c b/test/cmd/armffa.c
 new file mode 100644
-index 0000000000..e04363ba63
+index 0000000000..9a44a397e8
 --- /dev/null
 +++ b/test/cmd/armffa.c
-@@ -0,0 +1,39 @@
+@@ -0,0 +1,33 @@
 +// SPDX-License-Identifier: GPL-2.0+
 +/*
 + * Test for armffa command
 + *
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 + */
 +
 +#include <common.h>
-+#include <dm/test.h>
-+#include <sandbox_arm_ffa.h>
 +#include <string.h>
++#include <asm/sandbox_arm_ffa.h>
++#include <dm/test.h>
 +#include <test/test.h>
 +#include <test/ut.h>
 +
-+#define PING_CMD_SIZE 19
-+
 +/* Basic test of 'armffa' command */
 +static int dm_test_armffa_cmd(struct unit_test_state *uts)
 +{
-+	char ping_cmd[PING_CMD_SIZE] =3D {0};
-+
-+	ut_assertok(ffa_bus_discover(NULL));
-+
 +	/* armffa getpart <UUID> */
 +	ut_assertok(run_command("armffa getpart " SANDBOX_SERVICE1_UUID, 0));
 +
-+	snprintf(ping_cmd, PING_CMD_SIZE, "armffa ping 0x%x", SANDBOX_SP1_ID);
-+
 +	/* armffa ping <ID> */
-+	ut_assertok(run_command(ping_cmd, 0));
++	ut_assertok(run_commandf("armffa ping 0x%x", SANDBOX_SP1_ID));
 +
 +	/* armffa devlist */
 +	ut_assertok(run_command("armffa devlist", 0));
 +
-+	return CMD_RET_SUCCESS;
++	return 0;
 +}
 +
 +DM_TEST(dm_test_armffa_cmd, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm=
_ffa-efi-introduce-FF-A-MM-communication.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0009-FF-A-v15-arm_ffa-efi-introduce-FF-A-MM-c=
ommunication.patch
similarity index 57%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_=
ffa-efi-introduce-FF-A-MM-communication.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-FF-A-v=
15-arm_ffa-efi-introduce-FF-A-MM-communication.patch
index 574b7df9..bd75bc1d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-ef=
i-introduce-FF-A-MM-communication.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-FF-A-v15-a=
rm_ffa-efi-introduce-FF-A-MM-communication.patch
@@ -1,7 +1,7 @@
-From ca1ae0e78ee3476090919459ec5d08187d5eefbc Mon Sep 17 00:00:00 2001
+From 342844c2a5ad6beb127e1e8e52b311df77cff472 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 15 Aug 2022 15:12:49 +0100
-Subject: [PATCH 09/42] arm_ffa: efi: introduce FF-A MM communication
+Subject: [PATCH 09/33] FF-A v15: arm_ffa: efi: introduce FF-A MM communi=
cation
=20
 Add MM communication support using FF-A transport
=20
@@ -27,80 +27,33 @@ consumed by the EFI subsystem.
 MM communication protocol supports FF-A 64-bit direct messaging.
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Tested-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
 Cc: Tom Rini <trini@konsulko.com>
-Cc: Simon Glass <sjg@chromium.org>
 Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
 Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v8:
-
-* isolate the compilation choices between FF-A and OP-TEE
-* update partition_info_get() second argument to be an SP count
-* pass NULL device pointer to the FF-A bus discovery and operations
-
-v7:
-
-* set the MM door bell event to use 64-bit direct messaging
-* issue a compile time error when one of these macros are not found :
-  FFA_SHARED_MM_BUFFER_SIZE, FFA_SHARED_MM_BUFFER_OFFSET, FFA_SHARED_MM_=
BUFFER_ADDR
-* make mm_sp_svc_uuid static
-* replace EINVAL with ENOMEM in ffa_discover_mm_sp_id() when calloc() fa=
ils
-* improve use of unmap_sysmem() in ffa_mm_communicate()
-
-v6:
-
-* add FF-A runtime discovery at MM communication level
-* drop EFI runtime support for FF-A MM communication
-* revert the changes in include/mm_communication.h for
-  efi_mm_communicate_header and smm_variable_access structures
-
-v4:
-
-* use the new FF-A driver interfaces
-* discover MM partitions at runtime
-* copy FF-A driver private data to EFI runtime section at
-  ExitBootServices()
-* drop use of FFA_ERR_STAT_SUCCESS error code
-* replace EFI_BUFFER_TOO_SMALL with EFI_OUT_OF_RESOURCES
-  in ffa_mm_communicate(). No need for efi_memcpy_runtime() anymore
-* revert the error log in mm_communicate() in case of failure
-* remove packed attribute from efi_mm_communicate_header and
-  smm_variable_communicate_header
-
-v2:
-
-* set default values to 0 for FFA_SHARED_MM_BUFFER_SIZE, FFA_SHARED_MM_B=
UFFER_ADDR and MM_SP_UUID_DATA and add warnings
-
-v1:
-
-* introduce FF-A MM communication
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
 ---
- include/mm_communication.h        |   5 +
- lib/efi_loader/Kconfig            |  14 +-
- lib/efi_loader/efi_variable_tee.c | 294 +++++++++++++++++++++++++++++-
- 3 files changed, 307 insertions(+), 6 deletions(-)
+ include/mm_communication.h        |  13 ++
+ lib/efi_loader/Kconfig            |  46 +++++-
+ lib/efi_loader/efi_variable_tee.c | 257 +++++++++++++++++++++++++++++-
+ 3 files changed, 309 insertions(+), 7 deletions(-)
=20
 diff --git a/include/mm_communication.h b/include/mm_communication.h
-index e65fbde60d..d409bed777 100644
+index e65fbde60d..f17847583b 100644
 --- a/include/mm_communication.h
 +++ b/include/mm_communication.h
-@@ -6,6 +6,8 @@
+@@ -6,6 +6,9 @@
   *  Copyright (c) 2017, Intel Corporation. All rights reserved.
   *  Copyright (C) 2020 Linaro Ltd. <sughosh.ganu@linaro.org>
   *  Copyright (C) 2020 Linaro Ltd. <ilias.apalodimas@linaro.org>
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ *  Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-=
office@arm.com>
++ *    Authors:
++ *      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
   */
 =20
  #ifndef _MM_COMMUNICATION_H_
-@@ -13,6 +15,9 @@
+@@ -13,6 +16,9 @@
 =20
  #include <part_efi.h>
 =20
@@ -110,18 +63,32 @@ index e65fbde60d..d409bed777 100644
  /*
   * Interface to the pseudo Trusted Application (TA), which provides a
   * communication channel with the Standalone MM (Management Mode)
+@@ -248,4 +254,11 @@ struct smm_variable_var_check_property {
+ 	u16                       name[];
+ };
+=20
++/* supported MM transports */
++enum mm_comms_select {
++	MM_COMMS_UNDEFINED,
++	MM_COMMS_FFA,
++	MM_COMMS_OPTEE
++};
++
+ #endif /* _MM_COMMUNICATION_H_ */
 diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
-index b498c72206..ca73908481 100644
+index c5835e6ef6..553e6a30a2 100644
 --- a/lib/efi_loader/Kconfig
 +++ b/lib/efi_loader/Kconfig
-@@ -55,13 +55,23 @@ config EFI_VARIABLE_FILE_STORE
+@@ -55,13 +55,55 @@ config EFI_VARIABLE_FILE_STORE
  	  stored as file /ubootefi.var on the EFI system partition.
 =20
  config EFI_MM_COMM_TEE
 -	bool "UEFI variables storage service via OP-TEE"
 -	depends on OPTEE
 +	bool "UEFI variables storage service via the trusted world"
-+	depends on OPTEE || ARM_FFA_TRANSPORT
++	select ARM_FFA_TRANSPORT
++	select TEE
++	select OPTEE
  	help
 +	  Allowing access to the MM SP services (SPs such as  StandAlonneMM, s=
mm-gateway).
 +	  When using the u-boot OP-TEE driver, StandAlonneMM is supported.
@@ -136,85 +103,88 @@ index b498c72206..ca73908481 100644
 +	  A door bell mechanism is used to notify the SP when there is data in=
 the shared
 +	  MM buffer. The data is copied by u-boot to the shared buffer before =
issuing
 +	  the door bell event.
++
++config FFA_SHARED_MM_BUF_SIZE
++	int "Memory size of the shared MM communication buffer"
++	default 0
++	depends on EFI_MM_COMM_TEE
++	help
++	  This defines the size in bytes of the memory area reserved for the s=
hared
++	  buffer used for communication between the MM feature in U-Boot and
++	  the MM SP in secure world.
++	  The size of the memory region must be a multiple of the size of the =
maximum
++	  translation granule size that is specified in the ID_AA64MMFR0_EL1 S=
ystem register.
++	  It is assumed that the MM SP knows the size of the shared MM communi=
cation buffer.
++
++config FFA_SHARED_MM_BUF_OFFSET
++	int "Data offset in the shared MM communication buffer"
++	default 0
++	depends on EFI_MM_COMM_TEE
++	help
++	  This defines the offset in bytes of the data read or written to in t=
he shared
++	  buffer by the MM SP.
++
++config FFA_SHARED_MM_BUF_ADDR
++	hex "Define the address of the shared MM communication buffer"
++	default 0x0
++	depends on EFI_MM_COMM_TEE
++	help
++	  This defines the address of the shared MM communication buffer
++	  used for communication between the MM feature in U-Boot and
++	  the MM SP in secure world.
++	  It is assumed that the MM SP knows the address of the shared MM comm=
unication buffer.
 +
  config EFI_VARIABLE_NO_STORE
  	bool "Don't persist non-volatile UEFI variables"
  	help
 diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_vari=
able_tee.c
-index dfef18435d..3933a24e8c 100644
+index dfef18435d..5137b871ea 100644
 --- a/lib/efi_loader/efi_variable_tee.c
 +++ b/lib/efi_loader/efi_variable_tee.c
-@@ -4,9 +4,12 @@
+@@ -4,17 +4,34 @@
   *
   *  Copyright (C) 2019 Linaro Ltd. <sughosh.ganu@linaro.org>
   *  Copyright (C) 2019 Linaro Ltd. <ilias.apalodimas@linaro.org>
-+ *  Copyright (C) 2022 ARM Limited
-+ *  Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ *  Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-=
office@arm.com>
++ *
++ *  Authors:
++ *    Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
   */
 =20
  #include <common.h>
++#include <arm_ffa.h>
++#include <cpu_func.h>
 +#include <dm.h>
  #include <efi.h>
  #include <efi_api.h>
  #include <efi_loader.h>
-@@ -15,6 +18,36 @@
+ #include <efi_variable.h>
+-#include <tee.h>
  #include <malloc.h>
- #include <mm_communication.h>
-=20
-+#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+
-+#include <arm_ffa.h>
-+#include <cpu_func.h>
 +#include <mapmem.h>
-+
-+#ifndef FFA_SHARED_MM_BUFFER_SIZE
-+#error "FFA_SHARED_MM_BUFFER_SIZE must be defined in include/configs/<b=
oard>.h"
-+#define FFA_SHARED_MM_BUFFER_SIZE 0
-+#endif
-+
-+#ifndef FFA_SHARED_MM_BUFFER_OFFSET
-+#error "FFA_SHARED_MM_BUFFER_OFFSET must be defined in include/configs/=
<board>.h"
-+#define FFA_SHARED_MM_BUFFER_OFFSET 0
-+#endif
-+
-+#ifndef FFA_SHARED_MM_BUFFER_ADDR
-+#error "FFA_SHARED_MM_BUFFER_ADDR must be defined in include/configs/<b=
oard>.h"
-+#define FFA_SHARED_MM_BUFFER_ADDR 0
-+#endif
+ #include <mm_communication.h>
++#include <tee.h>
 +
 +/* MM return codes */
 +#define MM_SUCCESS (0)
-+
++#define MM_NOT_SUPPORTED (-1)
++#define MM_INVALID_PARAMETER (-2)
++#define MM_DENIED (-3)
++#define MM_NO_MEMORY (-5)
+=20
 +static const char *mm_sp_svc_uuid =3D MM_SP_UUID;
-+
 +static u16 mm_sp_id;
-+
-+#endif
-+
  extern struct efi_var_file __efi_runtime_data *efi_var_buf;
  static efi_uintn_t max_buffer_size;	/* comm + var + func + data */
  static efi_uintn_t max_payload_size;	/* func + data */
-@@ -24,6 +57,7 @@ struct mm_connection {
- 	u32 session;
- };
-=20
-+#if (IS_ENABLED(CONFIG_OPTEE))
- /**
-  * get_connection() - Retrieve OP-TEE session for a specific UUID.
-  *
-@@ -143,13 +177,248 @@ static efi_status_t optee_mm_communicate(void *co=
mm_buf, ulong dsize)
-=20
- 	return ret;
+@@ -145,16 +162,241 @@ static efi_status_t optee_mm_communicate(void *co=
mm_buf, ulong dsize)
  }
-+#endif
-+
-+#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
 =20
  /**
 - * mm_communicate() - Adjust the cmonnucation buffer to StandAlonneMM a=
nd send
 + * ffa_notify_mm_sp() - Announce there is data in the shared buffer
 + *
-+ * Notifies the MM partition in the trusted world that
++ * Notify the MM partition in the trusted world that
 + * data is available in the shared buffer.
 + * This is a blocking call during which trusted world has exclusive acc=
ess
 + * to the MM shared buffer.
@@ -227,27 +197,44 @@ index dfef18435d..3933a24e8c 100644
 +{
 +	struct ffa_send_direct_data msg =3D {0};
 +	int ret;
-+	int sp_event_ret =3D -1;
++	int sp_event_ret;
++	struct udevice *dev;
 +
-+	if (!ffa_bus_ops_get())
-+		return -EINVAL;
++	ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
++	if (ret) {
++		log_err("EFI: Cannot find FF-A bus device, notify MM SP failure\n");
++		return ret;
++	}
 +
-+	msg.data0 =3D FFA_SHARED_MM_BUFFER_OFFSET; /* x3 */
++	msg.data0 =3D CONFIG_FFA_SHARED_MM_BUF_OFFSET; /* x3 */
 +
-+	ret =3D ffa_bus_ops_get()->sync_send_receive(NULL, mm_sp_id, &msg, 1);
-+	if (ret !=3D 0)
++	ret =3D ffa_sync_send_receive(dev, mm_sp_id, &msg, 1);
++	if (ret)
 +		return ret;
 +
 +	sp_event_ret =3D msg.data0; /* x3 */
 +
-+	if (sp_event_ret =3D=3D MM_SUCCESS)
-+		return 0;
-+
-+	/*
-+	 * Failure to notify the MM SP
-+	 */
++	switch (sp_event_ret) {
++	case MM_SUCCESS:
++		ret =3D 0;
++		break;
++	case MM_NOT_SUPPORTED:
++		ret =3D -EINVAL;
++		break;
++	case MM_INVALID_PARAMETER:
++		ret =3D -EPERM;
++		break;
++	case MM_DENIED:
++		ret =3D -EACCES;
++		break;
++	case MM_NO_MEMORY:
++		ret =3D -EBUSY;
++		break;
++	default:
++		ret =3D -EACCES;
++	}
 +
-+	return -EACCES;
++	return ret;
 +}
 +
 +/**
@@ -265,57 +252,28 @@ index dfef18435d..3933a24e8c 100644
 +{
 +	u32 count =3D 0;
 +	int ret;
-+	struct ffa_partition_info *parts_info;
-+
-+	if (!ffa_bus_ops_get())
-+		return -EINVAL;
++	struct ffa_partition_desc *descs;
++	struct udevice *dev;
 +
-+	/*
-+	 * get from the driver the count of the SPs matching the UUID
-+	 */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, mm_sp_svc_uuid, &c=
ount, NULL);
-+	if (ret !=3D 0) {
-+		log_err("EFI: Failure in querying partitions count (error code: %d)\n=
", ret);
-+		return ret;
-+	}
-+
-+	if (!count) {
-+		log_info("EFI: No MM partition found\n");
++	ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
++	if (ret) {
++		log_err("EFI: Cannot find FF-A bus device, MM SP discovery failure\n"=
);
 +		return ret;
 +	}
 +
-+	/*
-+	 * pre-allocate a buffer to be filled by the driver
-+	 * with	 ffa_partition_info structs
-+	 */
-+
-+	log_info("EFI: Pre-allocating %d partition(s) info structures\n", coun=
t);
-+
-+	parts_info =3D calloc(count, sizeof(*parts_info));
-+	if (!parts_info)
-+		return -ENOMEM;
-+
-+	/*
-+	 * ask the driver to fill the
-+	 * buffer with the SPs info
-+	 */
-+	ret =3D ffa_bus_ops_get()->partition_info_get(NULL, mm_sp_svc_uuid, &c=
ount, parts_info);
++	/* Ask the driver to fill the buffer with the SPs info */
++	ret =3D ffa_partition_info_get(dev, mm_sp_svc_uuid, &count, &descs);
 +	if (ret) {
-+		log_err("EFI: Failure in querying partition(s) info (error code: %d)\=
n", ret);
-+		free(parts_info);
++		log_err("EFI: Failure in querying SPs info (%d), MM SP discovery fail=
ure\n", ret);
 +		return ret;
 +	}
 +
-+	/*
-+	 * MM SPs found , use the first one
-+	 */
++	/* MM SPs found , use the first one */
 +
-+	mm_sp_id =3D parts_info[0].id;
++	mm_sp_id =3D descs[0].info.id;
 +
 +	log_info("EFI: MM partition ID 0x%x\n", mm_sp_id);
 +
-+	free(parts_info);
-+
 +	return 0;
 +}
 +
@@ -324,7 +282,7 @@ index dfef18435d..3933a24e8c 100644
 + * @comm_buf:		locally allocated communication buffer used for rx/tx
 + * @dsize:				communication buffer size
 + *
-+ * Issues a door bell event to notify the MM partition (SP) running in =
OP-TEE
++ * Issue a door bell event to notify the MM partition (SP) running in O=
P-TEE
 + * that there is data to read from the shared buffer.
 + * Communication with the MM SP is performed using FF-A transport.
 + * On the event, MM SP can read the data from the buffer and
@@ -347,20 +305,20 @@ index dfef18435d..3933a24e8c 100644
 +		return EFI_INVALID_PARAMETER;
 +
 +	/* Discover MM partition ID at boot time */
-+	if (!mm_sp_id && ffa_discover_mm_sp_id()  !=3D 0) {
-+		log_err("EFI: Failure to discover MM partition ID at boot time\n");
++	if (!mm_sp_id && ffa_discover_mm_sp_id()) {
++		log_err("EFI: Failure to discover MM SP ID at boot time, FF-A MM comm=
s failure\n");
 +		return EFI_UNSUPPORTED;
 +	}
 +
 +	mm_hdr =3D (struct efi_mm_communicate_header *)comm_buf;
 +	tx_data_size =3D mm_hdr->message_len + sizeof(efi_guid_t) + sizeof(siz=
e_t);
 +
-+	if (comm_buf_size !=3D tx_data_size || tx_data_size > FFA_SHARED_MM_BU=
FFER_SIZE)
++	if (comm_buf_size !=3D tx_data_size || tx_data_size > CONFIG_FFA_SHARE=
D_MM_BUF_SIZE)
 +		return EFI_INVALID_PARAMETER;
 +
 +	/* Copy the data to the shared buffer */
 +
-+	virt_shared_buf =3D (void *)map_sysmem((phys_addr_t)FFA_SHARED_MM_BUFF=
ER_ADDR, 0);
++	virt_shared_buf =3D map_sysmem((phys_addr_t)CONFIG_FFA_SHARED_MM_BUF_A=
DDR, 0);
 +	memcpy(virt_shared_buf, comm_buf, tx_data_size);
 +
 +	/*
@@ -369,17 +327,16 @@ index dfef18435d..3933a24e8c 100644
 +	 * In this case, the secure world reads the data from DRAM.
 +	 * Let's flush the cache so the DRAM is updated with the latest data.
 +	 */
-+	#ifdef CONFIG_ARM64
++#ifdef CONFIG_ARM64
 +	invalidate_dcache_all();
-+	#endif
++#endif
 +
 +	/* Announce there is data in the shared buffer */
 +
 +	ffa_ret =3D ffa_notify_mm_sp();
 +
 +	switch (ffa_ret) {
-+	case 0:
-+	{
++	case 0: {
 +		ulong rx_data_size;
 +		/* Copy the MM SP response from the shared buffer to the communicatio=
n buffer */
 +		rx_data_size =3D ((struct efi_mm_communicate_header *)virt_shared_buf=
)->message_len +
@@ -414,27 +371,32 @@ index dfef18435d..3933a24e8c 100644
 +	unmap_sysmem(virt_shared_buf);
 +	return efi_ret;
 +}
-+#endif
 +
 +/**
-+ * select_ffa_mm_comms() - checks FF-A support availability
++ * get_mm_comms() - detect the available MM transport
 + *
-+ * Making sure FF-A is compiled in. If that's the case try to discover
-+ * the FF-A bus.
++ * Make sure the FF-A bus is probed successfully
++ * which means FF-A communication with secure world works and ready
++ * for use.
++ *
++ * If FF-A bus is not ready, use OPTEE comms.
 + *
 + * Return:
 + *
-+ * 0: FF-A ready for use. Otherwise, failure
++ * MM_COMMS_FFA or MM_COMMS_OPTEE
 + */
-+static efi_status_t select_ffa_mm_comms(void)
++static enum mm_comms_select get_mm_comms(void)
 +{
-+	efi_status_t ret =3D EFI_UNSUPPORTED;
-+#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+	ret =3D ffa_bus_discover(NULL);
-+	if (ret)
-+		ret =3D EFI_NOT_READY;
-+#endif
-+	return ret;
++	struct udevice *dev;
++	int ret;
++
++	ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
++	if (ret) {
++		log_err("EFI: Cannot find FF-A bus device, trying Optee comms\n");
++		return MM_COMMS_OPTEE;
++	}
++
++	return MM_COMMS_FFA;
 +}
 +
 +/**
@@ -453,40 +415,27 @@ index dfef18435d..3933a24e8c 100644
   * Return:		status code
   */
  static efi_status_t mm_communicate(u8 *comm_buf, efi_uintn_t dsize)
-@@ -162,7 +431,17 @@ static efi_status_t mm_communicate(u8 *comm_buf, ef=
i_uintn_t dsize)
+ {
+ 	efi_status_t ret;
++	enum mm_comms_select mm_comms;
+ 	struct efi_mm_communicate_header *mm_hdr;
+ 	struct smm_variable_communicate_header *var_hdr;
+=20
+@@ -162,7 +404,12 @@ static efi_status_t mm_communicate(u8 *comm_buf, ef=
i_uintn_t dsize)
  	mm_hdr =3D (struct efi_mm_communicate_header *)comm_buf;
  	var_hdr =3D (struct smm_variable_communicate_header *)mm_hdr->data;
 =20
 -	ret =3D optee_mm_communicate(comm_buf, dsize);
-+	ret =3D select_ffa_mm_comms();
-+	if (ret !=3D EFI_SUCCESS) {
-+#if (IS_ENABLED(CONFIG_OPTEE))
-+		ret =3D optee_mm_communicate(comm_buf, dsize);
-+#endif
-+	} else {
-+#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
++	mm_comms =3D get_mm_comms();
++	if (mm_comms =3D=3D MM_COMMS_FFA)
 +		ret =3D ffa_mm_communicate(comm_buf, dsize);
-+#endif
-+	}
++	else
++		ret =3D optee_mm_communicate(comm_buf, dsize);
 +
  	if (ret !=3D EFI_SUCCESS) {
  		log_err("%s failed!\n", __func__);
  		return ret;
-@@ -258,6 +537,13 @@ efi_status_t EFIAPI get_max_payload(efi_uintn_t *si=
ze)
- 		goto out;
- 	}
- 	*size =3D var_payload->size;
-+
-+	#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
-+		if (*size > FFA_SHARED_MM_BUFFER_SIZE)
-+			*size =3D FFA_SHARED_MM_BUFFER_SIZE - MM_COMMUNICATE_HEADER_SIZE	-
-+				MM_VARIABLE_COMMUNICATE_SIZE;
-+	#endif
-+
- 	/*
- 	 * There seems to be a bug in EDK2 miscalculating the boundaries and
- 	 * size checks, so deduct 2 more bytes to fulfill this requirement. Fi=
x
-@@ -697,7 +983,7 @@ void efi_variables_boot_exit_notify(void)
+@@ -697,7 +944,7 @@ void efi_variables_boot_exit_notify(void)
  		ret =3D EFI_NOT_FOUND;
 =20
  	if (ret !=3D EFI_SUCCESS)
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-FF-=
A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0010-FF-A-v15-arm_ffa-efi-corstone10=
00-enable-MM-communic.patch
new file mode 100644
index 00000000..4dcec1dc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-FF-A-v15-a=
rm_ffa-efi-corstone1000-enable-MM-communic.patch
@@ -0,0 +1,33 @@
+From 79e941be83a7394d03b09c618c8e2924ef962d64 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 17 Jul 2023 15:23:33 +0100
+Subject: [PATCH 10/33] FF-A v15: arm_ffa: efi: corstone1000: enable MM
+ communication
+
+turn on EFI MM communication
+
+On corstone1000 platform MM communication between u-boot
+and the secure world (Optee) is done using the FF-A bus.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
230713132847.176000-1-abdellatif.elkhlifi@arm.com/]
+---
+ configs/corstone1000_defconfig | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 2d391048cd..ee5481b63c 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -53,3 +53,8 @@ CONFIG_DM_SERIAL=3Dy
+ CONFIG_USB=3Dy
+ CONFIG_USB_ISP1760=3Dy
+ CONFIG_ERRNO_STR=3Dy
++CONFIG_NVMXIP_QSPI=3Dy
++CONFIG_EFI_MM_COMM_TEE=3Dy
++CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
++CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
++CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm=
_ffa-efi-corstone1000-enable-MM-communication.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-efi-corstone1000-enable-MM-=
communication.patch
deleted file mode 100644
index 4fe1405c..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-ef=
i-corstone1000-enable-MM-communication.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From a595dfd91d3e226eaa39e324673871c73ae0aa29 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Fri, 23 Sep 2022 15:17:21 +0100
-Subject: [PATCH 10/42] arm_ffa: efi: corstone1000: enable MM communicati=
on
-
-turn on EFI MM communication
-
-On corstone1000 platform MM communication between u-boot
-and the secure world (Optee) is done using the FF-A bus.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Cc: Tom Rini <trini@konsulko.com>
-Cc: Simon Glass <sjg@chromium.org>
-Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Cc: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream-Status: Submitted [cover letter: https://lore.kernel.org/all/20=
221122131751.22747-1-abdellatif.elkhlifi@arm.com/]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v8:
-
-* drop OP-TEE configs from Corstone-1000 defconfig
-
-v7:
-
-* improve the definition of FFA_SHARED_MM_BUFFER_ADDR and
-  FFA_SHARED_MM_BUFFER_OFFSET
-* update FFA_SHARED_MM_BUFFER_ADDR value
-
-v6:
-
-* corstone-1000: enable optee driver
-* corstone-1000: remove CONFIG_ARM_FFA_EFI_RUNTIME_MODE from the defconf=
ig
-
-v4:
-
-* corstone-1000: turn on EFI MM communication
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- configs/corstone1000_defconfig |  2 ++
- include/configs/corstone1000.h | 10 ++++++++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index dddfa27507..d1dc06c86c 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -52,3 +52,5 @@ CONFIG_DM_SERIAL=3Dy
- CONFIG_USB=3Dy
- CONFIG_USB_ISP1760=3Dy
- CONFIG_ERRNO_STR=3Dy
-+CONFIG_EFI_MM_COMM_TEE=3Dy
-+CONFIG_ARM_FFA_TRANSPORT=3Dy
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 8e0230c135..b6226fa12a 100644
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
-+#define FFA_SHARED_MM_BUFFER_ADDR	0x02000000UL
-+#define FFA_SHARED_MM_BUFFER_OFFSET	0
-+
- #define V2M_BASE		0x80000000
-=20
- #define CONFIG_PL011_CLOCK	50000000
-@@ -22,6 +31,7 @@
- #define PHYS_SDRAM_1		(V2M_BASE)
- #define PHYS_SDRAM_1_SIZE	0x80000000
-=20
-+#define CFG_SYS_SDRAM_BASE	PHYS_SDRAM_1
- #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
-=20
- #define BOOT_TARGET_DEVICES(func) \
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi=
-corstone1000-introduce-EFI-capsule-update.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-fwu-introduce-EFI-cap=
sule-update.patch
similarity index 66%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-=
corstone1000-introduce-EFI-capsule-update.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-co=
rstone1000-fwu-introduce-EFI-capsule-update.patch
index c526626d..d2c440c8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-introduce-EFI-capsule-update.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-fwu-introduce-EFI-capsule-update.patch
@@ -1,7 +1,7 @@
-From b9c44c396f9ad9588184272cdc5ed98e19e82c0a Mon Sep 17 00:00:00 2001
+From 90b2741149a538c93aed61522c0d3363351bd578 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Tue, 29 Nov 2022 15:11:27 +0000
-Subject: [PATCH 11/42] efi: corstone1000: introduce EFI capsule update
+Date: Mon, 17 Jul 2023 15:56:18 +0100
+Subject: [PATCH 11/33] efi: corstone1000: fwu: introduce EFI capsule upd=
ate
=20
 This commit provides capsule update feature for Corstone1000.
=20
@@ -12,30 +12,35 @@ is physically contiguous and allocated at the start o=
f the DDR
 memory after u-boot relocation to the end of DDR.
=20
 The capsule buffer is shared between u-boot and the secure world.
-On UpdateCapsule() , capsule data is copied to the buffer
-and a buffer ready event is generated using FF-A transport.
=20
-On ExitBootServices() a kernel started event is sent to the
-SE Proxy FW update service. This event is generated on each boot.
+On UpdateCapsule() , capsule data is copied to the buffer and a buffer r=
eady event is generated using FF-A transport.
+
+On efi_init_capsule() in U-Boot, an EFI started event is sent to SE Prox=
y FW update service. This event is generated on each boot.
+
+Note: The SE proxy SP requires that the interface/event IDs are passed u=
sing register w4 for the buffer ready event and the EFI started event.
+
+    interface ID (31:16)
+    event ID (15:0)
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  board/armltd/corstone1000/corstone1000.c |   4 +
  configs/corstone1000_defconfig           |   3 +
- include/configs/corstone1000.h           |  18 ++++
+ include/configs/corstone1000.h           |  24 ++++
  include/efi_loader.h                     |   4 +-
- lib/efi_loader/efi_boottime.c            |  36 +++++++
- lib/efi_loader/efi_capsule.c             | 124 ++++++++++++++++++++++-
- lib/efi_loader/efi_setup.c               |  15 +++
- 7 files changed, 200 insertions(+), 4 deletions(-)
+ lib/efi_loader/efi_boottime.c            |   7 ++
+ lib/efi_loader/efi_capsule.c             | 136 ++++++++++++++++++++++-
+ lib/efi_loader/efi_setup.c               |  64 +++++++++++
+ 7 files changed, 238 insertions(+), 4 deletions(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 4f4b96a095..76816f8f4e 100644
+index 6ec8e6144f..c840290885 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
-@@ -66,6 +66,10 @@ static struct mm_region corstone1000_mem_map[] =3D {
+@@ -67,6 +67,10 @@ static struct mm_region corstone1000_mem_map[] =3D {
 =20
  struct mm_region *mem_map =3D corstone1000_mem_map;
 =20
@@ -47,21 +52,21 @@ index 4f4b96a095..76816f8f4e 100644
  {
  	return 0;
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index d1dc06c86c..06eac3e041 100644
+index ee5481b63c..40ba415ecb 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -54,3 +54,6 @@ CONFIG_USB_ISP1760=3Dy
- CONFIG_ERRNO_STR=3Dy
- CONFIG_EFI_MM_COMM_TEE=3Dy
- CONFIG_ARM_FFA_TRANSPORT=3Dy
+@@ -58,3 +58,6 @@ CONFIG_EFI_MM_COMM_TEE=3Dy
+ CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
+ CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
+ CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
 +CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
 +CONFIG_EFI_CAPSULE_FIRMWARE_FIT=3Dy
 +CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index b6226fa12a..cd30499e3c 100644
+index 3347c11792..8927b09499 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
-@@ -14,6 +14,24 @@
+@@ -14,6 +14,30 @@
 =20
  #include <linux/sizes.h>
 =20
@@ -73,7 +78,13 @@ index b6226fa12a..cd30499e3c 100644
 +
 +/* Notification events used with SE Proxy update service */
 +#define CORSTONE1000_BUFFER_READY_EVT		(0x1)
-+#define CORSTONE1000_KERNEL_STARTED_EVT		(0x2)
++#define CORSTONE1000_UBOOT_EFI_STARTED_EVT	(0x2)
++
++#define PREP_SEPROXY_SVC_ID_MASK	GENMASK(31, 16)
++#define PREP_SEPROXY_SVC_ID(x)	 (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (=
x)))
++
++#define PREP_SEPROXY_EVT_MASK		GENMASK(15, 0)
++#define PREP_SEPROXY_EVT(x)	(FIELD_PREP(PREP_SEPROXY_EVT_MASK, (x)))
 +
 +/* Size in 4KB pages of the EFI capsule buffer */
 +#define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
@@ -83,14 +94,14 @@ index b6226fa12a..cd30499e3c 100644
 +	EFI_GUID(0x3a770ddc, 0x409b, 0x48b2, 0x81, 0x41, \
 +		 0x93, 0xb7, 0xc6, 0x0b, 0x20, 0x9e)
 +
- #define FFA_SHARED_MM_BUFFER_SIZE	SZ_4K /* 4 KB */
+ #define V2M_BASE		0x80000000
 =20
- /*
+ #define CFG_PL011_CLOCK	50000000
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index f9e427f090..26981141c2 100644
+index 38d7f66bab..0a613ed51e 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
-@@ -1032,11 +1032,11 @@ extern const struct efi_firmware_management_prot=
ocol efi_fmp_fit;
+@@ -1036,11 +1036,11 @@ extern const struct efi_firmware_management_prot=
ocol efi_fmp_fit;
  extern const struct efi_firmware_management_protocol efi_fmp_raw;
 =20
  /* Capsule update */
@@ -105,70 +116,37 @@ index f9e427f090..26981141c2 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index fea4eb7a34..faab74474d 100644
+index d5065f296a..a5da77c36c 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
-@@ -2103,6 +2103,33 @@ static void efi_exit_caches(void)
- #endif
- }
+@@ -23,6 +23,13 @@
+ #include <asm/setjmp.h>
+ #include <linux/libfdt_env.h>
 =20
 +#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+/**
-+ * efi_corstone1000_kernel_started_event - notifies SE Proxy FW update =
service
-+ *
-+ * This function notifies the SE Proxy update service that the kernel h=
as already started
-+ *
-+ * Return:
-+ *
-+ * 0: on success, otherwise failure
-+ */
-+static int efi_corstone1000_kernel_started_event(void)
-+{
-+	struct ffa_send_direct_data msg =3D {0};
-+
-+	log_debug("[%s]\n", __func__);
-+
-+	/*
-+	 * setting the kernel started  event arguments
-+	 */
-+	msg.data0 =3D CORSTONE1000_SEPROXY_UPDATE_SVC_ID; /* x3 */
-+	msg.data2 =3D CORSTONE1000_KERNEL_STARTED_EVT; /* x5 */
-+
-+	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
-+}
-+
++#include <arm_ffa.h>
++#include <dm.h>
++#include <linux/bitfield.h>
++#include <linux/bitops.h>
 +#endif
 +
- /**
-  * efi_exit_boot_services() - stop all boot services
-  * @image_handle: handle of the loaded image
-@@ -2209,6 +2236,15 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
- 	/* Recalculate CRC32 */
- 	efi_update_table_header_crc32(&systab.hdr);
+ DECLARE_GLOBAL_DATA_PTR;
 =20
-+#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+	/* Notifying SE Proxy FW update service */
-+	ffa_ret =3D efi_corstone1000_kernel_started_event();
-+	if (ffa_ret)
-+		debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update se=
rvice\n");
-+	else
-+		debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n");
-+#endif
-+
- 	/* Give the payload some time to boot */
- 	efi_set_watchdog(0);
- 	schedule();
+ /* Task priority level */
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 0997cd248f..9e8ddaac7f 100644
+index 7a6f195cbc..ea084e4ed2 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -26,6 +26,14 @@
+@@ -26,6 +26,17 @@
  #include <crypto/pkcs7_parser.h>
  #include <linux/err.h>
 =20
 +#ifdef CONFIG_TARGET_CORSTONE1000
 +#include <arm_ffa.h>
 +#include <cpu_func.h>
++#include <dm.h>
++#include <linux/bitfield.h>
++#include <linux/bitops.h>
 +
 +void *__efi_runtime_data corstone1000_capsule_buf; /* capsule shared bu=
ffer virtual address */
 +efi_guid_t corstone1000_capsule_guid =3D EFI_CORSTONE1000_CAPSULE_ID_GU=
ID;
@@ -177,7 +155,7 @@ index 0997cd248f..9e8ddaac7f 100644
  DECLARE_GLOBAL_DATA_PTR;
 =20
  const efi_guid_t efi_guid_capsule_report =3D EFI_CAPSULE_REPORT_GUID;
-@@ -696,6 +704,78 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -709,6 +720,87 @@ static efi_status_t efi_capsule_update_firmware(
  }
  #endif /* CONFIG_EFI_CAPSULE_FIRMWARE_MANAGEMENT */
 =20
@@ -239,24 +217,33 @@ index 0997cd248f..9e8ddaac7f 100644
 +static int __efi_runtime efi_corstone1000_buffer_ready_event(u32 capsul=
e_image_size)
 +{
 +	struct ffa_send_direct_data msg =3D {0};
++	int ret;
++	struct udevice *dev;
 +
 +	log_debug("[%s]\n", __func__);
 +
++	ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
++	if (ret) {
++		log_err("Cannot find FF-A bus device\n");
++		return ret;
++	}
++
 +	/*
-+	 * setting the buffer ready event arguments
++	 * setting the buffer ready event arguments in register w4:
++	 * - capsule update interface ID (31:16)
++	 * - the buffer ready event ID (15:0)
 +	 */
-+	msg.data0 =3D CORSTONE1000_SEPROXY_UPDATE_SVC_ID; /* x3 */
-+	msg.data1 =3D capsule_image_size; /* x4 */
-+	msg.data2 =3D CORSTONE1000_BUFFER_READY_EVT; /* x5 */
++	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
++		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w4 */
 +
-+	return ffa_bus_ops_get()->sync_send_receive(NULL, CORSTONE1000_SEPROXY=
_PART_ID, &msg, 0);
++	return ffa_sync_send_receive(dev, CORSTONE1000_SEPROXY_PART_ID, &msg, =
0);
 +}
 +#endif
 +
  /**
   * efi_update_capsule() - process information from operating system
   * @capsule_header_array:	Array of virtual address pointers
-@@ -709,7 +789,7 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -722,7 +814,7 @@ static efi_status_t efi_capsule_update_firmware(
   *
   * Return:			status code
   */
@@ -265,7 +252,7 @@ index 0997cd248f..9e8ddaac7f 100644
  		struct efi_capsule_header **capsule_header_array,
  		efi_uintn_t capsule_count,
  		u64 scatter_gather_list)
-@@ -726,6 +806,13 @@ efi_status_t EFIAPI efi_update_capsule(
+@@ -739,6 +831,13 @@ efi_status_t EFIAPI efi_update_capsule(
  		goto out;
  	}
 =20
@@ -279,7 +266,7 @@ index 0997cd248f..9e8ddaac7f 100644
  	ret =3D EFI_SUCCESS;
  	for (i =3D 0, capsule =3D *capsule_header_array; i < capsule_count;
  	     i++, capsule =3D *(++capsule_header_array)) {
-@@ -738,6 +825,39 @@ efi_status_t EFIAPI efi_update_capsule(
+@@ -751,6 +850,39 @@ efi_status_t EFIAPI efi_update_capsule(
 =20
  		log_debug("Capsule[%d] (guid:%pUs)\n",
  			  i, &capsule->capsule_guid);
@@ -319,7 +306,7 @@ index 0997cd248f..9e8ddaac7f 100644
  		if (!guidcmp(&capsule->capsule_guid,
  			     &efi_guid_firmware_management_capsule_id)) {
  			ret  =3D efi_capsule_update_firmware(capsule);
-@@ -776,7 +896,7 @@ out:
+@@ -789,7 +921,7 @@ out:
   *
   * Return:			status code
   */
@@ -329,14 +316,19 @@ index 0997cd248f..9e8ddaac7f 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 5437641135..1ad2fa52d7 100644
+index 58d4e13402..bf90a98b5a 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
-@@ -16,6 +16,13 @@
+@@ -17,6 +17,18 @@
 =20
  efi_status_t efi_obj_list_initialized =3D OBJ_LIST_NOT_INITIALIZED;
 =20
 +#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
++#include <linux/bitfield.h>
++#include <linux/bitops.h>
++#include <arm_ffa.h>
++#include <dm.h>
++
 +/**
 + * efi_corstone1000_alloc_capsule_shared_buf - allocate capsule shared =
buffer
 + */
@@ -346,11 +338,62 @@ index 5437641135..1ad2fa52d7 100644
  /*
   * Allow unaligned memory access.
   *
-@@ -128,6 +135,14 @@ static efi_status_t efi_init_capsule(void)
+@@ -120,6 +132,42 @@ static efi_status_t efi_init_secure_boot(void)
+ }
+ #endif /* CONFIG_EFI_SECURE_BOOT */
+=20
++#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
++/**
++ * efi_corstone1000_uboot-efi_started_event - notifies SE Proxy FW upda=
te service
++ *
++ * This function notifies the SE Proxy update service that uboot efi ha=
s already started
++ *
++ * Return:
++ *
++ * 0: on success, otherwise failure
++ * */
++static int efi_corstone1000_uboot_efi_started_event(void)
++{
++	struct ffa_send_direct_data msg =3D {0};
++	int ret;
++	struct udevice *dev;
++
++	log_debug("[%s]\n", __func__);
++
++	ret =3D uclass_first_device_err(UCLASS_FFA, &dev);
++	if (ret) {
++		log_err("Cannot find FF-A bus device\n");
++		return ret;
++	}
++
++	/*
++	 * setting the kernel started  event arguments:
++	 * setting capsule update interface ID(31:16)
++	 * the kernel started event ID(15:0)
++	 */
++	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
++			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w4 */
++
++	return ffa_sync_send_receive(dev, CORSTONE1000_SEPROXY_PART_ID, &msg, =
0);
++}
++#endif
++
+ /**
+  * efi_init_capsule - initialize capsule update state
+  *
+@@ -129,6 +177,22 @@ static efi_status_t efi_init_capsule(void)
  {
  	efi_status_t ret =3D EFI_SUCCESS;
 =20
 +#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
++	int ffa_ret;
++
++	ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
++	if (ffa_ret)
++		log_err("Failure to notify SE Proxy FW update service\n");
++	else
++		debug("SE Proxy FW update service notified\n");
++
 +	ret =3D efi_corstone1000_alloc_capsule_shared_buf();
 +	if (ret !=3D EFI_SUCCESS) {
 +		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n"=
);
@@ -358,9 +401,9 @@ index 5437641135..1ad2fa52d7 100644
 +	}
 +#endif
 +
- 	if (IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_UPDATE)) {
- 		ret =3D efi_set_variable_int(u"CapsuleMax",
- 					   &efi_guid_capsule_report,
+ 	if (IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)) {
+ 		u16 var_name16[12];
+=20
 --=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm=
-corstone1000-fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-fix-unrecognized-=
filesystem-type.patch
index 6fe10eb2..f9fb70b5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
@@ -1,7 +1,7 @@
-From ac738fa33edec9ff712dee6d10491cb2eb7cfe3a Mon Sep 17 00:00:00 2001
+From 445dfd4a5d8f31a7efb3f2f15aa677de8b3eb602 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Mar 2022 15:56:09 +0000
-Subject: [PATCH 12/42] arm: corstone1000: fix unrecognized filesystem ty=
pe
+Subject: [PATCH 12/33] arm: corstone1000: fix unrecognized filesystem ty=
pe
=20
 Some usb sticks are not recognized by usb, just add a
 delay before checking status.
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi=
_capsule-corstone1000-pass-interface-id-and-buffe.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_capsule-corstone1000-pass-i=
nterface-id-and-buffe.patch
deleted file mode 100644
index bc03035c..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_capsul=
e-corstone1000-pass-interface-id-and-buffe.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From baa961b6050508710e1c6b572f2e93ac5c488201 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 10 Dec 2021 20:03:35 +0000
-Subject: [PATCH 13/42] efi_capsule: corstone1000: pass interface id and =
buffer
- event id using register w4
-
-Initially the interface/event IDs are passed to the SP using register
-w3 and w5.
-
-Now the SE proxy SP requires this arguments to be in register w4.
-
-This change is to pass interface ID(31:16) and event ID(15:0)
-to SE proxy SP to trigger an event to secure enclave about
-firmware update.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- include/configs/corstone1000.h |  6 ++++++
- lib/efi_loader/efi_capsule.c   | 11 +++++++----
- 2 files changed, 13 insertions(+), 4 deletions(-)
-
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index cd30499e3c..e4c7bcb96f 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -24,6 +24,12 @@
- #define CORSTONE1000_BUFFER_READY_EVT		(0x1)
- #define CORSTONE1000_KERNEL_STARTED_EVT		(0x2)
-=20
-+#define PREP_SEPROXY_SVC_ID_MASK	GENMASK(31, 16)
-+#define PREP_SEPROXY_SVC_ID(x)	 (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (=
x)))
-+
-+#define PREP_SEPROXY_EVT_MASK		GENMASK(15, 0)
-+#define PREP_SEPROXY_EVT(x)	(FIELD_PREP(PREP_SEPROXY_EVT_MASK, (x)))
-+
- /* Size in 4KB pages of the EFI capsule buffer */
- #define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
-=20
-diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 9e8ddaac7f..bd4cc8d272 100644
---- a/lib/efi_loader/efi_capsule.c
-+++ b/lib/efi_loader/efi_capsule.c
-@@ -29,6 +29,8 @@
- #ifdef CONFIG_TARGET_CORSTONE1000
- #include <arm_ffa.h>
- #include <cpu_func.h>
-+#include <linux/bitfield.h>
-+#include <linux/bitops.h>
-=20
- void *__efi_runtime_data corstone1000_capsule_buf; /* capsule shared bu=
ffer virtual address */
- efi_guid_t corstone1000_capsule_guid =3D EFI_CORSTONE1000_CAPSULE_ID_GU=
ID;
-@@ -766,11 +768,12 @@ static int __efi_runtime efi_corstone1000_buffer_r=
eady_event(u32 capsule_image_s
- 	log_debug("[%s]\n", __func__);
-=20
- 	/*
--	 * setting the buffer ready event arguments
-+	 * setting the buffer ready event arguments in register w4:
-+	 * - capsule update interface ID (31:16)
-+	 * - the buffer ready event ID (15:0)
- 	 */
--	msg.data0 =3D CORSTONE1000_SEPROXY_UPDATE_SVC_ID; /* x3 */
--	msg.data1 =3D capsule_image_size; /* x4 */
--	msg.data2 =3D CORSTONE1000_BUFFER_READY_EVT; /* x5 */
-+	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
-+		PREP_SEPROXY_EVT(CORSTONE1000_BUFFER_READY_EVT); /* w4 */
-=20
- 	return ffa_bus_ops_get()->sync_send_receive(NULL, CORSTONE1000_SEPROXY=
_PART_ID, &msg, 0);
- }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi=
_loader-corstone1000-remove-guid-check-from-corst.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader-corstone1000-remove-=
guid-check-from-corst.patch
similarity index 83%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_=
loader-corstone1000-remove-guid-check-from-corst.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_lo=
ader-corstone1000-remove-guid-check-from-corst.patch
index e57b9441..4ddb35ea 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
@@ -1,7 +1,7 @@
-From 5e09d349ec8af6585bce777acbfd2d218fc2e8d4 Mon Sep 17 00:00:00 2001
+From 68248cd3cc95e0480ee2cbc3ebaba51967889199 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 11 Dec 2021 13:23:55 +0000
-Subject: [PATCH 15/42] efi_loader: corstone1000: remove guid check from
+Subject: [PATCH 13/33] efi_loader: corstone1000: remove guid check from
  corstone1000 config option
=20
 Use generic fmp guid and no separte check is required for
@@ -15,10 +15,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 1 insertion(+), 15 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index bd4cc8d272..ef7b358ddb 100644
+index ea084e4ed2..5314f529b4 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -830,12 +830,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
+@@ -852,12 +852,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
  			  i, &capsule->capsule_guid);
 =20
  #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
@@ -31,7 +31,7 @@ index bd4cc8d272..ef7b358ddb 100644
  		if (efi_size_in_pages(capsule->capsule_image_size) >
  		    CORSTONE1000_CAPSULE_BUFFER_SIZE) {
  			log_err("Corstone1000: Capsule data size exceeds the shared buffer s=
ize\n");
-@@ -861,15 +855,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
+@@ -883,15 +877,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
  		goto out;
  #endif
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi=
_boottime-corstone1000-pass-interface-id-and-kern.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0014-efi_boottime-corstone1000-pass-=
interface-id-and-kern.patch
deleted file mode 100644
index 658e21f0..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_bootti=
me-corstone1000-pass-interface-id-and-kern.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From d761d59dd251ae93980f659d253576fc872f2c5f Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 10 Dec 2021 20:10:41 +0000
-Subject: [PATCH 14/42] efi_boottime: corstone1000: pass interface id and
- kernel event id using register w4
-
-Initially the interface/event IDs are passed to the SP using register
-w3 and w5.
-
-Now the SE proxy SP requires this arguments to be in register w4.
-
-This change is to pass interface ID(31:16) and kernel started
-event ID(15:0) to SE proxy SP to trigger an event to
-secure enclave just before ExitbootService().
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- lib/efi_loader/efi_boottime.c | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index faab74474d..36a0be7ba1 100644
---- a/lib/efi_loader/efi_boottime.c
-+++ b/lib/efi_loader/efi_boottime.c
-@@ -30,6 +30,11 @@
- #include <arm_ffa.h>
- #endif
-=20
-+#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+#include <linux/bitfield.h>
-+#include <linux/bitops.h>
-+#endif
-+
- DECLARE_GLOBAL_DATA_PTR;
-=20
- /* Task priority level */
-@@ -2120,10 +2125,12 @@ static int efi_corstone1000_kernel_started_event=
(void)
- 	log_debug("[%s]\n", __func__);
-=20
- 	/*
--	 * setting the kernel started  event arguments
-+	 * setting the kernel started  event arguments:
-+	 * setting capsule update interface ID(31:16)
-+	 * the kernel started event ID(15:0)
- 	 */
--	msg.data0 =3D CORSTONE1000_SEPROXY_UPDATE_SVC_ID; /* x3 */
--	msg.data2 =3D CORSTONE1000_KERNEL_STARTED_EVT; /* x5 */
-+	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
-+		PREP_SEPROXY_EVT(CORSTONE1000_KERNEL_STARTED_EVT); /* w4 */
-=20
- 	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
- }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi=
_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader-populate-ESRT-table-=
if-EFI_ESRT-config-op.patch
similarity index 80%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_=
loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_lo=
ader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
index 1b88d7f1..c0b3fa82 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
@@ -1,7 +1,7 @@
-From e3ccad1cf9e905ec15ff772dcf53972fafcf54ee Mon Sep 17 00:00:00 2001
+From bb0eb602d3697384318cac90605259aa7fb21c9b Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:49:02 +0000
-Subject: [PATCH 16/42] efi_loader: populate ESRT table if EFI_ESRT confi=
g
+Subject: [PATCH 14/33] efi_loader: populate ESRT table if EFI_ESRT confi=
g
  option is set
=20
 This change is to call efi_esrt_populate function if CONFIG_EFI_ESRT
@@ -15,10 +15,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 7 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index ef7b358ddb..8eb8fc406a 100644
+index 5314f529b4..6a06605ad9 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -852,6 +852,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
+@@ -874,6 +874,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
  			ret =3D EFI_SUCCESS;
  		}
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi=
_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0015-efi_firmware-add-get_image_info-for=
-corstone1000.patch
similarity index 96%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_=
firmware-add-get_image_info-for-corstone1000.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_fi=
rmware-add-get_image_info-for-corstone1000.patch
index 7087315e..2186330e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
@@ -1,7 +1,7 @@
-From d8f79ab37bae283599e40018055ff9d5648fb647 Mon Sep 17 00:00:00 2001
+From 5e12999d179e84ac52e242d56c57a4d429651124 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:50:25 +0000
-Subject: [PATCH 17/42] efi_firmware: add get_image_info for corstone1000
+Subject: [PATCH 15/33] efi_firmware: add get_image_info for corstone1000
=20
 This change is to populate get_image_info which eventually
 will be populated in ESRT table
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi=
_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader-fix-null-pointer-exc=
eption-with-get_image.patch
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_=
loader-fix-null-pointer-exception-with-get_image.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_lo=
ader-fix-null-pointer-exception-with-get_image.patch
index 24e5b46a..b58c1d79 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
@@ -1,7 +1,7 @@
-From 3d28467e447f12c5aa276827aa742e7eed1d577a Mon Sep 17 00:00:00 2001
+From 957e88fc52d77e6a3024f06bebfaa713c9e99e59 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 14 Jan 2022 15:24:18 +0000
-Subject: [PATCH 19/42] efi_loader: fix null pointer exception with
+Subject: [PATCH 16/33] efi_loader: fix null pointer exception with
  get_image_info
=20
 get_img_info API implemented for corstone1000 target does not
@@ -17,7 +17,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 11 insertions(+), 8 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 70568f2290..c883e2ff0a 100644
+index 0a38a96351..c883e2ff0a 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -39,26 +39,29 @@ static efi_status_t efi_corstone1000_img_info_get (
@@ -39,7 +39,7 @@ index 70568f2290..c883e2ff0a 100644
  		*package_version_name =3D NULL; /* not supported */
 =20
  	if(image_info =3D=3D NULL) {
--		log_info("image_info is null\n");
+-		log_warning("image_info is null\n");
 +		log_debug("image_info is null\n");
  		return EFI_BUFFER_TOO_SMALL;
  	}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm=
-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0017-arm-corstone1000-add-mmc-for-fvp.patch
similarity index 81%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm-=
corstone1000-add-mmc-for-fvp.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-co=
rstone1000-add-mmc-for-fvp.patch
index 93da2536..75fe64c2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm-corsto=
ne1000-add-mmc-for-fvp.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-arm-corsto=
ne1000-add-mmc-for-fvp.patch
@@ -1,7 +1,7 @@
-From d6c183a99a7d232ef5dbf886c49e7fb75b50ecf9 Mon Sep 17 00:00:00 2001
+From 61b5f50718431b5fff57fcaa924238135b11ed3c Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 30 Nov 2022 15:37:22 +0000
-Subject: [PATCH 20/42] arm:corstone1000: add mmc for fvp
+Date: Mon, 17 Jul 2023 16:50:53 +0100
+Subject: [PATCH 17/33] arm:corstone1000: add mmc for fvp
=20
 Enable support mmc/sdcard for the corstone1000 FVP.
=20
@@ -10,15 +10,15 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
 Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  board/armltd/corstone1000/corstone1000.c | 28 +++++++++++++++++++-----
- configs/corstone1000_defconfig           |  8 ++++++-
+ configs/corstone1000_defconfig           |  9 ++++++--
  include/configs/corstone1000.h           |  4 +++-
- 3 files changed, 32 insertions(+), 8 deletions(-)
+ 3 files changed, 32 insertions(+), 9 deletions(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 76816f8f4e..d6ca6e8961 100644
+index c840290885..ecfd8366df 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
-@@ -38,19 +38,35 @@ static struct mm_region corstone1000_mem_map[] =3D {
+@@ -39,19 +39,35 @@ static struct mm_region corstone1000_mem_map[] =3D {
  	}, {
  		/* USB */
  		.virt =3D 0x40200000UL,
@@ -61,14 +61,15 @@ index 76816f8f4e..d6ca6e8961 100644
  		/* OCVM */
  		.virt =3D 0x80000000UL,
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 06eac3e041..f7c276a10a 100644
+index 40ba415ecb..76158fc37d 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -40,7 +40,13 @@ CONFIG_VERSION_VARIABLE=3Dy
+@@ -40,8 +40,13 @@ CONFIG_VERSION_VARIABLE=3Dy
  CONFIG_NET_RANDOM_ETHADDR=3Dy
  CONFIG_REGMAP=3Dy
  CONFIG_MISC=3Dy
 -# CONFIG_MMC is not set
+-CONFIG_NVMXIP_QSPI=3Dy
 +CONFIG_CLK=3Dy
 +CONFIG_CMD_MMC=3Dy
 +CONFIG_DM_MMC=3Dy
@@ -80,11 +81,11 @@ index 06eac3e041..f7c276a10a 100644
  CONFIG_PHY_SMSC=3Dy
  CONFIG_SMC911X=3Dy
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index be13b98d48..a015a1630e 100644
+index 8927b09499..1466507f80 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
-@@ -59,7 +59,9 @@
- #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
+@@ -49,7 +49,9 @@
+ #define CFG_SYS_SDRAM_BASE	PHYS_SDRAM_1
 =20
  #define BOOT_TARGET_DEVICES(func) \
 -	func(USB, usb, 0)
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-cor=
stone1000-add-compressed-kernel-support.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0018-corstone1000-add-compressed-kernel-suppor=
t.patch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-cors=
tone1000-add-compressed-kernel-support.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-corsto=
ne1000-add-compressed-kernel-support.patch
index 7797880c..0f28cdf3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corstone10=
00-add-compressed-kernel-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-corstone10=
00-add-compressed-kernel-support.patch
@@ -1,7 +1,7 @@
-From 155f20028ad5f3ba5d2362ec48abb7804eaade00 Mon Sep 17 00:00:00 2001
+From a5879f1e7d91fc31058ba75b499d77cab080d611 Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
 Date: Wed, 30 Nov 2022 18:59:59 +0000
-Subject: [PATCH 21/42] corstone1000: add compressed kernel support
+Subject: [PATCH 18/33] corstone1000: add compressed kernel support
=20
 The corstone1000 kernel has become too large to fit in the available
 storage.  Swtiching to a compressed kernel avoids the problem, but
@@ -17,10 +17,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index f7c276a10a..1179bf5f3b 100644
+index 76158fc37d..a92668389a 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -15,7 +15,7 @@ CONFIG_FIT=3Dy
+@@ -15,7 +15,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
  CONFIG_BOOTDELAY=3D3
  CONFIG_USE_BOOTARGS=3Dy
  CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-efi=
_loader-send-bootcomplete-message-to-secure-encla.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0018-efi_loader-send-bootcomplete-me=
ssage-to-secure-encla.patch
deleted file mode 100644
index 1fbad386..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-efi_loader=
-send-bootcomplete-message-to-secure-encla.patch
+++ /dev/null
@@ -1,183 +0,0 @@
-From a6fee840a411a6a7b6c276d0a7b1d5445039e6c2 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Mon, 15 Aug 2022 15:46:18 +0100
-Subject: [PATCH 18/42] efi_loader: send bootcomplete message to secure e=
nclave
-
-On corstone1000 platform, Secure Enclave will be expecting
-an event from uboot when it performs capsule update. Previously,
-an event is sent at exitbootservice level. This will create a problem
-when user wants to interrupt at UEFI shell, hence, it is required
-to send an uboot efi initialized event at efi sub-system initialization
-stage.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- include/configs/corstone1000.h |  2 +-
- lib/efi_loader/efi_boottime.c  | 43 ----------------------------------
- lib/efi_loader/efi_firmware.c  |  2 +-
- lib/efi_loader/efi_setup.c     | 39 ++++++++++++++++++++++++++++++
- 4 files changed, 41 insertions(+), 45 deletions(-)
-
-diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index e4c7bcb96f..be13b98d48 100644
---- a/include/configs/corstone1000.h
-+++ b/include/configs/corstone1000.h
-@@ -22,7 +22,7 @@
-=20
- /* Notification events used with SE Proxy update service */
- #define CORSTONE1000_BUFFER_READY_EVT		(0x1)
--#define CORSTONE1000_KERNEL_STARTED_EVT		(0x2)
-+#define CORSTONE1000_UBOOT_EFI_STARTED_EVT	(0x2)
-=20
- #define PREP_SEPROXY_SVC_ID_MASK	GENMASK(31, 16)
- #define PREP_SEPROXY_SVC_ID(x)	 (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (=
x)))
-diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 36a0be7ba1..fea4eb7a34 100644
---- a/lib/efi_loader/efi_boottime.c
-+++ b/lib/efi_loader/efi_boottime.c
-@@ -30,11 +30,6 @@
- #include <arm_ffa.h>
- #endif
-=20
--#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
--#include <linux/bitfield.h>
--#include <linux/bitops.h>
--#endif
--
- DECLARE_GLOBAL_DATA_PTR;
-=20
- /* Task priority level */
-@@ -2108,35 +2103,6 @@ static void efi_exit_caches(void)
- #endif
- }
-=20
--#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
--/**
-- * efi_corstone1000_kernel_started_event - notifies SE Proxy FW update =
service
-- *
-- * This function notifies the SE Proxy update service that the kernel h=
as already started
-- *
-- * Return:
-- *
-- * 0: on success, otherwise failure
-- */
--static int efi_corstone1000_kernel_started_event(void)
--{
--	struct ffa_send_direct_data msg =3D {0};
--
--	log_debug("[%s]\n", __func__);
--
--	/*
--	 * setting the kernel started  event arguments:
--	 * setting capsule update interface ID(31:16)
--	 * the kernel started event ID(15:0)
--	 */
--	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
--		PREP_SEPROXY_EVT(CORSTONE1000_KERNEL_STARTED_EVT); /* w4 */
--
--	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
--}
--
--#endif
--
- /**
-  * efi_exit_boot_services() - stop all boot services
-  * @image_handle: handle of the loaded image
-@@ -2243,15 +2209,6 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
- 	/* Recalculate CRC32 */
- 	efi_update_table_header_crc32(&systab.hdr);
-=20
--#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
--	/* Notifying SE Proxy FW update service */
--	ffa_ret =3D efi_corstone1000_kernel_started_event();
--	if (ffa_ret)
--		debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update se=
rvice\n");
--	else
--		debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n");
--#endif
--
- 	/* Give the payload some time to boot */
- 	efi_set_watchdog(0);
- 	schedule();
-diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 0a38a96351..70568f2290 100644
---- a/lib/efi_loader/efi_firmware.c
-+++ b/lib/efi_loader/efi_firmware.c
-@@ -48,7 +48,7 @@ static efi_status_t efi_corstone1000_img_info_get (
- 		*package_version_name =3D NULL; /* not supported */
-=20
- 	if(image_info =3D=3D NULL) {
--		log_warning("image_info is null\n");
-+		log_info("image_info is null\n");
- 		return EFI_BUFFER_TOO_SMALL;
- 	}
-=20
-diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 1ad2fa52d7..89f988b09c 100644
---- a/lib/efi_loader/efi_setup.c
-+++ b/lib/efi_loader/efi_setup.c
-@@ -17,6 +17,9 @@
- efi_status_t efi_obj_list_initialized =3D OBJ_LIST_NOT_INITIALIZED;
-=20
- #if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+#include <linux/bitfield.h>
-+#include <linux/bitops.h>
-+#include <arm_ffa.h>
- /**
-  * efi_corstone1000_alloc_capsule_shared_buf - allocate capsule shared =
buffer
-  */
-@@ -126,6 +129,34 @@ static efi_status_t efi_init_secure_boot(void)
- }
- #endif /* CONFIG_EFI_SECURE_BOOT */
-=20
-+#if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+/**
-+ * efi_corstone1000_uboot-efi_started_event - notifies SE Proxy FW upda=
te service
-+ *
-+ * This function notifies the SE Proxy update service that uboot efi ha=
s already started
-+ *
-+ * Return:
-+ *
-+ * 0: on success, otherwise failure
-+ * */
-+static int efi_corstone1000_uboot_efi_started_event(void)
-+{
-+	struct ffa_send_direct_data msg =3D {0};
-+
-+	log_debug("[%s]\n", __func__);
-+
-+	/*
-+	 * setting the kernel started  event arguments:
-+	 * setting capsule update interface ID(31:16)
-+	 * the kernel started event ID(15:0)
-+	 */
-+	msg.data1 =3D PREP_SEPROXY_SVC_ID(CORSTONE1000_SEPROXY_UPDATE_SVC_ID) =
|
-+			PREP_SEPROXY_EVT(CORSTONE1000_UBOOT_EFI_STARTED_EVT); /* w4 */
-+
-+	return ffa_bus_ops_get()->sync_send_receive(NULL, CORSTONE1000_SEPROXY=
_PART_ID, &msg, 0);
-+}
-+#endif
-+
- /**
-  * efi_init_capsule - initialize capsule update state
-  *
-@@ -136,6 +167,14 @@ static efi_status_t efi_init_capsule(void)
- 	efi_status_t ret =3D EFI_SUCCESS;
-=20
- #if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
-+	int ffa_ret;
-+
-+	ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
-+	if (ffa_ret)
-+		debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update se=
rvice\n");
-+	else
-+		debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n");
-+
- 	ret =3D efi_corstone1000_alloc_capsule_shared_buf();
- 	if (ret !=3D EFI_SUCCESS) {
- 		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n"=
);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Int=
roduce-external-sys-driver-to-device-tree.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0019-Introduce-external-sys-driver-to-device=
-tree.patch
similarity index 81%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Intr=
oduce-external-sys-driver-to-device-tree.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Introd=
uce-external-sys-driver-to-device-tree.patch
index c74e17fb..a4c66254 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Introduce-=
external-sys-driver-to-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-Introduce-=
external-sys-driver-to-device-tree.patch
@@ -1,7 +1,7 @@
-From 984c431cd594c112d71ea1378bc1ac3b72806baa Mon Sep 17 00:00:00 2001
+From 0748658414dd02cec0219841a86c4e7b99bfc171 Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Wed, 30 Nov 2022 19:02:26 +0000
-Subject: [PATCH 22/42] Introduce external sys driver to device-tree
+Subject: [PATCH 19/33] Introduce external sys driver to device-tree
=20
 It adds external sys driver binding to u-boot
 device tree.
@@ -14,10 +14,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  1 file changed, 7 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 4e46826f88..2c7185e139 100644
+index 533dfdf8e1..a834d38454 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
-@@ -160,5 +160,12 @@
+@@ -167,5 +167,12 @@
  			secure-status =3D "okay";     /* secure-world-only */
  			status =3D "disabled";
  		};
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add=
-mhu-and-rpmsg-client-to-u-boot-device-tree.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0020-Add-mhu-and-rpmsg-client-to-u-boot-de=
vice-tree.patch
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add-=
mhu-and-rpmsg-client-to-u-boot-device-tree.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Add-mh=
u-and-rpmsg-client-to-u-boot-device-tree.patch
index 5747d782..f3b1503c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add-mhu-an=
d-rpmsg-client-to-u-boot-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-Add-mhu-an=
d-rpmsg-client-to-u-boot-device-tree.patch
@@ -1,7 +1,7 @@
-From 4167fe9079b64aaaf3eefc53063d242af8d2badd Mon Sep 17 00:00:00 2001
+From 396229d3d29d9cfd5e2567be5427a9066072e32f Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Mon, 12 Sep 2022 15:47:06 +0100
-Subject: [PATCH 23/42] Add mhu and rpmsg client to u-boot device tree
+Subject: [PATCH 20/33] Add mhu and rpmsg client to u-boot device tree
=20
 Adds external system controller and mhu driver to u-boot
 device tree. This enables communication between host and
@@ -15,10 +15,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  1 file changed, 50 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 2c7185e139..61e0c33247 100644
+index a834d38454..18c4d1e19a 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
-@@ -161,6 +161,56 @@
+@@ -168,6 +168,56 @@
  			status =3D "disabled";
  		};
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm=
-corstone1000-esrt-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0021-arm-corstone1000-esrt-support.patch
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-=
corstone1000-esrt-support.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-arm-co=
rstone1000-esrt-support.patch
index 9d569be9..369613eb 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corsto=
ne1000-esrt-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-arm-corsto=
ne1000-esrt-support.patch
@@ -1,7 +1,7 @@
-From f924535544515cdb350b2979b8c413cf221124b6 Mon Sep 17 00:00:00 2001
+From 0380dee4df6ef11bb08a9c44119b41c58afc562d Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Wed, 30 Nov 2022 19:11:43 +0000
-Subject: [PATCH 24/42] arm/corstone1000: esrt support
+Subject: [PATCH 21/33] arm/corstone1000: esrt support
=20
 The implementation is platform specific and would require
 change in future.
@@ -20,10 +20,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  3 files changed, 143 insertions(+), 9 deletions(-)
=20
 diff --git a/include/efi_api.h b/include/efi_api.h
-index 9bd70b0f18..23e427236a 100644
+index 55a4c989fc..f267ab5110 100644
 --- a/include/efi_api.h
 +++ b/include/efi_api.h
-@@ -2030,7 +2030,7 @@ struct efi_firmware_image_descriptor {
+@@ -2086,7 +2086,7 @@ struct efi_firmware_image_descriptor {
  	u32 last_attempt_status;
  	u64 hardware_instance;
  	efi_firmware_image_dep_t *dependencies;
@@ -186,10 +186,10 @@ index c883e2ff0a..c6ab6e2182 100644
  	.set_image =3D efi_firmware_fit_set_image,
  	.check_image =3D efi_firmware_check_image_unsupported,
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 89f988b09c..08c742edbd 100644
+index bf90a98b5a..d20568c1c8 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
-@@ -167,14 +167,6 @@ static efi_status_t efi_init_capsule(void)
+@@ -178,14 +178,6 @@ static efi_status_t efi_init_capsule(void)
  	efi_status_t ret =3D EFI_SUCCESS;
 =20
  #if IS_ENABLED(CONFIG_TARGET_CORSTONE1000)
@@ -197,14 +197,14 @@ index 89f988b09c..08c742edbd 100644
 -
 -	ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
 -	if (ffa_ret)
--		debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update se=
rvice\n");
+-		log_err("Failure to notify SE Proxy FW update service\n");
 -	else
--		debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n");
+-		debug("SE Proxy FW update service notified\n");
 -
  	ret =3D efi_corstone1000_alloc_capsule_shared_buf();
  	if (ret !=3D EFI_SUCCESS) {
  		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n"=
);
-@@ -288,6 +280,15 @@ efi_status_t efi_init_obj_list(void)
+@@ -304,6 +296,15 @@ efi_status_t efi_init_obj_list(void)
  	if (ret !=3D EFI_SUCCESS)
  		goto out;
 =20
@@ -212,9 +212,9 @@ index 89f988b09c..08c742edbd 100644
 +		int ffa_ret;
 +		ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
 +		if (ffa_ret)
-+			debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update s=
ervice\n");
++			log_err("Failure to notify SE Proxy FW update service\n");
 +		else
-+			debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n")=
;
++			debug("SE Proxy FW update service notified\n");
 +#endif
 +
  	/* Initialize variable services */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-cor=
stone1000-enable-distro-booting-command.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0022-corstone1000-enable-distro-booting-comman=
d.patch
similarity index 72%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-cors=
tone1000-enable-distro-booting-command.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-corsto=
ne1000-enable-distro-booting-command.patch
index 57751b19..6f04081c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-enable-distro-booting-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-corstone10=
00-enable-distro-booting-command.patch
@@ -1,26 +1,26 @@
-From 2a281a45b7dfc5c0e78f6256bf0ac122d825ce82 Mon Sep 17 00:00:00 2001
+From b3c9b57d862060b7d112725a567c0ff24184c6e1 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
-Subject: [PATCH 26/42] corstone1000: enable distro booting command
+Subject: [PATCH 22/33] corstone1000: enable distro booting command
=20
 enable distro_bootcmd
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  include/configs/corstone1000.h | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index a015a1630e..c30a7bfa0c 100644
+index 1466507f80..8622565a87 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
-@@ -65,5 +65,6 @@
+@@ -55,5 +55,6 @@
 =20
  #include <config_distro_bootcmd.h>
 =20
-+#define CONFIG_EXTRA_ENV_SETTINGS BOOTENV
++#define CFG_EXTRA_ENV_SETTINGS BOOTENV
 =20
  #endif
 --=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-cor=
stone1000-add-fwu-metadata-store-info.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0023-corstone1000-add-fwu-metadata-store-info.pa=
tch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-cors=
tone1000-add-fwu-metadata-store-info.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-corsto=
ne1000-add-fwu-metadata-store-info.patch
index d4ed9121..6b347962 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corstone10=
00-add-fwu-metadata-store-info.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-corstone10=
00-add-fwu-metadata-store-info.patch
@@ -1,7 +1,7 @@
-From e2fb90ab15babd146dd47b7c946674cd5a5260a1 Mon Sep 17 00:00:00 2001
+From 10265c2006291f961cc4fdbbffdec6c5f52bf73b Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 15:58:07 +0000
-Subject: [PATCH 33/42] corstone1000: add fwu-metadata store info
+Subject: [PATCH 23/33] corstone1000: add fwu-metadata store info
=20
 Add fwu-mdata node and handle for the reference
 nvmxip-qspi.
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-fwu=
_metadata-make-sure-structures-are-packed.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0024-fwu_metadata-make-sure-structures-are-p=
acked.patch
similarity index 90%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-fwu_=
metadata-make-sure-structures-are-packed.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_me=
tadata-make-sure-structures-are-packed.patch
index fedc1f2e..88566a6f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-fwu_metada=
ta-make-sure-structures-are-packed.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-fwu_metada=
ta-make-sure-structures-are-packed.patch
@@ -1,7 +1,7 @@
-From ac77679ffcb4b7fac01414c1492d3e1aae13f9be Mon Sep 17 00:00:00 2001
+From 046e54d0152987163355e33fe260419dfcf3b8bb Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:13:24 +0000
-Subject: [PATCH 35/42] fwu_metadata: make sure structures are packed
+Subject: [PATCH 24/33] fwu_metadata: make sure structures are packed
=20
 The fwu metadata in the metadata partitions
 should/are packed to guarantee that the info is
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-cor=
stone1000-add-boot-index.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/c=
orstone1000/0025-corstone1000-add-boot-index.patch
new file mode 100644
index 00000000..45ec44fb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-add-boot-index.patch
@@ -0,0 +1,42 @@
+From 92f471d3195e3893f463b11d49f0db62793ca585 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Mon, 17 Jul 2023 17:04:10 +0100
+Subject: [PATCH 25/33] corstone1000: add boot index
+
+it is expected that the firmware that runs before
+u-boot somehow provide the information of the bank
+(index) of it is booting.
+We will need to extend tf-a to pass that info,
+meanwhile just set it to the default bank.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ board/armltd/corstone1000/corstone1000.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index ecfd8366df..ba6d024b80 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -8,6 +8,7 @@
+ #include <common.h>
+ #include <cpu_func.h>
+ #include <dm.h>
++#include <fwu.h>
+ #include <netdev.h>
+ #include <dm/platform_data/serial_pl01x.h>
+ #include <asm/armv8/mmu.h>
+@@ -107,6 +108,7 @@ int dram_init_banksize(void)
+ 	return 0;
+ }
+=20
+-void reset_cpu(void)
++void fwu_plat_get_bootidx(uint *boot_idx)
+ {
++	*boot_idx =3D 0;
+ }
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi=
_setup-discover-FF-A-bus-before-raising-EFI-start.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0025-efi_setup-discover-FF-A-bus-bef=
ore-raising-EFI-start.patch
deleted file mode 100644
index 568d9464..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_setup-=
discover-FF-A-bus-before-raising-EFI-start.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 1f165f5b6e7d82611b55260b7254fee5fbebe539 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Wed, 30 Nov 2022 19:14:52 +0000
-Subject: [PATCH 25/42] efi_setup: discover FF-A bus before raising EFI s=
tarted
- event
-
-add FF-A discovery to efi_corstone1000_uboot_efi_started_event()
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- lib/efi_loader/efi_setup.c | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 08c742edbd..65bd626e49 100644
---- a/lib/efi_loader/efi_setup.c
-+++ b/lib/efi_loader/efi_setup.c
-@@ -142,9 +142,16 @@ static efi_status_t efi_init_secure_boot(void)
- static int efi_corstone1000_uboot_efi_started_event(void)
- {
- 	struct ffa_send_direct_data msg =3D {0};
-+	int ret;
-=20
- 	log_debug("[%s]\n", __func__);
-=20
-+	ret =3D ffa_bus_discover(NULL);
-+	if (ret !=3D 0) {
-+		log_err("failure to discover FF-A bus\n");
-+		return ret;
-+	}
-+
- 	/*
- 	 * setting the kernel started  event arguments:
- 	 * setting capsule update interface ID(31:16)
-@@ -284,9 +291,9 @@ efi_status_t efi_init_obj_list(void)
- 		int ffa_ret;
- 		ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
- 		if (ffa_ret)
--			debug("[efi_boottime][ERROR]: Failure to notify SE Proxy FW update s=
ervice\n");
-+			log_err("Failure to notify SE Proxy FW update service\n");
- 		else
--			debug("[efi_boottime][INFO]: SE Proxy FW update service notified\n")=
;
-+			debug("SE Proxy FW update service notified\n");
- #endif
-=20
- 	/* Initialize variable services */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-cor=
stone1000-adjust-boot-bank-and-kernel-location.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0026-corstone1000-adjust-boot-bank-and-=
kernel-location.patch
similarity index 89%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-cors=
tone1000-adjust-boot-bank-and-kernel-location.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corsto=
ne1000-adjust-boot-bank-and-kernel-location.patch
index 277e988b..9a889eaf 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corstone10=
00-adjust-boot-bank-and-kernel-location.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-adjust-boot-bank-and-kernel-location.patch
@@ -1,7 +1,7 @@
-From 1a54c12aa6eed28a1a4e4f50d1aeb92a31cf6f52 Mon Sep 17 00:00:00 2001
+From 6ea58b2450c72036551e59186888474bcb54a194 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:17:21 +0000
-Subject: [PATCH 37/42] corstone1000: adjust boot bank and kernel locatio=
n
+Subject: [PATCH 26/33] corstone1000: adjust boot bank and kernel locatio=
n
=20
 Adjust in the env boot script the address of the
 bootbank with the new gpt layout, and also the
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0027-corstone1000-add-nvmxip-fwu-mdata-=
and-gpt-options.patch
similarity index 63%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cors=
tone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corsto=
ne1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
index a0f2bb16..621b9d17 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-add-nvmxip-fwu-mdata-and-gpt-options.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-add-nvmxip-fwu-mdata-and-gpt-options.patch
@@ -1,7 +1,7 @@
-From 5e0b7e40c4702d5494378d3e120fce0136f69a79 Mon Sep 17 00:00:00 2001
+From af1bb3af4ff7bb9486dc9489d27605b8eded45b9 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Fri, 9 Jun 2023 13:28:06 +0100
-Subject: [PATCH 38/42] corstone1000: add nvmxip, fwu-mdata and gpt optio=
ns
+Date: Mon, 17 Jul 2023 17:33:52 +0100
+Subject: [PATCH 27/33] corstone1000: add nvmxip, fwu-mdata and gpt optio=
ns
=20
 Enable the newest features: nvmxip, fwu-metadata and
 gpt. Commands to print the partition info, gpt info
@@ -10,29 +10,14 @@ and fwu metadata will be available.
 Upstream-Status: Pending
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
- configs/corstone1000_defconfig | 29 +++++++++++++++++++----------
- 1 file changed, 19 insertions(+), 10 deletions(-)
+ configs/corstone1000_defconfig | 21 ++++++++++++++-------
+ 1 file changed, 14 insertions(+), 7 deletions(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 1179bf5f3b..c38113ce95 100644
+index a92668389a..4c75a01818 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -4,18 +4,20 @@ CONFIG_TARGET_CORSTONE1000=3Dy
- CONFIG_TEXT_BASE=3D0x80000000
- CONFIG_SYS_MALLOC_LEN=3D0x2000000
- CONFIG_NR_DRAM_BANKS=3D1
-+CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=3Dy
-+CONFIG_CUSTOM_SYS_INIT_SP_ADDR=3D0x83f00000
-+CONFIG_DM_GPIO=3Dy
- CONFIG_DEFAULT_DEVICE_TREE=3D"corstone1000-mps3"
- CONFIG_SYS_PROMPT=3D"corstone1000# "
- CONFIG_IDENT_STRING=3D" corstone1000 aarch64 "
- CONFIG_SYS_LOAD_ADDR=3D0x82100000
-+CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
- CONFIG_DISTRO_DEFAULTS=3Dy
--CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=3Dy
--CONFIG_CUSTOM_SYS_INIT_SP_ADDR=3D0x83f00000
- CONFIG_FIT=3Dy
+@@ -15,7 +15,7 @@ CONFIG_DISTRO_DEFAULTS=3Dy
  CONFIG_BOOTDELAY=3D3
  CONFIG_USE_BOOTARGS=3Dy
  CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
@@ -41,7 +26,7 @@ index 1179bf5f3b..c38113ce95 100644
  CONFIG_CONSOLE_RECORD=3Dy
  CONFIG_LOGLEVEL=3D7
  # CONFIG_DISPLAY_CPUINFO is not set
-@@ -23,11 +25,15 @@ CONFIG_LOGLEVEL=3D7
+@@ -23,11 +23,15 @@ CONFIG_LOGLEVEL=3D7
  CONFIG_SYS_MAXARGS=3D64
  CONFIG_SYS_CBSIZE=3D512
  # CONFIG_CMD_CONSOLE is not set
@@ -57,18 +42,12 @@ index 1179bf5f3b..c38113ce95 100644
  CONFIG_CMD_USB=3Dy
  # CONFIG_CMD_SETEXPR is not set
  # CONFIG_CMD_NFS is not set
-@@ -39,27 +45,30 @@ CONFIG_OF_CONTROL=3Dy
- CONFIG_VERSION_VARIABLE=3Dy
- CONFIG_NET_RANDOM_ETHADDR=3Dy
+@@ -41,12 +45,7 @@ CONFIG_NET_RANDOM_ETHADDR=3Dy
  CONFIG_REGMAP=3Dy
--CONFIG_MISC=3Dy
-+CONFIG_ARM_FFA_TRANSPORT=3Dy
+ CONFIG_MISC=3Dy
  CONFIG_CLK=3Dy
 -CONFIG_CMD_MMC=3Dy
 -CONFIG_DM_MMC=3Dy
-+CONFIG_FWU_MDATA=3Dy
-+CONFIG_FWU_MDATA_GPT_BLK=3Dy
-+CONFIG_MISC=3Dy
  CONFIG_ARM_PL180_MMCI=3Dy
 -CONFIG_MMC_SDHCI_ADMA_HELPERS=3Dy
 -CONFIG_MMC_WRITE=3Dy
@@ -76,25 +55,21 @@ index 1179bf5f3b..c38113ce95 100644
  CONFIG_PHYLIB=3Dy
  CONFIG_PHY_SMSC=3Dy
  CONFIG_SMC911X=3Dy
-+CONFIG_NVMXIP_QSPI=3Dy
- CONFIG_PHY=3Dy
- CONFIG_RAM=3Dy
- CONFIG_DM_RTC=3Dy
- CONFIG_RTC_EMULATION=3Dy
- CONFIG_DM_SERIAL=3Dy
-+CONFIG_SYSRESET=3Dy
- CONFIG_USB=3Dy
- CONFIG_USB_ISP1760=3Dy
- CONFIG_ERRNO_STR=3Dy
- CONFIG_EFI_MM_COMM_TEE=3Dy
- CONFIG_ARM_FFA_TRANSPORT=3Dy
+@@ -65,4 +64,12 @@ CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
+ CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
  CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
-+CONFIG_EFI_CAPSULE_ON_DISK=3Dy
-+CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
  CONFIG_EFI_CAPSULE_FIRMWARE_FIT=3Dy
 -CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
++CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
++CONFIG_FWU_MDATA=3Dy
++CONFIG_FWU_MDATA_GPT_BLK=3Dy
++CONFIG_SYSRESET=3Dy
++CONFIG_EFI_CAPSULE_ON_DISK=3Dy
++CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
 +CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
 +# CONFIG_TOOLS_MKEFICAPSULE is not set
++CONFIG_DM_GPIO=3Dy
+\ No newline at end of file
 --=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-dri=
vers-mtd-nvmxip-introduce-NVM-XIP-block-storage-e.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0027-drivers-mtd-nvmxip-introduce-NV=
M-XIP-block-storage-e.patch
deleted file mode 100644
index 721ee156..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-drivers-mt=
d-nvmxip-introduce-NVM-XIP-block-storage-e.patch
+++ /dev/null
@@ -1,455 +0,0 @@
-From c7567aaf75a66e204d492a8f6e2a3b4bfb8a7e45 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Fri, 14 Apr 2023 13:23:25 +0100
-Subject: [PATCH 27/42] drivers/mtd/nvmxip: introduce NVM XIP block stora=
ge
- emulation
-
-add block storage emulation for NVM XIP flash devices
-
-Some paltforms such as Corstone-1000 need to see NVM XIP raw flash
-as a block storage device with read only capability.
-
-Here NVM flash devices are devices with addressable
-memory (e.g: QSPI NOR flash).
-
-The implementation is generic and can be used by different platforms.
-
-Two drivers are provided as follows.
-
-  nvmxip-blk :
-
-    a generic block driver allowing to read from the XIP flash
-
-  nvmxip Uclass driver :
-
-        When a device is described in the DT and associated with
-        UCLASS_NVMXIP, the Uclass creates a block device and binds it wi=
th
-	 the nvmxip-blk.
-
-Platforms can use multiple NVM XIP devices at the same time by defining =
a
-DT node for each one of them.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
----
- MAINTAINERS                         |   6 ++
- doc/develop/driver-model/index.rst  |   1 +
- doc/develop/driver-model/nvmxip.rst |  48 +++++++++++
- drivers/block/blk-uclass.c          |   1 +
- drivers/mtd/Kconfig                 |   2 +
- drivers/mtd/Makefile                |   1 +
- drivers/mtd/nvmxip/Kconfig          |  13 +++
- drivers/mtd/nvmxip/Makefile         |   7 ++
- drivers/mtd/nvmxip/nvmxip-uclass.c  |  67 ++++++++++++++++
- drivers/mtd/nvmxip/nvmxip.c         | 119 ++++++++++++++++++++++++++++
- drivers/mtd/nvmxip/nvmxip.h         |  32 ++++++++
- include/dm/uclass-id.h              |   1 +
- 12 files changed, 298 insertions(+)
- create mode 100644 doc/develop/driver-model/nvmxip.rst
- create mode 100644 drivers/mtd/nvmxip/Kconfig
- create mode 100644 drivers/mtd/nvmxip/Makefile
- create mode 100644 drivers/mtd/nvmxip/nvmxip-uclass.c
- create mode 100644 drivers/mtd/nvmxip/nvmxip.c
- create mode 100644 drivers/mtd/nvmxip/nvmxip.h
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index a2f60a3b93..1dbfab5f43 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -1202,6 +1202,12 @@ F:	cmd/nvme.c
- F:	include/nvme.h
- F:	doc/develop/driver-model/nvme.rst
-=20
-+NVMXIP
-+M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+S:	Maintained
-+F:	doc/develop/driver-model/nvmxip.rst
-+F:	drivers/mtd/nvmxip/
-+
- NVMEM
- M:	Sean Anderson <seanga2@gmail.com>
- S:	Maintained
-diff --git a/doc/develop/driver-model/index.rst b/doc/develop/driver-mod=
el/index.rst
-index 7366ef818c..8e12bbd936 100644
---- a/doc/develop/driver-model/index.rst
-+++ b/doc/develop/driver-model/index.rst
-@@ -20,6 +20,7 @@ subsystems
-    livetree
-    migration
-    nvme
-+   nvmxip
-    of-plat
-    pci-info
-    pmic-framework
-diff --git a/doc/develop/driver-model/nvmxip.rst b/doc/develop/driver-mo=
del/nvmxip.rst
-new file mode 100644
-index 0000000000..fe087b13d2
---- /dev/null
-+++ b/doc/develop/driver-model/nvmxip.rst
-@@ -0,0 +1,48 @@
-+.. SPDX-License-Identifier: GPL-2.0+
-+
-+NVM XIP Block Storage Emulation Driver
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+Summary
-+-------
-+
-+Non-Volatile Memory devices with addressable memory (e.g: QSPI NOR flas=
h) could
-+be used for block storage needs (e.g: parsing a GPT layout in a raw QSP=
I NOR flash).
-+
-+The NVMXIP Uclass provides this functionality and can be used for any 6=
4-bit platform.
-+
-+The NVMXIP Uclass provides the following drivers:
-+
-+      nvmxip-blk block driver:
-+
-+        A generic block driver allowing to read from the XIP flash.
-+	The driver belongs to UCLASS_BLK.
-+	The driver implemented by drivers/mtd/nvmxip/nvmxip.c
-+
-+      nvmxip Uclass driver:
-+
-+        When a device is described in the DT and associated with UCLASS=
_NVMXIP,
-+        the Uclass creates a block device and binds it with the nvmxip-=
blk.
-+	The Uclass driver implemented by drivers/mtd/nvmxip/nvmxip-uclass.c
-+
-+    The implementation is generic and can be used by different platform=
s.
-+
-+Supported hardware
-+--------------------------------
-+
-+Any 64-bit plaform.
-+
-+Configuration
-+----------------------
-+
-+config NVMXIP
-+	  This option allows the emulation of a block storage device
-+	  on top of a direct access non volatile memory XIP flash devices.
-+	  This support provides the read operation.
-+	  This option provides the block storage driver nvmxip-blk which
-+	  handles the read operation. This driver is HW agnostic and can suppo=
rt
-+	  multiple flash devices at the same time.
-+
-+Contributors
-+------------
-+   * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-diff --git a/drivers/block/blk-uclass.c b/drivers/block/blk-uclass.c
-index c69fc4d518..e8ab576c32 100644
---- a/drivers/block/blk-uclass.c
-+++ b/drivers/block/blk-uclass.c
-@@ -28,6 +28,7 @@ static struct {
- 	{ UCLASS_AHCI, "sata" },
- 	{ UCLASS_HOST, "host" },
- 	{ UCLASS_NVME, "nvme" },
-+	{ UCLASS_NVMXIP, "nvmxip" },
- 	{ UCLASS_EFI_MEDIA, "efi" },
- 	{ UCLASS_EFI_LOADER, "efiloader" },
- 	{ UCLASS_VIRTIO, "virtio" },
-diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
-index fcdb450f77..0537ac64e3 100644
---- a/drivers/mtd/Kconfig
-+++ b/drivers/mtd/Kconfig
-@@ -224,4 +224,6 @@ source "drivers/mtd/spi/Kconfig"
-=20
- source "drivers/mtd/ubi/Kconfig"
-=20
-+source "drivers/mtd/nvmxip/Kconfig"
-+
- endmenu
-diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
-index 3a78590aaa..c638980ea2 100644
---- a/drivers/mtd/Makefile
-+++ b/drivers/mtd/Makefile
-@@ -25,6 +25,7 @@ obj-y +=3D nand/
- obj-y +=3D onenand/
- obj-y +=3D spi/
- obj-$(CONFIG_MTD_UBI) +=3D ubi/
-+obj-$(CONFIG_NVMXIP) +=3D nvmxip/
-=20
- #SPL/TPL build
- else
-diff --git a/drivers/mtd/nvmxip/Kconfig b/drivers/mtd/nvmxip/Kconfig
-new file mode 100644
-index 0000000000..ef53fc3c79
---- /dev/null
-+++ b/drivers/mtd/nvmxip/Kconfig
-@@ -0,0 +1,13 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# Copyright 2023 Arm Limited and/or its affiliates <open-source-office@=
arm.com>
-+# Authors:
-+#   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+
-+config NVMXIP
-+	bool "NVM XIP devices support"
-+	select BLK
-+	help
-+	  This option allows the emulation of a block storage device
-+	  on top of a direct access non volatile memory XIP flash devices.
-+	  This support provides the read operation.
-diff --git a/drivers/mtd/nvmxip/Makefile b/drivers/mtd/nvmxip/Makefile
-new file mode 100644
-index 0000000000..07890982c7
---- /dev/null
-+++ b/drivers/mtd/nvmxip/Makefile
-@@ -0,0 +1,7 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# Copyright 2023 Arm Limited and/or its affiliates <open-source-office@=
arm.com>
-+# Authors:
-+#   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+
-+obj-y +=3D nvmxip-uclass.o nvmxip.o
-diff --git a/drivers/mtd/nvmxip/nvmxip-uclass.c b/drivers/mtd/nvmxip/nvm=
xip-uclass.c
-new file mode 100644
-index 0000000000..9f96041e3d
---- /dev/null
-+++ b/drivers/mtd/nvmxip/nvmxip-uclass.c
-@@ -0,0 +1,67 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright 2023 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <log.h>
-+#include <linux/bitops.h>
-+#include "nvmxip.h"
-+
-+/* LBA Macros */
-+
-+#define DEFAULT_LBA_SHIFT 10 /* 1024 bytes per block */
-+#define DEFAULT_LBA_COUNT 1024 /* block count */
-+
-+#define DEFAULT_LBA_SZ BIT(DEFAULT_LBA_SHIFT)
-+
-+/**
-+ * nvmxip_post_bind() - post binding treatments
-+ * @dev:	the NVMXIP device
-+ *
-+ * Create and probe a child block device.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int nvmxip_post_bind(struct udevice *udev)
-+{
-+	int ret;
-+	struct udevice *bdev =3D NULL;
-+	char bdev_name[NVMXIP_BLKDEV_NAME_SZ + 1];
-+	int devnum;
-+
-+	devnum =3D uclass_id_count(UCLASS_NVMXIP);
-+	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "blk#%d", devnum);
-+
-+	ret =3D blk_create_devicef(udev, NVMXIP_BLKDRV_NAME, bdev_name, UCLASS=
_NVMXIP,
-+				 devnum, DEFAULT_LBA_SZ,
-+				 DEFAULT_LBA_COUNT, &bdev);
-+	if (ret) {
-+		log_err("[%s]: failure during creation of the block device %s, error =
%d\n",
-+			udev->name, bdev_name, ret);
-+		return ret;
-+	}
-+
-+	ret =3D blk_probe_or_unbind(bdev);
-+	if (ret) {
-+		log_err("[%s]: failure during probing the block device %s, error %d\n=
",
-+			udev->name, bdev_name, ret);
-+		return ret;
-+	}
-+
-+	log_info("[%s]: the block device %s ready for use\n", udev->name, bdev=
_name);
-+
-+	return 0;
-+}
-+
-+UCLASS_DRIVER(nvmxip) =3D {
-+	.name	   =3D "nvmxip",
-+	.id	   =3D UCLASS_NVMXIP,
-+	.post_bind =3D nvmxip_post_bind,
-+};
-diff --git a/drivers/mtd/nvmxip/nvmxip.c b/drivers/mtd/nvmxip/nvmxip.c
-new file mode 100644
-index 0000000000..a359e3b482
---- /dev/null
-+++ b/drivers/mtd/nvmxip/nvmxip.c
-@@ -0,0 +1,119 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright 2023 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <log.h>
-+#include <mapmem.h>
-+#include <asm/io.h>
-+#include <linux/bitops.h>
-+#include <linux/errno.h>
-+#include "nvmxip.h"
-+
-+/**
-+ * nvmxip_mmio_rawread() - read from the XIP flash
-+ * @address:	address of the data
-+ * @value:	pointer to where storing the value read
-+ *
-+ * Read raw data from the XIP flash.
-+ *
-+ * Return:
-+ *
-+ * Always return 0.
-+ */
-+static int nvmxip_mmio_rawread(const phys_addr_t address, u64 *value)
-+{
-+	*value =3D readq(address);
-+	return 0;
-+}
-+
-+/**
-+ * nvmxip_blk_read() - block device read operation
-+ * @dev:	the block device
-+ * @blknr:	first block number to read from
-+ * @blkcnt:	number of blocks to read
-+ * @buffer:	destination buffer
-+ *
-+ * Read data from the block storage device.
-+ *
-+ * Return:
-+ *
-+ * number of blocks read on success. Otherwise, failure
-+ */
-+static ulong nvmxip_blk_read(struct udevice *dev, lbaint_t blknr, lbain=
t_t blkcnt, void *buffer)
-+{
-+	struct nvmxip_plat *plat =3D dev_get_plat(dev->parent);
-+	struct blk_desc *desc =3D dev_get_uclass_plat(dev);
-+	/* number of the u64 words to read */
-+	u32 qwords =3D (blkcnt * desc->blksz) / sizeof(u64);
-+	/* physical address of the first block to read */
-+	phys_addr_t blkaddr =3D plat->phys_base + blknr * desc->blksz;
-+	u64 *virt_blkaddr;
-+	u64 *pdst =3D buffer;
-+	uint qdata_idx;
-+
-+	if (!pdst)
-+		return -EINVAL;
-+
-+	log_debug("[%s]: reading from blknr: %lu , blkcnt: %lu\n", dev->name, =
blknr, blkcnt);
-+
-+	virt_blkaddr =3D map_sysmem(blkaddr, 0);
-+
-+	/* assumption: the data is virtually contiguous */
-+
-+	for (qdata_idx =3D 0 ; qdata_idx < qwords ; qdata_idx++)
-+		nvmxip_mmio_rawread((phys_addr_t)(virt_blkaddr + qdata_idx), pdst++);
-+
-+	log_debug("[%s]:     src[0]: 0x%llx , dst[0]: 0x%llx , src[-1]: 0x%llx=
 , dst[-1]: 0x%llx\n",
-+		  dev->name,
-+		  *virt_blkaddr,
-+		  *(u64 *)buffer,
-+		  *(u64 *)((u8 *)virt_blkaddr + desc->blksz * blkcnt - sizeof(u64)),
-+		  *(u64 *)((u8 *)buffer + desc->blksz * blkcnt - sizeof(u64)));
-+
-+	unmap_sysmem(virt_blkaddr);
-+
-+	return blkcnt;
-+}
-+
-+/**
-+ * nvmxip_blk_probe() - block storage device probe
-+ * @dev:	the block storage device
-+ *
-+ * Initialize the block storage descriptor.
-+ *
-+ * Return:
-+ *
-+ * Always return 0.
-+ */
-+static int nvmxip_blk_probe(struct udevice *dev)
-+{
-+	struct nvmxip_plat *plat =3D dev_get_plat(dev->parent);
-+	struct blk_desc *desc =3D dev_get_uclass_plat(dev);
-+
-+	desc->lba =3D plat->lba;
-+	desc->log2blksz =3D plat->lba_shift;
-+	desc->blksz =3D BIT(plat->lba_shift);
-+	desc->bdev =3D dev;
-+
-+	log_debug("[%s]: block storage layout\n    lbas: %lu , log2blksz: %d, =
blksz: %lu\n",
-+		  dev->name, desc->lba, desc->log2blksz, desc->blksz);
-+
-+	return 0;
-+}
-+
-+static const struct blk_ops nvmxip_blk_ops =3D {
-+	.read	=3D nvmxip_blk_read,
-+};
-+
-+U_BOOT_DRIVER(nvmxip_blk) =3D {
-+	.name	=3D NVMXIP_BLKDRV_NAME,
-+	.id	=3D UCLASS_BLK,
-+	.probe	=3D nvmxip_blk_probe,
-+	.ops	=3D &nvmxip_blk_ops,
-+};
-diff --git a/drivers/mtd/nvmxip/nvmxip.h b/drivers/mtd/nvmxip/nvmxip.h
-new file mode 100644
-index 0000000000..f4ef37725d
---- /dev/null
-+++ b/drivers/mtd/nvmxip/nvmxip.h
-@@ -0,0 +1,32 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * Copyright 2023 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __DRIVER_NVMXIP_H__
-+#define __DRIVER_NVMXIP_H__
-+
-+#include <blk.h>
-+
-+#define NVMXIP_BLKDRV_NAME    "nvmxip-blk"
-+#define NVMXIP_BLKDEV_NAME_SZ 20
-+
-+/**
-+ * struct nvmxip_plat - the NVMXIP driver plat
-+ *
-+ * @phys_base:	NVM XIP device base address
-+ * @lba_shift:	block size shift count
-+ * @lba:	number of blocks
-+ *
-+ * The NVMXIP information read from the DT.
-+ */
-+struct nvmxip_plat {
-+	phys_addr_t phys_base;
-+	u32 lba_shift;
-+	lbaint_t lba;
-+};
-+
-+#endif /* __DRIVER_NVMXIP_H__ */
-diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
-index fa08a66ac8..f3564a49d9 100644
---- a/include/dm/uclass-id.h
-+++ b/include/dm/uclass-id.h
-@@ -92,6 +92,7 @@ enum uclass_id {
- 	UCLASS_NOP,		/* No-op devices */
- 	UCLASS_NORTHBRIDGE,	/* Intel Northbridge / SDRAM controller */
- 	UCLASS_NVME,		/* NVM Express device */
-+	UCLASS_NVMXIP,		/* NVM XIP devices */
- 	UCLASS_P2SB,		/* (x86) Primary-to-Sideband Bus */
- 	UCLASS_PANEL,		/* Display panel, such as an LCD */
- 	UCLASS_PANEL_BACKLIGHT,	/* Backlight controller for panel */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-dri=
vers-mtd-nvmxip-introduce-QSPI-XIP-driver.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0028-drivers-mtd-nvmxip-introduce-QSPI-XIP-d=
river.patch
deleted file mode 100644
index aa3db9cb..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-drivers-mt=
d-nvmxip-introduce-QSPI-XIP-driver.patch
+++ /dev/null
@@ -1,271 +0,0 @@
-From 4b71ade0e8e5ad3692b1decb5c1d0c9472827535 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Fri, 14 Apr 2023 13:44:25 +0100
-Subject: [PATCH 28/42] drivers/mtd/nvmxip: introduce QSPI XIP driver
-
-add nvmxip_qspi driver under UCLASS_NVMXIP
-
-The device associated with this driver is the parent of the blk#<id> dev=
ice
-nvmxip_qspi can be reused by other platforms. If the platform
-has custom settings to apply before using the flash, then the platform
-can provide its own parent driver belonging to UCLASS_NVMXIP and reuse
-nvmxip-blk driver. The custom driver can be implemented like nvmxip_qspi=
 in
-addition to the platform custom settings.
-
-Platforms can use multiple NVM XIP devices at the same time by defining =
a
-DT node for each one of them.
-
-For more details please refer to doc/develop/driver-model/nvmxip_qspi.rs=
t
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
----
- MAINTAINERS                                   |  1 +
- doc/develop/driver-model/nvmxip.rst           | 45 +++++++++++-
- .../nvmxip/nvmxip_qspi.txt                    | 56 +++++++++++++++
- drivers/mtd/nvmxip/Kconfig                    |  6 ++
- drivers/mtd/nvmxip/Makefile                   |  1 +
- drivers/mtd/nvmxip/nvmxip_qspi.c              | 70 +++++++++++++++++++
- 6 files changed, 178 insertions(+), 1 deletion(-)
- create mode 100644 doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
- create mode 100644 drivers/mtd/nvmxip/nvmxip_qspi.c
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 1dbfab5f43..f81654346e 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -1206,6 +1206,7 @@ NVMXIP
- M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
- S:	Maintained
- F:	doc/develop/driver-model/nvmxip.rst
-+F:	doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
- F:	drivers/mtd/nvmxip/
-=20
- NVMEM
-diff --git a/doc/develop/driver-model/nvmxip.rst b/doc/develop/driver-mo=
del/nvmxip.rst
-index fe087b13d2..09afdbcccf 100644
---- a/doc/develop/driver-model/nvmxip.rst
-+++ b/doc/develop/driver-model/nvmxip.rst
-@@ -25,7 +25,33 @@ The NVMXIP Uclass provides the following drivers:
-         the Uclass creates a block device and binds it with the nvmxip-=
blk.
- 	The Uclass driver implemented by drivers/mtd/nvmxip/nvmxip-uclass.c
-=20
--    The implementation is generic and can be used by different platform=
s.
-+      nvmxip_qspi driver :
-+
-+        The driver probed with the DT and is the parent of the blk#<id>=
 device.
-+        nvmxip_qspi can be reused by other platforms. If the platform
-+        has custom settings to apply before using the flash, then the p=
latform
-+        can provide its own parent driver belonging to UCLASS_NVMXIP an=
d reuse
-+        nvmxip-blk. The custom driver can be implemented like nvmxip_qs=
pi in
-+        addition to the platform custom settings.
-+	The nvmxip_qspi driver belongs to UCLASS_NVMXIP.
-+	The driver implemented by drivers/mtd/nvmxip/nvmxip_qspi.c
-+
-+	For example, if we have two NVMXIP devices described in the DT
-+	The devices hierarchy is as follows:
-+
-+::
-+
-+   =3D> dm tree
-+
-+        Class     Index  Probed  Driver                Name
-+    -----------------------------------------------------------
-+    ...
-+     nvmxip        0  [ + ]   nvmxip_qspi           |-- nvmxip-qspi1@08=
000000
-+     blk           3  [ + ]   nvmxip-blk                    |   `-- nvm=
xip-qspi1@08000000.blk#1
-+     nvmxip        1  [ + ]   nvmxip_qspi           |-- nvmxip-qspi2@08=
200000
-+     blk           4  [ + ]   nvmxip-blk                    |   `-- nvm=
xip-qspi2@08200000.blk#2
-+
-+The implementation is generic and can be used by different platforms.
-=20
- Supported hardware
- --------------------------------
-@@ -43,6 +69,23 @@ config NVMXIP
- 	  handles the read operation. This driver is HW agnostic and can suppo=
rt
- 	  multiple flash devices at the same time.
-=20
-+config NVMXIP_QSPI
-+	  This option allows the emulation of a block storage device on top of=
 a QSPI XIP flash.
-+	  Any platform that needs to emulate one or multiple QSPI XIP flash de=
vices can turn this
-+	  option on to enable the functionality. NVMXIP config is selected aut=
omatically.
-+	  Platforms that need to add custom treatments before accessing to the=
 flash, can
-+	  write their own driver (same as nvmxip_qspi in addition to the custo=
m settings).
-+
-+Device Tree nodes
-+--------------------
-+
-+Multiple QSPI XIP flash devices can be used at the same time by describ=
ing them through DT
-+nodes.
-+
-+Please refer to the documentation of the DT binding at:
-+
-+doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
-+
- Contributors
- ------------
-    * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-diff --git a/doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt b/doc/devic=
e-tree-bindings/nvmxip/nvmxip_qspi.txt
-new file mode 100644
-index 0000000000..cc60e9efdc
---- /dev/null
-+++ b/doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
-@@ -0,0 +1,56 @@
-+Specifying NVMXIP information for devices
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+QSPI XIP flash device nodes
-+---------------------------
-+
-+Each flash device should have its own node.
-+
-+Each node must specify the following fields:
-+
-+1)
-+		compatible =3D "nvmxip,qspi";
-+
-+This allows to bind the flash device with the nvmxip_qspi driver
-+If a platform has its own driver, please provide your own compatible
-+string.
-+
-+2)
-+		reg =3D <0x0 0x08000000 0x0 0x00200000>;
-+
-+The start address and size of the flash device. The values give here ar=
e an
-+example (when the cell size is 2).
-+
-+When cell size is 1, the reg field looks like this:
-+
-+		reg =3D <0x08000000 0x00200000>;
-+
-+3)
-+
-+		lba_shift =3D <9>;
-+
-+The number of bit shifts used to calculate the size in bytes of one blo=
ck.
-+In this example the block size is 1 << 9 =3D 2 ^ 9 =3D 512 bytes
-+
-+4)
-+
-+		lba =3D <4096>;
-+
-+The number of blocks.
-+
-+Example of multiple flash devices
-+----------------------------------------------------
-+
-+	nvmxip-qspi1@08000000 {
-+		compatible =3D "nvmxip,qspi";
-+		reg =3D <0x0 0x08000000 0x0 0x00200000>;
-+		lba_shift =3D <9>;
-+		lba =3D <4096>;
-+	};
-+
-+	nvmxip-qspi2@08200000 {
-+		compatible =3D "nvmxip,qspi";
-+		reg =3D <0x0 0x08200000 0x0 0x00100000>;
-+		lba_shift =3D <9>;
-+		lba =3D <2048>;
-+	};
-diff --git a/drivers/mtd/nvmxip/Kconfig b/drivers/mtd/nvmxip/Kconfig
-index ef53fc3c79..3ef7105026 100644
---- a/drivers/mtd/nvmxip/Kconfig
-+++ b/drivers/mtd/nvmxip/Kconfig
-@@ -11,3 +11,9 @@ config NVMXIP
- 	  This option allows the emulation of a block storage device
- 	  on top of a direct access non volatile memory XIP flash devices.
- 	  This support provides the read operation.
-+
-+config NVMXIP_QSPI
-+	bool "QSPI XIP  support"
-+	select NVMXIP
-+	help
-+	  This option allows the emulation of a block storage device on top of=
 a QSPI XIP flash
-diff --git a/drivers/mtd/nvmxip/Makefile b/drivers/mtd/nvmxip/Makefile
-index 07890982c7..54eacc102e 100644
---- a/drivers/mtd/nvmxip/Makefile
-+++ b/drivers/mtd/nvmxip/Makefile
-@@ -5,3 +5,4 @@
- #   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-=20
- obj-y +=3D nvmxip-uclass.o nvmxip.o
-+obj-$(CONFIG_NVMXIP_QSPI) +=3D nvmxip_qspi.o
-diff --git a/drivers/mtd/nvmxip/nvmxip_qspi.c b/drivers/mtd/nvmxip/nvmxi=
p_qspi.c
-new file mode 100644
-index 0000000000..7221fd1cb4
---- /dev/null
-+++ b/drivers/mtd/nvmxip/nvmxip_qspi.c
-@@ -0,0 +1,70 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright 2023 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <fdt_support.h>
-+#include <linux/errno.h>
-+#include "nvmxip.h"
-+
-+#include <asm/global_data.h>
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+#define NVMXIP_QSPI_DRV_NAME "nvmxip_qspi"
-+
-+/**
-+ * nvmxip_qspi_of_to_plat() -read from DT
-+ * @dev:	the NVMXIP device
-+ *
-+ * Read from the DT the NVMXIP information.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int nvmxip_qspi_of_to_plat(struct udevice *dev)
-+{
-+	struct nvmxip_plat *plat =3D dev_get_plat(dev);
-+	int ret;
-+
-+	plat->phys_base =3D (phys_addr_t)dev_read_addr(dev);
-+	if (plat->phys_base =3D=3D FDT_ADDR_T_NONE) {
-+		log_err("[%s]: can not get base address from device tree\n", dev->nam=
e);
-+		return -EINVAL;
-+	}
-+
-+	ret =3D dev_read_u32(dev, "lba_shift", &plat->lba_shift);
-+	if (ret) {
-+		log_err("[%s]: can not get lba_shift from device tree\n", dev->name);
-+		return -EINVAL;
-+	}
-+
-+	ret =3D dev_read_u32(dev, "lba", (u32 *)&plat->lba);
-+	if (ret) {
-+		log_err("[%s]: can not get lba from device tree\n", dev->name);
-+		return -EINVAL;
-+	}
-+
-+	log_debug("[%s]: XIP device base addr: 0x%llx , lba_shift: %d , lbas: =
%lu\n",
-+		  dev->name, plat->phys_base, plat->lba_shift, plat->lba);
-+
-+	return 0;
-+}
-+
-+static const struct udevice_id nvmxip_qspi_ids[] =3D {
-+	{ .compatible =3D "nvmxip,qspi" },
-+	{ /* sentinel */ }
-+};
-+
-+U_BOOT_DRIVER(nvmxip_qspi) =3D {
-+	.name =3D NVMXIP_QSPI_DRV_NAME,
-+	.id =3D UCLASS_NVMXIP,
-+	.of_match =3D nvmxip_qspi_ids,
-+	.of_to_plat =3D nvmxip_qspi_of_to_plat,
-+	.plat_auto =3D sizeof(struct nvmxip_plat),
-+};
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-nvm=
xip-move-header-to-include.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0028-nvmxip-move-header-to-include.patch
similarity index 82%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-nvmx=
ip-move-header-to-include.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-nvmxip=
-move-header-to-include.patch
index b745fe9b..aac5a1d2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-nvmxip-mov=
e-header-to-include.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-nvmxip-mov=
e-header-to-include.patch
@@ -1,7 +1,7 @@
-From d280414229d7bbee368f40be6cde17e4f251dd0f Mon Sep 17 00:00:00 2001
+From 050c2d8577fd98f20c8b96dab3e4c42c8508b6bc Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 9 Jun 2023 13:31:53 +0100
-Subject: [PATCH 39/42] nvmxip: move header to include
+Subject: [PATCH 28/33] nvmxip: move header to include
=20
 Move header to include to allow external code
 to get the internal bdev structures to access
@@ -20,10 +20,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  rename {drivers/mtd/nvmxip =3D> include}/nvmxip.h (100%)
=20
 diff --git a/disk/part.c b/disk/part.c
-index 5ee60a7fb5..593dd0004f 100644
+index 35300df590..f57dce7a29 100644
 --- a/disk/part.c
 +++ b/disk/part.c
-@@ -270,6 +270,9 @@ static void print_part_header(const char *type, stru=
ct blk_desc *dev_desc)
+@@ -271,6 +271,9 @@ static void print_part_header(const char *type, stru=
ct blk_desc *dev_desc)
  	case UCLASS_NVME:
  		puts ("NVMe");
  		break;
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-set-kernel_addr-based-on-boot_idx.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0029-corstone1000-set-kernel_addr-based-on=
-boot_idx.patch
similarity index 89%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cors=
tone1000-set-kernel_addr-based-on-boot_idx.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corsto=
ne1000-set-kernel_addr-based-on-boot_idx.patch
index ba2e5e17..6ad46485 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-set-kernel_addr-based-on-boot_idx.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-set-kernel_addr-based-on-boot_idx.patch
@@ -1,7 +1,7 @@
-From e7cb997fd59c883572994b504dbc77bc670de8f7 Mon Sep 17 00:00:00 2001
+From c547f3335ddff71a7f4915dc0c99ccbcdbf24b54 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 23 Feb 2023 10:35:00 +0000
-Subject: [PATCH 40/42] corstone1000: set kernel_addr based on boot_idx
+Date: Tue, 18 Jul 2023 12:14:47 +0100
+Subject: [PATCH 29/33] corstone1000: set kernel_addr based on boot_idx
=20
 We need to distinguish between boot banks and from which
 partition to load the kernel+initramfs to memory.
@@ -19,17 +19,19 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  3 files changed, 58 insertions(+), 9 deletions(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 0a58ccd99c..b767195ccc 100644
+index ba6d024b80..a045262ebb 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
-@@ -5,13 +5,23 @@
+@@ -5,15 +5,25 @@
   * Rui Miguel Silva <rui.silva@linaro.org>
   */
 =20
 +#include <blk.h>
  #include <common.h>
+ #include <cpu_func.h>
  #include <dm.h>
 +#include <env.h>
+ #include <fwu.h>
  #include <netdev.h>
 +#include <nvmxip.h>
 +#include <part.h>
@@ -46,9 +48,9 @@ index 0a58ccd99c..b767195ccc 100644
  static struct mm_region corstone1000_mem_map[] =3D {
  	{
  		/* CVM */
-@@ -108,5 +118,51 @@ int dram_init_banksize(void)
+@@ -110,5 +120,51 @@ int dram_init_banksize(void)
 =20
- void fwu_plat_get_bootidx(int *boot_idx)
+ void fwu_plat_get_bootidx(uint *boot_idx)
  {
 -	*boot_idx =3D 0;
 +	*boot_idx =3D corstone1000_boot_idx;
@@ -117,10 +119,10 @@ index a6ee496221..ee318b1b1c 100644
 -	fi;
  kernel_addr_r=3D0x88200000
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index c38113ce95..20359cb181 100644
+index 4c75a01818..0232131a11 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -22,6 +22,7 @@ CONFIG_CONSOLE_RECORD=3Dy
+@@ -20,6 +20,7 @@ CONFIG_CONSOLE_RECORD=3Dy
  CONFIG_LOGLEVEL=3D7
  # CONFIG_DISPLAY_CPUINFO is not set
  # CONFIG_DISPLAY_BOARDINFO is not set
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-san=
dbox64-fix-return-unsigned-long-in-readq.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0029-sandbox64-fix-return-unsigned-long-in-re=
adq.patch
deleted file mode 100644
index c90bcc78..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-sandbox64-=
fix-return-unsigned-long-in-readq.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1b80dfbefd59c8ddff77960552d6c0cc2747758c Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Fri, 16 Dec 2022 17:20:58 +0000
-Subject: [PATCH 29/42] sandbox64: fix: return unsigned long in readq()
-
-make readq return unsigned long
-
-readq should return 64-bit data
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
----
- arch/sandbox/cpu/cpu.c        | 2 +-
- arch/sandbox/include/asm/io.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/sandbox/cpu/cpu.c b/arch/sandbox/cpu/cpu.c
-index 636d3545b9..248d17a85c 100644
---- a/arch/sandbox/cpu/cpu.c
-+++ b/arch/sandbox/cpu/cpu.c
-@@ -230,7 +230,7 @@ phys_addr_t map_to_sysmem(const void *ptr)
- 	return mentry->tag;
- }
-=20
--unsigned int sandbox_read(const void *addr, enum sandboxio_size_t size)
-+unsigned long sandbox_read(const void *addr, enum sandboxio_size_t size=
)
- {
- 	struct sandbox_state *state =3D state_get_current();
-=20
-diff --git a/arch/sandbox/include/asm/io.h b/arch/sandbox/include/asm/io=
.h
-index ad6c29a4e2..31ab7289b4 100644
---- a/arch/sandbox/include/asm/io.h
-+++ b/arch/sandbox/include/asm/io.h
-@@ -45,7 +45,7 @@ static inline void unmap_sysmem(const void *vaddr)
- /* Map from a pointer to our RAM buffer */
- phys_addr_t map_to_sysmem(const void *ptr);
-=20
--unsigned int sandbox_read(const void *addr, enum sandboxio_size_t size)=
;
-+unsigned long sandbox_read(const void *addr, enum sandboxio_size_t size=
);
- void sandbox_write(void *addr, unsigned int val, enum sandboxio_size_t =
size);
-=20
- #define readb(addr) sandbox_read((const void *)addr, SB_SIZE_8)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cor=
stone1000-boot-index-from-active.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0030-corstone1000-boot-index-from-active.patch
similarity index 64%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cors=
tone1000-boot-index-from-active.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corsto=
ne1000-boot-index-from-active.patch
index f0e14942..e59a434b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone10=
00-boot-index-from-active.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone10=
00-boot-index-from-active.patch
@@ -1,7 +1,7 @@
-From ab07a26290e44fb198403b658b8f1550e959a0cc Mon Sep 17 00:00:00 2001
+From faeeeecba2a7c8c507280ce369e3779f7c63d1e4 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 27 Feb 2023 14:40:13 +0000
-Subject: [PATCH 41/42] corstone1000: boot index from active
+Subject: [PATCH 30/33] corstone1000: boot index from active
=20
 In our platform, the Secure Enclave is the one who control
 all the boot tries and status, so, every time we get here
@@ -9,17 +9,18 @@ we know that the we are booting from the active index.
=20
 Upstream-Status: Pending
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 ---
- board/armltd/corstone1000/corstone1000.c | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
+ board/armltd/corstone1000/corstone1000.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index b767195ccc..db508ac3cb 100644
+index a045262ebb..53c65506d5 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
-@@ -118,7 +118,18 @@ int dram_init_banksize(void)
+@@ -120,7 +120,16 @@ int dram_init_banksize(void)
 =20
- void fwu_plat_get_bootidx(int *boot_idx)
+ void fwu_plat_get_bootidx(uint *boot_idx)
  {
 -	*boot_idx =3D corstone1000_boot_idx;
 +	int ret;
@@ -31,9 +32,7 @@ index b767195ccc..db508ac3cb 100644
 +	 */
 +	ret =3D fwu_get_active_index(boot_idx);
 +	if (ret < 0)
-+		log_err("corstone1000: failed to read active index\n");
-+
-+	return ret;
++		log_err("corstone1000: failed to read active index err %d\n", ret);
  }
 =20
  int board_late_init(void)
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-san=
dbox64-add-support-for-NVMXIP-QSPI.patch b/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot/corstone1000/0030-sandbox64-add-support-for-NVMXIP-QSPI.patch
deleted file mode 100644
index 941e9d10..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-sandbox64-=
add-support-for-NVMXIP-QSPI.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From 25467e433f02f40f5999ed6e6b0d3adb4c9cf16d Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Fri, 9 Jun 2023 13:08:37 +0100
-Subject: [PATCH 30/42] sandbox64: add support for NVMXIP QSPI
-
-enable NVMXIP QSPI for sandbox 64-bit
-
-Adding two NVM XIP QSPI storage devices.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Reviewed-by: Simon Glass <sjg@chromium.org>
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v2:
-
-* address nits
----
- arch/sandbox/dts/sandbox64.dts                  | 13 +++++++++++++
- arch/sandbox/dts/test.dts                       | 14 ++++++++++++++
- configs/sandbox64_defconfig                     |  3 ++-
- doc/develop/driver-model/nvmxip.rst             |  2 +-
- doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt |  6 +++---
- drivers/mtd/nvmxip/nvmxip-uclass.c              |  7 +++++++
- 6 files changed, 40 insertions(+), 5 deletions(-)
-
-diff --git a/arch/sandbox/dts/sandbox64.dts b/arch/sandbox/dts/sandbox64=
.dts
-index 3eb0457089..c9a2f4b4a4 100644
---- a/arch/sandbox/dts/sandbox64.dts
-+++ b/arch/sandbox/dts/sandbox64.dts
-@@ -89,6 +89,19 @@
- 		cs-gpios =3D <0>, <&gpio_a 0>;
- 	};
-=20
-+	nvmxip-qspi1@08000000 {
-+		compatible =3D "nvmxip,qspi";
-+		reg =3D /bits/ 64 <0x08000000 0x00200000>;
-+		lba_shift =3D <9>;
-+		lba =3D <4096>;
-+	};
-+
-+	nvmxip-qspi2@08200000 {
-+		compatible =3D "nvmxip,qspi";
-+		reg =3D /bits/ 64 <0x08200000 0x00100000>;
-+		lba_shift =3D <9>;
-+		lba =3D <2048>;
-+	};
- };
-=20
- #include "sandbox.dtsi"
-diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
-index dffe10adbf..c3ba0a225e 100644
---- a/arch/sandbox/dts/test.dts
-+++ b/arch/sandbox/dts/test.dts
-@@ -1745,6 +1745,20 @@
- 		compatible =3D "u-boot,fwu-mdata-gpt";
- 		fwu-mdata-store =3D <&mmc0>;
- 	};
-+
-+	nvmxip-qspi1@08000000 {
-+		compatible =3D "nvmxip,qspi";
-+		reg =3D <0x08000000 0x00200000>;
-+		lba_shift =3D <9>;
-+		lba =3D <4096>;
-+	};
-+
-+	nvmxip-qspi2@08200000 {
-+		compatible =3D "nvmxip,qspi";
-+		reg =3D <0x08200000 0x00100000>;
-+		lba_shift =3D <9>;
-+		lba =3D <2048>;
-+	};
- };
-=20
- #include "sandbox_pmic.dtsi"
-diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
-index 4b8a1ec42b..2dca176ae3 100644
---- a/configs/sandbox64_defconfig
-+++ b/configs/sandbox64_defconfig
-@@ -260,4 +260,5 @@ CONFIG_UNIT_TEST=3Dy
- CONFIG_UT_TIME=3Dy
- CONFIG_UT_DM=3Dy
- CONFIG_ARM_FFA_TRANSPORT=3Dy
--CONFIG_SANDBOX_FFA=3Dy
-\ No newline at end of file
-+CONFIG_SANDBOX_FFA=3Dy
-+CONFIG_NVMXIP_QSPI=3Dy
-\ No newline at end of file
-diff --git a/doc/develop/driver-model/nvmxip.rst b/doc/develop/driver-mo=
del/nvmxip.rst
-index 09afdbcccf..e85dc220b9 100644
---- a/doc/develop/driver-model/nvmxip.rst
-+++ b/doc/develop/driver-model/nvmxip.rst
-@@ -56,7 +56,7 @@ The implementation is generic and can be used by diffe=
rent platforms.
- Supported hardware
- --------------------------------
-=20
--Any 64-bit plaform.
-+Any plaform supporting readq().
-=20
- Configuration
- ----------------------
-diff --git a/doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt b/doc/devic=
e-tree-bindings/nvmxip/nvmxip_qspi.txt
-index cc60e9efdc..882728d541 100644
---- a/doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
-+++ b/doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
-@@ -16,7 +16,7 @@ If a platform has its own driver, please provide your =
own compatible
- string.
-=20
- 2)
--		reg =3D <0x0 0x08000000 0x0 0x00200000>;
-+		reg =3D /bits/ 64 <0x08000000 0x00200000>;
-=20
- The start address and size of the flash device. The values give here ar=
e an
- example (when the cell size is 2).
-@@ -43,14 +43,14 @@ Example of multiple flash devices
-=20
- 	nvmxip-qspi1@08000000 {
- 		compatible =3D "nvmxip,qspi";
--		reg =3D <0x0 0x08000000 0x0 0x00200000>;
-+		reg =3D /bits/ 64 <0x08000000 0x00200000>;
- 		lba_shift =3D <9>;
- 		lba =3D <4096>;
- 	};
-=20
- 	nvmxip-qspi2@08200000 {
- 		compatible =3D "nvmxip,qspi";
--		reg =3D <0x0 0x08200000 0x0 0x00100000>;
-+		reg =3D /bits/ 64 <0x08200000 0x00100000>;
- 		lba_shift =3D <9>;
- 		lba =3D <2048>;
- 	};
-diff --git a/drivers/mtd/nvmxip/nvmxip-uclass.c b/drivers/mtd/nvmxip/nvm=
xip-uclass.c
-index 9f96041e3d..6d8eb177b5 100644
---- a/drivers/mtd/nvmxip/nvmxip-uclass.c
-+++ b/drivers/mtd/nvmxip/nvmxip-uclass.c
-@@ -9,6 +9,9 @@
- #include <common.h>
- #include <dm.h>
- #include <log.h>
-+#if CONFIG_IS_ENABLED(SANDBOX64)
-+#include <asm/test.h>
-+#endif
- #include <linux/bitops.h>
- #include "nvmxip.h"
-=20
-@@ -36,6 +39,10 @@ static int nvmxip_post_bind(struct udevice *udev)
- 	char bdev_name[NVMXIP_BLKDEV_NAME_SZ + 1];
- 	int devnum;
-=20
-+#if CONFIG_IS_ENABLED(SANDBOX64)
-+	sandbox_set_enable_memio(true);
-+#endif
-+
- 	devnum =3D uclass_id_count(UCLASS_NVMXIP);
- 	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "blk#%d", devnum);
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-cor=
stone1000-add-NVM-XIP-QSPI-device-tree-node.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0031-corstone1000-add-NVM-XIP-QSPI-device-=
tree-node.patch
deleted file mode 100644
index 08e9d317..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone10=
00-add-NVM-XIP-QSPI-device-tree-node.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 635848c90343a1b8a268519e3fc78ef7af2e4819 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 19 Dec 2022 13:20:19 +0000
-Subject: [PATCH 31/42] corstone1000: add NVM XIP QSPI device tree node
-
-add QSPI flash device node for block storage access
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
----
- arch/arm/dts/corstone1000.dtsi | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 61e0c33247..18c4d1e19a 100644
---- a/arch/arm/dts/corstone1000.dtsi
-+++ b/arch/arm/dts/corstone1000.dtsi
-@@ -1,6 +1,6 @@
- // SPDX-License-Identifier: GPL-2.0 or MIT
- /*
-- * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
-  * Copyright (c) 2022, Linaro Limited. All rights reserved.
-  *
-  */
-@@ -38,6 +38,13 @@
- 		reg =3D <0x88200000 0x77e00000>;
- 	};
-=20
-+	nvmxip-qspi@08000000 {
-+		compatible =3D "nvmxip,qspi";
-+		reg =3D <0x08000000 0x2000000>;
-+		lba_shift =3D <9>;
-+		lba =3D <65536>;
-+	};
-+
- 	gic: interrupt-controller@1c000000 {
- 		compatible =3D "arm,gic-400";
- 		#interrupt-cells =3D <3>;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-cor=
stone1000-enable-PSCI-reset.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone1000/0031-corstone1000-enable-PSCI-reset.patch
similarity index 50%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-cors=
tone1000-enable-PSCI-reset.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corsto=
ne1000-enable-PSCI-reset.patch
index cad830f4..9ba0205c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-corstone10=
00-enable-PSCI-reset.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone10=
00-enable-PSCI-reset.patch
@@ -1,7 +1,7 @@
-From 8bf48a56aa014146a8950532906b06e191754daa Mon Sep 17 00:00:00 2001
+From 0524aa417c4989bf03366f13a2456b3bcb72fb87 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 24 May 2023 09:12:11 +0100
-Subject: [PATCH 42/42] corstone1000: enable PSCI reset
+Date: Tue, 18 Jul 2023 12:19:17 +0100
+Subject: [PATCH 31/33] corstone1000: enable PSCI reset
=20
 Even though corstone1000 does not implement entire PSCI APIs,it relies o=
n
 PSCI reset interface for the system reset. U-boot change the config name=
, so we
@@ -10,21 +10,22 @@ need to enable it again.
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 ---
- configs/corstone1000_defconfig | 1 +
- 1 file changed, 1 insertion(+)
+ configs/corstone1000_defconfig | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 20359cb181..19fe1432ae 100644
+index 0232131a11..ccd558cfce 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -62,6 +62,7 @@ CONFIG_DM_RTC=3Dy
- CONFIG_RTC_EMULATION=3Dy
- CONFIG_DM_SERIAL=3Dy
- CONFIG_SYSRESET=3Dy
+@@ -73,4 +73,5 @@ CONFIG_EFI_CAPSULE_ON_DISK=3Dy
+ CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
+ CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
+ # CONFIG_TOOLS_MKEFICAPSULE is not set
+-CONFIG_DM_GPIO=3Dy
+\ No newline at end of file
++CONFIG_DM_GPIO=3Dy
 +CONFIG_SYSRESET_PSCI=3Dy
- CONFIG_USB=3Dy
- CONFIG_USB_ISP1760=3Dy
- CONFIG_ERRNO_STR=3Dy
+\ No newline at end of file
 --=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Ena=
ble-EFI-set-get-time-services.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0032-Enable-EFI-set-get-time-services.patch
similarity index 52%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Enab=
le-EFI-set-get-time-services.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-Enable=
-EFI-set-get-time-services.patch
index 8911abfe..acc35f17 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-Enable-EFI=
-set-get-time-services.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-Enable-EFI=
-set-get-time-services.patch
@@ -1,7 +1,7 @@
-From 9f326f0db8aa13fde93e2ed79055b920c8598a28 Mon Sep 17 00:00:00 2001
+From 0ba2b25a9c1dd9c63615bf6830cfb470f33a31b5 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Mon, 12 Jun 2023 15:14:52 +0000
-Subject: [PATCH] Enable EFI set/get time services
+Date: Tue, 18 Jul 2023 12:21:39 +0100
+Subject: [PATCH 32/33] Enable EFI set/get time services
=20
 SetTime_Conf and SetTime_Func tests in UEFI SCT test suite of ACS
 fails with unsupported return value. CONFIG_EFI_SET_TIME and
@@ -10,23 +10,24 @@ services.
=20
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 ---
- configs/corstone1000_defconfig | 2 ++
- 1 file changed, 2 insertions(+)
+ configs/corstone1000_defconfig | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index c692cc91bd..f1901dfe8b 100644
+index ccd558cfce..a0af413de8 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -7,6 +7,8 @@ CONFIG_NR_DRAM_BANKS=3D1
- CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=3Dy
- CONFIG_CUSTOM_SYS_INIT_SP_ADDR=3D0x83f00000
+@@ -74,4 +74,6 @@ CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
+ CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
+ # CONFIG_TOOLS_MKEFICAPSULE is not set
  CONFIG_DM_GPIO=3Dy
+-CONFIG_SYSRESET_PSCI=3Dy
+\ No newline at end of file
++CONFIG_SYSRESET_PSCI=3Dy
 +CONFIG_EFI_SET_TIME=3Dy
 +CONFIG_EFI_GET_TIME=3Dy
- CONFIG_DEFAULT_DEVICE_TREE=3D"corstone1000-mps3"
- CONFIG_SYS_PROMPT=3D"corstone1000# "
- CONFIG_IDENT_STRING=3D" corstone1000 aarch64 "
 --=20
-2.17.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-san=
dbox64-add-a-test-case-for-UCLASS_NVMXIP.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0032-sandbox64-add-a-test-case-for-UCLASS_NVM=
XIP.patch
deleted file mode 100644
index 923eac9b..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-sandbox64-=
add-a-test-case-for-UCLASS_NVMXIP.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From 0ecb61da60febc66e589d6fbf439478af1c88283 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 12 Jun 2023 17:33:54 +0100
-Subject: [PATCH 32/42] sandbox64: add a test case for UCLASS_NVMXIP
-
-provide a test for NVM XIP devices
-
-The test case allows to make sure of the following:
-
-- The NVM XIP QSPI devices are probed
-- The DT entries are read correctly
-- the data read from the flash by the NVMXIP block driver is correct
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
-
-Changelog:
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-v2:
-
-* address nits
----
- MAINTAINERS      |   1 +
- test/dm/Makefile |   6 +-
- test/dm/nvmxip.c | 145 +++++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 151 insertions(+), 1 deletion(-)
- create mode 100644 test/dm/nvmxip.c
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index f81654346e..6692ce9974 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -1208,6 +1208,7 @@ S:	Maintained
- F:	doc/develop/driver-model/nvmxip.rst
- F:	doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
- F:	drivers/mtd/nvmxip/
-+F:	test/dm/nvmxip.c
-=20
- NVMEM
- M:	Sean Anderson <seanga2@gmail.com>
-diff --git a/test/dm/Makefile b/test/dm/Makefile
-index 85e99e1c12..963fa927f7 100644
---- a/test/dm/Makefile
-+++ b/test/dm/Makefile
-@@ -1,7 +1,7 @@
- # SPDX-License-Identifier: GPL-2.0+
- #
- # Copyright (c) 2013 Google, Inc
--# (C) Copyright 2022 ARM Limited
-+# Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
-=20
- obj-$(CONFIG_UT_DM) +=3D test-dm.o
-=20
-@@ -18,6 +18,10 @@ obj-$(CONFIG_UT_DM) +=3D test-uclass.o
- obj-$(CONFIG_UT_DM) +=3D core.o
- obj-$(CONFIG_UT_DM) +=3D read.o
- obj-$(CONFIG_UT_DM) +=3D phys2bus.o
-+ifeq ($(CONFIG_NVMXIP_QSPI)$(CONFIG_SANDBOX64),yy)
-+obj-y +=3D nvmxip.o
-+endif
-+
- ifneq ($(CONFIG_SANDBOX),)
- ifeq ($(CONFIG_ACPIGEN),y)
- obj-y +=3D acpi.o
-diff --git a/test/dm/nvmxip.c b/test/dm/nvmxip.c
-new file mode 100644
-index 0000000000..e934748eb5
---- /dev/null
-+++ b/test/dm/nvmxip.c
-@@ -0,0 +1,145 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Functional tests for UCLASS_FFA  class
-+ *
-+ * Copyright 2023 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
-+ *
-+ * Authors:
-+ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <blk.h>
-+#include <console.h>
-+#include <dm.h>
-+#include <mapmem.h>
-+#include <dm/test.h>
-+#include <linux/bitops.h>
-+#include <test/test.h>
-+#include <test/ut.h>
-+#include "../../drivers/mtd/nvmxip/nvmxip.h"
-+
-+/* NVMXIP devices described in the device tree */
-+#define SANDBOX_NVMXIP_DEVICES 2
-+
-+/* reference device tree data for the probed devices */
-+static struct nvmxip_plat nvmqspi_refdata[SANDBOX_NVMXIP_DEVICES] =3D {
-+	{0x08000000, 9, 4096}, {0x08200000, 9, 2048}
-+};
-+
-+#define NVMXIP_BLK_START_PATTERN 0x1122334455667788ULL
-+#define NVMXIP_BLK_END_PATTERN 0xa1a2a3a4a5a6a7a8ULL
-+
-+/**
-+ * dm_nvmxip_flash_sanity() - check flash data
-+ * @uts: test state
-+ * @device_idx:	the NVMXIP device index
-+ * @buffer:	the user buffer where the blocks data is copied to
-+ *
-+ * Mode 1: When buffer is NULL, initialize the flash with pattern data =
at the start
-+ * and at the end of each block. This pattern data will be used to chec=
k data consistency
-+ * when verifying the data read.
-+ * Mode 2: When the user buffer is provided in the argument (not NULL),=
 compare the data
-+ * of the start and the end of each block in the user buffer with the e=
xpected pattern data.
-+ * Return an error when the check fails.
-+ *
-+ * Return:
-+ *
-+ * 0 on success. Otherwise, failure
-+ */
-+static int dm_nvmxip_flash_sanity(struct unit_test_state *uts, u8 devic=
e_idx, void *buffer)
-+{
-+	int i;
-+	u64 *ptr;
-+	u8 *base;
-+	unsigned long blksz;
-+
-+	blksz =3D BIT(nvmqspi_refdata[device_idx].lba_shift);
-+
-+	if (!buffer) {
-+		/* Mode 1: point at the flash start address. Pattern data will be wri=
tten */
-+		base =3D map_sysmem(nvmqspi_refdata[device_idx].phys_base, 0);
-+	} else {
-+		/* Mode 2: point at the user buffer containing the data read and to b=
e verified */
-+		base =3D buffer;
-+	}
-+
-+	for (i =3D 0; i < nvmqspi_refdata[device_idx].lba ; i++) {
-+		ptr =3D (u64 *)(base + i * blksz);
-+
-+		/* write an 8 bytes pattern at the start of the current block */
-+		if (!buffer)
-+			*ptr =3D NVMXIP_BLK_START_PATTERN;
-+		else
-+			ut_asserteq_64(NVMXIP_BLK_START_PATTERN, *ptr);
-+
-+		ptr =3D (u64 *)((u8 *)ptr + blksz - sizeof(u64));
-+
-+		/* write an 8 bytes pattern at the end of the current block */
-+		if (!buffer)
-+			*ptr =3D NVMXIP_BLK_END_PATTERN;
-+		else
-+			ut_asserteq_64(NVMXIP_BLK_END_PATTERN, *ptr);
-+	}
-+
-+	if (!buffer)
-+		unmap_sysmem(base);
-+
-+	return 0;
-+}
-+
-+/**
-+ * dm_test_nvmxip() - check flash data
-+ * @uts: test state
-+ * Return:
-+ *
-+ * CMD_RET_SUCCESS on success. Otherwise, failure
-+ */
-+static int dm_test_nvmxip(struct unit_test_state *uts)
-+{
-+	struct nvmxip_plat *plat_data =3D NULL;
-+	struct udevice *dev =3D NULL, *bdev =3D NULL;
-+	u8 device_idx;
-+	void *buffer =3D NULL;
-+	unsigned long flashsz;
-+
-+	/* set the flash content first for both devices */
-+	dm_nvmxip_flash_sanity(uts, 0, NULL);
-+	dm_nvmxip_flash_sanity(uts, 1, NULL);
-+
-+	/* probing all NVM XIP QSPI devices */
-+	for (device_idx =3D 0, uclass_first_device(UCLASS_NVMXIP, &dev);
-+	     dev;
-+	     uclass_next_device(&dev), device_idx++) {
-+		plat_data =3D dev_get_plat(dev);
-+
-+		/* device tree entries checks */
-+		ut_assertok(nvmqspi_refdata[device_idx].phys_base !=3D plat_data->phy=
s_base);
-+		ut_assertok(nvmqspi_refdata[device_idx].lba_shift !=3D plat_data->lba=
_shift);
-+		ut_assertok(nvmqspi_refdata[device_idx].lba !=3D plat_data->lba);
-+
-+		/* before reading all the flash blocks, let's calculate the flash siz=
e */
-+		flashsz =3D plat_data->lba << plat_data->lba_shift;
-+
-+		/* allocate the user buffer where to copy the blocks data to */
-+		buffer =3D calloc(flashsz, 1);
-+		ut_assertok(!buffer);
-+
-+		/* the block device is the child of the parent device probed with DT =
*/
-+		ut_assertok(device_find_first_child(dev, &bdev));
-+
-+		/* reading all the flash blocks */
-+		ut_asserteq(plat_data->lba, blk_read(bdev, 0, plat_data->lba, buffer)=
);
-+
-+		/* compare the data read from flash with the expected data */
-+		dm_nvmxip_flash_sanity(uts, device_idx, buffer);
-+
-+		free(buffer);
-+	}
-+
-+	ut_assertok(device_idx !=3D SANDBOX_NVMXIP_DEVICES);
-+
-+	return CMD_RET_SUCCESS;
-+}
-+
-+DM_TEST(dm_test_nvmxip, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-cor=
stone1000-add-boot-index.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/c=
orstone1000/0035-corstone1000-add-boot-index.patch
deleted file mode 100644
index d9568563..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-corstone10=
00-add-boot-index.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 92948559987d02baf9f690d9bbdc96d1179264ef Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 1 Feb 2023 16:15:30 +0000
-Subject: [PATCH 36/42] corstone1000: add boot index
-
-it is expected that the firmware that runs before
-u-boot somehow provide the information of the bank
-(index) of it is booting.
-We will need to extend tf-a to pass that info,
-meanwhile just set it to the default bank.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- board/armltd/corstone1000/corstone1000.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index d6ca6e8961..0a58ccd99c 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -106,6 +106,7 @@ int dram_init_banksize(void)
- 	return 0;
- }
-=20
--void reset_cpu(ulong addr)
-+void fwu_plat_get_bootidx(int *boot_idx)
- {
-+	*boot_idx =3D 0;
- }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-cor=
stone1000-fix-compilation-warnings-in-fwu_plat_get_bootidx.patch b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone1000-fix-compi=
lation-warnings-in-fwu_plat_get_bootidx.patch
deleted file mode 100644
index e574103e..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone10=
00-fix-compilation-warnings-in-fwu_plat_get_bootidx.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From dfebda98ce08d0cab411521ab3d9e832ed1b4608 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 15 Jun 2023 16:51:49 +0100
-Subject: [PATCH] corstone1000: fix compilation warnings in
- fwu_plat_get_bootidx()
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- board/armltd/corstone1000/corstone1000.c | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index db508ac3cb..2e1ace5d04 100644
---- a/board/armltd/corstone1000/corstone1000.c
-+++ b/board/armltd/corstone1000/corstone1000.c
-@@ -9,6 +9,7 @@
- #include <common.h>
- #include <dm.h>
- #include <env.h>
-+#include <fwu.h>
- #include <netdev.h>
- #include <nvmxip.h>
- #include <part.h>
-@@ -116,7 +117,7 @@ int dram_init_banksize(void)
- 	return 0;
- }
-=20
--void fwu_plat_get_bootidx(int *boot_idx)
-+void fwu_plat_get_bootidx(uint *boot_idx)
- {
- 	int ret;
-=20
-@@ -127,9 +128,7 @@ void fwu_plat_get_bootidx(int *boot_idx)
- 	 */
- 	ret =3D fwu_get_active_index(boot_idx);
- 	if (ret < 0)
--		log_err("corstone1000: failed to read active index\n");
--
--	return ret;
-+		log_err("corstone1000: failed to read active index err %d\n", ret);
- }
-=20
- int board_late_init(void)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 07ba7a18..41d2830f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -18,49 +18,38 @@ EXTRA_OEMAKE:append:corstone1000 =3D ' DEVICE_TREE=3D=
${CORSTONE1000_DEVICE_TREE}'
 SYSROOT_DIRS:append:corstone1000 =3D " /boot"
=20
 SRC_URI:append:corstone1000 =3D " \
-        file://0001-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe=
.patch            \=20
-        file://0002-lib-uuid-introduce-uuid_str_to_le_bin-function.patch=
		  \=20
-        file://0003-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch			=
  \=20
-        file://0004-arm_ffa-efi-unmap-RX-TX-buffers.patch				  \=20
-        file://0005-arm_ffa-introduce-armffa-command.patch				  \=20
-        file://0006-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch			  =
\=20
-        file://0007-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.=
patch		  \=20
-        file://0008-arm_ffa-introduce-armffa-command-Sandbox-test.patch	=
		  \=20
-        file://0009-arm_ffa-efi-introduce-FF-A-MM-communication.patch			=
  \=20
-        file://0010-arm_ffa-efi-corstone1000-enable-MM-communication.pat=
ch		  \=20
-        file://0011-efi-corstone1000-introduce-EFI-capsule-update.patch	=
		  \=20
-        file://0012-arm-corstone1000-fix-unrecognized-filesystem-type.pa=
tch		  \=20
-        file://0013-efi_capsule-corstone1000-pass-interface-id-and-buffe=
.patch		  \=20
-        file://0014-efi_boottime-corstone1000-pass-interface-id-and-kern=
.patch		  \=20
-        file://0015-efi_loader-corstone1000-remove-guid-check-from-corst=
.patch		  \=20
-        file://0016-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op=
.patch		  \=20
-        file://0017-efi_firmware-add-get_image_info-for-corstone1000.pat=
ch		  \=20
-        file://0018-efi_loader-send-bootcomplete-message-to-secure-encla=
.patch		  \=20
-        file://0019-efi_loader-fix-null-pointer-exception-with-get_image=
.patch		  \=20
-        file://0020-arm-corstone1000-add-mmc-for-fvp.patch				  \=20
-        file://0021-corstone1000-add-compressed-kernel-support.patch			 =
 \=20
-        file://0022-Introduce-external-sys-driver-to-device-tree.patch		=
	  \=20
-        file://0023-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch=
		  \=20
-        file://0024-arm-corstone1000-esrt-support.patch					  \=20
-        file://0025-efi_setup-discover-FF-A-bus-before-raising-EFI-start=
.patch		  \=20
-        file://0026-corstone1000-enable-distro-booting-command.patch			 =
 \=20
-        file://0027-drivers-mtd-nvmxip-introduce-NVM-XIP-block-storage-e=
.patch		  \=20
-        file://0028-drivers-mtd-nvmxip-introduce-QSPI-XIP-driver.patch		=
	  \=20
-        file://0029-sandbox64-fix-return-unsigned-long-in-readq.patch			=
  \=20
-        file://0030-sandbox64-add-support-for-NVMXIP-QSPI.patch				  \=20
-        file://0031-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch=
		  \=20
-        file://0032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch			=
  \=20
-        file://0033-corstone1000-add-fwu-metadata-store-info.patch			  \=
=20
-        file://0034-fwu_metadata-make-sure-structures-are-packed.patch		=
	  \=20
-        file://0035-corstone1000-add-boot-index.patch					  \=20
-        file://0036-corstone1000-adjust-boot-bank-and-kernel-location.pa=
tch		  \=20
-        file://0037-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.pa=
tch		  \=20
-        file://0038-nvmxip-move-header-to-include.patch					  \=20
-        file://0039-corstone1000-set-kernel_addr-based-on-boot_idx.patch=
		  \=20
-        file://0040-corstone1000-boot-index-from-active.patch				  \=20
-        file://0041-corstone1000-enable-PSCI-reset.patch				  \
-        file://0042-Enable-EFI-set-get-time-services.patch              =
                  \
-        file://0043-corstone1000-fix-compilation-warnings-in-fwu_plat_ge=
t_bootidx.patch   \=20
+        file://0001-FF-A-v15-arm64-smccc-add-support-for-SMCCCv1.2-x0-x1=
.patch    \
+        file://0002-FF-A-v15-lib-uuid-introduce-uuid_str_to_le_bin-funct=
.patch	  \
+        file://0003-FF-A-v15-lib-uuid-introduce-testcase-for-uuid_str_to=
.patch	  \
+	file://0004-FF-A-v15-arm_ffa-introduce-Arm-FF-A-support.patch		  \
+	file://0005-FF-A-v15-arm_ffa-introduce-armffa-command.patch		  \
+	file://0006-FF-A-v15-arm_ffa-introduce-sandbox-FF-A-support.patch	  \
+        file://0007-FF-A-v15-arm_ffa-introduce-sandbox-test-cases-for-UC=
.patch	  \
+        file://0008-FF-A-v15-arm_ffa-introduce-armffa-command-Sandbox-te=
.patch	  \
+	file://0009-FF-A-v15-arm_ffa-efi-introduce-FF-A-MM-communication.patch	=
  \
+	file://0010-FF-A-v15-arm_ffa-efi-corstone1000-enable-MM-communic.patch	=
  \
+	file://0011-efi-corstone1000-fwu-introduce-EFI-capsule-update.patch	  \
+	file://0012-arm-corstone1000-fix-unrecognized-filesystem-type.patch	  \
+	file://0013-efi_loader-corstone1000-remove-guid-check-from-corst.patch	=
  \
+	file://0014-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch	=
  \
+	file://0015-efi_firmware-add-get_image_info-for-corstone1000.patch	  \
+	file://0016-efi_loader-fix-null-pointer-exception-with-get_image.patch	=
  \
+	file://0017-arm-corstone1000-add-mmc-for-fvp.patch			  \
+	file://0018-corstone1000-add-compressed-kernel-support.patch		  \
+	file://0019-Introduce-external-sys-driver-to-device-tree.patch		  \
+	file://0020-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch	  \
+	file://0021-arm-corstone1000-esrt-support.patch			  \
+	file://0022-corstone1000-enable-distro-booting-command.patch		  \
+	file://0023-corstone1000-add-fwu-metadata-store-info.patch		  \
+	file://0024-fwu_metadata-make-sure-structures-are-packed.patch		  \
+	file://0025-corstone1000-add-boot-index.patch				  \
+	file://0026-corstone1000-adjust-boot-bank-and-kernel-location.patch	  \
+	file://0027-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch	  \
+	file://0028-nvmxip-move-header-to-include.patch			  \
+	file://0029-corstone1000-set-kernel_addr-based-on-boot_idx.patch	  \
+	file://0030-corstone1000-boot-index-from-active.patch			  \
+	file://0031-corstone1000-enable-PSCI-reset.patch			  \
+	file://0032-Enable-EFI-set-get-time-services.patch			  \
         "
=20
 #
--=20
2.25.1


