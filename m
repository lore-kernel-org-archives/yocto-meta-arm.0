Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436D0C7EE2E
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 10:47:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9994.1686653259525184037
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 03:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E55671FB;
	Tue, 13 Jun 2023 03:48:23 -0700 (PDT)
Received: from e130802.cambridge.arm.com (e130802.arm.com [10.1.38.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C84E3F71E;
	Tue, 13 Jun 2023 03:47:37 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH] arm-bsp/u-boot: corstone1000: upgrade NVMXIP support
Date: Tue, 13 Jun 2023 11:47:28 +0100
Message-Id: <20230613104728.25894-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 10:47:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4766

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

The patchset has been merged in U-Boot master
(https://github.com/u-boot/u-boot/commit/c9c2c95d4cd27fe0cd41fe13a863899d=
268f973c)

This commit upgrades the NVMXIP patches with the merged ones.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...support-for-SMCCCv1.2-x0-x17-registe.patch |  12 +-
 ...ntroduce-uuid_str_to_le_bin-function.patch |  10 +-
 ...-introduce-Arm-FF-A-low-level-driver.patch |  30 +-
 ...0004-arm_ffa-efi-unmap-RX-TX-buffers.patch |   8 +-
 ...005-arm_ffa-introduce-armffa-command.patch |  16 +-
 ...fa-introduce-the-FF-A-Sandbox-driver.patch |  30 +-
 ...ce-Sandbox-test-cases-for-UCLASS_FFA.patch |  12 +-
 ...ntroduce-armffa-command-Sandbox-test.patch |  12 +-
 ...-efi-introduce-FF-A-MM-communication.patch |  12 +-
 ...corstone1000-enable-MM-communication.patch |  10 +-
 ...one1000-introduce-EFI-capsule-update.patch |  20 +-
 ...000-fix-unrecognized-filesystem-type.patch |   8 +-
 ...tone1000-pass-interface-id-and-buffe.patch |  10 +-
 ...stone1000-pass-interface-id-and-kern.patch |   8 +-
 ...one1000-remove-guid-check-from-corst.patch |   8 +-
 ...ate-ESRT-table-if-EFI_ESRT-config-op.patch |   8 +-
 ...-add-get_image_info-for-corstone1000.patch |   8 +-
 ...bootcomplete-message-to-secure-encla.patch |  14 +-
 ...ull-pointer-exception-with-get_image.patch |   8 +-
 ...020-arm-corstone1000-add-mmc-for-fvp.patch |  12 +-
 ...ne1000-add-compressed-kernel-support.patch |   8 +-
 ...e-external-sys-driver-to-device-tree.patch |   8 +-
 ...d-rpmsg-client-to-u-boot-device-tree.patch |   8 +-
 .../0024-arm-corstone1000-esrt-support.patch  |  12 +-
 ...er-FF-A-bus-before-raising-EFI-start.patch |   8 +-
 ...ne1000-enable-distro-booting-command.patch |   8 +-
 ...ip-introduce-NVM-XIP-block-storage-e.patch | 455 ++++++++++++++
 ...ntroduce-NVM-XIP-block-storage-emula.patch | 595 ------------------
 ...mtd-nvmxip-introduce-QSPI-XIP-driver.patch | 271 ++++++++
 ...andbox64-add-support-for-NVMXIP-QSPI.patch | 113 ----
 ...4-fix-return-unsigned-long-in-readq.patch} |  13 +-
 ...andbox64-add-support-for-NVMXIP-QSPI.patch | 161 +++++
 ...0-add-NVM-XIP-QSPI-device-tree-node.patch} |  23 +-
 ...rstone1000-enable-NVM-XIP-QSPI-flash.patch |  29 -
 ...64-add-a-test-case-for-UCLASS_NVMXIP.patch | 125 ++--
 ...one1000-add-fwu-metadata-store-info.patch} |   8 +-
 ...-provide-a-u-boot-shell-test-command.patch | 135 ----
 ...me-allow-to-reset-a-path-after-boot.patch} |   8 +-
 ...ata-make-sure-structures-are-packed.patch} |   8 +-
 ...035-nvmxip-shorter-block-device-name.patch |  44 --
 ...=3D> 0036-corstone1000-add-boot-index.patch} |   8 +-
 ...djust-boot-bank-and-kernel-location.patch} |   8 +-
 ...dd-nvmxip-fwu-mdata-and-gpt-options.patch} |  23 +-
 ... 0039-nvmxip-move-header-to-include.patch} |  20 +-
 ...0-set-kernel_addr-based-on-boot_idx.patch} |  12 +-
 ...corstone1000-boot-index-from-active.patch} |   8 +-
 ...0042-corstone1000-enable-PSCI-reset.patch} |  12 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  86 ++-
 48 files changed, 1245 insertions(+), 1228 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
027-drivers-mtd-nvmxip-introduce-NVM-XIP-block-storage-e.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
027-drivers-nvmxip-introduce-NVM-XIP-block-storage-emula.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
028-drivers-mtd-nvmxip-introduce-QSPI-XIP-driver.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
029-sandbox64-add-support-for-NVMXIP-QSPI.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0028-sandbox=
64-fix-return-unsigned-long-in-readq.patch =3D> 0029-sandbox64-fix-return=
-unsigned-long-in-readq.patch} (81%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
030-sandbox64-add-support-for-NVMXIP-QSPI.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0030-corston=
e1000-add-NVM-XIP-QSPI-device-tree-node.patch =3D> 0031-corstone1000-add-=
NVM-XIP-QSPI-device-tree-node.patch} (51%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
031-corstone1000-enable-NVM-XIP-QSPI-flash.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0034-corston=
e1000-add-fwu-metadata-store-info.patch =3D> 0033-corstone1000-add-fwu-me=
tadata-store-info.patch} (83%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
033-nvmxip-provide-a-u-boot-shell-test-command.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0036-efi_boo=
ttime-allow-to-reset-a-path-after-boot.patch =3D> 0034-efi_boottime-allow=
-to-reset-a-path-after-boot.patch} (83%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0037-fwu_met=
adata-make-sure-structures-are-packed.patch =3D> 0035-fwu_metadata-make-s=
ure-structures-are-packed.patch} (87%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
035-nvmxip-shorter-block-device-name.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0038-corston=
e1000-add-boot-index.patch =3D> 0036-corstone1000-add-boot-index.patch} (=
83%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0039-corston=
e1000-adjust-boot-bank-and-kernel-location.patch =3D> 0037-corstone1000-a=
djust-boot-bank-and-kernel-location.patch} (86%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-corston=
e1000-add-nvmxip-fwu-mdata-and-gpt-options.patch =3D> 0038-corstone1000-a=
dd-nvmxip-fwu-mdata-and-gpt-options.patch} (85%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0041-nvmxip-=
move-header-to-include.patch =3D> 0039-nvmxip-move-header-to-include.patc=
h} (62%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0042-corston=
e1000-set-kernel_addr-based-on-boot_idx.patch =3D> 0040-corstone1000-set-=
kernel_addr-based-on-boot_idx.patch} (93%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0043-corston=
e1000-boot-index-from-active.patch =3D> 0041-corstone1000-boot-index-from=
-active.patch} (87%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0044-corston=
e1000-enable-psci-reset.patch =3D> 0042-corstone1000-enable-PSCI-reset.pa=
tch} (78%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm=
64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0001-arm64-smccc-add-support-for-SMC=
CCv1.2-x0-x17-registe.patch
index 64c1b95b..23f50198 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm64-smcc=
c-add-support-for-SMCCCv1.2-x0-x17-registe.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm64-smcc=
c-add-support-for-SMCCCv1.2-x0-x17-registe.patch
@@ -1,7 +1,7 @@
-From f1f1780630302e1d7cab95d1c6dc32e2fc0bdd70 Mon Sep 17 00:00:00 2001
+From 5ce8bf4ad1aeb2657a7ab83c46eeb2cdaa56cfd4 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 29 Jul 2022 13:06:19 +0100
-Subject: [PATCH 01/27] arm64: smccc: add support for SMCCCv1.2 x0-x17
+Subject: [PATCH 01/42] arm64: smccc: add support for SMCCCv1.2 x0-x17
  registers
=20
 add support for x0-x17 registers used by the SMC calls
@@ -48,7 +48,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  3 files changed, 110 insertions(+)
=20
 diff --git a/arch/arm/cpu/armv8/smccc-call.S b/arch/arm/cpu/armv8/smccc-=
call.S
-index dc92b28777c3..ec6f299bc929 100644
+index dc92b28777..ec6f299bc9 100644
 --- a/arch/arm/cpu/armv8/smccc-call.S
 +++ b/arch/arm/cpu/armv8/smccc-call.S
 @@ -1,6 +1,8 @@
@@ -116,7 +116,7 @@ index dc92b28777c3..ec6f299bc929 100644
 +
 +#endif
 diff --git a/arch/arm/lib/asm-offsets.c b/arch/arm/lib/asm-offsets.c
-index 22fd541f9a28..db6d7ed23428 100644
+index 22fd541f9a..db6d7ed234 100644
 --- a/arch/arm/lib/asm-offsets.c
 +++ b/arch/arm/lib/asm-offsets.c
 @@ -9,6 +9,9 @@
@@ -148,7 +148,7 @@ index 22fd541f9a28..db6d7ed23428 100644
 =20
  	return 0;
 diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index e1d09884a1c5..9105031d55d3 100644
+index e1d09884a1..9105031d55 100644
 --- a/include/linux/arm-smccc.h
 +++ b/include/linux/arm-smccc.h
 @@ -1,6 +1,8 @@
@@ -209,5 +209,5 @@ index e1d09884a1c5..9105031d55d3 100644
   * struct arm_smccc_quirk - Contains quirk information
   * @id: quirk identification
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib=
-uuid-introduce-uuid_str_to_le_bin-function.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0002-lib-uuid-introduce-uuid_str_to_le_bin=
-function.patch
index 4cba24dd..5c0c61e5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib-uuid-i=
ntroduce-uuid_str_to_le_bin-function.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib-uuid-i=
ntroduce-uuid_str_to_le_bin-function.patch
@@ -1,7 +1,7 @@
-From 9fe30f542939824f731fda3991a1d4f66fbf3b4b Mon Sep 17 00:00:00 2001
+From 1dcebf6f57e3490f7b3e2464b4114b993dd70c7c Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 4 Aug 2022 16:46:47 +0100
-Subject: [PATCH 02/27] lib: uuid: introduce uuid_str_to_le_bin function
+Subject: [PATCH 02/42] lib: uuid: introduce uuid_str_to_le_bin function
=20
 convert UUID string to little endian binary data
=20
@@ -42,7 +42,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  2 files changed, 54 insertions(+)
=20
 diff --git a/include/uuid.h b/include/uuid.h
-index 4a4883d3b5b6..293a8eb0a579 100644
+index 4a4883d3b5..293a8eb0a5 100644
 --- a/include/uuid.h
 +++ b/include/uuid.h
 @@ -2,6 +2,8 @@
@@ -66,7 +66,7 @@ index 4a4883d3b5b6..293a8eb0a579 100644
 +
  #endif
 diff --git a/lib/uuid.c b/lib/uuid.c
-index 465e1ac38f57..d29f561a70df 100644
+index 465e1ac38f..d29f561a70 100644
 --- a/lib/uuid.c
 +++ b/lib/uuid.c
 @@ -1,6 +1,8 @@
@@ -130,5 +130,5 @@ index 465e1ac38f57..d29f561a70df 100644
   * uuid_bin_to_str() - convert big endian binary data to string UUID or=
 GUID.
   *
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm=
_ffa-introduce-Arm-FF-A-low-level-driver.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0003-arm_ffa-introduce-Arm-FF-A-low-level-dri=
ver.patch
index dd55a73b..f76c74b6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-in=
troduce-Arm-FF-A-low-level-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-in=
troduce-Arm-FF-A-low-level-driver.patch
@@ -1,7 +1,7 @@
-From 69cfd14c37bee479eb3cb7e6dd2df23f460f0713 Mon Sep 17 00:00:00 2001
+From 77cf1f517f6d92d5e3efb40d8335adb03b289525 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Nov 2022 14:40:05 +0000
-Subject: [PATCH 03/27] arm_ffa: introduce Arm FF-A low-level driver
+Subject: [PATCH 03/42] arm_ffa: introduce Arm FF-A low-level driver
=20
 Add the core driver implementing Arm Firmware Framework for Armv8-A v1.0
=20
@@ -134,7 +134,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  create mode 100644 include/arm_ffa.h
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 3fc4cd0f12d3..509619d31ce6 100644
+index 3fc4cd0f12..509619d31c 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
 @@ -264,6 +264,13 @@ F:	drivers/net/cortina_ni.h
@@ -153,7 +153,7 @@ index 3fc4cd0f12d3..509619d31ce6 100644
  M:	Fabio Estevam <festevam@gmail.com>
 diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
 new file mode 100644
-index 000000000000..dfcec82e456e
+index 0000000000..dfcec82e45
 --- /dev/null
 +++ b/doc/arch/arm64.ffa.rst
 @@ -0,0 +1,218 @@
@@ -376,7 +376,7 @@ index 000000000000..dfcec82e456e
 +------------
 +   * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 diff --git a/doc/arch/index.rst b/doc/arch/index.rst
-index b3e85f9bf347..cf1cfc9287c2 100644
+index b3e85f9bf3..cf1cfc9287 100644
 --- a/doc/arch/index.rst
 +++ b/doc/arch/index.rst
 @@ -8,6 +8,7 @@ Architecture-specific doc
@@ -388,7 +388,7 @@ index b3e85f9bf347..cf1cfc9287c2 100644
     mips
     nios2
 diff --git a/drivers/Kconfig b/drivers/Kconfig
-index 75ac149d3118..ff75b7c3f883 100644
+index 75ac149d31..ff75b7c3f8 100644
 --- a/drivers/Kconfig
 +++ b/drivers/Kconfig
 @@ -6,6 +6,8 @@ source "drivers/core/Kconfig"
@@ -401,7 +401,7 @@ index 75ac149d3118..ff75b7c3f883 100644
 =20
  source "drivers/axi/Kconfig"
 diff --git a/drivers/Makefile b/drivers/Makefile
-index 6f1de58e0030..28c8f538c83a 100644
+index 6f1de58e00..28c8f538c8 100644
 --- a/drivers/Makefile
 +++ b/drivers/Makefile
 @@ -112,6 +112,7 @@ obj-y +=3D iommu/
@@ -414,7 +414,7 @@ index 6f1de58e0030..28c8f538c83a 100644
  obj-$(CONFIG_W1) +=3D w1/
 diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
 new file mode 100644
-index 000000000000..e4914b9bc779
+index 0000000000..e4914b9bc7
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/Kconfig
 @@ -0,0 +1,30 @@
@@ -450,7 +450,7 @@ index 000000000000..e4914b9bc779
 +
 diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
 new file mode 100644
-index 000000000000..043a8915bec5
+index 0000000000..043a8915be
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/Makefile
 @@ -0,0 +1,6 @@
@@ -462,7 +462,7 @@ index 000000000000..043a8915bec5
 +obj-y +=3D arm-ffa-uclass.o core.o
 diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
 new file mode 100644
-index 000000000000..7d9695d28922
+index 0000000000..7d9695d289
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
 @@ -0,0 +1,16 @@
@@ -484,7 +484,7 @@ index 000000000000..7d9695d28922
 +};
 diff --git a/drivers/firmware/arm-ffa/arm_ffa_prv.h b/drivers/firmware/a=
rm-ffa/arm_ffa_prv.h
 new file mode 100644
-index 000000000000..4eea7dc03604
+index 0000000000..4eea7dc036
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/arm_ffa_prv.h
 @@ -0,0 +1,200 @@
@@ -690,7 +690,7 @@ index 000000000000..4eea7dc03604
 +#endif
 diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/=
core.c
 new file mode 100644
-index 000000000000..0b1f8e6a078d
+index 0000000000..0b1f8e6a07
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/core.c
 @@ -0,0 +1,1315 @@
@@ -2011,7 +2011,7 @@ index 000000000000..0b1f8e6a078d
 +};
 diff --git a/include/arm_ffa.h b/include/arm_ffa.h
 new file mode 100644
-index 000000000000..74b16174c292
+index 0000000000..74b16174c2
 --- /dev/null
 +++ b/include/arm_ffa.h
 @@ -0,0 +1,97 @@
@@ -2113,7 +2113,7 @@ index 000000000000..74b16174c292
 +
 +#endif
 diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
-index 376f741cc2bb..fa08a66ac8e0 100644
+index 376f741cc2..fa08a66ac8 100644
 --- a/include/dm/uclass-id.h
 +++ b/include/dm/uclass-id.h
 @@ -4,6 +4,9 @@
@@ -2135,5 +2135,5 @@ index 376f741cc2bb..fa08a66ac8e0 100644
  	UCLASS_FPGA,		/* FPGA device */
  	UCLASS_FUZZING_ENGINE,	/* Fuzzing engine */
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm=
_ffa-efi-unmap-RX-TX-buffers.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-bo=
ot/corstone1000/0004-arm_ffa-efi-unmap-RX-TX-buffers.patch
index d619a66f..3a3dae83 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-ef=
i-unmap-RX-TX-buffers.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-ef=
i-unmap-RX-TX-buffers.patch
@@ -1,7 +1,7 @@
-From 7d2c73749107a5859c7158a859a62c3e8b2d33e2 Mon Sep 17 00:00:00 2001
+From b09b391e33e024a18842dfdc99282d0050cc5fcb Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 6 Oct 2022 15:04:25 +0100
-Subject: [PATCH 04/27] arm_ffa: efi: unmap RX/TX buffers
+Subject: [PATCH 04/42] arm_ffa: efi: unmap RX/TX buffers
=20
 unmap RX/TX buffers at ExitBootServices()
=20
@@ -32,7 +32,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 13 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index e65ca6a4cbee..3481f2afe7a9 100644
+index e65ca6a4cb..3481f2afe7 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -3,6 +3,9 @@
@@ -70,5 +70,5 @@ index e65ca6a4cbee..3481f2afe7a9 100644
  	efi_runtime_detach();
 =20
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm=
_ffa-introduce-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0005-arm_ffa-introduce-armffa-command.patch
index cbf8c101..b00e3d9f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-in=
troduce-armffa-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-in=
troduce-armffa-command.patch
@@ -1,7 +1,7 @@
-From c6b116c4793449775064a8fc949a3b607b7ade27 Mon Sep 17 00:00:00 2001
+From f3bc86a7ec63c0454577cb6712395c577b2cfd66 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 6 Jun 2022 12:46:38 +0100
-Subject: [PATCH 05/27] arm_ffa: introduce armffa command
+Subject: [PATCH 05/42] arm_ffa: introduce armffa command
=20
 Provide armffa command showcasing the use of the FF-A driver
=20
@@ -59,7 +59,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 cmd/armffa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 509619d31ce6..61ce6c436fe1 100644
+index 509619d31c..61ce6c436f 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
 @@ -267,6 +267,7 @@ F:	configs/cortina_presidio-asic-pnand_defconfig
@@ -71,7 +71,7 @@ index 509619d31ce6..61ce6c436fe1 100644
  F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
 diff --git a/cmd/Kconfig b/cmd/Kconfig
-index b2d75987170e..7d0a40e8acb4 100644
+index b2d7598717..7d0a40e8ac 100644
 --- a/cmd/Kconfig
 +++ b/cmd/Kconfig
 @@ -924,6 +924,16 @@ endmenu
@@ -92,7 +92,7 @@ index b2d75987170e..7d0a40e8acb4 100644
  	#depends on FLASH_CFI_DRIVER
  	bool "armflash"
 diff --git a/cmd/Makefile b/cmd/Makefile
-index 0b6a96c1d914..c757f1647da6 100644
+index 0b6a96c1d9..c757f1647d 100644
 --- a/cmd/Makefile
 +++ b/cmd/Makefile
 @@ -12,6 +12,8 @@ obj-y +=3D panic.o
@@ -106,7 +106,7 @@ index 0b6a96c1d914..c757f1647da6 100644
  obj-$(CONFIG_CMD_AES) +=3D aes.o
 diff --git a/cmd/armffa.c b/cmd/armffa.c
 new file mode 100644
-index 000000000000..d2e8687bfb1f
+index 0000000000..d2e8687bfb
 --- /dev/null
 +++ b/cmd/armffa.c
 @@ -0,0 +1,237 @@
@@ -348,7 +348,7 @@ index 000000000000..d2e8687bfb1f
 +	   "devlist\n"
 +	   "	 - displays the arm_ffa device info\n");
 diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index e4914b9bc779..be4df89d23fa 100644
+index e4914b9bc7..be4df89d23 100644
 --- a/drivers/firmware/arm-ffa/Kconfig
 +++ b/drivers/firmware/arm-ffa/Kconfig
 @@ -4,6 +4,7 @@ config ARM_FFA_TRANSPORT
@@ -360,5 +360,5 @@ index e4914b9bc779..be4df89d23fa 100644
  	select DEVRES
  	help
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm=
_ffa-introduce-the-FF-A-Sandbox-driver.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0006-arm_ffa-introduce-the-FF-A-Sandbox-driver.=
patch
index 99ff617d..8c3892f0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-in=
troduce-the-FF-A-Sandbox-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-in=
troduce-the-FF-A-Sandbox-driver.patch
@@ -1,7 +1,7 @@
-From 49ed44c01f7e93d614483fc2d3cc7034808e9c07 Mon Sep 17 00:00:00 2001
+From 301430b7c8dceebe349b82c598097628da733090 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Nov 2022 14:44:36 +0000
-Subject: [PATCH 06/27] arm_ffa: introduce the FF-A Sandbox driver
+Subject: [PATCH 06/42] arm_ffa: introduce the FF-A Sandbox driver
=20
 Provide a Sandbox driver to emulate the FF-A ABIs
=20
@@ -53,7 +53,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 include/sandbox_arm_ffa.h
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 61ce6c436fe1..297d165f8401 100644
+index 61ce6c436f..297d165f84 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
 @@ -271,6 +271,7 @@ F:	cmd/armffa.c
@@ -65,7 +65,7 @@ index 61ce6c436fe1..297d165f8401 100644
  ARM FREESCALE IMX
  M:	Stefano Babic <sbabic@denx.de>
 diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
-index ba45ac0b71c1..4b8a1ec42bda 100644
+index ba45ac0b71..4b8a1ec42b 100644
 --- a/configs/sandbox64_defconfig
 +++ b/configs/sandbox64_defconfig
 @@ -259,3 +259,5 @@ CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
@@ -76,7 +76,7 @@ index ba45ac0b71c1..4b8a1ec42bda 100644
 +CONFIG_SANDBOX_FFA=3Dy
 \ No newline at end of file
 diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
-index be46cae7aad7..650f06ae61f7 100644
+index be46cae7aa..650f06ae61 100644
 --- a/configs/sandbox_defconfig
 +++ b/configs/sandbox_defconfig
 @@ -334,3 +334,5 @@ CONFIG_TEST_FDTDEC=3Dy
@@ -87,7 +87,7 @@ index be46cae7aad7..650f06ae61f7 100644
 +CONFIG_SANDBOX_FFA=3Dy
 \ No newline at end of file
 diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index be4df89d23fa..b86f16d7785d 100644
+index be4df89d23..b86f16d778 100644
 --- a/drivers/firmware/arm-ffa/Kconfig
 +++ b/drivers/firmware/arm-ffa/Kconfig
 @@ -2,8 +2,8 @@
@@ -111,7 +111,7 @@ index be4df89d23fa..b86f16d7785d 100644
 +	help
 +	  This emulates the FF-A handling under Sandbox and allows to test the=
 FF-A driver
 diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
-index 043a8915bec5..0d21d6b47ab9 100644
+index 043a8915be..0d21d6b47a 100644
 --- a/drivers/firmware/arm-ffa/Makefile
 +++ b/drivers/firmware/arm-ffa/Makefile
 @@ -4,3 +4,4 @@
@@ -120,7 +120,7 @@ index 043a8915bec5..0d21d6b47ab9 100644
  obj-y +=3D arm-ffa-uclass.o core.o
 +obj-$(CONFIG_SANDBOX_FFA) +=3D sandbox.o
 diff --git a/drivers/firmware/arm-ffa/arm_ffa_prv.h b/drivers/firmware/a=
rm-ffa/arm_ffa_prv.h
-index 4eea7dc03604..bbc8b87069ff 100644
+index 4eea7dc036..bbc8b87069 100644
 --- a/drivers/firmware/arm-ffa/arm_ffa_prv.h
 +++ b/drivers/firmware/arm-ffa/arm_ffa_prv.h
 @@ -19,6 +19,16 @@
@@ -153,7 +153,7 @@ index 4eea7dc03604..bbc8b87069ff 100644
   * struct ffa_partition_uuid - 16 bytes UUID transmitted by FFA_PARTITI=
ON_INFO_GET
   * @a1-4:	32-bit words access to the UUID data
 diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/=
core.c
-index 0b1f8e6a078d..560603b28bcc 100644
+index 0b1f8e6a07..560603b28b 100644
 --- a/drivers/firmware/arm-ffa/core.c
 +++ b/drivers/firmware/arm-ffa/core.c
 @@ -1072,6 +1072,7 @@ static int ffa_msg_send_direct_req(struct udevice =
*dev, u16 dst_part_id,
@@ -223,7 +223,7 @@ index 0b1f8e6a078d..560603b28bcc 100644
 =20
 diff --git a/drivers/firmware/arm-ffa/sandbox.c b/drivers/firmware/arm-f=
fa/sandbox.c
 new file mode 100644
-index 000000000000..16f1ca926ee2
+index 0000000000..16f1ca926e
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/sandbox.c
 @@ -0,0 +1,659 @@
@@ -888,7 +888,7 @@ index 000000000000..16f1ca926ee2
 +};
 diff --git a/drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h b/drivers/fi=
rmware/arm-ffa/sandbox_arm_ffa_prv.h
 new file mode 100644
-index 000000000000..4db57f5092f8
+index 0000000000..4db57f5092
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h
 @@ -0,0 +1,144 @@
@@ -1037,7 +1037,7 @@ index 000000000000..4db57f5092f8
 +
 +#endif
 diff --git a/include/arm_ffa.h b/include/arm_ffa.h
-index 74b16174c292..b88904fe50b0 100644
+index 74b16174c2..b88904fe50 100644
 --- a/include/arm_ffa.h
 +++ b/include/arm_ffa.h
 @@ -90,7 +90,7 @@ struct ffa_bus_ops {
@@ -1051,7 +1051,7 @@ index 74b16174c292..b88904fe50b0 100644
 =20
 diff --git a/include/sandbox_arm_ffa.h b/include/sandbox_arm_ffa.h
 new file mode 100644
-index 000000000000..d5df16f2828c
+index 0000000000..d5df16f282
 --- /dev/null
 +++ b/include/sandbox_arm_ffa.h
 @@ -0,0 +1,91 @@
@@ -1147,7 +1147,7 @@ index 000000000000..d5df16f2828c
 +
 +#endif
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 3481f2afe7a9..fea4eb7a342e 100644
+index 3481f2afe7..fea4eb7a34 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -2185,7 +2185,7 @@ static efi_status_t EFIAPI efi_exit_boot_services(=
efi_handle_t image_handle,
@@ -1160,5 +1160,5 @@ index 3481f2afe7a9..fea4eb7a342e 100644
  		if (ffa_bus_ops_get()->rxtx_unmap(NULL))
  			log_err("Can't unmap FF-A RX/TX buffers\n");
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm=
_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introduce-Sandbox-test-c=
ases-for-UCLASS_FFA.patch
index a998de35..d248e8b0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-in=
troduce-Sandbox-test-cases-for-UCLASS_FFA.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-in=
troduce-Sandbox-test-cases-for-UCLASS_FFA.patch
@@ -1,7 +1,7 @@
-From fcc5de7e0e618fa4ec82d37f5f0687af837e6f54 Mon Sep 17 00:00:00 2001
+From 3664fe7503cbc4348bbd7bcb8fbf7e1db332ac5d Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 6 Jun 2022 17:26:06 +0100
-Subject: [PATCH 07/27] arm_ffa: introduce Sandbox test cases for UCLASS_=
FFA
+Subject: [PATCH 07/42] arm_ffa: introduce Sandbox test cases for UCLASS_=
FFA
=20
 Add functional test cases for the FF-A core driver
=20
@@ -38,7 +38,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 test/dm/ffa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 297d165f8401..c1d3d4ae1c56 100644
+index 297d165f84..c1d3d4ae1c 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
 @@ -272,6 +272,7 @@ F:	doc/arch/arm64.ffa.rst
@@ -50,7 +50,7 @@ index 297d165f8401..c1d3d4ae1c56 100644
  ARM FREESCALE IMX
  M:	Stefano Babic <sbabic@denx.de>
 diff --git a/test/dm/Makefile b/test/dm/Makefile
-index 7a79b6e1a25d..85e99e1c120e 100644
+index 7a79b6e1a2..85e99e1c12 100644
 --- a/test/dm/Makefile
 +++ b/test/dm/Makefile
 @@ -1,6 +1,7 @@
@@ -71,7 +71,7 @@ index 7a79b6e1a25d..85e99e1c120e 100644
  obj-y +=3D regmap.o
 diff --git a/test/dm/ffa.c b/test/dm/ffa.c
 new file mode 100644
-index 000000000000..128d8626a761
+index 0000000000..128d8626a7
 --- /dev/null
 +++ b/test/dm/ffa.c
 @@ -0,0 +1,392 @@
@@ -468,5 +468,5 @@ index 000000000000..128d8626a761
 +
 +DM_TEST(dm_test_ffa_nack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm=
_ffa-introduce-armffa-command-Sandbox-test.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0008-arm_ffa-introduce-armffa-command-Sandb=
ox-test.patch
index fed806e6..d5842827 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-in=
troduce-armffa-command-Sandbox-test.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-in=
troduce-armffa-command-Sandbox-test.patch
@@ -1,7 +1,7 @@
-From 5816c61212f9710a5c7310cd7c57cc349e852152 Mon Sep 17 00:00:00 2001
+From 5af272d2bb2a7a8c8a4732c8d598dd1713856949 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Nov 2022 14:48:34 +0000
-Subject: [PATCH 08/27] arm_ffa: introduce armffa command Sandbox test
+Subject: [PATCH 08/42] arm_ffa: introduce armffa command Sandbox test
=20
 Add Sandbox test for the armffa command
=20
@@ -27,7 +27,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 test/cmd/armffa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index c1d3d4ae1c56..a2f60a3b93a6 100644
+index c1d3d4ae1c..a2f60a3b93 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
 @@ -272,6 +272,7 @@ F:	doc/arch/arm64.ffa.rst
@@ -39,7 +39,7 @@ index c1d3d4ae1c56..a2f60a3b93a6 100644
 =20
  ARM FREESCALE IMX
 diff --git a/test/cmd/Makefile b/test/cmd/Makefile
-index bc961df3dcee..21aa6d740ee8 100644
+index bc961df3dc..21aa6d740e 100644
 --- a/test/cmd/Makefile
 +++ b/test/cmd/Makefile
 @@ -1,6 +1,7 @@
@@ -60,7 +60,7 @@ index bc961df3dcee..21aa6d740ee8 100644
  obj-$(CONFIG_CMD_WGET) +=3D wget.o
 diff --git a/test/cmd/armffa.c b/test/cmd/armffa.c
 new file mode 100644
-index 000000000000..e04363ba63f9
+index 0000000000..e04363ba63
 --- /dev/null
 +++ b/test/cmd/armffa.c
 @@ -0,0 +1,39 @@
@@ -104,5 +104,5 @@ index 000000000000..e04363ba63f9
 +
 +DM_TEST(dm_test_armffa_cmd, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm=
_ffa-efi-introduce-FF-A-MM-communication.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0009-arm_ffa-efi-introduce-FF-A-MM-communicat=
ion.patch
index 0847cee0..574b7df9 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-ef=
i-introduce-FF-A-MM-communication.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-ef=
i-introduce-FF-A-MM-communication.patch
@@ -1,7 +1,7 @@
-From e371b2d29aa447c1a186ab25b37b99fded967b77 Mon Sep 17 00:00:00 2001
+From ca1ae0e78ee3476090919459ec5d08187d5eefbc Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 15 Aug 2022 15:12:49 +0100
-Subject: [PATCH 09/27] arm_ffa: efi: introduce FF-A MM communication
+Subject: [PATCH 09/42] arm_ffa: efi: introduce FF-A MM communication
=20
 Add MM communication support using FF-A transport
=20
@@ -88,7 +88,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  3 files changed, 307 insertions(+), 6 deletions(-)
=20
 diff --git a/include/mm_communication.h b/include/mm_communication.h
-index e65fbde60d0a..d409bed77714 100644
+index e65fbde60d..d409bed777 100644
 --- a/include/mm_communication.h
 +++ b/include/mm_communication.h
 @@ -6,6 +6,8 @@
@@ -111,7 +111,7 @@ index e65fbde60d0a..d409bed77714 100644
   * Interface to the pseudo Trusted Application (TA), which provides a
   * communication channel with the Standalone MM (Management Mode)
 diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
-index b498c72206fd..ca7390848125 100644
+index b498c72206..ca73908481 100644
 --- a/lib/efi_loader/Kconfig
 +++ b/lib/efi_loader/Kconfig
 @@ -55,13 +55,23 @@ config EFI_VARIABLE_FILE_STORE
@@ -141,7 +141,7 @@ index b498c72206fd..ca7390848125 100644
  	bool "Don't persist non-volatile UEFI variables"
  	help
 diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_vari=
able_tee.c
-index dfef18435dfa..3933a24e8cdc 100644
+index dfef18435d..3933a24e8c 100644
 --- a/lib/efi_loader/efi_variable_tee.c
 +++ b/lib/efi_loader/efi_variable_tee.c
 @@ -4,9 +4,12 @@
@@ -496,5 +496,5 @@ index dfef18435dfa..3933a24e8cdc 100644
 =20
  	/*
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm=
_ffa-efi-corstone1000-enable-MM-communication.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-efi-corstone1000-enable-MM-=
communication.patch
index e182d9cd..4fe1405c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-ef=
i-corstone1000-enable-MM-communication.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-ef=
i-corstone1000-enable-MM-communication.patch
@@ -1,7 +1,7 @@
-From a5d70b9bf23b38fbc8c6b4c3f384278aeca3bbce Mon Sep 17 00:00:00 2001
+From a595dfd91d3e226eaa39e324673871c73ae0aa29 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 23 Sep 2022 15:17:21 +0100
-Subject: [PATCH 10/27] arm_ffa: efi: corstone1000: enable MM communicati=
on
+Subject: [PATCH 10/42] arm_ffa: efi: corstone1000: enable MM communicati=
on
=20
 turn on EFI MM communication
=20
@@ -44,7 +44,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  2 files changed, 12 insertions(+)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index dddfa2750762..d1dc06c86c2c 100644
+index dddfa27507..d1dc06c86c 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -52,3 +52,5 @@ CONFIG_DM_SERIAL=3Dy
@@ -54,7 +54,7 @@ index dddfa2750762..d1dc06c86c2c 100644
 +CONFIG_EFI_MM_COMM_TEE=3Dy
 +CONFIG_ARM_FFA_TRANSPORT=3Dy
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 8e0230c135e3..b6226fa12af3 100644
+index 8e0230c135..b6226fa12a 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -14,6 +14,15 @@
@@ -82,5 +82,5 @@ index 8e0230c135e3..b6226fa12af3 100644
 =20
  #define BOOT_TARGET_DEVICES(func) \
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi=
-corstone1000-introduce-EFI-capsule-update.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule=
-update.patch
index 37877c90..c526626d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-introduce-EFI-capsule-update.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-introduce-EFI-capsule-update.patch
@@ -1,7 +1,7 @@
-From 6a73345662d53ebaa9750c70aa8fc7f40d3f8524 Mon Sep 17 00:00:00 2001
+From b9c44c396f9ad9588184272cdc5ed98e19e82c0a Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Nov 2022 15:11:27 +0000
-Subject: [PATCH 11/27] efi: corstone1000: introduce EFI capsule update
+Subject: [PATCH 11/42] efi: corstone1000: introduce EFI capsule update
=20
 This commit provides capsule update feature for Corstone1000.
=20
@@ -32,7 +32,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  7 files changed, 200 insertions(+), 4 deletions(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 4f4b96a095c2..76816f8f4ea1 100644
+index 4f4b96a095..76816f8f4e 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -66,6 +66,10 @@ static struct mm_region corstone1000_mem_map[] =3D {
@@ -47,7 +47,7 @@ index 4f4b96a095c2..76816f8f4ea1 100644
  {
  	return 0;
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index d1dc06c86c2c..06eac3e041fe 100644
+index d1dc06c86c..06eac3e041 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -54,3 +54,6 @@ CONFIG_USB_ISP1760=3Dy
@@ -58,7 +58,7 @@ index d1dc06c86c2c..06eac3e041fe 100644
 +CONFIG_EFI_CAPSULE_FIRMWARE_FIT=3Dy
 +CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index b6226fa12af3..cd30499e3c9c 100644
+index b6226fa12a..cd30499e3c 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -14,6 +14,24 @@
@@ -87,7 +87,7 @@ index b6226fa12af3..cd30499e3c9c 100644
 =20
  /*
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index f9e427f09059..26981141c228 100644
+index f9e427f090..26981141c2 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
 @@ -1032,11 +1032,11 @@ extern const struct efi_firmware_management_prot=
ocol efi_fmp_fit;
@@ -105,7 +105,7 @@ index f9e427f09059..26981141c228 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index fea4eb7a342e..faab74474d77 100644
+index fea4eb7a34..faab74474d 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -2103,6 +2103,33 @@ static void efi_exit_caches(void)
@@ -159,7 +159,7 @@ index fea4eb7a342e..faab74474d77 100644
  	efi_set_watchdog(0);
  	schedule();
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 0997cd248fe3..9e8ddaac7f03 100644
+index 0997cd248f..9e8ddaac7f 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -26,6 +26,14 @@
@@ -329,7 +329,7 @@ index 0997cd248fe3..9e8ddaac7f03 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 543764113530..1ad2fa52d7e9 100644
+index 5437641135..1ad2fa52d7 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -16,6 +16,13 @@
@@ -362,5 +362,5 @@ index 543764113530..1ad2fa52d7e9 100644
  		ret =3D efi_set_variable_int(u"CapsuleMax",
  					   &efi_guid_capsule_report,
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm=
-corstone1000-fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-fix-unrecognized-=
filesystem-type.patch
index 740f8783..6fe10eb2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
@@ -1,7 +1,7 @@
-From 2f76fd5cf66a983f68bc115463b9ea5714b3c221 Mon Sep 17 00:00:00 2001
+From ac738fa33edec9ff712dee6d10491cb2eb7cfe3a Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Mar 2022 15:56:09 +0000
-Subject: [PATCH 12/27] arm: corstone1000: fix unrecognized filesystem ty=
pe
+Subject: [PATCH 12/42] arm: corstone1000: fix unrecognized filesystem ty=
pe
=20
 Some usb sticks are not recognized by usb, just add a
 delay before checking status.
@@ -13,7 +13,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 3 insertions(+)
=20
 diff --git a/common/usb_storage.c b/common/usb_storage.c
-index ac6427577379..1d2680c3cd33 100644
+index ac64275773..1d2680c3cd 100644
 --- a/common/usb_storage.c
 +++ b/common/usb_storage.c
 @@ -785,6 +785,9 @@ static int usb_stor_BBB_transport(struct scsi_cmd *s=
rb, struct us_data *us)
@@ -27,5 +27,5 @@ index ac6427577379..1d2680c3cd33 100644
  	result =3D usb_bulk_msg(us->pusb_dev, pipein, csw, UMASS_BBB_CSW_SIZE,
  				&actlen, USB_CNTL_TIMEOUT*5);
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi=
_capsule-corstone1000-pass-interface-id-and-buffe.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_capsule-corstone1000-pass-i=
nterface-id-and-buffe.patch
index a86e0c8c..bc03035c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_capsul=
e-corstone1000-pass-interface-id-and-buffe.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_capsul=
e-corstone1000-pass-interface-id-and-buffe.patch
@@ -1,7 +1,7 @@
-From 8727a1b34fb500ca5cce6fc1c30a1d73bf23aaba Mon Sep 17 00:00:00 2001
+From baa961b6050508710e1c6b572f2e93ac5c488201 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 10 Dec 2021 20:03:35 +0000
-Subject: [PATCH 13/27] efi_capsule: corstone1000: pass interface id and =
buffer
+Subject: [PATCH 13/42] efi_capsule: corstone1000: pass interface id and =
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
-index cd30499e3c9c..e4c7bcb96f27 100644
+index cd30499e3c..e4c7bcb96f 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -24,6 +24,12 @@
@@ -40,7 +40,7 @@ index cd30499e3c9c..e4c7bcb96f27 100644
  #define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
 =20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 9e8ddaac7f03..bd4cc8d27285 100644
+index 9e8ddaac7f..bd4cc8d272 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -29,6 +29,8 @@
@@ -70,5 +70,5 @@ index 9e8ddaac7f03..bd4cc8d27285 100644
  	return ffa_bus_ops_get()->sync_send_receive(NULL, CORSTONE1000_SEPROXY=
_PART_ID, &msg, 0);
  }
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi=
_boottime-corstone1000-pass-interface-id-and-kern.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0014-efi_boottime-corstone1000-pass-=
interface-id-and-kern.patch
index 8559c9cb..658e21f0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_bootti=
me-corstone1000-pass-interface-id-and-kern.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_bootti=
me-corstone1000-pass-interface-id-and-kern.patch
@@ -1,7 +1,7 @@
-From 80273f9bcab14059ec92e5c05826ae52113cebe6 Mon Sep 17 00:00:00 2001
+From d761d59dd251ae93980f659d253576fc872f2c5f Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 10 Dec 2021 20:10:41 +0000
-Subject: [PATCH 14/27] efi_boottime: corstone1000: pass interface id and
+Subject: [PATCH 14/42] efi_boottime: corstone1000: pass interface id and
  kernel event id using register w4
=20
 Initially the interface/event IDs are passed to the SP using register
@@ -22,7 +22,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 10 insertions(+), 3 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index faab74474d77..36a0be7ba104 100644
+index faab74474d..36a0be7ba1 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -30,6 +30,11 @@
@@ -54,5 +54,5 @@ index faab74474d77..36a0be7ba104 100644
  	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
  }
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi=
_loader-corstone1000-remove-guid-check-from-corst.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader-corstone1000-remove-=
guid-check-from-corst.patch
index 98e85056..e57b9441 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
@@ -1,7 +1,7 @@
-From 315d4eb0f5be4ed844bf6c7496d2ea62e518aa5c Mon Sep 17 00:00:00 2001
+From 5e09d349ec8af6585bce777acbfd2d218fc2e8d4 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 11 Dec 2021 13:23:55 +0000
-Subject: [PATCH 15/27] efi_loader: corstone1000: remove guid check from
+Subject: [PATCH 15/42] efi_loader: corstone1000: remove guid check from
  corstone1000 config option
=20
 Use generic fmp guid and no separte check is required for
@@ -15,7 +15,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 1 insertion(+), 15 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index bd4cc8d27285..ef7b358ddba9 100644
+index bd4cc8d272..ef7b358ddb 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -830,12 +830,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
@@ -49,5 +49,5 @@ index bd4cc8d27285..ef7b358ddba9 100644
  			goto out;
  	}
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi=
_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader-populate-ESRT-table-=
if-EFI_ESRT-config-op.patch
index 8c31a5ab..1b88d7f1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
@@ -1,7 +1,7 @@
-From 978d2b92a2ae1f2be71c85271c2d79a5eaf74815 Mon Sep 17 00:00:00 2001
+From e3ccad1cf9e905ec15ff772dcf53972fafcf54ee Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:49:02 +0000
-Subject: [PATCH 16/27] efi_loader: populate ESRT table if EFI_ESRT confi=
g
+Subject: [PATCH 16/42] efi_loader: populate ESRT table if EFI_ESRT confi=
g
  option is set
=20
 This change is to call efi_esrt_populate function if CONFIG_EFI_ESRT
@@ -15,7 +15,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 7 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index ef7b358ddba9..8eb8fc406adf 100644
+index ef7b358ddb..8eb8fc406a 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
 @@ -852,6 +852,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
@@ -33,5 +33,5 @@ index ef7b358ddba9..8eb8fc406adf 100644
  #endif
 =20
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi=
_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0017-efi_firmware-add-get_image_info-for=
-corstone1000.patch
index 0a9696d0..7087315e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
@@ -1,7 +1,7 @@
-From 03f0a1ac1450223ff2aa9be116e918230371048e Mon Sep 17 00:00:00 2001
+From d8f79ab37bae283599e40018055ff9d5648fb647 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:50:25 +0000
-Subject: [PATCH 17/27] efi_firmware: add get_image_info for corstone1000
+Subject: [PATCH 17/42] efi_firmware: add get_image_info for corstone1000
=20
 This change is to populate get_image_info which eventually
 will be populated in ESRT table
@@ -14,7 +14,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 71 insertions(+), 1 deletion(-)
=20
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 93e2b01c07a6..0a38a96351ff 100644
+index 93e2b01c07..0a38a96351 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -18,11 +18,69 @@
@@ -119,5 +119,5 @@ index 93e2b01c07a6..0a38a96351ff 100644
  			     NULL, NULL))
  		return EFI_EXIT(EFI_DEVICE_ERROR);
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-efi=
_loader-send-bootcomplete-message-to-secure-encla.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0018-efi_loader-send-bootcomplete-me=
ssage-to-secure-encla.patch
index e6a2a556..1fbad386 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-efi_loader=
-send-bootcomplete-message-to-secure-encla.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-efi_loader=
-send-bootcomplete-message-to-secure-encla.patch
@@ -1,7 +1,7 @@
-From 5866edd29215e939eaad38956886df6c7af5ab96 Mon Sep 17 00:00:00 2001
+From a6fee840a411a6a7b6c276d0a7b1d5445039e6c2 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Mon, 15 Aug 2022 15:46:18 +0100
-Subject: [PATCH 18/27] efi_loader: send bootcomplete message to secure e=
nclave
+Subject: [PATCH 18/42] efi_loader: send bootcomplete message to secure e=
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
-index e4c7bcb96f27..be13b98d4829 100644
+index e4c7bcb96f..be13b98d48 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -22,7 +22,7 @@
@@ -34,7 +34,7 @@ index e4c7bcb96f27..be13b98d4829 100644
  #define PREP_SEPROXY_SVC_ID_MASK	GENMASK(31, 16)
  #define PREP_SEPROXY_SVC_ID(x)	 (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (=
x)))
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 36a0be7ba104..fea4eb7a342e 100644
+index 36a0be7ba1..fea4eb7a34 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -30,11 +30,6 @@
@@ -102,7 +102,7 @@ index 36a0be7ba104..fea4eb7a342e 100644
  	efi_set_watchdog(0);
  	schedule();
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 0a38a96351ff..70568f22909e 100644
+index 0a38a96351..70568f2290 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -48,7 +48,7 @@ static efi_status_t efi_corstone1000_img_info_get (
@@ -115,7 +115,7 @@ index 0a38a96351ff..70568f22909e 100644
  	}
 =20
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 1ad2fa52d7e9..89f988b09c44 100644
+index 1ad2fa52d7..89f988b09c 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -17,6 +17,9 @@
@@ -179,5 +179,5 @@ index 1ad2fa52d7e9..89f988b09c44 100644
  	if (ret !=3D EFI_SUCCESS) {
  		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n"=
);
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi=
_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0019-efi_loader-fix-null-pointer-exc=
eption-with-get_image.patch
index eef436c1..24e5b46a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
@@ -1,7 +1,7 @@
-From 56c14cd9a96d0c0907b2cb9c1b95a5debff97f75 Mon Sep 17 00:00:00 2001
+From 3d28467e447f12c5aa276827aa742e7eed1d577a Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 14 Jan 2022 15:24:18 +0000
-Subject: [PATCH 19/27] efi_loader: fix null pointer exception with
+Subject: [PATCH 19/42] efi_loader: fix null pointer exception with
  get_image_info
=20
 get_img_info API implemented for corstone1000 target does not
@@ -17,7 +17,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 11 insertions(+), 8 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 70568f22909e..c883e2ff0aa9 100644
+index 70568f2290..c883e2ff0a 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -39,26 +39,29 @@ static efi_status_t efi_corstone1000_img_info_get (
@@ -59,5 +59,5 @@ index 70568f22909e..c883e2ff0aa9 100644
  					     IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
  	image_info[i].attributes_setting =3D IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm=
-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0020-arm-corstone1000-add-mmc-for-fvp.patch
index b8d7897d..93da2536 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm-corsto=
ne1000-add-mmc-for-fvp.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm-corsto=
ne1000-add-mmc-for-fvp.patch
@@ -1,7 +1,7 @@
-From 0a4aa2a03a208996e7448c79edd0adef9a697255 Mon Sep 17 00:00:00 2001
+From d6c183a99a7d232ef5dbf886c49e7fb75b50ecf9 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 30 Nov 2022 15:37:22 +0000
-Subject: [PATCH 20/27] arm:corstone1000: add mmc for fvp
+Subject: [PATCH 20/42] arm:corstone1000: add mmc for fvp
=20
 Enable support mmc/sdcard for the corstone1000 FVP.
=20
@@ -15,7 +15,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  3 files changed, 32 insertions(+), 8 deletions(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 76816f8f4ea1..d6ca6e896140 100644
+index 76816f8f4e..d6ca6e8961 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -38,19 +38,35 @@ static struct mm_region corstone1000_mem_map[] =3D {
@@ -61,7 +61,7 @@ index 76816f8f4ea1..d6ca6e896140 100644
  		/* OCVM */
  		.virt =3D 0x80000000UL,
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 06eac3e041fe..f7c276a10a6e 100644
+index 06eac3e041..f7c276a10a 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -40,7 +40,13 @@ CONFIG_VERSION_VARIABLE=3Dy
@@ -80,7 +80,7 @@ index 06eac3e041fe..f7c276a10a6e 100644
  CONFIG_PHY_SMSC=3Dy
  CONFIG_SMC911X=3Dy
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index be13b98d4829..a015a1630e2c 100644
+index be13b98d48..a015a1630e 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -59,7 +59,9 @@
@@ -95,5 +95,5 @@ index be13b98d4829..a015a1630e2c 100644
  #include <config_distro_bootcmd.h>
 =20
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-cor=
stone1000-add-compressed-kernel-support.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0021-corstone1000-add-compressed-kernel-suppor=
t.patch
index a7e24e37..7797880c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corstone10=
00-add-compressed-kernel-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corstone10=
00-add-compressed-kernel-support.patch
@@ -1,7 +1,7 @@
-From c9503083c042e453be3178a79ba3ff81e8d7ca17 Mon Sep 17 00:00:00 2001
+From 155f20028ad5f3ba5d2362ec48abb7804eaade00 Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
 Date: Wed, 30 Nov 2022 18:59:59 +0000
-Subject: [PATCH 21/27] corstone1000: add compressed kernel support
+Subject: [PATCH 21/42] corstone1000: add compressed kernel support
=20
 The corstone1000 kernel has become too large to fit in the available
 storage.  Swtiching to a compressed kernel avoids the problem, but
@@ -17,7 +17,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index f7c276a10a6e..1179bf5f3bfd 100644
+index f7c276a10a..1179bf5f3b 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -15,7 +15,7 @@ CONFIG_FIT=3Dy
@@ -30,5 +30,5 @@ index f7c276a10a6e..1179bf5f3bfd 100644
  CONFIG_LOGLEVEL=3D7
  # CONFIG_DISPLAY_CPUINFO is not set
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Int=
roduce-external-sys-driver-to-device-tree.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0022-Introduce-external-sys-driver-to-device=
-tree.patch
index 4fb39794..c74e17fb 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Introduce-=
external-sys-driver-to-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Introduce-=
external-sys-driver-to-device-tree.patch
@@ -1,7 +1,7 @@
-From 2229a66346fb16f092d79fc2e9756ec34ff041a4 Mon Sep 17 00:00:00 2001
+From 984c431cd594c112d71ea1378bc1ac3b72806baa Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Wed, 30 Nov 2022 19:02:26 +0000
-Subject: [PATCH 22/27] Introduce external sys driver to device-tree
+Subject: [PATCH 22/42] Introduce external sys driver to device-tree
=20
 It adds external sys driver binding to u-boot
 device tree.
@@ -14,7 +14,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 7 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 4e46826f883a..2c7185e1391a 100644
+index 4e46826f88..2c7185e139 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -160,5 +160,12 @@
@@ -31,5 +31,5 @@ index 4e46826f883a..2c7185e1391a 100644
  	};
  };
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add=
-mhu-and-rpmsg-client-to-u-boot-device-tree.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0023-Add-mhu-and-rpmsg-client-to-u-boot-de=
vice-tree.patch
index f144c63a..5747d782 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add-mhu-an=
d-rpmsg-client-to-u-boot-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add-mhu-an=
d-rpmsg-client-to-u-boot-device-tree.patch
@@ -1,7 +1,7 @@
-From aef33222f500c91badd301aecefd153c6d0eb834 Mon Sep 17 00:00:00 2001
+From 4167fe9079b64aaaf3eefc53063d242af8d2badd Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Mon, 12 Sep 2022 15:47:06 +0100
-Subject: [PATCH 23/27] Add mhu and rpmsg client to u-boot device tree
+Subject: [PATCH 23/42] Add mhu and rpmsg client to u-boot device tree
=20
 Adds external system controller and mhu driver to u-boot
 device tree. This enables communication between host and
@@ -15,7 +15,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 50 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 2c7185e1391a..61e0c33247ce 100644
+index 2c7185e139..61e0c33247 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -161,6 +161,56 @@
@@ -76,5 +76,5 @@ index 2c7185e1391a..61e0c33247ce 100644
  			compatible =3D "arm,extsys_ctrl";
  			reg =3D <0x1A010310 0x4>,
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm=
-corstone1000-esrt-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0024-arm-corstone1000-esrt-support.patch
index 87551e9a..9d569be9 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corsto=
ne1000-esrt-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corsto=
ne1000-esrt-support.patch
@@ -1,7 +1,7 @@
-From 34f363f9d1c13abecd06ec37567704d0dfc05e77 Mon Sep 17 00:00:00 2001
+From f924535544515cdb350b2979b8c413cf221124b6 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Wed, 30 Nov 2022 19:11:43 +0000
-Subject: [PATCH 24/27] arm/corstone1000: esrt support
+Subject: [PATCH 24/42] arm/corstone1000: esrt support
=20
 The implementation is platform specific and would require
 change in future.
@@ -20,7 +20,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  3 files changed, 143 insertions(+), 9 deletions(-)
=20
 diff --git a/include/efi_api.h b/include/efi_api.h
-index 9bd70b0f18ce..23e427236a8f 100644
+index 9bd70b0f18..23e427236a 100644
 --- a/include/efi_api.h
 +++ b/include/efi_api.h
 @@ -2030,7 +2030,7 @@ struct efi_firmware_image_descriptor {
@@ -33,7 +33,7 @@ index 9bd70b0f18ce..23e427236a8f 100644
  struct efi_firmware_management_protocol {
  	efi_status_t (EFIAPI *get_image_info)(
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index c883e2ff0aa9..c6ab6e2182dd 100644
+index c883e2ff0a..c6ab6e2182 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
 @@ -15,6 +15,7 @@
@@ -186,7 +186,7 @@ index c883e2ff0aa9..c6ab6e2182dd 100644
  	.set_image =3D efi_firmware_fit_set_image,
  	.check_image =3D efi_firmware_check_image_unsupported,
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 89f988b09c44..08c742edbd12 100644
+index 89f988b09c..08c742edbd 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -167,14 +167,6 @@ static efi_status_t efi_init_capsule(void)
@@ -221,5 +221,5 @@ index 89f988b09c44..08c742edbd12 100644
  	ret =3D efi_init_variables();
  	if (ret !=3D EFI_SUCCESS)
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi=
_setup-discover-FF-A-bus-before-raising-EFI-start.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0025-efi_setup-discover-FF-A-bus-bef=
ore-raising-EFI-start.patch
index d903ab4c..568d9464 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_setup-=
discover-FF-A-bus-before-raising-EFI-start.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_setup-=
discover-FF-A-bus-before-raising-EFI-start.patch
@@ -1,7 +1,7 @@
-From 61f17cf403e2c1108b76556c879aa21945b31dcb Mon Sep 17 00:00:00 2001
+From 1f165f5b6e7d82611b55260b7254fee5fbebe539 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 30 Nov 2022 19:14:52 +0000
-Subject: [PATCH 25/27] efi_setup: discover FF-A bus before raising EFI s=
tarted
+Subject: [PATCH 25/42] efi_setup: discover FF-A bus before raising EFI s=
tarted
  event
=20
 add FF-A discovery to efi_corstone1000_uboot_efi_started_event()
@@ -14,7 +14,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 9 insertions(+), 2 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 08c742edbd12..65bd626e49b4 100644
+index 08c742edbd..65bd626e49 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -142,9 +142,16 @@ static efi_status_t efi_init_secure_boot(void)
@@ -47,5 +47,5 @@ index 08c742edbd12..65bd626e49b4 100644
 =20
  	/* Initialize variable services */
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-cor=
stone1000-enable-distro-booting-command.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0026-corstone1000-enable-distro-booting-comman=
d.patch
index b3a8d14b..57751b19 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-enable-distro-booting-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-enable-distro-booting-command.patch
@@ -1,7 +1,7 @@
-From 646269a92824f3e9b4145848e42ad3ba555e8931 Mon Sep 17 00:00:00 2001
+From 2a281a45b7dfc5c0e78f6256bf0ac122d825ce82 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
-Subject: [PATCH 26/27] corstone1000: enable distro booting command
+Subject: [PATCH 26/42] corstone1000: enable distro booting command
=20
 enable distro_bootcmd
=20
@@ -13,7 +13,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 1 insertion(+)
=20
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index a015a1630e2c..c30a7bfa0c0b 100644
+index a015a1630e..c30a7bfa0c 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -65,5 +65,6 @@
@@ -24,5 +24,5 @@ index a015a1630e2c..c30a7bfa0c0b 100644
 =20
  #endif
 --=20
-2.39.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-dri=
vers-mtd-nvmxip-introduce-NVM-XIP-block-storage-e.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0027-drivers-mtd-nvmxip-introduce-NV=
M-XIP-block-storage-e.patch
new file mode 100644
index 00000000..721ee156
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-drivers-mt=
d-nvmxip-introduce-NVM-XIP-block-storage-e.patch
@@ -0,0 +1,455 @@
+From c7567aaf75a66e204d492a8f6e2a3b4bfb8a7e45 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 14 Apr 2023 13:23:25 +0100
+Subject: [PATCH 27/42] drivers/mtd/nvmxip: introduce NVM XIP block stora=
ge
+ emulation
+
+add block storage emulation for NVM XIP flash devices
+
+Some paltforms such as Corstone-1000 need to see NVM XIP raw flash
+as a block storage device with read only capability.
+
+Here NVM flash devices are devices with addressable
+memory (e.g: QSPI NOR flash).
+
+The implementation is generic and can be used by different platforms.
+
+Two drivers are provided as follows.
+
+  nvmxip-blk :
+
+    a generic block driver allowing to read from the XIP flash
+
+  nvmxip Uclass driver :
+
+        When a device is described in the DT and associated with
+        UCLASS_NVMXIP, the Uclass creates a block device and binds it wi=
th
+	 the nvmxip-blk.
+
+Platforms can use multiple NVM XIP devices at the same time by defining =
a
+DT node for each one of them.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
+---
+ MAINTAINERS                         |   6 ++
+ doc/develop/driver-model/index.rst  |   1 +
+ doc/develop/driver-model/nvmxip.rst |  48 +++++++++++
+ drivers/block/blk-uclass.c          |   1 +
+ drivers/mtd/Kconfig                 |   2 +
+ drivers/mtd/Makefile                |   1 +
+ drivers/mtd/nvmxip/Kconfig          |  13 +++
+ drivers/mtd/nvmxip/Makefile         |   7 ++
+ drivers/mtd/nvmxip/nvmxip-uclass.c  |  67 ++++++++++++++++
+ drivers/mtd/nvmxip/nvmxip.c         | 119 ++++++++++++++++++++++++++++
+ drivers/mtd/nvmxip/nvmxip.h         |  32 ++++++++
+ include/dm/uclass-id.h              |   1 +
+ 12 files changed, 298 insertions(+)
+ create mode 100644 doc/develop/driver-model/nvmxip.rst
+ create mode 100644 drivers/mtd/nvmxip/Kconfig
+ create mode 100644 drivers/mtd/nvmxip/Makefile
+ create mode 100644 drivers/mtd/nvmxip/nvmxip-uclass.c
+ create mode 100644 drivers/mtd/nvmxip/nvmxip.c
+ create mode 100644 drivers/mtd/nvmxip/nvmxip.h
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index a2f60a3b93..1dbfab5f43 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -1202,6 +1202,12 @@ F:	cmd/nvme.c
+ F:	include/nvme.h
+ F:	doc/develop/driver-model/nvme.rst
+=20
++NVMXIP
++M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++S:	Maintained
++F:	doc/develop/driver-model/nvmxip.rst
++F:	drivers/mtd/nvmxip/
++
+ NVMEM
+ M:	Sean Anderson <seanga2@gmail.com>
+ S:	Maintained
+diff --git a/doc/develop/driver-model/index.rst b/doc/develop/driver-mod=
el/index.rst
+index 7366ef818c..8e12bbd936 100644
+--- a/doc/develop/driver-model/index.rst
++++ b/doc/develop/driver-model/index.rst
+@@ -20,6 +20,7 @@ subsystems
+    livetree
+    migration
+    nvme
++   nvmxip
+    of-plat
+    pci-info
+    pmic-framework
+diff --git a/doc/develop/driver-model/nvmxip.rst b/doc/develop/driver-mo=
del/nvmxip.rst
+new file mode 100644
+index 0000000000..fe087b13d2
+--- /dev/null
++++ b/doc/develop/driver-model/nvmxip.rst
+@@ -0,0 +1,48 @@
++.. SPDX-License-Identifier: GPL-2.0+
++
++NVM XIP Block Storage Emulation Driver
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++Summary
++-------
++
++Non-Volatile Memory devices with addressable memory (e.g: QSPI NOR flas=
h) could
++be used for block storage needs (e.g: parsing a GPT layout in a raw QSP=
I NOR flash).
++
++The NVMXIP Uclass provides this functionality and can be used for any 6=
4-bit platform.
++
++The NVMXIP Uclass provides the following drivers:
++
++      nvmxip-blk block driver:
++
++        A generic block driver allowing to read from the XIP flash.
++	The driver belongs to UCLASS_BLK.
++	The driver implemented by drivers/mtd/nvmxip/nvmxip.c
++
++      nvmxip Uclass driver:
++
++        When a device is described in the DT and associated with UCLASS=
_NVMXIP,
++        the Uclass creates a block device and binds it with the nvmxip-=
blk.
++	The Uclass driver implemented by drivers/mtd/nvmxip/nvmxip-uclass.c
++
++    The implementation is generic and can be used by different platform=
s.
++
++Supported hardware
++--------------------------------
++
++Any 64-bit plaform.
++
++Configuration
++----------------------
++
++config NVMXIP
++	  This option allows the emulation of a block storage device
++	  on top of a direct access non volatile memory XIP flash devices.
++	  This support provides the read operation.
++	  This option provides the block storage driver nvmxip-blk which
++	  handles the read operation. This driver is HW agnostic and can suppo=
rt
++	  multiple flash devices at the same time.
++
++Contributors
++------------
++   * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+diff --git a/drivers/block/blk-uclass.c b/drivers/block/blk-uclass.c
+index c69fc4d518..e8ab576c32 100644
+--- a/drivers/block/blk-uclass.c
++++ b/drivers/block/blk-uclass.c
+@@ -28,6 +28,7 @@ static struct {
+ 	{ UCLASS_AHCI, "sata" },
+ 	{ UCLASS_HOST, "host" },
+ 	{ UCLASS_NVME, "nvme" },
++	{ UCLASS_NVMXIP, "nvmxip" },
+ 	{ UCLASS_EFI_MEDIA, "efi" },
+ 	{ UCLASS_EFI_LOADER, "efiloader" },
+ 	{ UCLASS_VIRTIO, "virtio" },
+diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
+index fcdb450f77..0537ac64e3 100644
+--- a/drivers/mtd/Kconfig
++++ b/drivers/mtd/Kconfig
+@@ -224,4 +224,6 @@ source "drivers/mtd/spi/Kconfig"
+=20
+ source "drivers/mtd/ubi/Kconfig"
+=20
++source "drivers/mtd/nvmxip/Kconfig"
++
+ endmenu
+diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
+index 3a78590aaa..c638980ea2 100644
+--- a/drivers/mtd/Makefile
++++ b/drivers/mtd/Makefile
+@@ -25,6 +25,7 @@ obj-y +=3D nand/
+ obj-y +=3D onenand/
+ obj-y +=3D spi/
+ obj-$(CONFIG_MTD_UBI) +=3D ubi/
++obj-$(CONFIG_NVMXIP) +=3D nvmxip/
+=20
+ #SPL/TPL build
+ else
+diff --git a/drivers/mtd/nvmxip/Kconfig b/drivers/mtd/nvmxip/Kconfig
+new file mode 100644
+index 0000000000..ef53fc3c79
+--- /dev/null
++++ b/drivers/mtd/nvmxip/Kconfig
+@@ -0,0 +1,13 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# Copyright 2023 Arm Limited and/or its affiliates <open-source-office@=
arm.com>
++# Authors:
++#   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++
++config NVMXIP
++	bool "NVM XIP devices support"
++	select BLK
++	help
++	  This option allows the emulation of a block storage device
++	  on top of a direct access non volatile memory XIP flash devices.
++	  This support provides the read operation.
+diff --git a/drivers/mtd/nvmxip/Makefile b/drivers/mtd/nvmxip/Makefile
+new file mode 100644
+index 0000000000..07890982c7
+--- /dev/null
++++ b/drivers/mtd/nvmxip/Makefile
+@@ -0,0 +1,7 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# Copyright 2023 Arm Limited and/or its affiliates <open-source-office@=
arm.com>
++# Authors:
++#   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++
++obj-y +=3D nvmxip-uclass.o nvmxip.o
+diff --git a/drivers/mtd/nvmxip/nvmxip-uclass.c b/drivers/mtd/nvmxip/nvm=
xip-uclass.c
+new file mode 100644
+index 0000000000..9f96041e3d
+--- /dev/null
++++ b/drivers/mtd/nvmxip/nvmxip-uclass.c
+@@ -0,0 +1,67 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2023 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <log.h>
++#include <linux/bitops.h>
++#include "nvmxip.h"
++
++/* LBA Macros */
++
++#define DEFAULT_LBA_SHIFT 10 /* 1024 bytes per block */
++#define DEFAULT_LBA_COUNT 1024 /* block count */
++
++#define DEFAULT_LBA_SZ BIT(DEFAULT_LBA_SHIFT)
++
++/**
++ * nvmxip_post_bind() - post binding treatments
++ * @dev:	the NVMXIP device
++ *
++ * Create and probe a child block device.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int nvmxip_post_bind(struct udevice *udev)
++{
++	int ret;
++	struct udevice *bdev =3D NULL;
++	char bdev_name[NVMXIP_BLKDEV_NAME_SZ + 1];
++	int devnum;
++
++	devnum =3D uclass_id_count(UCLASS_NVMXIP);
++	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "blk#%d", devnum);
++
++	ret =3D blk_create_devicef(udev, NVMXIP_BLKDRV_NAME, bdev_name, UCLASS=
_NVMXIP,
++				 devnum, DEFAULT_LBA_SZ,
++				 DEFAULT_LBA_COUNT, &bdev);
++	if (ret) {
++		log_err("[%s]: failure during creation of the block device %s, error =
%d\n",
++			udev->name, bdev_name, ret);
++		return ret;
++	}
++
++	ret =3D blk_probe_or_unbind(bdev);
++	if (ret) {
++		log_err("[%s]: failure during probing the block device %s, error %d\n=
",
++			udev->name, bdev_name, ret);
++		return ret;
++	}
++
++	log_info("[%s]: the block device %s ready for use\n", udev->name, bdev=
_name);
++
++	return 0;
++}
++
++UCLASS_DRIVER(nvmxip) =3D {
++	.name	   =3D "nvmxip",
++	.id	   =3D UCLASS_NVMXIP,
++	.post_bind =3D nvmxip_post_bind,
++};
+diff --git a/drivers/mtd/nvmxip/nvmxip.c b/drivers/mtd/nvmxip/nvmxip.c
+new file mode 100644
+index 0000000000..a359e3b482
+--- /dev/null
++++ b/drivers/mtd/nvmxip/nvmxip.c
+@@ -0,0 +1,119 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2023 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <log.h>
++#include <mapmem.h>
++#include <asm/io.h>
++#include <linux/bitops.h>
++#include <linux/errno.h>
++#include "nvmxip.h"
++
++/**
++ * nvmxip_mmio_rawread() - read from the XIP flash
++ * @address:	address of the data
++ * @value:	pointer to where storing the value read
++ *
++ * Read raw data from the XIP flash.
++ *
++ * Return:
++ *
++ * Always return 0.
++ */
++static int nvmxip_mmio_rawread(const phys_addr_t address, u64 *value)
++{
++	*value =3D readq(address);
++	return 0;
++}
++
++/**
++ * nvmxip_blk_read() - block device read operation
++ * @dev:	the block device
++ * @blknr:	first block number to read from
++ * @blkcnt:	number of blocks to read
++ * @buffer:	destination buffer
++ *
++ * Read data from the block storage device.
++ *
++ * Return:
++ *
++ * number of blocks read on success. Otherwise, failure
++ */
++static ulong nvmxip_blk_read(struct udevice *dev, lbaint_t blknr, lbain=
t_t blkcnt, void *buffer)
++{
++	struct nvmxip_plat *plat =3D dev_get_plat(dev->parent);
++	struct blk_desc *desc =3D dev_get_uclass_plat(dev);
++	/* number of the u64 words to read */
++	u32 qwords =3D (blkcnt * desc->blksz) / sizeof(u64);
++	/* physical address of the first block to read */
++	phys_addr_t blkaddr =3D plat->phys_base + blknr * desc->blksz;
++	u64 *virt_blkaddr;
++	u64 *pdst =3D buffer;
++	uint qdata_idx;
++
++	if (!pdst)
++		return -EINVAL;
++
++	log_debug("[%s]: reading from blknr: %lu , blkcnt: %lu\n", dev->name, =
blknr, blkcnt);
++
++	virt_blkaddr =3D map_sysmem(blkaddr, 0);
++
++	/* assumption: the data is virtually contiguous */
++
++	for (qdata_idx =3D 0 ; qdata_idx < qwords ; qdata_idx++)
++		nvmxip_mmio_rawread((phys_addr_t)(virt_blkaddr + qdata_idx), pdst++);
++
++	log_debug("[%s]:     src[0]: 0x%llx , dst[0]: 0x%llx , src[-1]: 0x%llx=
 , dst[-1]: 0x%llx\n",
++		  dev->name,
++		  *virt_blkaddr,
++		  *(u64 *)buffer,
++		  *(u64 *)((u8 *)virt_blkaddr + desc->blksz * blkcnt - sizeof(u64)),
++		  *(u64 *)((u8 *)buffer + desc->blksz * blkcnt - sizeof(u64)));
++
++	unmap_sysmem(virt_blkaddr);
++
++	return blkcnt;
++}
++
++/**
++ * nvmxip_blk_probe() - block storage device probe
++ * @dev:	the block storage device
++ *
++ * Initialize the block storage descriptor.
++ *
++ * Return:
++ *
++ * Always return 0.
++ */
++static int nvmxip_blk_probe(struct udevice *dev)
++{
++	struct nvmxip_plat *plat =3D dev_get_plat(dev->parent);
++	struct blk_desc *desc =3D dev_get_uclass_plat(dev);
++
++	desc->lba =3D plat->lba;
++	desc->log2blksz =3D plat->lba_shift;
++	desc->blksz =3D BIT(plat->lba_shift);
++	desc->bdev =3D dev;
++
++	log_debug("[%s]: block storage layout\n    lbas: %lu , log2blksz: %d, =
blksz: %lu\n",
++		  dev->name, desc->lba, desc->log2blksz, desc->blksz);
++
++	return 0;
++}
++
++static const struct blk_ops nvmxip_blk_ops =3D {
++	.read	=3D nvmxip_blk_read,
++};
++
++U_BOOT_DRIVER(nvmxip_blk) =3D {
++	.name	=3D NVMXIP_BLKDRV_NAME,
++	.id	=3D UCLASS_BLK,
++	.probe	=3D nvmxip_blk_probe,
++	.ops	=3D &nvmxip_blk_ops,
++};
+diff --git a/drivers/mtd/nvmxip/nvmxip.h b/drivers/mtd/nvmxip/nvmxip.h
+new file mode 100644
+index 0000000000..f4ef37725d
+--- /dev/null
++++ b/drivers/mtd/nvmxip/nvmxip.h
+@@ -0,0 +1,32 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright 2023 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __DRIVER_NVMXIP_H__
++#define __DRIVER_NVMXIP_H__
++
++#include <blk.h>
++
++#define NVMXIP_BLKDRV_NAME    "nvmxip-blk"
++#define NVMXIP_BLKDEV_NAME_SZ 20
++
++/**
++ * struct nvmxip_plat - the NVMXIP driver plat
++ *
++ * @phys_base:	NVM XIP device base address
++ * @lba_shift:	block size shift count
++ * @lba:	number of blocks
++ *
++ * The NVMXIP information read from the DT.
++ */
++struct nvmxip_plat {
++	phys_addr_t phys_base;
++	u32 lba_shift;
++	lbaint_t lba;
++};
++
++#endif /* __DRIVER_NVMXIP_H__ */
+diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
+index fa08a66ac8..f3564a49d9 100644
+--- a/include/dm/uclass-id.h
++++ b/include/dm/uclass-id.h
+@@ -92,6 +92,7 @@ enum uclass_id {
+ 	UCLASS_NOP,		/* No-op devices */
+ 	UCLASS_NORTHBRIDGE,	/* Intel Northbridge / SDRAM controller */
+ 	UCLASS_NVME,		/* NVM Express device */
++	UCLASS_NVMXIP,		/* NVM XIP devices */
+ 	UCLASS_P2SB,		/* (x86) Primary-to-Sideband Bus */
+ 	UCLASS_PANEL,		/* Display panel, such as an LCD */
+ 	UCLASS_PANEL_BACKLIGHT,	/* Backlight controller for panel */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-dri=
vers-nvmxip-introduce-NVM-XIP-block-storage-emula.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0027-drivers-nvmxip-introduce-NVM-XI=
P-block-storage-emula.patch
deleted file mode 100644
index 30baf682..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-drivers-nv=
mxip-introduce-NVM-XIP-block-storage-emula.patch
+++ /dev/null
@@ -1,595 +0,0 @@
-From 1d277bc8c275fae8e8cd400344bdacbdce3a6b46 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Tue, 13 Dec 2022 19:47:49 +0000
-Subject: [PATCH 27/43] drivers/nvmxip: introduce NVM XIP block storage
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
-  nvmxip_qspi :
-
-    The driver probed with the DT and parent of the nvmxip-blk device.
-    nvmxip_qspi can be reused by other platforms. If the platform
-    has custom settings to apply before using the flash, then the platfo=
rm
-    can provide its own parent driver belonging to UCLASS_NVMXIP and reu=
se
-    nvmxip-blk. The custom driver can be implmented like nvmxip_qspi in
-    addition to the platform custom settings.
-
-Platforms can use multiple NVM XIP devices at the same time by defining =
a
-DT node for each one of them.
-
-For more details please refer to doc/develop/driver-model/nvmxip.rst
-
-Upstream-Status: Submitted
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- MAINTAINERS                                |   7 ++
- doc/develop/driver-model/index.rst         |   1 +
- doc/develop/driver-model/nvmxip.rst        |  70 ++++++++++++
- doc/device-tree-bindings/nvmxip/nvmxip.txt |  56 +++++++++
- drivers/Kconfig                            |   2 +
- drivers/Makefile                           |   1 +
- drivers/block/blk-uclass.c                 |   1 +
- drivers/nvmxip/Kconfig                     |  17 +++
- drivers/nvmxip/Makefile                    |   7 ++
- drivers/nvmxip/nvmxip-uclass.c             |  13 +++
- drivers/nvmxip/nvmxip.c                    | 127 +++++++++++++++++++++
- drivers/nvmxip/nvmxip.h                    |  46 ++++++++
- drivers/nvmxip/nvmxip_qspi.c               |  65 +++++++++++
- include/dm/uclass-id.h                     |   1 +
- 14 files changed, 414 insertions(+)
- create mode 100644 doc/develop/driver-model/nvmxip.rst
- create mode 100644 doc/device-tree-bindings/nvmxip/nvmxip.txt
- create mode 100644 drivers/nvmxip/Kconfig
- create mode 100644 drivers/nvmxip/Makefile
- create mode 100644 drivers/nvmxip/nvmxip-uclass.c
- create mode 100644 drivers/nvmxip/nvmxip.c
- create mode 100644 drivers/nvmxip/nvmxip.h
- create mode 100644 drivers/nvmxip/nvmxip_qspi.c
-
-diff --git a/MAINTAINERS b/MAINTAINERS
-index 9feaf0502f5b..ba15dd02d58d 100644
---- a/MAINTAINERS
-+++ b/MAINTAINERS
-@@ -1204,6 +1204,13 @@ F:	cmd/nvme.c
- F:	include/nvme.h
- F:	doc/develop/driver-model/nvme.rst
-=20
-+NVMXIP
-+M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+S:	Maintained
-+F:	doc/develop/driver-model/nvmxip.rst
-+F:	doc/device-tree-bindings/nvmxip/nvmxip.txt
-+F:	drivers/nvmxip/
-+
- NVMEM
- M:	Sean Anderson <seanga2@gmail.com>
- S:	Maintained
-diff --git a/doc/develop/driver-model/index.rst b/doc/develop/driver-mod=
el/index.rst
-index 7366ef818c5a..8e12bbd9366a 100644
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
-index 000000000000..91b24e4e50d2
---- /dev/null
-+++ b/doc/develop/driver-model/nvmxip.rst
-@@ -0,0 +1,70 @@
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
-+The NVMXIP class provides this functionality and can be used for any 64=
-bit platform.
-+
-+The NVMXIP class provides the following drivers:
-+
-+      nvmxip-blk :
-+
-+        A generic block driver allowing to read from the XIP flash.
-+	The driver belongs to UCLASS_BLK.
-+	The driver implemented by drivers/nvmxip/nvmxip.c
-+
-+      nvmxip_qspi :
-+
-+        The driver probed with the DT and parent of the nvmxip-blk devi=
ce.
-+        nvmxip_qspi can be reused by other platforms. If the platform
-+        has custom settings to apply before using the flash, then the p=
latform
-+        can provide its own parent driver belonging to UCLASS_NVMXIP an=
d reuse
-+        nvmxip-blk. The custom driver can be implmented like nvmxip_qsp=
i in
-+        addition to the platform custom settings.
-+	The nvmxip_qspi driver belongs to UCLASS_NVMXIP.
-+	The driver implemented by drivers/nvmxip/nvmxip_qspi.c
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
-+config NVMXIP_QSPI
-+	  This option allows the emulation of a block storage device on top of=
 a QSPI XIP flash.
-+	  Any platform that needs to emulate one or multiple XIP flash devices=
 can turn this
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
-+Multiple XIP flash devices can be used at the same time by describing t=
hem through DT
-+nodes.
-+
-+Please refer to the documentation of the DT binding at:
-+
-+doc/device-tree-bindings/nvmxip/nvmxip.txt
-+
-+Contributors
-+------------
-+   * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-diff --git a/doc/device-tree-bindings/nvmxip/nvmxip.txt b/doc/device-tre=
e-bindings/nvmxip/nvmxip.txt
-new file mode 100644
-index 000000000000..7c4b03f66b57
---- /dev/null
-+++ b/doc/device-tree-bindings/nvmxip/nvmxip.txt
-@@ -0,0 +1,56 @@
-+Specifying NVMXIP information for devices
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+NVM XIP flash device nodes
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
-diff --git a/drivers/Kconfig b/drivers/Kconfig
-index e51f0547c3da..d425ff1e76c7 100644
---- a/drivers/Kconfig
-+++ b/drivers/Kconfig
-@@ -78,6 +78,8 @@ source "drivers/net/Kconfig"
-=20
- source "drivers/nvme/Kconfig"
-=20
-+source "drivers/nvmxip/Kconfig"
-+
- source "drivers/pci/Kconfig"
-=20
- source "drivers/pci_endpoint/Kconfig"
-diff --git a/drivers/Makefile b/drivers/Makefile
-index f0a7530295c5..fb1b62cbd6ff 100644
---- a/drivers/Makefile
-+++ b/drivers/Makefile
-@@ -89,6 +89,7 @@ obj-$(CONFIG_FWU_MDATA) +=3D fwu-mdata/
- obj-y +=3D misc/
- obj-$(CONFIG_MMC) +=3D mmc/
- obj-$(CONFIG_NVME) +=3D nvme/
-+obj-$(CONFIG_NVMXIP) +=3D nvmxip/
- obj-$(CONFIG_PCI_ENDPOINT) +=3D pci_endpoint/
- obj-y +=3D dfu/
- obj-$(CONFIG_PCH) +=3D pch/
-diff --git a/drivers/block/blk-uclass.c b/drivers/block/blk-uclass.c
-index c69fc4d51829..e8ab576c3253 100644
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
-diff --git a/drivers/nvmxip/Kconfig b/drivers/nvmxip/Kconfig
-new file mode 100644
-index 000000000000..6a23acaf1895
---- /dev/null
-+++ b/drivers/nvmxip/Kconfig
-@@ -0,0 +1,17 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# Copyright (C) 2022, Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com=
>
-+
-+config NVMXIP
-+	bool "NVM XIP devices support"
-+	select BLK
-+	help
-+	  This option allows the emulation of a block storage device
-+	  on top of a direct access non volatile memory XIP flash devices.
-+	  This support provides the read operation.
-+
-+config NVMXIP_QSPI
-+	bool "QSPI XIP  support"
-+	select NVMXIP
-+	help
-+	  This option allows the emulation of a block storage device on top of=
 a QSPI XIP flash
-diff --git a/drivers/nvmxip/Makefile b/drivers/nvmxip/Makefile
-new file mode 100644
-index 000000000000..d8ad2a160b47
---- /dev/null
-+++ b/drivers/nvmxip/Makefile
-@@ -0,0 +1,7 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# (C) Copyright 2022
-+# Abdellatif El Khlifi, Arm Limited, abdellatif.elkhlifi@arm.com.
-+
-+obj-y +=3D nvmxip-uclass.o nvmxip.o
-+obj-$(CONFIG_NVMXIP_QSPI) +=3D nvmxip_qspi.o
-diff --git a/drivers/nvmxip/nvmxip-uclass.c b/drivers/nvmxip/nvmxip-ucla=
ss.c
-new file mode 100644
-index 000000000000..0f7e47b8af86
---- /dev/null
-+++ b/drivers/nvmxip/nvmxip-uclass.c
-@@ -0,0 +1,13 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+
-+UCLASS_DRIVER(nvmxip) =3D {
-+	.name	=3D "nvmxip",
-+	.id	=3D UCLASS_NVMXIP,
-+};
-diff --git a/drivers/nvmxip/nvmxip.c b/drivers/nvmxip/nvmxip.c
-new file mode 100644
-index 000000000000..6ba48183c575
---- /dev/null
-+++ b/drivers/nvmxip/nvmxip.c
-@@ -0,0 +1,127 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <dm/device-internal.h>
-+#include "nvmxip.h"
-+
-+static u32 nvmxip_bdev_max_devs;
-+
-+static int nvmxip_mmio_rawread(const phys_addr_t address, u64 *value)
-+{
-+	*value =3D readq(address);
-+	return 0;
-+}
-+
-+static ulong nvmxip_blk_read(struct udevice *udev, lbaint_t blknr, lbai=
nt_t blkcnt, void *buffer)
-+{
-+	struct nvmxip_blk_priv *bpriv_data =3D dev_get_priv(udev);
-+	struct blk_desc *desc =3D dev_get_uclass_plat(udev);
-+
-+	/* size of 1 block */
-+	/* number of the u64 words to read */
-+	u32 qwords =3D (blkcnt * desc->blksz) / sizeof(u64);
-+	/* physical address of the first block to read */
-+	phys_addr_t blkaddr =3D bpriv_data->pplat_data->phys_base + blknr * de=
sc->blksz;
-+	u64 *virt_blkaddr;
-+	u64 *pdst =3D buffer;
-+	u32 qdata_idx;
-+
-+	if (!pdst)
-+		return -EINVAL;
-+
-+	pr_debug("[%s]: reading from blknr: %lu , blkcnt: %lu\n", udev->name, =
blknr, blkcnt);
-+
-+	virt_blkaddr =3D map_sysmem(blkaddr, 0);
-+
-+	/* assumption: the data is virtually contiguous */
-+
-+	for (qdata_idx =3D 0 ; qdata_idx < qwords ; qdata_idx++)
-+		nvmxip_mmio_rawread((phys_addr_t)(virt_blkaddr + qdata_idx), pdst++);
-+
-+	pr_debug("[%s]:     src[0]: 0x%llx , dst[0]: 0x%llx , src[-1]: 0x%llx =
, dst[-1]: 0x%llx\n",
-+		 udev->name,
-+		 *virt_blkaddr,
-+		 *(u64 *)buffer,
-+		 *(u64 *)((u8 *)virt_blkaddr + desc->blksz * blkcnt - sizeof(u64)),
-+		 *(u64 *)((u8 *)buffer + desc->blksz * blkcnt - sizeof(u64)));
-+
-+	unmap_sysmem(virt_blkaddr);
-+
-+	return blkcnt;
-+}
-+
-+static int nvmxip_blk_probe(struct udevice *udev)
-+{
-+	struct nvmxip_priv *ppriv_data =3D dev_get_priv(udev->parent);
-+	struct blk_desc *desc =3D dev_get_uclass_plat(udev);
-+	struct nvmxip_blk_priv *bpriv_data =3D dev_get_priv(udev);
-+
-+	bpriv_data->bdev =3D udev;
-+	bpriv_data->pplat_data =3D ppriv_data->plat_data;
-+	desc->lba =3D bpriv_data->pplat_data->lba;
-+	desc->log2blksz =3D bpriv_data->pplat_data->lba_shift;
-+	desc->blksz =3D 1 << bpriv_data->pplat_data->lba_shift;
-+	desc->bdev =3D bpriv_data->bdev;
-+
-+	pr_debug("[%s]: block storage layout\n    lbas: %lu , log2blksz: %d, b=
lksz: %lu\n",
-+		 udev->name, desc->lba, desc->log2blksz, desc->blksz);
-+
-+	return 0;
-+}
-+
-+int nvmxip_init(struct udevice *udev)
-+{
-+	struct nvmxip_plat *plat_data =3D dev_get_plat(udev);
-+	struct nvmxip_priv *priv_data =3D dev_get_priv(udev);
-+	int ret;
-+	struct udevice *bdev =3D NULL;
-+	char bdev_name[NVMXIP_BLKDEV_NAME_SZ + 1] =3D {0};
-+
-+	priv_data->udev =3D udev;
-+	priv_data->plat_data =3D plat_data;
-+
-+	nvmxip_bdev_max_devs++;
-+
-+	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "nvmxip-blk#%d", nvmxip_bde=
v_max_devs);
-+
-+	ret =3D blk_create_devicef(udev, NVMXIP_BLKDRV_NAME, bdev_name, UCLASS=
_NVMXIP,
-+				 nvmxip_bdev_max_devs, NVMXIP_DEFAULT_LBA_SZ,
-+				 NVMXIP_DEFAULT_LBA_COUNT, &bdev);
-+	if (ret) {
-+		pr_err("[%s]: failure during creation of the block device %s, error %=
d\n",
-+		       udev->name, bdev_name, ret);
-+		goto blkdev_setup_error;
-+	}
-+
-+	ret =3D blk_probe_or_unbind(bdev);
-+	if (ret) {
-+		pr_err("[%s]: failure during probing the block device %s, error %d\n"=
,
-+		       udev->name, bdev_name, ret);
-+		goto blkdev_setup_error;
-+	}
-+
-+	pr_info("[%s]: the block device %s ready for use\n", udev->name, bdev_=
name);
-+
-+	return 0;
-+
-+blkdev_setup_error:
-+	nvmxip_bdev_max_devs--;
-+	return ret;
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
-+	.priv_auto	=3D sizeof(struct nvmxip_blk_priv),
-+};
-diff --git a/drivers/nvmxip/nvmxip.h b/drivers/nvmxip/nvmxip.h
-new file mode 100644
-index 000000000000..393172cc2f86
---- /dev/null
-+++ b/drivers/nvmxip/nvmxip.h
-@@ -0,0 +1,46 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#ifndef __DRIVER_NVMXIP_H__
-+#define __DRIVER_NVMXIP_H__
-+
-+#include <asm/io.h>
-+#include <blk.h>
-+#include <linux/bitops.h>
-+#include <linux/compat.h>
-+#include <mapmem.h>
-+
-+#define NVMXIP_BLKDRV_NAME    "nvmxip-blk"
-+
-+#define NVMXIP_BLKDEV_NAME_SZ 20
-+
-+#define NVMXIP_DEFAULT_LBA_SHIFT 10 /* 1024 bytes per block */
-+#define NVMXIP_DEFAULT_LBA_COUNT 1024 /* block count */
-+
-+#define NVMXIP_DEFAULT_LBA_SZ BIT(NVMXIP_DEFAULT_LBA_SHIFT)
-+
-+/* NVM XIP device platform data */
-+struct nvmxip_plat {
-+	phys_addr_t phys_base; /* NVM XIP device base address */
-+	u32 lba_shift; /* block size shift count (read from device tree) */
-+	lbaint_t lba; /* number of blocks (read from device tree) */
-+};
-+
-+/* NVM XIP device private data */
-+struct nvmxip_priv {
-+	struct udevice *udev;
-+	struct nvmxip_plat *plat_data;
-+};
-+
-+/* Private data of the block device associated with the NVM XIP device =
(the parent) */
-+struct nvmxip_blk_priv {
-+	struct udevice *bdev;
-+	struct nvmxip_plat *pplat_data; /* parent device platform data */
-+};
-+
-+int nvmxip_init(struct udevice *udev);
-+
-+#endif /* __DRIVER_NVMXIP_H__ */
-diff --git a/drivers/nvmxip/nvmxip_qspi.c b/drivers/nvmxip/nvmxip_qspi.c
-new file mode 100644
-index 000000000000..749625134acd
---- /dev/null
-+++ b/drivers/nvmxip/nvmxip_qspi.c
-@@ -0,0 +1,65 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <fdt_support.h>
-+#include "nvmxip.h"
-+
-+#include <asm/global_data.h>
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+#define NVMXIP_QSPI_DRV_NAME "nvmxip_qspi"
-+
-+static int nvmxip_qspi_probe(struct udevice *dev)
-+{
-+	pr_debug("[%s][%s]\n", __func__, dev->name);
-+	return nvmxip_init(dev);
-+}
-+
-+static int nvmxip_qspi_of_to_plat(struct udevice *dev)
-+{
-+	struct nvmxip_plat *plat_data =3D dev_get_plat(dev);
-+	int ret;
-+
-+	plat_data->phys_base =3D (phys_addr_t)dev_read_addr(dev);
-+	if (plat_data->phys_base =3D=3D FDT_ADDR_T_NONE) {
-+		pr_err("[%s]: can not get base address from device tree\n", dev->name=
);
-+		return -EINVAL;
-+	}
-+
-+	ret =3D dev_read_u32(dev, "lba_shift", &plat_data->lba_shift);
-+	if (ret) {
-+		pr_err("[%s]: can not get lba_shift from device tree\n", dev->name);
-+		return -EINVAL;
-+	}
-+
-+	ret =3D dev_read_u32(dev, "lba", (u32 *)&plat_data->lba);
-+	if (ret) {
-+		pr_err("[%s]: can not get lba from device tree\n", dev->name);
-+		return -EINVAL;
-+	}
-+
-+	pr_debug("[%s]: XIP device base addr: 0x%llx , lba_shift: %d , lbas: %=
lu\n",
-+		 dev->name, plat_data->phys_base, plat_data->lba_shift, plat_data->lb=
a);
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
-+	.priv_auto =3D sizeof(struct nvmxip_priv),
-+	.plat_auto =3D sizeof(struct nvmxip_plat),
-+	.probe =3D nvmxip_qspi_probe,
-+};
-diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
-index fa08a66ac8e0..f3564a49d912 100644
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
-2.39.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-dri=
vers-mtd-nvmxip-introduce-QSPI-XIP-driver.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0028-drivers-mtd-nvmxip-introduce-QSPI-XIP-d=
river.patch
new file mode 100644
index 00000000..aa3db9cb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-drivers-mt=
d-nvmxip-introduce-QSPI-XIP-driver.patch
@@ -0,0 +1,271 @@
+From 4b71ade0e8e5ad3692b1decb5c1d0c9472827535 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 14 Apr 2023 13:44:25 +0100
+Subject: [PATCH 28/42] drivers/mtd/nvmxip: introduce QSPI XIP driver
+
+add nvmxip_qspi driver under UCLASS_NVMXIP
+
+The device associated with this driver is the parent of the blk#<id> dev=
ice
+nvmxip_qspi can be reused by other platforms. If the platform
+has custom settings to apply before using the flash, then the platform
+can provide its own parent driver belonging to UCLASS_NVMXIP and reuse
+nvmxip-blk driver. The custom driver can be implemented like nvmxip_qspi=
 in
+addition to the platform custom settings.
+
+Platforms can use multiple NVM XIP devices at the same time by defining =
a
+DT node for each one of them.
+
+For more details please refer to doc/develop/driver-model/nvmxip_qspi.rs=
t
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
+---
+ MAINTAINERS                                   |  1 +
+ doc/develop/driver-model/nvmxip.rst           | 45 +++++++++++-
+ .../nvmxip/nvmxip_qspi.txt                    | 56 +++++++++++++++
+ drivers/mtd/nvmxip/Kconfig                    |  6 ++
+ drivers/mtd/nvmxip/Makefile                   |  1 +
+ drivers/mtd/nvmxip/nvmxip_qspi.c              | 70 +++++++++++++++++++
+ 6 files changed, 178 insertions(+), 1 deletion(-)
+ create mode 100644 doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
+ create mode 100644 drivers/mtd/nvmxip/nvmxip_qspi.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 1dbfab5f43..f81654346e 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -1206,6 +1206,7 @@ NVMXIP
+ M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+ S:	Maintained
+ F:	doc/develop/driver-model/nvmxip.rst
++F:	doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
+ F:	drivers/mtd/nvmxip/
+=20
+ NVMEM
+diff --git a/doc/develop/driver-model/nvmxip.rst b/doc/develop/driver-mo=
del/nvmxip.rst
+index fe087b13d2..09afdbcccf 100644
+--- a/doc/develop/driver-model/nvmxip.rst
++++ b/doc/develop/driver-model/nvmxip.rst
+@@ -25,7 +25,33 @@ The NVMXIP Uclass provides the following drivers:
+         the Uclass creates a block device and binds it with the nvmxip-=
blk.
+ 	The Uclass driver implemented by drivers/mtd/nvmxip/nvmxip-uclass.c
+=20
+-    The implementation is generic and can be used by different platform=
s.
++      nvmxip_qspi driver :
++
++        The driver probed with the DT and is the parent of the blk#<id>=
 device.
++        nvmxip_qspi can be reused by other platforms. If the platform
++        has custom settings to apply before using the flash, then the p=
latform
++        can provide its own parent driver belonging to UCLASS_NVMXIP an=
d reuse
++        nvmxip-blk. The custom driver can be implemented like nvmxip_qs=
pi in
++        addition to the platform custom settings.
++	The nvmxip_qspi driver belongs to UCLASS_NVMXIP.
++	The driver implemented by drivers/mtd/nvmxip/nvmxip_qspi.c
++
++	For example, if we have two NVMXIP devices described in the DT
++	The devices hierarchy is as follows:
++
++::
++
++   =3D> dm tree
++
++        Class     Index  Probed  Driver                Name
++    -----------------------------------------------------------
++    ...
++     nvmxip        0  [ + ]   nvmxip_qspi           |-- nvmxip-qspi1@08=
000000
++     blk           3  [ + ]   nvmxip-blk                    |   `-- nvm=
xip-qspi1@08000000.blk#1
++     nvmxip        1  [ + ]   nvmxip_qspi           |-- nvmxip-qspi2@08=
200000
++     blk           4  [ + ]   nvmxip-blk                    |   `-- nvm=
xip-qspi2@08200000.blk#2
++
++The implementation is generic and can be used by different platforms.
+=20
+ Supported hardware
+ --------------------------------
+@@ -43,6 +69,23 @@ config NVMXIP
+ 	  handles the read operation. This driver is HW agnostic and can suppo=
rt
+ 	  multiple flash devices at the same time.
+=20
++config NVMXIP_QSPI
++	  This option allows the emulation of a block storage device on top of=
 a QSPI XIP flash.
++	  Any platform that needs to emulate one or multiple QSPI XIP flash de=
vices can turn this
++	  option on to enable the functionality. NVMXIP config is selected aut=
omatically.
++	  Platforms that need to add custom treatments before accessing to the=
 flash, can
++	  write their own driver (same as nvmxip_qspi in addition to the custo=
m settings).
++
++Device Tree nodes
++--------------------
++
++Multiple QSPI XIP flash devices can be used at the same time by describ=
ing them through DT
++nodes.
++
++Please refer to the documentation of the DT binding at:
++
++doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
++
+ Contributors
+ ------------
+    * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+diff --git a/doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt b/doc/devic=
e-tree-bindings/nvmxip/nvmxip_qspi.txt
+new file mode 100644
+index 0000000000..cc60e9efdc
+--- /dev/null
++++ b/doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
+@@ -0,0 +1,56 @@
++Specifying NVMXIP information for devices
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++QSPI XIP flash device nodes
++---------------------------
++
++Each flash device should have its own node.
++
++Each node must specify the following fields:
++
++1)
++		compatible =3D "nvmxip,qspi";
++
++This allows to bind the flash device with the nvmxip_qspi driver
++If a platform has its own driver, please provide your own compatible
++string.
++
++2)
++		reg =3D <0x0 0x08000000 0x0 0x00200000>;
++
++The start address and size of the flash device. The values give here ar=
e an
++example (when the cell size is 2).
++
++When cell size is 1, the reg field looks like this:
++
++		reg =3D <0x08000000 0x00200000>;
++
++3)
++
++		lba_shift =3D <9>;
++
++The number of bit shifts used to calculate the size in bytes of one blo=
ck.
++In this example the block size is 1 << 9 =3D 2 ^ 9 =3D 512 bytes
++
++4)
++
++		lba =3D <4096>;
++
++The number of blocks.
++
++Example of multiple flash devices
++----------------------------------------------------
++
++	nvmxip-qspi1@08000000 {
++		compatible =3D "nvmxip,qspi";
++		reg =3D <0x0 0x08000000 0x0 0x00200000>;
++		lba_shift =3D <9>;
++		lba =3D <4096>;
++	};
++
++	nvmxip-qspi2@08200000 {
++		compatible =3D "nvmxip,qspi";
++		reg =3D <0x0 0x08200000 0x0 0x00100000>;
++		lba_shift =3D <9>;
++		lba =3D <2048>;
++	};
+diff --git a/drivers/mtd/nvmxip/Kconfig b/drivers/mtd/nvmxip/Kconfig
+index ef53fc3c79..3ef7105026 100644
+--- a/drivers/mtd/nvmxip/Kconfig
++++ b/drivers/mtd/nvmxip/Kconfig
+@@ -11,3 +11,9 @@ config NVMXIP
+ 	  This option allows the emulation of a block storage device
+ 	  on top of a direct access non volatile memory XIP flash devices.
+ 	  This support provides the read operation.
++
++config NVMXIP_QSPI
++	bool "QSPI XIP  support"
++	select NVMXIP
++	help
++	  This option allows the emulation of a block storage device on top of=
 a QSPI XIP flash
+diff --git a/drivers/mtd/nvmxip/Makefile b/drivers/mtd/nvmxip/Makefile
+index 07890982c7..54eacc102e 100644
+--- a/drivers/mtd/nvmxip/Makefile
++++ b/drivers/mtd/nvmxip/Makefile
+@@ -5,3 +5,4 @@
+ #   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+=20
+ obj-y +=3D nvmxip-uclass.o nvmxip.o
++obj-$(CONFIG_NVMXIP_QSPI) +=3D nvmxip_qspi.o
+diff --git a/drivers/mtd/nvmxip/nvmxip_qspi.c b/drivers/mtd/nvmxip/nvmxi=
p_qspi.c
+new file mode 100644
+index 0000000000..7221fd1cb4
+--- /dev/null
++++ b/drivers/mtd/nvmxip/nvmxip_qspi.c
+@@ -0,0 +1,70 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2023 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <fdt_support.h>
++#include <linux/errno.h>
++#include "nvmxip.h"
++
++#include <asm/global_data.h>
++DECLARE_GLOBAL_DATA_PTR;
++
++#define NVMXIP_QSPI_DRV_NAME "nvmxip_qspi"
++
++/**
++ * nvmxip_qspi_of_to_plat() -read from DT
++ * @dev:	the NVMXIP device
++ *
++ * Read from the DT the NVMXIP information.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int nvmxip_qspi_of_to_plat(struct udevice *dev)
++{
++	struct nvmxip_plat *plat =3D dev_get_plat(dev);
++	int ret;
++
++	plat->phys_base =3D (phys_addr_t)dev_read_addr(dev);
++	if (plat->phys_base =3D=3D FDT_ADDR_T_NONE) {
++		log_err("[%s]: can not get base address from device tree\n", dev->nam=
e);
++		return -EINVAL;
++	}
++
++	ret =3D dev_read_u32(dev, "lba_shift", &plat->lba_shift);
++	if (ret) {
++		log_err("[%s]: can not get lba_shift from device tree\n", dev->name);
++		return -EINVAL;
++	}
++
++	ret =3D dev_read_u32(dev, "lba", (u32 *)&plat->lba);
++	if (ret) {
++		log_err("[%s]: can not get lba from device tree\n", dev->name);
++		return -EINVAL;
++	}
++
++	log_debug("[%s]: XIP device base addr: 0x%llx , lba_shift: %d , lbas: =
%lu\n",
++		  dev->name, plat->phys_base, plat->lba_shift, plat->lba);
++
++	return 0;
++}
++
++static const struct udevice_id nvmxip_qspi_ids[] =3D {
++	{ .compatible =3D "nvmxip,qspi" },
++	{ /* sentinel */ }
++};
++
++U_BOOT_DRIVER(nvmxip_qspi) =3D {
++	.name =3D NVMXIP_QSPI_DRV_NAME,
++	.id =3D UCLASS_NVMXIP,
++	.of_match =3D nvmxip_qspi_ids,
++	.of_to_plat =3D nvmxip_qspi_of_to_plat,
++	.plat_auto =3D sizeof(struct nvmxip_plat),
++};
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-san=
dbox64-add-support-for-NVMXIP-QSPI.patch b/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot/corstone1000/0029-sandbox64-add-support-for-NVMXIP-QSPI.patch
deleted file mode 100644
index d6168b99..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-sandbox64-=
add-support-for-NVMXIP-QSPI.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 2b0606f603de13524ce9b63578f4c3358c3ac6df Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 22 Dec 2022 12:15:42 +0000
-Subject: [PATCH 29/43] sandbox64: add support for NVMXIP QSPI
-
-enable NVMXIP QSPI for sandbox 64-bit
-
-Adding two NVM XIP QSPI storage devices.
-
-Upstream-Status: Submitted
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/sandbox/dts/sandbox64.dts | 13 +++++++++++++
- arch/sandbox/dts/test.dts      | 14 ++++++++++++++
- configs/sandbox_defconfig      |  1 +
- drivers/nvmxip/nvmxip.c        |  4 ++++
- drivers/nvmxip/nvmxip.h        |  3 +++
- 5 files changed, 35 insertions(+)
-
-diff --git a/arch/sandbox/dts/sandbox64.dts b/arch/sandbox/dts/sandbox64=
.dts
-index a9cd7908f83e..aed3801af8a9 100644
---- a/arch/sandbox/dts/sandbox64.dts
-+++ b/arch/sandbox/dts/sandbox64.dts
-@@ -89,6 +89,19 @@
- 		cs-gpios =3D <0>, <&gpio_a 0>;
- 	};
-=20
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
- };
-=20
- #include "sandbox.dtsi"
-diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
-index 2e580f980fc6..54f2b308e793 100644
---- a/arch/sandbox/dts/test.dts
-+++ b/arch/sandbox/dts/test.dts
-@@ -1756,6 +1756,20 @@
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
-diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
-index e6ea96a6b924..f22230b5cce2 100644
---- a/configs/sandbox_defconfig
-+++ b/configs/sandbox_defconfig
-@@ -138,6 +138,7 @@ CONFIG_NETCONSOLE=3Dy
- CONFIG_IP_DEFRAG=3Dy
- CONFIG_BOOTP_SERVERIP=3Dy
- CONFIG_IPV6=3Dy
-+CONFIG_NVMXIP_QSPI=3Dy
- CONFIG_DM_DMA=3Dy
- CONFIG_DEVRES=3Dy
- CONFIG_DEBUG_DEVRES=3Dy
-diff --git a/drivers/nvmxip/nvmxip.c b/drivers/nvmxip/nvmxip.c
-index 6ba48183c575..af9c9a3b7270 100644
---- a/drivers/nvmxip/nvmxip.c
-+++ b/drivers/nvmxip/nvmxip.c
-@@ -85,6 +85,10 @@ int nvmxip_init(struct udevice *udev)
- 	priv_data->udev =3D udev;
- 	priv_data->plat_data =3D plat_data;
-=20
-+#if CONFIG_IS_ENABLED(SANDBOX64)
-+	sandbox_set_enable_memio(true);
-+#endif
-+
- 	nvmxip_bdev_max_devs++;
-=20
- 	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "nvmxip-blk#%d", nvmxip_bde=
v_max_devs);
-diff --git a/drivers/nvmxip/nvmxip.h b/drivers/nvmxip/nvmxip.h
-index 393172cc2f86..0384ce2e2b47 100644
---- a/drivers/nvmxip/nvmxip.h
-+++ b/drivers/nvmxip/nvmxip.h
-@@ -8,6 +8,9 @@
- #define __DRIVER_NVMXIP_H__
-=20
- #include <asm/io.h>
-+#if CONFIG_IS_ENABLED(SANDBOX64)
-+#include <asm/test.h>
-+#endif
- #include <blk.h>
- #include <linux/bitops.h>
- #include <linux/compat.h>
---=20
-2.39.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-san=
dbox64-fix-return-unsigned-long-in-readq.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0029-sandbox64-fix-return-unsigned-long-in-re=
adq.patch
similarity index 81%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-sand=
box64-fix-return-unsigned-long-in-readq.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-sandbo=
x64-fix-return-unsigned-long-in-readq.patch
index b0e83667..c90bcc78 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-sandbox64-=
fix-return-unsigned-long-in-readq.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-sandbox64-=
fix-return-unsigned-long-in-readq.patch
@@ -1,22 +1,21 @@
-From 3262ee6a5300221969e61eff7a8f18336a135a73 Mon Sep 17 00:00:00 2001
+From 1b80dfbefd59c8ddff77960552d6c0cc2747758c Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 16 Dec 2022 17:20:58 +0000
-Subject: [PATCH 28/43] sandbox64: fix: return unsigned long in readq()
+Subject: [PATCH 29/42] sandbox64: fix: return unsigned long in readq()
=20
 make readq return unsigned long
=20
 readq should return 64-bit data
=20
-Upstream-Status: Submitted
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
 ---
  arch/sandbox/cpu/cpu.c        | 2 +-
  arch/sandbox/include/asm/io.h | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/arch/sandbox/cpu/cpu.c b/arch/sandbox/cpu/cpu.c
-index 636d3545b954..248d17a85c82 100644
+index 636d3545b9..248d17a85c 100644
 --- a/arch/sandbox/cpu/cpu.c
 +++ b/arch/sandbox/cpu/cpu.c
 @@ -230,7 +230,7 @@ phys_addr_t map_to_sysmem(const void *ptr)
@@ -29,7 +28,7 @@ index 636d3545b954..248d17a85c82 100644
  	struct sandbox_state *state =3D state_get_current();
 =20
 diff --git a/arch/sandbox/include/asm/io.h b/arch/sandbox/include/asm/io=
.h
-index ad6c29a4e26c..31ab7289b4bd 100644
+index ad6c29a4e2..31ab7289b4 100644
 --- a/arch/sandbox/include/asm/io.h
 +++ b/arch/sandbox/include/asm/io.h
 @@ -45,7 +45,7 @@ static inline void unmap_sysmem(const void *vaddr)
@@ -42,5 +41,5 @@ index ad6c29a4e26c..31ab7289b4bd 100644
 =20
  #define readb(addr) sandbox_read((const void *)addr, SB_SIZE_8)
 --=20
-2.39.2
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-san=
dbox64-add-support-for-NVMXIP-QSPI.patch b/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot/corstone1000/0030-sandbox64-add-support-for-NVMXIP-QSPI.patch
new file mode 100644
index 00000000..941e9d10
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-sandbox64-=
add-support-for-NVMXIP-QSPI.patch
@@ -0,0 +1,161 @@
+From 25467e433f02f40f5999ed6e6b0d3adb4c9cf16d Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Fri, 9 Jun 2023 13:08:37 +0100
+Subject: [PATCH 30/42] sandbox64: add support for NVMXIP QSPI
+
+enable NVMXIP QSPI for sandbox 64-bit
+
+Adding two NVM XIP QSPI storage devices.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
+
+Changelog:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+v2:
+
+* address nits
+---
+ arch/sandbox/dts/sandbox64.dts                  | 13 +++++++++++++
+ arch/sandbox/dts/test.dts                       | 14 ++++++++++++++
+ configs/sandbox64_defconfig                     |  3 ++-
+ doc/develop/driver-model/nvmxip.rst             |  2 +-
+ doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt |  6 +++---
+ drivers/mtd/nvmxip/nvmxip-uclass.c              |  7 +++++++
+ 6 files changed, 40 insertions(+), 5 deletions(-)
+
+diff --git a/arch/sandbox/dts/sandbox64.dts b/arch/sandbox/dts/sandbox64=
.dts
+index 3eb0457089..c9a2f4b4a4 100644
+--- a/arch/sandbox/dts/sandbox64.dts
++++ b/arch/sandbox/dts/sandbox64.dts
+@@ -89,6 +89,19 @@
+ 		cs-gpios =3D <0>, <&gpio_a 0>;
+ 	};
+=20
++	nvmxip-qspi1@08000000 {
++		compatible =3D "nvmxip,qspi";
++		reg =3D /bits/ 64 <0x08000000 0x00200000>;
++		lba_shift =3D <9>;
++		lba =3D <4096>;
++	};
++
++	nvmxip-qspi2@08200000 {
++		compatible =3D "nvmxip,qspi";
++		reg =3D /bits/ 64 <0x08200000 0x00100000>;
++		lba_shift =3D <9>;
++		lba =3D <2048>;
++	};
+ };
+=20
+ #include "sandbox.dtsi"
+diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
+index dffe10adbf..c3ba0a225e 100644
+--- a/arch/sandbox/dts/test.dts
++++ b/arch/sandbox/dts/test.dts
+@@ -1745,6 +1745,20 @@
+ 		compatible =3D "u-boot,fwu-mdata-gpt";
+ 		fwu-mdata-store =3D <&mmc0>;
+ 	};
++
++	nvmxip-qspi1@08000000 {
++		compatible =3D "nvmxip,qspi";
++		reg =3D <0x08000000 0x00200000>;
++		lba_shift =3D <9>;
++		lba =3D <4096>;
++	};
++
++	nvmxip-qspi2@08200000 {
++		compatible =3D "nvmxip,qspi";
++		reg =3D <0x08200000 0x00100000>;
++		lba_shift =3D <9>;
++		lba =3D <2048>;
++	};
+ };
+=20
+ #include "sandbox_pmic.dtsi"
+diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
+index 4b8a1ec42b..2dca176ae3 100644
+--- a/configs/sandbox64_defconfig
++++ b/configs/sandbox64_defconfig
+@@ -260,4 +260,5 @@ CONFIG_UNIT_TEST=3Dy
+ CONFIG_UT_TIME=3Dy
+ CONFIG_UT_DM=3Dy
+ CONFIG_ARM_FFA_TRANSPORT=3Dy
+-CONFIG_SANDBOX_FFA=3Dy
+\ No newline at end of file
++CONFIG_SANDBOX_FFA=3Dy
++CONFIG_NVMXIP_QSPI=3Dy
+\ No newline at end of file
+diff --git a/doc/develop/driver-model/nvmxip.rst b/doc/develop/driver-mo=
del/nvmxip.rst
+index 09afdbcccf..e85dc220b9 100644
+--- a/doc/develop/driver-model/nvmxip.rst
++++ b/doc/develop/driver-model/nvmxip.rst
+@@ -56,7 +56,7 @@ The implementation is generic and can be used by diffe=
rent platforms.
+ Supported hardware
+ --------------------------------
+=20
+-Any 64-bit plaform.
++Any plaform supporting readq().
+=20
+ Configuration
+ ----------------------
+diff --git a/doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt b/doc/devic=
e-tree-bindings/nvmxip/nvmxip_qspi.txt
+index cc60e9efdc..882728d541 100644
+--- a/doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
++++ b/doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
+@@ -16,7 +16,7 @@ If a platform has its own driver, please provide your =
own compatible
+ string.
+=20
+ 2)
+-		reg =3D <0x0 0x08000000 0x0 0x00200000>;
++		reg =3D /bits/ 64 <0x08000000 0x00200000>;
+=20
+ The start address and size of the flash device. The values give here ar=
e an
+ example (when the cell size is 2).
+@@ -43,14 +43,14 @@ Example of multiple flash devices
+=20
+ 	nvmxip-qspi1@08000000 {
+ 		compatible =3D "nvmxip,qspi";
+-		reg =3D <0x0 0x08000000 0x0 0x00200000>;
++		reg =3D /bits/ 64 <0x08000000 0x00200000>;
+ 		lba_shift =3D <9>;
+ 		lba =3D <4096>;
+ 	};
+=20
+ 	nvmxip-qspi2@08200000 {
+ 		compatible =3D "nvmxip,qspi";
+-		reg =3D <0x0 0x08200000 0x0 0x00100000>;
++		reg =3D /bits/ 64 <0x08200000 0x00100000>;
+ 		lba_shift =3D <9>;
+ 		lba =3D <2048>;
+ 	};
+diff --git a/drivers/mtd/nvmxip/nvmxip-uclass.c b/drivers/mtd/nvmxip/nvm=
xip-uclass.c
+index 9f96041e3d..6d8eb177b5 100644
+--- a/drivers/mtd/nvmxip/nvmxip-uclass.c
++++ b/drivers/mtd/nvmxip/nvmxip-uclass.c
+@@ -9,6 +9,9 @@
+ #include <common.h>
+ #include <dm.h>
+ #include <log.h>
++#if CONFIG_IS_ENABLED(SANDBOX64)
++#include <asm/test.h>
++#endif
+ #include <linux/bitops.h>
+ #include "nvmxip.h"
+=20
+@@ -36,6 +39,10 @@ static int nvmxip_post_bind(struct udevice *udev)
+ 	char bdev_name[NVMXIP_BLKDEV_NAME_SZ + 1];
+ 	int devnum;
+=20
++#if CONFIG_IS_ENABLED(SANDBOX64)
++	sandbox_set_enable_memio(true);
++#endif
++
+ 	devnum =3D uclass_id_count(UCLASS_NVMXIP);
+ 	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "blk#%d", devnum);
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-cor=
stone1000-add-NVM-XIP-QSPI-device-tree-node.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0031-corstone1000-add-NVM-XIP-QSPI-device-=
tree-node.patch
similarity index 51%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-cors=
tone1000-add-NVM-XIP-QSPI-device-tree-node.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corsto=
ne1000-add-NVM-XIP-QSPI-device-tree-node.patch
index 21ad2109..08e9d317 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone10=
00-add-NVM-XIP-QSPI-device-tree-node.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone10=
00-add-NVM-XIP-QSPI-device-tree-node.patch
@@ -1,21 +1,28 @@
-From 3f72e390fc8e1a0d774d80c3ccd21be38c9af1db Mon Sep 17 00:00:00 2001
+From 635848c90343a1b8a268519e3fc78ef7af2e4819 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 19 Dec 2022 13:20:19 +0000
-Subject: [PATCH 30/43] corstone1000: add NVM XIP QSPI device tree node
+Subject: [PATCH 31/42] corstone1000: add NVM XIP QSPI device tree node
=20
 add QSPI flash device node for block storage access
=20
-Upstream-Status: Submitted
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
 ---
- arch/arm/dts/corstone1000.dtsi | 7 +++++++
- 1 file changed, 7 insertions(+)
+ arch/arm/dts/corstone1000.dtsi | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 61e0c33247ce..faf4e12bab2a 100644
+index 61e0c33247..18c4d1e19a 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0 or MIT
+ /*
+- * Copyright (c) 2022, Arm Limited. All rights reserved.
++ * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
+  * Copyright (c) 2022, Linaro Limited. All rights reserved.
+  *
+  */
 @@ -38,6 +38,13 @@
  		reg =3D <0x88200000 0x77e00000>;
  	};
@@ -31,5 +38,5 @@ index 61e0c33247ce..faf4e12bab2a 100644
  		compatible =3D "arm,gic-400";
  		#interrupt-cells =3D <3>;
 --=20
-2.39.2
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-cor=
stone1000-enable-NVM-XIP-QSPI-flash.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0031-corstone1000-enable-NVM-XIP-QSPI-flash.patch
deleted file mode 100644
index 64bf97d1..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone10=
00-enable-NVM-XIP-QSPI-flash.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0c3d61d499039ff0828376bb21b4fb1de071b8d2 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Mon, 19 Dec 2022 13:25:23 +0000
-Subject: [PATCH 31/43] corstone1000: enable NVM XIP QSPI flash
-
-add the QSPI flash device with block storage capability
-
-Upstream-Status: Submitted
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- configs/corstone1000_defconfig | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 1179bf5f3bfd..2986cc95932f 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -58,6 +58,7 @@ CONFIG_DM_SERIAL=3Dy
- CONFIG_USB=3Dy
- CONFIG_USB_ISP1760=3Dy
- CONFIG_ERRNO_STR=3Dy
-+CONFIG_NVMXIP_QSPI=3Dy
- CONFIG_EFI_MM_COMM_TEE=3Dy
- CONFIG_ARM_FFA_TRANSPORT=3Dy
- CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
---=20
-2.39.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-san=
dbox64-add-a-test-case-for-UCLASS_NVMXIP.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0032-sandbox64-add-a-test-case-for-UCLASS_NVM=
XIP.patch
index 57242834..923eac9b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-sandbox64-=
add-a-test-case-for-UCLASS_NVMXIP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-sandbox64-=
add-a-test-case-for-UCLASS_NVMXIP.patch
@@ -1,7 +1,7 @@
-From 3be91bde755c376a38c3affb9640b39df1acdd9c Mon Sep 17 00:00:00 2001
+From 0ecb61da60febc66e589d6fbf439478af1c88283 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 22 Dec 2022 11:30:16 +0000
-Subject: [PATCH 32/43] sandbox64: add a test case for UCLASS_NVMXIP
+Date: Mon, 12 Jun 2023 17:33:54 +0100
+Subject: [PATCH 32/42] sandbox64: add a test case for UCLASS_NVMXIP
=20
 provide a test for NVM XIP devices
=20
@@ -11,32 +11,47 @@ The test case allows to make sure of the following:
 - The DT entries are read correctly
 - the data read from the flash by the NVMXIP block driver is correct
=20
-Upstream-Status: Submitted
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/c9c2c=
95d4cd27fe0cd41fe13a863899d268f973c]
+
+Changelog:
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+v2:
+
+* address nits
 ---
  MAINTAINERS      |   1 +
- test/dm/Makefile |   4 ++
- test/dm/nvmxip.c | 115 +++++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 120 insertions(+)
+ test/dm/Makefile |   6 +-
+ test/dm/nvmxip.c | 145 +++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 151 insertions(+), 1 deletion(-)
  create mode 100644 test/dm/nvmxip.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index ba15dd02d58d..82cb6075cb32 100644
+index f81654346e..6692ce9974 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -1210,6 +1210,7 @@ S:	Maintained
+@@ -1208,6 +1208,7 @@ S:	Maintained
  F:	doc/develop/driver-model/nvmxip.rst
- F:	doc/device-tree-bindings/nvmxip/nvmxip.txt
- F:	drivers/nvmxip/
+ F:	doc/device-tree-bindings/nvmxip/nvmxip_qspi.txt
+ F:	drivers/mtd/nvmxip/
 +F:	test/dm/nvmxip.c
 =20
  NVMEM
  M:	Sean Anderson <seanga2@gmail.com>
 diff --git a/test/dm/Makefile b/test/dm/Makefile
-index 85e99e1c120e..bc8214da2da2 100644
+index 85e99e1c12..963fa927f7 100644
 --- a/test/dm/Makefile
 +++ b/test/dm/Makefile
+@@ -1,7 +1,7 @@
+ # SPDX-License-Identifier: GPL-2.0+
+ #
+ # Copyright (c) 2013 Google, Inc
+-# (C) Copyright 2022 ARM Limited
++# Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-of=
fice@arm.com>
+=20
+ obj-$(CONFIG_UT_DM) +=3D test-dm.o
+=20
 @@ -18,6 +18,10 @@ obj-$(CONFIG_UT_DM) +=3D test-uclass.o
  obj-$(CONFIG_UT_DM) +=3D core.o
  obj-$(CONFIG_UT_DM) +=3D read.o
@@ -50,28 +65,32 @@ index 85e99e1c120e..bc8214da2da2 100644
  obj-y +=3D acpi.o
 diff --git a/test/dm/nvmxip.c b/test/dm/nvmxip.c
 new file mode 100644
-index 000000000000..484e6077b4a9
+index 0000000000..e934748eb5
 --- /dev/null
 +++ b/test/dm/nvmxip.c
-@@ -0,0 +1,115 @@
+@@ -0,0 +1,145 @@
 +// SPDX-License-Identifier: GPL-2.0+
 +/*
 + * Functional tests for UCLASS_FFA  class
 + *
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ * Copyright 2023 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ * Authors:
++ *   Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 + */
 +
 +#include <common.h>
-+#include <console.h>
 +#include <blk.h>
++#include <console.h>
 +#include <dm.h>
++#include <mapmem.h>
 +#include <dm/test.h>
-+#include "../../drivers/nvmxip/nvmxip.h"
++#include <linux/bitops.h>
 +#include <test/test.h>
 +#include <test/ut.h>
++#include "../../drivers/mtd/nvmxip/nvmxip.h"
 +
-+/* NVMXIP devices described in the device tree  */
++/* NVMXIP devices described in the device tree */
 +#define SANDBOX_NVMXIP_DEVICES 2
 +
 +/* reference device tree data for the probed devices */
@@ -82,37 +101,56 @@ index 000000000000..484e6077b4a9
 +#define NVMXIP_BLK_START_PATTERN 0x1122334455667788ULL
 +#define NVMXIP_BLK_END_PATTERN 0xa1a2a3a4a5a6a7a8ULL
 +
-+static int dm_nvmxip_flash_sanity(u8 device_idx, void *buffer)
++/**
++ * dm_nvmxip_flash_sanity() - check flash data
++ * @uts: test state
++ * @device_idx:	the NVMXIP device index
++ * @buffer:	the user buffer where the blocks data is copied to
++ *
++ * Mode 1: When buffer is NULL, initialize the flash with pattern data =
at the start
++ * and at the end of each block. This pattern data will be used to chec=
k data consistency
++ * when verifying the data read.
++ * Mode 2: When the user buffer is provided in the argument (not NULL),=
 compare the data
++ * of the start and the end of each block in the user buffer with the e=
xpected pattern data.
++ * Return an error when the check fails.
++ *
++ * Return:
++ *
++ * 0 on success. Otherwise, failure
++ */
++static int dm_nvmxip_flash_sanity(struct unit_test_state *uts, u8 devic=
e_idx, void *buffer)
 +{
 +	int i;
-+	u64 *ptr =3D NULL;
-+	u8 *base =3D NULL;
++	u64 *ptr;
++	u8 *base;
 +	unsigned long blksz;
 +
-+	blksz =3D 1 << nvmqspi_refdata[device_idx].lba_shift;
++	blksz =3D BIT(nvmqspi_refdata[device_idx].lba_shift);
 +
-+	/* if buffer not NULL, init the flash with the pattern data*/
-+	if (!buffer)
++	if (!buffer) {
++		/* Mode 1: point at the flash start address. Pattern data will be wri=
tten */
 +		base =3D map_sysmem(nvmqspi_refdata[device_idx].phys_base, 0);
-+	else
++	} else {
++		/* Mode 2: point at the user buffer containing the data read and to b=
e verified */
 +		base =3D buffer;
++	}
 +
 +	for (i =3D 0; i < nvmqspi_refdata[device_idx].lba ; i++) {
 +		ptr =3D (u64 *)(base + i * blksz);
 +
-+		/* write an 8 bytes pattern at the start of the current block*/
++		/* write an 8 bytes pattern at the start of the current block */
 +		if (!buffer)
 +			*ptr =3D NVMXIP_BLK_START_PATTERN;
-+		else if (*ptr !=3D NVMXIP_BLK_START_PATTERN)
-+			return -EINVAL;
++		else
++			ut_asserteq_64(NVMXIP_BLK_START_PATTERN, *ptr);
 +
 +		ptr =3D (u64 *)((u8 *)ptr + blksz - sizeof(u64));
 +
-+		/* write an 8 bytes pattern at the end of the current block*/
++		/* write an 8 bytes pattern at the end of the current block */
 +		if (!buffer)
 +			*ptr =3D NVMXIP_BLK_END_PATTERN;
-+		else if (*ptr !=3D NVMXIP_BLK_END_PATTERN)
-+			return -EINVAL;
++		else
++			ut_asserteq_64(NVMXIP_BLK_END_PATTERN, *ptr);
 +	}
 +
 +	if (!buffer)
@@ -121,6 +159,13 @@ index 000000000000..484e6077b4a9
 +	return 0;
 +}
 +
++/**
++ * dm_test_nvmxip() - check flash data
++ * @uts: test state
++ * Return:
++ *
++ * CMD_RET_SUCCESS on success. Otherwise, failure
++ */
 +static int dm_test_nvmxip(struct unit_test_state *uts)
 +{
 +	struct nvmxip_plat *plat_data =3D NULL;
@@ -130,10 +175,10 @@ index 000000000000..484e6077b4a9
 +	unsigned long flashsz;
 +
 +	/* set the flash content first for both devices */
-+	dm_nvmxip_flash_sanity(0, NULL);
-+	dm_nvmxip_flash_sanity(1, NULL);
++	dm_nvmxip_flash_sanity(uts, 0, NULL);
++	dm_nvmxip_flash_sanity(uts, 1, NULL);
 +
-+	/*  probing all NVM XIP QSPI devices */
++	/* probing all NVM XIP QSPI devices */
 +	for (device_idx =3D 0, uclass_first_device(UCLASS_NVMXIP, &dev);
 +	     dev;
 +	     uclass_next_device(&dev), device_idx++) {
@@ -151,14 +196,14 @@ index 000000000000..484e6077b4a9
 +		buffer =3D calloc(flashsz, 1);
 +		ut_assertok(!buffer);
 +
-+		/* the block device is the child of the parent device probed with DT*=
/
++		/* the block device is the child of the parent device probed with DT =
*/
 +		ut_assertok(device_find_first_child(dev, &bdev));
 +
-+		/* reading all the flash blocks*/
++		/* reading all the flash blocks */
 +		ut_asserteq(plat_data->lba, blk_read(bdev, 0, plat_data->lba, buffer)=
);
 +
 +		/* compare the data read from flash with the expected data */
-+		ut_assertok(dm_nvmxip_flash_sanity(device_idx, buffer));
++		dm_nvmxip_flash_sanity(uts, device_idx, buffer);
 +
 +		free(buffer);
 +	}
@@ -170,5 +215,5 @@ index 000000000000..484e6077b4a9
 +
 +DM_TEST(dm_test_nvmxip, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
 --=20
-2.39.2
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-cor=
stone1000-add-fwu-metadata-store-info.patch b/meta-arm-bsp/recipes-bsp/u-=
boot/u-boot/corstone1000/0033-corstone1000-add-fwu-metadata-store-info.pa=
tch
similarity index 83%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-cors=
tone1000-add-fwu-metadata-store-info.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corsto=
ne1000-add-fwu-metadata-store-info.patch
index facd19b3..d4ed9121 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone10=
00-add-fwu-metadata-store-info.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corstone10=
00-add-fwu-metadata-store-info.patch
@@ -1,7 +1,7 @@
-From 9ef889ff89e6d2e2e40edecbd4ab7601c3d68052 Mon Sep 17 00:00:00 2001
+From e2fb90ab15babd146dd47b7c946674cd5a5260a1 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 15:58:07 +0000
-Subject: [PATCH 34/43] corstone1000: add fwu-metadata store info
+Subject: [PATCH 33/42] corstone1000: add fwu-metadata store info
=20
 Add fwu-mdata node and handle for the reference
 nvmxip-qspi.
@@ -13,7 +13,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 6 insertions(+), 1 deletion(-)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index faf4e12bab2a..b1d83b5ba861 100644
+index 18c4d1e19a..25a032b6b3 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -38,7 +38,7 @@
@@ -38,5 +38,5 @@ index faf4e12bab2a..b1d83b5ba861 100644
  		compatible =3D "simple-bus";
  		#address-cells =3D <1>;
 --=20
-2.39.2
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-nvm=
xip-provide-a-u-boot-shell-test-command.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0033-nvmxip-provide-a-u-boot-shell-test-comman=
d.patch
deleted file mode 100644
index e8adbc12..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-nvmxip-pro=
vide-a-u-boot-shell-test-command.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 560ebe3eb6197322b9d00c8e3cf30fb7e679d8b2 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Thu, 22 Dec 2022 16:20:46 +0000
-Subject: [PATCH 33/43] nvmxip: provide a u-boot shell test command
-
-nvmxip command allows probing the NVM XIP devices manually
-
-The command is provided for test purposes only.
-
-Use:
-
-nvmxip probe
-
-Upstream-Status: Submitted
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- cmd/Kconfig                    |  7 +++++
- cmd/Makefile                   |  1 +
- cmd/nvmxip.c                   | 47 ++++++++++++++++++++++++++++++++++
- configs/corstone1000_defconfig |  1 +
- configs/sandbox_defconfig      |  1 +
- 5 files changed, 57 insertions(+)
- create mode 100644 cmd/nvmxip.c
-
-diff --git a/cmd/Kconfig b/cmd/Kconfig
-index 5e278ecb1597..b6a3e5908534 100644
---- a/cmd/Kconfig
-+++ b/cmd/Kconfig
-@@ -938,6 +938,13 @@ config CMD_ARMFFA
- 		- Sending a data pattern to the specified partition
- 		- Displaying the arm_ffa device info
-=20
-+config CMD_NVMXIP
-+	bool "NVM XIP probe command"
-+	depends on NVMXIP
-+	help
-+	  Probes all NVM XIP devices. The command is for
-+	  test purposes only (not to be upstreamed)
-+
- config CMD_ARMFLASH
- 	#depends on FLASH_CFI_DRIVER
- 	bool "armflash"
-diff --git a/cmd/Makefile b/cmd/Makefile
-index c757f1647da6..0a3d98100703 100644
---- a/cmd/Makefile
-+++ b/cmd/Makefile
-@@ -154,6 +154,7 @@ obj-$(CONFIG_CMD_RTC) +=3D rtc.o
- obj-$(CONFIG_SANDBOX) +=3D host.o
- obj-$(CONFIG_CMD_SATA) +=3D sata.o
- obj-$(CONFIG_CMD_NVME) +=3D nvme.o
-+obj-$(CONFIG_CMD_NVMXIP) +=3D nvmxip.o
- obj-$(CONFIG_SANDBOX) +=3D sb.o
- obj-$(CONFIG_CMD_SF) +=3D sf.o
- obj-$(CONFIG_CMD_SCSI) +=3D scsi.o disk.o
-diff --git a/cmd/nvmxip.c b/cmd/nvmxip.c
-new file mode 100644
-index 000000000000..3eb0d84afc04
---- /dev/null
-+++ b/cmd/nvmxip.c
-@@ -0,0 +1,47 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-+ */
-+
-+#include <common.h>
-+#include <command.h>
-+#include <dm.h>
-+
-+int do_nvmxip_probe(struct cmd_tbl *cmdtp, int flag, int argc, char *co=
nst argv[])
-+{
-+	struct udevice *dev =3D NULL;
-+	for (uclass_first_device(UCLASS_NVMXIP, &dev); dev; uclass_next_device=
(&dev));
-+
-+	return 0;
-+}
-+
-+static struct cmd_tbl nvmxip_commands[] =3D {
-+	U_BOOT_CMD_MKENT(probe, 1, 1, do_nvmxip_probe, "", ""),
-+};
-+
-+static int do_nvmxip(struct cmd_tbl *cmdtp, int flag, int argc, char *c=
onst argv[])
-+{
-+	struct cmd_tbl *nvmxip_cmd;
-+	int ret;
-+
-+	if (argc < 2)
-+		return CMD_RET_USAGE;
-+
-+	nvmxip_cmd =3D find_cmd_tbl(argv[1], nvmxip_commands, ARRAY_SIZE(nvmxi=
p_commands));
-+
-+	argc -=3D 2;
-+	argv +=3D 2;
-+
-+	if (!nvmxip_cmd || argc > nvmxip_cmd->maxargs)
-+		return CMD_RET_USAGE;
-+
-+	ret =3D nvmxip_cmd->cmd(nvmxip_cmd, flag, argc, argv);
-+
-+	return cmd_process_error(nvmxip_cmd, ret);
-+}
-+
-+U_BOOT_CMD(nvmxip, 4, 1, do_nvmxip,
-+	   "NVM XIP probe command",
-+	   "probe\n"
-+	"	 - probes all NVM XIP devices\n");
-diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 2986cc95932f..e009faee0252 100644
---- a/configs/corstone1000_defconfig
-+++ b/configs/corstone1000_defconfig
-@@ -59,6 +59,7 @@ CONFIG_USB=3Dy
- CONFIG_USB_ISP1760=3Dy
- CONFIG_ERRNO_STR=3Dy
- CONFIG_NVMXIP_QSPI=3Dy
-+CONFIG_CMD_NVMXIP=3Dy
- CONFIG_EFI_MM_COMM_TEE=3Dy
- CONFIG_ARM_FFA_TRANSPORT=3Dy
- CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
-diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
-index f22230b5cce2..3b895be9e4ba 100644
---- a/configs/sandbox_defconfig
-+++ b/configs/sandbox_defconfig
-@@ -139,6 +139,7 @@ CONFIG_IP_DEFRAG=3Dy
- CONFIG_BOOTP_SERVERIP=3Dy
- CONFIG_IPV6=3Dy
- CONFIG_NVMXIP_QSPI=3Dy
-+CONFIG_CMD_NVMXIP=3Dy
- CONFIG_DM_DMA=3Dy
- CONFIG_DEVRES=3Dy
- CONFIG_DEBUG_DEVRES=3Dy
---=20
-2.39.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi=
_boottime-allow-to-reset-a-path-after-boot.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0034-efi_boottime-allow-to-reset-a-path-aft=
er-boot.patch
similarity index 83%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_=
boottime-allow-to-reset-a-path-after-boot.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-efi_bo=
ottime-allow-to-reset-a-path-after-boot.patch
index 59a60af6..5c053974 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_bootti=
me-allow-to-reset-a-path-after-boot.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-efi_bootti=
me-allow-to-reset-a-path-after-boot.patch
@@ -1,7 +1,7 @@
-From 53d29d35cdbcf493f6a9046458947d3e91f01add Mon Sep 17 00:00:00 2001
+From eb8e224290149fd39ca4b3a774abef2e31237943 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:11:25 +0000
-Subject: [PATCH 36/43] efi_boottime: allow to reset a path after boot
+Subject: [PATCH 34/42] efi_boottime: allow to reset a path after boot
=20
 Allow to install multiple protocol interfaces in an
 already installed root interface.
@@ -15,7 +15,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 1 deletion(-)
=20
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index fea4eb7a342e..90f43ff9a62f 100644
+index fea4eb7a34..90f43ff9a6 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -2669,7 +2669,6 @@ efi_install_multiple_protocol_interfaces_int(efi_h=
andle_t *handle,
@@ -27,5 +27,5 @@ index fea4eb7a342e..90f43ff9a62f 100644
  		}
  		ret =3D EFI_CALL(efi_install_protocol_interface(handle, protocol,
 --=20
-2.39.2
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-fwu=
_metadata-make-sure-structures-are-packed.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0035-fwu_metadata-make-sure-structures-are-p=
acked.patch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-fwu_=
metadata-make-sure-structures-are-packed.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-fwu_me=
tadata-make-sure-structures-are-packed.patch
index 7781a1ed..fedc1f2e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-fwu_metada=
ta-make-sure-structures-are-packed.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-fwu_metada=
ta-make-sure-structures-are-packed.patch
@@ -1,7 +1,7 @@
-From a8142be9b32a769040b6238ff611c22cb31c8cb5 Mon Sep 17 00:00:00 2001
+From ac77679ffcb4b7fac01414c1492d3e1aae13f9be Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:13:24 +0000
-Subject: [PATCH 37/43] fwu_metadata: make sure structures are packed
+Subject: [PATCH 35/42] fwu_metadata: make sure structures are packed
=20
 The fwu metadata in the metadata partitions
 should/are packed to guarantee that the info is
@@ -16,7 +16,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/include/fwu_mdata.h b/include/fwu_mdata.h
-index 8fda4f4ac225..c61221a91735 100644
+index 8fda4f4ac2..c61221a917 100644
 --- a/include/fwu_mdata.h
 +++ b/include/fwu_mdata.h
 @@ -22,7 +22,7 @@ struct fwu_image_bank_info {
@@ -46,5 +46,5 @@ index 8fda4f4ac225..c61221a91735 100644
 =20
  #endif /* _FWU_MDATA_H_ */
 --=20
-2.39.2
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-nvm=
xip-shorter-block-device-name.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0035-nvmxip-shorter-block-device-name.patch
deleted file mode 100644
index 74e4ccb8..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-nvmxip-sho=
rter-block-device-name.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 83823733015998702e4dc0365764fe7dde4a321f Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 1 Feb 2023 15:59:36 +0000
-Subject: [PATCH 35/43] nvmxip: shorter block device name
-
-Make the block device name shorter, so it will be set and presented
-inside the array limits.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/nvmxip/nvmxip.c      | 2 +-
- drivers/nvmxip/nvmxip_qspi.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/nvmxip/nvmxip.c b/drivers/nvmxip/nvmxip.c
-index af9c9a3b7270..91fe995f2d4d 100644
---- a/drivers/nvmxip/nvmxip.c
-+++ b/drivers/nvmxip/nvmxip.c
-@@ -91,7 +91,7 @@ int nvmxip_init(struct udevice *udev)
-=20
- 	nvmxip_bdev_max_devs++;
-=20
--	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "nvmxip-blk#%d", nvmxip_bde=
v_max_devs);
-+	snprintf(bdev_name, NVMXIP_BLKDEV_NAME_SZ, "blk#%d", nvmxip_bdev_max_d=
evs);
-=20
- 	ret =3D blk_create_devicef(udev, NVMXIP_BLKDRV_NAME, bdev_name, UCLASS=
_NVMXIP,
- 				 nvmxip_bdev_max_devs, NVMXIP_DEFAULT_LBA_SZ,
-diff --git a/drivers/nvmxip/nvmxip_qspi.c b/drivers/nvmxip/nvmxip_qspi.c
-index 749625134acd..f6f5435e6377 100644
---- a/drivers/nvmxip/nvmxip_qspi.c
-+++ b/drivers/nvmxip/nvmxip_qspi.c
-@@ -43,7 +43,7 @@ static int nvmxip_qspi_of_to_plat(struct udevice *dev)
- 		return -EINVAL;
- 	}
-=20
--	pr_debug("[%s]: XIP device base addr: 0x%llx , lba_shift: %d , lbas: %=
lu\n",
-+	log_err("[%s]: XIP device base addr: 0x%llx , lba_shift: %d , lbas: %l=
u\n",
- 		 dev->name, plat_data->phys_base, plat_data->lba_shift, plat_data->lb=
a);
-=20
- 	return 0;
---=20
-2.39.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-add-boot-index.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/c=
orstone1000/0036-corstone1000-add-boot-index.patch
similarity index 83%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cors=
tone1000-add-boot-index.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corsto=
ne1000-add-boot-index.patch
index afaf9673..d9568563 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-add-boot-index.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corstone10=
00-add-boot-index.patch
@@ -1,7 +1,7 @@
-From ceae4ec0d459b1ef12e544f4e36d6043a09d3b05 Mon Sep 17 00:00:00 2001
+From 92948559987d02baf9f690d9bbdc96d1179264ef Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:15:30 +0000
-Subject: [PATCH 38/43] corstone1000: add boot index
+Subject: [PATCH 36/42] corstone1000: add boot index
=20
 it is expected that the firmware that runs before
 u-boot somehow provide the information of the bank
@@ -16,7 +16,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index d6ca6e896140..0a58ccd99cdd 100644
+index d6ca6e8961..0a58ccd99c 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -106,6 +106,7 @@ int dram_init_banksize(void)
@@ -29,5 +29,5 @@ index d6ca6e896140..0a58ccd99cdd 100644
 +	*boot_idx =3D 0;
  }
 --=20
-2.39.2
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-adjust-boot-bank-and-kernel-location.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0037-corstone1000-adjust-boot-bank-and-=
kernel-location.patch
similarity index 86%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cors=
tone1000-adjust-boot-bank-and-kernel-location.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corsto=
ne1000-adjust-boot-bank-and-kernel-location.patch
index a42b3a25..277e988b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-adjust-boot-bank-and-kernel-location.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-adjust-boot-bank-and-kernel-location.patch
@@ -1,7 +1,7 @@
-From 80a2910370b0acc35f6fb2fbe3a7e56fecb1a08a Mon Sep 17 00:00:00 2001
+From 1a54c12aa6eed28a1a4e4f50d1aeb92a31cf6f52 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 1 Feb 2023 16:17:21 +0000
-Subject: [PATCH 39/43] corstone1000: adjust boot bank and kernel locatio=
n
+Subject: [PATCH 37/42] corstone1000: adjust boot bank and kernel locatio=
n
=20
 Adjust in the env boot script the address of the
 bootbank with the new gpt layout, and also the
@@ -17,7 +17,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.env b/board/armltd/c=
orstone1000/corstone1000.env
-index b24ff07fc6bd..a6ee4962211b 100644
+index b24ff07fc6..a6ee496221 100644
 --- a/board/armltd/corstone1000/corstone1000.env
 +++ b/board/armltd/corstone1000/corstone1000.env
 @@ -1,8 +1,8 @@
@@ -32,5 +32,5 @@ index b24ff07fc6bd..a6ee4962211b 100644
  retrieve_kernel_load_addr=3D
  	if itest.l *${boot_bank_flag} =3D=3D 0; then
 --=20
-2.39.2
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cor=
stone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-add-nvmxip-fwu-mdata-=
and-gpt-options.patch
similarity index 85%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-cors=
tone1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corsto=
ne1000-add-nvmxip-fwu-mdata-and-gpt-options.patch
index bd6b9991..a0f2bb16 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone10=
00-add-nvmxip-fwu-mdata-and-gpt-options.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-add-nvmxip-fwu-mdata-and-gpt-options.patch
@@ -1,7 +1,7 @@
-From 0c2bd094b7686e9497327d825470cb90aa29d10f Mon Sep 17 00:00:00 2001
+From 5e0b7e40c4702d5494378d3e120fce0136f69a79 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 1 Feb 2023 16:19:40 +0000
-Subject: [PATCH 40/43] corstone1000: add nvmxip, fwu-mdata and gpt optio=
ns
+Date: Fri, 9 Jun 2023 13:28:06 +0100
+Subject: [PATCH 38/42] corstone1000: add nvmxip, fwu-mdata and gpt optio=
ns
=20
 Enable the newest features: nvmxip, fwu-metadata and
 gpt. Commands to print the partition info, gpt info
@@ -10,11 +10,11 @@ and fwu metadata will be available.
 Upstream-Status: Pending
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
- configs/corstone1000_defconfig | 33 ++++++++++++++++++++-------------
- 1 file changed, 20 insertions(+), 13 deletions(-)
+ configs/corstone1000_defconfig | 29 +++++++++++++++++++----------
+ 1 file changed, 19 insertions(+), 10 deletions(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index e009faee0252..96bb86ec91e9 100644
+index 1179bf5f3b..c38113ce95 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -4,18 +4,20 @@ CONFIG_TARGET_CORSTONE1000=3Dy
@@ -41,7 +41,7 @@ index e009faee0252..96bb86ec91e9 100644
  CONFIG_CONSOLE_RECORD=3Dy
  CONFIG_LOGLEVEL=3D7
  # CONFIG_DISPLAY_CPUINFO is not set
-@@ -23,11 +25,16 @@ CONFIG_LOGLEVEL=3D7
+@@ -23,11 +25,15 @@ CONFIG_LOGLEVEL=3D7
  CONFIG_SYS_MAXARGS=3D64
  CONFIG_SYS_CBSIZE=3D512
  # CONFIG_CMD_CONSOLE is not set
@@ -49,7 +49,6 @@ index e009faee0252..96bb86ec91e9 100644
  CONFIG_CMD_BOOTZ=3Dy
  CONFIG_SYS_BOOTM_LEN=3D0x800000
  # CONFIG_CMD_XIMG is not set
-+CONFIG_CMD_NVMXIP=3Dy
 +CONFIG_CMD_GPT=3Dy
 +# CONFIG_RANDOM_UUID is not set
  CONFIG_CMD_LOADM=3Dy
@@ -58,7 +57,7 @@ index e009faee0252..96bb86ec91e9 100644
  CONFIG_CMD_USB=3Dy
  # CONFIG_CMD_SETEXPR is not set
  # CONFIG_CMD_NFS is not set
-@@ -39,29 +46,29 @@ CONFIG_OF_CONTROL=3Dy
+@@ -39,27 +45,30 @@ CONFIG_OF_CONTROL=3Dy
  CONFIG_VERSION_VARIABLE=3Dy
  CONFIG_NET_RANDOM_ETHADDR=3Dy
  CONFIG_REGMAP=3Dy
@@ -87,10 +86,8 @@ index e009faee0252..96bb86ec91e9 100644
  CONFIG_USB=3Dy
  CONFIG_USB_ISP1760=3Dy
  CONFIG_ERRNO_STR=3Dy
--CONFIG_NVMXIP_QSPI=3Dy
--CONFIG_CMD_NVMXIP=3Dy
  CONFIG_EFI_MM_COMM_TEE=3Dy
--CONFIG_ARM_FFA_TRANSPORT=3Dy
+ CONFIG_ARM_FFA_TRANSPORT=3Dy
  CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
 +CONFIG_EFI_CAPSULE_ON_DISK=3Dy
 +CONFIG_EFI_IGNORE_OSINDICATIONS=3Dy
@@ -99,5 +96,5 @@ index e009faee0252..96bb86ec91e9 100644
 +CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
 +# CONFIG_TOOLS_MKEFICAPSULE is not set
 --=20
-2.40.0
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-nvm=
xip-move-header-to-include.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0039-nvmxip-move-header-to-include.patch
similarity index 62%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-nvmx=
ip-move-header-to-include.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-nvmxip=
-move-header-to-include.patch
index 4e4ae172..b745fe9b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-nvmxip-mov=
e-header-to-include.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-nvmxip-mov=
e-header-to-include.patch
@@ -1,7 +1,7 @@
-From 37b3c73d9307d1de3b78e3ccba0ba6ba0867d6b8 Mon Sep 17 00:00:00 2001
+From d280414229d7bbee368f40be6cde17e4f251dd0f Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 23 Feb 2023 10:32:04 +0000
-Subject: [PATCH 41/43] nvmxip: move header to include
+Date: Fri, 9 Jun 2023 13:31:53 +0100
+Subject: [PATCH 39/42] nvmxip: move header to include
=20
 Move header to include to allow external code
 to get the internal bdev structures to access
@@ -14,13 +14,13 @@ listing.
 Upstream-Status: Pending
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
- disk/part.c                          | 3 +++
- {drivers/nvmxip =3D> include}/nvmxip.h | 0
+ disk/part.c                              | 3 +++
+ {drivers/mtd/nvmxip =3D> include}/nvmxip.h | 0
  2 files changed, 3 insertions(+)
- rename {drivers/nvmxip =3D> include}/nvmxip.h (100%)
+ rename {drivers/mtd/nvmxip =3D> include}/nvmxip.h (100%)
=20
 diff --git a/disk/part.c b/disk/part.c
-index 5ee60a7fb591..593dd0004fa4 100644
+index 5ee60a7fb5..593dd0004f 100644
 --- a/disk/part.c
 +++ b/disk/part.c
 @@ -270,6 +270,9 @@ static void print_part_header(const char *type, stru=
ct blk_desc *dev_desc)
@@ -33,10 +33,10 @@ index 5ee60a7fb591..593dd0004fa4 100644
  	case UCLASS_PVBLOCK:
  		puts("PV BLOCK");
  		break;
-diff --git a/drivers/nvmxip/nvmxip.h b/include/nvmxip.h
+diff --git a/drivers/mtd/nvmxip/nvmxip.h b/include/nvmxip.h
 similarity index 100%
-rename from drivers/nvmxip/nvmxip.h
+rename from drivers/mtd/nvmxip/nvmxip.h
 rename to include/nvmxip.h
 --=20
-2.39.2
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-cor=
stone1000-set-kernel_addr-based-on-boot_idx.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0040-corstone1000-set-kernel_addr-based-on=
-boot_idx.patch
similarity index 93%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-cors=
tone1000-set-kernel_addr-based-on-boot_idx.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corsto=
ne1000-set-kernel_addr-based-on-boot_idx.patch
index 547ea954..ba2e5e17 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone10=
00-set-kernel_addr-based-on-boot_idx.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-corstone10=
00-set-kernel_addr-based-on-boot_idx.patch
@@ -1,7 +1,7 @@
-From d736c596f7a8446955d35bef5adae22de24ab9ab Mon Sep 17 00:00:00 2001
+From e7cb997fd59c883572994b504dbc77bc670de8f7 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Thu, 23 Feb 2023 10:35:00 +0000
-Subject: [PATCH 42/43] corstone1000: set kernel_addr based on boot_idx
+Subject: [PATCH 40/42] corstone1000: set kernel_addr based on boot_idx
=20
 We need to distinguish between boot banks and from which
 partition to load the kernel+initramfs to memory.
@@ -19,7 +19,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  3 files changed, 58 insertions(+), 9 deletions(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 0a58ccd99cdd..b767195cccb6 100644
+index 0a58ccd99c..b767195ccc 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -5,13 +5,23 @@
@@ -100,7 +100,7 @@ index 0a58ccd99cdd..b767195cccb6 100644
 +	return ret;
  }
 diff --git a/board/armltd/corstone1000/corstone1000.env b/board/armltd/c=
orstone1000/corstone1000.env
-index a6ee4962211b..ee318b1b1c30 100644
+index a6ee496221..ee318b1b1c 100644
 --- a/board/armltd/corstone1000/corstone1000.env
 +++ b/board/armltd/corstone1000/corstone1000.env
 @@ -2,12 +2,4 @@
@@ -117,7 +117,7 @@ index a6ee4962211b..ee318b1b1c30 100644
 -	fi;
  kernel_addr_r=3D0x88200000
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 96bb86ec91e9..23e9e6ae5bd3 100644
+index c38113ce95..20359cb181 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -22,6 +22,7 @@ CONFIG_CONSOLE_RECORD=3Dy
@@ -129,5 +129,5 @@ index 96bb86ec91e9..23e9e6ae5bd3 100644
  CONFIG_SYS_CBSIZE=3D512
  # CONFIG_CMD_CONSOLE is not set
 --=20
-2.40.0
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-cor=
stone1000-boot-index-from-active.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/corstone1000/0041-corstone1000-boot-index-from-active.patch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-cors=
tone1000-boot-index-from-active.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-corsto=
ne1000-boot-index-from-active.patch
index 9080ecb2..f0e14942 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone10=
00-boot-index-from-active.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0041-corstone10=
00-boot-index-from-active.patch
@@ -1,7 +1,7 @@
-From b32aee10c66a9c2a3b6b948ad957deca3391c4bf Mon Sep 17 00:00:00 2001
+From ab07a26290e44fb198403b658b8f1550e959a0cc Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Mon, 27 Feb 2023 14:40:13 +0000
-Subject: [PATCH 43/43] corstone1000: boot index from active
+Subject: [PATCH 41/42] corstone1000: boot index from active
=20
 In our platform, the Secure Enclave is the one who control
 all the boot tries and status, so, every time we get here
@@ -14,7 +14,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 12 insertions(+), 1 deletion(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 0923ca6e8c5b..e949edb79745 100644
+index b767195ccc..db508ac3cb 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -118,7 +118,18 @@ int dram_init_banksize(void)
@@ -38,5 +38,5 @@ index 0923ca6e8c5b..e949edb79745 100644
 =20
  int board_late_init(void)
 --=20
-2.39.2
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-cor=
stone1000-enable-psci-reset.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone1000/0042-corstone1000-enable-PSCI-reset.patch
similarity index 78%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-cors=
tone1000-enable-psci-reset.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corsto=
ne1000-enable-PSCI-reset.patch
index cb66d5a2..cad830f4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-corstone10=
00-enable-psci-reset.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0042-corstone10=
00-enable-PSCI-reset.patch
@@ -1,9 +1,9 @@
-From fc1e331fd3ba5a75791b3841c8876f2e1fda8da9 Mon Sep 17 00:00:00 2001
+From 8bf48a56aa014146a8950532906b06e191754daa Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 24 May 2023 09:12:11 +0100
-Subject: corstone1000: enable PSCI reset
+Subject: [PATCH 42/42] corstone1000: enable PSCI reset
=20
-Even though corstone1000 does not implement entire PSCI APIs,it relies o=
n=20
+Even though corstone1000 does not implement entire PSCI APIs,it relies o=
n
 PSCI reset interface for the system reset. U-boot change the config name=
, so we
 need to enable it again.
=20
@@ -14,10 +14,10 @@ Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index b8d463f931..9f2ec97f0d 100644
+index 20359cb181..19fe1432ae 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -63,6 +63,7 @@ CONFIG_DM_RTC=3Dy
+@@ -62,6 +62,7 @@ CONFIG_DM_RTC=3Dy
  CONFIG_RTC_EMULATION=3Dy
  CONFIG_DM_SERIAL=3Dy
  CONFIG_SYSRESET=3Dy
@@ -26,5 +26,5 @@ index b8d463f931..9f2ec97f0d 100644
  CONFIG_USB_ISP1760=3Dy
  CONFIG_ERRNO_STR=3Dy
 --=20
-2.17.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index fbcdafbb..8a8f8f02 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -18,50 +18,48 @@ EXTRA_OEMAKE:append:corstone1000 =3D ' DEVICE_TREE=3D=
${CORSTONE1000_DEVICE_TREE}'
 SYSROOT_DIRS:append:corstone1000 =3D " /boot"
=20
 SRC_URI:append:corstone1000 =3D " \
-        file://0001-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe=
.patch		\
-        file://0002-lib-uuid-introduce-uuid_str_to_le_bin-function.patch=
		\
-        file://0003-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch			=
\
-        file://0004-arm_ffa-efi-unmap-RX-TX-buffers.patch				\
-        file://0005-arm_ffa-introduce-armffa-command.patch				\
-        file://0006-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch			\
-        file://0007-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.=
patch		\
-        file://0008-arm_ffa-introduce-armffa-command-Sandbox-test.patch	=
		\
-        file://0009-arm_ffa-efi-introduce-FF-A-MM-communication.patch			=
\
-        file://0010-arm_ffa-efi-corstone1000-enable-MM-communication.pat=
ch		\
-        file://0011-efi-corstone1000-introduce-EFI-capsule-update.patch	=
		\
-        file://0012-arm-corstone1000-fix-unrecognized-filesystem-type.pa=
tch		\
-        file://0013-efi_capsule-corstone1000-pass-interface-id-and-buffe=
.patch		\
-        file://0014-efi_boottime-corstone1000-pass-interface-id-and-kern=
.patch		\
-        file://0015-efi_loader-corstone1000-remove-guid-check-from-corst=
.patch		\
-        file://0016-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op=
.patch		\
-        file://0017-efi_firmware-add-get_image_info-for-corstone1000.pat=
ch		\
-        file://0018-efi_loader-send-bootcomplete-message-to-secure-encla=
.patch		\
-        file://0019-efi_loader-fix-null-pointer-exception-with-get_image=
.patch		\
-        file://0020-arm-corstone1000-add-mmc-for-fvp.patch				\
-        file://0021-corstone1000-add-compressed-kernel-support.patch			\
-        file://0022-Introduce-external-sys-driver-to-device-tree.patch		=
	\
-        file://0023-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch=
		\
-        file://0024-arm-corstone1000-esrt-support.patch					\
-        file://0025-efi_setup-discover-FF-A-bus-before-raising-EFI-start=
.patch		\
-        file://0026-corstone1000-enable-distro-booting-command.patch			\
-        file://0027-drivers-nvmxip-introduce-NVM-XIP-block-storage-emula=
.patch		\
-        file://0028-sandbox64-fix-return-unsigned-long-in-readq.patch			=
\
-        file://0029-sandbox64-add-support-for-NVMXIP-QSPI.patch			\
-        file://0030-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch=
		\
-        file://0031-corstone1000-enable-NVM-XIP-QSPI-flash.patch			\
-        file://0032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch			=
\
-        file://0033-nvmxip-provide-a-u-boot-shell-test-command.patch			\
-        file://0034-corstone1000-add-fwu-metadata-store-info.patch			\
-        file://0035-nvmxip-shorter-block-device-name.patch				\
-        file://0036-efi_boottime-allow-to-reset-a-path-after-boot.patch	=
	\
-        file://0037-fwu_metadata-make-sure-structures-are-packed.patch		=
	\
-        file://0038-corstone1000-add-boot-index.patch					\
-        file://0039-corstone1000-adjust-boot-bank-and-kernel-location.pa=
tch		\
-        file://0040-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.pa=
tch		\
-        file://0041-nvmxip-move-header-to-include.patch				\
-        file://0042-corstone1000-set-kernel_addr-based-on-boot_idx.patch=
		\
-        file://0043-corstone1000-boot-index-from-active.patch				\
-        file://0044-corstone1000-enable-psci-reset.patch                =
               \
+        file://0001-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe=
.patch            \=20
+        file://0002-lib-uuid-introduce-uuid_str_to_le_bin-function.patch=
		  \=20
+        file://0003-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch			=
  \=20
+        file://0004-arm_ffa-efi-unmap-RX-TX-buffers.patch				  \=20
+        file://0005-arm_ffa-introduce-armffa-command.patch				  \=20
+        file://0006-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch			  =
\=20
+        file://0007-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.=
patch		  \=20
+        file://0008-arm_ffa-introduce-armffa-command-Sandbox-test.patch	=
		  \=20
+        file://0009-arm_ffa-efi-introduce-FF-A-MM-communication.patch			=
  \=20
+        file://0010-arm_ffa-efi-corstone1000-enable-MM-communication.pat=
ch		  \=20
+        file://0011-efi-corstone1000-introduce-EFI-capsule-update.patch	=
		  \=20
+        file://0012-arm-corstone1000-fix-unrecognized-filesystem-type.pa=
tch		  \=20
+        file://0013-efi_capsule-corstone1000-pass-interface-id-and-buffe=
.patch		  \=20
+        file://0014-efi_boottime-corstone1000-pass-interface-id-and-kern=
.patch		  \=20
+        file://0015-efi_loader-corstone1000-remove-guid-check-from-corst=
.patch		  \=20
+        file://0016-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op=
.patch		  \=20
+        file://0017-efi_firmware-add-get_image_info-for-corstone1000.pat=
ch		  \=20
+        file://0018-efi_loader-send-bootcomplete-message-to-secure-encla=
.patch		  \=20
+        file://0019-efi_loader-fix-null-pointer-exception-with-get_image=
.patch		  \=20
+        file://0020-arm-corstone1000-add-mmc-for-fvp.patch				  \=20
+        file://0021-corstone1000-add-compressed-kernel-support.patch			 =
 \=20
+        file://0022-Introduce-external-sys-driver-to-device-tree.patch		=
	  \=20
+        file://0023-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch=
		  \=20
+        file://0024-arm-corstone1000-esrt-support.patch					  \=20
+        file://0025-efi_setup-discover-FF-A-bus-before-raising-EFI-start=
.patch		  \=20
+        file://0026-corstone1000-enable-distro-booting-command.patch			 =
 \=20
+        file://0027-drivers-mtd-nvmxip-introduce-NVM-XIP-block-storage-e=
.patch		  \=20
+        file://0028-drivers-mtd-nvmxip-introduce-QSPI-XIP-driver.patch		=
	  \=20
+        file://0029-sandbox64-fix-return-unsigned-long-in-readq.patch			=
  \=20
+        file://0030-sandbox64-add-support-for-NVMXIP-QSPI.patch				  \=20
+        file://0031-corstone1000-add-NVM-XIP-QSPI-device-tree-node.patch=
		  \=20
+        file://0032-sandbox64-add-a-test-case-for-UCLASS_NVMXIP.patch			=
  \=20
+        file://0033-corstone1000-add-fwu-metadata-store-info.patch			  \=
=20
+        file://0034-efi_boottime-allow-to-reset-a-path-after-boot.patch	=
		  \=20
+        file://0035-fwu_metadata-make-sure-structures-are-packed.patch		=
	  \=20
+        file://0036-corstone1000-add-boot-index.patch					  \=20
+        file://0037-corstone1000-adjust-boot-bank-and-kernel-location.pa=
tch		  \=20
+        file://0038-corstone1000-add-nvmxip-fwu-mdata-and-gpt-options.pa=
tch		  \=20
+        file://0039-nvmxip-move-header-to-include.patch					  \=20
+        file://0040-corstone1000-set-kernel_addr-based-on-boot_idx.patch=
		  \=20
+        file://0041-corstone1000-boot-index-from-active.patch				  \=20
+        file://0042-corstone1000-enable-PSCI-reset.patch				  \=20
         "
=20
 #
--=20
2.25.1


