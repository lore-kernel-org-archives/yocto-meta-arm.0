Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1025.1620748930011450523
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 May 2021 09:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D227D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 May 2021 09:02:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB28F3F719
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 May 2021 09:02:07 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-a: put .elf output into trusted-firmware-a-dbg
Date: Tue, 11 May 2021 17:02:02 +0100
Message-Id: <20210511160203.1116699-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The .elf output files are for debugging purposes, so put them into the
-dbg package to make this clear.

Change-Id: I5d70b2421b06eed0483f8ef508cf535ec70abc63
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 807e125..67a5cd3 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -223,8 +223,10 @@ do_install() {
=20
 FILES_${PN} =3D "/firmware"
 SYSROOT_DIRS +=3D "/firmware"
+
+FILES_${PN}-dbg =3D "/firmware/*.elf"
 # Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP_${PN} =3D "textrel"
+INSANE_SKIP_${PN}-dbg =3D "textrel"
=20
 do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
--=20
2.25.1

