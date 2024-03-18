Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A84C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 11:26:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40774.1710761168182958059
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 04:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8256F106F;
	Mon, 18 Mar 2024 04:26:42 -0700 (PDT)
Received: from PW04GXMM.arm.com (PW04GXMM.arm.com [10.1.39.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB55F3F762;
	Mon, 18 Mar 2024 04:26:06 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: Update scp-firmware version
Date: Mon, 18 Mar 2024 11:25:50 +0000
Message-Id: <20240318112550.7284-2-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318112550.7284-1-anusmita.duttamazumder@arm.com>
References: <20240318112550.7284-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:26:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5445

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Remove scp-firmware sha for intermediate version
to update to v2.13 according to the Arm Reference solutions
Feb-2024 manifest.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 41d8f448..c89b132c 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -13,9 +13,6 @@ DEPENDS +=3D "n1sdp-board-firmware"
 EXTRA_OECMAKE:append =3D " \
     -DSCP_N1SDP_SENSOR_LIB_PATH=3D${RECIPE_SYSROOT}/n1sdp-board-firmware=
_source/LIB/sensor.a \
 "
-# scp-firmware version aligning to Arm Reference Solutions N1SDP-2023.06=
.22 Release
-SRCREV =3D "543ae8ca3c9e38da3058311118fa3ceef1da47f7"
-PV .=3D "+git"
=20
 do_install:append() {
    fiptool \
--=20
2.34.1


