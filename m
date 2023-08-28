Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4698C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 14:37:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15740.1693233468337148527
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 07:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF21E2F4
	for <meta-arm@lists.yoctoproject.org>; Mon, 28 Aug 2023 07:38:27 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A637F3F64C
	for <meta-arm@lists.yoctoproject.org>; Mon, 28 Aug 2023 07:37:47 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/tc1: update optee
Date: Mon, 28 Aug 2023 08:14:47 -0500
Message-Id: <20230828131447.3682473-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Aug 2023 14:37:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4998

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/include/tc.inc      |  6 +--
 .../tc/0001-WIP-Enable-managed-exit.patch     | 24 +++++-----
 ...talcompute-fix-TZDRAM-start-and-size.patch | 44 ++++++-------------
 .../optee/optee-os-generic-tc.inc             | 14 ------
 .../optee/optee-os-tadevkit_3.18.0.bbappend   |  2 +-
 .../recipes-security/optee/optee-os-tc.inc    | 12 ++++-
 .../optee/optee-os_3.20.0.bbappend            |  1 +
 .../optee/optee-test_3.18.0.bbappend          |  1 -
 .../optee/optee-test_3.20.0.bbappend          |  6 +++
 9 files changed, 47 insertions(+), 63 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-generic-=
tc.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.20.0=
.bbappend

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index b5e54606..872f58cb 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -14,9 +14,9 @@ UBOOT_ENTRYPOINT =3D "0x80080000"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
=20
 # OP-TEE
-PREFERRED_VERSION_optee-os ?=3D "3.18%"
-PREFERRED_VERSION_optee-client ?=3D "3.18%"
-PREFERRED_VERSION_optee-test ?=3D "3.18%"
+PREFERRED_VERSION_optee-os ?=3D "3.20%"
+PREFERRED_VERSION_optee-client ?=3D "3.20%"
+PREFERRED_VERSION_optee-test ?=3D "3.20%"
=20
 # Cannot use the default zImage on arm64
 KERNEL_IMAGETYPE =3D "Image"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-W=
IP-Enable-managed-exit.patch b/meta-arm-bsp/recipes-security/optee/files/=
optee-os/tc/0001-WIP-Enable-managed-exit.patch
index 0f0a76e4..4571409b 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-WIP-Enab=
le-managed-exit.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-WIP-Enab=
le-managed-exit.patch
@@ -1,7 +1,7 @@
-From 34db1357ab3192f18629ceadf4ea33b948513fec Mon Sep 17 00:00:00 2001
+From f449f6fdcbd987e18a26f0daeccfa447fe76821a Mon Sep 17 00:00:00 2001
 From: Olivier Deprez <olivier.deprez@arm.com>
 Date: Mon, 16 Nov 2020 10:14:02 +0100
-Subject: [PATCH 1/2] WIP: Enable managed exit
+Subject: [PATCH] WIP: Enable managed exit
=20
 This change declares OP-TEE SP as supporting managed exit in response to
 a NS interrupt triggering while the SWd runs.
@@ -23,6 +23,7 @@ Signed-off-by: Arunachalam Ganapathy <arunachalam.ganap=
athy@arm.com>
=20
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
 ---
  core/arch/arm/kernel/boot.c                          | 12 ++++++++++++
  core/arch/arm/kernel/thread_a64.S                    | 11 ++++++++++-
@@ -31,10 +32,10 @@ Signed-off-by: Arunachalam Ganapathy <arunachalam.gan=
apathy@arm.com>
  4 files changed, 34 insertions(+), 1 deletion(-)
=20
 diff --git a/core/arch/arm/kernel/boot.c b/core/arch/arm/kernel/boot.c
-index f173384d..466c042e 100644
+index dd34173e8..7d2ac74e8 100644
 --- a/core/arch/arm/kernel/boot.c
 +++ b/core/arch/arm/kernel/boot.c
-@@ -1350,6 +1350,18 @@ static void init_secondary_helper(unsigned long n=
sec_entry)
+@@ -1424,6 +1424,18 @@ static void init_secondary_helper(unsigned long n=
sec_entry)
  	init_vfp_sec();
  	init_vfp_nsec();
 =20
@@ -54,10 +55,10 @@ index f173384d..466c042e 100644
  }
 =20
 diff --git a/core/arch/arm/kernel/thread_a64.S b/core/arch/arm/kernel/th=
read_a64.S
-index d6baee4d..1b0c8f37 100644
+index 4fa97de24..4facc7631 100644
 --- a/core/arch/arm/kernel/thread_a64.S
 +++ b/core/arch/arm/kernel/thread_a64.S
-@@ -1087,6 +1087,14 @@ END_FUNC el0_sync_abort
+@@ -1162,6 +1162,14 @@ END_FUNC el0_sync_abort
  	bl	dcache_op_louis
  	ic	iallu
  #endif
@@ -72,7 +73,7 @@ index d6baee4d..1b0c8f37 100644
  	/*
  	 * Mark current thread as suspended
  	 */
-@@ -1204,8 +1212,9 @@ LOCAL_FUNC elx_irq , :
+@@ -1318,8 +1326,9 @@ LOCAL_FUNC elx_irq , :
  #endif
  END_FUNC elx_irq
 =20
@@ -84,10 +85,10 @@ index d6baee4d..1b0c8f37 100644
  #else
  	native_intr_handler	fiq
 diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/t=
hread_spmc.c
-index ea9e8f03..15577e7e 100644
+index 3b4ac0b4e..8f7c18dfa 100644
 --- a/core/arch/arm/kernel/thread_spmc.c
 +++ b/core/arch/arm/kernel/thread_spmc.c
-@@ -1518,6 +1518,17 @@ static TEE_Result spmc_init(void)
+@@ -1517,6 +1517,17 @@ static TEE_Result spmc_init(void)
  	my_endpoint_id =3D spmc_get_id();
  	DMSG("My endpoint ID %#x", my_endpoint_id);
 =20
@@ -106,7 +107,7 @@ index ea9e8f03..15577e7e 100644
  }
  #endif /* !defined(CFG_CORE_SEL1_SPMC) */
 diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts =
b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-index 0bfe33f3..00cfa5b2 100644
+index 3ebbaddc8..56e69f372 100644
 --- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
 +++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
 @@ -24,6 +24,7 @@
@@ -117,6 +118,3 @@ index 0bfe33f3..00cfa5b2 100644
 =20
  	device-regions {
  		compatible =3D "arm,ffa-manifest-device-regions";
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-p=
lat-totalcompute-fix-TZDRAM-start-and-size.patch b/meta-arm-bsp/recipes-s=
ecurity/optee/files/optee-os/tc/0002-plat-totalcompute-fix-TZDRAM-start-a=
nd-size.patch
index ff7f5133..c516be46 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-tot=
alcompute-fix-TZDRAM-start-and-size.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-tot=
alcompute-fix-TZDRAM-start-and-size.patch
@@ -1,23 +1,23 @@
-From 35dba075593cb32c62b881e7763fcf0ea37908f7 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 23 May 2022 11:32:41 +0100
-Subject: [PATCH 2/2] plat-totalcompute: fix TZDRAM start and size
+From 5ddda749c60dce834bcd79e8b8d904858319adc0 Mon Sep 17 00:00:00 2001
+From: Rupinderjit Singh <rupinderjit.singh@arm.com>
+Date: Tue, 7 Feb 2023 09:45:02 +0000
+Subject: [PATCH] plat-totalcompute: update TZDRAM_SIZE
=20
-- Fix TZDRAM_SIZE in TC platform
-- For CFG_CORE_SEL2_SPMC, manifest size is increased from 0x1000 to
-  0x4000 for boot protocol support.
+For CFG_CORE_SEL2_SPMC, manifest size is increased from 0x1000 to
+0x4000 for boot protocol support.
=20
-Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Backport
+Signed-off-by: Jon Mason <jon.mason@arm.com>
=20
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: Iff19c498e9edae961f469604d69419c1a32145f5
 ---
- core/arch/arm/plat-totalcompute/conf.mk                    | 5 +++--
- core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts | 2 +-
- 2 files changed, 4 insertions(+), 3 deletions(-)
+ core/arch/arm/plat-totalcompute/conf.mk | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/pla=
t-totalcompute/conf.mk
-index b39ac0f0..2f6c0ee1 100644
+index b39ac0f0667f..2f6c0ee1460a 100644
 --- a/core/arch/arm/plat-totalcompute/conf.mk
 +++ b/core/arch/arm/plat-totalcompute/conf.mk
 @@ -32,8 +32,9 @@ ifeq ($(CFG_CORE_SEL1_SPMC),y)
@@ -32,19 +32,3 @@ index b39ac0f0..2f6c0ee1 100644
  else
  CFG_TZDRAM_START ?=3D 0xff000000
  CFG_TZDRAM_SIZE  ?=3D 0x01000000
-diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts =
b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-index 00cfa5b2..56e69f37 100644
---- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-+++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-@@ -20,7 +20,7 @@
- 	exception-level =3D <2>; /* S-EL1 */
- 	execution-state =3D <0>; /* AARCH64 */
- 	load-address =3D <0xfd280000>;
--	entrypoint-offset =3D <0x1000>;
-+	entrypoint-offset =3D <0x4000>;
- 	xlat-granule =3D <0>; /* 4KiB */
- 	boot-order =3D <0>;
- 	messaging-method =3D <0x3>; /* Direct request/response supported */
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc =
b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
deleted file mode 100644
index 31f19158..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-# Total Compute (tc) specific configuration for optee-os and optee-os-ta=
devkit
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/tc:"
-SRC_URI:append:tc =3D " \
-    file://sp_layout.json \
-    file://0001-WIP-Enable-managed-exit.patch \
-    file://0002-plat-totalcompute-fix-TZDRAM-start-and-size.patch \
-    "
-
-COMPATIBLE_MACHINE =3D "(tc?)"
-
-OPTEEMACHINE:tc0 =3D "totalcompute-tc0"
-OPTEEMACHINE:tc1 =3D "totalcompute-tc1"
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0=
.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.=
bbappend
index 6a22d47e..0cb9b05e 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappe=
nd
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappe=
nd
@@ -1,6 +1,6 @@
 # Machine specific configurations
=20
 MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
-MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc =3D "optee-os-generic-tc.inc"
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc =3D "optee-os-tc.inc"
=20
 require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc b/meta-a=
rm-bsp/recipes-security/optee/optee-os-tc.inc
index 79366522..c4049f5a 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
@@ -1,6 +1,16 @@
 # TC0 specific configuration
=20
-require optee-os-generic-tc.inc
+# Total Compute (tc) specific configuration for optee-os and optee-os-ta=
devkit
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/tc:"
+SRC_URI:append:tc =3D " file://sp_layout.json \
+    file://0001-WIP-Enable-managed-exit.patch \
+    file://0002-plat-totalcompute-fix-TZDRAM-start-and-size.patch \
+    "
+
+COMPATIBLE_MACHINE =3D "(tc?)"
+
+OPTEEMACHINE:tc1 =3D "totalcompute-tc1"
=20
 # Enable optee memory layout and boot logs
 EXTRA_OEMAKE +=3D " CFG_TEE_CORE_LOG_LEVEL=3D3"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
index f80e09f8..bc933dd5 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
@@ -2,5 +2,6 @@
=20
 MACHINE_OPTEE_OS_REQUIRE ?=3D ""
 MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
+MACHINE_OPTEE_OS_REQUIRE:tc =3D "optee-os-tc.inc"
=20
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappend
index 9318a07e..05e2abca 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappend
@@ -1,7 +1,6 @@
 # Machine specific configurations
=20
 MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
-MACHINE_OPTEE_TEST_REQUIRE:tc =3D "optee-test-tc.inc"
 MACHINE_OPTEE_TEST_REQUIRE:n1sdp =3D "optee-os-generic-n1sdp.inc"
=20
 require ${MACHINE_OPTEE_TEST_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bbappend
new file mode 100644
index 00000000..490b3500
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
+MACHINE_OPTEE_TEST_REQUIRE:tc =3D "optee-test-tc.inc"
+
+require ${MACHINE_OPTEE_TEST_REQUIRE}
--=20
2.30.2


