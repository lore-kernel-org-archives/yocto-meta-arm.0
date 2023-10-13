Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B683CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 15:56:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.42507.1697212602599409149
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 08:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84E3E11FB
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 08:57:22 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 702F53F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 08:56:41 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] arm-bsp/linux-yocto: add recipe for v6.4 kernel
Date: Fri, 13 Oct 2023 10:56:33 -0500
Message-Id: <20231013155633.3896081-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Oct 2023 15:56:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5117

The v6.4 kernel is needed for some platforms in meta-arm-bsp.
Temporarily add it here to give those machines enough time to
update to the latest version.  Also, add the patch to the
defconfig.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...g-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch | 50 +++++++++++++++++++
 .../recipes-kernel/linux/linux-yocto_6.4.bb   | 39 +++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/aarch64/0001-=
arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/aarch64/0001-arm64-d=
efconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch b/meta-arm-bsp/recipes-=
kernel/linux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_=
NPCM8XX-y.patch
new file mode 100644
index 00000000..bff81dfc
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/aarch64/0001-arm64-defconfi=
g-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
@@ -0,0 +1,50 @@
+From 94a5e7ffe5855272708a94190820534c4f51bdd8 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Tue, 15 Aug 2023 10:36:56 +0300
+Subject: [PATCH] arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=3Dy
+
+There is no code for this config option and enabling it in defconfig
+causes warnings from tools which are detecting unused and obsolete
+kernel config flags since the flag will be completely missing from
+effective build config after "make olddefconfig".
+
+Fixes yocto kernel recipe build time warning:
+
+WARNING: [kernel config]: This BSP contains fragments with warnings:
+...
+[INFO]: the following symbols were not found in the active
+configuration:
+     - CONFIG_COMMON_CLK_NPCM8XX
+
+The flag was added with commit 45472f1e5348c7b755b4912f2f529ec81cea044b
+v5.19-rc4-15-g45472f1e5348 so 6.1 and 6.4 stable kernel trees are
+affected.
+
+Fixes: 45472f1e5348c7b755b4912f2f529ec81cea044b ("arm64: defconfig: Add =
Nuvoton NPCM family support")
+Cc: stable@kernel.org
+Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
+Cc: Jon Mason <jon.mason@arm.com>
+Cc: Jon Mason <jdmason@kudzu.us>
+Cc: Ross Burton <ross@burtonini.com>
+Cc: Arnd Bergmann <arnd@arndb.de>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-=
arm-kernel/2023-August/859760.html]
+
+---
+ arch/arm64/configs/defconfig | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 0777bcae9104..1cf24537fda2 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -1146,7 +1146,6 @@ CONFIG_COMMON_CLK_S2MPS11=3Dy
+ CONFIG_COMMON_CLK_PWM=3Dy
+ CONFIG_COMMON_CLK_RS9_PCIE=3Dy
+ CONFIG_COMMON_CLK_VC5=3Dy
+-CONFIG_COMMON_CLK_NPCM8XX=3Dy
+ CONFIG_COMMON_CLK_BD718XX=3Dm
+ CONFIG_CLK_RASPBERRYPI=3Dm
+ CONFIG_CLK_IMX8MM=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb b/meta-=
arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb
new file mode 100644
index 00000000..f4c06543
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -0,0 +1,39 @@
+KBRANCH ?=3D "v6.4/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+include recipes-kernel/linux/cve-exclusion_6.4.inc
+
+SRCREV_machine ?=3D "ef91ff6a4be36037808af1ca786fdd557f265a1d"
+SRCREV_meta ?=3D "13efe44fe9dd2626eaf6552288ea31770ec71cf1"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the=
 same
+# meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND =3D "devupstream:target"
+SRCREV_machine:class-devupstream ?=3D "ae4e4fc35b4258626644c162a702e2bce=
2b79190"
+PN:class-devupstream =3D "linux-yocto-upstream"
+KBRANCH:class-devupstream =3D "v6.4/base"
+
+SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH};protocol=3Dhttps \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.4;destsuffix=3D${KMETA};protocol=3Dhttps"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
+LINUX_VERSION ?=3D "6.4.16"
+
+PV =3D "${LINUX_VERSION}+git"
+
+KMETA =3D "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL =3D "1"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
+KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc", "", d)}"
+
+SRC_URI:append:aarch64 =3D " file://0001-arm64-defconfig-remove-CONFIG_C=
OMMON_CLK_NPCM8XX-y.patch"
--=20
2.30.2


