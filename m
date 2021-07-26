Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.27062.1627284778509767842
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 00:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: qi.feng@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC1BC106F;
	Mon, 26 Jul 2021 00:32:47 -0700 (PDT)
Received: from fengqi-OptiPlex-7070.shanghai.arm.com (fengqi-OptiPlex-7070.shanghai.arm.com [10.169.188.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 612053F66F;
	Mon, 26 Jul 2021 00:32:45 -0700 (PDT)
From: qi.feng@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	wei.chen@arm.com,
	robbie.cao@arm.com,
	jaxson.han@arm.com,
	nd@arm.com,
	Qi Feng <qi.feng@arm.com>
Subject: [PATCH] arm-bsp/linux: Add PMU support to fvp-baser-aemv8r64
Date: Mon, 26 Jul 2021 15:32:35 +0800
Message-Id: <20210726073235.173496-1-qi.feng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Set Shared Peripheral Interrupts (SPIs) for PMUIRQ so that profiling
tools (such as perf) can use PMU events.

Issue-Id: SCM-3164
Signed-off-by: Qi Feng <qi.feng@arm.com>
Change-Id: Idcfee3f33d9f9e15578405dd39be4f434f3faa06
---
 .../linux/files/fvp-baser-aemv8r64/fvp-baser-aemv8r64.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/f=
vp-baser-aemv8r64.dts b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser=
-aemv8r64/fvp-baser-aemv8r64.dts
index f70b484..3e552f8 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-baser-aemv8r64/fvp-base=
r-aemv8r64.dts
@@ -185,6 +185,14 @@
                 serial3 =3D "/uart@9c0c0000";
         };
=20
+        pmu {
+                compatible =3D "arm,armv8-pmuv3";
+                interrupts =3D <0 60 4>,
+                             <0 61 4>,
+                             <0 62 4>,
+                             <0 63 4>;
+        };
+
         chosen {
                 bootargs =3D "earlycon console=3DttyAMA0 loglevel=3D8 ro=
otfstype=3Dext4 root=3D/dev/vda1 rw";
                 stdout-path =3D "serial0";
--=20
2.25.1

