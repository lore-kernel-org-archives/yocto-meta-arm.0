Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CCFC43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:55:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12045.1667573694935551085
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 07:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF3681FB;
	Fri,  4 Nov 2022 07:55:00 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B4883F703;
	Fri,  4 Nov 2022 07:54:53 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 2/3] arm-bsp/trusted-services: psa test setup corstone1000
Date: Fri,  4 Nov 2022 14:54:45 +0000
Message-Id: <20221104145446.26551-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221104145446.26551-1-emekcan.aras@arm.com>
References: <20221104145446.26551-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Nov 2022 14:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4079

From: Rui Miguel Silva <rui.silva@linaro.org>

Reorder patch list headers, move psa api test patch that
should be applied to all psa api test from a crypto specific
directory to a more generic "psa-apitest" directory.

Create a inc file for the psa api test to make sure all out of
tree patches from trusted services are applied to all test
source directories, and move mm communicator buffer details to
each SP, and finally set it up differently as it
should/is expected to be at libts.

With this setup all psa-api test for crypto and attestation
passed.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 ...1-Add-openamp-to-SE-proxy-deployment.patch |  6 +-
 ...iver-and-the-OpenAmp-conversion-laye.patch |  6 +-
 .../0003-Add-openamp-rpc-caller.patch         |  6 +-
 ...-add-psa-client-definitions-for-ff-m.patch |  6 +-
 ...mon-service-component-to-ipc-support.patch |  6 +-
 .../0006-Add-secure-storage-ipc-backend.patch |  6 +-
 ...storage-ipc-and-openamp-for-se_proxy.patch |  6 +-
 .../corstone1000/0008-Run-psa-arch-test.patch |  6 +-
 ...0009-Use-address-instead-of-pointers.patch |  6 +-
 ...-Add-psa-ipc-attestation-to-se-proxy.patch | 75 ++++++++++++++++---
 ...d-as-openamp-rpc-using-secure-storag.patch |  6 +-
 .../0012-add-psa-ipc-crypto-backend.patch     | 22 +-----
 ...ub-capsule-update-service-components.patch |  8 +-
 .../0014-Configure-storage-size.patch         |  8 +-
 ...face-structure-aligned-with-tf-m-cha.patch |  6 +-
 ...egrate-remaining-psa-ipc-client-APIs.patch |  6 +-
 ...et_key_usage_flags-definition-to-the.patch |  6 +-
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch | 11 ++-
 ...rstone1000-change-default-smm-values.patch |  6 +-
 .../0020-FMP-Support-in-Corstone1000.patch    | 15 ++--
 ...0001-corstone1000-port-crypto-config.patch |  0
 .../trusted-services/libts_git.bbappend       | 10 +++
 .../trusted-services/ts-corstone1000.inc      | 47 ++++++------
 .../trusted-services/ts-psa-api-test.inc      |  7 ++
 .../ts-psa-crypto-api-test_git.bbappend       |  8 +-
 .../ts-psa-iat-api-test_git.bbappend          |  1 +
 .../ts-psa-its-api-test_git.bbappend          |  1 +
 .../ts-psa-ps-api-test_git.bbappend           |  1 +
 .../ts-sp-se-proxy_%.bbappend                 |  5 ++
 .../ts-sp-smm-gateway_%.bbappend              |  5 ++
 30 files changed, 185 insertions(+), 123 deletions(-)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{ts-psa-crypto-api-test => psa-apitest}/0001-corstone1000-port-crypto-config.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/libts_git.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_git.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_git.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_git.bbappend

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Add-openamp-to-SE-proxy-deployment.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Add-openamp-to-SE-proxy-deployment.patch
index 801905d9..c44885cf 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Add-openamp-to-SE-proxy-deployment.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Add-openamp-to-SE-proxy-deployment.patch
@@ -1,7 +1,7 @@
-From 7c9589c4bb056db5e1696f2a777891ab235b1b63 Mon Sep 17 00:00:00 2001
+From 13de79cd4f0d25b812e5f4ad4a19bc075496be83 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 16:36:51 +0000
-Subject: [PATCH 01/19] Add openamp to SE proxy deployment
+Subject: [PATCH 01/20] Add openamp to SE proxy deployment
 
 Openamp is required to communicate between secure partitions(running on
 Cortex-A) and trusted-firmware-m(running on Cortex-M).
@@ -283,5 +283,5 @@ index 000000000000..449f35f4fda4
 +set_property(TARGET openamp PROPERTY IMPORTED_LOCATION "${OPENAMP_INSTALL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}open_amp${CMAKE_STATIC_LIBRARY_SUFFIX}")
 +set_property(TARGET openamp PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${OPENAMP_INSTALL_DIR}/include")
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
index 39edc9d1..0371a7a4 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
@@ -1,7 +1,7 @@
-From e4ccb92f8de94a82edd3548d62c853790ae36bd1 Mon Sep 17 00:00:00 2001
+From 28aedac78016e5063ebd675a43e6c3655f87b442 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 18:00:46 +0000
-Subject: [PATCH 02/19] Implement mhu driver and the OpenAmp conversion layer.
+Subject: [PATCH 02/20] Implement mhu driver and the OpenAmp conversion layer.
 
 This commit adds an mhu driver (v2.1 and v2) to the secure
 partition se_proxy and a conversion layer to communicate with
@@ -1087,5 +1087,5 @@ index 000000000000..bb778bb9719b
 +# include MHU driver
 +include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Add-openamp-rpc-caller.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Add-openamp-rpc-caller.patch
index bf52a238..5686face 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Add-openamp-rpc-caller.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Add-openamp-rpc-caller.patch
@@ -1,7 +1,7 @@
-From e187510a814b48b7b2e477a9913ee35b68522d06 Mon Sep 17 00:00:00 2001
+From 55394c4c9681af71b1ed7f7ebc7c44b2e1737113 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:00:54 +0000
-Subject: [PATCH 03/19] Add openamp rpc caller
+Subject: [PATCH 03/20] Add openamp rpc caller
 
 Upstream-Status: Pending
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
@@ -1192,5 +1192,5 @@ index d39873a0fe81..34fe5ff1b925 100644
  		# Stub service provider backends
  		"components/rpc/dummy"
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-add-psa-client-definitions-for-ff-m.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-add-psa-client-definitions-for-ff-m.patch
index 32462245..84d418c1 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-add-psa-client-definitions-for-ff-m.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-add-psa-client-definitions-for-ff-m.patch
@@ -1,7 +1,7 @@
-From 8c1bc5a7ae525d64802e2a06746f698f54cf07ca Mon Sep 17 00:00:00 2001
+From fb6d2f33e26c7b6ef88d552feca1f835da3f0df6 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:05:18 +0000
-Subject: [PATCH 04/19] add psa client definitions for ff-m
+Subject: [PATCH 04/20] add psa client definitions for ff-m
 
 Add PSA client definitions in common include to add future
 ff-m support.
@@ -294,5 +294,5 @@ index 000000000000..aaa973c6e987
 +
 +#endif /* __PSA_MANIFEST_SID_H__ */
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Add-common-service-component-to-ipc-support.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Add-common-service-component-to-ipc-support.patch
index e179fb03..df3cb2f4 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Add-common-service-component-to-ipc-support.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Add-common-service-component-to-ipc-support.patch
@@ -1,7 +1,7 @@
-From e9778f726ed582360152f150301995b10d268aae Mon Sep 17 00:00:00 2001
+From 0311fc8f131fe7a2b0f4dd9988c610fda47394aa Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:13:03 +0000
-Subject: [PATCH 05/19] Add common service component to ipc support
+Subject: [PATCH 05/20] Add common service component to ipc support
 
 Add support for inter processor communication for PSA
 including, the openamp client side structures lib.
@@ -291,5 +291,5 @@ index 34fe5ff1b925..dd0c5d00c21e 100644
  		"components/service/discovery/provider"
  		"components/service/discovery/provider/serializer/packed-c"
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Add-secure-storage-ipc-backend.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Add-secure-storage-ipc-backend.patch
index cac43ec4..74a83777 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Add-secure-storage-ipc-backend.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Add-secure-storage-ipc-backend.patch
@@ -1,7 +1,7 @@
-From 0df82487a7a253c601ca20ca1bd64fbb9ed64230 Mon Sep 17 00:00:00 2001
+From ed4371d63cb52c121be9678bc225055944286c30 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:19:24 +0000
-Subject: [PATCH 06/19] Add secure storage ipc backend
+Subject: [PATCH 06/20] Add secure storage ipc backend
 
 Add secure storage ipc ff-m implementation which may use
 openamp as rpc to communicate with other processor.
@@ -519,5 +519,5 @@ index dd0c5d00c21e..cd51460406ca 100644
  		"components/service/attestation/provider"
  		"components/service/attestation/provider/serializer/packed-c"
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
index 192e9768..ad33295d 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
@@ -1,7 +1,7 @@
-From 9c7f1e6a5eb9ab887e568cfa3c2003583d387bc9 Mon Sep 17 00:00:00 2001
+From d1377a5ed909e3a1d9caca56aeda262a80322a4b Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Fri, 3 Dec 2021 19:25:34 +0000
-Subject: [PATCH 07/19] Use secure storage ipc and openamp for se_proxy
+Subject: [PATCH 07/20] Use secure storage ipc and openamp for se_proxy
 
 Remove mock up backend for secure storage in se proxy
 deployment and use instead the secure storage ipc backend with
@@ -59,5 +59,5 @@ index acfb6e8873fa..57290056d614 100644
  	return secure_storage_provider_init(&ps_provider, backend);
  }
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Run-psa-arch-test.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Run-psa-arch-test.patch
index ce7aacf3..ab576882 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Run-psa-arch-test.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Run-psa-arch-test.patch
@@ -1,7 +1,7 @@
-From d9169d380366afc63af5d4bf02791aeb41f47897 Mon Sep 17 00:00:00 2001
+From 1b50ab6b6ff1c6f27ab320e18fb0d4aeb1122f0d Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Sun, 12 Dec 2021 10:43:48 +0000
-Subject: [PATCH 08/19] Run psa-arch-test
+Subject: [PATCH 08/20] Run psa-arch-test
 
 Fixes needed to run psa-arch-test
 
@@ -68,5 +68,5 @@ index 4f6ba2a7d822..1fd6b40dc803 100644
  };
  
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Use-address-instead-of-pointers.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Use-address-instead-of-pointers.patch
index ca0c9d95..3295fa9b 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Use-address-instead-of-pointers.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Use-address-instead-of-pointers.patch
@@ -1,7 +1,7 @@
-From ee767c1ae857cfcc8b4bb520b2558091e253cf94 Mon Sep 17 00:00:00 2001
+From a6fba503ffddae004e23b32559212e749e8586f6 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Sun, 12 Dec 2021 10:57:17 +0000
-Subject: [PATCH 09/19] Use address instead of pointers
+Subject: [PATCH 09/20] Use address instead of pointers
 
 Since secure enclave is 32bit and we 64bit there is an issue
 in the protocol communication design that force us to handle
@@ -164,5 +164,5 @@ index a1f369db253e..bda442a61d5c 100644
  
  	(void)client_id;
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Add-psa-ipc-attestation-to-se-proxy.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Add-psa-ipc-attestation-to-se-proxy.patch
index d47b0dec..2d0725cb 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Add-psa-ipc-attestation-to-se-proxy.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Add-psa-ipc-attestation-to-se-proxy.patch
@@ -1,7 +1,7 @@
-From afdeb8e098a1f2822adf2ea83ded8dd9e2d021ba Mon Sep 17 00:00:00 2001
+From b142f3c162fb1c28982d26b5ac2181ba79197a28 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 7 Dec 2021 11:50:00 +0000
-Subject: [PATCH 10/19] Add psa ipc attestation to se proxy
+Subject: [PATCH 10/20] Add psa ipc attestation to se proxy
 
 Implement attestation client API as psa ipc and include it to
 se proxy deployment.
@@ -16,12 +16,15 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  .../reporter/psa_ipc/psa_ipc_attest_report.c  | 45 ++++++++++
  components/service/common/include/psa/sid.h   |  4 +
  .../se-proxy/common/service_proxy_factory.c   |  6 ++
- deployments/se-proxy/se-proxy.cmake           |  3 +-
- 7 files changed, 169 insertions(+), 1 deletion(-)
+ deployments/se-proxy/se-proxy.cmake           |  7 +-
+ ...ble-using-hard-coded-attestation-key.patch | 29 -------
+ external/psa_arch_tests/psa_arch_tests.cmake  |  4 -
+ 9 files changed, 171 insertions(+), 36 deletions(-)
  create mode 100644 components/service/attestation/client/psa_ipc/component.cmake
  create mode 100644 components/service/attestation/client/psa_ipc/iat_ipc_client.c
  create mode 100644 components/service/attestation/reporter/psa_ipc/component.cmake
  create mode 100644 components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c
+ delete mode 100644 external/psa_arch_tests/0001-Disable-using-hard-coded-attestation-key.patch
 
 diff --git a/components/service/attestation/client/psa_ipc/component.cmake b/components/service/attestation/client/psa_ipc/component.cmake
 new file mode 100644
@@ -243,10 +246,10 @@ index 57290056d614..4b8cceccbe4d 100644
  	attest_provider_register_serializer(&attest_provider,
  		TS_RPC_ENCODING_PACKED_C, packedc_attest_provider_serializer_instance());
 diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/se-proxy.cmake
-index cd51460406ca..38d26821d44d 100644
+index cd51460406ca..3dbbc36c968d 100644
 --- a/deployments/se-proxy/se-proxy.cmake
 +++ b/deployments/se-proxy/se-proxy.cmake
-@@ -49,12 +49,13 @@ add_components(TARGET "se-proxy"
+@@ -49,14 +49,15 @@ add_components(TARGET "se-proxy"
  		"components/service/attestation/include"
  		"components/service/attestation/provider"
  		"components/service/attestation/provider/serializer/packed-c"
@@ -258,9 +261,63 @@ index cd51460406ca..38d26821d44d 100644
  		"components/rpc/dummy"
  		"components/rpc/common/caller"
 -		"components/service/attestation/reporter/stub"
- 		"components/service/attestation/key_mngr/stub"
- 		"components/service/crypto/backend/stub"
+-		"components/service/attestation/key_mngr/stub"
+-		"components/service/crypto/backend/stub"
++		"components/service/attestation/key_mngr/local"
++		"components/service/crypto/backend/psa_ipc"
  		"components/service/crypto/client/psa"
+ 		"components/service/secure_storage/backend/mock_store"
+ )
+diff --git a/external/psa_arch_tests/0001-Disable-using-hard-coded-attestation-key.patch b/external/psa_arch_tests/0001-Disable-using-hard-coded-attestation-key.patch
+deleted file mode 100644
+index 6664961ab662..000000000000
+--- a/external/psa_arch_tests/0001-Disable-using-hard-coded-attestation-key.patch
++++ /dev/null
+@@ -1,29 +0,0 @@
+-From dbd25f94eb62a9855bf342dd97503a49ea50f83e Mon Sep 17 00:00:00 2001
+-From: Gyorgy Szing <Gyorgy.Szing@arm.com>
+-Date: Tue, 8 Feb 2022 17:06:37 +0000
+-Subject: [PATCH 1/1] Disable using hard-coded attestation key
+-
+-Modify platform config to disable using a hard-coded attestation
+-key.
+-
+-Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+----
+- api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_config.h | 2 +-
+- 1 file changed, 1 insertion(+), 1 deletion(-)
+-
+-diff --git a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_config.h b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_config.h
+-index 6112ba7..1cdf581 100755
+---- a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_config.h
+-+++ b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_config.h
+-@@ -60,7 +60,7 @@ typedef uint32_t            cfg_id_t;
+- #define CRYPTO_VERSION_BETA3
+- 
+- /* Use hardcoded public key */
+--#define PLATFORM_OVERRIDE_ATTEST_PK
+-+//#define PLATFORM_OVERRIDE_ATTEST_PK
+- 
+- /*
+-  * Include of PSA defined Header files
+--- 
+-2.17.1
+-
+diff --git a/external/psa_arch_tests/psa_arch_tests.cmake b/external/psa_arch_tests/psa_arch_tests.cmake
+index a8b77a1fc05e..1995df3e0b49 100644
+--- a/external/psa_arch_tests/psa_arch_tests.cmake
++++ b/external/psa_arch_tests/psa_arch_tests.cmake
+@@ -15,10 +15,6 @@ set(GIT_OPTIONS
+ 	GIT_REPOSITORY ${PSA_ARCH_TESTS_URL}
+ 	GIT_TAG ${PSA_ARCH_TESTS_REFSPEC}
+ 	GIT_SHALLOW FALSE
+-	PATCH_COMMAND git stash
+-		COMMAND git tag -f ts-before-am
+-		COMMAND git am ${CMAKE_CURRENT_LIST_DIR}/0001-Disable-using-hard-coded-attestation-key.patch
+-		COMMAND git reset ts-before-am
+ )
+ 
+ # Ensure list of defines is separated correctly
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
index 988fbbec..5803cc17 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
@@ -1,7 +1,7 @@
-From 94770f9660154bb1157e19c11fb706889a81ae73 Mon Sep 17 00:00:00 2001
+From 4240977f7c38950f5edb316bb08ae05cb7b99875 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Thu, 9 Dec 2021 14:11:06 +0000
-Subject: [PATCH 11/19] Setup its backend as openamp rpc using secure storage
+Subject: [PATCH 11/20] Setup its backend as openamp rpc using secure storage
  ipc implementation.
 
 Upstream-Status: Pending
@@ -159,5 +159,5 @@ index 4b8cceccbe4d..1110ac46bf8b 100644
 +        return secure_storage_provider_init(&its_provider, backend);
  }
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-add-psa-ipc-crypto-backend.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-add-psa-ipc-crypto-backend.patch
index fdc39b0d..67ea7b8c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-add-psa-ipc-crypto-backend.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-add-psa-ipc-crypto-backend.patch
@@ -1,7 +1,7 @@
-From 896b5009bb07c4b53541290e1712856063411107 Mon Sep 17 00:00:00 2001
+From 0b5d96b1a9f927dc141047600edf2249af7022c5 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Thu, 9 Dec 2021 14:17:39 +0000
-Subject: [PATCH 12/19] add psa ipc crypto backend
+Subject: [PATCH 12/20] add psa ipc crypto backend
 
 Add psa ipc crypto backend and attach it to se proxy
 deployment.
@@ -36,9 +36,8 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  .../crypto/include/psa/crypto_client_struct.h |   8 +-
  .../service/crypto/include/psa/crypto_sizes.h |   2 +-
  .../se-proxy/common/service_proxy_factory.c   |  15 +-
- deployments/se-proxy/se-proxy.cmake           |   2 +-
  .../providers/arm/corstone1000/platform.cmake |   2 +
- 29 files changed, 2293 insertions(+), 11 deletions(-)
+ 28 files changed, 2292 insertions(+), 10 deletions(-)
  create mode 100644 components/service/crypto/backend/psa_ipc/component.cmake
  create mode 100644 components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c
  create mode 100644 components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
@@ -2556,19 +2555,6 @@ index 1110ac46bf8b..7edeef8b434a 100644
  
  	return crypto_iface;
  }
-diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/se-proxy.cmake
-index 38d26821d44d..f647190d9559 100644
---- a/deployments/se-proxy/se-proxy.cmake
-+++ b/deployments/se-proxy/se-proxy.cmake
-@@ -57,7 +57,7 @@ add_components(TARGET "se-proxy"
- 		"components/rpc/dummy"
- 		"components/rpc/common/caller"
- 		"components/service/attestation/key_mngr/stub"
--		"components/service/crypto/backend/stub"
-+		"components/service/crypto/backend/psa_ipc"
- 		"components/service/crypto/client/psa"
- 		"components/service/secure_storage/backend/mock_store"
- )
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platform/providers/arm/corstone1000/platform.cmake
 index bb778bb9719b..51e5faa3e4d8 100644
 --- a/platform/providers/arm/corstone1000/platform.cmake
@@ -2580,5 +2566,5 @@ index bb778bb9719b..51e5faa3e4d8 100644
 +
 +add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Add-stub-capsule-update-service-components.patch
index 1a6e8f50..0040e127 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Add-stub-capsule-update-service-components.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Add-stub-capsule-update-service-components.patch
@@ -1,7 +1,7 @@
-From 6b8ebdeb8caa6326ae2a4befaf4410a7a54d4e02 Mon Sep 17 00:00:00 2001
+From 050be6fdfee656b0556766cc1db30f4c0ea87c79 Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Tue, 12 Oct 2021 15:45:41 +0100
-Subject: [PATCH 13/19] Add stub capsule update service components
+Subject: [PATCH 13/20] Add stub capsule update service components
 
 To facilitate development of a capsule update service provider,
 stub components are added to provide a starting point for an
@@ -338,7 +338,7 @@ index 298d407a2371..02aa7fe2550d 100644
  #ifdef __cplusplus
  }
 diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/se-proxy.cmake
-index f647190d9559..e35b0d0f610d 100644
+index 3dbbc36c968d..f0db2d43f443 100644
 --- a/deployments/se-proxy/se-proxy.cmake
 +++ b/deployments/se-proxy/se-proxy.cmake
 @@ -51,6 +51,7 @@ add_components(TARGET "se-proxy"
@@ -432,5 +432,5 @@ index 000000000000..285d924186be
 +
 +#endif /* CAPSULE_UPDATE_PARAMETERS_H */
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Configure-storage-size.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Configure-storage-size.patch
index 52c793cc..22b1da69 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Configure-storage-size.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Configure-storage-size.patch
@@ -1,7 +1,7 @@
-From a71b26f867f1b4a08285d6da82528de6a54321f2 Mon Sep 17 00:00:00 2001
+From 229ec29154a4404426ad3083af68ca111a214e13 Mon Sep 17 00:00:00 2001
 From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
 Date: Thu, 16 Dec 2021 21:31:40 +0000
-Subject: [PATCH 14/19] Configure storage size
+Subject: [PATCH 14/20] Configure storage size
 
 Upstream-Status: Pending
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
@@ -10,7 +10,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index 715ccc3cb546..aeb8a22062b7 100644
+index 611e2e225c6b..6c3b9ed81c25 100644
 --- a/components/service/smm_variable/backend/uefi_variable_store.c
 +++ b/components/service/smm_variable/backend/uefi_variable_store.c
 @@ -88,6 +88,7 @@ static efi_status_t check_name_terminator(
@@ -38,5 +38,5 @@ index 715ccc3cb546..aeb8a22062b7 100644
  
  	context->owner_id = owner_id;
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
index a8f5559d..426f2ca5 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
@@ -1,7 +1,7 @@
-From 3cc9c417f12f005244530d8d706a6b7f3be35627 Mon Sep 17 00:00:00 2001
+From cf83184500703f9b4f2ac04be59cc7d624d8fd66 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Sun, 13 Feb 2022 09:01:10 +0000
-Subject: [PATCH 15/19] Fix: Crypto interface structure aligned with tf-m
+Subject: [PATCH 15/20] Fix: Crypto interface structure aligned with tf-m
  change.
 
 NO NEED TO RAISE PR: The PR for this FIX  is raied by Emek.
@@ -27,5 +27,5 @@ index c13c20e84131..ec25eaf868c7 100644
  							    *   AEAD until the API is
  							    *   restructured
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Integrate-remaining-psa-ipc-client-APIs.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Integrate-remaining-psa-ipc-client-APIs.patch
index a0911970..a59d1400 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Integrate-remaining-psa-ipc-client-APIs.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Integrate-remaining-psa-ipc-client-APIs.patch
@@ -1,7 +1,7 @@
-From c54afe45c1be25c4819b0f762cf03a24e6343ce5 Mon Sep 17 00:00:00 2001
+From 551d8722769fa2f2d2ac74adcb289333a9b03598 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Sun, 13 Feb 2022 09:49:51 +0000
-Subject: [PATCH 16/19] Integrate remaining psa-ipc client APIs.
+Subject: [PATCH 16/20] Integrate remaining psa-ipc client APIs.
 
 Upstream-Status: Pending
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
@@ -490,5 +490,5 @@ index e16f6e5450af..cc9279ee79f2 100644
  }
  #endif
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
index e7c1dc33..4adcd90a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
@@ -1,7 +1,7 @@
-From b1ff44c650ae82f364a2f74059eeb280996dc4f8 Mon Sep 17 00:00:00 2001
+From 5a5e162e17c9decb04b3b2905a0fb604e8f06e91 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Mon, 14 Feb 2022 17:52:00 +0000
-Subject: [PATCH 17/19] Fix : update psa_set_key_usage_flags definition to the
+Subject: [PATCH 17/20] Fix : update psa_set_key_usage_flags definition to the
  latest from the tf-m
 
 Upstream-Status: Pending
@@ -36,5 +36,5 @@ index 1bc55e375eea..b4a7ed4b39d3 100644
  }
  
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
index 9ab1157e..c1598a9e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
@@ -1,11 +1,10 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From a1da63a8c4d55d52321608a72129af49e0a498b2 Mon Sep 17 00:00:00 2001
+From 1a4d46fdc0b5745b9cfb0789e4b778111bd6dbbb Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Mon, 14 Feb 2022 08:22:25 +0000
-Subject: [PATCH 18/19] Fixes in AEAD for psa-arch test 54 and 58.
+Subject: [PATCH 18/20] Fixes in AEAD for psa-arch test 54 and 58.
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
@@ -118,5 +117,5 @@ index 0be266b52403..435fd3b523ce 100644
  
  /* Variable length input parameter tags */
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-plat-corstone1000-change-default-smm-values.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-plat-corstone1000-change-default-smm-values.patch
index 984e2977..02c89d89 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-plat-corstone1000-change-default-smm-values.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-plat-corstone1000-change-default-smm-values.patch
@@ -1,7 +1,7 @@
-From 07ad7e1f7ba06045bf331d5b73a6adf38a098fb7 Mon Sep 17 00:00:00 2001
+From c519bae79629bfe551d79cfeb4e7d8a059545145 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Tue, 11 Oct 2022 10:46:10 +0100
-Subject: [PATCH 19/19] plat: corstone1000: change default smm values
+Subject: [PATCH 19/20] plat: corstone1000: change default smm values
 
 Smm gateway uses SE proxy to route the calls for any NV
 storage so set the NV_STORE_SN.
@@ -33,5 +33,5 @@ index 51e5faa3e4d8..04b629a81906 100644
 +	SMM_GATEWAY_MAX_UEFI_VARIABLES=100
 +)
 -- 
-2.38.0
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0020-FMP-Support-in-Corstone1000.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0020-FMP-Support-in-Corstone1000.patch
index 79429c77..ce40df0f 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0020-FMP-Support-in-Corstone1000.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0020-FMP-Support-in-Corstone1000.patch
@@ -1,7 +1,7 @@
-From 6430bf31a25a1ef67e9141f85dbd070feb0d1a1e Mon Sep 17 00:00:00 2001
+From 70cf374fb55f2d62ecbe28049253df33b42b6749 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Fri, 8 Jul 2022 09:48:06 +0100
-Subject: [PATCH] FMP Support in Corstone1000.
+Subject: [PATCH 20/20] FMP Support in Corstone1000.
 
 The FMP support is used by u-boot to pupolate ESRT information
 for the kernel.
@@ -11,6 +11,7 @@ The solution is platform specific and needs to be revisted.
 Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
 
 Upstream-Status: Inappropriate [The solution is platform specific and needs to be revisted]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  .../provider/capsule_update_provider.c        |   5 +
  .../capsule_update/provider/component.cmake   |   1 +
@@ -21,7 +22,7 @@ Upstream-Status: Inappropriate [The solution is platform specific and needs to b
  create mode 100644 components/service/capsule_update/provider/corstone1000_fmp_service.h
 
 diff --git a/components/service/capsule_update/provider/capsule_update_provider.c b/components/service/capsule_update/provider/capsule_update_provider.c
-index 9bbd7abc..871d6bcf 100644
+index e133753f8560..991a2235cd73 100644
 --- a/components/service/capsule_update/provider/capsule_update_provider.c
 +++ b/components/service/capsule_update/provider/capsule_update_provider.c
 @@ -11,6 +11,7 @@
@@ -58,7 +59,7 @@ index 9bbd7abc..871d6bcf 100644
  		default:
  			EMSG("%s unsupported opcode", __func__);
 diff --git a/components/service/capsule_update/provider/component.cmake b/components/service/capsule_update/provider/component.cmake
-index 1d412eb2..6b060149 100644
+index 1d412eb234d9..6b0601494938 100644
 --- a/components/service/capsule_update/provider/component.cmake
 +++ b/components/service/capsule_update/provider/component.cmake
 @@ -10,4 +10,5 @@ endif()
@@ -69,7 +70,7 @@ index 1d412eb2..6b060149 100644
  	)
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp_service.c b/components/service/capsule_update/provider/corstone1000_fmp_service.c
 new file mode 100644
-index 00000000..6a7a47a7
+index 000000000000..6a7a47a7ed99
 --- /dev/null
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_service.c
 @@ -0,0 +1,307 @@
@@ -382,7 +383,7 @@ index 00000000..6a7a47a7
 +}
 diff --git a/components/service/capsule_update/provider/corstone1000_fmp_service.h b/components/service/capsule_update/provider/corstone1000_fmp_service.h
 new file mode 100644
-index 00000000..95fba2a0
+index 000000000000..95fba2a04d5c
 --- /dev/null
 +++ b/components/service/capsule_update/provider/corstone1000_fmp_service.h
 @@ -0,0 +1,26 @@
@@ -413,5 +414,5 @@ index 00000000..95fba2a0
 +
 +#endif /* CORSTONE1000_FMP_SERVICE_H */
 -- 
-2.17.1
+2.38.1
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-psa-crypto-api-test/0001-corstone1000-port-crypto-config.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/psa-apitest/0001-corstone1000-port-crypto-config.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-psa-crypto-api-test/0001-corstone1000-port-crypto-config.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/psa-apitest/0001-corstone1000-port-crypto-config.patch
diff --git a/meta-arm-bsp/recipes-security/trusted-services/libts_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/libts_git.bbappend
new file mode 100644
index 00000000..a885d387
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/libts_git.bbappend
@@ -0,0 +1,10 @@
+MACHINE_TS_REQUIRE ?= ""
+MACHINE_TS_REQUIRE:corstone1000 = "ts-corstone1000.inc"
+
+require ${MACHINE_TS_REQUIRE}
+
+
+EXTRA_OECMAKE:append:corstone1000 = "-DMM_COMM_BUFFER_ADDRESS=0x02000000 \
+                                    -DMM_COMM_BUFFER_PAGE_COUNT=1 \
+                                    "
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 03f7dff2..0d856bc5 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -1,29 +1,24 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000:"
 
-SRC_URI:append = " \
-    file://0001-Add-openamp-to-SE-proxy-deployment.patch \
-    file://0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch \
-    file://0003-Add-openamp-rpc-caller.patch \
-    file://0004-add-psa-client-definitions-for-ff-m.patch \
-    file://0005-Add-common-service-component-to-ipc-support.patch \
-    file://0006-Add-secure-storage-ipc-backend.patch \
-    file://0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch \
-    file://0008-Run-psa-arch-test.patch \
-    file://0009-Use-address-instead-of-pointers.patch \
-    file://0010-Add-psa-ipc-attestation-to-se-proxy.patch \
-    file://0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch \
-    file://0012-add-psa-ipc-crypto-backend.patch \
-    file://0013-Add-stub-capsule-update-service-components.patch \
-    file://0014-Configure-storage-size.patch \
-    file://0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch \
-    file://0016-Integrate-remaining-psa-ipc-client-APIs.patch \
-    file://0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch \
-    file://0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch \
-    file://0019-plat-corstone1000-change-default-smm-values.patch \
-    file://0020-FMP-Support-in-Corstone1000.patch \
-    "
-
-
-EXTRA_OECMAKE:append = "-DMM_COMM_BUFFER_ADDRESS="0x00000000 0x02000000" \
-    -DMM_COMM_BUFFER_PAGE_COUNT="1" \
+SRC_URI:append:corstone1000  = " \
+    file://0001-Add-openamp-to-SE-proxy-deployment.patch;patchdir=../trusted-services \
+    file://0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch;patchdir=../trusted-services \
+    file://0003-Add-openamp-rpc-caller.patch;patchdir=../trusted-services \
+    file://0004-add-psa-client-definitions-for-ff-m.patch;patchdir=../trusted-services \
+    file://0005-Add-common-service-component-to-ipc-support.patch;patchdir=../trusted-services \
+    file://0006-Add-secure-storage-ipc-backend.patch;patchdir=../trusted-services \
+    file://0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch;patchdir=../trusted-services \
+    file://0008-Run-psa-arch-test.patch;patchdir=../trusted-services \
+    file://0009-Use-address-instead-of-pointers.patch;patchdir=../trusted-services \
+    file://0010-Add-psa-ipc-attestation-to-se-proxy.patch;patchdir=../trusted-services \
+    file://0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch;patchdir=../trusted-services;patchdir=../trusted-services \
+    file://0012-add-psa-ipc-crypto-backend.patch;patchdir=../trusted-services \
+    file://0013-Add-stub-capsule-update-service-components.patch;patchdir=../trusted-services \
+    file://0014-Configure-storage-size.patch;patchdir=../trusted-services \
+    file://0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch;patchdir=../trusted-services;patchdir=../trusted-services \
+    file://0016-Integrate-remaining-psa-ipc-client-APIs.patch;patchdir=../trusted-services \
+    file://0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch;patchdir=../trusted-services;patchdir=../trusted-services \
+    file://0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch;patchdir=../trusted-services \
+    file://0019-plat-corstone1000-change-default-smm-values.patch;patchdir=../trusted-services \
+    file://0020-FMP-Support-in-Corstone1000.patch;patchdir=../trusted-services \
     "
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
new file mode 100644
index 00000000..50ff960d
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000/psa-apitest:"
+
+include ts-corstone1000.inc
+
+SRC_URI:append:corstone1000  = " \
+    file://0001-corstone1000-port-crypto-config.patch;patchdir=../psatest \
+    "
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend
index 6595c92a..ea49213e 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bbappend
@@ -1,7 +1 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000:"
-FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000/${PN}:"
-
-SRC_URI:append:corstone1000 = " \
-            file://0001-corstone1000-port-crypto-config.patch;patchdir=../psatest \
-            file://0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch;patchdir=../trusted-services \
-           "
+require ts-psa-api-test.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_git.bbappend
new file mode 100644
index 00000000..ea49213e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-iat-api-test_git.bbappend
@@ -0,0 +1 @@
+require ts-psa-api-test.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_git.bbappend
new file mode 100644
index 00000000..ea49213e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-its-api-test_git.bbappend
@@ -0,0 +1 @@
+require ts-psa-api-test.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_git.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_git.bbappend
new file mode 100644
index 00000000..ea49213e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-ps-api-test_git.bbappend
@@ -0,0 +1 @@
+require ts-psa-api-test.inc
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend
index 8a37a281..f39d2395 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-se-proxy_%.bbappend
@@ -2,3 +2,8 @@ MACHINE_TS_REQUIRE ?= ""
 MACHINE_TS_REQUIRE:corstone1000 = "ts-corstone1000.inc"
 
 require ${MACHINE_TS_REQUIRE}
+
+EXTRA_OECMAKE:append:corstone1000 = " -DMM_COMM_BUFFER_ADDRESS="0x00000000 0x02000000" \
+    -DMM_COMM_BUFFER_PAGE_COUNT="1" \
+    "
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
index 8a37a281..f39d2395 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
@@ -2,3 +2,8 @@ MACHINE_TS_REQUIRE ?= ""
 MACHINE_TS_REQUIRE:corstone1000 = "ts-corstone1000.inc"
 
 require ${MACHINE_TS_REQUIRE}
+
+EXTRA_OECMAKE:append:corstone1000 = " -DMM_COMM_BUFFER_ADDRESS="0x00000000 0x02000000" \
+    -DMM_COMM_BUFFER_PAGE_COUNT="1" \
+    "
+
-- 
2.17.1


