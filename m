Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4323C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:31:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31103.1723030282525624692
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 04:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8AE5FEC;
	Wed,  7 Aug 2024 04:31:47 -0700 (PDT)
Received: from e126523.budapest.arm.com (e126523.budapest.arm.com [10.45.26.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 783B33F5A1;
	Wed,  7 Aug 2024 04:31:20 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 1/3] arm-bsp/trusted-firmware-m: corstone1000: upgrade  to TF-M v2.1.x
Date: Wed,  7 Aug 2024 13:31:06 +0200
Message-Id: <20240807113108.58898-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807113108.58898-1-bence.balogh@arm.com>
References: <20240807113108.58898-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Aug 2024 11:31:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5954

From: Bence Balogh <bence.balogh@arm.com>

Update the preferred version of TrustedFirmware-M for Cortsone-1000
from 2.0.x to 2.1.x to benefit from the latest fixes and improvements
as well as to reduce the number of out-of-tree patches.

As a result of updating the version:
* Remove no longer required out-of-tree patches
* Rebase and update the numbering of the remaining out-of-tree patches

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |    2 +-
 ...orstone1000-Update-MPU-configuration.patch |  274 --
 ...ne1000-align-capsule-update-structs.patch} |   24 +-
 ...stone1000-skip-the-first-nv-counter.patch} |   10 +-
 ...m-corstone1000-Cover-S_DATA-with-MPU.patch |   76 -
 ...rstone1000-add-unique-guid-for-mps3.patch} |    8 +-
 ...one1000-Enable-host-firewall-in-FVP.patch} |   11 +-
 ...one1000-Increase-ITS-max-asset-size.patch} |    7 +-
 ...1000-Increase-RSE_COMMS-buffer-size.patch} |   11 +-
 ...f-cc312-differences-between-fvp-and.patch} |   14 +-
 ...S1000-Replace-OpenAMP-with-RSE_COMMS.patch | 3620 -----------------
 ...e1000-Increase-buffers-for-EFI-vars.patch} |    4 +-
 ...0-Remove-reset-after-capsule-update.patch} |    4 +-
 ...S1000-Add-multicore-support-for-FVP.patch} |   14 +-
 ...-Corstone1000-switch-to-metadata-v2.patch} |    0
 ...one1000-Increase-flash-PS-area-size.patch} |    0
 .../trusted-firmware-m-corstone1000.inc       |   27 +-
 17 files changed, 67 insertions(+), 4039 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-platform-corstone1000-Update-MPU-configuration.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
003-platform-corstone1000-align-capsule-update-structs.patch =3D> 0001-pl=
atform-corstone1000-align-capsule-update-structs.patch} (94%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
004-Platform-Corstone1000-skip-the-first-nv-counter.patch =3D> 0002-Platf=
orm-Corstone1000-skip-the-first-nv-counter.patch} (80%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-platform-corstone1000-Cover-S_DATA-with-MPU.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
005-platform-corstone1000-add-unique-guid-for-mps3.patch =3D> 0003-platfo=
rm-corstone1000-add-unique-guid-for-mps3.patch} (88%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
006-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch =3D> 0004-Pla=
tform-Corstone1000-Enable-host-firewall-in-FVP.patch} (96%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
007-platform-corstone1000-Increase-ITS-max-asset-size.patch =3D> 0005-pla=
tform-corstone1000-Increase-ITS-max-asset-size.patch} (86%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
009-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch =3D> 0006-=
platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch} (71%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
010-CC312-alignment-of-cc312-differences-between-fvp-and.patch =3D> 0007-=
CC312-alignment-of-cc312-differences-between-fvp-and.patch} (80%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-CS1000-Replace-OpenAMP-with-RSE_COMMS.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch =3D> 0008-P=
latform-corstone1000-Increase-buffers-for-EFI-vars.patch} (91%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
012-corstone1000-Remove-reset-after-capsule-update.patch =3D> 0009-corsto=
ne1000-Remove-reset-after-capsule-update.patch} (88%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
013-platform-CS1000-Add-multicore-support-for-FVP.patch =3D> 0010-platfor=
m-CS1000-Add-multicore-support-for-FVP.patch} (93%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
014-Platform-Corstone1000-switch-to-metadata-v2.patch =3D> 0011-Platform-=
Corstone1000-switch-to-metadata-v2.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
015-platform-corstone1000-Increase-flash-PS-area-size.patch =3D> 0012-pla=
tform-corstone1000-Increase-flash-PS-area-size.patch} (100%)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index e6b4b44b..db1880e5 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -3,7 +3,7 @@ require conf/machine/include/arm/armv8a/tune-cortexa35.in=
c
 MACHINEOVERRIDES =3D. "corstone1000:"
=20
 # TF-M
-PREFERRED_VERSION_trusted-firmware-m ?=3D "2.0.%"
+PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-platform-corstone1000-Update-MPU-configuration.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-platform-corsto=
ne1000-Update-MPU-configuration.patch
deleted file mode 100644
index 25e53b56..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-platform-corstone1000-Update-MPU-configuration.patch
+++ /dev/null
@@ -1,274 +0,0 @@
-From eb096e4c03b80f9f31e5d15ca06e5a38e4112664 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Tue, 7 Nov 2023 20:25:49 +0100
-Subject: [PATCH 1/2] platform: corstone1000: Update MPU configuration
-
-In Armv6-M the MPU requires the regions to be aligned with
-region sizes.
-The commit aligns the different code/data sections using the
-alignment macros. The code/data sections can be covered by
-multiple MPU regions in order to save memory.
-
-Small adjustments had to be made in the memory layout in order to
-not overflow the flash:
-- Decreased TFM_PARTITION_SIZE
-- Increased S_UNPRIV_DATA_SIZE
-
-Added checks to the MPU configuration function for checking the
-MPU constraints:
-- Base address has to be aligned to the size
-- The minimum MPU region size is 0x100
-- The MPU can have 8 regions at most
-
-Change-Id: I059468e8aba0822bb354fd1cd4987ac2bb1f34d1
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/25393]
-
----
- .../target/arm/corstone1000/CMakeLists.txt    | 19 +++++
- .../arm/corstone1000/create-flash-image.sh    |  8 +-
- .../arm/corstone1000/partition/flash_layout.h |  2 +-
- .../arm/corstone1000/partition/region_defs.h  |  6 +-
- .../arm/corstone1000/tfm_hal_isolation.c      | 83 +++++++++++++++----
- 5 files changed, 93 insertions(+), 25 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index e6cf15b11..8817f514c 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -22,6 +22,25 @@ target_compile_definitions(platform_region_defs
-     INTERFACE
-         $<$<BOOL:${TFM_S_REG_TEST}>:TFM_S_REG_TEST>
- )
-+
-+# The Armv6-M MPU requires that the MPU regions be aligned to the regio=
n sizes.
-+# The minimal region size is 0x100 bytes.
-+#
-+# The alignments have to be a power of two and ideally bigger than the =
section size (which
-+# can be checked in the map file).
-+# In some cases the alignment value is smaller than the actual section
-+# size to save memory. In that case, multiple MPU region has to be conf=
igured to cover it.
-+#
-+# To save memory, the attributes are set to XN_EXEC_OK and AP_RO_PRIV_U=
NPRIV for
-+# the SRAM so the PSA_ROT_LINKER_CODE, TFM_UNPRIV_CODE and APP_ROT_LINK=
ER_CODE don't have to
-+# be aligned. The higher-priority regions will overwrite these attribut=
es if needed.
-+# The RAM is also located in the SRAM so it has to be configured to ove=
rwrite these default
-+# attributes.
-+target_compile_definitions(platform_region_defs
-+    INTERFACE
-+        TFM_LINKER_APP_ROT_LINKER_DATA_ALIGNMENT=3D0x2000
-+        TFM_LINKER_SP_META_PTR_ALIGNMENT=3D0x100
-+)
- #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform common defs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
-=20
- # Specify the location of platform specific build dependencies.
-diff --git a/platform/ext/target/arm/corstone1000/create-flash-image.sh =
b/platform/ext/target/arm/corstone1000/create-flash-image.sh
-index 2522d3674..a6be61384 100755
---- a/platform/ext/target/arm/corstone1000/create-flash-image.sh
-+++ b/platform/ext/target/arm/corstone1000/create-flash-image.sh
-@@ -8,7 +8,7 @@
-=20
- ######################################################################
- # This script is to create a flash gpt image for corstone platform
--#=20
-+#
- #  Flash image layout:
- #       |------------------------------|
- #       |        Protective MBR        |
-@@ -82,15 +82,15 @@ sgdisk  --mbrtogpt \
-         --new=3D4:56:+4K --typecode=3D4:$PRIVATE_METADATA_TYPE_UUID --p=
artition-guid=3D4:$(uuidgen) --change-name=3D4:'private_metadata_replica_=
1' \
-         --new=3D5:64:+4k --typecode=3D5:$PRIVATE_METADATA_TYPE_UUID --p=
artition-guid=3D5:$(uuidgen) --change-name=3D5:'private_metadata_replica_=
2' \
-         --new=3D6:72:+100k --typecode=3D6:$SE_BL2_TYPE_UUID --partition=
-guid=3D6:$(uuidgen) --change-name=3D6:'bl2_primary' \
--        --new=3D7:272:+376K --typecode=3D7:$TFM_TYPE_UUID --partition-g=
uid=3D7:$(uuidgen) --change-name=3D7:'tfm_primary' \
-+        --new=3D7:272:+368K --typecode=3D7:$TFM_TYPE_UUID --partition-g=
uid=3D7:$(uuidgen) --change-name=3D7:'tfm_primary' \
-         --new=3D8:32784:+100k --typecode=3D8:$SE_BL2_TYPE_UUID --partit=
ion-guid=3D8:$(uuidgen) --change-name=3D8:'bl2_secondary' \
--        --new=3D9:32984:+376K --typecode=3D9:$TFM_TYPE_UUID --partition=
-guid=3D9:$(uuidgen) --change-name=3D9:'tfm_secondary' \
-+        --new=3D9:32984:+368K --typecode=3D9:$TFM_TYPE_UUID --partition=
-guid=3D9:$(uuidgen) --change-name=3D9:'tfm_secondary' \
-         --new=3D10:65496:65501  --partition-guid=3D10:$(uuidgen) --chan=
ge-name=3D10:'reserved_2' \
-         $IMAGE
-=20
- [ $? -ne 0 ] && echo "Error occurs while writing the GPT layout" && exi=
t 1
-=20
--# Write partitions=20
-+# Write partitions
- # conv=3Dnotrunc avoids truncation to keep the geometry of the image.
- dd if=3D$BIN_DIR/bl2_signed.bin of=3D${IMAGE}  seek=3D72 conv=3Dnotrunc
- dd if=3D$BIN_DIR/tfm_s_signed.bin of=3D${IMAGE} seek=3D272 conv=3Dnotru=
nc
-diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index 568c8de28..7fffd94c6 100644
---- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-+++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -134,7 +134,7 @@
-=20
- /* Bank configurations */
- #define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
--#define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
-+#define TFM_PARTITION_SIZE              (0x5C000)    /* 368 KB */
-=20
- /************************************************************/
- /* Bank : Images flash offsets are with respect to the bank */
-diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.=
h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-index 99e822f51..64ab786e5 100644
---- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
-+++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-@@ -1,8 +1,10 @@
- /*
-- * Copyright (c) 2017-2022 Arm Limited. All rights reserved.
-+ * Copyright (c) 2017-2023 Arm Limited. All rights reserved.
-  * Copyright (c) 2021-2023 Cypress Semiconductor Corporation (an Infine=
on company)
-  * or an affiliate of Cypress Semiconductor Corporation. All rights res=
erved.
-  *
-+ * SPDX-License-Identifier: Apache-2.0
-+ *
-  * Licensed under the Apache License, Version 2.0 (the "License");
-  * you may not use this file except in compliance with the License.
-  * You may obtain a copy of the License at
-@@ -53,7 +55,7 @@
-=20
- #define S_DATA_START            (SRAM_BASE + TFM_PARTITION_SIZE)
- #define S_DATA_SIZE             (SRAM_SIZE - TFM_PARTITION_SIZE)
--#define S_UNPRIV_DATA_SIZE      (0x2160)
-+#define S_UNPRIV_DATA_SIZE      (0x4000)
- #define S_DATA_LIMIT            (S_DATA_START + S_DATA_SIZE - 1)
- #define S_DATA_PRIV_START       (S_DATA_START + S_UNPRIV_DATA_SIZE)
-=20
-diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c b/=
platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
-index 01f7687bc..98e795dde 100644
---- a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
-+++ b/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2022, Arm Limited. All rights reserved.
-+ * Copyright (c) 2020-2023, Arm Limited. All rights reserved.
-  * Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon
-  * company) or an affiliate of Cypress Semiconductor Corporation. All r=
ights
-  * reserved.
-@@ -14,9 +14,11 @@
- #include "tfm_hal_isolation.h"
- #include "mpu_config.h"
- #include "mmio_defs.h"
-+#include "flash_layout.h"
-=20
- #define PROT_BOUNDARY_VAL \
-     ((1U << HANDLE_ATTR_PRIV_POS) & HANDLE_ATTR_PRIV_MASK)
-+#define MPU_REGION_MIN_SIZE (0x100)
-=20
- #ifdef CONFIG_TFM_ENABLE_MEMORY_PROTECT
-=20
-@@ -31,20 +33,38 @@ REGION_DECLARE(Image$$, TFM_SP_META_PTR, $$ZI$$Base)=
;
- REGION_DECLARE(Image$$, TFM_SP_META_PTR, $$ZI$$Limit);
- #endif /* CONFIG_TFM_PARTITION_META */
-=20
--static void configure_mpu(uint32_t rnr, uint32_t base, uint32_t limit,
--                          uint32_t is_xn_exec, uint32_t ap_permissions)
-+static enum tfm_hal_status_t configure_mpu(uint32_t rnr, uint32_t base,
-+                          uint32_t limit, uint32_t is_xn_exec, uint32_t=
 ap_permissions)
- {
--    uint32_t size; /* region size */
-+    uint32_t rbar_size_field; /* region size as it is used in the RBAR =
*/
-     uint32_t rasr; /* region attribute and size register */
-     uint32_t rbar; /* region base address register */
-=20
--    size =3D get_rbar_size_field(limit - base);
-+    rbar_size_field =3D get_rbar_size_field(limit - base);
-+
-+    /* The MPU region's base address has to be aligned to the region
-+     * size for a valid MPU configuration */
-+    if ((base % (1 << (rbar_size_field + 1))) !=3D 0) {
-+        return TFM_HAL_ERROR_INVALID_INPUT;
-+    }
-+
-+    /* The MPU supports only 8 memory regions */
-+    if (rnr > 7) {
-+        return TFM_HAL_ERROR_INVALID_INPUT;
-+    }
-+
-+    /* The minimum size for a region is 0x100 bytes */
-+    if((limit - base) < MPU_REGION_MIN_SIZE) {
-+        return TFM_HAL_ERROR_INVALID_INPUT;
-+    }
-=20
-     rasr =3D ARM_MPU_RASR(is_xn_exec, ap_permissions, TEX, NOT_SHAREABL=
E,
--            NOT_CACHEABLE, NOT_BUFFERABLE, SUB_REGION_DISABLE, size);
-+            NOT_CACHEABLE, NOT_BUFFERABLE, SUB_REGION_DISABLE, rbar_siz=
e_field);
-     rbar =3D base & MPU_RBAR_ADDR_Msk;
-=20
-     ARM_MPU_SetRegionEx(rnr, rbar, rasr);
-+
-+    return TFM_HAL_SUCCESS;
- }
-=20
- #endif /* CONFIG_TFM_ENABLE_MEMORY_PROTECT */
-@@ -56,33 +76,60 @@ enum tfm_hal_status_t tfm_hal_set_up_static_boundari=
es(
-     uint32_t rnr =3D TFM_ISOLATION_REGION_START_NUMBER; /* current regi=
on number */
-     uint32_t base; /* start address */
-     uint32_t limit; /* end address */
-+    enum tfm_hal_status_t ret;
-=20
-     ARM_MPU_Disable();
-=20
--    /* TFM Core unprivileged code region */
--    base =3D (uint32_t)&REGION_NAME(Image$$, TFM_UNPRIV_CODE_START, $$R=
O$$Base);
--    limit =3D (uint32_t)&REGION_NAME(Image$$, TFM_UNPRIV_CODE_END, $$RO=
$$Limit);
--
--    configure_mpu(rnr++, base, limit, XN_EXEC_OK, AP_RO_PRIV_UNPRIV);
--
--    /* RO region */
--    base =3D (uint32_t)&REGION_NAME(Image$$, TFM_APP_CODE_START, $$Base=
);
--    limit =3D (uint32_t)&REGION_NAME(Image$$, TFM_APP_CODE_END, $$Base)=
;
-+    /* Armv6-M MPU allows region overlapping. The region with the highe=
r RNR
-+     * will decide the attributes.
-+     *
-+     * The default attributes are set to XN_EXEC_OK and AP_RO_PRIV_UNPR=
IV for the
-+     * whole SRAM so the PSA_ROT_LINKER_CODE, TFM_UNPRIV_CODE and APP_R=
OT_LINKER_CODE
-+     * don't have to be aligned and memory space can be saved.
-+     * This region has the lowest RNR so the next regions can overwrite=
 these
-+     * attributes if it's needed.
-+     */
-+    base =3D SRAM_BASE;
-+    limit =3D SRAM_BASE + SRAM_SIZE;
-+
-+    ret =3D configure_mpu(rnr++, base, limit,
-+                            XN_EXEC_OK, AP_RW_PRIV_UNPRIV);
-+    if (ret !=3D TFM_HAL_SUCCESS) {
-+        return ret;
-+    }
-=20
--    configure_mpu(rnr++, base, limit, XN_EXEC_OK, AP_RO_PRIV_UNPRIV);
-=20
-     /* RW, ZI and stack as one region */
-     base =3D (uint32_t)&REGION_NAME(Image$$, TFM_APP_RW_STACK_START, $$=
Base);
-     limit =3D (uint32_t)&REGION_NAME(Image$$, TFM_APP_RW_STACK_END, $$B=
ase);
-=20
--    configure_mpu(rnr++, base, limit, XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV=
);
-+    /* The section size can be bigger than the alignment size, else the=
 code would
-+     * not fit into the memory. Because of this, the sections can use m=
ultiple MPU
-+     * regions. */
-+    do {
-+        ret =3D configure_mpu(rnr++, base, base + TFM_LINKER_APP_ROT_LI=
NKER_DATA_ALIGNMENT,
-+                                XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
-+        if (ret !=3D TFM_HAL_SUCCESS) {
-+            return ret;
-+        }
-+        base +=3D TFM_LINKER_APP_ROT_LINKER_DATA_ALIGNMENT;
-+    } while (base < limit);
-+
-=20
- #ifdef CONFIG_TFM_PARTITION_META
-     /* TFM partition metadata pointer region */
-     base =3D (uint32_t)&REGION_NAME(Image$$, TFM_SP_META_PTR, $$ZI$$Bas=
e);
-     limit =3D (uint32_t)&REGION_NAME(Image$$, TFM_SP_META_PTR, $$ZI$$Li=
mit);
-=20
--    configure_mpu(rnr++, base, limit, XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV=
);
-+    do {
-+        ret =3D configure_mpu(rnr++, base, base + TFM_LINKER_SP_META_PT=
R_ALIGNMENT,
-+                                XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
-+        if (ret !=3D TFM_HAL_SUCCESS) {
-+            return ret;
-+        }
-+        base +=3D TFM_LINKER_SP_META_PTR_ALIGNMENT;
-+    } while (base < limit);
-+
- #endif
-=20
-     arm_mpu_enable();
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-platform-corstone1000-align-capsule-update-structs.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-platform-co=
rstone1000-align-capsule-update-structs.patch
similarity index 94%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0003-platform-corstone1000-align-capsule-update-structs.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0001-platform-corstone1000-align-capsule-update-structs.patch
index 7aeecfa3..7a1e58c8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-platform-corstone1000-align-capsule-update-structs.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-platform-corstone1000-align-capsule-update-structs.patch
@@ -1,7 +1,7 @@
-From 6807d4b30f7d4ed32d3c54dfcaf3ace63eaa4f02 Mon Sep 17 00:00:00 2001
+From 0d454ea554c57247f5435c09ef99d70f169e041b Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Thu, 26 Oct 2023 11:46:04 +0100
-Subject: [PATCH] platform: corstone1000: align capsule update structs
+Subject: [PATCH 01/10] platform: corstone1000: align capsule update stru=
cts
=20
 U-boot mkefitool creates capsule image without packed and byte-aligned
 structs. This patch aligns the capsule-update structures and avoids
@@ -23,7 +23,7 @@ index c706c040ac..9f8d12ad4e 100644
      uint32_t                capsule_image_size;
 -} efi_capsule_header_t;
 +} efi_capsule_header_t __attribute__((packed, aligned(1)));
-
+=20
  typedef struct {
      uint32_t                version;
      uint16_t                embedded_driver_count;
@@ -31,7 +31,7 @@ index c706c040ac..9f8d12ad4e 100644
      uint64_t                item_offset_list[];
 -} efi_firmware_management_capsule_header_t;
 +} efi_firmware_management_capsule_header_t __attribute__((packed, align=
ed(1)));
-
+=20
  typedef struct {
      uint32_t                version;
 @@ -52,14 +52,14 @@ typedef struct {
@@ -40,7 +40,7 @@ index c706c040ac..9f8d12ad4e 100644
      uint64_t                image_capsule_support; //introduced in v3
 -} efi_firmware_management_capsule_image_header_t;
 +} efi_firmware_management_capsule_image_header_t __attribute__((packed,=
 aligned(1)));
-
+=20
  typedef struct {
      uint32_t                signature;
      uint32_t                header_size;
@@ -48,31 +48,31 @@ index c706c040ac..9f8d12ad4e 100644
      uint32_t                lowest_supported_version;
 -} fmp_payload_header_t;
 +} fmp_payload_header_t __attribute__((packed, aligned(1)));
-
+=20
  #define ANYSIZE_ARRAY 0
-
+=20
 @@ -68,18 +68,18 @@ typedef struct {
      uint16_t                wRevision;
      uint16_t                wCertificateType;
      uint8_t                 bCertificate[ANYSIZE_ARRAY];
 -} WIN_CERTIFICATE;
 +} WIN_CERTIFICATE __attribute__((packed, aligned(1)));
-
+=20
  typedef struct {
      WIN_CERTIFICATE         hdr;
      struct efi_guid         cert_type;
      uint8_t                 cert_data[ANYSIZE_ARRAY];
 -} win_certificate_uefi_guid_t;
 +} win_certificate_uefi_guid_t __attribute__((packed, aligned(1)));
-
+=20
  typedef struct {
      uint64_t                    monotonic_count;
      win_certificate_uefi_guid_t   auth_info;
 -} efi_firmware_image_authentication_t;
 +} efi_firmware_image_authentication_t __attribute__((packed, aligned(1)=
));
-
-
+=20
+=20
  enum uefi_capsule_error_t uefi_capsule_retrieve_images(void* capsule_pt=
r,
---
+--=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0004-Platform-Corstone1000-skip-the-first-nv-counter.patch b/meta-arm-=
bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-Corst=
one1000-skip-the-first-nv-counter.patch
similarity index 80%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0004-Platform-Corstone1000-skip-the-first-nv-counter.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0002-Platform-Corstone1000-skip-the-first-nv-counter.patch
index 4c486e69..a33ac437 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-Platform-Corstone1000-skip-the-first-nv-counter.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-Corstone1000-skip-the-first-nv-counter.patch
@@ -1,7 +1,7 @@
-From 001e5bea183bc78352ac3ba6283d9d7912bb6ea5 Mon Sep 17 00:00:00 2001
+From b6cb92b0618afe849a8c975d5f7391610724cff2 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <Emekcan.Aras@arm.com>
 Date: Wed, 21 Feb 2024 07:44:25 +0000
-Subject: [PATCH] Platform: Corstone1000: skip the first nv counter
+Subject: [PATCH 02/10] Platform: Corstone1000: skip the first nv counter
=20
 It skips doing a sanity check the BL2 nv counter after the capsule
 update since the tfm bl1 does not sync metadata and nv counters in OTP d=
uring
@@ -9,16 +9,15 @@ the boot anymore.
=20
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
 Upstream-Status: Pending
-
 ---
  .../ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c     | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index 2e6de255b..2e6cf8047 100644
+index a4747f2212..003ab9faf8 100644
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
 +++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -1125,7 +1125,7 @@ static enum fwu_agent_error_t update_nv_counters(
+@@ -1122,7 +1122,7 @@ static enum fwu_agent_error_t update_nv_counters(
 =20
      FWU_LOG_MSG("%s: enter\n\r", __func__);
 =20
@@ -30,4 +29,3 @@ index 2e6de255b..2e6cf8047 100644
 --=20
 2.25.1
=20
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-platform-corstone1000-Cover-S_DATA-with-MPU.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0002-platform-corstone1=
000-Cover-S_DATA-with-MPU.patch
deleted file mode 100644
index 6676acf8..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-platform-corstone1000-Cover-S_DATA-with-MPU.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From ca7696bca357cfd71a34582c65a7c7c08828b6dc Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Mon, 18 Dec 2023 14:00:14 +0100
-Subject: [PATCH 2/2] platform: corstone1000: Cover S_DATA with MPU
-
-The S_DATA has to be covered with MPU regions to override the
-other MPU regions with smaller RNR values.
-
-Change-Id: I45fec65f51241939314941e25d287e6fdc82777c
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/25583]
-
----
- .../target/arm/corstone1000/CMakeLists.txt    |  8 +++++++
- .../arm/corstone1000/tfm_hal_isolation.c      | 22 +++++++++++++++++++
- 2 files changed, 30 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 8817f514c..541504368 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -40,6 +40,14 @@ target_compile_definitions(platform_region_defs
-     INTERFACE
-         TFM_LINKER_APP_ROT_LINKER_DATA_ALIGNMENT=3D0x2000
-         TFM_LINKER_SP_META_PTR_ALIGNMENT=3D0x100
-+
-+        # The RAM MPU Region block sizes are calculated manually. The R=
AM has to be covered
-+        # with the MPU regions. These regions also have to be the power=
 of 2 and
-+        # the start addresses have to be aligned to these sizes. The si=
zes can be calculated
-+        # from the S_DATA_START and S_DATA_SIZE defines.
-+        RAM_MPU_REGION_BLOCK_1_SIZE=3D0x4000
-+        RAM_MPU_REGION_BLOCK_2_SIZE=3D0x20000
-+
- )
- #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform common defs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
-=20
-diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c b/=
platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
-index 98e795dde..39b19c535 100644
---- a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
-+++ b/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
-@@ -15,6 +15,7 @@
- #include "mpu_config.h"
- #include "mmio_defs.h"
- #include "flash_layout.h"
-+#include "region_defs.h"
-=20
- #define PROT_BOUNDARY_VAL \
-     ((1U << HANDLE_ATTR_PRIV_POS) & HANDLE_ATTR_PRIV_MASK)
-@@ -132,6 +133,27 @@ enum tfm_hal_status_t tfm_hal_set_up_static_boundar=
ies(
-=20
- #endif
-=20
-+    /* Set the RAM attributes. It is needed because the first region ov=
erlaps the whole
-+     * SRAM and it has to be overridden.
-+     * The RAM_MPU_REGION_BLOCK_1_SIZE and RAM_MPU_REGION_BLOCK_2_SIZE =
are calculated manually
-+     * and added to the platform_region_defs compile definitions.
-+     */
-+    base =3D S_DATA_START;
-+    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
-+    ret =3D configure_mpu(rnr++, base, limit,
-+                            XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
-+    if (ret !=3D TFM_HAL_SUCCESS) {
-+        return ret;
-+    }
-+
-+    base =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
-+    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE + RAM_MPU_REGI=
ON_BLOCK_2_SIZE;
-+    ret =3D configure_mpu(rnr++, base, limit,
-+                            XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
-+    if (ret !=3D TFM_HAL_SUCCESS) {
-+        return ret;
-+    }
-+
-     arm_mpu_enable();
-=20
- #endif /* CONFIG_TFM_ENABLE_MEMORY_PROTECT */
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-platform-corstone1000-add-unique-guid-for-mps3.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-platform-corsto=
ne1000-add-unique-guid-for-mps3.patch
similarity index 88%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0005-platform-corstone1000-add-unique-guid-for-mps3.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0003-platform-corstone1000-add-unique-guid-for-mps3.patch
index 3711b8ce..b153b8da 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-platform-corstone1000-add-unique-guid-for-mps3.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-platform-corstone1000-add-unique-guid-for-mps3.patch
@@ -1,7 +1,7 @@
-From 3d35eb08fe0cea5c4b882c448f44530bb45c05f0 Mon Sep 17 00:00:00 2001
+From a32e7195a4fc1c9d890f9e22a795443d01dc1e8f Mon Sep 17 00:00:00 2001
 From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
 Date: Tue, 2 Apr 2024 13:04:56 +0000
-Subject: [PATCH] platform: corstone1000: add unique guid for mps3
+Subject: [PATCH 03/10] platform: corstone1000: add unique guid for mps3
=20
 This patch sets unique GUID for Corstone1000 FVP and MPS3
=20
@@ -12,7 +12,7 @@ Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttam=
azumder@arm.com>
  1 file changed, 7 insertions(+), 1 deletion(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index 2e6cf80470..be04e0e5df 100644
+index 003ab9faf8..5768df19b8 100644
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
 +++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
 @@ -113,13 +113,19 @@ enum fwu_agent_state_t {
@@ -37,5 +37,5 @@ index 2e6cf80470..be04e0e5df 100644
  #define IMAGE_NOT_ACCEPTED      (0)
  #define BANK_0                  (0)
 --=20
-2.38.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-Cor=
stone1000-Enable-host-firewall-in-FVP.patch
similarity index 96%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0006-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0004-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch
index 4f15da22..c947888d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch
@@ -1,7 +1,7 @@
-From 1410dc5504d60219279581b1cf6442f81551cfe7 Mon Sep 17 00:00:00 2001
+From a4e037b3bcf34982b8bdaf8693fd0f89d4f7fc87 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <Emekcan.Aras@arm.com>
 Date: Wed, 3 Apr 2024 13:37:40 +0100
-Subject: [PATCH] Platform: Corstone1000: Enable host firewall in FVP
+Subject: [PATCH 04/10] Platform: Corstone1000: Enable host firewall in F=
VP
=20
 Enables host firewall and mpu setup for FVP. It also fixes secure-ram
 configuration and disable access rights to secure ram from both normal w=
orld
@@ -16,7 +16,7 @@ Upstream-Status: Pending [Not submitted to upstream yet=
]
  3 files changed, 11 insertions(+), 35 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/Device/Include/platfor=
m_base_address.h b/platform/ext/target/arm/corstone1000/Device/Include/pl=
atform_base_address.h
-index 416f0ebcd..101cad9e7 100644
+index 416f0ebcdb..101cad9e7c 100644
 --- a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
 +++ b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
 @@ -67,7 +67,7 @@
@@ -29,7 +29,7 @@ index 416f0ebcd..101cad9e7 100644
  #define CORSTONE1000_HOST_BASE_SYSTEM_CONTROL_BASE (0x7A010000U) /* Hos=
t SCB                          */
  #define CORSTONE1000_EXT_SYS_RESET_REG             (0x7A010310U) /* ext=
ernal system (cortex-M3)       */
 diff --git a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c b=
/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
-index a5fee66af..7988c2392 100644
+index 45d6768215..2f693d2b1b 100644
 --- a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
 +++ b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
 @@ -35,7 +35,7 @@ REGION_DECLARE(Image$$, ER_DATA, $$Base)[];
@@ -159,7 +159,7 @@ index a5fee66af..7988c2392 100644
  #if defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TEST_BL1=
_2)
      stdio_init();
 diff --git a/platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c b/=
platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
-index 2b1cdfa19..06cc3f0f5 100644
+index 2b1cdfa199..06cc3f0f52 100644
 --- a/platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
 +++ b/platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
 @@ -70,7 +70,7 @@ int boot_get_image_exec_ram_info(uint32_t image_id,
@@ -174,4 +174,3 @@ index 2b1cdfa19..06cc3f0f5 100644
 --=20
 2.25.1
=20
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0007-platform-corstone1000-Increase-ITS-max-asset-size.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-platform-cor=
stone1000-Increase-ITS-max-asset-size.patch
similarity index 86%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0007-platform-corstone1000-Increase-ITS-max-asset-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0005-platform-corstone1000-Increase-ITS-max-asset-size.patch
index e831f034..160015fb 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-platform-corstone1000-Increase-ITS-max-asset-size.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-platform-corstone1000-Increase-ITS-max-asset-size.patch
@@ -1,7 +1,7 @@
-From 2edf197735bd0efb1428c1710443dddcb376d930 Mon Sep 17 00:00:00 2001
+From 5b5c190ff91f387e4709950b6c734cda16c4b32d Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Wed, 17 Apr 2024 11:34:45 +0000
-Subject: [PATCH] platform: corstone1000: Increase ITS max asset size
+Subject: [PATCH 05/10] platform: corstone1000: Increase ITS max asset si=
ze
=20
 Increases the max asset size for ITS to enable parsec services & tests
 =E2=80=8B
@@ -25,3 +25,6 @@ index 2c7341afd4..2eb0924770 100644
 +#define ITS_MAX_ASSET_SIZE   2048
 +
  #endif /* __CONFIG_TFM_TARGET_H__ */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-platform-=
corstone1000-Increase-RSE_COMMS-buffer-size.patch
similarity index 71%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0009-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0006-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch
index 3269c0e0..1e79f9fd 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch
@@ -1,7 +1,7 @@
-From 21b0c9f028b6b04fa2f027510ec90969735f4dd1 Mon Sep 17 00:00:00 2001
+From 05611d5a55ac8858d07c64e48699100700578b80 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 17 Apr 2024 19:31:03 +0200
-Subject: [PATCH] platform: corstone1000: Increase RSE_COMMS buffer size
+Date: Fri, 5 Jul 2024 21:18:08 +0200
+Subject: [PATCH 06/10] platform: corstone1000: Increase RSE_COMMS buffer=
 size
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
 Upstream-Status: Pending
@@ -10,13 +10,13 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h =
b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
-index 6d79dd3bf..f079f6504 100644
+index 41e5c2bc34..b89460ea93 100644
 --- a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
 +++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
 @@ -16,7 +16,7 @@ extern "C" {
  #endif
 =20
-  /* size suits to fit the largest message too (EFI variables) */
+ /* size suits to fit the largest message too (EFI variables) */
 -#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x2100)
 +#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x43C0)
 =20
@@ -25,4 +25,3 @@ index 6d79dd3bf..f079f6504 100644
 --=20
 2.25.1
=20
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0010-CC312-alignment-of-cc312-differences-between-fvp-and.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-CC312-ali=
gnment-of-cc312-differences-between-fvp-and.patch
similarity index 80%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0010-CC312-alignment-of-cc312-differences-between-fvp-and.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0007-CC312-alignment-of-cc312-differences-between-fvp-and.patch
index 3d1b35e4..45d7049c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-CC312-alignment-of-cc312-differences-between-fvp-and.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-CC312-alignment-of-cc312-differences-between-fvp-and.patch
@@ -1,22 +1,21 @@
-From a8aeaafd6c26d6bc3066164d12aabc5cb754fe1c Mon Sep 17 00:00:00 2001
+From 60ab8bbf85e9e84afd23948a71cf84c69f4aad7a Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Wed, 15 May 2024 12:12:15 +0000
-Subject: [PATCH] CC312: alignment of cc312 differences between fvp and m=
ps3
- corstone1000 platforms
+Subject: [PATCH 07/10] CC312: alignment of cc312 differences between fvp=
 and
+ mps3 corstone1000 platforms
=20
-Configures CC312 mps3 model same as predefined cc312 FVP=20
+Configures CC312 mps3 model same as predefined cc312 FVP
 configuration while keeping debug ports closed.
=20
 Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
=20
 Upstream-Status: Inappropriate [Requires an aligment cc3xx with mps3 hw =
and fvp sw models]
-
 ---
  lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c | 3 +++
  1 file changed, 3 insertions(+)
=20
 diff --git a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c b=
/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
-index 31e4332be..4d7e6fa61 100644
+index 31e4332bed..4b08c02526 100644
 --- a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
 +++ b/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
 @@ -207,6 +207,9 @@ CClibRetCode_t CC_LibInit(CCRndContext_t *rndContext=
_ptr, CCRndWorkBuff_t  *rndW
@@ -29,3 +28,6 @@ index 31e4332be..4d7e6fa61 100644
      /* turn off the DFA since Cerberus doen't support it */
      reg =3D CC_HAL_READ_REGISTER(CC_REG_OFFSET(HOST_RGF, HOST_AO_LOCK_B=
ITS));
      CC_REG_FLD_SET(0, HOST_AO_LOCK_BITS, HOST_FORCE_DFA_ENABLE, reg, 0x=
0);
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-Platform-CS1000-Replace-OpenAMP-with-RSE_COMMS.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-CS1000=
-Replace-OpenAMP-with-RSE_COMMS.patch
deleted file mode 100644
index 3e0acbe3..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-Platform-CS1000-Replace-OpenAMP-with-RSE_COMMS.patch
+++ /dev/null
@@ -1,3620 +0,0 @@
-From 5e0e5207fe7edf7f9b47f0800388c7b3c9d69a1c Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Mon, 26 Feb 2024 10:20:54 +0100
-Subject: [PATCH] Platform: CS1000: Replace OpenAMP with RSE_COMMS
-
-The RSE_COMMS files were copied from the arm/rse platform (e7fcf4e0)
-Did not copy the ATU and pointer access protocol related files as
-they are not supported yet in Corstone-1000.
-
-There were some modifications in the files:
-- Remove ATU support because Corstone-1000 doesn't have ATU
-- Update and extend platform specific memory and permission checks
-- Remove Armv8.1-M specific calls
-
-The OpenAMP related files were removed from Corstone-1000.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [75a980b37fb726dff8720b50de121c8196b70e4e]
----
- docs/platform/arm/corstone1000/readme.rst     |   5 +-
- .../target/arm/corstone1000/CMakeLists.txt    |   5 +-
- .../arm/corstone1000/Native_Driver/mhu.h      | 140 +++++++
- .../Native_Driver/mhu_wrapper_v2_x.c          | 353 ++++++++++++++++++
- .../ext/target/arm/corstone1000/config.cmake  |   8 -
- .../arm/corstone1000/openamp/CMakeLists.txt   |  57 ---
- ...ogger-when-the-build-type-is-release.patch |  27 --
- .../openamp/ext/libmetal/CMakeLists.txt       |  23 --
- .../openamp/ext/libopenamp/CMakeLists.txt     |  21 --
- .../openamp/platform_spe_dual_core_hal.c      | 152 --------
- .../corstone1000/openamp/tfm_openamp_lib.h    | 128 -------
- .../tfm_spe_dual_core_psa_client_secure_lib.c | 304 ---------------
- .../tfm_spe_dual_core_psa_client_secure_lib.h |  39 --
- .../openamp/tfm_spe_openamp_interface.h       |  39 --
- .../openamp/tfm_spe_openamp_interface_impl.c  | 248 ------------
- .../tfm_spe_openamp_platform_interconnect.c   | 114 ------
- .../tfm_spe_openamp_platform_interface.h      |  31 --
- .../tfm_spe_psa_client_lib_unordered_map.c    | 151 --------
- .../tfm_spe_psa_client_lib_unordered_map.h    |  50 ---
- .../openamp/tfm_spe_shm_openamp.h             |  39 --
- .../arm/corstone1000/partition/region_defs.h  |  12 +-
- .../arm/corstone1000/rse_comms/CMakeLists.txt |  34 ++
- .../arm/corstone1000/rse_comms/rse_comms.c    | 176 +++++++++
- .../arm/corstone1000/rse_comms/rse_comms.h    |  48 +++
- .../corstone1000/rse_comms/rse_comms_hal.c    | 232 ++++++++++++
- .../corstone1000/rse_comms/rse_comms_hal.h    |  56 +++
- .../rse_comms/rse_comms_permissions_hal.h     |  58 +++
- .../rse_comms/rse_comms_protocol.c            | 120 ++++++
- .../rse_comms/rse_comms_protocol.h            | 129 +++++++
- .../rse_comms/rse_comms_protocol_embed.c      | 105 ++++++
- .../rse_comms/rse_comms_protocol_embed.h      |  50 +++
- .../corstone1000/rse_comms/rse_comms_queue.c  |  64 ++++
- .../corstone1000/rse_comms/rse_comms_queue.h  |  25 ++
- .../corstone1000/rse_comms_permissions_hal.c  | 177 +++++++++
- .../target/arm/corstone1000/tfm_interrupts.c  |  51 +++
- 35 files changed, 1831 insertions(+), 1440 deletions(-)
- create mode 100644 platform/ext/target/arm/corstone1000/Native_Driver/m=
hu.h
- create mode 100644 platform/ext/target/arm/corstone1000/Native_Driver/m=
hu_wrapper_v2_x.c
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/CMakeLi=
sts.txt
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/ext/lib=
metal/0001-Disable-logger-when-the-build-type-is-release.patch
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/ext/lib=
metal/CMakeLists.txt
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/ext/lib=
openamp/CMakeLists.txt
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/platfor=
m_spe_dual_core_hal.c
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/tfm_ope=
namp_lib.h
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/tfm_spe=
_dual_core_psa_client_secure_lib.c
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/tfm_spe=
_dual_core_psa_client_secure_lib.h
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/tfm_spe=
_openamp_interface.h
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/tfm_spe=
_openamp_interface_impl.c
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/tfm_spe=
_openamp_platform_interconnect.c
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/tfm_spe=
_openamp_platform_interface.h
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/tfm_spe=
_psa_client_lib_unordered_map.c
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/tfm_spe=
_psa_client_lib_unordered_map.h
- delete mode 100644 platform/ext/target/arm/corstone1000/openamp/tfm_spe=
_shm_openamp.h
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/CMake=
Lists.txt
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms.c
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms.h
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms_hal.c
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms_hal.h
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms_permissions_hal.h
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms_protocol.c
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms_protocol.h
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms_protocol_embed.c
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms_protocol_embed.h
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms_queue.c
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms/rse_c=
omms_queue.h
- create mode 100644 platform/ext/target/arm/corstone1000/rse_comms_permi=
ssions_hal.c
- create mode 100644 platform/ext/target/arm/corstone1000/tfm_interrupts.=
c
-
-diff --git a/docs/platform/arm/corstone1000/readme.rst b/docs/platform/a=
rm/corstone1000/readme.rst
-index 59b167d8f..d46a6460e 100644
---- a/docs/platform/arm/corstone1000/readme.rst
-+++ b/docs/platform/arm/corstone1000/readme.rst
-@@ -19,7 +19,8 @@ and boots the software ecosystem based on linux, u-boo=
t, UEFI run time
- services, TF-A, Secure Partitions and Optee.
-=20
- The communication between NSPE and SPE is based on PSA IPC protocol run=
ning on
--top of FF-A/OpenAMP.
-+top of the RSE communication protocol. The Corstone-1000 supports only =
the
-+`Embed protocol`, and the ATU support is removed.
-=20
- .. toctree::
-     :maxdepth: 1
-@@ -116,7 +117,7 @@ Other test configurations are:
- - -DTEST_S_PS=3DON/OFF
- - -DTEST_S_PLATFORM=3DON/OFF
-=20
--*Copyright (c) 2021-2023, Arm Limited. All rights reserved.*
-+*Copyright (c) 2021-2024, Arm Limited. All rights reserved.*
-=20
- .. _Arm Ecosystem FVPs: https://developer.arm.com/tools-and-software/op=
en-source-software/arm-platforms-software/arm-ecosystem-fvps
- .. _Arm Corstone-1000 User Guide: https://corstone1000.docs.arm.com/en/=
corstone1000-2022.11.23/user-guide.html
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 541504368..e2a7ac302 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -87,7 +87,7 @@ target_add_scatter_file(bl1_2
-=20
- #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform Secure =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
-=20
--add_subdirectory(openamp)
-+add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/rse_comms rse_comms)
-=20
- add_subdirectory(${PLATFORM_DIR}/ext/accelerator/cc312/cc312-rom cc312-=
rom)
-=20
-@@ -124,6 +124,7 @@ target_sources(platform_s
-         Device/Source/system_core_init.c
-         ${PLATFORM_DIR}/ext/target/arm/drivers/usart/pl011/uart_pl011_d=
rv.c
-         Native_Driver/mhu_v2_x.c
-+        Native_Driver/mhu_wrapper_v2_x.c
-         Native_Driver/watchdog.c
-         Native_Driver/arm_watchdog_drv.c
-         $<$<BOOL:TFM_PARTITION_PLATFORM>:${CMAKE_CURRENT_SOURCE_DIR}/se=
rvices/src/tfm_platform_system.c>
-@@ -137,6 +138,7 @@ target_sources(platform_s
-         partition/partition.c
-         partition/gpt.c
-         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
-+        rse_comms_permissions_hal.c
- )
-=20
- if (PLATFORM_IS_FVP)
-@@ -376,6 +378,7 @@ target_sources(tfm_psa_rot_partition_ns_agent_mailbo=
x
-=20
- target_sources(tfm_spm
-     PRIVATE
-+        tfm_interrupts.c
-         tfm_hal_isolation.c
-         tfm_hal_platform.c
-         $<$<BOOL:${TFM_S_REG_TEST}>:${CMAKE_CURRENT_SOURCE_DIR}/target_=
cfg.c>
-diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/mhu.h b/=
platform/ext/target/arm/corstone1000/Native_Driver/mhu.h
-new file mode 100644
-index 000000000..a02fdd883
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/Native_Driver/mhu.h
-@@ -0,0 +1,140 @@
-+/*
-+ * Copyright (c) 2022-2023 Arm Limited. All rights reserved.
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *     http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#ifndef __MHU_H__
-+#define __MHU_H__
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * Generic MHU error enumeration types.
-+ */
-+enum mhu_error_t {
-+    MHU_ERR_NONE                =3D  0,
-+    MHU_ERR_NOT_INIT            =3D -1,
-+    MHU_ERR_ALREADY_INIT        =3D -2,
-+    MHU_ERR_UNSUPPORTED_VERSION =3D -3,
-+    MHU_ERR_UNSUPPORTED         =3D -4,
-+    MHU_ERR_INVALID_ARG         =3D -5,
-+    MHU_ERR_BUFFER_TOO_SMALL    =3D -6,
-+    MHU_ERR_GENERAL             =3D -7,
-+};
-+
-+/**
-+ * \brief Initializes sender MHU.
-+ *
-+ * \param[in] mhu_sender_dev        Pointer to the sender MHU.
-+ *
-+ * \return Returns mhu_error_t error code.
-+ *
-+ * \note This function must be called before mhu_send_data().
-+ */
-+enum mhu_error_t mhu_init_sender(void *mhu_sender_dev);
-+
-+/**
-+ * \brief Initializes receiver MHU.
-+ *
-+ * \param[in] mhu_receiver_dev      Pointer to the receiver MHU.
-+ *
-+ * \return Returns mhu_error_t error code.
-+ *
-+ * \note This function must be called before mhu_receive_data().
-+ */
-+enum mhu_error_t mhu_init_receiver(void *mhu_receiver_dev);
-+
-+/**
-+ * \brief Sends data over MHU.
-+ *
-+ * \param[in] mhu_sender_dev  Pointer to the sender MHU.
-+ * \param[in] send_buffer     Pointer to buffer containing the data to =
be
-+ *                            transmitted.
-+ * \param[in] size            Size of the data to be transmitted in byt=
es.
-+ *
-+ * \return Returns mhu_error_t error code.
-+ *
-+ * \note The send_buffer must be 4-byte aligned and its length must be =
at least
-+ *       (4 - (size % 4)) bytes bigger than the data size to prevent bu=
ffer
-+ *       over-reading.
-+ */
-+enum mhu_error_t mhu_send_data(void *mhu_sender_dev,
-+                               const uint8_t *send_buffer,
-+                               size_t size);
-+
-+/**
-+ * \brief Wait for data from MHU.
-+ *
-+ * \param[in]     mhu_receiver_dev  Pointer to the receiver MHU.
-+ *
-+ * \return Returns mhu_error_t error code.
-+ *
-+ * \note This function must be called before mhu_receive_data() if the =
MHU
-+ *       receiver interrupt is not used.
-+ */
-+enum mhu_error_t mhu_wait_data(void *mhu_receiver_dev);
-+
-+/**
-+ * \brief Receives data from MHU.
-+ *
-+ * \param[in]     mhu_receiver_dev  Pointer to the receiver MHU.
-+ * \param[out]    receive_buffer    Pointer the buffer where to store t=
he
-+ *                                  received data.
-+ * \param[in,out] size              As input the size of the receive_bu=
ffer,
-+ *                                  as output the number of bytes recei=
ved.
-+ *                                  As a limitation, the size of the bu=
ffer
-+ *                                  must be a multiple of 4.
-+ *
-+ * \return Returns mhu_error_t error code.
-+ *
-+ * \note The receive_buffer must be 4-byte aligned and its length must =
be a
-+ *       multiple of 4.
-+ */
-+enum mhu_error_t mhu_receive_data(void *mhu_receiver_dev,
-+                                  uint8_t *receive_buffer,
-+                                  size_t *size);
-+
-+/**
-+ * \brief Signals an interrupt over the last available channel and wait=
 for the
-+ *        values to be cleared by the receiver.
-+ *
-+ * \param[in]     mhu_sender_dev   Pointer to the sender MHU.
-+ * \param[in]     value            Value that will be used while signal=
ing.
-+ *
-+ * \return Returns mhu_error_t error code.
-+ */
-+enum mhu_error_t signal_and_wait_for_clear(void *mhu_sender_dev,
-+                                           uint32_t value);
-+
-+/**
-+ * \brief Wait for signal on the last available channel in a loop and
-+ *        acknowledge the transfer by clearing the status on that chann=
el.
-+ *
-+ * \param[in]     mhu_receiver_dev Pointer to the receiver MHU.
-+ * \param[in]     value            Value that will be used while waitin=
g.
-+ *
-+ * \return Returns mhu_error_t error code.
-+ */
-+enum mhu_error_t wait_for_signal_and_clear(void *mhu_receiver_dev,
-+                                           uint32_t value);
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __MHU_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/mhu_wrap=
per_v2_x.c b/platform/ext/target/arm/corstone1000/Native_Driver/mhu_wrapp=
er_v2_x.c
-new file mode 100644
-index 000000000..f749f7661
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/Native_Driver/mhu_wrapper_v2_=
x.c
-@@ -0,0 +1,353 @@
-+/*
-+ * Copyright (c) 2022-2023 Arm Limited. All rights reserved.
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *     http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+#include "mhu.h"
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+
-+#include "mhu_v2_x.h"
-+
-+#define MHU_NOTIFY_VALUE    (1234u)
-+
-+static enum mhu_error_t
-+error_mapping_to_mhu_error_t(enum mhu_v2_x_error_t err)
-+{
-+    switch (err) {
-+    case MHU_V_2_X_ERR_NONE:
-+        return MHU_ERR_NONE;
-+    case MHU_V_2_X_ERR_NOT_INIT:
-+        return MHU_ERR_NOT_INIT;
-+    case MHU_V_2_X_ERR_ALREADY_INIT:
-+        return MHU_ERR_ALREADY_INIT;
-+    case MHU_V_2_X_ERR_UNSUPPORTED_VERSION:
-+        return MHU_ERR_UNSUPPORTED_VERSION;
-+    case MHU_V_2_X_ERR_INVALID_ARG:
-+        return MHU_ERR_INVALID_ARG;
-+    case MHU_V_2_X_ERR_GENERAL:
-+        return MHU_ERR_GENERAL;
-+    default:
-+        return MHU_ERR_GENERAL;
-+    }
-+}
-+
-+enum mhu_error_t
-+signal_and_wait_for_clear(void *mhu_sender_dev, uint32_t value)
-+{
-+    enum mhu_v2_x_error_t err;
-+    struct mhu_v2_x_dev_t *dev;
-+    uint32_t channel_notify;
-+    uint32_t wait_val;
-+
-+    if (mhu_sender_dev =3D=3D NULL) {
-+        return MHU_ERR_INVALID_ARG;
-+    }
-+
-+    dev =3D (struct mhu_v2_x_dev_t *)mhu_sender_dev;
-+
-+    /* Use the last channel for notifications */
-+    channel_notify =3D mhu_v2_x_get_num_channel_implemented(dev) - 1;
-+
-+    /* FIXME: Avoid wasting a whole channel for notifying */
-+    err =3D mhu_v2_x_channel_send(dev, channel_notify, value);
-+    if (err !=3D MHU_V_2_X_ERR_NONE) {
-+        return error_mapping_to_mhu_error_t(err);
-+    }
-+
-+    do {
-+        err =3D mhu_v2_x_channel_poll(dev, channel_notify, &wait_val);
-+        if (err !=3D MHU_V_2_X_ERR_NONE) {
-+            break;
-+        }
-+    } while (wait_val !=3D 0);
-+
-+    return error_mapping_to_mhu_error_t(err);
-+}
-+
-+enum mhu_error_t
-+wait_for_signal_and_clear(void *mhu_receiver_dev, uint32_t value)
-+{
-+    enum mhu_v2_x_error_t err;
-+    struct mhu_v2_x_dev_t *dev;
-+    uint32_t channel_notify;
-+    uint32_t wait_val;
-+
-+    if (mhu_receiver_dev =3D=3D NULL) {
-+        return MHU_ERR_INVALID_ARG;
-+    }
-+
-+    dev =3D (struct mhu_v2_x_dev_t *)mhu_receiver_dev;
-+
-+    /* Use the last channel for notifications */
-+    channel_notify =3D mhu_v2_x_get_num_channel_implemented(dev) - 1;
-+
-+    do {
-+        /* Using the last channel for notifications */
-+        err =3D mhu_v2_x_channel_receive(dev, channel_notify, &wait_val=
);
-+        if (err !=3D MHU_V_2_X_ERR_NONE) {
-+            return error_mapping_to_mhu_error_t(err);
-+        }
-+    } while (wait_val !=3D value);
-+
-+    /* Clear the last channel */
-+    err =3D mhu_v2_x_channel_clear(dev, channel_notify);
-+
-+    return error_mapping_to_mhu_error_t(err);
-+}
-+
-+static enum mhu_v2_x_error_t
-+clear_and_wait_for_signal(struct mhu_v2_x_dev_t *dev)
-+{
-+    enum mhu_v2_x_error_t err;
-+    uint32_t num_channels =3D mhu_v2_x_get_num_channel_implemented(dev)=
;
-+    uint32_t val, i;
-+
-+    /* Clear all channels */
-+    for (i =3D 0; i < num_channels; ++i) {
-+        err =3D mhu_v2_x_channel_clear(dev, i);
-+        if (err !=3D MHU_V_2_X_ERR_NONE) {
-+            return err;
-+        }
-+    }
-+
-+    do {
-+        /* Using the last channel for notifications */
-+        err =3D mhu_v2_x_channel_receive(dev, num_channels - 1, &val);
-+        if (err !=3D MHU_V_2_X_ERR_NONE) {
-+            break;
-+        }
-+    } while (val !=3D MHU_NOTIFY_VALUE);
-+
-+    return err;
-+}
-+
-+enum mhu_error_t mhu_init_sender(void *mhu_sender_dev)
-+{
-+    enum mhu_v2_x_error_t err;
-+    struct mhu_v2_x_dev_t *dev =3D mhu_sender_dev;
-+
-+    if (dev =3D=3D NULL) {
-+        return MHU_ERR_INVALID_ARG;
-+    }
-+
-+    err =3D mhu_v2_x_driver_init(dev, MHU_REV_READ_FROM_HW);
-+    if (err !=3D MHU_V_2_X_ERR_NONE) {
-+        return error_mapping_to_mhu_error_t(err);
-+    }
-+
-+    /* This wrapper requires at least two channels to be implemented */
-+    if (mhu_v2_x_get_num_channel_implemented(dev) < 2) {
-+        return MHU_ERR_UNSUPPORTED;
-+    }
-+
-+    return MHU_ERR_NONE;
-+}
-+
-+enum mhu_error_t mhu_init_receiver(void *mhu_receiver_dev)
-+{
-+    enum mhu_v2_x_error_t err;
-+    struct mhu_v2_x_dev_t *dev =3D mhu_receiver_dev;
-+    uint32_t num_channels, i;
-+
-+    if (dev =3D=3D NULL) {
-+        return MHU_ERR_INVALID_ARG;
-+    }
-+
-+    err =3D mhu_v2_x_driver_init(dev, MHU_REV_READ_FROM_HW);
-+    if (err !=3D MHU_V_2_X_ERR_NONE) {
-+        return error_mapping_to_mhu_error_t(err);
-+    }
-+
-+    num_channels =3D mhu_v2_x_get_num_channel_implemented(dev);
-+
-+    /* This wrapper requires at least two channels to be implemented */
-+    if (num_channels < 2) {
-+        return MHU_ERR_UNSUPPORTED;
-+    }
-+
-+    /* Mask all channels except the notifying channel */
-+    for (i =3D 0; i < (num_channels - 1); ++i) {
-+        err =3D mhu_v2_x_channel_mask_set(dev, i, UINT32_MAX);
-+        if (err !=3D MHU_V_2_X_ERR_NONE) {
-+            return error_mapping_to_mhu_error_t(err);
-+        }
-+    }
-+
-+    /* The last channel is used for notifications */
-+    err =3D mhu_v2_x_channel_mask_clear(dev, (num_channels - 1), UINT32=
_MAX);
-+    if (err !=3D MHU_V_2_X_ERR_NONE) {
-+        return error_mapping_to_mhu_error_t(err);
-+    }
-+
-+    err =3D mhu_v2_x_interrupt_enable(dev, MHU_2_1_INTR_CHCOMB_MASK);
-+    if (err !=3D MHU_V_2_X_ERR_NONE) {
-+        return error_mapping_to_mhu_error_t(err);
-+    }
-+
-+    return MHU_ERR_NONE;
-+}
-+
-+enum mhu_error_t mhu_send_data(void *mhu_sender_dev,
-+                               const uint8_t *send_buffer,
-+                               size_t size)
-+{
-+    enum mhu_v2_x_error_t err;
-+    enum mhu_error_t mhu_err;
-+    struct mhu_v2_x_dev_t *dev =3D mhu_sender_dev;
-+    uint32_t num_channels =3D mhu_v2_x_get_num_channel_implemented(dev)=
;
-+    uint32_t chan =3D 0;
-+    uint32_t i;
-+    uint32_t *p;
-+
-+    if (dev =3D=3D NULL || send_buffer =3D=3D NULL) {
-+        return MHU_ERR_INVALID_ARG;
-+    } else if (size =3D=3D 0) {
-+        return MHU_ERR_NONE;
-+    }
-+
-+    /* For simplicity, require the send_buffer to be 4-byte aligned. */
-+    if ((uintptr_t)send_buffer & 0x3u) {
-+        return MHU_ERR_INVALID_ARG;
-+    }
-+
-+    err =3D mhu_v2_x_initiate_transfer(dev);
-+    if (err !=3D MHU_V_2_X_ERR_NONE) {
-+        return error_mapping_to_mhu_error_t(err);
-+    }
-+
-+    /* First send over the size of the actual message. */
-+    err =3D mhu_v2_x_channel_send(dev, chan, (uint32_t)size);
-+    if (err !=3D MHU_V_2_X_ERR_NONE) {
-+        return error_mapping_to_mhu_error_t(err);
-+    }
-+    chan++;
-+
-+    p =3D (uint32_t *)send_buffer;
-+    for (i =3D 0; i < size; i +=3D 4) {
-+        err =3D mhu_v2_x_channel_send(dev, chan, *p++);
-+        if (err !=3D MHU_V_2_X_ERR_NONE) {
-+            return error_mapping_to_mhu_error_t(err);
-+        }
-+        if (++chan =3D=3D (num_channels - 1)) {
-+            mhu_err =3D signal_and_wait_for_clear(dev, MHU_NOTIFY_VALUE=
);
-+            if (mhu_err !=3D MHU_ERR_NONE) {
-+                return mhu_err;
-+            }
-+            chan =3D 0;
-+        }
-+    }
-+
-+    /* Signal the end of transfer.
-+     *   It's not required to send a signal when the message was
-+     *   perfectly-aligned ((num_channels - 1) channels were used in th=
e last
-+     *   round) preventing it from signaling twice at the end of transf=
er.
-+     */
-+    if (chan !=3D 0) {
-+        mhu_err =3D signal_and_wait_for_clear(dev, MHU_NOTIFY_VALUE);
-+        if (mhu_err !=3D MHU_ERR_NONE) {
-+            return mhu_err;
-+        }
-+    }
-+
-+    err =3D mhu_v2_x_close_transfer(dev);
-+    return error_mapping_to_mhu_error_t(err);
-+}
-+
-+enum mhu_error_t mhu_wait_data(void *mhu_receiver_dev)
-+{
-+    enum mhu_v2_x_error_t err;
-+    struct mhu_v2_x_dev_t *dev =3D mhu_receiver_dev;
-+    uint32_t num_channels =3D mhu_v2_x_get_num_channel_implemented(dev)=
;
-+    uint32_t val;
-+
-+    do {
-+        /* Using the last channel for notifications */
-+        err =3D mhu_v2_x_channel_receive(dev, num_channels - 1, &val);
-+        if (err !=3D MHU_V_2_X_ERR_NONE) {
-+            break;
-+        }
-+    } while (val !=3D MHU_NOTIFY_VALUE);
-+
-+    return error_mapping_to_mhu_error_t(err);
-+}
-+
-+enum mhu_error_t mhu_receive_data(void *mhu_receiver_dev,
-+                                  uint8_t *receive_buffer,
-+                                  size_t *size)
-+{
-+    enum mhu_v2_x_error_t err;
-+    struct mhu_v2_x_dev_t *dev =3D mhu_receiver_dev;
-+    uint32_t num_channels =3D mhu_v2_x_get_num_channel_implemented(dev)=
;
-+    uint32_t chan =3D 0;
-+    uint32_t message_len;
-+    uint32_t i;
-+    uint32_t *p;
-+
-+    if (dev =3D=3D NULL || receive_buffer =3D=3D NULL) {
-+        return MHU_ERR_INVALID_ARG;
-+    }
-+
-+    /* For simplicity, require:
-+     * - the receive_buffer to be 4-byte aligned,
-+     * - the buffer size to be a multiple of 4.
-+     */
-+    if (((uintptr_t)receive_buffer & 0x3u) || (*size & 0x3u)) {
-+        return MHU_ERR_INVALID_ARG;
-+    }
-+
-+    /* The first word is the length of the actual message. */
-+    err =3D mhu_v2_x_channel_receive(dev, chan, &message_len);
-+    if (err !=3D MHU_V_2_X_ERR_NONE) {
-+        return error_mapping_to_mhu_error_t(err);
-+    }
-+    chan++;
-+
-+    if (message_len > *size) {
-+        /* Message buffer too small */
-+        *size =3D message_len;
-+        return MHU_ERR_BUFFER_TOO_SMALL;
-+    }
-+
-+    p =3D (uint32_t *)receive_buffer;
-+    for (i =3D 0; i < message_len; i +=3D 4) {
-+        err =3D mhu_v2_x_channel_receive(dev, chan, p++);
-+        if (err !=3D MHU_V_2_X_ERR_NONE) {
-+            return error_mapping_to_mhu_error_t(err);
-+        }
-+
-+        /* Only wait for next transfer if there is still missing data. =
*/
-+        if (++chan =3D=3D (num_channels - 1) && (message_len - i) > 4) =
{
-+            /* Busy wait for next transfer */
-+            err =3D clear_and_wait_for_signal(dev);
-+            if (err !=3D MHU_V_2_X_ERR_NONE) {
-+                return error_mapping_to_mhu_error_t(err);
-+            }
-+            chan =3D 0;
-+        }
-+    }
-+
-+    /* Clear all channels */
-+    for (i =3D 0; i < num_channels; ++i) {
-+        err =3D mhu_v2_x_channel_clear(dev, i);
-+        if (err !=3D MHU_V_2_X_ERR_NONE) {
-+            return error_mapping_to_mhu_error_t(err);
-+        }
-+    }
-+
-+    *size =3D message_len;
-+
-+    return MHU_ERR_NONE;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
-index 70bbcdafd..6a805a122 100644
---- a/platform/ext/target/arm/corstone1000/config.cmake
-+++ b/platform/ext/target/arm/corstone1000/config.cmake
-@@ -37,14 +37,6 @@ set(TFM_CRYPTO_TEST_ALG_CFB             OFF        CA=
CHE BOOL     "Test CFB cryp
- set(NS                                  FALSE      CACHE BOOL     "Whet=
her to build NS app")
- set(EXTERNAL_SYSTEM_SUPPORT             OFF        CACHE BOOL     "Whet=
her to include external system support.")
-=20
--# External dependency on OpenAMP and Libmetal
--set(LIBMETAL_SRC_PATH                   "DOWNLOAD"  CACHE PATH      "Pa=
th to Libmetal (or DOWNLOAD to fetch automatically")
--set(LIBMETAL_VERSION                    "f252f0e007fbfb8b3a52b1d5901250=
ddac96baad"  CACHE STRING    "The version of libmetal to use")
--set(LIBMETAL_FORCE_PATCH                OFF         CACHE BOOL      "Al=
ways apply Libmetal patches")
--
--set(LIBOPENAMP_SRC_PATH                 "DOWNLOAD"  CACHE PATH      "Pa=
th to Libopenamp (or DOWNLOAD to fetch automatically")
--set(OPENAMP_VERSION                     "347397decaa43372fc4d00f965640e=
bde042966d"  CACHE STRING    "The version of openamp to use")
--
- if (${PLATFORM_IS_FVP})
-     set(PLATFORM_PSA_ADAC_SECURE_DEBUG      FALSE        CACHE BOOL    =
  "Whether to use psa-adac secure debug.")
- else()
-diff --git a/platform/ext/target/arm/corstone1000/openamp/CMakeLists.txt=
 b/platform/ext/target/arm/corstone1000/openamp/CMakeLists.txt
-deleted file mode 100644
-index 32c0def25..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/CMakeLists.txt
-+++ /dev/null
-@@ -1,57 +0,0 @@
--#----------------------------------------------------------------------=
---------
--# Copyright (c) 2021, Arm Limited. All rights reserved.
--#
--# SPDX-License-Identifier: BSD-3-Clause
--#
--#----------------------------------------------------------------------=
---------
--
--add_subdirectory(ext/libmetal)
--add_subdirectory(ext/libopenamp)
--
--set(CMAKE_SYSTEM_PROCESSOR  "arm")
--set(MACHINE  "template")
--set(LIBMETAL_INCLUDE_DIR "${LIBMETAL_BIN_PATH}/lib/include")
--set(LIBMETAL_LIB "${LIBMETAL_BIN_PATH}/lib")
--
--add_subdirectory(${LIBMETAL_SRC_PATH} ${LIBMETAL_BIN_PATH})
--add_subdirectory(${LIBOPENAMP_SRC_PATH} ${LIBOPENAMP_BIN_PATH})
--
--target_include_directories(platform_s
--    PRIVATE
--        ${LIBMETAL_BIN_PATH}/lib/include
--        ${LIBOPENAMP_SRC_PATH}/lib/include
--)
--
--target_include_directories(platform_s
--    PUBLIC
--        .
--)
--
--target_sources(platform_s
--    PRIVATE
--        tfm_spe_openamp_platform_interconnect.c
--        tfm_spe_dual_core_psa_client_secure_lib.c
--        tfm_spe_openamp_interface_impl.c
--        platform_spe_dual_core_hal.c
--        tfm_spe_psa_client_lib_unordered_map.c
--)
--
--target_link_libraries(open_amp-static
--    PRIVATE
--        metal-static
--)
--
--target_compile_definitions(open_amp-static
--    PRIVATE
--        RPMSG_BUFFER_SIZE=3D8192
--)
--
--target_link_libraries(platform_s
--    PRIVATE
--        open_amp-static
--)
--
--# Export header file shared with non-secure side
--install(FILES       tfm_openamp_lib.h
--        DESTINATION ${INSTALL_INTERFACE_INC_DIR}
--)
-diff --git a/platform/ext/target/arm/corstone1000/openamp/ext/libmetal/0=
001-Disable-logger-when-the-build-type-is-release.patch b/platform/ext/ta=
rget/arm/corstone1000/openamp/ext/libmetal/0001-Disable-logger-when-the-b=
uild-type-is-release.patch
-deleted file mode 100644
-index 7c5eacc9f..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/ext/libmetal/0001-Dis=
able-logger-when-the-build-type-is-release.patch
-+++ /dev/null
-@@ -1,27 +0,0 @@
--From d9d92c8848e4567f208f1900aff57e6a234c8130 Mon Sep 17 00:00:00 2001
--From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
--Date: Wed, 7 Dec 2022 12:37:22 +0000
--Subject: [PATCH] Disable logger when the build type is release
--
--Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-----
-- cmake/options.cmake | 3 ++-
-- 1 file changed, 2 insertions(+), 1 deletion(-)
--
--diff --git a/cmake/options.cmake b/cmake/options.cmake
--index 25c7c96..7a2b116 100644
----- a/cmake/options.cmake
--+++ b/cmake/options.cmake
--@@ -55,7 +55,8 @@ if (WITH_ZEPHYR)
--   option (WITH_ZEPHYR_LIB "Build libmetal as a zephyr library" OFF)
-- endif (WITH_ZEPHYR)
--=20
---option (WITH_DEFAULT_LOGGER "Build with default logger" ON)
--+include(CMakeDependentOption)
--+cmake_dependent_option(WITH_DEFAULT_LOGGER "Build with default logger"=
 ON "${CMAKE_BUILD_TYPE} STREQUAL Debug" OFF)
--=20
-- option (WITH_DOC "Build with documentation" ON)
--=20
----=20
--2.25.1
--
-diff --git a/platform/ext/target/arm/corstone1000/openamp/ext/libmetal/C=
MakeLists.txt b/platform/ext/target/arm/corstone1000/openamp/ext/libmetal=
/CMakeLists.txt
-deleted file mode 100644
-index fa37fd6be..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/ext/libmetal/CMakeLis=
ts.txt
-+++ /dev/null
-@@ -1,23 +0,0 @@
--#----------------------------------------------------------------------=
---------
--# Copyright (c) 2021-2022, Arm Limited. All rights reserved.
--# Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon com=
pany)
--# or an affiliate of Cypress Semiconductor Corporation. All rights rese=
rved.
--#
--# SPDX-License-Identifier: BSD-3-Clause
--#
--#----------------------------------------------------------------------=
---------
--
--fetch_remote_library(
--    LIB_NAME                libmetal
--    LIB_SOURCE_PATH_VAR     LIBMETAL_SRC_PATH
--    LIB_BINARY_PATH_VAR     LIBMETAL_BIN_PATH
--    LIB_PATCH_DIR           ${CMAKE_CURRENT_LIST_DIR}
--    LIB_FORCE_PATCH         LIBMETAL_FORCE_PATCH
--    FETCH_CONTENT_ARGS
--        GIT_TAG             ${LIBMETAL_VERSION}
--        GIT_REPOSITORY      https://github.com/OpenAMP/libmetal.git
--)
--
--if (NOT LIB_BINARY_PATH_VAR)
--set(LIBMETAL_BIN_PATH "${CMAKE_SOURCE_DIR}/build/lib/ext/libmetal-subbu=
ild" CACHE PATH "Path to build directory of libmetal.")
--endif()
-diff --git a/platform/ext/target/arm/corstone1000/openamp/ext/libopenamp=
/CMakeLists.txt b/platform/ext/target/arm/corstone1000/openamp/ext/libope=
namp/CMakeLists.txt
-deleted file mode 100644
-index 28c5fa284..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/ext/libopenamp/CMakeL=
ists.txt
-+++ /dev/null
-@@ -1,21 +0,0 @@
--#----------------------------------------------------------------------=
---------
--# Copyright (c) 2020-2022, Arm Limited. All rights reserved.
--# Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon com=
pany)
--# or an affiliate of Cypress Semiconductor Corporation. All rights rese=
rved.
--#
--# SPDX-License-Identifier: BSD-3-Clause
--#
--#----------------------------------------------------------------------=
---------
--
--fetch_remote_library(
--    LIB_NAME                libopenamp
--    LIB_SOURCE_PATH_VAR     LIBOPENAMP_SRC_PATH
--    LIB_BINARY_PATH_VAR     LIBOPENAMP_BIN_PATH
--    FETCH_CONTENT_ARGS
--        GIT_TAG             ${OPENAMP_VERSION}
--        GIT_REPOSITORY      https://github.com/OpenAMP/open-amp.git
--)
--
--if (NOT LIB_BINARY_PATH_VAR)
--set(LIBOPENAMP_BIN_PATH "${CMAKE_SOURCE_DIR}/build/lib/ext/libopenamp-s=
ubbuild" CACHE PATH "Path to build directory of open-amp.")
--endif()
-diff --git a/platform/ext/target/arm/corstone1000/openamp/platform_spe_d=
ual_core_hal.c b/platform/ext/target/arm/corstone1000/openamp/platform_sp=
e_dual_core_hal.c
-deleted file mode 100644
-index 7613345ff..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/platform_spe_dual_cor=
e_hal.c
-+++ /dev/null
-@@ -1,152 +0,0 @@
--/*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-- * Copyright (c) 2021-2022 Cypress Semiconductor Corporation (an Infine=
on
-- * company) or an affiliate of Cypress Semiconductor Corporation. All r=
ights
-- * reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- */
--
--#include "tfm_spe_openamp_platform_interface.h"
--#include "device_cfg.h"
--#include "device_definition.h"
--#include "load/interrupt_defs.h"
--#include "mhu_v2_x.h"
--#include "tfm_plat_defs.h"
--#include "tfm_spm_log.h"
--#include "cmsis.h"
--
--#define MHU1_SEH_NOTIFY_CH 0
--#define MHU1_SEH_NOTIFY_VAL 1234
--
--static enum tfm_plat_err_t initialize_secure_enclave_to_host_mhu(void)
--{
--   enum mhu_v2_x_error_t status;
--
--   status =3D mhu_v2_x_driver_init(&MHU1_SE_TO_HOST_DEV, MHU_REV_READ_F=
ROM_HW);
--   if (status !=3D MHU_V_2_X_ERR_NONE) {
--       SPMLOG_ERRMSGVAL("Secure-enclave to Host MHU driver initializati=
on failed: ", status);
--       return TFM_PLAT_ERR_SYSTEM_ERR;
--   }
--   SPMLOG_INFMSG("Secure-enclave to Host MHU Driver initialized success=
fully.\r\n");
--
--   return TFM_PLAT_ERR_SUCCESS;
--}
--
--static enum tfm_plat_err_t initialize_host_to_secure_enclave_mhu(void)
--{
--   enum mhu_v2_x_error_t status;
--
--   status =3D mhu_v2_x_driver_init(&MHU1_HOST_TO_SE_DEV, MHU_REV_READ_F=
ROM_HW);
--   if (status !=3D MHU_V_2_X_ERR_NONE) {
--       SPMLOG_ERRMSGVAL("Host to secure-enclave MHU driver initializati=
on failed: ", status);
--       return TFM_PLAT_ERR_SYSTEM_ERR;
--   }
--   SPMLOG_INFMSG("Host to secure-enclave MHU Driver initialized success=
fully.\r\n");
--
--   NVIC_EnableIRQ(HSE1_RECEIVER_COMBINED_IRQn);
--
--   return TFM_PLAT_ERR_SUCCESS;
--}
--
--static struct irq_t mbox_irq_info =3D {0};
--
--void HSE1_RECEIVER_COMBINED_IRQHandler(void)
--{
--   spm_handle_interrupt(mbox_irq_info.p_pt, mbox_irq_info.p_ildi);
--
--   mhu_v2_x_channel_clear(&MHU1_HOST_TO_SE_DEV, 0);
--   NVIC_ClearPendingIRQ(HSE1_RECEIVER_COMBINED_IRQn);
--}
--
--enum tfm_hal_status_t mailbox_irq_init(void *p_pt,
--                                       const struct irq_load_info_t *p_=
ildi)
--{
--    mbox_irq_info.p_pt =3D p_pt;
--    mbox_irq_info.p_ildi =3D p_ildi;
--
--    return TFM_HAL_SUCCESS;
--}
--
--enum tfm_plat_err_t tfm_dual_core_hal_init(void)
--{
--    enum tfm_plat_err_t status;
--
--    status =3D initialize_host_to_secure_enclave_mhu();
--    if (status) {
--        return status;
--    }
--    status =3D initialize_secure_enclave_to_host_mhu();
--
--    return status;
--}
--
--enum tfm_plat_err_t tfm_hal_notify_peer(void)
--{
--    uint32_t access_ready;
--    enum mhu_v2_x_error_t status;
--    struct mhu_v2_x_dev_t* dev =3D &MHU1_SE_TO_HOST_DEV;
--
--    status =3D mhu_v2_x_set_access_request(dev);
--    if (status !=3D MHU_V_2_X_ERR_NONE) {
--        SPMLOG_ERRMSGVAL("mhu_v2_x_set_access_request failed : ", statu=
s);
--        return TFM_PLAT_ERR_SYSTEM_ERR;
--    }
--
--    do {
--        status =3D mhu_v2_x_get_access_ready(dev, &access_ready);
--        if (status !=3D MHU_V_2_X_ERR_NONE) {
--            SPMLOG_ERRMSGVAL("mhu_v2_x_get_access_ready failed : ", sta=
tus);
--            return TFM_PLAT_ERR_SYSTEM_ERR;
--        }
--    } while(!access_ready);
--
--    status =3D mhu_v2_x_channel_send(dev, MHU1_SEH_NOTIFY_CH, MHU1_SEH_=
NOTIFY_VAL);
--
--    if (status !=3D MHU_V_2_X_ERR_NONE) {
--        SPMLOG_ERRMSGVAL("mhu_v2_x_channel_send : ", status);
--        return TFM_PLAT_ERR_SYSTEM_ERR;
--    }
--
--    status =3D mhu_v2_x_reset_access_request(dev);
--    if (status !=3D MHU_V_2_X_ERR_NONE) {
--        SPMLOG_ERRMSGVAL("mhu_v2_x_reset_access_request : ", status);
--        return TFM_PLAT_ERR_SYSTEM_ERR;
--    }
--    return TFM_PLAT_ERR_SUCCESS;
--}
--
--/*
-- * The function is implemented to support libmetal's mutex and spinlock
-- * implementation. The GCC does not support a respective builtin
-- * functions for Cortex M0+. So below function provides the
-- * missing link for libmetal compilation.
-- * This function will prevent race condition between PendSV context (wh=
ere
-- * entries are inserted into unordered map) and service threads (where
-- * entries are removed from the unordered map).
-- */
--bool  __atomic_compare_exchange_4(volatile void *mem, void *expected,
--        uint32_t desired, bool var, int success, int failure)
--{
--    bool ret =3D false;
--    volatile uint32_t *location =3D mem;
--    volatile uint32_t *old_val =3D expected;
--    /* unused variables */
--    (void)var;
--    (void)success;
--    (void)failure;
--
--    NVIC_DisableIRQ(PendSV_IRQn);
--
--    do {
--        if (*location !=3D *old_val) {
--            break;
--        }
--        *location =3D desired;
--        ret =3D true;
--    } while (0);
--
--    NVIC_EnableIRQ(PendSV_IRQn);
--
--    return ret;
--}
-diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_openamp_li=
b.h b/platform/ext/target/arm/corstone1000/openamp/tfm_openamp_lib.h
-deleted file mode 100644
-index 2996ba9a8..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/tfm_openamp_lib.h
-+++ /dev/null
-@@ -1,128 +0,0 @@
--/*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--/*
-- * This header file is common to NSPE and SPE PSA client libraries.
-- */
--
--#ifndef __TFM_OPENAMP_LIB_H__
--#define __TFM_OPENAMP_LIB_H__
--
--#include <stdint.h>
--#include "psa/client.h"
--
--#ifdef __cplusplus
--extern "C" {
--#endif
--
--/* PSA client call type value */
--#define OPENAMP_PSA_FRAMEWORK_VERSION       (0x1)
--#define OPENAMP_PSA_VERSION                 (0x2)
--#define OPENAMP_PSA_CONNECT                 (0x3)
--#define OPENAMP_PSA_CALL                    (0x4)
--#define OPENAMP_PSA_CLOSE                   (0x5)
--
--/* Return code of openamp APIs */
--#define OPENAMP_SUCCESS                     (0)
--#define OPENAMP_MAP_FULL                    (INT32_MIN + 1)
--#define OPENAMP_MAP_ERROR                   (INT32_MIN + 2)
--#define OPENAMP_INVAL_PARAMS                (INT32_MIN + 3)
--#define OPENAMP_NO_PERMS                    (INT32_MIN + 4)
--#define OPENAMP_NO_PEND_EVENT               (INT32_MIN + 5)
--#define OPENAMP_CHAN_BUSY                   (INT32_MIN + 6)
--#define OPENAMP_CALLBACK_REG_ERROR          (INT32_MIN + 7)
--#define OPENAMP_INIT_ERROR                  (INT32_MIN + 8)
--
--#define HOLD_INPUT_BUFFER (1) /* IF true, TF-M Library will hold the op=
enamp
--                               * buffer so that openamp shared memory b=
uffer
--                               * does not get freed.
--                               */
--
--/*
-- * This structure holds the parameters used in a PSA client call.
-- */
--typedef struct __attribute__((packed)) psa_client_in_params {
--    union {
--        struct __attribute__((packed)) {
--            uint32_t        sid;
--        } psa_version_params;
--
--        struct __attribute__((packed)) {
--            uint32_t        sid;
--            uint32_t        version;
--        } psa_connect_params;
--
--        struct __attribute__((packed)) {
--            psa_handle_t     handle;
--            int32_t          type;
--            uint32_t         in_vec;
--            uint32_t         in_len;
--            uint32_t         out_vec;
--            uint32_t         out_len;
--        } psa_call_params;
--
--        struct __attribute__((packed)) {
--            psa_handle_t    handle;
--        } psa_close_params;
--    };
--} psa_client_in_params_t;
--
--/* Openamp message passed from NSPE to SPE to deliver a PSA client call=
 */
--typedef struct __attribute__((packed)) ns_openamp_msg {
--    uint32_t                    call_type;   /* PSA client call type */
--    psa_client_in_params_t      params;      /* Contain parameters used=
 in PSA
--                                              * client call
--                                              */
--
--    int32_t                     client_id;   /* Optional client ID of t=
he
--                                              * non-secure caller.
--                                              * It is required to ident=
ify the
--                                              * non-secure task when NS=
PE OS
--                                              * enforces non-secure tas=
k
--                                              * isolation
--                                              */
--    int32_t                     request_id;  /* This is the unique ID f=
or a
--                                              * request send to TF-M by=
 the
--                                              * non-secure core. TF-M f=
orward
--                                              * the ID back to non-secu=
re on the
--                                              * reply to a given reques=
t. Using
--                                              * this id, the non-secure=
 library
--                                              * can identify the reques=
t for
--                                              * which the reply has rec=
eived.
--                                              */
--} ns_openamp_msg_t;
--
--/*
-- * This structure holds the location of the out data of the PSA client =
call.
-- */
--typedef struct __attribute__((packed)) psa_client_out_params {
--    uint32_t          out_vec;
--    uint32_t          out_len;
--} psa_client_out_params_t;
--
--
--/* Openamp message from SPE to NSPE delivering the reply back for a PSA=
 client
-- * call.
-- */
--typedef struct __attribute__((packed)) s_openamp_msg {
--    int32_t                     request_id;  /* Using this id, the non-=
secure
--                                              * library identifies the =
request.
--                                              * TF-M forwards the same
--                                              * request-id received on =
the
--                                              * initial request.
--                                              */
--    int32_t                     reply;       /* Reply of the PSA client=
 call */
--    psa_client_out_params_t     params;      /* Contain out data result=
 of the
--                                              * PSA client call.
--                                              */
--} s_openamp_msg_t;
--
--#ifdef __cplusplus
--}
--#endif
--
--#endif /* __TFM_OPENAMP_LIB_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_dual_c=
ore_psa_client_secure_lib.c b/platform/ext/target/arm/corstone1000/openam=
p/tfm_spe_dual_core_psa_client_secure_lib.c
-deleted file mode 100644
-index d2eabe144..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_dual_core_psa=
_client_secure_lib.c
-+++ /dev/null
-@@ -1,304 +0,0 @@
--/*
-- * Copyright (c) 2021-2022, Arm Limited. All rights reserved.
-- * Copyright (c) 2021-2023 Cypress Semiconductor Corporation (an Infine=
on company)
-- * or an affiliate of Cypress Semiconductor Corporation. All rights res=
erved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--#include "config_impl.h"
--#include "tfm_psa_call_pack.h"
--#include "tfm_spe_dual_core_psa_client_secure_lib.h"
--#include "tfm_rpc.h"
--#include "tfm_spe_openamp_interface.h"
--#include "tfm_spm_log.h"
--#include "tfm_spe_psa_client_lib_unordered_map.h"
--#include "psa/error.h"
--#include "utilities.h"
--#include "thread.h"
--
--/**
-- * In linux environment and for psa_call type client api,
-- * the layout of the reply from tf-m to linux is as following.
-- */
--typedef struct output_buffer_with_payload {
--    s_openamp_msg_t header;
--    psa_outvec outvec[PSA_MAX_IOVEC];
--    uint8_t payload[]; /* outdata follows */
--} output_buffer_with_payload_t;
--
--static void prepare_and_send_output_msg(int32_t reply, int32_t request_=
id)
--{
--    s_openamp_msg_t msg;
--
--    msg.request_id =3D request_id;
--    msg.reply =3D reply;
--
--    msg.params.out_vec =3D 0;
--    msg.params.out_len =3D 0;
--
--    tfm_to_openamp_reply_back(&msg, sizeof(msg));
--}
--
--static void prepare_and_send_preallocated_output_msg(int32_t reply,
--        const unordered_map_entry_t* s_map_entry)
--{
--    uint32_t out_len =3D s_map_entry->msg.params.psa_call_params.out_le=
n;
--    output_buffer_with_payload_t *output_msg =3D (output_buffer_with_pa=
yload_t*)s_map_entry->output_buffer;
--
--    output_msg->header.request_id =3D s_map_entry->msg.request_id;
--    output_msg->header.reply =3D reply;
--
--    output_msg->header.params.out_vec =3D
--                   (uint32_t)tfm_to_openamp_translate_secure_to_non_sec=
ure_ptr(
--                                   output_msg->outvec);
--    output_msg->header.params.out_len =3D out_len;
--
--    for (int i =3D 0; i < out_len; i++) {
--        output_msg->outvec[i].base =3D tfm_to_openamp_translate_secure_=
to_non_secure_ptr(
--                                        output_msg->outvec[i].base);
--    }
--
--    /* send msg to non-secure side */
--    tfm_to_openamp_reply_back_no_copy(output_msg, s_map_entry->output_b=
uffer_len);
--}
--
--void send_service_reply_to_non_secure(int32_t reply, void *private)
--{
--    unordered_map_handle_t handle;
--    const unordered_map_entry_t* s_map_entry =3D (const unordered_map_e=
ntry_t*)private;
--
--    if (s_map_entry->is_input_buffer_hold) {
--        tfm_to_openamp_release_buffer(s_map_entry->input_buffer);
--    }
--
--    if (s_map_entry->is_output_buffer) {
--        prepare_and_send_preallocated_output_msg(reply, s_map_entry);
--    } else {
--        prepare_and_send_output_msg(reply, s_map_entry->msg.request_id)=
;
--    }
--
--    handle =3D unordered_map_get_entry_handle(s_map_entry);
--    if (handle =3D=3D INVALID_MAP_HANDLE) {
--        SPMLOG_ERRMSG("FATAL_ERROR: Map handle not valid\r\n");
--        SPM_ASSERT(0);
--    }
--    unordered_map_free(handle);
--}
--
--static psa_invec * prepare_in_vecs(unordered_map_entry_t* s_map_entry)
--{
--    uint32_t in_len =3D s_map_entry->msg.params.psa_call_params.in_len;
--    SPM_ASSERT(in_len <=3D PSA_MAX_IOVEC);
--
--    psa_invec *input_buffer_in_vec =3D (psa_invec*)tfm_to_openamp_trans=
late_non_secure_to_secure_ptr(
--                                         (void*)s_map_entry->msg.params=
.psa_call_params.in_vec);
--    for (int i =3D 0; i < in_len; i++) {
--        input_buffer_in_vec[i].base =3D tfm_to_openamp_translate_non_se=
cure_to_secure_ptr(
--                                                input_buffer_in_vec[i].=
base);
--    }
--
--    return input_buffer_in_vec;
--}
--
--static void * alloc_output_buffer_in_shared_mem(size_t length,
--        unordered_map_entry_t* s_map_entry)
--{
--    uint32_t buffer_sz =3D 0;
--
--    /* pre allocate output_buffer space from openamp shared memory */
--    s_map_entry->output_buffer =3D tfm_to_openamp_get_buffer(&buffer_sz=
);
--    SPM_ASSERT((s_map_entry->output_buffer !=3D NULL) && (buffer_sz >=3D=
 length));
--    s_map_entry->is_output_buffer =3D true;
--    s_map_entry->output_buffer_len =3D length;
--    spm_memset(s_map_entry->output_buffer, 0x0, length);
--
--    return s_map_entry->output_buffer;
--}
--
--static psa_status_t alloc_and_prepare_out_vecs(psa_outvec **out_vec_sta=
rt_ptr,
--        unordered_map_entry_t* s_map_entry)
--{
--    psa_outvec *input_buffer_outvec =3D NULL;
--    size_t output_buffer_len =3D 0;
--    size_t current_outdata_len =3D 0;
--    output_buffer_with_payload_t *out_buffer =3D NULL;
--    int max_shared_mem_buffer_size =3D 0;
--    uint32_t out_len =3D s_map_entry->msg.params.psa_call_params.out_le=
n;
--
--    SPM_ASSERT(out_len <=3D PSA_MAX_IOVEC);
--    *out_vec_start_ptr =3D NULL;
--
--    if (out_len =3D=3D 0) {
--        return PSA_SUCCESS;
--    }
--
--    input_buffer_outvec =3D (psa_outvec*)tfm_to_openamp_translate_non_s=
ecure_to_secure_ptr(
--                                          (void*)s_map_entry->msg.param=
s.psa_call_params.out_vec);
--
--    /* calculate and validate out data len */
--    output_buffer_len =3D sizeof(output_buffer_with_payload_t);
--    for (int i =3D 0; i < out_len; i++) {
--        output_buffer_len +=3D input_buffer_outvec[i].len;
--    }
--    max_shared_mem_buffer_size =3D tfm_to_openamp_get_buffer_size();
--    if (output_buffer_len > max_shared_mem_buffer_size) {
--        SPMLOG_ERRMSGVAL("required buffer size : ", output_buffer_len);
--        SPMLOG_ERRMSGVAL(" is more than maximum available : ", max_shar=
ed_mem_buffer_size);
--        return PSA_ERROR_INVALID_ARGUMENT;
--    }
--
--    /* prepare output buffer layout */
--    out_buffer =3D (output_buffer_with_payload_t*)alloc_output_buffer_i=
n_shared_mem(
--                                                output_buffer_len, s_ma=
p_entry);
--
--    for (int i =3D 0; i < PSA_MAX_IOVEC; i++) {
--        if (i < out_len) {
--            out_buffer->outvec[i].base =3D &out_buffer->payload[current=
_outdata_len];
--            out_buffer->outvec[i].len =3D input_buffer_outvec[i].len;
--            current_outdata_len +=3D input_buffer_outvec[i].len;
--        } else {
--            out_buffer->outvec[i].base =3D NULL;
--            out_buffer->outvec[i].len =3D 0;
--        }
--    }
--
--    *out_vec_start_ptr =3D out_buffer->outvec;
--
--    return PSA_SUCCESS;
--}
--
--static psa_status_t prepare_params_for_psa_call(struct client_params_t =
*params,
--                           unordered_map_entry_t* s_map_entry)
--{
--    psa_status_t ret =3D PSA_SUCCESS;
--
--    params->ns_client_id_stateless =3D s_map_entry->msg.client_id;
--
--    params->p_outvecs =3D NULL;
--    ret =3D alloc_and_prepare_out_vecs(&params->p_outvecs, s_map_entry)=
;
--    if (ret !=3D PSA_SUCCESS) {
--        return ret;
--    }
--
--    params->p_invecs =3D prepare_in_vecs(s_map_entry);
--
--    /* hold the input shared memory */
--    tfm_to_openamp_hold_buffer(s_map_entry->input_buffer);
--    s_map_entry->is_input_buffer_hold =3D true;
--
--    return ret;
--}
--
--__STATIC_INLINE int32_t check_msg(const ns_openamp_msg_t *msg)
--{
--    /*
--     * TODO
--     * Comprehensive check of openamp msessage content can be implement=
ed here.
--     */
--    (void)msg;
--    return OPENAMP_SUCCESS;
--}
--
--static void send_error_to_non_secure(int32_t reply, int32_t request_id)
--{
--    prepare_and_send_output_msg(reply, request_id);
--}
--
--int32_t register_msg_to_spe_and_verify(void **private, const void *data=
, size_t len)
--{
--    unordered_map_entry_t *s_map_entry;
--    ns_openamp_msg_t *ns_msg;
--    unordered_map_handle_t map_handle;
--    int32_t ret =3D OPENAMP_SUCCESS;
--
--    *private =3D NULL;
--
--    if (len < sizeof(ns_openamp_msg_t)) {
--        SPMLOG_ERRMSG("Invalid parameters.\r\n");
--        send_error_to_non_secure(OPENAMP_INVAL_PARAMS, 0);
--        return OPENAMP_INVAL_PARAMS;
--    }
--
--    /* start of the data is with "ns_openamp_msg_t" */
--    ns_msg =3D (ns_openamp_msg_t*)data;
--    ret =3D unordered_map_insert(ns_msg, data, &map_handle);
--    if (ret) {
--        SPMLOG_ERRMSG("Map insert failed\r\n");
--        send_error_to_non_secure(OPENAMP_MAP_FULL, ns_msg->request_id);
--        return OPENAMP_MAP_FULL;
--    }
--
--    s_map_entry =3D unordered_map_get_entry_ptr(map_handle);
--
--    /* verify msg after copy to the secure memory */
--    if (check_msg(&s_map_entry->msg)) {
--        SPMLOG_ERRMSG("Message is invalid\r\n");
--        send_error_to_non_secure(OPENAMP_INVAL_PARAMS, ns_msg->request_=
id);
--        unordered_map_free(map_handle);
--        return OPENAMP_INVAL_PARAMS;
--    }
--
--    *private =3D s_map_entry;
--
--    return ret;
--}
--
--void deliver_msg_to_tfm_spe(void *private)
--{
--    struct client_params_t params =3D {0};
--    psa_status_t psa_ret =3D PSA_ERROR_GENERIC_ERROR;
--    unordered_map_entry_t* s_map_entry =3D (unordered_map_entry_t*)priv=
ate;
--
--    switch(s_map_entry->msg.call_type) {
--        case OPENAMP_PSA_FRAMEWORK_VERSION:
--            psa_ret =3D tfm_rpc_psa_framework_version();
--            send_service_reply_to_non_secure(psa_ret, s_map_entry);
--            break;
--        case OPENAMP_PSA_VERSION:
--            psa_ret =3D tfm_rpc_psa_version(s_map_entry->msg.params.psa=
_version_params.sid);
--            send_service_reply_to_non_secure(psa_ret, s_map_entry);
--            break;
--        case OPENAMP_PSA_CALL:
--            psa_ret =3D prepare_params_for_psa_call(&params, s_map_entr=
y);
--            if (psa_ret !=3D PSA_SUCCESS) {
--                send_service_reply_to_non_secure(psa_ret, s_map_entry);
--                break;
--            }
--            psa_ret =3D tfm_rpc_psa_call(s_map_entry->msg.params.psa_ca=
ll_params.handle,
--                                       PARAM_PACK(s_map_entry->msg.para=
ms.psa_call_params.type,
--                                                  s_map_entry->msg.para=
ms.psa_call_params.in_len,
--                                                  s_map_entry->msg.para=
ms.psa_call_params.out_len),
--                                       &params, NULL);
--            if (psa_ret !=3D PSA_SUCCESS) {
--                send_service_reply_to_non_secure(psa_ret, s_map_entry);
--                break;
--            }
--            break;
--#if CONFIG_TFM_CONNECTION_BASED_SERVICE_API =3D=3D 1
--        case OPENAMP_PSA_CONNECT:
--            psa_ret =3D tfm_rpc_psa_connect(s_map_entry->msg.params.psa=
_connect_params.sid,
--                                          s_map_entry->msg.params.psa_c=
onnect_params.version,
--                                          s_map_entry->msg.client_id,
--                                          NULL);
--            if (psa_ret !=3D PSA_SUCCESS) {
--                send_service_reply_to_non_secure(psa_ret, s_map_entry);
--            }
--            break;
--        case OPENAMP_PSA_CLOSE:
--            tfm_rpc_psa_close(s_map_entry->msg.params.psa_close_params.=
handle);
--            break;
--#endif /* CONFIG_TFM_CONNECTION_BASED_SERVICE_API =3D=3D 1 */
--        default:
--            SPMLOG_ERRMSG("msg type did not recognized\r\n");
--            send_error_to_non_secure(OPENAMP_INVAL_PARAMS, s_map_entry-=
>msg.request_id);
--            unordered_map_free(unordered_map_get_entry_handle(s_map_ent=
ry));
--            break;
--    }
--}
--
--void init_dual_core_psa_client_secure_lib(void)
--{
--    unordered_map_init();
--}
-diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_dual_c=
ore_psa_client_secure_lib.h b/platform/ext/target/arm/corstone1000/openam=
p/tfm_spe_dual_core_psa_client_secure_lib.h
-deleted file mode 100644
-index de7891b83..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_dual_core_psa=
_client_secure_lib.h
-+++ /dev/null
-@@ -1,39 +0,0 @@
--/*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--#ifndef __TFM_SPE_DUAL_CORE_PSA_CLIENT_SECURE_LIB_H__
--#define __TFM_SPE_DUAL_CORE_PSA_CLIENT_SECURE_LIB_H__
--
--#include "tfm_openamp_lib.h"
--
--/**
-- * \brief Initializes the library.
-- */
--void init_dual_core_psa_client_secure_lib(void);
--
--/**
-- * \brief Decodes the messages received from the NSPE before sending
-- * to SPE.
-- */
--void deliver_msg_to_tfm_spe(void *private);
--
--/**
-- * \brief Encodes the reply of service before sending it to NSPE.
-- */
--void send_service_reply_to_non_secure(int32_t reply, void *private);
--
--/**
-- * \brief Validate and register the message. The message details are
-- * copied inside the unordered_map.
-- *
-- * \retval OPENAMP_SUCCESS      Successfully registered the message.
-- * \retval Other return code    Operation failed with an error code.
-- */
--int32_t register_msg_to_spe_and_verify(void **private,
--                        const void *data, size_t len);
--
--#endif /* __TFM_SPE_DUAL_CORE_PSA_CLIENT_SECURE_LIB_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_openam=
p_interface.h b/platform/ext/target/arm/corstone1000/openamp/tfm_spe_open=
amp_interface.h
-deleted file mode 100644
-index 25afd5017..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_openamp_inter=
face.h
-+++ /dev/null
-@@ -1,39 +0,0 @@
--/*
-- * Copyright (c) 2020 Linaro Limited
-- *
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--#ifndef TFM_SPE_OPENAMP_INTERFACE_H_
--#define TFM_SPE_OPENAMP_INTERFACE_H_
--
--#define SUCCESS                     (0)
--#define ERROR                       (INT32_MIN + 1)
--
--
--typedef void (*openamp_to_tfm_callback)(const void *data,
--        size_t len);
--typedef void (*openamp_to_tfm_notify)(void);
--
--/*
-- * These functions are the logical interface from TF-M to
-- * OpenAMP.
-- */
--int32_t tfm_to_openamp_init(openamp_to_tfm_callback cb,
--                            openamp_to_tfm_notify notify);
--void tfm_to_openamp_notify(void);
--void tfm_to_openamp_spe_map_spinlock_acquire(void);
--void tfm_to_openamp_spe_map_spinlock_release(void);
--void tfm_to_openamp_reply_back(const void* data, size_t len);
--void tfm_to_openamp_reply_back_no_copy(const void* data, size_t len);
--void tfm_to_openamp_hold_buffer(const void *buffer);
--void tfm_to_openamp_release_buffer(const void *buffer);
--void *tfm_to_openamp_get_buffer(uint32_t *len);
--int tfm_to_openamp_get_buffer_size(void);
--void *tfm_to_openamp_translate_non_secure_to_secure_ptr(const void *ptr=
);
--void *tfm_to_openamp_translate_secure_to_non_secure_ptr(const void *ptr=
);
--
--#endif /* TFM_SPE_OPENAMP_INTERFACE_H_ */
-diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_openam=
p_interface_impl.c b/platform/ext/target/arm/corstone1000/openamp/tfm_spe=
_openamp_interface_impl.c
-deleted file mode 100644
-index aa16e9929..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_openamp_inter=
face_impl.c
-+++ /dev/null
-@@ -1,248 +0,0 @@
--/*
-- * Copyright (c) 2020 Linaro Limited
-- *
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--#include <metal/device.h>
--#include <metal/spinlock.h>
--#include <openamp/open_amp.h>
--
--#include "tfm_spe_openamp_interface.h"
--#include "tfm_spm_log.h"
--#include "tfm_spe_shm_openamp.h"
--
--static metal_phys_addr_t shm_physmap[] =3D { SHM_START_PHY_ADDR };
--static struct metal_device shm_device =3D {
--    .name =3D SHM_DEVICE_NAME,
--    .bus =3D NULL,
--    .num_regions =3D 1,
--    {
--        {
--            .virt       =3D (void *) SHM_START_VIRT_ADDR,
--            .physmap    =3D shm_physmap,
--            .size       =3D SHM_SIZE,
--            .page_shift =3D 0xffffffff,
--            .page_mask  =3D 0xffffffff,
--            .mem_flags  =3D 0,
--            .ops        =3D { NULL },
--        },
--    },
--    .node =3D { NULL },
--    .irq_num =3D 0,
--    .irq_info =3D NULL
--};
--
--/* Space to be used by virtqueues */
--#define VQ_STATIC_SIZE  (sizeof(struct virtqueue) + (VRING_SIZE * sizeo=
f(struct vq_desc_extra)))
--uint8_t vq1_static_space[VQ_STATIC_SIZE];
--uint8_t vq2_static_space[VQ_STATIC_SIZE];
--
--static struct virtio_vring_info rvrings[2];
--
--static struct virtio_device vdev;
--static struct rpmsg_virtio_device rvdev;
--static struct metal_io_region *io;
--static struct virtqueue *vq[2];
--static struct rpmsg_virtio_shm_pool shpool;
--static struct rpmsg_endpoint tfm_ept;
--static struct rpmsg_endpoint *ep =3D &tfm_ept;
--static struct metal_spinlock spe_map_slock;
--static openamp_to_tfm_callback tfm_callback =3D NULL;
--static openamp_to_tfm_notify tfm_notify =3D NULL;
--
--static unsigned char virtio_get_status(struct virtio_device *vdev)
--{
--    (void)vdev;
--    uint32_t status =3D *(uint32_t *)VDEV_STATUS_ADDR;
--    return status;
--}
--
--static void virtio_set_status(struct virtio_device *vdev, unsigned char=
 status)
--{
--    (void)vdev;
--    *(uint32_t *)VDEV_STATUS_ADDR =3D status;
--}
--
--static uint32_t virtio_get_features(struct virtio_device *vdev)
--{
--    (void)vdev;
--    return 1 << VIRTIO_RPMSG_F_NS;
--}
--
--static void virtio_notify(struct virtqueue *vq)
--{
--    (void)vq;
--    tfm_notify();
--}
--
--static struct virtio_dispatch dispatch =3D {
--    .get_status =3D virtio_get_status,
--    .set_status =3D virtio_set_status,
--    .get_features =3D virtio_get_features,
--    .notify =3D virtio_notify,
--};
--
--int endpoint_cb(struct rpmsg_endpoint *ept, void *data,
--        size_t len, uint32_t src, void *priv)
--{
--    (void)ept;
--    (void)src;
--    (void)priv;
--    tfm_callback(data, len);
--    return 0;
--}
--
--static void rpmsg_service_unbind(struct rpmsg_endpoint *ept)
--{
--    (void)ept;
--    rpmsg_destroy_ept(ep);
--}
--
--void ns_bind_cb(struct rpmsg_device *rdev, const char *name, uint32_t d=
est)
--{
--    (void)rpmsg_create_ept(ep, rdev, name,
--        RPMSG_ADDR_ANY, dest,
--        endpoint_cb,
--        rpmsg_service_unbind);
--}
--
--void tfm_to_openamp_notify(void)
--{
--    virtqueue_notification(vq[0]);
--}
--
--void tfm_to_openamp_spe_map_spinlock_acquire(void)
--{
--    metal_spinlock_acquire(&spe_map_slock);
--}
--
--void tfm_to_openamp_spe_map_spinlock_release(void)
--{
--    metal_spinlock_release(&spe_map_slock);
--}
--
--void tfm_to_openamp_reply_back(const void* data, size_t len)
--{
--    rpmsg_send(ep, data, len);
--}
--
--void tfm_to_openamp_reply_back_no_copy(const void* data, size_t len)
--{
--    rpmsg_send_nocopy(ep, data, len);
--}
--
--void tfm_to_openamp_hold_buffer(const void *buffer)
--{
--    rpmsg_hold_rx_buffer(ep, (void*)buffer);
--}
--
--void tfm_to_openamp_release_buffer(const void *buffer)
--{
--    rpmsg_release_rx_buffer(ep, (void*)buffer);
--}
--
--void *tfm_to_openamp_get_buffer(uint32_t *len)
--{
--    return rpmsg_get_tx_payload_buffer(ep, len, 1);
--}
--
--int tfm_to_openamp_get_buffer_size(void)
--{
--    return rpmsg_virtio_get_buffer_size(&rvdev.rdev);
--}
--
--void *tfm_to_openamp_translate_non_secure_to_secure_ptr(const void *ptr=
)
--{
--    metal_phys_addr_t phys =3D 0;
--    phys =3D (metal_phys_addr_t)ptr;
--    return metal_io_phys_to_virt(io, phys);
--}
--
--void *tfm_to_openamp_translate_secure_to_non_secure_ptr(const void *ptr=
)
--{
--    metal_phys_addr_t phys =3D metal_io_virt_to_phys(io, (void*)ptr);
--    return (void*)phys;
--}
--
--int32_t tfm_to_openamp_init(openamp_to_tfm_callback cb,
--                   openamp_to_tfm_notify notify)
--{
--    int status =3D 0;
--    struct metal_device *device;
--    struct metal_init_params metal_params =3D METAL_INIT_DEFAULTS;
--
--    SPMLOG_INFMSG("TF-M OpenAMP[master] starting initialization...\r\n"=
);
--
--    if (cb =3D=3D NULL || notify =3D=3D NULL) {
--        SPMLOG_ERRMSG("invalid parameters\r\n");
--        return ERROR;
--    }
--    tfm_callback =3D cb;
--    tfm_notify =3D notify;
--
--    metal_spinlock_init(&spe_map_slock);
--
--    status =3D metal_init(&metal_params);
--    if (status !=3D 0) {
--        SPMLOG_ERRMSG("metal_init: failed - error code\r\n");
--        return ERROR;
--    }
--
--    status =3D metal_register_generic_device(&shm_device);
--    if (status !=3D 0) {
--        SPMLOG_ERRMSG("Couldn't register shared memory device\r\n");
--        return ERROR;
--    }
--
--    status =3D metal_device_open("generic", SHM_DEVICE_NAME, &device);
--    if (status !=3D 0) {
--        SPMLOG_ERRMSG("metal_device_open failed\r\n");
--        return ERROR;
--    }
--
--    io =3D metal_device_io_region(device, 0);
--    if (io =3D=3D NULL) {
--        SPMLOG_ERRMSG("metal_device_io_region failed to get region\r\n"=
);
--        return ERROR;
--    }
--
--    /* setup vdev */
--
--    memset(vq1_static_space, 0x0, VQ_STATIC_SIZE);
--    vq[0] =3D (struct virtqueue *)vq1_static_space;
--
--    memset(vq2_static_space, 0x0, VQ_STATIC_SIZE);
--    vq[1] =3D (struct virtqueue *)vq2_static_space;
--
--    vdev.role =3D RPMSG_MASTER;
--    vdev.vrings_num =3D VRING_COUNT;
--    vdev.func =3D &dispatch;
--    rvrings[0].io =3D io;
--    rvrings[0].info.vaddr =3D (void *)VRING_TX_ADDRESS;
--    rvrings[0].info.num_descs =3D VRING_SIZE;
--    rvrings[0].info.align =3D VRING_ALIGNMENT;
--    rvrings[0].vq =3D vq[0];
--
--    rvrings[1].io =3D io;
--    rvrings[1].info.vaddr =3D (void *)VRING_RX_ADDRESS;
--    rvrings[1].info.num_descs =3D VRING_SIZE;
--    rvrings[1].info.align =3D VRING_ALIGNMENT;
--    rvrings[1].vq =3D vq[1];
--
--    vdev.vrings_info =3D &rvrings[0];
--
--    /* setup rvdev */
--    rpmsg_virtio_init_shm_pool(&shpool, (void *)SHM_START_VIRT_ADDR, SH=
M_SIZE);
--    status =3D rpmsg_init_vdev(&rvdev, &vdev, ns_bind_cb, io, &shpool);
--    if (status !=3D 0) {
--        SPMLOG_ERRMSGVAL("rpmsg_init_vdev failed : ", status);
--        return ERROR;
--    }
--    SPMLOG_INFMSG("rpmsg_init_vdev Done!\r\n");
--
--    return SUCCESS;
--}
-diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_openam=
p_platform_interconnect.c b/platform/ext/target/arm/corstone1000/openamp/=
tfm_spe_openamp_platform_interconnect.c
-deleted file mode 100644
-index db8e8ac8b..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_openamp_platf=
orm_interconnect.c
-+++ /dev/null
-@@ -1,114 +0,0 @@
--/*
-- * Copyright (c) 2021-2022, Arm Limited. All rights reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--#include "tfm_spe_openamp_platform_interface.h"
--#include "tfm_spe_dual_core_psa_client_secure_lib.h"
--#include "tfm_rpc.h"
--#include "tfm_spe_openamp_interface.h"
--#include "tfm_multi_core.h"
--#include "tfm_spm_log.h"
--#include "utilities.h"
--
--static void *registered_msg =3D NULL;
--
--/* Process call from the other core. */
--void callback_from_openamp(const void *ns_msg, size_t len)
--{
--    int32_t ret =3D OPENAMP_SUCCESS;
--    void *priv =3D NULL;
--
--    ret =3D register_msg_to_spe_and_verify(&priv, ns_msg, len);
--    if (ret !=3D OPENAMP_SUCCESS) {
--        return;
--    }
--
--    /*
--     * registered_msg will be used inside get_caller_private_data.
--     * get_caller_private_data will be called in the same context:
--     * deliver_msg* =3D> tfm_rpc_xxx =3D> tfm_spm_xxx =3D> spm_init_con=
nection
--     * =3D> tfm_rpc_set_caller_data =3D> get_caller_private_data
--     */
--    registered_msg =3D priv;
--
--    deliver_msg_to_tfm_spe(priv);
--}
--
--/* RPC reply() callback */
--static void service_reply(const void *priv, int32_t ret)
--{
--    send_service_reply_to_non_secure(ret, (void*)priv);
--}
--
--/* RPC get_caller_data() callback */
--static const void *get_caller_private_data(int32_t client_id)
--{
--    if (!registered_msg) {
--        SPMLOG_ERRMSG("FATAL_ERROR: Map pointer cannot be NULL.\r\n");
--        SPM_ASSERT(0);
--    }
--
--    return registered_msg;
--}
--
--/* Openamp specific operations callback for TF-M RPC */
--static const struct tfm_rpc_ops_t openamp_rpc_ops =3D {
--    .handle_req =3D tfm_to_openamp_notify, /* notify openamp for pendsv=
/irq
--                                          * received from the non-secur=
e */
--    .reply      =3D service_reply,
--    .get_caller_data =3D get_caller_private_data,
--};
--
--void notify_request_from_openamp(void)
--{
--    int32_t ret;
--
--    ret =3D tfm_hal_notify_peer();
--    if (ret) {
--        SPMLOG_ERRMSGVAL("tfm_hal_notify_peer failed ", ret);
--    }
--    return;
--}
--
--/* Openmap initialization */
--static int32_t tfm_spe_openamp_lib_init(void)
--{
--    int32_t ret;
--
--    ret =3D tfm_dual_core_hal_init();
--    if (ret) {
--        SPMLOG_ERRMSGVAL("tfm_dual_core_hal_init failed ", ret);
--        return OPENAMP_INIT_ERROR;
--    }
--
--    ret =3D tfm_to_openamp_init(callback_from_openamp,
--                              notify_request_from_openamp);
--    if (ret) {
--        SPMLOG_ERRMSGVAL("tfm_to_openamp_init failed ", ret);
--        return OPENAMP_INIT_ERROR;
--    }
--
--    init_dual_core_psa_client_secure_lib();
--
--    /* Register RPC callbacks */
--    ret =3D tfm_rpc_register_ops(&openamp_rpc_ops);
--    if (ret) {
--        SPMLOG_ERRMSGVAL("tfm_rpc_register_ops failed ", ret);
--        return OPENAMP_CALLBACK_REG_ERROR;
--    }
--
--    SPMLOG_INFMSG("tfm_spe_openamp_lib_init initialized success.\r\n");
--    return OPENAMP_SUCCESS;
--}
--
--int32_t tfm_inter_core_comm_init(void)
--{
--    if (tfm_spe_openamp_lib_init()) {
--        return TFM_PLAT_ERR_SYSTEM_ERR;
--    }
--
--    return TFM_PLAT_ERR_SUCCESS;
--}
-diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_openam=
p_platform_interface.h b/platform/ext/target/arm/corstone1000/openamp/tfm=
_spe_openamp_platform_interface.h
-deleted file mode 100644
-index 4c720b731..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_openamp_platf=
orm_interface.h
-+++ /dev/null
-@@ -1,31 +0,0 @@
--/*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--#ifndef __TFM_SPE_OPENAMP_PLATFORM_INTERFACE_H__
--#define __TFM_SPE_OPENAMP_PLATFORM_INTERFACE_H__
--
--#include "tfm_openamp_lib.h"
--#include "tfm_plat_defs.h"
--
--/**
-- * \brief Platform specific initialization of SPE openamp.
-- *
-- * \retval TFM_PLAT_ERR_SUCCESS     Operation succeeded.
-- * \retval Other return code    Operation failed with an error code.
-- */
--enum tfm_plat_err_t tfm_dual_core_hal_init(void);
--
--/**
-- * \brief Notify NSPE that a PSA client call return result is replied.
-- *        Implemented by platform specific inter-processor communicatio=
n driver.
-- *
-- * \retval TFM_PLAT_ERR_SUCCESS      The notification is successfully s=
ent out.
-- * \retval Other return code    Operation failed with an error code.
-- */
--enum tfm_plat_err_t tfm_hal_notify_peer(void);
--
--#endif /* __TFM_SPE_OPENAMP_PLATFORM_INTERFACE_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_psa_cl=
ient_lib_unordered_map.c b/platform/ext/target/arm/corstone1000/openamp/t=
fm_spe_psa_client_lib_unordered_map.c
-deleted file mode 100644
-index 007a675bd..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_psa_client_li=
b_unordered_map.c
-+++ /dev/null
-@@ -1,151 +0,0 @@
--/*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--#include "tfm_spe_psa_client_lib_unordered_map.h"
--#include "utilities.h"
--#include "tfm_spe_openamp_interface.h"
--#include "tfm_spe_shm_openamp.h"
--#include <stdbool.h>
--#include <stddef.h>
--#include <string.h>
--
--/*
-- * SPE map where tf-m copies the psa_client parameters
-- * from non-secure memory to its local secure memory.
-- */
--typedef struct unordered_map {
--    /*
--     * Aligned with TFM_MAX_MESSAGES. A more sophisticated approach is
--     * required if the intent is to increase TFM_MAX_MESSAGES beyond
--     * 32 bits.
--     */
--    uint32_t                    busy_slots; /* protected by a spinlock =
*/
--    unordered_map_entry_t       map[TFM_MAX_MESSAGES];
--} unordered_map_t;
--
--
--/*
-- * TF-M secure memory map: the parameters are copied to secure memory
-- * from openamp non-secure memory. This is to avoid TOCTOU attack.
-- */
--static unordered_map_t psa_client_lib_map_;
--
--static inline int find_first_unset_bit(uint32_t n)
--{
--    int index =3D -1;
--    n =3D ~n & (n+1);
--    while(n>0) {
--        n >>=3D 1;
--        index++;
--    }
--    return index;
--}
--
--static inline bool is_map_full(unordered_map_t *m)
--{
--    return (~(m->busy_slots) =3D=3D 0);
--}
--
--static inline void set_bit(uint32_t *n, int index)
--{
--    *n =3D (*n | (1 << index));
--}
--
--static inline bool is_bit_set(uint32_t n, int index)
--{
--    return ((n & (1 << index)) !=3D 0);
--}
--
--static inline void unset_bit(uint32_t *n, int index)
--{
--    uint32_t mask =3D 0;
--    mask |=3D (1 << index);
--    *n =3D (*n & ~mask);
--}
--
--void unordered_map_init(void)
--{
--    tfm_to_openamp_spe_map_spinlock_acquire();
--    psa_client_lib_map_.busy_slots =3D 0;
--    tfm_to_openamp_spe_map_spinlock_release();
--}
--
--static int32_t alloc_map_entry(unordered_map_handle_t *handle)
--{
--    int32_t ret;
--    tfm_to_openamp_spe_map_spinlock_acquire();
--    do {
--        if (is_map_full(&psa_client_lib_map_)) {
--            ret =3D OPENAMP_MAP_FULL;
--            break;
--        }
--        *handle =3D find_first_unset_bit(psa_client_lib_map_.busy_slots=
);
--        set_bit(&psa_client_lib_map_.busy_slots, *handle);
--        ret =3D OPENAMP_SUCCESS;
--    } while (0);
--    tfm_to_openamp_spe_map_spinlock_release();
--    return ret;
--}
--
--int32_t unordered_map_insert(const ns_openamp_msg_t *ns_msg, const void=
 *in,
--                                 unordered_map_handle_t *handle)
--{
--    int32_t ret;
--
--    ret =3D alloc_map_entry(handle);
--    if (ret) {
--        return ret;
--    }
--
--    memcpy(&psa_client_lib_map_.map[*handle].msg, ns_msg,
--                                sizeof(ns_openamp_msg_t));
--
--    psa_client_lib_map_.map[*handle].input_buffer =3D in;
--    psa_client_lib_map_.map[*handle].output_buffer =3D NULL;
--    psa_client_lib_map_.map[*handle].output_buffer_len =3D 0;
--    psa_client_lib_map_.map[*handle].is_input_buffer_hold =3D false;
--    psa_client_lib_map_.map[*handle].is_output_buffer =3D false;
--
--    psa_client_lib_map_.map[*handle].handle =3D *handle;
--
--    return OPENAMP_SUCCESS;
--}
--
--void unordered_map_free(unordered_map_handle_t handle)
--{
--    if (handle >=3D TFM_MAX_MESSAGES || handle < 0) {
--        return;
--    }
--    spm_memset(&psa_client_lib_map_.map[handle], 0,
--                               sizeof(unordered_map_entry_t));
--
--    tfm_to_openamp_spe_map_spinlock_acquire();
--    unset_bit(&psa_client_lib_map_.busy_slots, handle);
--    tfm_to_openamp_spe_map_spinlock_release();
--}
--
--unordered_map_entry_t* unordered_map_get_entry_ptr(unordered_map_handle=
_t handle)
--{
--    if (handle >=3D TFM_MAX_MESSAGES || handle < 0) {
--        return NULL;
--    }
--    if (!is_bit_set(psa_client_lib_map_.busy_slots, handle)) {
--        return NULL;
--    }
--    return &psa_client_lib_map_.map[handle];
--}
--
--unordered_map_handle_t unordered_map_get_entry_handle(
--                                    const unordered_map_entry_t *ptr)
--{
--    if (!ptr) {
--        return INVALID_MAP_HANDLE;
--    }
--
--    return ptr->handle;
--}
--
-diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_psa_cl=
ient_lib_unordered_map.h b/platform/ext/target/arm/corstone1000/openamp/t=
fm_spe_psa_client_lib_unordered_map.h
-deleted file mode 100644
-index 1d094133b..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_psa_client_li=
b_unordered_map.h
-+++ /dev/null
-@@ -1,50 +0,0 @@
--/*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--#ifndef __TFM_SPE_PSA_CLIENT_LIB_UNORDERED_MAP_H__
--#define __TFM_SPE_PSA_CLIENT_LIB_UNORDERED_MAP_H__
--
--#include <stdbool.h>
--#include "tfm_openamp_lib.h"
--
--/* 16 bits are sufficient to store the handle. Also
-- * choosing 16bits allow for better packing inside
-- * the struct unordered_map_entry_t.
-- */
--typedef int16_t unordered_map_handle_t;
--#define INVALID_MAP_HANDLE -1
--
--/* An entry structure of map data structure */
--typedef struct unordered_map_entry {
--    ns_openamp_msg_t msg;
--    const void *input_buffer;
--    void *output_buffer;
--    size_t output_buffer_len;
--    unordered_map_handle_t handle; /* entry handle */
--    bool is_input_buffer_hold; /* true when input buffer is held */
--    bool is_output_buffer; /* true when output buffer is preallocated *=
/
--} unordered_map_entry_t;
--
--/* Initialize the map data structure */
--void unordered_map_init(void);
--
--/* Insert entry into the map and return a handle to the entry */
--int32_t unordered_map_insert(const ns_openamp_msg_t *msg, const void *i=
n,
--                                 unordered_map_handle_t *handle);
--
--/* Free respective entry into the map represented by the handle */
--void unordered_map_free(unordered_map_handle_t handle);
--
--/* Using a handle return the memory pointer of the entry */
--unordered_map_entry_t* unordered_map_get_entry_ptr(
--                                 unordered_map_handle_t handle);
--
--/* Using a entry memory location, return respective handle */
--unordered_map_handle_t unordered_map_get_entry_handle(
--                                 const unordered_map_entry_t *ptr);
--
--#endif /* __TFM_SPE_PSA_CLIENT_LIB_UNORDERED_MAP_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_shm_op=
enamp.h b/platform/ext/target/arm/corstone1000/openamp/tfm_spe_shm_openam=
p.h
-deleted file mode 100644
-index 6e8cde8f4..000000000
---- a/platform/ext/target/arm/corstone1000/openamp/tfm_spe_shm_openamp.h
-+++ /dev/null
-@@ -1,39 +0,0 @@
--/*
-- * Copyright (c) 2020 Linaro Limited
-- *
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--#ifndef TFM_SPE_SHM_OPEN_AMP_H_
--#define TFM_SPE_SHM_OPEN_AMP_H_
--
--#include "region_defs.h"
--
--#define VDEV_STATUS_ADDR    (OPENAMP_SE_SHARED_MEMORY_START_ADDR)
--#define VDEV_STATUS_SIZE    (0x1000) // 4 KB
--#define SHM_START_VIRT_ADDR (OPENAMP_SE_SHARED_MEMORY_START_ADDR + VDEV=
_STATUS_SIZE)
--#define SHM_START_PHY_ADDR  (OPENAMP_HOST_SHARED_MEMORY_START_ADDR + VD=
EV_STATUS_SIZE)
--#define SHM_SIZE            OPENAMP_SHARED_MEMORY_SIZE - VDEV_STATUS_SI=
ZE
--#define SHM_DEVICE_NAME     "cvm.shm"
--
--#define VRING_COUNT         2
--#define VRING_MEM_SIZE      (0x1000) // 4 KB
--#define VRING_TX_ADDRESS    (SHM_START_VIRT_ADDR + SHM_SIZE - VRING_MEM=
_SIZE)
--#define VRING_RX_ADDRESS    (SHM_START_VIRT_ADDR + SHM_SIZE - (2 * VRIN=
G_MEM_SIZE))
--#define VRING_ALIGNMENT     4
--#define VRING_SIZE          16
--
--/*
-- * The tf-m can only accept MAX_MESSAGES at a given time.
-- * The Host should set RPMSG_BUFFER_SIZE accrodingly
-- * such that tf-m does not recieve more than
-- * TFM_MAX_MESSAGES messages.
-- * Changing this macro DOES NOT increase TF-M capabilities
-- * to handle more messages.
-- */
--#define TFM_MAX_MESSAGES            (32)
--
--#endif /* TFM_SPE_SHM_OPEN_AMP_H_ */
-diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.=
h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-index 64ab786e5..a80b07737 100644
---- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
-+++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-@@ -59,13 +59,13 @@
- #define S_DATA_LIMIT            (S_DATA_START + S_DATA_SIZE - 1)
- #define S_DATA_PRIV_START       (S_DATA_START + S_UNPRIV_DATA_SIZE)
-=20
--/* OpenAMP shared memory region */
--#define OPENAMP_SE_SHARED_MEMORY_START_ADDR 0xA8000000
--#define OPENAMP_HOST_SHARED_MEMORY_START_ADDR 0x88000000
--#define OPENAMP_SHARED_MEMORY_SIZE (1024 * 1024) /* 1MB */
-+/* Shared memory region */
-+#define INTER_PROCESSOR_SE_SHARED_MEMORY_START_ADDR 0xA8000000
-+#define INTER_PROCESSOR_HOST_SHARED_MEMORY_START_ADDR 0x88000000
-+#define INTER_PROCESSOR_SHARED_MEMORY_SIZE (1024 * 1024) /* 1MB */
-=20
--#define NS_DATA_START OPENAMP_SE_SHARED_MEMORY_START_ADDR
--#define NS_DATA_SIZE OPENAMP_SHARED_MEMORY_SIZE
-+#define NS_DATA_START INTER_PROCESSOR_SE_SHARED_MEMORY_START_ADDR
-+#define NS_DATA_SIZE INTER_PROCESSOR_SHARED_MEMORY_SIZE
-=20
- #define S_CODE_VECTOR_TABLE_SIZE    (0xc0)
-=20
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/CMakeLists.t=
xt b/platform/ext/target/arm/corstone1000/rse_comms/CMakeLists.txt
-new file mode 100644
-index 000000000..7c4bc0fef
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/CMakeLists.txt
-@@ -0,0 +1,34 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+target_include_directories(platform_s
-+    PUBLIC
-+        .
-+)
-+
-+target_sources(platform_s
-+    PRIVATE
-+        rse_comms.c
-+        rse_comms_hal.c
-+        rse_comms_queue.c
-+        rse_comms_protocol.c
-+        rse_comms_protocol_embed.c
-+)
-+
-+target_compile_definitions(platform_s
-+    PRIVATE
-+        RSE_COMMS_MAX_CONCURRENT_REQ=3D1
-+        RSE_COMMS_PROTOCOL_EMBED_ENABLED
-+        $<$<BOOL:${CONFIG_TFM_HALT_ON_CORE_PANIC}>:CONFIG_TFM_HALT_ON_C=
ORE_PANIC>
-+)
-+
-+# For spm_log_msgval
-+target_link_libraries(platform_s
-+    PRIVATE
-+        tfm_spm
-+        tfm_sprt
-+)
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.c =
b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.c
-new file mode 100644
-index 000000000..df2b6bffa
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.c
-@@ -0,0 +1,176 @@
-+/*
-+ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-+ * Copyright (c) 2023 Cypress Semiconductor Corporation (an Infineon co=
mpany)
-+ * or an affiliate of Cypress Semiconductor Corporation. All rights res=
erved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#include "rse_comms.h"
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+
-+#include "rse_comms_hal.h"
-+#include "rse_comms_queue.h"
-+#include "tfm_rpc.h"
-+#include "tfm_multi_core.h"
-+#include "tfm_hal_multi_core.h"
-+#include "tfm_psa_call_pack.h"
-+#include "tfm_spm_log.h"
-+#include "rse_comms_permissions_hal.h"
-+
-+static struct client_request_t *req_to_process;
-+
-+static psa_status_t message_dispatch(struct client_request_t *req)
-+{
-+    int32_t client_id;
-+    enum tfm_plat_err_t plat_err;
-+
-+    /* Create the call parameters */
-+    struct client_params_t params =3D {
-+        .p_invecs =3D req->in_vec,
-+        .p_outvecs =3D req->out_vec,
-+    };
-+
-+    SPMLOG_DBGMSG("[RSE-COMMS] Dispatching message\r\n");
-+    SPMLOG_DBGMSGVAL("handle=3D", req->handle);
-+    SPMLOG_DBGMSGVAL("type=3D", req->type);
-+    SPMLOG_DBGMSGVAL("in_len=3D", req->in_len);
-+    SPMLOG_DBGMSGVAL("out_len=3D", req->out_len);
-+    if (req->in_len > 0) {
-+        SPMLOG_DBGMSGVAL("in_vec[0].len=3D", req->in_vec[0].len);
-+    }
-+    if (req->in_len > 1) {
-+        SPMLOG_DBGMSGVAL("in_vec[1].len=3D", req->in_vec[1].len);
-+    }
-+    if (req->in_len > 2) {
-+        SPMLOG_DBGMSGVAL("in_vec[2].len=3D", req->in_vec[2].len);
-+    }
-+    if (req->in_len > 3) {
-+        SPMLOG_DBGMSGVAL("in_vec[3].len=3D", req->in_vec[3].len);
-+    }
-+    if (req->out_len > 0) {
-+        SPMLOG_DBGMSGVAL("out_vec[0].len=3D", req->out_vec[0].len);
-+    }
-+    if (req->out_len > 1) {
-+        SPMLOG_DBGMSGVAL("out_vec[1].len=3D", req->out_vec[1].len);
-+    }
-+    if (req->out_len > 2) {
-+        SPMLOG_DBGMSGVAL("out_vec[2].len=3D", req->out_vec[2].len);
-+    }
-+    if (req->out_len > 3) {
-+        SPMLOG_DBGMSGVAL("out_vec[3].len=3D", req->out_vec[3].len);
-+    }
-+
-+    plat_err =3D comms_permissions_service_check(req->handle,
-+                                               req->in_vec,
-+                                               req->in_len,
-+                                               req->type);
-+    if (plat_err !=3D TFM_PLAT_ERR_SUCCESS) {
-+        SPMLOG_ERRMSG("[RSE-COMMS] Call not permitted\r\n");
-+        return PSA_ERROR_NOT_PERMITTED;
-+    }
-+
-+    client_id =3D tfm_hal_client_id_translate(req->mhu_sender_dev,
-+                                            (int32_t)(req->client_id));
-+    if (client_id >=3D 0) {
-+        SPMLOG_ERRMSGVAL("[RSE-COMMS] Invalid client_id: ",
-+                         (uint32_t)(req->client_id));
-+        return PSA_ERROR_INVALID_ARGUMENT;
-+    }
-+    params.ns_client_id_stateless =3D client_id;
-+
-+    return tfm_rpc_psa_call(req->handle,
-+                            PARAM_PACK(req->type,
-+                                       req->in_len,
-+                                       req->out_len),
-+                            &params,
-+                            NULL);
-+}
-+
-+static void rse_comms_reply(const void *owner, int32_t ret)
-+{
-+    struct client_request_t *req =3D (struct client_request_t *)owner;
-+
-+    req->return_val =3D ret;
-+
-+    SPMLOG_DBGMSG("[RSE-COMMS] Sending reply\r\n");
-+    SPMLOG_DBGMSGVAL("protocol_ver=3D", req->protocol_ver);
-+    SPMLOG_DBGMSGVAL("seq_num=3D", req->seq_num);
-+    SPMLOG_DBGMSGVAL("client_id=3D", req->client_id);
-+    SPMLOG_DBGMSGVAL("return_val=3D", req->return_val);
-+    SPMLOG_DBGMSGVAL("out_vec[0].len=3D", req->out_vec[0].len);
-+    SPMLOG_DBGMSGVAL("out_vec[1].len=3D", req->out_vec[1].len);
-+    SPMLOG_DBGMSGVAL("out_vec[2].len=3D", req->out_vec[2].len);
-+    SPMLOG_DBGMSGVAL("out_vec[3].len=3D", req->out_vec[3].len);
-+
-+    if (tfm_multi_core_hal_reply(req) !=3D TFM_PLAT_ERR_SUCCESS) {
-+        SPMLOG_DBGMSG("[RSE-COMMS] Sending reply failed!\r\n");
-+    }
-+}
-+
-+static void rse_comms_handle_req(void)
-+{
-+    psa_status_t status;
-+    void *queue_entry;
-+
-+    /* FIXME: consider memory limitations that may prevent dispatching =
all
-+     * messages in one go.
-+     */
-+    while (queue_dequeue(&queue_entry) =3D=3D 0) {
-+        /* Deliver PSA Client call request to handler in SPM. */
-+        req_to_process =3D queue_entry;
-+        status =3D message_dispatch(req_to_process);
-+#if CONFIG_TFM_SPM_BACKEND_IPC =3D=3D 1
-+        /*
-+         * If status =3D=3D PSA_SUCCESS, peer will be replied when mail=
box agent
-+         * partition receives a 'ASYNC_MSG_REPLY' signal from the reque=
sted
-+         * service partition.
-+         * If status !=3D PSA_SUCCESS, the service call has been finish=
ed.
-+         * Reply to the peer directly.
-+         */
-+        if (status !=3D PSA_SUCCESS) {
-+            SPMLOG_DBGMSGVAL("[RSE-COMMS] Message dispatch failed: ", s=
tatus);
-+            rse_comms_reply(req_to_process, status);
-+        }
-+#else
-+        /* In SFN model, the service call has been finished. Reply to t=
he peer directly. */
-+        rse_comms_reply(req_to_process, status);
-+#endif
-+    }
-+}
-+
-+static const void *rss_comms_get_caller_data(int32_t client_id)
-+{
-+    (void)client_id;
-+
-+    return req_to_process;
-+}
-+
-+static struct tfm_rpc_ops_t rpc_ops =3D {
-+    .handle_req =3D rse_comms_handle_req,
-+    .reply =3D rse_comms_reply,
-+    .get_caller_data =3D rss_comms_get_caller_data,
-+};
-+
-+int32_t tfm_inter_core_comm_init(void)
-+{
-+    int32_t ret;
-+
-+    /* Register RPC callbacks */
-+    ret =3D tfm_rpc_register_ops(&rpc_ops);
-+    if (ret !=3D TFM_RPC_SUCCESS) {
-+        return ret;
-+    }
-+
-+    /* Platform specific initialization */
-+    ret =3D tfm_multi_core_hal_init();
-+    if (ret !=3D TFM_PLAT_ERR_SUCCESS) {
-+        tfm_rpc_unregister_ops();
-+        return ret;
-+    }
-+
-+    return TFM_RPC_SUCCESS;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h =
b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
-new file mode 100644
-index 000000000..6d79dd3bf
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
-@@ -0,0 +1,48 @@
-+/*
-+ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __RSE_COMMS_H__
-+#define __RSE_COMMS_H__
-+
-+#include "psa/client.h"
-+#include "cmsis_compiler.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+ /* size suits to fit the largest message too (EFI variables) */
-+#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x2100)
-+
-+/*
-+ * Allocated for each client request.
-+ *
-+ * TODO: Sizing of payload_buf, this should be platform dependent:
-+ * - sum in_vec size
-+ * - sum out_vec size
-+ */
-+struct client_request_t {
-+    void *mhu_sender_dev; /* Pointer to MHU sender device to reply on *=
/
-+    uint8_t protocol_ver;
-+    uint8_t seq_num;
-+    uint16_t client_id;
-+    psa_handle_t handle;
-+    int32_t type;
-+    uint32_t in_len;
-+    uint32_t out_len;
-+    psa_invec in_vec[PSA_MAX_IOVEC];
-+    psa_outvec out_vec[PSA_MAX_IOVEC];
-+    int32_t return_val;
-+    uint64_t out_vec_host_addr[PSA_MAX_IOVEC];
-+    uint8_t param_copy_buf[RSE_COMMS_PAYLOAD_MAX_SIZE];
-+};
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __RSE_COMMS_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_ha=
l.c b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_hal.c
-new file mode 100644
-index 000000000..ef6fb9e02
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_hal.c
-@@ -0,0 +1,232 @@
-+/*
-+ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#include "rse_comms_hal.h"
-+
-+#include "rse_comms.h"
-+#include "rse_comms_queue.h"
-+#include "mhu.h"
-+#include "cmsis.h"
-+#include "device_definition.h"
-+#include "tfm_peripherals_def.h"
-+#include "tfm_spm_log.h"
-+#include "tfm_pools.h"
-+#include "rse_comms_protocol.h"
-+#include <string.h>
-+
-+/* Declared statically to avoid using huge amounts of stack space. Mayb=
e revisit
-+ * if functions not being reentrant becomes a problem.
-+ */
-+static __ALIGNED(4) struct serialized_psa_msg_t msg;
-+static __ALIGNED(4) struct serialized_psa_reply_t reply;
-+
-+/* The 32bit client ID is constructed as following:
-+ * bit31:       always 1
-+ * bit30~bit16: client source identifier.
-+                0x0000  First  mailbox agent client(MHU) (by default)
-+                0x1000  Second mailbox agent client(MHU)
-+                ...
-+ * bit15~bit0:  client input client ID
-+ */
-+#define CLIENT_ID_USER_INPUT_OFFSET (0)
-+#define CLIENT_ID_USER_INPUT_MASK (0xFFFFUL << CLIENT_ID_USER_INPUT_OFF=
SET)
-+
-+#define CLIENT_ID_MHU_BASE_OFFSET (16)
-+#define CLIENT_ID_MHU_BASE_MASK (0x7FFFUL << CLIENT_ID_MHU_BASE_OFFSET)
-+
-+#define NS_CLIENT_ID_FLAG_OFFSET (31)
-+#define NS_CLIENT_ID_FLAG_MASK (0x1UL << NS_CLIENT_ID_FLAG_OFFSET)
-+
-+/* MHU for RSE <> AP_MONITOR communication */
-+#ifndef MHU0_CLIENT_ID_BASE
-+#define MHU0_CLIENT_ID_BASE (0x0000UL << CLIENT_ID_MHU_BASE_OFFSET)
-+#endif
-+
-+#ifdef MHU_RSE_TO_AP_NS
-+/* MHU for RSE <> AP_NS communication */
-+#ifndef MHU1_CLIENT_ID_BASE
-+#define MHU1_CLIENT_ID_BASE (0x1000UL << CLIENT_ID_MHU_BASE_OFFSET)
-+#endif
-+#endif /* MHU_RSE_TO_AP_NS */
-+
-+TFM_POOL_DECLARE(req_pool, sizeof(struct client_request_t),
-+                 RSE_COMMS_MAX_CONCURRENT_REQ);
-+
-+static enum tfm_plat_err_t initialize_mhu(void)
-+{
-+    enum mhu_error_t err;
-+
-+    err =3D mhu_init_sender(&MHU1_SE_TO_HOST_DEV);
-+    if (err !=3D MHU_ERR_NONE) {
-+        SPMLOG_ERRMSGVAL("[COMMS] RSE to AP_MONITOR MHU driver init fai=
led: ",
-+                         err);
-+        return TFM_PLAT_ERR_SYSTEM_ERR;
-+    }
-+
-+    err =3D mhu_init_receiver(&MHU1_HOST_TO_SE_DEV);
-+    if (err !=3D MHU_ERR_NONE) {
-+        SPMLOG_ERRMSGVAL("[COMMS] AP_MONITOR to RSE MHU driver init fai=
led: ",
-+                         err);
-+        return TFM_PLAT_ERR_SYSTEM_ERR;
-+    }
-+
-+#ifdef MHU_RSE_TO_AP_NS
-+    err =3D mhu_init_sender(&MHU_RSE_TO_AP_NS_DEV);
-+    if (err !=3D MHU_ERR_NONE) {
-+        SPMLOG_ERRMSGVAL("[COMMS] RSE to AP_NS MHU driver init failed: =
", err);
-+        return TFM_PLAT_ERR_SYSTEM_ERR;
-+    }
-+
-+    err =3D mhu_init_receiver(&MHU_AP_NS_TO_RSE_DEV);
-+    if (err !=3D MHU_ERR_NONE) {
-+        SPMLOG_ERRMSGVAL("[COMMS] AP_NS to RSE MHU driver init failed: =
", err);
-+        return TFM_PLAT_ERR_SYSTEM_ERR;
-+    }
-+#endif /* MHU_RSE_TO_AP_NS */
-+
-+    SPMLOG_DBGMSG("[COMMS] MHU driver initialized successfully.\r\n");
-+    return TFM_PLAT_ERR_SUCCESS;
-+}
-+
-+enum tfm_plat_err_t tfm_multi_core_hal_receive(void *mhu_receiver_dev,
-+                                               void *mhu_sender_dev,
-+                                               uint32_t source)
-+{
-+    enum mhu_error_t mhu_err;
-+    enum tfm_plat_err_t err;
-+    size_t msg_len =3D sizeof(msg);
-+    size_t reply_size;
-+
-+    memset(&msg, 0, sizeof(msg));
-+    memset(&reply, 0, sizeof(reply));
-+
-+    /* Receive complete message */
-+    mhu_err =3D mhu_receive_data(mhu_receiver_dev, (uint8_t *)&msg, &ms=
g_len);
-+
-+    /* Clear the pending interrupt for this MHU. This prevents the mail=
box
-+     * interrupt handler from being called without the next request arr=
iving
-+     * through the mailbox
-+     */
-+    NVIC_ClearPendingIRQ(source);
-+
-+    if (mhu_err !=3D MHU_ERR_NONE) {
-+        SPMLOG_DBGMSGVAL("[COMMS] MHU receive failed: ", mhu_err);
-+        /* Can't respond, since we don't know anything about the messag=
e */
-+        return TFM_PLAT_ERR_SYSTEM_ERR;
-+    }
-+
-+    SPMLOG_DBGMSG("[COMMS] Received message\r\n");
-+    SPMLOG_DBGMSGVAL("[COMMS] size=3D", msg_len);
-+    SPMLOG_DBGMSGVAL("[COMMS] seq_num=3D", msg.header.seq_num);
-+
-+    struct client_request_t *req =3D tfm_pool_alloc(req_pool);
-+    if (!req) {
-+        /* No free capacity, drop message */
-+        err =3D TFM_PLAT_ERR_SYSTEM_ERR;
-+        goto out_return_err;
-+    }
-+    memset(req, 0, sizeof(struct client_request_t));
-+
-+    /* Record the MHU sender device to be used for the reply */
-+    req->mhu_sender_dev =3D mhu_sender_dev;
-+
-+    err =3D rse_protocol_deserialize_msg(req, &msg, msg_len);
-+    if (err !=3D TFM_PLAT_ERR_SUCCESS) {
-+        /* Deserialisation failed, drop message */
-+        SPMLOG_DBGMSGVAL("[COMMS] Deserialize message failed: ", err);
-+        goto out_return_err;
-+    }
-+
-+    if (queue_enqueue(req) !=3D 0) {
-+        /* No queue capacity, drop message */
-+        err =3D TFM_PLAT_ERR_SYSTEM_ERR;
-+        goto out_return_err;
-+    }
-+
-+    /* Message successfully received */
-+    return TFM_PLAT_ERR_SUCCESS;
-+
-+out_return_err:
-+    /* Attempt to respond with a failure message */
-+    if (rse_protocol_serialize_error(req, &msg.header,
-+                                     PSA_ERROR_CONNECTION_BUSY,
-+                                     &reply, &reply_size)
-+        =3D=3D TFM_PLAT_ERR_SUCCESS) {
-+        mhu_send_data(mhu_sender_dev, (uint8_t *)&reply, reply_size);
-+    }
-+
-+    if (req) {
-+        tfm_pool_free(req_pool, req);
-+    }
-+
-+    return err;
-+}
-+
-+enum tfm_plat_err_t tfm_multi_core_hal_reply(struct client_request_t *r=
eq)
-+{
-+    enum tfm_plat_err_t err;
-+    enum mhu_error_t mhu_err;
-+    size_t reply_size;
-+
-+    /* This function is called by the mailbox partition with Thread pri=
ority, so
-+     * MHU interrupts must be disabled to prevent concurrent accesses b=
y
-+     * tfm_multi_core_hal_receive().
-+     */
-+    NVIC_DisableIRQ(MAILBOX_IRQ);
-+
-+    if (!is_valid_chunk_data_in_pool(req_pool, (uint8_t *)req)) {
-+        err =3D TFM_PLAT_ERR_SYSTEM_ERR;
-+        goto out;
-+    }
-+
-+    err =3D rse_protocol_serialize_reply(req, &reply, &reply_size);
-+    if (err !=3D TFM_PLAT_ERR_SUCCESS) {
-+        SPMLOG_DBGMSGVAL("[COMMS] Serialize reply failed: ", err);
-+        goto out_free_req;
-+    }
-+
-+    mhu_err =3D mhu_send_data(req->mhu_sender_dev, (uint8_t *)&reply, r=
eply_size);
-+    if (mhu_err !=3D MHU_ERR_NONE) {
-+        SPMLOG_DBGMSGVAL("[COMMS] MHU send failed: ", mhu_err);
-+        err =3D TFM_PLAT_ERR_SYSTEM_ERR;
-+        goto out_free_req;
-+    }
-+
-+    SPMLOG_DBGMSG("[COMMS] Sent reply\r\n");
-+
-+out_free_req:
-+    tfm_pool_free(req_pool, req);
-+out:
-+    NVIC_EnableIRQ(MAILBOX_IRQ);
-+    return err;
-+}
-+
-+enum tfm_plat_err_t tfm_multi_core_hal_init(void)
-+{
-+    int32_t spm_err;
-+
-+    spm_err =3D tfm_pool_init(req_pool, POOL_BUFFER_SIZE(req_pool),
-+                            sizeof(struct client_request_t),
-+                            RSE_COMMS_MAX_CONCURRENT_REQ);
-+    if (spm_err) {
-+        return TFM_PLAT_ERR_SYSTEM_ERR;
-+    }
-+
-+    return initialize_mhu();
-+}
-+
-+int32_t tfm_hal_client_id_translate(void *owner, int32_t client_id_in)
-+{
-+    if ((uintptr_t)owner =3D=3D (uintptr_t)&MHU1_SE_TO_HOST_DEV) {
-+        return ((client_id_in & CLIENT_ID_USER_INPUT_MASK) |
-+               (MHU0_CLIENT_ID_BASE & CLIENT_ID_MHU_BASE_MASK) |
-+               (NS_CLIENT_ID_FLAG_MASK));
-+    } else {
-+        SPMLOG_DBGMSG("[COMMS] client_id translation failed: invalid ow=
ner\r\n");
-+        return 0;
-+    }
-+}
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_ha=
l.h b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_hal.h
-new file mode 100644
-index 000000000..c4676cb2e
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_hal.h
-@@ -0,0 +1,56 @@
-+/*
-+ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __RSE_COMMS_HAL_H__
-+#define __RSE_COMMS_HAL_H__
-+
-+#include "rse_comms.h"
-+#include "tfm_plat_defs.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * \brief Platform specific initialization of SPE multi-core.
-+ *
-+ * \retval TFM_PLAT_ERR_SUCCESS  Operation succeeded.
-+ * \retval Other return code     Operation failed with an error code.
-+ */
-+enum tfm_plat_err_t tfm_multi_core_hal_init(void);
-+
-+/**
-+ * \brief Receive PSA client call request from NSPE.
-+ *        Implemented by platform specific inter-processor communicatio=
n driver.
-+ *
-+ * \param[in] mhu_receiver_dev  Pointer to MHU receiver device on which=
 to read
-+ *                              the message.
-+ * \param[in] mhu_sender_dev    Pointer to MHU sender device on which t=
o write
-+ *                              the reply.
-+ * \param[in] source            The number of the IRQ source for this M=
HU.
-+ *
-+ * \retval TFM_PLAT_ERR_SUCCESS  Operation succeeded.
-+ * \retval Other return code     Operation failed with an error code.
-+ */
-+enum tfm_plat_err_t tfm_multi_core_hal_receive(void *mhu_receiver_dev,
-+                                               void *mhu_sender_dev,
-+                                               uint32_t source);
-+
-+/**
-+ * \brief Notify NSPE that a PSA client call return result is replied.
-+ *        Implemented by platform specific inter-processor communicatio=
n driver.
-+ *
-+ * \retval TFM_PLAT_ERR_SUCCESS  The notification is successfully sent =
out.
-+ * \retval Other return code     Operation failed with an error code.
-+ */
-+enum tfm_plat_err_t tfm_multi_core_hal_reply(struct client_request_t *r=
eq);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __RSE_COMMS_HAL_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_pe=
rmissions_hal.h b/platform/ext/target/arm/corstone1000/rse_comms/rse_comm=
s_permissions_hal.h
-new file mode 100644
-index 000000000..5bd0124a6
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_permissio=
ns_hal.h
-@@ -0,0 +1,58 @@
-+/*
-+ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __RSE_COMMS_PERMISSIONS_HAL_H__
-+#define __RSE_COMMS_PERMISSIONS_HAL_H__
-+
-+#include "psa/client.h"
-+#include "tfm_plat_defs.h"
-+#include "stdbool.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * \brief Check that RSE comms callers have permission to access a memo=
ry
-+ *        buffer.
-+ *
-+ * \param[in]  owner               The owner of host memory against whi=
ch the
-+ *                                 memory access is checked (e.g. MHU d=
evice).
-+ * \param[in]  host_ptr            Address of the memory region to be a=
ccessed.
-+ * \param[in]  size                Size of the memory region to be acce=
ssed.
-+ * \param[in]  is_write            True, if the memory access is a writ=
e
-+ *                                 operation, False otherwise.
-+ *
-+ * \retval TFM_PLAT_ERR_SUCCESS  Caller has permission to access buffer=
.
-+ * \retval Other return code     Caller does not have permission, or an=
 error
-+ *                               occurred.
-+ */
-+enum tfm_plat_err_t comms_permissions_memory_check(void *owner,
-+                                                   uint64_t host_ptr,
-+                                                   uint32_t size,
-+                                                   bool is_write);
-+
-+/**
-+ * \brief Check that RSE comms callers have permission to access a serv=
ice.
-+ *
-+ * \note in_vec and in_len are passed in as the Crypto partition encode=
s which
-+ *       function is requested in the first in_vec.
-+ *
-+ * \retval TFM_PLAT_ERR_SUCCESS  Caller has permission to access servic=
e.
-+ * \retval Other return code     Caller does not have permission, or an=
 error
-+ *                               occurred.
-+ */
-+enum tfm_plat_err_t comms_permissions_service_check(psa_handle_t handle=
,
-+                                                    const psa_invec *in=
_vec,
-+                                                    size_t in_len,
-+                                                    int32_t type);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __RSE_COMMS_PERMISSIONS_HAL_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_pr=
otocol.c b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_proto=
col.c
-new file mode 100644
-index 000000000..94b7995b9
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_protocol.=
c
-@@ -0,0 +1,120 @@
-+/*
-+ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#include "rse_comms_protocol.h"
-+
-+#include "tfm_spm_log.h"
-+#include <string.h>
-+
-+enum tfm_plat_err_t rse_protocol_deserialize_msg(
-+        struct client_request_t *req, struct serialized_psa_msg_t *msg,
-+        size_t msg_len)
-+{
-+    if (msg_len < sizeof(msg->header)) {
-+        return TFM_PLAT_ERR_INVALID_INPUT;
-+    }
-+
-+    req->protocol_ver =3D msg->header.protocol_ver;
-+    req->seq_num =3D msg->header.seq_num;
-+    req->client_id =3D msg->header.client_id;
-+
-+    switch (msg->header.protocol_ver) {
-+#ifdef RSE_COMMS_PROTOCOL_EMBED_ENABLED
-+    case RSE_COMMS_PROTOCOL_EMBED:
-+        SPMLOG_DBGMSG("[COMMS] Deserializing as embed message\r\n");
-+        return rse_protocol_embed_deserialize_msg(req, &msg->msg.embed,
-+            msg_len - sizeof(struct serialized_rse_comms_header_t));
-+#endif /* RSE_COMMS_PROTOCOL_EMBED_ENABLED */
-+#ifdef RSE_COMMS_PROTOCOL_POINTER_ACCESS_ENABLED
-+    case RSE_COMMS_PROTOCOL_POINTER_ACCESS:
-+        SPMLOG_DBGMSG("[COMMS] Deserializing as pointer_access message\=
r\n");
-+        return rse_protocol_pointer_access_deserialize_msg(req, &msg->m=
sg.pointer_access,
-+                                               msg_len - sizeof(struct =
serialized_rse_comms_header_t));
-+#endif
-+    default:
-+        return TFM_PLAT_ERR_UNSUPPORTED;
-+    }
-+}
-+
-+enum tfm_plat_err_t rse_protocol_serialize_reply(struct client_request_=
t *req,
-+        struct serialized_psa_reply_t *reply, size_t *reply_size)
-+{
-+    enum tfm_plat_err_t err;
-+
-+    memset(reply, 0, sizeof(struct serialized_psa_reply_t));
-+
-+    reply->header.protocol_ver =3D req->protocol_ver;
-+    reply->header.seq_num =3D req->seq_num;
-+    reply->header.client_id =3D req->client_id;
-+
-+    switch (reply->header.protocol_ver) {
-+#ifdef RSE_COMMS_PROTOCOL_EMBED_ENABLED
-+    case RSE_COMMS_PROTOCOL_EMBED:
-+        err =3D rse_protocol_embed_serialize_reply(req, &reply->reply.e=
mbed,
-+                                                 reply_size);
-+        if (err !=3D TFM_PLAT_ERR_SUCCESS) {
-+            return err;
-+        }
-+        break;
-+#endif /* RSE_COMMS_PROTOCOL_EMBED_ENABLED */
-+#ifdef RSE_COMMS_PROTOCOL_POINTER_ACCESS_ENABLED
-+    case RSE_COMMS_PROTOCOL_POINTER_ACCESS:
-+        err =3D rse_protocol_pointer_access_serialize_reply(req,
-+                &reply->reply.pointer_access, reply_size);
-+        if (err !=3D TFM_PLAT_ERR_SUCCESS) {
-+            return err;
-+        }
-+        break;
-+#endif
-+    default:
-+        return TFM_PLAT_ERR_UNSUPPORTED;
-+    }
-+
-+    *reply_size +=3D sizeof(struct serialized_rse_comms_header_t);
-+
-+    return TFM_PLAT_ERR_SUCCESS;
-+}
-+
-+enum tfm_plat_err_t rse_protocol_serialize_error(
-+        struct client_request_t *req,
-+        struct serialized_rse_comms_header_t *header, psa_status_t erro=
r,
-+        struct serialized_psa_reply_t *reply, size_t *reply_size)
-+{
-+    enum tfm_plat_err_t err;
-+
-+    memset(reply, 0, sizeof(struct serialized_psa_reply_t));
-+    memcpy(&reply->header, header,
-+           sizeof(struct serialized_rse_comms_header_t));
-+
-+    switch (reply->header.protocol_ver) {
-+#ifdef RSE_COMMS_PROTOCOL_EMBED_ENABLED
-+    case RSE_COMMS_PROTOCOL_EMBED:
-+        err =3D rse_protocol_embed_serialize_error(req, error,
-+                                                 &reply->reply.embed,
-+                                                 reply_size);
-+        if (err !=3D TFM_PLAT_ERR_SUCCESS) {
-+            return err;
-+        }
-+        break;
-+#endif /* RSE_COMMS_PROTOCOL_EMBED_ENABLED */
-+#ifdef RSE_COMMS_PROTOCOL_POINTER_ACCESS_ENABLED
-+    case RSE_COMMS_PROTOCOL_POINTER_ACCESS:
-+        err =3D rse_protocol_pointer_access_serialize_error(req, error,
-+                &reply->reply.pointer_access, reply_size);
-+        if (err !=3D TFM_PLAT_ERR_SUCCESS) {
-+            return err;
-+        }
-+        break;
-+#endif
-+    default:
-+        return TFM_PLAT_ERR_UNSUPPORTED;
-+    }
-+
-+    *reply_size +=3D sizeof(struct serialized_rse_comms_header_t);
-+
-+    return TFM_PLAT_ERR_SUCCESS;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_pr=
otocol.h b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_proto=
col.h
-new file mode 100644
-index 000000000..c30825f4c
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_protocol.=
h
-@@ -0,0 +1,129 @@
-+/*
-+ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __RSE_COMMS_PROTOCOL_H__
-+#define __RSE_COMMS_PROTOCOL_H__
-+
-+#include "psa/client.h"
-+#include "cmsis_compiler.h"
-+#include "rse_comms.h"
-+#include "tfm_platform_system.h"
-+
-+#ifdef RSE_COMMS_PROTOCOL_EMBED_ENABLED
-+#include "rse_comms_protocol_embed.h"
-+#endif /* RSE_COMMS_PROTOCOL_EMBED_ENABLED */
-+
-+#ifdef RSE_COMMS_PROTOCOL_POINTER_ACCESS_ENABLED
-+#include "rse_comms_protocol_pointer_access.h"
-+#endif /* RSE_MHU_PROTOCOL_V0_ENABLED */
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+enum rse_comms_protocol_version_t {
-+#ifdef RSE_COMMS_PROTOCOL_EMBED_ENABLED
-+    RSE_COMMS_PROTOCOL_EMBED =3D 0,
-+#endif /* RSE_COMMS_PROTOCOL_EMBED_ENABLED */
-+#ifdef RSE_COMMS_PROTOCOL_POINTER_ACCESS_ENABLED
-+    RSE_COMMS_PROTOCOL_POINTER_ACCESS =3D 1,
-+#endif /* RSE_COMMS_PROTOCOL_POINTER_ACCESS_ENABLED */
-+};
-+
-+
-+__PACKED_STRUCT serialized_rse_comms_header_t {
-+    uint8_t protocol_ver;
-+    uint8_t seq_num;
-+    uint16_t client_id;
-+};
-+
-+/* MHU message passed from NSPE to SPE to deliver a PSA client call */
-+__PACKED_STRUCT serialized_psa_msg_t {
-+    struct serialized_rse_comms_header_t header;
-+    __PACKED_UNION {
-+#ifdef RSE_COMMS_PROTOCOL_EMBED_ENABLED
-+        struct rse_embed_msg_t embed;
-+#endif /* RSE_COMMS_PROTOCOL_EMBED_ENABLED */
-+#ifdef RSE_COMMS_PROTOCOL_POINTER_ACCESS_ENABLED
-+        struct rse_pointer_access_msg_t pointer_access;
-+#endif /* RSE_COMMS_PROTOCOL_POINTER_ACCESS_ENABLED */
-+    } msg;
-+};
-+
-+/* MHU reply message to hold the PSA client call return result from SPE=
 */
-+__PACKED_STRUCT serialized_psa_reply_t {
-+    struct serialized_rse_comms_header_t header;
-+    __PACKED_UNION {
-+#ifdef RSE_COMMS_PROTOCOL_EMBED_ENABLED
-+        struct rse_embed_reply_t embed;
-+#endif /* RSE_COMMS_PROTOCOL_EMBED_ENABLED */
-+#ifdef RSE_COMMS_PROTOCOL_POINTER_ACCESS_ENABLED
-+        struct rse_pointer_access_reply_t pointer_access;
-+#endif /* RSE_COMMS_PROTOCOL_POINTER_ACCESS_ENABLED */
-+    } reply;
-+};
-+
-+/**
-+ * \brief Convert a serialized message to a client_request_t.
-+ *
-+ * \param[out] req               The client_request_t to fill.
-+ * \param[in]  msg               The serialized message to extract data=
 from.
-+ * \param[in]  msg_len           The size of the message.
-+ *
-+ * \note   The sanitization of the client request structure is the
-+ *         responsibility of the caller.
-+ *
-+ * \retval TFM_PLAT_ERR_SUCCESS  Operation succeeded.
-+ * \retval Other return code     Operation failed with an error code.
-+ */
-+enum tfm_plat_err_t rse_protocol_deserialize_msg(struct client_request_=
t *req,
-+        struct serialized_psa_msg_t *msg, size_t msg_len);
-+
-+/**
-+ * \brief Convert a a client_request_t to a serialized reply.
-+ *
-+ * \param[in]  req               The client_request_t to serialize data=
 from.
-+ * \param[out] reply             The reply to fill.
-+ * \param[out] reply_size        The size of the reply that was filled.
-+ *
-+ * \retval TFM_PLAT_ERR_SUCCESS  Operation succeeded.
-+ * \retval Other return code     Operation failed with an error code.
-+ */
-+enum tfm_plat_err_t rse_protocol_serialize_reply(struct client_request_=
t *req,
-+        struct serialized_psa_reply_t *reply, size_t *reply_size);
-+
-+/**
-+ * \brief Create a serialised error reply from a header and an error co=
de.
-+ *        Intended to for the RSE to notify the AP of errors during the=
 message
-+ *        deserialization phase.
-+ *
-+ * \param[in]  req               The client_request_t to serialize data=
 from. If
-+ *                               the error occured in allocation this p=
ointer
-+ *                               may be NULL. This may not contain mess=
age
-+ *                               header information if the message
-+ *                               deserialize failed.
-+ * \param[in]  header            The header of the received
-+ *                               serialized_psa_msg_t whose deserializa=
tion
-+ *                               caused the error.
-+ * \param[in]  error             The error code to be transmitted to th=
e AP.
-+ * \param[out] reply             The reply to fill.
-+ * \param[out] reply_size        The size of the reply that was filled.
-+ *
-+ * \retval TFM_PLAT_ERR_SUCCESS  Operation succeeded.
-+ * \retval Other return code     Operation failed with an error code.
-+ */
-+enum tfm_plat_err_t rse_protocol_serialize_error(
-+        struct client_request_t *req,
-+        struct serialized_rse_comms_header_t *header, psa_status_t erro=
r,
-+        struct serialized_psa_reply_t *reply, size_t *reply_size);
-+
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __RSE_COMMS_PROTOCOL_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_pr=
otocol_embed.c b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms=
_protocol_embed.c
-new file mode 100644
-index 000000000..5544f9fb8
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_protocol_=
embed.c
-@@ -0,0 +1,105 @@
-+/*
-+ * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#include "rse_comms_protocol_embed.h"
-+
-+#include <string.h>
-+
-+#include "tfm_psa_call_pack.h"
-+
-+enum tfm_plat_err_t rse_protocol_embed_deserialize_msg(
-+        struct client_request_t *req, struct rse_embed_msg_t *msg,
-+        size_t msg_len)
-+{
-+    uint32_t payload_size =3D 0;
-+    uint32_t i;
-+
-+    if (msg_len < (sizeof(*msg) - sizeof(msg->payload))) {
-+        return TFM_PLAT_ERR_INVALID_INPUT;
-+    }
-+
-+    req->in_len =3D PARAM_UNPACK_IN_LEN(msg->ctrl_param);
-+    req->out_len =3D PARAM_UNPACK_OUT_LEN(msg->ctrl_param);
-+    req->type =3D PARAM_UNPACK_TYPE(msg->ctrl_param);
-+    req->handle =3D msg->handle;
-+
-+    /* Only support 4 iovecs */
-+    if (req->in_len + req->out_len > 4) {
-+        return TFM_PLAT_ERR_UNSUPPORTED;
-+    }
-+
-+    /* Invecs */
-+    for (i =3D 0; i < req->in_len; ++i) {
-+        req->in_vec[i].base =3D req->param_copy_buf + payload_size;
-+        req->in_vec[i].len =3D msg->io_size[i];
-+        payload_size +=3D msg->io_size[i];
-+    }
-+
-+    /* Check payload is not too big */
-+    if (payload_size > sizeof(req->param_copy_buf)
-+        || payload_size > sizeof(msg->payload)
-+        || sizeof(*msg) - sizeof(msg->payload) +  payload_size > msg_le=
n ) {
-+        return TFM_PLAT_ERR_INVALID_INPUT;
-+    }
-+
-+    /* Copy payload into the buffer */
-+    memcpy(req->param_copy_buf, msg->payload, payload_size);
-+
-+    /* Outvecs */
-+    for (i =3D 0; i < req->out_len; ++i) {
-+        req->out_vec[i].base =3D req->param_copy_buf + payload_size;
-+        req->out_vec[i].len =3D msg->io_size[req->in_len + i];
-+        payload_size +=3D msg->io_size[req->in_len + i];
-+    }
-+
-+    /* Check payload is not too big */
-+    if (payload_size > sizeof(req->param_copy_buf)) {
-+        return TFM_PLAT_ERR_INVALID_INPUT;
-+    }
-+
-+    return TFM_PLAT_ERR_SUCCESS;
-+}
-+
-+enum tfm_plat_err_t rse_protocol_embed_serialize_reply(
-+        struct client_request_t *req, struct rse_embed_reply_t *reply,
-+        size_t *reply_size)
-+{
-+    size_t payload_size =3D 0;
-+    size_t len;
-+    uint32_t i;
-+
-+    reply->return_val =3D req->return_val;
-+
-+    /* Outvecs */
-+    for (i =3D 0; i < req->out_len; ++i) {
-+        len =3D req->out_vec[i].len;
-+
-+        if (payload_size + len > sizeof(reply->payload)) {
-+            return TFM_PLAT_ERR_UNSUPPORTED;
-+        }
-+
-+        memcpy(reply->payload + payload_size, req->out_vec[i].base, len=
);
-+        reply->out_size[i] =3D len;
-+        payload_size +=3D len;
-+    }
-+
-+    *reply_size =3D sizeof(*reply) - sizeof(reply->payload) + payload_s=
ize;
-+
-+    return TFM_PLAT_ERR_SUCCESS;
-+}
-+
-+enum tfm_plat_err_t rse_protocol_embed_serialize_error(
-+        struct client_request_t *req, psa_status_t err,
-+        struct rse_embed_reply_t *reply, size_t *reply_size)
-+{
-+    reply->return_val =3D err;
-+
-+    /* Return the minimum reply size, as the out_sizes are all zeroed *=
/
-+    *reply_size =3D sizeof(*reply) - sizeof(reply->payload);
-+
-+    return TFM_PLAT_ERR_SUCCESS;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_pr=
otocol_embed.h b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms=
_protocol_embed.h
-new file mode 100644
-index 000000000..e1ca1d0c9
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_protocol_=
embed.h
-@@ -0,0 +1,50 @@
-+/*
-+ * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __RSE_COMMS_PROTOCOL_EMBED_H__
-+#define __RSE_COMMS_PROTOCOL_EMBED_H__
-+
-+#include "psa/client.h"
-+#include "cmsis_compiler.h"
-+#include "rse_comms.h"
-+#include "tfm_platform_system.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+__PACKED_STRUCT rse_embed_msg_t {
-+    psa_handle_t handle;
-+    uint32_t ctrl_param; /* type, in_len, out_len */
-+    uint16_t io_size[PSA_MAX_IOVEC];
-+    uint8_t payload[RSE_COMMS_PAYLOAD_MAX_SIZE];
-+};
-+
-+__PACKED_STRUCT rse_embed_reply_t {
-+    int32_t return_val;
-+    uint16_t out_size[PSA_MAX_IOVEC];
-+    uint8_t payload[RSE_COMMS_PAYLOAD_MAX_SIZE];
-+};
-+
-+enum tfm_plat_err_t rse_protocol_embed_deserialize_msg(
-+        struct client_request_t *req, struct rse_embed_msg_t *msg,
-+        size_t msg_len);
-+
-+enum tfm_plat_err_t rse_protocol_embed_serialize_reply(
-+        struct client_request_t *req, struct rse_embed_reply_t *reply,
-+        size_t *reply_size);
-+
-+enum tfm_plat_err_t rse_protocol_embed_serialize_error(
-+        struct client_request_t *req, psa_status_t err,
-+        struct rse_embed_reply_t *reply, size_t *reply_size);
-+
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __RSE_COMMS_PROTOCOL_EMBED_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_qu=
eue.c b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_queue.c
-new file mode 100644
-index 000000000..d7f244db6
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_queue.c
-@@ -0,0 +1,64 @@
-+/*
-+ * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#include "rse_comms_queue.h"
-+
-+#include <stdbool.h>
-+#include <stddef.h>
-+
-+#define QUEUE_SIZE (RSE_COMMS_MAX_CONCURRENT_REQ + 1)
-+
-+struct queue_t {
-+    void *buf[QUEUE_SIZE];
-+    size_t head;
-+    size_t tail;
-+};
-+
-+static struct queue_t queue;
-+
-+/* Advance head or tail */
-+static size_t advance(size_t index)
-+{
-+    if (++index =3D=3D QUEUE_SIZE) {
-+        index =3D 0;
-+    }
-+    return index;
-+}
-+
-+static inline bool is_empty(void)
-+{
-+    return queue.head =3D=3D queue.tail;
-+}
-+
-+static inline bool is_full(void)
-+{
-+    return advance(queue.head) =3D=3D queue.tail;
-+}
-+
-+int32_t queue_enqueue(void *entry)
-+{
-+    if (is_full()) {
-+        return -1;
-+    }
-+
-+    queue.buf[queue.head] =3D entry;
-+    queue.head =3D advance(queue.head);
-+
-+    return 0;
-+}
-+
-+int32_t queue_dequeue(void **entry)
-+{
-+    if (is_empty()) {
-+        return -1;
-+    }
-+
-+    *entry =3D queue.buf[queue.tail];
-+    queue.tail =3D advance(queue.tail);
-+
-+    return 0;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_qu=
eue.h b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_queue.h
-new file mode 100644
-index 000000000..d3db1dd2e
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_queue.h
-@@ -0,0 +1,25 @@
-+/*
-+ * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __RSE_COMMS_QUEUE_H__
-+#define __RSE_COMMS_QUEUE_H__
-+
-+#include <stdint.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+int32_t queue_enqueue(void *entry);
-+
-+int32_t queue_dequeue(void **entry);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __RSE_COMMS_QUEUE_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms_permissions_=
hal.c b/platform/ext/target/arm/corstone1000/rse_comms_permissions_hal.c
-new file mode 100644
-index 000000000..59724bc94
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/rse_comms_permissions_hal.c
-@@ -0,0 +1,177 @@
-+/*
-+ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#include "rse_comms_permissions_hal.h"
-+
-+#include "device_definition.h"
-+#include "psa_manifest/sid.h"
-+#include "region_defs.h"
-+#include "tfm_hal_platform.h"
-+
-+#ifdef TFM_PARTITION_INITIAL_ATTESTATION
-+#include "tfm_attest_defs.h"
-+#endif /* TFM_PARTITION_INITIAL_ATTESTATION */
-+#ifdef TFM_PARTITION_MEASURED_BOOT
-+#include "measured_boot_defs.h"
-+#endif /* TFM_PARTITION_MEASURED_BOOT */
-+#ifdef TFM_PARTITION_DELEGATED_ATTESTATION
-+#include "tfm_delegated_attest_defs.h"
-+#endif /* TFM_PARTITION_DELEGATED_ATTESTATION */
-+#ifdef TFM_PARTITION_CRYPTO
-+#include "tfm_crypto_defs.h"
-+#endif /*TFM_PARTITION_CRYPTO */
-+#ifdef TFM_PARTITION_PLATFORM
-+#include "tfm_platform_api.h"
-+#endif /* TFM_PARTITION_PLATFORM */
-+#ifdef TFM_PARTITION_PROTECTED_STORAGE
-+#include "tfm_ps_defs.h"
-+#endif /* TFM_PARTITION_PROTECTED_STORAGE */
-+#ifdef TFM_PARTITION_INTERNAL_TRUSTED_STORAGE
-+#include "tfm_its_defs.h"
-+#endif /* TFM_PARTITION_INTERNAL_TRUSTED_STORAGE */
-+
-+#define INVALID_REGION_COUNTER_MAX  128
-+#define INVALID_SERVICE_COUNTER_MAX 64
-+
-+static uint32_t invalid_region_counter =3D 0;
-+static uint32_t invalid_service_counter =3D 0;
-+
-+/* Check if the interface is  getting a lot of invalid requests, and sh=
utdown
-+ * the system if it exceeds the threshold. This is intended to make fuz=
zing the
-+ * interface difficult.
-+ */
-+static void counter_check(void) {
-+    if (invalid_region_counter > INVALID_REGION_COUNTER_MAX) {
-+#ifdef CONFIG_TFM_HALT_ON_CORE_PANIC
-+        tfm_hal_system_halt();
-+#else
-+        tfm_hal_system_reset();
-+#endif /* CONFIG_TFM_HALT_ON_CORE_PANIC */
-+    }
-+
-+    if (invalid_service_counter > INVALID_SERVICE_COUNTER_MAX) {
-+#ifdef CONFIG_TFM_HALT_ON_CORE_PANIC
-+        tfm_hal_system_halt();
-+#else
-+        tfm_hal_system_reset();
-+#endif /* CONFIG_TFM_HALT_ON_CORE_PANIC */
-+    }
-+
-+    return;
-+}
-+
-+enum tfm_plat_err_t comms_permissions_memory_check(void *owner,
-+                                                   uint64_t host_ptr,
-+                                                   uint32_t size,
-+                                                   bool is_write)
-+{
-+    /* Is fully within the shared memory */
-+    if ((host_ptr >=3D INTER_PROCESSOR_HOST_SHARED_MEMORY_START_ADDR) &=
&
-+        ((host_ptr + size) < (INTER_PROCESSOR_HOST_SHARED_MEMORY_START_=
ADDR +
-+                              INTER_PROCESSOR_SHARED_MEMORY_SIZE))) {
-+      return TFM_PLAT_ERR_SUCCESS;
-+    }
-+
-+    invalid_region_counter++;
-+    counter_check();
-+
-+    return TFM_PLAT_ERR_UNSUPPORTED;
-+}
-+
-+enum tfm_plat_err_t comms_permissions_service_check(psa_handle_t handle=
,
-+                                                    const psa_invec *in=
_vec,
-+                                                    size_t in_len,
-+                                                    int32_t type)
-+{
-+    switch(handle) {
-+#ifdef TFM_PARTITION_PROTECTED_STORAGE
-+    case TFM_PROTECTED_STORAGE_SERVICE_HANDLE:
-+        switch(type) {
-+        case TFM_PS_SET:
-+        case TFM_PS_GET:
-+        case TFM_PS_GET_INFO:
-+        case TFM_PS_REMOVE:
-+        case TFM_PS_GET_SUPPORT:
-+            return TFM_PLAT_ERR_SUCCESS;
-+        default:
-+            goto out_err;
-+        }
-+#endif /* TFM_PARTITION_INTERNAL_TRUSTED_STORAGE */
-+
-+#ifdef TFM_PARTITION_INITIAL_ATTESTATION
-+    case TFM_ATTESTATION_SERVICE_HANDLE:
-+        switch(type) {
-+        case TFM_ATTEST_GET_TOKEN:
-+        case TFM_ATTEST_GET_TOKEN_SIZE:
-+            return TFM_PLAT_ERR_SUCCESS;
-+        default:
-+            goto out_err;
-+        }
-+#endif /* TFM_PARTITION_INITIAL_ATTESTATION */
-+#ifdef TFM_PARTITION_DELEGATED_ATTESTATION
-+    case TFM_DELEGATED_ATTESTATION_HANDLE:
-+        switch(type) {
-+        case DELEGATED_ATTEST_GET_DELEGATED_KEY:
-+        case DELEGATED_ATTEST_GET_PLATFORM_TOKEN:
-+            return TFM_PLAT_ERR_SUCCESS;
-+        default:
-+            goto out_err;
-+        }
-+#endif /* TFM_PARTITION_DELEGATED_ATTESTATION */
-+#ifdef TFM_PARTITION_MEASURED_BOOT
-+    case TFM_MEASURED_BOOT_HANDLE:
-+        switch(type) {
-+        case TFM_MEASURED_BOOT_EXTEND:
-+        case TFM_MEASURED_BOOT_READ:
-+            return TFM_PLAT_ERR_SUCCESS;
-+        default:
-+            goto out_err;
-+        }
-+#endif /* TFM_PARTITION_MEASURED_BOOT */
-+#ifdef TFM_PARTITION_CRYPTO
-+    case TFM_CRYPTO_HANDLE:
-+        /* Every crypto operation is done by the SE */
-+        return TFM_PLAT_ERR_SUCCESS;
-+#endif /* TFM_PARTITION_CRYPTO */
-+#ifdef TFM_PARTITION_PLATFORM
-+    case TFM_PLATFORM_SERVICE_HANDLE:
-+        switch(type) {
-+        case TFM_PLATFORM_API_ID_NV_READ:
-+        case TFM_PLATFORM_API_ID_NV_INCREMENT:
-+        case TFM_PLATFORM_API_ID_SYSTEM_RESET:
-+        case TFM_PLATFORM_API_ID_IOCTL:
-+            return TFM_PLAT_ERR_SUCCESS;
-+        default:
-+            goto out_err;
-+        }
-+#endif /* TFM_PARTITION_PLATFORM */
-+#ifdef TFM_PARTITION_INTERNAL_TRUSTED_STORAGE
-+    case TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_HANDLE:
-+        switch(type) {
-+        case TFM_ITS_SET:
-+        case TFM_ITS_GET:
-+        case TFM_ITS_GET_INFO:
-+        case TFM_ITS_REMOVE:
-+            return TFM_PLAT_ERR_SUCCESS;
-+        default:
-+            goto out_err;
-+        }
-+#endif /* TFM_PARTITION_INTERNAL_TRUSTED_STORAGE */
-+#ifdef TFM_PARTITION_DPE
-+    case TFM_DPE_SERVICE_HANDLE:
-+        return TFM_PLAT_ERR_SUCCESS;
-+#endif /* TFM_PARTITION_DPE */
-+    default:
-+        goto out_err;
-+    }
-+
-+out_err:
-+    invalid_service_counter++;
-+    counter_check();
-+
-+    return TFM_PLAT_ERR_UNSUPPORTED;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/tfm_interrupts.c b/pla=
tform/ext/target/arm/corstone1000/tfm_interrupts.c
-new file mode 100644
-index 000000000..47a6c9d7b
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/tfm_interrupts.c
-@@ -0,0 +1,51 @@
-+/*
-+ * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
-+ * Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon
-+ * company) or an affiliate of Cypress Semiconductor Corporation. All r=
ights
-+ * reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#include "cmsis.h"
-+#include "device_definition.h"
-+#include "spm.h"
-+#include "tfm_hal_interrupt.h"
-+#include "tfm_peripherals_def.h"
-+#include "interrupt.h"
-+#include "load/interrupt_defs.h"
-+#include "platform_irq.h"
-+#include "rse_comms_hal.h"
-+
-+static struct irq_t mbox_irq_info =3D {0};
-+
-+/* Platform specific inter-processor communication interrupt handler. *=
/
-+void HSE1_RECEIVER_COMBINED_IRQHandler(void)
-+{
-+    (void)tfm_multi_core_hal_receive(&MHU1_HOST_TO_SE_DEV,
-+                                     &MHU1_SE_TO_HOST_DEV,
-+                                     mbox_irq_info.p_ildi->source);
-+
-+    /*
-+     * SPM will send a MAILBOX_SIGNAL to the corresponding partition
-+     * indicating that a message has arrived and can be processed.
-+     */
-+    spm_handle_interrupt(mbox_irq_info.p_pt, mbox_irq_info.p_ildi);
-+}
-+
-+enum tfm_hal_status_t mailbox_irq_init(void *p_pt,
-+                                       const struct irq_load_info_t *p_=
ildi)
-+{
-+    mbox_irq_info.p_pt =3D p_pt;
-+    mbox_irq_info.p_ildi =3D p_ildi;
-+
-+    /* Set MHU interrupt priority to the same as PendSV (the lowest)
-+     * TODO: Consider advantages/disadvantages of setting it one higher
-+     */
-+    NVIC_SetPriority(HSE1_RECEIVER_COMBINED_IRQn, NVIC_GetPriority(Pend=
SV_IRQn));
-+
-+    NVIC_DisableIRQ(HSE1_RECEIVER_COMBINED_IRQn);
-+
-+    return TFM_HAL_SUCCESS;
-+}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-c=
orstone1000-Increase-buffers-for-EFI-vars.patch
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0008-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch
index abf70389..1070afc0 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch
@@ -1,7 +1,7 @@
-From d7725e629c9ba93523589cc9d8af3186db19d4e8 Mon Sep 17 00:00:00 2001
+From 9dd3287693c259a88d81140c26f9c792d808dd7c Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Wed, 15 May 2024 22:37:51 +0200
-Subject: [PATCH] Platform: corstone1000: Increase buffers for EFI vars
+Subject: [PATCH 08/10] Platform: corstone1000: Increase buffers for EFI =
vars
=20
 The UEFI variables are stored in the Protected Storage. The size of
 the variables metadata have been increased so the related buffer sizes
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-corstone1000-Remove-reset-after-capsule-update.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-corstone1000-Re=
move-reset-after-capsule-update.patch
similarity index 88%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0012-corstone1000-Remove-reset-after-capsule-update.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0009-corstone1000-Remove-reset-after-capsule-update.patch
index 8ffd567b..e3333c53 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-corstone1000-Remove-reset-after-capsule-update.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-corstone1000-Remove-reset-after-capsule-update.patch
@@ -1,7 +1,7 @@
-From 78db43f80676f8038b35edd6674d22fb5ff85c12 Mon Sep 17 00:00:00 2001
+From 898d3c148521b331302c587e658d7e0a4f645c77 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Mon, 27 May 2024 17:11:31 +0200
-Subject: [PATCH] corstone1000: Remove reset after capsule update
+Subject: [PATCH 09/10] corstone1000: Remove reset after capsule update
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
 Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/29065]
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-platform-CS1000-Add-multicore-support-for-FVP.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-platform-CS1000-=
Add-multicore-support-for-FVP.patch
similarity index 93%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0013-platform-CS1000-Add-multicore-support-for-FVP.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0010-platform-CS1000-Add-multicore-support-for-FVP.patch
index 9ede5341..28d81b8d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-platform-CS1000-Add-multicore-support-for-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-platform-CS1000-Add-multicore-support-for-FVP.patch
@@ -1,7 +1,7 @@
-From 1120957e74a1a0727a215188813cab3e47602e71 Mon Sep 17 00:00:00 2001
+From 1eb9bc330bf387ff26a6df93d3b8c843174dc40b Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 9 May 2024 13:20:57 +0000
-Subject: [PATCH] platform: CS1000: Add multicore support for FVP
+Subject: [PATCH 10/10] platform: CS1000: Add multicore support for FVP
=20
 This changeset adds the support to enable the secondary cores for
 the Corstone-1000 FVP
@@ -15,10 +15,10 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh=
.tungal@arm.com>
  3 files changed, 48 insertions(+), 2 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index e2a7ac302..a269251aa 100644
+index 95e3f57b4f..e46123cc6f 100644
 --- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
 +++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -374,6 +374,12 @@ target_sources(tfm_psa_rot_partition_ns_agent_mailb=
ox
+@@ -381,6 +381,12 @@ target_sources(tfm_psa_rot_partition_ns_agent_mailb=
ox
          tfm_hal_multi_core.c
  )
 =20
@@ -32,7 +32,7 @@ index e2a7ac302..a269251aa 100644
 =20
  target_sources(tfm_spm
 diff --git a/platform/ext/target/arm/corstone1000/Device/Config/device_c=
fg.h b/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
-index 222905d3d..9d48f119e 100644
+index 222905d3dd..9d48f119ed 100644
 --- a/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
 +++ b/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
 @@ -45,5 +45,11 @@
@@ -48,7 +48,7 @@ index 222905d3d..9d48f119e 100644
 =20
  #endif  /* __DEVICE_CFG_H__ */
 diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
-index f0e2bc333..ce72e50c9 100644
+index f0e2bc333a..ce72e50c9b 100644
 --- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
 +++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
 @@ -11,9 +11,14 @@
@@ -115,5 +115,5 @@ index f0e2bc333..ce72e50c9 100644
 =20
  #ifdef EXTERNAL_SYSTEM_SUPPORT
 --=20
-2.34.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-Platform-Corstone1000-switch-to-metadata-v2.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0011-Platform-Corstone1=
000-switch-to-metadata-v2.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0014-Platform-Corstone1000-switch-to-metadata-v2.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0011-Platform-Corstone1000-switch-to-metadata-v2.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-platform-corstone1000-Increase-flash-PS-area-size.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-platform-cor=
stone1000-Increase-flash-PS-area-size.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0015-platform-corstone1000-Increase-flash-PS-area-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0012-platform-corstone1000-Increase-flash-PS-area-size.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index ffbd6657..dd0c7f3e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -18,21 +18,18 @@ SRC_URI +=3D " \
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append:corstone1000 =3D " \
-    file://0001-platform-corstone1000-Update-MPU-configuration.patch \
-    file://0002-platform-corstone1000-Cover-S_DATA-with-MPU.patch \
-    file://0003-platform-corstone1000-align-capsule-update-structs.patch=
 \
-    file://0004-Platform-Corstone1000-skip-the-first-nv-counter.patch \
-    file://0005-platform-corstone1000-add-unique-guid-for-mps3.patch \
-    file://0006-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch =
\
-    file://0007-platform-corstone1000-Increase-ITS-max-asset-size.patch =
\
-    file://0008-Platform-CS1000-Replace-OpenAMP-with-RSE_COMMS.patch \
-    file://0009-platform-corstone1000-Increase-RSE_COMMS-buffer-size.pat=
ch \
-    file://0010-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
-    file://0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patc=
h \
-    file://0012-corstone1000-Remove-reset-after-capsule-update.patch \
-    file://0013-platform-CS1000-Add-multicore-support-for-FVP.patch \
-    file://0014-Platform-Corstone1000-switch-to-metadata-v2.patch \
-    file://0015-platform-corstone1000-Increase-flash-PS-area-size.patch =
\
+    file://0001-platform-corstone1000-align-capsule-update-structs.patch=
 \
+    file://0002-Platform-Corstone1000-skip-the-first-nv-counter.patch \
+    file://0003-platform-corstone1000-add-unique-guid-for-mps3.patch \
+    file://0004-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch =
\
+    file://0005-platform-corstone1000-Increase-ITS-max-asset-size.patch =
\
+    file://0006-platform-corstone1000-Increase-RSE_COMMS-buffer-size.pat=
ch \
+    file://0007-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
+    file://0008-Platform-corstone1000-Increase-buffers-for-EFI-vars.patc=
h \
+    file://0009-corstone1000-Remove-reset-after-capsule-update.patch \
+    file://0010-platform-CS1000-Add-multicore-support-for-FVP.patch \
+    file://0011-Platform-Corstone1000-switch-to-metadata-v2.patch \
+    file://0012-platform-corstone1000-Increase-flash-PS-area-size.patch =
\
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.25.1


