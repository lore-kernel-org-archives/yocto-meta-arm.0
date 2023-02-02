Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293F3C64EC3
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 09:55:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11192.1675331703542184794
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 01:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BAFAC14;
	Thu,  2 Feb 2023 01:55:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE3BB3F64C;
	Thu,  2 Feb 2023 01:55:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 6/6] arm-bsp/corstone1000: bump kernel version to v6.1
Date: Thu,  2 Feb 2023 09:54:56 +0000
Message-Id: <20230202095456.3113221-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202095456.3113221-1-ross.burton@arm.com>
References: <20230202095456.3113221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 09:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4353

From: Rui Miguel Silva <rui.silva@linaro.org>

Bump kernel version to v6.1 and rebase the patches on
top of this new version.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../0002-Add-external-system-driver.patch     | 36 +++++++++----------
 ...03-Add-rpmsg-driver-for-corstone1000.patch | 21 ++++++-----
 .../0004-rpmsg-arm-fix-return-value.patch     | 10 +++---
 ...pdate-chrdev-to-ctrldev-registration.patch | 10 +++---
 ...dds-workaround-for-cs1k-specific-bug.patch | 15 ++++----
 ...op-CONFIG_SND_SOC_AC97-from-multi_v7.patch | 30 ----------------
 7 files changed, 43 insertions(+), 81 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone500/0=
001-arm-defconfig-drop-CONFIG_SND_SOC_AC97-from-multi_v7.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index f541e6b6..7f25cd54 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -49,7 +49,7 @@ EXTRA_IMAGEDEPENDS +=3D "external-system"
=20
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto =3D "5.19%"
+PREFERRED_VERSION_linux-yocto =3D "6.1%"
 KERNEL_IMAGETYPE =3D "Image.gz"
=20
 INITRAMFS_IMAGE_BUNDLE ?=3D "1"
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Ad=
d-external-system-driver.patch b/meta-arm-bsp/recipes-kernel/linux/files/=
corstone1000/0002-Add-external-system-driver.patch
index ae69090a..b68edbc1 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-exter=
nal-system-driver.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-exter=
nal-system-driver.patch
@@ -1,50 +1,48 @@
-Upstream-Status: Pending[Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-
-From 97509e82b51c57935fc8e918b33c09c4f6648ed7 Mon Sep 17 00:00:00 2001
+From 19eabe2a5fb97530820dd2a22fe6bc143a8d693f Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Fri, 19 Aug 2022 14:51:08 +0100
-Subject: [PATCH] Add external system driver
+Subject: [PATCH 2/6] Add external system driver
=20
 Adds external system driver to control it
 from user-space. It provides run and reset
 functionality at the moment.
=20
+Upstream-Status: Pending[Not submitted to upstream yet]
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
- drivers/misc/Kconfig           |   2 +
+ drivers/misc/Kconfig           |   1 +
  drivers/misc/Makefile          |   1 +
  drivers/misc/arm/Kconfig       |   5 ++
  drivers/misc/arm/Makefile      |   1 +
  drivers/misc/arm/extsys_ctrl.c | 151 +++++++++++++++++++++++++++++++++
- 5 files changed, 160 insertions(+)
+ 5 files changed, 159 insertions(+)
  create mode 100644 drivers/misc/arm/Kconfig
  create mode 100644 drivers/misc/arm/Makefile
  create mode 100644 drivers/misc/arm/extsys_ctrl.c
=20
 diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
-index 0f5a49fc7c9e..5ca195110b3f 100644
+index 358ad56f6524..fd8654ffdab0 100644
 --- a/drivers/misc/Kconfig
 +++ b/drivers/misc/Kconfig
-@@ -487,4 +487,6 @@ source "drivers/misc/cardreader/Kconfig"
- source "drivers/misc/habanalabs/Kconfig"
+@@ -514,4 +514,5 @@ source "drivers/misc/habanalabs/Kconfig"
  source "drivers/misc/uacce/Kconfig"
  source "drivers/misc/pvpanic/Kconfig"
+ source "drivers/misc/mchp_pci1xxxx/Kconfig"
 +source "drivers/misc/arm/Kconfig"
-+
  endmenu
 diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
-index a086197af544..f5c1bd5747f7 100644
+index ac9b3e757ba1..f7852e4fd63d 100644
 --- a/drivers/misc/Makefile
 +++ b/drivers/misc/Makefile
-@@ -59,3 +59,4 @@ obj-$(CONFIG_UACCE)		+=3D uacce/
- obj-$(CONFIG_XILINX_SDFEC)	+=3D xilinx_sdfec.o
- obj-$(CONFIG_HISI_HIKEY_USB)	+=3D hisi_hikey_usb.o
- obj-$(CONFIG_HI6421V600_IRQ)	+=3D hi6421v600-irq.o
+@@ -62,3 +62,4 @@ obj-$(CONFIG_HI6421V600_IRQ)	+=3D hi6421v600-irq.o
+ obj-$(CONFIG_OPEN_DICE)		+=3D open-dice.o
+ obj-$(CONFIG_GP_PCI1XXXX)	+=3D mchp_pci1xxxx/
+ obj-$(CONFIG_VCPU_STALL_DETECTOR)	+=3D vcpu_stall_detector.o
 +obj-y				+=3D arm/
 diff --git a/drivers/misc/arm/Kconfig b/drivers/misc/arm/Kconfig
 new file mode 100644
-index 000000000000..3c4b3f08e6b4
+index 000000000000..9f1eb284e530
 --- /dev/null
 +++ b/drivers/misc/arm/Kconfig
 @@ -0,0 +1,5 @@
@@ -63,7 +61,7 @@ index 000000000000..1ca3084cf8a0
 +obj-$(CONFIG_EXTSYS_CTRL)	+=3D extsys_ctrl.o
 diff --git a/drivers/misc/arm/extsys_ctrl.c b/drivers/misc/arm/extsys_ct=
rl.c
 new file mode 100644
-index 000000000000..1c6ef14a32ae
+index 000000000000..7929070ff43d
 --- /dev/null
 +++ b/drivers/misc/arm/extsys_ctrl.c
 @@ -0,0 +1,151 @@
@@ -219,5 +217,5 @@ index 000000000000..1c6ef14a32ae
 +MODULE_AUTHOR("Morten Borup Petersen");
 +MODULE_AUTHOR("Rui Miguel Silva <rui.silva@arm.com>");
 --=20
-2.17.1
+2.39.0
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Ad=
d-rpmsg-driver-for-corstone1000.patch b/meta-arm-bsp/recipes-kernel/linux=
/files/corstone1000/0003-Add-rpmsg-driver-for-corstone1000.patch
index 80966148..34904294 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpmsg=
-driver-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpmsg=
-driver-for-corstone1000.patch
@@ -1,27 +1,26 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-
-From e683c37ee51717e625c8a598056cf4bb1bdadcbc Mon Sep 17 00:00:00 2001
+From 9fb971c23d423f593620ed82fb69a7e2cd35986a Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Wed, 17 Aug 2022 14:21:42 +0100
-Subject: [PATCH] Add rpmsg driver for corstone1000
+Subject: [PATCH 3/6] Add rpmsg driver for corstone1000
=20
 Adds rpmsg driver to communicate with external
 system in corstone1000 platform.
=20
+Upstream-Status: Pending
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  drivers/rpmsg/Kconfig             |  10 ++
  drivers/rpmsg/Makefile            |   1 +
- drivers/rpmsg/rpmsg_arm_mailbox.c | 164 ++++++++++++++++++++++
+ drivers/rpmsg/rpmsg_arm_mailbox.c | 164 ++++++++++++++++++++++++++++++
  3 files changed, 175 insertions(+)
  create mode 100644 drivers/rpmsg/rpmsg_arm_mailbox.c
=20
 diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
-index 0b4407abdf13..c276bd17bffe 100644
+index d3795860f5c0..fc6916d7b523 100644
 --- a/drivers/rpmsg/Kconfig
 +++ b/drivers/rpmsg/Kconfig
-@@ -73,4 +73,14 @@ config RPMSG_VIRTIO
+@@ -81,4 +81,14 @@ config RPMSG_VIRTIO
  	select RPMSG_NS
  	select VIRTIO
 =20
@@ -37,7 +36,7 @@ index 0b4407abdf13..c276bd17bffe 100644
 +
  endmenu
 diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
-index 8d452656f0ee..34e9c146cd64 100644
+index 58e3b382e316..6bdcc69688b2 100644
 --- a/drivers/rpmsg/Makefile
 +++ b/drivers/rpmsg/Makefile
 @@ -1,5 +1,6 @@
@@ -45,8 +44,8 @@ index 8d452656f0ee..34e9c146cd64 100644
  obj-$(CONFIG_RPMSG)		+=3D rpmsg_core.o
 +obj-$(CONFIG_RPMSG_ARM)		+=3D rpmsg_arm_mailbox.o
  obj-$(CONFIG_RPMSG_CHAR)	+=3D rpmsg_char.o
+ obj-$(CONFIG_RPMSG_CTRL)	+=3D rpmsg_ctrl.o
  obj-$(CONFIG_RPMSG_NS)		+=3D rpmsg_ns.o
- obj-$(CONFIG_RPMSG_MTK_SCP)	+=3D mtk_rpmsg.o
 diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm=
_mailbox.c
 new file mode 100644
 index 000000000000..4a80102669f6
@@ -218,5 +217,5 @@ index 000000000000..4a80102669f6
 +MODULE_DESCRIPTION("ARM RPMSG Driver");
 +MODULE_AUTHOR("Tushar Khandelwal <tushar.khandelwal@arm.com>");
 --=20
-2.17.1
+2.39.0
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rp=
msg-arm-fix-return-value.patch b/meta-arm-bsp/recipes-kernel/linux/files/=
corstone1000/0004-rpmsg-arm-fix-return-value.patch
index 20747688..5e70c00e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rpmsg-arm=
-fix-return-value.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rpmsg-arm=
-fix-return-value.patch
@@ -1,14 +1,12 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-
-From 1426dd2b541cb51741bffbd95191ae5593e1749d Mon Sep 17 00:00:00 2001
+From ce77351c8ae6b04070135fdaedaad337bb0b4ef5 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 27 Sep 2022 10:05:27 +0100
-Subject: [PATCH 1/2] rpmsg: arm: fix return value
+Subject: [PATCH 4/6] rpmsg: arm: fix return value
=20
 The creation of and endpoint returns a pointer, fix the return
 value to the right type.
=20
+Upstream-Status: Pending
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  drivers/rpmsg/rpmsg_arm_mailbox.c | 5 +++--
@@ -31,5 +29,5 @@ index 4a80102669f6..5c0dcc8e353d 100644
 =20
  	return &channel->ept;
 --=20
-2.37.3
+2.39.0
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rp=
msg-arm-update-chrdev-to-ctrldev-registration.patch b/meta-arm-bsp/recipe=
s-kernel/linux/files/corstone1000/0005-rpmsg-arm-update-chrdev-to-ctrldev=
-registration.patch
index 504fa676..852572ab 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rpmsg-arm=
-update-chrdev-to-ctrldev-registration.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rpmsg-arm=
-update-chrdev-to-ctrldev-registration.patch
@@ -1,15 +1,13 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
-
-From 20cd41fee8e4638eb47072b91d9a9f985730583b Mon Sep 17 00:00:00 2001
+From 590bf152e18b3cf7166c7accfc32ed3b2d07bf09 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 27 Sep 2022 10:07:21 +0100
-Subject: [PATCH 2/2] rpmsg: arm: update chrdev to ctrldev registration
+Subject: [PATCH 5/6] rpmsg: arm: update chrdev to ctrldev registration
=20
 Since "rpmsg: Update rpmsg_chrdev_register_device function",
 there was a replacement of the chrdev driver to ctrldev
 driver. Fix the registration.
=20
+Upstream-Status: Pending
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  drivers/rpmsg/rpmsg_arm_mailbox.c | 2 +-
@@ -29,5 +27,5 @@ index 5c0dcc8e353d..90bc8df90885 100644
 =20
  static const struct of_device_id client_of_match[] =3D {
 --=20
-2.37.3
+2.39.0
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Ad=
ds-workaround-for-cs1k-specific-bug.patch b/meta-arm-bsp/recipes-kernel/l=
inux/files/corstone1000/0006-Adds-workaround-for-cs1k-specific-bug.patch
index 5cd8e4b0..9956f262 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Adds-work=
around-for-cs1k-specific-bug.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Adds-work=
around-for-cs1k-specific-bug.patch
@@ -1,22 +1,21 @@
-Upstream-Status: Inappropriate[Temporary bugfix]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-
-From f1a869ea986305a6fb20f3c770c11778a898b86d Mon Sep 17 00:00:00 2001
+From 00851c43f4d00e7451550660ab652e9ac9128e02 Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Thu, 13 Oct 2022 20:53:42 +0100
-Subject: [PATCH] Adds workaround for cs1k specific bug
+Subject: [PATCH 6/6] Adds workaround for cs1k specific bug
=20
 Adds a temporary workaround to solve a possible
 race-conditioning issue in the tee driver
 for corstone1000.
=20
+Upstream-Status: Inappropriate
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  drivers/firmware/arm_ffa/driver.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index ec731e9e942b..2a3ef649935e 100644
+index d5e86ef40b89..cbb944f63321 100644
 --- a/drivers/firmware/arm_ffa/driver.c
 +++ b/drivers/firmware/arm_ffa/driver.c
 @@ -32,6 +32,7 @@
@@ -27,7 +26,7 @@ index ec731e9e942b..2a3ef649935e 100644
 =20
  #include "common.h"
 =20
-@@ -344,7 +345,7 @@ static int ffa_msg_send_direct_req(u16 src_id, u16 d=
st_id, bool mode_32bit,
+@@ -362,7 +363,7 @@ static int ffa_msg_send_direct_req(u16 src_id, u16 d=
st_id, bool mode_32bit,
  {
  	u32 req_id, resp_id, src_dst_ids =3D PACK_TARGET_INFO(src_id, dst_id);
  	ffa_value_t ret;
@@ -37,5 +36,5 @@ index ec731e9e942b..2a3ef649935e 100644
  		req_id =3D FFA_MSG_SEND_DIRECT_REQ;
  		resp_id =3D FFA_MSG_SEND_DIRECT_RESP;
 --=20
-2.17.1
+2.39.0
=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone500/0001-arm=
-defconfig-drop-CONFIG_SND_SOC_AC97-from-multi_v7.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone500/0001-arm-defconfig-drop-CONFIG_SND_S=
OC_AC97-from-multi_v7.patch
deleted file mode 100644
index 68c9ca00..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone500/0001-arm-defcon=
fig-drop-CONFIG_SND_SOC_AC97-from-multi_v7.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 7ee0e1c0a6498d376b38679c908f01a1528a1450 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Thu, 29 Sep 2022 17:16:45 +0100
-Subject: [PATCH] arm: defconfig: drop CONFIG_SND_SOC_AC97 from
- multi_v7_defconfig
-
-The CONFIG_SND_SOC_AC97 symbol was recently enabled but does not
-actually exist. This change is to remove it to fix warnings when
-used some of the build tools like yocto.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/mult=
i_v7_defconfig
-index ce9826bce29b..b3662f126efa 100644
---- a/arch/arm/configs/multi_v7_defconfig
-+++ b/arch/arm/configs/multi_v7_defconfig
-@@ -817,7 +817,6 @@ CONFIG_SND_SOC_TEGRA_TRIMSLICE=3Dm
- CONFIG_SND_SOC_TEGRA_ALC5632=3Dm
- CONFIG_SND_SOC_TEGRA_MAX98090=3Dm
- CONFIG_SND_SOC_DAVINCI_MCASP=3Dm
--CONFIG_SND_SOC_AC97=3Dm
- CONFIG_SND_SOC_AK4642=3Dm
- CONFIG_SND_SOC_CPCAP=3Dm
- CONFIG_SND_SOC_CS42L51_I2C=3Dm
---=20
-2.17.1
-
--=20
2.34.1


