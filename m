Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B45C4321E
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:58:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.632.1651683513567449572
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arunachalam.ganapathy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5C5111FB;
	Wed,  4 May 2022 09:58:32 -0700 (PDT)
Received: from ts710.cambridge.arm.com (ts710.cambridge.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 199683FA27;
	Wed,  4 May 2022 09:58:31 -0700 (PDT)
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 05/10] arm-bsp/trusted-firmware-a: TC: Add Trusty SP support
Date: Wed,  4 May 2022 17:58:15 +0100
Message-Id: <20220504165820.882784-5-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
References: <20220504165820.882784-1-arunachalam.ganapathy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 May 2022 16:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3361

This patch updates the SHA and include patches that enables Trusty
to run as SP on SEL2 SPMC.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I5586bb3aa592658be9421a4de23f44a69bfb0b2e
---
 .../0002-Enable-CI-700-interconnect.patch     |  34 ----
 ...01-plat-tc-Increase-maximum-BL2-size.patch |   0
 ...t-tc-enable-CI-700-PMU-for-profiling.patch |  32 ++++
 ...add-trusty_sp_fw_config-build-option.patch |  46 +++++
 ...-plat-arm-increase-sp-max-image-size.patch |  30 ++++
 ...x-plat-tc-increase-tc_tzc_dram1_size.patch |  69 +++++++
 ...-tc-add-spmc-manifest-with-trusty-sp.patch | 169 ++++++++++++++++++
 ...ate-dts-with-trusty-compatible-strin.patch |  50 ++++++
 .../tc/0008-fix-plat-tc-disable-smmu.patch    |  64 +++++++
 .../files/{ =3D> tc}/generate_metadata.py       |   0
 .../trusted-firmware-a-tc.inc                 |  11 +-
 11 files changed, 469 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/000=
2-Enable-CI-700-interconnect.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/{ =3D> tc}/0001=
-plat-tc-Increase-maximum-BL2-size.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0002-feat-tc-enable-CI-700-PMU-for-profiling.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0003-Makefile-add-trusty_sp_fw_config-build-option.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0004-fix-plat-arm-increase-sp-max-image-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0005-fix-plat-tc-increase-tc_tzc_dram1_size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0006-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0007-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0008-fix-plat-tc-disable-smmu.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/{ =3D> tc}/gene=
rate_metadata.py (100%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0002-Enabl=
e-CI-700-interconnect.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a=
/files/0002-Enable-CI-700-interconnect.patch
deleted file mode 100644
index 2add0af9..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0002-Enable-CI-70=
0-interconnect.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 366215a3705228a12efe9f92f1d1033f34ee89fa Mon Sep 17 00:00:00 2001
-From: Rupinderjit Singh <rupinderjit.singh@arm.com>
-Date: Thu, 21 Apr 2022 14:45:23 +0100
-Subject: [PATCH] Enable CI-700 interconnect
-
-Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
-Change-Id: Ie56d47a0b65274a467e98b9ecd3caf25dfe10544
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/14918]
-
----
- fdts/tc.dts | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/fdts/tc.dts b/fdts/tc.dts
-index 7c0e84260..d0985851d 100644
---- a/fdts/tc.dts
-+++ b/fdts/tc.dts
-@@ -461,6 +461,12 @@
- 		status =3D "okay";
- 	};
-=20
-+        cmn-pmu {
-+                compatible =3D "arm,ci-700";
-+                reg =3D <0x0 0x50000000 0x0 0x10000000>;
-+                interrupts =3D <0x0 460 0x4>;
-+        };
-+
- 	dp0: display@2cc00000 {
- 		#address-cells =3D <1>;
- 		#size-cells =3D <0>;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-plat-=
tc-Increase-maximum-BL2-size.patch b/meta-arm-bsp/recipes-bsp/trusted-fir=
mware-a/files/tc/0001-plat-tc-Increase-maximum-BL2-size.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/0001-plat-t=
c-Increase-maximum-BL2-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0001-plat-=
tc-Increase-maximum-BL2-size.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-fe=
at-tc-enable-CI-700-PMU-for-profiling.patch b/meta-arm-bsp/recipes-bsp/tr=
usted-firmware-a/files/tc/0002-feat-tc-enable-CI-700-PMU-for-profiling.pa=
tch
new file mode 100644
index 00000000..c9016084
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-feat-tc-e=
nable-CI-700-PMU-for-profiling.patch
@@ -0,0 +1,32 @@
+From 1565ac8995f90113b2be5acddc86773bfe0a0ac9 Mon Sep 17 00:00:00 2001
+From: Rupinderjit Singh <rupinderjit.singh@arm.com>
+Date: Tue, 22 Feb 2022 21:50:33 +0000
+Subject: [PATCH 1/7] feat(tc): enable CI-700 PMU for profiling
+
+Change-Id: Iaafdfc440b362022e6103eabf3fb2ebed85b6575
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/14918]
+---
+ fdts/tc.dts | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/fdts/tc.dts b/fdts/tc.dts
+index 7c0e84260..20992294b 100644
+--- a/fdts/tc.dts
++++ b/fdts/tc.dts
+@@ -261,6 +261,12 @@
+ 		arm,mhuv2-protocols =3D <0 1>;
+ 	};
+=20
++	cmn-pmu {
++		compatible =3D "arm,ci-700";
++		reg =3D <0x0 0x50000000 0x0 0x10000000>;
++		interrupts =3D <0x0 460 0x4>;
++	};
++
+ 	scmi {
+ 		compatible =3D "arm,scmi";
+ 		mbox-names =3D "tx", "rx";
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0003-Ma=
kefile-add-trusty_sp_fw_config-build-option.patch b/meta-arm-bsp/recipes-=
bsp/trusted-firmware-a/files/tc/0003-Makefile-add-trusty_sp_fw_config-bui=
ld-option.patch
new file mode 100644
index 00000000..f5ddb0f2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0003-Makefile-=
add-trusty_sp_fw_config-build-option.patch
@@ -0,0 +1,46 @@
+From f602df2563cbae1fce2559430a394180983fbbaf Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Mon, 11 Apr 2022 14:36:54 +0100
+Subject: [PATCH 2/7] Makefile: add trusty_sp_fw_config build option
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Ief90ae9113d32265ee2200f35f3e517b7b9a4bea
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ Makefile                            | 4 ++++
+ docs/plat/arm/arm-build-options.rst | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index f91699c44..f401a0010 100644
+--- a/Makefile
++++ b/Makefile
+@@ -533,6 +533,10 @@ ifneq (${SPD},none)
+             DTC_CPPFLAGS	+=3D	-DOPTEE_SP_FW_CONFIG
+         endif
+=20
++        ifeq ($(findstring trusty_sp,$(ARM_SPMC_MANIFEST_DTS)),trusty_s=
p)
++            DTC_CPPFLAGS	+=3D	-DTRUSTY_SP_FW_CONFIG
++        endif
++
+         ifeq ($(TS_SP_FW_CONFIG),1)
+             DTC_CPPFLAGS	+=3D	-DTS_SP_FW_CONFIG
+         endif
+diff --git a/docs/plat/arm/arm-build-options.rst b/docs/plat/arm/arm-bui=
ld-options.rst
+index 339ebbe33..3c9a41fb8 100644
+--- a/docs/plat/arm/arm-build-options.rst
++++ b/docs/plat/arm/arm-build-options.rst
+@@ -107,6 +107,10 @@ Arm Platform Build Options
+    device tree. This flag is defined only when ``ARM_SPMC_MANIFEST_DTS`=
` manifest
+    file name contains pattern optee_sp.
+=20
++-  ``TRUSTY_SP_FW_CONFIG``: DTC build flag to include Trusty as SP in
++   tb_fw_config device tree. This flag is defined only when
++   ``ARM_SPMC_MANIFEST_DTS`` manifest file name contains pattern trusty=
_sp.
++
+ -  ``TS_SP_FW_CONFIG``: DTC build flag to include Trusted Services (Cry=
pto and
+    internal-trusted-storage) as SP in tb_fw_config device tree.
+=20
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0004-fi=
x-plat-arm-increase-sp-max-image-size.patch b/meta-arm-bsp/recipes-bsp/tr=
usted-firmware-a/files/tc/0004-fix-plat-arm-increase-sp-max-image-size.pa=
tch
new file mode 100644
index 00000000..c61e9b58
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0004-fix-plat-=
arm-increase-sp-max-image-size.patch
@@ -0,0 +1,30 @@
+From d5a8e035de394f7a8924151318abc094d9ae68ae Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Mon, 11 Apr 2022 18:31:01 +0100
+Subject: [PATCH 3/7] fix(plat/arm): increase sp max image size
+
+Increase ARM_SP_MAX_SIZE to support Trusty image.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I9ef9e755769445aee998062a7fba508fad50b33e
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ include/plat/arm/common/fconf_arm_sp_getter.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/plat/arm/common/fconf_arm_sp_getter.h b/include/pla=
t/arm/common/fconf_arm_sp_getter.h
+index aa628dfd3..3ed953d1c 100644
+--- a/include/plat/arm/common/fconf_arm_sp_getter.h
++++ b/include/plat/arm/common/fconf_arm_sp_getter.h
+@@ -13,7 +13,7 @@
+ /* arm_sp getter */
+ #define arm__sp_getter(prop)	arm_sp.prop
+=20
+-#define ARM_SP_MAX_SIZE		U(0xb0000)
++#define ARM_SP_MAX_SIZE		U(0x2000000)
+ #define ARM_SP_OWNER_NAME_LEN	U(8)
+=20
+ struct arm_sp_t {
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0005-fi=
x-plat-tc-increase-tc_tzc_dram1_size.patch b/meta-arm-bsp/recipes-bsp/tru=
sted-firmware-a/files/tc/0005-fix-plat-tc-increase-tc_tzc_dram1_size.patc=
h
new file mode 100644
index 00000000..c6d4d862
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0005-fix-plat-=
tc-increase-tc_tzc_dram1_size.patch
@@ -0,0 +1,69 @@
+From f6485e50af73c905faa0777e462ffdfa483d19da Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Mon, 11 Apr 2022 17:38:17 +0100
+Subject: [PATCH 4/7] fix(plat/tc): increase tc_tzc_dram1_size
+
+Increase TC_TZC_DRAM1_SIZE for Trusty image and its memory size.
+Update OP-TEE reserved memory range in DTS
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Iad433c3c155f28860b15bde2398df653487189dd
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ fdts/tc.dts                              |  4 ++--
+ plat/arm/board/tc/include/platform_def.h | 10 ++++++----
+ 2 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/fdts/tc.dts b/fdts/tc.dts
+index 20992294b..af64504a4 100644
+--- a/fdts/tc.dts
++++ b/fdts/tc.dts
+@@ -213,8 +213,8 @@
+ 			linux,cma-default;
+ 		};
+=20
+-		optee@0xfce00000 {
+-			reg =3D <0x00000000 0xfce00000 0 0x00200000>;
++		optee@0xf8e00000 {
++			reg =3D <0x00000000 0xf8e00000 0 0x00200000>;
+ 			no-map;
+ 		};
+ 	};
+diff --git a/plat/arm/board/tc/include/platform_def.h b/plat/arm/board/t=
c/include/platform_def.h
+index 745d91cab..73b984308 100644
+--- a/plat/arm/board/tc/include/platform_def.h
++++ b/plat/arm/board/tc/include/platform_def.h
+@@ -31,7 +31,7 @@
+  */
+ #define TC_TZC_DRAM1_BASE		(ARM_AP_TZC_DRAM1_BASE -	\
+ 					 TC_TZC_DRAM1_SIZE)
+-#define TC_TZC_DRAM1_SIZE		UL(0x02000000)	/* 32 MB */
++#define TC_TZC_DRAM1_SIZE		UL(0x06000000)	/* 96 MB */
+ #define TC_TZC_DRAM1_END		(TC_TZC_DRAM1_BASE +		\
+ 					 TC_TZC_DRAM1_SIZE - 1)
+=20
+@@ -68,7 +68,9 @@
+  * max size of BL32 image.
+  */
+ #if defined(SPD_spmd)
+-#define PLAT_ARM_SPMC_BASE		TC_TZC_DRAM1_BASE
++#define TC_EL2SPMC_LOAD_ADDR		(TC_TZC_DRAM1_BASE + 0x04000000)
++
++#define PLAT_ARM_SPMC_BASE		TC_EL2SPMC_LOAD_ADDR
+ #define PLAT_ARM_SPMC_SIZE		UL(0x200000)  /* 2 MB */
+ #endif
+=20
+@@ -259,8 +261,8 @@
+ 		(TZC_REGION_ACCESS_RDWR(TZC_NSAID_DEFAULT))
+=20
+ /*
+- * The first region below, TC_TZC_DRAM1_BASE (0xfd000000) to
+- * ARM_SCP_TZC_DRAM1_END (0xffffffff) will mark the last 48 MB of DRAM =
as
++ * The first region below, TC_TZC_DRAM1_BASE (0xf9000000) to
++ * ARM_SCP_TZC_DRAM1_END (0xffffffff) will mark the last 112 MB of DRAM=
 as
+  * secure. The second and third regions gives non secure access to rest=
 of DRAM.
+  */
+ #define TC_TZC_REGIONS_DEF	\
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0006-fe=
at-plat-tc-add-spmc-manifest-with-trusty-sp.patch b/meta-arm-bsp/recipes-=
bsp/trusted-firmware-a/files/tc/0006-feat-plat-tc-add-spmc-manifest-with-=
trusty-sp.patch
new file mode 100644
index 00000000..73a301b8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0006-feat-plat=
-tc-add-spmc-manifest-with-trusty-sp.patch
@@ -0,0 +1,169 @@
+From bdf66cf30ed4cb0c16a5335fbb68fa0b2e253f7c Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Mon, 11 Apr 2022 14:43:15 +0100
+Subject: [PATCH 5/7] feat(plat/tc): add spmc manifest with trusty sp
+
+Add SPMC manifest with Trusty SP. Define Trusty's load address,
+vcpu count, memory size.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: If4363580a478776d233f7f391a30e1cb345453c2
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../tc/fdts/tc_spmc_trusty_sp_manifest.dts    | 120 ++++++++++++++++++
+ plat/arm/board/tc/fdts/tc_tb_fw_config.dts    |   7 +-
+ 2 files changed, 126 insertions(+), 1 deletion(-)
+ create mode 100644 plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dt=
s
+
+diff --git a/plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts b/pla=
t/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts
+new file mode 100644
+index 000000000..e2ea7b811
+--- /dev/null
++++ b/plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts
+@@ -0,0 +1,120 @@
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++/dts-v1/;
++
++/ {
++	compatible =3D "arm,ffa-core-manifest-1.0";
++	#address-cells =3D <2>;
++	#size-cells =3D <1>;
++
++	attribute {
++		spmc_id =3D <0x8000>;
++		maj_ver =3D <0x1>;
++		min_ver =3D <0x1>;
++		exec_state =3D <0x0>;
++		load_address =3D <0x0 0xfd000000>;
++		entrypoint =3D <0x0 0xfd000000>;
++		binary_size =3D <0x80000>;
++	};
++
++	hypervisor {
++		compatible =3D "hafnium,hafnium";
++		vm1 {
++			is_ffa_partition;
++			debug_name =3D "trusty";
++			load_address =3D <0xf901f000>;
++			vcpu_count =3D <8>;
++			mem_size =3D <0x3f00000>; /* 64MB TZC DRAM - 1MB align */
++		};
++#ifdef TS_SP_FW_CONFIG
++		vm2 {
++			is_ffa_partition;
++			debug_name =3D "internal-trusted-storage";
++			load_address =3D <0xfee00000>;
++			vcpu_count =3D <1>;
++			mem_size =3D <2097152>; /* 2MB TZC DRAM */
++		};
++		vm3 {
++			is_ffa_partition;
++			debug_name =3D "crypto";
++			load_address =3D <0xfec00000>;
++			vcpu_count =3D <1>;
++			mem_size =3D <2097152>; /* 2MB TZC DRAM */
++		};
++#endif
++	};
++
++	cpus {
++		#address-cells =3D <0x2>;
++		#size-cells =3D <0x0>;
++
++		CPU0:cpu@0 {
++			device_type =3D "cpu";
++			compatible =3D "arm,armv8";
++			reg =3D <0x0 0x0>;
++			enable-method =3D "psci";
++		};
++
++		/*
++		 * SPMC (Hafnium) requires secondary cpu nodes are declared in
++		 * descending order
++		 */
++		CPU7:cpu@700 {
++			device_type =3D "cpu";
++			compatible =3D "arm,armv8";
++			reg =3D <0x0 0x700>;
++			enable-method =3D "psci";
++		};
++
++		CPU6:cpu@600 {
++			device_type =3D "cpu";
++			compatible =3D "arm,armv8";
++			reg =3D <0x0 0x600>;
++			enable-method =3D "psci";
++		};
++
++		CPU5:cpu@500 {
++			device_type =3D "cpu";
++			compatible =3D "arm,armv8";
++			reg =3D <0x0 0x500>;
++			enable-method =3D "psci";
++		};
++
++		CPU4:cpu@400 {
++			device_type =3D "cpu";
++			compatible =3D "arm,armv8";
++			reg =3D <0x0 0x400>;
++			enable-method =3D "psci";
++		};
++
++		CPU3:cpu@300 {
++			device_type =3D "cpu";
++			compatible =3D "arm,armv8";
++			reg =3D <0x0 0x300>;
++			enable-method =3D "psci";
++		};
++
++		CPU2:cpu@200 {
++			device_type =3D "cpu";
++			compatible =3D "arm,armv8";
++			reg =3D <0x0 0x200>;
++			enable-method =3D "psci";
++		};
++
++		CPU1:cpu@100 {
++			device_type =3D "cpu";
++			compatible =3D "arm,armv8";
++			reg =3D <0x0 0x100>;
++			enable-method =3D "psci";
++		};
++	};
++
++	/* 96MB of TC_TZC_DRAM1_BASE */
++	memory@f9000000 {
++		device_type =3D "memory";
++		reg =3D <0x0 0xf9000000 0x6000000>;
++	};
++};
+diff --git a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts b/plat/arm/board=
/tc/fdts/tc_tb_fw_config.dts
+index 4c6ccef25..a72772fb3 100644
+--- a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
++++ b/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited. All rights reserved.
++ * Copyright (c) 2020-2022, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -47,6 +47,11 @@
+ 		       uuid =3D "486178e0-e7f8-11e3-bc5e-0002a5d5c51b";
+ 		       load-address =3D <0xfd280000>;
+ 		};
++#elif TRUSTY_SP_FW_CONFIG
++		trusty {
++		       uuid =3D "40ee25f0-a2bc-304c-8c4c-a173c57d8af1";
++		       load-address =3D <0xf901f000>;
++		};
+ #else
+ 		cactus-primary {
+ 			uuid =3D "b4b5671e-4a90-4fe1-b81f-fb13dae1dacb";
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-fe=
at-plat-tc-update-dts-with-trusty-compatible-strin.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-a/files/tc/0007-feat-plat-tc-update-dts-with-=
trusty-compatible-strin.patch
new file mode 100644
index 00000000..f623e4de
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-feat-plat=
-tc-update-dts-with-trusty-compatible-strin.patch
@@ -0,0 +1,50 @@
+From c2f939891e46e2ef9b54ed5e270e42187fdc57b3 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Wed, 30 Mar 2022 12:14:49 +0000
+Subject: [PATCH 6/7] feat(plat/tc): update dts with trusty compatible st=
ring
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: Ic6661df479e114bf3f464165c14df5fa02dc0139
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ fdts/tc.dts | 26 ++++++++++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+
+diff --git a/fdts/tc.dts b/fdts/tc.dts
+index af64504a4..dc86958bf 100644
+--- a/fdts/tc.dts
++++ b/fdts/tc.dts
+@@ -555,4 +555,30 @@
+ 		compatible =3D "arm,trace-buffer-extension";
+ 		interrupts =3D <1 2 4>;
+ 	};
++
++	trusty {
++		#size-cells =3D <0x02>;
++		#address-cells =3D <0x02>;
++		ranges =3D <0x00>;
++		compatible =3D "android,trusty-v1";
++
++		virtio {
++			compatible =3D "android,trusty-virtio-v1";
++		};
++
++		test {
++			compatible =3D "android,trusty-test-v1";
++		};
++
++		log {
++			compatible =3D "android,trusty-log-v1";
++		};
++
++		irq {
++			ipi-range =3D <0x08 0x0f 0x08>;
++			interrupt-ranges =3D <0x00 0x0f 0x00 0x10 0x1f 0x01 0x20 0x3f 0x02>;
++			interrupt-templates =3D <0x01 0x00 0x8001 0x01 0x01 0x04 0x8001 0x01=
 0x00 0x04>;
++			compatible =3D "android,trusty-irq-v1";
++		};
++	};
+ };
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0008-fi=
x-plat-tc-disable-smmu.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-=
a/files/tc/0008-fix-plat-tc-disable-smmu.patch
new file mode 100644
index 00000000..50924869
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0008-fix-plat-=
tc-disable-smmu.patch
@@ -0,0 +1,64 @@
+From d67e1f76be37127b0fe2a84ee631c5a799c426ba Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Wed, 27 Apr 2022 18:15:47 +0100
+Subject: [PATCH 7/7] fix(plat/tc): disable smmu
+
+Reserve static shared-dma-pool below 4GB. This removes dependency on
+SMMU driver. As there are stability issues in SMMU driver, it is
+disabled. This change is temporary and will be reverted upon proper
+fix and testing.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I6b1b4c2a0acdf62df8c26007c7ca596774e13710
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ fdts/tc.dts | 16 +++-------------
+ 1 file changed, 3 insertions(+), 13 deletions(-)
+
+diff --git a/fdts/tc.dts b/fdts/tc.dts
+index dc86958bf..fbae3e3e8 100644
+--- a/fdts/tc.dts
++++ b/fdts/tc.dts
+@@ -209,12 +209,12 @@
+ 		linux,cma {
+ 			compatible =3D "shared-dma-pool";
+ 			reusable;
+-			size =3D <0x0 0x8000000>;
++			reg =3D <0x0 0xf1000000 0x0 0x8000000>;
+ 			linux,cma-default;
+ 		};
+=20
+-		optee@0xf8e00000 {
+-			reg =3D <0x00000000 0xf8e00000 0 0x00200000>;
++		optee@0xf0e00000 {
++			reg =3D <0x0 0xf0e00000 0 0x00200000>;
+ 			no-map;
+ 		};
+ 	};
+@@ -460,13 +460,6 @@
+ 		>;
+ 	};
+=20
+-	smmu: smmu@2ce00000 {
+-		#iommu-cells =3D <1>;
+-		compatible =3D "arm,smmu-v3";
+-		reg =3D <0x0 0x2ce00000 0x0 0x20000>;
+-		status =3D "okay";
+-	};
+-
+ 	dp0: display@2cc00000 {
+ 		#address-cells =3D <1>;
+ 		#size-cells =3D <0>;
+@@ -476,9 +469,6 @@
+ 		interrupt-names =3D "DPU";
+ 		clocks =3D <&scmi_clk 0>;
+ 		clock-names =3D "aclk";
+-		iommus =3D <&smmu 0>, <&smmu 1>, <&smmu 2>, <&smmu 3>,
+-			<&smmu 4>, <&smmu 5>, <&smmu 6>, <&smmu 7>,
+-			<&smmu 8>, <&smmu 9>;
+ 		pl0: pipeline@0 {
+ 			reg =3D <0>;
+ 			clocks =3D <&scmi_clk 1>;
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/generate_m=
etadata.py b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/generat=
e_metadata.py
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/generate_me=
tadata.py
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/generate_m=
etadata.py
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-tc.inc
index a54ccbd6..25f67160 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
@@ -1,14 +1,21 @@
 # TC0 specific TFA configuration
=20
 # Intermediate SHA with 2.6 baseline version
-SRCREV_tfa =3D "b06344a3f2c5a0fede3646627f37d1fce3d3d585"
+SRCREV_tfa =3D "141791088eb846c55291b1664813710ed3b532a1"
 PV =3D "2.6+git${SRCPV}"
=20
 DEPENDS +=3D "scp-firmware util-linux-native gptfdisk-native"
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/tc:"
 SRC_URI:append =3D " \
     file://0001-plat-tc-Increase-maximum-BL2-size.patch \
-    file://0002-Enable-CI-700-interconnect.patch \
+    file://0002-feat-tc-enable-CI-700-PMU-for-profiling.patch \
+    file://0003-Makefile-add-trusty_sp_fw_config-build-option.patch \
+    file://0004-fix-plat-arm-increase-sp-max-image-size.patch \
+    file://0005-fix-plat-tc-increase-tc_tzc_dram1_size.patch \
+    file://0006-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch \
+    file://0007-feat-plat-tc-update-dts-with-trusty-compatible-strin.pat=
ch \
+    file://0008-fix-plat-tc-disable-smmu.patch \
     file://generate_metadata.py \
     "
=20
--=20
2.30.2


