Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8403C77B6E
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 16:38:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30540.1680194300207057631
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 09:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BB082F4;
	Thu, 30 Mar 2023 09:39:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AB013F6C4;
	Thu, 30 Mar 2023 09:38:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/6] arm/scp-firmware: remove textrel from INSANE_SKIP
Date: Thu, 30 Mar 2023 17:38:13 +0100
Message-Id: <20230330163815.3677638-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330163815.3677638-1-ross.burton@arm.com>
References: <20230330163815.3677638-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 16:38:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4515

The text relocations appear to have been fixed and this skip is no
longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
index ec5083eb..a1662d58 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
@@ -98,8 +98,8 @@ FILES:${PN} =3D "/firmware"
 SYSROOT_DIRS +=3D "/firmware"
=20
 FILES:${PN}-dbg +=3D "/firmware/*.elf"
-# Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP:${PN}-dbg =3D "arch textrel"
+# These binaries are specifically for 32-bit arm
+INSANE_SKIP:${PN}-dbg +=3D "arch"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
 INHIBIT_PACKAGE_STRIP =3D "1"
=20
--=20
2.34.1


