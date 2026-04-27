Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF2BFF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 12:43:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44343.1777293823554476644
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 05:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cDdRaDt2;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 798D71684;
	Mon, 27 Apr 2026 05:43:37 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 771603F62B;
	Mon, 27 Apr 2026 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777293822; bh=0Pez7voCKU4Vlb6k04RnOrKOSnoN1eXpU3WD3I502XM=;
	h=From:To:Cc:Subject:Date:From;
	b=cDdRaDt2YgQ9nXu9H5a+RTRbMjNnegzS5DA0OUr3msoLiuoHcCEL5NcW2ua27biCi
	 +0cP6Gvha7i1eIg5W2hGJXjJ2O2u/epVw3wYXwcEhOC/kwVUaEv72boztx2KsoWumm
	 XX6f2n9BxmwFA+vrdg8206INxQ0U897WedvLbMOM=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot: fix Corstone1000 FVP detection in patch set
Date: Mon, 27 Apr 2026 13:43:37 +0100
Message-ID: <20260427124338.2280651-1-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Apr 2026 12:43:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7027

Update the Corstone1000 U-Boot patches to detect FVP platforms
by matching "fvp" in the device tree name instead of relying on
the exact arm/corstone1000-fvp string.

This fixes FVP-specific handling for Corstone1000 variants,
including capsule image selection and virtio setup.

Also restore CONFIG_BOARD_LATE_INIT in the Corstone1000
defconfigs, since the virtio probing runs from
board_late_init() and would otherwise never execute.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 ...corstone1000-Enable-virtio-net-support.patch | 17 +++++++++++++----
 ...00-a320-Add-Corstone1000-board-variant.patch | 15 ++++++++-------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-cor=
stone1000-Enable-virtio-net-support.patch b/meta-arm-bsp/recipes-bsp/u-bo=
ot/u-boot/corstone1000/0030-corstone1000-Enable-virtio-net-support.patch
index b9007b7c..f166633c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone10=
00-Enable-virtio-net-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-corstone10=
00-Enable-virtio-net-support.patch
@@ -7,12 +7,13 @@ Add virtio-net support in Corstone1000 FVP
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Michael Safwat <michael.safwat@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  arch/arm/dts/corstone1000-fvp.dts        |  6 ++++
  board/armltd/corstone1000/corstone1000.c | 42 ++++++++++++++++++++----
- configs/corstone1000_defconfig           |  2 ++
- 3 files changed, 44 insertions(+), 6 deletions(-)
+ configs/corstone1000_defconfig           |  3 ++
+ 3 files changed, 45 insertions(+), 6 deletions(-)
=20
 diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
 index 3076fb9f344..cd8a132271e 100644
@@ -97,10 +98,18 @@ index 9189640ef75..39fd10ed653 100644
 +	return 0;
 +}
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 00c3bb5f557..450d69762ab 100644
+index 00c3bb5f557..4ec23b4af1c 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
-@@ -78,6 +78,8 @@ CONFIG_TEE=3Dy
+@@ -37,6 +37,7 @@ CONFIG_LOGLEVEL=3D7
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
+ CONFIG_BOARD_INIT=3Dy
++CONFIG_BOARD_LATE_INIT=3Dy
+ CONFIG_SYS_PROMPT=3D"corstone1000# "
+ # CONFIG_CMD_CONSOLE is not set
+ CONFIG_CMD_FWU_METADATA=3Dy
+@@ -78,6 +79,8 @@ CONFIG_TEE=3Dy
  CONFIG_OPTEE=3Dy
  CONFIG_USB=3Dy
  CONFIG_USB_ISP1760=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-a320-Add-Corstone1000-board-variant.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-a320-Add-Corstone1000-=
board-variant.patch
index 59bf7aa2..5b2240ce 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-a320-Add-Corstone1000-board-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-a320-Add-Corstone1000-board-variant.patch
@@ -50,9 +50,9 @@ Signed-off-by: Michael Safwat <michael.safwat@arm.com>
  board/armltd/corstone1000-a320/Kconfig        |  12 +
  board/armltd/corstone1000-a320/MAINTAINERS    |   7 +
  board/armltd/corstone1000/corstone1000.c      |   6 +-
- configs/corstone1000-a320_defconfig           |  89 ++++++++
+ configs/corstone1000-a320_defconfig           |  90 ++++++++
  .../arm/arm,corstone1000-a320.yml             |  31 +++
- 9 files changed, 405 insertions(+), 3 deletions(-)
+ 9 files changed, 406 insertions(+), 3 deletions(-)
  create mode 100644 arch/arm/dts/corstone1000-a320-fvp.dts
  create mode 100644 arch/arm/dts/corstone1000-a320.dtsi
  create mode 100644 board/armltd/corstone1000-a320/Kconfig
@@ -400,7 +400,7 @@ index 00000000000..e62978b487e
 +F:	board/armltd/corstone1000-a320/
 +F:	configs/corstone1000-a320_defconfig
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index db8919298e1..0557865f59b 100644
+index db8919298e1..2f65eac7bf4 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -1,6 +1,6 @@
@@ -416,7 +416,7 @@ index db8919298e1..0557865f59b 100644
  {
  #if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
 -	if (!strcmp(DEVICE_TREE, "arm/corstone1000-fvp"))
-+	if (!strstr(DEVICE_TREE, "fvp"))
++	if (strstr(DEVICE_TREE, "fvp"))
  		update_info.images =3D fw_fvp_images;
  	else
  		update_info.images =3D fw_mps3_images;
@@ -425,16 +425,16 @@ index db8919298e1..0557865f59b 100644
  	int ret;
 =20
 -	if (!strcmp(cmp_dtb, "arm/corstone1000-fvp")) {
-+	if (!strstr(cmp_dtb, "fvp")) {
++	if (strstr(cmp_dtb, "fvp")) {
  		ret =3D uclass_first_device_err(UCLASS_VIRTIO, &virtio_bus);
  		if (!virtio_bus) {
  			log_err("Cannot find virtio device, err (%d)\n", ret);
 diff --git a/configs/corstone1000-a320_defconfig b/configs/corstone1000-=
a320_defconfig
 new file mode 100644
-index 00000000000..d0ae1e745db
+index 00000000000..c7636bf45f8
 --- /dev/null
 +++ b/configs/corstone1000-a320_defconfig
-@@ -0,0 +1,89 @@
+@@ -0,0 +1,90 @@
 +CONFIG_ARM=3Dy
 +CONFIG_SKIP_LOWLEVEL_INIT=3Dy
 +CONFIG_TARGET_CORSTONE1000=3Dy
@@ -474,6 +474,7 @@ index 00000000000..d0ae1e745db
 +# CONFIG_DISPLAY_CPUINFO is not set
 +# CONFIG_DISPLAY_BOARDINFO is not set
 +CONFIG_BOARD_INIT=3Dy
++CONFIG_BOARD_LATE_INIT=3Dy
 +CONFIG_SYS_PROMPT=3D"corstone1000# "
 +# CONFIG_CMD_CONSOLE is not set
 +CONFIG_CMD_FWU_METADATA=3Dy

