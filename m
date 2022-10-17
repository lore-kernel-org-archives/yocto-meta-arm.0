Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704A9C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 16:03:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42983.1666022591388301425
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 09:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45594113E;
	Mon, 17 Oct 2022 09:03:17 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 684BD3F792;
	Mon, 17 Oct 2022 09:03:10 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm-bsp/linux: add kernel file search path for N1SDP
Date: Mon, 17 Oct 2022 17:03:01 +0100
Message-Id: <20221017160301.37446-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221017160301.37446-1-vishnu.banavath@arm.com>
References: <20221017160301.37446-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Oct 2022 16:03:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3974

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to add ARMFILESPATHS into serach path
for linux for N1SDP target.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 34a40907..99a40e77 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -115,6 +115,7 @@ COMPATIBLE_MACHINE:n1sdp = "n1sdp"
 KBUILD_DEFCONFIG:n1sdp = "defconfig"
 KCONFIG_MODE:n1sdp = "--alldefconfig"
 FILESEXTRAPATHS:prepend:n1sdp := "${ARMBSPFILESPATHS}"
+FILESEXTRAPATHS:prepend:n1sdp := "${ARMFILESPATHS}"
 SRC_URI:append:n1sdp = " \
     file://0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch \
     file://0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch \
-- 
2.17.1


