Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA7AC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:34:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5531.1650976456183895363
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 05:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4461E23A;
	Tue, 26 Apr 2022 05:34:15 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94CB83F774;
	Tue, 26 Apr 2022 05:34:14 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH honister 1/9] arm-bsp/machine: Add runfvp config for
 corstone1000
Date: Tue, 26 Apr 2022 13:33:51 +0100
Message-Id: <20220426123359.22873-2-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426123359.22873-1-harry.moulton@arm.com>
References: <20220426123359.22873-1-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 12:34:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3302

From: Harry Moulton <harry.moulton@arm.com>

Add the runfvp config for corstone1000-fvp.

Signed-off-by: Harry Moulton <harry.moulton@arm.com>
---
 ci/corstone1000-fvp.yml                       |  1 +
 kas/corstone1000-fvp.yml                      |  7 ++++
 .../conf/machine/corstone1000-fvp.conf        | 34 ++++++++++++++++++-
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/ci/corstone1000-fvp.yml b/ci/corstone1000-fvp.yml
index 66cdec6e..b6ae242f 100644
--- a/ci/corstone1000-fvp.yml
+++ b/ci/corstone1000-fvp.yml
@@ -10,3 +10,4 @@ local_conf_header:
         INITRAMFS_IMAGE:remove = "corstone1000-initramfs-image"
 
 machine: corstone1000-fvp
+
diff --git a/kas/corstone1000-fvp.yml b/kas/corstone1000-fvp.yml
index 531fd1ac..2420aa8e 100644
--- a/kas/corstone1000-fvp.yml
+++ b/kas/corstone1000-fvp.yml
@@ -12,5 +12,12 @@ repos:
 
 machine: corstone1000-fvp
 
+local_conf_header:
+    fvp-config: |
+        # Remove Dropbear SSH as it will not fit into the corstone1000 image.
+        IMAGE_FEATURES:remove = " ssh-server-dropbear"
+        INHERIT = " ${@bb.utils.contains('BUILD_ARCH', 'x86_64', 'fvpboot', '', d)}"
+        LICENSE_FLAGS_WHITELIST:append = " Arm-FVP-EULA"
+
 target:
   - corstone1000-image
diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
index fc69fe84..eb122f35 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -1,9 +1,41 @@
 #@TYPE: Machine
 #@NAME: corstone1000-fvp machine
 #@DESCRIPTION: Machine configuration for Corstone1000 64-bit FVP
-
 require conf/machine/include/corstone1000.inc
 
 TFA_TARGET_PLATFORM = "fvp"
 
 TFM_PLATFORM_IS_FVP = "TRUE"
+
+# testimage config
+TEST_TARGET = "OEFVPTarget"
+TEST_SUITES = "noop"
+
+# FVP Config
+FVP_PROVIDER ?= "fvp-corstone1000-native"
+FVP_EXE ?= "FVP_Corstone-1000"
+FVP_CONSOLE ?= "host_terminal_0"
+
+# FVP Parameters
+FVP_CONFIG[se.trustedBootROMloader.fname] ?= "${DEPLOY_DIR_IMAGE}/bl1.bin"
+FVP_CONFIG[board.xnvm_size] ?= "64"
+FVP_CONFIG[se.trustedSRAM_config] ?= "6"
+FVP_CONFIG[se.BootROM_config] ?= "3"
+FVP_CONFIG[board.hostbridge.interfaceName] ?= "tap0"
+FVP_CONFIG[board.smsc_91c111.enabled] ?= "1"
+FVP_CONFIG[board.hostbridge.userNetworking] ?= "true"
+FVP_CONFIG[board.hostbridge.userNetPorts] ?= "5555=5555,8080=80,8022=22"
+FVP_CONFIG[board.se_flash_size] ?= "8192"
+FVP_CONFIG[diagnostics] ?= "4"
+FVP_CONFIG[disable_visualisation] ?= "true"
+FVP_CONFIG[se.nvm.update_raw_image] ?= "0"
+
+# Boot image
+FVP_DATA ?= "board.flash0=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic.nopt@0x68100000"
+
+# FVP Terminals
+FVP_TERMINALS[host.host_terminal_0] ?= "Normal World Console"
+FVP_TERMINALS[host.host_terminal_1] ?= "Secure World Console"
+FVP_TERMINALS[se.secenc_terminal] ?= "Secure Enclave Console"
+FVP_TERMINALS[extsys0.extsys_terminal] ?= "Cortex M3"
+
-- 
2.17.1


