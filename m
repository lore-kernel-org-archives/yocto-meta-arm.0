Return-Path: <delane.brandy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2F4C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 10:51:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9188.1709722270267395581
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 02:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: delane.brandy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4DB71FB;
	Wed,  6 Mar 2024 02:51:46 -0800 (PST)
Received: from e127094.cambridge.arm.com (e127094.arm.com [10.1.39.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A72003F738;
	Wed,  6 Mar 2024 02:51:08 -0800 (PST)
From: delane.brandy@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <emekcan.aras@arm.com>,
	Delane Brandy <delane.brandy@arm.com>
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-a: Upgrade Corstone1000 to TF-A v2.10
Date: Wed,  6 Mar 2024 10:50:15 +0000
Message-Id: <20240306105015.2630056-3-delane.brandy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306105015.2630056-1-delane.brandy@arm.com>
References: <20240306105015.2630056-1-delane.brandy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Mar 2024 10:51:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5414

From: Emekcan Aras <emekcan.aras@arm.com>

Upgrades trusted-firmware-a and align with changes in v2.10 for Corstone-=
1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
Signed-off-by: Delane Brandy <delane.brandy@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |   2 +-
 ...1000-bl2-loads-fip-based-on-metadata.patch | 162 ------------------
 ...RES-discovery-through-PSCI_FEATURES.patch} |   0
 ...stone1000-pass-spsr-value-explicitly.patch |  31 ++++
 ...rstone1000-add-cpuhelper-to-makefile.patch |  28 ---
 ...md-remove-EL3-interrupt-registration.patch |  54 ++++++
 .../trusted-firmware-a-corstone1000.inc       |   7 +-
 7 files changed, 90 insertions(+), 194 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch =3D> 0=
002-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch} (100%=
)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-fix-corstone1000-pass-spsr-value-explicitly.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0004-fix-corstone1000-add-cpuhelper-to-makefile.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0004-fix-spmd-remove-EL3-interrupt-registration.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 8d793426..a25a214e 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -7,7 +7,7 @@ PREFERRED_VERSION_trusted-firmware-m ?=3D "1.8.%"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.9.%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
 PREFERRED_VERSION_tf-a-tests ?=3D "2.8.%"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-feat-corston=
e1000-bl2-loads-fip-based-on-metadata.patch
deleted file mode 100644
index e26fd34e..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From fa7ab9b40babee29d2aadb267dfce7a96f8989d4 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Mon, 9 Jan 2023 13:59:06 +0000
-Subject: [PATCH] feat(corstone1000): bl2 loads fip based on metadata
-
-Previously bl2 was reading the boot_index directly with a hard coded
-address and then set the fip image spec with fip offsets base based on
-the boot_index value.
-This commit removes this logic and rely on PSA_FWU_SUPPORT
-which reads the fip partition based on the active firmware bank written =
in
-metadata.
-
-Note: fip partition contains signature area at the begining. Hence, the =
fip
-image starts at fip partition + fip signature area size.
-
-Upstream-Status: Pending
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
----
- bl2/bl2_main.c                                |  4 +++
- .../corstone1000/common/corstone1000_plat.c   | 32 ++++++-------------
- .../common/include/platform_def.h             | 12 +++----
- tools/cert_create/Makefile                    |  4 +--
- tools/fiptool/Makefile                        |  4 +--
- 5 files changed, 24 insertions(+), 32 deletions(-)
-
-diff --git a/bl2/bl2_main.c b/bl2/bl2_main.c
-index ce83692e0ebc..1a9febc007b2 100644
---- a/bl2/bl2_main.c
-+++ b/bl2/bl2_main.c
-@@ -87,6 +87,10 @@ void bl2_main(void)
- 	/* Perform remaining generic architectural setup in S-EL1 */
- 	bl2_arch_setup();
-=20
-+#if ARM_GPT_SUPPORT
-+	partition_init(GPT_IMAGE_ID);
-+#endif
-+
- #if PSA_FWU_SUPPORT
- 	fwu_init();
- #endif /* PSA_FWU_SUPPORT */
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/pl=
at/arm/board/corstone1000/common/corstone1000_plat.c
-index 0235f8b8474c..7f9708a82489 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
-@@ -33,36 +33,17 @@ const mmap_region_t plat_arm_mmap[] =3D {
- static void set_fip_image_source(void)
- {
- 	const struct plat_io_policy *policy;
--	/*
--	 * metadata for firmware update is written at 0x0000 offset of the fla=
sh.
--	 * PLAT_ARM_BOOT_BANK_FLAG contains the boot bank that TF-M is booted.
--	 * As per firmware update spec, at a given point of time, only one ban=
k
--	 * is active. This means, TF-A should boot from the same bank as TF-M.
--	 */
--	volatile uint32_t *boot_bank_flag =3D (uint32_t *)(PLAT_ARM_BOOT_BANK_=
FLAG);
--
--	if (*boot_bank_flag > 1) {
--		VERBOSE("Boot_bank is set higher than possible values");
--	}
--
--	VERBOSE("Boot bank flag =3D %u.\n\r", *boot_bank_flag);
-=20
- 	policy =3D FCONF_GET_PROPERTY(arm, io_policies, FIP_IMAGE_ID);
-=20
- 	assert(policy !=3D NULL);
- 	assert(policy->image_spec !=3D 0UL);
-=20
-+	/* FIP Partition contains Signature area at the begining which TF-A do=
esn't expect */
- 	io_block_spec_t *spec =3D (io_block_spec_t *)policy->image_spec;
-+	spec->offset +=3D FIP_SIGNATURE_AREA_SIZE;
-+	spec->length -=3D FIP_SIGNATURE_AREA_SIZE;
-=20
--	if ((*boot_bank_flag) =3D=3D 0) {
--		VERBOSE("Booting from bank 0: fip offset =3D 0x%lx\n\r",
--						PLAT_ARM_FIP_BASE_BANK0);
--		spec->offset =3D PLAT_ARM_FIP_BASE_BANK0;
--	} else {
--		VERBOSE("Booting from bank 1: fip offset =3D 0x%lx\n\r",
--						PLAT_ARM_FIP_BASE_BANK1);
--		spec->offset =3D PLAT_ARM_FIP_BASE_BANK1;
--	}
- }
-=20
- void bl2_platform_setup(void)
-@@ -75,6 +56,13 @@ void bl2_platform_setup(void)
- 	set_fip_image_source();
- }
-=20
-+void bl2_early_platform_setup2(u_register_t arg0, u_register_t arg1,
-+			       u_register_t arg2, u_register_t arg3)
-+{
-+	arm_bl2_early_platform_setup((uintptr_t)arg0, (meminfo_t *)arg1);
-+	NOTICE("CS1k: early at bl2_platform_setup\n");
-+}
-+
- /* corstone1000 only has one always-on power domain and there
-  * is no power control present
-  */
-diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index 584d485f3ea7..0bfab05a482b 100644
---- a/plat/arm/board/corstone1000/common/include/platform_def.h
-+++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -173,16 +173,16 @@
-=20
- /* NOR Flash */
-=20
--#define PLAT_ARM_BOOT_BANK_FLAG		UL(0x08002000)
--#define PLAT_ARM_FIP_BASE_BANK0		UL(0x081EF000)
--#define PLAT_ARM_FIP_BASE_BANK1		UL(0x0916F000)
--#define PLAT_ARM_FIP_MAX_SIZE		UL(0x1ff000)  /* 1.996 MB */
--
- #define PLAT_ARM_NVM_BASE		V2M_FLASH0_BASE
- #define PLAT_ARM_NVM_SIZE		(SZ_32M)  /* 32 MB */
-+#define PLAT_ARM_FIP_MAX_SIZE		UL(0x1ff000)  /* 1.996 MB */
-=20
--#define PLAT_ARM_FLASH_IMAGE_BASE	PLAT_ARM_FIP_BASE_BANK0
-+#define PLAT_ARM_FLASH_IMAGE_BASE	UL(0x08000000)
- #define PLAT_ARM_FLASH_IMAGE_MAX_SIZE	PLAT_ARM_FIP_MAX_SIZE
-+#define PLAT_ARM_FIP_OFFSET_IN_GPT	(0x86000)
-+
-+/* FIP Information */
-+#define FIP_SIGNATURE_AREA_SIZE         (0x1000)      /* 4 KB */
-=20
- /*
-  * Some data must be aligned on the biggest cache line size in the plat=
form.
-diff --git a/tools/cert_create/Makefile b/tools/cert_create/Makefile
-index 042e844626bd..45b76a022f91 100644
---- a/tools/cert_create/Makefile
-+++ b/tools/cert_create/Makefile
-@@ -78,8 +78,8 @@ INC_DIR +=3D -I ./include -I ${PLAT_INCLUDE} -I ${OPEN=
SSL_DIR}/include
- # directory. However, for a local build of OpenSSL, the built binaries =
are
- # located under the main project directory (i.e.: ${OPENSSL_DIR}, not
- # ${OPENSSL_DIR}/lib/).
--LIB_DIR :=3D -L ${OPENSSL_DIR}/lib -L ${OPENSSL_DIR}
--LIB :=3D -lssl -lcrypto
-+LIB_DIR :=3D -L ${OPENSSL_DIR}/lib -L ${OPENSSL_DIR} ${BUILD_LDFLAGS} $=
{BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUIL=
D_LDFLAGS}
-+LIB :=3D -lssl -lcrypto ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLA=
GS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS}
-=20
- HOSTCC ?=3D gcc
-=20
-diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
-index 2ebee33931ba..dcfd314bee89 100644
---- a/tools/fiptool/Makefile
-+++ b/tools/fiptool/Makefile
-@@ -39,7 +39,7 @@ HOSTCCFLAGS +=3D -DUSING_OPENSSL3=3D$(USING_OPENSSL3)
- # directory. However, for a local build of OpenSSL, the built binaries =
are
- # located under the main project directory (i.e.: ${OPENSSL_DIR}, not
- # ${OPENSSL_DIR}/lib/).
--LDLIBS :=3D -L${OPENSSL_DIR}/lib -L${OPENSSL_DIR} -lcrypto
-+LDLIBS :=3D -L${OPENSSL_DIR}/lib -L${OPENSSL_DIR} -lcrypto ${BUILD_LDFL=
AGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} ${BUILD_LDFLAGS} =
${BUILD_LDFLAGS}
-=20
- ifeq (${V},0)
-   Q :=3D @
-@@ -47,7 +47,7 @@ else
-   Q :=3D
- endif
-=20
--INCLUDE_PATHS :=3D -I../../include/tools_share  -I${OPENSSL_DIR}/includ=
e
-+INCLUDE_PATHS :=3D -I../../include/tools_share  -I${OPENSSL_DIR}/includ=
e ${BUILD_CFLAGS} ${BUILD_CFLAGS} ${BUILD_CFLAGS} ${BUILD_CFLAGS} ${BUILD=
_CFLAGS} ${BUILD_CFLAGS}
-=20
- HOSTCC ?=3D gcc
-=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch b/=
meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-psci-=
SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone100=
0/0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/=
0002-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-fix-corstone1000-pass-spsr-value-explicitly.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-a/files/corstone1000/0003-fix-corstone1000-p=
ass-spsr-value-explicitly.patch
new file mode 100644
index 00000000..7f21138a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
-fix-corstone1000-pass-spsr-value-explicitly.patch
@@ -0,0 +1,31 @@
+From d70a07562d3b0a7b4441922fd3ce136565927d04 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Wed, 21 Feb 2024 07:57:36 +0000
+Subject: [PATCH] fix(corstone1000): pass spsr value explicitly
+
+Passes spsr value for BL32 (OPTEE) explicitly between different boot
+stages.
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+---
+ .../corstone1000/common/corstone1000_bl2_mem_params_desc.c     | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_par=
ams_desc.c b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_para=
ms_desc.c
+index fe521a9fa..2cc096f38 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_des=
c.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_des=
c.c
+@@ -72,7 +72,8 @@ static bl_mem_params_node_t bl2_mem_params_descs[] =3D=
 {
+ 		SET_STATIC_PARAM_HEAD(ep_info, PARAM_EP,
+ 			VERSION_2, entry_point_info_t, NON_SECURE | EXECUTABLE),
+ 		.ep_info.pc =3D BL33_BASE,
+-
++		.ep_info.spsr =3D SPSR_64(MODE_EL2, MODE_SP_ELX,
++				       DISABLE_ALL_EXCEPTIONS),
+ 		SET_STATIC_PARAM_HEAD(image_info, PARAM_EP,
+ 			VERSION_2, image_info_t, 0),
+ 		.image_info.image_base =3D BL33_BASE,
+--=20
+2.25.1
+
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0004-fix-corstone1000-add-cpuhelper-to-makefile.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-corstone1000-ad=
d-cpuhelper-to-makefile.patch
deleted file mode 100644
index 6ddde10e..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004=
-fix-corstone1000-add-cpuhelper-to-makefile.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 33078d8ef143e8c79f06399de46dd26e1d53a220 Mon Sep 17 00:00:00 2001
-From: Gauri Sahnan <Gauri.Sahnan@arm.com>
-Date: Tue, 8 Aug 2023 17:16:51 +0100
-Subject: fix(corstone1000): add cpuhelpers to makefile
-
-Adds cpu_helpers.S to the Makefile to align with the changes in new
-trusted-firmware-a version.
-
-Signed-off-by: Gauri Sahnan <Gauri.Sahnan@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- plat/arm/board/corstone1000/platform.mk | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/co=
rstone1000/platform.mk
-index 3edffe087..079e9d6c1 100644
---- a/plat/arm/board/corstone1000/platform.mk
-+++ b/plat/arm/board/corstone1000/platform.mk
-@@ -43,6 +43,7 @@ BL2_SOURCES		+=3D	plat/arm/board/corstone1000/common/c=
orstone1000_security.c		\
- 				plat/arm/board/corstone1000/common/corstone1000_err.c		\
- 				plat/arm/board/corstone1000/common/corstone1000_trusted_boot.c	\
- 				lib/utils/mem_region.c					\
-+				lib/cpus/aarch64/cpu_helpers.S \
- 				plat/arm/board/corstone1000/common/corstone1000_helpers.S		\
- 				plat/arm/board/corstone1000/common/corstone1000_plat.c		\
- 				plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc=
.c \
---=20
-2.25.1
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0004-fix-spmd-remove-EL3-interrupt-registration.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-spmd-remove-EL3=
-interrupt-registration.patch
new file mode 100644
index 00000000..ea7a2913
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004=
-fix-spmd-remove-EL3-interrupt-registration.patch
@@ -0,0 +1,54 @@
+From 684b8f88238f522b52eb102485762e02e6b1671a Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Fri, 23 Feb 2024 13:17:59 +0000
+Subject: [PATCH] fix(spmd): remove EL3 interrupt registration
+
+This configuration should not be done for corstone1000 and similar
+platforms. GICv2 systems only support EL3 interrupts and can have SEL1 c=
omponent
+as SPMC.
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+Upstream-Status: Inappropriate [Discussions of fixing this in a better w=
ay is ongoing in upstream]
+---
+ services/std_svc/spmd/spmd_main.c | 24 ------------------------
+ 1 file changed, 24 deletions(-)
+
+diff --git a/services/std_svc/spmd/spmd_main.c b/services/std_svc/spmd/s=
pmd_main.c
+index 066571e9b..313f05bf3 100644
+--- a/services/std_svc/spmd/spmd_main.c
++++ b/services/std_svc/spmd/spmd_main.c
+@@ -580,30 +580,6 @@ static int spmd_spmc_init(void *pm_addr)
+ 		panic();
+ 	}
+=20
+-	/*
+-	 * Permit configurations where the SPM resides at S-EL1/2 and upon a
+-	 * Group0 interrupt triggering while the normal world runs, the
+-	 * interrupt is routed either through the EHF or directly to the SPMD:
+-	 *
+-	 * EL3_EXCEPTION_HANDLING=3D0: the Group0 interrupt is routed to the S=
PMD
+-	 *                   for handling by spmd_group0_interrupt_handler_nwd=
.
+-	 *
+-	 * EL3_EXCEPTION_HANDLING=3D1: the Group0 interrupt is routed to the E=
HF.
+-	 *
+-	 */
+-#if (EL3_EXCEPTION_HANDLING =3D=3D 0)
+-	/*
+-	 * Register an interrupt handler routing Group0 interrupts to SPMD
+-	 * while the NWd is running.
+-	 */
+-	rc =3D register_interrupt_type_handler(INTR_TYPE_EL3,
+-					     spmd_group0_interrupt_handler_nwd,
+-					     flags);
+-	if (rc !=3D 0) {
+-		panic();
+-	}
+-#endif
+-
+ 	return 0;
+ }
+=20
+--=20
+2.25.1
+
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 8673199d..92a08a3a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -5,9 +5,9 @@ COMPATIBLE_MACHINE =3D "(corstone1000)"
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1000:"
 SRC_URI:append =3D " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
-	file://0002-feat-corstone1000-bl2-loads-fip-based-on-metadata.patch \
-	file://0003-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.pa=
tch \
-	file://0004-fix-corstone1000-add-cpuhelper-to-makefile.patch \
+	file://0002-psci-SMCCC_ARCH_FEATURES-discovery-through-PSCI_FEATURES.pa=
tch \
+    file://0003-fix-corstone1000-pass-spsr-value-explicitly.patch \
+    file://0004-fix-spmd-remove-EL3-interrupt-registration.patch \
        "
=20
 TFA_DEBUG =3D "1"
@@ -51,4 +51,5 @@ EXTRA_OEMAKE:append =3D " \
                         ERRATA_A35_855472=3D1 \
                         ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotpri=
vk_rsa.pem \
                         BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/=
firmware/tee-pager_v2.bin \
+                        FVP_USE_GIC_DRIVER=3DFVP_GICV2 \
                         "
--=20
2.34.1


