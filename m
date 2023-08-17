Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F348C27C7A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:33:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.183158.1692264780410639656
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 02:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0F431063;
	Thu, 17 Aug 2023 02:33:39 -0700 (PDT)
Received: from PW04GXMM.arm.com (unknown [10.57.35.205])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46E633F64C;
	Thu, 17 Aug 2023 02:32:58 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 1/1] arm-bsp/scp-firmware: Update N1SDP scp-firmware version
Date: Thu, 17 Aug 2023 10:32:46 +0100
Message-Id: <20230817093246.96-2-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817093246.96-1-anusmita.duttamazumder@arm.com>
References: <20230817093246.96-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Aug 2023 09:33:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4965

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

The scp-firmware version in the Arm Reference Solutions N1SDP-2023.06.22 =
Release has now updated to a beta version beyond v2.12.
Add the SHA override for N1SDP to align to scp-firmware version used in t=
he release.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index c89b132c..482ea327 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -13,6 +13,9 @@ DEPENDS +=3D "n1sdp-board-firmware"
 EXTRA_OECMAKE:append =3D " \
     -DSCP_N1SDP_SENSOR_LIB_PATH=3D${RECIPE_SYSROOT}/n1sdp-board-firmware=
_source/LIB/sensor.a \
 "
+# scp-firmware version aligning to Arm Reference Solutions N1SDP-2023.06=
.22 Release
+SRCREV =3D "543ae8ca3c9e38da3058311118fa3ceef1da47f7"
+PV .=3D "+git${SRCPV}"
=20
 do_install:append() {
    fiptool \
--=20
2.34.1


