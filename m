Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51013C43217
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 13:40:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8216.1666186796260505267
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 06:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 241EF14BF;
	Wed, 19 Oct 2022 06:40:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BBD53F7D8;
	Wed, 19 Oct 2022 06:39:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm-bsp/scp-firmware: remove TC0 patches
Date: Wed, 19 Oct 2022 14:39:51 +0100
Message-Id: <20221019133952.3018499-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019133952.3018499-1-ross.burton@arm.com>
References: <20221019133952.3018499-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Oct 2022 13:40:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3984

These patches are specific to TC0, and are not needed for TC1.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../files/tc/0002-tc0-fix-mpmm-config.patch   |  92 --------
 ...form-variant-to-platform-feature-set.patch | 203 ------------------
 ...form-feature-set-options-in-firmware.patch | 114 ----------
 .../scp-firmware/scp-firmware-tc.inc          |  10 +-
 4 files changed, 1 insertion(+), 418 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0002-t=
c0-fix-mpmm-config.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0003-t=
c0-rename-platform-variant-to-platform-feature-set.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0004-t=
c0-support-platform-feature-set-options-in-firmware.patch

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0002-tc0-fix-=
mpmm-config.patch b/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0002-t=
c0-fix-mpmm-config.patch
deleted file mode 100644
index f2044a95..00000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0002-tc0-fix-mpmm-co=
nfig.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 736bd8aeceefd474c15a97e4a4ec99f07ef9a82c Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Fri, 11 Feb 2022 18:28:43 +0000
-Subject: [PATCH 2/4] tc0: fix mpmm config
-
-Do not enable MPMM in standard features set.
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I7b273a2055452e2e8cd78a0d932514a6f2947ec5
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- product/tc0/scp_ramfw/config_mpmm.c | 15 ---------------
- 1 file changed, 15 deletions(-)
-
-diff --git a/product/tc0/scp_ramfw/config_mpmm.c b/product/tc0/scp_ramfw=
/config_mpmm.c
-index 3bfe99d3..13d866a5 100644
---- a/product/tc0/scp_ramfw/config_mpmm.c
-+++ b/product/tc0/scp_ramfw/config_mpmm.c
-@@ -27,7 +27,6 @@ enum core_pd_idx {
-     CORE7_IDX
- };
-=20
--#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VARIANT_S=
TD)
- static struct mod_mpmm_pct_table k_pct[] =3D {
-     { .cores_online =3D 4,
-       .default_perf_limit =3D 1153 * 1000000UL,
-@@ -115,7 +114,6 @@ static struct mod_mpmm_pct_table m_pct[] =3D {
-                           },
-                         } },
- };
--#endif
-=20
- static struct mod_mpmm_pct_table m_elp_pct[] =3D {
-     { .cores_online =3D 1,
-@@ -132,7 +130,6 @@ static struct mod_mpmm_pct_table m_elp_pct[] =3D {
-                         } },
- };
-=20
--#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VARIANT_S=
TD)
- static const struct mod_mpmm_core_config k_core_config[] =3D {
-     [0] =3D {
-         .pd_id =3D FWK_ID_ELEMENT_INIT(FWK_MODULE_IDX_POWER_DOMAIN, COR=
E0_IDX),
-@@ -180,7 +177,6 @@ static const struct mod_mpmm_core_config m_core_conf=
ig[] =3D {
-         .core_starts_online =3D false,
-         },
- };
--#endif
-=20
- static const struct mod_mpmm_core_config m_elp_core_config[] =3D {
-     [0] =3D {
-@@ -191,7 +187,6 @@ static const struct mod_mpmm_core_config m_elp_core_=
config[] =3D {
-         },
- };
-=20
--#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VARIANT_S=
TD)
- static const struct mod_mpmm_domain_config k_domain_conf[] =3D {
-     [0] =3D {
-         .perf_id =3D FWK_ID_ELEMENT_INIT(
-@@ -219,7 +214,6 @@ static const struct mod_mpmm_domain_config m_domain_=
conf[] =3D {
-     },
-     [1] =3D {0},
- };
--#endif
-=20
- static const struct mod_mpmm_domain_config m_elp_domain_conf[] =3D {
-     [0] =3D {
-@@ -236,14 +230,6 @@ static const struct mod_mpmm_domain_config m_elp_do=
main_conf[] =3D {
- };
-=20
- static const struct fwk_element element_table[] =3D {
--#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VAR_EXPER=
IMENT_POWER)
--    [0] =3D {
--        .name =3D "MPMM_MATTERHORN_ELP_ARM_ELEM",
--        .sub_element_count =3D 1,
--        .data =3D m_elp_domain_conf,
--    },
--    [1] =3D { 0 },
--#else
-     [0] =3D {
-         .name =3D "MPMM_KLEIN_ELEM",
-         .sub_element_count =3D 4,
-@@ -260,7 +246,6 @@ static const struct fwk_element element_table[] =3D =
{
-         .data =3D m_elp_domain_conf,
-     },
-     [3] =3D { 0 },
--#endif
- };
-=20
- static const struct fwk_element *mpmm_get_element_table(fwk_id_t module=
_id)
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0003-tc0-rena=
me-platform-variant-to-platform-feature-set.patch b/meta-arm-bsp/recipes-=
bsp/scp-firmware/files/tc/0003-tc0-rename-platform-variant-to-platform-fe=
ature-set.patch
deleted file mode 100644
index 87dfbfac..00000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0003-tc0-rename-plat=
form-variant-to-platform-feature-set.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-From 50e63f11762348bcd95d809af248f620f03d9ce4 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Fri, 11 Feb 2022 18:16:54 +0000
-Subject: [PATCH 3/4] tc0: rename platform variant to platform feature se=
t
-
-THe PLATFORM_VARIANT flag was added to differentiate the software
-features enabled in SCP firmware. But this flag misleads to a new
-variant of same platform. This commits renames PLATFORM_VARIANT to
-PLATFORM_FEATURE_SET
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I93c0bc3e11fe18192bb8246df851345bdc473974
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
----
- product/tc0/doc/{variants.md =3D> features.md} | 28 +++++++++----------=
-
- product/tc0/scp_ramfw/CMakeLists.txt         | 26 +++---------------
- product/tc0/scp_ramfw/Firmware.cmake         |  2 +-
- product/tc0/scp_ramfw/config_scmi_perf.c     |  8 +++---
- product/tc0/scp_romfw/CMakeLists.txt         |  6 ++---
- product/tc0/scp_romfw/Firmware.cmake         |  2 +-
- 6 files changed, 25 insertions(+), 47 deletions(-)
- rename product/tc0/doc/{variants.md =3D> features.md} (77%)
-
-diff --git a/product/tc0/doc/variants.md b/product/tc0/doc/features.md
-similarity index 77%
-rename from product/tc0/doc/variants.md
-rename to product/tc0/doc/features.md
-index fbf616db..3ef520e2 100644
---- a/product/tc0/doc/variants.md
-+++ b/product/tc0/doc/features.md
-@@ -1,4 +1,4 @@
--# TC0 Platform Variants
-+# TC0 Platform Features
-=20
- Copyright (c) 2022, Arm Limited. All rights reserved.
-=20
-@@ -7,30 +7,27 @@ Copyright (c) 2022, Arm Limited. All rights reserved.
-=20
- Documentation for TC0 platform can be found at [1].
-=20
-+### Standard
-+
-+The standard build provides all the features described in [1].
-+For this default features, it's not required to provide any extra param=
eters in
-+the build commands.
-+
-+### MPMM/Power/Performance (Experimental)
-+
- For the purpose of experimenting some of the software features that hav=
e been
--introduced in SCP-firmware a new variant of TC0 has been created.
--The variant(s) can be chosen at build time by adding:
-+introduced in SCP-firmware of TC0. This can be enabled at build time, b=
y adding:
-=20
- ```sh
-=20
- make -f Makefile.cmake \
-     PRODUCT=3Dtc0 \
-     MODE=3D<debug,release> \
--    PLATFORM_VARIANT=3D<0,1>
-+    EXTRA_CONFIG_ARGS+=3D-DSCP_PLATFORM_FEATURE_SET=3D1
-=20
- ```
-=20
--
--### Variant 0 (Standard build)
--
--The standard build provides all the features described in [1].
--For this default variant, it's not required to provide any extra parame=
ters in
--the build commands.
--
--
--### Variant 1 (Power/Performance testing)
--
--This variant adds support for the following software features:
-+This adds support for the following software features:
- - Traffic Cop
- - MPMM (Maximum Power Mitigation Mechanism)
- - Thermal Management
-@@ -63,7 +60,6 @@ Once built, the features above will act as:
-=20
- ## Limitations
-=20
--- The "variant" option is available only with the CMake build.
- - The Thermal functionality is limited at this time cause the constant
-   temperature being sampled.
-=20
-diff --git a/product/tc0/scp_ramfw/CMakeLists.txt b/product/tc0/scp_ramf=
w/CMakeLists.txt
-index 96310320..ce3178ee 100644
---- a/product/tc0/scp_ramfw/CMakeLists.txt
-+++ b/product/tc0/scp_ramfw/CMakeLists.txt
-@@ -11,25 +11,13 @@
-=20
- add_executable(tc0-bl2)
-=20
-+set(SCP_PLATFORM_FEATURE_SET ${SCP_PLATFORM_FEATURE_SET_INIT} CACHE STR=
ING "1")
-=20
--# SCP_PLATFORM_VARIANT options:
--# - 'TC0_VARIANT_STD' for TC0 standard build
--# - 'TC0_VAR_EXPERIMENT_POWER' for TC0 with power/performance plugins u=
sed for
--#   evaluation purposes
--
--
--target_compile_definitions(tc0-bl2 PUBLIC -DTC0_VARIANT_STD=3D0)
--target_compile_definitions(tc0-bl2 PUBLIC -DTC0_VAR_EXPERIMENT_POWER=3D=
1)
--
--
--set(SCP_PLATFORM_VARIANT ${SCP_PLATFORM_VARIANT_INIT} CACHE STRING "1")
--
--
--if (SCP_PLATFORM_VARIANT STREQUAL "1")
--    message(NOTICE "SCP_PLATFORM_VARIANT set to EXPERIMENT_POWER (tc0-b=
l2)\n")
-+if (SCP_PLATFORM_FEATURE_SET STREQUAL "1")
-+    message(NOTICE "TC0 platform features MPMM/POWER/PERFORMANCE is exp=
erimental (tc0-bl2)\n")
-=20
-     target_compile_definitions(tc0-bl2
--        PUBLIC -DPLATFORM_VARIANT=3DTC0_VAR_EXPERIMENT_POWER)
-+	PUBLIC -DTC0_FEATURES_MPMM_POWER_PERF)
-=20
-     set(SCP_ENABLE_PLUGIN_HANDLER TRUE PARENT_SCOPE)
-     set(SCP_ENABLE_FAST_CHANNELS TRUE PARENT_SCOPE)
-@@ -56,12 +44,6 @@ if (SCP_PLATFORM_VARIANT STREQUAL "1")
-     list(PREPEND SCP_MODULE_PATHS
-         "${CMAKE_CURRENT_LIST_DIR}/../module/tc0_power_model")
-     target_sources(tc0-bl2 PRIVATE "config_tc0_power_model.c")
--
--else()
--    message(NOTICE "SCP_PLATFORM_VARIANT set to STANDARD (tc0-bl2)\n")
--
--    target_compile_definitions(tc0-bl2
--        PUBLIC -DPLATFORM_VARIANT=3DTC0_VARIANT_STD)
- endif()
-=20
-=20
-diff --git a/product/tc0/scp_ramfw/Firmware.cmake b/product/tc0/scp_ramf=
w/Firmware.cmake
-index 11d8eaab..4a555296 100644
---- a/product/tc0/scp_ramfw/Firmware.cmake
-+++ b/product/tc0/scp_ramfw/Firmware.cmake
-@@ -27,7 +27,7 @@ set(SCP_ENABLE_FAST_CHANNELS_INIT FALSE)
-=20
- set(SCP_ENABLE_PLUGIN_HANDLER_INIT FALSE)
-=20
--set(SCP_PLATFORM_VARIANT_INIT 0)
-+set(SCP_PLATFORM_FEATURE_SET_INIT 0)
-=20
- set(SCP_ARCHITECTURE "armv7-m")
-=20
-diff --git a/product/tc0/scp_ramfw/config_scmi_perf.c b/product/tc0/scp_=
ramfw/config_scmi_perf.c
-index a4a47b3a..3e91939a 100644
---- a/product/tc0/scp_ramfw/config_scmi_perf.c
-+++ b/product/tc0/scp_ramfw/config_scmi_perf.c
-@@ -129,7 +129,7 @@ static const struct mod_scmi_perf_domain_config doma=
ins[] =3D {
-     },
- };
-=20
--#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VAR_EXPER=
IMENT_POWER)
-+#ifdef TC0_FEATURES_MPMM_POWER_PERF
- static const struct mod_scmi_plugin_config plugins_table[] =3D {
-     [0] =3D {
-         .id =3D FWK_ID_MODULE_INIT(FWK_MODULE_IDX_TRAFFIC_COP),
-@@ -156,9 +156,9 @@ const struct fwk_module_config config_scmi_perf =3D =
{
- #else
-         .fast_channels_alarm_id =3D FWK_ID_NONE_INIT,
- #endif
--#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VAR_EXPER=
IMENT_POWER)
--        .plugins =3D plugins_table,
--        .plugins_count =3D FWK_ARRAY_SIZE(plugins_table),
-+#ifdef TC0_FEATURES_MPMM_POWER_PERF
-+	.plugins =3D plugins_table,
-+	.plugins_count =3D FWK_ARRAY_SIZE(plugins_table),
- #endif
-     })
- };
-diff --git a/product/tc0/scp_romfw/CMakeLists.txt b/product/tc0/scp_romf=
w/CMakeLists.txt
-index f9f40ad3..09cd2f5d 100644
---- a/product/tc0/scp_romfw/CMakeLists.txt
-+++ b/product/tc0/scp_romfw/CMakeLists.txt
-@@ -48,6 +48,6 @@ target_include_directories(tc0-bl1
-     PUBLIC $<TARGET_PROPERTY:cmsis::core-m,INTERFACE_INCLUDE_DIRECTORIE=
S>)
-=20
- cmake_dependent_option(
--    SCP_PLATFORM_VARIANT "Choose platform software variant?"
--    "${SCP_PLATFORM_VARIANT_INIT}" "DEFINED SCP_PLATFORM_VARIANT_INIT"
--    "${SCP_PLATFORM_VARIANT}")
-+    SCP_PLATFORM_FEATURE_SET "Choose platform software features?"
-+    "${SCP_PLATFORM_FEATURE_SET_INIT}" "DEFINED SCP_PLATFORM_FEATURE_SE=
T_INIT"
-+    "${SCP_PLATFORM_FEATURE_SET}")
-diff --git a/product/tc0/scp_romfw/Firmware.cmake b/product/tc0/scp_romf=
w/Firmware.cmake
-index ab4468be..e1360159 100644
---- a/product/tc0/scp_romfw/Firmware.cmake
-+++ b/product/tc0/scp_romfw/Firmware.cmake
-@@ -21,7 +21,7 @@ set(SCP_ENABLE_NOTIFICATIONS_INIT TRUE)
-=20
- set(SCP_ENABLE_IPO_INIT FALSE)
-=20
--set(SCP_PLATFORM_VARIANT_INIT 0)
-+set(SCP_PLATFORM_FEATURE_SET_INIT 0)
-=20
- set(SCP_ARCHITECTURE "armv7-m")
-=20
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0004-tc0-supp=
ort-platform-feature-set-options-in-firmware.patch b/meta-arm-bsp/recipes=
-bsp/scp-firmware/files/tc/0004-tc0-support-platform-feature-set-options-=
in-firmware.patch
deleted file mode 100644
index aa83332b..00000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0004-tc0-support-pla=
tform-feature-set-options-in-firmware.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 3e737dd47b228bdeffb06e39bffec7a4a436b244 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Wed, 9 Feb 2022 16:02:10 +0000
-Subject: [PATCH 4/4] tc0: support platform feature set options in firmwa=
re.mk
-
-Support existing platform feature set options that is in cmake to
-firmware.mk. Two feature set for TC0 are
-0. Standard
-1. MPMM/Power/Performance (Experimental)
-
-Build option to select the feature set is using:
-make PRODUCT=3Dtc0 MODE=3D<debug,release> SCP_PLATFORM_FEATURE_SET=3D<0,=
1>
-
-The default value is set to 0 (Standard).
-Refer product/tc0/doc/features.md for more details.
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I4028686a8f8461e0e2c29e15d5e52eb1d37ca60a
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- product/tc0/scp_ramfw/firmware.mk | 41 +++++++++++++++++++++++++++++--
- product/tc0/scp_romfw/firmware.mk | 12 +++++++++
- 2 files changed, 51 insertions(+), 2 deletions(-)
-
-diff --git a/product/tc0/scp_ramfw/firmware.mk b/product/tc0/scp_ramfw/f=
irmware.mk
-index ec6e6679..d7515f5b 100644
---- a/product/tc0/scp_ramfw/firmware.mk
-+++ b/product/tc0/scp_ramfw/firmware.mk
-@@ -9,8 +9,24 @@ BS_FIRMWARE_CPU :=3D cortex-m3
- BS_FIRMWARE_HAS_NOTIFICATION :=3D yes
- BS_FIRMWARE_HAS_RESOURCE_PERMISSIONS :=3D yes
- BS_FIRMWARE_USE_NEWLIB_NANO_SPECS :=3D yes
--BS_FIRMWARE_HAS_FAST_CHANNELS :=3D no
--BS_FIRMWARE_HAS_PERF_PLUGIN_HANDLER :=3D no
-+
-+DEFAULT_SCP_PLATFORM_FEATURE_SET :=3D 0
-+
-+export SCP_PLATFORM_FEATURE_SET ?=3D $(DEFAULT_SCP_PLATFORM_FEATURE_SET=
)
-+ifneq ($(filter-out 0 1, $(SCP_PLATFORM_FEATURE_SET)),)
-+    $(error "Invalid for SCP_PLATFORM_FEATURE_SET parameter. Valid opti=
ons are \
-+      0 or 1. Aborting...")
-+endif
-+
-+ifeq ($(SCP_PLATFORM_FEATURE_SET),0)
-+    BS_FIRMWARE_HAS_PERF_PLUGIN_HANDLER :=3D no
-+    BS_FIRMWARE_HAS_FAST_CHANNELS :=3D no
-+else
-+    DEFINES +=3D TC0_FEATURES_MPMM_POWER_PERF
-+    BS_FIRMWARE_HAS_PERF_PLUGIN_HANDLER :=3D yes
-+    BS_FIRMWARE_HAS_FAST_CHANNELS :=3D yes
-+    $(info "TC0 platform features POWER/PERFORMANCE is experimental")
-+endif
-=20
- BS_FIRMWARE_MODULES :=3D \
-     armv7m_mpu \
-@@ -44,6 +60,16 @@ ifeq ($(BS_FIRMWARE_HAS_RESOURCE_PERMISSIONS),yes)
-     BS_FIRMWARE_MODULES +=3D resource_perms
- endif
-=20
-+ifeq ($(SCP_PLATFORM_FEATURE_SET),1)
-+BS_FIRMWARE_MODULES +=3D \
-+        traffic_cop \
-+        mpmm \
-+        sensor \
-+        reg_sensor \
-+        thermal_mgmt \
-+        tc0_power_model
-+endif
-+
- BS_FIRMWARE_SOURCES :=3D \
-     config_system_power.c \
-     config_armv7m_mpu.c \
-@@ -75,4 +101,15 @@ ifeq ($(BS_FIRMWARE_HAS_RESOURCE_PERMISSIONS),yes)
-     BS_FIRMWARE_SOURCES +=3D config_resource_perms.c
- endif
-=20
-+ifeq ($(SCP_PLATFORM_FEATURE_SET),1)
-+    BS_FIRMWARE_SOURCES +=3D \
-+        config_traffic_cop.c \
-+        config_mpmm.c \
-+        config_sensor.c \
-+        config_reg_sensor.c \
-+        config_thermal_mgmt.c \
-+        config_tc0_power_model.c
-+endif
-+
-+
- include $(BS_DIR)/firmware.mk
-diff --git a/product/tc0/scp_romfw/firmware.mk b/product/tc0/scp_romfw/f=
irmware.mk
-index 9977712f..0012b9fa 100644
---- a/product/tc0/scp_romfw/firmware.mk
-+++ b/product/tc0/scp_romfw/firmware.mk
-@@ -9,6 +9,18 @@ BS_FIRMWARE_CPU :=3D cortex-m3
- BS_FIRMWARE_HAS_NOTIFICATION :=3D yes
- BS_FIRMWARE_USE_NEWLIB_NANO_SPECS :=3D yes
-=20
-+DEFAULT_SCP_PLATFORM_FEATURE_SET :=3D 0
-+
-+export SCP_PLATFORM_FEATURE_SET ?=3D $(DEFAULT_SCP_PLATFORM_FEATURE_SET=
)
-+ifneq ($(filter-out 0 1, $(SCP_PLATFORM_FEATURE_SET)),)
-+    $(error "Invalid for SCP_PLATFORM_FEATURE_SET parameter. Valid opti=
ons are \
-+      0 or 1. Aborting...")
-+endif
-+
-+ifeq ($(SCP_PLATFORM_FEATURE_SET),1)
-+    $(info "TC0 platform features POWER/PERFORMANCE is experimental")
-+endif
-+
- BS_FIRMWARE_MODULE_HEADERS_ONLY :=3D \
-     power_domain \
-     timer
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc b/=
meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
index a6a005c1..3cbadad8 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
@@ -1,14 +1,6 @@
 # TC specific SCP configuration
=20
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/tc:"
-SRC_URI:append:tc =3D " \
-    file://0002-tc0-fix-mpmm-config.patch \
-    file://0003-tc0-rename-platform-variant-to-platform-feature-set.patc=
h \
-    file://0004-tc0-support-platform-feature-set-options-in-firmware.pat=
ch \
-    "
+COMPATIBLE_MACHINE =3D "(tc1)"
=20
-COMPATIBLE_MACHINE =3D "(tc?)"
-
-SCP_PLATFORM:tc0 =3D "tc0"
 SCP_PLATFORM:tc1 =3D "tc1"
 FW_TARGETS =3D "scp"
--=20
2.34.1


