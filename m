Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CAEC001DE
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 13:09:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39147.1688994561111805486
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 06:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 010302B;
	Mon, 10 Jul 2023 06:10:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 472A33F67D;
	Mon, 10 Jul 2023 06:09:20 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/5] arm/scp-firware: update compiler variables
Date: Mon, 10 Jul 2023 14:09:14 +0100
Message-Id: <20230710130916.3414041-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710130916.3414041-1-ross.burton@arm.com>
References: <20230710130916.3414041-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Jul 2023 13:09:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4873

From: Ross Burton <ross.burton@arm.com>

SCP_COMPILER isn't used anymore, so remove it.

Explicitly set SCP_TOOLCHAIN=3DGNU for clarity.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
index 2ab7f306..ebb3197e 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.12.0.bb
@@ -16,7 +16,6 @@ PROVIDES +=3D "virtual/control-processor-firmware"
=20
 CMAKE_BUILD_TYPE    ?=3D "RelWithDebInfo"
 SCP_PLATFORM        ?=3D "${MACHINE}"
-SCP_COMPILER        ?=3D "arm-none-eabi"
 SCP_LOG_LEVEL       ?=3D "WARN"
 SCP_PLATFORM_FEATURE_SET ?=3D "0"
=20
@@ -53,6 +52,7 @@ EXTRA_OECMAKE =3D "-D CMAKE_BUILD_TYPE=3D${CMAKE_BUILD_=
TYPE} \
                  -D SCP_LOG_LEVEL=3D${SCP_LOG_LEVEL} \
                  -D SCP_PLATFORM_FEATURE_SET=3D${SCP_PLATFORM_FEATURE_SE=
T} \
                  -D DISABLE_CPPCHECK=3D1 \
+                 -D SCP_TOOLCHAIN=3DGNU \
                 "
=20
 do_configure() {
--=20
2.34.1


