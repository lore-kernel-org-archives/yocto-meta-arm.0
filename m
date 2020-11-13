Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7015.1605286120817726463
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 08:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDD3E1042
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2020 08:48:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6776B3F718
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2020 08:48:39 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] gem5/gem5-aarch64-native: don't specify -j twice
Date: Fri, 13 Nov 2020 16:48:35 +0000
Message-Id: <20201113164836.3926050-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There's no need to pass -j here as the scons clas does this already.

Also, BB_NUMBER_THREADS is the number of BitBake threads, not the number
of parallel make jobs.

Change-Id: Ib6179bf05c5ec57b7cbe9c045f7bea86518d35af
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gem5/recipes-devtools/gem5/gem5-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/=
recipes-devtools/gem5/gem5-native.inc
index 1df94d0..3c891ba 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
@@ -10,7 +10,7 @@ LICENSE =3D "BSD & MIT & LGPLv2.1"
 GEM5_BUILD_CONFIGS ?=3D "build/X86/gem5.opt"
=20
 # Scons build arguments
-GEM5_SCONS_ARGS ?=3D "-j ${BB_NUMBER_THREADS} CC=3D${BUILD_CC} CXX=3D${B=
UILD_CXX} \
+GEM5_SCONS_ARGS ?=3D "CC=3D${BUILD_CC} CXX=3D${BUILD_CXX} \
     AS=3D${BUILD_AS} AR=3D${BUILD_AR} ${GEM5_BUILD_CONFIGS} \
     PYTHON_CONFIG=3Dpython3-config"
=20
--=20
2.25.1

