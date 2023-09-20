Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F42C04AB7
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 17:10:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1201.1695229841354397619
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 10:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1F25C15;
	Wed, 20 Sep 2023 10:11:17 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23DEC3F67D;
	Wed, 20 Sep 2023 10:10:40 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/corstone1000: bump kernel version to v6.4
Date: Wed, 20 Sep 2023 18:10:33 +0100
Message-Id: <20230920171033.3139478-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920171033.3139478-1-xueliang.zhong@arm.com>
References: <20230920171033.3139478-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Sep 2023 17:10:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5065

From: Xueliang Zhong <xueliang.zhong@arm.com>

Bump kernel version to v6.4 and rebase the patches on
top of this new version.

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 .../conf/machine/include/corstone1000.inc       |  2 +-
 .../0002-Add-external-system-driver.patch       | 17 ++++++++---------
 ...0003-Add-rpmsg-driver-for-corstone1000.patch |  7 ++-----
 .../0004-rpmsg-arm-fix-return-value.patch       |  7 ++-----
 ...-update-chrdev-to-ctrldev-registration.patch |  7 ++-----
 ...-Adds-workaround-for-cs1k-specific-bug.patch | 11 ++++-------
 6 files changed, 19 insertions(+), 32 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 72c0af51..5a66f54d 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -52,7 +52,7 @@ EXTRA_IMAGEDEPENDS +=3D "external-system"
=20
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto =3D "6.1%"
+PREFERRED_VERSION_linux-yocto =3D "6.4%"
 KERNEL_IMAGETYPE =3D "Image.gz"
=20
 INITRAMFS_IMAGE_BUNDLE ?=3D "1"
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Ad=
d-external-system-driver.patch b/meta-arm-bsp/recipes-kernel/linux/files/=
corstone1000/0002-Add-external-system-driver.patch
index 5af041ef..d8d9488b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-exter=
nal-system-driver.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0002-Add-exter=
nal-system-driver.patch
@@ -1,7 +1,7 @@
-From 19eabe2a5fb97530820dd2a22fe6bc143a8d693f Mon Sep 17 00:00:00 2001
+From 9eac502eacd36a4975ec34a3f076594fa4364032 Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Fri, 19 Aug 2022 14:51:08 +0100
-Subject: [PATCH 2/6] Add external system driver
+Subject: [PATCH] Add external system driver
=20
 Adds external system driver to control it
 from user-space. It provides run and reset
@@ -22,24 +22,26 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  create mode 100644 drivers/misc/arm/extsys_ctrl.c
=20
 diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
-index 358ad56f6524..fd8654ffdab0 100644
+index 433aa4197785..912986abc46c 100644
 --- a/drivers/misc/Kconfig
 +++ b/drivers/misc/Kconfig
-@@ -514,4 +514,5 @@ source "drivers/misc/habanalabs/Kconfig"
+@@ -555,4 +555,5 @@ source "drivers/misc/cardreader/Kconfig"
  source "drivers/misc/uacce/Kconfig"
  source "drivers/misc/pvpanic/Kconfig"
  source "drivers/misc/mchp_pci1xxxx/Kconfig"
 +source "drivers/misc/arm/Kconfig"
  endmenu
 diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
-index ac9b3e757ba1..f7852e4fd63d 100644
+index 56de43943cd5..22e6561b8192 100644
 --- a/drivers/misc/Makefile
 +++ b/drivers/misc/Makefile
-@@ -62,3 +62,4 @@ obj-$(CONFIG_HI6421V600_IRQ)	+=3D hi6421v600-irq.o
+@@ -63,5 +63,6 @@ obj-$(CONFIG_HI6421V600_IRQ)	+=3D hi6421v600-irq.o
  obj-$(CONFIG_OPEN_DICE)		+=3D open-dice.o
  obj-$(CONFIG_GP_PCI1XXXX)	+=3D mchp_pci1xxxx/
  obj-$(CONFIG_VCPU_STALL_DETECTOR)	+=3D vcpu_stall_detector.o
 +obj-y				+=3D arm/
+ obj-$(CONFIG_TMR_MANAGER)      +=3D xilinx_tmr_manager.o
+ obj-$(CONFIG_TMR_INJECT)	+=3D xilinx_tmr_inject.o
 diff --git a/drivers/misc/arm/Kconfig b/drivers/misc/arm/Kconfig
 new file mode 100644
 index 000000000000..9f1eb284e530
@@ -216,6 +218,3 @@ index 000000000000..7929070ff43d
 +MODULE_DESCRIPTION("Arm External System Control Driver");
 +MODULE_AUTHOR("Morten Borup Petersen");
 +MODULE_AUTHOR("Rui Miguel Silva <rui.silva@arm.com>");
---=20
-2.39.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Ad=
d-rpmsg-driver-for-corstone1000.patch b/meta-arm-bsp/recipes-kernel/linux=
/files/corstone1000/0003-Add-rpmsg-driver-for-corstone1000.patch
index 34904294..cd9cec27 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpmsg=
-driver-for-corstone1000.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpmsg=
-driver-for-corstone1000.patch
@@ -1,7 +1,7 @@
-From 9fb971c23d423f593620ed82fb69a7e2cd35986a Mon Sep 17 00:00:00 2001
+From a834f4e143ff647e7677dc60ab57ee5883f3ac8f Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Wed, 17 Aug 2022 14:21:42 +0100
-Subject: [PATCH 3/6] Add rpmsg driver for corstone1000
+Subject: [PATCH] Add rpmsg driver for corstone1000
=20
 Adds rpmsg driver to communicate with external
 system in corstone1000 platform.
@@ -216,6 +216,3 @@ index 000000000000..4a80102669f6
 +MODULE_LICENSE("GPL v2");
 +MODULE_DESCRIPTION("ARM RPMSG Driver");
 +MODULE_AUTHOR("Tushar Khandelwal <tushar.khandelwal@arm.com>");
---=20
-2.39.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rp=
msg-arm-fix-return-value.patch b/meta-arm-bsp/recipes-kernel/linux/files/=
corstone1000/0004-rpmsg-arm-fix-return-value.patch
index 5e70c00e..516dbd70 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rpmsg-arm=
-fix-return-value.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0004-rpmsg-arm=
-fix-return-value.patch
@@ -1,7 +1,7 @@
-From ce77351c8ae6b04070135fdaedaad337bb0b4ef5 Mon Sep 17 00:00:00 2001
+From c1ffd793062a13afdcc07d4bc1a8007188bfca5f Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 27 Sep 2022 10:05:27 +0100
-Subject: [PATCH 4/6] rpmsg: arm: fix return value
+Subject: [PATCH] rpmsg: arm: fix return value
=20
 The creation of and endpoint returns a pointer, fix the return
 value to the right type.
@@ -28,6 +28,3 @@ index 4a80102669f6..5c0dcc8e353d 100644
  	}
 =20
  	return &channel->ept;
---=20
-2.39.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rp=
msg-arm-update-chrdev-to-ctrldev-registration.patch b/meta-arm-bsp/recipe=
s-kernel/linux/files/corstone1000/0005-rpmsg-arm-update-chrdev-to-ctrldev=
-registration.patch
index 852572ab..ef2eb7c1 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rpmsg-arm=
-update-chrdev-to-ctrldev-registration.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0005-rpmsg-arm=
-update-chrdev-to-ctrldev-registration.patch
@@ -1,7 +1,7 @@
-From 590bf152e18b3cf7166c7accfc32ed3b2d07bf09 Mon Sep 17 00:00:00 2001
+From a8c295e1ff1d2b1032cc7495f212c56ba9f3e874 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 27 Sep 2022 10:07:21 +0100
-Subject: [PATCH 5/6] rpmsg: arm: update chrdev to ctrldev registration
+Subject: [PATCH] rpmsg: arm: update chrdev to ctrldev registration
=20
 Since "rpmsg: Update rpmsg_chrdev_register_device function",
 there was a replacement of the chrdev driver to ctrldev
@@ -26,6 +26,3 @@ index 5c0dcc8e353d..90bc8df90885 100644
  }
 =20
  static const struct of_device_id client_of_match[] =3D {
---=20
-2.39.0
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Ad=
ds-workaround-for-cs1k-specific-bug.patch b/meta-arm-bsp/recipes-kernel/l=
inux/files/corstone1000/0006-Adds-workaround-for-cs1k-specific-bug.patch
index 9956f262..4fbeb23e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Adds-work=
around-for-cs1k-specific-bug.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Adds-work=
around-for-cs1k-specific-bug.patch
@@ -1,7 +1,7 @@
-From 00851c43f4d00e7451550660ab652e9ac9128e02 Mon Sep 17 00:00:00 2001
+From 555ac46f6f5157741a6fd8f21f74beb1340ed941 Mon Sep 17 00:00:00 2001
 From: Emekcan <emekcan.aras@arm.com>
 Date: Thu, 13 Oct 2022 20:53:42 +0100
-Subject: [PATCH 6/6] Adds workaround for cs1k specific bug
+Subject: [PATCH] Adds workaround for cs1k specific bug
=20
 Adds a temporary workaround to solve a possible
 race-conditioning issue in the tee driver
@@ -15,7 +15,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ff=
a/driver.c
-index d5e86ef40b89..cbb944f63321 100644
+index 2109cd178ff7..c15b3a83c720 100644
 --- a/drivers/firmware/arm_ffa/driver.c
 +++ b/drivers/firmware/arm_ffa/driver.c
 @@ -32,6 +32,7 @@
@@ -26,7 +26,7 @@ index d5e86ef40b89..cbb944f63321 100644
 =20
  #include "common.h"
 =20
-@@ -362,7 +363,7 @@ static int ffa_msg_send_direct_req(u16 src_id, u16 d=
st_id, bool mode_32bit,
+@@ -282,7 +283,7 @@ static int ffa_msg_send_direct_req(u16 src_id, u16 d=
st_id, bool mode_32bit,
  {
  	u32 req_id, resp_id, src_dst_ids =3D PACK_TARGET_INFO(src_id, dst_id);
  	ffa_value_t ret;
@@ -35,6 +35,3 @@ index d5e86ef40b89..cbb944f63321 100644
  	if (mode_32bit) {
  		req_id =3D FFA_MSG_SEND_DIRECT_REQ;
  		resp_id =3D FFA_MSG_SEND_DIRECT_RESP;
---=20
-2.39.0
-
--=20
2.25.1


