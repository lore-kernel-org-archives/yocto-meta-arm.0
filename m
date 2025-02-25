Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE360C18E7C
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:18:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10490.1740496699460739787
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 07:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73B122923
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:35 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 18BC53F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:19 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] arm/trusted-firmware-rmm: update to 0.6.0
Date: Tue, 25 Feb 2025 10:18:16 -0500
Message-Id: <20250225151817.11875-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250225151817.11875-1-jon.mason@arm.com>
References: <20250225151817.11875-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 15:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6390

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-firmware-rmm_0.5.0.bb =3D> trusted-firmware-rmm_0.6.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-rmm/{trusted-firmware-rmm_0=
.5.0.bb =3D> trusted-firmware-rmm_0.6.0.bb} (93%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-r=
mm_0.5.0.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-=
rmm_0.6.0.bb
similarity index 93%
rename from meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rm=
m_0.5.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_=
0.6.0.bb
index b65b9eb2a766..d69b4e249ff6 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.5.=
0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.=
0.bb
@@ -2,10 +2,8 @@ SUMMARY =3D "RMM Firmware"
 DESCRIPTION =3D "RMM Firmware for Arm reference platforms"
 LICENSE =3D "BSD-3-Clause & MIT"
=20
-SRC_URI =3D "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=3D=
https;branch=3Dmain \
-          "
-
-SRCREV =3D "6184a730bd4bc80d59eeff7f0752f8423500202c"
+SRC_URI =3D "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=3D=
https;branch=3Dmain"
+SRCREV =3D "7f6bc132caef3596fbb88d3a419c2a3cb499cde2"
 UPSTREAM_CHECK_GITTAGREGEX =3D "^tf-rmm-v(?P<pver>\d+(\.\d+)+)$"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/about/license.rst;md5=3D1375c7c641558=
198ffe401c2a799d79b"
--=20
2.39.5 (Apple Git-154)


