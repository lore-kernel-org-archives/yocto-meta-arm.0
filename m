Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641B2C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 14:04:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24006.1704463440997320934
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 06:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD695C15
	for <meta-arm@lists.yoctoproject.org>; Fri,  5 Jan 2024 06:04:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 26ABE3F7A6
	for <meta-arm@lists.yoctoproject.org>; Fri,  5 Jan 2024 06:03:59 -0800 (PST)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/linux-yocto: add linux-yocto 6.5 temporarily
Date: Fri,  5 Jan 2024 14:03:57 +0000
Message-Id: <20240105140357.2504123-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Jan 2024 14:04:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5308

From: Ross Burton <ross.burton@arm.com>

oe-core master has upgraded from 6.5 to 6.6, but as we have BSPs that
still use 6.5 (corstone1000, n1sdp) we need to carry the recipe. This
should be a short-term measure as 6.5 was EOL in December 2023.

Also, drop the unused 6.4 linux-yocto which was no longer needed since
N1SDP moved to 6.5 with 21df60b.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...g-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch | 50 -------------------
 ...{linux-yocto_6.4.bb =3D> linux-yocto_6.5.bb} | 18 +++----
 2 files changed, 8 insertions(+), 60 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/aarch64/0001-=
arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto_6.4.bb =3D> linux-=
yocto_6.5.bb} (71%)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/aarch64/0001-arm64-d=
efconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch b/meta-arm-bsp/recipes-=
kernel/linux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_=
NPCM8XX-y.patch
deleted file mode 100644
index bff81dfc..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/aarch64/0001-arm64-defconfi=
g-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
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
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_6.5.bb
similarity index 71%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.5.bb
index f4c06543..a5cc5461 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -1,28 +1,28 @@
-KBRANCH ?=3D "v6.4/standard/base"
+KBRANCH ?=3D "v6.5/standard/base"
=20
 require recipes-kernel/linux/linux-yocto.inc
=20
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion.inc
-include recipes-kernel/linux/cve-exclusion_6.4.inc
+include recipes-kernel/linux/cve-exclusion_6.5.inc
=20
-SRCREV_machine ?=3D "ef91ff6a4be36037808af1ca786fdd557f265a1d"
-SRCREV_meta ?=3D "13efe44fe9dd2626eaf6552288ea31770ec71cf1"
+SRCREV_machine ?=3D "e53dc7514de7d2fbe0f80547a50c0542928e2d11"
+SRCREV_meta ?=3D "3b1f87ec237ec3ad9acffb3d75c55efe958085dc"
=20
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the=
 same
 # meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND =3D "devupstream:target"
-SRCREV_machine:class-devupstream ?=3D "ae4e4fc35b4258626644c162a702e2bce=
2b79190"
+SRCREV_machine:class-devupstream ?=3D "4631960b4700dd53f5cebb4f7055fd00c=
cd556ce"
 PN:class-devupstream =3D "linux-yocto-upstream"
-KBRANCH:class-devupstream =3D "v6.4/base"
+KBRANCH:class-devupstream =3D "v6.5/base"
=20
 SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH};protocol=3Dhttps \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.4;destsuffix=3D${KMETA};protocol=3Dhttps"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.5;destsuffix=3D${KMETA};protocol=3Dhttps"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
-LINUX_VERSION ?=3D "6.4.16"
+LINUX_VERSION ?=3D "6.5.13"
=20
 PV =3D "${LINUX_VERSION}+git"
=20
@@ -35,5 +35,3 @@ KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc", "", d)}"
-
-SRC_URI:append:aarch64 =3D " file://0001-arm64-defconfig-remove-CONFIG_C=
OMMON_CLK_NPCM8XX-y.patch"
--=20
2.34.1


