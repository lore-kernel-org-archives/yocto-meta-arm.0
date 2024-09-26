Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B566CCDE03C
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 21:48:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.55920.1727387282222901295
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 14:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5861E14BF;
	Thu, 26 Sep 2024 14:48:31 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.20.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29B673F64C;
	Thu, 26 Sep 2024 14:47:59 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-m: corstone1000: Update patches
Date: Thu, 26 Sep 2024 23:47:49 +0200
Message-Id: <20240926214749.286491-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 21:48:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6128

From: Bence Balogh <bence.balogh@arm.com>

Some of the existing patches were submitted and merged to the
upstream TF-M repository.
In this commit, the upstream statuses are updated, and the patches are
reordered so the submitted patches are applied first.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...stone1000-Align-capsule-UEFI-structs.patch |  97 ++++++++++++++
 ...one1000-align-capsule-update-structs.patch |  78 ------------
 ...-Corstone1000-Fix-NV-counter-writing.patch |  69 ++++++++++
 ...rstone1000-skip-the-first-nv-counter.patch |  31 -----
 ...Corstone1000-Enable-firewall-in-FVP.patch} |  13 +-
 ...m-CS1000-Increase-ITS-max-asset-size.patch |  41 ++++++
 ...S1000-Increase-RSE_COMMS-buffer-size.patch |  38 ++++++
 ...tone1000-Increase-ITS-max-asset-size.patch |  30 -----
 ...CS1000-Increase-buffers-for-EFI-vars.patch |  42 +++++++
 ...e1000-Increase-RSE_COMMS-buffer-size.patch |  27 ----
 ...-Corstone1000-Switch-to-metadata-v2.patch} |  83 ++++--------
 ...-CS1000-Increase-flash-PS-area-size.patch} |  23 ++--
 ...ne1000-Increase-buffers-for-EFI-vars.patch |  45 -------
 ...11-Platform-CS1000-Fix-Bank-offsets.patch} |   8 +-
 ...-CS1000-Increase-BL2-partition-size.patch} |   0
 ...Add-PSA_WANT_ALG_SHA_256-definition.patch} |   2 +-
 ...-CS1000-Add-crypto-configs-for-ADAC.patch} |  22 ++--
 ...rm-CS1000-Fix-platform-name-in-logs.patch} |   2 +-
 ...-Fix-isolation-L2-memory-protection.patch} |   0
 ...form-CS1000-Remove-unused-BL1-files.patch} |   0
 ...00-Remove-duplicated-metadata-write.patch} |   0
 ...m-CS1000-Fix-compiler-switch-in-BL1.patch} |   0
 ...000-Validate-both-metadata-replicas.patch} | 119 ++++++++++--------
 ...rstone1000-add-unique-guid-for-mps3.patch} |   0
 ...C312-alignment-of-cc312-differences.patch} |   0
 .../trusted-firmware-m-corstone1000.inc       |  40 +++---
 26 files changed, 437 insertions(+), 373 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-Platform-Corstone1000-Align-capsule-UEFI-structs.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-platform-corstone1000-align-capsule-update-structs.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-Corstone1000-Fix-NV-counter-writing.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-Corstone1000-skip-the-first-nv-counter.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
004-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch =3D> 0003-Pla=
tform-Corstone1000-Enable-firewall-in-FVP.patch} (93%)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0004-Platform-CS1000-Increase-ITS-max-asset-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-platform-corstone1000-Increase-ITS-max-asset-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-Platform-CS1000-Increase-buffers-for-EFI-vars.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
011-Platform-Corstone1000-switch-to-metadata-v2.patch =3D> 0007-Plaform-C=
orstone1000-Switch-to-metadata-v2.patch} (69%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
012-platform-corstone1000-Increase-flash-PS-area-size.patch =3D> 0008-Pla=
tform-CS1000-Increase-flash-PS-area-size.patch} (60%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
013-Platform-CS1000-Fix-Bank-offsets.patch =3D> 0011-Platform-CS1000-Fix-=
Bank-offsets.patch} (86%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
014-Platform-CS1000-Increase-BL2-partition-size.patch =3D> 0012-Platform-=
CS1000-Increase-BL2-partition-size.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
015-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch =3D> 0013-CC312-=
ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch} (94%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
016-Platform-CS1000-Add-crypto-configs-for-ADAC.patch =3D> 0014-Platform-=
CS1000-Add-crypto-configs-for-ADAC.patch} (54%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
017-Platform-CS1000-Fix-platform-name-in-logs.patch =3D> 0015-Platform-CS=
1000-Fix-platform-name-in-logs.patch} (93%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
018-Platform-corstone1000-Fix-isolation-L2-memory-protection.patch =3D> 0=
016-Platform-corstone1000-Fix-isolation-L2-memory-protection.patch} (100%=
)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
019-Platform-CS1000-Remove-unused-BL1-files.patch =3D> 0017-Platform-CS10=
00-Remove-unused-BL1-files.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
020-Platform-CS1000-Remove-duplicated-metadata-write.patch =3D> 0018-Plat=
form-CS1000-Remove-duplicated-metadata-write.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
021-Platform-CS1000-Fix-compiler-switch-in-BL1.patch =3D> 0019-Platform-C=
S1000-Fix-compiler-switch-in-BL1.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
022-Platform-CS1000-Validate-both-metadata-replicas.patch =3D> 0020-Platf=
orm-CS1000-Validate-both-metadata-replicas.patch} (82%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
003-platform-corstone1000-add-unique-guid-for-mps3.patch =3D> 0021-platfo=
rm-corstone1000-add-unique-guid-for-mps3.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
007-CC312-alignment-of-cc312-differences-between-fvp-and.patch =3D> 0022-=
CC312-alignment-of-cc312-differences.patch} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-Platform-Corstone1000-Align-capsule-UEFI-structs.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-Cors=
tone1000-Align-capsule-UEFI-structs.patch
new file mode 100644
index 00000000..fbeb1540
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-Corstone1000-Align-capsule-UEFI-structs.patch
@@ -0,0 +1,97 @@
+From 6ac0d4ce58c1a957c5f086e8c32268fdfc3ea531 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Thu, 26 Oct 2023 11:46:04 +0100
+Subject: [PATCH 1/9] Platform: Corstone1000: Align capsule UEFI structs
+
+The UEFI capsules are generated using the U-Boot mkeficapsule tool.
+U-Boot uses packed struct for the UEFI and FMP structures, see [1].
+The structs have to be aligned in the TF-M side parser to avoid
+crashes.
+
+[1] https://github.com/u-boot/u-boot/blob/u-boot-2023.07.y/include/efi_a=
pi.h#L245
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Backport [6ac0d4ce58c1a957c5f086e8c32268fdfc3ea531]
+---
+ .../fw_update_agent/uefi_capsule_parser.c       | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.c b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.c
+index c706c040a..44566e08d 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
+@@ -1,10 +1,11 @@
+ /*
+- * Copyright (c) 2021, Arm Limited. All rights reserved.
++ * Copyright (c) 2021-2024, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+  */
+=20
++#include "cmsis_compiler.h"
+ #include "uefi_capsule_parser.h"
+ #include "fwu_agent.h"
+ #include <string.h>
+@@ -29,21 +30,21 @@ Update Capsule Structure (UEFI spec 2.9 1004)
+             Payload n (item_offset[embedded_driver_count + payload_item=
_count -1])
+ */
+=20
+-typedef struct {
++typedef __PACKED_STRUCT {
+     struct efi_guid         capsule_guid;
+     uint32_t                header_size;
+     uint32_t                flags;
+     uint32_t                capsule_image_size;
+ } efi_capsule_header_t;
+=20
+-typedef struct {
++typedef __PACKED_STRUCT {
+     uint32_t                version;
+     uint16_t                embedded_driver_count;
+     uint16_t                payload_item_count;
+     uint64_t                item_offset_list[];
+ } efi_firmware_management_capsule_header_t;
+=20
+-typedef struct {
++typedef __PACKED_STRUCT {
+     uint32_t                version;
+     struct efi_guid         update_image_type_id;
+     uint8_t                 update_image_index;
+@@ -54,7 +55,7 @@ typedef struct {
+     uint64_t                image_capsule_support; //introduced in v3
+ } efi_firmware_management_capsule_image_header_t;
+=20
+-typedef struct {
++typedef __PACKED_STRUCT {
+     uint32_t                signature;
+     uint32_t                header_size;
+     uint32_t                fw_version;
+@@ -63,20 +64,20 @@ typedef struct {
+=20
+ #define ANYSIZE_ARRAY 0
+=20
+-typedef struct {
++typedef __PACKED_STRUCT {
+     uint32_t                dwLength;
+     uint16_t                wRevision;
+     uint16_t                wCertificateType;
+     uint8_t                 bCertificate[ANYSIZE_ARRAY];
+ } WIN_CERTIFICATE;
+=20
+-typedef struct {
++typedef __PACKED_STRUCT {
+     WIN_CERTIFICATE         hdr;
+     struct efi_guid         cert_type;
+     uint8_t                 cert_data[ANYSIZE_ARRAY];
+ } win_certificate_uefi_guid_t;
+=20
+-typedef struct {
++typedef __PACKED_STRUCT {
+     uint64_t                    monotonic_count;
+     win_certificate_uefi_guid_t   auth_info;
+ } efi_firmware_image_authentication_t;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-platform-corstone1000-align-capsule-update-structs.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-platform-co=
rstone1000-align-capsule-update-structs.patch
deleted file mode 100644
index 7a1e58c8..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-platform-corstone1000-align-capsule-update-structs.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 0d454ea554c57247f5435c09ef99d70f169e041b Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Thu, 26 Oct 2023 11:46:04 +0100
-Subject: [PATCH 01/10] platform: corstone1000: align capsule update stru=
cts
-
-U-boot mkefitool creates capsule image without packed and byte-aligned
-structs. This patch aligns the capsule-update structures and avoids
-crashes in case of unaligned pointer access.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Upstream-Status: Pending
----
- .../fw_update_agent/uefi_capsule_parser.c          | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.c b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.c
-index c706c040ac..9f8d12ad4e 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
-@@ -34,14 +34,14 @@ typedef struct {
-     uint32_t                header_size;
-     uint32_t                flags;
-     uint32_t                capsule_image_size;
--} efi_capsule_header_t;
-+} efi_capsule_header_t __attribute__((packed, aligned(1)));
-=20
- typedef struct {
-     uint32_t                version;
-     uint16_t                embedded_driver_count;
-     uint16_t                payload_item_count;
-     uint64_t                item_offset_list[];
--} efi_firmware_management_capsule_header_t;
-+} efi_firmware_management_capsule_header_t __attribute__((packed, align=
ed(1)));
-=20
- typedef struct {
-     uint32_t                version;
-@@ -52,14 +52,14 @@ typedef struct {
-     uint32_t                update_vendorcode_size;
-     uint64_t                update_hardware_instance; //introduced in v=
2
-     uint64_t                image_capsule_support; //introduced in v3
--} efi_firmware_management_capsule_image_header_t;
-+} efi_firmware_management_capsule_image_header_t __attribute__((packed,=
 aligned(1)));
-=20
- typedef struct {
-     uint32_t                signature;
-     uint32_t                header_size;
-     uint32_t                fw_version;
-     uint32_t                lowest_supported_version;
--} fmp_payload_header_t;
-+} fmp_payload_header_t __attribute__((packed, aligned(1)));
-=20
- #define ANYSIZE_ARRAY 0
-=20
-@@ -68,18 +68,18 @@ typedef struct {
-     uint16_t                wRevision;
-     uint16_t                wCertificateType;
-     uint8_t                 bCertificate[ANYSIZE_ARRAY];
--} WIN_CERTIFICATE;
-+} WIN_CERTIFICATE __attribute__((packed, aligned(1)));
-=20
- typedef struct {
-     WIN_CERTIFICATE         hdr;
-     struct efi_guid         cert_type;
-     uint8_t                 cert_data[ANYSIZE_ARRAY];
--} win_certificate_uefi_guid_t;
-+} win_certificate_uefi_guid_t __attribute__((packed, aligned(1)));
-=20
- typedef struct {
-     uint64_t                    monotonic_count;
-     win_certificate_uefi_guid_t   auth_info;
--} efi_firmware_image_authentication_t;
-+} efi_firmware_image_authentication_t __attribute__((packed, aligned(1)=
));
-=20
-=20
- enum uefi_capsule_error_t uefi_capsule_retrieve_images(void* capsule_pt=
r,
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-Platform-Corstone1000-Fix-NV-counter-writing.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-Corstone=
1000-Fix-NV-counter-writing.patch
new file mode 100644
index 00000000..cf598824
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-Corstone1000-Fix-NV-counter-writing.patch
@@ -0,0 +1,69 @@
+From 47c54e8e79df52f40057c3d4be9411447d2787c2 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Wed, 21 Feb 2024 07:44:25 +0000
+Subject: [PATCH 2/9] Platform: Corstone1000: Fix NV counter writing
+
+The BL1 writes the PLAT_NV_COUNTER_BL1_0 NV counter directly without
+updating the private metadata. Because of this the update_nv_counters()
+function should not update the PLAT_NV_COUNTER_BL1_0 from the metadata.
+
+The tfm_plat_set_nv_counter() had a typo and wrote the
+priv_metadata->nv_counter[FWU_BL2_NV_COUNTER] to every NV counter.
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Backport [47c54e8e79df52f40057c3d4be9411447d2787c2]
+---
+ .../corstone1000/fw_update_agent/fwu_agent.c   | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 9a9926a3d..b2f31e166 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -1120,12 +1120,13 @@ static enum fwu_agent_error_t update_nv_counters=
(
+=20
+     FWU_LOG_MSG("%s: enter\n\r", __func__);
+=20
+-    for (int i =3D 0; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
++    /* The FWU_BL2_NV_COUNTER (0) is not mirrored in the private metada=
ta. It is
++     * directly updated in the bl1_2_validate_image_at_addr() function,=
 in
++     * tfm/bl1/bl1_2/main.c.
++     * Because of this, the index starts from FWU_TFM_NV_COUNTER (1). *=
/
++    for (int i =3D FWU_TFM_NV_COUNTER; i <=3D FWU_MAX_NV_COUNTER_INDEX;=
 i++) {
+=20
+         switch (i) {
+-            case FWU_BL2_NV_COUNTER:
+-                tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL1_0;
+-                break;
+             case FWU_TFM_NV_COUNTER:
+                 tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL2_0;
+                 break;
+@@ -1140,18 +1141,21 @@ static enum fwu_agent_error_t update_nv_counters=
(
+         err =3D tfm_plat_read_nv_counter(tfm_nv_counter_i,
+                         sizeof(security_cnt), (uint8_t *)&security_cnt)=
;
+         if (err !=3D TFM_PLAT_ERR_SUCCESS) {
++            FWU_LOG_MSG("%s: couldn't read NV counter\n\r", __func__);
+             return FWU_AGENT_ERROR;
+         }
+=20
+         if (priv_metadata->nv_counter[i] < security_cnt) {
++            FWU_LOG_MSG("%s: staged NV counter is smaller than current =
value\n\r", __func__);
+             return FWU_AGENT_ERROR;
+         } else if (priv_metadata->nv_counter[i] > security_cnt) {
+-            FWU_LOG_MSG("%s: updaing index =3D %u nv counter =3D %u->%u=
\n\r",
++            FWU_LOG_MSG("%s: updating index =3D %u nv counter =3D %u->%=
u\n\r",
+                         __func__, i, security_cnt,
+-                        priv_metadata->nv_counter[FWU_BL2_NV_COUNTER]);
++                        priv_metadata->nv_counter[i]);
+             err =3D tfm_plat_set_nv_counter(tfm_nv_counter_i,
+-                                    priv_metadata->nv_counter[FWU_BL2_N=
V_COUNTER]);
++                                    priv_metadata->nv_counter[i]);
+             if (err !=3D TFM_PLAT_ERR_SUCCESS) {
++                FWU_LOG_MSG("%s: couldn't write NV counter\n\r", __func=
__);
+                 return FWU_AGENT_ERROR;
+             }
+         }
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-Platform-Corstone1000-skip-the-first-nv-counter.patch b/meta-arm-=
bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-Corst=
one1000-skip-the-first-nv-counter.patch
deleted file mode 100644
index a33ac437..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-Corstone1000-skip-the-first-nv-counter.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b6cb92b0618afe849a8c975d5f7391610724cff2 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Wed, 21 Feb 2024 07:44:25 +0000
-Subject: [PATCH 02/10] Platform: Corstone1000: skip the first nv counter
-
-It skips doing a sanity check the BL2 nv counter after the capsule
-update since the tfm bl1 does not sync metadata and nv counters in OTP d=
uring
-the boot anymore.
-
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Upstream-Status: Pending
----
- .../ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c     | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index a4747f2212..003ab9faf8 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -1122,7 +1122,7 @@ static enum fwu_agent_error_t update_nv_counters(
-=20
-     FWU_LOG_MSG("%s: enter\n\r", __func__);
-=20
--    for (int i =3D 0; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
-+    for (int i =3D 1; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
-=20
-         switch (i) {
-             case FWU_BL2_NV_COUNTER:
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0004-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-Cor=
stone1000-Enable-firewall-in-FVP.patch
similarity index 93%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0004-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0003-Platform-Corstone1000-Enable-firewall-in-FVP.patch
index c947888d..17aad5ab 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-Platform-Corstone1000-Enable-firewall-in-FVP.patch
@@ -1,14 +1,15 @@
-From a4e037b3bcf34982b8bdaf8693fd0f89d4f7fc87 Mon Sep 17 00:00:00 2001
+From 4b5a9546205e484ac7f53cee369b1db9a7bf2279 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <Emekcan.Aras@arm.com>
 Date: Wed, 3 Apr 2024 13:37:40 +0100
-Subject: [PATCH 04/10] Platform: Corstone1000: Enable host firewall in F=
VP
+Subject: [PATCH 3/9] Platform: Corstone1000: Enable firewall in FVP
=20
-Enables host firewall and mpu setup for FVP. It also fixes secure-ram
-configuration and disable access rights to secure ram from both normal w=
orld
-for both mps3 and fvp.
+Enables host firewall and MPU setup for FVP. It also fixes secure RAM
+configuration and disables access rights to secure RAM from normal world
+for both MPS3 and FVP.
=20
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Backport [4b5a9546205e484ac7f53cee369b1db9a7bf2279]
 ---
  .../Device/Include/platform_base_address.h    |  2 +-
  .../arm/corstone1000/bl1/boot_hal_bl1_1.c     | 42 ++++---------------
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0004-Platform-CS1000-Increase-ITS-max-asset-size.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-CS1000-In=
crease-ITS-max-asset-size.patch
new file mode 100644
index 00000000..21450654
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-Platform-CS1000-Increase-ITS-max-asset-size.patch
@@ -0,0 +1,41 @@
+From 2a7e418afc96a9c897d3511fd47dbe596f880074 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Wed, 17 Apr 2024 11:34:45 +0000
+Subject: [PATCH 4/9] Platform: CS1000: Increase ITS max asset size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Increases the max asset size for ITS to enable Parsec services and
+tests.
+=E2=80=8B
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Vikas Katariya <vikas.katariya@arm.com>
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Backport [2a7e418afc96a9c897d3511fd47dbe596f880074]
+---
+ platform/ext/target/arm/corstone1000/config_tfm_target.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
+index 2c7341afd..9522379cd 100644
+--- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
++++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2022, Arm Limited. All rights reserved.
++ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -20,4 +20,7 @@
+ /* The maximum number of assets to be stored in the Protected Storage a=
rea. */
+ #define PS_NUM_ASSETS        20
+=20
++/* The maximum size of asset to be stored in the Internal Trusted Stora=
ge area. */
++#define ITS_MAX_ASSET_SIZE   2048
++
+ #endif /* __CONFIG_TFM_TARGET_H__ */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-CS1000=
-Increase-RSE_COMMS-buffer-size.patch
new file mode 100644
index 00000000..059b5a2d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch
@@ -0,0 +1,38 @@
+From 85e7e9f52177c9617b8554fbacac34c8c591f549 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Fri, 5 Jul 2024 21:18:08 +0200
+Subject: [PATCH 5/9] Platform: CS1000: Increase RSE_COMMS buffer size
+
+This was needed because the UEFI variable index size was increased in
+the Host side software stack. The RSE_COMMS buffer has to be increased
+to accomodate the bigger messages.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Backport [85e7e9f52177c9617b8554fbacac34c8c591f549]
+---
+ .../ext/target/arm/corstone1000/rse_comms/rse_comms.h    | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h =
b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
+index 41e5c2bc3..720a60b62 100644
+--- a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
++++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
+@@ -15,8 +15,13 @@
+ extern "C" {
+ #endif
+=20
+-/* size suits to fit the largest message too (EFI variables) */
+-#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x2100)
++/*
++ * The size suits to fit the largest message too (EFI variables)
++ * This size is defined by the Host's software stack.
++ * The size was chosen by monitoring the messages that are coming
++ * from the Trusted Services SE Proxy partition.
++ */
++#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x43C0)
+=20
+ /*
+  * Allocated for each client request.
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-platform-corstone1000-Increase-ITS-max-asset-size.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-platform-cor=
stone1000-Increase-ITS-max-asset-size.patch
deleted file mode 100644
index 160015fb..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-platform-corstone1000-Increase-ITS-max-asset-size.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5b5c190ff91f387e4709950b6c734cda16c4b32d Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 17 Apr 2024 11:34:45 +0000
-Subject: [PATCH 05/10] platform: corstone1000: Increase ITS max asset si=
ze
-
-Increases the max asset size for ITS to enable parsec services & tests
-=E2=80=8B
-Upstream-Status: Pending
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Signed-off-by: Vikas Katariya <vikas.katariya@arm.com>
----
- platform/ext/target/arm/corstone1000/config_tfm_target.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
-index 2c7341afd4..2eb0924770 100644
---- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
-+++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
-@@ -20,4 +20,8 @@
- /* The maximum number of assets to be stored in the Protected Storage a=
rea. */
- #define PS_NUM_ASSETS        20
-=20
-+/* The maximum size of asset to be stored in the Internal Trusted Stora=
ge area. */
-+#undef ITS_MAX_ASSET_SIZE
-+#define ITS_MAX_ASSET_SIZE   2048
-+
- #endif /* __CONFIG_TFM_TARGET_H__ */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-Platform-CS1000-Increase-buffers-for-EFI-vars.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-CS1000-=
Increase-buffers-for-EFI-vars.patch
new file mode 100644
index 00000000..62022183
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-CS1000-Increase-buffers-for-EFI-vars.patch
@@ -0,0 +1,42 @@
+From 8ca9620a000ba182ebb51c51f49e2b97622f3404 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 15 May 2024 22:37:51 +0200
+Subject: [PATCH 6/9] Platform: CS1000: Increase buffers for EFI vars
+
+The UEFI variables are stored in the Protected Storage. The size of
+the variables metadata have been increased in the Host software stack
+so the related buffer sizes have to be increased:
+
+- The PS_MAX_ASSET_SIZE needs to be big enough to store the variables.
+- The CRYPTO_ENGINE_BUF_SIZE needs to be increased because the encryptio=
n
+  of the bigger PS assets requires bigger buffer.
+- The CRYPTO_IOVEC_BUFFER_SIZE needs to be increased because the PS
+  assets are passed through the IOVEC buffer between the crypto and
+  PS partition during encryption.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Backport [8ca9620a000ba182ebb51c51f49e2b97622f3404]
+---
+ platform/ext/target/arm/corstone1000/config_tfm_target.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
+index 9522379cd..0b410dfd4 100644
+--- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
++++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
+@@ -23,4 +23,12 @@
+ /* The maximum size of asset to be stored in the Internal Trusted Stora=
ge area. */
+ #define ITS_MAX_ASSET_SIZE   2048
+=20
++/* The maximum asset size to be stored in the Protected Storage */
++#define PS_MAX_ASSET_SIZE   2592
++
++/* This is needed to be able to process the EFI variables during PS wri=
tes. */
++#define CRYPTO_ENGINE_BUF_SIZE 0x5000
++
++/* This is also has to be increased to fit the EFI variables into the i=
ovecs. */
++#define CRYPTO_IOVEC_BUFFER_SIZE    6000
+ #endif /* __CONFIG_TFM_TARGET_H__ */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-platform-=
corstone1000-Increase-RSE_COMMS-buffer-size.patch
deleted file mode 100644
index 1e79f9fd..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-platform-corstone1000-Increase-RSE_COMMS-buffer-size.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 05611d5a55ac8858d07c64e48699100700578b80 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Fri, 5 Jul 2024 21:18:08 +0200
-Subject: [PATCH 06/10] platform: corstone1000: Increase RSE_COMMS buffer=
 size
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending
----
- platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h =
b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
-index 41e5c2bc34..b89460ea93 100644
---- a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
-@@ -16,7 +16,7 @@ extern "C" {
- #endif
-=20
- /* size suits to fit the largest message too (EFI variables) */
--#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x2100)
-+#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x43C0)
-=20
- /*
-  * Allocated for each client request.
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-Platform-Corstone1000-switch-to-metadata-v2.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Plaform-Corstone10=
00-Switch-to-metadata-v2.patch
similarity index 69%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0011-Platform-Corstone1000-switch-to-metadata-v2.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0007-Plaform-Corstone1000-Switch-to-metadata-v2.patch
index 527428bf..2e14dfd6 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-Platform-Corstone1000-switch-to-metadata-v2.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-Plaform-Corstone1000-Switch-to-metadata-v2.patch
@@ -1,26 +1,27 @@
-From 748e0b4acbd9e1dce3450beffe2d54565df9ee8d Mon Sep 17 00:00:00 2001
+From c731d187fbe9fc1e10ad8ecfb3d04bb480bc86b6 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <Emekcan.Aras@arm.com>
 Date: Mon, 8 Apr 2024 16:04:45 +0100
-Subject: [PATCH] Plaform: Corstone1000: Switch to metadata v2
+Subject: [PATCH 7/9] Plaform: Corstone1000: Switch to metadata v2
=20
-This upgrades metadata data structs from v1 to v2 as described in psa
-fwu spec: https://developer.arm.com/documentation/den0118/latest/
+This upgrades metadata data structs from v1 to v2 as described in PSA
+FWU Specification:
+https://developer.arm.com/documentation/den0118/latest/
=20
 The TrustedFirmware-A v2.11 release supports only the metadata v2. The
 structs in TF-M side had to be aligned to keep the compatibility.
=20
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [c731d187fbe9fc1e10ad8ecfb3d04bb480bc86b6]
 ---
- .../corstone1000/fw_update_agent/fwu_agent.c  | 94 ++++++++++++++-----
- 1 file changed, 72 insertions(+), 22 deletions(-)
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 86 +++++++++++++++----
+ 1 file changed, 69 insertions(+), 17 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index be04e0e5df..9f942cb23a 100644
+index b2f31e166..5fddd3238 100644
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
 +++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -26,6 +26,13 @@
+@@ -26,6 +26,15 @@
  #include "platform.h"
  #endif
 =20
@@ -28,13 +29,15 @@ index be04e0e5df..9f942cb23a 100644
 +#define FWU_FW_STORE_DESC_OFFSET	0x20
 +#define NR_OF_MAX_FW_BANKS		4
 +
-+/*Metadata version 2 data structures defined by PSA_FW update specifica=
tion;
-+ *https://developer.arm.com/documentation/den0118/latest/ */
++/*
++ * Metadata version 2 data structures defined by PSA_FW update specific=
ation
++ * at https://developer.arm.com/documentation/den0118/latest/
++ */
 +
  /* Properties of image in a bank */
  struct fwu_image_properties {
 =20
-@@ -58,6 +65,28 @@ struct fwu_image_entry {
+@@ -58,6 +67,28 @@ struct fwu_image_entry {
 =20
  } __packed;
 =20
@@ -63,7 +66,7 @@ index be04e0e5df..9f942cb23a 100644
  struct fwu_metadata {
 =20
          /* Metadata CRC value */
-@@ -72,8 +101,23 @@ struct fwu_metadata {
+@@ -72,8 +103,23 @@ struct fwu_metadata {
          /* Previous bank index with which device booted successfully */
          uint32_t previous_active_index;
 =20
@@ -89,16 +92,7 @@ index be04e0e5df..9f942cb23a 100644
 =20
  } __packed;
 =20
-@@ -284,7 +328,7 @@ static enum fwu_agent_error_t metadata_validate(stru=
ct fwu_metadata *p_metadata)
-     }
-=20
-     uint32_t calculated_crc32 =3D crc32((uint8_t *)&(p_metadata->versio=
n),
--                                      sizeof(struct fwu_metadata) - siz=
eof(uint32_t));
-+                                      sizeof(struct fwu_metadata) - siz=
eof(p_metadata->crc_32));
-=20
-     if (p_metadata->crc_32 !=3D calculated_crc32) {
-         FWU_LOG_MSG("%s: failed: crc32 calculated: 0x%x, given: 0x%x\n\=
r", __func__,
-@@ -618,25 +662,31 @@ enum fwu_agent_error_t fwu_metadata_provision(void=
)
+@@ -607,23 +653,29 @@ enum fwu_agent_error_t fwu_metadata_provision(void=
)
 =20
      memset(&_metadata, 0, sizeof(struct fwu_metadata));
 =20
@@ -132,12 +126,9 @@ index be04e0e5df..9f942cb23a 100644
 +    /* Calculate CRC32 for fwu metadata. The first filed in the _metada=
ta has to be the crc_32.
 +     * This should be omited from the calculation. */
      _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
--                             sizeof(struct fwu_metadata) - sizeof(uint3=
2_t));
-+                             sizeof(struct fwu_metadata) - sizeof(_meta=
data.crc_32));
+                              sizeof(struct fwu_metadata) - sizeof(uint3=
2_t));
 =20
-     ret =3D metadata_write(&_metadata);
-     if (ret) {
-@@ -696,7 +746,7 @@ static enum fwu_agent_state_t get_fwu_agent_state(
+@@ -685,7 +737,7 @@ static enum fwu_agent_state_t get_fwu_agent_state(
      }
 =20
      for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
@@ -146,7 +137,7 @@ index be04e0e5df..9f942cb23a 100644
                  =3D=3D (IMAGE_NOT_ACCEPTED)) {
              return FWU_AGENT_STATE_TRIAL;
          }
-@@ -771,7 +821,7 @@ static enum fwu_agent_error_t flash_full_capsule(
+@@ -760,7 +812,7 @@ static enum fwu_agent_error_t flash_full_capsule(
      }
 =20
      if (version <=3D
@@ -155,7 +146,7 @@ index be04e0e5df..9f942cb23a 100644
          FWU_LOG_MSG("ERROR: %s: version error\n\r",__func__);
          return FWU_AGENT_ERROR;
      }
-@@ -802,14 +852,14 @@ static enum fwu_agent_error_t flash_full_capsule(
+@@ -791,9 +843,9 @@ static enum fwu_agent_error_t flash_full_capsule(
 =20
      /* Change system state to trial bank state */
      for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
@@ -167,13 +158,7 @@ index be04e0e5df..9f942cb23a 100644
      }
      metadata->active_index =3D previous_active_index;
      metadata->previous_active_index =3D active_index;
-     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
--                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
-+                              sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
-=20
-     ret =3D metadata_write(metadata);
-     if (ret) {
-@@ -911,7 +961,7 @@ static enum fwu_agent_error_t accept_full_capsule(
+@@ -900,7 +952,7 @@ static enum fwu_agent_error_t accept_full_capsule(
      FWU_LOG_MSG("%s: enter\n\r", __func__);
 =20
      for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
@@ -182,16 +167,7 @@ index be04e0e5df..9f942cb23a 100644
                                                              IMAGE_ACCEP=
TED;
      }
 =20
-@@ -922,7 +972,7 @@ static enum fwu_agent_error_t accept_full_capsule(
-         return ret;
-     }
-     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
--                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
-+                              sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
-=20
-     ret =3D metadata_write(metadata);
-     if (ret) {
-@@ -1001,7 +1051,7 @@ static enum fwu_agent_error_t fwu_select_previous(
+@@ -990,7 +1042,7 @@ static enum fwu_agent_error_t fwu_select_previous(
 =20
      index =3D metadata->previous_active_index;
      for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
@@ -200,16 +176,7 @@ index be04e0e5df..9f942cb23a 100644
          {
              FWU_ASSERT(0);
          }
-@@ -1018,7 +1068,7 @@ static enum fwu_agent_error_t fwu_select_previous(
-         return ret;
-     }
-     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
--                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
-+                              sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
-=20
-     ret =3D metadata_write(metadata);
-     if (ret) {
-@@ -1218,7 +1268,7 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(v=
oid)
+@@ -1211,7 +1263,7 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(v=
oid)
          /* firmware update failed, revert back to previous bank */
 =20
          priv_metadata.fmp_last_attempt_version =3D
@@ -218,7 +185,7 @@ index be04e0e5df..9f942cb23a 100644
 =20
          priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_E=
RROR_UNSUCCESSFUL;
 =20
-@@ -1229,9 +1279,9 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(v=
oid)
+@@ -1222,9 +1274,9 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(v=
oid)
          /* firmware update successful */
 =20
          priv_metadata.fmp_version =3D
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-platform-corstone1000-Increase-flash-PS-area-size.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-CS1=
000-Increase-flash-PS-area-size.patch
similarity index 60%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0012-platform-corstone1000-Increase-flash-PS-area-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0008-Platform-CS1000-Increase-flash-PS-area-size.patch
index cbf8ea66..77e8ddba 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-platform-corstone1000-Increase-flash-PS-area-size.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-Platform-CS1000-Increase-flash-PS-area-size.patch
@@ -1,26 +1,29 @@
-From f7082b1d74a7056fff11bc21142a14f7f7b4635b Mon Sep 17 00:00:00 2001
+From 3794ba29b66641ebecbd4dd3d9a2a2e8caeb690a Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Mon, 15 Jul 2024 13:03:24 +0000
-Subject: [PATCH 1/1] platform: corstone1000: Increase flash PS area size
-
-Aim of this is to increase the size of PS storage in Secure Flash.
+Subject: [PATCH 8/9] Platform: CS1000: Increase flash PS area size
=20
+Previously, approximately only 2MB was used out of the 8MB SE Flash.
+The aim of this commit is to increase the size of PS storage in SE
+Flash.
 Increasing the size minimize the possibilities of it to run out
-of memory.
+of memory as it is not cleared on reset or reprogramming of the device.
=20
-FLASH_PS_AREA_SIZE is increased.
+The FLASH_PS_AREA_SIZE is increased to 6MB so now 7MB of the SE Flash
+is used. The remaining 1MB is allocated for future uses.
=20
 Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Backport [3794ba29b66641ebecbd4dd3d9a2a2e8caeb690a]
 ---
  platform/ext/target/arm/corstone1000/partition/flash_layout.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index 568c8de28..b163b9c31 100644
+index a181a7168..07b4cdea7 100644
 --- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
 +++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -194,7 +194,7 @@
+@@ -192,7 +192,7 @@
 =20
  #define FLASH_PS_AREA_OFFSET            (FLASH_ITS_AREA_OFFSET + \
                                           FLASH_ITS_AREA_SIZE)
@@ -30,5 +33,5 @@ index 568c8de28..b163b9c31 100644
  /* OTP_definitions */
  #define FLASH_OTP_NV_COUNTERS_AREA_OFFSET (FLASH_PS_AREA_OFFSET + \
 --=20
-2.34.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-c=
orstone1000-Increase-buffers-for-EFI-vars.patch
deleted file mode 100644
index 1070afc0..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-Platform-corstone1000-Increase-buffers-for-EFI-vars.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 9dd3287693c259a88d81140c26f9c792d808dd7c Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 15 May 2024 22:37:51 +0200
-Subject: [PATCH 08/10] Platform: corstone1000: Increase buffers for EFI =
vars
-
-The UEFI variables are stored in the Protected Storage. The size of
-the variables metadata have been increased so the related buffer sizes
-have to be increased.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending
----
- .../ext/target/arm/corstone1000/config_tfm_target.h | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
-index 2eb0924770..6ee823a7dc 100644
---- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
-+++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -24,4 +24,15 @@
- #undef ITS_MAX_ASSET_SIZE
- #define ITS_MAX_ASSET_SIZE   2048
-=20
-+/* The maximum asset size to be stored in the Protected Storage */
-+#undef PS_MAX_ASSET_SIZE
-+#define PS_MAX_ASSET_SIZE   2592
-+
-+/* This is needed to be able to process the EFI variables during PS wri=
tes. */
-+#undef CRYPTO_ENGINE_BUF_SIZE
-+#define CRYPTO_ENGINE_BUF_SIZE 0x5000
-+
-+/* This is also has to be increased to fit the EFI variables into the i=
ovecs. */
-+#undef CRYPTO_IOVEC_BUFFER_SIZE
-+#define CRYPTO_IOVEC_BUFFER_SIZE    6000
- #endif /* __CONFIG_TFM_TARGET_H__ */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-Platform-CS1000-Fix-Bank-offsets.patch b/meta-arm-bsp/recipes-bsp=
/trusted-firmware-m/files/corstone1000/0011-Platform-CS1000-Fix-Bank-offs=
ets.patch
similarity index 86%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0013-Platform-CS1000-Fix-Bank-offsets.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0011-Platform-CS1000-Fix-Bank-offsets.patch
index c448bbad..218dff38 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-Platform-CS1000-Fix-Bank-offsets.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-Platform-CS1000-Fix-Bank-offsets.patch
@@ -1,7 +1,7 @@
-From 9eee1fb21191cf8702054182136a626315017511 Mon Sep 17 00:00:00 2001
+From 939a39a0705ed2571fe5b842a9d5f80036f71a12 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Fri, 2 Aug 2024 22:02:55 +0200
-Subject: [PATCH 2/6] Platform: CS1000: Fix Bank offsets
+Subject: [PATCH 9/9] Platform: CS1000: Fix Bank offsets
=20
 The BANK_0_PARTITION_OFFSET and BANK_1_PARTITION_OFFSET are used for
 erasing the banks during capsule update. The fwu_agent erases the flash
@@ -9,13 +9,13 @@ using them as starting addresses. The BL2 (MCUBoot) sho=
uld also
 be erased during capsule update.
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [939a39a0705ed2571fe5b842a9d5f80036f71a12]
 ---
  .../ext/target/arm/corstone1000/partition/flash_layout.h    | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index 9fc1d9fa63..2c5dba7006 100644
+index 07b4cdea7..f42dda809 100644
 --- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
 +++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
 @@ -109,10 +109,8 @@
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-Platform-CS1000-Increase-BL2-partition-size.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-CS1000-In=
crease-BL2-partition-size.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0014-Platform-CS1000-Increase-BL2-partition-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0012-Platform-CS1000-Increase-BL2-partition-size.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-CC312-ADAC-Add-=
PSA_WANT_ALG_SHA_256-definition.patch
similarity index 94%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0015-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0013-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
index 63737a0f..b273700f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
@@ -13,7 +13,7 @@ of this, the PSA_HASH_MAX_SIZE is not set correctly for=
 the sources
 of the psa_adac_cc312 target. This caused runtime issues.
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/31131]
 ---
  platform/ext/accelerator/cc312/psa-adac/CMakeLists.txt | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0016-Platform-CS1000-Add-crypto-configs-for-ADAC.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0014-Platform-CS1000-Ad=
d-crypto-configs-for-ADAC.patch
similarity index 54%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0016-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0014-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
index a56a6f8a..35ba5a30 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016=
-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014=
-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
@@ -1,36 +1,38 @@
-From ea0f0236f1dbe9ff7640c90311a3116e6db33aa2 Mon Sep 17 00:00:00 2001
+From 8d6ed0ac3b1eee4b1e279993ec351e9bd80b68dc Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Wed, 31 Jul 2024 13:38:27 +0200
-Subject: [PATCH 3/3] Platform: CS1000: Add crypto configs for ADAC
+Subject: [PATCH] Platform: CS1000: Add crypto configs for ADAC
=20
 The psa_adac_psa_crypto target needs the MBEDTLS_CONFIG_FILE and
 MBEDTLS_PSA_CRYPTO_CONFIG_FILE defines in order to build correctly.
 The default crypto config files are used here.
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/31132]
 ---
- platform/ext/target/arm/corstone1000/CMakeLists.txt | 10 ++++++++++
- 1 file changed, 10 insertions(+)
+ platform/ext/target/arm/corstone1000/CMakeLists.txt | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
=20
 diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 896961306d..d3652ff40c 100644
+index 530c4059d..3709bf3ec 100644
 --- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
 +++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -409,6 +409,16 @@ if (${PLATFORM_PSA_ADAC_SECURE_DEBUG})
+@@ -412,6 +412,18 @@ if (${PLATFORM_PSA_ADAC_SECURE_DEBUG})
          PRIVATE
              platform_bl2
      )
 +
 +    target_compile_definitions(psa_adac_psa_crypto
-+    PRIVATE
-+        MBEDTLS_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/mbedcrypto/m=
bedcrypto_config/tfm_mbedcrypto_config_default.h"
-+        MBEDTLS_PSA_CRYPTO_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/m=
bedcrypto/mbedcrypto_config/crypto_config_default.h"
++        PRIVATE
++            MBEDTLS_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/mbedcryp=
to/mbedcrypto_config/tfm_mbedcrypto_config_default.h"
++            MBEDTLS_PSA_CRYPTO_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/e=
xt/mbedcrypto/mbedcrypto_config/crypto_config_default.h"
 +    )
++
 +    target_link_libraries(psa_adac_psa_crypto
 +        PRIVATE
 +            psa_crypto_library_config
 +    )
++
  endif()
 =20
  find_package(Python3)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0017-Platform-CS1000-Fix-platform-name-in-logs.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-m/files/corstone1000/0015-Platform-CS1000-Fix-=
platform-name-in-logs.patch
similarity index 93%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0017-Platform-CS1000-Fix-platform-name-in-logs.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0015-Platform-CS1000-Fix-platform-name-in-logs.patch
index cc20eae2..96ba3c1e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017=
-Platform-CS1000-Fix-platform-name-in-logs.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-Platform-CS1000-Fix-platform-name-in-logs.patch
@@ -4,7 +4,7 @@ Date: Wed, 31 Jul 2024 19:57:33 +0200
 Subject: [PATCH] Platform: CS1000: Fix platform name in logs
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [c3fa68995b247c802589890c6ea3e721127b0c78]
 ---
  platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0018-Platform-corstone1000-Fix-isolation-L2-memory-protection.patch b/=
meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016-Platf=
orm-corstone1000-Fix-isolation-L2-memory-protection.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0018-Platform-corstone1000-Fix-isolation-L2-memory-protection.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0016-Platform-corstone1000-Fix-isolation-L2-memory-protection.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0019-Platform-CS1000-Remove-unused-BL1-files.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0017-Platform-CS1000-Remove=
-unused-BL1-files.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0019-Platform-CS1000-Remove-unused-BL1-files.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0017-Platform-CS1000-Remove-unused-BL1-files.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0020-Platform-CS1000-Remove-duplicated-metadata-write.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018-Platform-CS10=
00-Remove-duplicated-metadata-write.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0020-Platform-CS1000-Remove-duplicated-metadata-write.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0018-Platform-CS1000-Remove-duplicated-metadata-write.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0021-Platform-CS1000-Fix-compiler-switch-in-BL1.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0019-Platform-CS1000-Fix=
-compiler-switch-in-BL1.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0021-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0019-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0022-Platform-CS1000-Validate-both-metadata-replicas.patch b/meta-arm-=
bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0020-Platform-CS100=
0-Validate-both-metadata-replicas.patch
similarity index 82%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0022-Platform-CS1000-Validate-both-metadata-replicas.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0020-Platform-CS1000-Validate-both-metadata-replicas.patch
index 902c1b6a..e38c8651 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0022=
-Platform-CS1000-Validate-both-metadata-replicas.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0020=
-Platform-CS1000-Validate-both-metadata-replicas.patch
@@ -1,7 +1,7 @@
-From df0b5f5f7da1d7dbe10ccf35f9971e58e3110f6e Mon Sep 17 00:00:00 2001
+From 5fd2662e1f20b5c645ff0755e84424bae303fa45 Mon Sep 17 00:00:00 2001
 From: Bence Balogh <bence.balogh@arm.com>
 Date: Mon, 9 Sep 2024 09:42:58 +0200
-Subject: [PATCH 1/2] Platform: CS1000: Validate both metadata replicas
+Subject: [PATCH] Platform: CS1000: Validate both metadata replicas
=20
 According to the [1] both metadata replica integrity should be checked
 during the update agent initialization, and if one of the replica is
@@ -20,15 +20,15 @@ This commit:
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
 ---
- .../corstone1000/fw_update_agent/fwu_agent.c  | 155 ++++++++++++------
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 167 ++++++++++++------
  .../corstone1000/fw_update_agent/fwu_agent.h  |   7 +
- 2 files changed, 111 insertions(+), 51 deletions(-)
+ 2 files changed, 119 insertions(+), 55 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index 9890eeaf90..a09653b3ac 100644
+index 92b918c67..aad6208e0 100644
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
 +++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -397,18 +397,30 @@ static enum fwu_agent_error_t metadata_read_withou=
t_validation(struct fwu_metada
+@@ -395,20 +395,33 @@ static enum fwu_agent_error_t metadata_read_withou=
t_validation(struct fwu_metada
  #endif
 =20
  #ifdef BL1_BUILD
@@ -41,7 +41,14 @@ index 9890eeaf90..a09653b3ac 100644
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
 -                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
 +    FWU_LOG_MSG("%s: enter\n\r", __func__);
-+
+=20
+     if (!p_metadata) {
+         return FWU_AGENT_ERROR;
+     }
+=20
+-    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
 +    if (replica_num =3D=3D 1) {
 +        replica_offset =3D FWU_METADATA_REPLICA_1_OFFSET;
 +    } else if (replica_num =3D=3D 2) {
@@ -52,18 +59,16 @@ index 9890eeaf90..a09653b3ac 100644
 +    }
 +
 +    FWU_LOG_MSG("%s: flash addr =3D %u, size =3D %d\n\r", __func__,
-+                  replica_offset, sizeof(struct fwu_metadata));
-=20
-     if (!p_metadata) {
++                  replica_offset, sizeof(*p_metadata));
++
++
++    ret =3D FWU_METADATA_FLASH_DEV.ReadData(replica_offset,
++                                p_metadata, sizeof(*p_metadata));
++    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
          return FWU_AGENT_ERROR;
      }
 =20
--    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
-+    ret =3D FWU_METADATA_FLASH_DEV.ReadData(replica_offset,
-                                 p_metadata, sizeof(struct fwu_metadata)=
);
-     if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-         return FWU_AGENT_ERROR;
-@@ -424,7 +436,7 @@ static enum fwu_agent_error_t metadata_read(struct f=
wu_metadata *p_metadata)
+@@ -422,17 +435,27 @@ static enum fwu_agent_error_t metadata_read(struct=
 fwu_metadata *p_metadata)
      return FWU_AGENT_SUCCESS;
  }
  #else
@@ -72,7 +77,11 @@ index 9890eeaf90..a09653b3ac 100644
  {
      uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
      partition_entry_t *part;
-@@ -434,7 +446,15 @@ static enum fwu_agent_error_t metadata_read(struct =
fwu_metadata *p_metadata)
+     int ret;
+=20
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
+     if (!p_metadata) {
          return FWU_AGENT_ERROR;
      }
 =20
@@ -89,7 +98,7 @@ index 9890eeaf90..a09653b3ac 100644
      if (!part) {
          FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
          return FWU_AGENT_ERROR;
-@@ -463,37 +483,35 @@ static enum fwu_agent_error_t metadata_read(struct=
 fwu_metadata *p_metadata)
+@@ -461,39 +484,38 @@ static enum fwu_agent_error_t metadata_read(struct=
 fwu_metadata *p_metadata)
 =20
  #ifdef BL1_BUILD
  static enum fwu_agent_error_t metadata_write(
@@ -103,13 +112,7 @@ index 9890eeaf90..a09653b3ac 100644
 -                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
 +    FWU_LOG_MSG("%s: enter\n\r", __func__);
 =20
--    if (!p_metadata) {
-+    if (replica_num =3D=3D 1) {
-+        replica_offset =3D FWU_METADATA_REPLICA_1_OFFSET;
-+    } else if (replica_num =3D=3D 2) {
-+        replica_offset =3D FWU_METADATA_REPLICA_2_OFFSET;
-+    } else {
-+        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
+     if (!p_metadata) {
          return FWU_AGENT_ERROR;
      }
 =20
@@ -117,31 +120,40 @@ index 9890eeaf90..a09653b3ac 100644
 -    if (ret !=3D ARM_DRIVER_OK) {
 -        return FWU_AGENT_ERROR;
 -    }
-+    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
-+                  replica_offset, sizeof(struct fwu_metadata));
-=20
+-
 -    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_1_O=
FFSET,
 -                                p_metadata, sizeof(struct fwu_metadata)=
);
 -    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-+    if (!p_metadata) {
++    if (replica_num =3D=3D 1) {
++        replica_offset =3D FWU_METADATA_REPLICA_1_OFFSET;
++    } else if (replica_num =3D=3D 2) {
++        replica_offset =3D FWU_METADATA_REPLICA_2_OFFSET;
++    } else {
++        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
          return FWU_AGENT_ERROR;
      }
 =20
--    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+     FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
 -                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
--
++                  replica_offset, sizeof(*p_metadata));
+=20
 -    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
++
 +    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(replica_offset);
      if (ret !=3D ARM_DRIVER_OK) {
          return FWU_AGENT_ERROR;
      }
 =20
 -    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
 +    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(replica_offset,
-                                 p_metadata, sizeof(struct fwu_metadata)=
);
-     if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
++                                p_metadata, sizeof(*p_metadata));
++    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
          return FWU_AGENT_ERROR;
-@@ -505,7 +523,7 @@ static enum fwu_agent_error_t metadata_write(
+     }
+=20
+@@ -503,7 +525,7 @@ static enum fwu_agent_error_t metadata_write(
  }
  #else
  static enum fwu_agent_error_t metadata_write(
@@ -150,7 +162,7 @@ index 9890eeaf90..a09653b3ac 100644
  {
      uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
      partition_entry_t *part;
-@@ -515,7 +533,15 @@ static enum fwu_agent_error_t metadata_write(
+@@ -513,7 +535,15 @@ static enum fwu_agent_error_t metadata_write(
          return FWU_AGENT_ERROR;
      }
 =20
@@ -167,7 +179,7 @@ index 9890eeaf90..a09653b3ac 100644
      if (!part) {
          FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
          return FWU_AGENT_ERROR;
-@@ -535,32 +561,51 @@ static enum fwu_agent_error_t metadata_write(
+@@ -533,32 +563,51 @@ static enum fwu_agent_error_t metadata_write(
          return FWU_AGENT_ERROR;
      }
 =20
@@ -236,18 +248,20 @@ index 9890eeaf90..a09653b3ac 100644
 =20
  enum fwu_agent_error_t fwu_metadata_init(void)
  {
-@@ -619,7 +664,7 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
+@@ -617,8 +666,8 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
       * had a firmware data?. If yes, then don't initialize
       * metadata
       */
 -    metadata_read(&_metadata);
+-    if(_metadata.active_index < 2 || _metadata.previous_active_index <2=
){
 +    metadata_read(&_metadata, 1);
-     if(_metadata.active_index < 2 || _metadata.previous_active_index <2=
){
++    if(_metadata.active_index < 2 || _metadata.previous_active_index < =
2){
      	if(_metadata.active_index ^ _metadata.previous_active_index)
      		return FWU_AGENT_SUCCESS;
-@@ -654,13 +699,13 @@ enum fwu_agent_error_t fwu_metadata_provision(void=
)
+     }
+@@ -652,13 +701,13 @@ enum fwu_agent_error_t fwu_metadata_provision(void=
)
      _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
-                              sizeof(struct fwu_metadata) - sizeof(_meta=
data.crc_32));
+                              sizeof(struct fwu_metadata) - sizeof(uint3=
2_t));
 =20
 -    ret =3D metadata_write(&_metadata);
 +    ret =3D metadata_write_both_replica(&_metadata);
@@ -255,22 +269,23 @@ index 9890eeaf90..a09653b3ac 100644
          return ret;
      }
 =20
-     memset(&_metadata, 0, sizeof(struct fwu_metadata));
+-    memset(&_metadata, 0, sizeof(struct fwu_metadata));
 -    ret =3D metadata_read(&_metadata);
++    memset(&_metadata, 0, sizeof(_metadata));
 +    ret =3D metadata_read(&_metadata, 1);
      if (ret) {
          return ret;
      }
-@@ -827,7 +872,7 @@ static enum fwu_agent_error_t flash_full_capsule(
+@@ -825,7 +874,7 @@ static enum fwu_agent_error_t flash_full_capsule(
      metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
-                               sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
+                               sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
 =20
 -    ret =3D metadata_write(metadata);
 +    ret =3D metadata_write_both_replica(metadata);
      if (ret) {
          return ret;
      }
-@@ -854,7 +899,7 @@ enum fwu_agent_error_t corstone1000_fwu_flash_image(=
void)
+@@ -852,7 +901,7 @@ enum fwu_agent_error_t corstone1000_fwu_flash_image(=
void)
 =20
      Select_Write_Mode_For_Shared_Flash();
 =20
@@ -279,25 +294,25 @@ index 9890eeaf90..a09653b3ac 100644
          ret =3D  FWU_AGENT_ERROR;
          goto out;
      }
-@@ -940,7 +985,7 @@ static enum fwu_agent_error_t accept_full_capsule(
+@@ -938,7 +987,7 @@ static enum fwu_agent_error_t accept_full_capsule(
      metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
-                               sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
+                               sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
 =20
 -    ret =3D metadata_write(metadata);
 +    ret =3D metadata_write_both_replica(metadata);
      if (ret) {
          return ret;
      }
-@@ -1036,7 +1081,7 @@ static enum fwu_agent_error_t fwu_select_previous(
+@@ -1034,7 +1083,7 @@ static enum fwu_agent_error_t fwu_select_previous(
      metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
-                               sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
+                               sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
 =20
 -    ret =3D metadata_write(metadata);
 +    ret =3D metadata_write_both_replica(metadata);
      if (ret) {
          return ret;
      }
-@@ -1066,7 +1111,7 @@ void bl1_get_active_bl2_image(uint32_t *offset)
+@@ -1064,7 +1113,7 @@ void bl1_get_active_bl2_image(uint32_t *offset)
          FWU_ASSERT(0);
      }
 =20
@@ -306,7 +321,7 @@ index 9890eeaf90..a09653b3ac 100644
          FWU_ASSERT(0);
      }
 =20
-@@ -1205,9 +1250,17 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(=
void)
+@@ -1203,9 +1252,17 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(=
void)
          return FWU_AGENT_ERROR;
      }
 =20
@@ -325,7 +340,7 @@ index 9890eeaf90..a09653b3ac 100644
          ret =3D FWU_AGENT_ERROR;
          goto out;
      }
-@@ -1317,7 +1370,7 @@ void host_acknowledgement_timer_to_reset(void)
+@@ -1315,7 +1372,7 @@ void host_acknowledgement_timer_to_reset(void)
          FWU_ASSERT(0);
      }
 =20
@@ -335,7 +350,7 @@ index 9890eeaf90..a09653b3ac 100644
      }
 =20
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
-index 701f205583..78e1042778 100644
+index 701f20558..78e104277 100644
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
 +++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
 @@ -70,4 +70,11 @@ enum fwu_nv_counter_index_t {
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-platform-corstone1000-add-unique-guid-for-mps3.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0021-platform-corsto=
ne1000-add-unique-guid-for-mps3.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0003-platform-corstone1000-add-unique-guid-for-mps3.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0021-platform-corstone1000-add-unique-guid-for-mps3.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0007-CC312-alignment-of-cc312-differences-between-fvp-and.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0022-CC312-ali=
gnment-of-cc312-differences.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0007-CC312-alignment-of-cc312-differences-between-fvp-and.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0022-CC312-alignment-of-cc312-differences.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 925a43e1..9c38d1ad 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -20,28 +20,28 @@ SRC_URI +=3D " \
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append:corstone1000 =3D " \
-    file://0001-platform-corstone1000-align-capsule-update-structs.patch=
 \
-    file://0002-Platform-Corstone1000-skip-the-first-nv-counter.patch \
-    file://0003-platform-corstone1000-add-unique-guid-for-mps3.patch \
-    file://0004-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch =
\
-    file://0005-platform-corstone1000-Increase-ITS-max-asset-size.patch =
\
-    file://0006-platform-corstone1000-Increase-RSE_COMMS-buffer-size.pat=
ch \
-    file://0007-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
-    file://0008-Platform-corstone1000-Increase-buffers-for-EFI-vars.patc=
h \
+    file://0001-Platform-Corstone1000-Align-capsule-UEFI-structs.patch \
+    file://0002-Platform-Corstone1000-Fix-NV-counter-writing.patch \
+    file://0003-Platform-Corstone1000-Enable-firewall-in-FVP.patch \
+    file://0004-Platform-CS1000-Increase-ITS-max-asset-size.patch \
+    file://0005-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch \
+    file://0006-Platform-CS1000-Increase-buffers-for-EFI-vars.patch \
+    file://0007-Plaform-Corstone1000-Switch-to-metadata-v2.patch \
+    file://0008-Platform-CS1000-Increase-flash-PS-area-size.patch \
     file://0009-corstone1000-Remove-reset-after-capsule-update.patch \
     file://0010-platform-CS1000-Add-multicore-support-for-FVP.patch \
-    file://0011-Platform-Corstone1000-switch-to-metadata-v2.patch \
-    file://0012-platform-corstone1000-Increase-flash-PS-area-size.patch =
\
-    file://0013-Platform-CS1000-Fix-Bank-offsets.patch \
-    file://0014-Platform-CS1000-Increase-BL2-partition-size.patch \
-    file://0015-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch \
-    file://0016-Platform-CS1000-Add-crypto-configs-for-ADAC.patch \
-    file://0017-Platform-CS1000-Fix-platform-name-in-logs.patch \
-    file://0018-Platform-corstone1000-Fix-isolation-L2-memory-protection=
.patch \
-    file://0019-Platform-CS1000-Remove-unused-BL1-files.patch \
-    file://0020-Platform-CS1000-Remove-duplicated-metadata-write.patch \
-    file://0021-Platform-CS1000-Fix-compiler-switch-in-BL1.patch \
-    file://0022-Platform-CS1000-Validate-both-metadata-replicas.patch \
+    file://0011-Platform-CS1000-Fix-Bank-offsets.patch \
+    file://0012-Platform-CS1000-Increase-BL2-partition-size.patch \
+    file://0013-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch \
+    file://0014-Platform-CS1000-Add-crypto-configs-for-ADAC.patch \
+    file://0015-Platform-CS1000-Fix-platform-name-in-logs.patch \
+    file://0016-Platform-corstone1000-Fix-isolation-L2-memory-protection=
.patch \
+    file://0017-Platform-CS1000-Remove-unused-BL1-files.patch \
+    file://0018-Platform-CS1000-Remove-duplicated-metadata-write.patch \
+    file://0019-Platform-CS1000-Fix-compiler-switch-in-BL1.patch \
+    file://0020-Platform-CS1000-Validate-both-metadata-replicas.patch \
+    file://0021-platform-corstone1000-add-unique-guid-for-mps3.patch \
+    file://0022-CC312-alignment-of-cc312-differences.patch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"
--=20
2.25.1


