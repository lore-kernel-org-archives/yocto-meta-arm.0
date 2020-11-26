Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5221.1606399415667295472
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Nov 2020 06:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28BBA31B
	for <meta-arm@lists.yoctoproject.org>; Thu, 26 Nov 2020 06:03:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C41F53F71F
	for <meta-arm@lists.yoctoproject.org>; Thu, 26 Nov 2020 06:03:34 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/boot-firmware: update boot-firmware recipe to latest hash
Date: Thu, 26 Nov 2020 14:03:30 +0000
Message-Id: <20201126140330.4112238-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Satish Kumar <satish.kumar01@arm.com>

The recipe now points to the folowing commit.
commit hash : af7eeb1bb8c5a85a5e5a76d48acc6fe864d715a9

Change-Id: I73313597ddee117d92351d6daa1f7bae0b5edb82
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb =
b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
index cd8ae3d..c7242d1 100644
--- a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
+++ b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6=
ffe9dece394dbe988d9a0 \
                     file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4=
b21ef20c29e"
=20
 SRC_URI =3D "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmw=
are.git;protocol=3Dhttps"
-# This is two commits on from CORSTONE-700-2020.02.10
-SRCREV =3D "a4dd1b60218b5172a94e6f44c96384b84a77588c"
+SRCREV =3D "af7eeb1bb8c5a85a5e5a76d48acc6fe864d715a9"
 PV =3D "2020.02.10+git${SRCPV}"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
--=20
2.25.1

