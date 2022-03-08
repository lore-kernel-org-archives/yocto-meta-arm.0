Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F4BC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 11:35:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6911.1646739300501093758
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 03:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A12DD6E;
	Tue,  8 Mar 2022 03:35:00 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.90.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D7163FA5D;
	Tue,  8 Mar 2022 03:34:59 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm-bsp/docs: Minor fvp-baser-aemv8r64 fixes
Date: Tue,  8 Mar 2022 11:34:50 +0000
Message-Id: <20220308113450.3801197-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Mar 2022 11:35:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3128

From: Peter Hoyes <Peter.Hoyes@arm.com>

 * Include `--upgrade` in pip3 command to ensure latest kas version is
   installed
 * Ensure all underscores are either quoted or escaped
 * Fix P9 example command

Issue-Id: SCM-3881
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ie460dbd6b1f87f5f9ca2966329341d22da3606d3
---
 .../documentation/fvp-baser-aemv8r64.md        | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index c95e52e..bbdd337 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -100,7 +100,7 @@ https://docs.yoctoproject.org/singleindex.html#requir=
ed-packages-for-the-build-h
 Kas is a setup tool for bitbake based projects. The minimal supported ve=
rsion
 is 3.0, install it like so:
=20
-    pip3 install --user kas
+    pip3 install --user --upgrade kas
=20
 For more details on kas, see https://kas.readthedocs.io/.
=20
@@ -193,7 +193,7 @@ e.g. for the standard Linux kernel:
     kas shell --keep-config-unchanged \
        meta-arm/kas/fvp-baser-aemv8r64-bsp.yml \
            --command "../layers/meta-arm/scripts/runfvp \
-           --console --parameter
+           --console -- --parameter \
            'bp.virtiop9device.root_path=3D/path/to/host-mount-dir'"
=20
 Once you are logged into the fvp, the host directory can be mounted in a
@@ -217,10 +217,10 @@ Known Issues and Limitations
 - Only PSCI CPU\_ON and CPU\_OFF functions are supported
 - Linux kernel does not support booting from secure EL2 on Armv8-R AArch=
64
 - Linux KVM does not support Armv8-R AArch64
-- Device DMA memory cache-coherence issue: the FVP cache_state_modelled
+- Device DMA memory cache-coherence issue: the FVP `cache_state_modelled=
`
   parameter will affect the cache coherence behavior of peripherals=E2=80=
=99 DMA. When
-  users set cache_state_modelled=3D1, they also have to set
-  cci400.force_on_from_start=3D1 to force the FVP to enable snooping on =
upstream
+  users set `cache_state_modelled=3D1`, they also have to set
+  `cci400.force_on_from_start=3D1` to force the FVP to enable snooping o=
n upstream
   ports.
=20
 Change Log
@@ -230,16 +230,16 @@ Change Log
 - Updated Linux kernel version from 5.14 to 5.15 for both standard and
   Real-Time (PREEMPT\_RT) builds.
 - Updated boot-wrapper-aarch64 revision and added support for booting U-=
Boot.
-- Included boot-wrapper-aarch64 PSCI services in /memreserve/ region.
+- Included boot-wrapper-aarch64 PSCI services in `/memreserve/` region.
 - Fixed the counter frequency initialization in boot-wrapper-aarch64.
 - Configured the FVP to use the default RAM size of 4 Gb
 - Fixed PL011 and SP805 register sizes in the device tree.
-- Added virtio_net User Networking mode by default and removed instructi=
ons
+- Added virtio\_net User Networking mode by default and removed instruct=
ions
   about tap networking setup.
 - Updated Linux kernel version from 5.10 to 5.14 for both standard and
   Real-Time (PREEMPT\_RT) builds.
-- Enabled SMP support via boot-wrapper-aarch64 providing the PSCI CPU_ON=
 and
-  CPU_OFF functions.
+- Enabled SMP support via boot-wrapper-aarch64 providing the PSCI CPU\_O=
N and
+  CPU\_OFF functions.
 - Introduced Armv8-R64 compiler flags.
 - Added Linux PREEMPT\_RT support via linux-yocto-rt-5.10.
 - Added support for file sharing with the host machine using Virtio P9.
--=20
2.25.1


