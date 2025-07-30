Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA59C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.33479.1753876441797384472
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F00B2681;
	Wed, 30 Jul 2025 04:53:53 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A30353F66E;
	Wed, 30 Jul 2025 04:54:00 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 11/13] arm-bsp/u-boot: corstone1000: Add rebased features patches
Date: Wed, 30 Jul 2025 12:53:25 +0100
Message-Id: <20250730115327.3671160-12-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6648

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Add rebased patches on U-Boot v2025.04

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  21 +++
 ...00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch |  30 ++++
 ...0026-corstone1000-Enable-MMC-for-FVP.patch |  94 ++++++++++++
 ...stone1000-Enable-secure-boot-configs.patch |  38 +++++
 ...stone1000-Enable-EFI-set_time-config.patch |  35 +++++
 ...e1000-Enable-set-print-EFI-variables.patch |  37 +++++
 ...rstone1000-Enable-virtio-net-support.patch | 122 ++++++++++++++++
 ...000-Fix-unrecognized-filesystem-type.patch |  33 +++++
 ...one1000-dts-Add-external-system-node.patch |  34 +++++
 ...ts-Reserve-memory-for-RSS-comm-point.patch |  50 +++++++
 ...-to-remove-non-compliant-nodes-and-p.patch | 137 ++++++++++++++++++
 ...-Call-the-EVT_FT_FIXUP-event-handler.patch |  58 ++++++++
 ...e1000-Purge-U-Boot-specific-DT-nodes.patch |  41 ++++++
 ...rstone1000-purge-remoteproc-DTS-node.patch |  32 ++++
 14 files changed, 762 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
025-corstone1000-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
026-corstone1000-Enable-MMC-for-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
027-corstone1000-Enable-secure-boot-configs.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
028-corstone1000-Enable-EFI-set_time-config.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
029-corstone1000-Enable-set-print-EFI-variables.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
030-corstone1000-Enable-virtio-net-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
031-arm-corstone1000-Fix-unrecognized-filesystem-type.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
032-corstone1000-dts-Add-external-system-node.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
033-arm-bsp-u-boot-dts-Reserve-memory-for-RSS-comm-point.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
034-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
035-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
036-corstone1000-Purge-U-Boot-specific-DT-nodes.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
037-corstone1000-purge-remoteproc-DTS-node.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index e19034f7..fa98dc10 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -42,6 +42,27 @@ SRC_URI:append =3D " \
     file://0023-fwu_arm_psa-corstone1000-Notify-SE-Proxy-SP-on-ExitB.pat=
ch \
     file://0024-fwu_arm_psa-corstone1000-Set-Boot0001-for-on-disk-FW.pat=
ch \
     "
+# Other features
+SRC_URI:append =3D " \
+    file://0025-corstone1000-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch \
+    file://0026-corstone1000-Enable-MMC-for-FVP.patch \
+    file://0027-corstone1000-Enable-secure-boot-configs.patch \
+    file://0028-corstone1000-Enable-EFI-set_time-config.patch \
+    file://0029-corstone1000-Enable-set-print-EFI-variables.patch \
+    file://0030-corstone1000-Enable-virtio-net-support.patch \
+    file://0031-arm-corstone1000-Fix-unrecognized-filesystem-type.patch =
\
+    file://0032-corstone1000-dts-Add-external-system-node.patch \
+    file://0033-arm-bsp-u-boot-dts-Reserve-memory-for-RSS-comm-point.pat=
ch \
+    "
+
+# Purging device tree nodes
+SRC_URI:append =3D " \
+    file://0034-dt-Provide-a-way-to-remove-non-compliant-nodes-and-p.pat=
ch \
+    file://0035-bootefi-Call-the-EVT_FT_FIXUP-event-handler.patch       =
   \
+    file://0036-corstone1000-Purge-U-Boot-specific-DT-nodes.patch       =
   \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'corstone1000-extsys', \
+                         '', 'file://0037-corstone1000-purge-remoteproc-=
DTS-node.patch' , d)} \
+    "
=20
 do_configure:append() {
    openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout $=
{B}/CRT.key -out ${B}/corstone1000_defconfig/CRT.crt -nodes -days 365
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-cor=
stone1000-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0025-corstone1000-set-CONFIG_FFA_SHARED_MM=
_BUF_ADDR.patch
new file mode 100644
index 00000000..09557204
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone10=
00-set-CONFIG_FFA_SHARED_MM_BUF_ADDR.patch
@@ -0,0 +1,30 @@
+From 41b50de6e4727731db95531fcd779a24a16dcccf Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Thu, 20 Mar 2025 15:49:26 +0000
+Subject: [PATCH 25/36] corstone1000: set CONFIG_FFA_SHARED_MM_BUF_ADDR
+
+Set the MM communication buffer to a new address
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ configs/corstone1000_defconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index e02fb7cca67..59962f7145e 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -14,7 +14,7 @@ CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
+ CONFIG_EFI_MM_COMM_TEE=3Dy
+ CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
+ CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
+-CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x02000000
++CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x81FFF000
+ CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
+ CONFIG_EFI_CAPSULE_ON_DISK=3Dy
+ CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-cor=
stone1000-Enable-MMC-for-FVP.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-bo=
ot/corstone1000/0026-corstone1000-Enable-MMC-for-FVP.patch
new file mode 100644
index 00000000..fa169159
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-corstone10=
00-Enable-MMC-for-FVP.patch
@@ -0,0 +1,94 @@
+From 7a2620d318490c96204bbc493b028253dc8e8f8c Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Thu, 20 Mar 2025 15:56:14 +0000
+Subject: [PATCH 26/36] corstone1000: Enable MMC for FVP
+
+Enable support mmc/sdcard for the corstone1000 FVP
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ board/armltd/corstone1000/corstone1000.c | 16 ++++++++++++++++
+ configs/corstone1000_defconfig           |  5 ++++-
+ include/configs/corstone1000.h           |  4 +++-
+ 3 files changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index 2532c5f10fa..9189640ef75 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -208,6 +208,22 @@ static struct mm_region corstone1000_mem_map[] =3D =
{
+ 		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+ 			PTE_BLOCK_NON_SHARE |
+ 			PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	}, {
++		/* MMC0 */
++		.virt =3D 0x40300000UL,
++		.phys =3D 0x40300000UL,
++		.size =3D 0x00100000UL,
++		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++			PTE_BLOCK_NON_SHARE |
++			PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	}, {
++		/* MMC1 */
++		.virt =3D 0x50000000UL,
++		.phys =3D 0x50000000UL,
++		.size =3D 0x00100000UL,
++		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++			PTE_BLOCK_NON_SHARE |
++			PTE_BLOCK_PXN | PTE_BLOCK_UXN
+ 	}, {
+ 		/* OCVM */
+ 		.virt =3D 0x80000000UL,
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 59962f7145e..4c562536a89 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -6,6 +6,7 @@ CONFIG_SYS_MALLOC_LEN=3D0x2000000
+ CONFIG_NR_DRAM_BANKS=3D1
+ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=3Dy
+ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=3D0x83f00000
++CONFIG_DM_GPIO=3Dy
+ CONFIG_DEFAULT_DEVICE_TREE=3D"corstone1000-mps3"
+ CONFIG_SYS_BOOTM_LEN=3D0x800000
+ CONFIG_SYS_LOAD_ADDR=3D0x82100000
+@@ -39,6 +40,7 @@ CONFIG_CMD_BOOTZ=3Dy
+ CONFIG_CMD_GPT=3Dy
+ CONFIG_CMD_LOADM=3Dy
+ # CONFIG_CMD_LOADS is not set
++CONFIG_CMD_MMC=3Dy
+ CONFIG_CMD_USB=3Dy
+ # CONFIG_CMD_SETEXPR is not set
+ CONFIG_CMD_CACHE=3Dy
+@@ -50,9 +52,10 @@ CONFIG_OF_CONTROL=3Dy
+ CONFIG_VERSION_VARIABLE=3Dy
+ CONFIG_NET_RANDOM_ETHADDR=3Dy
+ CONFIG_REGMAP=3Dy
++CONFIG_CLK=3Dy
+ CONFIG_ARM_FFA_TRANSPORT=3Dy
+ CONFIG_MISC=3Dy
+-# CONFIG_MMC is not set
++CONFIG_ARM_PL180_MMCI=3Dy
+ CONFIG_MTD=3Dy
+ CONFIG_NVMXIP_QSPI=3Dy
+ CONFIG_PHYLIB=3Dy
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone10=
00.h
+index 3ada21cbba1..737b7c277fb 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -25,7 +25,9 @@
+ #define CFG_SYS_SDRAM_BASE	PHYS_SDRAM_1
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
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-cor=
stone1000-Enable-secure-boot-configs.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0027-corstone1000-Enable-secure-boot-configs.patc=
h
new file mode 100644
index 00000000..fa361cfb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-corstone10=
00-Enable-secure-boot-configs.patch
@@ -0,0 +1,38 @@
+From 3104b2d8128efd9cf2e311d3e1eed7626f76039c Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 20 Mar 2025 16:01:56 +0000
+Subject: [PATCH 27/36] corstone1000: Enable secure boot configs
+
+Enable secure boot and related configurations
+
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ configs/corstone1000_defconfig | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 4c562536a89..5297e2fa455 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -12,6 +12,7 @@ CONFIG_SYS_BOOTM_LEN=3D0x800000
+ CONFIG_SYS_LOAD_ADDR=3D0x82100000
+ CONFIG_IDENT_STRING=3D" corstone1000 aarch64 "
+ CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
++CONFIG_EFI_SECURE_BOOT=3Dy
+ CONFIG_EFI_MM_COMM_TEE=3Dy
+ CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
+ CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
+@@ -22,6 +23,8 @@ CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
+ CONFIG_EFI_CAPSULE_AUTHENTICATE=3Dy
+ CONFIG_EFI_CAPSULE_CRT_FILE=3D"CRT.crt"
+ CONFIG_FIT=3Dy
++CONFIG_FIT_SIGNATURE=3Dy
++CONFIG_LEGACY_IMAGE_FORMAT=3Dy
+ CONFIG_DISTRO_DEFAULTS=3Dy
+ CONFIG_BOOTDELAY=3D3
+ CONFIG_USE_BOOTARGS=3Dy
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-cor=
stone1000-Enable-EFI-set_time-config.patch b/meta-arm-bsp/recipes-bsp/u-b=
oot/u-boot/corstone1000/0028-corstone1000-Enable-EFI-set_time-config.patc=
h
new file mode 100644
index 00000000..73af703c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone10=
00-Enable-EFI-set_time-config.patch
@@ -0,0 +1,35 @@
+From 634ea749a2c590199ab1f284bed9843496ee2cde Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Thu, 20 Mar 2025 16:06:18 +0000
+Subject: [PATCH 28/36] corstone1000: Enable EFI set_time() config
+
+Enable EFI set_time() config
+
+SetTime_Conf and SetTime_Func tests in UEFI SCT test suite of ACS
+fail with unsupported return value. CONFIG_EFI_SET_TIME and
+CONFIG_EFI_GET_TIME config values are needed.
+This commit enables the set_time() config.
+get_time() config is enabled automatically.
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ configs/corstone1000_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 5297e2fa455..a0a631f3f40 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -13,6 +13,7 @@ CONFIG_SYS_LOAD_ADDR=3D0x82100000
+ CONFIG_IDENT_STRING=3D" corstone1000 aarch64 "
+ CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
+ CONFIG_EFI_SECURE_BOOT=3Dy
++CONFIG_EFI_SET_TIME=3Dy
+ CONFIG_EFI_MM_COMM_TEE=3Dy
+ CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
+ CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-cor=
stone1000-Enable-set-print-EFI-variables.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0029-corstone1000-Enable-set-print-EFI-variab=
les.patch
new file mode 100644
index 00000000..cfc58ded
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0029-corstone10=
00-Enable-set-print-EFI-variables.patch
@@ -0,0 +1,37 @@
+From d63525b685e24efaa9553f3be1ce80a33602f66e Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 20 Mar 2025 16:08:16 +0000
+Subject: [PATCH 29/36] corstone1000: Enable set/print EFI variables
+
+Enable set/print UEFI variables using "env" command
+
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ configs/corstone1000_defconfig | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index a0a631f3f40..190f48974df 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -41,6 +41,7 @@ CONFIG_SYS_PROMPT=3D"corstone1000# "
+ CONFIG_CMD_FWU_METADATA=3Dy
+ CONFIG_CMD_BOOTZ=3Dy
+ # CONFIG_CMD_XIMG is not set
++CONFIG_CMD_NVEDIT_EFI=3Dy
+ CONFIG_CMD_GPT=3Dy
+ CONFIG_CMD_LOADM=3Dy
+ # CONFIG_CMD_LOADS is not set
+@@ -78,6 +79,7 @@ CONFIG_USB=3Dy
+ CONFIG_USB_ISP1760=3Dy
+ # CONFIG_RANDOM_UUID is not set
+ CONFIG_ERRNO_STR=3Dy
++# CONFIG_HEXDUMP is not set
+ CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
+ CONFIG_FWU_MDATA_V2=3Dy
+ CONFIG_FWU_ARM_PSA=3Dy
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-cor=
stone1000-Enable-virtio-net-support.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0030-corstone1000-Enable-virtio-net-support.patch
new file mode 100644
index 00000000..f4d8341b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone10=
00-Enable-virtio-net-support.patch
@@ -0,0 +1,122 @@
+From 631ca237b413178c6149e8da33f4aa5bc0fff7ed Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Thu, 20 Mar 2025 16:22:44 +0000
+Subject: [PATCH 30/36] corstone1000: Enable virtio-net support
+
+Add virtio-net support in Corstone1000 FVP
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ arch/arm/dts/corstone1000-fvp.dts        |  6 ++++
+ board/armltd/corstone1000/corstone1000.c | 42 ++++++++++++++++++++----
+ configs/corstone1000_defconfig           |  3 ++
+ 3 files changed, 45 insertions(+), 6 deletions(-)
+
+diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
+index 3076fb9f344..cd8a132271e 100644
+--- a/arch/arm/dts/corstone1000-fvp.dts
++++ b/arch/arm/dts/corstone1000-fvp.dts
+@@ -21,6 +21,12 @@
+ 		reg-io-width =3D <2>;
+ 	};
+=20
++	virtio: virtio-net@40400000 {
++		compatible =3D "virtio,mmio";
++		reg =3D <0x40400000 0x10000>;
++		interrupts =3D <145>;
++	};
++
+ 	vmmc_v3_3d: fixed_v3_3d {
+ 		compatible =3D "regulator-fixed";
+ 		regulator-name =3D "vmmc_supply";
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index 9189640ef75..39fd10ed653 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -20,6 +20,7 @@
+ #include <dm/platform_data/serial_pl01x.h>
+ #include <asm/armv8/mmu.h>
+ #include <asm/global_data.h>
++#include <generated/dt.h>
+ #include <linux/bitfield.h>
+=20
+ #define CORSTONE1000_KERNEL_PARTS 2
+@@ -201,13 +202,21 @@ static struct mm_region corstone1000_mem_map[] =3D=
 {
+ 			PTE_BLOCK_NON_SHARE |
+ 			PTE_BLOCK_PXN | PTE_BLOCK_UXN
+ 	}, {
+-		/* ethernet */
++		/* virtio-net */
++		.virt =3D 0x40400000UL,
++			.phys =3D 0x40400000UL,
++			.size =3D 0x00100000UL,
++			.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++				PTE_BLOCK_NON_SHARE |
++				PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	}, {
++		/* Ethernet */
+ 		.virt =3D 0x40100000UL,
+-		.phys =3D 0x40100000UL,
+-		.size =3D 0x00100000UL,
+-		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+-			PTE_BLOCK_NON_SHARE |
+-			PTE_BLOCK_PXN | PTE_BLOCK_UXN
++			.phys =3D 0x40100000UL,
++			.size =3D 0x00100000UL,
++			.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++				PTE_BLOCK_NON_SHARE |
++				PTE_BLOCK_PXN | PTE_BLOCK_UXN
+ 	}, {
+ 		/* MMC0 */
+ 		.virt =3D 0x40300000UL,
+@@ -367,3 +376,24 @@ efi_status_t fwu_notify_exit_boot_services(void)
+ out:
+ 	return efi_ret;
+ }
++
++int board_late_init(void)
++{
++	struct udevice *virtio_bus =3D NULL, *virtio_child =3D NULL;
++	const char *cmp_dtb =3D DEVICE_TREE;
++	int ret;
++
++	if (!strcmp(cmp_dtb, "corstone1000-fvp")) {
++		ret =3D uclass_first_device_err(UCLASS_VIRTIO, &virtio_bus);
++		if (!virtio_bus) {
++			log_err("Cannot find virtio device, err (%d)\n", ret);
++			return ret;
++		}
++		while (virtio_bus) {
++			device_foreach_child_probe(virtio_child, virtio_bus);
++			uclass_next_device(&virtio_bus);
++		}
++	}
++
++	return 0;
++}
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 190f48974df..d1401550660 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -36,6 +36,7 @@ CONFIG_SYS_CBSIZE=3D512
+ CONFIG_LOGLEVEL=3D7
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_BOARD_LATE_INIT=3Dy
+ CONFIG_SYS_PROMPT=3D"corstone1000# "
+ # CONFIG_CMD_CONSOLE is not set
+ CONFIG_CMD_FWU_METADATA=3Dy
+@@ -77,6 +78,8 @@ CONFIG_TEE=3Dy
+ CONFIG_OPTEE=3Dy
+ CONFIG_USB=3Dy
+ CONFIG_USB_ISP1760=3Dy
++CONFIG_VIRTIO_MMIO=3Dy
++CONFIG_VIRTIO_NET=3Dy
+ # CONFIG_RANDOM_UUID is not set
+ CONFIG_ERRNO_STR=3Dy
+ # CONFIG_HEXDUMP is not set
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-arm=
-corstone1000-Fix-unrecognized-filesystem-type.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/corstone1000/0031-arm-corstone1000-Fix-unrecognized-=
filesystem-type.patch
new file mode 100644
index 00000000..9cb30a51
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-arm-corsto=
ne1000-Fix-unrecognized-filesystem-type.patch
@@ -0,0 +1,33 @@
+From face25548766183af2a80ec7c60ba9f8f90ee387 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Fri, 4 Mar 2022 15:56:09 +0000
+Subject: [PATCH 31/36] arm: corstone1000: Fix unrecognized filesystem ty=
pe
+
+Add a delay before checking USB sticks status
+
+Some USB sticks are not recognized by the USB bus, just add a
+delay before checking status.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ common/usb_storage.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/common/usb_storage.c b/common/usb_storage.c
+index ac331f1c1b0..17f8a56e971 100644
+--- a/common/usb_storage.c
++++ b/common/usb_storage.c
+@@ -782,6 +782,9 @@ static int usb_stor_BBB_transport(struct scsi_cmd *s=
rb, struct us_data *us)
+ st:
+ 	retry =3D 0;
+ again:
++	if (srb->cmd[0] =3D=3D SCSI_TST_U_RDY)
++		mdelay(100);
++
+ 	debug("STATUS phase\n");
+ 	result =3D usb_bulk_msg(us->pusb_dev, pipein, csw, UMASS_BBB_CSW_SIZE,
+ 				&actlen, USB_CNTL_TIMEOUT*5);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-cor=
stone1000-dts-Add-external-system-node.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot/corstone1000/0032-corstone1000-dts-Add-external-system-node.=
patch
new file mode 100644
index 00000000..b145cede
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-corstone10=
00-dts-Add-external-system-node.patch
@@ -0,0 +1,34 @@
+From fa900c31f2fc1cf9c3333cd565d779bb06d59bec Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 18 Mar 2024 17:00:56 +0000
+Subject: [PATCH 32/36] corstone1000: dts: Add external system node
+
+Add the external system node
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ arch/arm/dts/corstone1000.dtsi | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
+index 5d9d95b21cb..76bfc561df7 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -118,6 +118,13 @@
+ 		interrupt-parent =3D <&gic>;
+ 		ranges;
+=20
++		extsys0: remoteproc@1a010310 {
++			compatible =3D "arm,corstone1000-extsys";
++			reg =3D <0x1a010310 0x4>, <0x1a010314 0x4>;
++			reg-names =3D "reset-control", "reset-status";
++			firmware-name =3D "es_flashfw.elf";
++		};
++
+ 		timer@1a220000 {
+ 			compatible =3D "arm,armv7-timer-mem";
+ 			reg =3D <0x1a220000 0x1000>;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-arm=
-bsp-u-boot-dts-Reserve-memory-for-RSS-comm-point.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0033-arm-bsp-u-boot-dts-Reserve-memo=
ry-for-RSS-comm-point.patch
new file mode 100644
index 00000000..54ddd047
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-arm-bsp-u-=
boot-dts-Reserve-memory-for-RSS-comm-point.patch
@@ -0,0 +1,50 @@
+From 548b7cc0126621af41eff92d504d79d67f85c648 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Mon, 10 Jul 2023 19:00:43 +0100
+Subject: [PATCH 33/36] arm-bsp/u-boot: dts: Reserve memory for RSS comm
+ pointer access protocol
+
+Add reserved-memory node for RSS comm pointer access protocol
+
+This memory was used by OpenAMP to establish communication between
+the Secure Enclave and Trusted Services. After transitioning from
+OpenAMP to RSE_COMMS, this shared memory is now configured for the
+pointer access protocol in RSE_COMMS.
+
+Since this memory may be still used by a user-space application
+in Linux as U-Boot is passing an EFI memory map starting from
+0x80000000, this memory range should be reserved as the
+pointer access protocol may be enabled on corstone1000 in the future.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ arch/arm/dts/corstone1000.dtsi | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
+index 76bfc561df7..74e95dcbc6b 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -45,6 +45,17 @@
+ 		lba =3D <65536>;
+ 	};
+=20
++	reserved-memory {
++		#address-cells =3D <2>;
++		#size-cells =3D <2>;
++		ranges;
++
++		smem_mem: smem_region@88000000 {
++			reg =3D <0x0 0x88000000 0x0 0x100000>;
++			no-map;
++		};
++	};
++
+ 	gic: interrupt-controller@1c000000 {
+ 		compatible =3D "arm,gic-400";
+ 		#interrupt-cells =3D <3>;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-dt-=
Provide-a-way-to-remove-non-compliant-nodes-and-p.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0034-dt-Provide-a-way-to-remove-non-=
compliant-nodes-and-p.patch
new file mode 100644
index 00000000..17d3f23a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-dt-Provide=
-a-way-to-remove-non-compliant-nodes-and-p.patch
@@ -0,0 +1,137 @@
+From 9965fa5c45f6babb3182886623f660cc725c5a62 Mon Sep 17 00:00:00 2001
+From: Sughosh Ganu <sughosh.ganu@linaro.org>
+Date: Thu, 22 May 2025 17:57:14 +0100
+Subject: [PATCH 34/36] dt: Provide a way to remove non-compliant nodes a=
nd
+ properties
+
+Add a function which is registered to spy for a EVT_FT_FIXUP event,
+and removes the non upstreamed nodes and properties from the
+devicetree before it gets passed to the OS.
+
+This allows removing entire nodes, or specific properties under nodes
+from the devicetree. The required nodes and properties can be
+registered for removal through the DT_NON_COMPLIANT_PURGE and
+DT_NON_COMPLIANT_PURGE_LIST macros.
+
+Signed-off-by: Sughosh Ganu <sughosh.ganu@linaro.org>
+Upstream-Status: Denied [RFC: https://lore.kernel.org/u-boot/aca7e6fa-2d=
ec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a26738b=
b66d]
+---
+ include/dt-structs.h | 11 +++++++
+ lib/Makefile         |  1 +
+ lib/dt_purge.c       | 73 ++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 85 insertions(+)
+ create mode 100644 lib/dt_purge.c
+
+diff --git a/include/dt-structs.h b/include/dt-structs.h
+index fa1622cb1dc..f535c60471b 100644
+--- a/include/dt-structs.h
++++ b/include/dt-structs.h
+@@ -57,3 +57,14 @@ struct phandle_2_arg {
+ #endif
+=20
+ #endif
++
++struct dt_non_compliant_purge {
++	const char *node_path;
++	const char *prop;
++};
++
++#define DT_NON_COMPLIANT_PURGE(__name)	\
++	ll_entry_declare(struct dt_non_compliant_purge, __name, dt_purge)
++
++#define DT_NON_COMPLIANT_PURGE_LIST(__name)	\
++	ll_entry_declare_list(struct dt_non_compliant_purge, __name, dt_purge)
+diff --git a/lib/Makefile b/lib/Makefile
+index a7bc2f3134a..82b021562f1 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -70,6 +70,7 @@ endif
+ obj-$(CONFIG_$(PHASE_)CRC8) +=3D crc8.o
+ obj-$(CONFIG_$(PHASE_)CRC16) +=3D crc16.o
+ obj-$(CONFIG_$(PHASE_)CRC16) +=3D crc16-ccitt.o
++obj-y +=3D dt_purge.o
+=20
+ obj-y +=3D crypto/
+=20
+diff --git a/lib/dt_purge.c b/lib/dt_purge.c
+new file mode 100644
+index 00000000000..abae7c04fc7
+--- /dev/null
++++ b/lib/dt_purge.c
+@@ -0,0 +1,73 @@
++// SPDX-License-Identifier: GPL-2.0-or-later
++/*
++ * Copyright (c) 2023, Linaro Limited
++ */
++
++#include <dt-structs.h>
++#include <event.h>
++#include <linker_lists.h>
++
++#include <linux/libfdt.h>
++
++/**
++ * dt_non_compliant_purge() -	Remove non-upstreamed nodes and propertie=
s
++ *				from the DT
++ * @ctx: Context for event
++ * @event: Event to process
++ *
++ * Iterate through an array of DT nodes and properties, and remove them
++ * from the device-tree before the DT gets handed over to the kernel.
++ * These are nodes and properties which do not have upstream bindings
++ * and need to be purged before being handed over to the kernel.
++ *
++ * If both the node and property are specified, delete the property. If
++ * only the node is specified, delete the entire node, including it's
++ * subnodes, if any.
++ *
++ * Return: 0 if OK, -ve on error
++ */
++static int dt_non_compliant_purge(void *ctx, struct event *event)
++{
++	int nodeoff =3D 0;
++	int err =3D 0;
++	void *fdt;
++	const struct event_ft_fixup *fixup =3D &event->data.ft_fixup;
++	struct dt_non_compliant_purge *purge_entry;
++	struct dt_non_compliant_purge *purge_start =3D
++		ll_entry_start(struct dt_non_compliant_purge, dt_purge);
++	int nentries =3D ll_entry_count(struct dt_non_compliant_purge, dt_purg=
e);
++
++	if (fixup->images)
++		return 0;
++
++	fdt =3D fixup->tree.fdt;
++	for (purge_entry =3D purge_start; purge_entry !=3D purge_start + nentr=
ies;
++	     purge_entry++) {
++		nodeoff =3D fdt_path_offset(fdt, purge_entry->node_path);
++		if (nodeoff < 0) {
++			log_debug("Error (%d) getting node offset for %s\n",
++				  nodeoff, purge_entry->node_path);
++			continue;
++		}
++
++		if (purge_entry->prop) {
++			err =3D fdt_delprop(fdt, nodeoff, purge_entry->prop);
++			if (err < 0 && err !=3D -FDT_ERR_NOTFOUND) {
++				log_debug("Error (%d) deleting %s\n",
++					  err, purge_entry->prop);
++				goto out;
++			}
++		} else {
++			err =3D fdt_del_node(fdt, nodeoff);
++			if (err) {
++				log_debug("Error (%d) trying to delete node %s\n",
++					  err, purge_entry->node_path);
++				goto out;
++			}
++		}
++	}
++
++out:
++	return err;
++}
++EVENT_SPY_FULL(EVT_FT_FIXUP, dt_non_compliant_purge);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-boo=
tefi-Call-the-EVT_FT_FIXUP-event-handler.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0035-bootefi-Call-the-EVT_FT_FIXUP-event-hand=
ler.patch
new file mode 100644
index 00000000..d1a9b817
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-bootefi-Ca=
ll-the-EVT_FT_FIXUP-event-handler.patch
@@ -0,0 +1,58 @@
+From 24cdb09130c32209485648e106da40f5c2732271 Mon Sep 17 00:00:00 2001
+From: Sughosh Ganu <sughosh.ganu@linaro.org>
+Date: Thu, 22 May 2025 18:08:38 +0100
+Subject: [PATCH 35/36] bootefi: Call the EVT_FT_FIXUP event handler
+
+The bootefi command passes the devicetree to the kernel through the
+EFI config table. Call the event handlers for fixing the devicetree
+before jumping into the kernel. This removes any devicetree nodes
+and/or properties that are specific only to U-Boot, and are not to be
+passed to the OS.
+
+Signed-off-by: Sughosh Ganu <sughosh.ganu@linaro.org>
+Upstream-Status: Denied [RFC: https://lore.kernel.org/u-boot/aca7e6fa-2d=
ec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a26738b=
b66d]
+---
+ cmd/bootefi.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/cmd/bootefi.c b/cmd/bootefi.c
+index c1454ffb948..2599afadf9a 100644
+--- a/cmd/bootefi.c
++++ b/cmd/bootefi.c
+@@ -118,6 +118,24 @@ static int do_efi_selftest(void)
+ 	return ret !=3D EFI_SUCCESS;
+ }
+=20
++/**
++ * event_notify_dt_fixup() - call ft_fixup event
++ *
++ * @fdt:	address of the device tree to be passed to the kernel
++ *		through the configuration table
++ * Return:	None
++ */
++static void event_notify_dt_fixup(void *fdt)
++{
++	int ret;
++	struct event_ft_fixup fixup =3D {0};
++
++	fixup.tree.fdt =3D fdt;
++	ret =3D event_notify(EVT_FT_FIXUP, &fixup, sizeof(fixup));
++	if (ret)
++		printf("Error: %d: FDT Fixup event failed\n", ret);
++}
++
+ /**
+  * do_bootefi() - execute `bootefi` command
+  *
+@@ -173,6 +191,8 @@ static int do_bootefi(struct cmd_tbl *cmdtp, int fla=
g, int argc,
+ 		if (ret !=3D EFI_SUCCESS)
+ 			return CMD_RET_FAILURE;
+=20
++		event_notify_dt_fixup(fdt);
++
+ 		return do_efi_selftest();
+ 	}
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-cor=
stone1000-Purge-U-Boot-specific-DT-nodes.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0036-corstone1000-Purge-U-Boot-specific-DT-no=
des.patch
new file mode 100644
index 00000000..c52e1a97
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-corstone10=
00-Purge-U-Boot-specific-DT-nodes.patch
@@ -0,0 +1,41 @@
+From 6466a6cf1ea529180d41ef4e75b16f33a050673a Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 29 May 2025 14:42:42 +0100
+Subject: [PATCH 36/37] corstone1000: Purge U-Boot specific DT nodes
+
+Remove U-Boot specific DT nodes before passing the DT to Linux
+
+This is needed to pass SystemReady IR 2.0 dt-schema tests
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Denied [RFC: https://lore.kernel.org/u-boot/aca7e6fa-2d=
ec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a26738b=
b66d]
+---
+ board/armltd/corstone1000/corstone1000.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index 39fd10ed653..c8fcbf976e0 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -23,6 +23,18 @@
+ #include <generated/dt.h>
+ #include <linux/bitfield.h>
+=20
++/* remove the DT nodes not needed in Linux */
++DT_NON_COMPLIANT_PURGE_LIST(foo) =3D {
++	{ .node_path =3D "/fwu-mdata" },
++	{ .node_path =3D "/nvmxip-qspi@08000000" },
++	{ .node_path =3D "/soc/mailbox@1b820000" },
++	{ .node_path =3D "/soc/mailbox@1b830000" },
++	{ .node_path =3D "/soc/mhu@1b000000" },
++	{ .node_path =3D "/soc/mhu@1b010000" },
++	{ .node_path =3D "/soc/mhu@1b020000" },
++	{ .node_path =3D "/soc/mhu@1b030000" },
++};
++
+ #define CORSTONE1000_KERNEL_PARTS 2
+ #define CORSTONE1000_KERNEL_PRIMARY "kernel_primary"
+ #define CORSTONE1000_KERNEL_SECONDARY "kernel_secondary"
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-purge-remoteproc-DTS-node.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0037-corstone1000-purge-remoteproc-DTS-node.patch
new file mode 100644
index 00000000..214a307e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-purge-remoteproc-DTS-node.patch
@@ -0,0 +1,32 @@
+From 7a32af1d8f904990d016d96d50894c49686db14c Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 29 May 2025 14:44:17 +0100
+Subject: [PATCH 37/37] corstone1000: purge remoteproc DTS node
+
+Purge remoteproc DTS node
+This is done to remove the remote proc node from the DTS passed
+to Linux from U-Boot because the device tree binding for remoteproc
+has not been upstreamed yet. Existence of remoteproc DTS node in Linux
+is causing dt-schema test for SystemReady-IR v2.0 certification to fail.
+
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Upstream-Status: Denied [RFC: https://lore.kernel.org/u-boot/aca7e6fa-2d=
ec-a7c5-e47e-84c5ffa6f9b7@gmx.de/T/#m16d14ee960427cc88066bdcdd76f0a26738b=
b66d]
+---
+ board/armltd/corstone1000/corstone1000.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index c8fcbf976e0..1b9c3a9ed16 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -33,6 +33,7 @@ DT_NON_COMPLIANT_PURGE_LIST(foo) =3D {
+ 	{ .node_path =3D "/soc/mhu@1b010000" },
+ 	{ .node_path =3D "/soc/mhu@1b020000" },
+ 	{ .node_path =3D "/soc/mhu@1b030000" },
++	{ .node_path =3D "/soc/remoteproc@1a010310" },
+ };
+=20
+ #define CORSTONE1000_KERNEL_PARTS 2
+--=20
+2.25.1
+

