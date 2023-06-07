Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97297C7EE37
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 13:48:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9550.1686232116400712806
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 06:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 913AD1042
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Jun 2023 06:49:21 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E0DF93F6C4
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Jun 2023 06:48:35 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/tc1: update to use the latest tf-a
Date: Wed,  7 Jun 2023 09:14:28 -0500
Message-Id: <20230607141428.3313424-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230607141428.3313424-1-jon.mason@arm.com>
References: <20230607141428.3313424-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jun 2023 13:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4750

Change from using a patched, intermediate SHA to the latest.
Unfortunately, the latest stable mbedtls doesn't boot on tc1.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...01-plat-tc-Increase-maximum-BL2-size.patch |  43 -----
 ...add-trusty_sp_fw_config-build-option.patch |  46 -----
 ...-plat-arm-increase-sp-max-image-size.patch |  30 ----
 ...x-plat-tc-increase-tc_tzc_dram1_size.patch |  69 -------
 ...-tc-add-spmc-manifest-with-trusty-sp.patch | 169 ------------------
 ...ate-dts-with-trusty-compatible-strin.patch |  50 ------
 ...ate-trusty-load-address-in-dts-files.patch |  44 -----
 ...add-firmware-update-secure-partition.patch |  63 -------
 ...erve-4-MB-for-stmm-communication-use.patch |  35 ----
 .../trusted-firmware-a-tc.inc                 |  13 --
 10 files changed, 562 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0001-plat-tc-Increase-maximum-BL2-size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0002-Makefile-add-trusty_sp_fw_config-build-option.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0003-fix-plat-arm-increase-sp-max-image-size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0004-fix-plat-tc-increase-tc_tzc_dram1_size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0005-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0006-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0007-feat-arm-tc-Update-trusty-load-address-in-dts-files.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0008-feat-plat-tc-add-firmware-update-secure-partition.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0009-feat-plat-tc-reserve-4-MB-for-stmm-communication-use.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0001-pl=
at-tc-Increase-maximum-BL2-size.patch b/meta-arm-bsp/recipes-bsp/trusted-=
firmware-a/files/tc/0001-plat-tc-Increase-maximum-BL2-size.patch
deleted file mode 100644
index 74ab3612..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0001-plat-tc-I=
ncrease-maximum-BL2-size.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 008cfc6457c239466ca62610d59aaf1a78f6b2f6 Mon Sep 17 00:00:00 2001
-From: Tudor Cretu <tudor.cretu@arm.com>
-Date: Fri, 21 May 2021 14:56:37 +0000
-Subject: [PATCH 1/7] plat: tc: Increase maximum BL2 size.
-
-BL2 size gets increased due to the firmware update changes.
-Increase the MAX_BL2_SIZE by 8Kb.
-
-Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
-Change-Id: I1cb28b0eb7f834426873ff9f4c40bd496413806f
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- plat/arm/board/tc/include/platform_def.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/plat/arm/board/tc/include/platform_def.h b/plat/arm/board/t=
c/include/platform_def.h
-index 745d91cab..cd77773aa 100644
---- a/plat/arm/board/tc/include/platform_def.h
-+++ b/plat/arm/board/tc/include/platform_def.h
-@@ -120,9 +120,9 @@
-  * little space for growth.
-  */
- #if TRUSTED_BOARD_BOOT
--# define PLAT_ARM_MAX_BL2_SIZE		0x20000
-+# define PLAT_ARM_MAX_BL2_SIZE		0x25000
- #else
--# define PLAT_ARM_MAX_BL2_SIZE		0x14000
-+# define PLAT_ARM_MAX_BL2_SIZE		0x19000
- #endif
-=20
- /*
-@@ -130,7 +130,7 @@
-  * calculated using the current BL31 PROGBITS debug size plus the sizes=
 of
-  * BL2 and BL1-RW
-  */
--#define PLAT_ARM_MAX_BL31_SIZE		0x3F000
-+#define PLAT_ARM_MAX_BL31_SIZE		0x4F000
-=20
- /*
-  * Size of cacheable stacks
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-Ma=
kefile-add-trusty_sp_fw_config-build-option.patch b/meta-arm-bsp/recipes-=
bsp/trusted-firmware-a/files/tc/0002-Makefile-add-trusty_sp_fw_config-bui=
ld-option.patch
deleted file mode 100644
index 75cabdd8..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-Makefile-=
add-trusty_sp_fw_config-build-option.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 2f8b0cc6be3787717247d1c02a45181a5ac6f125 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 11 Apr 2022 14:36:54 +0100
-Subject: [PATCH 2/7] Makefile: add trusty_sp_fw_config build option
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: Ief90ae9113d32265ee2200f35f3e517b7b9a4bea
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- Makefile                            | 4 ++++
- docs/plat/arm/arm-build-options.rst | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 3941f8698..a20d647a2 100644
---- a/Makefile
-+++ b/Makefile
-@@ -531,6 +531,10 @@ ifneq (${SPD},none)
-             DTC_CPPFLAGS	+=3D	-DOPTEE_SP_FW_CONFIG
-         endif
-=20
-+        ifeq ($(findstring trusty_sp,$(ARM_SPMC_MANIFEST_DTS)),trusty_s=
p)
-+            DTC_CPPFLAGS	+=3D	-DTRUSTY_SP_FW_CONFIG
-+        endif
-+
-         ifeq ($(TS_SP_FW_CONFIG),1)
-             DTC_CPPFLAGS	+=3D	-DTS_SP_FW_CONFIG
-         endif
-diff --git a/docs/plat/arm/arm-build-options.rst b/docs/plat/arm/arm-bui=
ld-options.rst
-index 339ebbe33..3c9a41fb8 100644
---- a/docs/plat/arm/arm-build-options.rst
-+++ b/docs/plat/arm/arm-build-options.rst
-@@ -107,6 +107,10 @@ Arm Platform Build Options
-    device tree. This flag is defined only when ``ARM_SPMC_MANIFEST_DTS`=
` manifest
-    file name contains pattern optee_sp.
-=20
-+-  ``TRUSTY_SP_FW_CONFIG``: DTC build flag to include Trusty as SP in
-+   tb_fw_config device tree. This flag is defined only when
-+   ``ARM_SPMC_MANIFEST_DTS`` manifest file name contains pattern trusty=
_sp.
-+
- -  ``TS_SP_FW_CONFIG``: DTC build flag to include Trusted Services (Cry=
pto and
-    internal-trusted-storage) as SP in tb_fw_config device tree.
-=20
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0003-fi=
x-plat-arm-increase-sp-max-image-size.patch b/meta-arm-bsp/recipes-bsp/tr=
usted-firmware-a/files/tc/0003-fix-plat-arm-increase-sp-max-image-size.pa=
tch
deleted file mode 100644
index 6807191e..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0003-fix-plat-=
arm-increase-sp-max-image-size.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0060b1a4fbe3bc9992f59a2d4cb986821f7bcf13 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 11 Apr 2022 18:31:01 +0100
-Subject: [PATCH 3/7] fix(plat/arm): increase sp max image size
-
-Increase ARM_SP_MAX_SIZE to support Trusty image.
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I9ef9e755769445aee998062a7fba508fad50b33e
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- include/plat/arm/common/fconf_arm_sp_getter.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/plat/arm/common/fconf_arm_sp_getter.h b/include/pla=
t/arm/common/fconf_arm_sp_getter.h
-index aa628dfd3..3ed953d1c 100644
---- a/include/plat/arm/common/fconf_arm_sp_getter.h
-+++ b/include/plat/arm/common/fconf_arm_sp_getter.h
-@@ -13,7 +13,7 @@
- /* arm_sp getter */
- #define arm__sp_getter(prop)	arm_sp.prop
-=20
--#define ARM_SP_MAX_SIZE		U(0xb0000)
-+#define ARM_SP_MAX_SIZE		U(0x2000000)
- #define ARM_SP_OWNER_NAME_LEN	U(8)
-=20
- struct arm_sp_t {
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0004-fi=
x-plat-tc-increase-tc_tzc_dram1_size.patch b/meta-arm-bsp/recipes-bsp/tru=
sted-firmware-a/files/tc/0004-fix-plat-tc-increase-tc_tzc_dram1_size.patc=
h
deleted file mode 100644
index aec8be0c..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0004-fix-plat-=
tc-increase-tc_tzc_dram1_size.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 000e19d360a5ad9abd7d823af86a364bac2afc58 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 11 Apr 2022 17:38:17 +0100
-Subject: [PATCH 4/7] fix(plat/tc): increase tc_tzc_dram1_size
-
-Increase TC_TZC_DRAM1_SIZE for Trusty image and its memory size.
-Update OP-TEE reserved memory range in DTS
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: Iad433c3c155f28860b15bde2398df653487189dd
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- fdts/tc.dts                              |  4 ++--
- plat/arm/board/tc/include/platform_def.h | 10 ++++++----
- 2 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/fdts/tc.dts b/fdts/tc.dts
-index 20992294b..af64504a4 100644
---- a/fdts/tc.dts
-+++ b/fdts/tc.dts
-@@ -213,8 +213,8 @@
- 			linux,cma-default;
- 		};
-=20
--		optee@0xfce00000 {
--			reg =3D <0x00000000 0xfce00000 0 0x00200000>;
-+		optee@0xf8e00000 {
-+			reg =3D <0x00000000 0xf8e00000 0 0x00200000>;
- 			no-map;
- 		};
- 	};
-diff --git a/plat/arm/board/tc/include/platform_def.h b/plat/arm/board/t=
c/include/platform_def.h
-index cd77773aa..35d8fd24e 100644
---- a/plat/arm/board/tc/include/platform_def.h
-+++ b/plat/arm/board/tc/include/platform_def.h
-@@ -31,7 +31,7 @@
-  */
- #define TC_TZC_DRAM1_BASE		(ARM_AP_TZC_DRAM1_BASE -	\
- 					 TC_TZC_DRAM1_SIZE)
--#define TC_TZC_DRAM1_SIZE		UL(0x02000000)	/* 32 MB */
-+#define TC_TZC_DRAM1_SIZE		UL(0x06000000)	/* 96 MB */
- #define TC_TZC_DRAM1_END		(TC_TZC_DRAM1_BASE +		\
- 					 TC_TZC_DRAM1_SIZE - 1)
-=20
-@@ -68,7 +68,9 @@
-  * max size of BL32 image.
-  */
- #if defined(SPD_spmd)
--#define PLAT_ARM_SPMC_BASE		TC_TZC_DRAM1_BASE
-+#define TC_EL2SPMC_LOAD_ADDR		(TC_TZC_DRAM1_BASE + 0x04000000)
-+
-+#define PLAT_ARM_SPMC_BASE		TC_EL2SPMC_LOAD_ADDR
- #define PLAT_ARM_SPMC_SIZE		UL(0x200000)  /* 2 MB */
- #endif
-=20
-@@ -259,8 +261,8 @@
- 		(TZC_REGION_ACCESS_RDWR(TZC_NSAID_DEFAULT))
-=20
- /*
-- * The first region below, TC_TZC_DRAM1_BASE (0xfd000000) to
-- * ARM_SCP_TZC_DRAM1_END (0xffffffff) will mark the last 48 MB of DRAM =
as
-+ * The first region below, TC_TZC_DRAM1_BASE (0xf9000000) to
-+ * ARM_SCP_TZC_DRAM1_END (0xffffffff) will mark the last 112 MB of DRAM=
 as
-  * secure. The second and third regions gives non secure access to rest=
 of DRAM.
-  */
- #define TC_TZC_REGIONS_DEF	\
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0005-fe=
at-plat-tc-add-spmc-manifest-with-trusty-sp.patch b/meta-arm-bsp/recipes-=
bsp/trusted-firmware-a/files/tc/0005-feat-plat-tc-add-spmc-manifest-with-=
trusty-sp.patch
deleted file mode 100644
index 0b34683e..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0005-feat-plat=
-tc-add-spmc-manifest-with-trusty-sp.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From a04466ceb81a04c5179e8064837c34a89c2b11bd Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 11 Apr 2022 14:43:15 +0100
-Subject: [PATCH 5/7] feat(plat/tc): add spmc manifest with trusty sp
-
-Add SPMC manifest with Trusty SP. Define Trusty's load address,
-vcpu count, memory size.
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: If4363580a478776d233f7f391a30e1cb345453c2
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../tc/fdts/tc_spmc_trusty_sp_manifest.dts    | 120 ++++++++++++++++++
- plat/arm/board/tc/fdts/tc_tb_fw_config.dts    |   7 +-
- 2 files changed, 126 insertions(+), 1 deletion(-)
- create mode 100644 plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dt=
s
-
-diff --git a/plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts b/pla=
t/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts
-new file mode 100644
-index 000000000..e2ea7b811
---- /dev/null
-+++ b/plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts
-@@ -0,0 +1,120 @@
-+/*
-+ * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+/dts-v1/;
-+
-+/ {
-+	compatible =3D "arm,ffa-core-manifest-1.0";
-+	#address-cells =3D <2>;
-+	#size-cells =3D <1>;
-+
-+	attribute {
-+		spmc_id =3D <0x8000>;
-+		maj_ver =3D <0x1>;
-+		min_ver =3D <0x1>;
-+		exec_state =3D <0x0>;
-+		load_address =3D <0x0 0xfd000000>;
-+		entrypoint =3D <0x0 0xfd000000>;
-+		binary_size =3D <0x80000>;
-+	};
-+
-+	hypervisor {
-+		compatible =3D "hafnium,hafnium";
-+		vm1 {
-+			is_ffa_partition;
-+			debug_name =3D "trusty";
-+			load_address =3D <0xf901f000>;
-+			vcpu_count =3D <8>;
-+			mem_size =3D <0x3f00000>; /* 64MB TZC DRAM - 1MB align */
-+		};
-+#ifdef TS_SP_FW_CONFIG
-+		vm2 {
-+			is_ffa_partition;
-+			debug_name =3D "internal-trusted-storage";
-+			load_address =3D <0xfee00000>;
-+			vcpu_count =3D <1>;
-+			mem_size =3D <2097152>; /* 2MB TZC DRAM */
-+		};
-+		vm3 {
-+			is_ffa_partition;
-+			debug_name =3D "crypto";
-+			load_address =3D <0xfec00000>;
-+			vcpu_count =3D <1>;
-+			mem_size =3D <2097152>; /* 2MB TZC DRAM */
-+		};
-+#endif
-+	};
-+
-+	cpus {
-+		#address-cells =3D <0x2>;
-+		#size-cells =3D <0x0>;
-+
-+		CPU0:cpu@0 {
-+			device_type =3D "cpu";
-+			compatible =3D "arm,armv8";
-+			reg =3D <0x0 0x0>;
-+			enable-method =3D "psci";
-+		};
-+
-+		/*
-+		 * SPMC (Hafnium) requires secondary cpu nodes are declared in
-+		 * descending order
-+		 */
-+		CPU7:cpu@700 {
-+			device_type =3D "cpu";
-+			compatible =3D "arm,armv8";
-+			reg =3D <0x0 0x700>;
-+			enable-method =3D "psci";
-+		};
-+
-+		CPU6:cpu@600 {
-+			device_type =3D "cpu";
-+			compatible =3D "arm,armv8";
-+			reg =3D <0x0 0x600>;
-+			enable-method =3D "psci";
-+		};
-+
-+		CPU5:cpu@500 {
-+			device_type =3D "cpu";
-+			compatible =3D "arm,armv8";
-+			reg =3D <0x0 0x500>;
-+			enable-method =3D "psci";
-+		};
-+
-+		CPU4:cpu@400 {
-+			device_type =3D "cpu";
-+			compatible =3D "arm,armv8";
-+			reg =3D <0x0 0x400>;
-+			enable-method =3D "psci";
-+		};
-+
-+		CPU3:cpu@300 {
-+			device_type =3D "cpu";
-+			compatible =3D "arm,armv8";
-+			reg =3D <0x0 0x300>;
-+			enable-method =3D "psci";
-+		};
-+
-+		CPU2:cpu@200 {
-+			device_type =3D "cpu";
-+			compatible =3D "arm,armv8";
-+			reg =3D <0x0 0x200>;
-+			enable-method =3D "psci";
-+		};
-+
-+		CPU1:cpu@100 {
-+			device_type =3D "cpu";
-+			compatible =3D "arm,armv8";
-+			reg =3D <0x0 0x100>;
-+			enable-method =3D "psci";
-+		};
-+	};
-+
-+	/* 96MB of TC_TZC_DRAM1_BASE */
-+	memory@f9000000 {
-+		device_type =3D "memory";
-+		reg =3D <0x0 0xf9000000 0x6000000>;
-+	};
-+};
-diff --git a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts b/plat/arm/board=
/tc/fdts/tc_tb_fw_config.dts
-index 4c6ccef25..a72772fb3 100644
---- a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
-+++ b/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2021, Arm Limited. All rights reserved.
-+ * Copyright (c) 2020-2022, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -47,6 +47,11 @@
- 		       uuid =3D "486178e0-e7f8-11e3-bc5e-0002a5d5c51b";
- 		       load-address =3D <0xfd280000>;
- 		};
-+#elif TRUSTY_SP_FW_CONFIG
-+		trusty {
-+		       uuid =3D "40ee25f0-a2bc-304c-8c4c-a173c57d8af1";
-+		       load-address =3D <0xf901f000>;
-+		};
- #else
- 		cactus-primary {
- 			uuid =3D "b4b5671e-4a90-4fe1-b81f-fb13dae1dacb";
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0006-fe=
at-plat-tc-update-dts-with-trusty-compatible-strin.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-a/files/tc/0006-feat-plat-tc-update-dts-with-=
trusty-compatible-strin.patch
deleted file mode 100644
index e2bfb2c5..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0006-feat-plat=
-tc-update-dts-with-trusty-compatible-strin.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 96151af7eed28d63fdaa1ac6de2d14a9c71f1d4a Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Wed, 30 Mar 2022 12:14:49 +0000
-Subject: [PATCH 6/7] feat(plat/tc): update dts with trusty compatible st=
ring
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: Ic6661df479e114bf3f464165c14df5fa02dc0139
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- fdts/tc.dts | 26 ++++++++++++++++++++++++++
- 1 file changed, 26 insertions(+)
-
-diff --git a/fdts/tc.dts b/fdts/tc.dts
-index af64504a4..dc86958bf 100644
---- a/fdts/tc.dts
-+++ b/fdts/tc.dts
-@@ -555,4 +555,30 @@
- 		compatible =3D "arm,trace-buffer-extension";
- 		interrupts =3D <1 2 4>;
- 	};
-+
-+	trusty {
-+		#size-cells =3D <0x02>;
-+		#address-cells =3D <0x02>;
-+		ranges =3D <0x00>;
-+		compatible =3D "android,trusty-v1";
-+
-+		virtio {
-+			compatible =3D "android,trusty-virtio-v1";
-+		};
-+
-+		test {
-+			compatible =3D "android,trusty-test-v1";
-+		};
-+
-+		log {
-+			compatible =3D "android,trusty-log-v1";
-+		};
-+
-+		irq {
-+			ipi-range =3D <0x08 0x0f 0x08>;
-+			interrupt-ranges =3D <0x00 0x0f 0x00 0x10 0x1f 0x01 0x20 0x3f 0x02>;
-+			interrupt-templates =3D <0x01 0x00 0x8001 0x01 0x01 0x04 0x8001 0x01=
 0x00 0x04>;
-+			compatible =3D "android,trusty-irq-v1";
-+		};
-+	};
- };
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-fe=
at-arm-tc-Update-trusty-load-address-in-dts-files.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-a/files/tc/0007-feat-arm-tc-Update-trusty-load=
-address-in-dts-files.patch
deleted file mode 100644
index c5a25e9a..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-feat-arm-=
tc-Update-trusty-load-address-in-dts-files.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ea9556a14bec0249ac6e01e4a55cbb04fd15b51a Mon Sep 17 00:00:00 2001
-From: Rupinderjit Singh <rupinderjit.singh@arm.com>
-Date: Wed, 27 Jul 2022 09:23:58 +0100
-Subject: [PATCH] feat(arm/tc): Update trusty load-address in dts files.
-
-Change is required to align with sp header size change from 0x1000 to 0x=
4000
-
-Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
-Change-Id: Ieeaa7450196b33ecff1612cf3b55cf173a7941e0
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts | 2 +-
- plat/arm/board/tc/fdts/tc_tb_fw_config.dts            | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts b/pla=
t/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts
-index e2ea7b811..66a686c9a 100644
---- a/plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts
-+++ b/plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts
-@@ -25,7 +25,7 @@
- 		vm1 {
- 			is_ffa_partition;
- 			debug_name =3D "trusty";
--			load_address =3D <0xf901f000>;
-+			load_address =3D <0xf901c000>;
- 			vcpu_count =3D <8>;
- 			mem_size =3D <0x3f00000>; /* 64MB TZC DRAM - 1MB align */
- 		};
-diff --git a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts b/plat/arm/board=
/tc/fdts/tc_tb_fw_config.dts
-index a72772fb3..a5bb520fe 100644
---- a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
-+++ b/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
-@@ -50,7 +50,7 @@
- #elif TRUSTY_SP_FW_CONFIG
- 		trusty {
- 		       uuid =3D "40ee25f0-a2bc-304c-8c4c-a173c57d8af1";
--		       load-address =3D <0xf901f000>;
-+		       load-address =3D <0xf901c000>;
- 		};
- #else
- 		cactus-primary {
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0008-fe=
at-plat-tc-add-firmware-update-secure-partition.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-a/files/tc/0008-feat-plat-tc-add-firmware-update=
-secure-partition.patch
deleted file mode 100644
index d36d9591..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0008-feat-plat=
-tc-add-firmware-update-secure-partition.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 16f183e3c09d64fee92638ea9d0017ac7973ddf8 Mon Sep 17 00:00:00 2001
-From: Tudor Cretu <tudor.cretu@arm.com>
-Date: Fri, 24 Sep 2021 12:09:53 +0000
-Subject: [PATCH 1/2] feat(plat/tc): add firmware update secure partition
-
-Firmware update is a trusted service secure partition that implements
-the PSA firmware update specification. It executes in the secure world
-in total compute platform.
-
-Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
-Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
-Change-Id: I6223d247b078de8c03b068185bf120b3d502f500
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- plat/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts | 9 ++++++++-
- plat/arm/board/tc/fdts/tc_tb_fw_config.dts           | 4 ++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/plat/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts b/plat=
/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts
-index 92e2ddda6..23ad06888 100644
---- a/plat/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts
-+++ b/plat/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts
-@@ -28,7 +28,7 @@
- 			load_address =3D <0xfd280000>;
- 			vcpu_count =3D <8>;
- #ifdef TS_SP_FW_CONFIG
--			mem_size =3D <26738688>; /* 25MB TZC DRAM */
-+			mem_size =3D <20447232>; /* 19MB TZC DRAM */
- #else
- 			mem_size =3D <30928896>; /* 29MB TZC DRAM */
- #endif
-@@ -48,6 +48,13 @@
- 			vcpu_count =3D <1>;
- 			mem_size =3D <2097152>; /* 2MB TZC DRAM */
- 		};
-+		vm4 {
-+			is_ffa_partition;
-+			debug_name =3D "firmware-update";
-+			load_address =3D <0xfe600000>;
-+			vcpu_count =3D <1>;
-+			mem_size =3D <6291456>; /* 6MB TZC DRAM */
-+		};
- #endif
- 	};
-=20
-diff --git a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts b/plat/arm/board=
/tc/fdts/tc_tb_fw_config.dts
-index a5bb520fe..2c640b363 100644
---- a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
-+++ b/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
-@@ -41,6 +41,10 @@
- 		       uuid =3D "d9df52d5-16a2-4bb2-9aa4-d26d3b84e8c0";
- 		       load-address =3D <0xfec00000>;
- 		};
-+		firmware-update {
-+		       uuid =3D "6823a838-1b06-470e-9774-0cce8bfb53fd";
-+		       load-address =3D <0xfe600000>;
-+		};
- #endif
- #if OPTEE_SP_FW_CONFIG
- 		op-tee {
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0009-fe=
at-plat-tc-reserve-4-MB-for-stmm-communication-use.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-a/files/tc/0009-feat-plat-tc-reserve-4-MB-for=
-stmm-communication-use.patch
deleted file mode 100644
index f20f9480..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0009-feat-plat=
-tc-reserve-4-MB-for-stmm-communication-use.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a8cdd6c67d26c15642338a45279db5e39cf4e565 Mon Sep 17 00:00:00 2001
-From: Davidson K <davidson.kumaresan@arm.com>
-Date: Fri, 3 Jun 2022 18:16:31 +0530
-Subject: [PATCH 2/2] feat(plat/tc): reserve 4 MB for stmm communication =
used
- for firmware update
-
-The firmware update secure partition and u-boot communicates using
-the stmm communication layer and it needs a dedicated memory region.
-
-Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
-Change-Id: I8d4da5c26843d225983dcaee0757694a6d43234c
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- fdts/tc.dts | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/fdts/tc.dts b/fdts/tc.dts
-index dc86958bf..cb504c4a2 100644
---- a/fdts/tc.dts
-+++ b/fdts/tc.dts
-@@ -217,6 +217,11 @@
- 			reg =3D <0x00000000 0xf8e00000 0 0x00200000>;
- 			no-map;
- 		};
-+
-+		fwu_mm@0xfca00000 {
-+			reg =3D <0x00000000 0xfca00000 0 0x00400000>;
-+			no-map;
-+		};
- 	};
-=20
- 	psci {
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-tc.inc
index 301f97c8..e17a8f59 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
@@ -1,22 +1,9 @@
 # TC0 specific TFA configuration
=20
-# Intermediate SHA with 2.7 baseline version
-SRCREV_tfa =3D "e95abc4c01822ef43e9e874d63d6596dc0b57279"
-PV =3D "2.7+git${SRCPV}"
-
 DEPENDS +=3D "scp-firmware util-linux-native gptfdisk-native"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/tc:"
 SRC_URI:append =3D " \
-    file://0001-plat-tc-Increase-maximum-BL2-size.patch \
-    file://0002-Makefile-add-trusty_sp_fw_config-build-option.patch \
-    file://0003-fix-plat-arm-increase-sp-max-image-size.patch \
-    file://0004-fix-plat-tc-increase-tc_tzc_dram1_size.patch \
-    file://0005-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch \
-    file://0006-feat-plat-tc-update-dts-with-trusty-compatible-strin.pat=
ch \
-    file://0007-feat-arm-tc-Update-trusty-load-address-in-dts-files.patc=
h \
-    file://0008-feat-plat-tc-add-firmware-update-secure-partition.patch =
\
-    file://0009-feat-plat-tc-reserve-4-MB-for-stmm-communication-use.pat=
ch \
     file://generate_metadata.py \
     "
=20
--=20
2.30.2


