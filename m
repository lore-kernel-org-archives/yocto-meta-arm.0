Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5971.1619516799330359094
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 02:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76FDBD6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Apr 2021 02:46:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DB253F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 27 Apr 2021 02:46:37 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/tc0-artifacts-image: restrict to TC0
Date: Tue, 27 Apr 2021 10:46:32 +0100
Message-Id: <20210427094632.581577-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This recipe is for TC0, so set COMPATIBLE_MACHINE appropriately.

This is both logically correct, and fixes a Yocto Compatible test failure
where tc0-artifacts-image isn't buildable for arbitrary machines.

Change-Id: I6381fc08076d4ddea254f7efc84f90c4a7f65d26
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb b/met=
a-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb
index 43c1eda..b2ad356 100644
--- a/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/tc0-artifacts-image.bb
@@ -6,6 +6,8 @@ SUMMARY =3D "Total Compute Images"
 DESCRIPTION =3D "Build all the images required for Total Compute platfor=
m"
 LICENSE =3D "Apache-2.0"
=20
+COMPATIBLE_MACHINE =3D "tc0"
+
 inherit nopackages
=20
 # The last image to be built is trusted-firmware-a
--=20
2.25.1

