Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.23157.1629723620830348385
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Aug 2021 06:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C1301042;
	Mon, 23 Aug 2021 06:00:19 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.90.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC3543F5A1;
	Mon, 23 Aug 2021 06:00:18 -0700 (PDT)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/3] arm-bsp/docs: Add fvp-baser-aemv8r64 changelog
Date: Mon, 23 Aug 2021 14:00:07 +0100
Message-Id: <20210823130009.189450-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

Issue-Id: SCM-2987
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I1caeb64ab50d54869a9629ac74fcc1399279c41d
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 6fa82d8..970acd6 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -189,3 +189,17 @@ Known Issues and Limitations
 - Only PSCI CPU\_ON and CPU\_OFF functions are supported
 - Booting Linux kernel from Secure EL2 is not supported on Armv8-R AArch=
64
 - Both VHE and non-VHE Linux-KVM are not supported on Armv8-R AArch64
+
+Changelog
+---------
+
+- Added support for file sharing with the host machine using Virtio P9
+- Added support for runfvp
+- Added performance event support (PMU) in the Linux device tree
+- Enabled SMP support via boot-wrapper-aarch64 providing the PSCI CPU_ON=
 and
+  CPU_OFF functions.
+- Introduced armv8r64 compiler flags.
+- Added Linux PREEMPT\_RT support via linux-yocto-rt-5.10.
+- Introduced the fvp-baser-aemv8r64 machine and its BSP composed of
+  boot-wrapper-aarch64 and linux-yocto-5.10 supporting serial, virtio di=
sk,
+  virtio network, watchdog and rtc.
--=20
2.25.1

