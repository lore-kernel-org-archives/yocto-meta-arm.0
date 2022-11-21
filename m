Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FC3C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 14:49:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40323.1669042145677370110
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 06:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B697F1FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 06:49:11 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 265C93F73B
	for <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 06:49:05 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/trusted-services: add n1sdp support
Date: Mon, 21 Nov 2022 09:49:00 -0500
Message-Id: <20221121144900.3079-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 14:49:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4142

Add support for n1sdp to trusted-services bbappends and rework some
things to make it easier to add more in the future.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                           | 1 +
 .../packagegroups/packagegroup-ts-tests.bbappend         | 1 +
 .../recipes-security/trusted-services/libts_%.bbappend   | 9 ++-------
 .../trusted-services/ts-arm-platforms.inc                | 3 ++-
 .../recipes-security/trusted-services/ts-demo_%.bbappend | 5 +----
 .../trusted-services/ts-newlib_%.bbappend                | 3 ++-
 .../trusted-services/ts-psa-api-test.inc                 | 2 +-
 .../trusted-services/ts-service-test_%.bbappend          | 5 +----
 .../trusted-services/ts-sp-attestation_%.bbappend        | 1 +
 .../trusted-services/ts-sp-crypto_%.bbappend             | 1 +
 .../trusted-services/ts-sp-its_%.bbappend                | 1 +
 .../trusted-services/ts-sp-se-proxy_%.bbappend           | 6 +-----
 .../trusted-services/ts-sp-smm-gateway_%.bbappend        | 6 +-----
 .../trusted-services/ts-sp-storage_%.bbappend            | 1 +
 .../trusted-services/ts-uefi-test_%.bbappend             | 5 +----
 15 files changed, 18 insertions(+), 32 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-attestation_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-crypto_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-its_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-sp-storage_%.bbappend

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7d050a55..40cffe56 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -137,6 +137,7 @@ n1sdp:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, armgcc]
+        TS: [none, trusted-services]
 
 qemu-generic-arm64:
   extends: .build
diff --git a/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.bbappend b/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.bbappend
index dddc59af..20612cb1 100644
--- a/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.bbappend
+++ b/meta-arm-bsp/recipes-security/packagegroups/packagegroup-ts-tests.bbappend
@@ -1 +1,2 @@
 COMPATIBLE_MACHINE:corstone1000 = "corstone1000"
+COMPATIBLE_MACHINE:n1sdp = "n1sdp"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
index 422bb708..99c03f69 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/libts_%.bbappend
@@ -1,10 +1,5 @@
-MACHINE_TS_REQUIRE ?= ""
-MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
-
-require ${MACHINE_TS_REQUIRE}
-
+require ts-arm-platforms.inc
 
 EXTRA_OECMAKE:append:corstone1000 = "-DMM_COMM_BUFFER_ADDRESS=0x02000000 \
-                                    -DMM_COMM_BUFFER_PAGE_COUNT=1 \
+                                     -DMM_COMM_BUFFER_PAGE_COUNT=1 \
                                     "
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
index 5533e74e..2d90fe57 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -1,7 +1,6 @@
 FILESEXTRAPATHS:prepend:corstone1000 := "${THISDIR}/corstone1000:"
 
 COMPATIBLE_MACHINE:corstone1000 = "corstone1000"
-
 SRC_URI:append:corstone1000  = " \
     file://0001-Add-openamp-to-SE-proxy-deployment.patch;patchdir=../trusted-services \
     file://0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch;patchdir=../trusted-services \
@@ -26,3 +25,5 @@ SRC_URI:append:corstone1000  = " \
     file://0021-smm_gateway-add-checks-for-null-attributes.patch;patchdir=../trusted-services \
     file://0022-GetNextVariableName-Fix.patch;patchdir=../trusted-services \
     "
+
+COMPATIBLE_MACHINE:n1sdp = "n1sdp"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-demo_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-demo_%.bbappend
index 8e17d377..5c9ef210 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-demo_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-demo_%.bbappend
@@ -1,4 +1 @@
-MACHINE_TS_REQUIRE ?= ""
-MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
-
-require ${MACHINE_TS_REQUIRE}
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
index b500fd65..7417d9b0 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
@@ -1,7 +1,8 @@
 FILESEXTRAPATHS:prepend:corstone1000 := "${THISDIR}/corstone1000/${PN}:"
 
 COMPATIBLE_MACHINE:corstone1000 = "corstone1000"
-
 SRC_URI:append:corstone1000 = " \
   file://0001-newlib-memcpy-remove-optimized-version.patch;patchdir=../newlib \
 "
+
+COMPATIBLE_MACHINE:n1sdp = "n1sdp"
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
index 5936a25e..a1f43d41 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000/psa-apitest:"
+FILESEXTRAPATHS:prepend:corstone1000 := "${THISDIR}/corstone1000/psa-apitest:"
 
 include ts-arm-platforms.inc
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-service-test_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-service-test_%.bbappend
index 8e17d377..5c9ef210 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-service-test_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-service-test_%.bbappend
@@ -1,4 +1 @@
-MACHINE_TS_REQUIRE ?= ""
-MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
-
-require ${MACHINE_TS_REQUIRE}
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-attestation_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-attestation_%.bbappend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-attestation_%.bbappend
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-crypto_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-crypto_%.bbappend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-crypto_%.bbappend
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-its_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-its_%.bbappend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-its_%.bbappend
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend
index 8d93cca5..eba15532 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend
@@ -1,9 +1,5 @@
-MACHINE_TS_REQUIRE ?= ""
-MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
-
-require ${MACHINE_TS_REQUIRE}
+require ts-arm-platforms.inc
 
 EXTRA_OECMAKE:append:corstone1000 = " -DMM_COMM_BUFFER_ADDRESS="0x00000000 0x02000000" \
     -DMM_COMM_BUFFER_PAGE_COUNT="1" \
     "
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
index 8d93cca5..eba15532 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
@@ -1,9 +1,5 @@
-MACHINE_TS_REQUIRE ?= ""
-MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
-
-require ${MACHINE_TS_REQUIRE}
+require ts-arm-platforms.inc
 
 EXTRA_OECMAKE:append:corstone1000 = " -DMM_COMM_BUFFER_ADDRESS="0x00000000 0x02000000" \
     -DMM_COMM_BUFFER_PAGE_COUNT="1" \
     "
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-storage_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-storage_%.bbappend
new file mode 100644
index 00000000..5c9ef210
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-storage_%.bbappend
@@ -0,0 +1 @@
+require ts-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-uefi-test_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-uefi-test_%.bbappend
index 8e17d377..5c9ef210 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-uefi-test_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-uefi-test_%.bbappend
@@ -1,4 +1 @@
-MACHINE_TS_REQUIRE ?= ""
-MACHINE_TS_REQUIRE:corstone1000 = "ts-arm-platforms.inc"
-
-require ${MACHINE_TS_REQUIRE}
+require ts-arm-platforms.inc
-- 
2.17.1


