Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477C0C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 17:33:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.79506.1638293622943375080
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 09:33:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8832411D4;
	Tue, 30 Nov 2021 09:33:42 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.3.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06E753F694;
	Tue, 30 Nov 2021 09:33:40 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/2] arm-bsp/secure-partitions: corstone1000: add smm-gateway
 partition
Date: Tue, 30 Nov 2021 17:33:30 +0000
Message-Id: <20211130173331.8848-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211130173331.8848-1-abdellatif.elkhlifi@arm.com>
References: <20211130173331.8848-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Nov 2021 17:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2493

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

smm-gateway secure partition is a slim version of StMM for low memory
devices.

This commit adds support for smm-gateway for corstone1000 at the
secure partitions level by making the following changes:

- Configure TS_DEPLOYMENTS to include SMM Gateway SP, SMM gateway to use
  device region for shared buffer, and set the NV store macro.
- Updating secure partitions recipe to point to HEAD of integration
 branch to fetch stmm-gateway changes.

Change-Id: I56ff325cca250749448364e12ac06e3ea289fa29
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...te-mm-comm-buffer-region-in-dts-file.patch | 61 +++++++++++++++++++
 .../0005-Configure-NV-storage-macro.patch     | 28 +++++++++
 .../0006-Use-device-region.patch              | 55 +++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  7 +++
 4 files changed, 151 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0004-Update-mm-comm-buffer-region-in-dts-file.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0005-Configure-NV-storage-macro.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0006-Use-device-region.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0004-Update-mm-comm-buffer-region-in-dts-file.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0004-Update-mm-comm-buffer-region-in-dts-file.patch
new file mode 100644
index 0000000..baed87c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0004-Update-mm-comm-buffer-region-in-dts-file.patch
@@ -0,0 +1,61 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 576b12ed88bd17338e28a62d0ea35aa49cf88170 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Wed, 17 Nov 2021 15:31:09 +0000
+Subject: [PATCH 23/25] Update mm-comm-buffer region in dts file
+
+---
+ .../opteesp/default_smm-gateway.dts.in        | 35 ++++++++++---------
+ 1 file changed, 18 insertions(+), 17 deletions(-)
+
+diff --git a/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in b/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in
+index 0ad7878..183c38a 100644
+--- a/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in
++++ b/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in
+@@ -7,23 +7,24 @@
+ @DTS_TAG@
+ 
+ @DTS_NODE@ {
+-	compatible = "arm,ffa-manifest-1.0";
+-	ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
+-	uuid = <@EXPORT_SP_UUID_DT@>;
+-	description = "SMM Gateway";
+-	execution-ctx-count = <1>;
+-	exception-level = <1>; /* S-EL0 */
+-	execution-state = <0>; /* AArch64 */
+-	xlat-granule = <0>; /* 4KiB */
+-	messaging-method = <0>; /* Direct messaging only */
+-
+-	memory-regions {
+-		compatible = "arm,ffa-manifest-memory-regions";
+-
+-		mm-comm-buffer {
+-			base-address = <@MM_COMM_BUFFER_ADDRESS@>;
+-			pages-count = <@MM_COMM_BUFFER_PAGE_COUNT@>;
+-			attributes = <0xb>;  /* ns access-read-write */
++	smm-gateway{
++		compatible = "arm,ffa-manifest-1.0";
++		ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
++		uuid = <@EXPORT_SP_UUID_DT@>;
++		description = "SMM Gateway";
++		execution-ctx-count = <1>;
++		exception-level = <1>; /* S-EL0 */
++		execution-state = <0>; /* AArch64 */
++		xlat-granule = <0>; /* 4KiB */
++		messaging-method = <0>; /* Direct messaging only */
++		device-regions {
++          compatible = "arm,ffa-manifest-device-regions";
++          mm-comm-buffer {
++              /* Armv8 A Foundation Platform values */
++              base-address = <0x00000000 0x02000000>;
++              pages-count = <1>;
++              attributes = <0x3>; /* read-write */
++              };
+ 		};
+ 	};
+ };
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0005-Configure-NV-storage-macro.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0005-Configure-NV-storage-macro.patch
new file mode 100644
index 0000000..f24f84d
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0005-Configure-NV-storage-macro.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 95a00456f887f4be3b528ace9cd4cfd3403c935b Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Wed, 17 Nov 2021 15:32:04 +0000
+Subject: [PATCH 24/25] Configure NV storage macro
+
+---
+ deployments/smm-gateway/smm_gateway.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/deployments/smm-gateway/smm_gateway.c b/deployments/smm-gateway/smm_gateway.c
+index 4884a04..7828b3a 100644
+--- a/deployments/smm-gateway/smm_gateway.c
++++ b/deployments/smm-gateway/smm_gateway.c
+@@ -13,6 +13,8 @@
+ 
+ /* Build-time default configuration */
+ 
++#define SMM_GATEWAY_NV_STORE_SN "sn:ffa:46bb39d1-b4d9-45b5-88ff-040027dab249:1"
++
+ /* Default to using the Protected Storage SP */
+ #ifndef SMM_GATEWAY_NV_STORE_SN
+ #define SMM_GATEWAY_NV_STORE_SN		"sn:ffa:751bf801-3dde-4768-a514-0f10aeed1790:0"
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0006-Use-device-region.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0006-Use-device-region.patch
new file mode 100644
index 0000000..60022d8
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0006-Use-device-region.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 7320daabc82dc787f2fe017eb176df2ec8e804a0 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Wed, 17 Nov 2021 15:32:46 +0000
+Subject: [PATCH 25/25] Use device region
+
+---
+ deployments/smm-gateway/opteesp/smm_gateway_sp.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/deployments/smm-gateway/opteesp/smm_gateway_sp.c b/deployments/smm-gateway/opteesp/smm_gateway_sp.c
+index 6f13885..0bc0902 100644
+--- a/deployments/smm-gateway/opteesp/smm_gateway_sp.c
++++ b/deployments/smm-gateway/opteesp/smm_gateway_sp.c
+@@ -10,7 +10,7 @@
+ #include <config/loader/sp/sp_config_loader.h>
+ #include "components/rpc/mm_communicate/endpoint/sp/mm_communicate_call_ep.h"
+ #include "components/service/smm_variable/frontend/mm_communicate/smm_variable_mm_service.h"
+-#include "platform/interface/memory_region.h"
++#include "platform/interface/device_region.h"
+ #include <ffa_api.h>
+ #include <sp_api.h>
+ #include <sp_messaging.h>
+@@ -25,7 +25,7 @@ static int sp_init(uint16_t *own_sp_id);
+ 
+ void __noreturn sp_main(struct ffa_init_info *init_info)
+ {
+-	struct memory_region mm_comm_buffer_region = { 0 };
++	struct device_region mm_comm_buffer_region = { 0 };
+ 	struct rpc_interface *gateway_iface = NULL;
+ 	struct smm_variable_mm_service smm_var_service = { 0 };
+ 	struct mm_service_interface *smm_var_service_interface = NULL;
+@@ -42,7 +42,7 @@ void __noreturn sp_main(struct ffa_init_info *init_info)
+ 	config_ramstore_init();
+ 	sp_config_load(init_info);
+ 
+-	if (!config_store_query(CONFIG_CLASSIFIER_MEMORY_REGION, CONFIG_NAME_MM_COMM_BUFFER_REGION,
++	if (!config_store_query(CONFIG_CLASSIFIER_DEVICE_REGION, CONFIG_NAME_MM_COMM_BUFFER_REGION,
+ 				0, &mm_comm_buffer_region, sizeof(mm_comm_buffer_region))) {
+ 		EMSG(CONFIG_NAME_MM_COMM_BUFFER_REGION " is not set in SP configuration");
+ 		goto fatal_error;
+@@ -57,7 +57,7 @@ void __noreturn sp_main(struct ffa_init_info *init_info)
+ 	/* Initialize MM communication layer */
+ 	if (!mm_communicate_call_ep_init(&mm_communicate_call_ep,
+ 					 (void *)mm_comm_buffer_region.base_addr,
+-					 mm_comm_buffer_region.region_size))
++					 mm_comm_buffer_region.io_region_size))
+ 		goto fatal_error;
+ 
+ 	/* Attach SMM variable service to MM communication layer */
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index d574fbe..3fcdf82 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -2,9 +2,13 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/secure-partitions:"
 
 COMPATIBLE_MACHINE = "corstone1000"
 
+SRCREV_ts = "882a2db4f9181fc6ddb505b82262f82e5a0c2fd5"
 SRC_URI:append = " file://0001-tools-cmake-common-applying-lowercase-project-convention.patch \
                   file://0002-fix-EARLY_TA_PATHS-env-variable.patch \
                   file://0003-se-proxy-dts-add-se-proxy-as-child-node.patch \
+                  file://0004-Update-mm-comm-buffer-region-in-dts-file.patch \
+                  file://0005-Configure-NV-storage-macro.patch \
+                  file://0006-Use-device-region.patch \
 		  "
 
 TS_PLATFORM = "arm/fvp/fvp_base_revc-2xaemv8a"
@@ -15,3 +19,6 @@ EXTRA_OEMAKE += "TS_PLATFORM=${TS_PLATFORM}"
 
 # Secure Enclave proxy secure partition
 TS_DEPLOYMENTS += "'deployments/se-proxy/${TS_ENVIRONMENT}'"
+
+# smm-gateway secure partition
+TS_DEPLOYMENTS += "'deployments/smm-gateway/${TS_ENVIRONMENT}'"
-- 
2.17.1


