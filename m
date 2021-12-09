Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FBFC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 13:20:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11255.1639056035982616055
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4487011B3
	for <meta-arm@lists.yoctoproject.org>; Thu,  9 Dec 2021 05:20:34 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3ECC3F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu,  9 Dec 2021 05:20:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/scp-firmware: add comment to explain where a UUID
 is defined
Date: Thu,  9 Dec 2021 13:20:31 +0000
Message-Id: <20211209132031.902428-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209132031.902428-1-ross.burton@arm.com>
References: <20211209132031.902428-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 13:20:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2578

The N1SDP build uses a non-standard FIP UUID, so explain where it comes
from.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index a1e2af61..0352539a 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -15,6 +15,7 @@ do_install:append() {
        --soc-fw "${RECIPE_SYSROOT}/firmware/bl31.bin" \
        "scp_fw.bin"
=20
+   # This UUID is FIP_UUID_MCP_BL2 in SCP-Firmware.
    fiptool \
        create \
        --blob uuid=3D54464222-a4cf-4bf8-b1b6-cee7dade539e,file=3D"${D}/f=
irmware/mcp_ramfw.bin" \
--=20
2.25.1


