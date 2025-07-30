Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFDDC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.33471.1753876430621959233
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C2692681;
	Wed, 30 Jul 2025 04:53:42 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 743C23F66E;
	Wed, 30 Jul 2025 04:53:49 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 01/13] arm-bsp/trusted-firmware-m: corstone1000: Permit FWU calls in RSE-COMMS
Date: Wed, 30 Jul 2025 12:53:15 +0100
Message-Id: <20250730115327.3671160-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6638

Add support to permit FWU calls in RSE-COMMS Trusted-Firmware-M for Corst=
one-1000
This change is required to allow the transmission of PSA FWU related
calls between Cortex A and Cortex M side on Corstone-1000.
For every PSA call from A side, the RSE-COMMS at M side validates, if the
call is allowed or not.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...one1000-Allow-FWU-calls-in-RSE-COMMS.patch | 60 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0024-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0024-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0024-Platform-co=
rstone1000-Allow-FWU-calls-in-RSE-COMMS.patch
new file mode 100644
index 00000000..0c1b53c0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0024=
-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch
@@ -0,0 +1,60 @@
+From 47593ccd1b2a2210c0860d1670005780836f120b Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Mon, 18 Nov 2024 11:40:25 +0000
+Subject: [PATCH] Platform: corstone1000: Permit FWU calls in RSE-COMMS
+
+Allow FWU calls to be dispatched by the RSE-COMMS for Corstone-1000.
+This change is required to allow the transmission of PSA FWU related
+calls between Cortex A and Cortex M side on Corstone-1000.
+For every PSA call from A side, the RSE-COMMS at M side validates, if th=
e
+call is allowed or not.
+
+Upstream-Status: Backport [b1123e3bf99000dd45992c0638c8f9ae7dba2ed8]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../corstone1000/rse_comms_permissions_hal.c  | 22 +++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/rse_comms_permissions_=
hal.c b/platform/ext/target/arm/corstone1000/rse_comms_permissions_hal.c
+index 59724bc94..58ade2026 100644
+--- a/platform/ext/target/arm/corstone1000/rse_comms_permissions_hal.c
++++ b/platform/ext/target/arm/corstone1000/rse_comms_permissions_hal.c
+@@ -33,6 +33,9 @@
+ #ifdef TFM_PARTITION_INTERNAL_TRUSTED_STORAGE
+ #include "tfm_its_defs.h"
+ #endif /* TFM_PARTITION_INTERNAL_TRUSTED_STORAGE */
++#ifdef TFM_PARTITION_FIRMWARE_UPDATE
++#include "tfm_fwu_defs.h"
++#endif /* TFM_PARTITION_FIRMWARE_UPDATE */
+=20
+ #define INVALID_REGION_COUNTER_MAX  128
+ #define INVALID_SERVICE_COUNTER_MAX 64
+@@ -165,6 +168,25 @@ enum tfm_plat_err_t comms_permissions_service_check=
(psa_handle_t handle,
+     case TFM_DPE_SERVICE_HANDLE:
+         return TFM_PLAT_ERR_SUCCESS;
+ #endif /* TFM_PARTITION_DPE */
++
++#ifdef TFM_PARTITION_FIRMWARE_UPDATE
++    case TFM_FIRMWARE_UPDATE_SERVICE_HANDLE:
++        switch(type) {
++        case TFM_FWU_START:
++        case TFM_FWU_WRITE:
++        case TFM_FWU_FINISH:
++        case TFM_FWU_CANCEL:
++        case TFM_FWU_INSTALL:
++        case TFM_FWU_CLEAN:
++        case TFM_FWU_REJECT:
++        case TFM_FWU_REQUEST_REBOOT:
++        case TFM_FWU_ACCEPT:
++        case TFM_FWU_QUERY:
++            return TFM_PLAT_ERR_SUCCESS;
++        default:
++            goto out_err;
++	}
++#endif /* TFM_PARTITION_FIRMWARE_UPDATE */
+     default:
+         goto out_err;
+     }
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index e3a07b72..f49a4271 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -42,6 +42,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0021-platform-corstone1000-add-unique-guid-for-mps3.patch \
     file://0022-CC312-alignment-of-cc312-differences.patch \
     file://0023-Platform-CS1000-Remove-duplicate-configuration-parameter=
s.patch \
+    file://0024-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch=
 \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"

