Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E785C282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 20:32:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5635.1741033925216016063
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 12:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C78B106F
	for <meta-arm@lists.yoctoproject.org>; Mon,  3 Mar 2025 12:32:18 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1504C3F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon,  3 Mar 2025 12:32:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-base: bump cores to to v8.5
Date: Mon,  3 Mar 2025 20:31:58 +0000
Message-ID: <20250303203158.1235128-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Mar 2025 20:32:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6396

The Pointer Authentication (PAC) instructions are part of v8.3, and BTI
(Branch Target Indentification) instructions are mandatory in v8.5.

As we want to use PAC/BTI everywhere in this BSP, bump the cores to
v8.5.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 03896a34..adc9bc81 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -57,9 +57,9 @@ FVP_CONFIG[cluster1.stage12_tlb_size] ?=3D "1024"
 FVP_CONFIG[bp.secureflashloader.fname] ?=3D "bl1-fvp.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?=3D "fip-fvp.bin"
 FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
-# Set the baseline to ARMv8.4, as the default is 8.0.
-FVP_CONFIG[cluster0.has_arm_v8-4] =3D "1"
-FVP_CONFIG[cluster1.has_arm_v8-4] =3D "1"
+# Set the baseline to ARMv8.5, as the default is 8.0.
+FVP_CONFIG[cluster0.has_arm_v8-5] =3D "1"
+FVP_CONFIG[cluster1.has_arm_v8-5] =3D "1"
 FVP_CONSOLES[default] =3D "terminal_0"
 FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
 FVP_TERMINALS[bp.terminal_1] ?=3D ""
--=20
2.43.0


