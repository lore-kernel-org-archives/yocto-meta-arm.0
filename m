Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9670.1617702280222366596
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 02:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B7691FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Apr 2021 02:44:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35F743F694
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Apr 2021 02:44:39 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] arm/sbsa-acs: add COMPATIBLE_HOST
Date: Tue,  6 Apr 2021 10:44:37 +0100
Message-Id: <20210406094437.2659467-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This recipe is only valid on aarch64 targets, so set COMPATIBLE_HOST.

Change-Id: I15595d307d1dab18b315b397a0751eaf4e109e68
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb b/meta-arm/re=
cipes-test/sbsa-acs/sbsa-acs_3.0.bb
index 6b0fbf4..c9da585 100644
--- a/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
+++ b/meta-arm/recipes-test/sbsa-acs/sbsa-acs_3.0.bb
@@ -12,6 +12,7 @@ SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;de=
stsuffix=3Dedk2/ShellPkg/Appl
 SRCREV_acs =3D "1b3a37214fe6809e07e471f79d1ef856461bc803"
 SRCREV_libc =3D "61687168fe02ac4d933a36c9145fdd242ac424d1"
=20
+COMPATIBLE_HOST =3D "aarch64.*-linux"
 EDK2_ARCH =3D "AARCH64"
 EDK2_PLATFORM =3D "Shell"
 EDK2_PLATFORM_DSC =3D "ShellPkg/ShellPkg.dsc"
--=20
2.25.1

