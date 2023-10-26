Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D155C25B6E
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:19:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.75197.1698337193663831814
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 09:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBD721424;
	Thu, 26 Oct 2023 09:20:34 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DD563F64C;
	Thu, 26 Oct 2023 09:19:52 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-m: fix capsule update alignment
Date: Thu, 26 Oct 2023 17:19:46 +0100
Message-Id: <20231026161947.2463621-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231026161947.2463621-1-emekcan.aras@arm.com>
References: <20231026161947.2463621-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 16:19:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5182

From: Emekcan Aras <emekcan.aras@arm.com>

U-boot mkefitool creates capsule image without packed and byte-aligned st=
ructs.
This patch aligns the capsule-update structures and avoids crashes in cas=
e of
unaligned pointer access.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...one1000-align-capsule-update-structs.patch | 78 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-platform-corstone1000-align-capsule-update-structs.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-platform-corstone1000-align-capsule-update-structs.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-platform-co=
rstone1000-align-capsule-update-structs.patch
new file mode 100644
index 00000000..7aeecfa3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-platform-corstone1000-align-capsule-update-structs.patch
@@ -0,0 +1,78 @@
+From 6807d4b30f7d4ed32d3c54dfcaf3ace63eaa4f02 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Thu, 26 Oct 2023 11:46:04 +0100
+Subject: [PATCH] platform: corstone1000: align capsule update structs
+
+U-boot mkefitool creates capsule image without packed and byte-aligned
+structs. This patch aligns the capsule-update structures and avoids
+crashes in case of unaligned pointer access.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending
+---
+ .../fw_update_agent/uefi_capsule_parser.c          | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.c b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.c
+index c706c040ac..9f8d12ad4e 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
+@@ -34,14 +34,14 @@ typedef struct {
+     uint32_t                header_size;
+     uint32_t                flags;
+     uint32_t                capsule_image_size;
+-} efi_capsule_header_t;
++} efi_capsule_header_t __attribute__((packed, aligned(1)));
+
+ typedef struct {
+     uint32_t                version;
+     uint16_t                embedded_driver_count;
+     uint16_t                payload_item_count;
+     uint64_t                item_offset_list[];
+-} efi_firmware_management_capsule_header_t;
++} efi_firmware_management_capsule_header_t __attribute__((packed, align=
ed(1)));
+
+ typedef struct {
+     uint32_t                version;
+@@ -52,14 +52,14 @@ typedef struct {
+     uint32_t                update_vendorcode_size;
+     uint64_t                update_hardware_instance; //introduced in v=
2
+     uint64_t                image_capsule_support; //introduced in v3
+-} efi_firmware_management_capsule_image_header_t;
++} efi_firmware_management_capsule_image_header_t __attribute__((packed,=
 aligned(1)));
+
+ typedef struct {
+     uint32_t                signature;
+     uint32_t                header_size;
+     uint32_t                fw_version;
+     uint32_t                lowest_supported_version;
+-} fmp_payload_header_t;
++} fmp_payload_header_t __attribute__((packed, aligned(1)));
+
+ #define ANYSIZE_ARRAY 0
+
+@@ -68,18 +68,18 @@ typedef struct {
+     uint16_t                wRevision;
+     uint16_t                wCertificateType;
+     uint8_t                 bCertificate[ANYSIZE_ARRAY];
+-} WIN_CERTIFICATE;
++} WIN_CERTIFICATE __attribute__((packed, aligned(1)));
+
+ typedef struct {
+     WIN_CERTIFICATE         hdr;
+     struct efi_guid         cert_type;
+     uint8_t                 cert_data[ANYSIZE_ARRAY];
+-} win_certificate_uefi_guid_t;
++} win_certificate_uefi_guid_t __attribute__((packed, aligned(1)));
+
+ typedef struct {
+     uint64_t                    monotonic_count;
+     win_certificate_uefi_guid_t   auth_info;
+-} efi_firmware_image_authentication_t;
++} efi_firmware_image_authentication_t __attribute__((packed, aligned(1)=
));
+
+
+ enum uefi_capsule_error_t uefi_capsule_retrieve_images(void* capsule_pt=
r,
+--
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 9924f0f0..94bec96c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -35,6 +35,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0005-Platform-corstone1000-add-unique-firmware-GUID.patch \
     file://0006-Platform-Corstone1000-Enable-Signed-Capsule.patch \
     file://0007-platform-corstone1000-increase-ITS-max-asset-size.patch =
\
+    file://0008-platform-corstone1000-align-capsule-update-structs.patch=
 \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.25.1


