Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DBEC64ED6
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 10:56:59 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.7427.1676545008587625880
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 02:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSbwU-009BTT-HD; Thu, 16 Feb 2023 12:56:46 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSbwU-000cZS-7t; Thu, 16 Feb 2023 12:56:46 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/4] meta-arm: switch from :append to +=
Date: Thu, 16 Feb 2023 12:56:39 +0200
Message-Id: <20230216105640.147967-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216105640.147967-1-mikko.rapeli@linaro.org>
References: <20230216105640.147967-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230216105640.147967-4-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 10:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4401

:append is hard to override in product specific layers so use +=
when possible.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../trusted-firmware-a/trusted-firmware-a.inc |  8 +--
 .../recipes-kernel/linux/arm-ffa-5.15.inc     |  4 +-
 .../linux/arm-ffa-transport.inc               |  4 +-
 .../optee-ftpm/optee-os_%.bbappend            | 11 ++--
 .../recipes-security/optee/optee-os-3_19.inc  |  7 +--
 .../recipes-security/optee/optee-os-ts.inc    | 58 +++++++++----------
 meta-arm/recipes-security/optee/optee-os.inc  |  7 +--
 .../recipes-security/optee/optee-os_3.18.0.bb |  4 +-
 .../recipes-security/optee/optee-os_3.19.0.bb |  6 +-
 .../optee/optee-test_3.18.0.bb                |  4 +-
 .../trusted-services/trusted-services.inc     |  2 +-
 11 files changed, 55 insertions(+), 60 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index b0533a1e..14c9ad69 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -51,12 +51,12 @@ SRC_URI_MBEDTLS ??= ""
 # This should be set to MBEDTLS LIC FILES checksum
 LIC_FILES_CHKSUM_MBEDTLS ??= ""
 # add MBEDTLS to our sources if activated
-SRC_URI:append = " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBEDTLS}', '', d)}"
+SRC_URI += "${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBEDTLS}', '', d)}"
 # Update license variables
-LICENSE:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-2.0', '', d)}"
-LIC_FILES_CHKSUM:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
+LICENSE += "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-2.0', '', d)}"
+LIC_FILES_CHKSUM += "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
 # add mbed TLS to version
-SRCREV_FORMAT:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '', d)}"
+SRCREV_FORMAT += "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '', d)}"
 
 # U-boot support (set TFA_UBOOT to 1 to activate)
 # When U-Boot support is activated BL33 is activated with u-boot.bin file
diff --git a/meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc b/meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc
index bc66efbf..a46ba1ac 100644
--- a/meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc
+++ b/meta-arm/recipes-kernel/linux/arm-ffa-5.15.inc
@@ -1,5 +1,5 @@
 # Include a backport kernel patch for TEE driver
 
-SRC_URI:append = " \
+SRC_URI += " \
     file://Add-sec_world_id-to-struct-tee_shm.patch \
-    "
+"
diff --git a/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc b/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
index b3d377b4..27189ab1 100644
--- a/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
+++ b/meta-arm/recipes-kernel/linux/arm-ffa-transport.inc
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS:prepend := "${ARMFILESPATHS}"
 
 # Enable ARM-FFA transport
-SRC_URI:append = " \
+SRC_URI += " \
     file://arm-ffa-transport.cfg \
-    "
+"
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
index 40423615..8a17854c 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -1,13 +1,10 @@
 FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
 
-DEPENDS:append = "\
-                  ${@bb.utils.contains('MACHINE_FEATURES', \
-                 'optee-ftpm', \
-                 'optee-ftpm', \
-                 '' , \
-                 d)}"
+DEPENDS += "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', 'optee-ftpm', '' , d)} \
+"
 
-EXTRA_OEMAKE:append = "\
+EXTRA_OEMAKE += "\
                        ${@bb.utils.contains('MACHINE_FEATURES', \
                       'optee-ftpm', \
                       'CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', \
diff --git a/meta-arm/recipes-security/optee/optee-os-3_19.inc b/meta-arm/recipes-security/optee/optee-os-3_19.inc
index 61475dcf..00aa326d 100644
--- a/meta-arm/recipes-security/optee/optee-os-3_19.inc
+++ b/meta-arm/recipes-security/optee/optee-os-3_19.inc
@@ -16,13 +16,12 @@ DEPENDS = "python3-pyelftools-native python3-cryptography-native"
 
 DEPENDS:append:toolchain-clang = " compiler-rt"
 
-SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
-
-SRC_URI:append = " \
+SRC_URI = "\
+    git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0007-allow-setting-sysroot-for-clang.patch \
     file://0008-no-warn-rwx-segments.patch \
-   "
+"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/recipes-security/optee/optee-os-ts.inc
index 73b8c14f..60d9459c 100644
--- a/meta-arm/recipes-security/optee/optee-os-ts.inc
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -10,45 +10,45 @@ TS_ENV = "opteesp"
 TS_BIN = "${RECIPE_SYSROOT}/usr/${TS_ENV}/bin"
 
 # ITS SP
-DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', \
-                                        ' ts-sp-its', '' , d)}"
-SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', \
-                                        ' ${TS_BIN}/${ITS_UUID}.stripped.elf', '', d)}"
+DEPENDS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', \
+                                 ' ts-sp-its', '' , d)}"
+SP_PATHS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', \
+                                  ' ${TS_BIN}/${ITS_UUID}.stripped.elf', '', d)}"
 
 # Storage SP
-DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storage', \
-                                        ' ts-sp-storage', '' , d)}"
-SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storage', \
-                                        ' ${TS_BIN}/${STORAGE_UUID}.stripped.elf', '', d)}"
+DEPENDS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storage', \
+                                 ' ts-sp-storage', '' , d)}"
+SP_PATHS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storage', \
+                                  ' ${TS_BIN}/${STORAGE_UUID}.stripped.elf', '', d)}"
 
 # Crypto SP.
-DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto', \
-                                        ' ts-sp-crypto', '' , d)}"
-SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto', \
-                                        ' ${TS_BIN}/${CRYPTO_UUID}.stripped.elf', '', d)}"
+DEPENDS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto', \
+                                 ' ts-sp-crypto', '' , d)}"
+SP_PATHS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto', \
+                                  ' ${TS_BIN}/${CRYPTO_UUID}.stripped.elf', '', d)}"
 
 # Attestation SP
-DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestation', \
-                                        ' ts-sp-attestation', '' , d)}"
-SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestation', \
-                                        ' ${TS_BIN}/${ATTESTATION_UUID}.stripped.elf', '', d)}"
+DEPENDS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestation', \
+                                 ' ts-sp-attestation', '' , d)}"
+SP_PATHS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestation', \
+                                  ' ${TS_BIN}/${ATTESTATION_UUID}.stripped.elf', '', d)}"
 
 # Env-test SP
-DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-test', \
-                                        ' ts-sp-env-test', '' , d)}"
-SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-test', \
-                                        ' ${TS_BIN}/${ENV_TEST_UUID}.stripped.elf', '', d)}"
+DEPENDS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-test', \
+                                 ' ts-sp-env-test', '' , d)}"
+SP_PATHS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-test', \
+                                  ' ${TS_BIN}/${ENV_TEST_UUID}.stripped.elf', '', d)}"
 
 # SE-Proxy SP
-DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-proxy', \
-                                        ' ts-sp-se-proxy', '' , d)}"
-SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-proxy', \
-                                        ' ${TS_BIN}/${SE_PROXY_UUID}.stripped.elf', '', d)}"
+DEPENDS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-proxy', \
+                                 ' ts-sp-se-proxy', '' , d)}"
+SP_PATHS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-proxy', \
+                                 ' ${TS_BIN}/${SE_PROXY_UUID}.stripped.elf', '', d)}"
 
 # SMM Gateway
-DEPENDS:append  = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
-                                        ' ts-sp-smm-gateway', '' , d)}"
-SP_PATHS:append = "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
-                                        ' ${TS_BIN}/${SMM_GATEWAY_UUID}.stripped.elf', '', d)}"
+DEPENDS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
+                                 ' ts-sp-smm-gateway', '' , d)}"
+SP_PATHS += "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', \
+                                  ' ${TS_BIN}/${SMM_GATEWAY_UUID}.stripped.elf', '', d)}"
 
-EXTRA_OEMAKE:append = "${@oe.utils.conditional('SP_PATHS', '', '', ' CFG_SECURE_PARTITION=y SP_PATHS="${SP_PATHS}" ', d)}"
+EXTRA_OEMAKE += "${@oe.utils.conditional('SP_PATHS', '', '', ' CFG_SECURE_PARTITION=y SP_PATHS="${SP_PATHS}" ', d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index a03ea6a3..8c29ec95 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -14,13 +14,12 @@ DEPENDS = "python3-pyelftools-native python3-cryptography-native"
 
 DEPENDS:append:toolchain-clang = " compiler-rt"
 
-SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
-
-SRC_URI:append = " \
+SRC_URI = " \
+    git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0007-allow-setting-sysroot-for-clang.patch \
     file://0008-no-warn-rwx-segments.patch \
-   "
+"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
index 31da5ded..9369ad62 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
@@ -5,8 +5,8 @@ DEPENDS += "dtc-native"
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-3.18.0:"
 
 SRCREV = "1ee647035939e073a2e8dddb727c0f019cc035f1"
-SRC_URI:append = " \
+SRC_URI += " \
     file://0001-core-Define-section-attributes-for-clang.patch \
     file://0009-add-z-execstack.patch \
     file://0010-add-note-GNU-stack-section.patch \
-   "
+"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
index 656a0974..3683308c 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
@@ -4,6 +4,6 @@ DEPENDS += "dtc-native"
 
 SRCREV = "afacf356f9593a7f83cae9f96026824ec242ff52"
 
-SRC_URI:append = " \
-    file://0001-core-Define-section-attributes-for-clang.patch \ 
-    "
+SRC_URI += " \
+    file://0001-core-Define-section-attributes-for-clang.patch \
+"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.18.0.bb b/meta-arm/recipes-security/optee/optee-test_3.18.0.bb
index 05706876..457e540d 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.18.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.18.0.bb
@@ -1,8 +1,8 @@
 require optee-test.inc
 
-SRC_URI:append = " \
+SRC_URI += " \
     file://musl-workaround.patch \
-   "
+"
 SRCREV = "da5282a011b40621a2cf7a296c11a35c833ed91b"
 
 EXTRA_OEMAKE:append:libc-musl = " OPTEE_OPENSSL_EXPORT=${STAGING_INCDIR}"
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index c64a1d41..e21c8f9d 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -13,7 +13,7 @@ require trusted-services-src.inc
 
 # By default bitbake includes only ${S} (i.e git/trusted-services) in the maps.
 # We also need to include the TS dependencies source trees.
-DEBUG_PREFIX_MAP:append = "-fmacro-prefix-map=${WORKDIR}/git=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+DEBUG_PREFIX_MAP += "-fmacro-prefix-map=${WORKDIR}/git=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
  -fdebug-prefix-map=${WORKDIR}/git=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
 "
 
-- 
2.34.1


