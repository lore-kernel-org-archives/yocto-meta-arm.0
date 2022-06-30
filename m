Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401B6CCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 09:44:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.23162.1656582257687356305
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 02:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EB771042;
	Thu, 30 Jun 2022 02:44:17 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B97043F5A1;
	Thu, 30 Jun 2022 02:44:16 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 4/4] arm-bsp/sdcard-image-n1sdp: N1SDP trusted boot
Date: Thu, 30 Jun 2022 10:43:33 +0100
Message-Id: <20220630094333.3738129-5-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630094333.3738129-1-adam.johnston@arm.com>
References: <20220630094333.3738129-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Jun 2022 09:44:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3546

From: Adam Johnston <adam.johnston@arm.com>

This commit configures N1SDP firmware for TBBR bootflow as follows:
* uefi.bin replaced with with fip.bin
* load address adjusted for FIP image

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../recipes-bsp/images/sdcard-image-n1sdp_0.1.bb         | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/=
meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
index 6f74159c..84498a63 100644
--- a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
+++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
@@ -27,8 +27,8 @@ prepare_package() {
     cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${PRIMARY_DIR}
     mkdir -p ${PRIMARY_DIR}/SOFTWARE/
=20
-    # Copy uefi binary
-    cp -v ${RECIPE_SYSROOT}/firmware/uefi.bin ${PRIMARY_DIR}/SOFTWARE/
+    # Copy FIP binary
+    cp -v ${RECIPE_SYSROOT}/firmware/fip.bin ${PRIMARY_DIR}/SOFTWARE/
=20
     # Copy SOC binaries
     for f in ${SOC_BINARIES}; do
@@ -42,6 +42,11 @@ prepare_package() {
     sed -i -e 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x0000=
0100   ;SoC SCC PLATFORM_CTRL|' \
         ${PRIMARY_DIR}/MB/HBI0316A/io_v123f.txt
=20
+    # Update load address for trusted boot
+    sed -i -e '/^IMAGE4ADDRESS:/ s|0x60200000|0x64200000|' ${PRIMARY_DIR=
}/MB/HBI0316A/images.txt
+    sed -i -e '/^IMAGE4UPDATE:/ s|FORCE   |SCP_AUTO|' ${PRIMARY_DIR}/MB/=
HBI0316A/images.txt
+    sed -i -e '/^IMAGE4FILE: \\SOFTWARE\\/s|uefi.bin|fip.bin |' ${PRIMAR=
Y_DIR}/MB/HBI0316A/images.txt
+
     # Slave/Secondary
     cp -av ${RECIPE_SYSROOT}/${FIRMWARE_DIR}/* ${SECONDARY_DIR}
     mkdir -p ${SECONDARY_DIR}/SOFTWARE/
--=20
2.25.1


