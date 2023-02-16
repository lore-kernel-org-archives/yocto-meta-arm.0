Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A96C64ED9
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 10:56:59 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.7435.1676545009681752590
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 02:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSbwV-009BTo-LB; Thu, 16 Feb 2023 12:56:47 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1pSbwV-000caR-Bi; Thu, 16 Feb 2023 12:56:47 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 4/4] meta-arm-bsp: switch from :append to +=
Date: Thu, 16 Feb 2023 12:56:40 +0200
Message-Id: <20230216105640.147967-5-mikko.rapeli@linaro.org>
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
 Message-ID: 20230216105640.147967-5-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 10:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4403

:append is hard to override in product specific layers so use +=
when possible.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |  4 +--
 .../recipes-bsp/hafnium/hafnium-tc.inc        |  4 +--
 .../scp-firmware/scp-firmware-juno.inc        |  2 +-
 .../scp-firmware/scp-firmware-n1sdp.inc       |  2 +-
 .../trusted-firmware-a-corstone1000.inc       | 34 +++++++++----------
 .../trusted-firmware-a-corstone500.inc        | 16 ++++-----
 .../trusted-firmware-a-fvp-arm32.inc          |  5 ++-
 .../trusted-firmware-a-juno.inc               |  2 +-
 .../trusted-firmware-a-n1sdp.inc              | 18 +++++-----
 .../trusted-firmware-a-tc.inc                 |  4 +--
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |  2 +-
 .../linux/linux-arm64-ack-clang.inc           |  2 +-
 .../recipes-kernel/linux/linux-yocto_5.19.bb  |  8 ++---
 .../optee/optee-os-corstone1000-common.inc    |  6 ++--
 .../recipes-security/optee/optee-os-n1sdp.inc |  4 +--
 15 files changed, 56 insertions(+), 57 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
index 8ffa0aa2..4f9a98e2 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
@@ -1,7 +1,7 @@
 COMPATIBLE_MACHINE = "fvp-baser-aemv8r64"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files/${MACHINE}:"
-SRC_URI:append = " \
+SRC_URI += " \
     file://0001-aarch64-Rename-labels-and-prepare-for-lower-EL-booti.patch \
     file://0002-aarch64-Prepare-for-EL1-booting.patch \
     file://0003-aarch64-Prepare-for-lower-EL-booting.patch \
@@ -23,7 +23,7 @@ SRC_URI:append = " \
     file://0019-lds-Rearrange-and-mark-the-sections.patch \
     file://0020-common-Provide-firmware-info-using-libfdt.patch \
     file://0021-boot-Enable-firmware-node-initialization.patch \
-    "
+"
 
 BOOT_WRAPPER_AARCH64_CMDLINE = "\
 earlycon console=ttyAMA0 loglevel=8 rootfstype=ext4 root=/dev/vda1 rw"
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
index 433d5612..e38e5c19 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -11,14 +11,14 @@ FILESEXTRAPATHS:prepend:tc := "${THISDIR}/files/tc:"
 
 SRC_URI:remove = "file://0003-Fix-build-with-clang-15.patch"
 
-SRC_URI:append = " \
+SRC_URI += " \
         file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth.patch \
         file://0002-feat-emulate-interrupt-controller-register-access.patch \
         file://0003-feat-disable-alignment-check-for-EL0-partitions.patch \
         file://0004-feat-vhe-set-STAGE1_NS-while-mapping-memory-from-NWd.patch \
         file://0001-tc-increase-heap-pages.patch;patchdir=project/reference \
         file://0002-feat-vhe-enable-vhe-and-disable-branch-protection-fo.patch;patchdir=project/reference \
-        "
+"
 
 do_compile() {
     PATH="${S}/prebuilts/linux-x64/clang/bin:$PATH" oe_runmake -C ${S}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
index ea2faceb..76062631 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
@@ -4,7 +4,7 @@ COMPATIBLE_MACHINE = "juno"
 
 SCP_PLATFORM = "juno"
 FW_TARGETS = "scp"
-FW_INSTALL:append = " romfw_bypass"
+FW_INSTALL += "romfw_bypass"
 
 do_install:append() {
     for TYPE in ${FW_INSTALL}; do
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 85f89a01..3c7aeb27 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -14,7 +14,7 @@ DEPENDS += "n1sdp-board-firmware"
 
 # The n1sdp sensor library is needed for building SCP N1SDP Platform
 # https://github.com/ARM-software/SCP-firmware/tree/master/product/n1sdp
-EXTRA_OECMAKE:append = " \
+EXTRA_OECMAKE += " \
     -DSCP_N1SDP_SENSOR_LIB_PATH=${RECIPE_SYSROOT}/n1sdp-board-firmware_source/LIB/sensor.a \
 "
 
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
index 3034680d..9a20ec49 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -4,9 +4,9 @@ COMPATIBLE_MACHINE = "(corstone1000)"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files/corstone1000:"
 
-SRC_URI:append = " \ 
+SRC_URI += " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
-	"
+"
 
 TFA_DEBUG = "1"
 TFA_UBOOT ?= "1"
@@ -22,18 +22,18 @@ TFA_SPMD_SPM_AT_SEL2 = "0"
 # BL2 loads BL32 (optee). So, optee needs to be built first:
 DEPENDS += "optee-os"
 
-EXTRA_OEMAKE:append = " \
-                        ARCH=aarch64 \
-                        TARGET_PLATFORM=${TFA_TARGET_PLATFORM} \
-                        ENABLE_STACK_PROTECTOR=strong \
-                        ENABLE_PIE=1 \
-                        BL2_AT_EL3=1 \
-                        CREATE_KEYS=1 \
-                        GENERATE_COT=1 \
-                        TRUSTED_BOARD_BOOT=1 \
-                        COT=tbbr \
-                        ARM_ROTPK_LOCATION=devel_rsa  \
-                        ROT_KEY=plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem \
-                        BL32=${RECIPE_SYSROOT}/lib/firmware/tee-pager_v2.bin \
-                        LOG_LEVEL=50 \
-                        "
+EXTRA_OEMAKE += " \
+    ARCH=aarch64 \
+    TARGET_PLATFORM=${TFA_TARGET_PLATFORM} \
+    ENABLE_STACK_PROTECTOR=strong \
+    ENABLE_PIE=1 \
+    BL2_AT_EL3=1 \
+    CREATE_KEYS=1 \
+    GENERATE_COT=1 \
+    TRUSTED_BOARD_BOOT=1 \
+    COT=tbbr \
+    ARM_ROTPK_LOCATION=devel_rsa  \
+    ROT_KEY=plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem \
+    BL32=${RECIPE_SYSROOT}/lib/firmware/tee-pager_v2.bin \
+    LOG_LEVEL=50 \
+"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
index acd9e3db..97c536c3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
@@ -7,11 +7,11 @@ TFA_UBOOT = "1"
 TFA_BUILD_TARGET = "all fip"
 TFA_INSTALL_TARGET = "bl1.bin fip.bin"
 
-EXTRA_OEMAKE:append = " \
-                    ARCH=aarch32 \
-                    FVP_HW_CONFIG_DTS=fdts/a5ds.dts \
-                    ARM_ARCH_MAJOR=7 \
-                    AARCH32_SP=sp_min \
-                    ARM_CORTEX_A5=yes \
-                    ARM_XLAT_TABLES_LIB_V1=1 \
-                    "
+EXTRA_OEMAKE += " \
+    ARCH=aarch32 \
+    FVP_HW_CONFIG_DTS=fdts/a5ds.dts \
+    ARM_ARCH_MAJOR=7 \
+    AARCH32_SP=sp_min \
+    ARM_CORTEX_A5=yes \
+    ARM_XLAT_TABLES_LIB_V1=1 \
+"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
index fdaadb9f..ff0c43a3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
@@ -5,8 +5,7 @@ TFA_PLATFORM = "fvp"
 TFA_UBOOT = "1"
 TFA_BUILD_TARGET = "dtbs bl1 bl32 fip"
 
-EXTRA_OEMAKE:append = " \
+EXTRA_OEMAKE += " \
     ARCH=aarch32 \
     AARCH32_SP=sp_min \
-    "
-
+"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
index 3ddd8cb5..3395b41c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
@@ -10,4 +10,4 @@ TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fip"
 # Juno needs the System Control Processor Firmware
 DEPENDS += "virtual/control-processor-firmware"
 
-EXTRA_OEMAKE:append = " SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
+EXTRA_OEMAKE += "SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index 9fb567fa..3a8eb56e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -24,12 +24,12 @@ TFA_SPMD_SPM_AT_SEL2 = "0"
 # BL2 loads BL32 (optee). So, optee needs to be built first:
 DEPENDS += "optee-os"
 
-EXTRA_OEMAKE:append = "\
-                    TRUSTED_BOARD_BOOT=1 \
-		    GENERATE_COT=1 \
-		    CREATE_KEYS=1 \
-		    ARM_ROTPK_LOCATION="devel_rsa" \
-		    ROT_KEY="${TFA_ROT_KEY}" \
-		    BL32=${RECIPE_SYSROOT}/lib/firmware/tee-pager_v2.bin \
-		    BL33=${RECIPE_SYSROOT}/firmware/uefi.bin \
-		    "
+EXTRA_OEMAKE += "\
+    TRUSTED_BOARD_BOOT=1 \
+    GENERATE_COT=1 \
+    CREATE_KEYS=1 \
+    ARM_ROTPK_LOCATION="devel_rsa" \
+    ROT_KEY="${TFA_ROT_KEY}" \
+    BL32=${RECIPE_SYSROOT}/lib/firmware/tee-pager_v2.bin \
+    BL33=${RECIPE_SYSROOT}/firmware/uefi.bin \
+"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
index 301f97c8..2069593d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
@@ -7,7 +7,7 @@ PV = "2.7+git${SRCPV}"
 DEPENDS += "scp-firmware util-linux-native gptfdisk-native"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files/tc:"
-SRC_URI:append = " \
+SRC_URI += " \
     file://0001-plat-tc-Increase-maximum-BL2-size.patch \
     file://0002-Makefile-add-trusty_sp_fw_config-build-option.patch \
     file://0003-fix-plat-arm-increase-sp-max-image-size.patch \
@@ -18,7 +18,7 @@ SRC_URI:append = " \
     file://0008-feat-plat-tc-add-firmware-update-secure-partition.patch \
     file://0009-feat-plat-tc-reserve-4-MB-for-stmm-communication-use.patch \
     file://generate_metadata.py \
-    "
+"
 
 COMPATIBLE_MACHINE = "(tc?)"
 
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 629ea049..66411c24 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -18,7 +18,7 @@ EFI_BOOT_IMAGE     = "bootaa64.efi"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files/edk2-platforms:"
 
-SRC_URI:append = "\
+SRC_URI += "\
     file://0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch;patchdir=edk2-platforms \
     file://0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch;patchdir=edk2-platforms            \
     file://0003-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch;patchdir=edk2-platforms \
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-clang.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-clang.inc
index c5b74634..0ddb4f95 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-clang.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-clang.inc
@@ -3,6 +3,6 @@
 # We need to add this dependency as the kernel configuration depends on the compiler
 do_kernel_configme[depends] += "androidclang-native:do_populate_sysroot"
 
-DEPENDS:append = " androidclang-native"
+DEPENDS += "androidclang-native"
 
 KERNEL_CC = "${CCACHE}clang ${HOST_CC_KERNEL_ARCH}"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb
index 3bd4c756..dc6fbb84 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -22,7 +22,7 @@ KCONF_BSP_AUDIT_LEVEL = "1"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES += "${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES += "${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES += "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES += "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
index c54e0041..876e98db 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
@@ -6,9 +6,9 @@ SRC_URI:remove = " \
                  "
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
-SRC_URI:append = " \
-                  file://0004-Handle-logging-syscall.patch \
-		  "
+SRC_URI += " \
+    file://0004-Handle-logging-syscall.patch \
+"
 
 COMPATIBLE_MACHINE = "corstone1000"
 
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
index a40c93dc..fd42841f 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
@@ -5,14 +5,14 @@ require optee-os-generic-n1sdp.inc
 TS_INSTALL_PREFIX_PATH = "${RECIPE_SYSROOT}/firmware/sp/opteesp"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/n1sdp:"
-SRC_URI:append = " \
+SRC_URI += " \
     file://0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch \
     file://0002-plat-n1sdp-add-N1SDP-platform-support.patch \
     file://0003-HACK-disable-instruction-cache-and-data-cache.patch \
     file://0004-Handle-logging-syscall.patch \
     file://0005-plat-n1sdp-register-DRAM1-to-optee-os.patch \
     file://0006-plat-n1sdp-add-external-device-tree-base-and-size.patch \
-    "
+"
 
 EXTRA_OEMAKE += " CFG_TEE_CORE_LOG_LEVEL=4"
 
-- 
2.34.1


