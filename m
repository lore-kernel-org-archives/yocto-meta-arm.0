Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6601DE784B2
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 10:43:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.78657.1696243414498905140
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 03:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A0E2C15;
	Mon,  2 Oct 2023 03:44:12 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3AECA3F762;
	Mon,  2 Oct 2023 03:43:33 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 5/5] arm-bsp/trusted-firmware-m: Enable authenticated capsule update
Date: Mon,  2 Oct 2023 11:43:23 +0100
Message-Id: <20231002104323.1967358-6-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231002104323.1967358-1-emekcan.aras@arm.com>
References: <20231002104323.1967358-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Oct 2023 10:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5101

From: Emekcan Aras <emekcan.aras@arm.com>

Enables authenticated capsule update and makes necessary changes to
align with new capsule generation tool (mkeficapsule in u-boot).

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...m-Corstone1000-Enable-Signed-Capsule.patch | 102 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-Platform-Corstone1000-Enable-Signed-Capsule.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-Platform-Corstone1000-Enable-Signed-Capsule.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-Corstone1=
000-Enable-Signed-Capsule.patch
new file mode 100644
index 00000000..49c336de
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-Enable-Signed-Capsule.patch
@@ -0,0 +1,102 @@
+From fa0988fd876400dc1bb451fffc4b167265b40d25 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Thu, 14 Sep 2023 12:14:28 +0100
+Subject: [PATCH] Platform: Corstone1000: Enable Signed Capsule
+
+Enables signed capsule update and adjusts the necessary structs (fmp_pay=
load_header
+, image_auth, etc.) to comply with the new capsule generation tool (mkef=
icapsule).
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../fw_update_agent/uefi_capsule_parser.c     | 25 +++++++++++--------
+ .../fw_update_agent/uefi_capsule_parser.h     |  2 ++
+ 2 files changed, 17 insertions(+), 10 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.c b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.c
+index b72ff1eb91..c706c040ac 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
+@@ -102,11 +102,9 @@ enum uefi_capsule_error_t uefi_capsule_retrieve_ima=
ges(void* capsule_ptr,
+     }
+=20
+     capsule_header =3D (efi_capsule_header_t*)ptr;
+-    ptr +=3D sizeof(efi_capsule_header_t) + sizeof(uint32_t);
++    ptr +=3D sizeof(efi_capsule_header_t);
+     fmp_capsule_header =3D (efi_firmware_management_capsule_header_t*)p=
tr;
+=20
+-    fmp_payload_header =3D fmp_capsule_header + sizeof(*fmp_capsule_hea=
der);
+-
+     total_size =3D capsule_header->capsule_image_size;
+     image_count =3D fmp_capsule_header->payload_item_count;
+     images_info->nr_image =3D image_count;
+@@ -119,22 +117,20 @@ enum uefi_capsule_error_t uefi_capsule_retrieve_im=
ages(void* capsule_ptr,
+     }
+=20
+     for (int i =3D 0; i < image_count; i++) {
+-
+         image_header =3D (efi_firmware_management_capsule_image_header_=
t*)(ptr +
+                                 fmp_capsule_header->item_offset_list[i]=
);
+=20
+         images_info->size[i] =3D image_header->update_image_size;
+-        images_info->version[i] =3D fmp_payload_header->fw_version;
+-        FWU_LOG_MSG("%s: image %i version =3D %u\n\r", __func__, i,
+-                                images_info->version[i]);
++
+ #ifdef AUTHENTICATED_CAPSULE
+         image_auth =3D (efi_firmware_image_authentication_t*)(
+                         (char*)image_header +
+                         sizeof (efi_firmware_management_capsule_image_h=
eader_t)
+                      );
+         auth_size =3D sizeof(uint64_t) /* monotonic_count */  +
+-                    image_auth->auth_info.hdr.dwLength /* WIN_CERTIFICA=
TE + cert_data */ +
+-                    sizeof(struct efi_guid) /* cert_type */;
++                    image_auth->auth_info.hdr.dwLength/* WIN_CERTIFICAT=
E + cert_data + cert_type */;
++
++        fmp_payload_header =3D (fmp_payload_header_t*)((char*)image_aut=
h + auth_size);
+=20
+         FWU_LOG_MSG("%s: auth size =3D %u\n\r", __func__, auth_size);
+=20
+@@ -143,16 +139,25 @@ enum uefi_capsule_error_t uefi_capsule_retrieve_im=
ages(void* capsule_ptr,
+         images_info->image[i] =3D (
+                 (char*)image_header +
+                 sizeof(efi_firmware_management_capsule_image_header_t) =
+
+-                auth_size);
++                auth_size +
++                sizeof(*fmp_payload_header));
+ #else
+         images_info->image[i] =3D (
+                 (char*)image_header +
+                 sizeof(efi_firmware_management_capsule_image_header_t) =
+
+                 sizeof(*fmp_payload_header));
++
++        fmp_payload_header =3D (fmp_payload_header_t*)((char*)image_hea=
der +
++                sizeof(efi_firmware_management_capsule_image_header_t))=
;
++
+ #endif
+         memcpy(&images_info->guid[i], &(image_header->update_image_type=
_id),
+                                                         sizeof(struct e=
fi_guid));
+=20
++        images_info->version[i] =3D fmp_payload_header->fw_version;
++        FWU_LOG_MSG("%s: image %i version =3D %d\n\r", __func__, i,
++                                images_info->version[i]);
++
+         FWU_LOG_MSG("%s: image %d at %p, size=3D%u\n\r", __func__, i,
+                         images_info->image[i], images_info->size[i]);
+=20
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.h b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.h
+index a890a709e9..a31cd8a3a0 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.h
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.h
+@@ -12,6 +12,8 @@
+ #include "fip_parser/external/uuid.h"
+ #include "flash_layout.h"
+=20
++#define AUTHENTICATED_CAPSULE 1
++
+ enum uefi_capsule_error_t {
+     UEFI_CAPSULE_PARSER_SUCCESS =3D 0,
+     UEFI_CAPSULE_PARSER_ERROR =3D (-1)
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index a259390a..601d1652 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -33,6 +33,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0003-Platform-Corstone1000-Calculate-the-new-CRC32-value-.pat=
ch \
     file://0004-arm-trusted-firmware-m-disable-fatal-warnings.patch \
     file://0005-Platform-corstone1000-add-unique-firmware-GUID.patch \
+    file://0006-Platform-Corstone1000-Enable-Signed-Capsule.patch \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.25.1


