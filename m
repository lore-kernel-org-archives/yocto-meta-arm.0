Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81B0C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 11:24:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8985.1645701850249991651
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 03:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC947106F;
	Thu, 24 Feb 2022 03:24:09 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5221F3F70D;
	Thu, 24 Feb 2022 03:24:09 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH honister 8/8] arm-bsp/docs: Minor fvp-baser-aemv8r64 updates
Date: Thu, 24 Feb 2022 11:22:44 +0000
Message-Id: <20220224112244.1521611-9-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224112244.1521611-1-peter.hoyes@arm.com>
References: <20220224112244.1521611-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Feb 2022 11:24:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3056

From: Peter Hoyes <Peter.Hoyes@arm.com>

 * Add clarification on how to mount p9 device
 * Remove instruction to use ctrl + c to stop FVP
 * Add cache_state_modelled to Known Issues

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I122c5ae5b3ceee1d106205d93a006f75bdbfa2bf
---
 .../documentation/fvp-baser-aemv8r64.md       | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 70256e0..98ede27 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -171,18 +171,11 @@ To run an image after the build is done with the Re=
al-Time Linux kernel
=20
 **Note:** The terminal console login is `root` without password.
=20
-To finish the fvp emulation, you need to close the telnet session and st=
op the
-runfvp script:
-
-1. To close the telnet session:
+To finish the fvp emulation, you need to close the telnet session:
=20
  - Escape to telnet console with ``ctrl+]``.
  - Run ``quit`` to close the session.
=20
-2. To stop the runfvp:
-
- - Type ``ctrl+c`` and wait for kas process to finish.
-
 ### File sharing between host and fvp
 It is possible to share a directory between the host machine and the fvp=
 using
 the virtio P9 device component included in the kernel. To do so, create =
a
@@ -195,6 +188,14 @@ launching the model:
=20
     --parameter 'bp.virtiop9device.root_path=3D/path/to/host-mount-dir'
=20
+e.g. for the standard Linux kernel:
+
+    kas shell --keep-config-unchanged \
+       meta-arm/kas/fvp-baser-aemv8r64-bsp.yml \
+           --command "../layers/meta-arm/scripts/runfvp \
+           --console --parameter
+           'bp.virtiop9device.root_path=3D/path/to/host-mount-dir'"
+
 Once you are logged into the fvp, the host directory can be mounted in a
 directory on the model using the following command:
=20
@@ -216,6 +217,8 @@ Known Issues and Limitations
 - Only PSCI CPU\_ON and CPU\_OFF functions are supported
 - Linux kernel does not support booting from secure EL2 on Armv8-R AArch=
64
 - Linux KVM does not support Armv8-R AArch64
+- Enabling the FVP parameter `cache_state_modelled` is incompatible with=
 virtio
+  devices
=20
 Change Log
 ----------
--=20
2.25.1


