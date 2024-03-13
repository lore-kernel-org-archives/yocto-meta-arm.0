Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A98C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 18:21:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3299.1710354074691849949
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 11:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB4DE1595
	for <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 11:21:50 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C14F3F7F4
	for <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 11:21:14 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/linux-yocto: remove unreferenced patch
Date: Wed, 13 Mar 2024 14:21:12 -0400
Message-Id: <20240313182112.17829-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240313182112.17829-1-jon.mason@arm.com>
References: <20240313182112.17829-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 18:21:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5431

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...4-defconfig-Enable-Tegra-MGBE-driver.patch | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0001-Reve=
rt-arm64-defconfig-Enable-Tegra-MGBE-driver.patch

diff --git a/meta-arm/recipes-kernel/linux/files/aarch64/0001-Revert-arm6=
4-defconfig-Enable-Tegra-MGBE-driver.patch b/meta-arm/recipes-kernel/linu=
x/files/aarch64/0001-Revert-arm64-defconfig-Enable-Tegra-MGBE-driver.patc=
h
deleted file mode 100644
index 995bc2c5d14d..000000000000
--- a/meta-arm/recipes-kernel/linux/files/aarch64/0001-Revert-arm64-defco=
nfig-Enable-Tegra-MGBE-driver.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 7bc0bae10b0f21cfc8df23848844b66bf1b4d751 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jdmason@kudzu.us>
-Date: Fri, 3 Feb 2023 05:16:43 -0500
-Subject: [PATCH 1/2] Revert "arm64: defconfig: Enable Tegra MGBE driver"
-
-This reverts commit 4cac4de4b05f0a1d5920d12278bf8787011661d3.
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Inappropriate
----
- arch/arm64/configs/defconfig | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 0b6af3348e79..70919b241469 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -362,7 +362,6 @@ CONFIG_SMSC911X=3Dy
- CONFIG_SNI_AVE=3Dy
- CONFIG_SNI_NETSEC=3Dy
- CONFIG_STMMAC_ETH=3Dm
--CONFIG_DWMAC_TEGRA=3Dm
- CONFIG_TI_K3_AM65_CPSW_NUSS=3Dy
- CONFIG_QCOM_IPA=3Dm
- CONFIG_MESON_GXL_PHY=3Dm
---=20
-2.30.2
-
--=20
2.39.3 (Apple Git-146)


