Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92858C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.33477.1753876439382808333
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D5E72936;
	Wed, 30 Jul 2025 04:53:51 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E2073F66E;
	Wed, 30 Jul 2025 04:53:58 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 09/13] arm-bsp/trusted-firmware-m: corstone1000: Remove patches for old capsule update implementation
Date: Wed, 30 Jul 2025 12:53:23 +0100
Message-Id: <20250730115327.3671160-10-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6646

This commit removes the outdated patches of capsule update implementation=
 for the Corstone-1000
platform targeting Trusted-Firmware-M (TF-M). The changes include the rem=
oval of
obsolete out-of-tree patches and the rebase of retained patches to align =
with the
latest upstream TF-M integration.

Key changes:
- Dropped legacy TF-M patches related to old capsule update flow
- Rebasing of remaining TF-M patches for compatibility with current TF-M =
baseline

This cleanup streamlines the TF-M integration for Corstone-1000 in prepar=
ation for
the updated PSA Firmware Update (FWU) aligned capsule update support.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...stone1000-Align-capsule-UEFI-structs.patch |  97 -----
 ...Corstone1000-Enable-firewall-in-FVP.patch} |   0
 ...-CS1000-Increase-ITS-max-asset-size.patch} |   0
 ...-Corstone1000-Fix-NV-counter-writing.patch |  69 ----
 ...1000-Increase-RSE_COMMS-buffer-size.patch} |   0
 ...S1000-Increase-buffers-for-EFI-vars.patch} |   0
 ...-CS1000-Increase-flash-PS-area-size.patch} |   0
 ...S1000-Add-multicore-support-for-FVP.patch} |   0
 ...m-Corstone1000-Switch-to-metadata-v2.patch | 202 ----------
 ...07-Platform-CS1000-Fix-Bank-offsets.patch} |   0
 ...-CS1000-Increase-BL2-partition-size.patch} |   0
 ...Add-PSA_WANT_ALG_SHA_256-definition.patch} |   0
 ...00-Remove-reset-after-capsule-update.patch |  28 --
 ...-CS1000-Add-crypto-configs-for-ADAC.patch} |   0
 ...rm-CS1000-Fix-platform-name-in-logs.patch} |   0
 ...form-CS1000-Remove-unused-BL1-files.patch} |   0
 ...m-CS1000-Fix-compiler-switch-in-BL1.patch} |   0
 ...C312-alignment-of-cc312-differences.patch} |   0
 ...ne1000-Allow-FWU-calls-in-RSE-COMMS.patch} |   0
 ...-specific-TFM_FWU_BOOTLOADER_LIB-se.patch} |   0
 ...latform-CS1000-Enable-FWU-partition.patch} |   0
 ...000-Remove-duplicated-metadata-write.patch |  61 ---
 ...1000-Implement-Bootloader-Abstracti.patch} |   0
 ...-Corstone1000-Increase-buffer-sizes.patch} |   0
 ...1000-Validate-both-metadata-replicas.patch | 370 ------------------
 ...orstone1000-add-unique-guid-for-mps3.patch |  41 --
 .../trusted-firmware-m-corstone1000.inc       |  45 +--
 27 files changed, 19 insertions(+), 894 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-Platform-Corstone1000-Align-capsule-UEFI-structs.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
003-Platform-Corstone1000-Enable-firewall-in-FVP.patch =3D> 0001-Platform=
-Corstone1000-Enable-firewall-in-FVP.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
004-Platform-CS1000-Increase-ITS-max-asset-size.patch =3D> 0002-Platform-=
CS1000-Increase-ITS-max-asset-size.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-Corstone1000-Fix-NV-counter-writing.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
005-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch =3D> 0003-Platfo=
rm-CS1000-Increase-RSE_COMMS-buffer-size.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
006-Platform-CS1000-Increase-buffers-for-EFI-vars.patch =3D> 0004-Platfor=
m-CS1000-Increase-buffers-for-EFI-vars.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
008-Platform-CS1000-Increase-flash-PS-area-size.patch =3D> 0005-Platform-=
CS1000-Increase-flash-PS-area-size.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
010-platform-CS1000-Add-multicore-support-for-FVP.patch =3D> 0006-platfor=
m-CS1000-Add-multicore-support-for-FVP.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-Plaform-Corstone1000-Switch-to-metadata-v2.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
011-Platform-CS1000-Fix-Bank-offsets.patch =3D> 0007-Platform-CS1000-Fix-=
Bank-offsets.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
012-Platform-CS1000-Increase-BL2-partition-size.patch =3D> 0008-Platform-=
CS1000-Increase-BL2-partition-size.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
013-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch =3D> 0009-CC312-=
ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-corstone1000-Remove-reset-after-capsule-update.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
014-Platform-CS1000-Add-crypto-configs-for-ADAC.patch =3D> 0010-Platform-=
CS1000-Add-crypto-configs-for-ADAC.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
015-Platform-CS1000-Fix-platform-name-in-logs.patch =3D> 0011-Platform-CS=
1000-Fix-platform-name-in-logs.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
017-Platform-CS1000-Remove-unused-BL1-files.patch =3D> 0012-Platform-CS10=
00-Remove-unused-BL1-files.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
019-Platform-CS1000-Fix-compiler-switch-in-BL1.patch =3D> 0013-Platform-C=
S1000-Fix-compiler-switch-in-BL1.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
022-CC312-alignment-of-cc312-differences.patch =3D> 0014-CC312-alignment-=
of-cc312-differences.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
024-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch =3D> 0015-Pl=
atform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
025-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch =3D> 0016-=
FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
026-Platform-CS1000-Enable-FWU-partition.patch =3D> 0017-Platform-CS1000-=
Enable-FWU-partition.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-Platform-CS1000-Remove-duplicated-metadata-write.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
027-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch =3D> 0018-=
Platform-Corstone1000-Implement-Bootloader-Abstracti.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
028-Platform-Corstone1000-Increase-buffer-sizes.patch =3D> 0019-Platform-=
Corstone1000-Increase-buffer-sizes.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0020-Platform-CS1000-Validate-both-metadata-replicas.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0021-platform-corstone1000-add-unique-guid-for-mps3.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-Platform-Corstone1000-Align-capsule-UEFI-structs.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-Cors=
tone1000-Align-capsule-UEFI-structs.patch
deleted file mode 100644
index fbeb1540..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-Corstone1000-Align-capsule-UEFI-structs.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 6ac0d4ce58c1a957c5f086e8c32268fdfc3ea531 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Thu, 26 Oct 2023 11:46:04 +0100
-Subject: [PATCH 1/9] Platform: Corstone1000: Align capsule UEFI structs
-
-The UEFI capsules are generated using the U-Boot mkeficapsule tool.
-U-Boot uses packed struct for the UEFI and FMP structures, see [1].
-The structs have to be aligned in the TF-M side parser to avoid
-crashes.
-
-[1] https://github.com/u-boot/u-boot/blob/u-boot-2023.07.y/include/efi_a=
pi.h#L245
-
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [6ac0d4ce58c1a957c5f086e8c32268fdfc3ea531]
----
- .../fw_update_agent/uefi_capsule_parser.c       | 17 +++++++++--------
- 1 file changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.c b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.c
-index c706c040a..44566e08d 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
-@@ -1,10 +1,11 @@
- /*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
-+ * Copyright (c) 2021-2024, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-  */
-=20
-+#include "cmsis_compiler.h"
- #include "uefi_capsule_parser.h"
- #include "fwu_agent.h"
- #include <string.h>
-@@ -29,21 +30,21 @@ Update Capsule Structure (UEFI spec 2.9 1004)
-             Payload n (item_offset[embedded_driver_count + payload_item=
_count -1])
- */
-=20
--typedef struct {
-+typedef __PACKED_STRUCT {
-     struct efi_guid         capsule_guid;
-     uint32_t                header_size;
-     uint32_t                flags;
-     uint32_t                capsule_image_size;
- } efi_capsule_header_t;
-=20
--typedef struct {
-+typedef __PACKED_STRUCT {
-     uint32_t                version;
-     uint16_t                embedded_driver_count;
-     uint16_t                payload_item_count;
-     uint64_t                item_offset_list[];
- } efi_firmware_management_capsule_header_t;
-=20
--typedef struct {
-+typedef __PACKED_STRUCT {
-     uint32_t                version;
-     struct efi_guid         update_image_type_id;
-     uint8_t                 update_image_index;
-@@ -54,7 +55,7 @@ typedef struct {
-     uint64_t                image_capsule_support; //introduced in v3
- } efi_firmware_management_capsule_image_header_t;
-=20
--typedef struct {
-+typedef __PACKED_STRUCT {
-     uint32_t                signature;
-     uint32_t                header_size;
-     uint32_t                fw_version;
-@@ -63,20 +64,20 @@ typedef struct {
-=20
- #define ANYSIZE_ARRAY 0
-=20
--typedef struct {
-+typedef __PACKED_STRUCT {
-     uint32_t                dwLength;
-     uint16_t                wRevision;
-     uint16_t                wCertificateType;
-     uint8_t                 bCertificate[ANYSIZE_ARRAY];
- } WIN_CERTIFICATE;
-=20
--typedef struct {
-+typedef __PACKED_STRUCT {
-     WIN_CERTIFICATE         hdr;
-     struct efi_guid         cert_type;
-     uint8_t                 cert_data[ANYSIZE_ARRAY];
- } win_certificate_uefi_guid_t;
-=20
--typedef struct {
-+typedef __PACKED_STRUCT {
-     uint64_t                    monotonic_count;
-     win_certificate_uefi_guid_t   auth_info;
- } efi_firmware_image_authentication_t;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-Platform-Corstone1000-Enable-firewall-in-FVP.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-Corstone=
1000-Enable-firewall-in-FVP.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0003-Platform-Corstone1000-Enable-firewall-in-FVP.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0001-Platform-Corstone1000-Enable-firewall-in-FVP.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0004-Platform-CS1000-Increase-ITS-max-asset-size.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-CS1000-In=
crease-ITS-max-asset-size.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0004-Platform-CS1000-Increase-ITS-max-asset-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0002-Platform-CS1000-Increase-ITS-max-asset-size.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-Platform-Corstone1000-Fix-NV-counter-writing.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-Corstone=
1000-Fix-NV-counter-writing.patch
deleted file mode 100644
index cf598824..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-Corstone1000-Fix-NV-counter-writing.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 47c54e8e79df52f40057c3d4be9411447d2787c2 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Wed, 21 Feb 2024 07:44:25 +0000
-Subject: [PATCH 2/9] Platform: Corstone1000: Fix NV counter writing
-
-The BL1 writes the PLAT_NV_COUNTER_BL1_0 NV counter directly without
-updating the private metadata. Because of this the update_nv_counters()
-function should not update the PLAT_NV_COUNTER_BL1_0 from the metadata.
-
-The tfm_plat_set_nv_counter() had a typo and wrote the
-priv_metadata->nv_counter[FWU_BL2_NV_COUNTER] to every NV counter.
-
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [47c54e8e79df52f40057c3d4be9411447d2787c2]
----
- .../corstone1000/fw_update_agent/fwu_agent.c   | 18 +++++++++++-------
- 1 file changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index 9a9926a3d..b2f31e166 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -1120,12 +1120,13 @@ static enum fwu_agent_error_t update_nv_counters=
(
-=20
-     FWU_LOG_MSG("%s: enter\n\r", __func__);
-=20
--    for (int i =3D 0; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
-+    /* The FWU_BL2_NV_COUNTER (0) is not mirrored in the private metada=
ta. It is
-+     * directly updated in the bl1_2_validate_image_at_addr() function,=
 in
-+     * tfm/bl1/bl1_2/main.c.
-+     * Because of this, the index starts from FWU_TFM_NV_COUNTER (1). *=
/
-+    for (int i =3D FWU_TFM_NV_COUNTER; i <=3D FWU_MAX_NV_COUNTER_INDEX;=
 i++) {
-=20
-         switch (i) {
--            case FWU_BL2_NV_COUNTER:
--                tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL1_0;
--                break;
-             case FWU_TFM_NV_COUNTER:
-                 tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL2_0;
-                 break;
-@@ -1140,18 +1141,21 @@ static enum fwu_agent_error_t update_nv_counters=
(
-         err =3D tfm_plat_read_nv_counter(tfm_nv_counter_i,
-                         sizeof(security_cnt), (uint8_t *)&security_cnt)=
;
-         if (err !=3D TFM_PLAT_ERR_SUCCESS) {
-+            FWU_LOG_MSG("%s: couldn't read NV counter\n\r", __func__);
-             return FWU_AGENT_ERROR;
-         }
-=20
-         if (priv_metadata->nv_counter[i] < security_cnt) {
-+            FWU_LOG_MSG("%s: staged NV counter is smaller than current =
value\n\r", __func__);
-             return FWU_AGENT_ERROR;
-         } else if (priv_metadata->nv_counter[i] > security_cnt) {
--            FWU_LOG_MSG("%s: updaing index =3D %u nv counter =3D %u->%u=
\n\r",
-+            FWU_LOG_MSG("%s: updating index =3D %u nv counter =3D %u->%=
u\n\r",
-                         __func__, i, security_cnt,
--                        priv_metadata->nv_counter[FWU_BL2_NV_COUNTER]);
-+                        priv_metadata->nv_counter[i]);
-             err =3D tfm_plat_set_nv_counter(tfm_nv_counter_i,
--                                    priv_metadata->nv_counter[FWU_BL2_N=
V_COUNTER]);
-+                                    priv_metadata->nv_counter[i]);
-             if (err !=3D TFM_PLAT_ERR_SUCCESS) {
-+                FWU_LOG_MSG("%s: couldn't write NV counter\n\r", __func=
__);
-                 return FWU_AGENT_ERROR;
-             }
-         }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-CS1000=
-Increase-RSE_COMMS-buffer-size.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0005-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0003-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-Platform-CS1000-Increase-buffers-for-EFI-vars.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-CS1000-=
Increase-buffers-for-EFI-vars.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0006-Platform-CS1000-Increase-buffers-for-EFI-vars.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0004-Platform-CS1000-Increase-buffers-for-EFI-vars.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-Platform-CS1000-Increase-flash-PS-area-size.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-CS1000-In=
crease-flash-PS-area-size.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0008-Platform-CS1000-Increase-flash-PS-area-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0005-Platform-CS1000-Increase-flash-PS-area-size.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0010-platform-CS1000-Add-multicore-support-for-FVP.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-platform-CS1000-=
Add-multicore-support-for-FVP.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0010-platform-CS1000-Add-multicore-support-for-FVP.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0006-platform-CS1000-Add-multicore-support-for-FVP.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0007-Plaform-Corstone1000-Switch-to-metadata-v2.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0007-Plaform-Corstone100=
0-Switch-to-metadata-v2.patch
deleted file mode 100644
index 2e14dfd6..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-Plaform-Corstone1000-Switch-to-metadata-v2.patch
+++ /dev/null
@@ -1,202 +0,0 @@
-From c731d187fbe9fc1e10ad8ecfb3d04bb480bc86b6 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Mon, 8 Apr 2024 16:04:45 +0100
-Subject: [PATCH 7/9] Plaform: Corstone1000: Switch to metadata v2
-
-This upgrades metadata data structs from v1 to v2 as described in PSA
-FWU Specification:
-https://developer.arm.com/documentation/den0118/latest/
-
-The TrustedFirmware-A v2.11 release supports only the metadata v2. The
-structs in TF-M side had to be aligned to keep the compatibility.
-
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [c731d187fbe9fc1e10ad8ecfb3d04bb480bc86b6]
----
- .../corstone1000/fw_update_agent/fwu_agent.c  | 86 +++++++++++++++----
- 1 file changed, 69 insertions(+), 17 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index b2f31e166..5fddd3238 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -26,6 +26,15 @@
- #include "platform.h"
- #endif
-=20
-+#define FWU_METADATA_VERSION		2
-+#define FWU_FW_STORE_DESC_OFFSET	0x20
-+#define NR_OF_MAX_FW_BANKS		4
-+
-+/*
-+ * Metadata version 2 data structures defined by PSA_FW update specific=
ation
-+ * at https://developer.arm.com/documentation/den0118/latest/
-+ */
-+
- /* Properties of image in a bank */
- struct fwu_image_properties {
-=20
-@@ -58,6 +67,28 @@ struct fwu_image_entry {
-=20
- } __packed;
-=20
-+struct fwu_fw_store_descriptor {
-+
-+       /* Number of Banks */
-+       uint8_t num_banks;
-+
-+       /* Reserved */
-+       uint8_t reserved;
-+
-+       /* Number of images per bank */
-+       uint16_t num_images;
-+
-+       /* Size of image_entry(all banks) in bytes */
-+       uint16_t img_entry_size;
-+
-+       /* Size of image bank info structure in bytes */
-+       uint16_t bank_info_entry_size;
-+
-+       /* Array of fwu_image_entry structs */
-+       struct fwu_image_entry img_entry[NR_OF_IMAGES_IN_FW_BANK];
-+
-+} __packed;
-+
- struct fwu_metadata {
-=20
-         /* Metadata CRC value */
-@@ -72,8 +103,23 @@ struct fwu_metadata {
-         /* Previous bank index with which device booted successfully */
-         uint32_t previous_active_index;
-=20
--        /* Image entry information */
--        struct fwu_image_entry img_entry[NR_OF_IMAGES_IN_FW_BANK];
-+        /* Size of the entire metadata in bytes */
-+        uint32_t metadata_size;
-+
-+        /* Offset of the image descriptor structure */
-+        uint16_t desc_offset;
-+
-+        /* Reserved */
-+        uint16_t reserved1;
-+
-+        /* Bank state: It's not used in corstone1000 at the moment.Curr=
ently
-+	     * not used by any sw componenets such as u-boot and TF-A */
-+        uint8_t bank_state[NR_OF_MAX_FW_BANKS];
-+
-+        /* Reserved */
-+        uint32_t reserved2;
-+
-+        struct fwu_fw_store_descriptor fw_desc;
-=20
- } __packed;
-=20
-@@ -607,23 +653,29 @@ enum fwu_agent_error_t fwu_metadata_provision(void=
)
-=20
-     memset(&_metadata, 0, sizeof(struct fwu_metadata));
-=20
--    _metadata.version =3D 1;
-+    _metadata.version =3D FWU_METADATA_VERSION;
-     _metadata.active_index =3D BANK_0;
-     _metadata.previous_active_index =3D BANK_1;
-+    _metadata.desc_offset=3D FWU_FW_STORE_DESC_OFFSET;
-=20
-+    _metadata.fw_desc.num_banks =3D NR_OF_FW_BANKS;
-+    _metadata.fw_desc.num_images =3D NR_OF_IMAGES_IN_FW_BANK;
-+    _metadata.fw_desc.img_entry_size =3D sizeof(struct fwu_image_entry)=
 * NR_OF_IMAGES_IN_FW_BANK;
-+    _metadata.fw_desc.bank_info_entry_size =3D sizeof(struct fwu_image_=
properties) * NR_OF_FW_BANKS;
-     /* bank 0 is the place where images are located at the
-      * start of device lifecycle */
-=20
-     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
-=20
--        _metadata.img_entry[i].img_props[BANK_0].accepted =3D IMAGE_ACC=
EPTED;
--        _metadata.img_entry[i].img_props[BANK_0].version =3D image_vers=
ion;
-+        _metadata.fw_desc.img_entry[i].img_props[BANK_0].accepted =3D I=
MAGE_ACCEPTED;
-+        _metadata.fw_desc.img_entry[i].img_props[BANK_0].version =3D im=
age_version;
-=20
--        _metadata.img_entry[i].img_props[BANK_1].accepted =3D IMAGE_NOT=
_ACCEPTED;
--        _metadata.img_entry[i].img_props[BANK_1].version =3D INVALID_VE=
RSION;
-+        _metadata.fw_desc.img_entry[i].img_props[BANK_1].accepted =3D I=
MAGE_NOT_ACCEPTED;
-+        _metadata.fw_desc.img_entry[i].img_props[BANK_1].version =3D IN=
VALID_VERSION;
-     }
-=20
--    /* Calculate CRC32 for fwu metadata */
-+    /* Calculate CRC32 for fwu metadata. The first filed in the _metada=
ta has to be the crc_32.
-+     * This should be omited from the calculation. */
-     _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
-                              sizeof(struct fwu_metadata) - sizeof(uint3=
2_t));
-=20
-@@ -685,7 +737,7 @@ static enum fwu_agent_state_t get_fwu_agent_state(
-     }
-=20
-     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
--        if ((metadata_ptr->img_entry[i].img_props[boot_index].accepted)
-+        if ((metadata_ptr->fw_desc.img_entry[i].img_props[boot_index].a=
ccepted)
-                 =3D=3D (IMAGE_NOT_ACCEPTED)) {
-             return FWU_AGENT_STATE_TRIAL;
-         }
-@@ -760,7 +812,7 @@ static enum fwu_agent_error_t flash_full_capsule(
-     }
-=20
-     if (version <=3D
--            (metadata->img_entry[IMAGE_0].img_props[active_index].versi=
on)) {
-+            (metadata->fw_desc.img_entry[IMAGE_0].img_props[active_inde=
x].version)) {
-         FWU_LOG_MSG("ERROR: %s: version error\n\r",__func__);
-         return FWU_AGENT_ERROR;
-     }
-@@ -791,9 +843,9 @@ static enum fwu_agent_error_t flash_full_capsule(
-=20
-     /* Change system state to trial bank state */
-     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
--        metadata->img_entry[i].img_props[previous_active_index].accepte=
d =3D
-+        metadata->fw_desc.img_entry[i].img_props[previous_active_index]=
.accepted =3D
-                                                         IMAGE_NOT_ACCEP=
TED;
--        metadata->img_entry[i].img_props[previous_active_index].version=
 =3D version;
-+        metadata->fw_desc.img_entry[i].img_props[previous_active_index]=
.version =3D version;
-     }
-     metadata->active_index =3D previous_active_index;
-     metadata->previous_active_index =3D active_index;
-@@ -900,7 +952,7 @@ static enum fwu_agent_error_t accept_full_capsule(
-     FWU_LOG_MSG("%s: enter\n\r", __func__);
-=20
-     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
--        metadata->img_entry[i].img_props[active_index].accepted =3D
-+        metadata->fw_desc.img_entry[i].img_props[active_index].accepted=
 =3D
-                                                             IMAGE_ACCEP=
TED;
-     }
-=20
-@@ -990,7 +1042,7 @@ static enum fwu_agent_error_t fwu_select_previous(
-=20
-     index =3D metadata->previous_active_index;
-     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
--        if (metadata->img_entry[i].img_props[index].accepted !=3D IMAGE=
_ACCEPTED)
-+        if (metadata->fw_desc.img_entry[i].img_props[index].accepted !=3D=
 IMAGE_ACCEPTED)
-         {
-             FWU_ASSERT(0);
-         }
-@@ -1211,7 +1263,7 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(v=
oid)
-         /* firmware update failed, revert back to previous bank */
-=20
-         priv_metadata.fmp_last_attempt_version =3D
--         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
-+         _metadata.fw_desc.img_entry[IMAGE_0].img_props[_metadata.activ=
e_index].version;
-=20
-         priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_E=
RROR_UNSUCCESSFUL;
-=20
-@@ -1222,9 +1274,9 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(v=
oid)
-         /* firmware update successful */
-=20
-         priv_metadata.fmp_version =3D
--         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
-+         _metadata.fw_desc.img_entry[IMAGE_0].img_props[_metadata.activ=
e_index].version;
-         priv_metadata.fmp_last_attempt_version =3D
--         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
-+         _metadata.fw_desc.img_entry[IMAGE_0].img_props[_metadata.activ=
e_index].version;
-=20
-         priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_S=
UCCESS;
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-Platform-CS1000-Fix-Bank-offsets.patch b/meta-arm-bsp/recipes-bsp=
/trusted-firmware-m/files/corstone1000/0007-Platform-CS1000-Fix-Bank-offs=
ets.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0011-Platform-CS1000-Fix-Bank-offsets.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0007-Platform-CS1000-Fix-Bank-offsets.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-Platform-CS1000-Increase-BL2-partition-size.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-CS1000-In=
crease-BL2-partition-size.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0012-Platform-CS1000-Increase-BL2-partition-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0008-Platform-CS1000-Increase-BL2-partition-size.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-CC312-ADAC-Add-=
PSA_WANT_ALG_SHA_256-definition.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0013-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0009-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-corstone1000-Remove-reset-after-capsule-update.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-corstone1000-Re=
move-reset-after-capsule-update.patch
deleted file mode 100644
index e3333c53..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-corstone1000-Remove-reset-after-capsule-update.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 898d3c148521b331302c587e658d7e0a4f645c77 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Mon, 27 May 2024 17:11:31 +0200
-Subject: [PATCH 09/10] corstone1000: Remove reset after capsule update
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/29065]
----
- .../target/arm/corstone1000/services/src/tfm_platform_system.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/services/src/tfm_platf=
orm_system.c b/platform/ext/target/arm/corstone1000/services/src/tfm_plat=
form_system.c
-index 41305ed966..1e837ce3b5 100644
---- a/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
-+++ b/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
-@@ -28,9 +28,6 @@ enum tfm_platform_err_t tfm_platform_hal_ioctl(tfm_pla=
tform_ioctl_req_t request,
-=20
-         case IOCTL_CORSTONE1000_FWU_FLASH_IMAGES:
-             result =3D corstone1000_fwu_flash_image();
--            if (!result) {
--                NVIC_SystemReset();
--            }
-             break;
-=20
-         case IOCTL_CORSTONE1000_FWU_HOST_ACK:
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-Platform-CS1000-Add-crypto-configs-for-ADAC.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-CS1000-Ad=
d-crypto-configs-for-ADAC.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0014-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0010-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-Platform-CS1000-Fix-platform-name-in-logs.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-m/files/corstone1000/0011-Platform-CS1000-Fix-=
platform-name-in-logs.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0015-Platform-CS1000-Fix-platform-name-in-logs.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0011-Platform-CS1000-Fix-platform-name-in-logs.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0017-Platform-CS1000-Remove-unused-BL1-files.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-CS1000-Remove=
-unused-BL1-files.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0017-Platform-CS1000-Remove-unused-BL1-files.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0012-Platform-CS1000-Remove-unused-BL1-files.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0019-Platform-CS1000-Fix-compiler-switch-in-BL1.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0013-Platform-CS1000-Fix=
-compiler-switch-in-BL1.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0019-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0013-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0022-CC312-alignment-of-cc312-differences.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0014-CC312-alignment-of-cc312-=
differences.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0022-CC312-alignment-of-cc312-differences.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0014-CC312-alignment-of-cc312-differences.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0024-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-Platform-co=
rstone1000-Allow-FWU-calls-in-RSE-COMMS.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0024-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0015-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0025-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016-FWU-Make-=
platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0025-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0016-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0026-Platform-CS1000-Enable-FWU-partition.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0017-Platform-CS1000-Enable-FW=
U-partition.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0026-Platform-CS1000-Enable-FWU-partition.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0017-Platform-CS1000-Enable-FWU-partition.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0018-Platform-CS1000-Remove-duplicated-metadata-write.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018-Platform-CS10=
00-Remove-duplicated-metadata-write.patch
deleted file mode 100644
index e468916e..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018=
-Platform-CS1000-Remove-duplicated-metadata-write.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 60793058794f0ac8ea35a69b2dddf97ccba1acdb Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Thu, 5 Sep 2024 21:29:07 +0200
-Subject: [PATCH 2/5] Platform: CS1000: Remove duplicated metadata write
-
-The metadata replica_2 was written twice which is not needed.
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../corstone1000/fw_update_agent/fwu_agent.c  | 28 -------------------
- 1 file changed, 28 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index d0028a56d8..2b69447dc5 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -499,20 +499,6 @@ static enum fwu_agent_error_t metadata_write(
-         return FWU_AGENT_ERROR;
-     }
-=20
--    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
--
--    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
--    if (ret !=3D ARM_DRIVER_OK) {
--        return FWU_AGENT_ERROR;
--    }
--
--    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
--        return FWU_AGENT_ERROR;
--    }
--
-     FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
-                   p_metadata->active_index, p_metadata->previous_active=
_index);
-     return FWU_AGENT_SUCCESS;
-@@ -569,20 +555,6 @@ static enum fwu_agent_error_t metadata_write(
-         return FWU_AGENT_ERROR;
-     }
-=20
--    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
--
--    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
--    if (ret !=3D ARM_DRIVER_OK) {
--        return FWU_AGENT_ERROR;
--    }
--
--    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
--        return FWU_AGENT_ERROR;
--    }
--
-     FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
-                   p_metadata->active_index, p_metadata->previous_active=
_index);
-     return FWU_AGENT_SUCCESS;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0027-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018-Platform-=
Corstone1000-Implement-Bootloader-Abstracti.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0027-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0018-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0028-Platform-Corstone1000-Increase-buffer-sizes.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0019-Platform-Corstone1=
000-Increase-buffer-sizes.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0028-Platform-Corstone1000-Increase-buffer-sizes.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0019-Platform-Corstone1000-Increase-buffer-sizes.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0020-Platform-CS1000-Validate-both-metadata-replicas.patch b/meta-arm-=
bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0020-Platform-CS100=
0-Validate-both-metadata-replicas.patch
deleted file mode 100644
index e38c8651..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0020=
-Platform-CS1000-Validate-both-metadata-replicas.patch
+++ /dev/null
@@ -1,370 +0,0 @@
-From 5fd2662e1f20b5c645ff0755e84424bae303fa45 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Mon, 9 Sep 2024 09:42:58 +0200
-Subject: [PATCH] Platform: CS1000: Validate both metadata replicas
-
-According to the [1] both metadata replica integrity should be checked
-during the update agent initialization, and if one of the replica is
-corrupted then it should be fixed by copying the other replica.
-
-This commit:
-- Adds the integrity check and correction to the
-  corstone1000_fwu_host_ack() function. This function is called when
-  the Host core has booted.
-- Updates the metadata_read() function so both replica can be read.
-- Adds metadata_write_replica() function to write metadata replicas
-  separately.
-
-[1] https://developer.arm.com/documentation/den0118/a/?lang=3Den
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- .../corstone1000/fw_update_agent/fwu_agent.c  | 167 ++++++++++++------
- .../corstone1000/fw_update_agent/fwu_agent.h  |   7 +
- 2 files changed, 119 insertions(+), 55 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index 92b918c67..aad6208e0 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -395,20 +395,33 @@ static enum fwu_agent_error_t metadata_read_withou=
t_validation(struct fwu_metada
- #endif
-=20
- #ifdef BL1_BUILD
--static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
-+static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data, uint8_t replica_num)
- {
-     int ret;
-+    uint32_t replica_offset =3D 0;
-=20
--    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
-+    FWU_LOG_MSG("%s: enter\n\r", __func__);
-=20
-     if (!p_metadata) {
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-+    if (replica_num =3D=3D 1) {
-+        replica_offset =3D FWU_METADATA_REPLICA_1_OFFSET;
-+    } else if (replica_num =3D=3D 2) {
-+        replica_offset =3D FWU_METADATA_REPLICA_2_OFFSET;
-+    } else {
-+        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: flash addr =3D %u, size =3D %d\n\r", __func__,
-+                  replica_offset, sizeof(*p_metadata));
-+
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ReadData(replica_offset,
-+                                p_metadata, sizeof(*p_metadata));
-+    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
-         return FWU_AGENT_ERROR;
-     }
-=20
-@@ -422,17 +435,27 @@ static enum fwu_agent_error_t metadata_read(struct=
 fwu_metadata *p_metadata)
-     return FWU_AGENT_SUCCESS;
- }
- #else
--static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
-+static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data, uint8_t replica_num)
- {
-     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
-     partition_entry_t *part;
-     int ret;
-=20
-+    FWU_LOG_MSG("%s: enter\n\r", __func__);
-+
-     if (!p_metadata) {
-         return FWU_AGENT_ERROR;
-     }
-=20
--    part =3D get_partition_entry_by_type(&metadata_uuid);
-+    if (replica_num =3D=3D 1) {
-+        part =3D get_partition_entry_by_type(&metadata_uuid);
-+    } else if (replica_num =3D=3D 2) {
-+        part =3D get_partition_replica_by_type(&metadata_uuid);
-+    } else {
-+        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
-+        return FWU_AGENT_ERROR;
-+    }
-+
-     if (!part) {
-         FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
-         return FWU_AGENT_ERROR;
-@@ -461,39 +484,38 @@ static enum fwu_agent_error_t metadata_read(struct=
 fwu_metadata *p_metadata)
-=20
- #ifdef BL1_BUILD
- static enum fwu_agent_error_t metadata_write(
--                        struct fwu_metadata *p_metadata)
-+                        struct fwu_metadata *p_metadata, uint8_t replic=
a_num)
- {
-     int ret;
-+    uint32_t replica_offset =3D 0;
-=20
--    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
-+    FWU_LOG_MSG("%s: enter\n\r", __func__);
-=20
-     if (!p_metadata) {
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_1_O=
FFSET);
--    if (ret !=3D ARM_DRIVER_OK) {
--        return FWU_AGENT_ERROR;
--    }
--
--    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_1_O=
FFSET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-+    if (replica_num =3D=3D 1) {
-+        replica_offset =3D FWU_METADATA_REPLICA_1_OFFSET;
-+    } else if (replica_num =3D=3D 2) {
-+        replica_offset =3D FWU_METADATA_REPLICA_2_OFFSET;
-+    } else {
-+        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
-         return FWU_AGENT_ERROR;
-     }
-=20
-     FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
-+                  replica_offset, sizeof(*p_metadata));
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(replica_offset);
-     if (ret !=3D ARM_DRIVER_OK) {
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-+    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(replica_offset,
-+                                p_metadata, sizeof(*p_metadata));
-+    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
-         return FWU_AGENT_ERROR;
-     }
-=20
-@@ -503,7 +525,7 @@ static enum fwu_agent_error_t metadata_write(
- }
- #else
- static enum fwu_agent_error_t metadata_write(
--                        struct fwu_metadata *p_metadata)
-+                        struct fwu_metadata *p_metadata, uint8_t replic=
a_num)
- {
-     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
-     partition_entry_t *part;
-@@ -513,7 +535,15 @@ static enum fwu_agent_error_t metadata_write(
-         return FWU_AGENT_ERROR;
-     }
-=20
--    part =3D get_partition_entry_by_type(&metadata_uuid);
-+    if (replica_num =3D=3D 1) {
-+        part =3D get_partition_entry_by_type(&metadata_uuid);
-+    } else if (replica_num =3D=3D 2) {
-+        part =3D get_partition_replica_by_type(&metadata_uuid);
-+    } else {
-+        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
-+        return FWU_AGENT_ERROR;
-+    }
-+
-     if (!part) {
-         FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
-         return FWU_AGENT_ERROR;
-@@ -533,32 +563,51 @@ static enum fwu_agent_error_t metadata_write(
-         return FWU_AGENT_ERROR;
-     }
-=20
--    part =3D get_partition_replica_by_type(&metadata_uuid);
--    if (!part) {
--        FWU_LOG_MSG("%s: FWU metadata replica partition not found\n\r",=
 __func__);
--        return FWU_AGENT_ERROR;
--    }
-+    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
-+                  p_metadata->active_index, p_metadata->previous_active=
_index);
-+    return FWU_AGENT_SUCCESS;
-+}
-+#endif
-=20
--    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  part->start, sizeof(struct fwu_metadata));
-+static enum fwu_agent_error_t metadata_write_both_replica(
-+                        struct fwu_metadata *p_metadata)
-+{
-+    enum fwu_agent_error_t ret =3D FWU_AGENT_ERROR;
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
--    if (ret !=3D ARM_DRIVER_OK) {
--        return FWU_AGENT_ERROR;
-+    ret =3D metadata_write(&_metadata, 1);
-+    if (ret) {
-+        return ret;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
--        return FWU_AGENT_ERROR;
-+    ret =3D metadata_write(&_metadata, 2);
-+    if (ret) {
-+        return ret;
-     }
-=20
--    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
--                  p_metadata->active_index, p_metadata->previous_active=
_index);
-     return FWU_AGENT_SUCCESS;
- }
--#endif
-=20
-+enum fwu_agent_error_t fwu_metadata_check_and_correct_integrity(void)
-+{
-+    enum fwu_agent_error_t ret_replica_1 =3D FWU_AGENT_ERROR;
-+    enum fwu_agent_error_t ret_replica_2 =3D FWU_AGENT_ERROR;
-+
-+    /* Check integrity of both metadata replica */
-+    ret_replica_1 =3D metadata_read(&_metadata, 1);
-+    ret_replica_2 =3D metadata_read(&_metadata, 2);
-+
-+    if (ret_replica_1 !=3D FWU_AGENT_SUCCESS && ret_replica_2 !=3D FWU_=
AGENT_SUCCESS) {
-+        return FWU_AGENT_ERROR;
-+    } else if (ret_replica_1 =3D=3D FWU_AGENT_SUCCESS && ret_replica_2 =
!=3D FWU_AGENT_SUCCESS) {
-+        metadata_read(&_metadata, 1);
-+        metadata_write(&_metadata, 2);
-+    } else if (ret_replica_1 !=3D FWU_AGENT_SUCCESS && ret_replica_2 =3D=
=3D FWU_AGENT_SUCCESS) {
-+        metadata_read(&_metadata, 2);
-+        metadata_write(&_metadata, 1);
-+    }
-+
-+    return FWU_AGENT_SUCCESS;
-+}
-=20
- enum fwu_agent_error_t fwu_metadata_init(void)
- {
-@@ -617,8 +666,8 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
-      * had a firmware data?. If yes, then don't initialize
-      * metadata
-      */
--    metadata_read(&_metadata);
--    if(_metadata.active_index < 2 || _metadata.previous_active_index <2=
){
-+    metadata_read(&_metadata, 1);
-+    if(_metadata.active_index < 2 || _metadata.previous_active_index < =
2){
-     	if(_metadata.active_index ^ _metadata.previous_active_index)
-     		return FWU_AGENT_SUCCESS;
-     }
-@@ -652,13 +701,13 @@ enum fwu_agent_error_t fwu_metadata_provision(void=
)
-     _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
-                              sizeof(struct fwu_metadata) - sizeof(uint3=
2_t));
-=20
--    ret =3D metadata_write(&_metadata);
-+    ret =3D metadata_write_both_replica(&_metadata);
-     if (ret) {
-         return ret;
-     }
-=20
--    memset(&_metadata, 0, sizeof(struct fwu_metadata));
--    ret =3D metadata_read(&_metadata);
-+    memset(&_metadata, 0, sizeof(_metadata));
-+    ret =3D metadata_read(&_metadata, 1);
-     if (ret) {
-         return ret;
-     }
-@@ -825,7 +874,7 @@ static enum fwu_agent_error_t flash_full_capsule(
-     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
-                               sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
-=20
--    ret =3D metadata_write(metadata);
-+    ret =3D metadata_write_both_replica(metadata);
-     if (ret) {
-         return ret;
-     }
-@@ -852,7 +901,7 @@ enum fwu_agent_error_t corstone1000_fwu_flash_image(=
void)
-=20
-     Select_Write_Mode_For_Shared_Flash();
-=20
--    if (metadata_read(&_metadata)) {
-+    if (metadata_read(&_metadata, 1)) {
-         ret =3D  FWU_AGENT_ERROR;
-         goto out;
-     }
-@@ -938,7 +987,7 @@ static enum fwu_agent_error_t accept_full_capsule(
-     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
-                               sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
-=20
--    ret =3D metadata_write(metadata);
-+    ret =3D metadata_write_both_replica(metadata);
-     if (ret) {
-         return ret;
-     }
-@@ -1034,7 +1083,7 @@ static enum fwu_agent_error_t fwu_select_previous(
-     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
-                               sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
-=20
--    ret =3D metadata_write(metadata);
-+    ret =3D metadata_write_both_replica(metadata);
-     if (ret) {
-         return ret;
-     }
-@@ -1064,7 +1113,7 @@ void bl1_get_active_bl2_image(uint32_t *offset)
-         FWU_ASSERT(0);
-     }
-=20
--    if (metadata_read(&_metadata)) {
-+    if (metadata_read(&_metadata, 1)) {
-         FWU_ASSERT(0);
-     }
-=20
-@@ -1203,9 +1252,17 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(=
void)
-         return FWU_AGENT_ERROR;
-     }
-=20
-+    /* This cannot be added to the fwu_metadata_init() because that fun=
ction is
-+     * called before the logging is enabled by TF-M. */
-+    ret =3D fwu_metadata_check_and_correct_integrity();
-+    if (ret =3D FWU_AGENT_SUCCESS) {
-+        FWU_LOG_MSG("fwu_metadata_check_and_correct_integrity failed\r\=
n");
-+        return ret;
-+    }
-+
-     Select_Write_Mode_For_Shared_Flash();
-=20
--    if (metadata_read(&_metadata)) {
-+    if (metadata_read(&_metadata, 1)) {
-         ret =3D FWU_AGENT_ERROR;
-         goto out;
-     }
-@@ -1315,7 +1372,7 @@ void host_acknowledgement_timer_to_reset(void)
-         FWU_ASSERT(0);
-     }
-=20
--    if (metadata_read(&_metadata)) {
-+    if (metadata_read(&_metadata, 1)) {
-         FWU_ASSERT(0);
-     }
-=20
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
-index 701f20558..78e104277 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
-@@ -70,4 +70,11 @@ enum fwu_nv_counter_index_t {
- enum fwu_agent_error_t fwu_stage_nv_counter(enum fwu_nv_counter_index_t=
 index,
-         uint32_t img_security_cnt);
-=20
-+/*
-+ * Check if both metadata replica is valid by calculating and comparing=
 crc32.
-+ * If one of the replica is corrupted then update it with the valid rep=
lica.
-+ * If both of the replicas are corrupted then the correction is not pos=
sible.
-+ */
-+enum fwu_agent_error_t fwu_metadata_check_and_correct_integrity(void);
-+
- #endif /* FWU_AGENT_H */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0021-platform-corstone1000-add-unique-guid-for-mps3.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0021-platform-corsto=
ne1000-add-unique-guid-for-mps3.patch
deleted file mode 100644
index b153b8da..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0021=
-platform-corstone1000-add-unique-guid-for-mps3.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From a32e7195a4fc1c9d890f9e22a795443d01dc1e8f Mon Sep 17 00:00:00 2001
-From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
-Date: Tue, 2 Apr 2024 13:04:56 +0000
-Subject: [PATCH 03/10] platform: corstone1000: add unique guid for mps3
-
-This patch sets unique GUID for Corstone1000 FVP and MPS3
-
-Upstream-Status: Inappropriate [Redesign of Capsule update interface is =
required]
-Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
----
- .../target/arm/corstone1000/fw_update_agent/fwu_agent.c   | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index 003ab9faf8..5768df19b8 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -113,13 +113,19 @@ enum fwu_agent_state_t {
- };
-=20
- struct efi_guid full_capsule_image_guid =3D {
-+#if PLATFORM_IS_FVP
-     .time_low =3D 0x989f3a4e,
-     .time_mid =3D 0x46e0,
-     .time_hi_and_version =3D 0x4cd0,
-     .clock_seq_and_node =3D {0x98, 0x77, 0xa2, 0x5c, 0x70, 0xc0, 0x13, =
0x29}
-+#else
-+    .time_low =3D 0xdf1865d1,
-+    .time_mid =3D 0x90fb,
-+    .time_hi_and_version =3D 0x4d59,
-+    .clock_seq_and_node =3D {0x9c, 0x38, 0xc9, 0xf2, 0xc1, 0xbb, 0xa8, =
0xcc}
-+#endif
- };
-=20
--
- #define IMAGE_ACCEPTED          (1)
- #define IMAGE_NOT_ACCEPTED      (0)
- #define BANK_0                  (0)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 562abb7c..a6a261e9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -20,33 +20,26 @@ SRC_URI +=3D " \
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append:corstone1000 =3D " \
-    file://0001-Platform-Corstone1000-Align-capsule-UEFI-structs.patch \
-    file://0002-Platform-Corstone1000-Fix-NV-counter-writing.patch \
-    file://0003-Platform-Corstone1000-Enable-firewall-in-FVP.patch \
-    file://0004-Platform-CS1000-Increase-ITS-max-asset-size.patch \
-    file://0005-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch \
-    file://0006-Platform-CS1000-Increase-buffers-for-EFI-vars.patch \
-    file://0007-Plaform-Corstone1000-Switch-to-metadata-v2.patch \
-    file://0008-Platform-CS1000-Increase-flash-PS-area-size.patch \
-    file://0009-corstone1000-Remove-reset-after-capsule-update.patch \
-    file://0010-platform-CS1000-Add-multicore-support-for-FVP.patch \
-    file://0011-Platform-CS1000-Fix-Bank-offsets.patch \
-    file://0012-Platform-CS1000-Increase-BL2-partition-size.patch \
-    file://0013-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch \
-    file://0014-Platform-CS1000-Add-crypto-configs-for-ADAC.patch \
-    file://0015-Platform-CS1000-Fix-platform-name-in-logs.patch \
-    file://0017-Platform-CS1000-Remove-unused-BL1-files.patch \
-    file://0018-Platform-CS1000-Remove-duplicated-metadata-write.patch \
-    file://0019-Platform-CS1000-Fix-compiler-switch-in-BL1.patch \
-    file://0020-Platform-CS1000-Validate-both-metadata-replicas.patch \
-    file://0021-platform-corstone1000-add-unique-guid-for-mps3.patch \
-    file://0022-CC312-alignment-of-cc312-differences.patch \
+    file://0001-Platform-Corstone1000-Enable-firewall-in-FVP.patch \
+    file://0002-Platform-CS1000-Increase-ITS-max-asset-size.patch \
+    file://0003-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch \
+    file://0004-Platform-CS1000-Increase-buffers-for-EFI-vars.patch \
+    file://0005-Platform-CS1000-Increase-flash-PS-area-size.patch \
+    file://0006-platform-CS1000-Add-multicore-support-for-FVP.patch \
+    file://0007-Platform-CS1000-Fix-Bank-offsets.patch \
+    file://0008-Platform-CS1000-Increase-BL2-partition-size.patch \
+    file://0009-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch \
+    file://0010-Platform-CS1000-Add-crypto-configs-for-ADAC.patch \
+    file://0011-Platform-CS1000-Fix-platform-name-in-logs.patch \
+    file://0012-Platform-CS1000-Remove-unused-BL1-files.patch \
+    file://0013-Platform-CS1000-Fix-compiler-switch-in-BL1.patch \
+    file://0014-CC312-alignment-of-cc312-differences.patch \
+    file://0015-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch=
 \
+    file://0016-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.pat=
ch \
+    file://0017-Platform-CS1000-Enable-FWU-partition.patch \
+    file://0018-Platform-Corstone1000-Implement-Bootloader-Abstracti.pat=
ch \
+    file://0019-Platform-Corstone1000-Increase-buffer-sizes.patch \
     file://0023-Platform-CS1000-Remove-duplicate-configuration-parameter=
s.patch \
-    file://0024-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch=
 \
-    file://0025-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.pat=
ch \
-    file://0026-Platform-CS1000-Enable-FWU-partition.patch \
-    file://0027-Platform-Corstone1000-Implement-Bootloader-Abstracti.pat=
ch \
-    file://0028-Platform-Corstone1000-Increase-buffer-sizes.patch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"

