Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED76C77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:52:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7044.1681995157473125792
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 05:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFE091042;
	Thu, 20 Apr 2023 05:53:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69CF53F587;
	Thu, 20 Apr 2023 05:52:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/6] arm/trusted-firmware-m: package .elf files in PN-dbg
Date: Thu, 20 Apr 2023 13:52:30 +0100
Message-Id: <20230420125233.1918925-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420125233.1918925-1-ross.burton@arm.com>
References: <20230420125233.1918925-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 12:52:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4595

Some platforms install .elf files, so put those into the -dbg package.
This means expanding the buildpaths QA exclusion.

Whilst here, expand the comments for the other INSANE_SKIP statements.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 09efaffa..d0744423 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -106,11 +106,16 @@ do_install() {
=20
 FILES:${PN} =3D "/firmware"
 SYSROOT_DIRS +=3D "/firmware"
+FILES:${PN}-dbg =3D "/firmware/*.elf"
=20
 addtask deploy after do_install
 do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
 }
=20
-# Build paths are currently embedded
+# Build paths are currently embedded because it's impossible to pass -fd=
ebug-prefix-map
 INSANE_SKIP:${PN} +=3D "buildpaths"
+INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
+# Target binaries will be 32-bit Arm
+INSANE_SKIP:${PN} +=3D "arch"
+INSANE_SKIP:${PN}-dbg +=3D "arch"
--=20
2.34.1


