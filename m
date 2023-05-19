Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272F2C7EE23
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23050.1684495465470771795
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 008AA1FB;
	Fri, 19 May 2023 04:25:10 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F7153F762;
	Fri, 19 May 2023 04:24:24 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH 04/16] optee-os: Add support for TOS_FW_CONFIG on qemu
Date: Fri, 19 May 2023 13:23:48 +0200
Message-Id: <20230519112400.340-4-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4668

OP-TEE SPMC v3.20 and TF-A v2.8 is incompatible on qemu, and OP-TEE
panics during boot because having an SPMC manifest passed to the SPMC is
mandatory since v3.20. TF-A and OP-TEE upstream already fixed this issue
by modifying the ABI between the SPMD and SPMC. Moreover qemu support in
TF-A has been extended to allow building an SPMC manifest DTS file, and
loading it from the FIP package.
This change adds the needed OP-TEE fixes as carried patches. The TF-A
change will be added in the next commit.

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 ...-core-arm-S-EL1-SPMC-boot-ABI-update.patch |  91 +++++++
 ...-core-ffa-add-TOS_FW_CONFIG-handling.patch | 249 ++++++++++++++++++
 .../recipes-security/optee/optee-os_3.20.0.bb |   3 +
 3 files changed, 343 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.20.0/0005-=
core-arm-S-EL1-SPMC-boot-ABI-update.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os-3.20.0/0006-=
core-ffa-add-TOS_FW_CONFIG-handling.patch

diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0005-core-ar=
m-S-EL1-SPMC-boot-ABI-update.patch b/meta-arm/recipes-security/optee/opte=
e-os-3.20.0/0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch
new file mode 100644
index 00000000..4313a829
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-3.20.0/0005-core-arm-S-EL1=
-SPMC-boot-ABI-update.patch
@@ -0,0 +1,91 @@
+From 11f4ea86579bc1a58e4adde2849326f4213694f2 Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Mon, 21 Nov 2022 18:17:33 +0100
+Subject: core: arm: S-EL1 SPMC: boot ABI update
+
+Updates the boot ABI for S-EL1 SPMC to align better with other SPMCs,
+like Hafnium, but also with the non-FF-A configuration.
+
+Register usage:
+X0 - TOS FW config [1] address, if not NULL
+X2 - System DTB, if not NULL
+
+Adds check in the default get_aslr_seed() to see if the system DTB is
+present before trying to read kaslr-seed from secure-chosen.
+
+Note that this is an incompatible change and requires corresponding
+change in TF-A ("feat(qemu): update abi between spmd and spmc") [2].
+
+[1] A TF-A concept: TOS_FW_CONFIG - Trusted OS Firmware configuration
+    file. Used by Trusted OS (BL32), that is, OP-TEE in this case
+Link: [2] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/co=
mmit/?id=3D25ae7ad1878244f78206cc7c91f7bdbd267331a1
+
+Upstream-Status: Accepted
+
+Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/arch/arm/kernel/boot.c      |  8 +++++++-
+ core/arch/arm/kernel/entry_a64.S | 17 ++++++++---------
+ 2 files changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/core/arch/arm/kernel/boot.c b/core/arch/arm/kernel/boot.c
+index dd34173e8..e02c02b60 100644
+--- a/core/arch/arm/kernel/boot.c
++++ b/core/arch/arm/kernel/boot.c
+@@ -1502,11 +1502,17 @@ struct ns_entry_context *boot_core_hpen(void)
+ #if defined(CFG_DT)
+ unsigned long __weak get_aslr_seed(void *fdt)
+ {
+-	int rc =3D fdt_check_header(fdt);
++	int rc =3D 0;
+ 	const uint64_t *seed =3D NULL;
+ 	int offs =3D 0;
+ 	int len =3D 0;
+=20
++	if (!fdt) {
++		DMSG("No fdt");
++		goto err;
++	}
++
++	rc =3D fdt_check_header(fdt);
+ 	if (rc) {
+ 		DMSG("Bad fdt: %d", rc);
+ 		goto err;
+diff --git a/core/arch/arm/kernel/entry_a64.S b/core/arch/arm/kernel/ent=
ry_a64.S
+index 4c6e9d75c..047ae1f25 100644
+--- a/core/arch/arm/kernel/entry_a64.S
++++ b/core/arch/arm/kernel/entry_a64.S
+@@ -143,21 +143,20 @@
+ 	.endm
+=20
+ FUNC _start , :
+-#if defined(CFG_CORE_SEL1_SPMC)
+ 	/*
+-	 * With OP-TEE as SPMC at S-EL1 the SPMD (SPD_spmd) in TF-A passes
+-	 * the DTB in x0, pagaeble part in x1 and the rest of the registers
+-	 * are unused
++	 * If CFG_CORE_FFA is enabled, then x0 if non-NULL holds the TOS FW
++	 * config [1] address, else x0 if non-NULL holds the pagable part
++	 * address.
++	 *
++	 * [1] A TF-A concept: TOS_FW_CONFIG - Trusted OS Firmware
++	 * configuration file. Used by Trusted OS (BL32), that is, OP-TEE
++	 * here.
+ 	 */
+-	mov	x19, x1		/* Save pagable part */
+-	mov	x20, x0		/* Save DT address */
+-#else
+-	mov	x19, x0		/* Save pagable part address */
++	mov	x19, x0
+ #if defined(CFG_DT_ADDR)
+ 	ldr     x20, =3DCFG_DT_ADDR
+ #else
+ 	mov	x20, x2		/* Save DT address */
+-#endif
+ #endif
+=20
+ 	adr	x0, reset_vect_table
+--=20
+2.39.1.windows.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os-3.20.0/0006-core-ff=
a-add-TOS_FW_CONFIG-handling.patch b/meta-arm/recipes-security/optee/opte=
e-os-3.20.0/0006-core-ffa-add-TOS_FW_CONFIG-handling.patch
new file mode 100644
index 00000000..add39076
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-3.20.0/0006-core-ffa-add-T=
OS_FW_CONFIG-handling.patch
@@ -0,0 +1,249 @@
+From 84f4ef4c4f2f45e2f54597f1afe80d8f8396cc57 Mon Sep 17 00:00:00 2001
+From: Balint Dobszay <balint.dobszay@arm.com>
+Date: Fri, 10 Feb 2023 11:07:27 +0100
+Subject: core: ffa: add TOS_FW_CONFIG handling
+
+At boot TF-A passes two DT addresses (HW_CONFIG and TOS_FW_CONFIG), but
+currently only the HW_CONFIG address is saved, the other one is dropped.
+This commit adds functionality to save the TOS_FW_CONFIG too, so we can
+retrieve it later. This is necessary for the CFG_CORE_SEL1_SPMC use
+case, because the SPMC manifest is passed in this DT.
+
+Upstream-Status: Accepted
+
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
+---
+ core/arch/arm/kernel/boot.c               | 60 ++++++++++++++++++++++-
+ core/arch/arm/kernel/entry_a32.S          |  3 +-
+ core/arch/arm/kernel/entry_a64.S          | 13 ++++-
+ core/arch/arm/kernel/link_dummies_paged.c |  4 +-
+ core/arch/arm/kernel/secure_partition.c   |  2 +-
+ core/include/kernel/boot.h                |  7 ++-
+ 6 files changed, 81 insertions(+), 8 deletions(-)
+
+diff --git a/core/arch/arm/kernel/boot.c b/core/arch/arm/kernel/boot.c
+index e02c02b60..98e13c072 100644
+--- a/core/arch/arm/kernel/boot.c
++++ b/core/arch/arm/kernel/boot.c
+@@ -1,6 +1,7 @@
+ // SPDX-License-Identifier: BSD-2-Clause
+ /*
+  * Copyright (c) 2015-2022, Linaro Limited
++ * Copyright (c) 2023, Arm Limited
+  */
+=20
+ #include <arm.h>
+@@ -83,6 +84,9 @@ struct dt_descriptor {
+ };
+=20
+ static struct dt_descriptor external_dt __nex_bss;
++#ifdef CFG_CORE_SEL1_SPMC
++static struct dt_descriptor tos_fw_config_dt __nex_bss;
++#endif
+ #endif
+=20
+ #ifdef CFG_SECONDARY_INIT_CNTFRQ
+@@ -1224,6 +1228,54 @@ static struct core_mmu_phys_mem *get_nsec_memory(=
void *fdt __unused,
+ #endif /*CFG_CORE_DYN_SHM*/
+ #endif /*!CFG_DT*/
+=20
++#if defined(CFG_CORE_SEL1_SPMC) && defined(CFG_DT)
++void *get_tos_fw_config_dt(void)
++{
++	if (!IS_ENABLED(CFG_MAP_EXT_DT_SECURE))
++		return NULL;
++
++	assert(cpu_mmu_enabled());
++
++	return tos_fw_config_dt.blob;
++}
++
++static void init_tos_fw_config_dt(unsigned long pa)
++{
++	struct dt_descriptor *dt =3D &tos_fw_config_dt;
++	void *fdt =3D NULL;
++	int ret =3D 0;
++
++	if (!IS_ENABLED(CFG_MAP_EXT_DT_SECURE))
++		return;
++
++	if (!pa)
++		panic("No TOS_FW_CONFIG DT found");
++
++	fdt =3D core_mmu_add_mapping(MEM_AREA_EXT_DT, pa, CFG_DTB_MAX_SIZE);
++	if (!fdt)
++		panic("Failed to map TOS_FW_CONFIG DT");
++
++	dt->blob =3D fdt;
++
++	ret =3D fdt_open_into(fdt, fdt, CFG_DTB_MAX_SIZE);
++	if (ret < 0) {
++		EMSG("Invalid Device Tree at %#lx: error %d", pa, ret);
++		panic();
++	}
++
++	IMSG("TOS_FW_CONFIG DT found");
++}
++#else
++void *get_tos_fw_config_dt(void)
++{
++	return NULL;
++}
++
++static void init_tos_fw_config_dt(unsigned long pa __unused)
++{
++}
++#endif /*CFG_CORE_SEL1_SPMC && CFG_DT*/
++
+ #ifdef CFG_CORE_DYN_SHM
+ static void discover_nsec_memory(void)
+ {
+@@ -1361,10 +1413,16 @@ static bool cpu_nmfi_enabled(void)
+  * Note: this function is weak just to make it possible to exclude it f=
rom
+  * the unpaged area.
+  */
+-void __weak boot_init_primary_late(unsigned long fdt)
++void __weak boot_init_primary_late(unsigned long fdt,
++				   unsigned long tos_fw_config)
+ {
+ 	init_external_dt(fdt);
++	init_tos_fw_config_dt(tos_fw_config);
++#ifdef CFG_CORE_SEL1_SPMC
++	tpm_map_log_area(get_tos_fw_config_dt());
++#else
+ 	tpm_map_log_area(get_external_dt());
++#endif
+ 	discover_nsec_memory();
+ 	update_external_dt();
+ 	configure_console_from_dt();
+diff --git a/core/arch/arm/kernel/entry_a32.S b/core/arch/arm/kernel/ent=
ry_a32.S
+index 0f14ca2f6..3758fd8b7 100644
+--- a/core/arch/arm/kernel/entry_a32.S
++++ b/core/arch/arm/kernel/entry_a32.S
+@@ -1,7 +1,7 @@
+ /* SPDX-License-Identifier: BSD-2-Clause */
+ /*
+  * Copyright (c) 2014, Linaro Limited
+- * Copyright (c) 2021, Arm Limited
++ * Copyright (c) 2021-2023, Arm Limited
+  */
+=20
+ #include <arm32_macros.S>
+@@ -560,6 +560,7 @@ shadow_stack_access_ok:
+ 	str	r0, [r8, #THREAD_CORE_LOCAL_FLAGS]
+ #endif
+ 	mov	r0, r6		/* DT address */
++	mov	r1, #0		/* unused */
+ 	bl	boot_init_primary_late
+ #ifndef CFG_VIRTUALIZATION
+ 	mov	r0, #THREAD_CLF_TMP
+diff --git a/core/arch/arm/kernel/entry_a64.S b/core/arch/arm/kernel/ent=
ry_a64.S
+index 047ae1f25..fa76437fb 100644
+--- a/core/arch/arm/kernel/entry_a64.S
++++ b/core/arch/arm/kernel/entry_a64.S
+@@ -1,7 +1,7 @@
+ /* SPDX-License-Identifier: BSD-2-Clause */
+ /*
+  * Copyright (c) 2015-2022, Linaro Limited
+- * Copyright (c) 2021, Arm Limited
++ * Copyright (c) 2021-2023, Arm Limited
+  */
+=20
+ #include <platform_config.h>
+@@ -320,7 +320,11 @@ clear_nex_bss:
+ 	bl	core_mmu_set_default_prtn_tbl
+ #endif
+=20
++#ifdef CFG_CORE_SEL1_SPMC
++	mov	x0, xzr		/* pager not used */
++#else
+ 	mov	x0, x19		/* pagable part address */
++#endif
+ 	mov	x1, #-1
+ 	bl	boot_init_primary_early
+=20
+@@ -337,7 +341,12 @@ clear_nex_bss:
+ 	mov	x22, x0
+ 	str	wzr, [x22, #THREAD_CORE_LOCAL_FLAGS]
+ #endif
+-	mov	x0, x20		/* DT address */
++	mov	x0, x20		/* DT address also known as HW_CONFIG */
++#ifdef CFG_CORE_SEL1_SPMC
++	mov	x1, x19		/* TOS_FW_CONFIG DT address */
++#else
++	mov	x1, xzr		/* unused */
++#endif
+ 	bl	boot_init_primary_late
+ #ifdef CFG_CORE_PAUTH
+ 	init_pauth_per_cpu
+diff --git a/core/arch/arm/kernel/link_dummies_paged.c b/core/arch/arm/k=
ernel/link_dummies_paged.c
+index 3b8287e06..023a5f3f5 100644
+--- a/core/arch/arm/kernel/link_dummies_paged.c
++++ b/core/arch/arm/kernel/link_dummies_paged.c
+@@ -1,6 +1,7 @@
+ // SPDX-License-Identifier: BSD-2-Clause
+ /*
+  * Copyright (c) 2017-2021, Linaro Limited
++ * Copyright (c) 2023, Arm Limited
+  */
+ #include <compiler.h>
+ #include <initcall.h>
+@@ -27,7 +28,8 @@ void __section(".text.dummy.call_finalcalls") call_fin=
alcalls(void)
+ }
+=20
+ void __section(".text.dummy.boot_init_primary_late")
+-boot_init_primary_late(unsigned long fdt __unused)
++boot_init_primary_late(unsigned long fdt __unused,
++		       unsigned long tos_fw_config __unused)
+ {
+ }
+=20
+diff --git a/core/arch/arm/kernel/secure_partition.c b/core/arch/arm/ker=
nel/secure_partition.c
+index 1d36e90b1..d386f1e4d 100644
+--- a/core/arch/arm/kernel/secure_partition.c
++++ b/core/arch/arm/kernel/secure_partition.c
+@@ -1212,7 +1212,7 @@ static TEE_Result fip_sp_map_all(void)
+ 	int subnode =3D 0;
+ 	int root =3D 0;
+=20
+-	fdt =3D get_external_dt();
++	fdt =3D get_tos_fw_config_dt();
+ 	if (!fdt) {
+ 		EMSG("No SPMC manifest found");
+ 		return TEE_ERROR_GENERIC;
+diff --git a/core/include/kernel/boot.h b/core/include/kernel/boot.h
+index 260854473..941e093b2 100644
+--- a/core/include/kernel/boot.h
++++ b/core/include/kernel/boot.h
+@@ -1,7 +1,7 @@
+ /* SPDX-License-Identifier: BSD-2-Clause */
+ /*
+  * Copyright (c) 2015-2020, Linaro Limited
+- * Copyright (c) 2021, Arm Limited
++ * Copyright (c) 2021-2023, Arm Limited
+  */
+ #ifndef __KERNEL_BOOT_H
+ #define __KERNEL_BOOT_H
+@@ -46,7 +46,7 @@ extern const struct core_mmu_config boot_mmu_config;
+ /* @nsec_entry is unused if using CFG_WITH_ARM_TRUSTED_FW */
+ void boot_init_primary_early(unsigned long pageable_part,
+ 			     unsigned long nsec_entry);
+-void boot_init_primary_late(unsigned long fdt);
++void boot_init_primary_late(unsigned long fdt, unsigned long tos_fw_con=
fig);
+ void boot_init_memtag(void);
+=20
+ void __panic_at_smc_return(void) __noreturn;
+@@ -103,6 +103,9 @@ void *get_embedded_dt(void);
+ /* Returns external DTB if present, otherwise NULL */
+ void *get_external_dt(void);
+=20
++/* Returns TOS_FW_CONFIG DTB if present, otherwise NULL */
++void *get_tos_fw_config_dt(void);
++
+ /*
+  * get_aslr_seed() - return a random seed for core ASLR
+  * @fdt:	Pointer to a device tree if CFG_DT_ADDR=3Dy
+--=20
+2.39.1.windows.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb b/meta-ar=
m/recipes-security/optee/optee-os_3.20.0.bb
index 5f4b066a..661a807d 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.20.0.bb
@@ -7,4 +7,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-os-3.20.0:=
"
 SRCREV =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
 SRC_URI:append =3D " \
     file://0004-core-Define-section-attributes-for-clang.patch \
+    file://0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch \
+    file://0006-core-ffa-add-TOS_FW_CONFIG-handling.patch \
    "
+EXTRA_OEMAKE +=3D " CFG_MAP_EXT_DT_SECURE=3Dy"
--=20
2.39.1.windows.1


