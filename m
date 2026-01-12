Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F52CF45CB
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 19:05:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40733.1768244698561424452
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 11:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50046497
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 11:04:51 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E642B3F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 11:04:57 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-a: add v2.14.0 support
Date: Mon, 12 Jan 2026 14:04:56 -0500
Message-ID: <20260112190457.93847-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 19:05:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6838

Add support for v2.14.0, and update corstone1000 config and patches to
use it.  TF-A seems to have changed their poetry settings from POETRY to
host-poetry (when specifying an alternative location/disabling).  So, it
is necessary to modify that for all platforms using COT and v2.14.0

NOTE: sbsa-ref is having issues with fip.bin being too large.  So, set
the version to the LTS until that is resolved.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  4 +-
 meta-arm-bsp/conf/machine/sbsa-ref.conf       |  4 ++
 .../parselogs-ignores-corstone1000-fvp.txt    |  1 +
 ...01-Fix-FF-A-version-in-SPMC-manifest.patch |  2 +-
 ...corstone1000-add-Cortex-A320-support.patch | 30 ++++-------
 ...-requirement-tests-for-Corstone-1000.patch | 33 ------------
 ...orstone1000-Add-Cortex-A320-support.patch} | 52 ++++++++-----------
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |  6 +--
 .../trusted-firmware-a-corstone1000.inc       |  2 +-
 .../trusted-firmware-a-fvp-base.inc           |  2 +-
 .../trusted-firmware-a/cot-dt2c_0.1.0.bb      |  6 +--
 ...re-enable-console-by-default-in-BL31.patch | 46 ----------------
 ...quire-the-GICC-frame-to-be-defined-o.patch | 45 ----------------
 ...ive_2.13.0.bb =3D> fiptool-native_2.14.0.bb} |  6 +--
 ...a-tests_2.13.0.bb =3D> tf-a-tests_2.14.0.bb} |  2 +-
 .../trusted-firmware-a/trusted-firmware-a.inc |  2 +-
 .../trusted-firmware-a_2.13.0.bb              | 20 -------
 .../trusted-firmware-a_2.14.0.bb              | 16 ++++++
 .../trusted-firmware-a_git.bb                 | 10 ++--
 19 files changed, 73 insertions(+), 216 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/tf-a-tests/0001-fix-exclude-Boot-requirement-tests-for-Corstone=
-1000.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf=
-a-tests/{0002-plat-corstone1000-Add-Cortex-A320-support.patch =3D> 0001-=
plat-corstone1000-Add-Cortex-A320-support.patch} (79%)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fi=
x-arm-re-enable-console-by-default-in-BL31.patch
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0002-fi=
x-css-don-t-require-the-GICC-frame-to-be-defined-o.patch
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.13.0.bb=
 =3D> fiptool-native_2.14.0.bb} (85%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.13.0.bb =3D=
> tf-a-tests_2.14.0.bb} (96%)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.13.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.14.0.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 25a330def46e..e3c726e5f15a 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -9,8 +9,8 @@ PREFERRED_VERSION_trusted-firmware-m ?=3D "2.2.%"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.13.%"
-PREFERRED_VERSION_tf-a-tests ?=3D "2.13.%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.14.%"
+PREFERRED_VERSION_tf-a-tests ?=3D "2.14.%"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
diff --git a/meta-arm-bsp/conf/machine/sbsa-ref.conf b/meta-arm-bsp/conf/=
machine/sbsa-ref.conf
index 3f93b6929121..eefbb2e9cac2 100644
--- a/meta-arm-bsp/conf/machine/sbsa-ref.conf
+++ b/meta-arm-bsp/conf/machine/sbsa-ref.conf
@@ -25,6 +25,10 @@ EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATUR=
ES", "systemd", "systemd-boo
=20
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
=20
+# FIXME - when compiling edk2, we're seeing an error of fip.bin being la=
rger than the region size.
+# Pin the version back until this can be resolved
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.12.%"
+
 EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
 # FIXME - Currently seeing a kernel warning for the CPU topology when bu=
mping
 # the version past this.  The issue is being tracked in
diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-corsto=
ne1000-fvp.txt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-co=
rstone1000-fvp.txt
index 63cef943e792..5e70422a5ab9 100644
--- a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-corstone1000-=
fvp.txt
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-corstone1000-=
fvp.txt
@@ -6,3 +6,4 @@ psci: failed to boot CPU3 (-95)
 CPU3: failed to boot: -95
 ARM FF-A: Notification setup failed -95, not enabled
 ARM FF-A: Failed to register driver sched callback -95
+basic-mmio-gpio: Failed to locate of_node [id: -2]
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0001-Fix-FF-A-version-in-SPMC-manifest.patch b/meta-arm-bsp/recipes-bs=
p/trusted-firmware-a/files/corstone1000/0001-Fix-FF-A-version-in-SPMC-man=
ifest.patch
index 6d5114e1c160..367468da0e7b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001=
-Fix-FF-A-version-in-SPMC-manifest.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001=
-Fix-FF-A-version-in-SPMC-manifest.patch
@@ -1,4 +1,4 @@
-From adaa22bc2f529bb34e9d4fe89ff5c65f0c83ca0c Mon Sep 17 00:00:00 2001
+From efce372dfac4ccef239b67abb4ec1cc450096329 Mon Sep 17 00:00:00 2001
 From: emeara01 <emekcan.aras@arm.com>
 Date: Wed, 11 May 2022 14:37:06 +0100
 Subject: [PATCH] Fix FF-A version in SPMC manifest
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-plat-corstone1000-add-Cortex-A320-support.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-corstone1000-ad=
d-Cortex-A320-support.patch
index 1a9f24e323c5..a9b6d8322238 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-plat-corstone1000-add-Cortex-A320-support.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-plat-corstone1000-add-Cortex-A320-support.patch
@@ -1,4 +1,4 @@
-From 977f06e10e549d01a641a62a1d4850a06d6f0df4 Mon Sep 17 00:00:00 2001
+From 4e23e72e65481fe917d8a0af355b3b7669d5acb6 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 7 Aug 2025 10:05:02 +0000
 Subject: [PATCH] plat: corstone1000: add Cortex-A320 support
@@ -41,12 +41,12 @@ Signed-off-by: Michael Safwat <michael.safwat@arm.com=
>
  .../common/corstone1000_helpers.S             | 35 ++++++++++++++++++-
  .../corstone1000/common/corstone1000_plat.c   |  4 +++
  .../corstone1000/common/corstone1000_pm.c     |  8 +++++
- .../common/include/platform_def.h             | 28 ++++++++++++++-
+ .../common/include/platform_def.h             | 26 ++++++++++++++
  plat/arm/board/corstone1000/platform.mk       | 11 ++++++
- 5 files changed, 84 insertions(+), 2 deletions(-)
+ 5 files changed, 83 insertions(+), 1 deletion(-)
=20
 diff --git a/plat/arm/board/corstone1000/common/corstone1000_helpers.S b=
/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-index a4ca9fe98..665dbc61a 100644
+index a4ca9fe98223..665dbc61a92e 100644
 --- a/plat/arm/board/corstone1000/common/corstone1000_helpers.S
 +++ b/plat/arm/board/corstone1000/common/corstone1000_helpers.S
 @@ -1,5 +1,5 @@
@@ -97,7 +97,7 @@ index a4ca9fe98..665dbc61a 100644
  	 * void plat_secondary_cold_boot_setup (void);
  	 *
 diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/pl=
at/arm/board/corstone1000/common/corstone1000_plat.c
-index e388c82f3..d34e80b29 100644
+index e388c82f311b..d34e80b29bb0 100644
 --- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
 +++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
 @@ -26,6 +26,10 @@ const mmap_region_t plat_arm_mmap[] =3D {
@@ -112,7 +112,7 @@ index e388c82f3..d34e80b29 100644
  };
 =20
 diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
-index ac808873b..a87697e97 100644
+index ac808873b9e7..a87697e97f11 100644
 --- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
 +++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
 @@ -8,7 +8,11 @@
@@ -140,16 +140,9 @@ index ac808873b..a87697e97 100644
  	/* Flush and invalidate data cache */
  	dcsw_op_all(DCCISW);
 diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index caf3d462f..ee0babbf8 100644
+index 200383475c80..ffb1e2dec0e1 100644
 --- a/plat/arm/board/corstone1000/common/include/platform_def.h
 +++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021-2024, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2021-2025, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
 @@ -112,12 +112,19 @@
  #define ARM_SHARED_RAM_SIZE	(SZ_8K)  /* 8 KB */
  #define ARM_SHARED_RAM_BASE	ARM_TRUSTED_SRAM_BASE
@@ -170,7 +163,7 @@ index caf3d462f..ee0babbf8 100644
 =20
  #define PLAT_ARM_MAX_BL2_SIZE	(180 * SZ_1K)  /* 180 KB */
 =20
-@@ -209,8 +216,13 @@
+@@ -208,8 +215,13 @@
  #define MAX_IO_BLOCK_DEVICES	1
 =20
  /* GIC related constants */
@@ -184,7 +177,7 @@ index caf3d462f..ee0babbf8 100644
 =20
  /* MHUv2 Secure Channel receiver and sender */
  #define PLAT_SDK700_MHU0_SEND	0x1B800000
-@@ -335,6 +347,20 @@
+@@ -334,6 +346,20 @@
  					CORSTONE1000_DEVICE_BASE, \
  					CORSTONE1000_DEVICE_SIZE, \
  					MT_DEVICE | MT_RW | MT_SECURE)
@@ -206,7 +199,7 @@ index caf3d462f..ee0babbf8 100644
  #define ARM_IRQ_SEC_PHY_TIMER	29
 =20
 diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/co=
rstone1000/platform.mk
-index 65be9c1f5..fe3e94865 100644
+index 65be9c1f5ad7..fe3e94865fca 100644
 --- a/plat/arm/board/corstone1000/platform.mk
 +++ b/plat/arm/board/corstone1000/platform.mk
 @@ -9,7 +9,14 @@ ifeq ($(filter ${TARGET_PLATFORM}, fpga fvp),)
@@ -236,6 +229,3 @@ index 65be9c1f5..fe3e94865 100644
 =20
  BL2_SOURCES		+=3D	plat/arm/board/corstone1000/common/corstone1000_secur=
ity.c		\
  				plat/arm/board/corstone1000/common/corstone1000_err.c		\
---=20
-2.50.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/tf-a-tests/0001-fix-exclude-Boot-requirement-tests-for-Corstone-1000.p=
atch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-=
a-tests/0001-fix-exclude-Boot-requirement-tests-for-Corstone-1000.patch
deleted file mode 100644
index 8df0e8cf91af..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-a=
-tests/0001-fix-exclude-Boot-requirement-tests-for-Corstone-1000.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 328bfd8cd95bb0973e4966dcb4e3efa05d62f3f9 Mon Sep 17 00:00:00 2001
-From: Christophe Thiblot <christophe.thiblot@arm.com>
-Date: Wed, 2 Jul 2025 15:03:55 +0000
-Subject: [PATCH] fix: exclude Boot requirement tests for Corstone-1000
-
-A test compares the value of the Generic Timer register CNTFRQ visible i=
n
-two frames CNTBaseN and CNTCTLBase that are linked in Armv8-A and reflec=
t
-the same value.
-   =20
-An issue in Corstone-1000 (errata 2142118) makes the CNTFRQ views
-inconsistents and the then test fails. There is no workaround and
-the test is skipped.
-   =20
-Errata: https://developer.arm.com/documentation/sden2142076/0002/?lang=3D=
en
-
-Signed-off-by: Christophe Thiblot <christophe.thiblot@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tf=
-a-tests/+/40810]
----
- plat/arm/corstone1000/tests_to_skip.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/plat/arm/corstone1000/tests_to_skip.txt b/plat/arm/corstone=
1000/tests_to_skip.txt
-index d937e42..afa3992 100644
---- a/plat/arm/corstone1000/tests_to_skip.txt
-+++ b/plat/arm/corstone1000/tests_to_skip.txt
-@@ -16,3 +16,4 @@ PSCI CPU Suspend in OSI mode
- PSCI STAT/for valid composite state CPU suspend
- FF-A Setup and Discovery/FF-A RXTX remap unmapped region success
- FF-A Memory Sharing/Normal World VM retrieve request into SPMC
-+Boot requirement tests
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/tf-a-tests/0002-plat-corstone1000-Add-Cortex-A320-support.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-a-tests/000=
1-plat-corstone1000-Add-Cortex-A320-support.patch
similarity index 79%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone100=
0/tf-a-tests/0002-plat-corstone1000-Add-Cortex-A320-support.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/=
tf-a-tests/0001-plat-corstone1000-Add-Cortex-A320-support.patch
index 2ee2506f4a6d..825df2714c56 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-a=
-tests/0002-plat-corstone1000-Add-Cortex-A320-support.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-a=
-tests/0001-plat-corstone1000-Add-Cortex-A320-support.patch
@@ -1,4 +1,4 @@
-From 82ca3fcf5c323aec4ce8191c349fd7e00a840e02 Mon Sep 17 00:00:00 2001
+From ff4bb404474a3310654827c36c4ac882eb0344b5 Mon Sep 17 00:00:00 2001
 From: Michael Safwat <michael.safwat@arm.com>
 Date: Tue, 26 Aug 2025 11:20:01 +0000
 Subject: [PATCH] plat: corstone1000: Add Cortex-A320 support
@@ -24,15 +24,15 @@ Signed-off-by: Michael Safwat <michael.safwat@arm.com=
>
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Upstream-Status: Submitted (https://review.trustedfirmware.org/c/TF-A/tf=
-a-tests/+/42352)
 ---
- plat/arm/corstone1000/corstone1000_def.h      | 12 +++++++++-
- plat/arm/corstone1000/include/platform_def.h  | 11 +++++----
- plat/arm/corstone1000/platform.mk             | 23 +++++++++++++++++++
- .../tests_to_skip_cortex_a320.txt             | 21 +++++++++++++++++
- 4 files changed, 61 insertions(+), 6 deletions(-)
+ plat/arm/corstone1000/corstone1000_def.h      | 12 ++++++++++-
+ plat/arm/corstone1000/include/platform_def.h  | 11 +++++-----
+ plat/arm/corstone1000/platform.mk             | 20 ++++++++++++++++++
+ .../tests_to_skip_cortex_a320.txt             | 21 +++++++++++++++++++
+ 4 files changed, 58 insertions(+), 6 deletions(-)
  create mode 100644 plat/arm/corstone1000/tests_to_skip_cortex_a320.txt
=20
 diff --git a/plat/arm/corstone1000/corstone1000_def.h b/plat/arm/corston=
e1000/corstone1000_def.h
-index 3e6f036a..c4fa9a3b 100644
+index 3e6f036acc9a..c4fa9a3b5f68 100644
 --- a/plat/arm/corstone1000/corstone1000_def.h
 +++ b/plat/arm/corstone1000/corstone1000_def.h
 @@ -26,13 +26,23 @@
@@ -61,7 +61,7 @@ index 3e6f036a..c4fa9a3b 100644
   * PL011 related constants
   **********************************************************************=
********/
 diff --git a/plat/arm/corstone1000/include/platform_def.h b/plat/arm/cor=
stone1000/include/platform_def.h
-index a0d6f7b3..1fc505d0 100644
+index 91f4cda19a90..2a9e5c4c35bb 100644
 --- a/plat/arm/corstone1000/include/platform_def.h
 +++ b/plat/arm/corstone1000/include/platform_def.h
 @@ -98,12 +98,13 @@
@@ -84,30 +84,27 @@ index a0d6f7b3..1fc505d0 100644
 =20
  /**********************************************************************=
*********
 diff --git a/plat/arm/corstone1000/platform.mk b/plat/arm/corstone1000/p=
latform.mk
-index a5a011d5..fd98724a 100644
+index cd7a19162bcf..dfdd27abd897 100644
 --- a/plat/arm/corstone1000/platform.mk
 +++ b/plat/arm/corstone1000/platform.mk
-@@ -6,6 +6,19 @@
+@@ -6,6 +6,16 @@
 =20
  PLAT_INCLUDES	:=3D	-Iplat/arm/corstone1000/include/
 =20
 +CORSTONE1000_CORTEX_A320   :=3D      0
 +ifeq (${CORSTONE1000_CORTEX_A320},1)
-+PLAT_SOURCES   :=3D   drivers/arm/gic/arm_gic_v2v3.c                  \
-+            drivers/arm/gic/gic_v2.c                        \
-+            drivers/arm/gic/gic_v3.c                        \
-+            drivers/arm/timer/private_timer.c               \
-+            drivers/arm/timer/system_timer.c                \
-+            plat/arm/corstone1000/plat_helpers.S            \
-+            plat/arm/corstone1000/corstone1000_pwr_state.c  \
-+            plat/arm/corstone1000/corstone1000_topology.c   \
-+            plat/arm/corstone1000/corstone1000_mem_prot.c   \
-+            plat/arm/corstone1000/plat_setup.c
++PLAT_SOURCES	:=3D	drivers/arm/timer/private_timer.c		\
++                        drivers/arm/timer/system_timer.c               =
 \
++                        plat/arm/corstone1000/plat_helpers.S           =
 \
++                        plat/arm/corstone1000/corstone1000_pwr_state.c =
 \
++                        plat/arm/corstone1000/corstone1000_topology.c  =
 \
++                        plat/arm/corstone1000/corstone1000_mem_prot.c  =
 \
++                        plat/arm/corstone1000/plat_setup.c
 +else
- PLAT_SOURCES	:=3D	drivers/arm/gic/arm_gic_v2.c			\
- 			drivers/arm/gic/gic_v2.c			\
- 			drivers/arm/timer/private_timer.c		\
-@@ -15,6 +28,7 @@ PLAT_SOURCES	:=3D	drivers/arm/gic/arm_gic_v2.c			\
+ PLAT_SOURCES	:=3D	drivers/arm/timer/private_timer.c		\
+ 			drivers/arm/timer/system_timer.c		\
+ 			plat/arm/corstone1000/plat_helpers.S		\
+@@ -13,6 +23,7 @@ PLAT_SOURCES	:=3D	drivers/arm/timer/private_timer.c		\
  			plat/arm/corstone1000/corstone1000_topology.c	\
  			plat/arm/corstone1000/corstone1000_mem_prot.c	\
  			plat/arm/corstone1000/plat_setup.c
@@ -115,7 +112,7 @@ index a5a011d5..fd98724a 100644
 =20
  PLAT_SUPPORTS_NS_RESET	:=3D	1
 =20
-@@ -23,6 +37,15 @@ $(eval $(call assert_boolean,PLAT_SUPPORTS_NS_RESET))
+@@ -21,6 +32,15 @@ $(eval $(call assert_boolean,PLAT_SUPPORTS_NS_RESET))
  $(eval $(call add_define,TFTF_DEFINES,PLAT_SUPPORTS_NS_RESET))
 =20
  FIRMWARE_UPDATE :=3D 0
@@ -133,7 +130,7 @@ index a5a011d5..fd98724a 100644
  include plat/arm/common/arm_common.mk
 diff --git a/plat/arm/corstone1000/tests_to_skip_cortex_a320.txt b/plat/=
arm/corstone1000/tests_to_skip_cortex_a320.txt
 new file mode 100644
-index 00000000..87b9241d
+index 000000000000..87b9241daba0
 --- /dev/null
 +++ b/plat/arm/corstone1000/tests_to_skip_cortex_a320.txt
 @@ -0,0 +1,21 @@
@@ -158,6 +155,3 @@ index 00000000..87b9241d
 +Boot requirement tests
 +CPU extensions/AMUv1 suspend/resume
 +CPU extensions/Use trace buffer control Registers
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bba=
ppend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
index c1490c9f33cd..34644585a6d4 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
@@ -12,9 +12,5 @@ TFTF_MODE:corstone1000 =3D "release"
=20
 FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/files/corstone1000=
/tf-a-tests:"
 SRC_URI:append:corstone1000 =3D " \
-        file://0001-fix-exclude-Boot-requirement-tests-for-Corstone-1000=
.patch \
-        "
-
-SRC_URI:append:corstone1000 =3D " \
-        file://0002-plat-corstone1000-Add-Cortex-A320-support.patch \
+        file://0001-plat-corstone1000-Add-Cortex-A320-support.patch \
         "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 5e219a282b57..d7c436dc482c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -79,5 +79,5 @@ EXTRA_OEMAKE:append:cortexa320 =3D " \
 # If GENERATE_COT is set, then TF-A will try to use local poetry install
 # to run the python cot-dt2c command.  Disable the local poetry and use
 # the provided cot-dt2c.
-EXTRA_OEMAKE +=3D "POETRY=3D''"
+EXTRA_OEMAKE +=3D "host-poetry=3D''"
 DEPENDS +=3D "cot-dt2c-native"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-base.inc
index 06a2d22631c3..c87cbb726ec8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -69,5 +69,5 @@ EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D${ARM_ISA_MAJOR} AR=
M_ARCH_MINOR=3D${ARM_ISA_MINOR}
 # If GENERATE_COT is set, then tf-a will try to use local poetry install
 # to run the python cot-dt2c command.  Disable the local poetry and use
 # the provided cot-dt2c.
-EXTRA_OEMAKE +=3D "POETRY=3D''"
+EXTRA_OEMAKE +=3D "host-poetry=3D''"
 DEPENDS +=3D "cot-dt2c-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb b/=
meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
index 5d7efcc93635..8e9e37a9064b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
@@ -4,10 +4,10 @@ LICENSE =3D "BSD-3-Clause"
=20
 SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};branch=3D${SRCBRANCH}"
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a=
58af8d19bee1"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6=
eba7b524039e"
=20
-# Use cot-dt2c from TF-A v2.12.0
-SRCREV =3D "4ec2948fe3f65dba2f19e691e702f7de2949179c"
+# Use cot-dt2c from TF-A v2.14.0
+SRCREV =3D "1d5aa939bc8d3d892e2ed9945fa50e36a1a924cc"
 SRCBRANCH =3D "master"
=20
 inherit python_poetry_core
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fix-arm-r=
e-enable-console-by-default-in-BL31.patch b/meta-arm/recipes-bsp/trusted-=
firmware-a/files/0001-fix-arm-re-enable-console-by-default-in-BL31.patch
deleted file mode 100644
index f5b8d538e4b1..000000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fix-arm-re-enabl=
e-console-by-default-in-BL31.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From de4640579c5318ba08ec57531ef87d63f5574557 Mon Sep 17 00:00:00 2001
-From: Chris Kay <chris.kay@arm.com>
-Date: Thu, 21 Aug 2025 14:16:25 +0100
-Subject: [PATCH] fix(arm): re-enable console by default in BL31
-
-In c997a8d, the common `arm_bl31_early_platform_setup` function
-underwent a consolidation of two large preprocessor branches that were
-conditional on whether or not Transfer List support is enabled.
-
-This function would initialise the console via `arm_console_boot_init`
-*only* if Transfer List support was disabled. During the consolidation,
-this call was removed, such that the behaviour was the same for both
-branches.
-
-However, the common `bl31_early_platform_setup2` implementation was not
-updated to reflect this change, and so platforms that a) relied on this
-common implementation and b) did not enable Transfer List support no
-longer initialise the console in BL31.
-
-This change ensures that the common implementation correctly initialises
-the console during early BL31 boot.
-
-Change-Id: I332af3932ac70382fbf7a5434c0008807f38f86c
-Signed-off-by: Chris Kay <chris.kay@arm.com>
-Upstream-Status: Backport [de4640579c5318ba08ec57531ef87d63f5574557]
----
- plat/arm/common/arm_bl31_setup.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/plat/arm/common/arm_bl31_setup.c b/plat/arm/common/arm_bl31=
_setup.c
-index 8ac984fd1..e7dc70bdb 100644
---- a/plat/arm/common/arm_bl31_setup.c
-+++ b/plat/arm/common/arm_bl31_setup.c
-@@ -343,6 +343,9 @@ void __init arm_bl31_early_platform_setup(u_register=
_t arg0, u_register_t arg1,
- void bl31_early_platform_setup2(u_register_t arg0, u_register_t arg1,
- 		u_register_t arg2, u_register_t arg3)
- {
-+	/* Initialize the console to provide early debug support */
-+	arm_console_boot_init();
-+
- 	arm_bl31_early_platform_setup(arg0, arg1, arg2, arg3);
-=20
- 	/*
---=20
-2.43.0
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0002-fix-css-d=
on-t-require-the-GICC-frame-to-be-defined-o.patch b/meta-arm/recipes-bsp/=
trusted-firmware-a/files/0002-fix-css-don-t-require-the-GICC-frame-to-be-=
defined-o.patch
deleted file mode 100644
index cef26ba09567..000000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/files/0002-fix-css-don-t-re=
quire-the-GICC-frame-to-be-defined-o.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 60d103759b0835d61d90c8f2fbc7cf55f37e61a0 Mon Sep 17 00:00:00 2001
-From: Boyan Karatotev <boyan.karatotev@arm.com>
-Date: Wed, 22 Oct 2025 13:52:28 +0100
-Subject: [PATCH] fix(css): don't require the GICC frame to be defined on=
 GICv3
-
-It's used for GICv2 operation, which won't happen with v3. CSS will
-always use USE_GIC_DRIVER with the correct version so we can rely on
-that to skip passing the GICC frame.
-
-Upstream-Status: Backport [e3c36e35f8f92f817e537064d97a3816c339c704]
-Change-Id: I358b99646f98bd7c6ea398bc8d8900cc80ca15bb
-Signed-off-by: Boyan Karatotev <boyan.karatotev@arm.com>
----
- include/plat/arm/css/common/aarch64/css_macros.S | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/include/plat/arm/css/common/aarch64/css_macros.S b/include/=
plat/arm/css/common/aarch64/css_macros.S
-index 85a7044d7..8a687d582 100644
---- a/include/plat/arm/css/common/aarch64/css_macros.S
-+++ b/include/plat/arm/css/common/aarch64/css_macros.S
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2015, ARM Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2015-2025, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -18,7 +18,14 @@
- 	 */
- 	.macro css_print_gic_regs
- 	mov_imm	x16, PLAT_ARM_GICD_BASE
-+	/*
-+	 * The ID registers will show GIC version, so it can safely be assumed
-+	 * that no v2 operation will be attempted on v3. Don't require the
-+	 * macro.
-+	 */
-+#if USE_GIC_DRIVER =3D=3D 2
- 	mov_imm	x17, PLAT_ARM_GICC_BASE
-+#endif
- 	arm_print_gic_regs
- 	.endm
-=20
---=20
-2.43.0
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.13.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.0.bb
similarity index 85%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.13.0=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.0.b=
b
index 1b5334d8bbbc..a96329e1b424 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.13.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.0.bb
@@ -7,10 +7,10 @@ LICENSE =3D "BSD-3-Clause"
=20
 SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D1118e32884721c0be332=
67bd7ae11130"
+LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6=
eba7b524039e"
=20
-# Use fiptool from  TF-A v2.13.0
-SRCREV =3D "c17351450c8a513ca3f30f936e26a71db693a145"
+# Use fiptool from  TF-A v2.14.0
+SRCREV =3D "1d5aa939bc8d3d892e2ed9945fa50e36a1a924cc"
 SRCBRANCH =3D "master"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
similarity index 96%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
index aa7f49048b4e..dcd97d1a196d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE ?=3D "invalid"
 SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://review.trustedfirmware.org/=
TF-A/tf-a-tests;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH}"
 SRCBRANCH =3D "master"
-SRCREV =3D "fa267c12f9aa790b43b38d171273cf63892e8d51"
+SRCREV =3D "3b3d800133081b48482b1205a32671b82bc2b640"
=20
 EXTRA_OEMAKE +=3D "USE_NVM=3D0"
 EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 321a89078a20..28e415e24f0c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-2-Clause & BSD-3-Clause & MIT & Apache-2=
.0"
=20
 inherit firmware
=20
-SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "gitsm://review.trustedfirmware.org/TF-A=
/trusted-firmware-a;protocol=3Dhttps"
 SRCBRANCH =3D "master"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};name=3Dtfa;branch=3D${SRCBRAN=
CH}"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.13.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
3.0.bb
deleted file mode 100644
index 0c1566a5654f..000000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.b=
b
+++ /dev/null
@@ -1,20 +0,0 @@
-require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
-
-# TF-A v2.13.0
-SRCREV_tfa =3D "c17351450c8a513ca3f30f936e26a71db693a145"
-SRCBRANCH =3D "master"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118e32884721c0be33=
267bd7ae11130"
-
-# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.3
-SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "git://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;pr=
otocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=3D=
${SRCBRANCH_MBEDTLS}"
-SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
-
-SRC_URI +=3D "\
-    file://0001-fix-arm-re-enable-console-by-default-in-BL31.patch \
-    file://0002-fix-css-don-t-require-the-GICC-frame-to-be-defined-o.pat=
ch \
-"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.14.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
4.0.bb
new file mode 100644
index 000000000000..b84b6ad0cf77
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.0.b=
b
@@ -0,0 +1,16 @@
+require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+
+# TF-A v2.14.0
+SRC_URI_TRUSTED_FIRMWARE_A =3D "gitsm://review.trustedfirmware.org/TF-A/=
trusted-firmware-a;protocol=3Dhttps"
+SRCREV_tfa =3D "1d5aa939bc8d3d892e2ed9945fa50e36a1a924cc"
+SRCBRANCH =3D "master"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c=
6eba7b524039e"
+
+# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
+# mbedtls-3.6.5
+SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
+SRC_URI_MBEDTLS =3D "gitsm://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;=
protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=
=3D${SRCBRANCH_MBEDTLS}"
+SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index f5f15c90900d..6d7f7c3e428a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -1,16 +1,16 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A master, tag: v2.14-rc1
-SRCREV_tfa =3D "96147cc84b7dd8b4f53c9fed553b0c61af060898"
+# TF-A master, tag: v2.14
+SRCREV_tfa =3D "1d5aa939bc8d3d892e2ed9945fa50e36a1a924cc"
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c=
6eba7b524039e"
=20
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.3
+# mbedtls-3.6.5
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "git://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;pr=
otocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=3D=
${SRCBRANCH_MBEDTLS}"
-SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
+SRC_URI_MBEDTLS =3D "gitsm://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;=
protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=
=3D${SRCBRANCH_MBEDTLS}"
+SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
=20
--=20
2.50.1 (Apple Git-155)


