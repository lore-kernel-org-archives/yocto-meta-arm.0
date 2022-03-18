Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F22C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 11:11:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8488.1647601910848560563
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 04:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B901C16F2
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 04:11:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 654173F7F5
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 04:11:49 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/scp-firmware: correctly set version in TC append
Date: Fri, 18 Mar 2022 11:11:47 +0000
Message-Id: <20220318111147.417622-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 11:11:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3183

Set PV to 2.9.0+git instead of 2.9+git so the version comparisons are
reliable.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc b/=
meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
index 7b304322..08bdfb28 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
@@ -3,7 +3,7 @@
 # Intermediate SHA with 2.9 baseline version
 # This has support for SCP features MPMM/POWER/PERFORMANCE for TC0
 SRCREV =3D "027b567fde5e3767fb1678bda28cf59fa7aac06d"
-PV =3D "2.9+git${SRCPV}"
+PV =3D "2.9.0+git${SRCPV}"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/tc:"
 SRC_URI:append:tc =3D " \
--=20
2.25.1


