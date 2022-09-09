Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06632C6FA8B
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 07:00:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3718.1662706789233027709
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 23:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: davidson.kumaresan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA57215DB;
	Thu,  8 Sep 2022 23:59:54 -0700 (PDT)
Received: from usa.arm.com (unknown [10.162.16.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D14E73F73D;
	Fri,  9 Sep 2022 00:00:15 -0700 (PDT)
From: Davidson K <davidson.kumaresan@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Davidson K <davidson.kumaresan@arm.com>
Subject: [PATCH 1/3] arm-bsp/tc: upgrade version of trusted-firmware-a
Date: Fri,  9 Sep 2022 12:29:25 +0530
Message-Id: <20220909065927.11581-1-davidson.kumaresan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 07:00:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3750

Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
Change-Id: I2100b5f0f7af23f59611f4e591efb09d3bcd6942
---
 ...ate-trusty-load-address-in-dts-files.patch | 44 +++++++++++++
 .../tc/0007-fix-plat-tc-disable-smmu.patch    | 64 -------------------
 .../trusted-firmware-a-tc.inc                 |  7 +-
 3 files changed, 50 insertions(+), 65 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0007-feat-arm-tc-Update-trusty-load-address-in-dts-files.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0007-fix-plat-tc-disable-smmu.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-fe=
at-arm-tc-Update-trusty-load-address-in-dts-files.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-a/files/tc/0007-feat-arm-tc-Update-trusty-load=
-address-in-dts-files.patch
new file mode 100644
index 00000000..c5a25e9a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-feat-arm-=
tc-Update-trusty-load-address-in-dts-files.patch
@@ -0,0 +1,44 @@
+From ea9556a14bec0249ac6e01e4a55cbb04fd15b51a Mon Sep 17 00:00:00 2001
+From: Rupinderjit Singh <rupinderjit.singh@arm.com>
+Date: Wed, 27 Jul 2022 09:23:58 +0100
+Subject: [PATCH] feat(arm/tc): Update trusty load-address in dts files.
+
+Change is required to align with sp header size change from 0x1000 to 0x=
4000
+
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
+Change-Id: Ieeaa7450196b33ecff1612cf3b55cf173a7941e0
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts | 2 +-
+ plat/arm/board/tc/fdts/tc_tb_fw_config.dts            | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts b/pla=
t/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts
+index e2ea7b811..66a686c9a 100644
+--- a/plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts
++++ b/plat/arm/board/tc/fdts/tc_spmc_trusty_sp_manifest.dts
+@@ -25,7 +25,7 @@
+ 		vm1 {
+ 			is_ffa_partition;
+ 			debug_name =3D "trusty";
+-			load_address =3D <0xf901f000>;
++			load_address =3D <0xf901c000>;
+ 			vcpu_count =3D <8>;
+ 			mem_size =3D <0x3f00000>; /* 64MB TZC DRAM - 1MB align */
+ 		};
+diff --git a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts b/plat/arm/board=
/tc/fdts/tc_tb_fw_config.dts
+index a72772fb3..a5bb520fe 100644
+--- a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
++++ b/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
+@@ -50,7 +50,7 @@
+ #elif TRUSTY_SP_FW_CONFIG
+ 		trusty {
+ 		       uuid =3D "40ee25f0-a2bc-304c-8c4c-a173c57d8af1";
+-		       load-address =3D <0xf901f000>;
++		       load-address =3D <0xf901c000>;
+ 		};
+ #else
+ 		cactus-primary {
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-fi=
x-plat-tc-disable-smmu.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-=
a/files/tc/0007-fix-plat-tc-disable-smmu.patch
deleted file mode 100644
index 91f5a9ef..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-fix-plat-=
tc-disable-smmu.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 1a051bef6c63f6871edd8d87e969460f073820a7 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Wed, 27 Apr 2022 18:15:47 +0100
-Subject: [PATCH 7/7] fix(plat/tc): disable smmu
-
-Reserve static shared-dma-pool below 4GB. This removes dependency on
-SMMU driver. As there are stability issues in SMMU driver, it is
-disabled. This change is temporary and will be reverted upon proper
-fix and testing.
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I6b1b4c2a0acdf62df8c26007c7ca596774e13710
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- fdts/tc.dts | 16 +++-------------
- 1 file changed, 3 insertions(+), 13 deletions(-)
-
-diff --git a/fdts/tc.dts b/fdts/tc.dts
-index dc86958bf..fbae3e3e8 100644
---- a/fdts/tc.dts
-+++ b/fdts/tc.dts
-@@ -209,12 +209,12 @@
- 		linux,cma {
- 			compatible =3D "shared-dma-pool";
- 			reusable;
--			size =3D <0x0 0x8000000>;
-+			reg =3D <0x0 0xf1000000 0x0 0x8000000>;
- 			linux,cma-default;
- 		};
-=20
--		optee@0xf8e00000 {
--			reg =3D <0x00000000 0xf8e00000 0 0x00200000>;
-+		optee@0xf0e00000 {
-+			reg =3D <0x0 0xf0e00000 0 0x00200000>;
- 			no-map;
- 		};
- 	};
-@@ -460,13 +460,6 @@
- 		>;
- 	};
-=20
--	smmu: smmu@2ce00000 {
--		#iommu-cells =3D <1>;
--		compatible =3D "arm,smmu-v3";
--		reg =3D <0x0 0x2ce00000 0x0 0x20000>;
--		status =3D "okay";
--	};
--
- 	dp0: display@2cc00000 {
- 		#address-cells =3D <1>;
- 		#size-cells =3D <0>;
-@@ -476,9 +469,6 @@
- 		interrupt-names =3D "DPU";
- 		clocks =3D <&scmi_clk 0>;
- 		clock-names =3D "aclk";
--		iommus =3D <&smmu 0>, <&smmu 1>, <&smmu 2>, <&smmu 3>,
--			<&smmu 4>, <&smmu 5>, <&smmu 6>, <&smmu 7>,
--			<&smmu 8>, <&smmu 9>;
- 		pl0: pipeline@0 {
- 			reg =3D <0>;
- 			clocks =3D <&scmi_clk 1>;
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-tc.inc
index 8cb53dec..ee316418 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
@@ -1,5 +1,9 @@
 # TC0 specific TFA configuration
=20
+# Intermediate SHA with 2.7 baseline version
+SRCREV_tfa =3D "e95abc4c01822ef43e9e874d63d6596dc0b57279"
+PV =3D "2.7+git${SRCPV}"
+
 DEPENDS +=3D "scp-firmware util-linux-native gptfdisk-native"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/tc:"
@@ -10,7 +14,7 @@ SRC_URI:append =3D " \
     file://0004-fix-plat-tc-increase-tc_tzc_dram1_size.patch \
     file://0005-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch \
     file://0006-feat-plat-tc-update-dts-with-trusty-compatible-strin.pat=
ch \
-    file://0007-fix-plat-tc-disable-smmu.patch \
+    file://0007-feat-arm-tc-Update-trusty-load-address-in-dts-files.patc=
h \
     file://generate_metadata.py \
     "
=20
@@ -41,6 +45,7 @@ EXTRA_OEMAKE +=3D "SCP_BL2=3D${RECIPE_SYSROOT}/firmware=
/scp_ramfw.bin"
 EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=3D1 ARM_ROTPK_LOC=
ATION=3Ddevel_rsa \
                      ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_=
rsa.pem"
 EXTRA_OEMAKE +=3D "PSA_FWU_SUPPORT=3D1 ARM_GPT_SUPPORT=3D1"
+EXTRA_OEMAKE +=3D "CTX_INCLUDE_MTE_REGS=3D1"
=20
 do_generate_gpt() {
     gpt_image=3D"${BUILD_DIR}/fip_gpt.bin"
--=20
2.34.1


