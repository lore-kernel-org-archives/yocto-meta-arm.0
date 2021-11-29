Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DF7C433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 12:49:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.60334.1638190177604385576
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 04:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E6571042;
	Mon, 29 Nov 2021 04:49:37 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30463F766;
	Mon, 29 Nov 2021 04:49:35 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH][HONISTER 5/5] meta-arm-bsp/security: corstone1000: add
 trusted services support
Date: Mon, 29 Nov 2021 12:49:15 +0000
Message-Id: <20211129124915.23058-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129124915.23058-1-abdellatif.elkhlifi@arm.com>
References: <20211129124915.23058-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 12:49:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2470

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

These changes are to add support to build TrustedServices.
corstone1000 platfrom uses optee-sp option which will include
secure partitions into optee Image

Following changes are made to trusted-services code
* TS_PLATFORM should be set at the external build system level.
* fix EARLY_TA_PATHS environment variable
* se-proxy string and make it as child node

Change-Id: I58d76b5e25e7f285794c93dc92c1b93fdd77cfb9
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  3 ++
 .../trusted-firmware-m-corstone1000.inc       |  9 +---
 .../optee/optee-os_corstone1000.inc           | 32 ++++---------
 .../optee/optee-os_corstone1000_common.inc    | 27 +++++++++++
 .../optee/optee-spdevkit_corstone1000.inc     |  1 +
 .../optee/optee-spdevkit_git.bbappend         |  6 +++
 ...pplying-lowercase-project-convention.patch | 33 ++++++++++++++
 ...0002-fix-EARLY_TA_PATHS-env-variable.patch | 31 +++++++++++++
 ...proxy-dts-add-se-proxy-as-child-node.patch | 45 +++++++++++++++++++
 .../secure-partitions_%.bbappend              |  4 ++
 .../trusted-services/ts-corstone1000.inc      | 17 +++++++
 11 files changed, 178 insertions(+), 30 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-spdevkit_corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0001-tools-cmake-common-applying-lowercase-project-convention.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0002-fix-EARLY_TA_PATHS-env-variable.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 753347d..9e36b4f 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -41,6 +41,9 @@ EXTRA_IMAGEDEPENDS += "optee-os"
 OPTEE_ARCH = "arm64"
 OPTEE_BINARY = "tee-pager_v2.bin"
 
+# Trusted Services(TS)
+EXTRA_IMAGEDEPENDS += "secure-partitions"
+
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
 PREFERRED_VERSION_linux-yocto = "5.10%"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index 997859c..d936309 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -4,13 +4,8 @@ COMPATIBLE_MACHINE = "(corstone1000)"
 
 TFM_DEBUG = "1"
 
-PACKAGECONFIG[test-secure] = "-DTEST_S=OFF,-DTEST_S=OFF"
-PACKAGECONFIG[test-nonsecure] = "-DTEST_NS=OFF,-DTEST_NS=OFF"
-
-INSANE_SKIP:${PN} = "arch"
-
-## Default is the FVP ##
-TFM_PLATFORM_IS_FVP ?= "TRUE"
+## Default is the MPS3 board
+TFM_PLATFORM_IS_FVP ?= "FALSE"
 EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
 
 SRCREV_tfm = "ccd82e35f539c0d7261b2935d6d30c550cfc6736"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
index e2cc7d6..eb4d6af 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
@@ -1,27 +1,13 @@
-SRC_URI = "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=https;branch=psa-development"
-SRCREV = "f9de2c9520ed97b89760cc4c99424aae440b63f4"
-PV .= "+git${SRCREV}"
+require optee-os_corstone1000_common.inc
 
-DEPENDS += "python3-pycryptodomex-native"
+DEPENDS += " secure-partitions"
+EXTRA_OEMAKE +="'SP_PACKAGING_METHOD=embedded'"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
+TS_INSTALL_PREFIX_PATH="${RECIPE_SYSROOT}/firmware/sp/opteesp"
+EXTRA_OEMAKE += "'TS_INSTALL_PREFIX=${TS_INSTALL_PREFIX_PATH}'"
 
-SRC_URI:append = " \
-                  file://0001-plat-corstone1000-add-corstone1000-platform.patch \
-                  file://0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch"
+# se-proxy secure partition
+SP_MKFILE_PATH="${TS_INSTALL_PREFIX}/lib/make/se-proxy.mk"
 
-COMPATIBLE_MACHINE = "corstone1000"
-
-OPTEEMACHINE = "corstone1000"
-# Enable optee memory layout and boot logs
-EXTRA_OEMAKE += " CFG_TEE_CORE_LOG_LEVEL=4"
-
-# default disable latency benchmarks (over all OP-TEE layers)
-EXTRA_OEMAKE += " CFG_TEE_BENCHMARK=n"
-
-EXTRA_OEMAKE += " CFG_CORE_SEL1_SPMC=y CFG_CORE_FFA=y"
-
-EXTRA_OEMAKE += " CFG_WITH_SP=y"
-
-EXTRA_OEMAKE += " HOST_PREFIX=${HOST_PREFIX}"
-EXTRA_OEMAKE += " CROSS_COMPILE64=${HOST_PREFIX}"
+EXTRA_OEMAKE += "'CFG_SP_MKFILE_PATH=${SP_MKFILE_PATH}'"
+EXTRA_OEMAKE += "'CFG_EMBED_DTB_SOURCE_FILE=${TS_INSTALL_PREFIX_PATH}/manifest/46bb39d1-b4d9-45b5-88ff-040027dab249.dts'"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
new file mode 100644
index 0000000..423e968
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000_common.inc
@@ -0,0 +1,27 @@
+SRC_URI = "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=https;branch=psa-development"
+SRCREV = "f9de2c9520ed97b89760cc4c99424aae440b63f4"
+PV .= "+git${SRCREV}"
+
+DEPENDS += "python3-pycryptodomex-native dtc-native"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
+
+SRC_URI:append = " \
+                  file://0001-plat-corstone1000-add-corstone1000-platform.patch \
+                  file://0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch"
+
+COMPATIBLE_MACHINE = "corstone1000"
+
+OPTEEMACHINE = "corstone1000"
+# Enable optee memory layout and boot logs
+EXTRA_OEMAKE += " CFG_TEE_CORE_LOG_LEVEL=4"
+
+# default disable latency benchmarks (over all OP-TEE layers)
+EXTRA_OEMAKE += " CFG_TEE_BENCHMARK=n"
+
+EXTRA_OEMAKE += " CFG_CORE_SEL1_SPMC=y CFG_CORE_FFA=y"
+
+EXTRA_OEMAKE += " CFG_WITH_SP=y"
+
+EXTRA_OEMAKE += " HOST_PREFIX=${HOST_PREFIX}"
+EXTRA_OEMAKE += " CROSS_COMPILE64=${HOST_PREFIX}"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_corstone1000.inc b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_corstone1000.inc
new file mode 100644
index 0000000..363b0ed
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_corstone1000.inc
@@ -0,0 +1 @@
+require optee-os_corstone1000_common.inc
diff --git a/meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend
new file mode 100644
index 0000000..13e109c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-spdevkit_git.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_SPDEVKIT_REQUIRE ?= ""
+MACHINE_OPTEE_SPDEVKIT_REQUIRE:corstone1000 = "optee-spdevkit_corstone1000.inc"
+
+require ${MACHINE_OPTEE_SPDEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0001-tools-cmake-common-applying-lowercase-project-convention.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0001-tools-cmake-common-applying-lowercase-project-convention.patch
new file mode 100644
index 0000000..1de064b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0001-tools-cmake-common-applying-lowercase-project-convention.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 0bdafbd98ffd25a09822a560435ee9719e9bc0e4 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Sat, 13 Nov 2021 07:47:44 +0000
+Subject: [PATCH] tools/cmake/common: applying lowercase project convention
+
+Lowercase convention should only apply on the paths inside TS
+source-code.
+Host build paths should not be lowercased. Otherwise, builds
+with uppercase paths will break.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+diff --git a/tools/cmake/common/AddPlatform.cmake b/tools/cmake/common/AddPlatform.cmake
+index ae34c6e..31bcd8c 100644
+--- a/tools/cmake/common/AddPlatform.cmake
++++ b/tools/cmake/common/AddPlatform.cmake
+@@ -37,8 +37,8 @@ function(add_platform)
+ 	set(TGT ${MY_PARAMS_TARGET} CACHE STRING "")
+ 
+ 	# Ensure file path conforms to lowercase project convention
+-	string(TOLOWER "${TS_PLATFORM_ROOT}/${TS_PLATFORM}/platform.cmake" _platdef)
+-	include(${_platdef})
++	string(TOLOWER "${TS_PLATFORM}/platform.cmake" _platdef)
++	include(${TS_PLATFORM_ROOT}/${_platdef})
+ 	set(CMAKE_CONFIGURE_DEPENDS ${_platdef})
+ 
+ 	unset(TGT CACHE)
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0002-fix-EARLY_TA_PATHS-env-variable.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0002-fix-EARLY_TA_PATHS-env-variable.patch
new file mode 100644
index 0000000..e404e6f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0002-fix-EARLY_TA_PATHS-env-variable.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 28f3e8d68996ad2e3ccca45d2435b3b524daef48 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Sat, 13 Nov 2021 07:51:53 +0000
+Subject: [PATCH] fix EARLY_TA_PATHS env variable
+
+Yocto cleans up environment varaibles at build time.
+EARLY_TA_PATHS should be set a separate rule for securepartitions
+to be included into optee-os image
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/environments/opteesp/sp.mk.in b/environments/opteesp/sp.mk.in
+index c44ad59..d67e2dc 100644
+--- a/environments/opteesp/sp.mk.in
++++ b/environments/opteesp/sp.mk.in
+@@ -14,7 +14,8 @@ ifeq (,${@EXPORT_SP_UUID@-included})
+ endif
+ 
+ ifeq (embedded,${SP_PACKAGING_METHOD})
+-OPTEE_OS_COMMON_EXTRA_FLAGS+=EARLY_TA_PATHS+=${TS_INSTALL_PREFIX}/opteesp/bin/@EXPORT_SP_UUID@.stripped.elf
++EARLY_TA_PATHS+=${TS_INSTALL_PREFIX}/bin/@EXPORT_SP_UUID@.stripped.elf
++OPTEE_OS_COMMON_EXTRA_FLAGS+=${EARLY_TA_PATHS}
+ TS_SP_DTSI_LIST+="\\n\#include \"${TS_INSTALL_PREFIX}/opteesp/manifest/@EXPORT_SP_UUID@.dtsi\""
+ else ifeq (fip,${SP_PACKAGING_METHOD})
+ TS_SP_JSON_LIST+=${TS_INSTALL_PREFIX}/opteesp/json/@EXPORT_SP_NAME@.json
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0003-se-proxy-dts-add-se-proxy-as-child-node.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
new file mode 100644
index 0000000..5d64949
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 446155031c5a37c3a9771f0215d9fb23d59648d6 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Sat, 13 Nov 2021 08:34:42 +0000
+Subject: [PATCH] se-proxy:dts: add se-proxy as child node
+
+se-proxy sp string should be added for se-proxy node to be
+read properly.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
+index 961071a..9f5cf71 100644
+--- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
++++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
+@@ -7,13 +7,15 @@
+ @DTS_TAG@
+ 
+ @DTS_NODE@ {
+-	compatible = "arm,ffa-manifest-1.0";
+-	ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
+-	uuid = <@EXPORT_SP_UUID_DT@>;
+-	description = "SE Proxy";
+-	execution-ctx-count = <1>;
+-	exception-level = <1>; /* S-EL0 */
+-	execution-state = <0>; /* AArch64 */
+-	xlat-granule = <0>; /* 4KiB */
+-	messaging-method = <0>; /* Direct messaging only */
++	se-proxy {
++		compatible = "arm,ffa-manifest-1.0";
++		ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
++		uuid = <@EXPORT_SP_UUID_DT@>;
++		description = "SE Proxy";
++		execution-ctx-count = <1>;
++		exception-level = <1>; /* S-EL0 */
++		execution-state = <0>; /* AArch64 */
++		xlat-granule = <0>; /* 4KiB */
++		messaging-method = <0>; /* Direct messaging only */
++	};
+ };
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions_%.bbappend
new file mode 100644
index 0000000..8a37a28
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions_%.bbappend
@@ -0,0 +1,4 @@
+MACHINE_TS_REQUIRE ?= ""
+MACHINE_TS_REQUIRE:corstone1000 = "ts-corstone1000.inc"
+
+require ${MACHINE_TS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
new file mode 100644
index 0000000..d574fbe
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -0,0 +1,17 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/secure-partitions:"
+
+COMPATIBLE_MACHINE = "corstone1000"
+
+SRC_URI:append = " file://0001-tools-cmake-common-applying-lowercase-project-convention.patch \
+                  file://0002-fix-EARLY_TA_PATHS-env-variable.patch \
+                  file://0003-se-proxy-dts-add-se-proxy-as-child-node.patch \
+		  "
+
+TS_PLATFORM = "arm/fvp/fvp_base_revc-2xaemv8a"
+TS_ENVIRONMENT = "opteesp"
+SP_PACKAGING_METHOD = "embedded"
+
+EXTRA_OEMAKE += "TS_PLATFORM=${TS_PLATFORM}"
+
+# Secure Enclave proxy secure partition
+TS_DEPLOYMENTS += "'deployments/se-proxy/${TS_ENVIRONMENT}'"
-- 
2.17.1


