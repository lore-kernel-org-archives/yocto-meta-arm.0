Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E422DC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 13:30:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10891.1692883845549338480
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 06:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C3DE1042;
	Thu, 24 Aug 2023 06:31:25 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 51E1B3F740;
	Thu, 24 Aug 2023 06:30:44 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/optee-os: corstone1000: Update optee-os v3.22
Date: Thu, 24 Aug 2023 14:30:32 +0100
Message-Id: <20230824133032.43870-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230824133032.43870-1-emekcan.aras@arm.com>
References: <20230824133032.43870-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Aug 2023 13:30:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4991

From: Emekcan Aras <emekcan.aras@arm.com>

Updates optee-os and aligns with changes in v3.22 for Corstone-1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  4 +--
 .../optee/optee-os-corstone1000-common.inc    |  6 ----
 .../optee/optee-os_3.20.0.bbappend            |  1 -
 .../optee/optee-os_3.22.0.bbappend            |  6 ++++
 ...stone1000-change-ns-interrupt-action.patch | 31 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 6 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-plat-corstone1000-change-ns-interrupt-action.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 30b017a3..72c0af51 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -36,8 +36,8 @@ UBOOT_ARCH = "arm"
 UBOOT_EXTLINUX = "0"
 
 #optee
-PREFERRED_VERSION_optee-os ?= "3.20.%"
-PREFERRED_VERSION_optee-client ?= "3.18.%"
+PREFERRED_VERSION_optee-os ?= "3.22%"
+PREFERRED_VERSION_optee-client ?= "3.22%"
 EXTRA_IMAGEDEPENDS += "optee-os"
 OPTEE_ARCH = "arm64"
 OPTEE_BINARY = "tee-pager_v2.bin"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
index 1f028ffa..eaee7ae9 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
@@ -1,9 +1,3 @@
-SRC_URI:remove = " \
-                  file://0003-core-link-add-no-warn-rwx-segments.patch \
-                  file://0007-core-spmc-handle-non-secure-interrupts.patch \
-                  file://0008-core-spmc-configure-SP-s-NS-interrupt-action-based-o.patch \
-                 "
-
 COMPATIBLE_MACHINE = "corstone1000"
 
 OPTEEMACHINE = "corstone1000"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
index b5493e5e..f80e09f8 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
@@ -1,7 +1,6 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_OS_REQUIRE ?= ""
-MACHINE_OPTEE_OS_REQUIRE:corstone1000 = "optee-os-corstone1000-common.inc"
 MACHINE_OPTEE_OS_REQUIRE:n1sdp = "optee-os-n1sdp.inc"
 
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
new file mode 100644
index 00000000..e732c80f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_REQUIRE ?= ""
+MACHINE_OPTEE_OS_REQUIRE:corstone1000 = "optee-os-corstone1000-common.inc"
+
+require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-plat-corstone1000-change-ns-interrupt-action.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-plat-corstone1000-change-ns-interrupt-action.patch
new file mode 100644
index 00000000..c50f2866
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-plat-corstone1000-change-ns-interrupt-action.patch
@@ -0,0 +1,31 @@
+From 7f51fa5f848b77b5aadfc553e1aeca52f4bcc5a1 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Tue, 22 Aug 2023 17:18:26 +0100
+Subject: [PATCH] platform: corstone1000: change ns-interrupt-action 
+
+Changes ns-interrupt-action for corstone1000. The interrupts are queued as 
+in the previous optee release. Currently, enabling preemption (settig this field
+to 2) will halt psa-test from linux-userspace in corstone1000.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../config/corstone1000-opteesp/default_se-proxy.dts.in         | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deployments/se-proxy/config/corstone1000-opteesp/default_se-proxy.dts.in b/deployments/se-proxy/config/corstone1000-opteesp/default_se-proxy.dts.in
+index cc42929d..839f7464 100644
+--- a/deployments/se-proxy/config/corstone1000-opteesp/default_se-proxy.dts.in
++++ b/deployments/se-proxy/config/corstone1000-opteesp/default_se-proxy.dts.in
+@@ -16,7 +16,7 @@
+ 	execution-state = <0>; /* AArch64 */
+ 	xlat-granule = <0>; /* 4KiB */
+ 	messaging-method = <3>; /* Direct messaging only */
+-	ns-interrupts-action = <2>; /* Non-secure interrupts are signaled */
++	ns-interrupts-action = <0>; /* Non-secure interrupts are signaled */
+ 	elf-format = <1>;
+ 
+ 	device-regions {
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
index 3535ddb6..29e33ffe 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -9,6 +9,7 @@ SRC_URI:append:corstone1000  = " \
     file://0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch;patchdir=../trusted-services \
     file://0006-plat-corstone1000-Use-the-stateless-platform-service.patch;patchdir=../trusted-services \
     file://0007-plat-corstone1000-Initialize-capsule-update-provider.patch;patchdir=../trusted-services \
+    file://0008-plat-corstone1000-change-ns-interrupt-action.patch;patchdir=../trusted-services \
     "
 
 
-- 
2.17.1


