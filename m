Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0860AC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 13:33:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19380.1666618428746066605
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 06:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5AFE1042;
	Mon, 24 Oct 2022 06:33:54 -0700 (PDT)
Received: from e126544.cambridge.arm.com (e126544.cambridge.arm.com [10.1.199.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A6593F7B4;
	Mon, 24 Oct 2022 06:33:47 -0700 (PDT)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 3/4] arm-bsp/trusted-firmware-m: corstone1000 support FMP image info
Date: Mon, 24 Oct 2022 14:33:29 +0100
Message-Id: <20221024133330.10542-4-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024133330.10542-1-mohamed.omarasaker@arm.com>
References: <20221024133330.10542-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 13:33:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4019

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

Apply tfm patches to support FMP image info

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 ...e1000-platform-secure-test-framework.patch | 359 +++++++++++
 ...ake-external-system-support-optional.patch |  77 +++
 ...ble-secure-enclave-run-without-host-.patch | 298 +++++++++
 ...on-Allow-configuration-of-input-and-.patch |  72 +++
 ...pport-for-UEFI-FMP-image-Information.patch | 573 ++++++++++++++++++
 ...0-remove-two-partition-configuration.patch |  51 ++
 .../trusted-firmware-m-corstone1000.inc       |  11 +
 7 files changed, 1441 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0001-corstone1000-platform-secure-test-framework.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0002-corstone1000-make-external-system-support-optional.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0003-corstone1000-enable-secure-enclave-run-without-host-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0004-Platform-Partition-Allow-configuration-of-input-and-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0005-corstone1000-support-for-UEFI-FMP-image-Information.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1=
000/0006-corstone1000-remove-two-partition-configuration.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/000=
1-corstone1000-platform-secure-test-framework.patch b/meta-arm-bsp/recipe=
s-bsp/trusted-firmware-m/corstone1000/0001-corstone1000-platform-secure-t=
est-framework.patch
new file mode 100644
index 00000000..8f633191
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0001-corst=
one1000-platform-secure-test-framework.patch
@@ -0,0 +1,359 @@
+From 6ab17eeb8225cdf4afc6956c9a2774d60866c36d Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 28 Mar 2022 05:16:50 +0100
+Subject: [PATCH 1/6] corstone1000: platform secure test framework
+
+Change-Id: Ib781927f0add93ec9c06515d251e79518ee1db6e
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Upstream-Status: Accepted [TF-Mv1.7.0]
+---
+ .../arm/corstone1000/Native_Driver/firewall.c |  15 ++
+ .../arm/corstone1000/Native_Driver/firewall.h |   5 +
+ .../ci_regression_tests/CMakeLists.txt        |  45 +++++
+ .../corstone1000/ci_regression_tests/s_test.c | 186 ++++++++++++++++++
+ .../corstone1000/ci_regression_tests/s_test.h |  30 +++
+ .../ci_regression_tests/s_test_config.cmake   |   8 +
+ 6 files changed, 289 insertions(+)
+ create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_t=
ests/CMakeLists.txt
+ create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_t=
ests/s_test.c
+ create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_t=
ests/s_test.h
+ create mode 100644 platform/ext/target/arm/corstone1000/ci_regression_t=
ests/s_test_config.cmake
+
+diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/firewall=
.c b/platform/ext/target/arm/corstone1000/Native_Driver/firewall.c
+index 788cc3ec92..356b85e9d5 100755
+--- a/platform/ext/target/arm/corstone1000/Native_Driver/firewall.c
++++ b/platform/ext/target/arm/corstone1000/Native_Driver/firewall.c
+@@ -293,6 +293,21 @@ void fc_enable_mpl(enum rgn_mpe_t mpe, enum rgn_mpl=
_t mpl)
+         ptr->rgn_mpl3 |=3D (mpl & RGN_MPL_EN_MASK);
+ }
+=20
++void fc_read_mpl(enum rgn_mpe_t mpe, enum rgn_mpl_t* mpl)
++{
++    struct _firewall_pe_rwe_reg_map_t *ptr =3D
++         (struct _firewall_pe_rwe_reg_map_t *)fw_data.rwe_ptr;
++    if (mpe =3D=3D RGN_MPE0)
++        *mpl =3D (ptr->rgn_mpl0 & RGN_MPL_EN_MASK);
++    else if (mpe =3D=3D RGN_MPE1)
++        *mpl =3D (ptr->rgn_mpl1 & RGN_MPL_EN_MASK);
++    else if (mpe =3D=3D RGN_MPE2)
++        *mpl =3D (ptr->rgn_mpl2 & RGN_MPL_EN_MASK);
++    else if (mpe =3D=3D RGN_MPE3)
++        *mpl =3D (ptr->rgn_mpl3 & RGN_MPL_EN_MASK);
++}
++
++
+ void fc_disable_mpl(enum rgn_mpe_t mpe, enum rgn_mpl_t mpl)
+ {
+     struct _firewall_pe_rwe_reg_map_t *ptr =3D
+diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/firewall=
.h b/platform/ext/target/arm/corstone1000/Native_Driver/firewall.h
+index 48c86725ef..17afe6a92f 100755
+--- a/platform/ext/target/arm/corstone1000/Native_Driver/firewall.h
++++ b/platform/ext/target/arm/corstone1000/Native_Driver/firewall.h
+@@ -247,6 +247,11 @@ void fc_init_mpl(enum rgn_mpe_t mpe);
+  */
+ void fc_enable_mpl(enum rgn_mpe_t mpe, enum rgn_mpl_t mpl);
+=20
++/**
++ * \brief Reads Master Permission List in the selected Firewall Compone=
nt
++ */
++void fc_read_mpl(enum rgn_mpe_t mpe, enum rgn_mpl_t* mpl);
++
+ /**
+  * \brief Disables Master Permission List in the selected Firewall Comp=
onent
+  */
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/CM=
akeLists.txt b/platform/ext/target/arm/corstone1000/ci_regression_tests/C=
MakeLists.txt
+new file mode 100644
+index 0000000000..70e1c20e4e
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeList=
s.txt
+@@ -0,0 +1,45 @@
++#----------------------------------------------------------------------=
---------
++# Copyright (c) 2021-22, Arm Limited. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++
++cmake_policy(SET CMP0079 NEW)
++
++include(${CMAKE_CURRENT_SOURCE_DIR}/s_test_config.cmake)
++
++####################### Secure ########################################=
#########
++
++add_library(corstone1000_test_s STATIC EXCLUDE_FROM_ALL)
++
++target_sources(corstone1000_test_s
++    PRIVATE
++        ${CMAKE_CURRENT_SOURCE_DIR}/s_test.c
++        ../Native_Driver/firewall.c
++)
++
++target_include_directories(corstone1000_test_s
++    PRIVATE
++        ${CMAKE_CURRENT_SOURCE_DIR}
++        ../Device/Include
++        ../Native_Driver
++)
++
++# Example test links tfm_test_suite_extra_common to use related interfa=
ce
++target_link_libraries(corstone1000_test_s
++    PRIVATE
++        tfm_test_suite_extra_common
++        tfm_log
++)
++
++target_compile_definitions(corstone1000_test_s
++    PRIVATE
++        $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
++)
++
++# The corstone1000_test_s library is linked by tfm_test_suite_extra_s
++target_link_libraries(tfm_test_suite_extra_s
++    PRIVATE
++        corstone1000_test_s
++)
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_=
test.c b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.=
c
+new file mode 100644
+index 0000000000..963f46d2ab
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.c
+@@ -0,0 +1,186 @@
++/*
++ * Copyright (c) 2021-22, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include "s_test.h"
++#include "platform_base_address.h"
++#include "firewall.h"
++#include "tfm_log_raw.h"
++
++#define DISABLED_TEST 0
++
++enum host_firewall_host_comp_id_t {
++  HOST_FCTRL =3D (0x00u),
++  COMP_SYSPERIPH,
++  COMP_DBGPERIPH,
++  COMP_AONPERIPH,
++  COMP_XNVM,
++  COMP_CVM,
++  COMP_HOSTCPU,
++  COMP_EXTSYS0,
++  COMP_EXTSYS1,
++  COMP_EXPSLV0,
++  COMP_EXPSLV1,
++  COMP_EXPMST0,
++  COMP_EXPMST1,
++  COMP_OCVM,
++  COMP_DEBUG,
++};
++
++const struct extra_tests_t plat_s_t =3D {
++    .test_entry =3D s_test,
++    .expected_ret =3D EXTRA_TEST_SUCCESS
++};
++
++static int test_host_firewall_status(void)
++{
++    enum fw_lockdown_status_t status;
++    uint32_t any_component_id =3D 2;
++
++    fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, any_component_id=
);
++    status =3D fw_get_lockdown_status();
++    if (status !=3D FW_LOCKED) {
++        tfm_log_printf("FAIL: %s.\n\r", __func__);
++        return EXTRA_TEST_FAILED;
++    }
++
++    tfm_log_printf("PASS: %s\n\r", __func__);
++    return EXTRA_TEST_SUCCESS;
++}
++
++static int test_host_firewall_external_flash_configurations(void)
++{
++    enum rgn_mpl_t mpl_rights =3D 0;
++    enum rgn_mpl_t expected_rights =3D 0;
++
++#if !(PLATFORM_IS_FVP)
++    /* External flash */
++    fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_EXPMST0);
++    fc_select_region(3);
++    fc_read_mpl(RGN_MPE0, &mpl_rights);
++    expected_rights =3D (RGN_MPL_ANY_MST_MASK | RGN_MPL_SECURE_READ_MAS=
K |
++                                              RGN_MPL_SECURE_WRITE_MASK=
);
++    if (mpl_rights !=3D expected_rights) {
++        tfm_log_printf("FAIL1: %s.\n\r", __func__);
++        return EXTRA_TEST_FAILED;
++    }
++    /* XIP Permissions */
++    fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_XNVM);
++    fc_select_region(1);
++    fc_read_mpl(RGN_MPE0, &mpl_rights);
++    expected_rights =3D (RGN_MPL_ANY_MST_MASK |
++                              RGN_MPL_SECURE_READ_MASK |
++                              RGN_MPL_NONSECURE_READ_MASK);
++    if (mpl_rights !=3D expected_rights) {
++        tfm_log_printf("FAIL2: %s.\n\r", __func__);
++        return EXTRA_TEST_FAILED;
++    }
++#else
++    /* Enable the below test when FVP Host Firewall is configured. */
++    /*
++    fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_XNVM);
++    fc_select_region(1);
++    fc_read_mpl(RGN_MPE0, &mpl_rights);
++    tfm_log_printf("mpl rights =3D %d\n\r", mpl_rights);
++    expected_rights =3D (RGN_MPL_ANY_MST_MASK |
++                  RGN_MPL_SECURE_READ_MASK |
++                  RGN_MPL_SECURE_WRITE_MASK |
++                  RGN_MPL_NONSECURE_READ_MASK |
++                  RGN_MPL_NONSECURE_WRITE_MASK);
++    if (mpl_rights !=3D expected_rights) {
++        tfm_log_printf("FAIL1: %s.\n\r", __func__);
++        return EXTRA_TEST_FAILED;
++    }
++    */
++#endif
++
++    tfm_log_printf("PASS: %s\n\r", __func__);
++    return EXTRA_TEST_SUCCESS;
++}
++
++static int test_host_firewall_secure_flash_configurations(void)
++{
++    enum rgn_mpl_t mpl_rights =3D 0;
++    enum rgn_mpl_t expected_rights =3D 0;
++
++#if !(PLATFORM_IS_FVP)
++    /* External flash */
++    fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_EXPMST1);
++    fc_select_region(1);
++    fc_read_mpl(RGN_MPE0, &mpl_rights);
++    expected_rights =3D (RGN_MPL_ANY_MST_MASK | RGN_MPL_SECURE_READ_MAS=
K |
++                                              RGN_MPL_SECURE_WRITE_MASK=
);
++    if (mpl_rights !=3D expected_rights) {
++        tfm_log_printf("FAIL: %s.\n\r", __func__);
++        return EXTRA_TEST_FAILED;
++    }
++#endif
++
++    tfm_log_printf("PASS: %s\n\r", __func__);
++    return EXTRA_TEST_SUCCESS;
++}
++
++static int test_bir_programming(void)
++{
++    /* BIR is expected to bhaive like write once register */
++
++    volatile uint32_t *bir_base =3D (uint32_t *)CORSTONE1000_HOST_BIR_B=
ASE;
++
++    bir_base[0] =3D 0x1;
++    bir_base[0] =3D 0x2;
++    if (bir_base[0] !=3D 0x1) {
++        tfm_log_printf("FAIL: %s : (%u)\n\r", __func__, bir_base[0]);
++        return EXTRA_TEST_FAILED;
++    }
++
++    tfm_log_printf("PASS: %s\n\r", __func__);
++    return EXTRA_TEST_SUCCESS;
++}
++
++int32_t s_test(void)
++{
++    int status;
++    int failures =3D 0;
++
++#if (DISABLED_TEST =3D=3D 1)
++    status =3D test_host_firewall_status();
++    if (status) {
++        failures++;
++    }
++#endif
++
++    status =3D test_host_firewall_secure_flash_configurations();
++    if (status) {
++        failures++;
++    }
++
++    status =3D test_host_firewall_external_flash_configurations();
++    if (status) {
++        failures++;
++    }
++
++#if (DISABLED_TEST =3D=3D 1)
++    status =3D test_bir_programming();
++    if (status) {
++        failures++;
++    }
++#endif
++
++    if (failures) {
++        tfm_log_printf("Not all platform test could pass: failures=3D%d=
\n\r", failures);
++        return EXTRA_TEST_FAILED;
++    }
++
++    tfm_log_printf("ALL_PASS: corstone1000 platform test cases passed.\=
n\r");
++    return EXTRA_TEST_SUCCESS;
++}
++
++int32_t extra_tests_init(struct extra_tests_t *internal_test_t)
++{
++    /* Add platform init code here. */
++
++    return register_extra_tests(internal_test_t, &plat_s_t);
++}
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_=
test.h b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.=
h
+new file mode 100644
+index 0000000000..8aff4d679c
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test.h
+@@ -0,0 +1,30 @@
++/*
++ * Copyright (c) 2021-22, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __S_TESTS_H__
++#define __S_TESTS_H__
++
++#include "extra_tests_common.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++const struct extra_tests_t plat_s_t;
++
++/**
++ * \brief Platform specific secure test function.
++ *
++ * \returns Returns error code as specified in \ref int32_t
++ */
++int32_t s_test(void);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __S_TESTS_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/s_=
test_config.cmake b/platform/ext/target/arm/corstone1000/ci_regression_te=
sts/s_test_config.cmake
+new file mode 100644
+index 0000000000..bb8d26bf1c
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/s_test_co=
nfig.cmake
+@@ -0,0 +1,8 @@
++#----------------------------------------------------------------------=
---------
++# Copyright (c) 2021-22, Arm Limited. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++
++############ Define secure test specific cmake configurations here ####=
#########
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/000=
2-corstone1000-make-external-system-support-optional.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/corstone1000/0002-corstone1000-make-exter=
nal-system-support-optional.patch
new file mode 100644
index 00000000..c6bacb49
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0002-corst=
one1000-make-external-system-support-optional.patch
@@ -0,0 +1,77 @@
+From 6fd49ab55c3419429e437845864c5bb2d731da29 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 25 Apr 2022 05:26:38 +0100
+Subject: [PATCH 2/6] corstone1000: make external system support optional
+
+The commits introduce build time variables to make
+external system support in the platform optional.
+
+Change-Id: I593014e0da4ac553c105c66ae55f6fd83ffe427e
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Upstream-Status: Accepted [TF-Mv1.7.0]
+---
+ .../ext/target/arm/corstone1000/CMakeLists.txt    |  1 +
+ platform/ext/target/arm/corstone1000/config.cmake |  1 +
+ .../target/arm/corstone1000/tfm_hal_multi_core.c  | 15 +++++++++++++++
+ 3 files changed, 17 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 16bc708964..39d7b03455 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -97,6 +97,7 @@ target_compile_definitions(platform_s
+     PRIVATE
+         $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
+         $<$<BOOL:${TEST_S}>:TEST_S>
++        $<$<BOOL:${EXTERNAL_SYSTEM_SUPPORT}>:EXTERNAL_SYSTEM_SUPPORT>
+ )
+=20
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform BL2 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
+index e5f91108ee..a3399db318 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -21,6 +21,7 @@ set(CRYPTO_HW_ACCELERATOR               ON         CAC=
HE BOOL     "Whether to en
+ set(CRYPTO_NV_SEED                      OFF        CACHE BOOL     "Use =
stored NV seed to provide entropy")
+ set(TFM_CRYPTO_TEST_ALG_CFB             OFF        CACHE BOOL     "Test=
 CFB cryptography mode")
+ set(NS                                  FALSE      CACHE BOOL     "Whet=
her to build NS app")
++set(EXTERNAL_SYSTEM_SUPPORT             OFF        CACHE BOOL     "Whet=
her to include external system support.")
+=20
+ # FVP is not integrated/tested with CC312.
+ if (${PLATFORM_IS_FVP})
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+index 8e1b455086..8622844d91 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+@@ -16,6 +16,16 @@
+ #define HOST_CPU_PE0_CONFIG_OFFSET 0x010
+ #define AA64nAA32_MASK (1 << 3)
+=20
++#ifdef EXTERNAL_SYSTEM_SUPPORT
++void tfm_external_system_boot()
++{
++    volatile uint32_t *ext_sys_reset_ctl_reg =3D (uint32_t *)(CORSTONE1=
000_EXT_SYS_RESET_REG);
++
++    /* de-assert CPU_WAIT signal*/
++    *ext_sys_reset_ctl_reg =3D 0x0;
++}
++#endif
++
+ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+ {
+     /* Switch the shared flash to XiP mode for the host */
+@@ -53,6 +63,11 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+     *reset_ctl_reg =3D 0;
+=20
+     (void) start_addr;
++
++#ifdef EXTERNAL_SYSTEM_SUPPORT
++    /*release EXT SYS out of reset*/
++    tfm_external_system_boot();
++#endif
+ }
+=20
+ void tfm_hal_wait_for_ns_cpu_ready(void)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/000=
3-corstone1000-enable-secure-enclave-run-without-host-.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/corstone1000/0003-corstone1000-enable-s=
ecure-enclave-run-without-host-.patch
new file mode 100644
index 00000000..64229522
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0003-corst=
one1000-enable-secure-enclave-run-without-host-.patch
@@ -0,0 +1,298 @@
+From 2e56f2601249243f2fb3ba67caf9febe4bfc8371 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Tue, 26 Apr 2022 20:17:13 +0100
+Subject: [PATCH 3/6] corstone1000: enable secure enclave run without hos=
t
+ binaries
+
+In TEST_S configuration, the build disables part of the code which
+assumes that the host binaries are present in the flash. This change
+will allow secure enclave's part of the platforms software to build
+and run without the host support. The configuration can be used to run
+CI and test secure enclave software independently.
+
+Change-Id: I29325750a3bea270fe5b3b8b47932a7071a59482
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Upstream-Status: Accepted [TF-Mv1.7.0]
+---
+ .../ext/target/arm/corstone1000/readme.rst    | 88 +++++++++++++++----
+ .../target/arm/corstone1000/CMakeLists.txt    |  8 +-
+ .../arm/corstone1000/bl1/CMakeLists.txt       |  2 +-
+ .../target/arm/corstone1000/bl2_flash_map.c   |  2 +
+ .../target/arm/corstone1000/boot_hal_bl2.c    |  2 +
+ .../ext/target/arm/corstone1000/config.cmake  | 11 ++-
+ .../arm/corstone1000/partition/flash_layout.h |  2 +-
+ .../arm/corstone1000/tfm_hal_multi_core.c     |  2 +
+ 8 files changed, 94 insertions(+), 23 deletions(-)
+
+diff --git a/docs/platform/ext/target/arm/corstone1000/readme.rst b/docs=
/platform/ext/target/arm/corstone1000/readme.rst
+index 94b58ac6fc..10c9c58f78 100644
+--- a/docs/platform/ext/target/arm/corstone1000/readme.rst
++++ b/docs/platform/ext/target/arm/corstone1000/readme.rst
+@@ -7,22 +7,27 @@ Introduction
+ ************
+=20
+ The ARM's Corstone-1000 platform is a reference implementation of PSA F=
F-M
+-architecture where NSPE and SPE environments are partitioned into
++architecture where NSPE and SPE environments are partitioned/isolated i=
nto
+ Cortex-A35 and Cortex-M0+ respectively.
+=20
+ Cortex-M0+ acting as Secure Enclave is the Root-of-trust of SoC. Its
+-software comprises of two boot loading stages, i.e. Bl1 and Bl2, based =
on
+-mcuboot, and TF-M as run time software. Cortex-A35, also referred as ho=
st,
+-is completely treated as non-secure from the Secure Enclave perspective=
.
++software comprises of two boot loading stages, i.e. Bl1 and Bl2 (based =
on
++mcuboot) and TF-M as run time software. Cortex-A35, also referred as ho=
st,
++is treated as non-secure from the Secure Enclave perspective.
+ The Cortex-A35 is brought out of rest by Secure Enclave in aarch64 bit =
mode,
+ and boots the software ecosystem based on linux, u-boot, UEFI run time
+-services, TF-A and Optee.
++services, TF-A, Secure Partitions and Optee.
+=20
+ The communication between NSPE and SPE is based on PSA IPC protocol run=
ning on
+-top of OpenAMP.
++top of FF-A/OpenAMP.
+=20
+ The secure enclave subsystem has ARM's CC-312 (Crypto Cell) hardware to
+-accelerate cryptographic operations.
++accelerate cryptographic operations. Additionaly, platform supports Sec=
ure Debug
++using SDC-600 as the communication interface between host debugger and =
platform
++target. The platform has the build option to enable secure debug protoc=
ol to
++unlock debug ports during boot time. The protocol is based on ARM's ADA=
C
++(Authenticated Debug Access Control) standard.
++
+=20
+ ***********
+ System boot
+@@ -33,23 +38,76 @@ System boot
+ - BL1 load, verifies and transfer execution to BL2 which is again based=
 on mcuboot.
+ - BL2 loads and verifies TF-M and host's initial boot loader image.
+ - BL2 transfer the execution to the TF-M.
+-- During TF-M initialization, the host is reset.
++- During TF-M initialization, the host is taken out of rest.
++- Hashes of the keys used for image verification are stored in the OTP =
memory.
+=20
+ *****
+ Build
+ *****
+=20
+-.. code-block::
++Platform solution
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++The platform binaries are build using Yocto. Below is the user guide:
++
++`Arm Corstone-1000 User Guide`_
++
++Secure Test
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++This section can be used to test the secure enclave software indedenden=
tly from
++the host. The below configuration builds the secure enclave binaries wi=
th CI test
++frame integrated. On boot, secure enclave softwares stack is brought up=
, and
++CI tests starts executing at the end of the initialization process. In =
the
++below configuration, host software support is disabled, and meant only
++to test/verify the secure enclave softwares.
++
++FVP
++---
+=20
+-    cmake -B build/ -S <tf-m-root>/ -DCMAKE_BUILD_TYPE=3DDebug -DTFM_TO=
OLCHAIN_FILE=3D<tf-m-root>/toolchain_GNUARM.cmake -DTFM_PLATFORM=3Darm/co=
rstone1000
++- Download Corstone-1000 FVP from : `Arm Ecosystem FVPs`_
++- Install FVP by running the shell script.
++- Running of the binary will boot secure enclave software stack and at =
the end all CI test
++  from tf-m-test along with platform specific tests are executed.
++
++.. code-block:: bash
++
++    cmake -B build/ -S <tf-m-root>/ -DCMAKE_BUILD_TYPE=3DDebug -DTFM_TO=
OLCHAIN_FILE=3D<tf-m-root>/toolchain_GNUARM.cmake -DTFM_PLATFORM=3Darm/co=
rstone1000 -DPLATFORM_IS_FVP=3DTRUE -DTEST_NS=3DOFF -DTEST_S=3DON -DEXTRA=
_S_TEST_SUITES_PATHS=3D<tf-m-root>/trusted-firmware-m/platform/ext/target=
/arm/corstone1000/ci_regression_tests/
+     cmake --build build -- install
++    cd ./build/install/outputs/
++    cat bl2_signed.bin bl2_signed.bin tfm_s_signed.bin > cs1000.bin
++    cd <path-to-FVP-installation>/models/Linux64_GCC-9.3/
++    ./FVP_Corstone-1000 -C board.flashloader0.fname=3D"none" -C se.trus=
tedBootROMloader.fname=3D"./<path-to-build-dir>/install/outputs/bl1.bin" =
-C board.xnvm_size=3D64 -C se.trustedSRAM_config=3D6 -C se.BootROM_config=
=3D"3" -C board.smsc_91c111.enabled=3D0  -C board.hostbridge.userNetworki=
ng=3Dtrue --data board.flash0=3D./<path-to-build-dir>/install/outputs/cs1=
000.bin@0x68100000 -C diagnostics=3D4 -C disable_visualisation=3Dtrue -C =
board.se_flash_size=3D8192 -C diagnostics=3D4  -C disable_visualisation=3D=
true
++
++FPGA
++----
+=20
+-The binaries will be installed inside:
++- Follow the above pointed platform user guide to setup the FPGA board.
++- Use the BL1 generated from the below commands to place it inside FPGA=
 board SD Card.
++- Use the cs1000.bin created from the below commands to place it inside=
 FPGA board SD Card.
++
++.. code-block:: bash
++
++    cmake -B build/ -S <tf-m-root>/ -DCMAKE_BUILD_TYPE=3DDebug -DTFM_TO=
OLCHAIN_FILE=3D<tf-m-root>/toolchain_GNUARM.cmake -DTFM_PLATFORM=3Darm/co=
rstone1000 -DTEST_NS=3DOFF -DTEST_S=3DON -DEXTRA_S_TEST_SUITES_PATHS=3D<t=
f-m-root>/trusted-firmware-m/platform/ext/target/arm/corstone1000/ci_regr=
ession_tests/ -DTEST_S_PS=3DOFF -DTEST_S_PLATFORM=3DOFF
++    cmake --build build -- install
++    cd ./build/install/outputs/
++    cat bl2_signed.bin bl2_signed.bin tfm_s_signed.bin > cs1000.bin
++    cp bl1.bin <path-to-FPGA-SD-CARD>/SOFTWARE/
++    cp cs1000.bin <path-to-FPGA-SD-CARD>/SOFTWARE/
+=20
+-.. code-block::
++FPGA build can not compile all the CI tests into a single build as it e=
xceeds
++the available RAM size. So there is a need to select few tests but not =
all.
++The above configuration disable build of -DTEST_S_PS and -DTEST_S_PLATF=
ORM.
++Other test configurations are:
+=20
+-    ./build/install/outputs/ARM/CORSTONE1000
++- -DTEST_S_ATTESTATION=3DON/OFF
++- -DTEST_S_AUDIT=3DON/OFF
++- -DTEST_S_CRYPTO=3DON/OFF
++- -DTEST_S_ITS=3DON/OFF
++- -DTEST_S_PS=3DON/OFF
++- -DTEST_S_PLATFORM=3DON/OFF
+=20
+---------------
++*Copyright (c) 2021-2022, Arm Limited. All rights reserved.*
+=20
+-*Copyright (c) 2021, Arm Limited. All rights reserved.*
++.. _Arm Ecosystem FVPs: https://developer.arm.com/tools-and-software/op=
en-source-software/arm-platforms-software/arm-ecosystem-fvps
++.. _Arm Corstone-1000 User Guide: https://gitlab.arm.com/arm-reference-=
solutions/arm-reference-solutions-docs/-/blob/CORSTONE1000-2022.04.19/doc=
s/embedded-a/corstone1000/user-guide.rst
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 39d7b03455..81522c7cf0 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -18,7 +18,7 @@ target_include_directories(platform_region_defs
+=20
+ target_compile_definitions(platform_region_defs
+     INTERFACE
+-        $<$<BOOL:${TEST_S}>:TEST_S>
++        $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
+ )
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform common defs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+=20
+@@ -75,7 +75,7 @@ target_sources(platform_s
+         $<$<BOOL:TFM_PARTITION_PLATFORM>:${CMAKE_CURRENT_SOURCE_DIR}/se=
rvices/src/tfm_platform_system.c>
+         fw_update_agent/uefi_capsule_parser.c
+         fw_update_agent/fwu_agent.c
+-        $<$<BOOL:${TEST_S}>:${CMAKE_CURRENT_SOURCE_DIR}/target_cfg.c>
++        $<$<BOOL:${TFM_S_REG_TEST}>:${CMAKE_CURRENT_SOURCE_DIR}/target_=
cfg.c>
+ )
+=20
+ if (PLATFORM_IS_FVP)
+@@ -96,7 +96,7 @@ endif()
+ target_compile_definitions(platform_s
+     PRIVATE
+         $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
+-        $<$<BOOL:${TEST_S}>:TEST_S>
++        $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
+         $<$<BOOL:${EXTERNAL_SYSTEM_SUPPORT}>:EXTERNAL_SYSTEM_SUPPORT>
+ )
+=20
+@@ -136,7 +136,7 @@ endif()
+ target_compile_definitions(platform_bl2
+     PRIVATE
+         $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
+-        $<$<BOOL:${TEST_S}>:TEST_S>
++        $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
+ )
+=20
+ # boot_hal_bl2.c is compiled as part of 'bl2' target and not inside
+diff --git a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt b/p=
latform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+index 369695f148..d39c5ae91d 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+@@ -291,7 +291,7 @@ target_compile_definitions(signing_layout_for_bl2
+     PRIVATE
+         MCUBOOT_IMAGE_NUMBER=3D${BL1_IMAGE_NUMBER}
+         BL1
+-        $<$<BOOL:${TEST_S}>:TEST_S>
++        $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
+ )
+=20
+ target_include_directories(signing_layout_for_bl2
+diff --git a/platform/ext/target/arm/corstone1000/bl2_flash_map.c b/plat=
form/ext/target/arm/corstone1000/bl2_flash_map.c
+index 6bffa274df..0a6a592d94 100644
+--- a/platform/ext/target/arm/corstone1000/bl2_flash_map.c
++++ b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
+@@ -38,6 +38,7 @@ struct flash_area flash_map[] =3D {
+         .fa_off =3D FLASH_AREA_1_OFFSET,
+         .fa_size =3D FLASH_AREA_1_SIZE,
+     },
++#ifndef TFM_S_REG_TEST
+     {
+         .fa_id =3D FLASH_AREA_2_ID,
+         .fa_device_id =3D FLASH_DEVICE_ID,
+@@ -52,6 +53,7 @@ struct flash_area flash_map[] =3D {
+         .fa_off =3D FLASH_INVALID_OFFSET,
+         .fa_size =3D FLASH_INVALID_SIZE,
+     },
++#endif
+ };
+=20
+ const int flash_map_entry_num =3D ARRAY_SIZE(flash_map);
+diff --git a/platform/ext/target/arm/corstone1000/boot_hal_bl2.c b/platf=
orm/ext/target/arm/corstone1000/boot_hal_bl2.c
+index 792e06f81e..134315a17b 100644
+--- a/platform/ext/target/arm/corstone1000/boot_hal_bl2.c
++++ b/platform/ext/target/arm/corstone1000/boot_hal_bl2.c
+@@ -100,10 +100,12 @@ int32_t boot_platform_init(void)
+         return 1;
+     }
+=20
++#ifndef TFM_S_REG_TEST
+     result =3D fill_bl2_flash_map_by_parsing_fips(BANK_0_PARTITION_OFFS=
ET);
+     if (result) {
+         return 1;
+     }
++#endif
+=20
+     result =3D FLASH_DEV_NAME.Initialize(NULL);
+     if (result !=3D ARM_DRIVER_OK) {
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
+index a3399db318..a6a1a33c42 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -13,8 +13,15 @@ set(DEFAULT_MCUBOOT_FLASH_MAP           OFF        CA=
CHE BOOL     "Whether to us
+ set(MCUBOOT_UPGRADE_STRATEGY            "RAM_LOAD" CACHE STRING   "Upgr=
ade strategy when multiple boot images are loaded")
+ set(MCUBOOT_SECURITY_COUNTER_S          "1"      CACHE STRING    "Secur=
ity counter for S image. auto sets it to IMAGE_VERSION_S")
+=20
+-set(TFM_ISOLATION_LEVEL                 2          CACHE STRING   "Isol=
ation level")
+-set(MCUBOOT_IMAGE_NUMBER                2          CACHE STRING   "Whet=
her to combine S and NS into either 1 image, or sign each separately")
++if (TEST_S OR TEST_S_ATTESTATION OR TEST_S_AUDIT OR TEST_S_CRYPTO OR TE=
ST_S_ITS OR TEST_S_PS OR TEST_S_PLATFORM OR EXTRA_S_TEST_SUITES_PATHS)
++  # Test configuration: host images are not needed and work only with i=
solation level 1
++  set(MCUBOOT_IMAGE_NUMBER                1          CACHE STRING   "Wh=
ether to combine S and NS into either 1 image, or sign each separately")
++  set(TFM_ISOLATION_LEVEL                 1          CACHE STRING   "Is=
olation level")
++else()
++  set(MCUBOOT_IMAGE_NUMBER                2          CACHE STRING   "Wh=
ether to combine S and NS into either 1 image, or sign each separately")
++  set(TFM_ISOLATION_LEVEL                 2          CACHE STRING   "Is=
olation level")
++endif()
++
+ set(TFM_MULTI_CORE_TOPOLOGY             ON         CACHE BOOL     "Whet=
her to build for a dual-cpu architecture")
+ set(TFM_PLAT_SPECIFIC_MULTI_CORE_COMM   ON         CACHE BOOL     "Whet=
her to use a platform specific inter core communication instead of mailbo=
x in dual-cpu topology")
+ set(CRYPTO_HW_ACCELERATOR               ON         CACHE BOOL     "Whet=
her to enable the crypto hardware accelerator on supported platforms")
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index aa5a8fe463..b0319bb319 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -119,7 +119,7 @@
+  *
+  */
+ #define SE_BL2_PARTITION_SIZE           (0x19000)    /* 100 KB */
+-#ifdef TEST_S
++#ifdef TFM_S_REG_TEST
+ #define TFM_PARTITION_SIZE              (0x61C00)    /* 391 KB */
+ #else
+ #define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+index 8622844d91..1146ffe22a 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+@@ -31,6 +31,7 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+     /* Switch the shared flash to XiP mode for the host */
+     Select_XIP_Mode_For_Shared_Flash();
+=20
++#ifndef TFM_S_REG_TEST
+     volatile uint32_t *bir_base =3D (uint32_t *)CORSTONE1000_HOST_BIR_B=
ASE;
+=20
+     /* Program Boot Instruction Register to jump to BL2 (TF-A) base add=
ress
+@@ -68,6 +69,7 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+     /*release EXT SYS out of reset*/
+     tfm_external_system_boot();
+ #endif
++#endif /* !TFM_S_REG_TEST */
+ }
+=20
+ void tfm_hal_wait_for_ns_cpu_ready(void)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/000=
4-Platform-Partition-Allow-configuration-of-input-and-.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/corstone1000/0004-Platform-Partition-Al=
low-configuration-of-input-and-.patch
new file mode 100644
index 00000000..211fb9e6
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0004-Platf=
orm-Partition-Allow-configuration-of-input-and-.patch
@@ -0,0 +1,72 @@
+From f3686dfb8fb97cb42c3d4f8ee2d7aa736d5cb760 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Wed, 3 Aug 2022 15:50:27 +0100
+Subject: [PATCH 4/6] Platform Partition: Allow configuration of input an=
d
+ output buffer
+
+The change makes input and output buffer size macros used by
+the platform partition to be configured by cmake. This will
+allow platforms to set the buffer size accordingly.
+
+Change-Id: Ia492ce02f8744b0157228d9be51a9ec5b7c88ef6
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Upstream-Status: Accepted [TF-Mv1.7.0]
+---
+ config/config_default.cmake                  | 2 ++
+ secure_fw/partitions/platform/CMakeLists.txt | 6 ++++++
+ secure_fw/partitions/platform/platform_sp.c  | 9 +++++++--
+ 3 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/config/config_default.cmake b/config/config_default.cmake
+index 3112b707bc..497c972dc9 100755
+--- a/config/config_default.cmake
++++ b/config/config_default.cmake
+@@ -141,6 +141,8 @@ set(ATTEST_INCLUDE_OPTIONAL_CLAIMS      ON          =
CACHE BOOL      "Include opt
+ set(ATTEST_INCLUDE_COSE_KEY_ID          OFF         CACHE BOOL      "In=
clude COSE key-id in initial attestation token")
+=20
+ set(TFM_PARTITION_PLATFORM              ON          CACHE BOOL      "En=
able Platform partition")
++set(PLATFORM_SERVICE_INPUT_BUFFER_SIZE  64          CACHE STRING    "Si=
ze of input buffer in platform service.")
++set(PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE 64          CACHE STRING    "Si=
ze of output buffer in platform service.")
+=20
+ set(TFM_PARTITION_AUDIT_LOG             OFF         CACHE BOOL      "En=
able Audit Log partition")
+=20
+diff --git a/secure_fw/partitions/platform/CMakeLists.txt b/secure_fw/pa=
rtitions/platform/CMakeLists.txt
+index 4b37cd780c..3070f89d6d 100644
+--- a/secure_fw/partitions/platform/CMakeLists.txt
++++ b/secure_fw/partitions/platform/CMakeLists.txt
+@@ -47,6 +47,12 @@ target_link_libraries(tfm_psa_rot_partition_platform
+         tfm_spm
+ )
+=20
++target_compile_definitions(tfm_psa_rot_partition_platform
++    PRIVATE
++        INPUT_BUFFER_SIZE=3D${PLATFORM_SERVICE_INPUT_BUFFER_SIZE}
++        OUTPUT_BUFFER_SIZE=3D${PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE}
++)
++
+ ############################ Secure API ###############################=
#########
+=20
+ target_sources(tfm_sprt
+diff --git a/secure_fw/partitions/platform/platform_sp.c b/secure_fw/par=
titions/platform/platform_sp.c
+index 673cb0ee06..87bd434720 100644
+--- a/secure_fw/partitions/platform/platform_sp.c
++++ b/secure_fw/partitions/platform/platform_sp.c
+@@ -38,8 +38,13 @@ static const int32_t nv_counter_access_map[NV_COUNTER=
_MAP_SIZE] =3D {
+ #include "psa/service.h"
+ #include "region_defs.h"
+=20
+-#define INPUT_BUFFER_SIZE  64
+-#define OUTPUT_BUFFER_SIZE 64
++#ifndef INPUT_BUFFER_SIZE
++#define INPUT_BUFFER_SIZE      64
++#endif
++
++#ifndef OUTPUT_BUFFER_SIZE
++#define OUTPUT_BUFFER_SIZE     64
++#endif
+=20
+ typedef enum tfm_platform_err_t (*plat_func_t)(const psa_msg_t *msg);
+ #endif /* TFM_PSA_API */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/000=
5-corstone1000-support-for-UEFI-FMP-image-Information.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/corstone1000/0005-corstone1000-support-f=
or-UEFI-FMP-image-Information.patch
new file mode 100644
index 00000000..14e4b7ff
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0005-corst=
one1000-support-for-UEFI-FMP-image-Information.patch
@@ -0,0 +1,573 @@
+From 9d70628b7dc1dbc3c1ac7f4f3c0f6aa6b237510d Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Wed, 6 Jul 2022 11:19:39 +0100
+Subject: [PATCH 5/6] corstone1000: support for UEFI FMP image Informatio=
n
+
+The commit provides the support for UEFI FMP (Firmware Management
+Protocol) SET and GET Image info APIs.
+
+The APIs to SET and GET image info is implemented. In current design,
+SET is called by secure encalve and GET is called by the host.
+
+FMP image information is initialized on every boot and retained
+in SRAM. The updatable values of the FMP are stored in private
+metadata section of the flash.
+
+Change-Id: Iaf0b4a13a9c24f05e4a32509e61a8b96ee8e9e4b
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Upstream-Status: Accepted [TF-Mv1.7.0]
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |   2 +
+ .../ext/target/arm/corstone1000/config.cmake  |   8 +-
+ .../corstone1000/fw_update_agent/fwu_agent.c  |  61 ++++-
+ .../corstone1000/fw_update_agent/fwu_agent.h  |   3 +
+ .../corstone1000/fw_update_agent/uefi_fmp.c   | 240 ++++++++++++++++++
+ .../corstone1000/fw_update_agent/uefi_fmp.h   |  56 ++++
+ .../include/corstone1000_ioctl_requests.h     |  14 +-
+ .../services/src/tfm_platform_system.c        |   9 +
+ 8 files changed, 374 insertions(+), 19 deletions(-)
+ create mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/uefi_fmp.c
+ create mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/uefi_fmp.h
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 81522c7cf0..3602312a3a 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -76,6 +76,8 @@ target_sources(platform_s
+         fw_update_agent/uefi_capsule_parser.c
+         fw_update_agent/fwu_agent.c
+         $<$<BOOL:${TFM_S_REG_TEST}>:${CMAKE_CURRENT_SOURCE_DIR}/target_=
cfg.c>
++        fw_update_agent/uefi_fmp.c
++        $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
+ )
+=20
+ if (PLATFORM_IS_FVP)
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
+index a6a1a33c42..ab0fe17ba8 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -50,7 +50,9 @@ else()
+     set(PLATFORM_PSA_ADAC_SECURE_DEBUG      FALSE        CACHE BOOL    =
  "Whether to use psa-adac secure debug.")
+ endif()
+=20
+-set(DEFAULT_MCUBOOT_SECURITY_COUNTERS   OFF          CACHE BOOL      "W=
hether to use the default security counter configuration defined by TF-M =
project")
++set(DEFAULT_MCUBOOT_SECURITY_COUNTERS       OFF          CACHE BOOL    =
  "Whether to use the default security counter configuration defined by T=
F-M project")
+=20
+-set(PS_ENCRYPTION                       OFF          CACHE BOOL      "E=
nable encryption for Protected Storage partition")
+-set(PS_ROLLBACK_PROTECTION              OFF          CACHE BOOL      "E=
nable rollback protection for Protected Storage partition")
++set(PS_ENCRYPTION                           OFF          CACHE BOOL    =
  "Enable encryption for Protected Storage partition")
++set(PS_ROLLBACK_PROTECTION                  OFF          CACHE BOOL    =
  "Enable rollback protection for Protected Storage partition")
++
++set(PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE     256          CACHE STRING  =
  "Size of output buffer in platform service.")
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 3abb5dd0dc..72a5fc9c1d 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -18,6 +18,7 @@
+ #include "platform_description.h"
+ #include "tfm_plat_nv_counters.h"
+ #include "tfm_plat_defs.h"
++#include "uefi_fmp.h"
+=20
+ /* Properties of image in a bank */
+ struct fwu_image_properties {
+@@ -84,6 +85,11 @@ struct fwu_private_metadata {
+        /* staged nv_counter: temprary location before written to the ot=
p */
+        uint32_t nv_counter[NR_OF_IMAGES_IN_FW_BANK];
+=20
++       /* FMP information */
++       uint32_t fmp_version;
++       uint32_t fmp_last_attempt_version;
++       uint32_t fmp_last_attempt_status;
++
+ } __packed;
+=20
+ #define MAX_BOOT_ATTEMPTS_PER_BANK 3
+@@ -278,7 +284,7 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
+ {
+     enum fwu_agent_error_t ret;
+     struct fwu_private_metadata priv_metadata;
+-    uint32_t image_version =3D 0;
++    uint32_t image_version =3D FWU_IMAGE_INITIAL_VERSION;
+=20
+     FWU_LOG_MSG("%s: enter\n\r", __func__);
+=20
+@@ -302,8 +308,8 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
+     memset(&_metadata, 0, sizeof(struct fwu_metadata));
+=20
+     _metadata.version =3D 1;
+-    _metadata.active_index =3D 0;
+-    _metadata.previous_active_index =3D 1;
++    _metadata.active_index =3D BANK_0;
++    _metadata.previous_active_index =3D BANK_1;
+=20
+     /* bank 0 is the place where images are located at the
+      * start of device lifecycle */
+@@ -339,6 +345,10 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
+     priv_metadata.boot_index =3D BANK_0;
+     priv_metadata.boot_attempted =3D 0;
+=20
++    priv_metadata.fmp_version =3D FWU_IMAGE_INITIAL_VERSION;
++    priv_metadata.fmp_last_attempt_version =3D FWU_IMAGE_INITIAL_VERSIO=
N;
++    priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_SUCCE=
SS;
++
+     ret =3D private_metadata_write(&priv_metadata);
+     if (ret) {
+         return ret;
+@@ -540,9 +550,25 @@ enum fwu_agent_error_t corstone1000_fwu_flash_image=
(void)
+                                 &image_bank_offset);
+         switch(image_index) {
+             case IMAGE_ALL:
++
+                 ret =3D flash_full_capsule(&_metadata, capsule_info.ima=
ge[i],
+                                          capsule_info.size[i],
+                                          capsule_info.version[i]);
++
++                if (ret !=3D FWU_AGENT_SUCCESS) {
++
++                    priv_metadata.fmp_last_attempt_version =3D capsule_=
info.version[i];
++                    priv_metadata.fmp_last_attempt_status =3D LAST_ATTE=
MPT_STATUS_ERROR_UNSUCCESSFUL;
++
++                    private_metadata_write(&priv_metadata);
++
++                    fmp_set_image_info(&full_capsule_image_guid,
++                            priv_metadata.fmp_version,
++                            priv_metadata.fmp_last_attempt_version,
++                            priv_metadata.fmp_last_attempt_status);
++                }
++
++
+                 break;
+             default:
+                 FWU_LOG_MSG("%s: sent image not recognized\n\r", __func=
__);
+@@ -866,17 +892,42 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(v=
oid)
+=20
+     current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
+     if (current_state =3D=3D FWU_AGENT_STATE_REGULAR) {
++
+         ret =3D FWU_AGENT_SUCCESS; /* nothing to be done */
++
++        fmp_set_image_info(&full_capsule_image_guid,
++                priv_metadata.fmp_version,
++                priv_metadata.fmp_last_attempt_version,
++                priv_metadata.fmp_last_attempt_status);
++
+         goto out;
++
+     } else if (current_state !=3D FWU_AGENT_STATE_TRIAL) {
+         FWU_ASSERT(0);
+     }
+=20
+     if (_metadata.active_index !=3D priv_metadata.boot_index) {
++
+         /* firmware update failed, revert back to previous bank */
++
++        priv_metadata.fmp_last_attempt_version =3D
++         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
++
++        priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_E=
RROR_UNSUCCESSFUL;
++
+         ret =3D fwu_select_previous(&_metadata, &priv_metadata);
++
+     } else {
++
+         /* firmware update successful */
++
++        priv_metadata.fmp_version =3D
++         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
++        priv_metadata.fmp_last_attempt_version =3D
++         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
++
++        priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_S=
UCCESS;
++
+         ret =3D fwu_accept_image(&full_capsule_image_guid, &_metadata,
+                                 &priv_metadata);
+         if (!ret) {
+@@ -886,6 +937,10 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(vo=
id)
+=20
+     if (ret =3D=3D FWU_AGENT_SUCCESS) {
+         disable_host_ack_timer();
++        fmp_set_image_info(&full_capsule_image_guid,
++                priv_metadata.fmp_version,
++                priv_metadata.fmp_last_attempt_version,
++                priv_metadata.fmp_last_attempt_status);
+     }
+=20
+ out:
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+index 57b07e8d2c..aa18179024 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+@@ -30,6 +30,9 @@ enum fwu_agent_error_t {
+                 }                                                      =
        \
+=20
+=20
++/* Version used for the very first image of the device. */
++#define FWU_IMAGE_INITIAL_VERSION 0
++
+ enum fwu_agent_error_t fwu_metadata_provision(void);
+ enum fwu_agent_error_t fwu_metadata_init(void);
+=20
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_f=
mp.c b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.c
+new file mode 100644
+index 0000000000..ce576e1794
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.c
+@@ -0,0 +1,240 @@
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <string.h>
++#include <stdbool.h>
++#include "cmsis.h"
++#include "uefi_fmp.h"
++
++/* The count will increase when partial update is supported.
++ * At present, only full WIC is considered as updatable image.
++ */
++#define NUMBER_OF_FMP_IMAGES 1
++#define NO_OF_FMP_VARIABLES_PER_IMAGE   6
++
++#define UEFI_ARCHITECTURE_64
++
++#ifdef UEFI_ARCHITECTURE_64
++typedef uint64_t uefi_ptr_t;
++typedef uint64_t efi_uintn_t;
++#else
++typedef uint32_t uefi_ptr_t;
++typedef uint32_t efi_uintn_t;
++#endif
++
++/* Below macro definations and struct declarations taken from UEFI spec=
 2.9 */
++
++/*
++ * Image Attribute Definitions
++ */
++#define IMAGE_ATTRIBUTE_IMAGE_UPDATABLE            0x00000001
++#define IMAGE_ATTRIBUTE_RESET_REQUIRED             0x00000002
++#define IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED    0x00000004
++#define IMAGE_ATTRIBUTE_IN_USE                     0x00000008
++#define IMAGE_ATTRIBUTE_UEFI_IMAGE                 0x00000010
++#define IMAGE_ATTRIBUTE_DEPENDENCY                 0x00000020
++
++typedef uint32_t DescriptorVersion_t;
++typedef uint32_t DescriptorSize_t;
++typedef uint8_t DescriptorCount_t;
++
++typedef __PACKED_STRUCT {
++    uint8_t ImageIndex;
++    struct efi_guid ImageTypeId;
++    uint64_t ImageId;
++    uefi_ptr_t PtrImageIdName;
++    uint32_t Version;
++    uefi_ptr_t PtrVersionName;
++    efi_uintn_t Size;
++    uint64_t AttributesSupported;
++    uint64_t AttributesSetting;
++    uint64_t Compatibilities;
++    /* Introduced with DescriptorVersion 2+ */
++    uint32_t LowestSupportedImageVersion;
++    /* Introduced with DescriptorVersion 3+ */
++    uint32_t LastAttemptVersion;
++    uint32_t LastAttemptStatus;
++    uint64_t HardwareInstance;
++    /* Introduced with DescriptorVersion 4+ */
++    uefi_ptr_t PtrDependencies;
++} EFI_FIRMWARE_IMAGE_DESCRIPTOR;
++
++typedef __PACKED_STRUCT {
++    DescriptorVersion_t DescriptorVersion;
++    DescriptorSize_t DescriptorsSize;
++    DescriptorCount_t DescriptorCount;
++    EFI_FIRMWARE_IMAGE_DESCRIPTOR ImageDescriptor;
++    uint16_t *ImageName;
++    uint32_t ImageNameSize;
++    uint16_t *ImageVersionName;
++    uint32_t ImageVersionNameSize;
++} EFI_FIRMWARE_MANAGEMENT_PROTOCOL_IMAGE_INFO;
++
++
++static uint16_t corstone_image_name0[] =3D { 'C', 'O', 'R', 'S', 'T', '=
O', 'N', 'E', '1', '0', '0', '0', '_', 'W', 'I', 'C', '\0' };
++static uint16_t corstone_version_name0[] =3D { 'C', 'O', 'R', 'S', 'T',=
 'O', 'N', 'E', '1', '0', '0', '0', '_', 'B', 'E', 'S', 'T', '\0'};
++
++static EFI_FIRMWARE_MANAGEMENT_PROTOCOL_IMAGE_INFO fmp_info[NUMBER_OF_F=
MP_IMAGES];
++
++extern struct efi_guid full_capsule_image_guid;
++
++static bool is_fmp_info_initialized =3D false;
++
++static void init_fmp_info(void)
++{
++    memset(fmp_info, 0,
++     sizeof(EFI_FIRMWARE_MANAGEMENT_PROTOCOL_IMAGE_INFO) * NUMBER_OF_FM=
P_IMAGES);
++
++    /* Fill information for the WIC.
++     * Add further details when partial image is supported.
++     */
++
++    fmp_info[0].DescriptorVersion =3D 4;
++    fmp_info[0].DescriptorCount =3D NUMBER_OF_FMP_IMAGES;
++    fmp_info[0].DescriptorsSize =3D
++                 sizeof(EFI_FIRMWARE_IMAGE_DESCRIPTOR) +
++                 sizeof(corstone_image_name0) + sizeof(corstone_version=
_name0);
++
++    fmp_info[0].ImageDescriptor.ImageIndex =3D 1;
++
++    memcpy(&fmp_info[0].ImageDescriptor.ImageTypeId, &full_capsule_imag=
e_guid,
++            sizeof(struct efi_guid));
++
++    fmp_info[0].ImageDescriptor.ImageId =3D 1;
++    fmp_info[0].ImageDescriptor.Version =3D FWU_IMAGE_INITIAL_VERSION;
++    fmp_info[0].ImageDescriptor.AttributesSupported =3D 1;
++    fmp_info[0].ImageDescriptor.AttributesSetting =3D (
++            IMAGE_ATTRIBUTE_IMAGE_UPDATABLE | IMAGE_ATTRIBUTE_RESET_REQ=
UIRED);
++    fmp_info[0].ImageDescriptor.LowestSupportedImageVersion =3D
++            FWU_IMAGE_INITIAL_VERSION;
++    fmp_info[0].ImageDescriptor.LastAttemptVersion =3D FWU_IMAGE_INITIA=
L_VERSION;
++    fmp_info[0].ImageDescriptor.LastAttemptStatus =3D LAST_ATTEMPT_STAT=
US_SUCCESS;
++
++    fmp_info[0].ImageName =3D corstone_image_name0;
++    fmp_info[0].ImageNameSize =3D sizeof(corstone_image_name0);
++    fmp_info[0].ImageVersionName =3D corstone_version_name0;
++    fmp_info[0].ImageVersionNameSize =3D sizeof(corstone_version_name0)=
;
++
++    is_fmp_info_initialized =3D true;
++
++    return;
++}
++
++enum fwu_agent_error_t fmp_set_image_info(struct efi_guid *guid,
++                     uint32_t current_version, uint32_t attempt_version=
,
++                     uint32_t last_attempt_status)
++{
++    enum fwu_agent_error_t status =3D FWU_AGENT_ERROR;
++
++    FWU_LOG_MSG("%s:%d Enter\n\r", __func__, __LINE__);
++
++    if (is_fmp_info_initialized =3D=3D false) {
++        init_fmp_info();
++    }
++
++    for (int i =3D 0; i < NUMBER_OF_FMP_IMAGES; i++) {
++        if ((memcmp(guid, &fmp_info[i].ImageDescriptor.ImageTypeId,
++                        sizeof(struct efi_guid))) =3D=3D 0)
++        {
++            FWU_LOG_MSG("FMP image update: image id =3D %u\n\r",
++                                    fmp_info[i].ImageDescriptor.ImageId=
);
++            fmp_info[i].ImageDescriptor.Version =3D current_version;
++            fmp_info[i].ImageDescriptor.LastAttemptVersion =3D attempt_=
version;
++            fmp_info[i].ImageDescriptor.LastAttemptStatus =3D last_atte=
mpt_status;
++            FWU_LOG_MSG("FMP image update: status =3D %u"
++                            "version=3D%u last_attempt_version=3D%u.\n\=
r",
++                            last_attempt_status, current_version,
++                            attempt_version);
++            status =3D FWU_AGENT_SUCCESS;
++            break;
++        }
++    }
++
++    FWU_LOG_MSG("%s:%d Exit.\n\r", __func__, __LINE__);
++    return status;
++}
++
++
++#define NO_OF_FMP_VARIABLES    (NUMBER_OF_FMP_IMAGES * NO_OF_FMP_VARIAB=
LES_PER_IMAGE)
++
++static enum fwu_agent_error_t pack_image_info(void *buffer, uint32_t si=
ze)
++{
++    typedef __PACKED_STRUCT {
++        uint32_t variable_count;
++        uint32_t variable_size[NO_OF_FMP_VARIABLES];
++        uint8_t variable[];
++    } packed_buffer_t;
++
++    packed_buffer_t *packed_buffer =3D buffer;
++    int runner =3D 0;
++    int index =3D 0;
++    int current_size =3D sizeof(packed_buffer_t);
++    int size_requirement_1 =3D 0;
++    int size_requirement_2 =3D 0;
++
++    if (size < current_size) {
++        FWU_LOG_MSG("%s:%d Buffer too small.\n\r", __func__, __LINE__);
++        return FWU_AGENT_ERROR;
++    }
++
++    packed_buffer->variable_count =3D NO_OF_FMP_VARIABLES;
++
++    for (int i =3D 0; i < NUMBER_OF_FMP_IMAGES; i++) {
++
++       packed_buffer->variable_size[index++] =3D sizeof(DescriptorVersi=
on_t);
++       packed_buffer->variable_size[index++] =3D sizeof(DescriptorSize_=
t);
++       packed_buffer->variable_size[index++] =3D sizeof(DescriptorCount=
_t);
++       packed_buffer->variable_size[index++] =3D sizeof(EFI_FIRMWARE_IM=
AGE_DESCRIPTOR);
++       packed_buffer->variable_size[index++] =3D fmp_info[i].ImageNameS=
ize;
++       packed_buffer->variable_size[index++] =3D fmp_info[i].ImageVersi=
onNameSize;
++
++       size_requirement_1 =3D sizeof(DescriptorVersion_t) + sizeof(Desc=
riptorSize_t) +
++              sizeof(DescriptorCount_t) + sizeof(EFI_FIRMWARE_IMAGE_DES=
CRIPTOR);
++
++       size_requirement_2 =3D fmp_info[i].ImageNameSize + fmp_info[i].I=
mageVersionNameSize;
++
++       current_size +=3D size_requirement_1 + size_requirement_2;
++
++       if (size < current_size) {
++           FWU_LOG_MSG("%s:%d Buffer too small.\n\r", __func__, __LINE_=
_);
++           return FWU_AGENT_ERROR;
++       }
++
++       FWU_LOG_MSG("%s:%d ImageInfo size =3D %u, ImageName size =3D %u,=
 "
++               "ImageVersionName size =3D %u\n\r", __func__, __LINE__,
++               sizeof(EFI_FIRMWARE_IMAGE_DESCRIPTOR), fmp_info[i].Image=
NameSize,
++               fmp_info[i].ImageVersionNameSize);
++  =20
++       memcpy(&packed_buffer->variable[runner], &fmp_info[i], size_requ=
irement_1);
++       runner +=3D size_requirement_1;
++  =20
++       memcpy(&packed_buffer->variable[runner], fmp_info[i].ImageName,
++                                       fmp_info[i].ImageNameSize);
++       runner +=3D fmp_info[i].ImageNameSize;
++  =20
++       memcpy(&packed_buffer->variable[runner], fmp_info[i].ImageVersio=
nName,
++                                       fmp_info[i].ImageVersionNameSize=
);
++       runner +=3D fmp_info[i].ImageVersionNameSize;
++
++    }
++
++    return FWU_AGENT_SUCCESS;
++}
++
++enum fwu_agent_error_t fmp_get_image_info(void *buffer, uint32_t size)
++{
++    enum fwu_agent_error_t status;
++
++    FWU_LOG_MSG("%s:%d Enter\n\r", __func__, __LINE__);
++
++    status =3D pack_image_info(buffer, size);
++
++    FWU_LOG_MSG("%s:%d Exit\n\r", __func__, __LINE__);
++
++    return status;
++}
++
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_f=
mp.h b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.h
+new file mode 100644
+index 0000000000..d876bd7cff
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.h
+@@ -0,0 +1,56 @@
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef UEFI_FMP_H
++#define UEFI_FMP_H
++
++
++#include <stdint.h>
++#include "fwu_agent.h"
++#include "../fip_parser/external/uuid.h"
++
++/*
++ * Last Attempt Status Value
++ */
++
++#define LAST_ATTEMPT_STATUS_SUCCESS                                    =
 0x00000000
++#define LAST_ATTEMPT_STATUS_ERROR_UNSUCCESSFUL                         =
 0x00000001
++#define LAST_ATTEMPT_STATUS_ERROR_INSUFFICIENT_RESOURCES               =
 0x00000002
++#define LAST_ATTEMPT_STATUS_ERROR_INCORRECT_VERSION                    =
 0x00000003
++#define LAST_ATTEMPT_STATUS_ERROR_INVALID_FORMAT                       =
 0x00000004
++#define LAST_ATTEMPT_STATUS_ERROR_AUTH_ERROR                           =
 0x00000005
++#define LAST_ATTEMPT_STATUS_ERROR_PWR_EVT_AC                           =
 0x00000006
++#define LAST_ATTEMPT_STATUS_ERROR_PWR_EVT_BATT                         =
 0x00000007
++#define LAST_ATTEMPT_STATUS_ERROR_UNSATISFIED_DEPENDENCIES             =
 0x00000008
++/* The LastAttemptStatus values of 0x1000 - 0x4000 are reserved for ven=
dor usage. */
++#define LAST_ATTEMPT_STATUS_ERROR_UNSUCCESSFUL_VENDOR_RANGE_MIN        =
 0x00001000
++#define LAST_ATTEMPT_STATUS_ERROR_UNSUCCESSFUL_VENDOR_RANGE_MAX        =
 0x00004000
++
++
++
++/*
++ * Updates FMP information for the image matched by guid.
++ *
++ * guid : guid of the image
++ * current_version: current versions for the image
++ * attempt_version: attempted versions for the image
++ *
++ */
++enum fwu_agent_error_t fmp_set_image_info(struct efi_guid *guid,
++                     uint32_t current_version, uint32_t attempt_version=
,
++                     uint32_t last_attempt_status);
++
++/*
++ * Return fmp image information for all the updable images.
++ *
++ * buffer : pointer to the out buffer
++ * size : size of the buffer
++ *
++ */
++enum fwu_agent_error_t fmp_get_image_info(void *buffer, uint32_t size);
++
++#endif /* UEFI_FMP_H */
+diff --git a/platform/ext/target/arm/corstone1000/services/include/corst=
one1000_ioctl_requests.h b/platform/ext/target/arm/corstone1000/services/=
include/corstone1000_ioctl_requests.h
+index 8ac67346b6..c5f3537e9d 100644
+--- a/platform/ext/target/arm/corstone1000/services/include/corstone1000=
_ioctl_requests.h
++++ b/platform/ext/target/arm/corstone1000/services/include/corstone1000=
_ioctl_requests.h
+@@ -14,19 +14,7 @@
+ enum corstone1000_ioctl_id_t {
+    IOCTL_CORSTONE1000_FWU_FLASH_IMAGES =3D 0,
+    IOCTL_CORSTONE1000_FWU_HOST_ACK,
++   IOCTL_CORSTONE1000_FMP_GET_IMAGE_INFO,
+ };
+=20
+-
+-typedef struct corstone1000_ioctl_in_params {
+-
+-    uint32_t ioctl_id;
+-
+-} corstone1000_ioctl_in_params_t;
+-
+-typedef struct corstone1000_ioctl_out_params {
+-
+-    int32_t result;
+-
+-} corstone1000_ioctl_out_params_t;
+-
+ #endif /* CORSTONE1000_IOCTL_REQUESTS_H */
+diff --git a/platform/ext/target/arm/corstone1000/services/src/tfm_platf=
orm_system.c b/platform/ext/target/arm/corstone1000/services/src/tfm_plat=
form_system.c
+index 5b3f3e14a2..41305ed966 100644
+--- a/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
++++ b/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
+@@ -9,6 +9,7 @@
+ #include "platform_description.h"
+ #include "corstone1000_ioctl_requests.h"
+ #include "fwu_agent.h"
++#include "uefi_fmp.h"
+=20
+ void tfm_platform_hal_system_reset(void)
+ {
+@@ -36,6 +37,14 @@ enum tfm_platform_err_t tfm_platform_hal_ioctl(tfm_pl=
atform_ioctl_req_t request,
+             corstone1000_fwu_host_ack();
+             break;
+=20
++        case IOCTL_CORSTONE1000_FMP_GET_IMAGE_INFO:
++            if (out_vec =3D=3D NULL) {
++                ret =3D TFM_PLATFORM_ERR_INVALID_PARAM;
++                break;
++            }
++            fmp_get_image_info(out_vec[0].base, out_vec[0].len);
++            break;
++
+         default:
+             ret =3D TFM_PLATFORM_ERR_NOT_SUPPORTED;
+             break;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/000=
6-corstone1000-remove-two-partition-configuration.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-m/corstone1000/0006-corstone1000-remove-two-pa=
rtition-configuration.patch
new file mode 100644
index 00000000..ade2c8c8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0006-corst=
one1000-remove-two-partition-configuration.patch
@@ -0,0 +1,51 @@
+From 492c887c8dff97ea1b8a11b4e729620d3744ac38 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 30 May 2022 12:38:23 +0100
+Subject: [PATCH 6/6] corstone1000: remove two partition configuration
+
+Previously to run tf-m test, a larger partition was created
+which allowed all default test binaries to be included.
+The patch revert the change because any partition might
+not be enough to hold all test binaries in the future.
+So its better to run few test at a time instead of creating
+a larger partition.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Change-Id: I223fe45f2de014dbcadc6ac12c321c524701116a
+Upstream-Status: Accepted [TF-Mv1.7.0]
+---
+ platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt       | 1 -
+ platform/ext/target/arm/corstone1000/partition/flash_layout.h | 4 ----
+ 2 files changed, 5 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt b/p=
latform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+index d39c5ae91d..f1ae1ebd47 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+@@ -291,7 +291,6 @@ target_compile_definitions(signing_layout_for_bl2
+     PRIVATE
+         MCUBOOT_IMAGE_NUMBER=3D${BL1_IMAGE_NUMBER}
+         BL1
+-        $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
+ )
+=20
+ target_include_directories(signing_layout_for_bl2
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index b0319bb319..50a0a11fc8 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -119,11 +119,7 @@
+  *
+  */
+ #define SE_BL2_PARTITION_SIZE           (0x19000)    /* 100 KB */
+-#ifdef TFM_S_REG_TEST
+-#define TFM_PARTITION_SIZE              (0x61C00)    /* 391 KB */
+-#else
+ #define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
+-#endif
+ #define FIP_PARTITION_SIZE              (0x200000)   /* 2 MB */
+ #define KERNEL_PARTITION_SIZE           (0xC00000)   /* 12 MB */
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index b8f4870b..341a5942 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -25,6 +25,17 @@ SRC_URI +=3D "git://github.com/OpenAMP/open-amp.git;pr=
otocol=3Dhttps;branch=3Dmain;nam
 SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde042966d"
 EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${S}/../openamp -DLIBOPENAMP=
_BIN_PATH=3D${B}/libopenamp-build"
=20
+# Apply the necessary changes for supporting FMP image info
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/corstone1000:"
+SRC_URI:append:corstone1000 =3D " \
+        file://0001-corstone1000-platform-secure-test-framework.patch   =
          \
+        file://0002-corstone1000-make-external-system-support-optional.p=
atch      \
+        file://0003-corstone1000-enable-secure-enclave-run-without-host-=
.patch    \
+        file://0004-Platform-Partition-Allow-configuration-of-input-and-=
.patch    \
+        file://0005-corstone1000-support-for-UEFI-FMP-image-Information.=
patch     \
+        file://0006-corstone1000-remove-two-partition-configuration.patc=
h         \
+      "
+
 do_install() {
   install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmw=
are/tfm_s_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/bl2_signed.bin ${D}/firmwar=
e/bl2_signed.bin
--=20
2.25.1


