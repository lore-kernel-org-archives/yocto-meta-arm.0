Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E66C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:59:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1305.1668704387781352712
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Nov 2022 08:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 681EAD6E
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Nov 2022 08:59:53 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F091A3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Nov 2022 08:59:46 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-services: limit the ts compatible machines
Date: Thu, 17 Nov 2022 11:59:41 -0500
Message-Id: <20221117165941.26145-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221117165941.26145-1-jon.mason@arm.com>
References: <20221117165941.26145-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Nov 2022 16:59:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4137

World builds are trying to build trusted services, which has a
dependency on meta-python.  To avoid having to add a layer dependency
for meta-arm on meta-python, limit the compatible machines to the ones
using it (which already have a meta-python dependency).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../packagegroups/packagegroup-ts-tests.bbappend             | 1 +
 .../recipes-security/trusted-services/libts_%.bbappend       | 2 +-
 .../{ts-corstone1000.inc => ts-arm-platforms.inc}            | 4 +++-
 .../recipes-security/trusted-services/ts-demo_%.bbappend     | 4 ++++
 .../recipes-security/trusted-services/ts-newlib_%.bbappend   | 5 +++--
 .../recipes-security/trusted-services/ts-psa-api-test.inc    | 2 +-
 .../trusted-services/ts-service-test_%.bbappend              | 4 ++++
 .../trusted-services/ts-sp-se-proxy_%.bbappend               | 2 +-
 .../trusted-services/ts-sp-smm-gateway_%.bbappend            | 2 +-
 .../trusted-services/ts-uefi-test_%.bbappend                 | 4 ++++
 .../recipes-security/packagegroups/packagegroup-ts-tests.bb  | 2 ++
 .../recipes-security/trusted-services/trusted-services.inc   | 2 ++
 12 files changed, 27 insertions(+), 7 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.bbappend
 rename meta-arm-bsp/recipes-security/trusted-services/{ts-corstone1000.inc => ts-arm-platforms.inc} (94%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-demo_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-service-test_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-uefi-test_%.bbappend

diff --git a/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.bbappend b/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.bbappend
new file mode 100644
index 00000000..dddc59af
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.bbappend
@@ -0,0 +1 @@
+COMPATIBLE_MACHINE:corstone1000 = "corstone1000"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
index a885d387..422bb708 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
@@ -1,5 +1,5 @@
 MACHINE_TS_REQUIRE ?= ""
-MACHINE_TS_REQUIRE:corstone1000 = "ts-corstone1000.inc"
+MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
 
 require ${MACHINE_TS_REQUIRE}
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
similarity index 94%
rename from meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
rename to meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
index e97fb593..5533e74e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -1,4 +1,6 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000:"
+FILESEXTRAPATHS:prepend:corstone1000 := "${THISDIR}/corstone1000:"
+
+COMPATIBLE_MACHINE:corstone1000 = "corstone1000"
 
 SRC_URI:append:corstone1000  = " \
     file://0001-Add-openamp-to-SE-proxy-deployment.patch;patchdir=../trusted-services \
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-demo_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-demo_%.bbappend
new file mode 100644
index 00000000..8e17d377
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-demo_%.bbappend
@@ -0,0 +1,4 @@
+MACHINE_TS_REQUIRE ?= ""
+MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
+
+require ${MACHINE_TS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
index 845f8834..b500fd65 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
@@ -1,6 +1,7 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000/${PN}:"
+FILESEXTRAPATHS:prepend:corstone1000 := "${THISDIR}/corstone1000/${PN}:"
+
+COMPATIBLE_MACHINE:corstone1000 = "corstone1000"
 
 SRC_URI:append:corstone1000 = " \
   file://0001-newlib-memcpy-remove-optimized-version.patch;patchdir=../newlib \
 "
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
index 50ff960d..5936a25e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000/psa-apitest:"
 
-include ts-corstone1000.inc
+include ts-arm-platforms.inc
 
 SRC_URI:append:corstone1000  = " \
     file://0001-corstone1000-port-crypto-config.patch;patchdir=../psatest \
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-service-test_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-service-test_%.bbappend
new file mode 100644
index 00000000..8e17d377
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-service-test_%.bbappend
@@ -0,0 +1,4 @@
+MACHINE_TS_REQUIRE ?= ""
+MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
+
+require ${MACHINE_TS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend
index f39d2395..8d93cca5 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend
@@ -1,5 +1,5 @@
 MACHINE_TS_REQUIRE ?= ""
-MACHINE_TS_REQUIRE:corstone1000 = "ts-corstone1000.inc"
+MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
 
 require ${MACHINE_TS_REQUIRE}
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
index f39d2395..8d93cca5 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
@@ -1,5 +1,5 @@
 MACHINE_TS_REQUIRE ?= ""
-MACHINE_TS_REQUIRE:corstone1000 = "ts-corstone1000.inc"
+MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
 
 require ${MACHINE_TS_REQUIRE}
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-uefi-test_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-uefi-test_%.bbappend
new file mode 100644
index 00000000..8e17d377
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-uefi-test_%.bbappend
@@ -0,0 +1,4 @@
+MACHINE_TS_REQUIRE ?= ""
+MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
+
+require ${MACHINE_TS_REQUIRE}
diff --git a/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb b/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb
index b9c6507c..25ee2f5a 100644
--- a/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb
+++ b/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb
@@ -5,6 +5,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 COMPATIBLE_HOST = "aarch64.*-linux"
+COMPATIBLE_MACHINE ?= "invalid"
+COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64-secureboot"
 
 PACKAGES = "${PN} ${PN}-psa"
 
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index 59f461d3..c64a1d41 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -6,6 +6,8 @@ LICENSE = "Apache-2.0 & BSD-3-Clause & Zlib"
 inherit python3native cmake
 
 COMPATIBLE_HOST = "aarch64.*-linux"
+COMPATIBLE_MACHINE ?= "invalid"
+COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64-secureboot"
 
 require trusted-services-src.inc
 
-- 
2.17.1


