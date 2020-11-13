Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7190.1605286120967770217
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 08:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DE6814BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2020 08:48:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE1283F718
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2020 08:48:39 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] gem5/gem5-aarch64-native: bump to 20.0.0.3
Date: Fri, 13 Nov 2020 16:48:36 +0000
Message-Id: <20201113164836.3926050-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113164836.3926050-1-ross.burton@arm.com>
References: <20201113164836.3926050-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Minor point release, that successfully compiles with GCC 9.3.

Change-Id: I22bec41f92ea4ae6e9fb7b6e6706338c0134bf99
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/=
meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
index 101e6ef..ce36514 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
@@ -8,8 +8,8 @@ SRC_URI =3D "git://gem5.googlesource.com/public/gem5;prot=
ocol=3Dhttps;nobranch=3D1 \
            file://0002-arch-arm-Introduce-HavePACExt-helper.patch \
            file://0003-arch-arm-Check-if-PAC-is-implemented-before-execu=
ting-insts.patch \
           "
-RELEASE_TAG =3D "v20.0.0.1"
-SRCREV =3D "332a9de33db603e0aefedae1e05134db4257ea3e"
+RELEASE_TAG =3D "v20.0.0.3"
+SRCREV =3D "fa70478413e4650d0058cbfe81fd5ce362101994"
=20
 PV =3D "${RELEASE_TAG}"
=20
--=20
2.25.1

