Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55987FF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 12:43:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44346.1777293824301876772
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 05:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Vw6BaYVq;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43BFF1FC7;
	Mon, 27 Apr 2026 05:43:38 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46F023F62B;
	Mon, 27 Apr 2026 05:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777293823; bh=CJ93hBjVvtXhNwxfJGJSO2JWpPrVpkFPwtryahry7Wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vw6BaYVq8FnTorcVS1QPtc4rsJcAMNaM5xre/HvAPwhO4LTDoOHUjLbdRvKHFpPJN
	 xy1WgxokFjpHXKQ8vIoaAhZrFKr9lyZ+eZClAKvQpTKEovWRwKIWINjC/T7HRyEKft
	 8pjF7ozPFCQ9r/F/S6za0ruKchvHeeeuvf0a6hEc=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 2/2] arm-bsp/u-boot: corstone1000: disable EFI debug support
Date: Mon, 27 Apr 2026 13:43:38 +0100
Message-ID: <20260427124338.2280651-2-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427124338.2280651-1-michael.safwat@arm.com>
References: <20260427124338.2280651-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Apr 2026 12:43:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7028

Add a U-Boot patch to disable CONFIG_EFI_DEBUG_SUPPORT in the
Corstone1000 defconfigs.

EFI debug support is now enabled by default and changes the EFI memory
layout. On Corstone1000 this can cause a boot failure after
ExitBootServices(), reproduced on the Cortex-A320 FVP path with MTE
enabled.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  5 ++
 ...rstone1000-disable-EFI-debug-support.patch | 46 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
040-configs-corstone1000-disable-EFI-debug-support.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 9660fbc6..e3dec3c0 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -81,6 +81,11 @@ SRC_URI:append =3D " \
     file://0039-corstone1000-a320-Add-Corstone1000-board-variant.patch \
 "
=20
+# Disable the debug feature
+SRC_URI:append =3D " \
+    file://0040-configs-corstone1000-disable-EFI-debug-support.patch \
+"
+
 uboot_configure_config:append() {
    openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout $=
{B}/CRT.key -out ${S}/CRT.crt -nodes -days 365
 }
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-con=
figs-corstone1000-disable-EFI-debug-support.patch b/meta-arm-bsp/recipes-=
bsp/u-boot/u-boot/corstone1000/0040-configs-corstone1000-disable-EFI-debu=
g-support.patch
new file mode 100644
index 00000000..efd44bfd
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-configs-co=
rstone1000-disable-EFI-debug-support.patch
@@ -0,0 +1,46 @@
+From e43e45860f3aecac1a58836c14ec9e961c284ad7 Mon Sep 17 00:00:00 2001
+From: Michael Safwat <michael.safwat@arm.com>
+Date: Thu, 23 Apr 2026 18:16:45 +0100
+Subject: [PATCH] configs: corstone1000: disable EFI debug support
+
+CONFIG_EFI_DEBUG_SUPPORT was recently enabled by default and introduces =
an
+early EFI_RUNTIME_SERVICES_DATA allocation for the EFI system table poin=
ter.
+
+On Corstone1000, this shifts the EFI memory layout enough to trigger a b=
oot
+hang on the Cortex-A320 FVP path when Linux boots with MTE enabled throu=
gh the
+EFI flow. The failure happens after ExitBootServices().
+
+Disable CONFIG_EFI_DEBUG_SUPPORT in the Corstone1000 defconfigs so the
+platform keeps the previous EFI memory layout and avoids the issue.
+
+Signed-off-by: Michael Safwat <michael.safwat@arm.com>
+Upstream-Status: Pending
+---
+ configs/corstone1000-a320_defconfig | 1 +
+ configs/corstone1000_defconfig      | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/configs/corstone1000-a320_defconfig b/configs/corstone1000-=
a320_defconfig
+index c7636bf45f8..290c6223bb1 100644
+--- a/configs/corstone1000-a320_defconfig
++++ b/configs/corstone1000-a320_defconfig
+@@ -13,6 +13,7 @@ CONFIG_SYS_LOAD_ADDR=3D0x82100000
+ CONFIG_IDENT_STRING=3D" corstone1000-a320 aarch64 "
+ CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
+ CONFIG_EFI_SECURE_BOOT=3Dy
++# CONFIG_EFI_DEBUG_SUPPORT is not set
+ CONFIG_EFI_SET_TIME=3Dy
+ CONFIG_EFI_MM_COMM_TEE=3Dy
+ CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index 6ff855e7ce9..8448925e46a 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -13,6 +13,7 @@ CONFIG_SYS_LOAD_ADDR=3D0x82100000
+ CONFIG_IDENT_STRING=3D" corstone1000 aarch64 "
+ CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
+ CONFIG_EFI_SECURE_BOOT=3Dy
++# CONFIG_EFI_DEBUG_SUPPORT is not set
+ CONFIG_EFI_SET_TIME=3Dy
+ CONFIG_EFI_MM_COMM_TEE=3Dy
+ CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096

