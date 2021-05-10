Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1300.1620670599444841198
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 May 2021 11:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC33F1688
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 11:16:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6713E3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 May 2021 11:16:38 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-toolchain/external-arm-toolchain: inhibit build dependencies
Date: Mon, 10 May 2021 19:16:33 +0100
Message-Id: <20210510181635.3252727-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These recipes don't build anything, so there's no need to depend on a
toolchain.

Change-Id: I49b641fb54839c30255a11a7c9d5798c8e4afd2a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc             | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
rm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-ar=
m-toolchain/arm-binary-toolchain.inc
index 2fbabfb..046ab62 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-bina=
ry-toolchain.inc
@@ -1,3 +1,5 @@
+INHIBIT_DEFAULT_DEPS =3D "1"
+
 FILES_${PN} =3D "${datadir} ${bindir}"
=20
 BINNAME =3D "${@d.getVar("BPN").strip("gcc-")}"
--=20
2.25.1

