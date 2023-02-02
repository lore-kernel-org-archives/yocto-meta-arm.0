Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2931BC63797
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 09:55:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11208.1675331702309194746
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 01:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E12FC14;
	Thu,  2 Feb 2023 01:55:44 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D6A73F64C;
	Thu,  2 Feb 2023 01:55:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/6] arm-bsp/corstone1000: bump u-boot version to 2023.01
Date: Thu,  2 Feb 2023 09:54:54 +0000
Message-Id: <20230202095456.3113221-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202095456.3113221-1-ross.burton@arm.com>
References: <20230202095456.3113221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 09:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4351

From: Rui Miguel Silva <rui.silva@linaro.org>

Bump corstone1000 to u-boot version 2023.01, as at it
do some trailing spaces cleanup.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...support-for-SMCCCv1.2-x0-x17-registe.patch | 14 ++---
 ...ntroduce-uuid_str_to_le_bin-function.patch | 12 +++--
 ...-introduce-Arm-FF-A-low-level-driver.patch | 38 +++++++-------
 ...0004-arm_ffa-efi-unmap-RX-TX-buffers.patch |  9 ++--
 ...005-arm_ffa-introduce-armffa-command.patch | 22 ++++----
 ...fa-introduce-the-FF-A-Sandbox-driver.patch | 52 +++++++------------
 ...ce-Sandbox-test-cases-for-UCLASS_FFA.patch | 17 +++---
 ...ntroduce-armffa-command-Sandbox-test.patch | 22 ++++----
 ...-efi-introduce-FF-A-MM-communication.patch | 16 +++---
 ...corstone1000-enable-MM-communication.patch | 26 +++++++---
 ...one1000-introduce-EFI-capsule-update.patch | 38 +++++++-------
 ...000-fix-unrecognized-filesystem-type.patch | 10 ++--
 ...tone1000-pass-interface-id-and-buffe.patch | 14 ++---
 ...stone1000-pass-interface-id-and-kern.patch |  8 +--
 ...one1000-remove-guid-check-from-corst.patch | 12 ++---
 ...ate-ESRT-table-if-EFI_ESRT-config-op.patch | 10 ++--
 ...-add-get_image_info-for-corstone1000.patch | 23 ++++----
 ...bootcomplete-message-to-secure-encla.patch | 18 +++----
 ...ull-pointer-exception-with-get_image.patch | 10 ++--
 ...020-arm-corstone1000-add-mmc-for-fvp.patch | 14 ++---
 ...ne1000-add-compressed-kernel-support.patch |  9 ++--
 ...e-external-sys-driver-to-device-tree.patch |  9 ++--
 ...d-rpmsg-client-to-u-boot-device-tree.patch |  9 ++--
 .../0024-arm-corstone1000-esrt-support.patch  | 19 +++----
 ...er-FF-A-bus-before-raising-EFI-start.patch | 11 ++--
 ...ne1000-enable-distro-booting-command.patch | 11 ++--
 .../recipes-bsp/u-boot/u-boot_%.bbappend      | 52 +++++++++----------
 28 files changed, 264 insertions(+), 243 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 2869d78c..f541e6b6 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -22,7 +22,7 @@ TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-RS=
A-3072_1.pem"
 RE_IMAGE_OFFSET =3D "0x1000"
=20
 # u-boot
-PREFERRED_VERSION_u-boot ?=3D "2022.10"
+PREFERRED_VERSION_u-boot ?=3D "2023.01"
 EXTRA_IMAGEDEPENDS +=3D "u-boot"
=20
 UBOOT_CONFIG ??=3D "EFI"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm=
64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0001-arm64-smccc-add-support-for-SMC=
CCv1.2-x0-x17-registe.patch
index 837f8a92..64c1b95b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm64-smcc=
c-add-support-for-SMCCCv1.2-x0-x17-registe.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm64-smcc=
c-add-support-for-SMCCCv1.2-x0-x17-registe.patch
@@ -1,7 +1,7 @@
-From 584e4952dca726c3dc9df319dffb37a518b65c14 Mon Sep 17 00:00:00 2001
+From f1f1780630302e1d7cab95d1c6dc32e2fc0bdd70 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 29 Jul 2022 13:06:19 +0100
-Subject: [PATCH 01/25] arm64: smccc: add support for SMCCCv1.2 x0-x17
+Subject: [PATCH 01/27] arm64: smccc: add support for SMCCCv1.2 x0-x17
  registers
=20
 add support for x0-x17 registers used by the SMC calls
@@ -39,6 +39,8 @@ v3:
 * port x0-x17 registers support from linux kernel as defined by SMCCCv1.=
2
   commit title:
       arm64: smccc: add Xn registers support used by SMC calls
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  arch/arm/cpu/armv8/smccc-call.S | 53 +++++++++++++++++++++++++++++++++
  arch/arm/lib/asm-offsets.c      | 14 +++++++++
@@ -46,7 +48,7 @@ v3:
  3 files changed, 110 insertions(+)
=20
 diff --git a/arch/arm/cpu/armv8/smccc-call.S b/arch/arm/cpu/armv8/smccc-=
call.S
-index dc92b28777..ec6f299bc9 100644
+index dc92b28777c3..ec6f299bc929 100644
 --- a/arch/arm/cpu/armv8/smccc-call.S
 +++ b/arch/arm/cpu/armv8/smccc-call.S
 @@ -1,6 +1,8 @@
@@ -114,7 +116,7 @@ index dc92b28777..ec6f299bc9 100644
 +
 +#endif
 diff --git a/arch/arm/lib/asm-offsets.c b/arch/arm/lib/asm-offsets.c
-index 22fd541f9a..db6d7ed234 100644
+index 22fd541f9a28..db6d7ed23428 100644
 --- a/arch/arm/lib/asm-offsets.c
 +++ b/arch/arm/lib/asm-offsets.c
 @@ -9,6 +9,9 @@
@@ -146,7 +148,7 @@ index 22fd541f9a..db6d7ed234 100644
 =20
  	return 0;
 diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
-index e1d09884a1..9105031d55 100644
+index e1d09884a1c5..9105031d55d3 100644
 --- a/include/linux/arm-smccc.h
 +++ b/include/linux/arm-smccc.h
 @@ -1,6 +1,8 @@
@@ -207,5 +209,5 @@ index e1d09884a1..9105031d55 100644
   * struct arm_smccc_quirk - Contains quirk information
   * @id: quirk identification
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib=
-uuid-introduce-uuid_str_to_le_bin-function.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0002-lib-uuid-introduce-uuid_str_to_le_bin=
-function.patch
index 1b043dd5..4cba24dd 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib-uuid-i=
ntroduce-uuid_str_to_le_bin-function.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-lib-uuid-i=
ntroduce-uuid_str_to_le_bin-function.patch
@@ -1,7 +1,7 @@
-From b226e6000de0b1f55d56c1193d1fde028d64abd3 Mon Sep 17 00:00:00 2001
+From 9fe30f542939824f731fda3991a1d4f66fbf3b4b Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 4 Aug 2022 16:46:47 +0100
-Subject: [PATCH 02/25] lib: uuid: introduce uuid_str_to_le_bin function
+Subject: [PATCH 02/27] lib: uuid: introduce uuid_str_to_le_bin function
=20
 convert UUID string to little endian binary data
=20
@@ -34,13 +34,15 @@ v3:
=20
 * introduce ffa_uuid_str_to_bin (provided by
   arm_ffa: introduce Arm FF-A low-level driver)
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  include/uuid.h |  8 ++++++++
  lib/uuid.c     | 46 ++++++++++++++++++++++++++++++++++++++++++++++
  2 files changed, 54 insertions(+)
=20
 diff --git a/include/uuid.h b/include/uuid.h
-index 4a4883d3b5..293a8eb0a5 100644
+index 4a4883d3b5b6..293a8eb0a579 100644
 --- a/include/uuid.h
 +++ b/include/uuid.h
 @@ -2,6 +2,8 @@
@@ -64,7 +66,7 @@ index 4a4883d3b5..293a8eb0a5 100644
 +
  #endif
 diff --git a/lib/uuid.c b/lib/uuid.c
-index 465e1ac38f..d29f561a70 100644
+index 465e1ac38f57..d29f561a70df 100644
 --- a/lib/uuid.c
 +++ b/lib/uuid.c
 @@ -1,6 +1,8 @@
@@ -128,5 +130,5 @@ index 465e1ac38f..d29f561a70 100644
   * uuid_bin_to_str() - convert big endian binary data to string UUID or=
 GUID.
   *
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm=
_ffa-introduce-Arm-FF-A-low-level-driver.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0003-arm_ffa-introduce-Arm-FF-A-low-level-dri=
ver.patch
index 774af445..dd55a73b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-in=
troduce-Arm-FF-A-low-level-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-arm_ffa-in=
troduce-Arm-FF-A-low-level-driver.patch
@@ -1,7 +1,7 @@
-From 93e3267b19c5c5d27664ef133121db4b678ad72d Mon Sep 17 00:00:00 2001
+From 69cfd14c37bee479eb3cb7e6dd2df23f460f0713 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Nov 2022 14:40:05 +0000
-Subject: [PATCH 03/25] arm_ffa: introduce Arm FF-A low-level driver
+Subject: [PATCH 03/27] arm_ffa: introduce Arm FF-A low-level driver
=20
 Add the core driver implementing Arm Firmware Framework for Armv8-A v1.0
=20
@@ -109,6 +109,8 @@ v2:
 v1:
=20
 * introduce FF-A bus driver with device tree support
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  MAINTAINERS                               |    7 +
  doc/arch/arm64.ffa.rst                    |  218 ++++
@@ -132,10 +134,10 @@ v1:
  create mode 100644 include/arm_ffa.h
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 83346183ee..734fcb10c4 100644
+index 3fc4cd0f12d3..509619d31ce6 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -248,6 +248,13 @@ F:	drivers/net/cortina_ni.h
+@@ -264,6 +264,13 @@ F:	drivers/net/cortina_ni.h
  F:	drivers/net/phy/ca_phy.c
  F:	configs/cortina_presidio-asic-pnand_defconfig
 =20
@@ -151,7 +153,7 @@ index 83346183ee..734fcb10c4 100644
  M:	Fabio Estevam <festevam@gmail.com>
 diff --git a/doc/arch/arm64.ffa.rst b/doc/arch/arm64.ffa.rst
 new file mode 100644
-index 0000000000..dfcec82e45
+index 000000000000..dfcec82e456e
 --- /dev/null
 +++ b/doc/arch/arm64.ffa.rst
 @@ -0,0 +1,218 @@
@@ -374,7 +376,7 @@ index 0000000000..dfcec82e45
 +------------
 +   * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 diff --git a/doc/arch/index.rst b/doc/arch/index.rst
-index 792d9182c3..8d1ab0ad4e 100644
+index b3e85f9bf347..cf1cfc9287c2 100644
 --- a/doc/arch/index.rst
 +++ b/doc/arch/index.rst
 @@ -8,6 +8,7 @@ Architecture-specific doc
@@ -386,7 +388,7 @@ index 792d9182c3..8d1ab0ad4e 100644
     mips
     nios2
 diff --git a/drivers/Kconfig b/drivers/Kconfig
-index 8b6fead351..b06b1ae481 100644
+index 75ac149d3118..ff75b7c3f883 100644
 --- a/drivers/Kconfig
 +++ b/drivers/Kconfig
 @@ -6,6 +6,8 @@ source "drivers/core/Kconfig"
@@ -399,10 +401,10 @@ index 8b6fead351..b06b1ae481 100644
 =20
  source "drivers/axi/Kconfig"
 diff --git a/drivers/Makefile b/drivers/Makefile
-index eba9940231..c3bfad94ac 100644
+index 6f1de58e0030..28c8f538c83a 100644
 --- a/drivers/Makefile
 +++ b/drivers/Makefile
-@@ -110,6 +110,7 @@ obj-y +=3D iommu/
+@@ -112,6 +112,7 @@ obj-y +=3D iommu/
  obj-y +=3D smem/
  obj-y +=3D thermal/
  obj-$(CONFIG_TEE) +=3D tee/
@@ -412,7 +414,7 @@ index eba9940231..c3bfad94ac 100644
  obj-$(CONFIG_W1) +=3D w1/
 diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
 new file mode 100644
-index 0000000000..e4914b9bc7
+index 000000000000..e4914b9bc779
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/Kconfig
 @@ -0,0 +1,30 @@
@@ -448,7 +450,7 @@ index 0000000000..e4914b9bc7
 +
 diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
 new file mode 100644
-index 0000000000..043a8915be
+index 000000000000..043a8915bec5
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/Makefile
 @@ -0,0 +1,6 @@
@@ -460,7 +462,7 @@ index 0000000000..043a8915be
 +obj-y +=3D arm-ffa-uclass.o core.o
 diff --git a/drivers/firmware/arm-ffa/arm-ffa-uclass.c b/drivers/firmwar=
e/arm-ffa/arm-ffa-uclass.c
 new file mode 100644
-index 0000000000..7d9695d289
+index 000000000000..7d9695d28922
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/arm-ffa-uclass.c
 @@ -0,0 +1,16 @@
@@ -482,7 +484,7 @@ index 0000000000..7d9695d289
 +};
 diff --git a/drivers/firmware/arm-ffa/arm_ffa_prv.h b/drivers/firmware/a=
rm-ffa/arm_ffa_prv.h
 new file mode 100644
-index 0000000000..4eea7dc036
+index 000000000000..4eea7dc03604
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/arm_ffa_prv.h
 @@ -0,0 +1,200 @@
@@ -688,7 +690,7 @@ index 0000000000..4eea7dc036
 +#endif
 diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/=
core.c
 new file mode 100644
-index 0000000000..0b1f8e6a07
+index 000000000000..0b1f8e6a078d
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/core.c
 @@ -0,0 +1,1315 @@
@@ -2009,7 +2011,7 @@ index 0000000000..0b1f8e6a07
 +};
 diff --git a/include/arm_ffa.h b/include/arm_ffa.h
 new file mode 100644
-index 0000000000..74b16174c2
+index 000000000000..74b16174c292
 --- /dev/null
 +++ b/include/arm_ffa.h
 @@ -0,0 +1,97 @@
@@ -2111,7 +2113,7 @@ index 0000000000..74b16174c2
 +
 +#endif
 diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
-index a432e43871..5dd698b7a9 100644
+index 376f741cc2bb..fa08a66ac8e0 100644
 --- a/include/dm/uclass-id.h
 +++ b/include/dm/uclass-id.h
 @@ -4,6 +4,9 @@
@@ -2130,8 +2132,8 @@ index a432e43871..5dd698b7a9 100644
  	UCLASS_ETH_PHY,		/* Ethernet PHY device */
 +	UCLASS_FFA,		/* Arm Firmware Framework for Armv8-A */
  	UCLASS_FIRMWARE,	/* Firmware */
+ 	UCLASS_FPGA,		/* FPGA device */
  	UCLASS_FUZZING_ENGINE,	/* Fuzzing engine */
- 	UCLASS_FS_FIRMWARE_LOADER,		/* Generic loader */
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm=
_ffa-efi-unmap-RX-TX-buffers.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-bo=
ot/corstone1000/0004-arm_ffa-efi-unmap-RX-TX-buffers.patch
index f20cc28e..d619a66f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-ef=
i-unmap-RX-TX-buffers.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-arm_ffa-ef=
i-unmap-RX-TX-buffers.patch
@@ -1,7 +1,7 @@
-From 3035651bfc0dcdfd48d28acff6efe2f29bbe9439 Mon Sep 17 00:00:00 2001
+From 7d2c73749107a5859c7158a859a62c3e8b2d33e2 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Thu, 6 Oct 2022 15:04:25 +0100
-Subject: [PATCH 04/25] arm_ffa: efi: unmap RX/TX buffers
+Subject: [PATCH 04/27] arm_ffa: efi: unmap RX/TX buffers
=20
 unmap RX/TX buffers at ExitBootServices()
=20
@@ -26,12 +26,13 @@ Changelog:
=20
 v8: pass NULL device pointer to the FF-A bus operation
 v7: replace debug() by log_err()
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  lib/efi_loader/efi_boottime.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 6f7333638a..caa64028be 100644
+index e65ca6a4cbee..3481f2afe7a9 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -3,6 +3,9 @@
@@ -69,5 +70,5 @@ index 6f7333638a..caa64028be 100644
  	efi_runtime_detach();
 =20
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm=
_ffa-introduce-armffa-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0005-arm_ffa-introduce-armffa-command.patch
index 44afdd56..cbf8c101 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-in=
troduce-armffa-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-arm_ffa-in=
troduce-armffa-command.patch
@@ -1,7 +1,7 @@
-From e9ec690a3f0d34631729a17c1734d66111e768e1 Mon Sep 17 00:00:00 2001
+From c6b116c4793449775064a8fc949a3b607b7ade27 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 6 Jun 2022 12:46:38 +0100
-Subject: [PATCH 05/25] arm_ffa: introduce armffa command
+Subject: [PATCH 05/27] arm_ffa: introduce armffa command
=20
 Provide armffa command showcasing the use of the FF-A driver
=20
@@ -47,6 +47,8 @@ v2:
 v1:
=20
 * introduce armffa command
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  MAINTAINERS                      |   1 +
  cmd/Kconfig                      |  10 ++
@@ -57,10 +59,10 @@ v1:
  create mode 100644 cmd/armffa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 734fcb10c4..d50bdddea8 100644
+index 509619d31ce6..61ce6c436fe1 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -251,6 +251,7 @@ F:	configs/cortina_presidio-asic-pnand_defconfig
+@@ -267,6 +267,7 @@ F:	configs/cortina_presidio-asic-pnand_defconfig
  ARM FF-A
  M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
  S:	Maintained
@@ -69,10 +71,10 @@ index 734fcb10c4..d50bdddea8 100644
  F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
 diff --git a/cmd/Kconfig b/cmd/Kconfig
-index 0e0be94f41..013d4c3da7 100644
+index b2d75987170e..7d0a40e8acb4 100644
 --- a/cmd/Kconfig
 +++ b/cmd/Kconfig
-@@ -912,6 +912,16 @@ endmenu
+@@ -924,6 +924,16 @@ endmenu
 =20
  menu "Device access commands"
 =20
@@ -90,7 +92,7 @@ index 0e0be94f41..013d4c3da7 100644
  	#depends on FLASH_CFI_DRIVER
  	bool "armflash"
 diff --git a/cmd/Makefile b/cmd/Makefile
-index 6e87522b62..979c6d59df 100644
+index 0b6a96c1d914..c757f1647da6 100644
 --- a/cmd/Makefile
 +++ b/cmd/Makefile
 @@ -12,6 +12,8 @@ obj-y +=3D panic.o
@@ -104,7 +106,7 @@ index 6e87522b62..979c6d59df 100644
  obj-$(CONFIG_CMD_AES) +=3D aes.o
 diff --git a/cmd/armffa.c b/cmd/armffa.c
 new file mode 100644
-index 0000000000..d2e8687bfb
+index 000000000000..d2e8687bfb1f
 --- /dev/null
 +++ b/cmd/armffa.c
 @@ -0,0 +1,237 @@
@@ -346,7 +348,7 @@ index 0000000000..d2e8687bfb
 +	   "devlist\n"
 +	   "	 - displays the arm_ffa device info\n");
 diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index e4914b9bc7..be4df89d23 100644
+index e4914b9bc779..be4df89d23fa 100644
 --- a/drivers/firmware/arm-ffa/Kconfig
 +++ b/drivers/firmware/arm-ffa/Kconfig
 @@ -4,6 +4,7 @@ config ARM_FFA_TRANSPORT
@@ -358,5 +360,5 @@ index e4914b9bc7..be4df89d23 100644
  	select DEVRES
  	help
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm=
_ffa-introduce-the-FF-A-Sandbox-driver.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0006-arm_ffa-introduce-the-FF-A-Sandbox-driver.=
patch
index 9d86dd5c..99ff617d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-in=
troduce-the-FF-A-Sandbox-driver.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-arm_ffa-in=
troduce-the-FF-A-Sandbox-driver.patch
@@ -1,7 +1,7 @@
-From 6d28dcdc36ad87b6987c7f920e06165c74eca59d Mon Sep 17 00:00:00 2001
+From 49ed44c01f7e93d614483fc2d3cc7034808e9c07 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Nov 2022 14:44:36 +0000
-Subject: [PATCH 06/25] arm_ffa: introduce the FF-A Sandbox driver
+Subject: [PATCH 06/27] arm_ffa: introduce the FF-A Sandbox driver
=20
 Provide a Sandbox driver to emulate the FF-A ABIs
=20
@@ -33,11 +33,11 @@ v4: align sandbox driver with the new FF-A driver int=
erfaces
     and new way of error handling
=20
 v1: introduce the sandbox driver
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  MAINTAINERS                                   |   1 +
  configs/sandbox64_defconfig                   |   2 +
  configs/sandbox_defconfig                     |   2 +
- doc/arch/sandbox.rst                          |   1 +
  drivers/firmware/arm-ffa/Kconfig              |   9 +-
  drivers/firmware/arm-ffa/Makefile             |   1 +
  drivers/firmware/arm-ffa/arm_ffa_prv.h        |  15 +-
@@ -47,16 +47,16 @@ v1: introduce the sandbox driver
  include/arm_ffa.h                             |   2 +-
  include/sandbox_arm_ffa.h                     |  91 +++
  lib/efi_loader/efi_boottime.c                 |   2 +-
- 13 files changed, 938 insertions(+), 13 deletions(-)
+ 12 files changed, 937 insertions(+), 13 deletions(-)
  create mode 100644 drivers/firmware/arm-ffa/sandbox.c
  create mode 100644 drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h
  create mode 100644 include/sandbox_arm_ffa.h
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index d50bdddea8..23cebbd526 100644
+index 61ce6c436fe1..297d165f8401 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -255,6 +255,7 @@ F:	cmd/armffa.c
+@@ -271,6 +271,7 @@ F:	cmd/armffa.c
  F:	doc/arch/arm64.ffa.rst
  F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
@@ -65,10 +65,10 @@ index d50bdddea8..23cebbd526 100644
  ARM FREESCALE IMX
  M:	Stefano Babic <sbabic@denx.de>
 diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
-index 290d1506c2..36e6448968 100644
+index ba45ac0b71c1..4b8a1ec42bda 100644
 --- a/configs/sandbox64_defconfig
 +++ b/configs/sandbox64_defconfig
-@@ -248,3 +248,5 @@ CONFIG_TEST_FDTDEC=3Dy
+@@ -259,3 +259,5 @@ CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
  CONFIG_UNIT_TEST=3Dy
  CONFIG_UT_TIME=3Dy
  CONFIG_UT_DM=3Dy
@@ -76,30 +76,18 @@ index 290d1506c2..36e6448968 100644
 +CONFIG_SANDBOX_FFA=3Dy
 \ No newline at end of file
 diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
-index ab5d3f19bf..8bf3848788 100644
+index be46cae7aad7..650f06ae61f7 100644
 --- a/configs/sandbox_defconfig
 +++ b/configs/sandbox_defconfig
-@@ -328,3 +328,5 @@ CONFIG_TEST_FDTDEC=3Dy
+@@ -334,3 +334,5 @@ CONFIG_TEST_FDTDEC=3Dy
  CONFIG_UNIT_TEST=3Dy
  CONFIG_UT_TIME=3Dy
  CONFIG_UT_DM=3Dy
 +CONFIG_ARM_FFA_TRANSPORT=3Dy
 +CONFIG_SANDBOX_FFA=3Dy
 \ No newline at end of file
-diff --git a/doc/arch/sandbox.rst b/doc/arch/sandbox.rst
-index 068d4a3be4..5d7e1b2c48 100644
---- a/doc/arch/sandbox.rst
-+++ b/doc/arch/sandbox.rst
-@@ -203,6 +203,7 @@ Supported Drivers
-=20
- U-Boot sandbox supports these emulations:
-=20
-+- Arm FF-A
- - Block devices
- - Chrome OS EC
- - GPIO
 diff --git a/drivers/firmware/arm-ffa/Kconfig b/drivers/firmware/arm-ffa=
/Kconfig
-index be4df89d23..b86f16d778 100644
+index be4df89d23fa..b86f16d7785d 100644
 --- a/drivers/firmware/arm-ffa/Kconfig
 +++ b/drivers/firmware/arm-ffa/Kconfig
 @@ -2,8 +2,8 @@
@@ -123,7 +111,7 @@ index be4df89d23..b86f16d778 100644
 +	help
 +	  This emulates the FF-A handling under Sandbox and allows to test the=
 FF-A driver
 diff --git a/drivers/firmware/arm-ffa/Makefile b/drivers/firmware/arm-ff=
a/Makefile
-index 043a8915be..0d21d6b47a 100644
+index 043a8915bec5..0d21d6b47ab9 100644
 --- a/drivers/firmware/arm-ffa/Makefile
 +++ b/drivers/firmware/arm-ffa/Makefile
 @@ -4,3 +4,4 @@
@@ -132,7 +120,7 @@ index 043a8915be..0d21d6b47a 100644
  obj-y +=3D arm-ffa-uclass.o core.o
 +obj-$(CONFIG_SANDBOX_FFA) +=3D sandbox.o
 diff --git a/drivers/firmware/arm-ffa/arm_ffa_prv.h b/drivers/firmware/a=
rm-ffa/arm_ffa_prv.h
-index 4eea7dc036..bbc8b87069 100644
+index 4eea7dc03604..bbc8b87069ff 100644
 --- a/drivers/firmware/arm-ffa/arm_ffa_prv.h
 +++ b/drivers/firmware/arm-ffa/arm_ffa_prv.h
 @@ -19,6 +19,16 @@
@@ -165,7 +153,7 @@ index 4eea7dc036..bbc8b87069 100644
   * struct ffa_partition_uuid - 16 bytes UUID transmitted by FFA_PARTITI=
ON_INFO_GET
   * @a1-4:	32-bit words access to the UUID data
 diff --git a/drivers/firmware/arm-ffa/core.c b/drivers/firmware/arm-ffa/=
core.c
-index 0b1f8e6a07..560603b28b 100644
+index 0b1f8e6a078d..560603b28bcc 100644
 --- a/drivers/firmware/arm-ffa/core.c
 +++ b/drivers/firmware/arm-ffa/core.c
 @@ -1072,6 +1072,7 @@ static int ffa_msg_send_direct_req(struct udevice =
*dev, u16 dst_part_id,
@@ -235,7 +223,7 @@ index 0b1f8e6a07..560603b28b 100644
 =20
 diff --git a/drivers/firmware/arm-ffa/sandbox.c b/drivers/firmware/arm-f=
fa/sandbox.c
 new file mode 100644
-index 0000000000..16f1ca926e
+index 000000000000..16f1ca926ee2
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/sandbox.c
 @@ -0,0 +1,659 @@
@@ -900,7 +888,7 @@ index 0000000000..16f1ca926e
 +};
 diff --git a/drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h b/drivers/fi=
rmware/arm-ffa/sandbox_arm_ffa_prv.h
 new file mode 100644
-index 0000000000..4db57f5092
+index 000000000000..4db57f5092f8
 --- /dev/null
 +++ b/drivers/firmware/arm-ffa/sandbox_arm_ffa_prv.h
 @@ -0,0 +1,144 @@
@@ -1049,7 +1037,7 @@ index 0000000000..4db57f5092
 +
 +#endif
 diff --git a/include/arm_ffa.h b/include/arm_ffa.h
-index 74b16174c2..b88904fe50 100644
+index 74b16174c292..b88904fe50b0 100644
 --- a/include/arm_ffa.h
 +++ b/include/arm_ffa.h
 @@ -90,7 +90,7 @@ struct ffa_bus_ops {
@@ -1063,7 +1051,7 @@ index 74b16174c2..b88904fe50 100644
 =20
 diff --git a/include/sandbox_arm_ffa.h b/include/sandbox_arm_ffa.h
 new file mode 100644
-index 0000000000..d5df16f282
+index 000000000000..d5df16f2828c
 --- /dev/null
 +++ b/include/sandbox_arm_ffa.h
 @@ -0,0 +1,91 @@
@@ -1159,7 +1147,7 @@ index 0000000000..d5df16f282
 +
 +#endif
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index caa64028be..1099ccc800 100644
+index 3481f2afe7a9..fea4eb7a342e 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -2185,7 +2185,7 @@ static efi_status_t EFIAPI efi_exit_boot_services(=
efi_handle_t image_handle,
@@ -1172,5 +1160,5 @@ index caa64028be..1099ccc800 100644
  		if (ffa_bus_ops_get()->rxtx_unmap(NULL))
  			log_err("Can't unmap FF-A RX/TX buffers\n");
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm=
_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-introduce-Sandbox-test-c=
ases-for-UCLASS_FFA.patch
index 62f6e434..a998de35 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-in=
troduce-Sandbox-test-cases-for-UCLASS_FFA.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm_ffa-in=
troduce-Sandbox-test-cases-for-UCLASS_FFA.patch
@@ -1,7 +1,7 @@
-From de26427c9f9b450ab4a18352fa51f46b3b585bc1 Mon Sep 17 00:00:00 2001
+From fcc5de7e0e618fa4ec82d37f5f0687af837e6f54 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 6 Jun 2022 17:26:06 +0100
-Subject: [PATCH 07/25] arm_ffa: introduce Sandbox test cases for UCLASS_=
FFA
+Subject: [PATCH 07/27] arm_ffa: introduce Sandbox test cases for UCLASS_=
FFA
=20
 Add functional test cases for the FF-A core driver
=20
@@ -29,6 +29,7 @@ v4: align sandbox tests with the new FF-A driver interf=
aces
  and new way of error handling
=20
 v1: introduce sandbox tests
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  MAINTAINERS      |   1 +
  test/dm/Makefile |   2 +
@@ -37,10 +38,10 @@ v1: introduce sandbox tests
  create mode 100644 test/dm/ffa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index 23cebbd526..e682db8d8f 100644
+index 297d165f8401..c1d3d4ae1c56 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -256,6 +256,7 @@ F:	doc/arch/arm64.ffa.rst
+@@ -272,6 +272,7 @@ F:	doc/arch/arm64.ffa.rst
  F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
  F:	include/sandbox_arm_ffa.h
@@ -49,7 +50,7 @@ index 23cebbd526..e682db8d8f 100644
  ARM FREESCALE IMX
  M:	Stefano Babic <sbabic@denx.de>
 diff --git a/test/dm/Makefile b/test/dm/Makefile
-index 7543df8823..e5a791768e 100644
+index 7a79b6e1a25d..85e99e1c120e 100644
 --- a/test/dm/Makefile
 +++ b/test/dm/Makefile
 @@ -1,6 +1,7 @@
@@ -60,7 +61,7 @@ index 7543df8823..e5a791768e 100644
 =20
  obj-$(CONFIG_UT_DM) +=3D test-dm.o
 =20
-@@ -81,6 +82,7 @@ obj-$(CONFIG_POWER_DOMAIN) +=3D power-domain.o
+@@ -85,6 +86,7 @@ obj-$(CONFIG_POWER_DOMAIN) +=3D power-domain.o
  obj-$(CONFIG_ACPI_PMC) +=3D pmc.o
  obj-$(CONFIG_DM_PMIC) +=3D pmic.o
  obj-$(CONFIG_DM_PWM) +=3D pwm.o
@@ -70,7 +71,7 @@ index 7543df8823..e5a791768e 100644
  obj-y +=3D regmap.o
 diff --git a/test/dm/ffa.c b/test/dm/ffa.c
 new file mode 100644
-index 0000000000..128d8626a7
+index 000000000000..128d8626a761
 --- /dev/null
 +++ b/test/dm/ffa.c
 @@ -0,0 +1,392 @@
@@ -467,5 +468,5 @@ index 0000000000..128d8626a7
 +
 +DM_TEST(dm_test_ffa_nack, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm=
_ffa-introduce-armffa-command-Sandbox-test.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0008-arm_ffa-introduce-armffa-command-Sandb=
ox-test.patch
index db0d4b0b..fed806e6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-in=
troduce-armffa-command-Sandbox-test.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm_ffa-in=
troduce-armffa-command-Sandbox-test.patch
@@ -1,7 +1,7 @@
-From 5507189fe37f1243d685c59ea52fa5643d3cc50c Mon Sep 17 00:00:00 2001
+From 5816c61212f9710a5c7310cd7c57cc349e852152 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Nov 2022 14:48:34 +0000
-Subject: [PATCH 08/25] arm_ffa: introduce armffa command Sandbox test
+Subject: [PATCH 08/27] arm_ffa: introduce armffa command Sandbox test
=20
 Add Sandbox test for the armffa command
=20
@@ -18,6 +18,7 @@ Changelog:
 v4: drop use of helper APIs
=20
 v1: introduce armffa command sandbox test
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  MAINTAINERS       |  1 +
  test/cmd/Makefile |  2 ++
@@ -26,10 +27,10 @@ v1: introduce armffa command sandbox test
  create mode 100644 test/cmd/armffa.c
=20
 diff --git a/MAINTAINERS b/MAINTAINERS
-index e682db8d8f..72f01769c9 100644
+index c1d3d4ae1c56..a2f60a3b93a6 100644
 --- a/MAINTAINERS
 +++ b/MAINTAINERS
-@@ -256,6 +256,7 @@ F:	doc/arch/arm64.ffa.rst
+@@ -272,6 +272,7 @@ F:	doc/arch/arm64.ffa.rst
  F:	drivers/firmware/arm-ffa/
  F:	include/arm_ffa.h
  F:	include/sandbox_arm_ffa.h
@@ -38,7 +39,7 @@ index e682db8d8f..72f01769c9 100644
 =20
  ARM FREESCALE IMX
 diff --git a/test/cmd/Makefile b/test/cmd/Makefile
-index c331757425..19e9d0a995 100644
+index bc961df3dcee..21aa6d740ee8 100644
 --- a/test/cmd/Makefile
 +++ b/test/cmd/Makefile
 @@ -1,6 +1,7 @@
@@ -49,14 +50,17 @@ index c331757425..19e9d0a995 100644
 =20
  ifdef CONFIG_HUSH_PARSER
  obj-$(CONFIG_CONSOLE_RECORD) +=3D test_echo.o
-@@ -13,3 +14,4 @@ obj-$(CONFIG_CMD_MEM_SEARCH) +=3D mem_search.o
- obj-$(CONFIG_CMD_PINMUX) +=3D pinmux.o
+@@ -18,6 +19,7 @@ obj-$(CONFIG_CMD_PINMUX) +=3D pinmux.o
  obj-$(CONFIG_CMD_PWM) +=3D pwm.o
+ ifdef CONFIG_SANDBOX
  obj-$(CONFIG_CMD_SETEXPR) +=3D setexpr.o
 +obj-$(CONFIG_SANDBOX_FFA) +=3D armffa.o
+ endif
+ obj-$(CONFIG_CMD_TEMPERATURE) +=3D temperature.o
+ obj-$(CONFIG_CMD_WGET) +=3D wget.o
 diff --git a/test/cmd/armffa.c b/test/cmd/armffa.c
 new file mode 100644
-index 0000000000..e04363ba63
+index 000000000000..e04363ba63f9
 --- /dev/null
 +++ b/test/cmd/armffa.c
 @@ -0,0 +1,39 @@
@@ -100,5 +104,5 @@ index 0000000000..e04363ba63
 +
 +DM_TEST(dm_test_armffa_cmd, UT_TESTF_SCAN_FDT | UT_TESTF_CONSOLE_REC);
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm=
_ffa-efi-introduce-FF-A-MM-communication.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0009-arm_ffa-efi-introduce-FF-A-MM-communicat=
ion.patch
index e9ffd6bb..0847cee0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-ef=
i-introduce-FF-A-MM-communication.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm_ffa-ef=
i-introduce-FF-A-MM-communication.patch
@@ -1,7 +1,7 @@
-From cefc1d101c62e62e66f9cbf1775defde7d2c3d27 Mon Sep 17 00:00:00 2001
+From e371b2d29aa447c1a186ab25b37b99fded967b77 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 15 Aug 2022 15:12:49 +0100
-Subject: [PATCH 09/25] arm_ffa: efi: introduce FF-A MM communication
+Subject: [PATCH 09/27] arm_ffa: efi: introduce FF-A MM communication
=20
 Add MM communication support using FF-A transport
=20
@@ -79,6 +79,8 @@ v2:
 v1:
=20
 * introduce FF-A MM communication
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  include/mm_communication.h        |   5 +
  lib/efi_loader/Kconfig            |  14 +-
@@ -86,7 +88,7 @@ v1:
  3 files changed, 307 insertions(+), 6 deletions(-)
=20
 diff --git a/include/mm_communication.h b/include/mm_communication.h
-index e65fbde60d..d409bed777 100644
+index e65fbde60d0a..d409bed77714 100644
 --- a/include/mm_communication.h
 +++ b/include/mm_communication.h
 @@ -6,6 +6,8 @@
@@ -109,10 +111,10 @@ index e65fbde60d..d409bed777 100644
   * Interface to the pseudo Trusted Application (TA), which provides a
   * communication channel with the Standalone MM (Management Mode)
 diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
-index b8fb2701a7..d292f57244 100644
+index b498c72206fd..ca7390848125 100644
 --- a/lib/efi_loader/Kconfig
 +++ b/lib/efi_loader/Kconfig
-@@ -61,13 +61,23 @@ config EFI_VARIABLE_FILE_STORE
+@@ -55,13 +55,23 @@ config EFI_VARIABLE_FILE_STORE
  	  stored as file /ubootefi.var on the EFI system partition.
 =20
  config EFI_MM_COMM_TEE
@@ -139,7 +141,7 @@ index b8fb2701a7..d292f57244 100644
  	bool "Don't persist non-volatile UEFI variables"
  	help
 diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_vari=
able_tee.c
-index dfef18435d..3933a24e8c 100644
+index dfef18435dfa..3933a24e8cdc 100644
 --- a/lib/efi_loader/efi_variable_tee.c
 +++ b/lib/efi_loader/efi_variable_tee.c
 @@ -4,9 +4,12 @@
@@ -494,5 +496,5 @@ index dfef18435d..3933a24e8c 100644
 =20
  	/*
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm=
_ffa-efi-corstone1000-enable-MM-communication.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-efi-corstone1000-enable-MM-=
communication.patch
index 1dfc19b1..e182d9cd 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-ef=
i-corstone1000-enable-MM-communication.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0010-arm_ffa-ef=
i-corstone1000-enable-MM-communication.patch
@@ -1,7 +1,7 @@
-From 46cadb787a3b13da39419706fae7d1ba703f4b68 Mon Sep 17 00:00:00 2001
+From a5d70b9bf23b38fbc8c6b4c3f384278aeca3bbce Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Fri, 23 Sep 2022 15:17:21 +0100
-Subject: [PATCH 10/25] arm_ffa: efi: corstone1000: enable MM communicati=
on
+Subject: [PATCH 10/27] arm_ffa: efi: corstone1000: enable MM communicati=
on
=20
 turn on EFI MM communication
=20
@@ -36,13 +36,15 @@ v6:
 v4:
=20
 * corstone-1000: turn on EFI MM communication
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
- configs/corstone1000_defconfig | 2 ++
- include/configs/corstone1000.h | 9 +++++++++
- 2 files changed, 11 insertions(+)
+ configs/corstone1000_defconfig |  2 ++
+ include/configs/corstone1000.h | 10 ++++++++++
+ 2 files changed, 12 insertions(+)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index ed2e0fe70a..c26f99e7e5 100644
+index dddfa2750762..d1dc06c86c2c 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -52,3 +52,5 @@ CONFIG_DM_SERIAL=3Dy
@@ -52,7 +54,7 @@ index ed2e0fe70a..c26f99e7e5 100644
 +CONFIG_EFI_MM_COMM_TEE=3Dy
 +CONFIG_ARM_FFA_TRANSPORT=3Dy
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 8e0230c135..0362d29ac2 100644
+index 8e0230c135e3..b6226fa12af3 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -14,6 +14,15 @@
@@ -71,6 +73,14 @@ index 8e0230c135..0362d29ac2 100644
  #define V2M_BASE		0x80000000
 =20
  #define CONFIG_PL011_CLOCK	50000000
+@@ -22,6 +31,7 @@
+ #define PHYS_SDRAM_1		(V2M_BASE)
+ #define PHYS_SDRAM_1_SIZE	0x80000000
+=20
++#define CFG_SYS_SDRAM_BASE	PHYS_SDRAM_1
+ #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
+=20
+ #define BOOT_TARGET_DEVICES(func) \
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi=
-corstone1000-introduce-EFI-capsule-update.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone1000/0011-efi-corstone1000-introduce-EFI-capsule=
-update.patch
index 57f1b9a2..37877c90 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-introduce-EFI-capsule-update.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0011-efi-corsto=
ne1000-introduce-EFI-capsule-update.patch
@@ -1,7 +1,7 @@
-From 7702c4aeda51011be95ecbaab0dc2e7373d04286 Mon Sep 17 00:00:00 2001
+From 6a73345662d53ebaa9750c70aa8fc7f40d3f8524 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Tue, 29 Nov 2022 15:11:27 +0000
-Subject: [PATCH 11/25] efi: corstone1000: introduce EFI capsule update
+Subject: [PATCH 11/27] efi: corstone1000: introduce EFI capsule update
=20
 This commit provides capsule update feature for Corstone1000.
=20
@@ -32,7 +32,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  7 files changed, 200 insertions(+), 4 deletions(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 4f4b96a095..76816f8f4e 100644
+index 4f4b96a095c2..76816f8f4ea1 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -66,6 +66,10 @@ static struct mm_region corstone1000_mem_map[] =3D {
@@ -47,7 +47,7 @@ index 4f4b96a095..76816f8f4e 100644
  {
  	return 0;
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index c26f99e7e5..c72d027711 100644
+index d1dc06c86c2c..06eac3e041fe 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -54,3 +54,6 @@ CONFIG_USB_ISP1760=3Dy
@@ -58,7 +58,7 @@ index c26f99e7e5..c72d027711 100644
 +CONFIG_EFI_CAPSULE_FIRMWARE_FIT=3Dy
 +CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 0362d29ac2..4d20090c9b 100644
+index b6226fa12af3..cd30499e3c9c 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -14,6 +14,24 @@
@@ -87,10 +87,10 @@ index 0362d29ac2..4d20090c9b 100644
 =20
  /*
 diff --git a/include/efi_loader.h b/include/efi_loader.h
-index 545ba06d94..773c4f6310 100644
+index f9e427f09059..26981141c228 100644
 --- a/include/efi_loader.h
 +++ b/include/efi_loader.h
-@@ -993,11 +993,11 @@ extern const struct efi_firmware_management_protoc=
ol efi_fmp_fit;
+@@ -1032,11 +1032,11 @@ extern const struct efi_firmware_management_prot=
ocol efi_fmp_fit;
  extern const struct efi_firmware_management_protocol efi_fmp_raw;
 =20
  /* Capsule update */
@@ -105,7 +105,7 @@ index 545ba06d94..773c4f6310 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 1099ccc800..d9eed33ac8 100644
+index fea4eb7a342e..faab74474d77 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -2103,6 +2103,33 @@ static void efi_exit_caches(void)
@@ -157,12 +157,12 @@ index 1099ccc800..d9eed33ac8 100644
 +
  	/* Give the payload some time to boot */
  	efi_set_watchdog(0);
- 	WATCHDOG_RESET();
+ 	schedule();
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index a6b98f066a..636b61f0ad 100644
+index 0997cd248fe3..9e8ddaac7f03 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -25,6 +25,14 @@
+@@ -26,6 +26,14 @@
  #include <crypto/pkcs7_parser.h>
  #include <linux/err.h>
 =20
@@ -177,7 +177,7 @@ index a6b98f066a..636b61f0ad 100644
  DECLARE_GLOBAL_DATA_PTR;
 =20
  const efi_guid_t efi_guid_capsule_report =3D EFI_CAPSULE_REPORT_GUID;
-@@ -512,6 +520,78 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -696,6 +704,78 @@ static efi_status_t efi_capsule_update_firmware(
  }
  #endif /* CONFIG_EFI_CAPSULE_FIRMWARE_MANAGEMENT */
 =20
@@ -200,7 +200,7 @@ index a6b98f066a..636b61f0ad 100644
 +efi_status_t efi_corstone1000_alloc_capsule_shared_buf(void)
 +{
 +	efi_status_t efi_ret;
-+	u64 ram_base =3D CONFIG_SYS_SDRAM_BASE;
++	u64 ram_base =3D CFG_SYS_SDRAM_BASE;
 +
 +	log_debug("[%s]\n", __func__);
 +
@@ -256,7 +256,7 @@ index a6b98f066a..636b61f0ad 100644
  /**
   * efi_update_capsule() - process information from operating system
   * @capsule_header_array:	Array of virtual address pointers
-@@ -525,7 +605,7 @@ static efi_status_t efi_capsule_update_firmware(
+@@ -709,7 +789,7 @@ static efi_status_t efi_capsule_update_firmware(
   *
   * Return:			status code
   */
@@ -265,7 +265,7 @@ index a6b98f066a..636b61f0ad 100644
  		struct efi_capsule_header **capsule_header_array,
  		efi_uintn_t capsule_count,
  		u64 scatter_gather_list)
-@@ -542,6 +622,13 @@ efi_status_t EFIAPI efi_update_capsule(
+@@ -726,6 +806,13 @@ efi_status_t EFIAPI efi_update_capsule(
  		goto out;
  	}
 =20
@@ -279,7 +279,7 @@ index a6b98f066a..636b61f0ad 100644
  	ret =3D EFI_SUCCESS;
  	for (i =3D 0, capsule =3D *capsule_header_array; i < capsule_count;
  	     i++, capsule =3D *(++capsule_header_array)) {
-@@ -554,6 +641,39 @@ efi_status_t EFIAPI efi_update_capsule(
+@@ -738,6 +825,39 @@ efi_status_t EFIAPI efi_update_capsule(
 =20
  		log_debug("Capsule[%d] (guid:%pUs)\n",
  			  i, &capsule->capsule_guid);
@@ -319,7 +319,7 @@ index a6b98f066a..636b61f0ad 100644
  		if (!guidcmp(&capsule->capsule_guid,
  			     &efi_guid_firmware_management_capsule_id)) {
  			ret  =3D efi_capsule_update_firmware(capsule);
-@@ -592,7 +712,7 @@ out:
+@@ -776,7 +896,7 @@ out:
   *
   * Return:			status code
   */
@@ -329,7 +329,7 @@ index a6b98f066a..636b61f0ad 100644
  		efi_uintn_t capsule_count,
  		u64 *maximum_capsule_size,
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index c633fcd91e..443f409906 100644
+index 543764113530..1ad2fa52d7e9 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -16,6 +16,13 @@
@@ -362,5 +362,5 @@ index c633fcd91e..443f409906 100644
  		ret =3D efi_set_variable_int(u"CapsuleMax",
  					   &efi_guid_capsule_report,
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm=
-corstone1000-fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0012-arm-corstone1000-fix-unrecognized-=
filesystem-type.patch
index 9b12ee9a..740f8783 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0012-arm-corsto=
ne1000-fix-unrecognized-filesystem-type.patch
@@ -1,7 +1,7 @@
-From 71162273e8a6b28a6aaf8635cff752419d09a293 Mon Sep 17 00:00:00 2001
+From 2f76fd5cf66a983f68bc115463b9ea5714b3c221 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Fri, 4 Mar 2022 15:56:09 +0000
-Subject: [PATCH 12/25] arm: corstone1000: fix unrecognized filesystem ty=
pe
+Subject: [PATCH 12/27] arm: corstone1000: fix unrecognized filesystem ty=
pe
=20
 Some usb sticks are not recognized by usb, just add a
 delay before checking status.
@@ -13,10 +13,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 3 insertions(+)
=20
 diff --git a/common/usb_storage.c b/common/usb_storage.c
-index eaa31374ef..79cf4297d4 100644
+index ac6427577379..1d2680c3cd33 100644
 --- a/common/usb_storage.c
 +++ b/common/usb_storage.c
-@@ -784,6 +784,9 @@ static int usb_stor_BBB_transport(struct scsi_cmd *s=
rb, struct us_data *us)
+@@ -785,6 +785,9 @@ static int usb_stor_BBB_transport(struct scsi_cmd *s=
rb, struct us_data *us)
  st:
  	retry =3D 0;
  again:
@@ -27,5 +27,5 @@ index eaa31374ef..79cf4297d4 100644
  	result =3D usb_bulk_msg(us->pusb_dev, pipein, csw, UMASS_BBB_CSW_SIZE,
  				&actlen, USB_CNTL_TIMEOUT*5);
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi=
_capsule-corstone1000-pass-interface-id-and-buffe.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0013-efi_capsule-corstone1000-pass-i=
nterface-id-and-buffe.patch
index 9334b804..a86e0c8c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_capsul=
e-corstone1000-pass-interface-id-and-buffe.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0013-efi_capsul=
e-corstone1000-pass-interface-id-and-buffe.patch
@@ -1,7 +1,7 @@
-From f8ccaf53dec63d57bab2f86b822f9fb3ed06d132 Mon Sep 17 00:00:00 2001
+From 8727a1b34fb500ca5cce6fc1c30a1d73bf23aaba Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 10 Dec 2021 20:03:35 +0000
-Subject: [PATCH 13/25] efi_capsule: corstone1000: pass interface id and =
buffer
+Subject: [PATCH 13/27] efi_capsule: corstone1000: pass interface id and =
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
-index 4d20090c9b..77f96e87a1 100644
+index cd30499e3c9c..e4c7bcb96f27 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -24,6 +24,12 @@
@@ -40,10 +40,10 @@ index 4d20090c9b..77f96e87a1 100644
  #define CORSTONE1000_CAPSULE_BUFFER_SIZE	(8192) /* 32 MB */
 =20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 636b61f0ad..c22b9b5aa0 100644
+index 9e8ddaac7f03..bd4cc8d27285 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -28,6 +28,8 @@
+@@ -29,6 +29,8 @@
  #ifdef CONFIG_TARGET_CORSTONE1000
  #include <arm_ffa.h>
  #include <cpu_func.h>
@@ -52,7 +52,7 @@ index 636b61f0ad..c22b9b5aa0 100644
 =20
  void *__efi_runtime_data corstone1000_capsule_buf; /* capsule shared bu=
ffer virtual address */
  efi_guid_t corstone1000_capsule_guid =3D EFI_CORSTONE1000_CAPSULE_ID_GU=
ID;
-@@ -582,11 +584,12 @@ static int __efi_runtime efi_corstone1000_buffer_r=
eady_event(u32 capsule_image_s
+@@ -766,11 +768,12 @@ static int __efi_runtime efi_corstone1000_buffer_r=
eady_event(u32 capsule_image_s
  	log_debug("[%s]\n", __func__);
 =20
  	/*
@@ -70,5 +70,5 @@ index 636b61f0ad..c22b9b5aa0 100644
  	return ffa_bus_ops_get()->sync_send_receive(NULL, CORSTONE1000_SEPROXY=
_PART_ID, &msg, 0);
  }
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi=
_boottime-corstone1000-pass-interface-id-and-kern.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0014-efi_boottime-corstone1000-pass-=
interface-id-and-kern.patch
index a8d2c817..8559c9cb 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_bootti=
me-corstone1000-pass-interface-id-and-kern.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0014-efi_bootti=
me-corstone1000-pass-interface-id-and-kern.patch
@@ -1,7 +1,7 @@
-From e4e7ccc77a4e6930a768cc1c1f6daf8907ac16c3 Mon Sep 17 00:00:00 2001
+From 80273f9bcab14059ec92e5c05826ae52113cebe6 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 10 Dec 2021 20:10:41 +0000
-Subject: [PATCH 14/25] efi_boottime: corstone1000: pass interface id and
+Subject: [PATCH 14/27] efi_boottime: corstone1000: pass interface id and
  kernel event id using register w4
=20
 Initially the interface/event IDs are passed to the SP using register
@@ -22,7 +22,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  1 file changed, 10 insertions(+), 3 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index d9eed33ac8..88f2d050be 100644
+index faab74474d77..36a0be7ba104 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -30,6 +30,11 @@
@@ -54,5 +54,5 @@ index d9eed33ac8..88f2d050be 100644
  	return ffa_bus_ops_get()->sync_send_receive(CORSTONE1000_SEPROXY_PART_=
ID, &msg, 0);
  }
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi=
_loader-corstone1000-remove-guid-check-from-corst.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader-corstone1000-remove-=
guid-check-from-corst.patch
index d028e3ed..98e85056 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0015-efi_loader=
-corstone1000-remove-guid-check-from-corst.patch
@@ -1,7 +1,7 @@
-From caf6c4ec65fd0a5e945dd790f2369acd163d1daf Mon Sep 17 00:00:00 2001
+From 315d4eb0f5be4ed844bf6c7496d2ea62e518aa5c Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 11 Dec 2021 13:23:55 +0000
-Subject: [PATCH 15/25] efi_loader: corstone1000: remove guid check from
+Subject: [PATCH 15/27] efi_loader: corstone1000: remove guid check from
  corstone1000 config option
=20
 Use generic fmp guid and no separte check is required for
@@ -15,10 +15,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 1 insertion(+), 15 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index c22b9b5aa0..0eee3c2d4c 100644
+index bd4cc8d27285..ef7b358ddba9 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -646,12 +646,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
+@@ -830,12 +830,6 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
  			  i, &capsule->capsule_guid);
 =20
  #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
@@ -31,7 +31,7 @@ index c22b9b5aa0..0eee3c2d4c 100644
  		if (efi_size_in_pages(capsule->capsule_image_size) >
  		    CORSTONE1000_CAPSULE_BUFFER_SIZE) {
  			log_err("Corstone1000: Capsule data size exceeds the shared buffer s=
ize\n");
-@@ -677,15 +671,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
+@@ -861,15 +855,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
  		goto out;
  #endif
 =20
@@ -49,5 +49,5 @@ index c22b9b5aa0..0eee3c2d4c 100644
  			goto out;
  	}
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi=
_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader-populate-ESRT-table-=
if-EFI_ESRT-config-op.patch
index 934476ba..8c31a5ab 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0016-efi_loader=
-populate-ESRT-table-if-EFI_ESRT-config-op.patch
@@ -1,7 +1,7 @@
-From 41a2c8bb23e587e9abe7b8bc62db1a93c0e5d841 Mon Sep 17 00:00:00 2001
+From 978d2b92a2ae1f2be71c85271c2d79a5eaf74815 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:49:02 +0000
-Subject: [PATCH 16/25] efi_loader: populate ESRT table if EFI_ESRT confi=
g
+Subject: [PATCH 16/27] efi_loader: populate ESRT table if EFI_ESRT confi=
g
  option is set
=20
 This change is to call efi_esrt_populate function if CONFIG_EFI_ESRT
@@ -15,10 +15,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 7 insertions(+)
=20
 diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
-index 0eee3c2d4c..94dc0dfe3d 100644
+index ef7b358ddba9..8eb8fc406adf 100644
 --- a/lib/efi_loader/efi_capsule.c
 +++ b/lib/efi_loader/efi_capsule.c
-@@ -668,6 +668,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
+@@ -852,6 +852,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsul=
e(
  			ret =3D EFI_SUCCESS;
  		}
 =20
@@ -33,5 +33,5 @@ index 0eee3c2d4c..94dc0dfe3d 100644
  #endif
 =20
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi=
_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0017-efi_firmware-add-get_image_info-for=
-corstone1000.patch
index 2c0ad250..0a9696d0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0017-efi_firmwa=
re-add-get_image_info-for-corstone1000.patch
@@ -1,7 +1,7 @@
-From 323df950c63af6d1a9ba5bd16f4f9d9348e9afc2 Mon Sep 17 00:00:00 2001
+From 03f0a1ac1450223ff2aa9be116e918230371048e Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 17 Dec 2021 19:50:25 +0000
-Subject: [PATCH 17/25] efi_firmware: add get_image_info for corstone1000
+Subject: [PATCH 17/27] efi_firmware: add get_image_info for corstone1000
=20
 This change is to populate get_image_info which eventually
 will be populated in ESRT table
@@ -10,14 +10,14 @@ Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.c=
om>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Upstream-Status: Pending [Not submitted to upstream yet]
 ---
- lib/efi_loader/efi_firmware.c | 71 ++++++++++++++++++++++++++++++++++-
- 1 file changed, 70 insertions(+), 1 deletion(-)
+ lib/efi_loader/efi_firmware.c | 72 ++++++++++++++++++++++++++++++++++-
+ 1 file changed, 71 insertions(+), 1 deletion(-)
=20
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 30cafd15ca..af43d4502f 100644
+index 93e2b01c07a6..0a38a96351ff 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
-@@ -17,11 +17,69 @@
+@@ -18,11 +18,69 @@
 =20
  #define FMP_PAYLOAD_HDR_SIGNATURE	SIGNATURE_32('M', 'S', 'S', '1')
 =20
@@ -88,7 +88,7 @@ index 30cafd15ca..af43d4502f 100644
   *
   * @signature:			Header signature used to identify the header
   * @header_size:		Size of the structure
-@@ -285,10 +343,18 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
+@@ -286,10 +344,18 @@ efi_status_t EFIAPI efi_firmware_get_image_info(
  	     !descriptor_size || !package_version || !package_version_name))
  		return EFI_EXIT(EFI_INVALID_PARAMETER);
 =20
@@ -107,16 +107,17 @@ index 30cafd15ca..af43d4502f 100644
 =20
  	return EFI_EXIT(ret);
  }
-@@ -401,6 +467,9 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
- 	if (status !=3D EFI_SUCCESS)
- 		return EFI_EXIT(status);
+@@ -415,6 +481,10 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+ 		}
+ 	}
 =20
 +#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
 +	return EFI_EXIT(EFI_SUCCESS);
 +#endif
++
  	if (dfu_write_by_alt(image_index - 1, (void *)image, image_size,
  			     NULL, NULL))
  		return EFI_EXIT(EFI_DEVICE_ERROR);
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-efi=
_loader-send-bootcomplete-message-to-secure-encla.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0018-efi_loader-send-bootcomplete-me=
ssage-to-secure-encla.patch
index e95609a3..e6a2a556 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-efi_loader=
-send-bootcomplete-message-to-secure-encla.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0018-efi_loader=
-send-bootcomplete-message-to-secure-encla.patch
@@ -1,7 +1,7 @@
-From 7bf9c380c63726b7de8316e9c743cb06c9bc7842 Mon Sep 17 00:00:00 2001
+From 5866edd29215e939eaad38956886df6c7af5ab96 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Mon, 15 Aug 2022 15:46:18 +0100
-Subject: [PATCH 18/25] efi_loader: send bootcomplete message to secure e=
nclave
+Subject: [PATCH 18/27] efi_loader: send bootcomplete message to secure e=
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
-index 77f96e87a1..4cf1170ffb 100644
+index e4c7bcb96f27..be13b98d4829 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
 @@ -22,7 +22,7 @@
@@ -34,7 +34,7 @@ index 77f96e87a1..4cf1170ffb 100644
  #define PREP_SEPROXY_SVC_ID_MASK	GENMASK(31, 16)
  #define PREP_SEPROXY_SVC_ID(x)	 (FIELD_PREP(PREP_SEPROXY_SVC_ID_MASK, (=
x)))
 diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
-index 88f2d050be..1099ccc800 100644
+index 36a0be7ba104..fea4eb7a342e 100644
 --- a/lib/efi_loader/efi_boottime.c
 +++ b/lib/efi_loader/efi_boottime.c
 @@ -30,11 +30,6 @@
@@ -100,12 +100,12 @@ index 88f2d050be..1099ccc800 100644
 -
  	/* Give the payload some time to boot */
  	efi_set_watchdog(0);
- 	WATCHDOG_RESET();
+ 	schedule();
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index af43d4502f..25f427b936 100644
+index 0a38a96351ff..70568f22909e 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
-@@ -47,7 +47,7 @@ static efi_status_t efi_corstone1000_img_info_get (
+@@ -48,7 +48,7 @@ static efi_status_t efi_corstone1000_img_info_get (
  		*package_version_name =3D NULL; /* not supported */
 =20
  	if(image_info =3D=3D NULL) {
@@ -115,7 +115,7 @@ index af43d4502f..25f427b936 100644
  	}
 =20
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 443f409906..c154eb0e9d 100644
+index 1ad2fa52d7e9..89f988b09c44 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -17,6 +17,9 @@
@@ -179,5 +179,5 @@ index 443f409906..c154eb0e9d 100644
  	if (ret !=3D EFI_SUCCESS) {
  		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n"=
);
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi=
_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0019-efi_loader-fix-null-pointer-exc=
eption-with-get_image.patch
index e9bf495f..eef436c1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0019-efi_loader=
-fix-null-pointer-exception-with-get_image.patch
@@ -1,7 +1,7 @@
-From 28e7a47c7021b7d321bb6e4dbe1bd7d2ceb8aa6d Mon Sep 17 00:00:00 2001
+From 56c14cd9a96d0c0907b2cb9c1b95a5debff97f75 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 14 Jan 2022 15:24:18 +0000
-Subject: [PATCH 19/25] efi_loader: fix null pointer exception with
+Subject: [PATCH 19/27] efi_loader: fix null pointer exception with
  get_image_info
=20
 get_img_info API implemented for corstone1000 target does not
@@ -17,10 +17,10 @@ Upstream-Status: Pending [Not submitted to upstream y=
et]
  1 file changed, 11 insertions(+), 8 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 25f427b936..28d9a19edb 100644
+index 70568f22909e..c883e2ff0aa9 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
-@@ -38,26 +38,29 @@ static efi_status_t efi_corstone1000_img_info_get (
+@@ -39,26 +39,29 @@ static efi_status_t efi_corstone1000_img_info_get (
  	int i =3D 0;
 =20
  	*image_info_size =3D sizeof(*image_info);
@@ -59,5 +59,5 @@ index 25f427b936..28d9a19edb 100644
  					     IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
  	image_info[i].attributes_setting =3D IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm=
-corstone1000-add-mmc-for-fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-b=
oot/corstone1000/0020-arm-corstone1000-add-mmc-for-fvp.patch
index 87432599..b8d7897d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm-corsto=
ne1000-add-mmc-for-fvp.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0020-arm-corsto=
ne1000-add-mmc-for-fvp.patch
@@ -1,7 +1,7 @@
-From d662633cb8e90144969790b8abf047a3f777e47a Mon Sep 17 00:00:00 2001
+From 0a4aa2a03a208996e7448c79edd0adef9a697255 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 30 Nov 2022 15:37:22 +0000
-Subject: [PATCH 20/25] arm:corstone1000: add mmc for fvp
+Subject: [PATCH 20/27] arm:corstone1000: add mmc for fvp
=20
 Enable support mmc/sdcard for the corstone1000 FVP.
=20
@@ -15,7 +15,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  3 files changed, 32 insertions(+), 8 deletions(-)
=20
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index 76816f8f4e..d6ca6e8961 100644
+index 76816f8f4ea1..d6ca6e896140 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -38,19 +38,35 @@ static struct mm_region corstone1000_mem_map[] =3D {
@@ -61,7 +61,7 @@ index 76816f8f4e..d6ca6e8961 100644
  		/* OCVM */
  		.virt =3D 0x80000000UL,
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index c72d027711..336da67a8d 100644
+index 06eac3e041fe..f7c276a10a6e 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -40,7 +40,13 @@ CONFIG_VERSION_VARIABLE=3Dy
@@ -80,10 +80,10 @@ index c72d027711..336da67a8d 100644
  CONFIG_PHY_SMSC=3Dy
  CONFIG_SMC911X=3Dy
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 4cf1170ffb..1f28a0f6c0 100644
+index be13b98d4829..a015a1630e2c 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
-@@ -58,7 +58,9 @@
+@@ -59,7 +59,9 @@
  #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
 =20
  #define BOOT_TARGET_DEVICES(func) \
@@ -95,5 +95,5 @@ index 4cf1170ffb..1f28a0f6c0 100644
  #include <config_distro_bootcmd.h>
 =20
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-cor=
stone1000-add-compressed-kernel-support.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0021-corstone1000-add-compressed-kernel-suppor=
t.patch
index d2375239..a7e24e37 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corstone10=
00-add-compressed-kernel-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0021-corstone10=
00-add-compressed-kernel-support.patch
@@ -1,7 +1,7 @@
-From 37ee9a07d168b43bde17b2ce3dbf637905af5bf2 Mon Sep 17 00:00:00 2001
+From c9503083c042e453be3178a79ba3ff81e8d7ca17 Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
 Date: Wed, 30 Nov 2022 18:59:59 +0000
-Subject: [PATCH 21/25] corstone1000: add compressed kernel support
+Subject: [PATCH 21/27] corstone1000: add compressed kernel support
=20
 The corstone1000 kernel has become too large to fit in the available
 storage.  Swtiching to a compressed kernel avoids the problem, but
@@ -11,12 +11,13 @@ instructions.
 Signed-off-by: Jon Mason <jon.mason@arm.com>
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  configs/corstone1000_defconfig | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 336da67a8d..eeb207aa5f 100644
+index f7c276a10a6e..1179bf5f3bfd 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -15,7 +15,7 @@ CONFIG_FIT=3Dy
@@ -29,5 +30,5 @@ index 336da67a8d..eeb207aa5f 100644
  CONFIG_LOGLEVEL=3D7
  # CONFIG_DISPLAY_CPUINFO is not set
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Int=
roduce-external-sys-driver-to-device-tree.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/corstone1000/0022-Introduce-external-sys-driver-to-device=
-tree.patch
index 91af4262..4fb39794 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Introduce-=
external-sys-driver-to-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0022-Introduce-=
external-sys-driver-to-device-tree.patch
@@ -1,19 +1,20 @@
-From a3fae205de2fd6d2abdb8afca6475267c16e9e29 Mon Sep 17 00:00:00 2001
+From 2229a66346fb16f092d79fc2e9756ec34ff041a4 Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Wed, 30 Nov 2022 19:02:26 +0000
-Subject: [PATCH 22/25] Introduce external sys driver to device-tree
+Subject: [PATCH 22/27] Introduce external sys driver to device-tree
=20
 It adds external sys driver binding to u-boot
 device tree.
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  arch/arm/dts/corstone1000.dtsi | 7 +++++++
  1 file changed, 7 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 4e46826f88..2c7185e139 100644
+index 4e46826f883a..2c7185e1391a 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -160,5 +160,12 @@
@@ -30,5 +31,5 @@ index 4e46826f88..2c7185e139 100644
  	};
  };
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add=
-mhu-and-rpmsg-client-to-u-boot-device-tree.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0023-Add-mhu-and-rpmsg-client-to-u-boot-de=
vice-tree.patch
index 04cbf764..f144c63a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add-mhu-an=
d-rpmsg-client-to-u-boot-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0023-Add-mhu-an=
d-rpmsg-client-to-u-boot-device-tree.patch
@@ -1,7 +1,7 @@
-From 55e2bc835be50b23ef04066b950bbe75c0065d19 Mon Sep 17 00:00:00 2001
+From aef33222f500c91badd301aecefd153c6d0eb834 Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Mon, 12 Sep 2022 15:47:06 +0100
-Subject: [PATCH 23/25] Add mhu and rpmsg client to u-boot device tree
+Subject: [PATCH 23/27] Add mhu and rpmsg client to u-boot device tree
=20
 Adds external system controller and mhu driver to u-boot
 device tree. This enables communication between host and
@@ -9,12 +9,13 @@ the external system.
=20
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  arch/arm/dts/corstone1000.dtsi | 50 ++++++++++++++++++++++++++++++++++
  1 file changed, 50 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
-index 2c7185e139..61e0c33247 100644
+index 2c7185e1391a..61e0c33247ce 100644
 --- a/arch/arm/dts/corstone1000.dtsi
 +++ b/arch/arm/dts/corstone1000.dtsi
 @@ -161,6 +161,56 @@
@@ -75,5 +76,5 @@ index 2c7185e139..61e0c33247 100644
  			compatible =3D "arm,extsys_ctrl";
  			reg =3D <0x1A010310 0x4>,
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm=
-corstone1000-esrt-support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/corstone1000/0024-arm-corstone1000-esrt-support.patch
index 160ff8a4..87551e9a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corsto=
ne1000-esrt-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-arm-corsto=
ne1000-esrt-support.patch
@@ -1,7 +1,7 @@
-From 475f787ba7351282ca3ce0fcf9badc01821cd8a3 Mon Sep 17 00:00:00 2001
+From 34f363f9d1c13abecd06ec37567704d0dfc05e77 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Wed, 30 Nov 2022 19:11:43 +0000
-Subject: [PATCH 24/25] arm/corstone1000: esrt support
+Subject: [PATCH 24/27] arm/corstone1000: esrt support
=20
 The implementation is platform specific and would require
 change in future.
@@ -12,6 +12,7 @@ is to be considered in the future.
=20
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
 Upstream-Status: Inappropriate [Redesign of FMP protocol for ESRT and Ca=
psule update interface is required]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  include/efi_api.h             |   2 +-
  lib/efi_loader/efi_firmware.c | 133 ++++++++++++++++++++++++++++++++++
@@ -19,7 +20,7 @@ Upstream-Status: Inappropriate [Redesign of FMP protoco=
l for ESRT and Capsule up
  3 files changed, 143 insertions(+), 9 deletions(-)
=20
 diff --git a/include/efi_api.h b/include/efi_api.h
-index 9bb0d44ac8..fcf2643e14 100644
+index 9bd70b0f18ce..23e427236a8f 100644
 --- a/include/efi_api.h
 +++ b/include/efi_api.h
 @@ -2030,7 +2030,7 @@ struct efi_firmware_image_descriptor {
@@ -32,10 +33,10 @@ index 9bb0d44ac8..fcf2643e14 100644
  struct efi_firmware_management_protocol {
  	efi_status_t (EFIAPI *get_image_info)(
 diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
-index 28d9a19edb..aa4af8036b 100644
+index c883e2ff0aa9..c6ab6e2182dd 100644
 --- a/lib/efi_loader/efi_firmware.c
 +++ b/lib/efi_loader/efi_firmware.c
-@@ -14,6 +14,7 @@
+@@ -15,6 +15,7 @@
  #include <signatures.h>
 =20
  #include <linux/list.h>
@@ -43,7 +44,7 @@ index 28d9a19edb..aa4af8036b 100644
 =20
  #define FMP_PAYLOAD_HDR_SIGNATURE	SIGNATURE_32('M', 'S', 'S', '1')
 =20
-@@ -416,8 +417,140 @@ efi_status_t EFIAPI efi_firmware_fit_set_image(
+@@ -417,8 +418,140 @@ efi_status_t EFIAPI efi_firmware_fit_set_image(
  	return EFI_EXIT(EFI_SUCCESS);
  }
 =20
@@ -185,7 +186,7 @@ index 28d9a19edb..aa4af8036b 100644
  	.set_image =3D efi_firmware_fit_set_image,
  	.check_image =3D efi_firmware_check_image_unsupported,
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index c154eb0e9d..63329bbff8 100644
+index 89f988b09c44..08c742edbd12 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -167,14 +167,6 @@ static efi_status_t efi_init_capsule(void)
@@ -203,7 +204,7 @@ index c154eb0e9d..63329bbff8 100644
  	ret =3D efi_corstone1000_alloc_capsule_shared_buf();
  	if (ret !=3D EFI_SUCCESS) {
  		printf("EFI: Corstone-1000: cannot allocate caspsule shared buffer\n"=
);
-@@ -308,6 +300,15 @@ efi_status_t efi_init_obj_list(void)
+@@ -288,6 +280,15 @@ efi_status_t efi_init_obj_list(void)
  	if (ret !=3D EFI_SUCCESS)
  		goto out;
 =20
@@ -220,5 +221,5 @@ index c154eb0e9d..63329bbff8 100644
  	ret =3D efi_init_variables();
  	if (ret !=3D EFI_SUCCESS)
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi=
_setup-discover-FF-A-bus-before-raising-EFI-start.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0025-efi_setup-discover-FF-A-bus-bef=
ore-raising-EFI-start.patch
index 6c177864..d903ab4c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_setup-=
discover-FF-A-bus-before-raising-EFI-start.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-efi_setup-=
discover-FF-A-bus-before-raising-EFI-start.patch
@@ -1,19 +1,20 @@
-From de5994cda7a35317f12dc1cedb28cae1b932283a Mon Sep 17 00:00:00 2001
+From 61f17cf403e2c1108b76556c879aa21945b31dcb Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Wed, 30 Nov 2022 19:14:52 +0000
-Subject: [PATCH 25/25] efi_setup: discover FF-A bus before raising EFI s=
tarted
+Subject: [PATCH 25/27] efi_setup: discover FF-A bus before raising EFI s=
tarted
  event
=20
 add FF-A discovery to efi_corstone1000_uboot_efi_started_event()
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  lib/efi_loader/efi_setup.c | 11 +++++++++--
  1 file changed, 9 insertions(+), 2 deletions(-)
=20
 diff --git a/lib/efi_loader/efi_setup.c b/lib/efi_loader/efi_setup.c
-index 63329bbff8..cf8abe3af0 100644
+index 08c742edbd12..65bd626e49b4 100644
 --- a/lib/efi_loader/efi_setup.c
 +++ b/lib/efi_loader/efi_setup.c
 @@ -142,9 +142,16 @@ static efi_status_t efi_init_secure_boot(void)
@@ -33,7 +34,7 @@ index 63329bbff8..cf8abe3af0 100644
  	/*
  	 * setting the kernel started  event arguments:
  	 * setting capsule update interface ID(31:16)
-@@ -304,9 +311,9 @@ efi_status_t efi_init_obj_list(void)
+@@ -284,9 +291,9 @@ efi_status_t efi_init_obj_list(void)
  		int ffa_ret;
  		ffa_ret =3D efi_corstone1000_uboot_efi_started_event();
  		if (ffa_ret)
@@ -46,5 +47,5 @@ index 63329bbff8..cf8abe3af0 100644
 =20
  	/* Initialize variable services */
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-cor=
stone1000-enable-distro-booting-command.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/corstone1000/0026-corstone1000-enable-distro-booting-comman=
d.patch
index a88180da..b3a8d14b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-enable-distro-booting-command.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-enable-distro-booting-command.patch
@@ -1,21 +1,22 @@
-From 15778524604652db60f704a772b6815d0f4305bf Mon Sep 17 00:00:00 2001
+From 646269a92824f3e9b4145848e42ad3ba555e8931 Mon Sep 17 00:00:00 2001
 From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
-Subject: [PATCH] corstone1000: enable distro booting command
+Subject: [PATCH 26/27] corstone1000: enable distro booting command
=20
 enable distro_bootcmd
=20
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  include/configs/corstone1000.h | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
-index 1f28a0f6c0..548856b970 100644
+index a015a1630e2c..c30a7bfa0c0b 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
-@@ -64,5 +64,6 @@
+@@ -65,5 +65,6 @@
 =20
  #include <config_distro_bootcmd.h>
 =20
@@ -23,5 +24,5 @@ index 1f28a0f6c0..548856b970 100644
 =20
  #endif
 --=20
-2.17.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index b89ea872..9cc1bcd9 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -18,32 +18,32 @@ EXTRA_OEMAKE:append:corstone1000 =3D ' DEVICE_TREE=3D=
${CORSTONE1000_DEVICE_TREE}'
 SYSROOT_DIRS:append:corstone1000 =3D " /boot"
=20
 SRC_URI:append:corstone1000 =3D " \
-        file://0001-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe=
.patch          \=20
-        file://0002-lib-uuid-introduce-uuid_str_to_le_bin-function.patch=
		\=20
-        file://0003-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch			=
\=20
-        file://0004-arm_ffa-efi-unmap-RX-TX-buffers.patch				\=20
-        file://0005-arm_ffa-introduce-armffa-command.patch				\=20
-        file://0006-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch			\=20
-        file://0007-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.=
patch		\=20
-        file://0008-arm_ffa-introduce-armffa-command-Sandbox-test.patch	=
		\=20
-        file://0009-arm_ffa-efi-introduce-FF-A-MM-communication.patch			=
\=20
-        file://0010-arm_ffa-efi-corstone1000-enable-MM-communication.pat=
ch		\=20
-        file://0011-efi-corstone1000-introduce-EFI-capsule-update.patch	=
		\=20
-        file://0012-arm-corstone1000-fix-unrecognized-filesystem-type.pa=
tch		\=20
-        file://0013-efi_capsule-corstone1000-pass-interface-id-and-buffe=
.patch		\=20
-        file://0014-efi_boottime-corstone1000-pass-interface-id-and-kern=
.patch		\=20
-        file://0015-efi_loader-corstone1000-remove-guid-check-from-corst=
.patch		\=20
-        file://0016-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op=
.patch		\=20
-        file://0017-efi_firmware-add-get_image_info-for-corstone1000.pat=
ch		\=20
-        file://0018-efi_loader-send-bootcomplete-message-to-secure-encla=
.patch		\=20
-        file://0019-efi_loader-fix-null-pointer-exception-with-get_image=
.patch		\=20
-        file://0020-arm-corstone1000-add-mmc-for-fvp.patch				\=20
-        file://0021-corstone1000-add-compressed-kernel-support.patch			\=
=20
-        file://0022-Introduce-external-sys-driver-to-device-tree.patch		=
	\=20
-        file://0023-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch=
		\=20
-        file://0024-arm-corstone1000-esrt-support.patch					\=20
-        file://0025-efi_setup-discover-FF-A-bus-before-raising-EFI-start=
.patch		\=20
-        file://0026-corstone1000-enable-distro-booting-command.patch    =
                    \
+        file://0001-arm64-smccc-add-support-for-SMCCCv1.2-x0-x17-registe=
.patch		\
+        file://0002-lib-uuid-introduce-uuid_str_to_le_bin-function.patch=
		\
+        file://0003-arm_ffa-introduce-Arm-FF-A-low-level-driver.patch			=
\
+        file://0004-arm_ffa-efi-unmap-RX-TX-buffers.patch				\
+        file://0005-arm_ffa-introduce-armffa-command.patch				\
+        file://0006-arm_ffa-introduce-the-FF-A-Sandbox-driver.patch			\
+        file://0007-arm_ffa-introduce-Sandbox-test-cases-for-UCLASS_FFA.=
patch		\
+        file://0008-arm_ffa-introduce-armffa-command-Sandbox-test.patch	=
		\
+        file://0009-arm_ffa-efi-introduce-FF-A-MM-communication.patch			=
\
+        file://0010-arm_ffa-efi-corstone1000-enable-MM-communication.pat=
ch		\
+        file://0011-efi-corstone1000-introduce-EFI-capsule-update.patch	=
		\
+        file://0012-arm-corstone1000-fix-unrecognized-filesystem-type.pa=
tch		\
+        file://0013-efi_capsule-corstone1000-pass-interface-id-and-buffe=
.patch		\
+        file://0014-efi_boottime-corstone1000-pass-interface-id-and-kern=
.patch		\
+        file://0015-efi_loader-corstone1000-remove-guid-check-from-corst=
.patch		\
+        file://0016-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op=
.patch		\
+        file://0017-efi_firmware-add-get_image_info-for-corstone1000.pat=
ch		\
+        file://0018-efi_loader-send-bootcomplete-message-to-secure-encla=
.patch		\
+        file://0019-efi_loader-fix-null-pointer-exception-with-get_image=
.patch		\
+        file://0020-arm-corstone1000-add-mmc-for-fvp.patch				\
+        file://0021-corstone1000-add-compressed-kernel-support.patch			\
+        file://0022-Introduce-external-sys-driver-to-device-tree.patch		=
	\
+        file://0023-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch=
		\
+        file://0024-arm-corstone1000-esrt-support.patch					\
+        file://0025-efi_setup-discover-FF-A-bus-before-raising-EFI-start=
.patch		\
+        file://0026-corstone1000-enable-distro-booting-command.patch			\
         "
=20
 #
--=20
2.34.1


