Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487F6CAC59D
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 20:09:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.523.1726603736719153386
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Sep 2024 13:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66E7B339;
	Tue, 17 Sep 2024 13:09:25 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.19.166])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE6333F64C;
	Tue, 17 Sep 2024 13:08:54 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-m: corstone1000: Fix MPU configuration
Date: Tue, 17 Sep 2024 22:08:49 +0200
Message-Id: <20240917200849.827357-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Sep 2024 20:09:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6078

From: Bence Balogh <bence.balogh@arm.com>

The Application Root of Trust and the PSA Root of Trust was not
isolated in TF-M Isolation Level 2 beacuse of the misconfiguration of
the MPU. The added patch fixes this issue.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...0-Fix-isolation-L2-memory-protection.patch | 88 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-Platform-corstone1000-Fix-isolation-L2-memory-protection.p=
atch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0018-Platform-corstone1000-Fix-isolation-L2-memory-protection.patch b/=
meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018-Platf=
orm-corstone1000-Fix-isolation-L2-memory-protection.patch
new file mode 100644
index 00000000..267254c4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018=
-Platform-corstone1000-Fix-isolation-L2-memory-protection.patch
@@ -0,0 +1,88 @@
+From 4d3ebb03b89b122af490824ca73287954a35bd07 Mon Sep 17 00:00:00 2001
+From: Jamie Fox <jamie.fox@arm.com>
+Date: Thu, 22 Aug 2024 16:54:45 +0100
+Subject: [PATCH] Platform: corstone1000: Fix isolation L2 memory protect=
ion
+
+The whole of the SRAM was configured unprivileged on this platform, so
+the memory protection required for isolation level 2 was not present.
+
+This patch changes the S_DATA_START to S_DATA_LIMIT MPU region to be
+configured for privileged access only. It also reorders the MPU regions
+so that the App RoT sub-region overlapping S_DATA has a higher region
+number and so takes priority in the operation of the Armv6-M MPU.
+
+Signed-off-by: Jamie Fox <jamie.fox@arm.com>
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/30951]
+---
+ .../arm/corstone1000/tfm_hal_isolation.c      | 43 +++++++++----------
+ 1 file changed, 21 insertions(+), 22 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c b/=
platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
+index 39b19c535..498f14ed2 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2023, Arm Limited. All rights reserved.
++ * Copyright (c) 2020-2024, Arm Limited. All rights reserved.
+  * Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon
+  * company) or an affiliate of Cypress Semiconductor Corporation. All r=
ights
+  * reserved.
+@@ -99,6 +99,26 @@ enum tfm_hal_status_t tfm_hal_set_up_static_boundarie=
s(
+         return ret;
+     }
+=20
++    /* Set the RAM attributes. It is needed because the first region ov=
erlaps the whole
++     * SRAM and it has to be overridden.
++     * The RAM_MPU_REGION_BLOCK_1_SIZE and RAM_MPU_REGION_BLOCK_2_SIZE =
are calculated manually
++     * and added to the platform_region_defs compile definitions.
++     */
++    base =3D S_DATA_START;
++    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
++    ret =3D configure_mpu(rnr++, base, limit,
++                            XN_EXEC_NOT_OK, AP_RW_PRIV_ONLY);
++    if (ret !=3D TFM_HAL_SUCCESS) {
++        return ret;
++    }
++
++    base =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
++    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE + RAM_MPU_REGI=
ON_BLOCK_2_SIZE;
++    ret =3D configure_mpu(rnr++, base, limit,
++                            XN_EXEC_NOT_OK, AP_RW_PRIV_ONLY);
++    if (ret !=3D TFM_HAL_SUCCESS) {
++        return ret;
++    }
+=20
+     /* RW, ZI and stack as one region */
+     base =3D (uint32_t)&REGION_NAME(Image$$, TFM_APP_RW_STACK_START, $$=
Base);
+@@ -133,27 +153,6 @@ enum tfm_hal_status_t tfm_hal_set_up_static_boundar=
ies(
+=20
+ #endif
+=20
+-    /* Set the RAM attributes. It is needed because the first region ov=
erlaps the whole
+-     * SRAM and it has to be overridden.
+-     * The RAM_MPU_REGION_BLOCK_1_SIZE and RAM_MPU_REGION_BLOCK_2_SIZE =
are calculated manually
+-     * and added to the platform_region_defs compile definitions.
+-     */
+-    base =3D S_DATA_START;
+-    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
+-    ret =3D configure_mpu(rnr++, base, limit,
+-                            XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
+-    if (ret !=3D TFM_HAL_SUCCESS) {
+-        return ret;
+-    }
+-
+-    base =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
+-    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE + RAM_MPU_REGI=
ON_BLOCK_2_SIZE;
+-    ret =3D configure_mpu(rnr++, base, limit,
+-                            XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
+-    if (ret !=3D TFM_HAL_SUCCESS) {
+-        return ret;
+-    }
+-
+     arm_mpu_enable();
+=20
+ #endif /* CONFIG_TFM_ENABLE_MEMORY_PROTECT */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 4ba6659d..5c8a71cc 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -37,6 +37,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0015-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch \
     file://0016-Platform-CS1000-Add-crypto-configs-for-ADAC.patch \
     file://0017-Platform-CS1000-Fix-platform-name-in-logs.patch \
+    file://0018-Platform-corstone1000-Fix-isolation-L2-memory-protection=
.patch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"
--=20
2.25.1


