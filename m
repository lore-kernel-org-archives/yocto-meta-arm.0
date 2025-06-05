Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF76C61CE8
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:31:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7596.1749130283832849838
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 06:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF5981691;
	Thu,  5 Jun 2025 06:31:05 -0700 (PDT)
Received: from MGC575JXM4.emea.arm.com (unknown [10.34.124.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C17D13F5A1;
	Thu,  5 Jun 2025 06:31:22 -0700 (PDT)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20Faure?= <clement.faure@arm.com>
Subject: [PATCH 1/3] arm/tf-a-tests: fix header guard compilation warning
Date: Thu,  5 Jun 2025 15:31:06 +0200
Message-Id: <20250605133108.35177-2-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250605133108.35177-1-clement.faure@arm.com>
References: <20250605133108.35177-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Jun 2025 13:31:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6530

From: Cl=C3=A9ment Faure <clement.faure@arm.com>

Backport patch to fix the following compilation issue:

| In file included from tftf/tests/runtime_services/realm_payload/host_re=
alm_payload_simd_tests.c:21:
| tftf/tests/runtime_services/realm_payload/host_realm_simd_common.h:6: e=
rror: header guard 'HOST_REALM_COMMON_H' followed by '#define' of a diffe=
rent macro [-Werror=3Dheader-guard]
|     6 | #ifndef HOST_REALM_COMMON_H
| tftf/tests/runtime_services/realm_payload/host_realm_simd_common.h:7: n=
ote: 'HOST_REALM_COMMON_h' is defined here; did you mean 'HOST_REALM_COMM=
ON_H'?
|     7 | #define HOST_REALM_COMMON_h
| In file included from tftf/tests/runtime_services/realm_payload/host_re=
alm_simd_common.c:13:
| tftf/tests/runtime_services/realm_payload/host_realm_simd_common.h:6: e=
rror: header guard 'HOST_REALM_COMMON_H' followed by '#define' of a diffe=
rent macro [-Werror=3Dheader-guard]
|     6 | #ifndef HOST_REALM_COMMON_H
| tftf/tests/runtime_services/realm_payload/host_realm_simd_common.h:7: n=
ote: 'HOST_REALM_COMMON_h' is defined here; did you mean 'HOST_REALM_COMM=
ON_H'?
|     7 | #define HOST_REALM_COMMON_h
|   CC      tftf/tests/runtime_services/secure_service/spm_test_helpers.c
| In file included from tftf/tests/runtime_services/realm_payload/host_re=
alm_spm.c:20:
| tftf/tests/runtime_services/realm_payload/host_realm_simd_common.h:6: e=
rror: header guard 'HOST_REALM_COMMON_H' followed by '#define' of a diffe=
rent macro [-Werror=3Dheader-guard]
|     6 | #ifndef HOST_REALM_COMMON_H
| tftf/tests/runtime_services/realm_payload/host_realm_simd_common.h:7: n=
ote: 'HOST_REALM_COMMON_h' is defined here; did you mean 'HOST_REALM_COMM=
ON_H'?
|     7 | #define HOST_REALM_COMMON_h
| cc1: all warnings being treated as errors
| make: *** [Makefile:605: workspace/corstone1000/build/tmp/work/cortexa3=
5-poky-linux-musl/tf-a-tests/2.12.0/build/corstone1000/release/tftf/host_=
realm_simd_common.o] Error 1
| make: *** Waiting for unfinished jobs....
| cc1: all warnings being treated as errors
| make: *** [Makefile:605: workspace/corstone1000/build/tmp/work/cortexa3=
5-poky-linux-musl/tf-a-tests/2.12.0/build/corstone1000/release/tftf/host_=
realm_spm.o] Error 1
| cc1: all warnings being treated as errors
| make: *** [Makefile:605: workspace/corstone1000/build/tmp/work/cortexa3=
5-poky-linux-musl/tf-a-tests/2.12.0/build/corstone1000/release/tftf/host_=
realm_payload_simd_tests.o] Error 1
| make: Leaving directory 'workspace/corstone1000/build/tmp/work/cortexa3=
5-poky-linux-musl/tf-a-tests/2.12.0/git'

Signed-off-by: Cl=C3=A9ment Faure <clement.faure@arm.com>
---
 ...-make-PCIe-tests-default-for-testing.patch | 531 ++++++++++++++++++
 .../trusted-firmware-a/tf-a-tests_2.12.0.bb   |   1 +
 2 files changed, 532 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fi=
x-realm-make-PCIe-tests-default-for-testing.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fix-realm=
-make-PCIe-tests-default-for-testing.patch b/meta-arm/recipes-bsp/trusted=
-firmware-a/files/0001-fix-realm-make-PCIe-tests-default-for-testing.patc=
h
new file mode 100644
index 00000000..f8f998a6
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/0001-fix-realm-make-P=
CIe-tests-default-for-testing.patch
@@ -0,0 +1,531 @@
+From f5c206b8d9019d8112e55ac8da1936c79c7d2ce7 Mon Sep 17 00:00:00 2001
+From: Soby Mathew <soby.mathew@arm.com>
+Date: Fri, 15 Nov 2024 17:11:24 +0000
+Subject: [PATCH] fix(realm): make PCIe tests default for testing
+
+This patch moves the PCIe DOE test to the default realm world
+testsuite.
+
+Also fixes some build issues and hardens the PCIe functions.
+
+Note that FVP_Base_RevC model needs to have the following
+options enabled for the PCIe tests to work :
+
+    -C pci.pcie_rc.ahci0.endpoint.doe_supported=3D1
+    -C pci.pcie_rc.ahci0.endpoint.ide_supported=3D1
+
+Change-Id: Icfd6b68799b0bacb44299c6a3cf99a3c425f833d
+Signed-off-by: Soby Mathew <soby.mathew@arm.com>
+Upstream-Status: Backport [2c2810f79e57e78d77899084b5439cbdd1aaa464]
+---
+ docs/porting/optional-mods.rst                | 12 ++++++
+ include/lib/pcie/pcie.h                       |  9 ++--
+ include/plat/common/platform.h                | 10 ++++-
+ lib/pcie/pcie.c                               | 41 ++++++++++++++-----
+ plat/arm/fvp/fvp_pcie.c                       |  4 +-
+ plat/arm/fvp/include/platform_pcie.h          |  2 -
+ plat/arm/fvp/plat_setup.c                     |  2 -
+ plat/arm/fvp/platform.mk                      |  9 ++--
+ plat/common/plat_common.c                     |  8 +++-
+ tftf/tests/doe_tests/doe_helpers.c            | 11 +++--
+ tftf/tests/doe_tests/doe_helpers.h            |  2 +
+ tftf/tests/doe_tests/test_doe.c               |  9 +++-
+ .../realm_payload/host_realm_simd_common.h    |  2 +-
+ tftf/tests/tests-pcie-doe.mk                  | 22 ----------
+ tftf/tests/tests-pcie-doe.xml                 | 14 -------
+ tftf/tests/tests-realm-payload.mk             | 14 ++++++-
+ tftf/tests/tests-realm-payload.xml            |  7 +++-
+ 17 files changed, 105 insertions(+), 73 deletions(-)
+ delete mode 100644 tftf/tests/tests-pcie-doe.mk
+ delete mode 100644 tftf/tests/tests-pcie-doe.xml
+
+diff --git a/docs/porting/optional-mods.rst b/docs/porting/optional-mods=
.rst
+index a88d682..7fc3813 100644
+--- a/docs/porting/optional-mods.rst
++++ b/docs/porting/optional-mods.rst
+@@ -50,6 +50,18 @@ The default implementation uses the ARM watchdog peri=
pheral (`SP805`_) to
+ generate a watchdog timeout interrupt. This interrupt remains deliberat=
ely
+ unserviced, which eventually asserts the reset signal.
+=20
++Function : plat_pcie_get_info_table()
++----------------------------
++
++::
++
++    Argument : void
++    Return   : struct pcie_info_table *
++
++This function returns the pointer to `pcie_info_table` structure
++correponding to the platform. This needs to be implemented
++only if the platform want to run PCIe related tests.
++
+ --------------
+=20
+ *Copyright (c) 2019, Arm Limited. All rights reserved.*
+diff --git a/include/lib/pcie/pcie.h b/include/lib/pcie/pcie.h
+index aa3911f..3ce6986 100644
+--- a/include/lib/pcie/pcie.h
++++ b/include/lib/pcie/pcie.h
+@@ -11,6 +11,9 @@
+ #include <stdint.h>
+ #include <utils_def.h>
+=20
++/* platforms need to ensure that number of entries is less that this va=
lue */
++#define MAX_PCIE_INFO_ENTRIES 5
++
+ typedef struct {
+ 	unsigned long ecam_base;	/* ECAM base address */
+ 	unsigned int segment_num;	/* Segment number of this ECAM */
+@@ -18,10 +21,10 @@ typedef struct {
+ 	unsigned int end_bus_num;	/* Last bus number */
+ } pcie_info_block_t;
+=20
+-typedef struct {
++struct pcie_info_table{
+ 	unsigned int num_entries;	/* Number of entries */
+-	pcie_info_block_t block[];
+-} pcie_info_table_t;
++	pcie_info_block_t block[MAX_PCIE_INFO_ENTRIES];
++};
+=20
+ typedef struct {
+ 	uint32_t bdf;
+diff --git a/include/plat/common/platform.h b/include/plat/common/platfo=
rm.h
+index c8b785c..1a51823 100644
+--- a/include/plat/common/platform.h
++++ b/include/plat/common/platform.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2018-2019, Arm Limited. All rights reserved.
++ * Copyright (c) 2018-2024, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -193,4 +193,12 @@ static inline uint32_t get_current_core_id(void)
+ 	return platform_get_core_pos(read_mpidr_el1() & MPID_MASK);
+ }
+=20
++/* Forward declaration */
++struct pcie_info_table;
++
++/*
++ * Retrieve platform PCIe information.
++ */
++const struct pcie_info_table *plat_pcie_get_info_table(void);
++
+ #endif /* __PLATFORM_H__ */
+diff --git a/lib/pcie/pcie.c b/lib/pcie/pcie.c
+index c3906d5..5f8c97f 100644
+--- a/lib/pcie/pcie.c
++++ b/lib/pcie/pcie.c
+@@ -11,13 +11,12 @@
+ #include <mmio.h>
+ #include <pcie.h>
+ #include <pcie_spec.h>
++#include <platform.h>
+ #include <tftf_lib.h>
+=20
+-#include <platform_pcie.h>
+-
+ #define PCIE_DEBUG	VERBOSE
+=20
+-const pcie_info_table_t *g_pcie_info_table;
++const struct pcie_info_table *g_pcie_info_table;
+ pcie_device_bdf_table_t *g_pcie_bdf_table;
+=20
+ pcie_device_bdf_table_t pcie_bdf_table[PCIE_DEVICE_BDF_TABLE_SZ];
+@@ -256,6 +255,8 @@ uint32_t pcie_get_rootport(uint32_t bdf, uint32_t *r=
p_bdf)
+ 		return 1;
+ 	}
+=20
++	assert(g_pcie_bdf_table !=3D NULL);
++
+ 	while (index < g_pcie_bdf_table->num_entries) {
+ 		*rp_bdf =3D g_pcie_bdf_table->device[index++].bdf;
+=20
+@@ -294,6 +295,8 @@ static uint32_t pcie_populate_device_rootport(void)
+ 	uint32_t bdf, rp_bdf;
+ 	pcie_device_bdf_table_t *bdf_tbl_ptr =3D g_pcie_bdf_table;
+=20
++	assert(bdf_tbl_ptr !=3D NULL);
++
+ 	for (unsigned int tbl_index =3D 0; tbl_index < bdf_tbl_ptr->num_entrie=
s;
+ 								tbl_index++) {
+ 		bdf =3D bdf_tbl_ptr->device[tbl_index].bdf;
+@@ -317,6 +320,8 @@ static uint32_t pcie_populate_device_rootport(void)
+  */
+ pcie_device_bdf_table_t *pcie_get_bdf_table(void)
+ {
++	assert(g_pcie_bdf_table !=3D NULL);
++
+ 	return g_pcie_bdf_table;
+ }
+=20
+@@ -336,6 +341,8 @@ void pcie_create_device_bdf_table(void)
+ 	assert(g_pcie_bdf_table !=3D NULL);
+=20
+ 	g_pcie_bdf_table->num_entries =3D 0;
++
++	assert(g_pcie_info_table !=3D NULL);
+ 	assert(g_pcie_info_table->num_entries !=3D 0);
+=20
+ 	for (ecam_index =3D 0; ecam_index < g_pcie_info_table->num_entries; ec=
am_index++) {
+@@ -420,6 +427,8 @@ uintptr_t pcie_get_ecam_base(uint32_t bdf)
+ 	uint32_t reg_value;
+ 	uintptr_t ecam_base =3D 0;
+=20
++	assert(g_pcie_info_table !=3D NULL);
++
+ 	while (ecam_index < g_pcie_info_table->num_entries) {
+ 		/* Derive ECAM specific information */
+ 		const pcie_info_block_t *block =3D &g_pcie_info_table->block[ecam_ind=
ex];
+@@ -462,13 +471,15 @@ void pcie_print_device_info(void)
+ 	uint32_t ecam_index =3D 0;
+ 	uint32_t ecam_base, ecam_start_bus, ecam_end_bus;
+ 	pcie_device_bdf_table_t *bdf_tbl_ptr =3D g_pcie_bdf_table;
+-	uint32_t num_rciep =3D 0, num_rcec =3D 0;
+-	uint32_t num_iep =3D 0, num_irp =3D 0;
+-	uint32_t num_ep =3D 0, num_rp =3D 0;
+-	uint32_t num_dp =3D 0, num_up =3D 0;
+-	uint32_t num_pcie_pci =3D 0, num_pci_pcie =3D 0;
++	uint32_t num_rciep __unused =3D 0, num_rcec __unused =3D 0;
++	uint32_t num_iep __unused =3D 0, num_irp __unused =3D 0;
++	uint32_t num_ep __unused =3D 0, num_rp __unused =3D 0;
++	uint32_t num_dp __unused =3D 0, num_up __unused =3D 0;
++	uint32_t num_pcie_pci __unused =3D 0, num_pci_pcie __unused =3D 0;
+ 	uint32_t bdf_counter;
+=20
++	assert(bdf_tbl_ptr !=3D NULL);
++
+ 	if (bdf_tbl_ptr->num_entries =3D=3D 0) {
+ 		INFO("BDF Table: No RCiEP or iEP found\n");
+ 		return;
+@@ -525,6 +536,8 @@ void pcie_print_device_info(void)
+ 	INFO("Number of PCI/PCIe Bridge: %u\n", num_pci_pcie);
+ 	INFO("Number of PCIe/PCI Bridge: %u\n", num_pcie_pci);
+=20
++	assert(g_pcie_info_table !=3D NULL);
++
+ 	while (ecam_index < g_pcie_info_table->num_entries) {
+=20
+ 		/* Derive ECAM specific information */
+@@ -540,7 +553,7 @@ void pcie_print_device_info(void)
+=20
+ 		while (tbl_index < bdf_tbl_ptr->num_entries) {
+ 			uint32_t seg_num, bus_num, dev_num, func_num;
+-			uint32_t device_id, vendor_id, reg_value;
++			uint32_t device_id __unused, vendor_id __unused, reg_value;
+ 			uint32_t bdf, dev_ecam_base;
+=20
+ 			bdf =3D bdf_tbl_ptr->device[tbl_index++].bdf;
+@@ -588,12 +601,18 @@ void pcie_create_info_table(void)
+ 	INFO("Creating PCIe info table\n");
+=20
+ 	g_pcie_info_table =3D plat_pcie_get_info_table();
++	if (g_pcie_info_table =3D=3D NULL) {
++		ERROR("PCIe info not returned by platform\n");
++		panic();
++	}
++
+ 	g_pcie_bdf_table =3D pcie_bdf_table;
+=20
+ 	num_ecam =3D g_pcie_info_table->num_entries;
+ 	INFO("Number of ECAM regions   : %u\n", num_ecam);
+-	if (num_ecam =3D=3D 0) {
+-		return;
++	if ((num_ecam =3D=3D 0) || (num_ecam > MAX_PCIE_INFO_ENTRIES)) {
++		ERROR("PCIe info entries invalid\n");
++		panic();
+ 	}
+ 	pcie_create_device_bdf_table();
+ 	pcie_print_device_info();
+diff --git a/plat/arm/fvp/fvp_pcie.c b/plat/arm/fvp/fvp_pcie.c
+index 0569832..c43e42d 100644
+--- a/plat/arm/fvp/fvp_pcie.c
++++ b/plat/arm/fvp/fvp_pcie.c
+@@ -11,7 +11,7 @@
+=20
+ CASSERT(PLATFORM_NUM_ECAM !=3D 0, PLATFORM_NUM_ECAM_is_zero);
+=20
+-const pcie_info_table_t fvp_pcie_cfg =3D {
++const struct pcie_info_table fvp_pcie_cfg =3D {
+ 	.num_entries =3D PLATFORM_NUM_ECAM,
+ 	.block[0] =3D {
+ 		PLATFORM_PCIE_ECAM_BASE_ADDR_0,
+@@ -21,7 +21,7 @@ const pcie_info_table_t fvp_pcie_cfg =3D {
+ 	}
+ };
+=20
+-const pcie_info_table_t *plat_pcie_get_info_table(void)
++const struct pcie_info_table *plat_pcie_get_info_table(void)
+ {
+ 	return &fvp_pcie_cfg;
+ }
+diff --git a/plat/arm/fvp/include/platform_pcie.h b/plat/arm/fvp/include=
/platform_pcie.h
+index c76c7d9..4b3a0e9 100644
+--- a/plat/arm/fvp/include/platform_pcie.h
++++ b/plat/arm/fvp/include/platform_pcie.h
+@@ -19,6 +19,4 @@
+ #define PLATFORM_PCIE_START_BUS_NUM_0	0x0
+ #define PLATFORM_PCIE_END_BUS_NUM_0	0xFF
+=20
+-const pcie_info_table_t *plat_pcie_get_info_table(void);
+-
+ #endif	/* PLATFORM_PCIE_H */
+diff --git a/plat/arm/fvp/plat_setup.c b/plat/arm/fvp/plat_setup.c
+index e6e4244..69cb0a1 100644
+--- a/plat/arm/fvp/plat_setup.c
++++ b/plat/arm/fvp/plat_setup.c
+@@ -35,9 +35,7 @@ static const mmap_region_t mmap[] =3D {
+ #if USE_NVM
+ 	MAP_REGION_FLAT(FLASH_BASE, FLASH_SIZE, MT_DEVICE | MT_RW | MT_NS),
+ #endif
+-#if USE_PCIE
+ 	MAP_REGION_FLAT(PCIE_CONFIG_BASE, PCIE_CONFIG_SIZE, MT_DEVICE | MT_RW =
| MT_NS),
+-#endif
+ 	MAP_REGION_FLAT(DRAM_BASE, TFTF_BASE - DRAM_BASE, MT_MEMORY | MT_RW | =
MT_NS),
+ 	{0}
+ };
+diff --git a/plat/arm/fvp/platform.mk b/plat/arm/fvp/platform.mk
+index 7a2850f..ee30721 100644
+--- a/plat/arm/fvp/platform.mk
++++ b/plat/arm/fvp/platform.mk
+@@ -90,12 +90,8 @@ $(eval $(call add_define,NS_BL2U_DEFINES,PA_SIZE))
+ $(eval $(call add_define,TFTF_DEFINES,PA_SIZE))
+ $(eval $(call add_define,REALM_DEFINES,PA_SIZE))
+=20
+-ifeq ($(TESTS),pcie-doe)
+-USE_PCIE=3D1
+-$(eval $(call add_define,TFTF_DEFINES,USE_PCIE))
+-endif
+-
+-PLAT_INCLUDES	+=3D	-Iplat/arm/fvp/include/
++PLAT_INCLUDES	+=3D	-Iplat/arm/fvp/include/				\
++			-Iinclude/lib/pcie/
+=20
+ PLAT_SOURCES	:=3D	drivers/arm/gic/arm_gic_v2v3.c			\
+ 			drivers/arm/gic/gic_v2.c			\
+@@ -104,6 +100,7 @@ PLAT_SOURCES	:=3D	drivers/arm/gic/arm_gic_v2v3.c			\
+ 			drivers/arm/timer/private_timer.c		\
+ 			drivers/arm/timer/system_timer.c		\
+ 			plat/arm/fvp/${ARCH}/plat_helpers.S		\
++			plat/arm/fvp/fvp_pcie.c				\
+ 			plat/arm/fvp/fvp_pwr_state.c			\
+ 			plat/arm/fvp/fvp_topology.c			\
+ 			plat/arm/fvp/fvp_mem_prot.c			\
+diff --git a/plat/common/plat_common.c b/plat/common/plat_common.c
+index c43ae12..a4195c3 100644
+--- a/plat/common/plat_common.c
++++ b/plat/common/plat_common.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2018-2020, Arm Limited. All rights reserved.
++ * Copyright (c) 2018-2024, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -24,6 +24,7 @@
+ #pragma weak tftf_plat_enable_mmu
+ #pragma weak tftf_plat_reset
+ #pragma weak plat_get_prot_regions
++#pragma weak plat_pcie_get_info_table
+=20
+ #if IMAGE_TFTF
+=20
+@@ -148,3 +149,8 @@ const mem_region_t *plat_get_prot_regions(int *nelem=
)
+ 	*nelem =3D 0;
+ 	return NULL;
+ }
++
++const struct pcie_info_table *plat_pcie_get_info_table(void)
++{
++	return NULL;
++}
+diff --git a/tftf/tests/doe_tests/doe_helpers.c b/tftf/tests/doe_tests/d=
oe_helpers.c
+index 28b6a86..911fbd0 100644
+--- a/tftf/tests/doe_tests/doe_helpers.c
++++ b/tftf/tests/doe_tests/doe_helpers.c
+@@ -13,12 +13,15 @@
+ #include <pcie_doe.h>
+ #include <spdm.h>
+=20
+-#include <platform_pcie.h>
+-
+ void pcie_init(void)
+ {
++	static bool is_init;
++
+ 	/* Create PCIe table and enumeration */
+-	pcie_create_info_table();
++	if (!is_init) {
++		pcie_create_info_table();
++		is_init =3D true;
++	}
+ }
+=20
+ /*
+@@ -113,7 +116,7 @@ int get_spdm_version(uint32_t bdf, uint32_t doe_cap_=
base)
+ 			sizeof(ver_resp->version_number_entry_count));
+=20
+ 	while (entry_count-- !=3D 0) {
+-		spdm_version_number_t ver =3D *ver_ptr++;
++		spdm_version_number_t ver __unused =3D *ver_ptr++;
+=20
+ 		INFO("SPDM v%llu.%llu.%llu.%llu\n",
+ 			EXTRACT(SPDM_VER_MAJOR, ver),
+diff --git a/tftf/tests/doe_tests/doe_helpers.h b/tftf/tests/doe_tests/d=
oe_helpers.h
+index 08137e3..d0fc5c8 100644
+--- a/tftf/tests/doe_tests/doe_helpers.h
++++ b/tftf/tests/doe_tests/doe_helpers.h
+@@ -8,6 +8,8 @@
+ #ifndef DOE_HELPERS_H
+ #define DOE_HELPERS_H
+=20
++#include <stdint.h>
++
+ void pcie_init(void);
+ int find_doe_device(uint32_t *bdf_ptr, uint32_t *cap_base_ptr);
+ int doe_discovery(uint32_t bdf, uint32_t doe_cap_base);
+diff --git a/tftf/tests/doe_tests/test_doe.c b/tftf/tests/doe_tests/test=
_doe.c
+index 6eb5079..cc852fa 100644
+--- a/tftf/tests/doe_tests/test_doe.c
++++ b/tftf/tests/doe_tests/test_doe.c
+@@ -10,6 +10,13 @@
+=20
+ #define SKIP_TEST_IF_DOE_NOT_SUPPORTED()					\
+ 	do {									\
++		/* Test PCIe DOE only for RME */				\
++		if (!get_armv9_2_feat_rme_support()) {				\
++			tftf_testcase_printf("FEAT_RME not supported\n");	\
++			return TEST_RESULT_SKIPPED;				\
++		}								\
++										\
++		pcie_init();							\
+ 		if (find_doe_device(&bdf, &doe_cap_base) !=3D 0) {		\
+ 			tftf_testcase_printf("PCIe DOE not supported\n");	\
+ 			return TEST_RESULT_SKIPPED;				\
+@@ -21,8 +28,6 @@ test_result_t doe_discovery_test(void)
+ 	uint32_t bdf, doe_cap_base;
+ 	int ret;
+=20
+-	pcie_init();
+-
+ 	SKIP_TEST_IF_DOE_NOT_SUPPORTED();
+=20
+ 	ret =3D doe_discovery(bdf, doe_cap_base);
+diff --git a/tftf/tests/runtime_services/realm_payload/host_realm_simd_c=
ommon.h b/tftf/tests/runtime_services/realm_payload/host_realm_simd_commo=
n.h
+index 377c85b..6ab45c3 100644
+--- a/tftf/tests/runtime_services/realm_payload/host_realm_simd_common.h
++++ b/tftf/tests/runtime_services/realm_payload/host_realm_simd_common.h
+@@ -4,7 +4,7 @@
+  */
+=20
+ #ifndef HOST_REALM_COMMON_H
+-#define HOST_REALM_COMMON_h
++#define HOST_REALM_COMMON_H
+=20
+ #define NS_NORMAL_SVE		0x1U
+ #define NS_STREAMING_SVE	0x2U
+diff --git a/tftf/tests/tests-pcie-doe.mk b/tftf/tests/tests-pcie-doe.mk
+deleted file mode 100644
+index 14bc9cf..0000000
+--- a/tftf/tests/tests-pcie-doe.mk
++++ /dev/null
+@@ -1,22 +0,0 @@
+-#
+-# Copyright (c) 2024, Arm Limited. All rights reserved.
+-#
+-# SPDX-License-Identifier: BSD-3-Clause
+-#
+-
+-TESTS_SOURCES	+=3D			\
+-	$(addprefix plat/arm/fvp/,	\
+-		fvp_pcie.c		\
+-	)
+-
+-TESTS_SOURCES	+=3D				\
+-	$(addprefix tftf/tests/doe_tests/,	\
+-		doe_helpers.c			\
+-		test_doe.c			\
+-	)
+-
+-TESTS_SOURCES	+=3D		\
+-	$(addprefix lib/pcie/,	\
+-		pcie.c		\
+-		pcie_doe.c	\
+-	)
+diff --git a/tftf/tests/tests-pcie-doe.xml b/tftf/tests/tests-pcie-doe.x=
ml
+deleted file mode 100644
+index ed8b7cb..0000000
+--- a/tftf/tests/tests-pcie-doe.xml
++++ /dev/null
+@@ -1,14 +0,0 @@
+-<?xml version=3D"1.0" encoding=3D"utf-8"?>
+-
+-<!--
+-  Copyright (c) 2024, Arm Limited. All rights reserved.
+-
+-  SPDX-License-Identifier: BSD-3-Clause
+--->
+-
+-<testsuites>
+-  <testsuite name=3D"PCI Data Object Exchange" description=3D"Check PCI=
 DOE support">
+-     <testcase name=3D"PCI DOE Discovery" function=3D"doe_discovery_tes=
t" />
+-     <testcase name=3D"SPDM Get Version" function=3D"spdm_version_test"=
 />
+-  </testsuite>
+-</testsuites>
+diff --git a/tftf/tests/tests-realm-payload.mk b/tftf/tests/tests-realm-=
payload.mk
+index ae4b20a..4da8e3e 100644
+--- a/tftf/tests/tests-realm-payload.mk
++++ b/tftf/tests/tests-realm-payload.mk
+@@ -1,5 +1,5 @@
+ #
+-# Copyright (c) 2021-2023, Arm Limited. All rights reserved.
++# Copyright (c) 2021-2024, Arm Limited. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -44,4 +44,16 @@ TESTS_SOURCES	+=3D							\
+ 	$(addprefix lib/extensions/fpu/,				\
+ 		fpu.c							\
+ 	)
++
++TESTS_SOURCES	+=3D				\
++	$(addprefix tftf/tests/doe_tests/,	\
++		doe_helpers.c			\
++		test_doe.c			\
++	)
++
++TESTS_SOURCES	+=3D		\
++	$(addprefix lib/pcie/,	\
++		pcie.c		\
++		pcie_doe.c	\
++	)
+ endif
+diff --git a/tftf/tests/tests-realm-payload.xml b/tftf/tests/tests-realm=
-payload.xml
+index 3c0dda4..d99a6b9 100644
+--- a/tftf/tests/tests-realm-payload.xml
++++ b/tftf/tests/tests-realm-payload.xml
+@@ -1,7 +1,7 @@
+ <?xml version=3D"1.0" encoding=3D"utf-8"?>
+=20
+ <!--
+-  Copyright (c) 2021-2023, Arm Limited. All rights reserved.
++  Copyright (c) 2021-2024, Arm Limited. All rights reserved.
+=20
+   SPDX-License-Identifier: BSD-3-Clause
+ -->
+@@ -126,5 +126,10 @@
+ 	  function=3D"host_test_non_lpa2_realm_on_lpa2plat" />
+ 	  <testcase name=3D"Test Realm creation with LPA2 enabled but FEAT_LPA=
2 absent on platform"
+ 	  function=3D"host_test_lpa2_realm_on_non_lpa2plat" />
++	  <!-- Test case related to PCIE-DOE -->
++	  <testcase name=3D"PCI DOE Discovery"
++	  function=3D"doe_discovery_test" />
++	  <testcase name=3D"SPDM Get Version"
++	  function=3D"spdm_version_test" />
+   </testsuite>
+ </testsuites>
+--=20
+2.34.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
index 31b0964b..105f0a4a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
@@ -9,6 +9,7 @@ COMPATIBLE_MACHINE ?=3D "invalid"
=20
 SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
+          file://0001-fix-realm-make-PCIe-tests-default-for-testing.patc=
h \
           "
 SRCBRANCH =3D "master"
 SRCREV =3D "6a113621a9efdc143e9270b1789046cd7d9cdfb1"

