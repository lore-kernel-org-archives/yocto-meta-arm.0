Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8716.1608024043458525561
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 01:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC73C113E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F8043F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:38 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] arm/trusted-firmware-a: add upstream tag regex
Date: Tue, 15 Dec 2020 09:20:28 +0000
Message-Id: <20201215092030.2723188-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215092030.2723188-1-ross.burton@arm.com>
References: <20201215092030.2723188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So that the automatic latest upstream release detection works correctly,
specify what release tags look like.

Change-Id: Ie53e82fffe5392d8e6f8d530d9f4ed732f03b50f
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index d37c470..be34916 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -8,6 +8,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 inherit deploy
=20
 SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa"
+UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
 COMPATIBLE_MACHINE_qemuarm64 ?=3D "qemuarm64"
--=20
2.25.1

