Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DA0C6FA8E
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 07:00:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.3701.1662706800260591825
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Sep 2022 00:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: davidson.kumaresan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39CFD15DB;
	Fri,  9 Sep 2022 00:00:06 -0700 (PDT)
Received: from usa.arm.com (unknown [10.162.16.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 40DCE3F73D;
	Fri,  9 Sep 2022 00:00:27 -0700 (PDT)
From: Davidson K <davidson.kumaresan@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Davidson K <davidson.kumaresan@arm.com>
Subject: [PATCH 3/3] arm-bsp/tc: upgrade version of optee
Date: Fri,  9 Sep 2022 12:29:27 +0530
Message-Id: <20220909065927.11581-3-davidson.kumaresan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909065927.11581-2-davidson.kumaresan@arm.com>
References: <20220909065927.11581-1-davidson.kumaresan@arm.com>
 <20220909065927.11581-2-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 07:00:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3752

Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
Change-Id: Iacd32d18d5d2804e4050e4d1f8075efe0dd545fe
---
 meta-arm-bsp/conf/machine/include/tc.inc      |  6 +-
 .../tc/0001-WIP-Enable-managed-exit.patch     | 36 ++++++-----
 ...nction-ID-according-to-FFA-v1.1-spec.patch | 29 ---------
 ...talcompute-fix-TZDRAM-start-and-size.patch | 50 ++++++++++++++++
 .../optee-os/tc/0003-Fix-optee-UUID.patch     | 27 ---------
 ...lcompute-add-support-for-higher-DRAM.patch | 60 -------------------
 .../optee/optee-os-generic-tc.inc             |  9 +--
 .../optee/optee-os-tadevkit_3.18.0.bbappend   |  6 ++
 .../optee/optee-os_3.18.0.bbappend            |  1 +
 .../optee/optee-test_3.18.0.bbappend          |  6 ++
 10 files changed, 84 insertions(+), 146 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc=
/0002-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc=
/0002-plat-totalcompute-fix-TZDRAM-start-and-size.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc=
/0003-Fix-optee-UUID.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc=
/0004-plat-totalcompute-add-support-for-higher-DRAM.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_3.18.0.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.18.0=
.bbappend

diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
index 88eda556..d1fe97d8 100644
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ b/meta-arm-bsp/conf/machine/include/tc.inc
@@ -26,9 +26,9 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack=
"
 PREFERRED_VERSION_linux-arm64-ack ?=3D "5.10"
=20
 # OP-TEE
-PREFERRED_VERSION_optee-os ?=3D "3.14%"
-PREFERRED_VERSION_optee-client ?=3D "3.14%"
-PREFERRED_VERSION_optee-test ?=3D "3.14%"
+PREFERRED_VERSION_optee-os ?=3D "3.18%"
+PREFERRED_VERSION_optee-client ?=3D "3.18%"
+PREFERRED_VERSION_optee-test ?=3D "3.18%"
=20
 # Cannot use the default zImage on arm64
 KERNEL_IMAGETYPE =3D "Image"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-W=
IP-Enable-managed-exit.patch b/meta-arm-bsp/recipes-security/optee/files/=
optee-os/tc/0001-WIP-Enable-managed-exit.patch
index 3a21b39a..0f0a76e4 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-WIP-Enab=
le-managed-exit.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-WIP-Enab=
le-managed-exit.patch
@@ -1,7 +1,7 @@
-From 14b84786e85483bf3c737ef8b392204e307c0ff1 Mon Sep 17 00:00:00 2001
+From 34db1357ab3192f18629ceadf4ea33b948513fec Mon Sep 17 00:00:00 2001
 From: Olivier Deprez <olivier.deprez@arm.com>
 Date: Mon, 16 Nov 2020 10:14:02 +0100
-Subject: [PATCH] WIP: Enable managed exit
+Subject: [PATCH 1/2] WIP: Enable managed exit
=20
 This change declares OP-TEE SP as supporting managed exit in response to
 a NS interrupt triggering while the SWd runs.
@@ -27,14 +27,14 @@ Signed-off-by: Arunachalam Ganapathy <arunachalam.gan=
apathy@arm.com>
  core/arch/arm/kernel/boot.c                          | 12 ++++++++++++
  core/arch/arm/kernel/thread_a64.S                    | 11 ++++++++++-
  core/arch/arm/kernel/thread_spmc.c                   | 11 +++++++++++
- .../arm/plat-totalcompute/fdts/optee_sp_manifest.dts |  2 +-
- 4 files changed, 34 insertions(+), 2 deletions(-)
+ .../arm/plat-totalcompute/fdts/optee_sp_manifest.dts |  1 +
+ 4 files changed, 34 insertions(+), 1 deletion(-)
=20
 diff --git a/core/arch/arm/kernel/boot.c b/core/arch/arm/kernel/boot.c
-index 09c1b811..d130107f 100644
+index f173384d..466c042e 100644
 --- a/core/arch/arm/kernel/boot.c
 +++ b/core/arch/arm/kernel/boot.c
-@@ -1279,6 +1279,18 @@ static void init_secondary_helper(unsigned long n=
sec_entry)
+@@ -1350,6 +1350,18 @@ static void init_secondary_helper(unsigned long n=
sec_entry)
  	init_vfp_sec();
  	init_vfp_nsec();
 =20
@@ -54,10 +54,10 @@ index 09c1b811..d130107f 100644
  }
 =20
 diff --git a/core/arch/arm/kernel/thread_a64.S b/core/arch/arm/kernel/th=
read_a64.S
-index 3e0f5115..63bf396a 100644
+index d6baee4d..1b0c8f37 100644
 --- a/core/arch/arm/kernel/thread_a64.S
 +++ b/core/arch/arm/kernel/thread_a64.S
-@@ -904,6 +904,14 @@ END_FUNC el0_sync_abort
+@@ -1087,6 +1087,14 @@ END_FUNC el0_sync_abort
  	bl	dcache_op_louis
  	ic	iallu
  #endif
@@ -72,7 +72,7 @@ index 3e0f5115..63bf396a 100644
  	/*
  	 * Mark current thread as suspended
  	 */
-@@ -1021,8 +1029,9 @@ LOCAL_FUNC elx_irq , :
+@@ -1204,8 +1212,9 @@ LOCAL_FUNC elx_irq , :
  #endif
  END_FUNC elx_irq
 =20
@@ -84,10 +84,10 @@ index 3e0f5115..63bf396a 100644
  #else
  	native_intr_handler	fiq
 diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/t=
hread_spmc.c
-index bd7930e7..89ff82bc 100644
+index ea9e8f03..15577e7e 100644
 --- a/core/arch/arm/kernel/thread_spmc.c
 +++ b/core/arch/arm/kernel/thread_spmc.c
-@@ -1394,6 +1394,17 @@ static TEE_Result spmc_init(void)
+@@ -1518,6 +1518,17 @@ static TEE_Result spmc_init(void)
  	my_endpoint_id =3D spmc_get_id();
  	DMSG("My endpoint ID %#x", my_endpoint_id);
 =20
@@ -104,21 +104,19 @@ index bd7930e7..89ff82bc 100644
 +
  	return TEE_SUCCESS;
  }
- #endif /*CFG_CORE_SEL2_SPMC*/
+ #endif /* !defined(CFG_CORE_SEL1_SPMC) */
 diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts =
b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-index 4b8b3681..04847c4d 100644
+index 0bfe33f3..00cfa5b2 100644
 --- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
 +++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-@@ -23,7 +23,8 @@
- 	entrypoint-offset =3D <0x1000>;
+@@ -24,6 +24,7 @@
  	xlat-granule =3D <0>; /* 4KiB */
  	boot-order =3D <0>;
--	messaging-method =3D <0>; /* Direct messaging only */
-+	messaging-method =3D <3>; /* Direct request/response supported */
+ 	messaging-method =3D <0x3>; /* Direct request/response supported */
 +	managed-exit; /* Managed exit supported */
-
+=20
  	device-regions {
  		compatible =3D "arm,ffa-manifest-device-regions";
 --=20
-2.29.2
+2.34.1
=20
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-f=
fa-Update-function-ID-according-to-FFA-v1.1-spec.patch b/meta-arm-bsp/rec=
ipes-security/optee/files/optee-os/tc/0002-ffa-Update-function-ID-accordi=
ng-to-FFA-v1.1-spec.patch
deleted file mode 100644
index 44138cbe..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-ffa-Upda=
te-function-ID-according-to-FFA-v1.1-spec.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3a240f6b6c58d70471fd0752b8854c43c7c4df72 Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Wed, 11 Aug 2021 11:00:52 +0100
-Subject: [PATCH 2/2] ffa: Update function ID according to FFA v1.1 spec
-
-This updates function ID FFA_SECONDARY_EP_REGISTER_64.
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Usama Arif <usama.arif@arm.com>
----
- core/arch/arm/include/ffa.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/include/ffa.h b/core/arch/arm/include/ffa.h
-index 20a009ca..b0d68173 100644
---- a/core/arch/arm/include/ffa.h
-+++ b/core/arch/arm/include/ffa.h
-@@ -69,7 +69,7 @@
- #define FFA_MEM_RECLAIM			U(0x84000077)
- #define FFA_MEM_FRAG_RX			U(0x8400007A)
- #define FFA_MEM_FRAG_TX			U(0x8400007B)
--#define FFA_SECONDARY_EP_REGISTER_64	U(0xC4000084)
-+#define FFA_SECONDARY_EP_REGISTER_64	U(0xC4000087)
-=20
- /* Special value for traffic targeted to the Hypervisor or SPM */
- #define FFA_TARGET_INFO_MBZ		U(0x0)
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-p=
lat-totalcompute-fix-TZDRAM-start-and-size.patch b/meta-arm-bsp/recipes-s=
ecurity/optee/files/optee-os/tc/0002-plat-totalcompute-fix-TZDRAM-start-a=
nd-size.patch
new file mode 100644
index 00000000..ff7f5133
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-tot=
alcompute-fix-TZDRAM-start-and-size.patch
@@ -0,0 +1,50 @@
+From 35dba075593cb32c62b881e7763fcf0ea37908f7 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Mon, 23 May 2022 11:32:41 +0100
+Subject: [PATCH 2/2] plat-totalcompute: fix TZDRAM start and size
+
+- Fix TZDRAM_SIZE in TC platform
+- For CFG_CORE_SEL2_SPMC, manifest size is increased from 0x1000 to
+  0x4000 for boot protocol support.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Iff19c498e9edae961f469604d69419c1a32145f5
+---
+ core/arch/arm/plat-totalcompute/conf.mk                    | 5 +++--
+ core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/pla=
t-totalcompute/conf.mk
+index b39ac0f0..2f6c0ee1 100644
+--- a/core/arch/arm/plat-totalcompute/conf.mk
++++ b/core/arch/arm/plat-totalcompute/conf.mk
+@@ -32,8 +32,9 @@ ifeq ($(CFG_CORE_SEL1_SPMC),y)
+ CFG_TZDRAM_START ?=3D 0xfd000000
+ CFG_TZDRAM_SIZE  ?=3D 0x02000000
+ else ifeq ($(CFG_CORE_SEL2_SPMC),y)
+-CFG_TZDRAM_START ?=3D 0xfd281000
+-CFG_TZDRAM_SIZE  ?=3D 0x01d7f000
++CFG_TZDRAM_START ?=3D 0xfd284000
++# TZDRAM size 0x1980000 - 0x4000 manifest size
++CFG_TZDRAM_SIZE  ?=3D 0x0197c000
+ else
+ CFG_TZDRAM_START ?=3D 0xff000000
+ CFG_TZDRAM_SIZE  ?=3D 0x01000000
+diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts =
b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+index 00cfa5b2..56e69f37 100644
+--- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
++++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+@@ -20,7 +20,7 @@
+ 	exception-level =3D <2>; /* S-EL1 */
+ 	execution-state =3D <0>; /* AARCH64 */
+ 	load-address =3D <0xfd280000>;
+-	entrypoint-offset =3D <0x1000>;
++	entrypoint-offset =3D <0x4000>;
+ 	xlat-granule =3D <0>; /* 4KiB */
+ 	boot-order =3D <0>;
+ 	messaging-method =3D <0x3>; /* Direct request/response supported */
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0003-F=
ix-optee-UUID.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/=
tc/0003-Fix-optee-UUID.patch
deleted file mode 100644
index 5374c021..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0003-Fix-opte=
e-UUID.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 37fd6f3c18015bcad2c099bf9269e72140e55557 Mon Sep 17 00:00:00 2001
-From: Davidson K <davidson.kumaresan@arm.com>
-Date: Wed, 12 Jan 2022 17:14:03 +0530
-Subject: [PATCH] Fix optee UUID
-
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/a9a=
8e483b6ff7f6e40c5ed95310a18e0bd1993c3#diff-2a310f8cc43d961b2efc05ac161952=
1653ba8977ff5e6dc5bb89754fd60fe954]
-Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
----
- core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts =
b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-index 04847c4d..3b76fc7d 100644
---- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-+++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-@@ -14,7 +14,7 @@
- 	/* Properties */
- 	description =3D "op-tee";
- 	ffa-version =3D <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
--	uuid =3D <0x486178e0 0xe7f811e3 0xbc5e0002 0xa5d5c51b>;
-+	uuid =3D <0xe0786148 0xe311f8e7 0x02005ebc 0x1bc5d5a5>;
- 	id =3D <1>;
- 	execution-ctx-count =3D <8>;
- 	exception-level =3D <2>; /* S-EL1 */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0004-p=
lat-totalcompute-add-support-for-higher-DRAM.patch b/meta-arm-bsp/recipes=
-security/optee/files/optee-os/tc/0004-plat-totalcompute-add-support-for-=
higher-DRAM.patch
deleted file mode 100644
index 293ea7d0..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0004-plat-tot=
alcompute-add-support-for-higher-DRAM.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 7fb6d720a285b6135a9247b2adde833ea90e2549 Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Mon, 27 Sep 2021 19:58:56 +0100
-Subject: [PATCH] plat-totalcompute: add support for higher DRAM
-
-The new 6GB DRAM bank starts at 0x8080000000.
-
-Signed-off-by: Usama Arif <usama.arif@arm.com>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/6d8=
430f943e091282849b188fbc0847c159e5de4]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
----
- core/arch/arm/plat-totalcompute/conf.mk           | 2 ++
- core/arch/arm/plat-totalcompute/main.c            | 1 +
- core/arch/arm/plat-totalcompute/platform_config.h | 3 +++
- 3 files changed, 6 insertions(+)
-
-diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/pla=
t-totalcompute/conf.mk
-index 558b7889..e894b1e1 100644
---- a/core/arch/arm/plat-totalcompute/conf.mk
-+++ b/core/arch/arm/plat-totalcompute/conf.mk
-@@ -24,6 +24,8 @@ platform-cflags-debug-info =3D -gdwarf-2
- platform-aflags-debug-info =3D -gdwarf-2
- endif
-=20
-+$(call force,CFG_CORE_ARM64_PA_BITS,40)
-+
- ifneq (,$(filter ${PLATFORM_FLAVOR},tc0 tc1))
- CFG_TEE_CORE_NB_CORE =3D 8
-=20
-diff --git a/core/arch/arm/plat-totalcompute/main.c b/core/arch/arm/plat=
-totalcompute/main.c
-index 42acf8dd..eab237bf 100644
---- a/core/arch/arm/plat-totalcompute/main.c
-+++ b/core/arch/arm/plat-totalcompute/main.c
-@@ -27,6 +27,7 @@ register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GI=
C_DIST_REG_SIZE);
- #endif
-=20
- register_ddr(DRAM0_BASE, DRAM0_SIZE);
-+register_ddr(DRAM1_BASE, DRAM1_SIZE);
-=20
- #ifndef CFG_CORE_SEL2_SPMC
- void main_init_gic(void)
-diff --git a/core/arch/arm/plat-totalcompute/platform_config.h b/core/ar=
ch/arm/plat-totalcompute/platform_config.h
-index 4255abca..b474a899 100644
---- a/core/arch/arm/plat-totalcompute/platform_config.h
-+++ b/core/arch/arm/plat-totalcompute/platform_config.h
-@@ -26,6 +26,9 @@
- #define DRAM0_BASE		0x80000000
- #define DRAM0_SIZE		0x7d000000
-=20
-+#define DRAM1_BASE		0x8080000000ULL
-+#define DRAM1_SIZE		0x180000000ULL
-+
- #define TZCDRAM_BASE		0xff000000
- #define TZCDRAM_SIZE		0x01000000
-=20
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc =
b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
index eeaa59a0..31f19158 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
@@ -1,17 +1,10 @@
 # Total Compute (tc) specific configuration for optee-os and optee-os-ta=
devkit
=20
-# Intermediate SHA with 3.14 baseline version
-# This has TC0 and TC1 platform support
-SRCREV =3D "e4f34e786135079160697d88212591105a65fbce"
-PV =3D "3.14.0+git${SRCPV}"
-
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/tc:"
 SRC_URI:append:tc =3D " \
     file://sp_layout.json \
     file://0001-WIP-Enable-managed-exit.patch \
-    file://0002-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch =
\
-    file://0003-Fix-optee-UUID.patch \
-    file://0004-plat-totalcompute-add-support-for-higher-DRAM.patch \
+    file://0002-plat-totalcompute-fix-TZDRAM-start-and-size.patch \
     "
=20
 COMPATIBLE_MACHINE =3D "(tc?)"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0=
.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.=
bbappend
new file mode 100644
index 00000000..6a22d47e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappe=
nd
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc =3D "optee-os-generic-tc.inc"
+
+require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
index f80e09f8..bc933dd5 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
@@ -2,5 +2,6 @@
=20
 MACHINE_OPTEE_OS_REQUIRE ?=3D ""
 MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
+MACHINE_OPTEE_OS_REQUIRE:tc =3D "optee-os-tc.inc"
=20
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappend
new file mode 100644
index 00000000..490b3500
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
+MACHINE_OPTEE_TEST_REQUIRE:tc =3D "optee-test-tc.inc"
+
+require ${MACHINE_OPTEE_TEST_REQUIRE}
--=20
2.34.1


