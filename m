Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C77C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 09:01:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5454.1666774896041905584
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 02:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D19E423A;
	Wed, 26 Oct 2022 02:01:41 -0700 (PDT)
Received: from e126544.arm.com (unknown [10.57.38.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2DF03F792;
	Wed, 26 Oct 2022 02:01:34 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 1/1] arm-bsp/corstone1000: add msd configs for fvp
Date: Wed, 26 Oct 2022 10:01:20 +0100
Message-Id: <20221026090120.356062-2-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026090120.356062-1-mohamed.omarasaker@arm.com>
References: <20221026090120.356062-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Oct 2022 09:01:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4039

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index 991a5bac..2a72f7ff 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -46,3 +46,5 @@ FVP_TERMINALS[extsys0.extsys_terminal] ?=3D "Cortex M3"
 FVP_CONFIG[board.msd_mmc.card_type] ?=3D "SDHC"
 FVP_CONFIG[board.msd_mmc.p_fast_access] ?=3D "0"
 FVP_CONFIG[board.msd_mmc.diagnostics] ?=3D "2"
+FVP_CONFIG[board.msd_mmc.p_max_block_count] ?=3D "0xFFFF"
+FVP_CONFIG[board.msd_config.pl180_fifo_depth] ?=3D "16"
--=20
2.25.1


