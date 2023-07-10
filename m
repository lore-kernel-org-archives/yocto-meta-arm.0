Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5927AEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 13:09:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38982.1688994559855036636
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 06:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A06512B;
	Mon, 10 Jul 2023 06:10:01 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E57BE3F67D;
	Mon, 10 Jul 2023 06:09:18 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/5] arm/scp-firmware: set default SCP_PLATFORM to MACHINE
Date: Mon, 10 Jul 2023 14:09:12 +0100
Message-Id: <20230710130916.3414041-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Jul 2023 13:09:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4871

From: Ross Burton <ross.burton@arm.com>

Many platform names are the same as the machine name, so this saves
some typing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
index 2be5b307..2ab7f306 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
@@ -15,7 +15,7 @@ SRCREV  =3D "0c7236b1851d90124210a0414fd982dc55322c7c"
 PROVIDES +=3D "virtual/control-processor-firmware"
=20
 CMAKE_BUILD_TYPE    ?=3D "RelWithDebInfo"
-SCP_PLATFORM        ?=3D "invalid"
+SCP_PLATFORM        ?=3D "${MACHINE}"
 SCP_COMPILER        ?=3D "arm-none-eabi"
 SCP_LOG_LEVEL       ?=3D "WARN"
 SCP_PLATFORM_FEATURE_SET ?=3D "0"
--=20
2.34.1


