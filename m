Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C104C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 09:44:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.23035.1656582255382067421
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 02:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 416FD1042;
	Thu, 30 Jun 2022 02:44:15 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E6703F5A1;
	Thu, 30 Jun 2022 02:44:14 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 3/4] arm-bsp/scp-firmware: N1SDP trusted boot
Date: Thu, 30 Jun 2022 10:43:32 +0100
Message-Id: <20220630094333.3738129-4-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630094333.3738129-1-adam.johnston@arm.com>
References: <20220630094333.3738129-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Jun 2022 09:44:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3545

From: Adam Johnston <adam.johnston@arm.com>

This commit configures scp-firmware for TBBR bootflow as follows:
* Updates SCP FW to master
* BL31 replaced in the SCP firmware image with BL1

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc         | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 0352539a..e66469c3 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -3,6 +3,10 @@
 SCP_PLATFORM  =3D "n1sdp"
 SCP_LOG_LEVEL =3D "INFO"
=20
+# master branch at n1sdp: Introduce trusted board boot
+SRCREV  =3D "3e4c34ceccc1c960eb3a4adaa922f2a0c6b36be3"
+PV .=3D "+git${SRCPV}"
+
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
=20
 DEPENDS +=3D "fiptool-native"
@@ -12,7 +16,7 @@ do_install:append() {
    fiptool \
        create \
        --scp-fw "${D}/firmware/scp_ramfw.bin" \
-       --soc-fw "${RECIPE_SYSROOT}/firmware/bl31.bin" \
+       --blob uuid=3Dcfacc2c4-15e8-4668-82be-430a38fad705,file=3D"${RECI=
PE_SYSROOT}/firmware/bl1.bin" \
        "scp_fw.bin"
=20
    # This UUID is FIP_UUID_MCP_BL2 in SCP-Firmware.
--=20
2.25.1


