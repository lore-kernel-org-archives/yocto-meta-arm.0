Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02CFC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 13:20:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11272.1639056035031457307
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:20:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3050ED1
	for <meta-arm@lists.yoctoproject.org>; Thu,  9 Dec 2021 05:20:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D4E03F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu,  9 Dec 2021 05:20:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/scp-firmware: remove redundant SGI-575-specific
 do_install
Date: Thu,  9 Dec 2021 13:20:30 +0000
Message-Id: <20211209132031.902428-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 13:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2577

The base recipe can install the required files, so this is redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware-sgi575.inc       | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.in=
c b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
index 0a3d6112..e1b0a854 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
@@ -4,10 +4,3 @@ SCP_PLATFORM  =3D "sgi575"
 SCP_LOG_LEVEL =3D "INFO"
=20
 COMPATIBLE_MACHINE:sgi575 =3D "sgi575"
-
-do_install() {
-    install -d ${D}/firmware
-    install -D "${B}/product/${SCP_PLATFORM}/scp_romfw/release/bin/scp_r=
omfw.bin" "${D}/firmware/"
-    install -D "${B}/product/${SCP_PLATFORM}/scp_ramfw/release/bin/scp_r=
amfw.bin" "${D}/firmware/"
-    install -D "${B}/product/${SCP_PLATFORM}/mcp_romfw/release/bin/mcp_r=
omfw.bin" "${D}/firmware/"
-}
--=20
2.25.1


