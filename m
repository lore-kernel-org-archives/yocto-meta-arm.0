Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85140C636D0
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 15:39:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.93863.1700753973921682586
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Nov 2023 07:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E98281595;
	Thu, 23 Nov 2023 07:40:19 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2EE83F6C4;
	Thu, 23 Nov 2023 07:39:32 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 3/5] arm-bsp/corstone1000-fvp: add unpadded image support for MMC card config
Date: Thu, 23 Nov 2023 15:39:17 +0000
Message-Id: <20231123153919.2154288-4-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123153919.2154288-1-emekcan.aras@arm.com>
References: <20231123153919.2154288-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Nov 2023 15:39:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5258

From: Emekcan Aras <emekcan.aras@arm.com>

Enables unpadded image support for MMC cards.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index bde3ba25..b2ed0fdf 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -49,6 +49,7 @@ FVP_CONFIG[board.msd_mmc.p_fast_access] ?=3D "0"
 FVP_CONFIG[board.msd_mmc.diagnostics] ?=3D "2"
 FVP_CONFIG[board.msd_mmc.p_max_block_count] ?=3D "0xFFFF"
 FVP_CONFIG[board.msd_config.pl180_fifo_depth] ?=3D "16"
+FVP_CONFIG[board.msd_mmc.support_unpadded_images] ?=3D "true"
=20
 # MMC2 card configuration
 FVP_CONFIG[board.msd_mmc_2.card_type] ?=3D "SDHC"
@@ -56,6 +57,7 @@ FVP_CONFIG[board.msd_mmc_2.p_fast_access] ?=3D "0"
 FVP_CONFIG[board.msd_mmc_2.diagnostics] ?=3D "2"
 FVP_CONFIG[board.msd_mmc_2.p_max_block_count] ?=3D "0xFFFF"
 FVP_CONFIG[board.msd_config_2.pl180_fifo_depth] ?=3D "16"
+FVP_CONFIG[board.msd_mmc_2.support_unpadded_images] ?=3D "true"
=20
 # Virtio-Net configuration
 FVP_CONFIG[board.virtio_net.enabled] ?=3D "1"
--=20
2.25.1


