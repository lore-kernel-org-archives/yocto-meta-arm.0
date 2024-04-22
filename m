Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB01AC4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:37:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18718.1713793063694118815
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 06:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 887CF1063;
	Mon, 22 Apr 2024 06:38:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF0FF3F73F;
	Mon, 22 Apr 2024 06:37:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/6] arm-bsp/linux-yocto-rt: include linux-arm-platforms unconditionally
Date: Mon, 22 Apr 2024 13:37:34 +0000
Message-Id: <20240422133739.190536-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 13:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5578

Every platform should have the chance to try the -rt patches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend =
b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
index b1efabf3..db850eab 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_%.bbappend
@@ -1,5 +1,3 @@
-# Only enable linux-yocto-rt for n1sdp and the Armv8-R AArch64 AEM FVP
-LINUX_YOCTO_RT_REQUIRE ?=3D ""
-LINUX_YOCTO_RT_REQUIRE:n1sdp =3D "linux-arm-platforms.inc"
+# Add support for Arm Platforms (boards or simulators)
=20
-require ${LINUX_YOCTO_RT_REQUIRE}
+require linux-arm-platforms.inc
--=20
2.34.1


