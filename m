Return-Path: <rupinderjit.singh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5471BC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 10:26:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9081.1651746360538832828
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 May 2022 03:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: rupinderjit.singh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B483106F;
	Thu,  5 May 2022 03:25:59 -0700 (PDT)
Received: from e123349.cambridge.arm.com (e123349.cambridge.arm.com
 [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 117B23FA27;
	Thu,  5 May 2022 03:25:58 -0700 (PDT)
From: Rupinderjit Singh <rupinderjit.singh@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Rupinderjit Singh <rupinderjit.singh@arm.com>
Subject: [PATCH] arm-bsp/scp-firmware: upgrade TC to version 2.10
Date: Thu,  5 May 2022 11:25:33 +0100
Message-Id: <20220505102533.75226-1-rupinderjit.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 May 2022 10:26:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3367

* Removed 0001-tc0-fix-sensor-data-api-call.patch as it has now been upst=
reamed.
* updated 0003-tc0-rename-platform-variant-to-platform-feature-set.patch =
to fix merge error.

Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
Change-Id: I71eafbea9e1f0b9f01a504fe0c8b81e43c24d613
---
 .../0001-tc0-fix-sensor-data-api-call.patch   | 65 -------------------
 ...form-variant-to-platform-feature-set.patch |  3 +-
 .../scp-firmware/scp-firmware-tc.inc          |  6 --
 .../scp-firmware/scp-firmware_2.10.%.bbappend |  7 ++
 4 files changed, 9 insertions(+), 72 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0001-t=
c0-fix-sensor-data-api-call.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.=
10.%.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0001-tc0-fix-=
sensor-data-api-call.patch b/meta-arm-bsp/recipes-bsp/scp-firmware/files/=
tc/0001-tc0-fix-sensor-data-api-call.patch
deleted file mode 100644
index 227d911..0000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0001-tc0-fix-sensor-=
data-api-call.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 33a2173e13453ecc4f766f0e69302524401df1b0 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Mon, 14 Feb 2022 08:28:46 +0000
-Subject: [PATCH 1/4] tc0: fix sensor data api call
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Change-Id: I827abeeac8317e4dd466cc0c4d493cdc90e7e39d
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- module/thermal_mgmt/src/mod_thermal_mgmt.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/module/thermal_mgmt/src/mod_thermal_mgmt.c b/module/thermal=
_mgmt/src/mod_thermal_mgmt.c
-index dbd45c74..6e2ff5ba 100644
---- a/module/thermal_mgmt/src/mod_thermal_mgmt.c
-+++ b/module/thermal_mgmt/src/mod_thermal_mgmt.c
-@@ -20,7 +20,7 @@
- #include <fwk_mm.h>
- #include <fwk_module.h>
- #include <fwk_status.h>
--#include <fwk_thread.h>
-+#include <fwk_core.h>
-=20
- #include <stdint.h>
- #include <stdlib.h>
-@@ -372,7 +372,7 @@ static int read_temperature(void)
-         .id =3D mod_thermal_event_id_read_temp,
-     };
-=20
--    return fwk_thread_put_event(&event);
-+    return fwk_put_event(&event);
- #else
-     int status;
-     uint64_t value;
-@@ -574,22 +574,22 @@ static int thermal_mgmt_process_event(
-     struct fwk_event *resp_event)
- {
-     struct mod_sensor_event_params *params;
--    uint64_t value;
-+    struct mod_sensor_data ms_data;
-     int status;
-=20
-     if (fwk_id_is_equal(event->id, mod_thermal_event_id_read_temp)) {
-         /* Temperature-reading event */
-         status =3D
--            mod_ctx.sensor_api->get_value(mod_ctx.config->sensor_id, &v=
alue);
-+            mod_ctx.sensor_api->get_data(mod_ctx.config->sensor_id, &ms=
_data);
-         if (status =3D=3D FWK_SUCCESS) {
--            mod_ctx.cur_temp =3D (uint32_t)value;
-+            mod_ctx.cur_temp =3D (uint32_t)ms_data.value;
-         }
-     } else if (fwk_id_is_equal(event->id, mod_sensor_event_id_read_requ=
est)) {
-         /* Response event from Sensor HAL */
-         params =3D (struct mod_sensor_event_params *)event->params;
-=20
--        if (params->status =3D=3D FWK_SUCCESS) {
--            mod_ctx.cur_temp =3D (uint32_t)params->value;
-+        if (params->sensor_data->status =3D=3D FWK_SUCCESS) {
-+            mod_ctx.cur_temp =3D (uint32_t)params->sensor_data->value;
-             status =3D FWK_SUCCESS;
-         } else {
-             status =3D FWK_E_DEVICE;
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0003-tc0-rena=
me-platform-variant-to-platform-feature-set.patch b/meta-arm-bsp/recipes-=
bsp/scp-firmware/files/tc/0003-tc0-rename-platform-variant-to-platform-fe=
ature-set.patch
index 5e99525..87dfbfa 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0003-tc0-rename-plat=
form-variant-to-platform-feature-set.patch
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0003-tc0-rename-plat=
form-variant-to-platform-feature-set.patch
@@ -11,6 +11,7 @@ PLATFORM_FEATURE_SET
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Change-Id: I93c0bc3e11fe18192bb8246df851345bdc473974
 Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
 ---
  product/tc0/doc/{variants.md =3D> features.md} | 28 +++++++++----------=
-
  product/tc0/scp_ramfw/CMakeLists.txt         | 26 +++---------------
@@ -56,7 +57,7 @@ index fbf616db..3ef520e2 100644
  make -f Makefile.cmake \
      PRODUCT=3Dtc0 \
      MODE=3D<debug,release> \
--    EXTRA_CONFIG_ARGS+=3D-DSCP_PLATFORM_VARIANT=3D<0,1>
+-    PLATFORM_VARIANT=3D<0,1>
 +    EXTRA_CONFIG_ARGS+=3D-DSCP_PLATFORM_FEATURE_SET=3D1
 =20
  ```
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc b/=
meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
index 08bdfb2..a6a005c 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
@@ -1,13 +1,7 @@
 # TC specific SCP configuration
=20
-# Intermediate SHA with 2.9 baseline version
-# This has support for SCP features MPMM/POWER/PERFORMANCE for TC0
-SRCREV =3D "027b567fde5e3767fb1678bda28cf59fa7aac06d"
-PV =3D "2.9.0+git${SRCPV}"
-
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/tc:"
 SRC_URI:append:tc =3D " \
-    file://0001-tc0-fix-sensor-data-api-call.patch \
     file://0002-tc0-fix-mpmm-config.patch \
     file://0003-tc0-rename-platform-variant-to-platform-feature-set.patc=
h \
     file://0004-tc0-support-platform-feature-set-options-in-firmware.pat=
ch \
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.10.%.bb=
append b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.10.%.bbappe=
nd
new file mode 100644
index 0000000..b4f5487
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.10.%.bbappend
@@ -0,0 +1,7 @@
+# Include machine specific SCP configurations
+
+MACHINE_SCP_REQUIRE ?=3D ""
+
+MACHINE_SCP_REQUIRE:tc =3D "scp-firmware-tc.inc"
+
+require ${MACHINE_SCP_REQUIRE}
--=20
2.25.1


