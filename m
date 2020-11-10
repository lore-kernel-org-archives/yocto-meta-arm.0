Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29550.1605023542521189487
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 07:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF97B142F
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 07:52:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BF233F718
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Nov 2020 07:52:21 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/6] arm-bsp/linux-stable: move corstone700 tweaks to versioned bbappend
Date: Tue, 10 Nov 2020 15:52:13 +0000
Message-Id: <20201110155216.1313151-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110155216.1313151-1-ross.burton@arm.com>
References: <20201110155216.1313151-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The corstone700-specific tweaks should be applied to just the 5.6
version of the linux-stable recipe, not all of them.  By appending all
of the versions they *all* become 5.6.14, which makes it impossible to
know what recipe is actually being used.

Change-Id: I77ccc1f16003fea7b6356732587c6947b20a2f4c
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend | 8 --------
 .../recipes-kernel/linux/linux-stable_5.6%.bbappend       | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.b=
bappend

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend b/=
meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
index e4b2c11..db850ea 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
@@ -1,11 +1,3 @@
 # Add support for Arm Platforms (boards or simulators)
=20
 require linux-arm-platforms.inc
-
-#
-# Corstone700 KMACHINE
-#
-MACHINE_KERNEL_REQUIRE ?=3D ""
-MACHINE_KERNEL_REQUIRE_corstone700 =3D "linux-stable-corstone700.inc"
-
-require ${MACHINE_KERNEL_REQUIRE}
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend=
 b/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend
new file mode 100644
index 0000000..3793fad
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend
@@ -0,0 +1,7 @@
+#
+# Corstone700 KMACHINE
+#
+MACHINE_KERNEL_REQUIRE ?=3D ""
+MACHINE_KERNEL_REQUIRE_corstone700 =3D "linux-stable-corstone700.inc"
+
+require ${MACHINE_KERNEL_REQUIRE}
--=20
2.25.1

