Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FF5C4321E
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:11:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1814.1645114281111818700
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 08:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8B581396;
	Thu, 17 Feb 2022 08:11:20 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.87.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E30C03F718;
	Thu, 17 Feb 2022 08:11:19 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 6/6] arm-bsp/docs: Update fvp-baser-aemv8r64 docs
Date: Thu, 17 Feb 2022 16:09:59 +0000
Message-Id: <20220217160959.4157807-7-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217160959.4157807-1-peter.hoyes@arm.com>
References: <20220217160959.4157807-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 16:11:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3021

From: Peter Hoyes <Peter.Hoyes@arm.com>

Document U-Boot addition, add new architecture section and update the
change log.

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ie0e1ff35ade634f2b523c14bb058c9d775802632
---
 .../documentation/fvp-baser-aemv8r64.md       | 65 ++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index fdf5038..1c723d9 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -28,12 +28,65 @@ where either a standard or Real-Time Linux kernel (PR=
EEMPT\_RT) can be built
 and run:
=20
  - boot-wrapper-aarch64: provides PSCI support
- - Linux kernel: linux-yocto-5.14
- - Linux kernel with PREEMPT\_RT support: linux-yocto-rt-5.14
+ - U-Boot: v2022.01 - provides UEFI services
+ - Linux kernel: linux-yocto-5.15
+ - Linux kernel with PREEMPT\_RT support: linux-yocto-rt-5.15
=20
 Note that the Real-Time Linux kernel (PREEMPT\_RT) does not use the real=
-time
 architectural extensions of the Armv8-R feature set.
=20
+High-Level Architecture
+-----------------------
+
+The diagram below shows the current boot flow:
+
+    +---------------------------------------------------------------+
+    |                         Linux kernel                          |
+    +---------------------------------------------------------------+
+               /|\                                     /|\
+                |                                       |
+                | UEFI services                         |
+                |                         PSCI services |
+               \|/                                      |
+        +----------------+                              |     S-EL1
+    ----|     U-Boot     |------------------------------|-----------
+        +----------------+                              |     S-EL2
+               /|\                                      |
+                |                                       |
+                |                                       |
+                |                                       |
+    +--------------------------------------------------\|/----------+
+    |                        +----------------+ +----------------+  |
+    |  boot-wrapper-aarch64  |  Device tree   | |  PSCI handler  |  |
+    |                        +----------------+ +----------------+  |
+    +---------------------------------------------------------------+
+
+
+The firmware binary (generated as `linux-system.axf`) includes
+boot-wrapper-aarch64, the flattened device tree and U-Boot. U-Boot is co=
nfigured
+to automatically detect a virtio block device and boot the UEFI payload =
at the
+path `/efi/boot/bootaa64.efi`. Using the standard build, the first parti=
tion
+contains a Grub image at this path, which boots the Linux kernel at `/Im=
age` on
+the same partition. The second partition of the image contains the Linux=
 root
+file system.
+
+There is no EL3 or non-secure world in the Armv8-R AArch64 architecture,=
 so the
+reset vector starts boot-wrapper-aarch64 at S-EL2. Boot-wrapper-aarch64 =
is
+compiled with the `--enable-keep-el` flag, which causes it to boot U-Boo=
t at
+S-EL2 too. U-Boot is compiled with the `CONFIG_ARMV8_SWITCH_TO_EL1` flag=
, which
+causes it to switch to S-EL1 before booting Linux.
+
+The bundled device tree is passed to U-Boot via register x0. U-Boot pass=
es the
+same device tree to Linux via the UEFI system table.
+
+Power state management is provided by PSCI services in boot-wrapper-aarc=
h64.
+Linux accesses the PSCI handler via HVC calls to S-EL2. U-Boot has been =
patched
+to prevent it from overriding the exception vector at S-EL2. The PSCI ha=
ndler
+memory region is added to a `/memreserve/` node in the device tree.
+
+Please note that the final firmware architecture for the fvp-baser-aemv8=
r64 is
+not yet stabilized. The patches in this layer are provided for developme=
nt and
+evaluation purposes only, and should not be used in production firmware.
=20
 Quick start: Howto Build and Run
 --------------------------------
@@ -167,6 +220,14 @@ Known Issues and Limitations
 Change Log
 ----------
=20
+- Added U-Boot v2022.01 for UEFI support.
+- Updated Linux kernel version from 5.14 to 5.15 for both standard and
+  Real-Time (PREEMPT\_RT) builds.
+- Updated boot-wrapper-aarch64 revision and added support for booting U-=
Boot.
+- Included boot-wrapper-aarch64 PSCI services in /memreserve/ region.
+- Fixed the counter frequency initialization in boot-wrapper-aarch64.
+- Configured the FVP to use the default RAM size of 4 Gb
+- Fixed PL011 and SP805 register sizes in the device tree.
 - Added virtio_net User Networking mode by default and removed instructi=
ons
   about tap networking setup.
 - Updated Linux kernel version from 5.10 to 5.14 for both standard and
--=20
2.25.1


