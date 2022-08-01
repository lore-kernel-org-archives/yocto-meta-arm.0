Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D2CC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 14:45:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25509.1659365151277192387
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 07:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD038ED1
	for <meta-arm@lists.yoctoproject.org>; Mon,  1 Aug 2022 07:45:50 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E3C4E3F73B
	for <meta-arm@lists.yoctoproject.org>; Mon,  1 Aug 2022 07:45:49 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/corestone1000: update trusted-service patches for
 devtool
Date: Mon,  1 Aug 2022 10:12:56 -0400
Message-Id: <20220801141256.28914-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 Aug 2022 14:45:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3631

Current secure-partitions patches do not apply cleanly with devtool.
Update them with the necessary changes to address this issue, and
regenerate them via devtool.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...n-applying-lowercase-project-conven.patch} |  16 +-
 ...0002-fix-EARLY_TA_PATHS-env-variable.patch |  17 +--
 ...0003-corstone1000-port-crypto-config.patch |   3 -
 ...proxy-dts-add-se-proxy-as-child-node.patch |  17 +--
 ...te-mm-comm-buffer-region-in-dts-file.patch |  18 +--
 .../0005-Configure-NV-storage-macro.patch     |  18 +--
 .../corstone1000/0006-Use-device-region.patch |  18 +--
 ...7-Add-openamp-to-SE-proxy-deployment.patch |  30 ++--
 ...iver-and-the-OpenAmp-conversion-laye.patch |  34 +++--
 .../0009-Add-openamp-rpc-caller.patch         |  55 ++++---
 ...-add-psa-client-definitions-for-ff-m.patch |  23 +--
 ...mon-service-component-to-ipc-support.patch |  30 ++--
 .../0012-Add-secure-storage-ipc-backend.patch |  33 ++--
 ...storage-ipc-and-openamp-for-se_proxy.patch |  18 +--
 ...d-uefi-variable-append-write-support.patch |  42 +++--
 ...riable-support-for-QueryVariableInfo.patch |  36 +++--
 .../0016-Add-uefi-test-deployment.patch       |  33 ++--
 ...-parameter-setting-in-sp-ffarpc_call.patch |  18 ++-
 ...-call-requests-with-no-shared-buffer.patch |  18 ++-
 .../corstone1000/0019-Run-psa-arch-test.patch |  23 ++-
 ...0020-Use-address-instead-of-pointers.patch |  21 ++-
 ...-Add-psa-ipc-attestation-to-se-proxy.patch |  29 ++--
 ...d-as-openamp-rpc-using-secure-storag.patch |  23 ++-
 .../0023-add-psa-ipc-crypto-backend.patch     |  73 +++++----
 ...MM-gateway-UEFI-variable-macro-value.patch |  15 +-
 ...ub-capsule-update-service-components.patch |  58 ++++---
 ...-logs-to-functions-in-SMM-gateway-SP.patch |  17 +--
 .../0027-Configure-storage-size.patch         |  14 +-
 ...d-uefi-variable-append-write-support.patch |  53 ++++---
 ...-Change-UID-of-variable-index-in-SMM.patch |  17 +--
 ...-Add-missing-features-to-setVariable.patch |  17 +--
 ...rameter-check-in-getNextVariableName.patch |  17 +--
 ...teway-add-checks-for-null-attributes.patch |  18 ++-
 .../0033-Enhance-mbedtls-fetch-process.patch  |  40 ++---
 ...x-format-specifier-in-logging_caller.patch |  20 +--
 ...for-mbedtls-and-psa-arch-tests-for-v.patch |  23 ++-
 ...n-verify-message-and-hash-operations.patch | 144 +++++++++---------
 ...nst-uninitialised-multi-part-transac.patch |  21 ++-
 ...038-Integrate-AEAD-operation-support.patch |  34 ++---
 ...eration-to-one-shot-cipher-operation.patch |  28 ++--
 ...-Fix-multi-part-termination-on-error.patch |  74 ++++-----
 ...tion-if-client-provided-buffer-is-to.patch |  17 +--
 ...g-to-updated-t_cose-version-fc3a4b2c.patch |  15 +-
 .../0043-pass-sysroot_yocto.patch             |  23 ++-
 ...face-structure-aligned-with-tf-m-cha.patch |  15 +-
 ...egrate-remaining-psa-ipc-client-APIs.patch |  42 ++---
 ...et_key_usage_flags-definition-to-the.patch |  20 +--
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch |  40 ++---
 .../trusted-services/ts-corstone1000.inc      |   4 +-
 49 files changed, 749 insertions(+), 683 deletions(-)
 rename meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/{0001-tools-cmake-common-applying-lowercase-project-convention.patch => 0001-tools-cmake-common-applying-lowercase-project-conven.patch} (80%)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0001-tools-cmake-common-applying-lowercase-project-convention.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0001-tools-cmake-common-applying-lowercase-project-conven.patch
similarity index 80%
rename from meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0001-tools-cmake-common-applying-lowercase-project-convention.patch
rename to meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0001-tools-cmake-common-applying-lowercase-project-conven.patch
index e48f4573..83c7b545 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0001-tools-cmake-common-applying-lowercase-project-convention.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0001-tools-cmake-common-applying-lowercase-project-conven.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 37559c70443fe85e246f1f652045f0cd3c78012b Mon Sep 17 00:00:00 2001
+From 73c27b917e15eb04f39eedac9b79e5011e8a754f Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 13 Nov 2021 07:47:44 +0000
 Subject: [PATCH] tools/cmake/common: applying lowercase project convention
@@ -11,12 +8,16 @@ source-code.
 Host build paths should not be lowercased. Otherwise, builds
 with uppercase paths will break.
 
+Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 
-%% original patch: 0001-tools-cmake-common-applying-lowercase-project-convention.patch
+
+---
+ tools/cmake/common/AddPlatform.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/cmake/common/AddPlatform.cmake b/tools/cmake/common/AddPlatform.cmake
-index ae34c6e..31bcd8c 100644
+index ae34c6e4..31bcd8ca 100644
 --- a/tools/cmake/common/AddPlatform.cmake
 +++ b/tools/cmake/common/AddPlatform.cmake
 @@ -37,8 +37,8 @@ function(add_platform)
@@ -30,6 +31,3 @@ index ae34c6e..31bcd8c 100644
  	set(CMAKE_CONFIGURE_DEPENDS ${_platdef})
  
  	unset(TGT CACHE)
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0002-fix-EARLY_TA_PATHS-env-variable.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0002-fix-EARLY_TA_PATHS-env-variable.patch
index a1af2aba..f56b4553 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0002-fix-EARLY_TA_PATHS-env-variable.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0002-fix-EARLY_TA_PATHS-env-variable.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From a0673905e8f63877b631a29fab56ea42bf748549 Mon Sep 17 00:00:00 2001
+From 146f4dfa73aa316d611188f63e3530cffe9200af Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 13 Nov 2021 07:51:53 +0000
 Subject: [PATCH] fix EARLY_TA_PATHS env variable
@@ -11,11 +8,16 @@ EARLY_TA_PATHS should be set a separate rule for securepartitions
 to be included into optee-os image
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
 
-%% original patch: 0002-fix-EARLY_TA_PATHS-env-variable.patch
+---
+ environments/opteesp/sp.mk.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/environments/opteesp/sp.mk.in b/environments/opteesp/sp.mk.in
-index c44ad59..d67e2dc 100644
+index c44ad59e..d67e2dca 100644
 --- a/environments/opteesp/sp.mk.in
 +++ b/environments/opteesp/sp.mk.in
 @@ -14,7 +14,8 @@ ifeq (,${@EXPORT_SP_UUID@-included})
@@ -28,6 +30,3 @@ index c44ad59..d67e2dc 100644
  TS_SP_DTSI_LIST+="\\n\#include \"${TS_INSTALL_PREFIX}/opteesp/manifest/@EXPORT_SP_UUID@.dtsi\""
  else ifeq (fip,${SP_PACKAGING_METHOD})
  TS_SP_JSON_LIST+=${TS_INSTALL_PREFIX}/opteesp/json/@EXPORT_SP_NAME@.json
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-corstone1000-port-crypto-config.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-corstone1000-port-crypto-config.patch
index 1d7b8ae9..3b26b77a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-corstone1000-port-crypto-config.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-corstone1000-port-crypto-config.patch
@@ -1,6 +1,3 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
 From f86f5b42d853d2a65f6753362361bbb95aac1800 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Sat, 11 Dec 2021 11:06:57 +0000
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-se-proxy-dts-add-se-proxy-as-child-node.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
index 3d50f931..bb4fc82e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 77fa96b728b81066c440c2e1e185f745376a6fb2 Mon Sep 17 00:00:00 2001
+From 0ec1b3d20d612325b9c55baa2539d080eb6a72a8 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 13 Nov 2021 08:34:42 +0000
 Subject: [PATCH] se-proxy:dts: add se-proxy as child node
@@ -10,11 +7,16 @@ se-proxy sp string should be added for se-proxy node to be
 read properly.
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
 
-%% original patch: 0003-se-proxy-dts-add-se-proxy-as-child-node.patch
+---
+ .../se-proxy/opteesp/default_se-proxy.dts.in  | 20 ++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
 
 diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-index 961071a..9f5cf71 100644
+index 961071ad..9f5cf712 100644
 --- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
 +++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
 @@ -7,13 +7,15 @@
@@ -42,6 +44,3 @@ index 961071a..9f5cf71 100644
 +		messaging-method = <0>; /* Direct messaging only */
 +	};
  };
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0004-Update-mm-comm-buffer-region-in-dts-file.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0004-Update-mm-comm-buffer-region-in-dts-file.patch
index a91355c0..9ceb176c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0004-Update-mm-comm-buffer-region-in-dts-file.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0004-Update-mm-comm-buffer-region-in-dts-file.patch
@@ -1,15 +1,18 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 1f75194e884a1795c3523f41dc0912dc5068e525 Mon Sep 17 00:00:00 2001
+From 97b4f3cd0216c30c39f6ece4f68d8faf3901fded Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Wed, 17 Nov 2021 15:31:09 +0000
 Subject: [PATCH] Update mm-comm-buffer region in dts file
 
-%% original patch: 0004-Update-mm-comm-buffer-region-in-dts-file.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+
+---
+ .../opteesp/default_smm-gateway.dts.in        | 35 ++++++++++---------
+ 1 file changed, 18 insertions(+), 17 deletions(-)
 
 diff --git a/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in b/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in
-index 0ad7878..183c38a 100644
+index 0ad7878b..183c38a7 100644
 --- a/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in
 +++ b/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in
 @@ -7,23 +7,24 @@
@@ -54,6 +57,3 @@ index 0ad7878..183c38a 100644
  		};
  	};
  };
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0005-Configure-NV-storage-macro.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0005-Configure-NV-storage-macro.patch
index bdf71e68..8d2d62bf 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0005-Configure-NV-storage-macro.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0005-Configure-NV-storage-macro.patch
@@ -1,15 +1,18 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 634b8e09e9c072b41dfe92e4ca08a685cac9e998 Mon Sep 17 00:00:00 2001
+From a11b23dd5f0c4124a5c6c2fcab0ea623bc76f4ba Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Wed, 17 Nov 2021 15:32:04 +0000
 Subject: [PATCH] Configure NV storage macro
 
-%% original patch: 0005-Configure-NV-storage-macro.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+
+---
+ deployments/smm-gateway/smm_gateway.c | 2 ++
+ 1 file changed, 2 insertions(+)
 
 diff --git a/deployments/smm-gateway/smm_gateway.c b/deployments/smm-gateway/smm_gateway.c
-index 4884a04..7828b3a 100644
+index 4884a040..7828b3af 100644
 --- a/deployments/smm-gateway/smm_gateway.c
 +++ b/deployments/smm-gateway/smm_gateway.c
 @@ -13,6 +13,8 @@
@@ -21,6 +24,3 @@ index 4884a04..7828b3a 100644
  /* Default to using the Protected Storage SP */
  #ifndef SMM_GATEWAY_NV_STORE_SN
  #define SMM_GATEWAY_NV_STORE_SN		"sn:ffa:751bf801-3dde-4768-a514-0f10aeed1790:0"
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0006-Use-device-region.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0006-Use-device-region.patch
index 7087850b..eba1338e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0006-Use-device-region.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0006-Use-device-region.patch
@@ -1,15 +1,18 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 6bb7e118c15c97d4554a0a7f6d3fc8e9792ca65c Mon Sep 17 00:00:00 2001
+From ae22f5077d35e6acf3feb8a84a8ef7f599261b00 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Wed, 17 Nov 2021 15:32:46 +0000
 Subject: [PATCH] Use device region
 
-%% original patch: 0006-Use-device-region.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+
+---
+ deployments/smm-gateway/opteesp/smm_gateway_sp.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/deployments/smm-gateway/opteesp/smm_gateway_sp.c b/deployments/smm-gateway/opteesp/smm_gateway_sp.c
-index 6f13885..0bc0902 100644
+index 6f138850..0bc09023 100644
 --- a/deployments/smm-gateway/opteesp/smm_gateway_sp.c
 +++ b/deployments/smm-gateway/opteesp/smm_gateway_sp.c
 @@ -10,7 +10,7 @@
@@ -48,6 +51,3 @@ index 6f13885..0bc0902 100644
  		goto fatal_error;
  
  	/* Attach SMM variable service to MM communication layer */
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
index 06fb4979..eb51ef71 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0007-Add-openamp-to-SE-proxy-deployment.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 8e25c9b4617dcbb5800b25ace93371d9bcd68e61 Mon Sep 17 00:00:00 2001
+From 90712f624c7b676e5b9a2d95cbe97d2b63fddcc9 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 16:36:51 +0000
 Subject: [PATCH] Add openamp to SE proxy deployment
@@ -14,10 +11,22 @@ and build it.
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-%% original patch: 0007-Add-openamp-to-SE-proxy-deployment.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ deployments/se-proxy/opteesp/CMakeLists.txt | 14 ++++
+ deployments/se-proxy/opteesp/lse.S          | 19 +++++
+ external/openamp/libmetal.cmake             | 81 ++++++++++++++++++++
+ external/openamp/openamp.cmake              | 82 +++++++++++++++++++++
+ 4 files changed, 196 insertions(+)
+ create mode 100644 deployments/se-proxy/opteesp/lse.S
+ create mode 100644 external/openamp/libmetal.cmake
+ create mode 100644 external/openamp/openamp.cmake
 
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index 4e2069a..248bd7e 100644
+index 4e2069a5..248bd7e3 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
 @@ -89,6 +89,7 @@ add_components(TARGET "se-proxy"
@@ -50,7 +59,7 @@ index 4e2069a..248bd7e 100644
  target_compile_definitions(se-proxy PRIVATE
 diff --git a/deployments/se-proxy/opteesp/lse.S b/deployments/se-proxy/opteesp/lse.S
 new file mode 100644
-index 0000000..840683a
+index 00000000..840683a6
 --- /dev/null
 +++ b/deployments/se-proxy/opteesp/lse.S
 @@ -0,0 +1,19 @@
@@ -75,7 +84,7 @@ index 0000000..840683a
 +
 diff --git a/external/openamp/libmetal.cmake b/external/openamp/libmetal.cmake
 new file mode 100644
-index 0000000..3a647e6
+index 00000000..3a647e69
 --- /dev/null
 +++ b/external/openamp/libmetal.cmake
 @@ -0,0 +1,81 @@
@@ -162,7 +171,7 @@ index 0000000..3a647e6
 +set_property(TARGET libmetal PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${LIBMETAL_INSTALL_PATH}/include")
 diff --git a/external/openamp/openamp.cmake b/external/openamp/openamp.cmake
 new file mode 100644
-index 0000000..aae13ba
+index 00000000..aae13bad
 --- /dev/null
 +++ b/external/openamp/openamp.cmake
 @@ -0,0 +1,82 @@
@@ -248,6 +257,3 @@ index 0000000..aae13ba
 +add_library(openamp STATIC IMPORTED)
 +set_property(TARGET openamp PROPERTY IMPORTED_LOCATION "${OPENAMP_INSTALL_PATH}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}open_amp${CMAKE_STATIC_LIBRARY_SUFFIX}")
 +set_property(TARGET openamp PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${OPENAMP_INSTALL_PATH}/include")
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
index f0930bdb..47ca59ff 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 000f8beb8aaa70b1e9f805fd62b886f49b540251 Mon Sep 17 00:00:00 2001
+From 993a3c3cb08a723f5b5eb07cf38d70e9acf52e7f Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 18:00:46 +0000
 Subject: [PATCH] Implement mhu driver and the OpenAmp conversion layer.
@@ -13,10 +10,24 @@ the secure enclave using OpenAmp.
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-%% original patch: 0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../se-proxy/opteesp/default_se-proxy.dts.in  |  16 +
+ .../drivers/arm/mhu_driver/component.cmake    |  12 +
+ platform/drivers/arm/mhu_driver/mhu_v2.h      | 391 ++++++++++++
+ platform/drivers/arm/mhu_driver/mhu_v2_x.c    | 602 ++++++++++++++++++
+ .../providers/arm/corstone1000/platform.cmake |  10 +
+ 5 files changed, 1031 insertions(+)
+ create mode 100644 platform/drivers/arm/mhu_driver/component.cmake
+ create mode 100644 platform/drivers/arm/mhu_driver/mhu_v2.h
+ create mode 100644 platform/drivers/arm/mhu_driver/mhu_v2_x.c
+ create mode 100644 platform/providers/arm/corstone1000/platform.cmake
 
 diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-index 9f5cf71..f351a59 100644
+index 9f5cf712..f351a592 100644
 --- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
 +++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
 @@ -17,5 +17,21 @@
@@ -43,7 +54,7 @@ index 9f5cf71..f351a59 100644
  };
 diff --git a/platform/drivers/arm/mhu_driver/component.cmake b/platform/drivers/arm/mhu_driver/component.cmake
 new file mode 100644
-index 0000000..77a5a50
+index 00000000..77a5a50b
 --- /dev/null
 +++ b/platform/drivers/arm/mhu_driver/component.cmake
 @@ -0,0 +1,12 @@
@@ -61,7 +72,7 @@ index 0000000..77a5a50
 +)
 diff --git a/platform/drivers/arm/mhu_driver/mhu_v2.h b/platform/drivers/arm/mhu_driver/mhu_v2.h
 new file mode 100644
-index 0000000..2e4ba80
+index 00000000..2e4ba80f
 --- /dev/null
 +++ b/platform/drivers/arm/mhu_driver/mhu_v2.h
 @@ -0,0 +1,391 @@
@@ -458,7 +469,7 @@ index 0000000..2e4ba80
 +#endif /* __MHU_V2_X_H__ */
 diff --git a/platform/drivers/arm/mhu_driver/mhu_v2_x.c b/platform/drivers/arm/mhu_driver/mhu_v2_x.c
 new file mode 100644
-index 0000000..01d8f65
+index 00000000..01d8f659
 --- /dev/null
 +++ b/platform/drivers/arm/mhu_driver/mhu_v2_x.c
 @@ -0,0 +1,602 @@
@@ -1066,7 +1077,7 @@ index 0000000..01d8f65
 +}
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platform/providers/arm/corstone1000/platform.cmake
 new file mode 100644
-index 0000000..bb778bb
+index 00000000..bb778bb9
 --- /dev/null
 +++ b/platform/providers/arm/corstone1000/platform.cmake
 @@ -0,0 +1,10 @@
@@ -1080,6 +1091,3 @@ index 0000000..bb778bb
 +
 +# include MHU driver
 +include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0009-Add-openamp-rpc-caller.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0009-Add-openamp-rpc-caller.patch
index bed5ccad..0f3f2c64 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0009-Add-openamp-rpc-caller.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0009-Add-openamp-rpc-caller.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 57b6e8dab4de03998023404910e3a30c16860bec Mon Sep 17 00:00:00 2001
+From a6721cc391397f5f999db84e4ebec4c20985996a Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:00:54 +0000
 Subject: [PATCH] Add openamp rpc caller
@@ -9,10 +6,33 @@ Subject: [PATCH] Add openamp rpc caller
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-%% original patch: 0009-Add-openamp-rpc-caller.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ components/rpc/common/caller/rpc_caller.c     |  10 +
+ components/rpc/common/interface/rpc_caller.h  |   8 +
+ .../rpc/openamp/caller/sp/component.cmake     |  15 +
+ .../rpc/openamp/caller/sp/openamp_caller.c    | 203 +++++++
+ .../rpc/openamp/caller/sp/openamp_caller.h    |  43 ++
+ .../rpc/openamp/caller/sp/openamp_mhu.c       | 191 ++++++
+ .../rpc/openamp/caller/sp/openamp_mhu.h       |  19 +
+ .../rpc/openamp/caller/sp/openamp_virtio.c    | 554 ++++++++++++++++++
+ .../rpc/openamp/caller/sp/openamp_virtio.h    |  24 +
+ deployments/se-proxy/opteesp/CMakeLists.txt   |   1 +
+ .../se-proxy/opteesp/default_se-proxy.dts.in  |   6 +
+ 11 files changed, 1074 insertions(+)
+ create mode 100644 components/rpc/openamp/caller/sp/component.cmake
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_caller.c
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_caller.h
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_mhu.c
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_mhu.h
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_virtio.c
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_virtio.h
 
 diff --git a/components/rpc/common/caller/rpc_caller.c b/components/rpc/common/caller/rpc_caller.c
-index 2dceabe..20d889c 100644
+index 2dceabeb..20d889c1 100644
 --- a/components/rpc/common/caller/rpc_caller.c
 +++ b/components/rpc/common/caller/rpc_caller.c
 @@ -37,3 +37,13 @@ void rpc_caller_end(struct rpc_caller *s, rpc_call_handle handle)
@@ -30,7 +50,7 @@ index 2dceabe..20d889c 100644
 +	return s->phys_to_virt(s->context, pa);
 +}
 diff --git a/components/rpc/common/interface/rpc_caller.h b/components/rpc/common/interface/rpc_caller.h
-index 387489c..ef9bb64 100644
+index 387489cd..ef9bb649 100644
 --- a/components/rpc/common/interface/rpc_caller.h
 +++ b/components/rpc/common/interface/rpc_caller.h
 @@ -45,6 +45,10 @@ struct rpc_caller
@@ -57,7 +77,7 @@ index 387489c..ef9bb64 100644
  #endif
 diff --git a/components/rpc/openamp/caller/sp/component.cmake b/components/rpc/openamp/caller/sp/component.cmake
 new file mode 100644
-index 0000000..fc91952
+index 00000000..fc919529
 --- /dev/null
 +++ b/components/rpc/openamp/caller/sp/component.cmake
 @@ -0,0 +1,15 @@
@@ -78,7 +98,7 @@ index 0000000..fc91952
 +	)
 diff --git a/components/rpc/openamp/caller/sp/openamp_caller.c b/components/rpc/openamp/caller/sp/openamp_caller.c
 new file mode 100644
-index 0000000..6cdfb75
+index 00000000..6cdfb756
 --- /dev/null
 +++ b/components/rpc/openamp/caller/sp/openamp_caller.c
 @@ -0,0 +1,203 @@
@@ -287,7 +307,7 @@ index 0000000..6cdfb75
 +}
 diff --git a/components/rpc/openamp/caller/sp/openamp_caller.h b/components/rpc/openamp/caller/sp/openamp_caller.h
 new file mode 100644
-index 0000000..3fb67c5
+index 00000000..3fb67c56
 --- /dev/null
 +++ b/components/rpc/openamp/caller/sp/openamp_caller.h
 @@ -0,0 +1,43 @@
@@ -336,7 +356,7 @@ index 0000000..3fb67c5
 +#endif
 diff --git a/components/rpc/openamp/caller/sp/openamp_mhu.c b/components/rpc/openamp/caller/sp/openamp_mhu.c
 new file mode 100644
-index 0000000..ffdadaf
+index 00000000..ffdadaf8
 --- /dev/null
 +++ b/components/rpc/openamp/caller/sp/openamp_mhu.c
 @@ -0,0 +1,191 @@
@@ -533,7 +553,7 @@ index 0000000..ffdadaf
 +}
 diff --git a/components/rpc/openamp/caller/sp/openamp_mhu.h b/components/rpc/openamp/caller/sp/openamp_mhu.h
 new file mode 100644
-index 0000000..2ae5cb8
+index 00000000..2ae5cb8e
 --- /dev/null
 +++ b/components/rpc/openamp/caller/sp/openamp_mhu.h
 @@ -0,0 +1,19 @@
@@ -558,7 +578,7 @@ index 0000000..2ae5cb8
 +#endif
 diff --git a/components/rpc/openamp/caller/sp/openamp_virtio.c b/components/rpc/openamp/caller/sp/openamp_virtio.c
 new file mode 100644
-index 0000000..06e0735
+index 00000000..06e0735b
 --- /dev/null
 +++ b/components/rpc/openamp/caller/sp/openamp_virtio.c
 @@ -0,0 +1,554 @@
@@ -1118,7 +1138,7 @@ index 0000000..06e0735
 +}
 diff --git a/components/rpc/openamp/caller/sp/openamp_virtio.h b/components/rpc/openamp/caller/sp/openamp_virtio.h
 new file mode 100644
-index 0000000..915128f
+index 00000000..915128ff
 --- /dev/null
 +++ b/components/rpc/openamp/caller/sp/openamp_virtio.h
 @@ -0,0 +1,24 @@
@@ -1147,7 +1167,7 @@ index 0000000..915128f
 +
 +#endif
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index 248bd7e..1511bba 100644
+index 248bd7e3..1511bbad 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
 @@ -75,6 +75,7 @@ add_components(TARGET "se-proxy"
@@ -1159,7 +1179,7 @@ index 248bd7e..1511bba 100644
  		# Stub service provider backends
  		"components/rpc/dummy"
 diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-index f351a59..55d49b3 100644
+index f351a592..55d49b31 100644
 --- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
 +++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
 @@ -32,6 +32,12 @@
@@ -1175,6 +1195,3 @@ index f351a59..55d49b3 100644
  		};
  	};
  };
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0010-add-psa-client-definitions-for-ff-m.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0010-add-psa-client-definitions-for-ff-m.patch
index 95b2ae77..f41556a3 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0010-add-psa-client-definitions-for-ff-m.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0010-add-psa-client-definitions-for-ff-m.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 0f32eaab3c1c5ef534139474b0453916bc4d8b63 Mon Sep 17 00:00:00 2001
+From 791a1302d7b779f3aeee7d6f7c9fac00b4244c1b Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:05:18 +0000
 Subject: [PATCH] add psa client definitions for ff-m
@@ -12,11 +9,20 @@ ff-m support.
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-%% original patch: 0010-add-psa-client-definitions-for-ff-m.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../service/common/include/psa/client.h       | 194 ++++++++++++++++++
+ components/service/common/include/psa/sid.h   |  71 +++++++
+ 2 files changed, 265 insertions(+)
+ create mode 100644 components/service/common/include/psa/client.h
+ create mode 100644 components/service/common/include/psa/sid.h
 
 diff --git a/components/service/common/include/psa/client.h b/components/service/common/include/psa/client.h
 new file mode 100644
-index 0000000..69ccf14
+index 00000000..69ccf14f
 --- /dev/null
 +++ b/components/service/common/include/psa/client.h
 @@ -0,0 +1,194 @@
@@ -216,7 +222,7 @@ index 0000000..69ccf14
 +
 diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
 new file mode 100644
-index 0000000..aaa973c
+index 00000000..aaa973c6
 --- /dev/null
 +++ b/components/service/common/include/psa/sid.h
 @@ -0,0 +1,71 @@
@@ -291,6 +297,3 @@ index 0000000..aaa973c
 +#endif
 +
 +#endif /* __PSA_MANIFEST_SID_H__ */
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0011-Add-common-service-component-to-ipc-support.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0011-Add-common-service-component-to-ipc-support.patch
index 1cbff68e..7ecb60f0 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0011-Add-common-service-component-to-ipc-support.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0011-Add-common-service-component-to-ipc-support.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From f08ec4e601e70669aafeb712d7c521cc07fd0c77 Mon Sep 17 00:00:00 2001
+From b7e9e6fc59263f5daf4ae79eb758fa7647058338 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:13:03 +0000
 Subject: [PATCH] Add common service component to ipc support
@@ -11,11 +8,23 @@ including, the openamp client side structures lib.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 
-%% original patch: 0011-Add-common-service-component-to-ipc-support.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../service/common/psa_ipc/component.cmake    |  13 ++
+ .../service/common/psa_ipc/service_psa_ipc.c  |  97 +++++++++++++
+ .../psa_ipc/service_psa_ipc_openamp_lib.h     | 131 ++++++++++++++++++
+ deployments/se-proxy/opteesp/CMakeLists.txt   |   1 +
+ 4 files changed, 242 insertions(+)
+ create mode 100644 components/service/common/psa_ipc/component.cmake
+ create mode 100644 components/service/common/psa_ipc/service_psa_ipc.c
+ create mode 100644 components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
 
 diff --git a/components/service/common/psa_ipc/component.cmake b/components/service/common/psa_ipc/component.cmake
 new file mode 100644
-index 0000000..5a1c9e6
+index 00000000..5a1c9e62
 --- /dev/null
 +++ b/components/service/common/psa_ipc/component.cmake
 @@ -0,0 +1,13 @@
@@ -34,7 +43,7 @@ index 0000000..5a1c9e6
 +	)
 diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
 new file mode 100644
-index 0000000..e8093c2
+index 00000000..e8093c20
 --- /dev/null
 +++ b/components/service/common/psa_ipc/service_psa_ipc.c
 @@ -0,0 +1,97 @@
@@ -137,7 +146,7 @@ index 0000000..e8093c2
 +}
 diff --git a/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
 new file mode 100644
-index 0000000..33ea966
+index 00000000..33ea9666
 --- /dev/null
 +++ b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
 @@ -0,0 +1,131 @@
@@ -273,7 +282,7 @@ index 0000000..33ea966
 +
 +
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index 1511bba..e0e0e12 100644
+index 1511bbad..e0e0e12b 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
 @@ -54,6 +54,7 @@ add_components(TARGET "se-proxy"
@@ -284,6 +293,3 @@ index 1511bba..e0e0e12 100644
  		"components/service/common/provider"
  		"components/service/discovery/provider"
  		"components/service/discovery/provider/serializer/packed-c"
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0012-Add-secure-storage-ipc-backend.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0012-Add-secure-storage-ipc-backend.patch
index acf98266..068468b8 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0012-Add-secure-storage-ipc-backend.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0012-Add-secure-storage-ipc-backend.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 318f0dda8d258f0184a4d8650045e02be02afce2 Mon Sep 17 00:00:00 2001
+From 962056a9c8115e9228719d46b09da983678ab024 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:19:24 +0000
 Subject: [PATCH] Add secure storage ipc backend
@@ -11,10 +8,23 @@ openamp as rpc to communicate with other processor.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 
-%% original patch: 0012-Add-secure-storage-ipc-backend.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../service/common/psa_ipc/service_psa_ipc.c  | 143 +++++++++++-
+ .../secure_storage_ipc/component.cmake        |  14 ++
+ .../secure_storage_ipc/secure_storage_ipc.c   | 214 ++++++++++++++++++
+ .../secure_storage_ipc/secure_storage_ipc.h   |  52 +++++
+ deployments/se-proxy/opteesp/CMakeLists.txt   |   1 +
+ 5 files changed, 420 insertions(+), 4 deletions(-)
+ create mode 100644 components/service/secure_storage/backend/secure_storage_ipc/component.cmake
+ create mode 100644 components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+ create mode 100644 components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
 
 diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
-index e8093c2..95a07c1 100644
+index e8093c20..95a07c13 100644
 --- a/components/service/common/psa_ipc/service_psa_ipc.c
 +++ b/components/service/common/psa_ipc/service_psa_ipc.c
 @@ -16,6 +16,52 @@
@@ -203,7 +213,7 @@ index e8093c2..95a07c1 100644
  				&resp_len);
 diff --git a/components/service/secure_storage/backend/secure_storage_ipc/component.cmake b/components/service/secure_storage/backend/secure_storage_ipc/component.cmake
 new file mode 100644
-index 0000000..5d8f671
+index 00000000..5d8f6714
 --- /dev/null
 +++ b/components/service/secure_storage/backend/secure_storage_ipc/component.cmake
 @@ -0,0 +1,14 @@
@@ -223,7 +233,7 @@ index 0000000..5d8f671
 +
 diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
 new file mode 100644
-index 0000000..9b55f77
+index 00000000..9b55f77d
 --- /dev/null
 +++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
 @@ -0,0 +1,214 @@
@@ -443,7 +453,7 @@ index 0000000..9b55f77
 +}
 diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
 new file mode 100644
-index 0000000..e8c1e8f
+index 00000000..e8c1e8fd
 --- /dev/null
 +++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
 @@ -0,0 +1,52 @@
@@ -500,7 +510,7 @@ index 0000000..e8c1e8f
 +
 +#endif /* SECURE_STORAGE_IPC_H */
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index e0e0e12..663177b 100644
+index e0e0e12b..663177b7 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
 @@ -73,6 +73,7 @@ add_components(TARGET "se-proxy"
@@ -511,6 +521,3 @@ index e0e0e12..663177b 100644
  		"components/service/attestation/include"
  		"components/service/attestation/provider"
  		"components/service/attestation/provider/serializer/packed-c"
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
index fe7112c5..56964b5c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From b8588aaefaef19ddd33abf57190501dc0d624587 Mon Sep 17 00:00:00 2001
+From 12b8b8bb28c96e6f121122939b7d23e6c7055f0f Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:25:34 +0000
 Subject: [PATCH] Use secure storage ipc and openamp for se_proxy
@@ -12,10 +9,16 @@ openamp as rpc to secure enclave side.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 
-%% original patch: 0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../se-proxy/opteesp/service_proxy_factory.c     | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
 
 diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/deployments/se-proxy/opteesp/service_proxy_factory.c
-index acfb6e8..5729005 100644
+index acfb6e88..57290056 100644
 --- a/deployments/se-proxy/opteesp/service_proxy_factory.c
 +++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
 @@ -6,15 +6,20 @@
@@ -58,6 +61,3 @@ index acfb6e8..5729005 100644
  
  	return secure_storage_provider_init(&ps_provider, backend);
  }
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0014-Add-uefi-variable-append-write-support.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0014-Add-uefi-variable-append-write-support.patch
index e4e29b61..cf7357e8 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0014-Add-uefi-variable-append-write-support.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0014-Add-uefi-variable-append-write-support.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 355fc5189657ef9db94fc5329544e8c65e65a1bf Mon Sep 17 00:00:00 2001
+From 254f564c76320478e7b509faf279c0c493470657 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Thu, 2 Dec 2021 10:15:54 +0000
 Subject: [PATCH] Add uefi variable append write support
@@ -13,8 +10,24 @@ attribute.
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: I7a6562327bc0a5ce5cd0e85276325227b83e9f9e
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../backend/test/variable_index_tests.cpp     |  90 +++---
+ .../backend/test/variable_store_tests.cpp     |  40 ++-
+ .../backend/uefi_variable_store.c             | 263 +++++++++++-------
+ .../smm_variable/backend/variable_index.c     |  95 +++----
+ .../smm_variable/backend/variable_index.h     |  58 ++--
+ .../backend/variable_index_iterator.c         |   4 +-
+ .../backend/variable_index_iterator.h         |   2 +-
+ .../service/smm_variable_service_tests.cpp    |  48 ++++
+ protocols/service/smm_variable/parameters.h   |   3 +
+ 9 files changed, 364 insertions(+), 239 deletions(-)
+
 diff --git a/components/service/smm_variable/backend/test/variable_index_tests.cpp b/components/service/smm_variable/backend/test/variable_index_tests.cpp
-index c8bacf9..8edc0e7 100644
+index c8bacf97..8edc0e70 100644
 --- a/components/service/smm_variable/backend/test/variable_index_tests.cpp
 +++ b/components/service/smm_variable/backend/test/variable_index_tests.cpp
 @@ -69,34 +69,37 @@ TEST_GROUP(UefiVariableIndexTests)
@@ -283,7 +296,7 @@ index c8bacf9..8edc0e7 100644
  	CHECK_TRUE(info->is_variable_set);
  	CHECK_TRUE(info->is_constraints_set);
 diff --git a/components/service/smm_variable/backend/test/variable_store_tests.cpp b/components/service/smm_variable/backend/test/variable_store_tests.cpp
-index f6aba13..578f118 100644
+index f6aba13a..578f118f 100644
 --- a/components/service/smm_variable/backend/test/variable_store_tests.cpp
 +++ b/components/service/smm_variable/backend/test/variable_store_tests.cpp
 @@ -250,6 +250,21 @@ TEST(UefiVariableStoreTests, setGetRoundtrip)
@@ -362,7 +375,7 @@ index f6aba13..578f118 100644
  
  	/* Expect variable to no loger exist */
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index b7091d7..bcb8599 100644
+index b7091d75..bcb85995 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/smm_variable/backend/uefi_variable_store.c
 @@ -46,6 +46,13 @@ static efi_status_t load_variable_data(
@@ -751,7 +764,7 @@ index b7091d7..bcb8599 100644
  			}
  		}
 diff --git a/components/service/smm_variable/backend/variable_index.c b/components/service/smm_variable/backend/variable_index.c
-index 99d7c97..a8a5575 100644
+index 99d7c97a..a8a55753 100644
 --- a/components/service/smm_variable/backend/variable_index.c
 +++ b/components/service/smm_variable/backend/variable_index.c
 @@ -132,13 +132,13 @@ size_t variable_index_max_dump_size(
@@ -918,7 +931,7 @@ index 99d7c97..a8a5575 100644
  }
  
 diff --git a/components/service/smm_variable/backend/variable_index.h b/components/service/smm_variable/backend/variable_index.h
-index e109d0d..63f42ab 100644
+index e109d0d1..63f42ab6 100644
 --- a/components/service/smm_variable/backend/variable_index.h
 +++ b/components/service/smm_variable/backend/variable_index.h
 @@ -119,8 +119,8 @@ size_t variable_index_max_dump_size(
@@ -1038,7 +1051,7 @@ index e109d0d..63f42ab 100644
  
  /**
 diff --git a/components/service/smm_variable/backend/variable_index_iterator.c b/components/service/smm_variable/backend/variable_index_iterator.c
-index 7cc6dc7..8f8fc74 100644
+index 7cc6dc7a..8f8fc741 100644
 --- a/components/service/smm_variable/backend/variable_index_iterator.c
 +++ b/components/service/smm_variable/backend/variable_index_iterator.c
 @@ -31,10 +31,10 @@ bool variable_index_iterator_is_done(
@@ -1055,7 +1068,7 @@ index 7cc6dc7..8f8fc74 100644
  	if (!variable_index_iterator_is_done(iter)) {
  
 diff --git a/components/service/smm_variable/backend/variable_index_iterator.h b/components/service/smm_variable/backend/variable_index_iterator.h
-index f64a2c4..7ff77c5 100644
+index f64a2c49..7ff77c50 100644
 --- a/components/service/smm_variable/backend/variable_index_iterator.h
 +++ b/components/service/smm_variable/backend/variable_index_iterator.h
 @@ -54,7 +54,7 @@ bool variable_index_iterator_is_done(
@@ -1068,7 +1081,7 @@ index f64a2c4..7ff77c5 100644
  
  /**
 diff --git a/components/service/smm_variable/test/service/smm_variable_service_tests.cpp b/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
-index d76d9cc..088940a 100644
+index d76d9cce..088940a8 100644
 --- a/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
 +++ b/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
 @@ -249,6 +249,30 @@ TEST(SmmVariableServiceTests, setAndGet)
@@ -1134,7 +1147,7 @@ index d76d9cc..088940a 100644
  	efi_status = m_client->remove_variable(m_common_guid, var_name);
  	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
 diff --git a/protocols/service/smm_variable/parameters.h b/protocols/service/smm_variable/parameters.h
-index 1f795a9..233f301 100644
+index 1f795a9b..233f301b 100644
 --- a/protocols/service/smm_variable/parameters.h
 +++ b/protocols/service/smm_variable/parameters.h
 @@ -47,6 +47,9 @@ typedef struct {
@@ -1147,6 +1160,3 @@ index 1f795a9..233f301 100644
  
  /**
   * Parameter structure for SetVariable and GetVariable.
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
index 76493895..978600dd 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 7cc8eaa66c6ecfd66a27317efd9b03725564a43a Mon Sep 17 00:00:00 2001
+From c4eaf83548eed4ed6194ff9e1368d6ae65f4ebf9 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Thu, 2 Dec 2021 17:27:55 +0000
 Subject: [PATCH] Add UEFI variable support for QueryVariableInfo
@@ -16,8 +13,22 @@ storage backend storage providers.
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: I971252831f7e478914d736c672d184a371e64502
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../backend/test/variable_store_tests.cpp     |  89 +++++++-
+ .../backend/uefi_variable_store.c             | 213 ++++++++++++++----
+ .../backend/uefi_variable_store.h             |  39 +++-
+ .../client/cpp/smm_variable_client.cpp        |  66 ++++++
+ .../client/cpp/smm_variable_client.h          |   7 +
+ .../provider/smm_variable_provider.c          |  31 ++-
+ .../service/smm_variable_service_tests.cpp    |  55 ++++-
+ 7 files changed, 445 insertions(+), 55 deletions(-)
+
 diff --git a/components/service/smm_variable/backend/test/variable_store_tests.cpp b/components/service/smm_variable/backend/test/variable_store_tests.cpp
-index 578f118..e90c106 100644
+index 578f118f..e90c1067 100644
 --- a/components/service/smm_variable/backend/test/variable_store_tests.cpp
 +++ b/components/service/smm_variable/backend/test/variable_store_tests.cpp
 @@ -27,6 +27,18 @@ TEST_GROUP(UefiVariableStoreTests)
@@ -155,7 +166,7 @@ index 578f118..e90c106 100644
  
  TEST(UefiVariableStoreTests, removeVolatile)
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index bcb8599..ed50eaf 100644
+index bcb85995..ed50eaf9 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/smm_variable/backend/uefi_variable_store.c
 @@ -46,8 +46,15 @@ static efi_status_t load_variable_data(
@@ -524,7 +535,7 @@ index bcb8599..ed50eaf 100644
  	psa_status_t psa_status)
  {
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.h b/components/service/smm_variable/backend/uefi_variable_store.h
-index fe0f24a..cc99206 100644
+index fe0f24af..cc992067 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.h
 +++ b/components/service/smm_variable/backend/uefi_variable_store.h
 @@ -20,6 +20,20 @@
@@ -600,7 +611,7 @@ index fe0f24a..cc99206 100644
  /**
   * @brief      Exit boot service
 diff --git a/components/service/smm_variable/client/cpp/smm_variable_client.cpp b/components/service/smm_variable/client/cpp/smm_variable_client.cpp
-index a68b7ac..8438285 100644
+index a68b7ace..8438285b 100644
 --- a/components/service/smm_variable/client/cpp/smm_variable_client.cpp
 +++ b/components/service/smm_variable/client/cpp/smm_variable_client.cpp
 @@ -219,6 +219,72 @@ efi_status_t smm_variable_client::get_next_variable_name(
@@ -677,7 +688,7 @@ index a68b7ac..8438285 100644
  	EFI_GUID &guid,
  	std::wstring &name,
 diff --git a/components/service/smm_variable/client/cpp/smm_variable_client.h b/components/service/smm_variable/client/cpp/smm_variable_client.h
-index 9c36c4e..c797391 100644
+index 9c36c4eb..c7973916 100644
 --- a/components/service/smm_variable/client/cpp/smm_variable_client.h
 +++ b/components/service/smm_variable/client/cpp/smm_variable_client.h
 @@ -63,6 +63,13 @@ public:
@@ -695,7 +706,7 @@ index 9c36c4e..c797391 100644
  	efi_status_t get_next_variable_name(
  		EFI_GUID &guid,
 diff --git a/components/service/smm_variable/provider/smm_variable_provider.c b/components/service/smm_variable/provider/smm_variable_provider.c
-index d239a42..52e68d0 100644
+index d239a428..52e68d09 100644
 --- a/components/service/smm_variable/provider/smm_variable_provider.c
 +++ b/components/service/smm_variable/provider/smm_variable_provider.c
 @@ -252,11 +252,38 @@ static rpc_status_t set_variable_handler(void *context, struct call_req* req)
@@ -740,7 +751,7 @@ index d239a42..52e68d0 100644
  
  static rpc_status_t exit_boot_service_handler(void *context, struct call_req* req)
 diff --git a/components/service/smm_variable/test/service/smm_variable_service_tests.cpp b/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
-index 088940a..15556e9 100644
+index 088940a8..15556e9d 100644
 --- a/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
 +++ b/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
 @@ -335,12 +335,38 @@ TEST(SmmVariableServiceTests, setAndGetNv)
@@ -817,6 +828,3 @@ index 088940a..15556e9 100644
  	/* Enumerate store contents - expect the values we added */
  	std::wstring var_name;
  	EFI_GUID guid = {0};
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0016-Add-uefi-test-deployment.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0016-Add-uefi-test-deployment.patch
index 9bc8f8a6..66a4499e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0016-Add-uefi-test-deployment.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0016-Add-uefi-test-deployment.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 409e2c5eeb4999852acbe22da346f018e30f15c0 Mon Sep 17 00:00:00 2001
+From 22120b4bd64da232e5a4e04a9a15376f34a933a3 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Mon, 6 Dec 2021 15:20:12 +0000
 Subject: [PATCH] Add uefi-test deployment
@@ -13,8 +10,23 @@ or any other similar secure-world uefi service provider.
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: Ic0e16dff51ef76ddd1f4dea37a4a55b029edd696
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../ts-service-test/arm-linux/CMakeLists.txt  |  3 -
+ .../uefi-test/arm-linux/CMakeLists.txt        | 43 +++++++++++
+ deployments/uefi-test/linux-pc/CMakeLists.txt | 76 +++++++++++++++++++
+ deployments/uefi-test/uefi-test.cmake         | 52 +++++++++++++
+ tools/b-test/test_data.yaml                   | 10 +++
+ 5 files changed, 181 insertions(+), 3 deletions(-)
+ create mode 100644 deployments/uefi-test/arm-linux/CMakeLists.txt
+ create mode 100644 deployments/uefi-test/linux-pc/CMakeLists.txt
+ create mode 100644 deployments/uefi-test/uefi-test.cmake
+
 diff --git a/deployments/ts-service-test/arm-linux/CMakeLists.txt b/deployments/ts-service-test/arm-linux/CMakeLists.txt
-index 6a01d38..e902cd2 100644
+index 6a01d38a..e902cd2f 100644
 --- a/deployments/ts-service-test/arm-linux/CMakeLists.txt
 +++ b/deployments/ts-service-test/arm-linux/CMakeLists.txt
 @@ -23,9 +23,6 @@ add_components(
@@ -29,7 +41,7 @@ index 6a01d38..e902cd2 100644
  include(${TS_ROOT}/external/CppUTest/CppUTest.cmake)
 diff --git a/deployments/uefi-test/arm-linux/CMakeLists.txt b/deployments/uefi-test/arm-linux/CMakeLists.txt
 new file mode 100644
-index 0000000..053041a
+index 00000000..053041ad
 --- /dev/null
 +++ b/deployments/uefi-test/arm-linux/CMakeLists.txt
 @@ -0,0 +1,43 @@
@@ -78,7 +90,7 @@ index 0000000..053041a
 +target_link_libraries(uefi-test PRIVATE stdc++ gcc m)
 diff --git a/deployments/uefi-test/linux-pc/CMakeLists.txt b/deployments/uefi-test/linux-pc/CMakeLists.txt
 new file mode 100644
-index 0000000..be6e984
+index 00000000..be6e9840
 --- /dev/null
 +++ b/deployments/uefi-test/linux-pc/CMakeLists.txt
 @@ -0,0 +1,76 @@
@@ -160,7 +172,7 @@ index 0000000..be6e984
 +include(../uefi-test.cmake REQUIRED)
 diff --git a/deployments/uefi-test/uefi-test.cmake b/deployments/uefi-test/uefi-test.cmake
 new file mode 100644
-index 0000000..ea678d0
+index 00000000..ea678d0e
 --- /dev/null
 +++ b/deployments/uefi-test/uefi-test.cmake
 @@ -0,0 +1,52 @@
@@ -217,7 +229,7 @@ index 0000000..ea678d0
 +endif()
 +install(TARGETS uefi-test RUNTIME DESTINATION ${TS_ENV}/bin)
 diff --git a/tools/b-test/test_data.yaml b/tools/b-test/test_data.yaml
-index 11f8f63..33a85b1 100644
+index 11f8f633..33a85b12 100644
 --- a/tools/b-test/test_data.yaml
 +++ b/tools/b-test/test_data.yaml
 @@ -163,3 +163,13 @@ data:
@@ -234,6 +246,3 @@ index 11f8f63..33a85b1 100644
 +      os_id : "GNU/Linux"
 +      params:
 +          - "-GUnix Makefiles"
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch
index f0243618..9ad506b1 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 5ea2bdc34efcbbd235091341027d86fd8d9ffb16 Mon Sep 17 00:00:00 2001
+From 289bec4cacac80cb43c19e4ca7b2c50fc932712e Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Wed, 8 Dec 2021 11:48:28 +0000
 Subject: [PATCH] Fix interface ID parameter setting in sp/ffarpc_caller
@@ -13,8 +10,16 @@ This change fixes this issue.
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: Iab520e4c7dc63ee1f5d3bf1bd1de702e4cc6f093
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ components/rpc/ffarpc/caller/sp/ffarpc_caller.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/components/rpc/ffarpc/caller/sp/ffarpc_caller.c b/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
-index 250b178..dabcd90 100644
+index 250b1781..dabcd90c 100644
 --- a/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
 +++ b/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
 @@ -81,7 +81,7 @@ static rpc_status_t call_invoke(void *context, rpc_call_handle handle, uint32_t
@@ -26,6 +31,3 @@ index 250b178..dabcd90 100644
  	//TODO: downcast problem?
  	req.args[SP_CALL_ARGS_REQ_DATA_LEN] = (uint32_t)this_context->req_len;
  	req.args[SP_CALL_ARGS_ENCODING] = this_context->rpc_caller.encoding;
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch
index 0ecbdfaa..6ea473b0 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From e3891ecaaa754eab74166bacea19f25dce060451 Mon Sep 17 00:00:00 2001
+From 18b20dea7cf7e8afc26c5d49d5368d3180bd54d7 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Wed, 8 Dec 2021 16:05:22 +0000
 Subject: [PATCH] Support FFARPC call requests with no shared buffer
@@ -14,8 +11,16 @@ when no shared buffer exists, as long as there is no request data.
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: I83b1bfb719a005922d6394887492d2d272b74907
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../rpc/ffarpc/endpoint/ffarpc_call_ep.c      | 52 ++++++++++---------
+ 1 file changed, 27 insertions(+), 25 deletions(-)
+
 diff --git a/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c b/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
-index 17f957c..a08a250 100644
+index 17f957c2..a08a250c 100644
 --- a/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
 +++ b/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
 @@ -150,29 +150,43 @@ out:
@@ -102,6 +107,3 @@ index 17f957c..a08a250 100644
 +		handle_service_msg(call_ep, source_id, req_args, resp_args);
  	}
  }
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0019-Run-psa-arch-test.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0019-Run-psa-arch-test.patch
index f471d333..4f542158 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0019-Run-psa-arch-test.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0019-Run-psa-arch-test.patch
@@ -1,14 +1,16 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-From 0059e7e18bff28a29c4f8a043d7f3d6d2b98ba7f Mon Sep 17 00:00:00 2001
+From a496978dcf82494c69e600f65adf061f15e565f4 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Sun, 12 Dec 2021 10:43:48 +0000
-Subject: [PATCH 1/5] Run psa-arch-test
+Subject: [PATCH] Run psa-arch-test
 
 Fixes needed to run psa-arch-test
 
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+
 ---
  components/service/common/psa_ipc/service_psa_ipc.c       | 1 +
  .../backend/secure_storage_ipc/secure_storage_ipc.c       | 8 --------
@@ -17,7 +19,7 @@ Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
  4 files changed, 4 insertions(+), 11 deletions(-)
 
 diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
-index 95a07c1..5e5815d 100644
+index 95a07c13..5e5815db 100644
 --- a/components/service/common/psa_ipc/service_psa_ipc.c
 +++ b/components/service/common/psa_ipc/service_psa_ipc.c
 @@ -185,6 +185,7 @@ psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t psa_handle,
@@ -29,7 +31,7 @@ index 95a07c1..5e5815d 100644
  		       out_vec[i].len);
  	}
 diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
-index 9b55f77..a1f369d 100644
+index 9b55f77d..a1f369db 100644
 --- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
 +++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
 @@ -31,10 +31,6 @@ static psa_status_t secure_storage_ipc_set(void *context, uint32_t client_id,
@@ -55,7 +57,7 @@ index 9b55f77..a1f369d 100644
  			      TFM_PS_GET_INFO, in_vec,
  			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
 diff --git a/components/service/secure_storage/include/psa/storage_common.h b/components/service/secure_storage/include/psa/storage_common.h
-index 4f6ba2a..1fd6b40 100644
+index 4f6ba2a7..1fd6b40d 100644
 --- a/components/service/secure_storage/include/psa/storage_common.h
 +++ b/components/service/secure_storage/include/psa/storage_common.h
 @@ -20,8 +20,8 @@ typedef uint64_t psa_storage_uid_t;
@@ -70,7 +72,7 @@ index 4f6ba2a..1fd6b40 100644
  };
  
 diff --git a/external/openamp/openamp.cmake b/external/openamp/openamp.cmake
-index aae13ba..75ab229 100644
+index aae13bad..75ab2290 100644
 --- a/external/openamp/openamp.cmake
 +++ b/external/openamp/openamp.cmake
 @@ -61,7 +61,7 @@ execute_process(COMMAND
@@ -82,6 +84,3 @@ index aae13ba..75ab229 100644
  			${openamp_SOURCE_DIR}
  	WORKING_DIRECTORY
  			${openamp_BINARY_DIR}
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0020-Use-address-instead-of-pointers.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0020-Use-address-instead-of-pointers.patch
index 92d39c51..844bca3c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0020-Use-address-instead-of-pointers.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0020-Use-address-instead-of-pointers.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-From 1974cdc2a0a4f3395131570d4080ffc1ddde4990 Mon Sep 17 00:00:00 2001
+From b417c1124af9d4569ba8871dfd1e43e626dddf12 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Sun, 12 Dec 2021 10:57:17 +0000
-Subject: [PATCH 2/5] Use address instead of pointers
+Subject: [PATCH] Use address instead of pointers
 
 Since secure enclave is 32bit and we 64bit there is an issue
 in the protocol communication design that force us to handle
@@ -13,6 +10,11 @@ this work.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+
 ---
  .../service/common/include/psa/client.h       | 15 ++++++++++++++
  .../service/common/psa_ipc/service_psa_ipc.c  | 20 ++++++++++++-------
@@ -20,7 +22,7 @@ Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
  3 files changed, 38 insertions(+), 17 deletions(-)
 
 diff --git a/components/service/common/include/psa/client.h b/components/service/common/include/psa/client.h
-index 69ccf14..12dcd68 100644
+index 69ccf14f..12dcd68f 100644
 --- a/components/service/common/include/psa/client.h
 +++ b/components/service/common/include/psa/client.h
 @@ -81,6 +81,21 @@ struct __attribute__ ((__packed__)) psa_outvec {
@@ -46,7 +48,7 @@ index 69ccf14..12dcd68 100644
  
  /**
 diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
-index 5e5815d..435c6c0 100644
+index 5e5815db..435c6c0a 100644
 --- a/components/service/common/psa_ipc/service_psa_ipc.c
 +++ b/components/service/common/psa_ipc/service_psa_ipc.c
 @@ -62,6 +62,11 @@ static size_t psa_call_out_vec_len(const struct psa_outvec *out_vec, size_t out_
@@ -103,7 +105,7 @@ index 5e5815d..435c6c0 100644
  	}
  
 diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
-index a1f369d..bda442a 100644
+index a1f369db..bda442a6 100644
 --- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
 +++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
 @@ -22,9 +22,9 @@ static psa_status_t secure_storage_ipc_set(void *context, uint32_t client_id,
@@ -165,6 +167,3 @@ index a1f369d..bda442a 100644
  	};
  
  	(void)client_id;
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0021-Add-psa-ipc-attestation-to-se-proxy.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0021-Add-psa-ipc-attestation-to-se-proxy.patch
index 23b38dae..5376bb22 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0021-Add-psa-ipc-attestation-to-se-proxy.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0021-Add-psa-ipc-attestation-to-se-proxy.patch
@@ -1,16 +1,18 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-
-From 20bab8442387480d77cf5d7c8271758acf9ed181 Mon Sep 17 00:00:00 2001
+From 259300dc81b95ff65cd2e95e0fecd140d76e4b5e Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 7 Dec 2021 11:50:00 +0000
-Subject: [PATCH 3/5] Add psa ipc attestation to se proxy
+Subject: [PATCH] Add psa ipc attestation to se proxy
 
 Implement attestation client API as psa ipc and include it to
 se proxy deployment.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
+
 ---
  .../client/psa_ipc/component.cmake            | 13 +++
  .../client/psa_ipc/iat_ipc_client.c           | 86 +++++++++++++++++++
@@ -27,7 +29,7 @@ Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
 
 diff --git a/components/service/attestation/client/psa_ipc/component.cmake b/components/service/attestation/client/psa_ipc/component.cmake
 new file mode 100644
-index 0000000..a5bc6b4
+index 00000000..a5bc6b4a
 --- /dev/null
 +++ b/components/service/attestation/client/psa_ipc/component.cmake
 @@ -0,0 +1,13 @@
@@ -46,7 +48,7 @@ index 0000000..a5bc6b4
 +	)
 diff --git a/components/service/attestation/client/psa_ipc/iat_ipc_client.c b/components/service/attestation/client/psa_ipc/iat_ipc_client.c
 new file mode 100644
-index 0000000..30bd0a1
+index 00000000..30bd0a13
 --- /dev/null
 +++ b/components/service/attestation/client/psa_ipc/iat_ipc_client.c
 @@ -0,0 +1,86 @@
@@ -138,7 +140,7 @@ index 0000000..30bd0a1
 +}
 diff --git a/components/service/attestation/reporter/psa_ipc/component.cmake b/components/service/attestation/reporter/psa_ipc/component.cmake
 new file mode 100644
-index 0000000..b37830c
+index 00000000..b37830c6
 --- /dev/null
 +++ b/components/service/attestation/reporter/psa_ipc/component.cmake
 @@ -0,0 +1,13 @@
@@ -157,7 +159,7 @@ index 0000000..b37830c
 +	)
 diff --git a/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c b/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c
 new file mode 100644
-index 0000000..15805e8
+index 00000000..15805e8e
 --- /dev/null
 +++ b/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c
 @@ -0,0 +1,45 @@
@@ -207,7 +209,7 @@ index 0000000..15805e8
 +	(void)report;
 +}
 diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
-index aaa973c..833f503 100644
+index aaa973c6..833f5039 100644
 --- a/components/service/common/include/psa/sid.h
 +++ b/components/service/common/include/psa/sid.h
 @@ -50,6 +50,10 @@ extern "C" {
@@ -222,7 +224,7 @@ index aaa973c..833f503 100644
  #define TFM_FWU_WRITE_SID                                          (0x000000A0U)
  #define TFM_FWU_WRITE_VERSION                                      (1U)
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index 663177b..af2225e 100644
+index 663177b7..af2225e7 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
 @@ -77,12 +77,13 @@ add_components(TARGET "se-proxy"
@@ -241,7 +243,7 @@ index 663177b..af2225e 100644
  		"components/service/crypto/backend/stub"
  		"components/service/crypto/client/psa"
 diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/deployments/se-proxy/opteesp/service_proxy_factory.c
-index 5729005..4b8ccec 100644
+index 57290056..4b8ccecc 100644
 --- a/deployments/se-proxy/opteesp/service_proxy_factory.c
 +++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
 @@ -23,12 +23,18 @@ struct openamp_caller openamp;
@@ -263,6 +265,3 @@ index 5729005..4b8ccec 100644
  
  	attest_provider_register_serializer(&attest_provider,
  		TS_RPC_ENCODING_PACKED_C, packedc_attest_provider_serializer_instance());
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
index b7151691..aa389d8b 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0022-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
@@ -1,14 +1,16 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-From 53d5b73b84deb7feb4f87f2792f50fc8018ac0d5 Mon Sep 17 00:00:00 2001
+From 90006cecbbba58afee5f51e6bd72f7027a257b5e Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Thu, 9 Dec 2021 14:11:06 +0000
-Subject: [PATCH 4/5] Setup its backend as openamp rpc using secure storage ipc
+Subject: [PATCH] Setup its backend as openamp rpc using secure storage ipc
  implementation.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+
 ---
  components/service/common/include/psa/sid.h   | 12 +++++-----
  .../secure_storage_ipc/secure_storage_ipc.c   | 20 ++++++++---------
@@ -17,7 +19,7 @@ Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
  4 files changed, 32 insertions(+), 23 deletions(-)
 
 diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
-index 833f503..4a951d4 100644
+index 833f5039..4a951d4a 100644
 --- a/components/service/common/include/psa/sid.h
 +++ b/components/service/common/include/psa/sid.h
 @@ -20,12 +20,12 @@ extern "C" {
@@ -40,7 +42,7 @@ index 833f503..4a951d4 100644
  /******** TFM_SP_ITS ********/
  #define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_SID                   (0x00000070U)
 diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
-index bda442a..0e1b48c 100644
+index bda442a6..0e1b48c0 100644
 --- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
 +++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
 @@ -31,8 +31,8 @@ static psa_status_t secure_storage_ipc_set(void *context, uint32_t client_id,
@@ -99,7 +101,7 @@ index bda442a..0e1b48c 100644
  	if (psa_status != PSA_SUCCESS)
  		EMSG("ipc_get_support: failed to psa_call: %d", psa_status);
 diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
-index e8c1e8f..d9949f6 100644
+index e8c1e8fd..d9949f6a 100644
 --- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
 +++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
 @@ -21,6 +21,7 @@ struct secure_storage_ipc
@@ -111,7 +113,7 @@ index e8c1e8f..d9949f6 100644
  
  /**
 diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/deployments/se-proxy/opteesp/service_proxy_factory.c
-index 4b8ccec..1110ac4 100644
+index 4b8ccecc..1110ac46 100644
 --- a/deployments/se-proxy/opteesp/service_proxy_factory.c
 +++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
 @@ -5,6 +5,7 @@
@@ -160,6 +162,3 @@ index 4b8ccec..1110ac4 100644
 + 
 +        return secure_storage_provider_init(&its_provider, backend);
  }
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0023-add-psa-ipc-crypto-backend.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0023-add-psa-ipc-crypto-backend.patch
index 56d125c0..a20a6a48 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0023-add-psa-ipc-crypto-backend.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0023-add-psa-ipc-crypto-backend.patch
@@ -1,16 +1,18 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-
-From deb8fb7a7b214edc095c971f7a439e75b8e428d1 Mon Sep 17 00:00:00 2001
+From 5af98a77887c2aa60bc93dbdddb174e03501b733 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Thu, 9 Dec 2021 14:17:39 +0000
-Subject: [PATCH 5/5] add psa ipc crypto backend
+Subject: [PATCH] add psa ipc crypto backend
 
 Add psa ipc crypto backend and attach it to se proxy
 deployment.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
+
 ---
  components/service/common/include/psa/sid.h   |  73 +++++
  .../crypto/backend/psa_ipc/component.cmake    |  21 ++
@@ -67,7 +69,7 @@ Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
  create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h
 
 diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
-index 4a951d4..7a29cc2 100644
+index 4a951d4a..7a29cc25 100644
 --- a/components/service/common/include/psa/sid.h
 +++ b/components/service/common/include/psa/sid.h
 @@ -37,6 +37,79 @@ extern "C" {
@@ -152,7 +154,7 @@ index 4a951d4..7a29cc2 100644
  #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
 diff --git a/components/service/crypto/backend/psa_ipc/component.cmake b/components/service/crypto/backend/psa_ipc/component.cmake
 new file mode 100644
-index 0000000..93c297a
+index 00000000..93c297a8
 --- /dev/null
 +++ b/components/service/crypto/backend/psa_ipc/component.cmake
 @@ -0,0 +1,21 @@
@@ -179,7 +181,7 @@ index 0000000..93c297a
 +)
 diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c
 new file mode 100644
-index 0000000..e47cd4f
+index 00000000..e47cd4ff
 --- /dev/null
 +++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c
 @@ -0,0 +1,26 @@
@@ -211,7 +213,7 @@ index 0000000..e47cd4f
 +}
 diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
 new file mode 100644
-index 0000000..c13c20e
+index 00000000..c13c20e8
 --- /dev/null
 +++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
 @@ -0,0 +1,70 @@
@@ -287,7 +289,7 @@ index 0000000..c13c20e
 +#endif /* CRYPTO_IPC_BACKEND_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller.h
 new file mode 100644
-index 0000000..0a97218
+index 00000000..0a972187
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller.h
 @@ -0,0 +1,34 @@
@@ -327,7 +329,7 @@ index 0000000..0a97218
 +#endif /* PSA_IPC_CRYPTO_CALLER_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
 new file mode 100644
-index 0000000..78517fe
+index 00000000..78517fe3
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
 @@ -0,0 +1,252 @@
@@ -585,7 +587,7 @@ index 0000000..78517fe
 +#endif /* PSA_IPC_CRYPTO_CALLER_AEAD_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_decrypt.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_decrypt.h
 new file mode 100644
-index 0000000..ff01815
+index 00000000..ff01815c
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_decrypt.h
 @@ -0,0 +1,76 @@
@@ -667,7 +669,7 @@ index 0000000..ff01815
 +#endif /* PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_DECRYPT_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_encrypt.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_encrypt.h
 new file mode 100644
-index 0000000..1daf168
+index 00000000..1daf1689
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_encrypt.h
 @@ -0,0 +1,76 @@
@@ -749,7 +751,7 @@ index 0000000..1daf168
 +#endif /* PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_ENCRYPT_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_cipher.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_cipher.h
 new file mode 100644
-index 0000000..fbefb28
+index 00000000..fbefb28d
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_cipher.h
 @@ -0,0 +1,246 @@
@@ -1001,7 +1003,7 @@ index 0000000..fbefb28
 +#endif /* PSA_IPC_CRYPTO_CALLER_CIPHER_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy_key.h
 new file mode 100644
-index 0000000..9a98817
+index 00000000..9a988171
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy_key.h
 @@ -0,0 +1,57 @@
@@ -1064,7 +1066,7 @@ index 0000000..9a98817
 +#endif /* PSA_IPC_CRYPTO_CALLER_COPY_KEY_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_destroy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_destroy_key.h
 new file mode 100644
-index 0000000..d00f4fa
+index 00000000..d00f4faa
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_destroy_key.h
 @@ -0,0 +1,51 @@
@@ -1121,7 +1123,7 @@ index 0000000..d00f4fa
 +#endif /* PSA_IPC_CRYPTO_CALLER_DESTROY_KEY_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_key.h
 new file mode 100644
-index 0000000..8ac5477
+index 00000000..8ac5477f
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_key.h
 @@ -0,0 +1,59 @@
@@ -1186,7 +1188,7 @@ index 0000000..8ac5477
 +#endif /* PSA_IPC_CRYPTO_CALLER_EXPORT_KEY_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_public_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_public_key.h
 new file mode 100644
-index 0000000..b24c47f
+index 00000000..b24c47f1
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_public_key.h
 @@ -0,0 +1,59 @@
@@ -1251,7 +1253,7 @@ index 0000000..b24c47f
 +#endif /* PSA_IPC_CRYPTO_CALLER_EXPORT_PUBLIC_KEY_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_key.h
 new file mode 100644
-index 0000000..1b66ed4
+index 00000000..1b66ed40
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_key.h
 @@ -0,0 +1,55 @@
@@ -1312,7 +1314,7 @@ index 0000000..1b66ed4
 +#endif /* PSA_IPC_CRYPTO_CALLER_GENERATE_KEY_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_random.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_random.h
 new file mode 100644
-index 0000000..7c53823
+index 00000000..7c538237
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_random.h
 @@ -0,0 +1,57 @@
@@ -1375,7 +1377,7 @@ index 0000000..7c53823
 +#endif /* PSA_IPC_CRYPTO_CALLER_GENERATE_RANDOM_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_key_attributes.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_key_attributes.h
 new file mode 100644
-index 0000000..22f1d18
+index 00000000..22f1d18f
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_key_attributes.h
 @@ -0,0 +1,56 @@
@@ -1437,7 +1439,7 @@ index 0000000..22f1d18
 +#endif /* PSA_IPC_CRYPTO_CALLER_GET_KEY_ATTRIBUTES_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash.h
 new file mode 100644
-index 0000000..9f37908
+index 00000000..9f37908a
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash.h
 @@ -0,0 +1,220 @@
@@ -1663,7 +1665,7 @@ index 0000000..9f37908
 +#endif /* PSA_IPC_CRYPTO_CALLER_HASH_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_import_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_import_key.h
 new file mode 100644
-index 0000000..d470336
+index 00000000..d4703366
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_import_key.h
 @@ -0,0 +1,57 @@
@@ -1726,7 +1728,7 @@ index 0000000..d470336
 +#endif /* PACKEDC_CRYPTO_CALLER_IMPORT_KEY_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_attributes.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_attributes.h
 new file mode 100644
-index 0000000..2fad2f0
+index 00000000..2fad2f0a
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_attributes.h
 @@ -0,0 +1,51 @@
@@ -1783,7 +1785,7 @@ index 0000000..2fad2f0
 +#endif /* PACKEDC_CRYPTO_CALLER_KEY_ATTRIBUTES_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_derivation.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_derivation.h
 new file mode 100644
-index 0000000..5ce4fb6
+index 00000000..5ce4fb6c
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_derivation.h
 @@ -0,0 +1,298 @@
@@ -2087,7 +2089,7 @@ index 0000000..5ce4fb6
 +#endif /* PSA_IPC_CRYPTO_CALLER_KEY_DERIVATION_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.h
 new file mode 100644
-index 0000000..3a82019
+index 00000000..3a820192
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.h
 @@ -0,0 +1,207 @@
@@ -2300,7 +2302,7 @@ index 0000000..3a82019
 +#endif /* PSA_IPC_CRYPTO_CALLER_MAC_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_purge_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_purge_key.h
 new file mode 100644
-index 0000000..a3a796e
+index 00000000..a3a796e2
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_purge_key.h
 @@ -0,0 +1,51 @@
@@ -2357,7 +2359,7 @@ index 0000000..a3a796e
 +#endif /* PACKEDC_CRYPTO_CALLER_PURGE_KEY_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h
 new file mode 100644
-index 0000000..71d88ce
+index 00000000..71d88ced
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h
 @@ -0,0 +1,64 @@
@@ -2427,7 +2429,7 @@ index 0000000..71d88ce
 +#endif /* PSA_IPC_CRYPTO_CALLER_SIGN_HASH_H */
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h
 new file mode 100644
-index 0000000..e16f6e5
+index 00000000..e16f6e54
 --- /dev/null
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h
 @@ -0,0 +1,59 @@
@@ -2491,7 +2493,7 @@ index 0000000..e16f6e5
 +
 +#endif /* PSA_IPC_CRYPTO_CALLER_VERIFY_HASH_H */
 diff --git a/components/service/crypto/include/psa/crypto_client_struct.h b/components/service/crypto/include/psa/crypto_client_struct.h
-index abd420c..bf95c98 100644
+index abd420c8..bf95c982 100644
 --- a/components/service/crypto/include/psa/crypto_client_struct.h
 +++ b/components/service/crypto/include/psa/crypto_client_struct.h
 @@ -31,12 +31,12 @@ extern "C" {
@@ -2512,7 +2514,7 @@ index abd420c..bf95c98 100644
  
  #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0, 0, 0, 0, 0, 0}
 diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/components/service/crypto/include/psa/crypto_sizes.h
-index 7a0149b..4d7bf6e 100644
+index 7a0149bb..4d7bf6e9 100644
 --- a/components/service/crypto/include/psa/crypto_sizes.h
 +++ b/components/service/crypto/include/psa/crypto_sizes.h
 @@ -81,7 +81,7 @@
@@ -2525,7 +2527,7 @@ index 7a0149b..4d7bf6e 100644
  #endif
  
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index af2225e..2190428 100644
+index af2225e7..21904283 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
 @@ -85,7 +85,7 @@ add_components(TARGET "se-proxy"
@@ -2538,7 +2540,7 @@ index af2225e..2190428 100644
  		"components/service/secure_storage/backend/mock_store"
  )
 diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/deployments/se-proxy/opteesp/service_proxy_factory.c
-index 1110ac4..7edeef8 100644
+index 1110ac46..7edeef8b 100644
 --- a/deployments/se-proxy/opteesp/service_proxy_factory.c
 +++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
 @@ -15,7 +15,7 @@
@@ -2573,7 +2575,7 @@ index 1110ac4..7edeef8 100644
  	return crypto_iface;
  }
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platform/providers/arm/corstone1000/platform.cmake
-index bb778bb..51e5faa 100644
+index bb778bb9..51e5faa3 100644
 --- a/platform/providers/arm/corstone1000/platform.cmake
 +++ b/platform/providers/arm/corstone1000/platform.cmake
 @@ -8,3 +8,5 @@
@@ -2582,6 +2584,3 @@ index bb778bb..51e5faa 100644
  include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
 +
 +add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
index 00f80efb..91207bdd 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0024-Increase-SMM-gateway-UEFI-variable-macro-value.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 9b9261f73f93a5ac7ad823da376858b56560a08b Mon Sep 17 00:00:00 2001
+From 8fca2a8eed6ebc1cbf9f7972c6a9bb137ebafe1a Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Sun, 12 Dec 2021 17:07:03 +0000
 Subject: [PATCH] Increase SMM gateway UEFI variable macro value
@@ -12,12 +9,17 @@ or read SMM gateway returns error code. Currently this value is
 increased to 100 to support more UEFI variables.
 
 Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+
 ---
  deployments/smm-gateway/smm_gateway.c | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/deployments/smm-gateway/smm_gateway.c b/deployments/smm-gateway/smm_gateway.c
-index 7828b3a..7e6729e 100644
+index 7828b3af..7e6729ee 100644
 --- a/deployments/smm-gateway/smm_gateway.c
 +++ b/deployments/smm-gateway/smm_gateway.c
 @@ -20,6 +20,9 @@
@@ -30,6 +32,3 @@ index 7828b3a..7e6729e 100644
  /* Default maximum number of UEFI variables */
  #ifndef SMM_GATEWAY_MAX_UEFI_VARIABLES
  #define SMM_GATEWAY_MAX_UEFI_VARIABLES		(40)
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0025-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0025-Add-stub-capsule-update-service-components.patch
index 949729cc..943568c8 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0025-Add-stub-capsule-update-service-components.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0025-Add-stub-capsule-update-service-components.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 57d310a83190705d63bf77f29dd0d15956ec28b1 Mon Sep 17 00:00:00 2001
+From eb1beb0f4f3a0d97a1ee941b068fb1f3b7ba7d7b Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Tue, 12 Oct 2021 15:45:41 +0100
 Subject: [PATCH] Add stub capsule update service components
@@ -15,9 +12,35 @@ Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: I0d4049bb4de5af7ca80806403301692507085d28
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../backend/capsule_update_backend.h          |  24 ++++
+ .../provider/capsule_update_provider.c        | 133 ++++++++++++++++++
+ .../provider/capsule_update_provider.h        |  51 +++++++
+ .../capsule_update/provider/component.cmake   |  13 ++
+ deployments/se-proxy/opteesp/CMakeLists.txt   |   1 +
+ deployments/se-proxy/opteesp/se_proxy_sp.c    |   3 +
+ .../se-proxy/opteesp/service_proxy_factory.c  |  16 +++
+ .../se-proxy/opteesp/service_proxy_factory.h  |   1 +
+ deployments/se-proxy/se_proxy_interfaces.h    |   9 +-
+ .../capsule_update/capsule_update_proto.h     |  13 ++
+ protocols/service/capsule_update/opcodes.h    |  17 +++
+ protocols/service/capsule_update/parameters.h |  15 ++
+ 12 files changed, 292 insertions(+), 4 deletions(-)
+ create mode 100644 components/service/capsule_update/backend/capsule_update_backend.h
+ create mode 100644 components/service/capsule_update/provider/capsule_update_provider.c
+ create mode 100644 components/service/capsule_update/provider/capsule_update_provider.h
+ create mode 100644 components/service/capsule_update/provider/component.cmake
+ create mode 100644 protocols/service/capsule_update/capsule_update_proto.h
+ create mode 100644 protocols/service/capsule_update/opcodes.h
+ create mode 100644 protocols/service/capsule_update/parameters.h
+
 diff --git a/components/service/capsule_update/backend/capsule_update_backend.h b/components/service/capsule_update/backend/capsule_update_backend.h
 new file mode 100644
-index 0000000..f3144ff
+index 00000000..f3144ff1
 --- /dev/null
 +++ b/components/service/capsule_update/backend/capsule_update_backend.h
 @@ -0,0 +1,24 @@
@@ -47,7 +70,7 @@ index 0000000..f3144ff
 +#endif /* CAPSULE_UPDATE_BACKEND_H */
 diff --git a/components/service/capsule_update/provider/capsule_update_provider.c b/components/service/capsule_update/provider/capsule_update_provider.c
 new file mode 100644
-index 0000000..9bbd7ab
+index 00000000..9bbd7abc
 --- /dev/null
 +++ b/components/service/capsule_update/provider/capsule_update_provider.c
 @@ -0,0 +1,133 @@
@@ -186,7 +209,7 @@ index 0000000..9bbd7ab
 +}
 diff --git a/components/service/capsule_update/provider/capsule_update_provider.h b/components/service/capsule_update/provider/capsule_update_provider.h
 new file mode 100644
-index 0000000..3de4985
+index 00000000..3de49854
 --- /dev/null
 +++ b/components/service/capsule_update/provider/capsule_update_provider.h
 @@ -0,0 +1,51 @@
@@ -243,7 +266,7 @@ index 0000000..3de4985
 +#endif /* CAPSULE_UPDATE_PROVIDER_H */
 diff --git a/components/service/capsule_update/provider/component.cmake b/components/service/capsule_update/provider/component.cmake
 new file mode 100644
-index 0000000..1d412eb
+index 00000000..1d412eb2
 --- /dev/null
 +++ b/components/service/capsule_update/provider/component.cmake
 @@ -0,0 +1,13 @@
@@ -261,7 +284,7 @@ index 0000000..1d412eb
 +	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
 +	)
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index 2190428..953bb71 100644
+index 21904283..953bb716 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
 @@ -80,6 +80,7 @@ add_components(TARGET "se-proxy"
@@ -273,7 +296,7 @@ index 2190428..953bb71 100644
  		# Stub service provider backends
  		"components/rpc/dummy"
 diff --git a/deployments/se-proxy/opteesp/se_proxy_sp.c b/deployments/se-proxy/opteesp/se_proxy_sp.c
-index ef90d9e..11b014b 100644
+index ef90d9ee..11b014b2 100644
 --- a/deployments/se-proxy/opteesp/se_proxy_sp.c
 +++ b/deployments/se-proxy/opteesp/se_proxy_sp.c
 @@ -48,6 +48,9 @@ void __noreturn sp_main(struct ffa_init_info *init_info)
@@ -287,7 +310,7 @@ index ef90d9e..11b014b 100644
  	sp_msg_wait(&req_msg);
  
 diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/deployments/se-proxy/opteesp/service_proxy_factory.c
-index 7edeef8..591cc9e 100644
+index 7edeef8b..591cc9ee 100644
 --- a/deployments/se-proxy/opteesp/service_proxy_factory.c
 +++ b/deployments/se-proxy/opteesp/service_proxy_factory.c
 @@ -13,6 +13,7 @@
@@ -318,7 +341,7 @@ index 7edeef8..591cc9e 100644
 +	return capsule_update_provider_init(&capsule_update_provider);
 +}
 diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.h b/deployments/se-proxy/opteesp/service_proxy_factory.h
-index 298d407..02aa7fe 100644
+index 298d407a..02aa7fe2 100644
 --- a/deployments/se-proxy/opteesp/service_proxy_factory.h
 +++ b/deployments/se-proxy/opteesp/service_proxy_factory.h
 @@ -17,6 +17,7 @@ struct rpc_interface *attest_proxy_create(void);
@@ -330,7 +353,7 @@ index 298d407..02aa7fe 100644
  #ifdef __cplusplus
  }
 diff --git a/deployments/se-proxy/se_proxy_interfaces.h b/deployments/se-proxy/se_proxy_interfaces.h
-index 48908f8..3d4a7c2 100644
+index 48908f84..3d4a7c20 100644
 --- a/deployments/se-proxy/se_proxy_interfaces.h
 +++ b/deployments/se-proxy/se_proxy_interfaces.h
 @@ -8,9 +8,10 @@
@@ -350,7 +373,7 @@ index 48908f8..3d4a7c2 100644
  #endif /* SE_PROXY_INTERFACES_H */
 diff --git a/protocols/service/capsule_update/capsule_update_proto.h b/protocols/service/capsule_update/capsule_update_proto.h
 new file mode 100644
-index 0000000..8f326cd
+index 00000000..8f326cd3
 --- /dev/null
 +++ b/protocols/service/capsule_update/capsule_update_proto.h
 @@ -0,0 +1,13 @@
@@ -369,7 +392,7 @@ index 0000000..8f326cd
 +#endif /* CAPSULE_UPDATE_PROTO_H */
 diff --git a/protocols/service/capsule_update/opcodes.h b/protocols/service/capsule_update/opcodes.h
 new file mode 100644
-index 0000000..8185a09
+index 00000000..8185a090
 --- /dev/null
 +++ b/protocols/service/capsule_update/opcodes.h
 @@ -0,0 +1,17 @@
@@ -392,7 +415,7 @@ index 0000000..8185a09
 +#endif /* CAPSULE_UPDATE_OPCODES_H */
 diff --git a/protocols/service/capsule_update/parameters.h b/protocols/service/capsule_update/parameters.h
 new file mode 100644
-index 0000000..285d924
+index 00000000..285d9241
 --- /dev/null
 +++ b/protocols/service/capsule_update/parameters.h
 @@ -0,0 +1,15 @@
@@ -411,6 +434,3 @@ index 0000000..285d924
 +
 +
 +#endif /* CAPSULE_UPDATE_PARAMETERS_H */
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
index 1f465867..38ce2439 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0026-Add-logs-to-functions-in-SMM-gateway-SP.patch
@@ -1,21 +1,21 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 9dc09450180d2d35b61359399c1313a97016ad07 Mon Sep 17 00:00:00 2001
+From c9188e59fd27d208a975187da285a9b5938bb00d Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Thu, 16 Dec 2021 13:29:58 +0000
 Subject: [PATCH] Add logs to functions in SMM gateway SP
 
 Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 
-%% original patch: 0026-Logging.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+
 ---
  .../backend/uefi_variable_store.c             | 29 +++++++++++++++++--
  .../provider/smm_variable_provider.c          |  7 +++--
  2 files changed, 32 insertions(+), 4 deletions(-)
 
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index ed50eaf..0c371e9 100644
+index ed50eaf9..0c371e94 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/smm_variable/backend/uefi_variable_store.c
 @@ -11,6 +11,7 @@
@@ -206,7 +206,7 @@ index ed50eaf..0c371e9 100644
  			if (psa_status == PSA_SUCCESS) total_used += storage_info.size;
  		}
 diff --git a/components/service/smm_variable/provider/smm_variable_provider.c b/components/service/smm_variable/provider/smm_variable_provider.c
-index 52e68d0..1f362c1 100644
+index 52e68d09..1f362c17 100644
 --- a/components/service/smm_variable/provider/smm_variable_provider.c
 +++ b/components/service/smm_variable/provider/smm_variable_provider.c
 @@ -9,6 +9,7 @@
@@ -246,6 +246,3 @@ index 52e68d0..1f362c1 100644
  			}
  		}
  		else {
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0027-Configure-storage-size.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0027-Configure-storage-size.patch
index 764cfe6c..ddf95034 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0027-Configure-storage-size.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0027-Configure-storage-size.patch
@@ -1,17 +1,18 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 02746a26472f6aa7d57cfd5388823b0ec3c8a945 Mon Sep 17 00:00:00 2001
+From 3e472452bca64ed90071b61416460f1a69382293 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Thu, 16 Dec 2021 21:31:40 +0000
 Subject: [PATCH] Configure storage size
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+
 ---
  .../service/smm_variable/backend/uefi_variable_store.c       | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index 0c371e9..b7cfff4 100644
+index 0c371e94..b7cfff40 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/smm_variable/backend/uefi_variable_store.c
 @@ -87,6 +87,7 @@ static efi_status_t check_name_terminator(
@@ -38,6 +39,3 @@ index 0c371e9..b7cfff4 100644
  	context->volatile_store.storage_backend = volatile_store;
  
  	context->owner_id = owner_id;
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0028-Revert-Add-uefi-variable-append-write-support.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0028-Revert-Add-uefi-variable-append-write-support.patch
index b7efe19c..9bb3f91d 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0028-Revert-Add-uefi-variable-append-write-support.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0028-Revert-Add-uefi-variable-append-write-support.patch
@@ -1,12 +1,14 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 85df04f724f95218b57f78425966f0230d75c57e Mon Sep 17 00:00:00 2001
+From da3bd0721f2403562b6ae6d1939f5f331fd141bb Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Wed, 15 Dec 2021 17:23:25 +0000
 Subject: [PATCH] Revert "Add uefi variable append write support"
 
 This reverts commit e8758d9aff0eddae81a74b0191cd027bcdc92c04.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+
 ---
  .../backend/test/variable_index_tests.cpp     |  90 +++---
  .../backend/test/variable_store_tests.cpp     |  72 +----
@@ -20,7 +22,7 @@ This reverts commit e8758d9aff0eddae81a74b0191cd027bcdc92c04.
  9 files changed, 239 insertions(+), 426 deletions(-)
 
 diff --git a/components/service/smm_variable/backend/test/variable_index_tests.cpp b/components/service/smm_variable/backend/test/variable_index_tests.cpp
-index 8edc0e7..c8bacf9 100644
+index 8edc0e70..c8bacf97 100644
 --- a/components/service/smm_variable/backend/test/variable_index_tests.cpp
 +++ b/components/service/smm_variable/backend/test/variable_index_tests.cpp
 @@ -69,37 +69,34 @@ TEST_GROUP(UefiVariableIndexTests)
@@ -289,7 +291,7 @@ index 8edc0e7..c8bacf9 100644
  	CHECK_TRUE(info->is_variable_set);
  	CHECK_TRUE(info->is_constraints_set);
 diff --git a/components/service/smm_variable/backend/test/variable_store_tests.cpp b/components/service/smm_variable/backend/test/variable_store_tests.cpp
-index e90c106..235642e 100644
+index e90c1067..235642e6 100644
 --- a/components/service/smm_variable/backend/test/variable_store_tests.cpp
 +++ b/components/service/smm_variable/backend/test/variable_store_tests.cpp
 @@ -305,37 +305,6 @@ TEST(UefiVariableStoreTests, setGetRoundtrip)
@@ -400,10 +402,10 @@ index e90c106..235642e 100644
  
  	/* Expect variable to no loger exist */
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index ed50eaf..d084e8d 100644
+index b7cfff40..6a90f46a 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -46,20 +46,6 @@ static efi_status_t load_variable_data(
+@@ -47,20 +47,6 @@ static efi_status_t load_variable_data(
  	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var,
  	size_t max_data_len);
  
@@ -424,7 +426,7 @@ index ed50eaf..d084e8d 100644
  static void purge_orphan_index_entries(
  	struct uefi_variable_store *context);
  
-@@ -163,45 +149,40 @@ efi_status_t uefi_variable_store_set_variable(
+@@ -168,45 +154,40 @@ efi_status_t uefi_variable_store_set_variable(
  	struct uefi_variable_store *context,
  	const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
  {
@@ -488,7 +490,7 @@ index ed50eaf..d084e8d 100644
  
  				/* It's a remove operation - for a remove, the variable
  				 * data must be removed from the storage backend before
-@@ -210,30 +191,31 @@ efi_status_t uefi_variable_store_set_variable(
+@@ -215,30 +196,31 @@ efi_status_t uefi_variable_store_set_variable(
  				 * the storage backend without a corresponding index entry.
  				 */
  				remove_variable_data(context, info);
@@ -537,7 +539,7 @@ index ed50eaf..d084e8d 100644
  
  	/* The order of these operations is important. For an update
  	 * or create operation, The variable index is always synchronized
-@@ -249,13 +231,11 @@ efi_status_t uefi_variable_store_set_variable(
+@@ -254,13 +236,11 @@ efi_status_t uefi_variable_store_set_variable(
  	}
  
  	/* Store any variable data to the storage backend */
@@ -552,7 +554,7 @@ index ed50eaf..d084e8d 100644
  	return status;
  }
  
-@@ -361,41 +341,53 @@ efi_status_t uefi_variable_store_set_var_check_property(
+@@ -373,41 +353,53 @@ efi_status_t uefi_variable_store_set_var_check_property(
  	efi_status_t status = check_name_terminator(property->Name, property->NameSize);
  	if (status != EFI_SUCCESS) return status;
  
@@ -628,7 +630,7 @@ index ed50eaf..d084e8d 100644
  
  	return status;
  }
-@@ -496,8 +488,7 @@ static efi_status_t check_capabilities(
+@@ -514,8 +506,7 @@ static efi_status_t check_capabilities(
  	if (var->Attributes & ~(
  		EFI_VARIABLE_NON_VOLATILE |
  		EFI_VARIABLE_BOOTSERVICE_ACCESS |
@@ -638,7 +640,7 @@ index ed50eaf..d084e8d 100644
  
  		/* An unsupported attribute has been requested */
  		status = EFI_UNSUPPORTED;
-@@ -543,6 +534,17 @@ static efi_status_t check_access_permitted_on_set(
+@@ -561,6 +552,17 @@ static efi_status_t check_access_permitted_on_set(
  			var->DataSize);
  	}
  
@@ -656,7 +658,7 @@ index ed50eaf..d084e8d 100644
  	return status;
  }
  
-@@ -562,33 +564,20 @@ static efi_status_t store_variable_data(
+@@ -581,33 +583,20 @@ static efi_status_t store_variable_data(
  
  	if (delegate_store->storage_backend) {
  
@@ -699,7 +701,7 @@ index ed50eaf..d084e8d 100644
  		purge_orphan_index_entries(context);
  	}
  
-@@ -651,100 +640,6 @@ static efi_status_t load_variable_data(
+@@ -674,100 +663,6 @@ static efi_status_t load_variable_data(
  	return psa_to_efi_storage_status(psa_status);
  }
  
@@ -800,7 +802,7 @@ index ed50eaf..d084e8d 100644
  static void purge_orphan_index_entries(
  	struct uefi_variable_store *context)
  {
-@@ -759,7 +654,7 @@ static void purge_orphan_index_entries(
+@@ -782,7 +677,7 @@ static void purge_orphan_index_entries(
  	 */
  	while (!variable_index_iterator_is_done(&iter)) {
  
@@ -809,7 +811,7 @@ index ed50eaf..d084e8d 100644
  
  		if (info->is_variable_set && (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) {
  
-@@ -775,7 +670,7 @@ static void purge_orphan_index_entries(
+@@ -799,7 +694,7 @@ static void purge_orphan_index_entries(
  			if (psa_status != PSA_SUCCESS) {
  
  				/* Detected a mismatch between the index and storage */
@@ -819,7 +821,7 @@ index ed50eaf..d084e8d 100644
  			}
  		}
 diff --git a/components/service/smm_variable/backend/variable_index.c b/components/service/smm_variable/backend/variable_index.c
-index a8a5575..99d7c97 100644
+index a8a55753..99d7c97a 100644
 --- a/components/service/smm_variable/backend/variable_index.c
 +++ b/components/service/smm_variable/backend/variable_index.c
 @@ -132,13 +132,13 @@ size_t variable_index_max_dump_size(
@@ -986,7 +988,7 @@ index a8a5575..99d7c97 100644
  }
  
 diff --git a/components/service/smm_variable/backend/variable_index.h b/components/service/smm_variable/backend/variable_index.h
-index 63f42ab..e109d0d 100644
+index 63f42ab6..e109d0d1 100644
 --- a/components/service/smm_variable/backend/variable_index.h
 +++ b/components/service/smm_variable/backend/variable_index.h
 @@ -119,8 +119,8 @@ size_t variable_index_max_dump_size(
@@ -1106,7 +1108,7 @@ index 63f42ab..e109d0d 100644
  
  /**
 diff --git a/components/service/smm_variable/backend/variable_index_iterator.c b/components/service/smm_variable/backend/variable_index_iterator.c
-index 8f8fc74..7cc6dc7 100644
+index 8f8fc741..7cc6dc7a 100644
 --- a/components/service/smm_variable/backend/variable_index_iterator.c
 +++ b/components/service/smm_variable/backend/variable_index_iterator.c
 @@ -31,10 +31,10 @@ bool variable_index_iterator_is_done(
@@ -1123,7 +1125,7 @@ index 8f8fc74..7cc6dc7 100644
  	if (!variable_index_iterator_is_done(iter)) {
  
 diff --git a/components/service/smm_variable/backend/variable_index_iterator.h b/components/service/smm_variable/backend/variable_index_iterator.h
-index 7ff77c5..f64a2c4 100644
+index 7ff77c50..f64a2c49 100644
 --- a/components/service/smm_variable/backend/variable_index_iterator.h
 +++ b/components/service/smm_variable/backend/variable_index_iterator.h
 @@ -54,7 +54,7 @@ bool variable_index_iterator_is_done(
@@ -1136,7 +1138,7 @@ index 7ff77c5..f64a2c4 100644
  
  /**
 diff --git a/components/service/smm_variable/test/service/smm_variable_service_tests.cpp b/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
-index 15556e9..38c08eb 100644
+index 15556e9d..38c08ebe 100644
 --- a/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
 +++ b/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
 @@ -249,30 +249,6 @@ TEST(SmmVariableServiceTests, setAndGet)
@@ -1202,7 +1204,7 @@ index 15556e9..38c08eb 100644
  	efi_status = m_client->remove_variable(m_common_guid, var_name);
  	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
 diff --git a/protocols/service/smm_variable/parameters.h b/protocols/service/smm_variable/parameters.h
-index 233f301..1f795a9 100644
+index 233f301b..1f795a9b 100644
 --- a/protocols/service/smm_variable/parameters.h
 +++ b/protocols/service/smm_variable/parameters.h
 @@ -47,9 +47,6 @@ typedef struct {
@@ -1215,6 +1217,3 @@ index 233f301..1f795a9 100644
  
  /**
   * Parameter structure for SetVariable and GetVariable.
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0029-Change-UID-of-variable-index-in-SMM.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0029-Change-UID-of-variable-index-in-SMM.patch
index fe31f8f2..caa1d9a9 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0029-Change-UID-of-variable-index-in-SMM.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0029-Change-UID-of-variable-index-in-SMM.patch
@@ -1,23 +1,23 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 451eac3ed36231380b8e3dd0ad76c1a3c010a375 Mon Sep 17 00:00:00 2001
+From 12e9b977e4c7515ce90fecc62630be394fd7da62 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Mon, 20 Dec 2021 19:54:39 +0000
-Subject: [PATCH 1/3] Change UID of variable index in SMM
+Subject: [PATCH] Change UID of variable index in SMM
 
 This patch fixes the os_indications setVariable() failure. The variable
 index UID in SMM gateway which was 1 is changed in this patch. TFM has a
 special usage for variable with UID 1, which makes it write once only.
 This is not required for SMM variable index.
 
-%% original patch: 0029-Change-UID-of-variable-index-in-SMM.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+
 ---
  components/service/smm_variable/backend/uefi_variable_store.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index 6a90f46..1bb869a 100644
+index 6a90f46a..1bb869ae 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/smm_variable/backend/uefi_variable_store.c
 @@ -67,7 +67,7 @@ static efi_status_t check_name_terminator(
@@ -29,6 +29,3 @@ index 6a90f46..1bb869a 100644
  
  /* Default maximum variable size -
   * may be overridden using uefi_variable_store_set_storage_limits()
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0030-Add-missing-features-to-setVariable.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0030-Add-missing-features-to-setVariable.patch
index a5828ca3..244146a2 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0030-Add-missing-features-to-setVariable.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0030-Add-missing-features-to-setVariable.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 2ba5fa76a886e0ef59656fe96666f2582e8ffc72 Mon Sep 17 00:00:00 2001
+From 55fc3dbfb0ec21b1239808d0dddae14fbb8bb5f3 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Mon, 20 Dec 2021 19:56:30 +0000
-Subject: [PATCH 2/3] Add missing features to setVariable()
+Subject: [PATCH] Add missing features to setVariable()
 
 This patch resolves the failing tests in SCT related to
 setVariable() function. The existing implementation is
@@ -12,13 +9,16 @@ missing few cases where error codes are returned when called
 with certain paramters. These conditions are implemented in
 this patch based on the explanation provided in uefi spec.
 
-%% original patch: 0030-Add-missing-features-to-setVariable.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+
 ---
  .../backend/uefi_variable_store.c             | 29 ++++++++++++++++---
  1 file changed, 25 insertions(+), 4 deletions(-)
 
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index 1bb869a..a167107 100644
+index 1bb869ae..a1671074 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/smm_variable/backend/uefi_variable_store.c
 @@ -161,6 +161,17 @@ efi_status_t uefi_variable_store_set_variable(
@@ -71,6 +71,3 @@ index 1bb869a..a167107 100644
  			status = EFI_INVALID_PARAMETER;
  		}
  	}
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0031-Add-invalid-parameter-check-in-getNextVariableName.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0031-Add-invalid-parameter-check-in-getNextVariableName.patch
index 63a45a07..3990d82c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0031-Add-invalid-parameter-check-in-getNextVariableName.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0031-Add-invalid-parameter-check-in-getNextVariableName.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From 8a2a47d360e43004d277c00ed06cbc59ccfb721e Mon Sep 17 00:00:00 2001
+From dc3f134436ad6852f1bad9542232e84166843a7e Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Mon, 20 Dec 2021 20:01:10 +0000
-Subject: [PATCH 3/3] Add invalid parameter check in getNextVariableName()
+Subject: [PATCH] Add invalid parameter check in getNextVariableName()
 
 This patch resolves the failing tests in SCT related to
 getNextVariableName() function. The existing implementation is
@@ -12,13 +9,16 @@ missing few cases where error codes are returned when called
 with certain paramters. These conditions are implemented in
 this patch based on the explanation provided in uefi spec.
 
-%% original patch: 0031-Add-invalid-parameter-check-in-getNextVariableName.patch
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+
 ---
  .../smm_variable/backend/uefi_variable_store.c | 18 +++++++++++++++++-
  1 file changed, 17 insertions(+), 1 deletion(-)
 
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index a167107..a57b334 100644
+index a1671074..a57b3346 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/smm_variable/backend/uefi_variable_store.c
 @@ -161,7 +161,7 @@ efi_status_t uefi_variable_store_set_variable(
@@ -53,6 +53,3 @@ index a167107..a57b334 100644
  	const struct variable_info *info = variable_index_find_next(
  		&context->variable_index,
  		&cur->Guid,
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0032-smm_gateway-add-checks-for-null-attributes.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0032-smm_gateway-add-checks-for-null-attributes.patch
index 31f86f1d..da3ddaf6 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0032-smm_gateway-add-checks-for-null-attributes.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0032-smm_gateway-add-checks-for-null-attributes.patch
@@ -1,7 +1,4 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From c88937f3fb2d1259b1abb1a6926e869bf2f5d69e Mon Sep 17 00:00:00 2001
+From 571ddac16048dfba4b25b04fe5cbd706c392b5ba Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 24 Dec 2021 19:17:17 +0000
 Subject: [PATCH] smm_gateway: add checks for null attributes
@@ -13,8 +10,16 @@ This change is to add that support
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+
+---
+ .../backend/uefi_variable_store.c             | 28 ++++++++++++-------
+ 1 file changed, 18 insertions(+), 10 deletions(-)
+
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index a57b334..e8771c2 100644
+index a57b3346..e8771c21 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/smm_variable/backend/uefi_variable_store.c
 @@ -167,7 +167,9 @@ efi_status_t uefi_variable_store_set_variable(
@@ -74,6 +79,3 @@ index a57b334..e8771c2 100644
  			/* Don't permit change of attributes */
  			status = EFI_INVALID_PARAMETER;
  		}
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0033-Enhance-mbedtls-fetch-process.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0033-Enhance-mbedtls-fetch-process.patch
index 60f48262..02130b56 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0033-Enhance-mbedtls-fetch-process.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0033-Enhance-mbedtls-fetch-process.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From ddff15a07e2fb7eddfa1d988fce25d82cb22f7ee Mon Sep 17 00:00:00 2001
+From 47db072e9ec749c6be7c0a27d64d7fbd75748d60 Mon Sep 17 00:00:00 2001
 From: Gyorgy Szing <Gyorgy.Szing@arm.com>
 Date: Wed, 8 Dec 2021 04:20:34 +0100
-Subject: [PATCH 01/15] Enhance mbedtls fetch process
+Subject: [PATCH] Enhance mbedtls fetch process
 
 Update management of MbedTLS external component to be optimized
 for download speed insted of availability.
@@ -30,6 +27,11 @@ used later to speed up a clean build an use the prebuilt binary.
 
 Change-Id: I8a9ad8b3303e6dfa0a7c9c3d7e4b4787b94d925a
 Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  external/MbedTLS/MbedTLS.cmake | 192 ++++++++++++++++++++-------------
  1 file changed, 119 insertions(+), 73 deletions(-)
@@ -46,7 +48,7 @@ index 3cbaed15..935be765 100644
  # SPDX-License-Identifier: BSD-3-Clause
  #
  #-------------------------------------------------------------------------------
-
+ 
 -# Determine the number of processes to run while running parallel builds.
 -# Pass -DPROCESSOR_COUNT=<n> to cmake to override.
 -if(NOT DEFINED PROCESSOR_COUNT)
@@ -62,7 +64,7 @@ index 3cbaed15..935be765 100644
 +		CACHE PATH "MbedTLS source directory")
 +set(MBEDTLS_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/mbedtls_install"
 +		CACHE PATH "Mbed TLS installation directory")
-
+ 
 -set(MBEDTLS_URL "https://github.com/ARMmbed/mbedtls.git" CACHE STRING "Mbed TLS repository URL")
 -set(MBEDTLS_REFSPEC "mbedtls-3.0.0" CACHE STRING "Mbed TLS git refspec")
 -set(MBEDTLS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/mbedtls_install" CACHE PATH "Mbed TLS installation directory")
@@ -74,18 +76,18 @@ index 3cbaed15..935be765 100644
 +				DOC "Location of mberdrypto library."
 +				NO_DEFAULT_PATH
 +)
-
+ 
 -include(FetchContent)
 +set(MBEDCRYPTO_LIB_FILE ${MBEDCRYPTO_LIB_FILE})
 +unset(MBEDCRYPTO_LIB_FILE CACHE)
-
+ 
 -# Checking git
 -find_program(GIT_COMMAND "git")
 -if (NOT GIT_COMMAND)
 -	message(FATAL_ERROR "Please install git")
 -endif()
 +set(MBEDTLS_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/mbedtls-build")
-
+ 
 -# Fetching Mbed TLS
 -FetchContent_Declare(
 -	mbedtls
@@ -103,7 +105,7 @@ index 3cbaed15..935be765 100644
 +		set(PROCESSOR_COUNT ${PROCESSOR_COUNT}
 +				CACHE STRING "Number of cores to use for parallel builds.")
 +	endif()
-
+ 
 -# FetchContent_GetProperties exports mbedtls_SOURCE_DIR and mbedtls_BINARY_DIR variables
 -FetchContent_GetProperties(mbedtls)
 -if(NOT mbedtls_POPULATED)
@@ -119,14 +121,14 @@ index 3cbaed15..935be765 100644
 +	)
 +	set(MBEDCRYPTO_HEADER_FILE ${MBEDCRYPTO_HEADER_FILE})
 +	unset(MBEDCRYPTO_HEADER_FILE CACHE)
-
+ 
 -# Convert the include path list to a string. Needed to make parameter passing to
 -# Mbed TLS build work fine.
 -string(REPLACE ";" "\\;" MBEDTLS_EXTRA_INCLUDES "${MBEDTLS_EXTRA_INCLUDES}")
 +	# Source not found, fetch it.
 +	if (NOT MBEDCRYPTO_HEADER_FILE)
 +		include(FetchContent)
-
+ 
 -find_package(Python3 COMPONENTS Interpreter)
 -if (NOT Python3_Interpreter_FOUND)
 -	message(FATAL_ERROR "Python 3 interpreter not found.")
@@ -136,7 +138,7 @@ index 3cbaed15..935be765 100644
 +		if (NOT GIT_COMMAND)
 +			message(FATAL_ERROR "Please install git")
 +		endif()
-
+ 
 -#Configure Mbed TLS to build only mbedcrypto lib
 -execute_process(COMMAND ${Python3_EXECUTABLE} scripts/config.py crypto WORKING_DIRECTORY ${mbedtls_SOURCE_DIR})
 -
@@ -169,7 +171,7 @@ index 3cbaed15..935be765 100644
 +			GIT_TAG ${MBEDTLS_REFSPEC}
 +			GIT_SHALLOW TRUE
 +		)
-
+ 
 -if (_exec_error)
 -	message(FATAL_ERROR "Configuration step of Mbed TLS failed with ${_exec_error}.")
 -endif()
@@ -182,7 +184,7 @@ index 3cbaed15..935be765 100644
 +
 +		# If the source directory has been moved, the binary dir must be regenerated from scratch.
 +		file(REMOVE_RECURSE "${MBEDTLS_BINARY_DIR}")
-
+ 
 -#TODO: add dependency to generated project on this file!
 -#TODO: add custom target to rebuild Mbed TLS
 +		if (NOT mbedtls_POPULATED)
@@ -191,7 +193,7 @@ index 3cbaed15..935be765 100644
 +		endif()
 +		set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${MBEDTLS_SOURCE_DIR})
 +	endif()
-
+ 
 -#Build the library
 -execute_process(COMMAND
 -		${CMAKE_COMMAND} --build ${mbedtls_BINARY_DIR} --parallel ${PROCESSOR_COUNT} --target install
@@ -246,7 +248,7 @@ index 3cbaed15..935be765 100644
 +
 +	set(MBEDCRYPTO_LIB_FILE "${MBEDTLS_INSTALL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}mbedcrypto${CMAKE_STATIC_LIBRARY_SUFFIX}")
  endif()
-
+ 
  #Create an imported target to have clean abstraction in the build-system.
  add_library(mbedcrypto STATIC IMPORTED)
 -set_property(TARGET mbedcrypto PROPERTY IMPORTED_LOCATION "${MBEDTLS_INSTALL_PATH}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}mbedcrypto${CMAKE_STATIC_LIBRARY_SUFFIX}")
@@ -254,5 +256,3 @@ index 3cbaed15..935be765 100644
 +set_property(DIRECTORY ${CMAKE_SOURCE_DIR} APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${MBEDCRYPTO_LIB_FILE})
 +set_property(TARGET mbedcrypto PROPERTY IMPORTED_LOCATION ${MBEDCRYPTO_LIB_FILE})
 +set_property(TARGET mbedcrypto PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${MBEDTLS_INSTALL_DIR}/include")
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0034-Fix-format-specifier-in-logging_caller.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0034-Fix-format-specifier-in-logging_caller.patch
index 019d3c24..75fa7c2a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0034-Fix-format-specifier-in-logging_caller.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0034-Fix-format-specifier-in-logging_caller.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From ba99622ba2f0048159bea2d0086173b8d5365473 Mon Sep 17 00:00:00 2001
+From 131bb3c577fff93ff9ba6f5e7d450f727fec0e62 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Fri, 11 Feb 2022 12:30:45 +0000
-Subject: [PATCH 02/15] Fix format specifier in logging_caller
+Subject: [PATCH] Fix format specifier in logging_caller
 
 A previous change increased the width of the opstatus value
 returned by an rpc endpoint from 32 to 64 bits. This change
@@ -13,6 +10,11 @@ that corresponds to logging the opstatus value.
 
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: Ie695a6bf8cf8014317b85196d7b933d344782b2c
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  components/rpc/common/logging/logging_caller.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -29,13 +31,11 @@ index 07c33de5..cac03f2f 100644
   * SPDX-License-Identifier: BSD-3-Clause
   */
 @@ -87,7 +87,7 @@ static rpc_status_t call_invoke(void *context, rpc_call_handle handle, uint32_t
-
+ 
  	if (status == TS_RPC_CALL_ACCEPTED) {
-
+ 
 -		fprintf(this_instance->log_file, "op_status: %d\n", *opstatus);
 +		fprintf(this_instance->log_file, "op_status: %ld\n", *opstatus);
  		fprintf(this_instance->log_file, "resp_len: %ld\n", *resp_len);
  	}
-
---
-2.25.1
+ 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v.patch
index bf788764..01b99d3e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v.patch
@@ -1,17 +1,18 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From ba6af6e6500a2ba25ab6c01d641383c24f9fab07 Mon Sep 17 00:00:00 2001
+From 7aa9796020487ce32746c25934ce20829acc462c Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Fri, 11 Feb 2022 13:42:59 +0000
-Subject: [PATCH 03/15] Update refspecs for mbedtls and psa-arch-tests for
- v3.1.0
+Subject: [PATCH] Update refspecs for mbedtls and psa-arch-tests for v3.1.0
 
 Updates external component refspecs to use mbedtls 3.1.0 and
 compatible API tests from psa-arch-test.
 
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: I1b5cebd7de3c1885f5f8a8ea21ba5e4c52aefaf4
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  external/MbedTLS/MbedTLS.cmake               |  2 +-
  external/psa_arch_tests/psa_arch_tests.cmake | 17 ++++++-----------
@@ -22,7 +23,7 @@ index 935be765..3350d8a0 100644
 --- a/external/MbedTLS/MbedTLS.cmake
 +++ b/external/MbedTLS/MbedTLS.cmake
 @@ -7,7 +7,7 @@
-
+ 
  set(MBEDTLS_URL "https://github.com/ARMmbed/mbedtls.git"
  		CACHE STRING "Mbed TLS repository URL")
 -set(MBEDTLS_REFSPEC "mbedtls-3.0.0"
@@ -37,7 +38,7 @@ index e6ab73f7..f6d2fb9f 100644
 @@ -5,20 +5,15 @@
  #
  #-------------------------------------------------------------------------------
-
+ 
 -# Determine the number of processes to run while running parallel builds.
 -# Pass -DPROCESSOR_COUNT=<n> to cmake to override.
 -if(NOT DEFINED PROCESSOR_COUNT)
@@ -48,7 +49,7 @@ index e6ab73f7..f6d2fb9f 100644
 +# Temporarily using modified tests used for tf-m verification
 +set(PSA_ARCH_TESTS_URL "https://github.com/bensze01/psa-arch-tests.git" CACHE STRING "psa-arch-tests repository URL")
 +set(PSA_ARCH_TESTS_REFSPEC "fix-multipart-aead" CACHE STRING "psa-arch-tests git refspec")
-
+ 
 -set(PSA_ARCH_TESTS_URL "https://github.com/ARM-software/psa-arch-tests.git" CACHE STRING "psa-arch-tests repository URL")
 -set(PSA_ARCH_TESTS_REFSPEC "master" CACHE STRING "psa-arch-tests git refspec")
 +#set(PSA_ARCH_TESTS_URL "https://github.com/ARM-software/psa-arch-tests.git" CACHE STRING "psa-arch-tests repository URL")
@@ -58,8 +59,6 @@ index e6ab73f7..f6d2fb9f 100644
 -
 -include(FetchContent)
 +set(PSA_ARCH_TESTS_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/psa_arch_tests-src" CACHE PATH "psa-arch-tests source.")
-
+ 
  # Checking git
  find_program(GIT_COMMAND "git")
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0036-Separate-sign-verify-message-and-hash-operations.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0036-Separate-sign-verify-message-and-hash-operations.patch
index 87e023a1..ae78f41a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0036-Separate-sign-verify-message-and-hash-operations.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0036-Separate-sign-verify-message-and-hash-operations.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 5afda176526010872b5849622a69c1a4cafb76fd Mon Sep 17 00:00:00 2001
+From b160f734006f4959d92377dc3aa8eabc3ac7c1da Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Fri, 11 Feb 2022 14:08:13 +0000
-Subject: [PATCH 04/15] Separate sign/verify message and hash operations
+Subject: [PATCH] Separate sign/verify message and hash operations
 
 Previous versions of mbedtls didn't distinguish between
 asymmetric sign and verify operations on a hash or message.
@@ -15,6 +12,11 @@ components.
 
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: Ic0041c694c026522c9b00c974d22261e9e2feadd
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  .../caller/packed-c/crypto_caller_sign_hash.h | 29 +++++++-
  .../packed-c/crypto_caller_verify_hash.h      | 33 ++++++++-
@@ -54,7 +56,7 @@ index e807773e..4a9ed20d 100644
 @@ -20,7 +20,8 @@
  extern "C" {
  #endif
-
+ 
 -static inline psa_status_t crypto_caller_sign_hash(struct service_client *context,
 +static inline psa_status_t crypto_caller_asym_sign_commom(struct service_client *context,
 +	uint32_t opcode,
@@ -62,18 +64,18 @@ index e807773e..4a9ed20d 100644
  	psa_algorithm_t alg,
  	const uint8_t *hash, size_t hash_length,
 @@ -60,7 +61,7 @@ static inline psa_status_t crypto_caller_sign_hash(struct service_client *contex
-
+ 
  		context->rpc_status =
  			rpc_caller_invoke(context->caller, call_handle,
 -						TS_CRYPTO_OPCODE_SIGN_HASH, &opstatus, &resp_buf, &resp_len);
 +						opcode, &opstatus, &resp_buf, &resp_len);
-
+ 
  		if (context->rpc_status == TS_RPC_CALL_ACCEPTED) {
-
+ 
 @@ -98,6 +99,28 @@ static inline psa_status_t crypto_caller_sign_hash(struct service_client *contex
  	return psa_status;
  }
-
+ 
 +static inline psa_status_t crypto_caller_sign_hash(struct service_client *context,
 +	psa_key_id_t id,
 +	psa_algorithm_t alg,
@@ -113,7 +115,7 @@ index 47152946..daa11330 100644
 @@ -20,7 +20,8 @@
  extern "C" {
  #endif
-
+ 
 -static inline psa_status_t crypto_caller_verify_hash(struct service_client *context,
 +static inline psa_status_t crypto_caller_asym_verify_common(struct service_client *context,
 +	uint32_t opcode,
@@ -121,18 +123,18 @@ index 47152946..daa11330 100644
  	psa_algorithm_t alg,
  	const uint8_t *hash, size_t hash_length,
 @@ -65,7 +66,7 @@ static inline psa_status_t crypto_caller_verify_hash(struct service_client *cont
-
+ 
  		context->rpc_status =
  			rpc_caller_invoke(context->caller, call_handle,
 -					TS_CRYPTO_OPCODE_VERIFY_HASH, &opstatus, &resp_buf, &resp_len);
 +					opcode, &opstatus, &resp_buf, &resp_len);
-
+ 
  		if (context->rpc_status == TS_RPC_CALL_ACCEPTED) psa_status = opstatus;
-
+ 
 @@ -75,6 +76,32 @@ static inline psa_status_t crypto_caller_verify_hash(struct service_client *cont
  	return psa_status;
  }
-
+ 
 +static inline psa_status_t crypto_caller_verify_hash(struct service_client *context,
 +	psa_key_id_t id,
 +	psa_algorithm_t alg,
@@ -176,7 +178,7 @@ index d09369a2..09049f5c 100644
 @@ -23,6 +23,15 @@ static inline psa_status_t crypto_caller_sign_hash(struct service_client *contex
  	return PSA_ERROR_NOT_SUPPORTED;
  }
-
+ 
 +static inline psa_status_t crypto_caller_sign_message(struct service_client *context,
 +	psa_key_id_t id,
 +	psa_algorithm_t alg,
@@ -203,7 +205,7 @@ index 20d11dcf..3f3eb878 100644
 @@ -23,6 +23,15 @@ static inline psa_status_t crypto_caller_verify_hash(struct service_client *cont
  	return PSA_ERROR_NOT_SUPPORTED;
  }
-
+ 
 +static inline psa_status_t crypto_caller_verify_message(struct service_client *context,
 +	psa_key_id_t id,
 +	psa_algorithm_t alg,
@@ -230,7 +232,7 @@ index 2a5e5b99..ccb0714a 100644
 @@ -57,7 +57,7 @@ public:
  		psa_key_id_t id,
  		uint8_t *data, size_t data_size, size_t *data_length) = 0;
-
+ 
 -	/* Sign/verify methods */
 +	/* Sign/verify hash methods */
  	virtual psa_status_t sign_hash(
@@ -239,7 +241,7 @@ index 2a5e5b99..ccb0714a 100644
 @@ -70,6 +70,19 @@ public:
  		const uint8_t *hash, size_t hash_length,
  		const uint8_t *signature, size_t signature_length) = 0;
-
+ 
 +	/* Sign/verify message methods */
 +	virtual psa_status_t sign_message(
 +		psa_key_id_t id,
@@ -270,7 +272,7 @@ index 4d9d8f41..4e10f9be 100644
 @@ -107,6 +107,26 @@ psa_status_t packedc_crypto_client::verify_hash(
  		signature, signature_length);
  }
-
+ 
 +psa_status_t packedc_crypto_client::sign_message(
 +	psa_key_id_t id, psa_algorithm_t alg,
 +	const uint8_t *message, size_t message_length,
@@ -308,7 +310,7 @@ index 377b51d1..d74ba609 100644
 @@ -54,7 +54,7 @@ public:
  		psa_key_id_t id,
  		uint8_t *data, size_t data_size, size_t *data_length);
-
+ 
 -	/* Sign/verify methods */
 +	/* Sign/verify hash methods */
  	psa_status_t sign_hash(
@@ -317,7 +319,7 @@ index 377b51d1..d74ba609 100644
 @@ -67,6 +67,19 @@ public:
  		const uint8_t *hash, size_t hash_length,
  		const uint8_t *signature, size_t signature_length);
-
+ 
 +	/* Sign/verify message methods */
 +	psa_status_t sign_message(
 +		psa_key_id_t id,
@@ -366,17 +368,17 @@ index 17780351..28c8f6fb 100644
  	pb_bytes_array_t *hash_byte_array =
 @@ -416,7 +435,7 @@ psa_status_t protobuf_crypto_client::sign_hash(psa_key_id_t id, psa_algorithm_t
  			pb_encode(&ostream, ts_crypto_SignHashIn_fields, &req_msg);
-
+ 
  			m_client.rpc_status = rpc_caller_invoke(m_client.caller, call_handle,
 -						ts_crypto_Opcode_SIGN_HASH, &opstatus, &resp_buf, &resp_len);
 +						opcode, &opstatus, &resp_buf, &resp_len);
-
+ 
  			if (m_client.rpc_status == TS_RPC_CALL_ACCEPTED) {
-
+ 
 @@ -462,10 +481,28 @@ psa_status_t protobuf_crypto_client::sign_hash(psa_key_id_t id, psa_algorithm_t
  	return psa_status;
  }
-
+ 
 -
  psa_status_t protobuf_crypto_client::verify_hash(psa_key_id_t id, psa_algorithm_t alg,
  						const uint8_t *hash, size_t hash_length,
@@ -405,13 +407,13 @@ index 17780351..28c8f6fb 100644
  	pb_bytes_array_t *hash_byte_array =
 @@ -497,7 +534,7 @@ psa_status_t protobuf_crypto_client::verify_hash(psa_key_id_t id, psa_algorithm_
  			pb_encode(&ostream, ts_crypto_VerifyHashIn_fields, &req_msg);
-
+ 
  			m_client.rpc_status = rpc_caller_invoke(m_client.caller, call_handle,
 -						ts_crypto_Opcode_VERIFY_HASH, &opstatus, &resp_buf, &resp_len);
 +						opcode, &opstatus, &resp_buf, &resp_len);
-
+ 
  			if (m_client.rpc_status == TS_RPC_CALL_ACCEPTED) psa_status = opstatus;
-
+ 
 diff --git a/components/service/crypto/client/cpp/protocol/protobuf/protobuf_crypto_client.h b/components/service/crypto/client/cpp/protocol/protobuf/protobuf_crypto_client.h
 index 085d9cfa..abe4439e 100644
 --- a/components/service/crypto/client/cpp/protocol/protobuf/protobuf_crypto_client.h
@@ -426,7 +428,7 @@ index 085d9cfa..abe4439e 100644
 @@ -54,7 +54,7 @@ public:
  		psa_key_id_t id,
  		uint8_t *data, size_t data_size, size_t *data_length);
-
+ 
 -	/* Sign/verify methods */
 +	/* Sign/verify hash methods */
  	psa_status_t sign_hash(
@@ -435,7 +437,7 @@ index 085d9cfa..abe4439e 100644
 @@ -67,6 +67,19 @@ public:
  		const uint8_t *hash, size_t hash_length,
  		const uint8_t *signature, size_t signature_length);
-
+ 
 +	/* Sign/verify message methods */
 +	psa_status_t sign_message(
 +		psa_key_id_t id,
@@ -453,9 +455,9 @@ index 085d9cfa..abe4439e 100644
  	psa_status_t asymmetric_encrypt(
  		psa_key_id_t id,
 @@ -221,6 +234,16 @@ public:
-
+ 
  private:
-
+ 
 +	psa_status_t asym_sign(uint32_t opcode,
 +		psa_key_id_t id, psa_algorithm_t alg,
 +		const uint8_t *hash, size_t hash_length,
@@ -480,11 +482,11 @@ index dc2f7e80..b6446253 100644
   *
   * SPDX-License-Identifier: BSD-3-Clause
   */
-
+ 
  #include <psa/crypto.h>
 +#include "psa_crypto_client.h"
 +#include "crypto_caller_selector.h"
-
+ 
  psa_status_t psa_sign_message(
 -	psa_key_id_t key,
 +	psa_key_id_t id,
@@ -499,7 +501,7 @@ index dc2f7e80..b6446253 100644
 -	uint8_t hash[PSA_HASH_MAX_SIZE];
 +	if (psa_crypto_client_instance.init_status != PSA_SUCCESS)
 +		return psa_crypto_client_instance.init_status;
-
+ 
 -	psa_status_t psa_status = psa_hash_compute(PSA_ALG_SIGN_GET_HASH(alg),
 +	return crypto_caller_sign_message(&psa_crypto_client_instance.base,
 +		id, alg,
@@ -527,11 +529,11 @@ index d0fbc7c8..57c2c5e8 100644
   *
   * SPDX-License-Identifier: BSD-3-Clause
   */
-
+ 
  #include <psa/crypto.h>
 +#include "psa_crypto_client.h"
 +#include "crypto_caller_selector.h"
-
+ 
  psa_status_t psa_verify_message(
 -	psa_key_id_t key,
 +	psa_key_id_t id,
@@ -545,7 +547,7 @@ index d0fbc7c8..57c2c5e8 100644
 -	uint8_t hash[PSA_HASH_MAX_SIZE];
 +	if (psa_crypto_client_instance.init_status != PSA_SUCCESS)
 +		return psa_crypto_client_instance.init_status;
-
+ 
 -	psa_status_t psa_status = psa_hash_compute(PSA_ALG_SIGN_GET_HASH(alg),
 +	return crypto_caller_verify_message(&psa_crypto_client_instance.base,
 +		id, alg,
@@ -601,12 +603,12 @@ index d0fc7cac..67a5b340 100644
 +	{TS_CRYPTO_OPCODE_SIGN_MESSAGE,         asymmetric_sign_handler},
 +	{TS_CRYPTO_OPCODE_VERIFY_MESSAGE,       asymmetric_verify_handler},
  };
-
+ 
  struct rpc_interface *crypto_provider_init(struct crypto_provider *context)
 @@ -272,7 +274,7 @@ static rpc_status_t import_key_handler(void *context, struct call_req* req)
  	return rpc_status;
  }
-
+ 
 -static rpc_status_t sign_hash_handler(void *context, struct call_req* req)
 +static rpc_status_t asymmetric_sign_handler(void *context, struct call_req* req)
  {
@@ -614,17 +616,17 @@ index d0fc7cac..67a5b340 100644
  	struct call_param_buf *req_buf = call_req_get_req_buf(req);
 @@ -284,7 +286,7 @@ static rpc_status_t sign_hash_handler(void *context, struct call_req* req)
  	uint8_t hash_buffer[PSA_HASH_MAX_SIZE];
-
+ 
  	if (serializer)
 -		rpc_status = serializer->deserialize_sign_hash_req(req_buf, &id, &alg, hash_buffer, &hash_len);
 +		rpc_status = serializer->deserialize_asymmetric_sign_req(req_buf, &id, &alg, hash_buffer, &hash_len);
-
+ 
  	if (rpc_status == TS_RPC_CALL_ACCEPTED) {
-
+ 
 @@ -292,14 +294,16 @@ static rpc_status_t sign_hash_handler(void *context, struct call_req* req)
  		size_t sig_len;
  		uint8_t sig_buffer[PSA_SIGNATURE_MAX_SIZE];
-
+ 
 -		psa_status = psa_sign_hash(id, alg,
 -					hash_buffer, hash_len,
 -					sig_buffer, sizeof(sig_buffer), &sig_len);
@@ -633,19 +635,19 @@ index d0fc7cac..67a5b340 100644
 +				sig_buffer, sizeof(sig_buffer), &sig_len) :
 +			psa_sign_message(id, alg, hash_buffer, hash_len,
 +				sig_buffer, sizeof(sig_buffer), &sig_len);
-
+ 
  		if (psa_status == PSA_SUCCESS) {
-
+ 
  			struct call_param_buf *resp_buf = call_req_get_resp_buf(req);
 -			rpc_status = serializer->serialize_sign_hash_resp(resp_buf, sig_buffer, sig_len);
 +			rpc_status = serializer->serialize_asymmetric_sign_resp(resp_buf, sig_buffer, sig_len);
  		}
-
+ 
  		call_req_set_opstatus(req, psa_status);
 @@ -308,7 +312,7 @@ static rpc_status_t sign_hash_handler(void *context, struct call_req* req)
  	return rpc_status;
  }
-
+ 
 -static rpc_status_t verify_hash_handler(void *context, struct call_req* req)
 +static rpc_status_t asymmetric_verify_handler(void *context, struct call_req* req)
  {
@@ -653,17 +655,17 @@ index d0fc7cac..67a5b340 100644
  	struct call_param_buf *req_buf = call_req_get_req_buf(req);
 @@ -322,7 +326,7 @@ static rpc_status_t verify_hash_handler(void *context, struct call_req* req)
  	uint8_t sig_buffer[PSA_SIGNATURE_MAX_SIZE];
-
+ 
  	if (serializer)
 -		rpc_status = serializer->deserialize_verify_hash_req(req_buf, &id, &alg,
 +		rpc_status = serializer->deserialize_asymmetric_verify_req(req_buf, &id, &alg,
  											hash_buffer, &hash_len,
  											sig_buffer, &sig_len);
-
+ 
 @@ -330,9 +334,13 @@ static rpc_status_t verify_hash_handler(void *context, struct call_req* req)
-
+ 
  		psa_status_t psa_status;
-
+ 
 -		psa_status = psa_verify_hash(id, alg,
 -					hash_buffer, hash_len,
 -					sig_buffer, sig_len);
@@ -674,7 +676,7 @@ index d0fc7cac..67a5b340 100644
 +			psa_verify_message(id, alg,
 +				hash_buffer, hash_len,
 +				sig_buffer, sig_len);
-
+ 
  		call_req_set_opstatus(req, psa_status);
  	}
 diff --git a/components/service/crypto/provider/serializer/crypto_provider_serializer.h b/components/service/crypto/provider/serializer/crypto_provider_serializer.h
@@ -683,17 +685,17 @@ index 68940cae..57364f24 100644
 +++ b/components/service/crypto/provider/serializer/crypto_provider_serializer.h
 @@ -79,15 +79,15 @@ struct crypto_provider_serializer {
                                          const psa_key_attributes_t *attributes);
-
+ 
      /* Operation: sign_hash */
 -    rpc_status_t (*deserialize_sign_hash_req)(const struct call_param_buf *req_buf,
 +    rpc_status_t (*deserialize_asymmetric_sign_req)(const struct call_param_buf *req_buf,
                                          psa_key_id_t *id, psa_algorithm_t *alg,
                                          uint8_t *hash, size_t *hash_len);
-
+ 
 -    rpc_status_t (*serialize_sign_hash_resp)(struct call_param_buf *resp_buf,
 +    rpc_status_t (*serialize_asymmetric_sign_resp)(struct call_param_buf *resp_buf,
                                          const uint8_t *sig, size_t sig_len);
-
+ 
      /* Operation: verify_hash */
 -    rpc_status_t (*deserialize_verify_hash_req)(const struct call_param_buf *req_buf,
 +    rpc_status_t (*deserialize_asymmetric_verify_req)(const struct call_param_buf *req_buf,
@@ -706,7 +708,7 @@ index c70db865..4a7e59f0 100644
 +++ b/components/service/crypto/provider/serializer/packed-c/packedc_crypto_provider_serializer.c
 @@ -333,7 +333,7 @@ static rpc_status_t serialize_get_key_attributes_resp(struct call_param_buf *res
  }
-
+ 
  /* Operation: sign_hash */
 -static rpc_status_t deserialize_sign_hash_req(const struct call_param_buf *req_buf,
 +static rpc_status_t deserialize_asymmetric_sign_req(const struct call_param_buf *req_buf,
@@ -716,7 +718,7 @@ index c70db865..4a7e59f0 100644
 @@ -378,7 +378,7 @@ static rpc_status_t deserialize_sign_hash_req(const struct call_param_buf *req_b
      return rpc_status;
  }
-
+ 
 -static rpc_status_t serialize_sign_hash_resp(struct call_param_buf *resp_buf,
 +static rpc_status_t serialize_asymmetric_sign_resp(struct call_param_buf *resp_buf,
                              const uint8_t *sig, size_t sig_len)
@@ -724,7 +726,7 @@ index c70db865..4a7e59f0 100644
      rpc_status_t rpc_status = TS_RPC_ERROR_INTERNAL;
 @@ -401,7 +401,7 @@ static rpc_status_t serialize_sign_hash_resp(struct call_param_buf *resp_buf,
  }
-
+ 
  /* Operation: verify_hash */
 -static rpc_status_t deserialize_verify_hash_req(const struct call_param_buf *req_buf,
 +static rpc_status_t deserialize_asymmetric_verify_req(const struct call_param_buf *req_buf,
@@ -750,7 +752,7 @@ index 7767d20a..083a581a 100644
 +++ b/components/service/crypto/provider/serializer/protobuf/pb_crypto_provider_serializer.c
 @@ -267,9 +267,9 @@ static rpc_status_t serialize_get_key_attributes_resp(struct call_param_buf *res
  }
-
+ 
  /* Operation: sign_hash */
 -static rpc_status_t deserialize_sign_hash_req(const struct call_param_buf *req_buf,
 -                            psa_key_id_t *id, psa_algorithm_t *alg,
@@ -764,7 +766,7 @@ index 7767d20a..083a581a 100644
 @@ -295,8 +295,8 @@ static rpc_status_t deserialize_sign_hash_req(const struct call_param_buf *req_b
      return rpc_status;
  }
-
+ 
 -static rpc_status_t serialize_sign_hash_resp(struct call_param_buf *resp_buf,
 -                            const uint8_t *sig, size_t sig_len)
 +static rpc_status_t serialize_asymmetric_sign_resp(struct call_param_buf *resp_buf,
@@ -774,7 +776,7 @@ index 7767d20a..083a581a 100644
      rpc_status_t rpc_status = TS_RPC_ERROR_INTERNAL;
 @@ -323,10 +323,10 @@ static rpc_status_t serialize_sign_hash_resp(struct call_param_buf *resp_buf,
  }
-
+ 
  /* Operation: verify_hash */
 -static rpc_status_t deserialize_verify_hash_req(const struct call_param_buf *req_buf,
 -                                psa_key_id_t *id, psa_algorithm_t *alg,
@@ -860,7 +862,7 @@ index bd6c66ee..da01abf4 100644
   * SPDX-License-Identifier: BSD-3-Clause
   */
 @@ -18,15 +18,16 @@ TEST_GROUP(CryptoProtocolOpcodeChecks)
-
+ 
  TEST(CryptoProtocolOpcodeChecks, checkPackedcToProtobuf)
  {
 -    CHECK_EQUAL(TS_CRYPTO_OPCODE_GENERATE_KEY, ts_crypto_Opcode_GENERATE_KEY);
@@ -901,7 +903,7 @@ index ec2c6736..b3345551 100644
 @@ -290,6 +290,56 @@ void crypto_service_scenarios::signAndVerifyHash()
  	CHECK_EQUAL(PSA_SUCCESS, status);
  }
-
+ 
 +void crypto_service_scenarios::signAndVerifyMessage()
 +{
 +	psa_status_t status;
@@ -958,7 +960,7 @@ index ec2c6736..b3345551 100644
 @@ -348,7 +398,7 @@ void crypto_service_scenarios::asymEncryptDecrypt()
  	psa_key_attributes_t attributes = PSA_KEY_ATTRIBUTES_INIT;
  	psa_key_id_t key_id;
-
+ 
 -	psa_set_key_id(&attributes, 14);
 +	psa_set_key_id(&attributes, 15);
  	psa_set_key_usage_flags(&attributes, PSA_KEY_USAGE_ENCRYPT | PSA_KEY_USAGE_DECRYPT);
@@ -967,7 +969,7 @@ index ec2c6736..b3345551 100644
 @@ -394,7 +444,7 @@ void crypto_service_scenarios::asymEncryptDecryptWithSalt()
  	psa_key_attributes_t attributes = PSA_KEY_ATTRIBUTES_INIT;
  	psa_key_id_t key_id;
-
+ 
 -	psa_set_key_id(&attributes, 15);
 +	psa_set_key_id(&attributes, 16);
  	psa_set_key_usage_flags(&attributes, PSA_KEY_USAGE_ENCRYPT | PSA_KEY_USAGE_DECRYPT);
@@ -1006,7 +1008,7 @@ index 79eddfbb..ea238432 100644
 @@ -87,6 +87,11 @@ TEST(CryptoServicePackedcTests, signAndVerifyHash)
  	m_scenarios->signAndVerifyHash();
  }
-
+ 
 +TEST(CryptoServicePackedcTests, signAndVerifyMessage)
 +{
 +	m_scenarios->signAndVerifyMessage();
@@ -1029,7 +1031,7 @@ index 1230752c..c172ad4a 100644
 @@ -77,6 +77,11 @@ TEST(CryptoServiceProtobufTests, signAndVerifyHash)
      m_scenarios->signAndVerifyHash();
  }
-
+ 
 +TEST(CryptoServiceProtobufTests, signAndVerifyMessage)
 +{
 +    m_scenarios->signAndVerifyMessage();
@@ -1055,7 +1057,7 @@ index a07bd57e..5aebf2fa 100644
  #define TS_CRYPTO_OPCODE_GET_KEY_ATTRIBUTES     (TS_CRYPTO_OPCODE_BASE + 15)
 +#define TS_CRYPTO_OPCODE_SIGN_MESSAGE           (TS_CRYPTO_OPCODE_BASE + 16)
 +#define TS_CRYPTO_OPCODE_VERIFY_MESSAGE         (TS_CRYPTO_OPCODE_BASE + 17)
-
+ 
  /* Hash operations */
  #define TS_CRYPTO_OPCODE_HASH_BASE              (0x0200)
 diff --git a/protocols/service/crypto/protobuf/opcodes.proto b/protocols/service/crypto/protobuf/opcodes.proto
@@ -1076,5 +1078,3 @@ index 094d3a02..ef64d044 100644
 +  SIGN_MESSAGE        = 0x0110;
 +  VERIFY_MESSAGE      = 0x0111;
  }
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0037-Add-defence-against-uninitialised-multi-part-transac.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0037-Add-defence-against-uninitialised-multi-part-transac.patch
index af156b0a..a56e0f88 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0037-Add-defence-against-uninitialised-multi-part-transac.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0037-Add-defence-against-uninitialised-multi-part-transac.patch
@@ -1,11 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 68e189877ea1aa893facafb8b336e92112555e07 Mon Sep 17 00:00:00 2001
+From 9a83c32964ee2b1ecb7b36b4c08466202efd3bf2 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Fri, 11 Feb 2022 14:19:26 +0000
-Subject: [PATCH 05/15] Add defence against uninitialised multi-part
- transaction
+Subject: [PATCH] Add defence against uninitialised multi-part transaction
 
 Adds checks for the condition where there is an attempt to
 setup a multi-part transaction without first initialising
@@ -13,6 +9,11 @@ transaction state.
 
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: I754479260fed0490d8f32b41a077d26028dc9903
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  components/service/crypto/client/psa/psa_cipher.c | 14 +++++++++++++-
  components/service/crypto/client/psa/psa_hash.c   |  8 +++++++-
@@ -70,7 +71,7 @@ index 7005c390..83278de6 100644
 @@ -14,6 +14,9 @@ psa_status_t psa_hash_setup(psa_hash_operation_t *operation,
  	if (psa_crypto_client_instance.init_status != PSA_SUCCESS)
  		return psa_crypto_client_instance.init_status;
-
+ 
 +	if (operation->handle)
 +		return PSA_ERROR_BAD_STATE;
 +
@@ -101,7 +102,7 @@ index 5efa1c4d..5c5eb32a 100644
 @@ -16,6 +16,9 @@ psa_status_t psa_mac_sign_setup(psa_mac_operation_t *operation,
  	if (psa_crypto_client_instance.init_status != PSA_SUCCESS)
  		return psa_crypto_client_instance.init_status;
-
+ 
 +	if (operation->handle)
 +		return PSA_ERROR_BAD_STATE;
 +
@@ -111,7 +112,7 @@ index 5efa1c4d..5c5eb32a 100644
 @@ -28,7 +31,10 @@ psa_status_t psa_mac_verify_setup(psa_mac_operation_t *operation,
  	if (psa_crypto_client_instance.init_status != PSA_SUCCESS)
  		return psa_crypto_client_instance.init_status;
-
+ 
 -	return crypto_caller_mac_sign_setup(&psa_crypto_client_instance.base,
 +	if (operation->handle)
 +		return PSA_ERROR_BAD_STATE;
@@ -120,5 +121,3 @@ index 5efa1c4d..5c5eb32a 100644
  		&operation->handle,
  		key, alg);
  }
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0038-Integrate-AEAD-operation-support.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0038-Integrate-AEAD-operation-support.patch
index 9c2ac43a..2ad1efb7 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0038-Integrate-AEAD-operation-support.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0038-Integrate-AEAD-operation-support.patch
@@ -1,16 +1,18 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From d800f7eaa25efca41535a223ef5d524651dee103 Mon Sep 17 00:00:00 2001
+From 00b4f777b377c69f948f5a9d68cbfc8fa8c38a86 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Fri, 11 Feb 2022 14:24:53 +0000
-Subject: [PATCH 06/15] Integrate AEAD operation support
+Subject: [PATCH] Integrate AEAD operation support
 
 Resolves issues and integrates AEAD support into the crypto service
 provider and clients.
 
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: I5fbe78a2dd825f592e26fd665f60c18b576f9de9
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  .../caller/packed-c/crypto_caller_aead.h      |  70 +++---
  .../client/caller/stub/crypto_caller_aead.h   |  12 +-
@@ -36,7 +38,7 @@ index 3d9947d5..c4ffb20c 100644
 @@ -20,38 +20,6 @@
  extern "C" {
  #endif
-
+ 
 -static inline psa_status_t crypto_caller_aead_encrypt(struct service_client *context,
 -	psa_key_id_t key,
 -	psa_algorithm_t alg,
@@ -79,12 +81,12 @@ index 3d9947d5..c4ffb20c 100644
 -	size_t req_fixed_len = sizeof(struct ts_crypto_aead_abort_in);
 +	size_t req_fixed_len = sizeof(struct ts_crypto_aead_set_lengths_in);
  	size_t req_len = req_fixed_len;
-
+ 
  	req_msg.op_handle = op_handle;
 @@ -611,6 +579,40 @@ static inline psa_status_t crypto_caller_aead_abort(struct service_client *conte
  	return psa_status;
  }
-
+ 
 +/**
 + * The maximum data length that may be carried in an update operation will be
 + * constrained by the maximum call payload capacity imposed by the end-to-end
@@ -136,7 +138,7 @@ index 18aa8cec..455e7ac1 100644
 @@ -135,6 +135,16 @@ static inline psa_status_t crypto_caller_aead_abort(struct service_client *conte
  	return PSA_ERROR_NOT_SUPPORTED;
  }
-
+ 
 +static inline size_t crypto_caller_aead_max_update_ad_size(const struct service_client *context)
 +{
 +	return 0;
@@ -164,7 +166,7 @@ index 22fd3da1..e4579e63 100644
 @@ -8,37 +8,6 @@
  #include "psa_crypto_client.h"
  #include "crypto_caller_selector.h"
-
+ 
 -
 -psa_status_t psa_aead_encrypt(psa_key_id_t key,
 -	psa_algorithm_t alg,
@@ -410,19 +412,19 @@ index 2d926eb6..ee2b4473 100644
 +#include <service/crypto/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serializer.h>
  #include <service/discovery/provider/discovery_provider.h>
  #include <service/discovery/provider/serializer/packed-c/packedc_discovery_provider_serializer.h>
-
+ 
 @@ -34,6 +36,7 @@ static struct full_crypto_provider
  	struct cipher_provider cipher_provider;
  	struct key_derivation_provider key_derivation_provider;
  	struct mac_provider mac_provider;
 +	struct aead_provider aead_provider;
-
+ 
  } instance;
-
+ 
 @@ -98,6 +101,17 @@ struct crypto_provider *crypto_provider_factory_create(void)
  	crypto_provider_extend(&instance.crypto_provider,
  		&instance.mac_provider.base_provider);
-
+ 
 +	/**
 +	 * Extend with aead operations
 +	 */
@@ -436,7 +438,7 @@ index 2d926eb6..ee2b4473 100644
 +
  	return &instance.crypto_provider;
  }
-
+ 
 diff --git a/deployments/component-test/component-test.cmake b/deployments/component-test/component-test.cmake
 index a0233c34..c3b015ab 100644
 --- a/deployments/component-test/component-test.cmake
@@ -517,5 +519,3 @@ index 953bb716..24a8ca65 100644
  		"components/service/crypto/factory/full"
  		"components/service/secure_storage/include"
  		"components/service/secure_storage/frontend/secure_storage_provider"
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.patch
index c4c83c91..0c93a26c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 0e743c9e00249b0fe50b1b2d28d06a8568569736 Mon Sep 17 00:00:00 2001
+From 43388a8e071980d9146f935f486a859d0a04322b Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Tue, 15 Feb 2022 15:46:58 +0000
-Subject: [PATCH 07/15] Add IV generation to one-shot cipher operation
+Subject: [PATCH] Add IV generation to one-shot cipher operation
 
 The functions psa_cipher_encrypt and psa_cipher_decrypt are
 one-shot operations that can take an arbitrary sized input.
@@ -18,6 +15,11 @@ failures.
 
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: I4afb555ee7062ebb387e5bb27fb1e082288ad8c7
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  .../service/crypto/client/psa/psa_cipher.c    | 40 +++++++++++++++----
  1 file changed, 33 insertions(+), 7 deletions(-)
@@ -29,15 +31,15 @@ index 3ab8ea21..111af829 100644
 @@ -8,7 +8,6 @@
  #include "psa_crypto_client.h"
  #include "crypto_caller_selector.h"
-
+ 
 -
  psa_status_t psa_cipher_encrypt_setup(psa_cipher_operation_t *operation,
  	psa_key_id_t key,
  	psa_algorithm_t alg)
 @@ -171,9 +170,16 @@ psa_status_t psa_cipher_encrypt(psa_key_id_t key,
-
+ 
  	if (psa_status == PSA_SUCCESS) {
-
+ 
 +		size_t ciphertext_len = 0;
 +		size_t iv_len = 0;
 +
@@ -50,7 +52,7 @@ index 3ab8ea21..111af829 100644
 +
 +		*output_length = iv_len + ciphertext_len;
  	}
-
+ 
  	return psa_status;
 @@ -187,14 +193,34 @@ psa_status_t psa_cipher_decrypt(psa_key_id_t key,
  	size_t output_size,
@@ -60,9 +62,9 @@ index 3ab8ea21..111af829 100644
 -	psa_status_t psa_status = psa_cipher_decrypt_setup(&operation, key, alg);
 +	psa_key_attributes_t attributes = PSA_KEY_ATTRIBUTES_INIT;
 +	psa_status_t psa_status = psa_get_key_attributes(key, &attributes);
-
+ 
  	if (psa_status == PSA_SUCCESS) {
-
+ 
 -		psa_status = multi_cipher_update(&operation,
 -			input, input_length,
 -			output, output_size, output_length);
@@ -90,7 +92,5 @@ index 3ab8ea21..111af829 100644
 +
 +		psa_reset_key_attributes(&attributes);
  	}
-
+ 
  	return psa_status;
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0040-Fix-multi-part-termination-on-error.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0040-Fix-multi-part-termination-on-error.patch
index 05e3b975..bdafcead 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0040-Fix-multi-part-termination-on-error.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0040-Fix-multi-part-termination-on-error.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 51563497958036271a23de8ae28f174db1296689 Mon Sep 17 00:00:00 2001
+From 07277e2ab4b54e5844c28f0cb33e64a91aa5f492 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Wed, 16 Feb 2022 10:37:04 +0000
-Subject: [PATCH 08/15] Fix multi-part termination on error
+Subject: [PATCH] Fix multi-part termination on error
 
 For multi-part operations, the PSA Crypto API specifies that if
 the final operation does not return PSA_SUCCESS, the abort
@@ -13,6 +10,11 @@ This change modifies behaviour in-line with the API definition.
 
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: Ia3d3ec004164647a7ab5988cac45c39c22e76e9a
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  components/service/crypto/client/psa/psa_aead.c       |  8 ++++++++
  components/service/crypto/client/psa/psa_cipher.c     |  4 ++++
@@ -29,7 +31,7 @@ index e4579e63..559eb6a3 100644
 --- a/components/service/crypto/client/psa/psa_aead.c
 +++ b/components/service/crypto/client/psa/psa_aead.c
 @@ -241,6 +241,10 @@ psa_status_t psa_aead_encrypt(psa_key_id_t key,
-
+ 
  			*aeadtext_length = bytes_output + remaining_aead_len + tag_len;
  		}
 +		else {
@@ -38,9 +40,9 @@ index e4579e63..559eb6a3 100644
 +		}
  	}
  	else {
-
+ 
 @@ -292,6 +296,10 @@ psa_status_t psa_aead_decrypt(psa_key_id_t key,
-
+ 
  			*plaintext_length = bytes_output + remaining_plaintext_len;
  		}
 +		else {
@@ -49,13 +51,13 @@ index e4579e63..559eb6a3 100644
 +		}
  	}
  	else {
-
+ 
 diff --git a/components/service/crypto/client/psa/psa_cipher.c b/components/service/crypto/client/psa/psa_cipher.c
 index 111af829..4e4264b6 100644
 --- a/components/service/crypto/client/psa/psa_cipher.c
 +++ b/components/service/crypto/client/psa/psa_cipher.c
 @@ -146,6 +146,10 @@ static psa_status_t multi_cipher_update(psa_cipher_operation_t *operation,
-
+ 
  				*output_length = bytes_output + finish_output_len;
  			}
 +			else {
@@ -64,14 +66,14 @@ index 111af829..4e4264b6 100644
 +			}
  		}
  		else {
-
+ 
 diff --git a/components/service/crypto/client/psa/psa_hash.c b/components/service/crypto/client/psa/psa_hash.c
 index 83278de6..e5dd0030 100644
 --- a/components/service/crypto/client/psa/psa_hash.c
 +++ b/components/service/crypto/client/psa/psa_hash.c
 @@ -137,6 +137,11 @@ psa_status_t psa_hash_compare(psa_algorithm_t alg,
  	if (psa_status == PSA_SUCCESS) {
-
+ 
  		psa_status = psa_hash_verify(&operation, hash, hash_length);
 +
 +		if (psa_status != PSA_SUCCESS) {
@@ -79,11 +81,11 @@ index 83278de6..e5dd0030 100644
 +			psa_hash_abort(&operation);
 +		}
  	}
-
+ 
  	return psa_status;
 @@ -155,6 +160,11 @@ psa_status_t psa_hash_compute(psa_algorithm_t alg,
  	if (psa_status == PSA_SUCCESS) {
-
+ 
  		psa_status = psa_hash_finish(&operation, hash, hash_size, hash_length);
 +
 +		if (psa_status != PSA_SUCCESS) {
@@ -91,7 +93,7 @@ index 83278de6..e5dd0030 100644
 +			psa_hash_abort(&operation);
 +		}
  	}
-
+ 
  	return psa_status;
 diff --git a/components/service/crypto/client/psa/psa_mac.c b/components/service/crypto/client/psa/psa_mac.c
 index 5c5eb32a..a3db8644 100644
@@ -99,7 +101,7 @@ index 5c5eb32a..a3db8644 100644
 +++ b/components/service/crypto/client/psa/psa_mac.c
 @@ -129,6 +129,11 @@ psa_status_t psa_mac_verify(psa_key_id_t key,
  	if (psa_status == PSA_SUCCESS) {
-
+ 
  		psa_status = psa_mac_verify_finish(&operation, mac, mac_length);
 +
 +		if (psa_status != PSA_SUCCESS) {
@@ -107,11 +109,11 @@ index 5c5eb32a..a3db8644 100644
 +			psa_mac_abort(&operation);
 +		}
  	}
-
+ 
  	return psa_status;
 @@ -153,6 +158,11 @@ psa_status_t psa_mac_compute(psa_key_id_t key,
  	if (psa_status == PSA_SUCCESS) {
-
+ 
  		psa_status = psa_mac_sign_finish(&operation, mac, mac_size, mac_length);
 +
 +		if (psa_status != PSA_SUCCESS) {
@@ -119,7 +121,7 @@ index 5c5eb32a..a3db8644 100644
 +			psa_mac_abort(&operation);
 +		}
  	}
-
+ 
  	return psa_status;
 diff --git a/components/service/crypto/provider/extension/aead/aead_provider.c b/components/service/crypto/provider/extension/aead/aead_provider.c
 index f4e81a03..14a25436 100644
@@ -137,24 +139,24 @@ index f4e81a03..14a25436 100644
  					ciphertext, ciphertext_len,
  					tag, tag_len);
 -			}
-
+ 
 -			crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +				crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +			}
  		}
-
+ 
  		call_req_set_opstatus(req, psa_status);
 @@ -418,9 +418,9 @@ static rpc_status_t aead_verify_handler(void *context, struct call_req *req)
  				struct call_param_buf *resp_buf = call_req_get_resp_buf(req);
  				rpc_status = serializer->serialize_aead_verify_resp(resp_buf,
  					plaintext, plaintext_len);
 -			}
-
+ 
 -			crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +				crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +			}
  		}
-
+ 
  		call_req_set_opstatus(req, psa_status);
 diff --git a/components/service/crypto/provider/extension/cipher/cipher_provider.c b/components/service/crypto/provider/extension/cipher/cipher_provider.c
 index 8e7a86de..a5dd0371 100644
@@ -168,16 +170,16 @@ index 8e7a86de..a5dd0371 100644
   * SPDX-License-Identifier: BSD-3-Clause
   */
 @@ -283,9 +283,9 @@ static rpc_status_t cipher_finish_handler(void *context, struct call_req* req)
-
+ 
  				struct call_param_buf *resp_buf = call_req_get_resp_buf(req);
  				rpc_status = serializer->serialize_cipher_finish_resp(resp_buf, output, output_len);
 -			}
-
+ 
 -			crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +				crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +			}
  		}
-
+ 
  		call_req_set_opstatus(req, psa_status);
 diff --git a/components/service/crypto/provider/extension/hash/hash_provider.c b/components/service/crypto/provider/extension/hash/hash_provider.c
 index 2c560513..fd39d440 100644
@@ -191,16 +193,16 @@ index 2c560513..fd39d440 100644
   * SPDX-License-Identifier: BSD-3-Clause
   */
 @@ -179,9 +179,9 @@ static rpc_status_t hash_finish_handler(void *context, struct call_req* req)
-
+ 
  				struct call_param_buf *resp_buf = call_req_get_resp_buf(req);
  				rpc_status = serializer->serialize_hash_finish_resp(resp_buf, hash, hash_len);
 -			}
-
+ 
 -			crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +				crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +			}
  		}
-
+ 
  		call_req_set_opstatus(req, psa_status);
 diff --git a/components/service/crypto/provider/extension/mac/mac_provider.c b/components/service/crypto/provider/extension/mac/mac_provider.c
 index 96fe4cf3..eef55586 100644
@@ -214,28 +216,26 @@ index 96fe4cf3..eef55586 100644
   * SPDX-License-Identifier: BSD-3-Clause
   */
 @@ -181,9 +181,9 @@ static rpc_status_t mac_sign_finish_handler(void *context, struct call_req* req)
-
+ 
  				struct call_param_buf *resp_buf = call_req_get_resp_buf(req);
  				rpc_status = serializer->serialize_mac_sign_finish_resp(resp_buf, mac, mac_len);
 -			}
-
+ 
 -			crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +				crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +			}
  		}
-
+ 
  		call_req_set_opstatus(req, psa_status);
 @@ -220,7 +220,10 @@ static rpc_status_t mac_verify_finish_handler(void *context, struct call_req* re
-
+ 
  			psa_status = psa_mac_verify_finish(&crypto_context->op.mac, mac, mac_len);
-
+ 
 -			crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +			if (psa_status == PSA_SUCCESS) {
 +
 +				crypto_context_pool_free(&this_instance->context_pool, crypto_context);
 +			}
  		}
-
+ 
  		call_req_set_opstatus(req, psa_status);
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-to.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-to.patch
index 84f71e51..6a11552d 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-to.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-to.patch
@@ -1,11 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From c0549d9949d9c19a120b7bde3409201a5db8f2b2 Mon Sep 17 00:00:00 2001
+From 92987ec20beedb44d08d429947958c1c068d815c Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Wed, 16 Feb 2022 11:36:09 +0000
-Subject: [PATCH 09/15] Abort AEAD operation if client provided buffer is too
- small
+Subject: [PATCH] Abort AEAD operation if client provided buffer is too small
 
 To enable PSA Arch test c258 to pass, handling is added in the
 PSA API client adaptor for AEAD (psa_aead.c) to abort an AEAD
@@ -14,6 +10,11 @@ provided buffer for the output is too small.
 
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: Ib4b26ebc0a83a8928e1b643fba4becd935f6deb0
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  components/service/crypto/client/psa/psa_aead.c | 14 +++++++++++++-
  1 file changed, 13 insertions(+), 1 deletion(-)
@@ -44,7 +45,5 @@ index 559eb6a3..c820d222 100644
 +
 +	return status;
  }
-
+ 
  psa_status_t psa_aead_finish(psa_aead_operation_t *operation,
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch
index 8ba59e0a..fedb79ce 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch
@@ -1,10 +1,7 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 9fb18f0cfba8f97fa71a5e7e7e3e31a43692a8e0 Mon Sep 17 00:00:00 2001
+From 75c0689513e7da7fb26bf23c1da4e1aa49783d46 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Tue, 11 Jan 2022 09:43:52 +0000
-Subject: [PATCH 10/15] Peg to updated t_cose version fc3a4b2c
+Subject: [PATCH] Peg to updated t_cose version fc3a4b2c
 
 The current version of TS fails to build due to a regression introduced
 by a new t_cose version in the upstream project.
@@ -19,6 +16,11 @@ so the previously required compatibility patch has been removed.
 
 Signed-off-by: Julian Hall <julian.hall@arm.com>
 Change-Id: I9491a5210904cc369846da2af45b0f7e5913bed8
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  .../0002-add-tls3_0_0-compatibility.patch     | 31 -------------------
  external/t_cose/t_cose.cmake                  |  5 ++-
@@ -90,6 +92,3 @@ index 660824bd..9321466f 100644
  		COMMAND git reset HEAD~1
  
  )
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0043-pass-sysroot_yocto.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0043-pass-sysroot_yocto.patch
index 5b2b7ce7..64ac0940 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0043-pass-sysroot_yocto.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0043-pass-sysroot_yocto.patch
@@ -1,10 +1,11 @@
+From 24436d459ddde697c89ff947c821cec9c5e0906e Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Wed, 16 Feb 2022 15:55:55 +0000
+Subject: [PATCH] pass sysroot_yocto
+
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
 
-From 386a086debf70f739a7dfc0bdce9c4f1053ba8d5 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Wed, 16 Feb 2022 15:55:55 +0000
-Subject: [PATCH 11/15] pass sysroot_yocto
 
 ---
  deployments/libts/libts-import.cmake         |  3 +++
@@ -17,9 +18,9 @@ index 792ba86c..b900ce3f 100644
 --- a/deployments/libts/libts-import.cmake
 +++ b/deployments/libts/libts-import.cmake
 @@ -27,9 +27,12 @@ set(LIBTS_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/libts-build" CACHE PATH
-
+ 
  file(MAKE_DIRECTORY ${LIBTS_BINARY_DIR})
-
+ 
 +set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --sysroot=${SYSROOT_YOCTO}")
 +
  #Configure the library
@@ -48,7 +49,7 @@ index f6d2fb9f..42f73a37 100644
 @@ -5,30 +5,33 @@
  #
  #-------------------------------------------------------------------------------
-
+ 
 -# Temporarily using modified tests used for tf-m verification
 +# Determine the number of processes to run while running parallel builds.
 +# Pass -DPROCESSOR_COUNT=<n> to cmake to override.
@@ -68,7 +69,7 @@ index f6d2fb9f..42f73a37 100644
 -set(PSA_ARCH_TESTS_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/psa_arch_tests-src" CACHE PATH "psa-arch-tests source.")
 +
 +include(FetchContent)
-
+ 
  # Checking git
  find_program(GIT_COMMAND "git")
  if (NOT GIT_COMMAND)
@@ -85,7 +86,7 @@ index f6d2fb9f..42f73a37 100644
 -	PATCH_COMMAND git stash
 -		COMMAND git apply ${CMAKE_CURRENT_LIST_DIR}/modify_attest_config.patch
  )
-
+ 
  # FetchContent_GetProperties exports psa-arch-tests_SOURCE_DIR and psa-arch-tests_BINARY_DIR variables
 @@ -37,7 +40,10 @@ if(NOT psa-arch-tests_POPULATED)
  	message(STATUS "Fetching psa-arch-tests")
@@ -98,7 +99,7 @@ index f6d2fb9f..42f73a37 100644
 +endif()
  # Ensure list of include paths is separated correctly
  string(REPLACE ";" "\\;" PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS "${PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS}")
-
+ 
 @@ -47,6 +53,7 @@ string(REPLACE ";" " " PSA_ARCH_TEST_EXTERNAL_DEFS "${PSA_ARCH_TEST_EXTERNAL_DEF
  # Configure the psa-arch-test library
  execute_process(COMMAND
@@ -107,5 +108,3 @@ index f6d2fb9f..42f73a37 100644
  			-DTOOLCHAIN=INHERIT
  			-DCMAKE_TOOLCHAIN_FILE=${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
  			-DPSA_INCLUDE_PATHS=${PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS}
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
index 94a184e2..68d0a978 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
@@ -1,13 +1,14 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 8bb6a36a36defc9e6cc234404276bf5fea8e8ad4 Mon Sep 17 00:00:00 2001
+From 0a0007d594db2fceed413cd73e7f08dd8d8ddd57 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Sun, 13 Feb 2022 09:01:10 +0000
-Subject: [PATCH 12/15] Fix: Crypto interface structure aligned with tf-m
- change.
+Subject: [PATCH] Fix: Crypto interface structure aligned with tf-m change.
 
 NO NEED TO RAISE PR: The PR for this FIX  is raied by Emek.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
@@ -26,5 +27,3 @@ index c13c20e8..ec25eaf8 100644
  	struct psa_ipc_crypto_aead_pack_input aead_in; /*!< FixMe: Temporarily used for
  							    *   AEAD until the API is
  							    *   restructured
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.patch
index 0213b86a..a08ab32f 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.patch
@@ -1,12 +1,14 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 0469b4650bb011ec157286dbae0f1cef5cbfbe41 Mon Sep 17 00:00:00 2001
+From b8060d9e15b1b910cf9b466a3f43088c71d7a38f Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Sun, 13 Feb 2022 09:49:51 +0000
-Subject: [PATCH 13/15] Integrate remaining psa-ipc client APIs.
+Subject: [PATCH] Integrate remaining psa-ipc client APIs.
 
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  .../caller/psa_ipc/crypto_caller_aead.h       | 297 +++++++++++++++++-
  .../caller/psa_ipc/crypto_caller_sign_hash.h  |  35 +++
@@ -14,7 +16,7 @@ Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
  3 files changed, 352 insertions(+), 13 deletions(-)
 
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
-index 78517fe3..9c64fe62 100644
+index 78517fe3..f6aadd8b 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
 @@ -152,7 +152,27 @@ static inline psa_status_t crypto_caller_aead_encrypt_setup(
@@ -44,7 +46,7 @@ index 78517fe3..9c64fe62 100644
 +
 +	return status;
  }
-
+ 
  static inline psa_status_t crypto_caller_aead_decrypt_setup(
 @@ -161,7 +181,26 @@ static inline psa_status_t crypto_caller_aead_decrypt_setup(
  					    psa_key_id_t key,
@@ -72,7 +74,7 @@ index 78517fe3..9c64fe62 100644
 +	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
 +	return status;
  }
-
+ 
  static inline psa_status_t crypto_caller_aead_generate_nonce(
 @@ -171,7 +210,27 @@ static inline psa_status_t crypto_caller_aead_generate_nonce(
  					     size_t nonce_size,
@@ -101,7 +103,7 @@ index 78517fe3..9c64fe62 100644
 +	*nonce_length = out_vec[1].len;
 +	return status;
  }
-
+ 
  static inline psa_status_t crypto_caller_aead_set_nonce(
 @@ -180,7 +239,25 @@ static inline psa_status_t crypto_caller_aead_set_nonce(
  						const uint8_t *nonce,
@@ -128,7 +130,7 @@ index 78517fe3..9c64fe62 100644
 +	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
 +	return status;
  }
-
+ 
  static inline psa_status_t crypto_caller_aead_set_lengths(
 @@ -189,7 +266,27 @@ static inline psa_status_t crypto_caller_aead_set_lengths(
  					  size_t ad_length,
@@ -157,7 +159,7 @@ index 78517fe3..9c64fe62 100644
 +
 +	return status;
  }
-
+ 
  static inline psa_status_t crypto_caller_aead_update_ad(
 @@ -198,7 +295,35 @@ static inline psa_status_t crypto_caller_aead_update_ad(
  						const uint8_t *input,
@@ -194,7 +196,7 @@ index 78517fe3..9c64fe62 100644
 +	                   in_len, out_vec, IOVEC_LEN(out_vec));
 +	return status;
  }
-
+ 
  static inline psa_status_t crypto_caller_aead_update(
 @@ -210,7 +335,38 @@ static inline psa_status_t crypto_caller_aead_update(
  					     size_t output_size,
@@ -234,7 +236,7 @@ index 78517fe3..9c64fe62 100644
 +	*output_length = out_vec[1].len;
 +	return status;
  }
-
+ 
  static inline psa_status_t crypto_caller_aead_finish(
 @@ -223,7 +379,48 @@ static inline psa_status_t crypto_caller_aead_finish(
  					     size_t tag_size,
@@ -284,7 +286,7 @@ index 78517fe3..9c64fe62 100644
 +	}
 +	return status;
  }
-
+ 
  static inline psa_status_t crypto_caller_aead_verify(
 @@ -235,14 +432,94 @@ static inline psa_status_t crypto_caller_aead_verify(
  					     const uint8_t *tag,
@@ -332,7 +334,7 @@ index 78517fe3..9c64fe62 100644
 +	}
 +	return status;
  }
-
+ 
  static inline psa_status_t crypto_caller_aead_abort(
  					    struct service_client *context,
  					    uint32_t op_handle)
@@ -381,7 +383,7 @@ index 78517fe3..9c64fe62 100644
 +
 +	return (payload_space > overhead) ? payload_space - overhead : 0;
  }
-
+ 
  #ifdef __cplusplus
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h
 index 71d88ced..e4a2b167 100644
@@ -390,7 +392,7 @@ index 71d88ced..e4a2b167 100644
 @@ -57,6 +57,41 @@ static inline psa_status_t crypto_caller_sign_hash(struct service_client *contex
  	return status;
  }
-
+ 
 +static inline psa_status_t crypto_caller_sign_message(struct service_client *context,
 +						   psa_key_id_t id,
 +						   psa_algorithm_t alg,
@@ -436,7 +438,7 @@ index e16f6e54..cc9279ee 100644
 @@ -24,19 +24,20 @@
  extern "C" {
  #endif
-
+ 
 -static inline psa_status_t crypto_caller_verify_hash(struct service_client *context,
 +static inline psa_status_t crypto_caller_common(struct service_client *context,
  						     psa_key_id_t id,
@@ -460,7 +462,7 @@ index e16f6e54..cc9279ee 100644
 @@ -52,6 +53,32 @@ static inline psa_status_t crypto_caller_verify_hash(struct service_client *cont
  	return status;
  }
-
+ 
 +static inline psa_status_t crypto_caller_verify_hash(struct service_client *context,
 +						     psa_key_id_t id,
 +						     psa_algorithm_t alg,
@@ -490,5 +492,3 @@ index e16f6e54..cc9279ee 100644
  #ifdef __cplusplus
  }
  #endif
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-the.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
index 96965fef..4bd846d2 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
@@ -1,13 +1,15 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From b3529f7a5bc1cff193fd0887c0f78348ef6043a4 Mon Sep 17 00:00:00 2001
+From a037ef21c0334117ad0741776a4b7b6e1a428d19 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Mon, 14 Feb 2022 17:52:00 +0000
-Subject: [PATCH 14/15] Fix : update psa_set_key_usage_flags definition to the
- latest from the tf-m
+Subject: [PATCH] Fix : update psa_set_key_usage_flags definition to the latest
+ from the tf-m
 
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  components/service/crypto/include/psa/crypto_struct.h | 10 ++++++++++
  1 file changed, 10 insertions(+)
@@ -19,7 +21,7 @@ index 1bc55e37..b4a7ed4b 100644
 @@ -155,9 +155,19 @@ static inline psa_key_lifetime_t psa_get_key_lifetime(
      return( attributes->lifetime );
  }
-
+ 
 +static inline void psa_extend_key_usage_flags( psa_key_usage_t *usage_flags )
 +{
 +    if( *usage_flags & PSA_KEY_USAGE_SIGN_HASH )
@@ -35,6 +37,4 @@ index 1bc55e37..b4a7ed4b 100644
 +    psa_extend_key_usage_flags( &usage_flags );
      attributes->usage = usage_flags;
  }
-
---
-2.25.1
+ 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
index 6e309bfb..4ad4be00 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
@@ -1,12 +1,14 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 500a359b65398d0a272a474566659fd5a21f44ff Mon Sep 17 00:00:00 2001
+From 55463b12cca39d2c6a3fd18bbd3d28ae95dff8cf Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Mon, 14 Feb 2022 08:22:25 +0000
-Subject: [PATCH 15/15] Fixes in AEAD for psa-arch test 54 and 58.
+Subject: [PATCH] Fixes in AEAD for psa-arch test 54 and 58.
 
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+
 ---
  .../crypto/client/caller/packed-c/crypto_caller_aead.h    | 1 +
  components/service/crypto/include/psa/crypto_sizes.h      | 2 +-
@@ -22,11 +24,11 @@ index c4ffb20c..a91f66c1 100644
 +++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aead.h
 @@ -309,6 +309,7 @@ static inline psa_status_t crypto_caller_aead_update(struct service_client *cont
  	size_t req_len = req_fixed_len;
-
+ 
  	*output_length = 0;
 +        req_msg.output_size = output_size;
  	req_msg.op_handle = op_handle;
-
+ 
  	/* Mandatory input data parameter */
 diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/components/service/crypto/include/psa/crypto_sizes.h
 index 4d7bf6e9..e3c4df29 100644
@@ -38,7 +40,7 @@ index 4d7bf6e9..e3c4df29 100644
   */
 -#define PSA_AEAD_NONCE_MAX_SIZE 12
 +#define PSA_AEAD_NONCE_MAX_SIZE 16
-
+ 
  /** A sufficient output buffer size for psa_aead_update().
   *
 diff --git a/components/service/crypto/provider/extension/aead/aead_provider.c b/components/service/crypto/provider/extension/aead/aead_provider.c
@@ -50,27 +52,27 @@ index 14a25436..6b144db8 100644
  	const uint8_t *input;
  	size_t input_len;
 +        uint32_t recv_output_size;
-
+ 
  	if (serializer)
  		rpc_status = serializer->deserialize_aead_update_req(req_buf, &op_handle,
 -			&input, &input_len);
 +			&recv_output_size, &input, &input_len);
-
+ 
  	if (rpc_status == TS_RPC_CALL_ACCEPTED) {
-
+ 
 @@ -300,9 +301,12 @@ static rpc_status_t aead_update_handler(void *context, struct call_req *req)
  		if (crypto_context) {
-
+ 
  			size_t output_len = 0;
 -			size_t output_size = PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(input_len);
 +			size_t output_size = PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(24);
  			uint8_t *output = malloc(output_size);
-
+ 
 +                        if (recv_output_size < output_size) {
 +                            output_size = recv_output_size;
 +                        }
  			if (output) {
-
+ 
  				psa_status = psa_aead_update(&crypto_context->op.aead,
 diff --git a/components/service/crypto/provider/extension/aead/serializer/aead_provider_serializer.h b/components/service/crypto/provider/extension/aead/serializer/aead_provider_serializer.h
 index bb1a2a97..0156aaba 100644
@@ -82,7 +84,7 @@ index bb1a2a97..0156aaba 100644
  		uint32_t *op_handle,
 +                uint32_t *output_size,
  		const uint8_t **input, size_t *input_len);
-
+ 
  	rpc_status_t (*serialize_aead_update_resp)(struct call_param_buf *resp_buf,
 diff --git a/components/service/crypto/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serializer.c b/components/service/crypto/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serializer.c
 index 6f00b3e3..45c739ab 100644
@@ -98,10 +100,10 @@ index 6f00b3e3..45c739ab 100644
  	rpc_status_t rpc_status = TS_RPC_ERROR_INVALID_REQ_BODY;
 @@ -208,6 +209,7 @@ static rpc_status_t deserialize_aead_update_req(const struct call_param_buf *req
  		memcpy(&recv_msg, req_buf->data, expected_fixed_len);
-
+ 
  		*op_handle = recv_msg.op_handle;
 +                *output_size = recv_msg.output_size;
-
+ 
  		tlv_const_iterator_begin(&req_iter,
  			(uint8_t*)req_buf->data + expected_fixed_len,
 diff --git a/protocols/service/crypto/packed-c/aead.h b/protocols/service/crypto/packed-c/aead.h
@@ -114,7 +116,5 @@ index 0be266b5..435fd3b5 100644
    uint32_t op_handle;
 +  uint32_t output_size;
  };
-
+ 
  /* Variable length input parameter tags */
---
-2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index fe5de58a..88c46a74 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM += "file://../mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6b
 
 SRC_URI:append = " \
                   ${SRC_URI_MBEDTLS} ${SRC_URI_NANOPB} ${SRC_URI_OPENAMP} ${SRC_URI_LIBMETAL} ${SRC_URI_ARCH-TESTS}\
-                  file://0001-tools-cmake-common-applying-lowercase-project-convention.patch \
+                  file://0001-tools-cmake-common-applying-lowercase-project-conven.patch \
                   file://0002-fix-EARLY_TA_PATHS-env-variable.patch \
                   file://0003-se-proxy-dts-add-se-proxy-as-child-node.patch \
                   file://0004-Update-mm-comm-buffer-region-in-dts-file.patch \
@@ -74,7 +74,7 @@ SRC_URI_LIBMETAL = "git://github.com/OpenAMP/libmetal.git;name=libmetal;protocol
 SRCREV_libmetal = "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
 
 SRC_URI_ARCH-TESTS = "git://github.com/bensze01/psa-arch-tests.git;name=psa-arch-tests;protocol=https;nobranch=1;destsuffix=git/psa-arch-tests"
-SRCREV_psa-arch-tests = "fix-multipart-aead"
+SRCREV_psa-arch-tests = "5d1a87f9c0a82e1632a3145687b4c8d7cbbeed2d"
 
 TS_ENVIRONMENT_LINUX = "arm-linux"
 TS_PLATFORM = "arm/corstone1000"
-- 
2.17.1


