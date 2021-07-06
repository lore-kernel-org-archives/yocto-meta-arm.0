Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8077.1625586196358666107
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 08:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06AE0106F
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jul 2021 08:43:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A59DA3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue,  6 Jul 2021 08:43:15 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] README: update
Date: Tue,  6 Jul 2021 16:43:12 +0100
Message-Id: <20210706154312.3645426-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Ia28bbbbe07108cd8442a93b50cee8b647c03643b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 README.md | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/README.md b/README.md
index 0546642..3bb59e1 100644
--- a/README.md
+++ b/README.md
@@ -1,23 +1,30 @@
 Introduction
 ------------
-This repository contains Arm layers for OpenEmbedded
+This repository contains the Arm layers for OpenEmbedded.
=20
-meta-arm:
-	This layer provides support for general recipes for the Arm
-	architecture.  Anything that's not needed explicitly for BSPs, the IOTA
-	distribution, or destined to be upstreamed belongs here.
+* meta-arm
=20
-meta-arm-bsp:
-	This layer provides support for Arm reference platforms
+  This layer contains general recipes for the Arm architecture, such as =
firmware, FVPs, and Arm-specific integration.
=20
-meta-arm-iota:
-	This layer provides support for Arm's IOTA Linux Distribution
+* meta-arm-bsp
=20
-meta-arm-toolchain:
-	This layer provides support for Arm's GNU-A toolset releases
+  This layer contains machines for Arm reference platforms, for example =
FVP Base, N1SDP, and Juno.
=20
-meta-arm-autonomy:
-    This layer provides a reference stack for autonomous systems.
+* meta-arm-toolchain
+
+  This layer contains recipes for Arm's binary toolchains (GCC and Clang=
 for -A and -M), and a recipe to build Arm's GCC.
+
+* meta-arm-autonomy
+
+  This layer is the distribution for a reference stack for autonomous sy=
stems.
+
+* meta-gem5
+
+  This layer contains recipes and machines for gem5, a system-level and =
processor simulator.
+
+* meta-atp
+
+  This layer contains recipes for the Adaptive Traffic Generation integr=
ation into meta-gem5.
=20
 Contributing
 ------------
--=20
2.25.1

