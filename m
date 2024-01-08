Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939D2C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 16:32:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21326.1704817955565684470
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 08:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6112DA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jan 2024 08:33:20 -0800 (PST)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F15A3F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Jan 2024 08:32:35 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/scp-firmware: update git repository to new location
Date: Mon,  8 Jan 2024 15:19:11 -0600
Message-Id: <20240108211911.29422-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Jan 2024 16:32:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5326

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb
index 7ca78f3c..18867b03 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.13.0.bb
@@ -1,17 +1,17 @@
 SUMMARY =3D "SCP and MCP Firmware"
 DESCRIPTION =3D "Firmware for SCP and MCP software reference implementat=
ion"
-HOMEPAGE =3D "https://github.com/ARM-software/SCP-firmware"
+HOMEPAGE =3D "https://gitlab.arm.com/firmware/SCP-firmware"
=20
 LICENSE =3D "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d=
9300a6c3d15101b19731 \
                     file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
=20
-SRC_URI_SCP_FIRMWARE ?=3D "gitsm://github.com/ARM-software/SCP-firmware.=
git;protocol=3Dhttps"
+SRC_URI_SCP_FIRMWARE ?=3D "gitsm://git.gitlab.arm.com/firmware/SCP-firmw=
are.git;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRANCH} \
            file://0001-OPTEE-Private-Includes.patch \
           "
=20
-SRCBRANCH =3D "master"
+SRCBRANCH =3D "main"
 SRCREV  =3D "cc4c9e017348d92054f74026ee1beb081403c168"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
--=20
2.30.2


