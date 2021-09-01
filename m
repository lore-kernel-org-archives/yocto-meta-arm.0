Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9090.1630506924728798449
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Sep 2021 07:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F9511FB;
	Wed,  1 Sep 2021 07:35:21 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.92.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D73C3F766;
	Wed,  1 Sep 2021 07:35:20 -0700 (PDT)
From: "Peter Hoyes" <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-bsp/docs: fvp-baser-aemv8r64 change log fixes
Date: Wed,  1 Sep 2021 15:35:09 +0100
Message-Id: <20210901143509.1513331-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Hoyes <Peter.Hoyes@arm.com>

 * change Changelog to Change Log.
 * change armv8r64 to Armv8-R64.
 * ensure all log entries have a period.
 * change the order of the entires to highlight key release features.

Issue-Id: SCM-2987
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Id77ec01c455ac8954a965af8659421cc485e4778
---
 meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index c2db101..ca01a14 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -190,16 +190,16 @@ Known Issues and Limitations
 - Linux kernel does not support booting from secure EL2 on Armv8-R AArch=
64
 - Linux KVM does not support Armv8-R AArch64
=20
-Changelog
----------
+Change Log
+----------
=20
-- Added support for file sharing with the host machine using Virtio P9
-- Added support for runfvp
-- Added performance event support (PMU) in the Linux device tree
 - Enabled SMP support via boot-wrapper-aarch64 providing the PSCI CPU_ON=
 and
   CPU_OFF functions.
-- Introduced armv8r64 compiler flags.
+- Introduced Armv8-R64 compiler flags.
 - Added Linux PREEMPT\_RT support via linux-yocto-rt-5.10.
+- Added support for file sharing with the host machine using Virtio P9.
+- Added support for runfvp.
+- Added performance event support (PMU) in the Linux device tree.
 - Introduced the fvp-baser-aemv8r64 machine and its BSP composed of
   boot-wrapper-aarch64 and linux-yocto-5.10 supporting serial, virtio di=
sk,
   virtio network, watchdog and rtc.
--=20
2.25.1

