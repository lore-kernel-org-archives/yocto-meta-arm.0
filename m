Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B24C10F1A
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 16:33:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23274.1713890016903944020
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 09:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71CFB339;
	Tue, 23 Apr 2024 09:34:04 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.21.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D49A93F7BD;
	Tue, 23 Apr 2024 09:33:35 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 6/9] arm-bsp: enable Trusted Services on the fvp-base platform
Date: Tue, 23 Apr 2024 18:32:02 +0200
Message-ID: <20240423163205.5885-6-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240423163205.5885-1-gyorgy.szing@arm.com>
References: <20240423163205.5885-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 16:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5591

Add configuration settings to TF-A, OP-TEE and TS SPs needed to get TS
built and run on the fvp-base machine.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 .gitlab-ci.yml                                |   3 +-
 ci/fvp-base-ts.yml                            |  22 ++++
 meta-arm-bsp/conf/machine/fvp-base.conf       |   1 +
 .../files/fvp-base/optee_spmc_maifest.dts     | 116 ++++++++++++++++++
 .../trusted-firmware-a-fvp-base.inc           |  55 ++++++++-
 .../linux/linux-arm-platforms.inc             |  10 +-
 .../optee/optee-os-fvp-base.inc               |  13 ++
 .../optee/optee-os-tadevkit_4.%.bbappend      |   1 +
 .../optee/optee-os_4.%.bbappend               |   1 +
 .../optee/optee-test-fvp-base.inc             |   3 +
 .../optee/optee-test_4.%.bbappend             |   1 +
 .../packagegroup-ts-tests.bbappend            |   1 +
 .../trusted-services/libts_%.bbappend         |   4 +
 .../trusted-services/ts-arm-platforms.inc     |   3 +
 .../trusted-services/ts-newlib_%.bbappend     |   1 +
 .../ts-sp-se-proxy_%.bbappend                 |   4 +
 .../ts-sp-smm-gateway_%.bbappend              |   4 +
 .../ts-sp-spm-test1_%.bbappend                |   1 +
 .../ts-sp-spm-test2_%.bbappend                |   1 +
 .../ts-sp-spm-test3_%.bbappend                |   1 +
 .../ts-sp-spm-test4_%.bbappend                |   1 +
 21 files changed, 239 insertions(+), 8 deletions(-)
 create mode 100644 ci/fvp-base-ts.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp=
-base/optee_spmc_maifest.dts
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-fvp-base=
.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-test-fvp-ba=
se.inc
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
spm-test1_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
spm-test2_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
spm-test3_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-=
spm-test4_%.bbappend

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4f16fcf3..c063adef 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -140,7 +140,8 @@ fvp-base:
   extends: .build
   parallel:
     matrix:
-      - TESTING: testimage
+      - TS: [none, fvp-base-ts]
+        TESTING: testimage
       - FIRMWARE: edk2
       - SYSTEMREADY_FIRMWARE: arm-systemready-firmware
=20
diff --git a/ci/fvp-base-ts.yml b/ci/fvp-base-ts.yml
new file mode 100644
index 00000000..e2e7ada2
--- /dev/null
+++ b/ci/fvp-base-ts.yml
@@ -0,0 +1,22 @@
+header:
+  version: 14
+  includes:
+    - ci/fvp-base.yml
+    - ci/meta-openembedded.yml
+    - ci/testimage.yml
+
+local_conf_header:
+  trusted_services: |
+    # Enable the needed test suites
+    TEST_SUITES =3D " ping ssh trusted_services"
+    # Include all Secure Partitions into the image
+    MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its"
+    MACHINE_FEATURES:append =3D " ts-attestation ts-smm-gateway optee-sp=
mc-test"
+    MACHINE_FEATURES:append =3D " ts-block-storage"
+    # Include TS demo/test tools into image
+    IMAGE_INSTALL:append =3D " packagegroup-ts-tests"
+    # Include TS PSA Arch tests into image
+    IMAGE_INSTALL:append =3D " packagegroup-ts-tests-psa"
+    CORE_IMAGE_EXTRA_INSTALL +=3D "optee-test"
+    # Set the TS environment
+    TS_ENV=3D"sp"
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index f621cd8b..17fb5023 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -62,3 +62,4 @@ FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
 FVP_TERMINALS[bp.terminal_1] ?=3D ""
 FVP_TERMINALS[bp.terminal_2] ?=3D ""
 FVP_TERMINALS[bp.terminal_3] ?=3D ""
+FVP_CONFIG[bp.secure_memory] ?=3D "1"
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/o=
ptee_spmc_maifest.dts b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files=
/fvp-base/optee_spmc_maifest.dts
new file mode 100644
index 00000000..748da309
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/optee_sp=
mc_maifest.dts
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2022-2023, Arm Limited. All rights reserved.
+ */
+
+
+/*
+ * The content of the SPMC manifest may depend on integration settings l=
ike the
+ * set of deployed SP. This information lives in the integration system =
and=20
+ * hence this file should be store in meta-arm. This avoids indirect
+ * dependencies between integration systems using the same file which wo=
uld
+ * enforce some from of cooperation.=20
+ */
+
+/dts-v1/;
+
+/ {
+	compatible =3D "arm,ffa-core-manifest-1.0";
+	#address-cells =3D <2>;
+	#size-cells =3D <1>;
+
+	attribute {
+		spmc_id =3D <0x8000>;
+		maj_ver =3D <0x1>;
+		min_ver =3D <0x0>;
+		exec_state =3D <0x0>;
+		load_address =3D <0x0 0x6000000>;
+		entrypoint =3D <0x0 0x6000000>;
+		binary_size =3D <0x80000>;
+	};
+
+/*
+ * This file will be preprocessed by TF-A's build system. If Measured Bo=
ot is
+ * enabled in TF-A's config, the build system will add the MEASURED_BOOT=
=3D1 macro
+ * to the preprocessor arguments.
+ */
+#if MEASURED_BOOT
+	tpm_event_log {
+		compatible =3D "arm,tpm_event_log";
+		tpm_event_log_addr =3D <0x0 0x0>;
+		tpm_event_log_size =3D <0x0>;
+		tpm_event_log_max_size =3D <0x0>;
+	};
+#endif
+
+/* If the ARM_BL2_SP_LIST_DTS is defined, SPs should be loaded from FIP =
*/
+#ifdef ARM_BL2_SP_LIST_DTS
+	sp_packages {
+		compatible =3D "arm,sp_pkg";
+#if !SPMC_TESTS
+		block_storage {
+			uuid =3D <0x806e6463 0x2f4652eb 0xdf8c4fac 0x9c518739>;
+			load-address =3D <0x0 0x7a00000>;
+		};
+		internal_trusted_storage {
+			uuid =3D <0x48ef1edc 0xcf4c7ab1 0xcfdf8bac 0x141b71f7>;
+			load-address =3D <0x0 0x7a80000>;
+		};
+
+		protected_storage_sp {
+			uuid =3D <0x01f81b75 0x6847de3d 0x100f14a5 0x9017edae>;
+			load-address =3D <0x0 0x7b00000>;
+		};
+
+		crypto_sp {
+			uuid =3D <0xd552dfd9 0xb24ba216 0x6dd2a49a 0xc0e8843b>;
+			load-address =3D <0x0 0x7b80000>;
+		};
+
+#if MEASURED_BOOT
+		initial_attestation_sp {
+			uuid =3D <0x55f1baa1 0x95467688 0x95547c8f 0x74b98d5e>;
+			load-address =3D <0x0 0x7c80000>;
+		};
+#endif
+
+#if TS_SMM_GATEWAY
+		smm_gateway {
+			uuid =3D <0x33d532ed 0x0942e699 0x722dc09c 0xa798d9cd>;
+			load-address =3D <0x0 0x7d00000>;
+		};
+#endif /* TS_SMM_GATEWAY */
+
+#if TS_FW_UPDATE
+		fwu {
+			uuid =3D <0x38a82368 0x0e47061b 0xce0c7497 0xfd53fb8b>;
+			load-address =3D <0x0 0x7d80000>;
+		};
+#endif /* TS_FW_UPDATE */
+
+#else /* SPMC_TESTS */
+		test_sp1 {
+			uuid =3D <0xc3db9e5c 0x67433a7b 0x197c839f 0x376ae81a>;
+			load-address =3D <0x0 0x7a00000>;
+		};
+
+		test_sp2 {
+			uuid =3D <0x4c161778 0x1a4d0cc4 0xb29b7a86 0x1af48c27>;
+			load-address =3D <0x0 0x7a20000>;
+		};
+
+		test_sp3 {
+			uuid =3D <0x0001eb23 0x97442ae3 0x112f5290 0xa6af84e5>;
+			load-address =3D <0x0 0x7a40000>;
+		};
+
+		test_sp4 {
+			/* SP binary UUID */
+			uuid =3D <0xed623742 0x6f407277 0x270cd899 0xf8bb0ada>;
+			load-address =3D <0x0 0x7a80000>;
+		};
+#endif /* SPMC_TESTS */
+
+	};
+#endif /* ARM_BL2_SP_LIST_DTS */
+};
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-base.inc
index 5fafe292..4c37f7cb 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -4,17 +4,62 @@
 # Armv8-A Base Platform FVP
 #
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:"
-SRC_URI:append =3D " file://0001-fdts-fvp-base-Add-stdout-path-and-virti=
o-net-and-rng.patch"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:${THISDIR}/files/fvp-bas=
e"
=20
+SRC_URI:append =3D " \
+    file://0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.pat=
ch \
+    file://optee_spmc_maifest.dts;subdir=3Dgit/plat/arm/board/fvp/fdts \
+"
+
+# OP-TEE SPMC related configuration
+SPMC_IS_OPTEE =3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', '=
0' \
+                 if d.getVar('SEL2_SPMC') =3D=3D '1' else '1', '0', d)}"
+# Configure the SPMC manifest file.
+TFA_ARM_SPMC_MANIFEST_DTS =3D "${@oe.utils.conditional('SPMC_IS_OPTEE', =
'1', \
+                '${S}/plat/arm/board/fvp/fdts/optee_spmc_maifest.dts', '=
', d)}"
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES','arm-ffa', \
+                'ARM_SPMC_MANIFEST_DTS=3D${TFA_ARM_SPMC_MANIFEST_DTS}' \
+                    if d.getVar('TFA_ARM_SPMC_MANIFEST_DTS') else '', ''=
, d)}"
+
+# Set OP-TEE SPMC specific TF-A config settings
+TFA_SPMD_SPM_AT_SEL2 :=3D '0'
+TFA_SPD :=3D "${@oe.utils.conditional('SPMC_IS_OPTEE', '1', 'spmd', \
+            d.getVar('TFA_SPD'), d)}"
+DEPENDS +=3D " ${@oe.utils.conditional('SPMC_IS_OPTEE', '1', 'optee-os',=
 '', d)}"
+
+# Configure measured boot if the attestation SP is deployed.
+TFA_MB_FLAGS +=3D " \
+    ARM_ROTPK_LOCATION=3Ddevel_rsa \
+    EVENT_LOG_LEVEL=3D20 \
+    GENERATE_COT=3D1 \
+    MBOOT_EL_HASH_ALG=3Dsha256 \
+    MEASURED_BOOT=3D1 \
+    ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_rsa.pem \
+    TRUSTED_BOARD_BOOT=3D1 \
+"
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestat=
ion',\
+                 '${TFA_MB_FLAGS}','', d)}"
+
+# Add OP-TEE as BL32.
+BL32 =3D "${@oe.utils.conditional('SPMC_IS_OPTEE', '1',\
+        '${RECIPE_SYSROOT}/${nonarch_base_libdir}/firmware/tee-pager_v2.=
bin',\
+        '', d)}"
+EXTRA_OEMAKE +=3D "${@oe.utils.conditional('SPMC_IS_OPTEE', '1', \
+                ' BL32=3D${BL32}', '', d)}"
+
+# Generic configuration
 COMPATIBLE_MACHINE =3D "fvp-base"
 TFA_PLATFORM =3D "fvp"
-TFA_DEBUG =3D "1"
-TFA_MBEDTLS =3D "1"
+# Disable debug build if measured boot is enabled.
+TFA_DEBUG :=3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestation=
', '0',\
+              d.getVar('TFA_DEBUG'), d)}"
+# Add mbedtls if measured boot is enabled
+TFA_MBEDTLS :=3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestati=
on',\
+               '1', d.getVar('TFA_MBEDTLS'), d)}"
 TFA_UBOOT ?=3D "1"
 TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fip"
=20
-EXTRA_OEMAKE +=3D "FVP_DT_PREFIX=3Dfvp-base-gicv3-psci-1t"
+EXTRA_OEMAKE +=3D "FVP_DT_PREFIX=3Dfvp-base-gicv3-psci-1t FVP_USE_GIC_DR=
IVER=3DFVP_GICV3"
=20
 # Our fvp-base machine explicitly has v8.4 cores
 EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D4"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index d0df9ce3..eb9e1595 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -49,8 +49,14 @@ KERNEL_FEATURES:corstone1000 =3D ""
 #
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
 KMACHINE:fvp-base =3D "fvp"
-FILESEXTRAPATHS:prepend:fvp-base :=3D "${ARMBSPFILESPATHS}"
-SRC_URI:append:fvp-base =3D " file://0001-arm64-dts-fvp-Enable-virtio-rn=
g-support.patch"
+FILESEXTRAPATHS:prepend:fvp-base :=3D "${ARMBSPFILESPATHS}:${ARMFILESPAT=
HS}"
+SRC_URI:append:fvp-base =3D " \
+    file://0001-arm64-dts-fvp-Enable-virtio-rng-support.patch \
+    file://tee.cfg \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
+                         'file://no-strict-devmem.cfg', '' , d)} \
+"
+
=20
 #
 # Juno KMACHINE
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-fvp-base.inc b/=
meta-arm-bsp/recipes-security/optee/optee-os-fvp-base.inc
new file mode 100644
index 00000000..1ef36329
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-fvp-base.inc
@@ -0,0 +1,13 @@
+COMPATIBLE_MACHINE =3D "fvp-base"
+
+OPTEEMACHINE =3D "vexpress-fvp"
+# Enable boot logs
+EXTRA_OEMAKE +=3D " CFG_TEE_CORE_LOG_LEVEL=3D4"
+
+# default disable latency benchmarks (over all OP-TEE layers)
+EXTRA_OEMAKE +=3D " CFG_TEE_BENCHMARK=3Dn"
+
+# If FF-A is enabled configure to be the SPMC.
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', '=
 CFG_CORE_HEAP_SIZE=3D131072 CFG_CORE_SEL1_SPMC=3Dy CFG_DT=3Dy', '' ,d)}"
+
+EXTRA_OEMAKE +=3D " CFG_ARM_GICV3=3Dy"
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bb=
append b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bbappe=
nd
index e09c4a5e..c9b48be2 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.%.bbappend
@@ -2,5 +2,6 @@
=20
 MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
 MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:fvp-base =3D "optee-os-fvp-base.inc"
=20
 require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend b/=
meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
index 788a23ef..919a1523 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_4.%.bbappend
@@ -3,5 +3,6 @@
 MACHINE_OPTEE_OS_REQUIRE ?=3D ""
 MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D "optee-os-corstone1000-common.=
inc"
 MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
+MACHINE_OPTEE_OS_REQUIRE:fvp-base =3D "optee-os-fvp-base.inc"
=20
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test-fvp-base.inc =
b/meta-arm-bsp/recipes-security/optee/optee-test-fvp-base.inc
new file mode 100644
index 00000000..23dead24
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-test-fvp-base.inc
@@ -0,0 +1,3 @@
+# fvp-base specific configuration
+
+COMPATIBLE_MACHINE =3D "fvp-base"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend =
b/meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend
index 05e2abca..249d67f0 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-test_4.%.bbappend
@@ -2,5 +2,6 @@
=20
 MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
 MACHINE_OPTEE_TEST_REQUIRE:n1sdp =3D "optee-os-generic-n1sdp.inc"
+MACHINE_OPTEE_TEST_REQUIRE:fvp-base =3D "optee-test-fvp-base.inc"
=20
 require ${MACHINE_OPTEE_TEST_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-=
tests.bbappend b/meta-arm-bsp/recipes-security/packagegroups/packagegroup=
-ts-tests.bbappend
index 20612cb1..35137220 100644
--- a/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.b=
bappend
+++ b/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.b=
bappend
@@ -1,2 +1,3 @@
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
+COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbapp=
end b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
index 450cfc58..2ae28c89 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
@@ -3,3 +3,7 @@ require ts-arm-platforms.inc
 EXTRA_OECMAKE:append:corstone1000 =3D "-DMM_COMM_BUFFER_ADDRESS=3D0x81FF=
F000 \
                                      -DMM_COMM_BUFFER_PAGE_COUNT=3D1 \
                                     "
+
+EXTRA_OECMAKE:append:fvp-base =3D " -DMM_COMM_BUFFER_ADDRESS=3D0x8100000=
0 \
+                                  -DMM_COMM_BUFFER_PAGE_COUNT=3D8 \
+    "
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 80a58056..36f7c9b9 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -15,3 +15,6 @@ SRC_URI:append:corstone1000  =3D " \
=20
=20
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
+
+COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
+TS_PLATFORM:fvp-base =3D "arm/fvp/fvp_base_revc-2xaemv8a"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.b=
bappend b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbap=
pend
index 7417d9b0..77fb7ae2 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
@@ -6,3 +6,4 @@ SRC_URI:append:corstone1000 =3D " \
 "
=20
 COMPATIBLE_MACHINE:n1sdp =3D "n1sdp"
+COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-prox=
y_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-pr=
oxy_%.bbappend
index 3a1b2d81..31e4ea55 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bba=
ppend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bba=
ppend
@@ -3,3 +3,7 @@ require ts-arm-platforms.inc
 EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x81FFF000" \
     -DMM_COMM_BUFFER_PAGE_COUNT=3D"1" \
     "
+
+# Proxy is pointless on fvp-base as there is no dedicated security subsy=
stem. It could be
+# deployed configured to have dummy service providers for build testing =
purposes.
+COMPATIBLE_MACHINE:remove:fvp-base =3D "fvp-base"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gat=
eway_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-sm=
m-gateway_%.bbappend
index 3a1b2d81..f584f81b 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.=
bbappend
@@ -3,3 +3,7 @@ require ts-arm-platforms.inc
 EXTRA_OECMAKE:append:corstone1000 =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x00=
000000 0x81FFF000" \
     -DMM_COMM_BUFFER_PAGE_COUNT=3D"1" \
     "
+
+EXTRA_OECMAKE:append:fvp-base =3D " -DMM_COMM_BUFFER_ADDRESS=3D"0x000000=
00 0x81000000" \
+    -DMM_COMM_BUFFER_PAGE_COUNT=3D"8" \
+    "
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-tes=
t1_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-=
test1_%.bbappend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-test1_%.bb=
append
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-tes=
t2_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-=
test2_%.bbappend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-test2_%.bb=
append
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-tes=
t3_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-=
test3_%.bbappend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-test3_%.bb=
append
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-tes=
t4_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-=
test4_%.bbappend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-spm-test4_%.bb=
append
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
--=20
2.43.1


