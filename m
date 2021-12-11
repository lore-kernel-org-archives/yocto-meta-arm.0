Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B38C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 10:02:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.19975.1639216961825703510
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 02:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6176812FC;
	Sat, 11 Dec 2021 02:02:41 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 813993F73D;
	Sat, 11 Dec 2021 02:02:39 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 3/7] arm-bsp/secure-partitions: rebase TS patches
Date: Sat, 11 Dec 2021 10:02:22 +0000
Message-Id: <20211211100226.17180-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
References: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 11 Dec 2021 10:02:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2618

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes is to rebase patches to latest
SHA(a365a04f937b9b76ebb2e0eeade226f208cbc0d2) of integration branch.
Also cherry-picked other bug fixes with the exemption of adding
newlib changes. newlib changes brakes the build because of musl
libc, hence dropped those changes for now

Change-Id: If0131d00e63eb0f574fa41dd95cfee4351e696e8
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...pplying-lowercase-project-convention.patch |    6 +-
 ...0002-fix-EARLY_TA_PATHS-env-variable.patch |    6 +-
 ...proxy-dts-add-se-proxy-as-child-node.patch |    6 +-
 ...te-mm-comm-buffer-region-in-dts-file.patch |   10 +-
 .../0005-Configure-NV-storage-macro.patch     |   10 +-
 .../0006-Use-device-region.patch              |   10 +-
 ...7-Add-openamp-to-SE-proxy-deployment.patch |   20 +-
 ...iver-and-the-OpenAmp-conversion-laye.patch |    6 +-
 .../0009-Add-openamp-rpc-caller.patch         |   10 +-
 ...-add-psa-client-definitions-for-ff-m.patch |    8 +-
 ...mon-service-component-to-ipc-support.patch |   12 +-
 .../0012-Add-secure-storage-ipc-backend.patch |   10 +-
 ...storage-ipc-and-openamp-for-se_proxy.patch |    6 +-
 ...d-uefi-variable-append-write-support.patch | 1152 +++++++++++++++++
 ...riable-support-for-QueryVariableInfo.patch |  822 ++++++++++++
 .../0016-Add-uefi-test-deployment.patch       |  239 ++++
 ...-parameter-setting-in-sp-ffarpc_call.patch |   31 +
 ...-call-requests-with-no-shared-buffer.patch |  107 ++
 .../trusted-services/ts-corstone1000.inc      |    7 +-
 19 files changed, 2420 insertions(+), 58 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0014-Add-uefi-variable-append-write-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0016-Add-uefi-test-deployment.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0001-tools-cmake-common-applying-lowercase-project-convention.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0001-tools-cmake-common-applying-lowercase-project-convention.patch
index 1de064b..e48f457 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0001-tools-cmake-common-applying-lowercase-project-convention.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0001-tools-cmake-common-applying-lowercase-project-convention.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 
-From 0bdafbd98ffd25a09822a560435ee9719e9bc0e4 Mon Sep 17 00:00:00 2001
+From 37559c70443fe85e246f1f652045f0cd3c78012b Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 13 Nov 2021 07:47:44 +0000
 Subject: [PATCH] tools/cmake/common: applying lowercase project convention
@@ -13,6 +13,8 @@ with uppercase paths will break.
 
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 
+%% original patch: 0001-tools-cmake-common-applying-lowercase-project-convention.patch
+
 diff --git a/tools/cmake/common/AddPlatform.cmake b/tools/cmake/common/AddPlatform.cmake
 index ae34c6e..31bcd8c 100644
 --- a/tools/cmake/common/AddPlatform.cmake
@@ -29,5 +31,5 @@ index ae34c6e..31bcd8c 100644
  
  	unset(TGT CACHE)
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0002-fix-EARLY_TA_PATHS-env-variable.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0002-fix-EARLY_TA_PATHS-env-variable.patch
index e404e6f..a1af2ab 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0002-fix-EARLY_TA_PATHS-env-variable.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0002-fix-EARLY_TA_PATHS-env-variable.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 
-From 28f3e8d68996ad2e3ccca45d2435b3b524daef48 Mon Sep 17 00:00:00 2001
+From a0673905e8f63877b631a29fab56ea42bf748549 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 13 Nov 2021 07:51:53 +0000
 Subject: [PATCH] fix EARLY_TA_PATHS env variable
@@ -12,6 +12,8 @@ to be included into optee-os image
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+%% original patch: 0002-fix-EARLY_TA_PATHS-env-variable.patch
+
 diff --git a/environments/opteesp/sp.mk.in b/environments/opteesp/sp.mk.in
 index c44ad59..d67e2dc 100644
 --- a/environments/opteesp/sp.mk.in
@@ -27,5 +29,5 @@ index c44ad59..d67e2dc 100644
  else ifeq (fip,${SP_PACKAGING_METHOD})
  TS_SP_JSON_LIST+=${TS_INSTALL_PREFIX}/opteesp/json/@EXPORT_SP_NAME@.json
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0003-se-proxy-dts-add-se-proxy-as-child-node.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
index 5d64949..3d50f93 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0003-se-proxy-dts-add-se-proxy-as-child-node.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 
-From 446155031c5a37c3a9771f0215d9fb23d59648d6 Mon Sep 17 00:00:00 2001
+From 77fa96b728b81066c440c2e1e185f745376a6fb2 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Sat, 13 Nov 2021 08:34:42 +0000
 Subject: [PATCH] se-proxy:dts: add se-proxy as child node
@@ -11,6 +11,8 @@ read properly.
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+%% original patch: 0003-se-proxy-dts-add-se-proxy-as-child-node.patch
+
 diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
 index 961071a..9f5cf71 100644
 --- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
@@ -41,5 +43,5 @@ index 961071a..9f5cf71 100644
 +	};
  };
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0004-Update-mm-comm-buffer-region-in-dts-file.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0004-Update-mm-comm-buffer-region-in-dts-file.patch
index baed87c..4636af1 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0004-Update-mm-comm-buffer-region-in-dts-file.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0004-Update-mm-comm-buffer-region-in-dts-file.patch
@@ -1,14 +1,12 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 
-From 576b12ed88bd17338e28a62d0ea35aa49cf88170 Mon Sep 17 00:00:00 2001
+From 1f75194e884a1795c3523f41dc0912dc5068e525 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Wed, 17 Nov 2021 15:31:09 +0000
-Subject: [PATCH 23/25] Update mm-comm-buffer region in dts file
+Subject: [PATCH] Update mm-comm-buffer region in dts file
 
----
- .../opteesp/default_smm-gateway.dts.in        | 35 ++++++++++---------
- 1 file changed, 18 insertions(+), 17 deletions(-)
+%% original patch: 0004-Update-mm-comm-buffer-region-in-dts-file.patch
 
 diff --git a/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in b/deployments/smm-gateway/opteesp/default_smm-gateway.dts.in
 index 0ad7878..183c38a 100644
@@ -57,5 +55,5 @@ index 0ad7878..183c38a 100644
  	};
  };
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0005-Configure-NV-storage-macro.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0005-Configure-NV-storage-macro.patch
index f24f84d..524054b 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0005-Configure-NV-storage-macro.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0005-Configure-NV-storage-macro.patch
@@ -1,14 +1,12 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 
-From 95a00456f887f4be3b528ace9cd4cfd3403c935b Mon Sep 17 00:00:00 2001
+From 634b8e09e9c072b41dfe92e4ca08a685cac9e998 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Wed, 17 Nov 2021 15:32:04 +0000
-Subject: [PATCH 24/25] Configure NV storage macro
+Subject: [PATCH] Configure NV storage macro
 
----
- deployments/smm-gateway/smm_gateway.c | 2 ++
- 1 file changed, 2 insertions(+)
+%% original patch: 0005-Configure-NV-storage-macro.patch
 
 diff --git a/deployments/smm-gateway/smm_gateway.c b/deployments/smm-gateway/smm_gateway.c
 index 4884a04..7828b3a 100644
@@ -24,5 +22,5 @@ index 4884a04..7828b3a 100644
  #ifndef SMM_GATEWAY_NV_STORE_SN
  #define SMM_GATEWAY_NV_STORE_SN		"sn:ffa:751bf801-3dde-4768-a514-0f10aeed1790:0"
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0006-Use-device-region.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0006-Use-device-region.patch
index 60022d8..a6d444e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0006-Use-device-region.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0006-Use-device-region.patch
@@ -1,14 +1,12 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 
-From 7320daabc82dc787f2fe017eb176df2ec8e804a0 Mon Sep 17 00:00:00 2001
+From 6bb7e118c15c97d4554a0a7f6d3fc8e9792ca65c Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Wed, 17 Nov 2021 15:32:46 +0000
-Subject: [PATCH 25/25] Use device region
+Subject: [PATCH] Use device region
 
----
- deployments/smm-gateway/opteesp/smm_gateway_sp.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+%% original patch: 0006-Use-device-region.patch
 
 diff --git a/deployments/smm-gateway/opteesp/smm_gateway_sp.c b/deployments/smm-gateway/opteesp/smm_gateway_sp.c
 index 6f13885..0bc0902 100644
@@ -51,5 +49,5 @@ index 6f13885..0bc0902 100644
  
  	/* Attach SMM variable service to MM communication layer */
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0007-Add-openamp-to-SE-proxy-deployment.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0007-Add-openamp-to-SE-proxy-deployment.patch
index c47475e..06fb497 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0007-Add-openamp-to-SE-proxy-deployment.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0007-Add-openamp-to-SE-proxy-deployment.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-From afaab8162d5e5a22c0a89aebd46ca6480151d19e Mon Sep 17 00:00:00 2001
+From 8e25c9b4617dcbb5800b25ace93371d9bcd68e61 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 16:36:51 +0000
 Subject: [PATCH] Add openamp to SE proxy deployment
@@ -14,11 +14,13 @@ and build it.
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+%% original patch: 0007-Add-openamp-to-SE-proxy-deployment.patch
+
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index 2fb4bcc..8591826 100644
+index 4e2069a..248bd7e 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -86,6 +86,7 @@ add_components(TARGET "se-proxy"
+@@ -89,6 +89,7 @@ add_components(TARGET "se-proxy"
  target_sources(se-proxy PRIVATE
  	se_proxy_sp.c
  	service_proxy_factory.c
@@ -26,15 +28,7 @@ index 2fb4bcc..8591826 100644
  )
  
  #-------------------------------------------------------------------------------
-@@ -95,7 +96,6 @@ target_sources(se-proxy PRIVATE
- # temporarily force platform - with this change, the build interface to
- # an external builder such as a Yocto recipe is unchanged.  Should remove
- # once the build interface is published.
--set(TS_PLATFORM "arm/fvp/fvp_base_revc-2xaemv8a" CACHE STRING "Overridden" FORCE)
- 
- add_platform(TARGET "se-proxy")
- 
-@@ -110,6 +110,19 @@ include(../../../external/nanopb/nanopb.cmake)
+@@ -108,6 +109,19 @@ include(../../../external/nanopb/nanopb.cmake)
  target_link_libraries(se-proxy PRIVATE nanopb::protobuf-nanopb-static)
  protobuf_generate_all(TGT "se-proxy" NAMESPACE "protobuf" BASE_DIR "${TS_ROOT}/protocols")
  
@@ -255,5 +249,5 @@ index 0000000..aae13ba
 +set_property(TARGET openamp PROPERTY IMPORTED_LOCATION "${OPENAMP_INSTALL_PATH}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}open_amp${CMAKE_STATIC_LIBRARY_SUFFIX}")
 +set_property(TARGET openamp PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${OPENAMP_INSTALL_PATH}/include")
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
index 7d8bf49..f0930bd 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-From 4243448e35da5c500f6e0ea6d68ab2ac23ada986 Mon Sep 17 00:00:00 2001
+From 000f8beb8aaa70b1e9f805fd62b886f49b540251 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 18:00:46 +0000
 Subject: [PATCH] Implement mhu driver and the OpenAmp conversion layer.
@@ -13,6 +13,8 @@ the secure enclave using OpenAmp.
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+%% original patch: 0008-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
+
 diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
 index 9f5cf71..f351a59 100644
 --- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
@@ -1079,5 +1081,5 @@ index 0000000..bb778bb
 +# include MHU driver
 +include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0009-Add-openamp-rpc-caller.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0009-Add-openamp-rpc-caller.patch
index 35e00b1..bed5cca 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0009-Add-openamp-rpc-caller.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0009-Add-openamp-rpc-caller.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-From 5b7b59bf35f38f04bc6adb46f88b73edffb74ffd Mon Sep 17 00:00:00 2001
+From 57b6e8dab4de03998023404910e3a30c16860bec Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:00:54 +0000
 Subject: [PATCH] Add openamp rpc caller
@@ -9,6 +9,8 @@ Subject: [PATCH] Add openamp rpc caller
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+%% original patch: 0009-Add-openamp-rpc-caller.patch
+
 diff --git a/components/rpc/common/caller/rpc_caller.c b/components/rpc/common/caller/rpc_caller.c
 index 2dceabe..20d889c 100644
 --- a/components/rpc/common/caller/rpc_caller.c
@@ -1145,10 +1147,10 @@ index 0000000..915128f
 +
 +#endif
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index 8591826..b8b01c4 100644
+index 248bd7e..1511bba 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -72,6 +72,7 @@ add_components(TARGET "se-proxy"
+@@ -75,6 +75,7 @@ add_components(TARGET "se-proxy"
  		"components/service/attestation/include"
  		"components/service/attestation/provider"
  		"components/service/attestation/provider/serializer/packed-c"
@@ -1174,5 +1176,5 @@ index f351a59..55d49b3 100644
  	};
  };
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0010-add-psa-client-definitions-for-ff-m.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0010-add-psa-client-definitions-for-ff-m.patch
index 6cb33ce..95b2ae7 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0010-add-psa-client-definitions-for-ff-m.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0010-add-psa-client-definitions-for-ff-m.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-From f37bd875d3f9cd4cc029b8a52aa0571da7ebd201 Mon Sep 17 00:00:00 2001
+From 0f32eaab3c1c5ef534139474b0453916bc4d8b63 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:05:18 +0000
 Subject: [PATCH] add psa client definitions for ff-m
@@ -12,9 +12,11 @@ ff-m support.
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+%% original patch: 0010-add-psa-client-definitions-for-ff-m.patch
+
 diff --git a/components/service/common/include/psa/client.h b/components/service/common/include/psa/client.h
 new file mode 100644
-index 0000000..bd2aac8
+index 0000000..69ccf14
 --- /dev/null
 +++ b/components/service/common/include/psa/client.h
 @@ -0,0 +1,194 @@
@@ -290,5 +292,5 @@ index 0000000..aaa973c
 +
 +#endif /* __PSA_MANIFEST_SID_H__ */
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0011-Add-common-service-component-to-ipc-support.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0011-Add-common-service-component-to-ipc-support.patch
index 7627840..1cbff68 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0011-Add-common-service-component-to-ipc-support.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0011-Add-common-service-component-to-ipc-support.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-From 13c7fa7bcc93f82cbc1e8a6f561b33133777a3a9 Mon Sep 17 00:00:00 2001
+From f08ec4e601e70669aafeb712d7c521cc07fd0c77 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:13:03 +0000
 Subject: [PATCH] Add common service component to ipc support
@@ -11,6 +11,8 @@ including, the openamp client side structures lib.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 
+%% original patch: 0011-Add-common-service-component-to-ipc-support.patch
+
 diff --git a/components/service/common/psa_ipc/component.cmake b/components/service/common/psa_ipc/component.cmake
 new file mode 100644
 index 0000000..5a1c9e6
@@ -135,7 +137,7 @@ index 0000000..e8093c2
 +}
 diff --git a/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
 new file mode 100644
-index 0000000..c637dfa
+index 0000000..33ea966
 --- /dev/null
 +++ b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
 @@ -0,0 +1,131 @@
@@ -271,10 +273,10 @@ index 0000000..c637dfa
 +
 +
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index b8b01c4..3b5dd1d 100644
+index 1511bba..e0e0e12 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -51,6 +51,7 @@ add_components(TARGET "se-proxy"
+@@ -54,6 +54,7 @@ add_components(TARGET "se-proxy"
  		"components/service/common/include"
  		"components/service/common/serializer/protobuf"
  		"components/service/common/client"
@@ -283,5 +285,5 @@ index b8b01c4..3b5dd1d 100644
  		"components/service/discovery/provider"
  		"components/service/discovery/provider/serializer/packed-c"
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0012-Add-secure-storage-ipc-backend.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0012-Add-secure-storage-ipc-backend.patch
index bccdece..acf9826 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0012-Add-secure-storage-ipc-backend.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0012-Add-secure-storage-ipc-backend.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-From ee503eec06c928344a72faaca70ad0d448ff8175 Mon Sep 17 00:00:00 2001
+From 318f0dda8d258f0184a4d8650045e02be02afce2 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:19:24 +0000
 Subject: [PATCH] Add secure storage ipc backend
@@ -11,6 +11,8 @@ openamp as rpc to communicate with other processor.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 
+%% original patch: 0012-Add-secure-storage-ipc-backend.patch
+
 diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
 index e8093c2..95a07c1 100644
 --- a/components/service/common/psa_ipc/service_psa_ipc.c
@@ -498,10 +500,10 @@ index 0000000..e8c1e8f
 +
 +#endif /* SECURE_STORAGE_IPC_H */
 diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
-index 3b5dd1d..87fdd58 100644
+index e0e0e12..663177b 100644
 --- a/deployments/se-proxy/opteesp/CMakeLists.txt
 +++ b/deployments/se-proxy/opteesp/CMakeLists.txt
-@@ -70,6 +70,7 @@ add_components(TARGET "se-proxy"
+@@ -73,6 +73,7 @@ add_components(TARGET "se-proxy"
  		"components/service/crypto/factory/full"
  		"components/service/secure_storage/include"
  		"components/service/secure_storage/frontend/secure_storage_provider"
@@ -510,5 +512,5 @@ index 3b5dd1d..87fdd58 100644
  		"components/service/attestation/provider"
  		"components/service/attestation/provider/serializer/packed-c"
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
index 7055599..fe7112c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
@@ -1,7 +1,7 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
-From e336129cb0c9615fb978d0f555a4b5c1a544dc46 Mon Sep 17 00:00:00 2001
+From b8588aaefaef19ddd33abf57190501dc0d624587 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:25:34 +0000
 Subject: [PATCH] Use secure storage ipc and openamp for se_proxy
@@ -12,6 +12,8 @@ openamp as rpc to secure enclave side.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
 
+%% original patch: 0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
+
 diff --git a/deployments/se-proxy/opteesp/service_proxy_factory.c b/deployments/se-proxy/opteesp/service_proxy_factory.c
 index acfb6e8..5729005 100644
 --- a/deployments/se-proxy/opteesp/service_proxy_factory.c
@@ -57,5 +59,5 @@ index acfb6e8..5729005 100644
  	return secure_storage_provider_init(&ps_provider, backend);
  }
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0014-Add-uefi-variable-append-write-support.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0014-Add-uefi-variable-append-write-support.patch
new file mode 100644
index 0000000..e4e29b6
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0014-Add-uefi-variable-append-write-support.patch
@@ -0,0 +1,1152 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 355fc5189657ef9db94fc5329544e8c65e65a1bf Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Thu, 2 Dec 2021 10:15:54 +0000
+Subject: [PATCH] Add uefi variable append write support
+
+Adds support for extending UEFI variable data handled by the
+smm_variable service provider using the EFI_VARIABLE_APPEND_WRITE
+attribute.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: I7a6562327bc0a5ce5cd0e85276325227b83e9f9e
+
+diff --git a/components/service/smm_variable/backend/test/variable_index_tests.cpp b/components/service/smm_variable/backend/test/variable_index_tests.cpp
+index c8bacf9..8edc0e7 100644
+--- a/components/service/smm_variable/backend/test/variable_index_tests.cpp
++++ b/components/service/smm_variable/backend/test/variable_index_tests.cpp
+@@ -69,34 +69,37 @@ TEST_GROUP(UefiVariableIndexTests)
+ 
+ 	void create_variables()
+ 	{
+-		const struct variable_info *info = NULL;
++		struct variable_info *info = NULL;
+ 
+-		info = variable_index_add_variable(
++		info = variable_index_add_entry(
+ 			&m_variable_index,
+ 			&guid_1,
+ 			name_1.size() * sizeof(int16_t),
+-			name_1.data(),
+-			EFI_VARIABLE_BOOTSERVICE_ACCESS);
+-
++			name_1.data());
+ 		CHECK_TRUE(info);
++		variable_index_set_variable(
++			info,
++			EFI_VARIABLE_BOOTSERVICE_ACCESS);
+ 
+-		info = variable_index_add_variable(
++		info = variable_index_add_entry(
+ 			&m_variable_index,
+ 			&guid_2,
+ 			name_2.size() * sizeof(int16_t),
+-			name_2.data(),
+-			EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS);
+-
++			name_2.data());
+ 		CHECK_TRUE(info);
++		variable_index_set_variable(
++			info,
++			EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS);
+ 
+-		info = variable_index_add_variable(
++		info = variable_index_add_entry(
+ 			&m_variable_index,
+ 			&guid_1,
+ 			name_3.size() * sizeof(int16_t),
+-			name_3.data(),
+-			EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_RUNTIME_ACCESS);
+-
++			name_3.data());
+ 		CHECK_TRUE(info);
++		variable_index_set_variable(
++			info,
++			EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_RUNTIME_ACCESS);
+ 	}
+ 
+ 	static const size_t MAX_VARIABLES = 10;
+@@ -111,7 +114,7 @@ TEST_GROUP(UefiVariableIndexTests)
+ 
+ TEST(UefiVariableIndexTests, emptyIndexOperations)
+ {
+-	const struct variable_info *info = NULL;
++	struct variable_info *info = NULL;
+ 
+ 	/* Expect not to find a variable */
+ 	info = variable_index_find(
+@@ -130,36 +133,34 @@ TEST(UefiVariableIndexTests, emptyIndexOperations)
+ 	POINTERS_EQUAL(NULL, info);
+ 
+ 	/* Remove should silently return */
+-	variable_index_remove_variable(
++	variable_index_clear_variable(
+ 		&m_variable_index,
+ 		info);
+ }
+ 
+ TEST(UefiVariableIndexTests, addWithOversizedName)
+ {
+-	const struct variable_info *info = NULL;
++	struct variable_info *info = NULL;
+ 	std::vector<int16_t> name;
+ 
+ 	name = to_variable_name(L"a long variable name that exceeds the length limit");
+ 
+-	info = variable_index_add_variable(
++	info = variable_index_add_entry(
+ 		&m_variable_index,
+ 		&guid_1,
+ 		name.size() * sizeof(int16_t),
+-		name.data(),
+-		EFI_VARIABLE_BOOTSERVICE_ACCESS);
++		name.data());
+ 
+ 	/* Expect the add to fail because of an oversized name */
+ 	POINTERS_EQUAL(NULL, info);
+ 
+ 	name = to_variable_name(L"a long variable name that fits!");
+ 
+-	info = variable_index_add_variable(
++	info = variable_index_add_entry(
+ 		&m_variable_index,
+ 		&guid_1,
+ 		name.size() * sizeof(int16_t),
+-		name.data(),
+-		EFI_VARIABLE_BOOTSERVICE_ACCESS);
++		name.data());
+ 
+ 	/* Expect the add succeed */
+ 	CHECK_TRUE(info);
+@@ -167,18 +168,17 @@ TEST(UefiVariableIndexTests, addWithOversizedName)
+ 
+ TEST(UefiVariableIndexTests, variableIndexFull)
+ {
+-	const struct variable_info *info = NULL;
++	struct variable_info *info = NULL;
+ 	EFI_GUID guid = guid_1;
+ 
+ 	/* Expect to be able to fill the index */
+ 	for (size_t i = 0; i < MAX_VARIABLES; ++i) {
+ 
+-		info = variable_index_add_variable(
++		info = variable_index_add_entry(
+ 			&m_variable_index,
+ 			&guid,
+ 			name_1.size() * sizeof(int16_t),
+-			name_1.data(),
+-			EFI_VARIABLE_BOOTSERVICE_ACCESS);
++			name_1.data());
+ 
+ 		CHECK_TRUE(info);
+ 
+@@ -187,12 +187,11 @@ TEST(UefiVariableIndexTests, variableIndexFull)
+ 	}
+ 
+ 	/* Variable index should now be full */
+-	info = variable_index_add_variable(
++	info = variable_index_add_entry(
+ 		&m_variable_index,
+ 		&guid,
+ 		name_1.size() * sizeof(int16_t),
+-		name_1.data(),
+-		EFI_VARIABLE_BOOTSERVICE_ACCESS);
++		name_1.data());
+ 
+ 	POINTERS_EQUAL(NULL, info);
+ }
+@@ -323,7 +322,7 @@ TEST(UefiVariableIndexTests, dumpBufferTooSmall)
+ TEST(UefiVariableIndexTests, removeVariable)
+ {
+ 	uint8_t buffer[MAX_VARIABLES * sizeof(struct variable_metadata)];
+-	const struct variable_info *info = NULL;
++	struct variable_info *info = NULL;
+ 
+ 	create_variables();
+ 
+@@ -334,7 +333,7 @@ TEST(UefiVariableIndexTests, removeVariable)
+ 		name_2.size() * sizeof(int16_t),
+ 		name_2.data());
+ 
+-	variable_index_remove_variable(
++	variable_index_clear_variable(
+ 		&m_variable_index,
+ 		info);
+ 
+@@ -352,7 +351,7 @@ TEST(UefiVariableIndexTests, removeVariable)
+ 		name_1.size() * sizeof(int16_t),
+ 		name_1.data());
+ 
+-	variable_index_remove_variable(
++	variable_index_clear_variable(
+ 		&m_variable_index,
+ 		info);
+ 
+@@ -370,7 +369,7 @@ TEST(UefiVariableIndexTests, removeVariable)
+ 		name_3.size() * sizeof(int16_t),
+ 		name_3.data());
+ 
+-	variable_index_remove_variable(
++	variable_index_clear_variable(
+ 		&m_variable_index,
+ 		info);
+ 
+@@ -395,7 +394,7 @@ TEST(UefiVariableIndexTests, removeVariable)
+ 
+ TEST(UefiVariableIndexTests, checkIterator)
+ {
+-	const struct variable_info *info = NULL;
++	struct variable_info *info = NULL;
+ 
+ 	create_variables();
+ 
+@@ -419,7 +418,7 @@ TEST(UefiVariableIndexTests, checkIterator)
+ 	UNSIGNED_LONGS_EQUAL(name_2.size() * sizeof(int16_t), info->metadata.name_size);
+ 	MEMCMP_EQUAL(name_2.data(), info->metadata.name, info->metadata.name_size);
+ 
+-	const struct variable_info *info_to_remove = info;
++	struct variable_info *info_to_remove = info;
+ 
+ 	variable_index_iterator_next(&iter);
+ 	CHECK_FALSE(variable_index_iterator_is_done(&iter));
+@@ -435,7 +434,8 @@ TEST(UefiVariableIndexTests, checkIterator)
+ 	CHECK_TRUE(variable_index_iterator_is_done(&iter));
+ 
+ 	/* Now remove the middle entry */
+-	variable_index_remove_variable(&m_variable_index, info_to_remove);
++	variable_index_clear_variable(&m_variable_index, info_to_remove);
++	variable_index_remove_unused_entry(&m_variable_index, info_to_remove);
+ 
+ 	/* Iterate again but this time there should only be two entries */
+ 	variable_index_iterator_first(&iter, &m_variable_index);
+@@ -478,7 +478,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsExistingVar)
+ 	constraints.max_size = 100;
+ 
+ 	/* Set check constraints on one of the variables */
+-	const struct variable_info *info = variable_index_find(
++	struct variable_info *info = variable_index_find(
+ 		&m_variable_index,
+ 		&guid_2,
+ 		name_2.size() * sizeof(int16_t),
+@@ -488,7 +488,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsExistingVar)
+ 	CHECK_TRUE(info->is_variable_set);
+ 	CHECK_FALSE(info->is_constraints_set);
+ 
+-	variable_index_update_constraints(info, &constraints);
++	variable_index_set_constraints(info, &constraints);
+ 
+ 	CHECK_TRUE(info->is_constraints_set);
+ 	CHECK_TRUE(info->is_variable_set);
+@@ -496,7 +496,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsExistingVar)
+ 	/* Remove the variable but still expect the variable to be indexed
+ 	 * because of the set constraints.
+ 	 */
+-	variable_index_remove_variable(
++	variable_index_clear_variable(
+ 		&m_variable_index,
+ 		info);
+ 
+@@ -588,7 +588,7 @@ TEST(UefiVariableIndexTests, setCheckConstraintsNonExistingVar)
+ 	constraints.max_size = 100;
+ 
+ 	/* Initially expect no variable_info */
+-	const struct variable_info *info = variable_index_find(
++	struct variable_info *info = variable_index_find(
+ 		&m_variable_index,
+ 		&guid_2,
+ 		name_2.size() * sizeof(int16_t),
+@@ -597,19 +597,19 @@ TEST(UefiVariableIndexTests, setCheckConstraintsNonExistingVar)
+ 	CHECK_FALSE(info);
+ 
+ 	/* Adding the check constraints should result in an entry being added */
+-	info = variable_index_add_constraints(
++	info = variable_index_add_entry(
+ 		&m_variable_index,
+ 		&guid_2,
+ 		name_2.size() * sizeof(int16_t),
+-		name_2.data(),
+-		&constraints);
+-
++		name_2.data());
+ 	CHECK_TRUE(info);
++
++	variable_index_set_constraints(info, &constraints);
+ 	CHECK_FALSE(info->is_variable_set);
+ 	CHECK_TRUE(info->is_constraints_set);
+ 
+ 	/* Updating the variable should cause the variable to be marked as set */
+-	variable_index_update_variable(info, EFI_VARIABLE_RUNTIME_ACCESS);
++	variable_index_set_variable(info, EFI_VARIABLE_RUNTIME_ACCESS);
+ 
+ 	CHECK_TRUE(info->is_variable_set);
+ 	CHECK_TRUE(info->is_constraints_set);
+diff --git a/components/service/smm_variable/backend/test/variable_store_tests.cpp b/components/service/smm_variable/backend/test/variable_store_tests.cpp
+index f6aba13..578f118 100644
+--- a/components/service/smm_variable/backend/test/variable_store_tests.cpp
++++ b/components/service/smm_variable/backend/test/variable_store_tests.cpp
+@@ -250,6 +250,21 @@ TEST(UefiVariableStoreTests, setGetRoundtrip)
+ 	/* Expect got variable data to be the same as the set value */
+ 	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
+ 	LONGS_EQUAL(0, input_data.compare(output_data));
++
++	/* Extend the variable using an append write */
++	std::string input_data2 = " jumps over the lazy dog";
++
++	status = set_variable(var_name, input_data2, EFI_VARIABLE_APPEND_WRITE);
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
++
++	status = get_variable(var_name, output_data);
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
++
++	std::string expected_output = input_data + input_data2;
++
++	/* Expect the append write operation to have extended the variable */
++	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
++	LONGS_EQUAL(0, expected_output.compare(output_data));
+ }
+ 
+ TEST(UefiVariableStoreTests, persistentSetGet)
+@@ -259,7 +274,8 @@ TEST(UefiVariableStoreTests, persistentSetGet)
+ 	std::string input_data = "quick brown fox";
+ 	std::string output_data;
+ 
+-	status = set_variable(var_name, input_data, EFI_VARIABLE_NON_VOLATILE);
++	status = set_variable(var_name, input_data,
++		EFI_VARIABLE_NON_VOLATILE);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 
+ 	status = get_variable(var_name, output_data);
+@@ -269,6 +285,22 @@ TEST(UefiVariableStoreTests, persistentSetGet)
+ 	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
+ 	LONGS_EQUAL(0, input_data.compare(output_data));
+ 
++	/* Extend the variable using an append write */
++	std::string input_data2 = " jumps over the lazy dog";
++
++	status = set_variable(var_name, input_data2,
++		EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_APPEND_WRITE);
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
++
++	status = get_variable(var_name, output_data);
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
++
++	std::string expected_output = input_data + input_data2;
++
++	/* Expect the append write operation to have extended the variable */
++	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
++	LONGS_EQUAL(0, expected_output.compare(output_data));
++
+ 	/* Expect the variable to survive a power cycle */
+ 	power_cycle();
+ 
+@@ -277,8 +309,8 @@ TEST(UefiVariableStoreTests, persistentSetGet)
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 
+ 	/* Still expect got variable data to be the same as the set value */
+-	UNSIGNED_LONGLONGS_EQUAL(input_data.size(), output_data.size());
+-	LONGS_EQUAL(0, input_data.compare(output_data));
++	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
++	LONGS_EQUAL(0, expected_output.compare(output_data));
+ }
+ 
+ TEST(UefiVariableStoreTests, removeVolatile)
+@@ -317,7 +349,7 @@ TEST(UefiVariableStoreTests, removePersistent)
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 
+ 	/* Remove by setting with zero data length */
+-	status = set_variable(var_name, std::string(), 0);
++	status = set_variable(var_name, std::string(), EFI_VARIABLE_NON_VOLATILE);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 
+ 	/* Expect variable to no loger exist */
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
+index b7091d7..bcb8599 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/smm_variable/backend/uefi_variable_store.c
+@@ -46,6 +46,13 @@ static efi_status_t load_variable_data(
+ 	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var,
+ 	size_t max_data_len);
+ 
++static psa_status_t append_write(
++	struct storage_backend *storage_backend,
++	uint32_t client_id,
++	uint64_t uid,
++	size_t data_length,
++	const void *data);
++
+ static void purge_orphan_index_entries(
+ 	struct uefi_variable_store *context);
+ 
+@@ -113,40 +120,45 @@ efi_status_t uefi_variable_store_set_variable(
+ 	struct uefi_variable_store *context,
+ 	const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
+ {
++	bool should_sync_index = false;
++
++	/* Validate incoming request */
+ 	efi_status_t status = check_name_terminator(var->Name, var->NameSize);
+ 	if (status != EFI_SUCCESS) return status;
+ 
+ 	status = check_capabilities(var);
+-	bool should_sync_index = false;
+-
+ 	if (status != EFI_SUCCESS) return status;
+ 
+-	/* Find in index */
+-	const struct variable_info *info = variable_index_find(
++	/* Find an existing entry in the variable index or add a new one */
++	struct variable_info *info = variable_index_find(
+ 		&context->variable_index,
+ 		&var->Guid,
+ 		var->NameSize,
+ 		var->Name);
+ 
+-	if (info) {
++	if (!info) {
+ 
+-		/* Variable info already exists */
+-		status = check_access_permitted_on_set(context, info, var);
++		info = variable_index_add_entry(
++			&context->variable_index,
++			&var->Guid,
++			var->NameSize,
++			var->Name);
+ 
+-		if (status == EFI_SUCCESS) {
++		if (!info) return EFI_OUT_OF_RESOURCES;
++	}
+ 
+-			should_sync_index =
+-				(var->Attributes & EFI_VARIABLE_NON_VOLATILE) ||
+-				(info->is_variable_set && (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE));
++	/* Control access */
++	status = check_access_permitted_on_set(context, info, var);
+ 
+-			if (var->DataSize) {
++	if (status == EFI_SUCCESS) {
+ 
+-				/* It's a set rather than a remove operation */
+-				variable_index_update_variable(
+-					info,
+-					var->Attributes);
+-			}
+-			else {
++		/* Access permitted */
++		if (info->is_variable_set) {
++
++			/* It's a request to update to an existing variable */
++			if (!(var->Attributes &
++				(EFI_VARIABLE_APPEND_WRITE | EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS_MASK)) &&
++				!var->DataSize) {
+ 
+ 				/* It's a remove operation - for a remove, the variable
+ 				 * data must be removed from the storage backend before
+@@ -155,30 +167,29 @@ efi_status_t uefi_variable_store_set_variable(
+ 				 * the storage backend without a corresponding index entry.
+ 				 */
+ 				remove_variable_data(context, info);
+-				variable_index_remove_variable(&context->variable_index, info);
++				variable_index_clear_variable(&context->variable_index, info);
+ 
+-				/* Variable info no longer valid */
+-				info = NULL;
++				should_sync_index = (var->Attributes & EFI_VARIABLE_NON_VOLATILE);
++			}
++			else {
++
++				/* It's a set operation where variable data is potentially
++				 * being overwritten or extended.
++				 */
++				if ((var->Attributes & ~EFI_VARIABLE_APPEND_WRITE) != info->metadata.attributes) {
++
++					/* Modifying attributes is forbidden */
++					return EFI_INVALID_PARAMETER;
++				}
+ 			}
+ 		}
+ 		else {
+ 
+-			/* Access forbidden */
+-			info = NULL;
+-		}
+-	}
+-	else if (var->DataSize) {
++			/*  It's a request to create a new variable */
++			variable_index_set_variable(info, var->Attributes);
+ 
+-		/* It's a new variable */
+-		info = variable_index_add_variable(
+-			&context->variable_index,
+-			&var->Guid,
+-			var->NameSize,
+-			var->Name,
+-			var->Attributes);
+-
+-		if (!info) status = EFI_OUT_OF_RESOURCES;
+-		should_sync_index = info && (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE);
++			should_sync_index = (var->Attributes & EFI_VARIABLE_NON_VOLATILE);
++		}
+ 	}
+ 
+ 	/* The order of these operations is important. For an update
+@@ -195,11 +206,13 @@ efi_status_t uefi_variable_store_set_variable(
+ 	}
+ 
+ 	/* Store any variable data to the storage backend */
+-	if (info && (status == EFI_SUCCESS)) {
++	if (info->is_variable_set && (status == EFI_SUCCESS)) {
+ 
+ 		status = store_variable_data(context, info, var);
+ 	}
+ 
++	variable_index_remove_unused_entry(&context->variable_index, info);
++
+ 	return status;
+ }
+ 
+@@ -293,54 +306,42 @@ efi_status_t uefi_variable_store_set_var_check_property(
+ 	efi_status_t status = check_name_terminator(property->Name, property->NameSize);
+ 	if (status != EFI_SUCCESS) return status;
+ 
+-	/* Find in index */
+-	const struct variable_info *info = variable_index_find(
++	/* Find in index or create a new entry */
++	struct variable_info *info = variable_index_find(
+ 		&context->variable_index,
+ 		&property->Guid,
+ 		property->NameSize,
+ 		property->Name);
+ 
+-	if (info) {
++	if (!info) {
+ 
+-		/* Applying check constraints to an existing variable that may have
+-		 * constraints already set.  These could constrain the setting of
+-		 * the constraints.
+-		 */
+-		struct variable_constraints constraints = info->check_constraints;
+-
+-		status = variable_checker_set_constraints(
+-			&constraints,
+-			info->is_constraints_set,
+-			&property->VariableProperty);
+-
+-		if (status == EFI_SUCCESS) {
++		info = variable_index_add_entry(
++			&context->variable_index,
++			&property->Guid,
++			property->NameSize,
++			property->Name);
+ 
+-			variable_index_update_constraints(info, &constraints);
+-		}
++		if (!info) return EFI_OUT_OF_RESOURCES;
+ 	}
+-	else {
+-
+-		/* Applying check constraints for a new variable */
+-		struct variable_constraints constraints;
+ 
+-		status = variable_checker_set_constraints(
+-			&constraints,
+-			false,
+-			&property->VariableProperty);
++	/* Applying check constraints to an existing variable that may have
++	 * constraints already set.  These could constrain the setting of
++	 * the constraints.
++	 */
++	struct variable_constraints constraints = info->check_constraints;
+ 
+-		if (status == EFI_SUCCESS) {
++	status = variable_checker_set_constraints(
++		&constraints,
++		info->is_constraints_set,
++		&property->VariableProperty);
+ 
+-			info = variable_index_add_constraints(
+-				&context->variable_index,
+-				&property->Guid,
+-				property->NameSize,
+-				property->Name,
+-				&constraints);
++	if (status == EFI_SUCCESS) {
+ 
+-			if (!info) status = EFI_OUT_OF_RESOURCES;
+-		}
++		variable_index_set_constraints(info, &constraints);
+ 	}
+ 
++	variable_index_remove_unused_entry(&context->variable_index, info);
++
+ 	return status;
+ }
+ 
+@@ -440,7 +441,8 @@ static efi_status_t check_capabilities(
+ 	if (var->Attributes & ~(
+ 		EFI_VARIABLE_NON_VOLATILE |
+ 		EFI_VARIABLE_BOOTSERVICE_ACCESS |
+-		EFI_VARIABLE_RUNTIME_ACCESS)) {
++		EFI_VARIABLE_RUNTIME_ACCESS |
++		EFI_VARIABLE_APPEND_WRITE)) {
+ 
+ 		/* An unsupported attribute has been requested */
+ 		status = EFI_UNSUPPORTED;
+@@ -486,17 +488,6 @@ static efi_status_t check_access_permitted_on_set(
+ 			var->DataSize);
+ 	}
+ 
+-	if ((status == EFI_SUCCESS) && var->DataSize) {
+-
+-		/* Restrict which attributes can be modified for an existing variable */
+-		if ((var->Attributes & EFI_VARIABLE_NON_VOLATILE) !=
+-			(info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) {
+-
+-			/* Don't permit change of storage class */
+-			status = EFI_INVALID_PARAMETER;
+-		}
+-	}
+-
+ 	return status;
+ }
+ 
+@@ -518,20 +509,34 @@ static efi_status_t store_variable_data(
+ 
+ 	if (storage_backend) {
+ 
+-		psa_status = storage_backend->interface->set(
+-			storage_backend->context,
+-			context->owner_id,
+-			info->metadata.uid,
+-			data_len,
+-			data,
+-			PSA_STORAGE_FLAG_NONE);
++		if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
++
++			/* Create or overwrite variable data */
++			psa_status = storage_backend->interface->set(
++				storage_backend->context,
++				context->owner_id,
++				info->metadata.uid,
++				data_len,
++				data,
++				PSA_STORAGE_FLAG_NONE);
++		}
++		else {
++
++			/* Append new data to existing variable data */
++			psa_status = append_write(
++				storage_backend,
++				context->owner_id,
++				info->metadata.uid,
++				data_len,
++				data);
++		}
+ 	}
+ 
+ 	if ((psa_status != PSA_SUCCESS) && is_nv) {
+ 
+ 		/* A storage failure has occurred so attempt to fix any
+-		* mismatch between the variable index and stored NV variables.
+-		*/
++		 * mismatch between the variable index and stored NV variables.
++		 */
+ 		purge_orphan_index_entries(context);
+ 	}
+ 
+@@ -598,6 +603,76 @@ static efi_status_t load_variable_data(
+ 	return psa_to_efi_storage_status(psa_status);
+ }
+ 
++static psa_status_t append_write(
++	struct storage_backend *storage_backend,
++	uint32_t client_id,
++	uint64_t uid,
++	size_t data_length,
++	const void *data)
++{
++	struct psa_storage_info_t storage_info;
++
++	if (data_length == 0) return PSA_SUCCESS;
++
++	psa_status_t psa_status = storage_backend->interface->get_info(
++		storage_backend->context,
++		client_id,
++		uid,
++		&storage_info);
++
++	if (psa_status != PSA_SUCCESS) return psa_status;
++
++	/* Determine size of appended variable */
++	size_t new_size = storage_info.size + data_length;
++
++	/* Defend against integer overflow */
++	if (new_size < storage_info.size) return PSA_ERROR_INVALID_ARGUMENT;
++
++	/* Storage backend doesn't support an append operation so we need
++	 * need to read the current variable data, extend it and write it back.
++	 */
++	uint8_t *rw_buf = malloc(new_size);
++	if (!rw_buf) return PSA_ERROR_INSUFFICIENT_MEMORY;
++
++	size_t old_size = 0;
++	psa_status = storage_backend->interface->get(
++		storage_backend->context,
++		client_id,
++		uid,
++		0,
++		new_size,
++		rw_buf,
++		&old_size);
++
++	if (psa_status == PSA_SUCCESS) {
++
++		if ((old_size + data_length) <= new_size) {
++
++			/* Extend the variable data */
++			memcpy(&rw_buf[old_size], data, data_length);
++
++			psa_status = storage_backend->interface->set(
++				storage_backend->context,
++				client_id,
++				uid,
++				old_size + data_length,
++				rw_buf,
++				storage_info.flags);
++		}
++		else {
++
++			/* There's a mismatch between the length obtained from
++			 * get_info() and the subsequent length returned by get().
++			 */
++			psa_status = PSA_ERROR_STORAGE_FAILURE;
++		}
++	}
++
++	free(rw_buf);
++
++	return psa_status;
++}
++
+ static void purge_orphan_index_entries(
+ 	struct uefi_variable_store *context)
+ {
+@@ -612,7 +687,7 @@ static void purge_orphan_index_entries(
+ 	 */
+ 	while (!variable_index_iterator_is_done(&iter)) {
+ 
+-		const struct variable_info *info = variable_index_iterator_current(&iter);
++		struct variable_info *info = variable_index_iterator_current(&iter);
+ 
+ 		if (info->is_variable_set && (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) {
+ 
+@@ -628,7 +703,7 @@ static void purge_orphan_index_entries(
+ 			if (psa_status != PSA_SUCCESS) {
+ 
+ 				/* Detected a mismatch between the index and storage */
+-				variable_index_remove_variable(&context->variable_index, info);
++				variable_index_clear_variable(&context->variable_index, info);
+ 				any_orphans = true;
+ 			}
+ 		}
+diff --git a/components/service/smm_variable/backend/variable_index.c b/components/service/smm_variable/backend/variable_index.c
+index 99d7c97..a8a5575 100644
+--- a/components/service/smm_variable/backend/variable_index.c
++++ b/components/service/smm_variable/backend/variable_index.c
+@@ -132,13 +132,13 @@ size_t variable_index_max_dump_size(
+ 	return sizeof(struct variable_metadata) * context->max_variables;
+ }
+ 
+-const struct variable_info *variable_index_find(
+-	const struct variable_index *context,
++struct variable_info *variable_index_find(
++	struct variable_index *context,
+ 	const EFI_GUID *guid,
+ 	size_t name_size,
+ 	const int16_t *name)
+ {
+-	const struct variable_info *result = NULL;
++	struct variable_info *result = NULL;
+ 	int pos = find_variable(context, guid, name_size, name);
+ 
+ 	if (pos >= 0) {
+@@ -149,13 +149,13 @@ const struct variable_info *variable_index_find(
+ 	return result;
+ }
+ 
+-const struct variable_info *variable_index_find_next(
++struct variable_info *variable_index_find_next(
+ 	const struct variable_index *context,
+ 	const EFI_GUID *guid,
+ 	size_t name_size,
+ 	const int16_t *name)
+ {
+-	const struct variable_info *result = NULL;
++	struct variable_info *result = NULL;
+ 
+ 	if (name_size >= sizeof(int16_t)) {
+ 
+@@ -263,12 +263,11 @@ static struct variable_entry *add_entry(
+ 	return entry;
+ }
+ 
+-const struct variable_info *variable_index_add_variable(
++struct variable_info *variable_index_add_entry(
+ 	struct variable_index *context,
+ 	const EFI_GUID *guid,
+ 	size_t name_size,
+-	const int16_t *name,
+-	uint32_t attributes)
++	const int16_t *name)
+ {
+ 	struct variable_info *info = NULL;
+ 	struct variable_entry *entry = add_entry(context, guid, name_size, name);
+@@ -276,40 +275,41 @@ const struct variable_info *variable_index_add_variable(
+ 	if (entry) {
+ 
+ 		info = &entry->info;
+-
+-		info->metadata.attributes = attributes;
+-		info->is_variable_set = true;
+-
+-		mark_dirty(entry);
+ 	}
+ 
+ 	return info;
+ }
+ 
+-const struct variable_info *variable_index_add_constraints(
++void variable_index_remove_unused_entry(
+ 	struct variable_index *context,
+-	const EFI_GUID *guid,
+-	size_t name_size,
+-	const int16_t *name,
+-	const struct variable_constraints *constraints)
++	struct variable_info *info)
+ {
+-	struct variable_info *info = NULL;
+-	struct variable_entry *entry = add_entry(context, guid, name_size, name);
+-
+-	if (entry) {
++	if (info &&
++		!info->is_constraints_set &&
++		!info->is_variable_set) {
+ 
+-		info = &entry->info;
++		struct variable_entry *entry = containing_entry(info);
++		entry->in_use = false;
+ 
+-		info->check_constraints = *constraints;
+-		info->is_constraints_set = true;
++		memset(info, 0, sizeof(struct variable_info));
+ 	}
++}
+ 
+-	return info;
++void variable_index_set_variable(
++	struct variable_info *info,
++	uint32_t attributes)
++{
++	struct variable_entry *entry = containing_entry(info);
++
++	info->metadata.attributes = attributes;
++	info->is_variable_set = true;
++
++	mark_dirty(entry);
+ }
+ 
+-void variable_index_remove_variable(
++void variable_index_clear_variable(
+ 	struct variable_index *context,
+-	const struct variable_info *info)
++	struct variable_info *info)
+ {
+ 	if (info) {
+ 
+@@ -318,48 +318,17 @@ void variable_index_remove_variable(
+ 
+ 		/* Mark variable as no longer set */
+ 		entry->info.is_variable_set = false;
+-
+-		/* Entry may still be needed if check constraints were set */
+-		entry->in_use = info->is_constraints_set;
+-
+-		if (!entry->in_use) {
+-
+-			/* Entry not needed so wipe */
+-			memset(&entry->info, 0, sizeof(struct variable_info));
+-		}
+ 	}
+ }
+ 
+-void variable_index_update_variable(
+-	const struct variable_info *info,
+-	uint32_t attributes)
+-{
+-	if (info) {
+-
+-		struct variable_info *modified_info = (struct variable_info*)info;
+-		struct variable_entry *entry = containing_entry(modified_info);
+-
+-		if (!modified_info->is_variable_set ||
+-			(attributes != modified_info->metadata.attributes)) {
+-
+-			/* The update changes the variable_info state */
+-			modified_info->is_variable_set = true;
+-			modified_info->metadata.attributes = attributes;
+-			mark_dirty(entry);
+-		}
+-	}
+-}
+-
+-void variable_index_update_constraints(
+-	const struct variable_info *info,
++void variable_index_set_constraints(
++	struct variable_info *info,
+ 	const struct variable_constraints *constraints)
+ {
+ 	if (info) {
+ 
+-		struct variable_info *modified_info = (struct variable_info*)info;
+-
+-		modified_info->check_constraints = *constraints;
+-		modified_info->is_constraints_set = true;
++		info->check_constraints = *constraints;
++		info->is_constraints_set = true;
+ 	}
+ }
+ 
+diff --git a/components/service/smm_variable/backend/variable_index.h b/components/service/smm_variable/backend/variable_index.h
+index e109d0d..63f42ab 100644
+--- a/components/service/smm_variable/backend/variable_index.h
++++ b/components/service/smm_variable/backend/variable_index.h
+@@ -119,8 +119,8 @@ size_t variable_index_max_dump_size(
+  *
+  * @return     Pointer to variable_info or NULL
+  */
+-const struct variable_info *variable_index_find(
+-	const struct variable_index *context,
++struct variable_info *variable_index_find(
++	struct variable_index *context,
+ 	const EFI_GUID *guid,
+ 	size_t name_size,
+ 	const int16_t *name);
+@@ -135,78 +135,76 @@ const struct variable_info *variable_index_find(
+  *
+  * @return     Pointer to variable_info or NULL
+  */
+-const struct variable_info *variable_index_find_next(
++struct variable_info *variable_index_find_next(
+ 	const struct variable_index *context,
+ 	const EFI_GUID *guid,
+ 	size_t name_size,
+ 	const int16_t *name);
+ 
+ /**
+- * @brief      Add a new variable to the index
++ * @brief      Add a new entry to the index
++ *
++ * An entry is needed either when a new variable is created or
++ * when variable constraints are set for a variable that doesn't
++ * yet exist.
+  *
+  * @param[in]  context variable_index
+  * @param[in]  guid The variable's guid
+  * @param[in]  name_size The name parameter's size
+  * @param[in]  name The variable's name
+- * @param[in]  attributes The variable's attributes
+  *
+  * @return     Pointer to variable_info or NULL
+  */
+-const struct variable_info *variable_index_add_variable(
++struct variable_info *variable_index_add_entry(
+ 	struct variable_index *context,
+ 	const EFI_GUID *guid,
+ 	size_t name_size,
+-	const int16_t *name,
+-	uint32_t attributes);
++	const int16_t *name);
+ 
+ /**
+- * @brief      Remove a variable from the index
++ * @brief      Remove an unused entry from the index
+  *
+- * Removes a variable from the index if it exists.
++ * Removes an entry if it is not in use.
+  *
+  * @param[in]  context variable_index
+  * @param[in]  info The variable info corresponding to the entry to remove
+  */
+-void variable_index_remove_variable(
++void variable_index_remove_unused_entry(
+ 	struct variable_index *context,
+-	const struct variable_info *info);
++	struct variable_info *info);
+ 
+ /**
+- * @brief      Update a variable that's already in the index
++ * @brief      Set a variable to the index
++ *
++ * An entry for the variable must already exist.
+  *
+  * @param[in]  info variable info
+  * @param[in]  attributes The variable's attributes
+  */
+-void variable_index_update_variable(
+-	const struct variable_info *info,
++void variable_index_set_variable(
++	struct variable_info *info,
+ 	uint32_t attributes);
+ 
+ /**
+- * @brief      Add a new check constraints object to the index
++ * @brief      Clear a variable from the index
+  *
+- * @param[in]  context variable_index
+- * @param[in]  guid The variable's guid
+- * @param[in]  name_size The name parameter's size
+- * @param[in]  name The variable's name
+- * @param[in]  constraints The check constraints
++ * Clears a variable from the index
+  *
+- * @return     Pointer to variable_info or NULL
++ * @param[in]  context variable_index
++ * @param[in]  info The variable info corresponding to the variable to clear
+  */
+-const struct variable_info *variable_index_add_constraints(
++void variable_index_clear_variable(
+ 	struct variable_index *context,
+-	const EFI_GUID *guid,
+-	size_t name_size,
+-	const int16_t *name,
+-	const struct variable_constraints *constraints);
++	struct variable_info *info);
+ 
+ /**
+- * @brief      Update variable constraints that are already in the index
++ * @brief      Set a check constraints object associated with a variavle
+  *
+  * @param[in]  info variable info
+  * @param[in]  constraints The check constraints
+  */
+-void variable_index_update_constraints(
+-	const struct variable_info *info,
++void variable_index_set_constraints(
++	struct variable_info *info,
+ 	const struct variable_constraints *constraints);
+ 
+ /**
+diff --git a/components/service/smm_variable/backend/variable_index_iterator.c b/components/service/smm_variable/backend/variable_index_iterator.c
+index 7cc6dc7..8f8fc74 100644
+--- a/components/service/smm_variable/backend/variable_index_iterator.c
++++ b/components/service/smm_variable/backend/variable_index_iterator.c
+@@ -31,10 +31,10 @@ bool variable_index_iterator_is_done(
+ 	return iter->current_pos >= iter->variable_index->max_variables;
+ }
+ 
+-const struct variable_info *variable_index_iterator_current(
++struct variable_info *variable_index_iterator_current(
+ 	const struct variable_index_iterator *iter)
+ {
+-	const struct variable_info *current = NULL;
++	struct variable_info *current = NULL;
+ 
+ 	if (!variable_index_iterator_is_done(iter)) {
+ 
+diff --git a/components/service/smm_variable/backend/variable_index_iterator.h b/components/service/smm_variable/backend/variable_index_iterator.h
+index f64a2c4..7ff77c5 100644
+--- a/components/service/smm_variable/backend/variable_index_iterator.h
++++ b/components/service/smm_variable/backend/variable_index_iterator.h
+@@ -54,7 +54,7 @@ bool variable_index_iterator_is_done(
+  *
+  * @return     Pointer to variable_info or NULL
+  */
+-const struct variable_info *variable_index_iterator_current(
++struct variable_info *variable_index_iterator_current(
+ 	const struct variable_index_iterator *iter);
+ 
+ /**
+diff --git a/components/service/smm_variable/test/service/smm_variable_service_tests.cpp b/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
+index d76d9cc..088940a 100644
+--- a/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
++++ b/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
+@@ -249,6 +249,30 @@ TEST(SmmVariableServiceTests, setAndGet)
+ 	UNSIGNED_LONGS_EQUAL(set_data.size(), get_data.size());
+ 	LONGS_EQUAL(0, get_data.compare(set_data));
+ 
++	/* Extend the variable using an append write */
++	std::string append_data = " values added with append write";
++
++	efi_status = m_client->set_variable(
++		m_common_guid,
++		var_name,
++		append_data,
++		EFI_VARIABLE_APPEND_WRITE);
++
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
++
++	efi_status = m_client->get_variable(
++		m_common_guid,
++		var_name,
++		get_data);
++
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
++
++	std::string appended_data = set_data + append_data;
++
++	/* Expect the append write operation to have extended the variable */
++	UNSIGNED_LONGLONGS_EQUAL(appended_data.size(), get_data.size());
++	LONGS_EQUAL(0, appended_data.compare(get_data));
++
+ 	/* Expect remove to be permitted */
+ 	efi_status = m_client->remove_variable(m_common_guid, var_name);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
+@@ -279,6 +303,30 @@ TEST(SmmVariableServiceTests, setAndGetNv)
+ 	UNSIGNED_LONGS_EQUAL(set_data.size(), get_data.size());
+ 	LONGS_EQUAL(0, get_data.compare(set_data));
+ 
++	/* Extend the variable using an append write */
++	std::string append_data = " values added with append write";
++
++	efi_status = m_client->set_variable(
++		m_common_guid,
++		var_name,
++		append_data,
++		EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_APPEND_WRITE);
++
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
++
++	efi_status = m_client->get_variable(
++		m_common_guid,
++		var_name,
++		get_data);
++
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
++
++	std::string appended_data = set_data + append_data;
++
++	/* Expect the append write operation to have extended the variable */
++	UNSIGNED_LONGLONGS_EQUAL(appended_data.size(), get_data.size());
++	LONGS_EQUAL(0, appended_data.compare(get_data));
++
+ 	/* Expect remove to be permitted */
+ 	efi_status = m_client->remove_variable(m_common_guid, var_name);
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
+diff --git a/protocols/service/smm_variable/parameters.h b/protocols/service/smm_variable/parameters.h
+index 1f795a9..233f301 100644
+--- a/protocols/service/smm_variable/parameters.h
++++ b/protocols/service/smm_variable/parameters.h
+@@ -47,6 +47,9 @@ typedef struct {
+ 	 EFI_VARIABLE_HARDWARE_ERROR_RECORD | \
+ 	 EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS | \
+ 	 EFI_VARIABLE_APPEND_WRITE)
++#define	EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS_MASK \
++	(EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS | \
++	 EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS)
+ 
+ /**
+  * Parameter structure for SetVariable and GetVariable.
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
new file mode 100644
index 0000000..7649389
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch
@@ -0,0 +1,822 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 7cc8eaa66c6ecfd66a27317efd9b03725564a43a Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Thu, 2 Dec 2021 17:27:55 +0000
+Subject: [PATCH] Add UEFI variable support for QueryVariableInfo
+
+Adds support for the UEFI QueryVariableInfo operation. The total
+store size currently relies on pre-configured values, set for a
+particular deployment. Ideally, this information would be read
+from the storage backend. This facility is not however yet
+supported by the storage backend interface or by any PSA
+storage backend storage providers.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: I971252831f7e478914d736c672d184a371e64502
+
+diff --git a/components/service/smm_variable/backend/test/variable_store_tests.cpp b/components/service/smm_variable/backend/test/variable_store_tests.cpp
+index 578f118..e90c106 100644
+--- a/components/service/smm_variable/backend/test/variable_store_tests.cpp
++++ b/components/service/smm_variable/backend/test/variable_store_tests.cpp
+@@ -27,6 +27,18 @@ TEST_GROUP(UefiVariableStoreTests)
+ 
+ 		UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
+ 
++		uefi_variable_store_set_storage_limits(
++			&m_uefi_variable_store,
++			EFI_VARIABLE_NON_VOLATILE,
++			STORE_CAPACITY,
++			MAX_VARIABLE_SIZE);
++
++		uefi_variable_store_set_storage_limits(
++			&m_uefi_variable_store,
++			0,
++			STORE_CAPACITY,
++			MAX_VARIABLE_SIZE);
++
+ 		setup_common_guid();
+ 	}
+ 
+@@ -152,6 +164,33 @@ TEST_GROUP(UefiVariableStoreTests)
+ 		return status;
+ 	}
+ 
++	efi_status_t query_variable_info(
++		uint32_t attributes,
++		size_t *max_variable_storage_size,
++		size_t *remaining_variable_storage_size,
++		size_t *max_variable_size)
++	{
++		SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO query;
++
++		query.MaximumVariableStorageSize = 0;
++		query.RemainingVariableStorageSize = 0;
++		query.MaximumVariableSize = 0;
++		query.Attributes = attributes;
++
++		efi_status_t status = uefi_variable_store_query_variable_info(
++			&m_uefi_variable_store,
++			&query);
++
++		if (status == EFI_SUCCESS) {
++
++			*max_variable_storage_size = query.MaximumVariableStorageSize;
++			*remaining_variable_storage_size = query.RemainingVariableStorageSize;
++			*max_variable_size = query.MaximumVariableSize;
++		}
++
++		return status;
++	}
++
+ 	efi_status_t set_check_var_property(
+ 		const std::wstring &name,
+ 		const VAR_CHECK_VARIABLE_PROPERTY &check_property)
+@@ -195,7 +234,8 @@ TEST_GROUP(UefiVariableStoreTests)
+ 
+ 		if (info && (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) {
+ 
+-			struct storage_backend *storage_backend = m_uefi_variable_store.persistent_store;
++			struct storage_backend *storage_backend =
++				m_uefi_variable_store.persistent_store.storage_backend;
+ 
+ 			storage_backend->interface->remove(
+ 				storage_backend->context,
+@@ -220,9 +260,24 @@ TEST_GROUP(UefiVariableStoreTests)
+ 			m_volatile_backend);
+ 
+ 		UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
++
++		uefi_variable_store_set_storage_limits(
++			&m_uefi_variable_store,
++			EFI_VARIABLE_NON_VOLATILE,
++			STORE_CAPACITY,
++			MAX_VARIABLE_SIZE);
++
++		uefi_variable_store_set_storage_limits(
++			&m_uefi_variable_store,
++			0,
++			STORE_CAPACITY,
++			MAX_VARIABLE_SIZE);
+ 	}
+ 
+ 	static const size_t MAX_VARIABLES = 10;
++	static const size_t MAX_VARIABLE_SIZE = 100;
++	static const size_t STORE_CAPACITY = 1000;
++
+ 	static const uint32_t OWNER_ID = 100;
+ 	static const size_t VARIABLE_BUFFER_SIZE = 1024;
+ 
+@@ -265,6 +320,22 @@ TEST(UefiVariableStoreTests, setGetRoundtrip)
+ 	/* Expect the append write operation to have extended the variable */
+ 	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
+ 	LONGS_EQUAL(0, expected_output.compare(output_data));
++
++	/* Expect query_variable_info to return consistent values */
++	size_t max_variable_storage_size = 0;
++	size_t remaining_variable_storage_size = 0;
++	size_t max_variable_size = 0;
++
++	status = query_variable_info(
++		0,
++		&max_variable_storage_size,
++		&remaining_variable_storage_size,
++		&max_variable_size);
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
++
++	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY, max_variable_storage_size);
++	UNSIGNED_LONGLONGS_EQUAL(MAX_VARIABLE_SIZE, max_variable_size);
++	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY - expected_output.size(), remaining_variable_storage_size);
+ }
+ 
+ TEST(UefiVariableStoreTests, persistentSetGet)
+@@ -311,6 +382,22 @@ TEST(UefiVariableStoreTests, persistentSetGet)
+ 	/* Still expect got variable data to be the same as the set value */
+ 	UNSIGNED_LONGLONGS_EQUAL(expected_output.size(), output_data.size());
+ 	LONGS_EQUAL(0, expected_output.compare(output_data));
++
++	/* Expect query_variable_info to return consistent values */
++	size_t max_variable_storage_size = 0;
++	size_t remaining_variable_storage_size = 0;
++	size_t max_variable_size = 0;
++
++	status = query_variable_info(
++		EFI_VARIABLE_NON_VOLATILE,
++		&max_variable_storage_size,
++		&remaining_variable_storage_size,
++		&max_variable_size);
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, status);
++
++	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY, max_variable_storage_size);
++	UNSIGNED_LONGLONGS_EQUAL(MAX_VARIABLE_SIZE, max_variable_size);
++	UNSIGNED_LONGLONGS_EQUAL(STORE_CAPACITY - expected_output.size(), remaining_variable_storage_size);
+ }
+ 
+ TEST(UefiVariableStoreTests, removeVolatile)
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
+index bcb8599..ed50eaf 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/smm_variable/backend/uefi_variable_store.c
+@@ -46,8 +46,15 @@ static efi_status_t load_variable_data(
+ 	SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var,
+ 	size_t max_data_len);
+ 
+-static psa_status_t append_write(
+-	struct storage_backend *storage_backend,
++static psa_status_t store_overwrite(
++	struct delegate_variable_store *delegate_store,
++	uint32_t client_id,
++	uint64_t uid,
++	size_t data_length,
++	const void *data);
++
++static psa_status_t store_append_write(
++	struct delegate_variable_store *delegate_store,
+ 	uint32_t client_id,
+ 	uint64_t uid,
+ 	size_t data_length,
+@@ -56,6 +63,15 @@ static psa_status_t append_write(
+ static void purge_orphan_index_entries(
+ 	struct uefi_variable_store *context);
+ 
++static struct delegate_variable_store *select_delegate_store(
++	struct uefi_variable_store *context,
++	uint32_t attributes);
++
++static size_t space_used(
++	struct uefi_variable_store *context,
++	uint32_t attributes,
++	struct storage_backend *storage_backend);
++
+ static efi_status_t psa_to_efi_storage_status(
+ 	psa_status_t psa_status);
+ 
+@@ -66,6 +82,10 @@ static efi_status_t check_name_terminator(
+ /* Private UID for storing the variable index */
+ #define VARIABLE_INDEX_STORAGE_UID			(1)
+ 
++/* Default maximum variable size -
++ * may be overridden using uefi_variable_store_set_storage_limits()
++ */
++#define DEFAULT_MAX_VARIABLE_SIZE			(2048)
+ 
+ efi_status_t uefi_variable_store_init(
+ 	struct uefi_variable_store *context,
+@@ -76,8 +96,17 @@ efi_status_t uefi_variable_store_init(
+ {
+ 	efi_status_t status = EFI_SUCCESS;
+ 
+-	context->persistent_store = persistent_store;
+-	context->volatile_store = volatile_store;
++	/* Initialise persistent store defaults */
++	context->persistent_store.is_nv = true;
++	context->persistent_store.max_variable_size = DEFAULT_MAX_VARIABLE_SIZE;
++	context->persistent_store.total_capacity = DEFAULT_MAX_VARIABLE_SIZE * max_variables;
++	context->persistent_store.storage_backend = persistent_store;
++
++	/* Initialise volatile store defaults */
++	context->volatile_store.is_nv = false;
++	context->volatile_store.max_variable_size = DEFAULT_MAX_VARIABLE_SIZE;
++	context->volatile_store.total_capacity = DEFAULT_MAX_VARIABLE_SIZE * max_variables;
++	context->volatile_store.storage_backend = volatile_store;
+ 
+ 	context->owner_id = owner_id;
+ 	context->is_boot_service = true;
+@@ -116,6 +145,20 @@ void uefi_variable_store_deinit(
+ 	context->index_sync_buffer = NULL;
+ }
+ 
++void uefi_variable_store_set_storage_limits(
++	struct uefi_variable_store *context,
++	uint32_t attributes,
++	size_t total_capacity,
++	size_t max_variable_size)
++{
++	struct delegate_variable_store *delegate_store = select_delegate_store(
++		context,
++		attributes);
++
++	delegate_store->total_capacity = total_capacity;
++	delegate_store->max_variable_size = max_variable_size;
++}
++
+ efi_status_t uefi_variable_store_set_variable(
+ 	struct uefi_variable_store *context,
+ 	const SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE *var)
+@@ -284,12 +327,24 @@ efi_status_t uefi_variable_store_get_next_variable_name(
+ 
+ efi_status_t uefi_variable_store_query_variable_info(
+ 	struct uefi_variable_store *context,
+-	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *cur)
++	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *var_info)
+ {
+-	efi_status_t status = EFI_UNSUPPORTED;
++	struct delegate_variable_store *delegate_store = select_delegate_store(
++		context,
++		var_info->Attributes);
+ 
++	size_t total_used = space_used(
++		context,
++		var_info->Attributes,
++		delegate_store->storage_backend);
+ 
+-	return status;
++	var_info->MaximumVariableSize = delegate_store->max_variable_size;
++	var_info->MaximumVariableStorageSize = delegate_store->total_capacity;
++	var_info->RemainingVariableStorageSize = (total_used < delegate_store->total_capacity) ?
++		delegate_store->total_capacity - total_used :
++		0;
++
++	return EFI_SUCCESS;
+ }
+ 
+ efi_status_t uefi_variable_store_exit_boot_service(
+@@ -375,7 +430,7 @@ efi_status_t uefi_variable_store_get_var_check_property(
+ static void load_variable_index(
+ 	struct uefi_variable_store *context)
+ {
+-	struct storage_backend *persistent_store = context->persistent_store;
++	struct storage_backend *persistent_store = context->persistent_store.storage_backend;
+ 
+ 	if (persistent_store) {
+ 
+@@ -413,7 +468,7 @@ static efi_status_t sync_variable_index(
+ 
+ 	if (is_dirty) {
+ 
+-		struct storage_backend *persistent_store = context->persistent_store;
++		struct storage_backend *persistent_store = context->persistent_store.storage_backend;
+ 
+ 		if (persistent_store) {
+ 
+@@ -501,30 +556,27 @@ static efi_status_t store_variable_data(
+ 	const uint8_t *data = (const uint8_t*)var +
+ 		SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(var);
+ 
+-	bool is_nv = (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE);
+-
+-	struct storage_backend *storage_backend = (is_nv) ?
+-		context->persistent_store :
+-		context->volatile_store;
++	struct delegate_variable_store *delegate_store = select_delegate_store(
++		context,
++		info->metadata.attributes);
+ 
+-	if (storage_backend) {
++	if (delegate_store->storage_backend) {
+ 
+ 		if (!(var->Attributes & EFI_VARIABLE_APPEND_WRITE)) {
+ 
+ 			/* Create or overwrite variable data */
+-			psa_status = storage_backend->interface->set(
+-				storage_backend->context,
++			psa_status = store_overwrite(
++				delegate_store,
+ 				context->owner_id,
+ 				info->metadata.uid,
+ 				data_len,
+-				data,
+-				PSA_STORAGE_FLAG_NONE);
++				data);
+ 		}
+ 		else {
+ 
+ 			/* Append new data to existing variable data */
+-			psa_status = append_write(
+-				storage_backend,
++			psa_status = store_append_write(
++				delegate_store,
+ 				context->owner_id,
+ 				info->metadata.uid,
+ 				data_len,
+@@ -532,7 +584,7 @@ static efi_status_t store_variable_data(
+ 		}
+ 	}
+ 
+-	if ((psa_status != PSA_SUCCESS) && is_nv) {
++	if ((psa_status != PSA_SUCCESS) && delegate_store->is_nv) {
+ 
+ 		/* A storage failure has occurred so attempt to fix any
+ 		 * mismatch between the variable index and stored NV variables.
+@@ -551,16 +603,14 @@ static efi_status_t remove_variable_data(
+ 
+ 	if (info->is_variable_set) {
+ 
+-		bool is_nv = (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE);
++		struct delegate_variable_store *delegate_store = select_delegate_store(
++			context,
++			info->metadata.attributes);
+ 
+-		struct storage_backend *storage_backend = (is_nv) ?
+-			context->persistent_store :
+-			context->volatile_store;
++		if (delegate_store->storage_backend) {
+ 
+-		if (storage_backend) {
+-
+-			psa_status = storage_backend->interface->remove(
+-				storage_backend->context,
++			psa_status = delegate_store->storage_backend->interface->remove(
++				delegate_store->storage_backend->context,
+ 				context->owner_id,
+ 				info->metadata.uid);
+ 		}
+@@ -580,16 +630,14 @@ static efi_status_t load_variable_data(
+ 	uint8_t *data = (uint8_t*)var +
+ 		SMM_VARIABLE_COMMUNICATE_ACCESS_VARIABLE_DATA_OFFSET(var);
+ 
+-	bool is_nv = (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE);
++	struct delegate_variable_store *delegate_store = select_delegate_store(
++		context,
++		info->metadata.attributes);
+ 
+-	struct storage_backend *storage_backend = (is_nv) ?
+-		context->persistent_store :
+-		context->volatile_store;
++	if (delegate_store->storage_backend) {
+ 
+-	if (storage_backend) {
+-
+-		psa_status = storage_backend->interface->get(
+-			storage_backend->context,
++		psa_status = delegate_store->storage_backend->interface->get(
++			delegate_store->storage_backend->context,
+ 			context->owner_id,
+ 			info->metadata.uid,
+ 			0,
+@@ -603,8 +651,29 @@ static efi_status_t load_variable_data(
+ 	return psa_to_efi_storage_status(psa_status);
+ }
+ 
+-static psa_status_t append_write(
+-	struct storage_backend *storage_backend,
++static psa_status_t store_overwrite(
++	struct delegate_variable_store *delegate_store,
++	uint32_t client_id,
++	uint64_t uid,
++	size_t data_length,
++	const void *data)
++{
++	/* Police maximum variable size limit */
++	if (data_length > delegate_store->max_variable_size) return PSA_ERROR_INVALID_ARGUMENT;
++
++	psa_status_t psa_status = delegate_store->storage_backend->interface->set(
++		delegate_store->storage_backend->context,
++		client_id,
++		uid,
++		data_length,
++		data,
++		PSA_STORAGE_FLAG_NONE);
++
++	return psa_status;
++}
++
++static psa_status_t store_append_write(
++	struct delegate_variable_store *delegate_store,
+ 	uint32_t client_id,
+ 	uint64_t uid,
+ 	size_t data_length,
+@@ -614,8 +683,8 @@ static psa_status_t append_write(
+ 
+ 	if (data_length == 0) return PSA_SUCCESS;
+ 
+-	psa_status_t psa_status = storage_backend->interface->get_info(
+-		storage_backend->context,
++	psa_status_t psa_status = delegate_store->storage_backend->interface->get_info(
++		delegate_store->storage_backend->context,
+ 		client_id,
+ 		uid,
+ 		&storage_info);
+@@ -628,6 +697,9 @@ static psa_status_t append_write(
+ 	/* Defend against integer overflow */
+ 	if (new_size < storage_info.size) return PSA_ERROR_INVALID_ARGUMENT;
+ 
++		/* Police maximum variable size limit */
++	if (new_size > delegate_store->max_variable_size) return PSA_ERROR_INVALID_ARGUMENT;
++
+ 	/* Storage backend doesn't support an append operation so we need
+ 	 * need to read the current variable data, extend it and write it back.
+ 	 */
+@@ -635,8 +707,8 @@ static psa_status_t append_write(
+ 	if (!rw_buf) return PSA_ERROR_INSUFFICIENT_MEMORY;
+ 
+ 	size_t old_size = 0;
+-	psa_status = storage_backend->interface->get(
+-		storage_backend->context,
++	psa_status = delegate_store->storage_backend->interface->get(
++		delegate_store->storage_backend->context,
+ 		client_id,
+ 		uid,
+ 		0,
+@@ -651,8 +723,8 @@ static psa_status_t append_write(
+ 			/* Extend the variable data */
+ 			memcpy(&rw_buf[old_size], data, data_length);
+ 
+-			psa_status = storage_backend->interface->set(
+-				storage_backend->context,
++			psa_status = delegate_store->storage_backend->interface->set(
++				delegate_store->storage_backend->context,
+ 				client_id,
+ 				uid,
+ 				old_size + data_length,
+@@ -692,7 +764,7 @@ static void purge_orphan_index_entries(
+ 		if (info->is_variable_set && (info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE)) {
+ 
+ 			struct psa_storage_info_t storage_info;
+-			struct storage_backend *storage_backend = context->persistent_store;
++			struct storage_backend *storage_backend = context->persistent_store.storage_backend;
+ 
+ 			psa_status_t psa_status = storage_backend->interface->get_info(
+ 				storage_backend->context,
+@@ -714,6 +786,53 @@ static void purge_orphan_index_entries(
+ 	if (any_orphans) sync_variable_index(context);
+ }
+ 
++static struct delegate_variable_store *select_delegate_store(
++	struct uefi_variable_store *context,
++	uint32_t attributes)
++{
++	bool is_nv = (attributes & EFI_VARIABLE_NON_VOLATILE);
++
++	return (is_nv) ?
++		&context->persistent_store :
++		&context->volatile_store;
++}
++
++static size_t space_used(
++	struct uefi_variable_store *context,
++	uint32_t attributes,
++	struct storage_backend *storage_backend)
++{
++	if (!storage_backend) return 0;
++
++	size_t total_used = 0;
++	struct variable_index_iterator iter;
++	variable_index_iterator_first(&iter, &context->variable_index);
++
++	while (!variable_index_iterator_is_done(&iter)) {
++
++		struct variable_info *info = variable_index_iterator_current(&iter);
++
++		if (info->is_variable_set &&
++		    ((info->metadata.attributes & EFI_VARIABLE_NON_VOLATILE) ==
++			 (attributes & EFI_VARIABLE_NON_VOLATILE))) {
++
++			struct psa_storage_info_t storage_info;
++
++			psa_status_t psa_status = storage_backend->interface->get_info(
++				storage_backend->context,
++				context->owner_id,
++				info->metadata.uid,
++				&storage_info);
++
++			if (psa_status == PSA_SUCCESS) total_used += storage_info.size;
++		}
++
++		variable_index_iterator_next(&iter);
++	}
++
++	return total_used;
++}
++
+ static efi_status_t psa_to_efi_storage_status(
+ 	psa_status_t psa_status)
+ {
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.h b/components/service/smm_variable/backend/uefi_variable_store.h
+index fe0f24a..cc99206 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.h
++++ b/components/service/smm_variable/backend/uefi_variable_store.h
+@@ -20,6 +20,20 @@
+ extern "C" {
+ #endif
+ 
++/**
++ * \brief delegate_variable_store structure definition
++ *
++ * A delegate_variable_store combines an association with a concrete
++ * storage backend and a set of limits parameters.
++ */
++struct delegate_variable_store
++{
++	bool is_nv;
++	size_t total_capacity;
++	size_t max_variable_size;
++	struct storage_backend *storage_backend;
++};
++
+ /**
+  * \brief uefi_variable_store structure definition
+  *
+@@ -35,8 +49,8 @@ struct uefi_variable_store
+ 	uint8_t *index_sync_buffer;
+ 	size_t index_sync_buffer_size;
+ 	struct variable_index variable_index;
+-	struct storage_backend *persistent_store;
+-	struct storage_backend *volatile_store;
++	struct delegate_variable_store persistent_store;
++	struct delegate_variable_store volatile_store;
+ };
+ 
+ /**
+@@ -69,6 +83,23 @@ efi_status_t uefi_variable_store_init(
+ void uefi_variable_store_deinit(
+ 	struct uefi_variable_store *context);
+ 
++/**
++ * @brief      Set storage limits
++ *
++ * Overrides the default limits for the specified storage space. These
++ * values are reflected in the values returned by QueryVariableInfo.
++ *
++ * @param[in]  context uefi_variable_store instance
++ * @param[in]  attributes EFI_VARIABLE_NON_VOLATILE or 0
++ * @param[in]  total_capacity The total storage capacity in bytes
++ * @param[in]  max_variable_size Variable size limit
++ */
++void uefi_variable_store_set_storage_limits(
++	struct uefi_variable_store *context,
++	uint32_t attributes,
++	size_t total_capacity,
++	size_t max_variable_size);
++
+ /**
+  * @brief      Set variable
+  *
+@@ -123,13 +154,13 @@ efi_status_t uefi_variable_store_get_next_variable_name(
+  * @brief      Query for variable info
+  *
+  * @param[in]  context uefi_variable_store instance
+- * @param[out] info Returns info
++ * @param[inout] var_info Returns info
+  *
+  * @return     EFI_SUCCESS if succesful
+  */
+ efi_status_t uefi_variable_store_query_variable_info(
+ 	struct uefi_variable_store *context,
+-	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *cur);
++	SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *var_info);
+ 
+ /**
+  * @brief      Exit boot service
+diff --git a/components/service/smm_variable/client/cpp/smm_variable_client.cpp b/components/service/smm_variable/client/cpp/smm_variable_client.cpp
+index a68b7ac..8438285 100644
+--- a/components/service/smm_variable/client/cpp/smm_variable_client.cpp
++++ b/components/service/smm_variable/client/cpp/smm_variable_client.cpp
+@@ -219,6 +219,72 @@ efi_status_t smm_variable_client::get_next_variable_name(
+ 		0);
+ }
+ 
++efi_status_t smm_variable_client::query_variable_info(
++	uint32_t attributes,
++	size_t *max_variable_storage_size,
++	size_t *remaining_variable_storage_size,
++	size_t *max_variable_size)
++{
++	efi_status_t efi_status = EFI_NOT_READY;
++
++	size_t req_len = sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO);
++	rpc_call_handle call_handle;
++	uint8_t *req_buf;
++
++	call_handle = rpc_caller_begin(m_caller, &req_buf, req_len);
++
++	if (call_handle) {
++
++		uint8_t *resp_buf;
++        size_t resp_len;
++		rpc_opstatus_t opstatus;
++
++		SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO *query =
++			(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO*)req_buf;
++
++		query->Attributes = attributes;
++		query->MaximumVariableSize = 0;
++		query->MaximumVariableStorageSize = 0;
++		query->RemainingVariableStorageSize = 0;
++
++		m_err_rpc_status = rpc_caller_invoke(m_caller, call_handle,
++			SMM_VARIABLE_FUNCTION_QUERY_VARIABLE_INFO, &opstatus, &resp_buf, &resp_len);
++
++		if (m_err_rpc_status == TS_RPC_CALL_ACCEPTED) {
++
++			efi_status = opstatus;
++
++			if (efi_status == EFI_SUCCESS) {
++
++				if (resp_len >= sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO)) {
++
++					query = (SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO*)resp_buf;
++
++					*max_variable_storage_size = query->MaximumVariableStorageSize;
++					*remaining_variable_storage_size = query->RemainingVariableStorageSize;
++					*max_variable_size = query->MaximumVariableSize;
++				}
++				else {
++
++					efi_status = EFI_PROTOCOL_ERROR;
++				}
++			}
++			else {
++
++				efi_status = EFI_PROTOCOL_ERROR;
++			}
++		}
++		else {
++
++			efi_status = rpc_to_efi_status();
++		}
++
++		rpc_caller_end(m_caller, call_handle);
++	}
++
++	return efi_status;
++}
++
+ efi_status_t smm_variable_client::get_next_variable_name(
+ 	EFI_GUID &guid,
+ 	std::wstring &name,
+diff --git a/components/service/smm_variable/client/cpp/smm_variable_client.h b/components/service/smm_variable/client/cpp/smm_variable_client.h
+index 9c36c4e..c797391 100644
+--- a/components/service/smm_variable/client/cpp/smm_variable_client.h
++++ b/components/service/smm_variable/client/cpp/smm_variable_client.h
+@@ -63,6 +63,13 @@ public:
+ 		const EFI_GUID &guid,
+ 		const std::wstring &name);
+ 
++	/* Query variable info */
++	efi_status_t query_variable_info(
++		uint32_t attributes,
++		size_t *max_variable_storage_size,
++		size_t *remaining_variable_storage_size,
++		size_t *max_variable_size);
++
+ 	/* Get the next variable name - for enumerating store contents */
+ 	efi_status_t get_next_variable_name(
+ 		EFI_GUID &guid,
+diff --git a/components/service/smm_variable/provider/smm_variable_provider.c b/components/service/smm_variable/provider/smm_variable_provider.c
+index d239a42..52e68d0 100644
+--- a/components/service/smm_variable/provider/smm_variable_provider.c
++++ b/components/service/smm_variable/provider/smm_variable_provider.c
+@@ -252,11 +252,38 @@ static rpc_status_t set_variable_handler(void *context, struct call_req* req)
+ 
+ static rpc_status_t query_variable_info_handler(void *context, struct call_req* req)
+ {
++	efi_status_t efi_status = EFI_INVALID_PARAMETER;
+ 	struct smm_variable_provider *this_instance = (struct smm_variable_provider*)context;
+ 
+-	/* todo */
++	const struct call_param_buf *req_buf = call_req_get_req_buf(req);
++
++	if (req_buf->data_len >= sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO)) {
++
++		struct call_param_buf *resp_buf = call_req_get_resp_buf(req);
++
++		if (resp_buf->size >= req_buf->data_len) {
+ 
+-	return TS_RPC_ERROR_NOT_READY;
++			memmove(resp_buf->data, req_buf->data, req_buf->data_len);
++
++			efi_status = uefi_variable_store_query_variable_info(
++				&this_instance->variable_store,
++				(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO*)resp_buf->data);
++
++			if (efi_status == EFI_SUCCESS) {
++
++				resp_buf->data_len = sizeof(SMM_VARIABLE_COMMUNICATE_QUERY_VARIABLE_INFO);
++			}
++		}
++		else {
++
++			/* Reponse buffer not big enough */
++			efi_status = EFI_BAD_BUFFER_SIZE;
++		}
++	}
++
++	call_req_set_opstatus(req, efi_status);
++
++	return TS_RPC_CALL_ACCEPTED;
+ }
+ 
+ static rpc_status_t exit_boot_service_handler(void *context, struct call_req* req)
+diff --git a/components/service/smm_variable/test/service/smm_variable_service_tests.cpp b/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
+index 088940a..15556e9 100644
+--- a/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
++++ b/components/service/smm_variable/test/service/smm_variable_service_tests.cpp
+@@ -335,12 +335,38 @@ TEST(SmmVariableServiceTests, setAndGetNv)
+ TEST(SmmVariableServiceTests, enumerateStoreContents)
+ {
+ 	efi_status_t efi_status = EFI_SUCCESS;
++
++	/* Query information about the empty variable store */
++	size_t nv_max_variable_storage_size = 0;
++	size_t nv_max_variable_size = 0;
++	size_t nv_remaining_variable_storage_size = 0;
++
++	efi_status = m_client->query_variable_info(
++		EFI_VARIABLE_NON_VOLATILE,
++		&nv_max_variable_storage_size,
++		&nv_remaining_variable_storage_size,
++		&nv_max_variable_size);
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
++	UNSIGNED_LONGLONGS_EQUAL(nv_max_variable_storage_size, nv_remaining_variable_storage_size);
++
++	size_t v_max_variable_storage_size = 0;
++	size_t v_max_variable_size = 0;
++	size_t v_remaining_variable_storage_size = 0;
++
++	efi_status = m_client->query_variable_info(
++		0,
++		&v_max_variable_storage_size,
++		&v_remaining_variable_storage_size,
++		&v_max_variable_size);
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
++	UNSIGNED_LONGLONGS_EQUAL(v_max_variable_storage_size, v_remaining_variable_storage_size);
++
++	/* Add some variables to the store */
+ 	std::wstring var_name_1 = L"varibale_1";
+ 	std::wstring var_name_2 = L"varibale_2";
+ 	std::wstring var_name_3 = L"varibale_3";
+ 	std::string set_data = "Some variable data";
+ 
+-	/* Add some variables to the store */
+ 	efi_status = m_client->set_variable(
+ 		m_common_guid,
+ 		var_name_1,
+@@ -365,6 +391,33 @@ TEST(SmmVariableServiceTests, enumerateStoreContents)
+ 
+ 	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
+ 
++	/* Query variable info again and check it's as expected */
++	size_t max_variable_storage_size = 0;
++	size_t max_variable_size = 0;
++	size_t remaining_variable_storage_size = 0;
++
++	/* Check non-volatile - two variables have been added */
++	efi_status = m_client->query_variable_info(
++		EFI_VARIABLE_NON_VOLATILE,
++		&max_variable_storage_size,
++		&remaining_variable_storage_size,
++		&max_variable_size);
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
++	UNSIGNED_LONGLONGS_EQUAL(
++		(nv_remaining_variable_storage_size - set_data.size() * 2),
++		remaining_variable_storage_size);
++
++	/* Check volatile - one variables have been added */
++	efi_status = m_client->query_variable_info(
++		0,
++		&max_variable_storage_size,
++		&remaining_variable_storage_size,
++		&max_variable_size);
++	UNSIGNED_LONGLONGS_EQUAL(EFI_SUCCESS, efi_status);
++	UNSIGNED_LONGLONGS_EQUAL(
++		(v_remaining_variable_storage_size - set_data.size() * 1),
++		remaining_variable_storage_size);
++
+ 	/* Enumerate store contents - expect the values we added */
+ 	std::wstring var_name;
+ 	EFI_GUID guid = {0};
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0016-Add-uefi-test-deployment.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0016-Add-uefi-test-deployment.patch
new file mode 100644
index 0000000..9bc8f8a
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0016-Add-uefi-test-deployment.patch
@@ -0,0 +1,239 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 409e2c5eeb4999852acbe22da346f018e30f15c0 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Mon, 6 Dec 2021 15:20:12 +0000
+Subject: [PATCH] Add uefi-test deployment
+
+Adds a new deployment for building and running service level tests
+for UEFI SMM services. Tests may be run against StMM, smm-gateway
+or any other similar secure-world uefi service provider.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: Ic0e16dff51ef76ddd1f4dea37a4a55b029edd696
+
+diff --git a/deployments/ts-service-test/arm-linux/CMakeLists.txt b/deployments/ts-service-test/arm-linux/CMakeLists.txt
+index 6a01d38..e902cd2 100644
+--- a/deployments/ts-service-test/arm-linux/CMakeLists.txt
++++ b/deployments/ts-service-test/arm-linux/CMakeLists.txt
+@@ -23,9 +23,6 @@ add_components(
+ 	BASE_DIR ${TS_ROOT}
+ 	COMPONENTS
+ 		"components/app/test-runner"
+-# Running smm_variable tests currently requires kernel built with CONFIG_STRICT_DEVMEM=n
+-#		"components/service/smm_variable/client/cpp"
+-#		"components/service/smm_variable/test/service"
+  )
+ 
+ include(${TS_ROOT}/external/CppUTest/CppUTest.cmake)
+diff --git a/deployments/uefi-test/arm-linux/CMakeLists.txt b/deployments/uefi-test/arm-linux/CMakeLists.txt
+new file mode 100644
+index 0000000..053041a
+--- /dev/null
++++ b/deployments/uefi-test/arm-linux/CMakeLists.txt
+@@ -0,0 +1,43 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++cmake_minimum_required(VERSION 3.16)
++include(../../deployment.cmake REQUIRED)
++
++#-------------------------------------------------------------------------------
++#  The CMakeLists.txt for building the uefi-test deployment for arm-linux
++#
++#  Used for building and running service level tests from Linux user-space
++#  on an Arm platform with real deployments of UEFI SMM services
++#-------------------------------------------------------------------------------
++include(${TS_ROOT}/environments/arm-linux/env.cmake)
++project(trusted-services LANGUAGES CXX C)
++add_executable(uefi-test)
++target_include_directories(uefi-test PRIVATE "${TOP_LEVEL_INCLUDE_DIRS}")
++
++add_components(
++	TARGET "uefi-test"
++	BASE_DIR ${TS_ROOT}
++	COMPONENTS
++		"components/app/test-runner"
++ )
++
++include(${TS_ROOT}/external/CppUTest/CppUTest.cmake)
++target_link_libraries(uefi-test PRIVATE CppUTest)
++
++#-------------------------------------------------------------------------------
++#  Extend with components that are common across all deployments of
++#  uefi-test
++#
++#-------------------------------------------------------------------------------
++include(../uefi-test.cmake REQUIRED)
++
++#-------------------------------------------------------------------------------
++#  Define library options and dependencies.
++#
++#-------------------------------------------------------------------------------
++env_set_link_options(TGT uefi-test)
++target_link_libraries(uefi-test PRIVATE stdc++ gcc m)
+diff --git a/deployments/uefi-test/linux-pc/CMakeLists.txt b/deployments/uefi-test/linux-pc/CMakeLists.txt
+new file mode 100644
+index 0000000..be6e984
+--- /dev/null
++++ b/deployments/uefi-test/linux-pc/CMakeLists.txt
+@@ -0,0 +1,76 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++cmake_minimum_required(VERSION 3.16)
++include(../../deployment.cmake REQUIRED)
++
++#-------------------------------------------------------------------------------
++#  The CMakeLists.txt for building the uefi-test deployment for linux-pc
++#
++#  Used for building and running service level tests in a native PC enviroment.
++#  Tests can be run by running the built executable called "uefi-test"
++#-------------------------------------------------------------------------------
++include(${TS_ROOT}/environments/linux-pc/env.cmake)
++project(trusted-services LANGUAGES CXX C)
++
++# Prevents symbols in the uefi-test executable overriding symbols with
++# with same name in libts during dynamic linking performed by the program
++# loader.
++set(CMAKE_C_VISIBILITY_PRESET hidden)
++
++# Preparing firmware-test-build by including it
++include(${TS_ROOT}/external/firmware_test_builder/FirmwareTestBuilder.cmake)
++
++include(CTest)
++include(UnitTest)
++
++set(COVERAGE FALSE CACHE BOOL "Enable code coverage measurement")
++set(UNIT_TEST_PROJECT_PATH ${TS_ROOT} CACHE PATH "Path of the project directory")
++set(CMAKE_CXX_STANDARD 11)
++
++unit_test_init_cpputest()
++
++if (COVERAGE)
++	include(Coverage)
++
++	set(COVERAGE_FILE "coverage.info")
++	set(TS_SERVICE_TEST_COVERAGE_FILE "uefi-test-coverage.info" CACHE PATH "Path of coverage info file")
++	set(TS_SERVICE_TEST_COVERAGE_REPORT_DIR "${CMAKE_CURRENT_BINARY_DIR}/ts-service-coverage-report" CACHE PATH "Directory of coverage report")
++
++	# Collecting coverage
++	coverage_generate(
++		NAME "ts-service test"
++		SOURCE_DIR ${TS_ROOT}
++		BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}
++		OUTPUT_FILE ${COVERAGE_FILE}
++	)
++
++	# Filtering project file coverage
++	coverage_filter(
++		INPUT_FILE ${COVERAGE_FILE}
++		OUTPUT_FILE ${TS_SERVICE_TEST_COVERAGE_FILE}
++		INCLUDE_DIRECTORY ${UNIT_TEST_PROJECT_PATH}/components
++	)
++
++	# Coverage report
++	coverage_generate_report(
++		INPUT_FILE ${TS_SERVICE_TEST_COVERAGE_FILE}
++		OUTPUT_DIRECTORY ${TS_SERVICE_TEST_COVERAGE_REPORT_DIR}
++	)
++endif()
++
++unit_test_add_suite(
++	NAME uefi-test
++)
++
++target_include_directories(uefi-test PRIVATE "${TOP_LEVEL_INCLUDE_DIRS}")
++
++#-------------------------------------------------------------------------------
++#  Extend with components that are common across all deployments of
++#  uefi-test
++#
++#-------------------------------------------------------------------------------
++include(../uefi-test.cmake REQUIRED)
+diff --git a/deployments/uefi-test/uefi-test.cmake b/deployments/uefi-test/uefi-test.cmake
+new file mode 100644
+index 0000000..ea678d0
+--- /dev/null
++++ b/deployments/uefi-test/uefi-test.cmake
+@@ -0,0 +1,52 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++
++#-------------------------------------------------------------------------------
++#  The base build file shared between deployments of 'uefi-test' for
++#  different environments.  Used for running end-to-end service-level tests
++#  against SMM service providers that implement UEFI services such as smm
++#  variable.
++#-------------------------------------------------------------------------------
++
++#-------------------------------------------------------------------------------
++#  Use libts for locating and accessing services. An appropriate version of
++#  libts will be imported for the enviroment in which service tests are
++#  deployed.
++#-------------------------------------------------------------------------------
++include(${TS_ROOT}/deployments/libts/libts-import.cmake)
++target_link_libraries(uefi-test PRIVATE libts)
++
++#-------------------------------------------------------------------------------
++#  Components that are common accross all deployments
++#
++#-------------------------------------------------------------------------------
++add_components(
++	TARGET "uefi-test"
++	BASE_DIR ${TS_ROOT}
++	COMPONENTS
++		"components/service/smm_variable/client/cpp"
++		"components/service/smm_variable/test/service"
++)
++
++#-------------------------------------------------------------------------------
++#  Components used from external projects
++#
++#-------------------------------------------------------------------------------
++
++# Nanopb
++include(${TS_ROOT}/external/nanopb/nanopb.cmake)
++target_link_libraries(uefi-test PRIVATE nanopb::protobuf-nanopb-static)
++protobuf_generate_all(TGT "uefi-test" NAMESPACE "protobuf" BASE_DIR "${TS_ROOT}/protocols")
++
++#-------------------------------------------------------------------------------
++#  Define install content.
++#
++#-------------------------------------------------------------------------------
++if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
++	set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install CACHE PATH "location to install build output to." FORCE)
++endif()
++install(TARGETS uefi-test RUNTIME DESTINATION ${TS_ENV}/bin)
+diff --git a/tools/b-test/test_data.yaml b/tools/b-test/test_data.yaml
+index 11f8f63..33a85b1 100644
+--- a/tools/b-test/test_data.yaml
++++ b/tools/b-test/test_data.yaml
+@@ -163,3 +163,13 @@ data:
+       os_id : "GNU/Linux"
+       params:
+           - "-GUnix Makefiles"
++    - name: "uefi-test-pc-linux"
++      src: "$TS_ROOT/deployments/uefi-test/linux-pc"
++      os_id : "GNU/Linux"
++      params:
++          - "-GUnix Makefiles"
++    - name: "uefi-test-arm-linux"
++      src: "$TS_ROOT/deployments/uefi-test/arm-linux"
++      os_id : "GNU/Linux"
++      params:
++          - "-GUnix Makefiles"
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch
new file mode 100644
index 0000000..f024361
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 5ea2bdc34efcbbd235091341027d86fd8d9ffb16 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Wed, 8 Dec 2021 11:48:28 +0000
+Subject: [PATCH] Fix interface ID parameter setting in sp/ffarpc_caller
+
+When making FFA based RPC calls from one SP to another, the
+destination interface ID parameter was not being set correctly.
+This change fixes this issue.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: Iab520e4c7dc63ee1f5d3bf1bd1de702e4cc6f093
+
+diff --git a/components/rpc/ffarpc/caller/sp/ffarpc_caller.c b/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
+index 250b178..dabcd90 100644
+--- a/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
++++ b/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
+@@ -81,7 +81,7 @@ static rpc_status_t call_invoke(void *context, rpc_call_handle handle, uint32_t
+ 	req.destination_id = this_context->dest_partition_id;
+ 	req.source_id = own_id;
+ 	req.args[SP_CALL_ARGS_IFACE_ID_OPCODE] =
+-		FFA_CALL_ARGS_COMBINE_IFACE_ID_OPCODE(this_context->dest_partition_id, opcode);
++		FFA_CALL_ARGS_COMBINE_IFACE_ID_OPCODE(this_context->dest_iface_id, opcode);
+ 	//TODO: downcast problem?
+ 	req.args[SP_CALL_ARGS_REQ_DATA_LEN] = (uint32_t)this_context->req_len;
+ 	req.args[SP_CALL_ARGS_ENCODING] = this_context->rpc_caller.encoding;
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch
new file mode 100644
index 0000000..0ecbdfa
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch
@@ -0,0 +1,107 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From e3891ecaaa754eab74166bacea19f25dce060451 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Wed, 8 Dec 2021 16:05:22 +0000
+Subject: [PATCH] Support FFARPC call requests with no shared buffer
+
+To allow simple clients to make RPC calls for service operations
+that take no request parameters and return no response parameters,
+the ffarpc_call_ep.c has been modified to accept call requests
+when no shared buffer exists, as long as there is no request data.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: I83b1bfb719a005922d6394887492d2d272b74907
+
+diff --git a/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c b/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
+index 17f957c..a08a250 100644
+--- a/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
++++ b/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
+@@ -150,29 +150,43 @@ out:
+ static void handle_service_msg(struct ffa_call_ep *call_ep, uint16_t source_id,
+ 			       const uint32_t *req_args, uint32_t *resp_args)
+ {
+-	rpc_status_t rpc_status = TS_RPC_ERROR_INTERNAL;
++	rpc_status_t rpc_status = TS_RPC_ERROR_INVALID_PARAMETER;
+ 	struct call_req call_req;
+ 
+ 	uint32_t ifaceid_opcode = req_args[SP_CALL_ARGS_IFACE_ID_OPCODE];
+ 	int idx = find_shm(call_ep, source_id);
+ 
+-	if (idx < 0) {
+-		EMSG("handle service msg error");
+-		goto out;
+-	}
+-
+ 	call_req.caller_id = source_id;
+ 	call_req.interface_id = FFA_CALL_ARGS_EXTRACT_IFACE(ifaceid_opcode);
+ 	call_req.opcode = FFA_CALL_ARGS_EXTRACT_OPCODE(ifaceid_opcode);
+ 	call_req.encoding = req_args[SP_CALL_ARGS_ENCODING];
+ 
+-	call_req.req_buf.data = call_ep->shmem_buf[idx];
+ 	call_req.req_buf.data_len = req_args[SP_CALL_ARGS_REQ_DATA_LEN];
+-	call_req.req_buf.size = call_ep->shmem_buf_size[idx];
+-
+-	call_req.resp_buf.data = call_ep->shmem_buf[idx];
+ 	call_req.resp_buf.data_len = 0;
+-	call_req.resp_buf.size = call_ep->shmem_buf_size[idx];
++
++	if (idx >= 0 && call_ep->shmem_buf[idx]) {
++		/* A shared buffer is available for call parameters */
++		call_req.req_buf.data = call_ep->shmem_buf[idx];
++		call_req.req_buf.size = call_ep->shmem_buf_size[idx];
++
++		call_req.resp_buf.data = call_ep->shmem_buf[idx];
++		call_req.resp_buf.size = call_ep->shmem_buf_size[idx];
++	}
++	else if (call_req.req_buf.data_len == 0) {
++		/* No shared buffer so only allow calls with no request data */
++		call_req.req_buf.data = NULL;
++		call_req.req_buf.size = 0;
++
++		call_req.resp_buf.data = NULL;
++		call_req.resp_buf.size = 0;
++	}
++	else {
++		/*
++		 * Caller has specified non-zero length request data but there is
++		 * no shared buffer to carry the request data.
++		 */
++		goto out;
++	}
+ 
+ 	rpc_status = rpc_interface_receive(call_ep->iface, &call_req);
+ 
+@@ -223,7 +237,6 @@ void ffa_call_ep_receive(struct ffa_call_ep *call_ep,
+ {
+ 	const uint32_t *req_args = req_msg->args;
+ 	uint32_t *resp_args = resp_msg->args;
+-	int idx;
+ 
+ 	uint16_t source_id = req_msg->source_id;
+ 	uint32_t ifaceid_opcode = req_args[SP_CALL_ARGS_IFACE_ID_OPCODE];
+@@ -232,18 +245,7 @@ void ffa_call_ep_receive(struct ffa_call_ep *call_ep,
+ 		/* It's an RPC layer management request */
+ 		handle_mgmt_msg(call_ep, source_id, req_args, resp_args);
+ 	} else {
+-		/*
+-		 * Assume anything else is a service request. Service requests
+-		 * rely on a buffer being shared from the requesting client.
+-		 * If it hasn't been set-up, fail the request.
+-		 */
+-		idx = find_shm(call_ep, source_id);
+-
+-		if (idx >= 0 && call_ep->shmem_buf[idx]) {
+-			handle_service_msg(call_ep, source_id, req_args, resp_args);
+-		} else {
+-			EMSG("shared buffer not found or NULL");
+-			set_mgmt_resp_args(resp_args, ifaceid_opcode, TS_RPC_ERROR_NOT_READY);
+-		}
++		/* Assume anything else is a service request */
++		handle_service_msg(call_ep, source_id, req_args, resp_args);
+ 	}
+ }
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 7d36476..135cc37 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -24,9 +24,14 @@ SRC_URI:append = " \
                   file://0011-Add-common-service-component-to-ipc-support.patch \
                   file://0012-Add-secure-storage-ipc-backend.patch \
                   file://0013-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch \
+                  file://0014-Add-uefi-variable-append-write-support.patch \
+                  file://0015-Add-UEFI-variable-support-for-QueryVariableInfo.patch \
+                  file://0016-Add-uefi-test-deployment.patch \
+                  file://0017-Fix-interface-ID-parameter-setting-in-sp-ffarpc_call.patch \
+                  file://0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch \
                   "
 
-SRCREV_ts = "882a2db4f9181fc6ddb505b82262f82e5a0c2fd5"
+SRCREV_ts = "a365a04f937b9b76ebb2e0eeade226f208cbc0d2"
 
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
 SRCREV_mbed = "cf4a40ba0a3086cabb5a8227245191161fd26383"
-- 
2.17.1


