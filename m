Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D47C77B60
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 16:38:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30539.1680194299721182232
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 09:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85D8B1682;
	Thu, 30 Mar 2023 09:39:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B58103F6C4;
	Thu, 30 Mar 2023 09:38:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/6] arm/scp-firmware: enable verbose builds
Date: Thu, 30 Mar 2023 17:38:12 +0100
Message-Id: <20230330163815.3677638-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330163815.3677638-1-ross.burton@arm.com>
References: <20230330163815.3677638-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 16:38:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4514

We want compile logs to be useful, so enable verbose logs to show what
commands are being invoked.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
index 316de37c..ec5083eb 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
@@ -64,7 +64,7 @@ do_configure[cleandirs] +=3D "${B}"
 do_compile() {
     for FW in ${FW_TARGETS}; do
         for TYPE in ${FW_INSTALL}; do
-            cmake --build ${B}/${TYPE}/${FW} --target all
+            VERBOSE=3D1 cmake --build ${B}/${TYPE}/${FW} --target all
         done
     done
 }
--=20
2.34.1


