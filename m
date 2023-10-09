Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4831CE95A95
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 00:51:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.50857.1696812668358543235
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 08 Oct 2023 17:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0927BFEC
	for <meta-arm@lists.yoctoproject.org>; Sun,  8 Oct 2023 17:51:48 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 854773F5A1
	for <meta-arm@lists.yoctoproject.org>; Sun,  8 Oct 2023 17:51:07 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/linux-yocto: remove defconfig patch
Date: Sun,  8 Oct 2023 19:50:58 -0500
Message-Id: <20231009005058.3858695-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231009005058.3858695-1-jon.mason@arm.com>
References: <20231009005058.3858695-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Oct 2023 00:51:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5106

Patch was accepted upstream and has been pulled back the 6.5 and 6.1
kernels.  So, it is no longer needed here.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...g-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch | 50 -------------------
 .../linux/linux-yocto%.bbappend               |  5 --
 2 files changed, 55 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0001-arm6=
4-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch

diff --git a/meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defco=
nfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch b/meta-arm/recipes-kernel/l=
inux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-=
y.patch
deleted file mode 100644
index bff81dfc..00000000
--- a/meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defconfig-re=
move-CONFIG_COMMON_CLK_NPCM8XX-y.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 94a5e7ffe5855272708a94190820534c4f51bdd8 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Tue, 15 Aug 2023 10:36:56 +0300
-Subject: [PATCH] arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=3Dy
-
-There is no code for this config option and enabling it in defconfig
-causes warnings from tools which are detecting unused and obsolete
-kernel config flags since the flag will be completely missing from
-effective build config after "make olddefconfig".
-
-Fixes yocto kernel recipe build time warning:
-
-WARNING: [kernel config]: This BSP contains fragments with warnings:
-...
-[INFO]: the following symbols were not found in the active
-configuration:
-     - CONFIG_COMMON_CLK_NPCM8XX
-
-The flag was added with commit 45472f1e5348c7b755b4912f2f529ec81cea044b
-v5.19-rc4-15-g45472f1e5348 so 6.1 and 6.4 stable kernel trees are
-affected.
-
-Fixes: 45472f1e5348c7b755b4912f2f529ec81cea044b ("arm64: defconfig: Add =
Nuvoton NPCM family support")
-Cc: stable@kernel.org
-Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
-Cc: Jon Mason <jon.mason@arm.com>
-Cc: Jon Mason <jdmason@kudzu.us>
-Cc: Ross Burton <ross@burtonini.com>
-Cc: Arnd Bergmann <arnd@arndb.de>
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-=
arm-kernel/2023-August/859760.html]
-
----
- arch/arm64/configs/defconfig | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 0777bcae9104..1cf24537fda2 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -1146,7 +1146,6 @@ CONFIG_COMMON_CLK_S2MPS11=3Dy
- CONFIG_COMMON_CLK_PWM=3Dy
- CONFIG_COMMON_CLK_RS9_PCIE=3Dy
- CONFIG_COMMON_CLK_VC5=3Dy
--CONFIG_COMMON_CLK_NPCM8XX=3Dy
- CONFIG_COMMON_CLK_BD718XX=3Dm
- CONFIG_CLK_RASPBERRYPI=3Dm
- CONFIG_CLK_IMX8MM=3Dy
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-a=
rm/recipes-kernel/linux/linux-yocto%.bbappend
index 9d5266ba..0a42ce4a 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -1,10 +1,5 @@
 ARMFILESPATHS :=3D "${THISDIR}/files:"
=20
-FILESEXTRAPATHS:prepend:aarch64 =3D "${ARMFILESPATHS}"
-SRC_URI:append:aarch64 =3D " \
-     file://0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patc=
h \
-    "
-
 COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
 FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
 SRC_URI:append:generic-arm64 =3D " \
--=20
2.30.2


