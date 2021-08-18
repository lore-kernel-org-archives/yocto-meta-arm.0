Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.54843.1629297112958380297
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Aug 2021 07:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BFF21FB
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Aug 2021 07:31:42 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CABDA3F40C
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Aug 2021 07:31:41 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/linux-yocto: drop upstreamed N1SDP patch
Date: Wed, 18 Aug 2021 15:31:38 +0100
Message-Id: <20210818143138.3442814-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch was upstreamed in 5.10.54.

Change-Id: Iacf6345c4d4ffa8e512e2f812876fdd50a057f96
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/linux-arm-platforms.inc             |  1 -
 ...id-duplicate-sysfs-entry-creation-er.patch | 45 -------------------
 2 files changed, 46 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 4db9629..4397bb6 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -131,7 +131,6 @@ SRC_URI:append:n1sdp =3D " \
     file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch=
 \
     file://0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
     file://0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.pat=
ch \
-    file://0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.pat=
ch \
     file://0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.pat=
ch \
     file://no-power-avs.patch \
     file://enable-realtek-R8169.cfg \
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/000=
5-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch b/meta-arm-b=
sp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169-Fix-to-avoid-du=
plicate-sysfs-entry-creation-er.patch
deleted file mode 100644
index 143f78b..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169=
-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 914fe7871fc2f00ec94cd4d17722158e94fa88df Mon Sep 17 00:00:00 2001
-From: Khasim Mohammed <khasim.mohammed@arm.com>
-Date: Fri, 8 Jan 2021 04:21:23 +0000
-Subject: [PATCH] r8169: Fix to avoid duplicate sysfs entry creation erro=
r
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending [yet to submit]
-
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-Patch taken from :
-https://git.linaro.org/landing-teams/working/arm/kernel-release.git/comm=
it/?h=3Dn1sdp&id=3D84baaae9e751c058717d9702438429257f077f03
-
-Following error observed with r8169 driver, this patch fix the issue.
-
-[ 27.544136] r8169 0002:07:00.0: enabling device (0000 -> 0003)
-[ 27.559734] sysfs: cannot create duplicate filename '/class/mdio_bus/r8=
169-700'
-=E2=80=A6
-[ 27.684858] libphy: mii_bus r8169-700 failed to register
-[ 27.695602] r8169: probe of 0002:07:00.0 failed with error -22
-
-Change-Id: Id696abbabd794ecef5c551c5c45630963d9502a6
-Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
----
- drivers/net/ethernet/realtek/r8169_main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/eth=
ernet/realtek/r8169_main.c
-index 85d9c3e30c69..6d6b24978fd5 100644
---- a/drivers/net/ethernet/realtek/r8169_main.c
-+++ b/drivers/net/ethernet/realtek/r8169_main.c
-@@ -5088,7 +5088,7 @@ static int r8169_mdio_register(struct rtl8169_priv=
ate *tp)
- 	new_bus->priv =3D tp;
- 	new_bus->parent =3D &pdev->dev;
- 	new_bus->irq[0] =3D PHY_IGNORE_INTERRUPT;
--	snprintf(new_bus->id, MII_BUS_ID_SIZE, "r8169-%x", pci_dev_id(pdev));
-+	snprintf(new_bus->id, MII_BUS_ID_SIZE, "r8169-%x-%x", pdev->bus->domai=
n_nr, pci_dev_id(pdev));
-=20
- 	new_bus->read =3D r8169_mdio_read_reg;
- 	new_bus->write =3D r8169_mdio_write_reg;
---=20
-2.17.1
-
--=20
2.32.0

